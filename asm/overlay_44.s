	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov44_02229EE0
ov44_02229EE0: ; 0x02229EE0
	push {r3, lr}
	mov r1, #0x16
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bl SavArray_Flags_get
	mov r1, #2
	mov r2, #0x1b
	bl ScriptState_FlypointFlagAction
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov44_02229EE0

	thumb_func_start ov44_02229EF8
ov44_02229EF8: ; 0x02229EF8
	mov r0, #0
	bx lr
	thumb_func_end ov44_02229EF8

	thumb_func_start ov44_02229EFC
ov44_02229EFC: ; 0x02229EFC
	mov r0, #1
	bx lr
	thumb_func_end ov44_02229EFC

	thumb_func_start ov44_02229F00
ov44_02229F00: ; 0x02229F00
	push {r3, r4, r5, lr}
	ldrb r4, [r1, #0x1b]
	add r5, r0, #0
	add r1, r4, #0
	sub r1, #0x14
	cmp r1, #1
	bhi _02229F18
	bl ov44_02229EE0
	cmp r0, #0
	bne _02229F18
	mov r4, #0x1d
_02229F18:
	add r0, r4, #0
	sub r0, #0x16
	cmp r0, #5
	bhi _02229F2C
	add r0, r5, #0
	bl ov44_02229EFC
	cmp r0, #0
	bne _02229F2C
	mov r4, #0x1d
_02229F2C:
	add r0, r4, #0
	sub r0, #0x12
	cmp r0, #1
	bhi _02229F40
	add r0, r5, #0
	bl ov44_02229EF8
	cmp r0, #0
	bne _02229F40
	mov r4, #0x1d
_02229F40:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02229F00

	thumb_func_start ov44_02229F44
ov44_02229F44: ; 0x02229F44
	sub r0, #0x12
	cmp r0, #9
	bhi _02229F6E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02229F56: ; jump table
	.short _02229F6A - _02229F56 - 2 ; case 0
	.short _02229F6A - _02229F56 - 2 ; case 1
	.short _02229F6E - _02229F56 - 2 ; case 2
	.short _02229F6E - _02229F56 - 2 ; case 3
	.short _02229F6A - _02229F56 - 2 ; case 4
	.short _02229F6A - _02229F56 - 2 ; case 5
	.short _02229F6A - _02229F56 - 2 ; case 6
	.short _02229F6A - _02229F56 - 2 ; case 7
	.short _02229F6A - _02229F56 - 2 ; case 8
	.short _02229F6A - _02229F56 - 2 ; case 9
_02229F6A:
	mov r0, #1
	bx lr
_02229F6E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov44_02229F44

	thumb_func_start ov44_02229F74
ov44_02229F74: ; 0x02229F74
	push {r3, lr}
	sub r0, #0x12
	cmp r0, #9
	bhi _02229FAC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02229F88: ; jump table
	.short _02229F9C - _02229F88 - 2 ; case 0
	.short _02229F9C - _02229F88 - 2 ; case 1
	.short _02229FAC - _02229F88 - 2 ; case 2
	.short _02229FAC - _02229F88 - 2 ; case 3
	.short _02229FA0 - _02229F88 - 2 ; case 4
	.short _02229FA0 - _02229F88 - 2 ; case 5
	.short _02229FA8 - _02229F88 - 2 ; case 6
	.short _02229FA8 - _02229F88 - 2 ; case 7
	.short _02229FA4 - _02229F88 - 2 ; case 8
	.short _02229FA4 - _02229F88 - 2 ; case 9
_02229F9C:
	mov r0, #0xb
	pop {r3, pc}
_02229FA0:
	mov r0, #0xd
	pop {r3, pc}
_02229FA4:
	mov r0, #0xf
	pop {r3, pc}
_02229FA8:
	mov r0, #0xe
	pop {r3, pc}
_02229FAC:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov44_02229F74

	thumb_func_start ov44_02229FB4
ov44_02229FB4: ; 0x02229FB4
	sub r0, #9
	cmp r0, #5
	bhi _02229FD6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02229FC6: ; jump table
	.short _02229FD2 - _02229FC6 - 2 ; case 0
	.short _02229FD2 - _02229FC6 - 2 ; case 1
	.short _02229FD2 - _02229FC6 - 2 ; case 2
	.short _02229FD2 - _02229FC6 - 2 ; case 3
	.short _02229FD2 - _02229FC6 - 2 ; case 4
	.short _02229FD2 - _02229FC6 - 2 ; case 5
_02229FD2:
	mov r0, #1
	bx lr
_02229FD6:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov44_02229FB4

	thumb_func_start ov44_02229FDC
ov44_02229FDC: ; 0x02229FDC
	push {r4, lr}
	add r4, r0, #0
	bl ov44_02229FB4
	cmp r0, #0
	beq _02229FEC
	mov r0, #1
	pop {r4, pc}
_02229FEC:
	sub r4, #0xf
	cmp r4, #0xc
	bhi _0222A01C
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02229FFE: ; jump table
	.short _0222A018 - _02229FFE - 2 ; case 0
	.short _0222A01C - _02229FFE - 2 ; case 1
	.short _0222A01C - _02229FFE - 2 ; case 2
	.short _0222A01C - _02229FFE - 2 ; case 3
	.short _0222A018 - _02229FFE - 2 ; case 4
	.short _0222A01C - _02229FFE - 2 ; case 5
	.short _0222A018 - _02229FFE - 2 ; case 6
	.short _0222A01C - _02229FFE - 2 ; case 7
	.short _0222A018 - _02229FFE - 2 ; case 8
	.short _0222A01C - _02229FFE - 2 ; case 9
	.short _0222A018 - _02229FFE - 2 ; case 10
	.short _0222A01C - _02229FFE - 2 ; case 11
	.short _0222A018 - _02229FFE - 2 ; case 12
_0222A018:
	mov r0, #1
	pop {r4, pc}
_0222A01C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov44_02229FDC

	thumb_func_start ov44_0222A020
ov44_0222A020: ; 0x0222A020
	cmp r0, #7
	bhi _0222A044
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222A030: ; jump table
	.short _0222A044 - _0222A030 - 2 ; case 0
	.short _0222A044 - _0222A030 - 2 ; case 1
	.short _0222A040 - _0222A030 - 2 ; case 2
	.short _0222A040 - _0222A030 - 2 ; case 3
	.short _0222A040 - _0222A030 - 2 ; case 4
	.short _0222A040 - _0222A030 - 2 ; case 5
	.short _0222A040 - _0222A030 - 2 ; case 6
	.short _0222A040 - _0222A030 - 2 ; case 7
_0222A040:
	mov r0, #1
	bx lr
_0222A044:
	mov r0, #0
	bx lr
	thumb_func_end ov44_0222A020

	thumb_func_start ov44_0222A048
ov44_0222A048: ; 0x0222A048
	push {r4, lr}
	add r4, r0, #0
	bl ov44_0222A020
	cmp r0, #0
	beq _0222A058
	mov r0, #1
	pop {r4, pc}
_0222A058:
	cmp r4, #8
	bgt _0222A064
	bge _0222A088
	cmp r4, #1
	beq _0222A088
	b _0222A08C
_0222A064:
	sub r4, #0x12
	cmp r4, #8
	bhi _0222A08C
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222A076: ; jump table
	.short _0222A088 - _0222A076 - 2 ; case 0
	.short _0222A08C - _0222A076 - 2 ; case 1
	.short _0222A088 - _0222A076 - 2 ; case 2
	.short _0222A08C - _0222A076 - 2 ; case 3
	.short _0222A088 - _0222A076 - 2 ; case 4
	.short _0222A08C - _0222A076 - 2 ; case 5
	.short _0222A088 - _0222A076 - 2 ; case 6
	.short _0222A08C - _0222A076 - 2 ; case 7
	.short _0222A088 - _0222A076 - 2 ; case 8
_0222A088:
	mov r0, #1
	pop {r4, pc}
_0222A08C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov44_0222A048

	thumb_func_start ov44_0222A090
ov44_0222A090: ; 0x0222A090
	sub r0, #0xc
	cmp r0, #3
	bhi _0222A0AE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222A0A2: ; jump table
	.short _0222A0AA - _0222A0A2 - 2 ; case 0
	.short _0222A0AA - _0222A0A2 - 2 ; case 1
	.short _0222A0AA - _0222A0A2 - 2 ; case 2
	.short _0222A0AA - _0222A0A2 - 2 ; case 3
_0222A0AA:
	mov r0, #1
	bx lr
_0222A0AE:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov44_0222A090

	thumb_func_start ov44_0222A0B4
ov44_0222A0B4: ; 0x0222A0B4
	mov r1, #0x1d
	cmp r0, #0x1b
	bhi _0222A164
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222A0C6: ; jump table
	.short _0222A164 - _0222A0C6 - 2 ; case 0
	.short _0222A162 - _0222A0C6 - 2 ; case 1
	.short _0222A14A - _0222A0C6 - 2 ; case 2
	.short _0222A14E - _0222A0C6 - 2 ; case 3
	.short _0222A152 - _0222A0C6 - 2 ; case 4
	.short _0222A156 - _0222A0C6 - 2 ; case 5
	.short _0222A15A - _0222A0C6 - 2 ; case 6
	.short _0222A15E - _0222A0C6 - 2 ; case 7
	.short _0222A146 - _0222A0C6 - 2 ; case 8
	.short _0222A116 - _0222A0C6 - 2 ; case 9
	.short _0222A11A - _0222A0C6 - 2 ; case 10
	.short _0222A11E - _0222A0C6 - 2 ; case 11
	.short _0222A122 - _0222A0C6 - 2 ; case 12
	.short _0222A126 - _0222A0C6 - 2 ; case 13
	.short _0222A12A - _0222A0C6 - 2 ; case 14
	.short _0222A112 - _0222A0C6 - 2 ; case 15
	.short _0222A12E - _0222A0C6 - 2 ; case 16
	.short _0222A164 - _0222A0C6 - 2 ; case 17
	.short _0222A132 - _0222A0C6 - 2 ; case 18
	.short _0222A0FE - _0222A0C6 - 2 ; case 19
	.short _0222A136 - _0222A0C6 - 2 ; case 20
	.short _0222A102 - _0222A0C6 - 2 ; case 21
	.short _0222A13A - _0222A0C6 - 2 ; case 22
	.short _0222A106 - _0222A0C6 - 2 ; case 23
	.short _0222A142 - _0222A0C6 - 2 ; case 24
	.short _0222A10E - _0222A0C6 - 2 ; case 25
	.short _0222A13E - _0222A0C6 - 2 ; case 26
	.short _0222A10A - _0222A0C6 - 2 ; case 27
_0222A0FE:
	mov r1, #0x12
	b _0222A164
_0222A102:
	mov r1, #0x14
	b _0222A164
_0222A106:
	mov r1, #0x16
	b _0222A164
_0222A10A:
	mov r1, #0x1a
	b _0222A164
_0222A10E:
	mov r1, #0x18
	b _0222A164
_0222A112:
	mov r1, #8
	b _0222A164
_0222A116:
	mov r1, #2
	b _0222A164
_0222A11A:
	mov r1, #3
	b _0222A164
_0222A11E:
	mov r1, #4
	b _0222A164
_0222A122:
	mov r1, #5
	b _0222A164
_0222A126:
	mov r1, #6
	b _0222A164
_0222A12A:
	mov r1, #7
	b _0222A164
_0222A12E:
	mov r1, #1
	b _0222A164
_0222A132:
	mov r1, #0x13
	b _0222A164
_0222A136:
	mov r1, #0x15
	b _0222A164
_0222A13A:
	mov r1, #0x17
	b _0222A164
_0222A13E:
	mov r1, #0x1b
	b _0222A164
_0222A142:
	mov r1, #0x19
	b _0222A164
_0222A146:
	mov r1, #0xf
	b _0222A164
_0222A14A:
	mov r1, #9
	b _0222A164
_0222A14E:
	mov r1, #0xa
	b _0222A164
_0222A152:
	mov r1, #0xb
	b _0222A164
_0222A156:
	mov r1, #0xc
	b _0222A164
_0222A15A:
	mov r1, #0xd
	b _0222A164
_0222A15E:
	mov r1, #0xe
	b _0222A164
_0222A162:
	mov r1, #0x10
_0222A164:
	add r0, r1, #0
	bx lr
	thumb_func_end ov44_0222A0B4

	thumb_func_start ov44_0222A168
ov44_0222A168: ; 0x0222A168
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x16
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bl SavArray_PlayerParty_get
	str r0, [sp]
	bl GetPartyCount
	mov r5, #0
	add r7, r0, #0
	add r4, r5, #0
	cmp r7, #0
	ble _0222A1B0
_0222A184:
	ldr r0, [sp]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0xa3
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0222A1AA
	add r0, r6, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0222A1AA
	add r5, r5, #1
_0222A1AA:
	add r4, r4, #1
	cmp r4, r7
	blt _0222A184
_0222A1B0:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_0222A168

	thumb_func_start ov44_0222A1B4
ov44_0222A1B4: ; 0x0222A1B4
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	sub r1, #0x12
	cmp r1, #1
	bhi _0222A1C6
	bl sub_02039AF8
	pop {r4, pc}
_0222A1C6:
	bl ov44_02229F44
	cmp r0, #0
	beq _0222A1D4
	bl sub_02039B18
	pop {r4, pc}
_0222A1D4:
	cmp r4, #0x10
	bne _0222A1DE
	bl sub_02039B58
	pop {r4, pc}
_0222A1DE:
	sub r4, #0x14
	cmp r4, #1
	bhi _0222A1F0
	mov r0, #0
	bl sub_020378E4
	bl sub_02039E9C
	pop {r4, pc}
_0222A1F0:
	mov r0, #1
	bl sub_020378E4
	bl sub_02039B7C
	pop {r4, pc}
	thumb_func_end ov44_0222A1B4

	thumb_func_start ov44_0222A1FC
ov44_0222A1FC: ; 0x0222A1FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r0, [sp, #4]
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0222A3E8 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _0222A3EC ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	mov r0, #0x58
	mov r1, #0x35
	bl NARC_ctor
	str r0, [sp, #0x20]
	mov r0, #0x35
	bl BgConfig_Alloc
	mov r2, #0x57
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	str r0, [r1, r2]
	mov r0, #0x35
	bl ScrStrBufs_new
	mov r2, #0x59
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	str r0, [r1, r2]
	ldr r2, _0222A3F0 ; =0x0000030A
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x35
	bl NewMsgDataFromNarc
	mov r2, #0x5a
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	str r0, [r1, r2]
	mov r2, #0x32
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #4
	mov r3, #0x35
	bl NewMsgDataFromNarc
	mov r2, #0x5b
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	str r0, [r1, r2]
	bl ov44_0222A830
	mov r1, #0x57
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl ov44_0222A850
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x20]
	bl ov44_0222AEC0
	mov r2, #0x33
	ldr r1, _0222A3F4 ; =0x00000D68
	ldr r0, [sp, #4]
	lsl r2, r2, #4
	add r0, r0, r1
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, [sp, #0x20]
	mov r1, #5
	add r2, sp, #0x2c
	mov r3, #0x35
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	add r4, r0, #0
	ldr r0, [sp, #0x2c]
	mov r2, #0xd7
	ldr r1, [sp, #4]
	lsl r2, r2, #4
	add r1, r1, r2
	ldr r0, [r0, #0xc]
	mov r2, #0x80
	bl MIi_CpuCopy16
	ldr r0, [sp, #0x2c]
	mov r2, #0xdf
	ldr r1, [sp, #4]
	lsl r2, r2, #4
	add r1, r1, r2
	ldr r0, [r0, #0xc]
	mov r2, #0x80
	bl MIi_CpuCopy16
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	mov r1, #0xdf
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	add r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	sub r1, #0x80
	add r0, r0, r1
	str r0, [sp, #8]
_0222A2FA:
	mov r0, #0
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	lsl r1, r0, #5
	ldr r0, [sp, #4]
	add r0, r0, r1
	str r0, [sp, #0x24]
_0222A30C:
	ldr r0, [sp, #0x18]
	cmp r0, #0x15
	blt _0222A316
	bl GF_AssertFail
_0222A316:
	ldr r0, [sp, #0x24]
	mov r7, #1
	add r4, r0, #2
	ldr r0, [sp, #0xc]
	add r6, r0, #2
	ldr r0, [sp, #8]
	add r5, r0, #2
	ldr r0, [sp, #0x14]
	asr r0, r0, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x28]
_0222A32E:
	mov r0, #0xd7
	lsl r0, r0, #4
	ldrh r0, [r4, r0]
	ldr r3, [sp, #0x28]
	add r1, r6, #0
	str r0, [sp]
	add r0, r5, #0
	mov r2, #1
	bl sub_02003DE8
	add r7, r7, #1
	add r4, r4, #2
	add r6, r6, #2
	add r5, r5, #2
	cmp r7, #0x10
	blt _0222A32E
	ldr r0, [sp, #0xc]
	add r0, #0x20
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	cmp r0, #1
	beq _0222A37A
	mov r0, #3
	ldr r1, [sp, #0x14]
	lsl r0, r0, #8
	add r1, r1, r0
	mov r0, #1
	lsl r0, r0, #0xc
	str r1, [sp, #0x14]
	cmp r1, r0
	blt _0222A30C
	str r0, [sp, #0x14]
	mov r0, #1
	str r0, [sp, #0x10]
	b _0222A30C
_0222A37A:
	ldr r0, [sp, #8]
	add r0, #0x20
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #3
	blt _0222A2FA
	mov r1, #0xdf
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	add r0, r0, r1
	mov r1, #0x2a
	lsl r1, r1, #4
	bl DC_FlushRange
	ldr r1, _0222A3F8 ; =0x00000D6C
	ldr r0, [sp, #4]
	mov r2, #1
	str r2, [r0, r1]
	ldr r2, _0222A3FC ; =0x00001094
	mov r3, #0
	str r3, [r0, r2]
	sub r2, r1, #4
	ldr r1, [sp, #4]
	ldr r0, _0222A400 ; =ov44_0222A40C
	add r1, r1, r2
	mov r2, #0x14
	bl sub_0200E33C
	ldr r2, _0222A3F4 ; =0x00000D68
	ldr r1, [sp, #4]
	str r0, [r1, r2]
	ldr r0, _0222A404 ; =ov44_0222A7F8
	bl Main_SetVBlankIntrCB
	bl ov44_0222AFE8
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x20]
	bl ov44_0222B030
	ldr r0, [sp, #4]
	bl ov44_0222B0A4
	ldr r0, _0222A408 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	ldr r0, [sp, #0x20]
	bl NARC_dtor
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A3E8: .word 0xFFFFE0FF
_0222A3EC: .word 0x04001000
_0222A3F0: .word 0x0000030A
_0222A3F4: .word 0x00000D68
_0222A3F8: .word 0x00000D6C
_0222A3FC: .word 0x00001094
_0222A400: .word ov44_0222A40C
_0222A404: .word ov44_0222A7F8
_0222A408: .word gSystem + 0x60
	thumb_func_end ov44_0222A1FC

	thumb_func_start ov44_0222A40C
ov44_0222A40C: ; 0x0222A40C
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222A4AA
	ldr r1, _0222A4AC ; =0x0000032B
	mov r0, #1
	ldrb r2, [r4, r1]
	eor r2, r0
	strb r2, [r4, r1]
	ldrb r2, [r4, r1]
	tst r0, r2
	bne _0222A4AA
	add r0, r1, #1
	ldr r0, [r4, r0]
	cmp r0, #1
	bhi _0222A442
	sub r0, r1, #3
	ldrsh r0, [r4, r0]
	add r2, r4, #0
	add r2, #0x88
	lsl r0, r0, #5
	add r0, r2, r0
	mov r1, #0
	mov r2, #0x20
	bl GX_LoadBGPltt
_0222A442:
	mov r0, #0xcb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222A450
	cmp r0, #2
	bne _0222A466
_0222A450:
	mov r0, #0xca
	lsl r0, r0, #2
	ldrsh r0, [r4, r0]
	add r1, r4, #0
	add r1, #0x88
	lsl r0, r0, #5
	add r0, r1, r0
	mov r1, #0
	mov r2, #0x20
	bl GXS_LoadBGPltt
_0222A466:
	ldr r0, _0222A4B0 ; =0x0000032A
	ldrsb r1, [r4, r0]
	cmp r1, #0
	bne _0222A48E
	sub r1, r0, #2
	ldrsh r1, [r4, r1]
	add r2, r1, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0x15
	blt _0222A4AA
	mov r2, #0x13
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r2, [r4, r0]
	mov r1, #1
	eor r1, r2
	strb r1, [r4, r0]
	pop {r4, pc}
_0222A48E:
	sub r1, r0, #2
	ldrsh r1, [r4, r1]
	sub r2, r1, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsh r1, [r4, r1]
	cmp r1, #0
	bge _0222A4AA
	mov r2, #1
	sub r1, r0, #2
	strh r2, [r4, r1]
	ldrsb r1, [r4, r0]
	eor r1, r2
	strb r1, [r4, r0]
_0222A4AA:
	pop {r4, pc}
	.balign 4, 0
_0222A4AC: .word 0x0000032B
_0222A4B0: .word 0x0000032A
	thumb_func_end ov44_0222A40C

	thumb_func_start ov44_0222A4B4
ov44_0222A4B4: ; 0x0222A4B4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r1, #0
	ldr r1, [r6]
	add r5, r0, #0
	cmp r1, #0
	beq _0222A4CA
	cmp r1, #1
	bne _0222A4C8
	b _0222A5F2
_0222A4C8:
	b _0222A600
_0222A4CA:
	bl OverlayManager_GetParentWork
	add r4, r0, #0
	bl sub_02039998
	cmp r0, #0
	beq _0222A510
	ldr r0, [r4, #4]
	cmp r0, #0xc
	bhi _0222A51A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222A4EA: ; jump table
	.short _0222A51A - _0222A4EA - 2 ; case 0
	.short _0222A504 - _0222A4EA - 2 ; case 1
	.short _0222A504 - _0222A4EA - 2 ; case 2
	.short _0222A504 - _0222A4EA - 2 ; case 3
	.short _0222A504 - _0222A4EA - 2 ; case 4
	.short _0222A504 - _0222A4EA - 2 ; case 5
	.short _0222A504 - _0222A4EA - 2 ; case 6
	.short _0222A504 - _0222A4EA - 2 ; case 7
	.short _0222A504 - _0222A4EA - 2 ; case 8
	.short _0222A504 - _0222A4EA - 2 ; case 9
	.short _0222A504 - _0222A4EA - 2 ; case 10
	.short _0222A51A - _0222A4EA - 2 ; case 11
	.short _0222A504 - _0222A4EA - 2 ; case 12
_0222A504:
	mov r1, #0x80
	mov r0, #3
	lsl r2, r1, #9
	bl CreateHeap
	b _0222A51A
_0222A510:
	mov r1, #0x80
	mov r0, #3
	lsl r2, r1, #9
	bl CreateHeap
_0222A51A:
	ldr r0, _0222A608 ; =FS_OVERLAY_ID(OVY_42)
	mov r1, #2
	bl HandleLoadOverlay
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _0222A536
	mov r2, #7
	mov r0, #3
	mov r1, #0x35
	lsl r2, r2, #0x10
	bl CreateHeap
	b _0222A542
_0222A536:
	mov r2, #0xa
	mov r0, #3
	mov r1, #0x35
	lsl r2, r2, #0x10
	bl CreateHeap
_0222A542:
	mov r1, #0x43
	add r0, r5, #0
	lsl r1, r1, #6
	mov r2, #0x35
	bl OverlayManager_CreateAndGetData
	mov r2, #0x43
	mov r1, #0
	lsl r2, r2, #6
	add r5, r0, #0
	bl MI_CpuFill8
	mov r0, #0x20
	mov r1, #0x35
	bl GF_CreateVramTransferManager
	mov r1, #6
	mov r0, #8
	lsl r1, r1, #6
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r2, [r4]
	sub r0, #0x20
	sub r1, #0x20
	str r2, [r5, r0]
	ldr r0, [r5, r1]
	bl sub_0202C6F4
	str r0, [r5]
	mov r1, #0xd5
	ldr r0, [r4, #4]
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	mov r2, #8
	sub r0, #8
	str r2, [r5, r0]
	sub r2, #9
	add r1, #0x1c
	str r2, [r5, r1]
	mov r0, #0xf
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0xf
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r0, r5, #0
	bl ov44_0222ADF8
	add r0, r5, #0
	bl ov44_0222A1FC
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x35
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	bl sub_02039998
	cmp r0, #0
	beq _0222A5D2
	bl sub_0203A880
	b _0222A5DC
_0222A5D2:
	bl LoadDwcOverlay
	mov r0, #0x35
	bl sub_02039FD8
_0222A5DC:
	mov r0, #4
	bl sub_02021148
	cmp r0, #1
	beq _0222A5EA
	bl GF_AssertFail
_0222A5EA:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0222A600
_0222A5F2:
	bl OverlayManager_GetData
	mov r0, #0
	str r0, [r6]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0222A600:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0222A608: .word FS_OVERLAY_ID(OVY_42)
	thumb_func_end ov44_0222A4B4

	thumb_func_start ov44_0222A60C
ov44_0222A60C: ; 0x0222A60C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r5]
	add r4, r0, #0
	cmp r1, #0
	beq _0222A626
	cmp r1, #1
	beq _0222A634
	cmp r1, #2
	beq _0222A64E
	b _0222A65A
_0222A626:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0222A65A
	mov r0, #1
	str r0, [r5]
	b _0222A65A
_0222A634:
	mov r2, #0xd2
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	ldr r3, _0222A684 ; =ov44_0223676C
	lsl r6, r2, #2
	ldr r6, [r3, r6]
	cmp r6, #0
	beq _0222A65A
	ldr r3, _0222A688 ; =_022368A0
	str r2, [r3]
	blx r6
	str r0, [r5]
	b _0222A65A
_0222A64E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0222A65A
	mov r0, #1
	pop {r4, r5, r6, pc}
_0222A65A:
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222A668
	bl sub_0202457C
_0222A668:
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov44_02231BB0
	cmp r0, #1
	bne _0222A680
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov44_02231C60
_0222A680:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222A684: .word ov44_0223676C
_0222A688: .word _022368A0
	thumb_func_end ov44_0222A60C

	thumb_func_start ov44_0222A68C
ov44_0222A68C: ; 0x0222A68C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	ldr r0, _0222A74C ; =0x00000D68
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222A6AE
	bl DestroySysTask
	ldr r0, _0222A74C ; =0x00000D68
	mov r1, #0
	str r1, [r5, r0]
	add r0, r0, #4
	str r1, [r5, r0]
_0222A6AE:
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov44_02231BB0
	cmp r0, #1
	bne _0222A6C6
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov44_02231B4C
_0222A6C6:
	add r0, r5, #0
	bl ov44_0222F98C
	cmp r0, #1
	bne _0222A6D6
	add r0, r5, #0
	bl ov44_0222FA28
_0222A6D6:
	ldr r0, _0222A750 ; =0x00000B0C
	add r0, r5, r0
	bl ov44_0222ABB8
	mov r0, #0xb3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020135AC
	mov r7, #0xaf
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #2
_0222A6F0:
	ldr r0, [r4, r7]
	bl Destroy2DGfxResObjMan
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _0222A6F0
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02024504
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	add r0, r5, #0
	bl ov44_0222B164
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov44_0222AE74
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl DestroyMsgData
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl DestroyMsgData
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ScrStrBufs_delete
	ldr r0, _0222A754 ; =FS_OVERLAY_ID(OVY_42)
	bl UnloadOverlayByID
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222A74C: .word 0x00000D68
_0222A750: .word 0x00000B0C
_0222A754: .word FS_OVERLAY_ID(OVY_42)
	thumb_func_end ov44_0222A68C

	thumb_func_start ov44_0222A758
ov44_0222A758: ; 0x0222A758
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov44_0222A68C
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	add r6, r0, #0
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	str r1, [r6, #4]
	ldr r0, [r4, r0]
	cmp r0, #8
	beq _0222A780
	cmp r0, #0xa
	bne _0222A78C
_0222A780:
	bl UnloadDwcOverlay
	mov r0, #0
	bl sub_02002B8C
	b _0222A792
_0222A78C:
	bl ov00_021E6EBC
	str r0, [r6, #8]
_0222A792:
	add r0, r4, #0
	bl ov44_0222AE44
	add r0, r5, #0
	bl OverlayManager_FreeData
	bl sub_02021238
	bl GF_DestroyVramTransferManager
	mov r0, #0x35
	bl DestroyHeap
	mov r0, #0xd3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0xc
	bhi _0222A7E2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222A7C2: ; jump table
	.short _0222A7E2 - _0222A7C2 - 2 ; case 0
	.short _0222A7DC - _0222A7C2 - 2 ; case 1
	.short _0222A7DC - _0222A7C2 - 2 ; case 2
	.short _0222A7DC - _0222A7C2 - 2 ; case 3
	.short _0222A7DC - _0222A7C2 - 2 ; case 4
	.short _0222A7DC - _0222A7C2 - 2 ; case 5
	.short _0222A7DC - _0222A7C2 - 2 ; case 6
	.short _0222A7DC - _0222A7C2 - 2 ; case 7
	.short _0222A7DC - _0222A7C2 - 2 ; case 8
	.short _0222A7DC - _0222A7C2 - 2 ; case 9
	.short _0222A7DC - _0222A7C2 - 2 ; case 10
	.short _0222A7E2 - _0222A7C2 - 2 ; case 11
	.short _0222A7DC - _0222A7C2 - 2 ; case 12
_0222A7DC:
	mov r0, #0x80
	bl DestroyHeap
_0222A7E2:
	bl ov44_0222E074
	cmp r0, #1
	bne _0222A7F2
	mov r0, #0
	mov r1, #0x78
	bl GF_SndHandleSetInitialVolume
_0222A7F2:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_0222A758

	thumb_func_start ov44_0222A7F8
ov44_0222A7F8: ; 0x0222A7F8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	ldr r0, _0222A82C ; =0x000010BC
	ldrh r0, [r4, r0]
	cmp r0, #1
	bne _0222A828
	mov r0, #0
	bl SetMasterBrightnessNeutral
	mov r0, #1
	bl SetMasterBrightnessNeutral
	ldr r0, _0222A82C ; =0x000010BC
	mov r1, #0
	strh r1, [r4, r0]
_0222A828:
	pop {r4, pc}
	nop
_0222A82C: .word 0x000010BC
	thumb_func_end ov44_0222A7F8

	thumb_func_start ov44_0222A830
ov44_0222A830: ; 0x0222A830
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0222A84C ; =ov44_02235548
	add r3, sp, #0
	mov r2, #5
_0222A83A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0222A83A
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_0222A84C: .word ov44_02235548
	thumb_func_end ov44_0222A830

	thumb_func_start ov44_0222A850
ov44_0222A850: ; 0x0222A850
	push {r3, r4, r5, lr}
	sub sp, #0xf0
	ldr r5, _0222AA68 ; =ov44_022353B0
	add r3, sp, #0xe0
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _0222AA6C ; =ov44_022353E8
	add r3, sp, #0xc4
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
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x35
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0222AA70 ; =ov44_02235404
	add r3, sp, #0xa8
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x35
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0222AA74 ; =ov44_02235490
	add r3, sp, #0x8c
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x35
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0222AA78 ; =ov44_02235420
	add r3, sp, #0x70
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x35
	bl BG_ClearCharDataRange
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0222AA7C ; =ov44_0223543C
	add r3, sp, #0x54
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
	ldr r5, _0222AA80 ; =ov44_02235458
	add r3, sp, #0x38
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
	ldr r5, _0222AA84 ; =ov44_02235474
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0222AA88 ; =ov44_022354AC
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	mov r3, #0x35
	bl BG_ClearCharDataRange
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x35
	bl BG_ClearCharDataRange
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x35
	bl BG_ClearCharDataRange
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x35
	bl BG_ClearCharDataRange
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x35
	bl BG_ClearCharDataRange
	mov r0, #5
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x35
	bl BG_ClearCharDataRange
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x35
	bl BG_ClearCharDataRange
	mov r0, #7
	mov r1, #0x20
	mov r2, #0
	mov r3, #0x35
	bl BG_ClearCharDataRange
	mov r0, #0
	mov r1, #3
	bl SetBgPriority
	mov r0, #1
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	ldr r0, _0222AA8C ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _0222AA90 ; =0x04001050
	strh r1, [r0]
	add sp, #0xf0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222AA68: .word ov44_022353B0
_0222AA6C: .word ov44_022353E8
_0222AA70: .word ov44_02235404
_0222AA74: .word ov44_02235490
_0222AA78: .word ov44_02235420
_0222AA7C: .word ov44_0223543C
_0222AA80: .word ov44_02235458
_0222AA84: .word ov44_02235474
_0222AA88: .word ov44_022354AC
_0222AA8C: .word 0x04000050
_0222AA90: .word 0x04001050
	thumb_func_end ov44_0222A850

	thumb_func_start ov44_0222AA94
ov44_0222AA94: ; 0x0222AA94
	push {r3, r4, r5, lr}
	ldr r2, _0222AABC ; =0x00000A88
	mov r4, #0
	add r5, r0, #0
_0222AA9C:
	ldr r3, [r5, r2]
	cmp r3, #0
	bne _0222AAAC
	lsl r2, r4, #2
	add r2, r0, r2
	ldr r0, _0222AABC ; =0x00000A88
	str r1, [r2, r0]
	pop {r3, r4, r5, pc}
_0222AAAC:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x21
	blt _0222AA9C
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	nop
_0222AABC: .word 0x00000A88
	thumb_func_end ov44_0222AA94

	thumb_func_start ov44_0222AAC0
ov44_0222AAC0: ; 0x0222AAC0
	push {r3, r4, r5, lr}
	ldr r2, _0222AAE8 ; =0x00000A88
	mov r4, #0
	add r5, r0, #0
_0222AAC8:
	ldr r3, [r5, r2]
	cmp r3, r1
	bne _0222AADA
	lsl r1, r4, #2
	add r1, r0, r1
	ldr r0, _0222AAE8 ; =0x00000A88
	mov r2, #0
	str r2, [r1, r0]
	pop {r3, r4, r5, pc}
_0222AADA:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x21
	blt _0222AAC8
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222AAE8: .word 0x00000A88
	thumb_func_end ov44_0222AAC0

	thumb_func_start ov44_0222AAEC
ov44_0222AAEC: ; 0x0222AAEC
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _0222AB20 ; =0x00000A88
	str r0, [sp]
	add r6, r1, #0
	mov r4, #0
	add r5, r0, #0
_0222AAF8:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0222AB12
	bl ov44_02231EF4
	cmp r6, r0
	bne _0222AB12
	ldr r0, [sp]
	lsl r1, r4, #2
	add r1, r0, r1
	ldr r0, _0222AB20 ; =0x00000A88
	ldr r0, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0222AB12:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x21
	blt _0222AAF8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222AB20: .word 0x00000A88
	thumb_func_end ov44_0222AAEC

	thumb_func_start ov44_0222AB24
ov44_0222AB24: ; 0x0222AB24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	add r6, r2, #0
	add r4, r3, #0
	mov r0, #0x40
	str r0, [sp]
	mov r3, #0xe
	add r5, r1, #0
	add r1, r3, #0
	add r0, r6, #0
	mov r2, #0
	add r3, #0xf2
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0x40
	str r0, [sp]
	mov r3, #0x1a
	add r0, r6, #0
	mov r1, #0xe
	mov r2, #4
	lsl r3, r3, #4
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	mov r1, #0xd
	add r2, r7, #0
	mov r3, #1
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0xd
	add r2, r7, #0
	mov r3, #6
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _0222AB9C
	add r3, r5, #0
	add r0, r6, #0
	mov r1, #0xd
	mov r2, #0
	add r3, #0xc
	str r4, [sp]
	bl GfGfxLoader_GetCharDataFromOpenNarc
	str r0, [r5, #8]
_0222AB9C:
	ldr r0, [r5]
	cmp r0, #0
	bne _0222ABB2
	add r0, r6, #0
	mov r1, #0xf
	mov r2, #0
	add r3, r5, #4
	str r4, [sp]
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	str r0, [r5]
_0222ABB2:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov44_0222AB24

	thumb_func_start ov44_0222ABB8
ov44_0222ABB8: ; 0x0222ABB8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0222ABCA
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
_0222ABCA:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0222ABD8
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #8]
_0222ABD8:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_0222ABB8

	thumb_func_start ov44_0222ABDC
ov44_0222ABDC: ; 0x0222ABDC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	ldr r1, [r1, #4]
	add r4, r2, #0
	mov r2, #2
	str r2, [sp]
	str r2, [sp, #4]
	add r2, r1, #0
	add r2, #0xc
	str r2, [sp, #8]
	ldr r2, [sp, #0x34]
	add r6, r3, #0
	lsl r2, r2, #0x19
	lsr r2, r2, #0x18
	str r2, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	ldrh r2, [r1]
	add r3, sp, #0x20
	add r5, r0, #0
	lsl r2, r2, #0x15
	lsr r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r1, [r1, #2]
	add r2, r6, #0
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x18]
	lsl r1, r4, #0x18
	ldrb r3, [r3, #0x10]
	lsr r1, r1, #0x18
	bl CopyToBgTilemapRect
	add r0, r4, #0
	bl ov44_0222ADC4
	mov r1, #2
	str r1, [sp]
	str r1, [sp, #4]
	ldr r1, [sp, #0x38]
	add r3, sp, #0x20
	add r0, r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	lsl r1, r4, #0x18
	ldrb r3, [r3, #0x10]
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r2, r6, #0
	bl BgTilemapRectChangePalette
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_0222ABDC

	thumb_func_start ov44_0222AC54
ov44_0222AC54: ; 0x0222AC54
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	ldr r5, [sp, #0x24]
	mov r4, #0
	cmp r5, #0x1d
	bhi _0222ACD4
	add r5, r5, r5
	add r5, pc
	ldrh r5, [r5, #6]
	lsl r5, r5, #0x10
	asr r5, r5, #0x10
	add pc, r5
_0222AC6C: ; jump table
	.short _0222ACCC - _0222AC6C - 2 ; case 0
	.short _0222ACA8 - _0222AC6C - 2 ; case 1
	.short _0222ACAE - _0222AC6C - 2 ; case 2
	.short _0222ACAE - _0222AC6C - 2 ; case 3
	.short _0222ACAE - _0222AC6C - 2 ; case 4
	.short _0222ACAE - _0222AC6C - 2 ; case 5
	.short _0222ACAE - _0222AC6C - 2 ; case 6
	.short _0222ACAE - _0222AC6C - 2 ; case 7
	.short _0222ACB4 - _0222AC6C - 2 ; case 8
	.short _0222ACAC - _0222AC6C - 2 ; case 9
	.short _0222ACAC - _0222AC6C - 2 ; case 10
	.short _0222ACAC - _0222AC6C - 2 ; case 11
	.short _0222ACAC - _0222AC6C - 2 ; case 12
	.short _0222ACAC - _0222AC6C - 2 ; case 13
	.short _0222ACAC - _0222AC6C - 2 ; case 14
	.short _0222ACB2 - _0222AC6C - 2 ; case 15
	.short _0222ACC8 - _0222AC6C - 2 ; case 16
	.short _0222ACD4 - _0222AC6C - 2 ; case 17
	.short _0222ACBE - _0222AC6C - 2 ; case 18
	.short _0222ACBE - _0222AC6C - 2 ; case 19
	.short _0222ACC4 - _0222AC6C - 2 ; case 20
	.short _0222ACC2 - _0222AC6C - 2 ; case 21
	.short _0222ACBA - _0222AC6C - 2 ; case 22
	.short _0222ACB8 - _0222AC6C - 2 ; case 23
	.short _0222ACBA - _0222AC6C - 2 ; case 24
	.short _0222ACB8 - _0222AC6C - 2 ; case 25
	.short _0222ACBA - _0222AC6C - 2 ; case 26
	.short _0222ACB8 - _0222AC6C - 2 ; case 27
	.short _0222ACD0 - _0222AC6C - 2 ; case 28
	.short _0222ACD0 - _0222AC6C - 2 ; case 29
_0222ACA8:
	mov r5, #3
	b _0222ACD6
_0222ACAC:
	mov r4, #1
_0222ACAE:
	mov r5, #6
	b _0222ACD6
_0222ACB2:
	mov r4, #1
_0222ACB4:
	mov r5, #7
	b _0222ACD6
_0222ACB8:
	mov r4, #1
_0222ACBA:
	mov r5, #0xa
	b _0222ACD6
_0222ACBE:
	mov r5, #5
	b _0222ACD6
_0222ACC2:
	mov r4, #1
_0222ACC4:
	mov r5, #0xb
	b _0222ACD6
_0222ACC8:
	mov r5, #4
	b _0222ACD6
_0222ACCC:
	mov r5, #8
	b _0222ACD6
_0222ACD0:
	mov r5, #5
	b _0222ACD6
_0222ACD4:
	mov r5, #5
_0222ACD6:
	add r6, sp, #0x10
	ldrb r6, [r6, #0x10]
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	bl ov44_0222ABDC
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov44_0222AC54

	thumb_func_start ov44_0222ACE8
ov44_0222ACE8: ; 0x0222ACE8
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r1, [r1, #0xc]
	add r4, r0, #0
	ldrh r5, [r1, #2]
	lsl r5, r5, #0x13
	lsr r5, r5, #0x10
	str r5, [sp]
	ldrh r5, [r1]
	lsl r5, r5, #0x13
	lsr r5, r5, #0x10
	str r5, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	mov r2, #0x10
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	ldr r2, [sp, #0x28]
	ldr r1, [r1, #0x14]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x10
	mov r3, #0
	bl BlitBitmapRectToWindow
	ldrb r0, [r4, #4]
	bl ov44_0222ADC4
	add r2, r0, #0
	ldr r1, [sp, #0x2c]
	add r0, r4, #0
	add r1, r2, r1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl SetWindowPaletteNum
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_0222ACE8

	thumb_func_start ov44_0222AD34
ov44_0222AD34: ; 0x0222AD34
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r5, [sp, #0x18]
	mov r4, #0
	cmp r5, #0x1d
	bhi _0222ADB4
	add r5, r5, r5
	add r5, pc
	ldrh r5, [r5, #6]
	lsl r5, r5, #0x10
	asr r5, r5, #0x10
	add pc, r5
_0222AD4C: ; jump table
	.short _0222ADAC - _0222AD4C - 2 ; case 0
	.short _0222AD88 - _0222AD4C - 2 ; case 1
	.short _0222AD8E - _0222AD4C - 2 ; case 2
	.short _0222AD8E - _0222AD4C - 2 ; case 3
	.short _0222AD8E - _0222AD4C - 2 ; case 4
	.short _0222AD8E - _0222AD4C - 2 ; case 5
	.short _0222AD8E - _0222AD4C - 2 ; case 6
	.short _0222AD8E - _0222AD4C - 2 ; case 7
	.short _0222AD94 - _0222AD4C - 2 ; case 8
	.short _0222AD8C - _0222AD4C - 2 ; case 9
	.short _0222AD8C - _0222AD4C - 2 ; case 10
	.short _0222AD8C - _0222AD4C - 2 ; case 11
	.short _0222AD8C - _0222AD4C - 2 ; case 12
	.short _0222AD8C - _0222AD4C - 2 ; case 13
	.short _0222AD8C - _0222AD4C - 2 ; case 14
	.short _0222AD92 - _0222AD4C - 2 ; case 15
	.short _0222ADA8 - _0222AD4C - 2 ; case 16
	.short _0222ADB4 - _0222AD4C - 2 ; case 17
	.short _0222AD9E - _0222AD4C - 2 ; case 18
	.short _0222AD9E - _0222AD4C - 2 ; case 19
	.short _0222ADA4 - _0222AD4C - 2 ; case 20
	.short _0222ADA2 - _0222AD4C - 2 ; case 21
	.short _0222AD9A - _0222AD4C - 2 ; case 22
	.short _0222AD98 - _0222AD4C - 2 ; case 23
	.short _0222AD9A - _0222AD4C - 2 ; case 24
	.short _0222AD98 - _0222AD4C - 2 ; case 25
	.short _0222AD9A - _0222AD4C - 2 ; case 26
	.short _0222AD98 - _0222AD4C - 2 ; case 27
	.short _0222ADB0 - _0222AD4C - 2 ; case 28
	.short _0222ADB0 - _0222AD4C - 2 ; case 29
_0222AD88:
	mov r5, #3
	b _0222ADB6
_0222AD8C:
	mov r4, #1
_0222AD8E:
	mov r5, #6
	b _0222ADB6
_0222AD92:
	mov r4, #1
_0222AD94:
	mov r5, #7
	b _0222ADB6
_0222AD98:
	mov r4, #1
_0222AD9A:
	mov r5, #0xa
	b _0222ADB6
_0222AD9E:
	mov r5, #5
	b _0222ADB6
_0222ADA2:
	mov r4, #1
_0222ADA4:
	mov r5, #0xb
	b _0222ADB6
_0222ADA8:
	mov r5, #4
	b _0222ADB6
_0222ADAC:
	mov r5, #8
	b _0222ADB6
_0222ADB0:
	mov r5, #5
	b _0222ADB6
_0222ADB4:
	mov r5, #5
_0222ADB6:
	str r5, [sp]
	str r4, [sp, #4]
	bl ov44_0222ACE8
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_0222AD34

	thumb_func_start ov44_0222ADC4
ov44_0222ADC4: ; 0x0222ADC4
	cmp r0, #4
	bhs _0222ADCC
	mov r0, #8
	bx lr
_0222ADCC:
	mov r0, #0xd
	bx lr
	thumb_func_end ov44_0222ADC4

	thumb_func_start ov44_0222ADD0
ov44_0222ADD0: ; 0x0222ADD0
	push {lr}
	sub sp, #0xc
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x35
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	bl ov44_0222E030
	mov r0, #0x12
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov44_0222ADD0

	thumb_func_start ov44_0222ADF8
ov44_0222ADF8: ; 0x0222ADF8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x5f
	lsl r0, r0, #2
	mov r1, #0x35
	bl String_ctor
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r1, #8
	add r0, r1, #0
	mov r1, #0x35
	bl String_ctor
	mov r1, #0x5f
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	mov r1, #0x35
	bl String_ctor
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #0xb4
	mov r1, #0x35
	bl String_ctor
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0xd2
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_0222ADF8

	thumb_func_start ov44_0222AE44
ov44_0222AE44: ; 0x0222AE44
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl String_dtor
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_0222AE44

	thumb_func_start ov44_0222AE74
ov44_0222AE74: ; 0x0222AE74
	push {r4, lr}
	add r4, r0, #0
	mov r1, #7
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
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
	thumb_func_end ov44_0222AE74

	thumb_func_start ov44_0222AEC0
ov44_0222AEC0: ; 0x0222AEC0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r4, [r6, r0]
	mov r0, #1
	add r5, r1, #0
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
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r2, #0
	str r2, [sp]
	mov r0, #0x35
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #3
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r3, #0
	str r3, [sp]
	mov r0, #0x35
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #3
	mov r2, #4
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0x1a
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x35
	bl LoadFontPal1
	mov r1, #6
	mov r0, #0
	lsl r1, r1, #6
	mov r2, #0x35
	bl LoadFontPal1
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0x35
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #2
	add r2, r4, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0x35
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #6
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x35
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #0xb
	add r2, r4, #0
	mov r3, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x35
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #0xc
	add r2, r4, #0
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x35
	str r0, [sp, #4]
	ldr r2, _0222AFE0 ; =0x000001E2
	add r0, r4, #0
	mov r1, #2
	mov r3, #0xa
	bl LoadUserFrameGfx2
	mov r0, #0
	str r0, [sp]
	mov r0, #0x35
	str r0, [sp, #4]
	ldr r2, _0222AFE4 ; =0x000001D9
	add r0, r4, #0
	mov r1, #2
	mov r3, #0xb
	bl LoadUserFrameGfx1
	mov r0, #0
	str r0, [sp]
	mov r0, #0x35
	str r0, [sp, #4]
	ldr r2, _0222AFE4 ; =0x000001D9
	add r0, r4, #0
	mov r1, #1
	mov r3, #0xb
	bl LoadUserFrameGfx1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0222AFE0: .word 0x000001E2
_0222AFE4: .word 0x000001D9
	thumb_func_end ov44_0222AEC0

	thumb_func_start ov44_0222AFE8
ov44_0222AFE8: ; 0x0222AFE8
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _0222B028 ; =ov44_022353C0
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	ldr r1, _0222B02C ; =0x00200010
	mov r2, #0x10
	bl sub_020215C0
	mov r0, #0x14
	mov r1, #0x35
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	ldr r1, _0222B02C ; =0x00200010
	mov r0, #1
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	add sp, #0x10
	pop {r4, pc}
	nop
_0222B028: .word ov44_022353C0
_0222B02C: .word 0x00200010
	thumb_func_end ov44_0222AFE8

	thumb_func_start ov44_0222B030
ov44_0222B030: ; 0x0222B030
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x35
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	mov r1, #0x65
	lsl r1, r1, #2
	mov r0, #8
	add r1, r6, r1
	mov r2, #0x35
	bl G2dRenderer_Init
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [r6, r1]
	add r0, r1, #4
	mov r2, #1
	add r0, r6, r0
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r7, #0xaf
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_0222B07C:
	mov r0, #1
	add r1, r4, #0
	mov r2, #0x35
	bl Create2DGfxResObjMan
	str r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0222B07C
	mov r0, #1
	mov r1, #0x35
	bl sub_02013534
	mov r1, #0xb3
	lsl r1, r1, #2
	str r0, [r6, r1]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov44_0222B030

	thumb_func_start ov44_0222B0A4
ov44_0222B0A4: ; 0x0222B0A4
	ldr r3, _0222B0AC ; =GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bx r3
	.balign 4, 0
_0222B0AC: .word GX_EngineAToggleLayers
	thumb_func_end ov44_0222B0A4

	thumb_func_start ov44_0222B0B0
ov44_0222B0B0: ; 0x0222B0B0
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r4, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222B0DA
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
_0222B0DA:
	mov r0, #1
	str r0, [sp]
	mov r0, #0x16
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _0222B15C ; =0x000001CA
	mov r1, #0x2f
	str r0, [sp, #0x10]
	sub r0, #0x6e
	lsl r1, r1, #4
	ldr r0, [r4, r0]
	add r1, r4, r1
	mov r2, #3
	mov r3, #5
	bl AddWindowParameterized
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	add r2, #0x10
	ldr r2, [r4, r2]
	mov r1, #0x15
	bl ReadMsgDataIntoString
	mov r1, #0x5e
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r4, r1]
	add r2, r0, #0
	mov r3, #0xb0
	bl FontID_String_GetCenterAlignmentX
	mov r1, #0
	add r3, r0, #0
	mov r2, #0x2f
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0222B160 ; =0x000F0E00
	lsl r2, r2, #4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, r2
	lsr r2, r2, #1
	ldr r2, [r4, r2]
	mov r1, #1
	bl AddTextPrinterParameterized2
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_0222B15C: .word 0x000001CA
_0222B160: .word 0x000F0E00
	thumb_func_end ov44_0222B0B0

	thumb_func_start ov44_0222B164
ov44_0222B164: ; 0x0222B164
	push {r4, lr}
	add r4, r0, #0
	bl ov44_0222F7BC
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r4, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222B184
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
_0222B184:
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r4, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222B19C
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
_0222B19C:
	mov r0, #0x33
	lsl r0, r0, #4
	add r0, r4, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222B1B4
	mov r0, #0x33
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
_0222B1B4:
	mov r0, #0x2e
	lsl r0, r0, #4
	add r0, r4, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222B1CC
	mov r0, #0x2e
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
_0222B1CC:
	mov r0, #0x31
	lsl r0, r0, #4
	add r0, r4, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222B1E4
	mov r0, #0x31
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
_0222B1E4:
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222B1F6
	mov r1, #0
	add r2, r1, #0
	bl DestroyListMenu
_0222B1F6:
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222B20C
	bl ListMenuItems_dtor
	mov r0, #0x53
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_0222B20C:
	mov r0, #3
	lsl r0, r0, #8
	add r0, r4, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222B224
	mov r0, #3
	lsl r0, r0, #8
	add r0, r4, r0
	bl RemoveWindow
_0222B224:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_0222B164

	thumb_func_start ov44_0222B228
ov44_0222B228: ; 0x0222B228
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02039998
	cmp r0, #0
	beq _0222B2CA
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	bl sub_020398C8
	str r0, [r5, #4]
	ldr r1, [r5, #4]
	add r0, r5, #0
	bl ov44_02229F00
	cmp r0, #8
	beq _0222B278
	cmp r0, #0x12
	beq _0222B278
	cmp r0, #0x14
	beq _0222B278
	cmp r0, #0x16
	beq _0222B278
	cmp r0, #0x17
	beq _0222B278
	cmp r0, #0x18
	beq _0222B278
	cmp r0, #0x19
	beq _0222B278
	cmp r0, #0x1a
	beq _0222B278
	cmp r0, #0x1b
	beq _0222B278
	cmp r0, #0x13
	bne _0222B2A8
_0222B278:
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	bl sub_020343E4
	bl sub_02039378
	bl sub_020398C8
	add r1, r0, #0
	str r0, [r5, #4]
	add r1, #0x22
	ldrb r1, [r1]
	add r0, #0x21
	strb r1, [r0]
	mov r0, #0xd7
	mov r1, #0x14
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0x41
	sub r0, #0x14
	str r1, [r5, r0]
	b _0222B360
_0222B2A8:
	add r0, r5, #0
	mov r1, #0x4d
	mov r2, #0
	bl ov44_0222F510
	mov r0, #1
	add r1, r0, #0
	bl sub_020398D4
	mov r0, #0x10
	bl sub_02037AC0
	mov r0, #0xd2
	mov r1, #0x3d
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222B360
_0222B2CA:
	ldr r1, _0222B364 ; =0x0000047D
	mov r0, #0xb
	mov r2, #1
	bl sub_02004EC4
	add r0, r5, #0
	bl ov44_0222B0B0
	ldr r0, [r5]
	bl sub_0202C08C
	bl DWC_CheckHasProfile
	cmp r0, #0
	bne _0222B32E
	mov r0, #0
	mov r1, #3
	bl SetBgPriority
	mov r0, #1
	mov r1, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	mov r1, #1
	bl SetBgPriority
	add r0, r5, #0
	mov r1, #0x12
	bl ov44_0222F66C
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222B368 ; =ov44_02235384
	mov r2, #0
	bl ov44_02231A28
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xd2
	mov r1, #6
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222B360
_0222B32E:
	ldr r0, [r5]
	bl sub_0202C08C
	bl DWC_CheckValidConsole
	cmp r0, #0
	bne _0222B34E
	add r0, r5, #0
	mov r1, #0x14
	bl ov44_0222F66C
	mov r0, #0xd2
	mov r1, #3
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222B360
_0222B34E:
	add r0, r5, #0
	mov r1, #0x11
	mov r2, #1
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222B360:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222B364: .word 0x0000047D
_0222B368: .word ov44_02235384
	thumb_func_end ov44_0222B228

	thumb_func_start ov44_0222B36C
ov44_0222B36C: ; 0x0222B36C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222B3A0
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222B3A4 ; =ov44_0223537C
	mov r2, #0
	bl ov44_02231A28
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xd2
	mov r1, #2
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222B3A0:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222B3A4: .word ov44_0223537C
	thumb_func_end ov44_0222B36C

	thumb_func_start ov44_0222B3A8
ov44_0222B3A8: ; 0x0222B3A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl sub_020168F4
	cmp r0, #1
	bne _0222B408
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, _0222B428 ; =0x000004A4
	bl sub_020396FC
	str r0, [r5, #4]
	add r0, r5, #0
	mov r1, #0x17
	mov r2, #1
	bl ov44_0222F510
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222B3EC
	bl GF_AssertFail
_0222B3EC:
	mov r1, #0x2d
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0xee
	bl sub_0200F0AC
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xd2
	mov r1, #0xe
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222B424
_0222B408:
	cmp r0, #2
	bne _0222B420
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	mov r0, #0xd2
	mov r1, #0x22
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222B424
_0222B420:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222B424:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222B428: .word 0x000004A4
	thumb_func_end ov44_0222B3A8

	thumb_func_start ov44_0222B42C
ov44_0222B42C: ; 0x0222B42C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0222B48C ; =gSystem
	add r4, r1, #0
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0222B444
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222B488
_0222B444:
	add r0, r5, #0
	mov r1, #0x15
	bl ov44_0222F66C
	mov r0, #3
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #0
	bl SetBgPriority
	mov r0, #0
	mov r1, #3
	bl SetBgPriority
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222B490 ; =ov44_02235384
	mov r2, #1
	bl ov44_02231A28
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xd2
	mov r1, #4
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222B488:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222B48C: .word gSystem
_0222B490: .word ov44_02235384
	thumb_func_end ov44_0222B42C

	thumb_func_start ov44_0222B494
ov44_0222B494: ; 0x0222B494
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl sub_020168F4
	cmp r0, #1
	bne _0222B4EE
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	bl RemoveWindow
	add r0, r5, #0
	mov r1, #0x16
	bl ov44_0222F66C
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222B524 ; =ov44_02235384
	mov r2, #1
	bl ov44_02231A28
	mov r1, #0x62
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xd2
	mov r1, #5
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222B520
_0222B4EE:
	cmp r0, #2
	bne _0222B51C
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0xd2
	mov r1, #0x22
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222B520
_0222B51C:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222B520:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222B524: .word ov44_02235384
	thumb_func_end ov44_0222B494

	thumb_func_start ov44_0222B528
ov44_0222B528: ; 0x0222B528
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl sub_020168F4
	cmp r0, #1
	bne _0222B5EA
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	mov r0, #3
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #1
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #0
	mov r1, #3
	bl SetBgPriority
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	bl RemoveWindow
	ldr r0, [r5]
	bl sub_0202C03C
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x1f
	bl SavArray_get
	bl sub_02031710
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0203107C
	bl sub_02031188
	mov r0, #0xd2
	mov r1, #0xe
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, _0222B648 ; =0x000004A4
	bl sub_020396FC
	str r0, [r5, #4]
	add r0, r5, #0
	mov r1, #0x17
	mov r2, #1
	bl ov44_0222F510
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222B5CE
	bl GF_AssertFail
_0222B5CE:
	mov r1, #0x2d
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0xee
	bl sub_0200F0AC
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xda
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222B644
_0222B5EA:
	cmp r0, #2
	bne _0222B640
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	mov r0, #3
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #1
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #0
	mov r1, #3
	bl SetBgPriority
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	bl RemoveWindow
	add r0, r5, #0
	mov r1, #0x14
	bl ov44_0222F66C
	mov r0, #0xd2
	mov r1, #3
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222B644
_0222B640:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222B644:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222B648: .word 0x000004A4
	thumb_func_end ov44_0222B528

	thumb_func_start ov44_0222B64C
ov44_0222B64C: ; 0x0222B64C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl sub_020168F4
	cmp r0, #1
	bne _0222B6EA
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	mov r0, #0
	mov r1, #3
	bl SetBgPriority
	mov r0, #1
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0xd2
	mov r1, #0xe
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, _0222B740 ; =0x000004A4
	bl sub_020396FC
	str r0, [r5, #4]
	add r0, r5, #0
	mov r1, #0x17
	mov r2, #1
	bl ov44_0222F510
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222B6CE
	bl GF_AssertFail
_0222B6CE:
	mov r1, #0x2d
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0xee
	bl sub_0200F0AC
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xda
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222B73C
_0222B6EA:
	cmp r0, #2
	bne _0222B738
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	mov r0, #0
	mov r1, #3
	bl SetBgPriority
	mov r0, #1
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0xd2
	mov r1, #0x22
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222B73C
_0222B738:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222B73C:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222B740: .word 0x000004A4
	thumb_func_end ov44_0222B64C

	thumb_func_start ov44_0222B744
ov44_0222B744: ; 0x0222B744
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	mov r1, #3
	bl SetBgPriority
	mov r0, #1
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #0xd2
	mov r1, #0xf
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_0222B744

	thumb_func_start ov44_0222B778
ov44_0222B778: ; 0x0222B778
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	str r1, [sp]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #0x14]
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl Sav2_Pokedex_get
	str r0, [sp, #0x10]
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl SavArray_PlayerParty_get
	str r0, [sp, #0xc]
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0202CA44
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	bl GetPartyCount
	mov r6, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _0222B7F0
	add r4, r6, #0
_0222B7C0:
	ldr r0, [sp, #0xc]
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	ldr r1, [r5, #4]
	mov r2, #0
	strh r0, [r1, r4]
	add r0, r7, #0
	mov r1, #6
	bl GetMonData
	ldr r1, [r5, #4]
	add r6, r6, #1
	add r1, r1, r4
	strh r0, [r1, #0xc]
	ldr r0, [sp, #4]
	add r4, r4, #2
	cmp r6, r0
	blt _0222B7C0
_0222B7F0:
	ldr r0, [sp, #0x14]
	bl PlayerProfile_GetVersion
	ldr r1, [r5, #4]
	strb r0, [r1, #0x18]
	ldr r0, [sp, #0x14]
	bl PlayerProfile_GetLanguage
	ldr r1, [r5, #4]
	strb r0, [r1, #0x19]
	ldr r0, [sp, #0x10]
	bl Pokedex_GetNatDexFlag
	ldr r1, [r5, #4]
	strb r0, [r1, #0x1a]
	ldr r0, [r5, #4]
	mov r1, #0x1d
	strb r1, [r0, #0x1b]
	ldr r1, [sp]
	add r0, r5, #0
	bl ov44_0222F830
	ldr r0, [r5, #4]
	mov r1, #0
	strb r1, [r0, #0x1c]
	ldr r0, [sp, #0x14]
	bl PlayerProfile_GetAvatar
	ldr r1, [r5, #4]
	strb r0, [r1, #0x1d]
	ldr r0, [sp, #0x14]
	bl PlayerProfile_GetTrainerGender
	ldr r1, [r5, #4]
	strb r0, [r1, #0x1e]
	ldr r0, [sp, #8]
	bl sub_0202CA8C
	ldr r1, [r5, #4]
	strb r0, [r1, #0x1f]
	ldr r0, [sp, #8]
	bl sub_0202CA90
	ldr r1, [r5, #4]
	add r1, #0x20
	strb r0, [r1]
	ldr r0, [r5, #4]
	mov r1, #1
	add r0, #0x21
	strb r1, [r0]
	ldr r0, [r5, #4]
	add r0, #0x22
	strb r1, [r0]
	ldr r0, [r5, #4]
	mov r1, #0x24
	bl ov00_021E6D60
	ldr r0, [r5, #4]
	mov r1, #0x24
	add r0, #0x24
	bl ov00_021E6CCC
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_0222B778

	thumb_func_start ov44_0222B870
ov44_0222B870: ; 0x0222B870
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	add r5, r0, #0
	add r4, r6, #0
_0222B878:
	add r1, r5, r4
	mov r0, #0
	strb r0, [r1, #0xc]
	ldr r0, _0222B8DC ; =0x000010BE
	ldrh r0, [r5, r0]
	cmp r0, r4
	ble _0222B8D2
	add r0, r4, #0
	bl ov44_02231974
	cmp r0, #0
	beq _0222B8D2
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_02231958
	add r7, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl ov44_02229F00
	cmp r0, #0
	beq _0222B8BA
	cmp r0, #0x1c
	beq _0222B8BA
	ldrb r1, [r7, #0x1d]
	cmp r1, #0
	beq _0222B8BA
	add r0, r5, r6
	add r1, r4, #1
	strb r1, [r0, #0xc]
	add r6, r6, #1
	b _0222B8D2
_0222B8BA:
	cmp r0, #0x1c
	bne _0222B8D2
	add r0, r5, #0
	add r1, r4, #1
	bl ov44_02230048
	cmp r0, #0
	beq _0222B8D2
	add r0, r5, #0
	add r1, r4, #1
	bl ov44_02230028
_0222B8D2:
	add r4, r4, #1
	cmp r4, #0x20
	blt _0222B878
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222B8DC: .word 0x000010BE
	thumb_func_end ov44_0222B870

	thumb_func_start ov44_0222B8E0
ov44_0222B8E0: ; 0x0222B8E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r4, #0
	str r4, [sp, #0xc]
	add r6, r5, #0
_0222B8EC:
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_02231958
	add r7, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl ov44_02229F00
	ldr r1, [r6, #0x4c]
	str r0, [sp]
	cmp r0, r1
	bne _0222B916
	add r0, r7, #0
	add r0, #0x21
	ldrb r1, [r0]
	add r0, r6, #0
	add r0, #0xcc
	ldr r0, [r0]
	cmp r1, r0
	beq _0222B992
_0222B916:
	add r0, r5, #0
	add r1, r4, #1
	bl ov44_0222AAEC
	str r0, [sp, #4]
	cmp r0, #0
	beq _0222B992
	ldr r0, [r6, #0x4c]
	bl ov44_02229FDC
	str r0, [sp, #8]
	ldr r0, [sp]
	bl ov44_02229FDC
	ldr r1, [sp, #8]
	cmp r1, #1
	bne _0222B94C
	cmp r0, #0
	bne _0222B94C
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r1, [sp, #4]
	add r0, r5, r0
	mov r2, #0
	bl ov44_02231FA8
	b _0222B964
_0222B94C:
	ldr r1, [sp, #8]
	cmp r1, #0
	bne _0222B964
	cmp r0, #1
	bne _0222B964
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r1, [sp, #4]
	add r0, r5, r0
	mov r2, #1
	bl ov44_02231FA8
_0222B964:
	ldr r0, [sp]
	mov r2, #7
	str r0, [r6, #0x4c]
	add r0, r7, #0
	add r0, #0x21
	ldrb r1, [r0]
	add r0, r6, #0
	add r0, #0xcc
	str r1, [r0]
	ldrb r3, [r7, #0x1d]
	ldr r0, [r5]
	add r1, r4, #0
	bl sub_0202C190
	ldrb r3, [r7, #0x1e]
	ldr r0, [r5]
	add r1, r4, #0
	mov r2, #8
	bl sub_0202C190
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
_0222B992:
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #0x20
	blt _0222B8EC
	ldr r0, [sp, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_0222B8E0

	thumb_func_start ov44_0222B9A0
ov44_0222B9A0: ; 0x0222B9A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_020392D8
	add r7, r0, #0
	ldr r6, [r7]
	ldr r1, [r7, #4]
	add r0, r6, #0
	bl ov00_021E6A70
	add r5, r0, #0
	cmp r5, #0xb
	beq _0222B9C0
	cmp r6, #0x19
	bne _0222B9D0
_0222B9C0:
	ldr r0, [r7, #4]
	cmp r0, #2
	beq _0222B9CA
	mov r7, #0xe
	b _0222B9CC
_0222B9CA:
	mov r7, #0xb
_0222B9CC:
	mov r5, #0xb
	b _0222B9E4
_0222B9D0:
	cmp r6, #0x1a
	bne _0222B9DA
	mov r7, #0xd
	mov r5, #0xc
	b _0222B9E4
_0222B9DA:
	cmp r5, #0
	blt _0222B9E2
	add r7, r5, #0
	b _0222B9E4
_0222B9E2:
	mov r7, #0xb
_0222B9E4:
	add r0, r4, #0
	bl ov44_0222F7BC
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r2, r6, #0
	mov r3, #5
	bl BufferIntegerAsString
	mov r0, #0xd7
	mov r1, #0x1e
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	add r1, r7, #0
	bl ov44_0222F66C
	cmp r5, #0xb
	bhi _0222BA5E
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222BA22: ; jump table
	.short _0222BA5E - _0222BA22 - 2 ; case 0
	.short _0222BA3A - _0222BA22 - 2 ; case 1
	.short _0222BA5E - _0222BA22 - 2 ; case 2
	.short _0222BA5E - _0222BA22 - 2 ; case 3
	.short _0222BA3A - _0222BA22 - 2 ; case 4
	.short _0222BA3A - _0222BA22 - 2 ; case 5
	.short _0222BA46 - _0222BA22 - 2 ; case 6
	.short _0222BA46 - _0222BA22 - 2 ; case 7
	.short _0222BA46 - _0222BA22 - 2 ; case 8
	.short _0222BA46 - _0222BA22 - 2 ; case 9
	.short _0222BA52 - _0222BA22 - 2 ; case 10
	.short _0222BA3A - _0222BA22 - 2 ; case 11
_0222BA3A:
	mov r0, #0xd2
	mov r1, #0xa
	lsl r0, r0, #2
	add sp, #8
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0222BA46:
	mov r0, #0xd2
	mov r1, #0xa
	lsl r0, r0, #2
	add sp, #8
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0222BA52:
	mov r0, #0xd2
	mov r1, #0xa
	lsl r0, r0, #2
	add sp, #8
	str r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0222BA5E:
	mov r0, #0xd2
	mov r1, #0x23
	lsl r0, r0, #2
	str r1, [r4, r0]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov44_0222B9A0

	thumb_func_start ov44_0222BA6C
ov44_0222BA6C: ; 0x0222BA6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0222BAB4 ; =gSystem
	add r4, r1, #0
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0222BA84
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222BAB0
_0222BA84:
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222BAA8
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	bl RemoveWindow
_0222BAA8:
	mov r0, #0xd2
	mov r1, #8
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222BAB0:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222BAB4: .word gSystem
	thumb_func_end ov44_0222BA6C

	thumb_func_start ov44_0222BAB8
ov44_0222BAB8: ; 0x0222BAB8
	mov r2, #0xd2
	mov r3, #9
	lsl r2, r2, #2
	str r3, [r0, r2]
	add r0, r1, #0
	bx lr
	thumb_func_end ov44_0222BAB8

	thumb_func_start ov44_0222BAC4
ov44_0222BAC4: ; 0x0222BAC4
	mov r2, #0xd2
	mov r3, #0xb
	lsl r2, r2, #2
	str r3, [r0, r2]
	add r0, r1, #0
	bx lr
	thumb_func_end ov44_0222BAC4

	thumb_func_start ov44_0222BAD0
ov44_0222BAD0: ; 0x0222BAD0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xd7
	lsl r0, r0, #2
	add r4, r1, #0
	ldr r1, [r5, r0]
	cmp r1, #0
	ble _0222BAE8
	sub r1, r1, #1
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222BAE8:
	ldr r0, _0222BB34 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0222BAFA
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222BB30
_0222BAFA:
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222BB1E
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	bl RemoveWindow
_0222BB1E:
	add r0, r5, #0
	mov r1, #0x58
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0xb
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222BB30:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222BB34: .word gSystem
	thumb_func_end ov44_0222BAD0

	thumb_func_start ov44_0222BB38
ov44_0222BB38: ; 0x0222BB38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222BB92
	ldr r0, _0222BB98 ; =0x04000304
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222BB76
	mov r2, #0x57
	mov r0, #0x35
	lsl r2, r2, #2
	str r0, [sp]
	ldr r0, [r5, r2]
	ldr r1, _0222BB9C ; =ov44_0223538C
	add r2, #0x7d
	mov r3, #0xb
	bl Std_CreateYesNoMenu
	mov r1, #0x61
	b _0222BB86
_0222BB76:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222BBA0 ; =ov44_02235374
	mov r2, #0
	bl ov44_02231A28
	mov r1, #0x62
_0222BB86:
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xd2
	mov r1, #0xc
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222BB92:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0222BB98: .word 0x04000304
_0222BB9C: .word ov44_0223538C
_0222BBA0: .word ov44_02235374
	thumb_func_end ov44_0222BB38

	thumb_func_start ov44_0222BBA4
ov44_0222BBA4: ; 0x0222BBA4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0222BC74 ; =0x04000304
	add r4, r1, #0
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222BC0A
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x35
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0222BBD0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222BBD0:
	cmp r0, #0
	bne _0222BBEA
	bl sub_02039330
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	mov r0, #0xd2
	mov r1, #0xd
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222BC6A
_0222BBEA:
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	bl sub_02039330
	bl sub_020343E4
	mov r0, #0xd3
	mov r1, #8
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0x22
	sub r0, r0, #4
	str r1, [r5, r0]
	b _0222BC6A
_0222BC0A:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020168F4
	cmp r0, #1
	bne _0222BC38
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	bl sub_02039330
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	mov r0, #0xd2
	mov r1, #0xd
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222BC6A
_0222BC38:
	cmp r0, #2
	bne _0222BC66
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	bl sub_02039330
	bl sub_020343E4
	mov r0, #0xd3
	mov r1, #8
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0x22
	sub r0, r0, #4
	str r1, [r5, r0]
	b _0222BC6A
_0222BC66:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222BC6A:
	add r0, r5, #0
	bl ov44_0222F7BC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222BC74: .word 0x04000304
	thumb_func_end ov44_0222BBA4

	thumb_func_start ov44_0222BC78
ov44_0222BC78: ; 0x0222BC78
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02034DB8
	cmp r0, #0
	beq _0222BC88
	b _0222BE22
_0222BC88:
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov44_02231BB0
	cmp r0, #1
	bne _0222BCCE
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov44_02231B4C
	mov r2, #0
	ldr r0, _0222BE28 ; =0x00000A88
	add r3, r5, #0
	add r1, r2, #0
_0222BCB8:
	add r2, r2, #1
	str r1, [r3, r0]
	add r3, r3, #4
	cmp r2, #0x21
	blt _0222BCB8
	mov r0, #0x35
	bl sub_0200B2E0
	mov r0, #0x35
	bl sub_0200B2E8
_0222BCCE:
	add r0, r5, #0
	bl ov44_0222F98C
	cmp r0, #1
	bne _0222BCDE
	add r0, r5, #0
	bl ov44_0222FA28
_0222BCDE:
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r5, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222BD02
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
_0222BD02:
	mov r0, #0x2e
	lsl r0, r0, #4
	add r0, r5, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222BD1A
	mov r0, #0x2e
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
_0222BD1A:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r0, #0x58
	mov r1, #0x35
	bl NARC_ctor
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov44_0222AEC0
	add r0, r6, #0
	bl NARC_dtor
	ldr r0, _0222BE2C ; =0x00000D6C
	mov r1, #1
	str r1, [r5, r0]
	ldr r0, _0222BE30 ; =gSystem + 0x60
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r1, #0
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r1, #0
	add r3, r1, #0
	bl BgSetPosTextAndCommit
	mov r0, #0x57
	lsl r0, r0, #2
	mov r1, #0
	ldr r0, [r5, r0]
	mov r2, #3
	add r3, r1, #0
	bl BgSetPosTextAndCommit
	ldr r0, _0222BE34 ; =0x000010BC
	mov r1, #1
	strh r1, [r5, r0]
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222BDAC
	mov r0, #0x31
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0x15
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl DestroyListMenu
	mov r0, #0x15
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	sub r0, r0, #4
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	mov r0, #0x53
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222BDAC:
	add r0, r5, #0
	add r0, #0xc
	mov r1, #0
	mov r2, #0x20
	bl MI_CpuFill8
	add r0, r5, #0
	add r0, #0x2c
	mov r1, #0
	mov r2, #0x20
	bl MI_CpuFill8
	add r0, r5, #0
	add r0, #0x4c
	mov r1, #0
	mov r2, #0x80
	bl MI_CpuFill8
	add r0, r5, #0
	add r0, #0xcc
	mov r1, #0
	mov r2, #0x80
	bl MI_CpuFill8
	add r0, r5, #0
	bl ov44_0222B0B0
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, _0222BE38 ; =0x000004A4
	bl sub_020396FC
	str r0, [r5, #4]
	add r0, r5, #0
	mov r1, #0x17
	mov r2, #1
	bl ov44_0222F510
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222BE08
	bl GF_AssertFail
_0222BE08:
	mov r1, #0x2d
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0xee
	bl sub_0200F0AC
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xd2
	mov r1, #0xe
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222BE22:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_0222BE28: .word 0x00000A88
_0222BE2C: .word 0x00000D6C
_0222BE30: .word gSystem + 0x60
_0222BE34: .word 0x000010BC
_0222BE38: .word 0x000004A4
	thumb_func_end ov44_0222BC78

	thumb_func_start ov44_0222BE3C
ov44_0222BE3C: ; 0x0222BE3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222BE58
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222BE58:
	bl ov00_021E7314
	cmp r0, #0
	beq _0222BE92
	mov r0, #0xd2
	mov r1, #0x45
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	mov r1, #0x1e
	mov r2, #1
	bl ov44_0222F510
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222BE80
	bl GF_AssertFail
_0222BE80:
	mov r1, #0x2d
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0xee
	bl sub_0200F0AC
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r5, r1]
_0222BE92:
	bl sub_02039274
	cmp r0, #0
	beq _0222BEC6
	mov r0, #0xda
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0222BEAC
	mov r1, #0x10
	sub r0, #0x20
	str r1, [r5, r0]
	b _0222BEDC
_0222BEAC:
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222B778
	add r0, r5, #0
	bl ov44_0222B870
	bl ov44_0222ADD0
	mov r1, #0xd2
	lsl r1, r1, #2
	str r0, [r5, r1]
	b _0222BEDC
_0222BEC6:
	bl sub_020393C8
	cmp r0, #0
	bne _0222BED6
	bl sub_020390C4
	cmp r0, #3
	bne _0222BEDC
_0222BED6:
	add r0, r5, #0
	bl ov44_0222B9A0
_0222BEDC:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222BE3C

	thumb_func_start ov44_0222BEE0
ov44_0222BEE0: ; 0x0222BEE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222BEFC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222BEFC:
	bl ov00_021E7314
	cmp r0, #0
	beq _0222BF1C
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl Save_PrepareForAsyncWrite
	mov r0, #0xd2
	mov r1, #0x47
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222BF1C:
	bl sub_02039274
	cmp r0, #0
	beq _0222BF50
	mov r0, #0xda
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0222BF36
	mov r1, #0x10
	sub r0, #0x20
	str r1, [r5, r0]
	b _0222BF66
_0222BF36:
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222B778
	add r0, r5, #0
	bl ov44_0222B870
	bl ov44_0222ADD0
	mov r1, #0xd2
	lsl r1, r1, #2
	str r0, [r5, r1]
	b _0222BF66
_0222BF50:
	bl sub_020393C8
	cmp r0, #0
	bne _0222BF60
	bl sub_020390C4
	cmp r0, #3
	bne _0222BF66
_0222BF60:
	add r0, r5, #0
	bl ov44_0222B9A0
_0222BF66:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_0222BEE0

	thumb_func_start ov44_0222BF6C
ov44_0222BF6C: ; 0x0222BF6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov00_021E7314
	cmp r0, #0
	beq _0222BFA0
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl Save_WriteFileAsync
	cmp r0, #0
	beq _0222BF9C
	cmp r0, #1
	beq _0222BF9C
	bl ov00_021E7328
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl Save_ClearStatusFlags
	b _0222BFA0
_0222BF9C:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222BFA0:
	bl sub_02039274
	cmp r0, #0
	beq _0222BFD4
	mov r0, #0xda
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0222BFBA
	mov r1, #0x10
	sub r0, #0x20
	str r1, [r5, r0]
	b _0222BFEA
_0222BFBA:
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222B778
	add r0, r5, #0
	bl ov44_0222B870
	bl ov44_0222ADD0
	mov r1, #0xd2
	lsl r1, r1, #2
	str r0, [r5, r1]
	b _0222BFEA
_0222BFD4:
	bl sub_020393C8
	cmp r0, #0
	bne _0222BFE4
	bl sub_020390C4
	cmp r0, #3
	bne _0222BFEA
_0222BFE4:
	add r0, r5, #0
	bl ov44_0222B9A0
_0222BFEA:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_0222BF6C

	thumb_func_start ov44_0222BFF0
ov44_0222BFF0: ; 0x0222BFF0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xd7
	lsl r0, r0, #2
	add r4, r1, #0
	ldr r1, [r5, r0]
	cmp r1, #0
	ble _0222C008
	sub r1, r1, #1
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222C008:
	bl sub_020392A0
	cmp r0, #0
	beq _0222C01C
	bl ov44_0222ADD0
	mov r1, #0xd2
	lsl r1, r1, #2
	str r0, [r5, r1]
	b _0222C05C
_0222C01C:
	bl sub_020393C8
	cmp r0, #0
	bne _0222C02C
	bl sub_020390C4
	cmp r0, #3
	bne _0222C034
_0222C02C:
	add r0, r5, #0
	bl ov44_0222B9A0
	b _0222C05C
_0222C034:
	bl sub_020390C4
	cmp r0, #4
	bge _0222C04E
	bl sub_02039264
	cmp r0, #0
	bne _0222C04E
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	bne _0222C05C
_0222C04E:
	bl sub_02039358
	bl ov44_0222ADD0
	mov r1, #0xd2
	lsl r1, r1, #2
	str r0, [r5, r1]
_0222C05C:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222BFF0

	thumb_func_start ov44_0222C060
ov44_0222C060: ; 0x0222C060
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov44_0222F7BC
	add r0, r5, #0
	mov r1, #0x13
	bl ov44_0222F66C
	mov r0, #0xd2
	mov r1, #0x11
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0
	add r0, #0x20
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222C060

	thumb_func_start ov44_0222C084
ov44_0222C084: ; 0x0222C084
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0222C11C ; =gSystem
	add r4, r1, #0
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0222C09C
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222C118
_0222C09C:
	mov r1, #0xd5
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	cmp r0, #1
	bne _0222C0BA
	add r0, r1, #0
	mov r2, #0xa
	sub r0, #8
	str r2, [r5, r0]
	mov r0, #0x22
	sub r1, #0xc
	str r0, [r5, r1]
	bl sub_02039330
	b _0222C118
_0222C0BA:
	ldr r0, [r5]
	bl sub_0202C2F8
	cmp r0, #0
	bne _0222C0DE
	add r0, r5, #0
	mov r1, #0x1a
	mov r2, #1
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x3b
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #1
	add r0, #0x14
	str r1, [r5, r0]
	b _0222C118
_0222C0DE:
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222B778
	add r0, r5, #0
	bl ov44_0222B870
	bl ov44_0222ADD0
	mov r1, #0xd2
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0x48
	add r0, r5, r1
	bl WindowIsInUse
	cmp r0, #0
	beq _0222C118
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	bl RemoveWindow
_0222C118:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222C11C: .word gSystem
	thumb_func_end ov44_0222C084

	thumb_func_start ov44_0222C120
ov44_0222C120: ; 0x0222C120
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0x35
	add r6, r0, #0
	bl PlayerProfile_GetPlayerName_NewString
	add r4, r0, #0
	mov r0, #0x2e
	lsl r0, r0, #4
	add r0, r5, r0
	bl WindowIsInUse
	cmp r0, #0
	bne _0222C152
	add r0, r4, #0
	bl String_dtor
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
_0222C152:
	mov r0, #0x2e
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #0
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _0222C16C
	ldr r0, _0222C280 ; =0x00050600
	b _0222C170
_0222C16C:
	mov r0, #0xc1
	lsl r0, r0, #0xa
_0222C170:
	str r0, [sp, #0x10]
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	add r2, r4, #0
	str r0, [sp, #8]
	mov r0, #0x2e
	lsl r0, r0, #4
	add r0, r5, r0
	mov r3, #0x20
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	ldr r1, [r5, #4]
	add r0, r5, #0
	bl ov44_02229F00
	add r1, sp, #0x10
	add r4, r0, #0
	bl ov44_0223120C
	add r6, r0, #0
	cmp r4, #1
	bne _0222C204
	bl ov00_021E6EBC
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0222C1C8
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	b _0222C214
_0222C1C8:
	bl ov00_021E6EBC
	add r1, r0, #0
	ldr r0, [r5]
	mov r2, #8
	bl sub_0202C090
	cmp r0, #0
	bne _0222C1E0
	ldr r0, _0222C280 ; =0x00050600
	str r0, [sp, #0x10]
	b _0222C1EA
_0222C1E0:
	cmp r0, #1
	bne _0222C1EA
	mov r0, #0xc1
	lsl r0, r0, #0xa
	str r0, [sp, #0x10]
_0222C1EA:
	bl ov00_021E6EBC
	add r1, r0, #0
	ldr r0, [r5]
	bl sub_0202C254
	add r1, r0, #0
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl CopyU16ArrayToString
	b _0222C214
_0222C204:
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	add r1, r6, #0
	bl ReadMsgDataIntoString
_0222C214:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	mov r2, #0x2e
	str r0, [sp, #8]
	lsl r2, r2, #4
	add r0, r5, r2
	str r1, [sp, #0xc]
	lsr r2, r2, #1
	ldr r2, [r5, r2]
	mov r3, #0x66
	bl AddTextPrinterParameterized2
	mov r2, #1
	str r2, [sp]
	mov r0, #0x57
	ldr r1, _0222C284 ; =0x00000B0C
	str r4, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r3, #2
	bl ov44_0222AC54
	ldr r0, [r5, #4]
	add r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222C256
	mov r0, #8
	b _0222C258
_0222C256:
	mov r0, #1
_0222C258:
	mov r2, #1
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r1, _0222C284 ; =0x00000B0C
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r3, #0x1a
	bl ov44_0222ABDC
	mov r0, #0x2e
	lsl r0, r0, #4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222C280: .word 0x00050600
_0222C284: .word 0x00000B0C
	thumb_func_end ov44_0222C120

	thumb_func_start ov44_0222C288
ov44_0222C288: ; 0x0222C288
	push {r3, lr}
	cmp r2, #0
	bne _0222C294
	ldr r0, _0222C298 ; =0x000005DC
	bl PlaySE
_0222C294:
	pop {r3, pc}
	nop
_0222C298: .word 0x000005DC
	thumb_func_end ov44_0222C288

	thumb_func_start ov44_0222C29C
ov44_0222C29C: ; 0x0222C29C
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0x2e
	lsl r0, r0, #4
	add r0, r4, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222C2BA
	mov r0, #0x2e
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
_0222C2BA:
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r4, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222C2DE
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
_0222C2DE:
	mov r3, #1
	str r3, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _0222C350 ; =0x00000192
	mov r1, #0x2e
	str r0, [sp, #0x10]
	sub r0, #0x36
	lsl r1, r1, #4
	ldr r0, [r4, r0]
	add r1, r4, r1
	mov r2, #3
	bl AddWindowParameterized
	mov r2, #1
	mov r1, #0x2f
	lsl r1, r1, #4
	str r2, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _0222C354 ; =0x000001A1
	add r1, r4, r1
	str r0, [sp, #0x10]
	sub r0, #0x45
	ldr r0, [r4, r0]
	add r3, r2, #0
	bl AddWindowParameterized
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x2f
	lsl r0, r0, #4
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r2, _0222C358 ; =0x000001D9
	add r0, r4, r0
	mov r1, #0
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_0222C350: .word 0x00000192
_0222C354: .word 0x000001A1
_0222C358: .word 0x000001D9
	thumb_func_end ov44_0222C29C

	thumb_func_start ov44_0222C35C
ov44_0222C35C: ; 0x0222C35C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r7, r1, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _0222C372
	add sp, #0xc
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_0222C372:
	bl sub_020393C8
	cmp r0, #0
	bne _0222C388
	bl sub_020392A0
	cmp r0, #0
	bne _0222C388
	add sp, #0xc
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_0222C388:
	ldr r0, _0222C4D8 ; =sub_02078D24
	bl ov00_021E5CBC
	ldr r0, _0222C4DC ; =0x00000D6C
	mov r1, #0
	str r1, [r5, r0]
	mov r0, #0x58
	mov r1, #0x35
	bl NARC_ctor
	add r6, r0, #0
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r1, _0222C4E0 ; =0x00000B0C
	ldr r0, [r5, r0]
	add r1, r5, r1
	add r2, r6, #0
	mov r3, #0x35
	bl ov44_0222AB24
	add r0, r5, #0
	bl ov44_0222F8F0
	add r0, r5, #0
	bl ov44_0222F7BC
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222C402
	mov r0, #0x31
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0x15
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl DestroyListMenu
	mov r0, #0x15
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	sub r0, r0, #4
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	mov r0, #0x53
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222C402:
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov44_02231BB0
	cmp r0, #0
	bne _0222C456
	ldr r0, [r5, #4]
	ldrb r0, [r0, #0x1e]
	cmp r0, #0
	bne _0222C41C
	mov r4, #0
	b _0222C41E
_0222C41C:
	mov r4, #0x61
_0222C41E:
	ldr r0, [r5]
	bl sub_0202C318
	ldr r1, _0222C4E4 ; =0x000010BE
	mov r3, #0x57
	strh r0, [r5, r1]
	str r4, [sp]
	ldrh r0, [r5, r1]
	lsl r3, r3, #2
	mov r1, #0x35
	str r0, [sp, #4]
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r3, [r5, r3]
	add r0, r5, r0
	add r2, r6, #0
	bl ov44_02231A7C
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	bl ov44_02231D9C
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222AA94
_0222C456:
	add r0, r5, #0
	bl ov44_0222F98C
	cmp r0, #0
	bne _0222C46A
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x35
	bl ov44_0222F9A0
_0222C46A:
	add r0, r5, #0
	mov r1, #0x35
	bl ov44_02230060
	add r0, r5, #0
	bl ov44_0222F7BC
	add r0, r5, #0
	bl ov44_0222B870
	add r0, r5, #0
	bl ov44_0222C29C
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	bl sub_02039B58
	mov r1, #0
	mov r0, #0x37
	mvn r1, r1
	lsl r0, r0, #4
	str r1, [r5, r0]
	add r0, r6, #0
	bl NARC_dtor
	ldr r0, _0222C4E8 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x35
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0
	add r1, r0, #0
	bl sub_020398D4
	add r0, r7, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0222C4D8: .word sub_02078D24
_0222C4DC: .word 0x00000D6C
_0222C4E0: .word 0x00000B0C
_0222C4E4: .word 0x000010BE
_0222C4E8: .word gSystem + 0x60
	thumb_func_end ov44_0222C35C

	thumb_func_start ov44_0222C4EC
ov44_0222C4EC: ; 0x0222C4EC
	push {r3, lr}
	bl sub_020390C4
	cmp r0, #1
	bne _0222C4FA
	mov r0, #1
	pop {r3, pc}
_0222C4FA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov44_0222C4EC

	thumb_func_start ov44_0222C500
ov44_0222C500: ; 0x0222C500
	push {r4, lr}
	add r4, r0, #0
	bl ov00_021E709C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222C51E
	ldr r0, [r4, #4]
	add r0, #0x21
	ldrb r0, [r0]
	bl ov00_021E70B8
	mov r0, #1
	pop {r4, pc}
_0222C51E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_0222C500

	thumb_func_start ov44_0222C524
ov44_0222C524: ; 0x0222C524
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	bl ov44_0222B870
	str r0, [sp, #8]
	mov r0, #0
	add r1, r5, #0
	str r0, [sp, #4]
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xc
	add r1, #0x2c
	mov r2, #0x20
	bl memcmp
	cmp r0, #0
	bne _0222C54A
	b _0222C64C
_0222C54A:
	mov r4, #0
_0222C54C:
	add r7, r5, r4
	add r1, r7, #0
	add r1, #0x2c
	ldrb r1, [r1]
	mov r2, #0
	add r0, r2, #0
_0222C558:
	add r3, r5, r0
	ldrb r3, [r3, #0xc]
	cmp r3, r1
	bne _0222C564
	mov r2, #1
	b _0222C56A
_0222C564:
	add r0, r0, #1
	cmp r0, #0x20
	blt _0222C558
_0222C56A:
	cmp r2, #0
	bne _0222C5AE
	cmp r1, #0
	beq _0222C5AE
	add r0, r5, #0
	bl ov44_0222AAEC
	add r6, r0, #0
	beq _0222C5AE
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r6, #0
	bl ov44_02231E94
	add r0, r5, #0
	add r1, r6, #0
	bl ov44_0222AAC0
	add r1, r5, r4
	add r1, #0x2c
	ldrb r1, [r1]
	add r0, r5, #0
	bl ov44_02230028
	add r1, r5, r4
	add r1, #0x2c
	ldrb r1, [r1]
	add r0, r5, #0
	mov r2, #0x35
	bl ov44_0222F970
	mov r0, #1
	str r0, [sp]
_0222C5AE:
	ldrb r0, [r7, #0xc]
	mov r1, #0
	add r2, r1, #0
_0222C5B4:
	add r3, r5, r2
	add r3, #0x2c
	ldrb r3, [r3]
	cmp r0, r3
	bne _0222C5C2
	mov r1, #1
	b _0222C5C8
_0222C5C2:
	add r2, r2, #1
	cmp r2, #0x20
	blt _0222C5B4
_0222C5C8:
	cmp r1, #0
	bne _0222C618
	ldrb r1, [r7, #0xc]
	cmp r1, #0
	beq _0222C618
	add r0, r5, #0
	sub r1, r1, #1
	bl ov44_02231958
	add r1, r0, #0
	add r6, r5, r4
	mov r0, #0xe3
	lsl r0, r0, #2
	ldrb r1, [r1, #0x1d]
	ldrb r2, [r6, #0xc]
	add r0, r5, r0
	bl ov44_02231E08
	str r0, [sp, #0xc]
	cmp r0, #0
	beq _0222C60A
	ldrb r1, [r7, #0xc]
	add r0, r5, #0
	mov r2, #2
	bl ov44_0222FFF4
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl ov44_0222AA94
	mov r0, #1
	str r0, [sp, #4]
	b _0222C618
_0222C60A:
	ldrb r1, [r6, #0xc]
	add r0, r5, #0
	mov r2, #1
	bl ov44_0222FFF4
	mov r0, #0
	strb r0, [r6, #0xc]
_0222C618:
	add r4, r4, #1
	cmp r4, #0x20
	blt _0222C54C
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x2c
	add r1, #0xc
	mov r2, #0x20
	bl memcpy
	add r0, r5, #0
	bl ov44_02230080
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _0222C640
	ldr r0, _0222C654 ; =0x0000064E
	bl PlaySE
	b _0222C64C
_0222C640:
	ldr r0, [sp]
	cmp r0, #1
	bne _0222C64C
	ldr r0, _0222C654 ; =0x0000064E
	bl PlaySE
_0222C64C:
	ldr r0, [sp, #8]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222C654: .word 0x0000064E
	thumb_func_end ov44_0222C524

	thumb_func_start ov44_0222C658
ov44_0222C658: ; 0x0222C658
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov44_0222B8E0
	cmp r0, #0
	ble _0222C66E
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_02230060
_0222C66E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222C658

	thumb_func_start ov44_0222C670
ov44_0222C670: ; 0x0222C670
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov44_0222C524
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_0222C658
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222C670

	thumb_func_start ov44_0222C684
ov44_0222C684: ; 0x0222C684
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	mov r7, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _0222C698
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C698:
	bl sub_020393C8
	cmp r0, #0
	beq _0222C6AA
	add r0, r4, #0
	bl ov44_0222B9A0
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C6AA:
	bl sub_020390C4
	cmp r0, #4
	bne _0222C6E0
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r4, #0
	bl ov44_0222F780
	add r0, r4, #0
	mov r1, #0x12
	add r2, r7, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0x10
	bl ov44_0222F818
	bl sub_02039358
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C6E0:
	add r0, r4, #0
	mov r1, #0x35
	bl ov44_0222C670
	add r0, r4, #0
	bl ov44_0222FBA0
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov44_02232008
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov44_02231D98
	cmp r0, #0
	bne _0222C79A
	bl ov00_021E709C
	sub r1, r7, #1
	cmp r0, r1
	bne _0222C75C
	ldr r0, _0222C9A0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	lsl r0, r0, #0xa
	tst r0, r1
	beq _0222C75C
	add r0, r4, #0
	bl ov44_0222F8C0
	cmp r0, #0
	beq _0222C732
	add r0, r4, #0
	mov r1, #0x5a
	add r2, r7, #0
	bl ov44_0222F510
	b _0222C73C
_0222C732:
	add r0, r4, #0
	mov r1, #0x5b
	add r2, r7, #0
	bl ov44_0222F510
_0222C73C:
	ldr r0, _0222C9A4 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	bl ov44_0222C120
	mov r0, #0xd2
	mov r1, #0x14
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0x35
	bl ov44_0222F950
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C75C:
	add r0, r4, #0
	mov r1, #0x35
	bl ov44_0222FA80
	add r6, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov44_0222AAEC
	add r1, r0, #0
	cmp r6, #0
	beq _0222C790
	cmp r1, #0
	beq _0222C784
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov44_02231D48
	b _0222C79A
_0222C784:
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov44_02231D8C
	b _0222C79A
_0222C790:
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov44_02231D8C
_0222C79A:
	add r0, r4, #0
	bl ov44_0222C4EC
	cmp r0, #0
	beq _0222C7C4
	mov r0, #0x37
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0222C7C4
	ldr r0, _0222C9A8 ; =0x00000623
	bl PlaySE
	mov r0, #0xd2
	mov r1, #0x30
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C7C4:
	mov r0, #0x37
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _0222C80E
	bl ov00_021E709C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222C80E
	bl ov00_021E709C
	mov r1, #0x37
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov44_0222F780
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl ov44_0222F510
	ldr r0, [r4, #4]
	add r0, #0x21
	ldrb r0, [r0]
	bl ov00_021E70B8
	mov r0, #0xd1
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0222C854
_0222C80E:
	mov r0, #0x37
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0222C854
	bl ov00_021E709C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0222C854
	mov r0, #0
	bl ov00_021E70B8
	mov r1, #0x37
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov44_0222F780
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0
	bl ov44_0222F510
	bl sub_02039358
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C854:
	bl ov00_021E7080
	cmp r0, #1
	bne _0222C86E
	bl ov00_021E709C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0222C86E
	mov r0, #0
	bl ov00_021E70B8
_0222C86E:
	ldr r1, [r4, #4]
	add r0, r4, #0
	bl ov44_02229F00
	mov r1, #0x37
	lsl r1, r1, #4
	ldr r2, [r4, r1]
	mov r1, #0
	mvn r1, r1
	add r6, r0, #0
	cmp r2, r1
	bne _0222C8C8
	ldr r1, _0222C9A0 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #2
	tst r1, r2
	beq _0222C8B2
	bl ov44_02229FDC
	cmp r0, #0
	beq _0222C8B2
	ldr r0, _0222C9A4 ; =0x000005DD
	bl PlaySE
	mov r0, #0xd2
	mov r1, #0x27
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0x35
	bl ov44_0222F950
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C8B2:
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov44_02231BB4
	add r7, r0, #0
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov44_02232018
_0222C8C8:
	cmp r7, #3
	bhi _0222C998
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222C8D8: ; jump table
	.short _0222C8E0 - _0222C8D8 - 2 ; case 0
	.short _0222C8E4 - _0222C8D8 - 2 ; case 1
	.short _0222C970 - _0222C8D8 - 2 ; case 2
	.short _0222C922 - _0222C8D8 - 2 ; case 3
_0222C8E0:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C8E4:
	ldr r0, _0222C9A4 ; =0x000005DD
	bl PlaySE
	add r0, r6, #0
	bl ov44_02229FDC
	cmp r0, #0
	beq _0222C8FE
	mov r0, #0xd2
	mov r1, #0x27
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0222C916
_0222C8FE:
	mov r0, #0xd3
	mov r1, #8
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0x39
	sub r0, r0, #4
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0x19
	mov r2, #1
	bl ov44_0222F510
_0222C916:
	add r0, r4, #0
	mov r1, #0x35
	bl ov44_0222F950
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C922:
	ldr r0, _0222C9A4 ; =0x000005DD
	bl PlaySE
	add r0, r6, #0
	bl ov44_02229FDC
	cmp r0, #0
	beq _0222C946
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov44_02231FCC
	mov r0, #0xd2
	mov r1, #0x27
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0222C964
_0222C946:
	cmp r6, #0x10
	bne _0222C964
	bl sub_020392A0
	cmp r0, #1
	bne _0222C964
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov44_02231FCC
	mov r0, #0xd2
	mov r1, #0x24
	lsl r0, r0, #2
	str r1, [r4, r0]
_0222C964:
	add r0, r4, #0
	mov r1, #0x35
	bl ov44_0222F950
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C970:
	ldr r0, _0222C9A4 ; =0x000005DD
	bl PlaySE
	add r0, r6, #0
	bl ov44_02229FDC
	cmp r0, #0
	beq _0222C984
	mov r1, #0x27
	b _0222C986
_0222C984:
	mov r1, #0x2a
_0222C986:
	mov r0, #0xd2
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0x35
	bl ov44_0222F950
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C998:
	bl GF_AssertFail
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C9A0: .word gSystem
_0222C9A4: .word 0x000005DD
_0222C9A8: .word 0x00000623
	thumb_func_end ov44_0222C684

	thumb_func_start ov44_0222C9AC
ov44_0222C9AC: ; 0x0222C9AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222C9CA
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov44_022319EC
	b _0222C9F0
_0222C9CA:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222C9F0
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov44_022319EC
	add r0, r5, #0
	bl ov44_0222F7BC
_0222C9F0:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222C9AC

	thumb_func_start ov44_0222C9F4
ov44_0222C9F4: ; 0x0222C9F4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	ldr r1, _0222CB30 ; =0x00000382
	add r5, r0, #0
	ldrh r1, [r5, r1]
	sub r1, r1, #1
	bl ov44_02231958
	add r1, r0, #0
	add r0, #0x21
	ldrb r4, [r0]
	add r0, r5, #0
	bl ov44_02229F00
	add r6, r0, #0
	mov r0, #0xd
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	sub r1, r1, #1
	str r1, [r5, r0]
	ldr r1, [r5, r0]
	cmp r1, #0
	bge _0222CA2A
	mov r1, #0x46
	add r0, #8
	str r1, [r5, r0]
	b _0222CB2C
_0222CA2A:
	bl sub_020390C4
	cmp r0, #5
	bne _0222CA52
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0xf
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222CB2C
_0222CA52:
	bl sub_020390C4
	cmp r0, #3
	bne _0222CA7A
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222CB2C
_0222CA7A:
	bl sub_020390C4
	cmp r0, #4
	beq _0222CA8A
	bl sub_02039264
	cmp r0, #0
	beq _0222CAAA
_0222CA8A:
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222CB2C
_0222CAAA:
	bl sub_020393C8
	cmp r0, #0
	beq _0222CABA
	add r0, r5, #0
	bl ov44_0222B9A0
	b _0222CB2C
_0222CABA:
	cmp r4, #0
	bne _0222CADE
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222CB2C
_0222CADE:
	cmp r6, #0x10
	beq _0222CB02
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222CB2C
_0222CB02:
	bl sub_020390C4
	cmp r0, #1
	bne _0222CB2C
	add r0, r5, #0
	bl ov44_0222F7BC
	add r0, r5, #0
	mov r1, #1
	bl ov44_0222F818
	mov r1, #0xd2
	mov r0, #0x18
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r1, #0x3a
	ldrh r1, [r5, r1]
	ldr r0, [r5]
	sub r1, r1, #1
	bl sub_0202C4B0
_0222CB2C:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222CB30: .word 0x00000382
	thumb_func_end ov44_0222C9F4

	thumb_func_start ov44_0222CB34
ov44_0222CB34: ; 0x0222CB34
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0xe
	mov r2, #0
	bl ov44_0222F510
	add r0, r5, #0
	mov r1, #1
	bl ov44_0222F818
	mov r0, #0xd2
	mov r1, #0x17
	lsl r0, r0, #2
	str r1, [r5, r0]
	bl ov00_021E6EBC
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222CB78
	bl ov00_021E6EBC
	add r1, r0, #0
	ldr r0, [r5]
	bl sub_0202C4B0
_0222CB78:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222CB34

	thumb_func_start ov44_0222CB7C
ov44_0222CB7C: ; 0x0222CB7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020393C8
	cmp r0, #0
	beq _0222CB94
	add r0, r5, #0
	bl ov44_0222B9A0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222CB94:
	bl ov00_021E6EBC
	cmp r0, #0
	bge _0222CBB2
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222CBB2:
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_02231958
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_02229F00
	cmp r0, #0x10
	beq _0222CBF0
	cmp r0, #1
	beq _0222CBF0
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222CBF0:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222CC2C
	ldr r0, _0222CC30 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0222CC14
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222CC24
_0222CC14:
	add r0, r5, #0
	bl ov44_0222F7BC
	mov r0, #0xd2
	mov r1, #0x18
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222CC2C
_0222CC24:
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_0222CC34
_0222CC2C:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222CC30: .word gSystem
	thumb_func_end ov44_0222CB7C

	thumb_func_start ov44_0222CC34
ov44_0222CC34: ; 0x0222CC34
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r1, #0
	bl ov00_021E6EBC
	cmp r0, #0
	bge _0222CC5C
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	add sp, #0xc
	add r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_0222CC5C:
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_02231958
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_02229F00
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x35
	bl ov44_0222C670
	add r0, r5, #0
	bl ov44_0222FBA0
	bl sub_020390C4
	cmp r0, #5
	bne _0222CCA8
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0xf
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222CD9C
_0222CCA8:
	bl sub_020390C4
	cmp r0, #3
	bne _0222CCD0
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222CD9C
_0222CCD0:
	bl sub_020390C4
	cmp r0, #4
	beq _0222CCE0
	bl sub_02039264
	cmp r0, #0
	beq _0222CD00
_0222CCE0:
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222CD9C
_0222CD00:
	bl sub_020393C8
	cmp r0, #0
	beq _0222CD10
	add r0, r5, #0
	bl ov44_0222B9A0
	b _0222CD9C
_0222CD10:
	cmp r4, #0x10
	beq _0222CD38
	cmp r4, #1
	beq _0222CD38
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222CD9C
_0222CD38:
	ldr r0, _0222CDA4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0222CD4A
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222CD5E
_0222CD4A:
	add r0, r5, #0
	mov r1, #0x14
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x19
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222CD9C
_0222CD5E:
	bl ov00_021E7078
	cmp r0, #0
	ldr r1, _0222CDA8 ; =0x00000B0C
	beq _0222CD82
	mov r2, #1
	str r2, [sp]
	mov r3, #2
	str r3, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r5, r1
	bl ov44_0222ABDC
	b _0222CD9C
_0222CD82:
	mov r2, #1
	str r2, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r3, #2
	bl ov44_0222ABDC
_0222CD9C:
	add r0, r6, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0222CDA4: .word gSystem
_0222CDA8: .word 0x00000B0C
	thumb_func_end ov44_0222CC34

	thumb_func_start ov44_0222CDAC
ov44_0222CDAC: ; 0x0222CDAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020393C8
	cmp r0, #0
	beq _0222CDC4
	add r0, r5, #0
	bl ov44_0222B9A0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222CDC4:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222CE30
	bl ov00_021E6EBC
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222CDEE
	bl ov00_021E6EBC
	add r1, r0, #0
	ldr r0, [r5]
	bl sub_0202C4B0
_0222CDEE:
	ldr r0, _0222CE34 ; =0x04000304
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222CE14
	mov r2, #0x57
	mov r0, #0x35
	lsl r2, r2, #2
	str r0, [sp]
	ldr r0, [r5, r2]
	ldr r1, _0222CE38 ; =ov44_0223538C
	add r2, #0x7d
	mov r3, #0xb
	bl Std_CreateYesNoMenu
	mov r1, #0x61
	b _0222CE24
_0222CE14:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222CE3C ; =ov44_02235374
	mov r2, #0
	bl ov44_02231A14
	mov r1, #0x62
_0222CE24:
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xd2
	mov r1, #0x1a
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222CE30:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222CE34: .word 0x04000304
_0222CE38: .word ov44_0223538C
_0222CE3C: .word ov44_02235374
	thumb_func_end ov44_0222CDAC

	thumb_func_start ov44_0222CE40
ov44_0222CE40: ; 0x0222CE40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0222CFDC ; =0x04000304
	add r4, r1, #0
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222CF0C
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x35
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0222CEC8
	bl sub_020390C4
	cmp r0, #4
	bge _0222CE82
	bl sub_02039264
	cmp r0, #0
	bne _0222CE82
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	bne _0222CEB6
_0222CE82:
	add r0, r5, #0
	bl ov44_0222F7BC
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x35
	bl Clear2dMenuWindowAndDelete
	mov r0, #0
	mov r1, #0x37
	mvn r0, r0
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	mov r2, #0x14
	sub r0, #0x14
	str r2, [r5, r0]
	mov r0, #0x41
	sub r1, #0x28
	str r0, [r5, r1]
	b _0222CEC4
_0222CEB6:
	bl sub_020393C8
	cmp r0, #0
	beq _0222CEC4
	add r0, r5, #0
	bl ov44_0222B9A0
_0222CEC4:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222CEC8:
	cmp r0, #0
	bne _0222CF02
	bl sub_020393C8
	cmp r0, #0
	bne _0222CEFA
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	bl sub_020393B4
	mov r0, #0
	mov r1, #0x37
	mvn r0, r0
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	mov r2, #0x14
	sub r0, #0x14
	str r2, [r5, r0]
	mov r0, #0x41
	sub r1, #0x28
	str r0, [r5, r1]
	b _0222CFD0
_0222CEFA:
	add r0, r5, #0
	bl ov44_0222B9A0
	b _0222CFD0
_0222CF02:
	mov r0, #0xd2
	mov r1, #0x18
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222CFD0
_0222CF0C:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020168F4
	cmp r0, #1
	bne _0222CF5A
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	bl sub_020393C8
	cmp r0, #0
	bne _0222CF52
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	bl sub_020393B4
	mov r0, #0
	mov r1, #0x37
	mvn r0, r0
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	mov r2, #0x14
	sub r0, #0x14
	str r2, [r5, r0]
	mov r0, #0x41
	sub r1, #0x28
	str r0, [r5, r1]
	b _0222CFD0
_0222CF52:
	add r0, r5, #0
	bl ov44_0222B9A0
	b _0222CFD0
_0222CF5A:
	cmp r0, #2
	bne _0222CF72
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	mov r0, #0xd2
	mov r1, #0x18
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222CFD0
_0222CF72:
	bl sub_020390C4
	cmp r0, #4
	bge _0222CF8C
	bl sub_02039264
	cmp r0, #0
	bne _0222CF8C
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	bne _0222CFBE
_0222CF8C:
	add r0, r5, #0
	bl ov44_0222F7BC
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	mov r0, #0
	mov r1, #0x37
	mvn r0, r0
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	mov r2, #0x14
	sub r0, #0x14
	str r2, [r5, r0]
	mov r0, #0x41
	sub r1, #0x28
	str r0, [r5, r1]
	b _0222CFCC
_0222CFBE:
	bl sub_020393C8
	cmp r0, #0
	beq _0222CFCC
	add r0, r5, #0
	bl ov44_0222B9A0
_0222CFCC:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222CFD0:
	add r0, r5, #0
	bl ov44_0222F7BC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0222CFDC: .word 0x04000304
	thumb_func_end ov44_0222CE40

	thumb_func_start ov44_0222CFE0
ov44_0222CFE0: ; 0x0222CFE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020393C8
	cmp r0, #0
	beq _0222CFF8
	add r0, r5, #0
	bl ov44_0222B9A0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222CFF8:
	ldr r1, [r5, #4]
	add r0, r5, #0
	bl ov44_02229F00
	cmp r0, #0x10
	beq _0222D00C
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
_0222D00C:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222D02A
	mov r0, #0xd7
	mov r1, #0x1e
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222D02A:
	mov r0, #0xd7
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	sub r1, r1, #1
	str r1, [r5, r0]
	ldr r1, _0222D0A0 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #3
	tst r1, r2
	bne _0222D04C
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222D04C
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222D09A
_0222D04C:
	add r0, r5, #0
	bl ov44_0222F7BC
	bl sub_02039358
	bl sub_02039B58
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov44_02231BB0
	cmp r0, #0
	bne _0222D078
	mov r0, #0xd7
	mov r1, #0x14
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0x41
	sub r0, #0x14
	str r1, [r5, r0]
	b _0222D09A
_0222D078:
	add r0, r5, #0
	bl ov44_0222F8F0
	add r0, r5, #0
	bl ov44_0222C120
	mov r1, #0
	mov r0, #0x37
	mvn r1, r1
	lsl r0, r0, #4
	str r1, [r5, r0]
	mov r1, #0x13
	sub r0, #0x28
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov44_022319EC
_0222D09A:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0222D0A0: .word gSystem
	thumb_func_end ov44_0222CFE0

	thumb_func_start ov44_0222D0A4
ov44_0222D0A4: ; 0x0222D0A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020393C8
	cmp r0, #0
	beq _0222D0BC
	add r0, r5, #0
	bl ov44_0222B9A0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222D0BC:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222D0D2
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222D0D2:
	ldr r0, _0222D108 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0222D0E4
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222D104
_0222D0E4:
	add r0, r5, #0
	bl ov44_0222F7BC
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	bl sub_02039358
	mov r0, #0xd7
	mov r1, #0x14
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0x41
	sub r0, #0x14
	str r1, [r5, r0]
_0222D104:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222D108: .word gSystem
	thumb_func_end ov44_0222D0A4

	thumb_func_start ov44_0222D10C
ov44_0222D10C: ; 0x0222D10C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020393C8
	cmp r0, #0
	beq _0222D124
	add r0, r5, #0
	bl ov44_0222B9A0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222D124:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222D142
	mov r0, #0xd7
	mov r1, #0x1e
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222D142:
	mov r0, #0xd7
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	sub r1, r1, #1
	str r1, [r5, r0]
	ldr r1, _0222D1B8 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #3
	tst r1, r2
	bne _0222D164
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222D164
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222D1B2
_0222D164:
	add r0, r5, #0
	bl ov44_0222F7BC
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	bl sub_02039B58
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov44_02231BB0
	cmp r0, #0
	bne _0222D190
	bl ov44_0222ADD0
	mov r1, #0xd2
	lsl r1, r1, #2
	str r0, [r5, r1]
	b _0222D1B2
_0222D190:
	add r0, r5, #0
	bl ov44_0222F8F0
	add r0, r5, #0
	bl ov44_0222C120
	mov r1, #0
	mov r0, #0x37
	mvn r1, r1
	lsl r0, r0, #4
	str r1, [r5, r0]
	mov r1, #0x13
	sub r0, #0x28
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov44_022319EC
_0222D1B2:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0222D1B8: .word gSystem
	thumb_func_end ov44_0222D10C

	thumb_func_start ov44_0222D1BC
ov44_0222D1BC: ; 0x0222D1BC
	add r0, r1, #0
	bx lr
	thumb_func_end ov44_0222D1BC

	thumb_func_start ov44_0222D1C0
ov44_0222D1C0: ; 0x0222D1C0
	add r0, r1, #0
	bx lr
	thumb_func_end ov44_0222D1C0

	thumb_func_start ov44_0222D1C4
ov44_0222D1C4: ; 0x0222D1C4
	add r0, r1, #0
	bx lr
	thumb_func_end ov44_0222D1C4

	thumb_func_start ov44_0222D1C8
ov44_0222D1C8: ; 0x0222D1C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xd7
	lsl r0, r0, #2
	add r4, r1, #0
	ldr r1, [r5, r0]
	cmp r1, #0
	ble _0222D1E0
	sub r1, r1, #1
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222D1E0:
	ldr r0, _0222D210 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0222D1F2
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222D20A
_0222D1F2:
	add r0, r5, #0
	mov r1, #0x1a
	mov r2, #1
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x3b
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #1
	add r0, #0x14
	str r1, [r5, r0]
_0222D20A:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0222D210: .word gSystem
	thumb_func_end ov44_0222D1C8

	thumb_func_start ov44_0222D214
ov44_0222D214: ; 0x0222D214
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	add r4, r1, #0
	bl ov44_02232018
	add r0, r5, #0
	mov r1, #0xa
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x28
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_0222D214

	thumb_func_start ov44_0222D23C
ov44_0222D23C: ; 0x0222D23C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	add r4, r1, #0
	bl ov44_02232018
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222D2A0
	ldr r0, _0222D2A4 ; =0x04000304
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222D284
	mov r2, #0x57
	mov r0, #0x35
	lsl r2, r2, #2
	str r0, [sp]
	ldr r0, [r5, r2]
	ldr r1, _0222D2A8 ; =ov44_0223538C
	add r2, #0x7d
	mov r3, #0xb
	bl Std_CreateYesNoMenu
	mov r1, #0x61
	b _0222D294
_0222D284:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222D2AC ; =ov44_02235374
	mov r2, #0
	bl ov44_02231A14
	mov r1, #0x62
_0222D294:
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xd2
	mov r1, #0x29
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222D2A0:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222D2A4: .word 0x04000304
_0222D2A8: .word ov44_0223538C
_0222D2AC: .word ov44_02235374
	thumb_func_end ov44_0222D23C

	thumb_func_start ov44_0222D2B0
ov44_0222D2B0: ; 0x0222D2B0
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, _0222D3D8 ; =0x04000304
	add r6, r1, #0
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222D34A
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x35
	bl Handle2dMenuInput_DeleteOnFinish
	add r5, r0, #0
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov44_02232018
	mov r0, #0x37
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _0222D316
	bl ov00_021E709C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222D316
	ldr r0, [r4, #4]
	add r0, #0x21
	ldrb r0, [r0]
	bl ov00_021E70B8
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _0222D314
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x35
	bl Clear2dMenuWindowAndDelete
_0222D314:
	mov r5, #1
_0222D316:
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _0222D322
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_0222D322:
	cmp r5, #0
	bne _0222D33A
	add r0, r4, #0
	mov r1, #0x10
	bl ov44_0222F818
	bl sub_02039B58
	add r0, r4, #0
	bl ov44_022319EC
	b _0222D3CA
_0222D33A:
	add r0, r4, #0
	bl ov44_022319EC
	add r0, r4, #0
	mov r1, #1
	bl ov44_022319BC
	b _0222D3CA
_0222D34A:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020168F4
	add r5, r0, #0
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov44_02232018
	mov r0, #0x37
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _0222D386
	bl ov00_021E709C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0222D386
	ldr r0, [r4, #4]
	add r0, #0x21
	ldrb r0, [r0]
	bl ov00_021E70B8
	mov r5, #2
_0222D386:
	cmp r5, #1
	bne _0222D3A8
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02016624
	add r0, r4, #0
	mov r1, #0x10
	bl ov44_0222F818
	bl sub_02039B58
	add r0, r4, #0
	bl ov44_022319EC
	b _0222D3CA
_0222D3A8:
	cmp r5, #2
	bne _0222D3C6
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02016624
	add r0, r4, #0
	bl ov44_022319EC
	add r0, r4, #0
	mov r1, #1
	bl ov44_022319BC
	b _0222D3CA
_0222D3C6:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_0222D3CA:
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_0222D3D8: .word 0x04000304
	thumb_func_end ov44_0222D2B0

	thumb_func_start ov44_0222D3DC
ov44_0222D3DC: ; 0x0222D3DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	ldr r3, _0222D584 ; =ov44_022366FC
	add r2, sp, #0x1c
	add r5, r0, #0
	str r1, [sp, #0x14]
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r5, #0
	mov r7, #3
	ldr r4, _0222D588 ; =ov44_0223671C
	bl ov44_02229EF8
	cmp r0, #1
	bne _0222D424
	add r0, sp, #0x1c
	ldrh r1, [r0, #0x10]
	add r7, r7, #1
	ldr r2, _0222D58C ; =_02236660
	add r1, r1, #1
	strh r1, [r0, #0x10]
	ldrh r1, [r0, #0x12]
	add r1, r1, #1
	strh r1, [r0, #0x12]
	sub r0, r7, #1
	lsl r1, r0, #3
	ldmia r2!, {r0, r2}
	add r3, r4, r1
	str r0, [r4, r1]
	str r2, [r3, #4]
_0222D424:
	add r0, r5, #0
	bl ov44_02229EE0
	cmp r0, #1
	bne _0222D44E
	add r0, sp, #0x1c
	ldrh r1, [r0, #0x10]
	add r7, r7, #1
	ldr r2, _0222D58C ; =_02236660
	add r1, r1, #1
	strh r1, [r0, #0x10]
	ldrh r1, [r0, #0x12]
	add r1, r1, #1
	strh r1, [r0, #0x12]
	sub r0, r7, #1
	lsl r1, r0, #3
	ldr r0, [r2, #0x18]
	ldr r2, [r2, #0x1c]
	add r3, r4, r1
	str r0, [r4, r1]
	str r2, [r3, #4]
_0222D44E:
	add r0, r5, #0
	bl ov44_02229EFC
	cmp r0, #1
	bne _0222D478
	add r0, sp, #0x1c
	ldrh r1, [r0, #0x10]
	add r7, r7, #1
	ldr r2, _0222D58C ; =_02236660
	add r1, r1, #1
	strh r1, [r0, #0x10]
	ldrh r1, [r0, #0x12]
	add r1, r1, #1
	strh r1, [r0, #0x12]
	sub r0, r7, #1
	lsl r1, r0, #3
	ldr r0, [r2, #8]
	ldr r2, [r2, #0xc]
	add r3, r4, r1
	str r0, [r4, r1]
	str r2, [r3, #4]
_0222D478:
	add r0, sp, #0x1c
	ldrh r1, [r0, #0x10]
	ldr r2, _0222D58C ; =_02236660
	add r1, r1, #1
	strh r1, [r0, #0x10]
	ldrh r1, [r0, #0x12]
	add r1, r1, #1
	strh r1, [r0, #0x12]
	ldr r0, [r2, #0x10]
	lsl r1, r7, #3
	str r0, [r4, r1]
	add r3, r4, r1
	ldr r2, [r2, #0x14]
	add r0, r7, #1
	mov r1, #0x35
	str r2, [r3, #4]
	bl ListMenuItems_ctor
	mov r1, #0x55
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r7, #1
	mov r6, #0
	str r0, [sp, #0x18]
	cmp r0, #0
	ble _0222D4CA
_0222D4AC:
	mov r0, #0x55
	mov r1, #0x5a
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r4]
	ldr r3, [r4, #4]
	bl ListMenuItems_AppendFromMsgData
	ldr r0, [sp, #0x18]
	add r6, r6, #1
	add r4, #8
	cmp r6, r0
	blt _0222D4AC
_0222D4CA:
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222D4EE
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
_0222D4EE:
	add r0, r7, #1
	mov r1, #3
	str r1, [sp]
	mov r1, #0xf
	lsl r0, r0, #1
	str r1, [sp, #4]
	lsl r1, r0, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #8]
	mov r1, #0xd
	str r1, [sp, #0xc]
	mov r1, #0x3b
	sub r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	mov r0, #0x57
	lsl r0, r0, #2
	mov r1, #0x32
	lsl r1, r1, #4
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r2, #2
	mov r3, #0x10
	bl AddWindowParameterized
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r2, _0222D590 ; =0x000001D9
	add r0, r5, r0
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #0x32
	lsl r2, r2, #4
	str r0, [sp, #0x1c]
	add r0, r5, r2
	str r0, [sp, #0x28]
	add r2, #0x54
	ldrh r2, [r5, r2]
	add r0, sp, #0x1c
	mov r1, #0
	mov r3, #0x35
	bl ListMenuInit
	mov r1, #0x56
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov44_02232018
	mov r0, #0xd2
	mov r1, #0x25
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [sp, #0x14]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_0222D584: .word ov44_022366FC
_0222D588: .word ov44_0223671C
_0222D58C: .word _02236660
_0222D590: .word 0x000001D9
	thumb_func_end ov44_0222D3DC

	thumb_func_start ov44_0222D594
ov44_0222D594: ; 0x0222D594
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	bl ov44_0222A168
	str r0, [sp]
	add r0, r5, #0
	bl ov44_0222E02C
	add r6, r0, #0
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov44_02232018
	bl sub_020393C8
	cmp r0, #0
	beq _0222D5FC
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0x56
	lsl r0, r0, #2
	mov r2, #0xdd
	lsl r2, r2, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r2, r5, r2
	bl DestroyListMenu
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	add r0, r5, #0
	bl ov44_0222F7BC
	add r0, r5, #0
	bl ov44_0222B9A0
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222D5FC:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222D65A
	add r0, r5, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222D656
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r5, r0]
	sub r0, #0x28
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0x56
	lsl r0, r0, #2
	mov r2, #0xdd
	lsl r2, r2, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r2, r5, r2
	bl DestroyListMenu
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	add r0, r5, #0
	bl ov44_0222F7BC
_0222D656:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222D65A:
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenu_ProcessInput
	add r4, r0, #0
	add r0, r5, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222D674
	mov r4, #1
	mvn r4, r4
_0222D674:
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _0222D686
	add r0, r0, #1
	cmp r4, r0
	bne _0222D69C
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222D686:
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov44_0222F7BC
	ldr r0, _0222D820 ; =0x000005DD
	bl PlaySE
	b _0222D7E8
_0222D69C:
	ldr r0, _0222D820 ; =0x000005DD
	bl PlaySE
	cmp r4, #0x13
	bne _0222D6DE
	cmp r6, #0
	beq _0222D6DE
	cmp r6, #1
	bne _0222D6BA
	add r0, r5, #0
	mov r1, #0x68
	mov r2, #0
	bl ov44_0222F510
	b _0222D6D4
_0222D6BA:
	cmp r6, #3
	bne _0222D6CA
	add r0, r5, #0
	mov r1, #0x6a
	mov r2, #0
	bl ov44_0222F510
	b _0222D6D4
_0222D6CA:
	add r0, r5, #0
	mov r1, #0x69
	mov r2, #0
	bl ov44_0222F510
_0222D6D4:
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222D782
_0222D6DE:
	cmp r4, #0xf
	bne _0222D6FC
	ldr r0, [sp]
	cmp r0, #2
	bge _0222D6FC
	add r0, r5, #0
	mov r1, #0x59
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222D782
_0222D6FC:
	cmp r4, #1
	bne _0222D71A
	ldr r0, [sp]
	cmp r0, #2
	bge _0222D71A
	add r0, r5, #0
	mov r1, #0x67
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222D782
_0222D71A:
	cmp r4, #0
	beq _0222D726
	cmp r4, #1
	beq _0222D726
	cmp r4, #0x1d
	bne _0222D76C
_0222D726:
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0x56
	lsl r0, r0, #2
	mov r2, #0xdd
	lsl r2, r2, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r2, r5, r2
	bl DestroyListMenu
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_0222D8B0
	mov r0, #0xd2
	mov r1, #0x26
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222D76C:
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_0222F818
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov44_0222F7BC
_0222D782:
	add r0, r4, #0
	mov r6, #1
	bl ov44_02229F44
	cmp r0, #0
	beq _0222D7C4
	mov r0, #0xd2
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0x13
	bne _0222D7C4
	mov r1, #0x44
	str r1, [r5, r0]
	add r0, r5, #0
	sub r1, #0x45
	add r2, r4, #0
	bl ov44_0223197C
	add r0, r4, #0
	bl ov44_0222A1B4
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_0222F818
	add r0, r4, #0
	bl ov44_02229F74
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r6, #0
	b _0222D7D6
_0222D7C4:
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	add r2, r4, #0
	bl ov44_0223197C
	add r0, r4, #0
	bl ov44_0222A1B4
_0222D7D6:
	mov r0, #0xd2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0x13
	bne _0222D7E8
	add r0, r5, #0
	add r1, r6, #0
	bl ov44_022319BC
_0222D7E8:
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0x56
	lsl r0, r0, #2
	mov r2, #0xdd
	lsl r2, r2, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r2, r5, r2
	bl DestroyListMenu
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222D820: .word 0x000005DD
	thumb_func_end ov44_0222D594

	thumb_func_start ov44_0222D824
ov44_0222D824: ; 0x0222D824
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020393C8
	cmp r0, #0
	beq _0222D840
	add r0, r5, #0
	bl ov44_0222B9A0
	add sp, #0xc
	add r0, r4, #0
	pop {r4, r5, pc}
_0222D840:
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov44_02232018
	add r0, r5, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222D85C
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222D85C:
	bl sub_020392A0
	cmp r0, #0
	beq _0222D8AA
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	mov r0, #0
	bl sub_020378E4
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x35
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0xe1
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02034354
	bl sub_02034434
	bl sub_0203769C
	bl sub_0203476C
	mov r4, #2
_0222D8AA:
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov44_0222D824

	thumb_func_start ov44_0222D8B0
ov44_0222D8B0: ; 0x0222D8B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	cmp r1, #0
	beq _0222D8C4
	cmp r1, #1
	beq _0222D8E6
	cmp r1, #0x1d
	beq _0222D908
	b _0222D928
_0222D8C4:
	mov r0, #0xdf
	mov r1, #1
	lsl r0, r0, #2
	ldr r3, _0222DA4C ; =ov44_02235508
	strh r1, [r5, r0]
	add r2, sp, #0x14
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r4, _0222DA50 ; =ov44_022366BC
	mov r7, #4
	stmia r2!, {r0, r1}
	b _0222D928
_0222D8E6:
	mov r0, #0xdf
	mov r1, #0
	lsl r0, r0, #2
	ldr r3, _0222DA4C ; =ov44_02235508
	strh r1, [r5, r0]
	add r2, sp, #0x14
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r4, _0222DA54 ; =ov44_022366DC
	mov r7, #4
	stmia r2!, {r0, r1}
	b _0222D928
_0222D908:
	ldr r3, _0222DA58 ; =ov44_02235528
	add r2, sp, #0x14
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0xdf
	ldr r4, _0222DA5C ; =ov44_0223669C
	mov r1, #2
	lsl r0, r0, #2
	mov r7, #4
	strh r1, [r5, r0]
_0222D928:
	add r0, r7, #0
	mov r1, #0x35
	bl ListMenuItems_ctor
	mov r1, #0x55
	lsl r1, r1, #2
	mov r6, #0
	str r0, [r5, r1]
	cmp r7, #0
	ble _0222D9A6
_0222D93C:
	ldr r2, [r4]
	cmp r2, #0x47
	beq _0222D956
	mov r0, #0x55
	mov r1, #0x5a
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r3, [r4, #4]
	bl ListMenuItems_AppendFromMsgData
	b _0222D99E
_0222D956:
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r2, r6, #0
	bl BufferWiFiPlazaActivityName
	mov r0, #0x5a
	mov r2, #0x17
	lsl r0, r0, #2
	lsl r2, r2, #4
	ldr r0, [r5, r0]
	ldr r1, [r4]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r0, #0x59
	mov r1, #0x5e
	mov r2, #0x17
	lsl r0, r0, #2
	lsl r1, r1, #2
	lsl r2, r2, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r0, #0x55
	mov r1, #0x5e
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r4, #4]
	bl ListMenuItems_AddItem
_0222D99E:
	add r6, r6, #1
	add r4, #8
	cmp r6, r7
	blt _0222D93C
_0222D9A6:
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222D9CA
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
_0222D9CA:
	mov r1, #9
	str r1, [sp]
	mov r1, #0xf
	lsl r0, r7, #1
	str r1, [sp, #4]
	lsl r1, r0, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #8]
	mov r1, #0xd
	str r1, [sp, #0xc]
	mov r1, #0x3b
	sub r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	mov r0, #0x57
	lsl r0, r0, #2
	mov r1, #0x32
	lsl r1, r1, #4
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r2, #2
	mov r3, #0x10
	bl AddWindowParameterized
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r2, _0222DA60 ; =0x000001D9
	add r0, r5, r0
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r3, #0x32
	lsl r3, r3, #4
	str r0, [sp, #0x14]
	add r0, r5, r3
	add r2, r3, #0
	str r0, [sp, #0x20]
	add r2, #0x5c
	ldrh r2, [r5, r2]
	add r3, #0x56
	add r0, sp, #0x14
	lsl r2, r2, #1
	add r2, r5, r2
	ldrh r2, [r2, r3]
	mov r1, #0
	mov r3, #0x35
	bl ListMenuInit
	mov r1, #0x56
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	mov r0, #1
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0222DA4C: .word ov44_02235508
_0222DA50: .word ov44_022366BC
_0222DA54: .word ov44_022366DC
_0222DA58: .word ov44_02235528
_0222DA5C: .word ov44_0223669C
_0222DA60: .word 0x000001D9
	thumb_func_end ov44_0222D8B0

	thumb_func_start ov44_0222DA64
ov44_0222DA64: ; 0x0222DA64
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	add r6, r1, #0
	bl ov44_02232018
	bl sub_020393C8
	cmp r0, #0
	beq _0222DAC4
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
	ldr r3, _0222DC10 ; =0x00000376
	mov r0, #0x56
	add r2, r5, r3
	add r3, r3, #6
	ldrh r3, [r5, r3]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	lsl r3, r3, #1
	mov r1, #0
	add r2, r2, r3
	bl DestroyListMenu
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	add r0, r5, #0
	bl ov44_0222F7BC
	add r0, r5, #0
	bl ov44_0222B9A0
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222DAC4:
	add r0, r5, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222DB16
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r5, r0]
	sub r0, #0x28
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
	ldr r3, _0222DC10 ; =0x00000376
	mov r0, #0x56
	add r2, r5, r3
	add r3, r3, #6
	ldrh r3, [r5, r3]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	lsl r3, r3, #1
	mov r1, #0
	add r2, r2, r3
	bl DestroyListMenu
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	add r0, r5, #0
	bl ov44_0222F7BC
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222DB16:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222DB2C
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222DB2C:
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenu_ProcessInput
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _0222DB4A
	add r0, r0, #1
	cmp r4, r0
	bne _0222DB5A
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222DB4A:
	ldr r0, _0222DC14 ; =0x000005DD
	bl PlaySE
	mov r0, #0xd2
	mov r1, #0x24
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222DB76
_0222DB5A:
	ldr r0, _0222DC14 ; =0x000005DD
	bl PlaySE
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_0222F818
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov44_0222F7BC
_0222DB76:
	mov r0, #0xd2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0x13
	bne _0222DBD2
	add r0, r4, #0
	mov r7, #1
	bl ov44_02229F44
	cmp r0, #0
	beq _0222DBBC
	mov r0, #0xd2
	mov r1, #0x44
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	sub r1, #0x45
	add r2, r4, #0
	bl ov44_0223197C
	add r0, r4, #0
	bl ov44_0222A1B4
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_0222F818
	add r0, r4, #0
	bl ov44_02229F74
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r7, #0
	b _0222DBCA
_0222DBBC:
	add r0, r5, #0
	sub r1, r7, #2
	add r2, r4, #0
	bl ov44_0223197C
	bl sub_02039B7C
_0222DBCA:
	add r0, r5, #0
	add r1, r7, #0
	bl ov44_022319BC
_0222DBD2:
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
	ldr r3, _0222DC10 ; =0x00000376
	mov r0, #0x56
	add r2, r5, r3
	add r3, r3, #6
	ldrh r3, [r5, r3]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	lsl r3, r3, #1
	mov r1, #0
	add r2, r2, r3
	bl DestroyListMenu
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DC10: .word 0x00000376
_0222DC14: .word 0x000005DD
	thumb_func_end ov44_0222DA64

	thumb_func_start ov44_0222DC18
ov44_0222DC18: ; 0x0222DC18
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	add r6, r1, #0
	bl ov44_02231C70
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl ov44_0222AAEC
	add r7, r0, #0
	bne _0222DC3A
	bl GF_AssertFail
_0222DC3A:
	add r0, r4, #0
	add r1, r5, #0
	bl ov44_0222AAEC
	str r0, [sp]
	cmp r0, #0
	bne _0222DC66
	add r0, r4, #0
	sub r1, r5, #1
	bl ov44_0222F780
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222DC66:
	add r0, r7, #0
	bl ov44_02231F04
	add r2, r0, #0
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r1, [sp]
	add r0, r4, r0
	bl ov44_02231F14
	sub r7, r5, #1
	add r0, r4, #0
	add r1, r7, #0
	bl ov44_02231958
	add r1, r0, #0
	add r0, r4, #0
	bl ov44_02229F00
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	ldr r0, _0222DD60 ; =0x0000037E
	add r1, r7, #0
	strh r5, [r4, r0]
	add r0, r4, #0
	bl ov44_0222F780
	cmp r5, #0xf
	bne _0222DCA4
	mov r1, #3
	b _0222DD4C
_0222DCA4:
	cmp r5, #0x13
	bne _0222DCAC
	mov r1, #4
	b _0222DD4C
_0222DCAC:
	cmp r5, #0x12
	bne _0222DCB4
	mov r1, #0x53
	b _0222DD4C
_0222DCB4:
	cmp r5, #0x15
	bne _0222DCBC
	mov r1, #5
	b _0222DD4C
_0222DCBC:
	cmp r5, #0x14
	bne _0222DCC4
	mov r1, #0x54
	b _0222DD4C
_0222DCC4:
	cmp r5, #0x17
	bne _0222DCDA
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	mov r2, #0
	bl BufferWiFiPlazaActivityName
	mov r1, #6
	b _0222DD4C
_0222DCDA:
	cmp r5, #0x16
	bne _0222DCE2
	mov r1, #0x55
	b _0222DD4C
_0222DCE2:
	cmp r5, #0x19
	bne _0222DCF8
	mov r0, #0x59
	lsl r0, r0, #2
	mov r1, #1
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl BufferWiFiPlazaActivityName
	mov r1, #6
	b _0222DD4C
_0222DCF8:
	cmp r5, #0x18
	bne _0222DD00
	mov r1, #0x55
	b _0222DD4C
_0222DD00:
	cmp r5, #0x1b
	bne _0222DD16
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	mov r2, #2
	bl BufferWiFiPlazaActivityName
	mov r1, #6
	b _0222DD4C
_0222DD16:
	cmp r5, #0x1a
	bne _0222DD1E
	mov r1, #0x55
	b _0222DD4C
_0222DD1E:
	add r0, r5, #0
	bl ov44_02229FB4
	cmp r0, #0
	beq _0222DD2C
	mov r1, #2
	b _0222DD4C
_0222DD2C:
	cmp r5, #8
	bne _0222DD34
	mov r1, #0x52
	b _0222DD4C
_0222DD34:
	add r0, r5, #0
	bl ov44_0222A020
	cmp r0, #0
	beq _0222DD42
	mov r1, #0x51
	b _0222DD4C
_0222DD42:
	cmp r5, #1
	bne _0222DD4A
	mov r1, #0x56
	b _0222DD4C
_0222DD4A:
	mov r1, #7
_0222DD4C:
	add r0, r4, #0
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x2b
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222DD60: .word 0x0000037E
	thumb_func_end ov44_0222DC18

	thumb_func_start ov44_0222DD64
ov44_0222DD64: ; 0x0222DD64
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r5, r0, #0
	str r1, [sp, #0x14]
	bl sub_020393C8
	cmp r0, #0
	beq _0222DD80
	add r0, r5, #0
	bl ov44_0222B9A0
	ldr r0, [sp, #0x14]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
_0222DD80:
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov44_02231C70
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_0222AAEC
	add r6, r0, #0
	add r0, r5, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222DDC0
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r6, #0
	bl ov44_02231F88
	add r0, r5, #0
	bl ov44_0222F7BC
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [sp, #0x14]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
_0222DDC0:
	cmp r6, #0
	bne _0222DDFE
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r6, #0
	bl ov44_02231F88
	mov r0, #0x56
	lsl r0, r0, #2
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl DestroyListMenu
	add r0, r5, #0
	sub r1, r4, #1
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [sp, #0x14]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
_0222DDFE:
	add r0, r5, #0
	sub r1, r4, #1
	bl ov44_02231958
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_02229F00
	ldr r1, _0222DFDC ; =0x0000037E
	ldrh r2, [r5, r1]
	cmp r2, r0
	beq _0222DE40
	add r1, #0xe
	add r0, r5, r1
	add r1, r6, #0
	bl ov44_02231F88
	add r0, r5, #0
	sub r1, r4, #1
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [sp, #0x14]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
_0222DE40:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222DE58
	ldr r0, [sp, #0x14]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
_0222DE58:
	ldr r3, _0222DFE0 ; =ov44_022354C8
	mov r0, #2
	str r0, [sp, #0x1c]
	add r2, sp, #0x24
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov44_02231C70
	add r1, r0, #0
	add r0, r5, #0
	sub r1, r1, #1
	bl ov44_02231958
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov44_02229F00
	add r6, #0x21
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r0, #0xe
	ldrb r1, [r6]
	lsl r0, r0, #6
	strh r1, [r5, r0]
	ldr r0, [r5, #4]
	add r0, #0x21
	ldrb r0, [r0]
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x18]
	mov r0, #2
	mov r1, #0x35
	bl ListMenuItems_ctor
	mov r1, #0x55
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	ldr r6, _0222DFE4 ; =ov44_022353A0
	str r0, [sp, #0x20]
	add r7, sp, #0x24
_0222DEC0:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _0222DF3A
	add r0, r4, #0
	bl ov44_0222A048
	cmp r0, #0
	bne _0222DEDC
	cmp r4, #0
	beq _0222DEDC
	cmp r4, #0x1c
	beq _0222DEDC
	cmp r4, #0x1d
	blo _0222DEF0
_0222DEDC:
	ldrh r0, [r7, #0x12]
	sub r0, r0, #1
	strh r0, [r7, #0x12]
	ldrh r0, [r7, #0x10]
	sub r0, r0, #1
	strh r0, [r7, #0x10]
	ldr r0, [sp, #0x1c]
	sub r0, r0, #1
	str r0, [sp, #0x1c]
	b _0222DF4E
_0222DEF0:
	cmp r4, #0x10
	bne _0222DF24
	ldr r0, [sp, #0x18]
	cmp r0, #2
	bne _0222DF10
	mov r0, #0x55
	mov r1, #0x5a
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r3, [r6, #4]
	mov r2, #0x24
	bl ListMenuItems_AppendFromMsgData
	b _0222DF4E
_0222DF10:
	ldrh r0, [r7, #0x12]
	sub r0, r0, #1
	strh r0, [r7, #0x12]
	ldrh r0, [r7, #0x10]
	sub r0, r0, #1
	strh r0, [r7, #0x10]
	ldr r0, [sp, #0x1c]
	sub r0, r0, #1
	str r0, [sp, #0x1c]
	b _0222DF4E
_0222DF24:
	mov r0, #0x55
	mov r1, #0x5a
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r6]
	ldr r3, [r6, #4]
	bl ListMenuItems_AppendFromMsgData
	b _0222DF4E
_0222DF3A:
	mov r0, #0x55
	mov r1, #0x5a
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, [r6]
	ldr r3, [r6, #4]
	bl ListMenuItems_AppendFromMsgData
_0222DF4E:
	ldr r0, [sp, #0x20]
	add r6, #8
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #2
	blo _0222DEC0
	ldr r0, [sp, #0x1c]
	mov r1, #3
	sub r0, r1, r0
	lsl r0, r0, #1
	add r0, #0xb
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xf
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	mov r1, #0x32
	lsl r0, r0, #0x19
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x3b
	str r0, [sp, #0x10]
	mov r0, #0x57
	lsl r0, r0, #2
	lsl r1, r1, #4
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r2, #2
	mov r3, #0x10
	bl AddWindowParameterized
	mov r0, #0x32
	lsl r0, r0, #4
	ldr r2, _0222DFE8 ; =0x000001D9
	add r0, r5, r0
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	str r0, [sp, #0x24]
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	str r0, [sp, #0x30]
	add r0, sp, #0x24
	add r2, r1, #0
	mov r3, #0x35
	bl ListMenuInit
	mov r1, #0x56
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0xd2
	mov r1, #0x2c
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [sp, #0x14]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222DFDC: .word 0x0000037E
_0222DFE0: .word ov44_022354C8
_0222DFE4: .word ov44_022353A0
_0222DFE8: .word 0x000001D9
	thumb_func_end ov44_0222DD64

	thumb_func_start ov44_0222DFEC
ov44_0222DFEC: ; 0x0222DFEC
	push {r4, r5}
	ldr r2, _0222E028 ; =0x000001EF
	mov r5, #0
	add r1, r2, #0
	add r1, #0x29
	add r3, r2, #0
_0222DFF8:
	ldrh r4, [r0]
	cmp r4, r3
	bne _0222E004
	mov r0, #0
	pop {r4, r5}
	bx lr
_0222E004:
	cmp r4, r2
	bls _0222E00E
	mov r0, #0
	pop {r4, r5}
	bx lr
_0222E00E:
	ldrh r4, [r0, #0xc]
	cmp r4, r1
	bls _0222E01A
	mov r0, #0
	pop {r4, r5}
	bx lr
_0222E01A:
	add r5, r5, #1
	add r0, r0, #2
	cmp r5, #6
	blt _0222DFF8
	mov r0, #1
	pop {r4, r5}
	bx lr
	.balign 4, 0
_0222E028: .word 0x000001EF
	thumb_func_end ov44_0222DFEC

	thumb_func_start ov44_0222E02C
ov44_0222E02C: ; 0x0222E02C
	mov r0, #3
	bx lr
	thumb_func_end ov44_0222E02C

	thumb_func_start ov44_0222E030
ov44_0222E030: ; 0x0222E030
	push {r4, lr}
	mov r0, #0
	bl ov00_021E70B8
	bl ov44_0222E074
	cmp r0, #0
	bne _0222E056
	bl IsNighttime
	mov r0, #0
	bl sub_02004AD8
	ldr r1, _0222E070 ; =0x00000427
	mov r0, #0xb
	mov r2, #1
	bl sub_02004EC4
	pop {r4, pc}
_0222E056:
	bl GF_GetCurrentPlayingBGM
	add r4, r0, #0
	bl GF_GetCurrentPlayingBGM
	bl GF_GetVolumeBySeqNo
	add r1, r0, #0
	add r0, r4, #0
	bl GF_SetVolumeBySeqNo
	pop {r4, pc}
	nop
_0222E070: .word 0x00000427
	thumb_func_end ov44_0222E030

	thumb_func_start ov44_0222E074
ov44_0222E074: ; 0x0222E074
	push {r3, lr}
	bl GF_GetCurrentPlayingBGM
	ldr r1, _0222E08C ; =0x00000427
	cmp r0, r1
	beq _0222E086
	beq _0222E086
	mov r0, #0
	pop {r3, pc}
_0222E086:
	mov r0, #1
	pop {r3, pc}
	nop
_0222E08C: .word 0x00000427
	thumb_func_end ov44_0222E074

	thumb_func_start ov44_0222E090
ov44_0222E090: ; 0x0222E090
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	str r1, [sp]
	mov r6, #0
	bl ListMenu_ProcessInput
	add r7, r0, #0
	add r0, r5, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222E0B2
	sub r7, r6, #2
_0222E0B2:
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov44_02231C70
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_0222AAEC
	str r0, [sp, #0x14]
	bl sub_020393C8
	cmp r0, #0
	beq _0222E11C
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0x56
	lsl r0, r0, #2
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl DestroyListMenu
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0222E110
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r1, [sp, #0x14]
	add r0, r5, r0
	bl ov44_02231F88
_0222E110:
	add r0, r5, #0
	bl ov44_0222B9A0
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_0222E11C:
	mov r0, #1
	mvn r0, r0
	cmp r7, r0
	beq _0222E1B0
	add r0, r0, #1
	cmp r7, r0
	bne _0222E1C0
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0222E15C
	mov r0, #0x56
	lsl r0, r0, #2
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl DestroyListMenu
	add r0, r5, #0
	sub r1, r4, #1
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r6, #1
	b _0222E3FE
_0222E15C:
	add r0, r5, #0
	sub r1, r4, #1
	bl ov44_02231958
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov44_02229F00
	ldr r1, _0222E450 ; =0x0000037E
	add r6, #0x21
	ldrh r1, [r5, r1]
	ldrb r6, [r6]
	cmp r1, r0
	bne _0222E18C
	bl ov44_02229F44
	cmp r0, #0
	bne _0222E1AA
	mov r0, #0xe
	lsl r0, r0, #6
	ldrh r0, [r5, r0]
	cmp r0, r6
	beq _0222E1AA
_0222E18C:
	add r0, r5, #0
	sub r1, r4, #1
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r6, #1
	b _0222E3FE
_0222E1AA:
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_0222E1B0:
	ldr r0, _0222E454 ; =0x000005DD
	bl PlaySE
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E3FE
_0222E1C0:
	ldr r0, _0222E454 ; =0x000005DD
	bl PlaySE
	cmp r7, #1
	beq _0222E1CC
	b _0222E3F2
_0222E1CC:
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, #0x3a
	strh r4, [r5, r0]
	cmp r4, #0
	bne _0222E1DE
	b _0222E3FE
_0222E1DE:
	add r0, r5, #0
	bl ov44_0222A168
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ov44_0222E02C
	str r0, [sp, #0xc]
	add r0, r5, #0
	sub r1, r4, #1
	bl ov44_02231958
	str r0, [sp, #8]
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl ov44_02229F00
	ldr r1, [sp, #8]
	add r7, r0, #0
	add r1, #0x21
	ldrb r1, [r1]
	str r1, [sp, #4]
	ldr r1, _0222E450 ; =0x0000037E
	ldrh r1, [r5, r1]
	cmp r1, r7
	bne _0222E226
	bl ov44_02229F44
	cmp r0, #0
	bne _0222E244
	mov r0, #0xe
	lsl r0, r0, #6
	ldrh r1, [r5, r0]
	ldr r0, [sp, #4]
	cmp r1, r0
	beq _0222E244
_0222E226:
	add r0, r5, #0
	sub r1, r4, #1
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r6, #1
	b _0222E3FE
_0222E244:
	ldr r0, [sp, #8]
	bl ov44_0222DFEC
	cmp r0, #0
	bne _0222E26C
	add r0, r5, #0
	sub r1, r4, #1
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r6, #1
	b _0222E3FE
_0222E26C:
	add r0, r7, #0
	bl ov44_0222A090
	cmp r0, #0
	beq _0222E2A2
	ldr r0, [sp, #0x10]
	cmp r0, #2
	bge _0222E2A2
	cmp r7, #0xf
	bne _0222E28C
	add r0, r5, #0
	mov r1, #0x59
	mov r2, #0
	bl ov44_0222F510
	b _0222E296
_0222E28C:
	add r0, r5, #0
	mov r1, #0x67
	mov r2, #0
	bl ov44_0222F510
_0222E296:
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r6, #1
	b _0222E3FE
_0222E2A2:
	cmp r7, #0x13
	bne _0222E2E2
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0222E2E2
	cmp r0, #1
	bne _0222E2BC
	add r0, r5, #0
	mov r1, #0x68
	mov r2, #0
	bl ov44_0222F510
	b _0222E2D6
_0222E2BC:
	cmp r0, #3
	bne _0222E2CC
	add r0, r5, #0
	mov r1, #0x6a
	mov r2, #0
	bl ov44_0222F510
	b _0222E2D6
_0222E2CC:
	add r0, r5, #0
	mov r1, #0x69
	mov r2, #0
	bl ov44_0222F510
_0222E2D6:
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r6, #1
	b _0222E3FE
_0222E2E2:
	add r0, r7, #0
	bl ov44_02229F44
	cmp r0, #0
	bne _0222E32C
	ldr r0, [r5, #4]
	add r0, #0x21
	ldrb r1, [r0]
	ldr r0, [sp, #4]
	cmp r0, r1
	beq _0222E32C
	cmp r0, #0
	beq _0222E308
	add r0, r5, #0
	mov r1, #0x86
	mov r2, #0
	bl ov44_0222F510
	b _0222E312
_0222E308:
	add r0, r5, #0
	mov r1, #0x87
	mov r2, #0
	bl ov44_0222F510
_0222E312:
	add r0, r7, #0
	bl ov44_0222A0B4
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F818
	mov r0, #0xd2
	mov r1, #0x3f
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r6, #1
	b _0222E3FE
_0222E32C:
	add r0, r7, #0
	bl ov44_0222A0B4
	add r7, r0, #0
	cmp r7, #0x1d
	beq _0222E3FE
	sub r0, r4, #1
	bl ov44_02231974
	cmp r0, #6
	bne _0222E3D4
	add r0, r5, #0
	sub r1, r4, #1
	add r2, r7, #0
	bl ov44_0223197C
	cmp r0, #0
	beq _0222E3B6
	mov r0, #0xd
	ldr r1, _0222E458 ; =0x00000708
	lsl r0, r0, #6
	str r1, [r5, r0]
	add r0, r7, #0
	bl ov44_0222A1B4
	add r0, r5, #0
	add r1, r7, #0
	bl ov44_0222F818
	add r0, r5, #0
	sub r1, r4, #1
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x11
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222E386
	bl GF_AssertFail
_0222E386:
	mov r1, #0x2d
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0xee
	bl sub_0200F0AC
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r5, r1]
	cmp r7, #1
	beq _0222E3A4
	mov r0, #0xd2
	mov r1, #0x2d
	lsl r0, r0, #2
	b _0222E3B0
_0222E3A4:
	mov r0, #0xd
	ldr r1, _0222E458 ; =0x00000708
	lsl r0, r0, #6
	str r1, [r5, r0]
	mov r1, #0x15
	add r0, #8
_0222E3B0:
	str r1, [r5, r0]
	mov r6, #1
	b _0222E3FE
_0222E3B6:
	add r0, r5, #0
	sub r1, r4, #1
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r6, #1
	b _0222E3FE
_0222E3D4:
	add r0, r5, #0
	sub r1, r4, #1
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r6, #1
	b _0222E3FE
_0222E3F2:
	cmp r7, #2
	bne _0222E3FE
	mov r0, #0xd2
	mov r1, #0x36
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222E3FE:
	cmp r6, #0
	bne _0222E408
	add r0, r5, #0
	bl ov44_0222F7BC
_0222E408:
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x32
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0x56
	lsl r0, r0, #2
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl DestroyListMenu
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0222E448
	mov r0, #0xe3
	lsl r0, r0, #2
	ldr r1, [sp, #0x14]
	add r0, r5, r0
	bl ov44_02231F88
_0222E448:
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E450: .word 0x0000037E
_0222E454: .word 0x000005DD
_0222E458: .word 0x00000708
	thumb_func_end ov44_0222E090

	thumb_func_start ov44_0222E45C
ov44_0222E45C: ; 0x0222E45C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0xd
	lsl r0, r0, #6
	add r4, r1, #0
	ldr r1, [r5, r0]
	sub r1, r1, #1
	str r1, [r5, r0]
	ldr r1, [r5, r0]
	cmp r1, #0
	bge _0222E47C
	mov r1, #0x46
	add r0, #8
	str r1, [r5, r0]
	b _0222E5D0
_0222E47C:
	bl sub_020390C4
	cmp r0, #3
	bne _0222E4A4
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E5D0
_0222E4A4:
	bl sub_020390C4
	cmp r0, #5
	bne _0222E4CC
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0xf
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E5D0
_0222E4CC:
	bl sub_020390C4
	cmp r0, #4
	beq _0222E4DC
	bl sub_02039264
	cmp r0, #0
	beq _0222E4FC
_0222E4DC:
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E5D0
_0222E4FC:
	bl sub_020393C8
	cmp r0, #0
	beq _0222E50C
	add r0, r5, #0
	bl ov44_0222B9A0
	b _0222E5D0
_0222E50C:
	bl sub_020390C4
	cmp r0, #1
	bne _0222E5D0
	ldr r1, [r5, #4]
	add r0, r5, #0
	bl ov44_02229F00
	add r6, r0, #0
	bl ov44_02229F44
	cmp r0, #0
	bne _0222E54A
	mov r0, #0xd2
	mov r1, #0x31
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov44_0222F7BC
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02034354
	mov r0, #0xd7
	mov r1, #0x1e
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E5D0
_0222E54A:
	mov r0, #0
	bl sub_020373B4
	cmp r0, #1
	bne _0222E5AA
	add r0, r5, #0
	bl ov44_0222F7BC
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02034354
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	add r0, r6, #0
	bl ov44_0222A1B4
	add r0, r6, #0
	bl ov44_02229F74
	mov r1, #0xd3
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	bl sub_020378E4
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x35
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #0xe1
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r4, #2
	b _0222E5D0
_0222E5AA:
	bl sub_02037880
	cmp r0, #1
	bne _0222E5D0
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222E5D0:
	add r0, r4, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_0222E45C

	thumb_func_start ov44_0222E5D8
ov44_0222E5D8: ; 0x0222E5D8
	add r0, r1, #0
	bx lr
	thumb_func_end ov44_0222E5D8

	thumb_func_start ov44_0222E5DC
ov44_0222E5DC: ; 0x0222E5DC
	add r0, r1, #0
	bx lr
	thumb_func_end ov44_0222E5DC

	thumb_func_start ov44_0222E5E0
ov44_0222E5E0: ; 0x0222E5E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020393C8
	cmp r0, #0
	beq _0222E5F8
	add r0, r5, #0
	bl ov44_0222B9A0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222E5F8:
	add r0, r5, #0
	bl ov44_0222F8F0
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	bl sub_02039358
	mov r1, #0
	mov r0, #0x37
	mvn r1, r1
	lsl r0, r0, #4
	str r1, [r5, r0]
	mov r1, #0x13
	sub r0, #0x28
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov44_022319EC
	add r0, r5, #0
	bl ov44_0222F7BC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_0222E5E0

	thumb_func_start ov44_0222E62C
ov44_0222E62C: ; 0x0222E62C
	add r0, r1, #0
	bx lr
	thumb_func_end ov44_0222E62C

	thumb_func_start ov44_0222E630
ov44_0222E630: ; 0x0222E630
	add r0, r1, #0
	bx lr
	thumb_func_end ov44_0222E630

	thumb_func_start ov44_0222E634
ov44_0222E634: ; 0x0222E634
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_02231958
	add r7, r0, #0
	ldr r1, [r5, #4]
	add r0, r5, #0
	bl ov44_02229F00
	add r4, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl ov44_02229F00
	ldr r1, [r5, #4]
	add r1, #0x21
	ldrb r1, [r1]
	cmp r4, #0xc
	bne _0222E672
	cmp r0, #5
	bne _0222E672
	mov r0, #0xd2
	mov r1, #0x31
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E672:
	cmp r4, #0xd
	bne _0222E684
	cmp r0, #6
	bne _0222E684
	mov r0, #0xd2
	mov r1, #0x31
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E684:
	cmp r4, #0xe
	bne _0222E696
	cmp r0, #7
	bne _0222E696
	mov r0, #0xd2
	mov r1, #0x31
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E696:
	cmp r4, #9
	bne _0222E6A8
	cmp r0, #2
	bne _0222E6A8
	mov r0, #0xd2
	mov r1, #0x31
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E6A8:
	cmp r4, #0xa
	bne _0222E6BA
	cmp r0, #3
	bne _0222E6BA
	mov r0, #0xd2
	mov r1, #0x31
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E6BA:
	cmp r4, #0xb
	bne _0222E6CC
	cmp r0, #4
	bne _0222E6CC
	mov r0, #0xd2
	mov r1, #0x31
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E6CC:
	cmp r4, #0xf
	bne _0222E6DE
	cmp r0, #8
	bne _0222E6DE
	mov r0, #0xd2
	mov r1, #0x31
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E6DE:
	cmp r4, #0x13
	bne _0222E6F0
	cmp r0, #0x12
	bne _0222E6F0
	mov r0, #0xd2
	mov r1, #0x31
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E6F0:
	cmp r4, #0x15
	bne _0222E702
	cmp r0, #0x14
	bne _0222E702
	mov r0, #0xd2
	mov r1, #0x31
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E702:
	cmp r4, #0x17
	bne _0222E714
	cmp r0, #0x16
	bne _0222E714
	mov r0, #0xd2
	mov r1, #0x31
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E714:
	cmp r4, #0x19
	bne _0222E726
	cmp r0, #0x18
	bne _0222E726
	mov r0, #0xd2
	mov r1, #0x31
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E726:
	cmp r4, #0x1b
	bne _0222E738
	cmp r0, #0x1a
	bne _0222E738
	mov r0, #0xd2
	mov r1, #0x31
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E790
_0222E738:
	cmp r4, #0x10
	bne _0222E750
	cmp r0, #1
	bne _0222E750
	cmp r1, #0
	ble _0222E750
	mov r0, #0xd2
	mov r1, #0x16
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222E750:
	bl sub_020393C8
	cmp r0, #0
	beq _0222E762
	add r0, r5, #0
	bl ov44_0222B9A0
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222E762:
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	bl sub_02039358
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222E790:
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0xb
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02034354
	mov r0, #0xd2
	mov r1, #0x31
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0x1e
	add r0, #0x14
	str r1, [r5, r0]
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_0222E634

	thumb_func_start ov44_0222E7C4
ov44_0222E7C4: ; 0x0222E7C4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_020390C4
	cmp r0, #3
	blt _0222E7F0
	mov r1, #0x37
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E852
_0222E7F0:
	bl sub_020393C8
	cmp r0, #0
	beq _0222E800
	add r0, r5, #0
	bl ov44_0222B9A0
	b _0222E852
_0222E800:
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_02231958
	add r6, r0, #0
	ldr r1, [r5, #4]
	add r0, r5, #0
	bl ov44_02229F00
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov44_02229F00
	add r6, r0, #0
	bl ov44_0222A0B4
	cmp r4, r0
	beq _0222E84E
	cmp r4, r6
	beq _0222E84E
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E852
_0222E84E:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0222E852:
	mov r0, #0xe1
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_0222E7C4

	thumb_func_start ov44_0222E860
ov44_0222E860: ; 0x0222E860
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020390C4
	cmp r0, #4
	bge _0222E880
	bl sub_02039264
	cmp r0, #0
	bne _0222E880
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	bne _0222E8BA
_0222E880:
	mov r1, #0xe1
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	cmp r0, #0
	beq _0222E896
	add r0, r5, #0
	mov r1, #0x65
	mov r2, #0
	bl ov44_0222F510
	b _0222E8AA
_0222E896:
	sub r1, #0x14
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #0
	bl ov44_0222F510
_0222E8AA:
	mov r0, #0xe1
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0x1b
	sub r0, #0x3c
	str r1, [r5, r0]
	b _0222E902
_0222E8BA:
	add r0, r5, #0
	bl ov44_0222E7C4
	cmp r0, #0
	bne _0222E902
	mov r0, #0xd7
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _0222E8F2
	mov r0, #0xd
	bl sub_02037B38
	cmp r0, #0
	beq _0222E902
	bl sub_02037BEC
	mov r0, #0xe
	bl sub_02037AC0
	mov r0, #0xe1
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0x32
	sub r0, #0x3c
	str r1, [r5, r0]
	b _0222E902
_0222E8F2:
	sub r1, r1, #1
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0222E902
	mov r0, #0xd
	bl sub_02037AC0
_0222E902:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_0222E860

	thumb_func_start ov44_0222E908
ov44_0222E908: ; 0x0222E908
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov44_0222E7C4
	cmp r0, #0
	bne _0222E942
	mov r0, #0xe
	bl sub_02037B38
	cmp r0, #0
	beq _0222E942
	ldr r1, [r5, #4]
	add r0, r5, #0
	bl ov44_02229F00
	add r1, sp, #0
	strh r0, [r1]
	bl sub_0203769C
	add r1, sp, #0
	bl sub_02037C0C
	cmp r0, #0
	beq _0222E942
	mov r0, #0xd2
	mov r1, #0x33
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222E942:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_0222E908

	thumb_func_start ov44_0222E948
ov44_0222E948: ; 0x0222E948
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	bl sub_0203769C
	cmp r0, #0
	bne _0222E95A
	mov r0, #1
	b _0222E95C
_0222E95A:
	mov r0, #0
_0222E95C:
	bl sub_02037C44
	add r4, r0, #0
	add r0, r5, #0
	bl ov44_0222E7C4
	cmp r0, #0
	bne _0222E9BE
	cmp r4, #0
	beq _0222E9BE
	ldr r1, [r5, #4]
	add r0, r5, #0
	bl ov44_02229F00
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r6, #0
	bl ov44_0222A0B4
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldrh r0, [r4]
	cmp r0, r1
	beq _0222E990
	cmp r0, r6
	bne _0222E9A0
_0222E990:
	mov r0, #0xf
	bl sub_02037AC0
	mov r0, #0xd2
	mov r1, #0x34
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222E9BE
_0222E9A0:
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r5, #0
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1b
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222E9BE:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov44_0222E948

	thumb_func_start ov44_0222E9C4
ov44_0222E9C4: ; 0x0222E9C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov44_0222E7C4
	cmp r0, #0
	bne _0222E9F6
	mov r0, #0xf
	bl sub_02037B38
	cmp r0, #0
	beq _0222E9F6
	bl sub_02034434
	mov r0, #1
	add r1, r0, #0
	bl sub_020398D4
	mov r0, #0x12
	bl sub_02037AC0
	mov r0, #0xd2
	mov r1, #0x35
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222E9F6:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_0222E9C4

	thumb_func_start ov44_0222E9FC
ov44_0222E9FC: ; 0x0222E9FC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222EA16
	mov r0, #1
	pop {r4, pc}
_0222EA16:
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r4, r0
	bl WindowIsInUse
	cmp r0, #0
	bne _0222EA28
	mov r0, #1
	pop {r4, pc}
_0222EA28:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov44_0222E9FC

	thumb_func_start ov44_0222EA2C
ov44_0222EA2C: ; 0x0222EA2C
	push {r4, r5, lr}
	sub sp, #0x2c
	add r4, r0, #0
	add r5, r1, #0
	bl ov44_0222E7C4
	cmp r0, #0
	bne _0222EA50
	mov r0, #0x12
	bl sub_02037B38
	cmp r0, #0
	beq _0222EA50
	add r0, r4, #0
	bl ov44_0222E9FC
	cmp r0, #1
	beq _0222EA52
_0222EA50:
	b _0222EB88
_0222EA52:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0xc
	mov r2, #0x35
	bl sub_0203A1C4
	add r0, r4, #0
	bl ov44_0222F7BC
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r4, #0
	bl ov44_02231958
	add r1, r0, #0
	add r0, r4, #0
	bl ov44_02229F00
	add r1, r0, #0
	cmp r1, #0xf
	beq _0222EA84
	cmp r1, #8
	bne _0222EA90
_0222EA84:
	mov r0, #0xd3
	mov r2, #7
	lsl r0, r0, #2
	mov r1, #8
	str r2, [r4, r0]
	b _0222EB68
_0222EA90:
	sub r0, #0x12
	cmp r0, #1
	bhi _0222EAA2
	mov r0, #0xd3
	mov r2, #0xb
	lsl r0, r0, #2
	mov r1, #0x12
	str r2, [r4, r0]
	b _0222EB68
_0222EAA2:
	add r0, r1, #0
	sub r0, #0x14
	cmp r0, #1
	bhi _0222EAB6
	mov r0, #0xd3
	mov r2, #0xc
	lsl r0, r0, #2
	mov r1, #0x14
	str r2, [r4, r0]
	b _0222EB68
_0222EAB6:
	add r0, r1, #0
	sub r0, #0x16
	cmp r0, #1
	bhi _0222EACA
	mov r0, #0xd3
	mov r2, #0xd
	lsl r0, r0, #2
	mov r1, #0x16
	str r2, [r4, r0]
	b _0222EB68
_0222EACA:
	add r0, r1, #0
	sub r0, #0x18
	cmp r0, #1
	bhi _0222EADE
	mov r0, #0xd3
	mov r2, #0xe
	lsl r0, r0, #2
	mov r1, #0x18
	str r2, [r4, r0]
	b _0222EB68
_0222EADE:
	add r0, r1, #0
	sub r0, #0x1a
	cmp r0, #1
	bhi _0222EAF2
	mov r0, #0xd3
	mov r2, #0xf
	lsl r0, r0, #2
	mov r1, #0x1a
	str r2, [r4, r0]
	b _0222EB68
_0222EAF2:
	cmp r1, #9
	beq _0222EAFA
	cmp r1, #2
	bne _0222EB06
_0222EAFA:
	mov r0, #0xd3
	mov r2, #1
	lsl r0, r0, #2
	mov r1, #2
	str r2, [r4, r0]
	b _0222EB68
_0222EB06:
	cmp r1, #0xa
	beq _0222EB0E
	cmp r1, #3
	bne _0222EB1A
_0222EB0E:
	mov r0, #0xd3
	mov r2, #2
	lsl r0, r0, #2
	mov r1, #3
	str r2, [r4, r0]
	b _0222EB68
_0222EB1A:
	cmp r1, #0xb
	beq _0222EB22
	cmp r1, #4
	bne _0222EB2E
_0222EB22:
	mov r0, #0xd3
	mov r2, #3
	lsl r0, r0, #2
	mov r1, #4
	str r2, [r4, r0]
	b _0222EB68
_0222EB2E:
	cmp r1, #0xc
	beq _0222EB36
	cmp r1, #5
	bne _0222EB42
_0222EB36:
	mov r0, #0xd3
	mov r2, #4
	lsl r0, r0, #2
	mov r1, #5
	str r2, [r4, r0]
	b _0222EB68
_0222EB42:
	cmp r1, #0xd
	beq _0222EB4A
	cmp r1, #6
	bne _0222EB56
_0222EB4A:
	mov r0, #0xd3
	mov r2, #5
	lsl r0, r0, #2
	mov r1, #6
	str r2, [r4, r0]
	b _0222EB68
_0222EB56:
	cmp r1, #0xe
	beq _0222EB5E
	cmp r1, #7
	bne _0222EB68
_0222EB5E:
	mov r0, #0xd3
	mov r2, #6
	lsl r0, r0, #2
	mov r1, #7
	str r2, [r4, r0]
_0222EB68:
	add r0, r4, #0
	bl ov44_0222F818
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x35
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r5, #2
_0222EB88:
	add r0, r5, #0
	add sp, #0x2c
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_0222EA2C

	thumb_func_start ov44_0222EB90
ov44_0222EB90: ; 0x0222EB90
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x57
	lsl r0, r0, #2
	add r4, r1, #0
	ldr r0, [r5, r0]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r0, #0xd9
	mov r1, #0
	lsl r0, r0, #2
	strb r1, [r5, r0]
	bl ov44_0222ADD0
	mov r1, #0xd2
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222EB90

	thumb_func_start ov44_0222EBB8
ov44_0222EBB8: ; 0x0222EBB8
	mov r2, #0xd2
	mov r3, #0x37
	lsl r2, r2, #2
	str r3, [r0, r2]
	add r0, r1, #0
	bx lr
	thumb_func_end ov44_0222EBB8

	thumb_func_start ov44_0222EBC4
ov44_0222EBC4: ; 0x0222EBC4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222EBE0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222EBE0:
	add r0, r5, #0
	bl ov44_0222C4EC
	cmp r0, #0
	beq _0222EBF2
	mov r0, #0xd2
	mov r1, #0x38
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222EBF2:
	ldr r0, _0222EC10 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0222EC04
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222EC0C
_0222EC04:
	mov r0, #0xd2
	mov r1, #0x38
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222EC0C:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222EC10: .word gSystem
	thumb_func_end ov44_0222EBC4

	thumb_func_start ov44_0222EC14
ov44_0222EC14: ; 0x0222EC14
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov44_0222F7BC
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_0222EC14

	thumb_func_start ov44_0222EC2C
ov44_0222EC2C: ; 0x0222EC2C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222EC86
	ldr r0, _0222EC8C ; =0x04000304
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222EC6A
	mov r2, #0x57
	mov r0, #0x35
	lsl r2, r2, #2
	str r0, [sp]
	ldr r0, [r5, r2]
	ldr r1, _0222EC90 ; =ov44_0223538C
	add r2, #0x7d
	mov r3, #0xb
	bl Std_CreateYesNoMenu
	mov r1, #0x61
	b _0222EC7A
_0222EC6A:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222EC94 ; =ov44_02235374
	mov r2, #0
	bl ov44_02231A14
	mov r1, #0x62
_0222EC7A:
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xd2
	mov r1, #0x3a
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222EC86:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0222EC8C: .word 0x04000304
_0222EC90: .word ov44_0223538C
_0222EC94: .word ov44_02235374
	thumb_func_end ov44_0222EC2C

	thumb_func_start ov44_0222EC98
ov44_0222EC98: ; 0x0222EC98
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, _0222EDB4 ; =0x04000304
	add r6, r1, #0
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222ED32
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x35
	bl Handle2dMenuInput_DeleteOnFinish
	add r5, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222ECD0
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_0222ECD0:
	add r0, r4, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222ECF2
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _0222ECEE
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x35
	bl Clear2dMenuWindowAndDelete
_0222ECEE:
	mov r5, #1
	mvn r5, r5
_0222ECF2:
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _0222ECFE
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_0222ECFE:
	cmp r5, #0
	bne _0222ED1C
	add r0, r4, #0
	mov r1, #0x1a
	mov r2, #1
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x3b
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #1
	add r0, #0x14
	str r1, [r4, r0]
	b _0222EDB0
_0222ED1C:
	add r0, r4, #0
	bl ov44_0222F7BC
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov44_022319EC
	b _0222EDB0
_0222ED32:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020168F4
	add r5, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222ED54
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_0222ED54:
	add r0, r4, #0
	bl ov44_0222C500
	cmp r0, #0
	beq _0222ED60
	mov r5, #2
_0222ED60:
	cmp r5, #1
	bne _0222ED88
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02016624
	add r0, r4, #0
	mov r1, #0x1a
	mov r2, #1
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x3b
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #1
	add r0, #0x14
	str r1, [r4, r0]
	b _0222EDB0
_0222ED88:
	cmp r5, #2
	bne _0222EDAC
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02016624
	add r0, r4, #0
	bl ov44_0222F7BC
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov44_022319EC
	b _0222EDB0
_0222EDAC:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_0222EDB0:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222EDB4: .word 0x04000304
	thumb_func_end ov44_0222EC98

	thumb_func_start ov44_0222EDB8
ov44_0222EDB8: ; 0x0222EDB8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222EDD4
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222EDD4:
	mov r0, #0xd7
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #1
	bne _0222EDE6
	mov r1, #0
	str r1, [r5, r0]
	bl sub_02039330
_0222EDE6:
	bl sub_02037D78
	cmp r0, #0
	bne _0222EE0C
	ldr r0, [r5]
	bl sub_0202C46C
	add r0, r5, #0
	mov r1, #0x1b
	mov r2, #1
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x3c
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0x1e
	add r0, #0x14
	str r1, [r5, r0]
_0222EE0C:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222EDB8

	thumb_func_start ov44_0222EE10
ov44_0222EE10: ; 0x0222EE10
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222EE2C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222EE2C:
	mov r1, #0xd7
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r0, r0, #1
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _0222EE50
	add r0, r1, #0
	mov r2, #8
	sub r0, #0x10
	str r2, [r5, r0]
	mov r0, #0x22
	sub r1, #0x14
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov44_0222F7BC
_0222EE50:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222EE10

	thumb_func_start ov44_0222EE54
ov44_0222EE54: ; 0x0222EE54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x10
	add r4, r1, #0
	bl sub_02037B38
	cmp r0, #0
	bne _0222EE68
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222EE68:
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222EEC4
	ldr r0, _0222EEC8 ; =0x04000304
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222EEA8
	mov r2, #0x57
	mov r0, #0x35
	lsl r2, r2, #2
	str r0, [sp]
	ldr r0, [r5, r2]
	ldr r1, _0222EECC ; =ov44_0223538C
	add r2, #0x7d
	mov r3, #0xb
	bl Std_CreateYesNoMenu
	mov r1, #0x61
	b _0222EEB8
_0222EEA8:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222EED0 ; =ov44_02235374
	mov r2, #0
	bl ov44_02231A28
	mov r1, #0x62
_0222EEB8:
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xd2
	mov r1, #0x3e
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222EEC4:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222EEC8: .word 0x04000304
_0222EECC: .word ov44_0223538C
_0222EED0: .word ov44_02235374
	thumb_func_end ov44_0222EE54

	thumb_func_start ov44_0222EED4
ov44_0222EED4: ; 0x0222EED4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r4, r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222EEF0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222EEF0:
	bl sub_02039274
	cmp r0, #0
	bne _0222EF08
	bl sub_02039264
	cmp r0, #0
	bne _0222EF08
	bl sub_020390C4
	cmp r0, #3
	blt _0222EF42
_0222EF08:
	ldr r0, _0222F0A8 ; =0x04000304
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222EF24
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x35
	bl Clear2dMenuWindowAndDelete
	b _0222EF2E
_0222EF24:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
_0222EF2E:
	add r0, r5, #0
	mov r1, #0x65
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1c
	lsl r0, r0, #2
	str r1, [r5, r0]
	b _0222F0A4
_0222EF42:
	bl sub_020393C8
	cmp r0, #0
	ldr r0, _0222F0A8 ; =0x04000304
	beq _0222EF78
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222EF66
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x35
	bl Clear2dMenuWindowAndDelete
	b _0222EF70
_0222EF66:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
_0222EF70:
	add r0, r5, #0
	bl ov44_0222B9A0
	b _0222F0A4
_0222EF78:
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222F000
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x35
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0222EF9C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222EF9C:
	cmp r0, #0
	bne _0222EFE2
	add r0, r5, #0
	mov r1, #0x8a
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222EFB8
	bl GF_AssertFail
_0222EFB8:
	mov r1, #0x2d
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0xee
	bl sub_0200F0AC
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r1, #0xe1
	mov r0, #1
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	mov r2, #0x31
	sub r0, #0x3c
	str r2, [r5, r0]
	mov r0, #0x1e
	sub r1, #0x28
	str r0, [r5, r1]
	b _0222F08A
_0222EFE2:
	add r0, r5, #0
	bl ov44_0222F7BC
	bl sub_020343E4
	bl sub_020393B4
	mov r0, #0xd7
	mov r1, #0x14
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0x41
	sub r0, #0x14
	str r1, [r5, r0]
	b _0222F08A
_0222F000:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020168F4
	cmp r0, #1
	bne _0222F05A
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	add r0, r5, #0
	mov r1, #0x8a
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222F030
	bl GF_AssertFail
_0222F030:
	mov r1, #0x2d
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0xee
	bl sub_0200F0AC
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r1, #0xe1
	mov r0, #1
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	mov r2, #0x31
	sub r0, #0x3c
	str r2, [r5, r0]
	mov r0, #0x1e
	sub r1, #0x28
	str r0, [r5, r1]
	b _0222F08A
_0222F05A:
	cmp r0, #2
	bne _0222F086
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	add r0, r5, #0
	bl ov44_0222F7BC
	bl sub_020343E4
	bl sub_020393B4
	mov r0, #0xd7
	mov r1, #0x14
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r1, #0x41
	sub r0, #0x14
	str r1, [r5, r0]
	b _0222F08A
_0222F086:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0222F08A:
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0222F0A4
	bl sub_020398C8
	add r1, r0, #0
	str r0, [r5, #4]
	add r1, #0x22
	ldrb r1, [r1]
	add r0, #0x21
	strb r1, [r0]
_0222F0A4:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222F0A8: .word 0x04000304
	thumb_func_end ov44_0222EED4

	thumb_func_start ov44_0222F0AC
ov44_0222F0AC: ; 0x0222F0AC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	add r6, r1, #0
	bl ov44_02231C70
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_0222AAEC
	cmp r0, #0
	bne _0222F0E8
	add r0, r5, #0
	sub r1, r4, #1
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F0E8:
	add r0, r5, #0
	sub r1, r4, #1
	bl ov44_02231958
	add r7, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl ov44_02229F00
	ldr r2, _0222F184 ; =0x0000037E
	add r7, #0x21
	ldrh r3, [r5, r2]
	ldrb r1, [r7]
	cmp r3, r0
	bne _0222F10E
	add r0, r2, #2
	ldrh r0, [r5, r0]
	cmp r0, r1
	beq _0222F12C
_0222F10E:
	add r0, r5, #0
	sub r1, r4, #1
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F12C:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222F180
	ldr r0, _0222F188 ; =0x04000304
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222F164
	mov r2, #0x57
	mov r0, #0x35
	lsl r2, r2, #2
	str r0, [sp]
	ldr r0, [r5, r2]
	ldr r1, _0222F18C ; =ov44_0223538C
	add r2, #0x7d
	mov r3, #0xb
	bl Std_CreateYesNoMenu
	mov r1, #0x61
	b _0222F174
_0222F164:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, _0222F190 ; =ov44_02235374
	mov r2, #0
	bl ov44_02231A14
	mov r1, #0x62
_0222F174:
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xd2
	mov r1, #0x40
	lsl r0, r0, #2
	str r1, [r5, r0]
_0222F180:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F184: .word 0x0000037E
_0222F188: .word 0x04000304
_0222F18C: .word ov44_0223538C
_0222F190: .word ov44_02235374
	thumb_func_end ov44_0222F0AC

	thumb_func_start ov44_0222F194
ov44_0222F194: ; 0x0222F194
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	add r4, r1, #0
	bl ov44_02231C70
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov44_0222AAEC
	cmp r0, #0
	bne _0222F1F6
	ldr r0, _0222F4D0 ; =0x04000304
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222F1CE
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x35
	bl Clear2dMenuWindowAndDelete
	b _0222F1D8
_0222F1CE:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
_0222F1D8:
	add r0, r5, #0
	sub r1, r6, #1
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F1F6:
	add r0, r5, #0
	sub r1, r6, #1
	bl ov44_02231958
	add r7, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl ov44_02229F00
	ldr r2, _0222F4D4 ; =0x0000037E
	add r7, #0x21
	ldrh r3, [r5, r2]
	ldrb r1, [r7]
	cmp r3, r0
	bne _0222F21C
	add r0, r2, #2
	ldrh r0, [r5, r0]
	cmp r0, r1
	beq _0222F260
_0222F21C:
	ldr r0, _0222F4D0 ; =0x04000304
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222F238
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x35
	bl Clear2dMenuWindowAndDelete
	b _0222F242
_0222F238:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
_0222F242:
	add r0, r5, #0
	sub r1, r6, #1
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F260:
	bl sub_020393C8
	cmp r0, #0
	beq _0222F296
	ldr r0, _0222F4D0 ; =0x04000304
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222F284
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x35
	bl Clear2dMenuWindowAndDelete
	b _0222F28E
_0222F284:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
_0222F28E:
	add r0, r5, #0
	bl ov44_0222B9A0
	b _0222F4CC
_0222F296:
	bl sub_020390C4
	cmp r0, #3
	ldr r0, _0222F4D0 ; =0x04000304
	blt _0222F2DE
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222F2BA
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x35
	bl Clear2dMenuWindowAndDelete
	b _0222F2C4
_0222F2BA:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
_0222F2C4:
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #0
	bl ov44_0222F510
	bl sub_02039358
	mov r0, #0xd2
	mov r1, #0x1d
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F2DE:
	ldrh r1, [r0]
	lsr r0, r0, #0xb
	and r0, r1
	asr r0, r0, #0xf
	cmp r0, #1
	bne _0222F3D4
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x35
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0222F302
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F302:
	cmp r0, #0
	bne _0222F3AE
	ldr r0, _0222F4D4 ; =0x0000037E
	ldrh r0, [r5, r0]
	bl ov44_0222A0B4
	add r6, r0, #0
	cmp r6, #0x1d
	beq _0222F3AE
	ldr r0, _0222F4D8 ; =0x00000382
	ldrh r0, [r5, r0]
	sub r0, r0, #1
	bl ov44_02231974
	cmp r0, #6
	bne _0222F3AE
	add r0, r5, #0
	bl ov44_0222F89C
	ldr r1, _0222F4D8 ; =0x00000382
	add r0, r5, #0
	ldrh r1, [r5, r1]
	add r2, r6, #0
	sub r1, r1, #1
	bl ov44_0223197C
	cmp r0, #0
	beq _0222F3AE
	mov r0, #0xd
	ldr r1, _0222F4DC ; =0x00000708
	lsl r0, r0, #6
	str r1, [r5, r0]
	add r0, r6, #0
	bl ov44_0222A1B4
	mov r0, #0
	bl sub_020378E4
	add r0, r5, #0
	add r1, r6, #0
	bl ov44_0222F818
	ldr r1, _0222F4D8 ; =0x00000382
	add r0, r5, #0
	ldrh r1, [r5, r1]
	sub r1, r1, #1
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x11
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222F37A
	bl GF_AssertFail
_0222F37A:
	mov r1, #0x2d
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0xee
	bl sub_0200F0AC
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r5, r1]
	cmp r6, #1
	beq _0222F39C
	mov r0, #0xd2
	mov r1, #0x2d
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F39C:
	mov r0, #0xd
	ldr r1, _0222F4DC ; =0x00000708
	lsl r0, r0, #6
	str r1, [r5, r0]
	mov r1, #0x15
	add r0, #8
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F3AE:
	add r0, r5, #0
	bl ov44_0222F7BC
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	add r0, r5, #0
	bl ov44_0222F8F0
	add r0, r5, #0
	bl ov44_0222C120
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F3D4:
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020168F4
	cmp r0, #1
	bne _0222F494
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	ldr r0, _0222F4D4 ; =0x0000037E
	ldrh r0, [r5, r0]
	bl ov44_0222A0B4
	add r6, r0, #0
	cmp r6, #0x1d
	beq _0222F4CC
	ldr r0, _0222F4D8 ; =0x00000382
	ldrh r0, [r5, r0]
	sub r0, r0, #1
	bl ov44_02231974
	cmp r0, #6
	bne _0222F4CC
	add r0, r5, #0
	bl ov44_0222F89C
	ldr r1, _0222F4D8 ; =0x00000382
	add r0, r5, #0
	ldrh r1, [r5, r1]
	add r2, r6, #0
	sub r1, r1, #1
	bl ov44_0223197C
	cmp r0, #0
	beq _0222F4CC
	mov r0, #0xd
	ldr r1, _0222F4DC ; =0x00000708
	lsl r0, r0, #6
	str r1, [r5, r0]
	add r0, r6, #0
	bl ov44_0222A1B4
	mov r0, #0
	bl sub_020378E4
	add r0, r5, #0
	add r1, r6, #0
	bl ov44_0222F818
	ldr r1, _0222F4D8 ; =0x00000382
	add r0, r5, #0
	ldrh r1, [r5, r1]
	sub r1, r1, #1
	bl ov44_0222F780
	add r0, r5, #0
	mov r1, #0x11
	mov r2, #0
	bl ov44_0222F510
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222F460
	bl GF_AssertFail
_0222F460:
	mov r1, #0x2d
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0xee
	bl sub_0200F0AC
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r5, r1]
	cmp r6, #1
	beq _0222F482
	mov r0, #0xd2
	mov r1, #0x2d
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F482:
	mov r0, #0xd
	ldr r1, _0222F4DC ; =0x00000708
	lsl r0, r0, #6
	str r1, [r5, r0]
	mov r1, #0x15
	add r0, #8
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F494:
	cmp r0, #2
	bne _0222F4C8
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02016624
	add r0, r5, #0
	bl ov44_0222F7BC
	add r0, r5, #0
	mov r1, #0x10
	bl ov44_0222F818
	add r0, r5, #0
	bl ov44_0222F8F0
	add r0, r5, #0
	bl ov44_0222C120
	mov r0, #0xd2
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F4C8:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F4CC:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F4D0: .word 0x04000304
_0222F4D4: .word 0x0000037E
_0222F4D8: .word 0x00000382
_0222F4DC: .word 0x00000708
	thumb_func_end ov44_0222F194

	thumb_func_start ov44_0222F4E0
ov44_0222F4E0: ; 0x0222F4E0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	bl sub_02037D78
	cmp r0, #0
	bne _0222F508
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x35
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r4, #2
_0222F508:
	add r0, r4, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov44_0222F4E0

	thumb_func_start ov44_0222F510
ov44_0222F510: ; 0x0222F510
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	beq _0222F520
	mov r0, #1
	b _0222F52E
_0222F520:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetTextFrameDelay
_0222F52E:
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl ov44_0222F910
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222F55C
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	bl RemoveWindow
_0222F55C:
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r5, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222F580
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
_0222F580:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	cmp r0, #8
	beq _0222F5AC
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222F5AC
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
	mov r0, #6
	mov r1, #8
	lsl r0, r0, #6
	str r1, [r5, r0]
_0222F5AC:
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, _0222F668 ; =0x0000012D
	mov r1, #0x2d
	str r0, [sp, #0x10]
	add r0, #0x2f
	lsl r1, r1, #4
	mov r2, #2
	ldr r0, [r5, r0]
	add r1, r5, r1
	add r3, r2, #0
	bl AddWindowParameterized
	cmp r7, #0
	beq _0222F5E8
	mov r2, #0x5b
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, r2, #4
	ldr r2, [r5, r2]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	b _0222F5F8
_0222F5E8:
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	add r1, r6, #0
	bl ReadMsgDataIntoString
_0222F5F8:
	mov r2, #0x59
	lsl r2, r2, #2
	add r1, r2, #0
	ldr r0, [r5, r2]
	add r1, #0x10
	add r2, #0xc
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r2, #0x2d
	lsl r2, r2, #4
	add r0, r5, r2
	mov r1, #1
	sub r2, #0xee
	mov r3, #0xa
	bl DrawFrameAndWindow2
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #1
	bl sub_02002B8C
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	mov r2, #0x5d
	mov r0, #0x2d
	lsl r0, r0, #4
	str r3, [sp, #8]
	lsl r2, r2, #2
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F668: .word 0x0000012D
	thumb_func_end ov44_0222F510

	thumb_func_start ov44_0222F66C
ov44_0222F66C: ; 0x0222F66C
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r1, #0
	bl ov44_0222F910
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222F69C
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	bl RemoveWindow
_0222F69C:
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r5, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222F6C0
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r5, r0
	bl RemoveWindow
_0222F6C0:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	cmp r0, #8
	beq _0222F6EC
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222F6EC
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
	mov r0, #6
	mov r1, #8
	lsl r0, r0, #6
	str r1, [r5, r0]
_0222F6EC:
	mov r3, #4
	str r3, [sp]
	mov r0, #0x17
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp, #8]
	mov r1, #0xc
	str r1, [sp, #0xc]
	mov r0, #0x69
	str r0, [sp, #0x10]
	add r0, #0xf3
	lsl r1, r1, #6
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r2, #2
	bl AddWindowParameterized
	mov r2, #0x5b
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, r2, #4
	ldr r2, [r5, r2]
	add r1, r4, #0
	bl ReadMsgDataIntoString
	mov r2, #0x59
	lsl r2, r2, #2
	add r1, r2, #0
	ldr r0, [r5, r2]
	add r1, #0x10
	add r2, #0xc
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r0, #3
	lsl r0, r0, #8
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #3
	lsl r0, r0, #8
	ldr r2, _0222F77C ; =0x000001D9
	add r0, r5, r0
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	mov r3, #0
	mov r0, #3
	lsl r0, r0, #8
	str r3, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	str r3, [sp, #8]
	add r2, #0x75
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	bl AddTextPrinterParameterized
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r5, r1]
	lsl r0, r1, #1
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_0222F77C: .word 0x000001D9
	thumb_func_end ov44_0222F66C

	thumb_func_start ov44_0222F780
ov44_0222F780: ; 0x0222F780
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0
	add r6, r1, #0
	mvn r0, r0
	cmp r6, r0
	beq _0222F7BA
	mov r0, #0x35
	bl PlayerProfile_new
	add r4, r0, #0
	ldr r0, [r5]
	add r1, r6, #0
	bl sub_0202C254
	add r1, r0, #0
	add r0, r4, #0
	bl Sav2_Profile_PlayerName_set
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r2, r4, #0
	bl BufferPlayersName
	add r0, r4, #0
	bl FreeToHeap
_0222F7BA:
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_0222F780

	thumb_func_start ov44_0222F7BC
ov44_0222F7BC: ; 0x0222F7BC
	push {r4, lr}
	add r4, r0, #0
	bl ov44_0222F910
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #8
	beq _0222F7F0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0222F7F0
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
	mov r0, #6
	mov r1, #8
	lsl r0, r0, #6
	str r1, [r4, r0]
_0222F7F0:
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r4, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222F814
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
_0222F814:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_0222F7BC

	thumb_func_start ov44_0222F818
ov44_0222F818: ; 0x0222F818
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #4]
	cmp r2, #0
	beq _0222F82E
	bl ov44_0222F830
	ldr r0, [r4, #4]
	mov r1, #0x24
	bl ov00_021E6D60
_0222F82E:
	pop {r4, pc}
	thumb_func_end ov44_0222F818

	thumb_func_start ov44_0222F830
ov44_0222F830: ; 0x0222F830
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _0222F89A
	bl ov44_02229F00
	cmp r0, r4
	beq _0222F894
	ldr r0, [r5, #4]
	strb r4, [r0, #0x1b]
	add r0, r4, #0
	bl ov44_0222A020
	cmp r0, #0
	bne _0222F894
	cmp r4, #8
	beq _0222F894
	cmp r4, #0x14
	beq _0222F894
	cmp r4, #0x16
	beq _0222F894
	cmp r4, #0x18
	beq _0222F894
	cmp r4, #0x1a
	beq _0222F894
	cmp r4, #0x12
	beq _0222F894
	cmp r4, #1
	bne _0222F878
	mov r0, #0
	mov r1, #0x1e
	bl GF_SndStartFadeOutBGM
	b _0222F894
_0222F878:
	cmp r4, #0x10
	bne _0222F894
	mov r0, #0
	bl ov00_021E70B8
	bl ov44_0222E074
	cmp r0, #1
	bne _0222F894
	mov r0, #0x78
	mov r1, #0x1e
	mov r2, #1
	bl GF_SndStartFadeInBGM
_0222F894:
	add r0, r5, #0
	bl ov44_0222C120
_0222F89A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222F830

	thumb_func_start ov44_0222F89C
ov44_0222F89C: ; 0x0222F89C
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #4]
	add r0, r2, #0
	add r0, #0x21
	ldrb r1, [r0]
	mov r0, #1
	add r2, #0x21
	sub r0, r0, r1
	strb r0, [r2]
	ldr r0, [r4, #4]
	mov r1, #0x24
	bl ov00_021E6D60
	ldr r0, [r4, #4]
	add r0, #0x21
	ldrb r0, [r0]
	pop {r4, pc}
	thumb_func_end ov44_0222F89C

	thumb_func_start ov44_0222F8C0
ov44_0222F8C0: ; 0x0222F8C0
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #4]
	add r0, r2, #0
	add r0, #0x22
	ldrb r1, [r0]
	mov r0, #1
	add r2, #0x22
	sub r0, r0, r1
	strb r0, [r2]
	ldr r1, [r4, #4]
	add r0, r1, #0
	add r0, #0x22
	ldrb r0, [r0]
	add r1, #0x21
	strb r0, [r1]
	ldr r0, [r4, #4]
	mov r1, #0x24
	bl ov00_021E6D60
	ldr r0, [r4, #4]
	add r0, #0x22
	ldrb r0, [r0]
	pop {r4, pc}
	thumb_func_end ov44_0222F8C0

	thumb_func_start ov44_0222F8F0
ov44_0222F8F0: ; 0x0222F8F0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	add r0, r1, #0
	add r0, #0x22
	ldrb r0, [r0]
	add r1, #0x21
	strb r0, [r1]
	ldr r0, [r4, #4]
	mov r1, #0x24
	bl ov00_021E6D60
	ldr r0, [r4, #4]
	add r0, #0x22
	ldrb r0, [r0]
	pop {r4, pc}
	thumb_func_end ov44_0222F8F0

	thumb_func_start ov44_0222F910
ov44_0222F910: ; 0x0222F910
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222F94E
	bl sub_0200F478
	mov r0, #0x63
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r4, r0
	bl WindowIsInUse
	cmp r0, #0
	beq _0222F94E
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #0x2d
	lsl r0, r0, #4
	add r0, r4, r0
	bl RemoveWindow
_0222F94E:
	pop {r4, pc}
	thumb_func_end ov44_0222F910

	thumb_func_start ov44_0222F950
ov44_0222F950: ; 0x0222F950
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov44_0222FC0C
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov44_02231D8C
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_02230060
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_0222F950

	thumb_func_start ov44_0222F970
ov44_0222F970: ; 0x0222F970
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov44_0222FC00
	cmp r4, r0
	bne _0222F988
	add r0, r5, #0
	add r1, r6, #0
	bl ov44_0222F950
_0222F988:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_0222F970

	thumb_func_start ov44_0222F98C
ov44_0222F98C: ; 0x0222F98C
	ldr r1, _0222F99C ; =0x00000B68
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _0222F998
	mov r0, #1
	bx lr
_0222F998:
	mov r0, #0
	bx lr
	.balign 4, 0
_0222F99C: .word 0x00000B68
	thumb_func_end ov44_0222F98C

	thumb_func_start ov44_0222F9A0
ov44_0222F9A0: ; 0x0222F9A0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, _0222FA14 ; =0x00000B1C
	add r4, r2, #0
	mov r2, #0x92
	add r6, r1, #0
	add r0, r5, r0
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r0, _0222FA18 ; =ov44_022354E8
	ldr r2, _0222FA1C ; =ov44_0222FC84
	mov r1, #8
	add r3, r5, #0
	str r4, [sp]
	bl sub_02026C44
	ldr r1, _0222FA20 ; =0x00000B68
	str r0, [r5, r1]
	add r0, r4, #0
	bl ScrStrBufs_new
	ldr r1, _0222FA14 ; =0x00000B1C
	add r2, r4, #0
	str r0, [r5, r1]
	add r0, r5, #0
	add r1, r6, #0
	bl ov44_0222FCBC
	ldr r0, _0222FA24 ; =0x00000B94
	mov r1, #1
	str r1, [r5, r0]
	add r0, r5, #0
	bl ov44_02230090
	add r0, r5, #0
	bl ov44_022300C8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222FA14: .word 0x00000B1C
_0222FA18: .word ov44_022354E8
_0222FA1C: .word ov44_0222FC84
_0222FA20: .word 0x00000B68
_0222FA24: .word 0x00000B94
	thumb_func_end ov44_0222F9A0

	thumb_func_start ov44_0222FA28
ov44_0222FA28: ; 0x0222FA28
	push {r4, lr}
	add r4, r0, #0
	bl ov44_0222F98C
	cmp r0, #0
	beq _0222FA76
	add r0, r4, #0
	bl ov44_0222FF30
	ldr r0, _0222FA78 ; =0x00000B68
	ldr r0, [r4, r0]
	bl sub_02026CAC
	ldr r0, _0222FA78 ; =0x00000B68
	mov r1, #0
	str r1, [r4, r0]
	sub r0, #0x4c
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	ldr r0, _0222FA7C ; =0x00000B1C
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #1
	add r1, r0, #0
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
_0222FA76:
	pop {r4, pc}
	.balign 4, 0
_0222FA78: .word 0x00000B68
_0222FA7C: .word 0x00000B1C
	thumb_func_end ov44_0222FA28

	thumb_func_start ov44_0222FA80
ov44_0222FA80: ; 0x0222FA80
	push {r4, r5, r6, lr}
	add r4, r0, #0
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	add r6, r1, #0
	bl ov44_02231C8C
	add r5, r0, #0
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov44_02231CE8
	cmp r0, #3
	blo _0222FAA6
	cmp r0, #6
	bhi _0222FAA6
	add r5, r0, #0
_0222FAA6:
	cmp r5, #3
	blo _0222FAD0
	cmp r5, #6
	bhi _0222FAD0
	ldr r0, _0222FB88 ; =0x00000B8C
	sub r1, r5, #3
	ldrb r2, [r4, r0]
	cmp r2, r1
	beq _0222FAD0
	strb r1, [r4, r0]
	ldr r0, _0222FB8C ; =0x000005E1
	bl PlaySE
	add r0, r4, #0
	bl ov44_02230090
	ldr r0, _0222FB90 ; =0x00000B91
	mov r1, #1
	strb r1, [r4, r0]
	add r0, r0, #3
	str r1, [r4, r0]
_0222FAD0:
	ldr r0, _0222FB94 ; =0x00000B8F
	ldrb r1, [r4, r0]
	cmp r1, #1
	bne _0222FAF0
	mov r1, #2
	strb r1, [r4, r0]
	mov r1, #0
	add r0, r0, #1
	strb r1, [r4, r0]
	add r0, r4, #0
	add r1, r6, #0
	bl ov44_02230234
	add r0, r4, #0
	bl ov44_02231720
_0222FAF0:
	ldr r0, _0222FB94 ; =0x00000B8F
	ldrb r1, [r4, r0]
	cmp r1, #0
	bne _0222FB1A
	sub r0, #0x27
	ldr r0, [r4, r0]
	bl sub_02026CC4
	add r0, r4, #0
	bl ov44_022313C8
	ldr r0, _0222FB90 ; =0x00000B91
	ldrb r0, [r4, r0]
	cmp r0, #1
	bne _0222FB1A
	add r0, r4, #0
	bl ov44_022300C8
	ldr r0, _0222FB90 ; =0x00000B91
	mov r1, #0
	strb r1, [r4, r0]
_0222FB1A:
	ldr r0, _0222FB94 ; =0x00000B8F
	ldrb r0, [r4, r0]
	add r0, #0xfe
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0222FB82
	add r0, r4, #0
	bl ov44_02231788
	add r5, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov44_0222FBC8
	cmp r0, #1
	bne _0222FB68
	ldr r1, _0222FB98 ; =0x00000B8D
	mov r3, #1
	ldrb r2, [r4, r1]
	add r0, r1, #6
	strb r2, [r4, r0]
	mov r0, #0
	strb r0, [r4, r1]
	add r2, r1, #1
	strb r0, [r4, r2]
	add r2, r1, #4
	strb r3, [r4, r2]
	add r2, r1, #7
	str r3, [r4, r2]
	add r1, r1, #2
	strb r0, [r4, r1]
	add r0, r4, #0
	bl ov44_02231754
	ldr r0, _0222FB9C ; =0x000005DD
	bl PlaySE
	b _0222FB82
_0222FB68:
	cmp r5, #0
	beq _0222FB82
	ldr r0, _0222FB9C ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	add r1, r5, #0
	bl ov44_0222FC3C
	add r0, r4, #0
	add r1, r6, #0
	bl ov44_02230234
_0222FB82:
	ldr r0, _0222FB98 ; =0x00000B8D
	ldrb r0, [r4, r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222FB88: .word 0x00000B8C
_0222FB8C: .word 0x000005E1
_0222FB90: .word 0x00000B91
_0222FB94: .word 0x00000B8F
_0222FB98: .word 0x00000B8D
_0222FB9C: .word 0x000005DD
	thumb_func_end ov44_0222FA80

	thumb_func_start ov44_0222FBA0
ov44_0222FBA0: ; 0x0222FBA0
	push {r4, lr}
	ldr r1, _0222FBC0 ; =0x00000B8F
	add r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #0
	bne _0222FBBE
	add r1, r1, #2
	ldrb r1, [r4, r1]
	cmp r1, #1
	bne _0222FBBE
	bl ov44_022300C8
	ldr r0, _0222FBC4 ; =0x00000B91
	mov r1, #0
	strb r1, [r4, r0]
_0222FBBE:
	pop {r4, pc}
	.balign 4, 0
_0222FBC0: .word 0x00000B8F
_0222FBC4: .word 0x00000B91
	thumb_func_end ov44_0222FBA0

	thumb_func_start ov44_0222FBC8
ov44_0222FBC8: ; 0x0222FBC8
	ldr r2, _0222FBF4 ; =0x00000B8F
	ldrb r0, [r0, r2]
	cmp r0, #3
	bne _0222FBD4
	mov r0, #0
	bx lr
_0222FBD4:
	ldr r2, _0222FBF8 ; =gSystem
	mov r0, #0xf0
	ldr r3, [r2, #0x44]
	tst r0, r3
	bne _0222FBEA
	ldr r2, [r2, #0x48]
	ldr r0, _0222FBFC ; =0x00000403
	tst r0, r2
	bne _0222FBEA
	cmp r1, #2
	bne _0222FBEE
_0222FBEA:
	mov r0, #1
	bx lr
_0222FBEE:
	mov r0, #0
	bx lr
	nop
_0222FBF4: .word 0x00000B8F
_0222FBF8: .word gSystem
_0222FBFC: .word 0x00000403
	thumb_func_end ov44_0222FBC8

	thumb_func_start ov44_0222FC00
ov44_0222FC00: ; 0x0222FC00
	ldr r1, _0222FC08 ; =0x00000B8D
	ldrb r0, [r0, r1]
	bx lr
	nop
_0222FC08: .word 0x00000B8D
	thumb_func_end ov44_0222FC00

	thumb_func_start ov44_0222FC0C
ov44_0222FC0C: ; 0x0222FC0C
	push {r4, lr}
	add r4, r0, #0
	bl ov44_0222F98C
	cmp r0, #1
	bne _0222FC36
	ldr r0, _0222FC38 ; =0x00000B8D
	mov r2, #0
	strb r2, [r4, r0]
	add r1, r0, #1
	strb r2, [r4, r1]
	add r1, r0, #2
	strb r2, [r4, r1]
	add r1, r0, #4
	mov r2, #1
	strb r2, [r4, r1]
	add r0, r0, #7
	str r2, [r4, r0]
	add r0, r4, #0
	bl ov44_02231754
_0222FC36:
	pop {r4, pc}
	.balign 4, 0
_0222FC38: .word 0x00000B8D
	thumb_func_end ov44_0222FC0C

	thumb_func_start ov44_0222FC3C
ov44_0222FC3C: ; 0x0222FC3C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl ov44_02229EE0
	cmp r0, #1
	bne _0222FC4E
	mov r1, #7
	b _0222FC50
_0222FC4E:
	mov r1, #2
_0222FC50:
	cmp r5, #3
	bne _0222FC68
	mov r0, #0xb9
	lsl r0, r0, #4
	ldrsb r0, [r4, r0]
	add r0, r0, #1
	bl _u32_div_f
	mov r0, #0xb9
	lsl r0, r0, #4
	strb r1, [r4, r0]
	pop {r3, r4, r5, pc}
_0222FC68:
	mov r2, #0xb9
	lsl r2, r2, #4
	ldrsb r3, [r4, r2]
	add r0, r4, r2
	sub r3, r3, #1
	strb r3, [r0]
	ldrsb r2, [r4, r2]
	cmp r2, #0
	bge _0222FC82
	mov r2, #0
	ldrsb r2, [r0, r2]
	add r1, r2, r1
	strb r1, [r0]
_0222FC82:
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_0222FC3C

	thumb_func_start ov44_0222FC84
ov44_0222FC84: ; 0x0222FC84
	push {r3, r4, r5, lr}
	ldr r4, _0222FCB4 ; =0x00000B8C
	ldrb r3, [r2, r4]
	lsl r3, r3, #3
	add r0, r0, r3
	add r3, r4, #0
	add r5, r2, r0
	sub r3, #0x20
	ldrb r3, [r5, r3]
	cmp r3, #2
	bne _0222FCB2
	add r3, r4, #1
	ldrb r3, [r2, r3]
	cmp r3, #0
	bne _0222FCB2
	cmp r1, #0
	bne _0222FCB2
	add r1, r0, #1
	add r0, r4, #1
	strb r1, [r2, r0]
	ldr r0, _0222FCB8 ; =0x000005DD
	bl PlaySE
_0222FCB2:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222FCB4: .word 0x00000B8C
_0222FCB8: .word 0x000005DD
	thumb_func_end ov44_0222FC84

	thumb_func_start ov44_0222FCBC
ov44_0222FCBC: ; 0x0222FCBC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r7, r0, #0
	mov r0, #0x57
	lsl r0, r0, #2
	str r1, [sp, #0x14]
	ldr r0, [r7, r0]
	mov r1, #4
	str r2, [sp, #0x18]
	bl BgClearTilemapBufferAndCommit
	mov r0, #0x80
	str r0, [sp]
	ldr r0, [sp, #0x18]
	mov r1, #0x11
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0xa0
	str r0, [sp]
	ldr r0, [sp, #0x18]
	mov r1, #0x14
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	mov r2, #4
	mov r3, #0x80
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	mov r2, #0x57
	str r0, [sp, #0xc]
	lsl r2, r2, #2
	ldr r0, [sp, #0x14]
	ldr r2, [r7, r2]
	mov r1, #0x10
	mov r3, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0x30
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	mov r2, #0x57
	str r0, [sp, #0xc]
	lsl r2, r2, #2
	ldr r0, [sp, #0x14]
	ldr r2, [r7, r2]
	mov r1, #0x13
	mov r3, #6
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	mov r2, #0x57
	str r0, [sp, #0xc]
	lsl r2, r2, #2
	ldr r0, [sp, #0x14]
	ldr r2, [r7, r2]
	mov r1, #0x12
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [sp, #0x18]
	ldr r3, _0222FF18 ; =0x00000B24
	str r0, [sp]
	ldr r0, [sp, #0x14]
	mov r1, #0x15
	mov r2, #0
	add r3, r7, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r1, #0xb2
	lsl r1, r1, #4
	str r0, [r7, r1]
	add r0, r1, #4
	ldr r0, [r7, r0]
	mov r1, #0x30
	bl ov44_0222FFB4
	ldr r0, _0222FF1C ; =0x00000B44
	mov r6, #0
	add r5, r7, r0
	add r4, r7, #0
_0222FD7A:
	ldr r0, [sp, #0x18]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r1, #0x16
	mov r2, #0
	add r3, r5, #0
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	ldr r1, _0222FF20 ; =0x00000B28
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x1c
	ldr r0, [r4, r0]
	mov r1, #0x30
	bl ov44_0222FFB4
	add r6, r6, #1
	add r5, r5, #4
	add r4, r4, #4
	cmp r6, #7
	blt _0222FD7A
	ldr r0, [sp, #0x18]
	ldr r3, _0222FF24 ; =0x00000B64
	str r0, [sp]
	ldr r0, [sp, #0x14]
	mov r1, #0x1d
	mov r2, #0
	add r3, r7, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r1, #0xb6
	lsl r1, r1, #4
	str r0, [r7, r1]
	add r0, r1, #4
	ldr r0, [r7, r0]
	mov r1, #0x30
	bl ov44_0222FFB4
	mov r1, #0x1e
	ldr r2, [sp, #0x18]
	mov r0, #4
	lsl r1, r1, #4
	bl LoadFontPal1
	mov r0, #0
	ldr r1, _0222FF28 ; =0x00000B98
	str r0, [sp, #0x1c]
	add r0, r7, r1
	str r0, [sp, #0x30]
	mov r0, #1
	add r1, #0x80
	str r0, [sp, #0x2c]
	add r0, r7, r1
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0x24]
_0222FDEC:
	ldr r0, [sp, #0x30]
	bl InitWindow
	ldr r0, [sp, #0x1c]
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r1, r2, r1
	mov r0, #6
	mul r0, r1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	mov r2, #5
	asr r0, r0, #1
	lsr r1, r0, #0x1e
	ldr r0, [sp, #0x1c]
	add r1, r0, r1
	asr r0, r1, #2
	lsl r5, r0, #4
	ldr r0, [sp, #0x20]
	add r3, r5, #4
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	lsl r3, r3, #0x18
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	ldr r1, [sp, #0x30]
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r0, [sp, #0x30]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x30]
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x20]
	ldr r4, [sp, #0x28]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r6, #0
	add r5, r5, #1
	str r0, [sp, #0x34]
_0222FE64:
	add r0, r4, #0
	bl InitWindow
	ldr r0, [sp, #0x34]
	lsl r3, r5, #0x18
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	mov r2, #5
	add r1, r6, r0
	mov r0, #6
	mul r0, r1
	add r0, #0xda
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	add r1, r4, #0
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r6, r6, #1
	add r4, #0x10
	add r5, #0xc
	cmp r6, #2
	blt _0222FE64
	ldr r0, [sp, #0x30]
	add r0, #0x10
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x2c]
	add r0, #0x1b
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	add r0, #0x20
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	add r0, r0, #2
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #8
	blt _0222FDEC
	mov r3, #1
	str r3, [sp]
	mov r0, #0x1e
	str r0, [sp, #4]
	mov r0, #0x15
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	mov r0, #0x57
	ldr r1, _0222FF2C ; =0x00000D18
	str r3, [sp, #0x10]
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	add r1, r7, r1
	mov r2, #7
	bl AddWindowParameterized
	ldr r0, _0222FF2C ; =0x00000D18
	mov r1, #0
	add r0, r7, r0
	bl FillWindowPixelBuffer
	ldr r0, _0222FF2C ; =0x00000D18
	add r0, r7, r0
	bl ScheduleWindowCopyToVram
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x18]
	add r0, r7, #0
	bl ov44_02231420
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222FF18: .word 0x00000B24
_0222FF1C: .word 0x00000B44
_0222FF20: .word 0x00000B28
_0222FF24: .word 0x00000B64
_0222FF28: .word 0x00000B98
_0222FF2C: .word 0x00000D18
	thumb_func_end ov44_0222FCBC

	thumb_func_start ov44_0222FF30
ov44_0222FF30: ; 0x0222FF30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	bl ov44_022316B0
	mov r0, #0
	str r0, [sp, #4]
	ldr r1, _0222FFA8 ; =0x00000B98
	ldr r0, [sp]
	add r7, r0, r1
	add r1, #0x80
	add r6, r0, r1
_0222FF48:
	add r0, r7, #0
	bl RemoveWindow
	mov r4, #0
	add r5, r6, #0
_0222FF52:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #2
	blt _0222FF52
	ldr r0, [sp, #4]
	add r7, #0x10
	add r0, r0, #1
	add r6, #0x20
	str r0, [sp, #4]
	cmp r0, #8
	blt _0222FF48
	ldr r1, _0222FFAC ; =0x00000D18
	ldr r0, [sp]
	add r0, r0, r1
	bl RemoveWindow
	mov r1, #0xb2
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bl FreeToHeap
	ldr r4, [sp]
	ldr r6, _0222FFB0 ; =0x00000B28
	mov r5, #0
_0222FF8A:
	ldr r0, [r4, r6]
	bl FreeToHeap
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #7
	blt _0222FF8A
	mov r1, #0xb6
	ldr r0, [sp]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222FFA8: .word 0x00000B98
_0222FFAC: .word 0x00000D18
_0222FFB0: .word 0x00000B28
	thumb_func_end ov44_0222FF30

	thumb_func_start ov44_0222FFB4
ov44_0222FFB4: ; 0x0222FFB4
	push {r4, r5, r6, r7}
	add r5, r1, #0
	add r1, r0, #0
	add r1, #0xc
	mov ip, r1
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	lsr r2, r1, #3
	lsr r7, r0, #3
	mov r0, #0
	cmp r7, #0
	ble _0222FFF0
	add r3, r0, #0
_0222FFCE:
	mov r1, #0
	cmp r2, #0
	ble _0222FFE8
	lsl r6, r3, #1
	mov r4, ip
	add r4, r4, r6
_0222FFDA:
	ldrh r6, [r4]
	add r1, r1, #1
	add r6, r6, r5
	strh r6, [r4]
	add r4, r4, #2
	cmp r1, r2
	blt _0222FFDA
_0222FFE8:
	add r0, r0, #1
	add r3, r3, r2
	cmp r0, r7
	blt _0222FFCE
_0222FFF0:
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov44_0222FFB4

	thumb_func_start ov44_0222FFF4
ov44_0222FFF4: ; 0x0222FFF4
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r4, r2, #0
	cmp r6, #0
	bne _02230004
	bl GF_AssertFail
_02230004:
	cmp r4, #0
	bne _0223000C
	bl GF_AssertFail
_0223000C:
	cmp r4, #3
	blo _02230014
	bl GF_AssertFail
_02230014:
	ldr r0, _02230024 ; =0x00000B6B
	add r1, r5, r6
	strb r4, [r1, r0]
	mov r1, #1
	add r0, #0x26
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
	nop
_02230024: .word 0x00000B6B
	thumb_func_end ov44_0222FFF4

	thumb_func_start ov44_02230028
ov44_02230028: ; 0x02230028
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bne _02230034
	bl GF_AssertFail
_02230034:
	ldr r0, _02230044 ; =0x00000B6B
	mov r2, #0
	add r1, r5, r4
	strb r2, [r1, r0]
	mov r1, #1
	add r0, #0x26
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02230044: .word 0x00000B6B
	thumb_func_end ov44_02230028

	thumb_func_start ov44_02230048
ov44_02230048: ; 0x02230048
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bne _02230054
	bl GF_AssertFail
_02230054:
	ldr r0, _0223005C ; =0x00000B6B
	add r1, r5, r4
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223005C: .word 0x00000B6B
	thumb_func_end ov44_02230048

	thumb_func_start ov44_02230060
ov44_02230060: ; 0x02230060
	push {r3, lr}
	ldr r2, _0223007C ; =0x00000B8F
	ldrb r3, [r0, r2]
	cmp r3, #0
	beq _02230070
	bl ov44_02230234
	pop {r3, pc}
_02230070:
	mov r3, #1
	add r1, r2, #5
	str r3, [r0, r1]
	bl ov44_022300C8
	pop {r3, pc}
	.balign 4, 0
_0223007C: .word 0x00000B8F
	thumb_func_end ov44_02230060

	thumb_func_start ov44_02230080
ov44_02230080: ; 0x02230080
	ldr r1, _0223008C ; =0x00000B94
	mov r2, #1
	str r2, [r0, r1]
	sub r1, r1, #3
	strb r2, [r0, r1]
	bx lr
	.balign 4, 0
_0223008C: .word 0x00000B94
	thumb_func_end ov44_02230080

	thumb_func_start ov44_02230090
ov44_02230090: ; 0x02230090
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	ldr r0, _022300C4 ; =0x00000B8C
	mov r2, #0
	ldrb r0, [r4, r0]
	mov r1, #4
	add r3, r2, #0
	str r0, [sp, #8]
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl BgTilemapRectChangePalette
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_022300C4: .word 0x00000B8C
	thumb_func_end ov44_02230090

	thumb_func_start ov44_022300C8
ov44_022300C8: ; 0x022300C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r6, r0, #0
	ldr r0, _02230220 ; =0x00000B94
	ldr r1, [r6, r0]
	cmp r1, #1
	bne _022300FA
	mov r2, #0
	str r2, [r6, r0]
	mov r0, #1
	str r0, [sp, #0x18]
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	mov r0, #0x57
	str r2, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #6
	add r3, r2, #0
	bl FillBgTilemapRect
	b _022300FE
_022300FA:
	mov r0, #0
	str r0, [sp, #0x18]
_022300FE:
	ldr r1, _02230224 ; =0x00000B98
	mov r7, #0
	add r0, r6, r1
	add r1, #0x80
	str r0, [sp, #0x14]
	add r0, r6, r1
	str r0, [sp, #0x10]
_0223010C:
	ldr r0, _02230228 ; =0x00000B8C
	ldrb r1, [r6, r0]
	sub r0, #0x21
	lsl r1, r1, #3
	add r1, r7, r1
	add r4, r1, #1
	add r1, r6, r4
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _0223013A
	ldr r0, [r6]
	sub r1, r4, #1
	mov r2, #8
	bl sub_0202C090
	cmp r0, #0
	bne _02230134
	mov r0, #1
	str r0, [sp, #0x1c]
	b _0223013E
_02230134:
	mov r0, #0
	str r0, [sp, #0x1c]
	b _0223013E
_0223013A:
	mov r0, #2
	str r0, [sp, #0x1c]
_0223013E:
	asr r0, r7, #1
	lsr r0, r0, #0x1e
	add r0, r7, r0
	asr r2, r0, #2
	lsr r3, r7, #0x1f
	lsl r1, r7, #0x1e
	sub r1, r1, r3
	mov r0, #0x1e
	ror r1, r0
	add r0, r3, r1
	ldr r1, _0223022C ; =0x00000B8D
	mov ip, r0
	ldrb r0, [r6, r1]
	cmp r4, r0
	bne _02230162
	add r1, r1, #1
	ldrb r5, [r6, r1]
	b _02230164
_02230162:
	mov r5, #0
_02230164:
	cmp r4, r0
	beq _02230170
	ldr r0, _02230230 ; =0x00000B93
	ldrb r0, [r6, r0]
	cmp r4, r0
	bne _02230174
_02230170:
	mov r1, #1
	b _02230176
_02230174:
	mov r1, #0
_02230176:
	ldr r0, [sp, #0x18]
	cmp r0, #1
	beq _02230180
	cmp r1, #1
	bne _022301EC
_02230180:
	lsl r1, r2, #0x1c
	mov r3, #6
	mov r2, ip
	mul r3, r2
	lsl r2, r3, #0x18
	ldr r3, [sp, #0x1c]
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	lsl r3, r3, #0x18
	str r0, [sp]
	add r0, r6, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov44_02231148
	ldr r0, [sp, #0x1c]
	cmp r0, #2
	beq _022301C4
	ldr r1, [sp, #0x14]
	add r0, r6, #0
	add r2, r4, #0
	add r3, r5, #0
	str r7, [sp]
	bl ov44_022312B8
	ldr r1, [sp, #0x10]
	add r0, r6, #0
	add r2, r4, #0
	add r3, r5, #0
	str r7, [sp]
	bl ov44_02231344
	b _022301EC
_022301C4:
	ldr r0, [sp, #0x14]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	bl ScheduleWindowCopyToVram
	ldr r5, [sp, #0x10]
	mov r4, #0
_022301D6:
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #2
	blt _022301D6
_022301EC:
	ldr r0, [sp, #0x14]
	add r7, r7, #1
	add r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r0, #0x20
	str r0, [sp, #0x10]
	cmp r7, #8
	blt _0223010C
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230220: .word 0x00000B94
_02230224: .word 0x00000B98
_02230228: .word 0x00000B8C
_0223022C: .word 0x00000B8D
_02230230: .word 0x00000B93
	thumb_func_end ov44_022300C8

	thumb_func_start ov44_02230234
ov44_02230234: ; 0x02230234
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r5, r0, #0
	ldr r1, _022302F4 ; =0x00000B8D
	ldr r0, [r5]
	ldrb r1, [r5, r1]
	mov r2, #8
	sub r1, r1, #1
	bl sub_0202C090
	cmp r0, #1
	bne _02230252
	mov r4, #7
	b _02230254
_02230252:
	mov r4, #8
_02230254:
	mov r0, #0xb9
	lsl r0, r0, #4
	ldrsb r1, [r5, r0]
	sub r0, #0x4c
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r3, [r1, r0]
	mov r0, #0x57
	add r2, r3, #0
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0x57
	lsl r0, r0, #2
	mov r2, #0
	ldr r0, [r5, r0]
	mov r1, #6
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	bl ov44_02229EE0
	cmp r0, #0
	bne _022302AE
	add r0, r5, #0
	bl ov44_02230FE8
_022302AE:
	ldr r0, _022302F8 ; =0x00000D18
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r2, #0xb9
	lsl r2, r2, #4
	ldrsb r2, [r5, r2]
	add r0, r5, #0
	add r1, r6, #0
	lsl r3, r2, #2
	ldr r2, _022302FC ; =ov44_02236680
	ldr r2, [r2, r3]
	blx r2
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _022302F8 ; =0x00000D18
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	mov r0, #2
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_022302F4: .word 0x00000B8D
_022302F8: .word 0x00000D18
_022302FC: .word ov44_02236680
	thumb_func_end ov44_02230234

	thumb_func_start ov44_02230300
ov44_02230300: ; 0x02230300
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, _02230694 ; =0x00000B8D
	mov r2, #8
	ldrb r0, [r5, r0]
	sub r4, r0, #1
	ldr r0, [r5]
	add r1, r4, #0
	bl sub_0202C090
	cmp r0, #0
	bne _0223031E
	ldr r0, _02230698 ; =0x00050600
	b _02230322
_0223031E:
	mov r0, #0xc1
	lsl r0, r0, #0xa
_02230322:
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_02231918
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x2a
	bl ReadMsgDataIntoString
	mov r2, #0x5e
	ldr r0, _0223069C ; =0x00000B1C
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	sub r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r0, #8
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, [sp, #0x14]
	add r2, #0x79
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, _022306A0 ; =0x00000D18
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r1, #1
	mov r3, #0x20
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_02231958
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	bl ov44_02229F00
	add r1, sp, #0x14
	add r7, r0, #0
	bl ov44_0223120C
	mov r2, #0x5a
	lsl r2, r2, #2
	add r1, r0, #0
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r0, #8
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, [sp, #0x14]
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x71
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #0x68
	bl AddTextPrinterParameterized2
	mov r0, #0x35
	bl PlayerProfile_new
	add r6, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	bl sub_0202C298
	add r1, r0, #0
	add r0, r6, #0
	bl Sav2_Profile_PlayerName_set
	ldr r0, _0223069C ; =0x00000B1C
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r6, #0
	bl BufferPlayersName
	add r0, r6, #0
	bl FreeToHeap
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0x2b
	bl ReadMsgDataIntoString
	mov r0, #0x20
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r1, #0x96
	mov r0, #0x5a
	add r2, r1, #0
	lsl r0, r0, #2
	add r2, #0xda
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r2, #0x5e
	ldr r0, _0223069C ; =0x00000B1C
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	sub r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r1, #0x5e
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0xe8
	sub r3, r1, r0
	mov r0, #0x20
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	bl AddTextPrinterParameterized2
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0x2c
	bl ReadMsgDataIntoString
	mov r0, #0x38
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	ldr r0, [r5]
	add r1, r4, #0
	mov r2, #1
	bl sub_0202C090
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223069C ; =0x00000B1C
	mov r1, #0
	ldr r0, [r5, r0]
	mov r3, #4
	bl BufferIntegerAsString
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x2d
	bl ReadMsgDataIntoString
	mov r2, #0x5e
	ldr r0, _0223069C ; =0x00000B1C
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	sub r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r0, #0x38
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #0x78
	bl AddTextPrinterParameterized2
	ldr r0, [r5]
	add r1, r4, #0
	mov r2, #2
	bl sub_0202C090
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223069C ; =0x00000B1C
	mov r1, #0
	ldr r0, [r5, r0]
	mov r3, #4
	bl BufferIntegerAsString
	mov r0, #0x5a
	mov r1, #0x2e
	lsl r0, r0, #2
	lsl r2, r1, #3
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r2, #0x5e
	ldr r0, _0223069C ; =0x00000B1C
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	sub r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r1, #0x5e
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0xe8
	sub r3, r1, r0
	mov r0, #0x38
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	bl AddTextPrinterParameterized2
	mov r0, #0x5a
	mov r1, #0x2f
	lsl r0, r0, #2
	lsl r2, r1, #3
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r0, #0x50
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	ldr r0, [r5]
	add r1, r4, #0
	mov r2, #3
	bl sub_0202C090
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223069C ; =0x00000B1C
	mov r1, #0
	ldr r0, [r5, r0]
	mov r3, #4
	bl BufferIntegerAsString
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x30
	bl ReadMsgDataIntoString
	mov r2, #0x5e
	ldr r0, _0223069C ; =0x00000B1C
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	sub r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r1, #0x5e
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0xe8
	sub r3, r1, r0
	mov r0, #0x50
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl ov44_02229EF8
	cmp r0, #1
	bne _022306B4
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0x31
	bl ReadMsgDataIntoString
	mov r0, #0x68
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	ldr r0, [r5]
	add r1, r4, #0
	mov r2, #9
	bl sub_0202C090
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223069C ; =0x00000B1C
	mov r1, #0
	ldr r0, [r5, r0]
	mov r3, #4
	bl BufferIntegerAsString
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x32
	bl ReadMsgDataIntoString
	mov r2, #0x5e
	ldr r0, _0223069C ; =0x00000B1C
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	sub r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r1, #0x5e
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0xe8
	sub r3, r1, r0
	mov r0, #0x68
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022306A4 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _022306A0 ; =0x00000D18
	b _022306A8
	nop
_02230694: .word 0x00000B8D
_02230698: .word 0x00050600
_0223069C: .word 0x00000B1C
_022306A0: .word 0x00000D18
_022306A4: .word 0x00010200
_022306A8:
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	bl AddTextPrinterParameterized2
_022306B4:
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0x33
	bl ReadMsgDataIntoString
	mov r0, #0x80
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022307D0 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _022307D4 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	ldr r0, [r5]
	add r1, r4, #0
	mov r2, #6
	bl sub_0202C090
	add r2, r0, #0
	beq _02230788
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _022307D8 ; =0x00000B1C
	mov r1, #2
	ldr r0, [r5, r0]
	add r3, r1, #0
	bl BufferIntegerAsString
	ldr r0, [r5]
	add r1, r4, #0
	mov r2, #4
	bl sub_0202C090
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _022307D8 ; =0x00000B1C
	mov r3, #4
	ldr r0, [r5, r0]
	bl BufferIntegerAsString
	ldr r0, [r5]
	add r1, r4, #0
	mov r2, #5
	bl sub_0202C090
	add r2, r0, #0
	ldr r0, _022307D8 ; =0x00000B1C
	mov r1, #1
	ldr r0, [r5, r0]
	bl BufferMonthNameAbbr
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x4a
	bl ReadMsgDataIntoString
	mov r2, #0x5e
	ldr r0, _022307D8 ; =0x00000B1C
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	sub r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r1, #0x5e
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0xe8
	sub r3, r1, r0
	mov r0, #0x80
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022307D0 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _022307D4 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	bl AddTextPrinterParameterized2
_02230788:
	mov r3, #2
	str r3, [sp]
	mov r0, #0x57
	ldr r1, _022307DC ; =0x00000B0C
	str r7, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r2, #6
	bl ov44_0222AC54
	ldr r0, [sp, #0x10]
	add r0, #0x21
	str r0, [sp, #0x10]
	ldrb r0, [r0]
	cmp r0, #0
	beq _022307AE
	mov r1, #8
	b _022307B0
_022307AE:
	mov r1, #1
_022307B0:
	mov r0, #2
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r1, _022307DC ; =0x00000B0C
	ldr r0, [r5, r0]
	add r1, r5, r1
	mov r2, #6
	mov r3, #0x1c
	bl ov44_0222ABDC
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022307D0: .word 0x00010200
_022307D4: .word 0x00000D18
_022307D8: .word 0x00000B1C
_022307DC: .word 0x00000B0C
	thumb_func_end ov44_02230300

	thumb_func_start ov44_022307E0
ov44_022307E0: ; 0x022307E0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _022308A0 ; =0x00000B8D
	mov r2, #0x5a
	ldrb r0, [r5, r0]
	lsl r2, r2, #2
	mov r1, #0x34
	sub r4, r0, #1
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022308A4 ; =0x000F0E00
	add r2, #0x79
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _022308A8 ; =0x00000D18
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r1, #0x5e
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #0
	add r3, r4, #0
	bl ov44_02231084
	mov r0, #0x18
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022308AC ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _022308A8 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r0, #0x78
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x41
	mov r2, #0x71
	add r3, r4, #0
	bl ov44_02231054
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0x3b
	bl ReadMsgDataIntoString
	mov r0, #0x30
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _022308AC ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _022308A8 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r0, #0x78
	str r0, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x41
	mov r2, #0x70
	add r3, r4, #0
	bl ov44_02231054
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022308A0: .word 0x00000B8D
_022308A4: .word 0x000F0E00
_022308A8: .word 0x00000D18
_022308AC: .word 0x00010200
	thumb_func_end ov44_022307E0

	thumb_func_start ov44_022308B0
ov44_022308B0: ; 0x022308B0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _02230B1C ; =0x00000B8D
	mov r2, #0x5a
	ldrb r0, [r5, r0]
	lsl r2, r2, #2
	mov r1, #0x35
	sub r4, r0, #1
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B20 ; =0x000F0E00
	add r2, #0x79
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _02230B24 ; =0x00000D18
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0x3c
	bl ReadMsgDataIntoString
	mov r0, #0x18
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0x3e
	bl ReadMsgDataIntoString
	mov r1, #0x5e
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0xe8
	sub r3, r1, r0
	mov r0, #0x18
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	bl AddTextPrinterParameterized2
	mov r1, #0x5e
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #1
	add r3, r4, #0
	bl ov44_02231084
	mov r0, #0x30
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r0, #0x68
	str r0, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x41
	mov r2, #0x73
	add r3, r4, #0
	bl ov44_02231054
	mov r0, #0xd4
	str r0, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x42
	mov r2, #0x75
	add r3, r4, #0
	bl ov44_02231054
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0x3b
	bl ReadMsgDataIntoString
	mov r0, #0x40
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r0, #0x68
	str r0, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x41
	mov r2, #0x72
	add r3, r4, #0
	bl ov44_02231054
	mov r0, #0xd4
	str r0, [sp]
	mov r0, #0x40
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x42
	mov r2, #0x74
	add r3, r4, #0
	bl ov44_02231054
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0x3d
	bl ReadMsgDataIntoString
	mov r0, #0x58
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0x3e
	bl ReadMsgDataIntoString
	mov r1, #0x5e
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0xe8
	sub r3, r1, r0
	mov r0, #0x58
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	bl AddTextPrinterParameterized2
	mov r1, #0x5e
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #2
	add r3, r4, #0
	bl ov44_02231084
	mov r0, #0x70
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r0, #0x68
	str r0, [sp]
	mov r0, #0x70
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x41
	mov r2, #0x77
	add r3, r4, #0
	bl ov44_02231054
	mov r0, #0xd4
	str r0, [sp]
	mov r0, #0x70
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x42
	mov r2, #0x79
	add r3, r4, #0
	bl ov44_02231054
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0x3b
	bl ReadMsgDataIntoString
	mov r0, #0x80
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230B28 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230B24 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r0, #0x68
	str r0, [sp]
	mov r0, #0x80
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x41
	mov r2, #0x76
	add r3, r4, #0
	bl ov44_02231054
	mov r0, #0xd4
	str r0, [sp]
	mov r0, #0x80
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x42
	mov r2, #0x78
	add r3, r4, #0
	bl ov44_02231054
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02230B1C: .word 0x00000B8D
_02230B20: .word 0x000F0E00
_02230B24: .word 0x00000D18
_02230B28: .word 0x00010200
	thumb_func_end ov44_022308B0

	thumb_func_start ov44_02230B2C
ov44_02230B2C: ; 0x02230B2C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _02230C58 ; =0x00000B8D
	mov r2, #0x5a
	ldrb r0, [r5, r0]
	lsl r2, r2, #2
	mov r1, #0x36
	sub r4, r0, #1
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230C5C ; =0x000F0E00
	add r2, #0x79
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _02230C60 ; =0x00000D18
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0x3f
	bl ReadMsgDataIntoString
	mov r1, #0x5e
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r0, r0, #1
	lsr r1, r0, #1
	mov r0, #0xb4
	sub r3, r0, r1
	mov r0, #0x18
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230C64 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230C60 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	bl AddTextPrinterParameterized2
	mov r1, #0x5e
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #3
	add r3, r4, #0
	bl ov44_02231084
	mov r0, #0x30
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230C64 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230C60 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r0, #0x68
	str r0, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x44
	mov r2, #0x87
	add r3, r4, #0
	bl ov44_02231054
	mov r0, #0xd4
	str r0, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x43
	mov r2, #0x88
	add r3, r4, #0
	bl ov44_02231054
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0x3b
	bl ReadMsgDataIntoString
	mov r0, #0x50
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230C64 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230C60 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r0, #0x68
	str r0, [sp]
	mov r0, #0x50
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x44
	mov r2, #0x86
	add r3, r4, #0
	bl ov44_02231054
	mov r0, #0xd4
	str r0, [sp]
	mov r0, #0x50
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x43
	mov r2, #0x8a
	add r3, r4, #0
	bl ov44_02231054
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02230C58: .word 0x00000B8D
_02230C5C: .word 0x000F0E00
_02230C60: .word 0x00000D18
_02230C64: .word 0x00010200
	thumb_func_end ov44_02230B2C

	thumb_func_start ov44_02230C68
ov44_02230C68: ; 0x02230C68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r6, r1, #0
	bl sub_0203107C
	add r7, r0, #0
	ldr r0, _02230D7C ; =0x00000B8D
	mov r2, #0x5a
	ldrb r0, [r5, r0]
	lsl r2, r2, #2
	mov r1, #0x37
	sub r4, r0, #1
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230D80 ; =0x000F0E00
	add r2, #0x79
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _02230D84 ; =0x00000D18
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	mov r1, #0x7c
	add r2, r4, #0
	bl sub_020310BC
	add r1, r6, #0
	bl GetSpeciesName
	add r6, r0, #0
	mov r0, #0
	add r1, r6, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r0, r0, #1
	lsr r1, r0, #1
	mov r0, #0x21
	sub r3, r0, r1
	mov r0, #0x18
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02230D88 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230D84 ; =0x00000D18
	add r2, r6, #0
	add r0, r5, r0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	mov r1, #0x5e
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #4
	add r3, r4, #0
	bl ov44_02231084
	mov r0, #0x30
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230D88 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230D84 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r0, #0x6c
	str r0, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x41
	mov r2, #0x7b
	add r3, r4, #0
	bl ov44_02231054
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0x3b
	bl ReadMsgDataIntoString
	mov r0, #0x50
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230D88 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230D84 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r0, #0x6c
	str r0, [sp]
	mov r0, #0x50
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x41
	mov r2, #0x7a
	add r3, r4, #0
	bl ov44_02231054
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230D7C: .word 0x00000B8D
_02230D80: .word 0x000F0E00
_02230D84: .word 0x00000D18
_02230D88: .word 0x00010200
	thumb_func_end ov44_02230C68

	thumb_func_start ov44_02230D8C
ov44_02230D8C: ; 0x02230D8C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _02230E4C ; =0x00000B8D
	mov r2, #0x5a
	ldrb r0, [r5, r0]
	lsl r2, r2, #2
	mov r1, #0x38
	sub r4, r0, #1
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230E50 ; =0x000F0E00
	add r2, #0x79
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _02230E54 ; =0x00000D18
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r1, #0x5e
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #5
	add r3, r4, #0
	bl ov44_02231084
	mov r0, #0x18
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230E58 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230E54 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r0, #0x70
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x45
	mov r2, #0x8f
	add r3, r4, #0
	bl ov44_02231054
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	mov r1, #0x3b
	bl ReadMsgDataIntoString
	mov r0, #0x30
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230E58 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230E54 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	mov r0, #0x70
	str r0, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x45
	mov r2, #0x8e
	add r3, r4, #0
	bl ov44_02231054
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02230E4C: .word 0x00000B8D
_02230E50: .word 0x000F0E00
_02230E54: .word 0x00000D18
_02230E58: .word 0x00010200
	thumb_func_end ov44_02230D8C

	thumb_func_start ov44_02230E5C
ov44_02230E5C: ; 0x02230E5C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0202C6F4
	add r6, r0, #0
	ldr r0, _02230FD4 ; =0x00000B8D
	mov r2, #0x5a
	ldrb r0, [r5, r0]
	lsl r2, r2, #2
	mov r1, #0x46
	sub r4, r0, #1
	ldr r0, [r5, r2]
	add r2, #0x10
	ldr r2, [r5, r2]
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230FD8 ; =0x000F0E00
	add r2, #0x79
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, _02230FDC ; =0x00000D18
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	ldr r0, _02230FE0 ; =0x00000B1C
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl BufferWiFiPlazaActivityName
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x47
	bl ReadMsgDataIntoString
	mov r2, #0x5e
	ldr r0, _02230FE0 ; =0x00000B1C
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	sub r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r0, #0x18
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230FE4 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230FDC ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0xa
	bl sub_0202C090
	add r2, r0, #0
	mov r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x48
	mov r3, #0xa4
	bl ov44_022310C8
	ldr r0, _02230FE0 ; =0x00000B1C
	mov r1, #0
	ldr r0, [r5, r0]
	mov r2, #1
	bl BufferWiFiPlazaActivityName
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x47
	bl ReadMsgDataIntoString
	mov r2, #0x5e
	ldr r0, _02230FE0 ; =0x00000B1C
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	sub r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r0, #0x30
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230FE4 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230FDC ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0xb
	bl sub_0202C090
	add r2, r0, #0
	mov r0, #0x30
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x48
	mov r3, #0xa4
	bl ov44_022310C8
	ldr r0, _02230FE0 ; =0x00000B1C
	mov r1, #0
	ldr r0, [r5, r0]
	mov r2, #2
	bl BufferWiFiPlazaActivityName
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x47
	bl ReadMsgDataIntoString
	mov r2, #0x5e
	ldr r0, _02230FE0 ; =0x00000B1C
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	sub r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r0, #0x48
	str r0, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02230FE4 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02230FDC ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	mov r3, #8
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0xc
	bl sub_0202C090
	add r2, r0, #0
	mov r1, #0x48
	add r0, r5, #0
	mov r3, #0xa4
	str r1, [sp]
	bl ov44_022310C8
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02230FD4: .word 0x00000B8D
_02230FD8: .word 0x000F0E00
_02230FDC: .word 0x00000D18
_02230FE0: .word 0x00000B1C
_02230FE4: .word 0x00010200
	thumb_func_end ov44_02230E5C

	thumb_func_start ov44_02230FE8
ov44_02230FE8: ; 0x02230FE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	mov r4, #0
	add r5, r0, #0
	mov r7, #1
	add r6, r4, #0
_02230FF4:
	ldr r0, _02231050 ; =0x00000B64
	add r2, r4, #0
	ldr r0, [r5, r0]
	add r2, #0x1a
	str r7, [sp]
	add r1, r0, #0
	str r7, [sp, #4]
	add r1, #0xc
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	str r6, [sp, #0x10]
	ldrh r1, [r0]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #6
	add r3, r6, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl CopyToBgTilemapRect
	add r4, r4, #1
	cmp r4, #5
	blt _02230FF4
	mov r0, #5
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #6
	mov r0, #0x57
	str r1, [sp, #8]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #0x1a
	mov r3, #0
	bl BgTilemapRectChangePalette
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02231050: .word 0x00000B64
	thumb_func_end ov44_02230FE8

	thumb_func_start ov44_02231054
ov44_02231054: ; 0x02231054
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r6, r2, #0
	add r7, r3, #0
	add r4, r1, #0
	bl sub_0203107C
	add r1, r6, #0
	add r2, r7, #0
	bl sub_020310BC
	add r2, r0, #0
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_022310C8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov44_02231054

	thumb_func_start ov44_02231084
ov44_02231084: ; 0x02231084
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	add r7, r3, #0
	cmp r4, #6
	blo _02231096
	bl GF_AssertFail
_02231096:
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0203107C
	ldr r1, _022310C4 ; =ov44_022353D0
	lsl r2, r4, #2
	ldr r1, [r1, r2]
	add r2, r7, #0
	bl sub_020310BC
	cmp r0, #0
	bne _022310B4
	mov r1, #0x39
	b _022310B6
_022310B4:
	mov r1, #0x3a
_022310B6:
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r6, #0
	bl ReadMsgDataIntoString
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022310C4: .word ov44_022353D0
	thumb_func_end ov44_02231084

	thumb_func_start ov44_022310C8
ov44_022310C8: ; 0x022310C8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0223113C ; =0x00000B1C
	add r6, r1, #0
	add r4, r3, #0
	ldr r0, [r5, r0]
	mov r1, #0
	mov r3, #4
	bl BufferIntegerAsString
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	mov r2, #0x5e
	ldr r0, _0223113C ; =0x00000B1C
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	sub r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r1, #0x5e
	lsl r1, r1, #2
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r0, r0, #1
	lsr r0, r0, #1
	sub r3, r4, r0
	ldr r0, [sp, #0x20]
	mov r2, #0xff
	str r0, [sp]
	str r2, [sp, #4]
	ldr r0, _02231140 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r0, _02231144 ; =0x00000D18
	str r1, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r5, r0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0223113C: .word 0x00000B1C
_02231140: .word 0x00010200
_02231144: .word 0x00000D18
	thumb_func_end ov44_022310C8

	thumb_func_start ov44_02231148
ov44_02231148: ; 0x02231148
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r2, [sp, #0x1c]
	ldr r4, [sp, #0x38]
	add r5, r0, #0
	add r7, r1, #0
	add r6, r3, #0
	cmp r4, #4
	blo _0223115E
	bl GF_AssertFail
_0223115E:
	cmp r4, #3
	bne _02231164
	mov r4, #1
_02231164:
	cmp r4, #2
	bhs _022311A8
	mov r0, #0x10
	str r0, [sp]
	mov r1, #6
	ldr r0, _02231208 ; =0x00000B24
	str r1, [sp, #4]
	ldr r0, [r5, r0]
	add r2, r7, #0
	add r0, #0xc
	str r0, [sp, #8]
	lsl r0, r4, #0x14
	lsr r0, r0, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	add r0, r6, #0
	mul r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	mov r0, #0x20
	str r0, [sp, #0x14]
	mov r0, #0x12
	str r0, [sp, #0x18]
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x1c]
	bl CopyToBgTilemapRect
	b _022311E4
_022311A8:
	mov r0, #0x10
	str r0, [sp]
	mov r1, #6
	ldr r2, _02231208 ; =0x00000B24
	str r1, [sp, #4]
	ldr r3, [r5, r2]
	mov r2, #0x12
	add r3, #0xc
	lsl r2, r2, #6
	add r2, r3, r2
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	add r2, r6, #0
	mul r2, r1
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r0, #0x12
	str r0, [sp, #0x18]
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x1c]
	add r2, r7, #0
	bl CopyToBgTilemapRect
_022311E4:
	mov r0, #0x10
	str r0, [sp]
	add r0, r6, #4
	mov r1, #6
	lsl r0, r0, #0x18
	str r1, [sp, #4]
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x1c]
	add r2, r7, #0
	bl BgTilemapRectChangePalette
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02231208: .word 0x00000B24
	thumb_func_end ov44_02231148

	thumb_func_start ov44_0223120C
ov44_0223120C: ; 0x0223120C
	ldr r2, _022312B0 ; =0x00010200
	cmp r0, #0x1b
	str r2, [r1]
	bhi _022312AC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02231220: ; jump table
	.short _022312AC - _02231220 - 2 ; case 0
	.short _02231258 - _02231220 - 2 ; case 1
	.short _02231260 - _02231220 - 2 ; case 2
	.short _02231260 - _02231220 - 2 ; case 3
	.short _02231260 - _02231220 - 2 ; case 4
	.short _02231260 - _02231220 - 2 ; case 5
	.short _02231260 - _02231220 - 2 ; case 6
	.short _02231260 - _02231220 - 2 ; case 7
	.short _02231280 - _02231220 - 2 ; case 8
	.short _02231268 - _02231220 - 2 ; case 9
	.short _0223126C - _02231220 - 2 ; case 10
	.short _02231270 - _02231220 - 2 ; case 11
	.short _02231274 - _02231220 - 2 ; case 12
	.short _02231278 - _02231220 - 2 ; case 13
	.short _0223127C - _02231220 - 2 ; case 14
	.short _02231288 - _02231220 - 2 ; case 15
	.short _022312A8 - _02231220 - 2 ; case 16
	.short _022312AC - _02231220 - 2 ; case 17
	.short _0223128C - _02231220 - 2 ; case 18
	.short _0223128C - _02231220 - 2 ; case 19
	.short _02231290 - _02231220 - 2 ; case 20
	.short _02231298 - _02231220 - 2 ; case 21
	.short _0223129C - _02231220 - 2 ; case 22
	.short _022312A4 - _02231220 - 2 ; case 23
	.short _0223129C - _02231220 - 2 ; case 24
	.short _022312A4 - _02231220 - 2 ; case 25
	.short _0223129C - _02231220 - 2 ; case 26
	.short _022312A4 - _02231220 - 2 ; case 27
_02231258:
	ldr r2, _022312B4 ; =0x00020E00
	mov r0, #0x24
	str r2, [r1]
	bx lr
_02231260:
	ldr r2, _022312B4 ; =0x00020E00
	mov r0, #0x1b
	str r2, [r1]
	bx lr
_02231268:
	mov r0, #0x60
	bx lr
_0223126C:
	mov r0, #0x61
	bx lr
_02231270:
	mov r0, #0x5f
	bx lr
_02231274:
	mov r0, #0x63
	bx lr
_02231278:
	mov r0, #0x64
	bx lr
_0223127C:
	mov r0, #0x62
	bx lr
_02231280:
	ldr r2, _022312B4 ; =0x00020E00
	mov r0, #0x1d
	str r2, [r1]
	bx lr
_02231288:
	mov r0, #0x1c
	bx lr
_0223128C:
	mov r0, #0x5c
	bx lr
_02231290:
	ldr r2, _022312B4 ; =0x00020E00
	mov r0, #0x21
	str r2, [r1]
	bx lr
_02231298:
	mov r0, #0x20
	bx lr
_0223129C:
	ldr r2, _022312B4 ; =0x00020E00
	mov r0, #0x23
	str r2, [r1]
	bx lr
_022312A4:
	mov r0, #0x22
	bx lr
_022312A8:
	mov r0, #0x4f
	bx lr
_022312AC:
	mov r0, #0x5c
	bx lr
	.balign 4, 0
_022312B0: .word 0x00010200
_022312B4: .word 0x00020E00
	thumb_func_end ov44_0223120C

	thumb_func_start ov44_022312B8
ov44_022312B8: ; 0x022312B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0
	str r2, [sp, #0x10]
	add r4, r3, #0
	bl FillWindowPixelBuffer
	ldr r0, _02231338 ; =ov44_02235364
	mov r2, #8
	ldrb r7, [r0, r4]
	ldr r0, [sp, #0x10]
	sub r0, r0, #1
	str r0, [sp, #0x14]
	ldr r0, [r5]
	ldr r1, [sp, #0x14]
	bl sub_0202C090
	cmp r0, #0
	bne _022312E8
	ldr r4, _0223133C ; =0x00050600
	b _022312EC
_022312E8:
	mov r4, #0xc1
	lsl r4, r4, #0xa
_022312EC:
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	bl ov44_02231918
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x2a
	bl ReadMsgDataIntoString
	mov r2, #0x5e
	ldr r0, _02231340 ; =0x00000B1C
	lsl r2, r2, #2
	ldr r1, [r5, r2]
	sub r2, #8
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	str r7, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	str r4, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	add r2, #0x79
	ldr r2, [r5, r2]
	add r0, r6, #0
	mov r1, #1
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02231338: .word ov44_02235364
_0223133C: .word 0x00050600
_02231340: .word 0x00000B1C
	thumb_func_end ov44_022312B8

	thumb_func_start ov44_02231344
ov44_02231344: ; 0x02231344
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	sub r1, r2, #1
	add r6, r0, #0
	add r4, r3, #0
	bl ov44_02231958
	str r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	add r0, r6, #0
	bl ov44_02229F00
	str r0, [sp, #8]
	ldr r0, _022313C0 ; =ov44_02235364
	ldrb r0, [r0, r4]
	mov r4, #0
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
_0223136A:
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	cmp r4, #0
	bne _0223138A
	ldr r0, [sp, #8]
	ldr r1, _022313C4 ; =0x00000B0C
	str r0, [sp]
	add r0, r5, #0
	add r1, r6, r1
	mov r2, #0
	add r3, r7, #0
	bl ov44_0222AD34
	b _022313AE
_0223138A:
	ldr r0, [sp, #0xc]
	add r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	beq _02231398
	mov r0, #8
	b _0223139A
_02231398:
	mov r0, #1
_0223139A:
	ldr r1, _022313C4 ; =0x00000B0C
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r6, r1
	mov r2, #0
	add r3, r7, #0
	bl ov44_0222ACE8
_022313AE:
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #2
	blt _0223136A
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022313C0: .word ov44_02235364
_022313C4: .word 0x00000B0C
	thumb_func_end ov44_02231344

	thumb_func_start ov44_022313C8
ov44_022313C8: ; 0x022313C8
	push {r3, r4}
	ldr r1, _02231418 ; =0x00000B8D
	ldrb r2, [r0, r1]
	cmp r2, #0
	beq _02231414
	add r2, r1, #5
	ldrb r2, [r0, r2]
	add r3, r2, #1
	add r2, r1, #5
	strb r3, [r0, r2]
	ldrb r4, [r0, r2]
	add r2, r1, #1
	ldrb r3, [r0, r2]
	ldr r2, _0223141C ; =ov44_02235368
	ldrb r2, [r2, r3]
	cmp r4, r2
	blo _02231414
	mov r3, #0
	add r2, r1, #5
	strb r3, [r0, r2]
	add r2, r1, #1
	ldrb r2, [r0, r2]
	add r4, r2, #1
	add r2, r1, #1
	strb r4, [r0, r2]
	mov r2, #1
	add r4, r1, #4
	strb r2, [r0, r4]
	add r4, r1, #1
	ldrb r4, [r0, r4]
	cmp r4, #4
	blo _02231414
	add r4, r1, #5
	strb r3, [r0, r4]
	add r4, r1, #1
	strb r3, [r0, r4]
	add r1, r1, #2
	strb r2, [r0, r1]
_02231414:
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02231418: .word 0x00000B8D
_0223141C: .word ov44_02235368
	thumb_func_end ov44_022313C8

	thumb_func_start ov44_02231420
ov44_02231420: ; 0x02231420
	push {r4, r5, r6, r7, lr}
	sub sp, #0x12c
	ldr r6, _02231684 ; =ov44_02235570
	str r2, [sp, #0x2c]
	add r5, r0, #0
	add r4, r1, #0
	add r3, sp, #0x9c
	mov r2, #0x12
_02231430:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02231430
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #0x1e
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r1, r4, #0
	str r0, [sp, #8]
	mov r0, #0xaf
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #0x2b
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	ldr r1, _02231688 ; =0x00000D28
	mov r2, #0x2c
	str r0, [r5, r1]
	mov r0, #0x1e
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	add r1, r4, #0
	str r0, [sp, #0xc]
	mov r0, #0xb
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	ldr r1, _0223168C ; =0x00000D2C
	mov r2, #0x29
	str r0, [r5, r1]
	mov r0, #0x1e
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r1, r4, #0
	str r0, [sp, #8]
	mov r0, #0xb1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0xd3
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #0x1e
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r1, r4, #0
	str r0, [sp, #8]
	mov r0, #0xb2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #0x2a
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	ldr r1, _02231690 ; =0x00000D34
	str r0, [r5, r1]
	sub r1, #0xc
	ldr r0, [r5, r1]
	bl sub_0200AE18
	cmp r0, #0
	bne _022314D6
	bl GF_AssertFail
_022314D6:
	ldr r0, _0223168C ; =0x00000D2C
	ldr r0, [r5, r0]
	bl sub_0200B00C
	cmp r0, #0
	bne _022314E6
	bl GF_AssertFail
_022314E6:
	ldr r0, _02231688 ; =0x00000D28
	ldr r0, [r5, r0]
	bl sub_0200A740
	ldr r0, _0223168C ; =0x00000D2C
	ldr r0, [r5, r0]
	bl sub_0200A740
	mov r1, #0x1e
	add r0, r1, #0
	mov r3, #0xaf
	str r1, [sp]
	sub r0, #0x1f
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	lsl r3, r3, #2
	ldr r2, [r5, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r5, r2]
	add r3, #0xc
	str r2, [sp, #0x1c]
	ldr r2, [r5, r3]
	add r3, r1, #0
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x78
	add r2, r1, #0
	bl CreateSpriteResourcesHeader
	mov r0, #0
	add r4, sp, #0x9c
	ldr r7, _02231694 ; =_0223535C
	str r0, [sp, #0x34]
	str r4, [sp, #0x30]
	add r6, r5, #0
_0223153E:
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	str r0, [r4]
	add r0, sp, #0x78
	str r0, [r4, #4]
	ldr r0, [sp, #0x2c]
	str r0, [r4, #0x2c]
	ldr r0, [sp, #0x30]
	bl CreateSprite
	ldr r1, _02231698 ; =0x00000D38
	str r0, [r6, r1]
	add r0, r1, #0
	ldrb r1, [r7]
	ldr r0, [r6, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, [sp, #0x30]
	add r4, #0x30
	add r0, #0x30
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x34]
	add r6, r6, #4
	add r0, r0, #1
	add r7, r7, #1
	str r0, [sp, #0x34]
	cmp r0, #3
	blt _0223153E
	ldr r1, [sp, #0x2c]
	mov r0, #2
	bl FontID_Alloc
	add r0, sp, #0x68
	bl InitWindow
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0x68
	mov r2, #8
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	ldr r1, [sp, #0x2c]
	mov r0, #0x40
	bl String_ctor
	add r4, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x49
	add r2, r4, #0
	bl ReadMsgDataIntoString
	mov r0, #2
	add r1, r4, #0
	mov r2, #0
	mov r3, #0x40
	bl FontID_String_GetCenterAlignmentX
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223169C ; =0x00010200
	add r2, r4, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, sp, #0x68
	mov r1, #2
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	ldr r1, [sp, #0x2c]
	add r0, sp, #0x68
	bl sub_02013910
	mov r1, #2
	add r4, r0, #0
	bl sub_02013948
	ldr r3, _022316A0 ; =0x00000D44
	mov r1, #1
	mov r2, #2
	add r3, r5, r3
	bl sub_02021AC8
	cmp r0, #0
	bne _02231604
	bl GF_AssertFail
_02231604:
	mov r0, #0xb3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	str r0, [sp, #0x38]
	add r0, sp, #0x68
	str r0, [sp, #0x3c]
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	str r0, [sp, #0x40]
	ldr r0, _0223168C ; =0x00000D2C
	ldr r0, [r5, r0]
	bl sub_0200B0F8
	str r0, [sp, #0x44]
	ldr r0, _022316A4 ; =0x00000D3C
	ldr r1, [r5, r0]
	add r0, #0xc
	str r1, [sp, #0x48]
	ldr r0, [r5, r0]
	add r1, r4, #0
	str r0, [sp, #0x4c]
	mov r0, #0x1f
	mvn r0, r0
	str r0, [sp, #0x50]
	add r0, #0x18
	str r0, [sp, #0x54]
	mov r0, #0
	str r0, [sp, #0x58]
	str r0, [sp, #0x5c]
	mov r0, #2
	str r0, [sp, #0x60]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x64]
	add r0, sp, #0x38
	bl sub_02013950
	mov r1, #0xd5
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r4, #0
	bl sub_02013938
	add r0, sp, #0x68
	bl RemoveWindow
	mov r0, #2
	bl FontID_Release
	ldr r0, [sp, #0x2c]
	ldr r2, _022316A8 ; =ov44_022317F0
	str r0, [sp]
	ldr r0, _022316AC ; =ov44_02235394
	mov r1, #3
	add r3, r5, #0
	bl sub_02026C44
	mov r1, #0xd6
	lsl r1, r1, #4
	str r0, [r5, r1]
	add sp, #0x12c
	pop {r4, r5, r6, r7, pc}
	nop
_02231684: .word ov44_02235570
_02231688: .word 0x00000D28
_0223168C: .word 0x00000D2C
_02231690: .word 0x00000D34
_02231694: .word _0223535C
_02231698: .word 0x00000D38
_0223169C: .word 0x00010200
_022316A0: .word 0x00000D44
_022316A4: .word 0x00000D3C
_022316A8: .word ov44_022317F0
_022316AC: .word ov44_02235394
	thumb_func_end ov44_02231420

	thumb_func_start ov44_022316B0
ov44_022316B0: ; 0x022316B0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xd6
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02026CAC
	mov r0, #0xd5
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_020139C8
	ldr r0, _02231710 ; =0x00000D44
	add r0, r5, r0
	bl sub_02021B5C
	ldr r7, _02231714 ; =0x00000D38
	mov r6, #0
	add r4, r5, #0
_022316D6:
	ldr r0, [r4, r7]
	bl sub_02024758
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #3
	blt _022316D6
	ldr r0, _02231718 ; =0x00000D28
	ldr r0, [r5, r0]
	bl sub_0200AEB0
	ldr r0, _0223171C ; =0x00000D2C
	ldr r0, [r5, r0]
	bl sub_0200B0A8
	mov r7, #0xaf
	ldr r6, _02231718 ; =0x00000D28
	mov r4, #0
	lsl r7, r7, #2
_022316FC:
	ldr r0, [r5, r7]
	ldr r1, [r5, r6]
	bl DestroySingle2DGfxResObj
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _022316FC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02231710: .word 0x00000D44
_02231714: .word 0x00000D38
_02231718: .word 0x00000D28
_0223171C: .word 0x00000D2C
	thumb_func_end ov44_022316B0

	thumb_func_start ov44_02231720
ov44_02231720: ; 0x02231720
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _02231748 ; =0x00000D54
	mov r1, #1
	str r1, [r5, r0]
	mov r0, #0x10
	bl GX_EngineBToggleLayers
	ldr r0, _0223174C ; =0x00000D58
	mov r4, #0
	ldr r6, _02231750 ; =0x00000B1C
	str r4, [r5, r0]
_02231738:
	add r0, r5, r6
	add r1, r4, #0
	bl ov44_02231800
	add r4, r4, #1
	cmp r4, #3
	blt _02231738
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02231748: .word 0x00000D54
_0223174C: .word 0x00000D58
_02231750: .word 0x00000B1C
	thumb_func_end ov44_02231720

	thumb_func_start ov44_02231754
ov44_02231754: ; 0x02231754
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02231784 ; =0x00000D54
	ldr r1, [r4, r0]
	cmp r1, #2
	bne _02231776
	sub r0, #0x18
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xd5
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_020137C0
_02231776:
	ldr r0, _02231784 ; =0x00000D54
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #0x10
	bl GX_EngineBToggleLayers
	pop {r4, pc}
	.balign 4, 0
_02231784: .word 0x00000D54
	thumb_func_end ov44_02231754

	thumb_func_start ov44_02231788
ov44_02231788: ; 0x02231788
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _022317E0 ; =0x00000D54
	add r5, r0, #0
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _02231798
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02231798:
	mov r2, #3
	add r0, r1, #4
	str r2, [r5, r0]
	add r0, r1, #0
	mov r2, #0xff
	add r0, #8
	add r1, #0xc
	str r2, [r5, r0]
	ldr r0, [r5, r1]
	bl sub_02026CC4
	ldr r6, _022317E4 ; =0x00000B1C
	ldr r7, _022317E0 ; =0x00000D54
	mov r4, #0
_022317B4:
	ldr r0, [r5, r7]
	cmp r0, #2
	bne _022317BE
	cmp r4, #1
	beq _022317D6
_022317BE:
	ldr r2, _022317E8 ; =0x00000D58
	ldr r3, _022317EC ; =0x00000D5C
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	add r0, r5, r6
	add r1, r4, #0
	bl ov44_0223183C
	cmp r0, #1
	bne _022317D6
	add r0, r4, #1
	pop {r3, r4, r5, r6, r7, pc}
_022317D6:
	add r4, r4, #1
	cmp r4, #3
	blt _022317B4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022317E0: .word 0x00000D54
_022317E4: .word 0x00000B1C
_022317E8: .word 0x00000D58
_022317EC: .word 0x00000D5C
	thumb_func_end ov44_02231788

	thumb_func_start ov44_022317F0
ov44_022317F0: ; 0x022317F0
	ldr r3, _022317FC ; =0x00000D58
	str r0, [r2, r3]
	add r0, r3, #4
	str r1, [r2, r0]
	bx lr
	nop
_022317FC: .word 0x00000D58
	thumb_func_end ov44_022317F0

	thumb_func_start ov44_02231800
ov44_02231800: ; 0x02231800
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r0, #0x87
	ldr r1, _02231838 ; =_0223535C
	lsl r0, r0, #2
	add r6, r5, r0
	lsl r7, r4, #2
	ldrb r1, [r1, r4]
	ldr r0, [r6, r7]
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r6, r7]
	mov r1, #4
	bl sub_020249D4
	cmp r4, #1
	bne _02231836
	mov r0, #0x8d
	mov r1, #0x1f
	lsl r0, r0, #2
	mvn r1, r1
	add r2, r1, #0
	ldr r0, [r5, r0]
	add r2, #0x18
	bl sub_020136B4
_02231836:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02231838: .word _0223535C
	thumb_func_end ov44_02231800

	thumb_func_start ov44_0223183C
ov44_0223183C: ; 0x0223183C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	mov r0, #0
	add r5, r1, #0
	add r6, r3, #0
	str r0, [sp, #8]
	cmp r2, r5
	bne _022318BE
	mov r1, #0x87
	ldr r0, [sp]
	lsl r1, r1, #2
	lsl r4, r5, #2
	add r7, r0, r1
	ldr r0, [r7, r4]
	bl sub_020249F8
	str r0, [sp, #4]
	cmp r6, #0
	beq _02231868
	cmp r6, #2
	bne _022318B0
_02231868:
	cmp r6, #0
	bne _02231876
	ldr r1, _0223190C ; =ov44_02235360
	ldr r0, [r7, r4]
	ldrb r1, [r1, r5]
	bl Set2dSpriteAnimSeqNo
_02231876:
	ldr r0, [sp, #4]
	cmp r0, #3
	bhs _02231904
	mov r1, #2
	ldr r0, [r7, r4]
	lsl r1, r1, #0xc
	bl sub_020249B0
	ldr r0, [r7, r4]
	bl sub_020249F8
	add r4, r0, #0
	cmp r5, #1
	bne _022318A6
	ldr r2, _02231910 ; =ov44_0223536C
	mov r1, #0x8d
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0x1f
	ldrsb r2, [r2, r4]
	mvn r1, r1
	bl sub_020136B4
_022318A6:
	cmp r4, #3
	blo _02231904
	mov r0, #1
	str r0, [sp, #8]
	b _02231904
_022318B0:
	cmp r6, #1
	bne _02231904
	cmp r0, #3
	bhs _02231904
	mov r0, #1
	str r0, [sp, #8]
	b _02231904
_022318BE:
	mov r1, #0x87
	ldr r0, [sp]
	lsl r1, r1, #2
	lsl r4, r5, #2
	add r6, r0, r1
	ldr r0, [r6, r4]
	bl sub_020249A8
	add r7, r0, #0
	ldr r0, [r6, r4]
	bl sub_020249F8
	str r0, [sp, #0xc]
	ldr r0, _0223190C ; =ov44_02235360
	ldrb r0, [r0, r5]
	cmp r7, r0
	bne _022318FA
	ldr r1, _02231914 ; =_0223535C
	ldr r0, [r6, r4]
	ldrb r1, [r1, r5]
	bl Set2dSpriteAnimSeqNo
	ldr r1, [sp, #0xc]
	mov r2, #4
	sub r1, r2, r1
	lsl r1, r1, #0x10
	ldr r0, [r6, r4]
	lsr r1, r1, #0x10
	bl sub_020249D4
_022318FA:
	mov r1, #2
	ldr r0, [r6, r4]
	lsl r1, r1, #0xc
	bl sub_020249B0
_02231904:
	ldr r0, [sp, #8]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223190C: .word ov44_02235360
_02231910: .word ov44_0223536C
_02231914: .word _0223535C
	thumb_func_end ov44_0223183C

	thumb_func_start ov44_02231918
ov44_02231918: ; 0x02231918
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0
	add r6, r1, #0
	mvn r0, r0
	cmp r6, r0
	beq _02231950
	mov r0, #0x35
	bl PlayerProfile_new
	add r4, r0, #0
	ldr r0, [r5]
	add r1, r6, #0
	bl sub_0202C254
	add r1, r0, #0
	add r0, r4, #0
	bl Sav2_Profile_PlayerName_set
	ldr r0, _02231954 ; =0x00000B1C
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl BufferPlayersName
	add r0, r4, #0
	bl FreeToHeap
_02231950:
	pop {r4, r5, r6, pc}
	nop
_02231954: .word 0x00000B1C
	thumb_func_end ov44_02231918

	thumb_func_start ov44_02231958
ov44_02231958: ; 0x02231958
	cmp r1, #0x20
	blo _02231962
	ldr r1, _02231970 ; =0x00001098
	add r0, r0, r1
	bx lr
_02231962:
	ldr r2, [r0, #4]
	mov r0, #0x24
	add r2, #0x24
	mul r0, r1
	add r0, r2, r0
	bx lr
	nop
_02231970: .word 0x00001098
	thumb_func_end ov44_02231958

	thumb_func_start ov44_02231974
ov44_02231974: ; 0x02231974
	ldr r3, _02231978 ; =ov00_021E6D68
	bx r3
	.balign 4, 0
_02231978: .word ov00_021E6D68
	thumb_func_end ov44_02231974

	thumb_func_start ov44_0223197C
ov44_0223197C: ; 0x0223197C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0xf
	add r4, r1, #0
	add r6, r2, #0
	bl sub_020379A0
	ldr r0, [r5, #4]
	add r0, #0x21
	ldrb r0, [r0]
	bl ov00_021E70B8
	add r0, r6, #0
	bl ov44_02229F44
	cmp r0, #1
	bne _022319A8
	mov r0, #1
	mov r1, #0x80
	bl ov00_021E714C
	b _022319B0
_022319A8:
	mov r0, #0
	mov r1, #0x80
	bl ov00_021E714C
_022319B0:
	bl sub_02097214
	add r0, r4, #0
	bl sub_02039080
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_0223197C

	thumb_func_start ov44_022319BC
ov44_022319BC: ; 0x022319BC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _022319E8 ; =0x00000D64
	add r4, r1, #0
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _022319E6
	mov r1, #1
	str r1, [r5, r0]
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov44_02231D94
	cmp r4, #1
	bne _022319E6
	add r0, r5, #0
	mov r1, #9
	mov r2, #0
	bl ov44_0222F510
_022319E6:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022319E8: .word 0x00000D64
	thumb_func_end ov44_022319BC

	thumb_func_start ov44_022319EC
ov44_022319EC: ; 0x022319EC
	push {r4, lr}
	ldr r1, _02231A10 ; =0x00000D64
	add r4, r0, #0
	ldr r2, [r4, r1]
	cmp r2, #1
	bne _02231A0C
	mov r2, #0
	str r2, [r4, r1]
	bl ov44_0222F7BC
	mov r0, #0xe3
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ov44_02231D94
_02231A0C:
	pop {r4, pc}
	nop
_02231A10: .word 0x00000D64
	thumb_func_end ov44_022319EC

	thumb_func_start ov44_02231A14
ov44_02231A14: ; 0x02231A14
	push {r4, lr}
	bl ov44_02231A28
	mov r1, #1
	add r4, r0, #0
	bl sub_020169F4
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02231A14

	thumb_func_start ov44_02231A28
ov44_02231A28: ; 0x02231A28
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x35
	add r4, r1, #0
	add r6, r2, #0
	bl sub_0201660C
	str r5, [sp]
	ldrb r1, [r4]
	add r7, r0, #0
	str r1, [sp, #4]
	ldrh r1, [r4, #6]
	str r1, [sp, #8]
	ldrb r1, [r4, #5]
	str r1, [sp, #0xc]
	ldrb r2, [r4, #1]
	add r1, sp, #0
	strb r2, [r1, #0x10]
	ldrb r2, [r4, #2]
	strb r2, [r1, #0x11]
	ldrb r3, [r1, #0x12]
	mov r2, #0xf
	bic r3, r2
	strb r3, [r1, #0x12]
	ldrb r2, [r1, #0x12]
	mov r3, #0xf0
	bic r2, r3
	lsl r3, r6, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x18
	orr r2, r3
	strb r2, [r1, #0x12]
	mov r2, #0
	strb r2, [r1, #0x13]
	add r1, sp, #0
	bl sub_020166FC
	add r0, r7, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov44_02231A28

	thumb_func_start ov44_02231A7C
ov44_02231A7C: ; 0x02231A7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r2, #0
	add r4, r1, #0
	ldr r2, _02231B3C ; =0x000006FC
	mov r1, #0
	add r5, r0, #0
	str r3, [sp]
	bl memset
	ldr r0, [sp, #0x24]
	str r4, [r5, #4]
	sub r0, r0, #1
	lsr r7, r0, #3
	ldr r0, [sp]
	add r2, r6, #0
	str r0, [r5, #0x10]
	add r0, r5, #0
	ldr r1, [r5, #4]
	add r0, #0x14
	bl ov44_02232298
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	bl ov44_02232334
	add r0, r7, #0
	bl ov44_02232E90
	add r2, sp, #4
	strh r0, [r2]
	lsr r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	strh r0, [r2, #4]
	ldrh r1, [r2, #2]
	strh r1, [r2, #6]
	ldrh r0, [r2, #4]
	add r2, r4, #0
	bl ov42_02227EE0
	ldr r1, _02231B40 ; =0x000006E4
	str r0, [r5, r1]
	add r0, r7, #0
	bl ov44_02232E9C
	add r1, r0, #0
	ldr r0, _02231B40 ; =0x000006E4
	ldr r0, [r5, r0]
	bl ov42_02227F48
	mov r0, #0x30
	add r1, r4, #0
	bl ov42_02228010
	ldr r1, _02231B44 ; =0x000006E8
	add r2, r4, #0
	str r0, [r5, r1]
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl ov44_02232204
	mov r0, #0x6f
	lsl r0, r0, #4
	add r0, r5, r0
	bl ov42_02229394
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov44_02232248
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	add r2, r6, #0
	bl ov44_0223233C
	mov r1, #0x6d
	lsl r1, r1, #4
	add r0, r5, #0
	add r1, r5, r1
	add r2, r6, #0
	bl ov44_02232CCC
	mov r0, #0x80
	add r1, r4, #0
	bl ov42_02229A40
	ldr r1, _02231B48 ; =0x000006F8
	str r0, [r5, r1]
	mov r0, #1
	str r0, [r5]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02231B3C: .word 0x000006FC
_02231B40: .word 0x000006E4
_02231B44: .word 0x000006E8
_02231B48: .word 0x000006F8
	thumb_func_end ov44_02231A7C

	thumb_func_start ov44_02231B4C
ov44_02231B4C: ; 0x02231B4C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02231BA0 ; =0x000006F8
	ldr r0, [r4, r0]
	bl ov42_02229A78
	add r0, r4, #0
	bl ov44_02232288
	mov r1, #0x6d
	lsl r1, r1, #4
	add r0, r4, #0
	add r1, r4, r1
	bl ov44_02232D08
	add r0, r4, #0
	bl ov44_02232028
	add r0, r4, #0
	bl ov44_02232238
	ldr r0, _02231BA4 ; =0x000006E8
	ldr r0, [r4, r0]
	bl ov42_02228050
	ldr r0, _02231BA8 ; =0x000006E4
	ldr r0, [r4, r0]
	bl ov42_02227F28
	add r0, r4, #0
	add r0, #0x14
	bl ov44_022322E8
	ldr r0, [r4, #0x10]
	bl ov44_02232338
	ldr r2, _02231BAC ; =0x000006FC
	add r0, r4, #0
	mov r1, #0
	bl memset
	pop {r4, pc}
	.balign 4, 0
_02231BA0: .word 0x000006F8
_02231BA4: .word 0x000006E8
_02231BA8: .word 0x000006E4
_02231BAC: .word 0x000006FC
	thumb_func_end ov44_02231B4C

	thumb_func_start ov44_02231BB0
ov44_02231BB0: ; 0x02231BB0
	ldr r0, [r0]
	bx lr
	thumb_func_end ov44_02231BB0

	thumb_func_start ov44_02231BB4
ov44_02231BB4: ; 0x02231BB4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02231C50 ; =0x000006E8
	ldr r0, [r4, r0]
	bl ov42_0222807C
	add r0, r4, #0
	bl ov44_02232158
	add r0, r4, #0
	bl ov44_02232104
	mov r1, #0x6f
	lsl r1, r1, #4
	add r0, r4, r1
	sub r1, #0x24
	ldr r1, [r4, r1]
	ldr r1, [r1]
	bl ov42_02229358
	ldr r1, _02231C54 ; =0x000006F4
	ldr r0, [r4, r1]
	sub r1, r1, #4
	add r1, r4, r1
	bl ov42_02229420
	ldr r0, _02231C58 ; =0x000006EC
	ldr r0, [r4, r0]
	bl ov42_022290DC
	add r0, r4, #0
	bl ov44_02232194
	add r0, r4, #0
	bl ov44_02232594
	add r0, r4, #0
	bl ov44_02232050
	cmp r0, #1
	bne _02231C4A
	add r0, r4, #0
	bl ov44_02232604
	cmp r0, #1
	bne _02231C24
	add r0, r4, #0
	bl ov44_0223254C
	ldr r0, _02231C5C ; =gSystem
	ldr r1, [r0, #0x44]
	mov r0, #0x80
	tst r0, r1
	beq _02231C24
	mov r0, #1
	pop {r4, pc}
_02231C24:
	ldr r0, _02231C5C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02231C4A
	add r0, r4, #0
	bl ov44_02231C70
	cmp r0, #0
	beq _02231C3C
	mov r0, #2
	pop {r4, pc}
_02231C3C:
	add r0, r4, #0
	bl ov44_02232070
	cmp r0, #1
	bne _02231C4A
	mov r0, #3
	pop {r4, pc}
_02231C4A:
	mov r0, #0
	pop {r4, pc}
	nop
_02231C50: .word 0x000006E8
_02231C54: .word 0x000006F4
_02231C58: .word 0x000006EC
_02231C5C: .word gSystem
	thumb_func_end ov44_02231BB4

	thumb_func_start ov44_02231C60
ov44_02231C60: ; 0x02231C60
	push {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	beq _02231C6E
	ldr r0, [r0, #0x14]
	bl sub_0202457C
_02231C6E:
	pop {r3, pc}
	thumb_func_end ov44_02231C60

	thumb_func_start ov44_02231C70
ov44_02231C70: ; 0x02231C70
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02231C88 ; =0x000006CC
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02231C80
	bl GF_AssertFail
_02231C80:
	ldr r0, _02231C88 ; =0x000006CC
	ldr r0, [r4, r0]
	ldrb r0, [r0, #0xa]
	pop {r4, pc}
	.balign 4, 0
_02231C88: .word 0x000006CC
	thumb_func_end ov44_02231C70

	thumb_func_start ov44_02231C8C
ov44_02231C8C: ; 0x02231C8C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _02231CE0 ; =0x000006CC
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02231C9E
	bl GF_AssertFail
_02231C9E:
	ldr r0, _02231CE0 ; =0x000006CC
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl ov42_022282DC
	add r2, sp, #0
	strh r0, [r2]
	lsr r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	mov r1, #4
	strh r0, [r2, #4]
	ldrh r0, [r2, #2]
	strh r0, [r2, #6]
	ldrsh r3, [r2, r1]
	ldr r0, _02231CE4 ; =0x000006E4
	asr r1, r3, #3
	lsr r1, r1, #0x1c
	add r1, r3, r1
	mov r3, #6
	ldrsh r3, [r2, r3]
	lsl r1, r1, #0xc
	ldr r0, [r4, r0]
	asr r2, r3, #3
	lsr r2, r2, #0x1c
	add r2, r3, r2
	lsl r2, r2, #0xc
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl ov42_02227FDC
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_02231CE0: .word 0x000006CC
_02231CE4: .word 0x000006E4
	thumb_func_end ov44_02231C8C

	thumb_func_start ov44_02231CE8
ov44_02231CE8: ; 0x02231CE8
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _02231D40 ; =0x000006CC
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02231CFA
	bl GF_AssertFail
_02231CFA:
	ldr r0, _02231D40 ; =0x000006CC
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl ov42_022282DC
	add r2, sp, #0
	strh r0, [r2]
	lsr r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	mov r1, #4
	strh r0, [r2, #4]
	ldrh r0, [r2, #2]
	strh r0, [r2, #6]
	ldrsh r3, [r2, r1]
	ldr r0, _02231D44 ; =0x000006E4
	asr r1, r3, #3
	lsr r1, r1, #0x1c
	add r1, r3, r1
	mov r3, #6
	ldrsh r3, [r2, r3]
	lsl r1, r1, #0xc
	ldr r0, [r4, r0]
	asr r2, r3, #3
	lsr r2, r2, #0x1c
	add r2, r3, r2
	asr r2, r2, #4
	add r2, r2, #1
	lsl r2, r2, #0x10
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl ov42_02227FDC
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_02231D40: .word 0x000006CC
_02231D44: .word 0x000006E4
	thumb_func_end ov44_02231CE8

	thumb_func_start ov44_02231D48
ov44_02231D48: ; 0x02231D48
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r0, #0
	ldr r0, [r5]
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	ldr r0, [r5, #4]
	bl ov42_0222920C
	add r2, r0, #0
	add r1, sp, #0
	add r0, r4, #0
	mov r4, sp
	ldrh r3, [r1, #4]
	sub r4, r4, #4
	sub r2, r2, #2
	strh r3, [r4]
	ldrh r1, [r1, #6]
	strh r1, [r4, #2]
	ldr r1, [r4]
	bl ov44_022325A4
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_02231D48

	thumb_func_start ov44_02231D8C
ov44_02231D8C: ; 0x02231D8C
	ldr r3, _02231D90 ; =ov44_022325F4
	bx r3
	.balign 4, 0
_02231D90: .word ov44_022325F4
	thumb_func_end ov44_02231D8C

	thumb_func_start ov44_02231D94
ov44_02231D94: ; 0x02231D94
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov44_02231D94

	thumb_func_start ov44_02231D98
ov44_02231D98: ; 0x02231D98
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov44_02231D98

	thumb_func_start ov44_02231D9C
ov44_02231D9C: ; 0x02231D9C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	bl ov44_02232798
	add r4, r0, #0
	ldr r0, _02231E00 ; =0x000006CC
	add r1, sp, #0xc
	str r4, [r5, r0]
	add r0, r5, #0
	bl ov44_02232724
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0xc
	str r3, [sp, #8]
	bl ov44_02232800
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_02232864
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov44_022327C8
	mov r1, #0x6f
	lsl r1, r1, #4
	add r0, r5, r1
	sub r1, #0x24
	ldr r1, [r5, r1]
	ldr r1, [r1]
	bl ov42_02229358
	ldr r1, _02231E04 ; =0x000006F4
	ldr r0, [r5, r1]
	sub r1, r1, #4
	add r1, r5, r1
	bl ov42_02229420
	add r0, r4, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02231E00: .word 0x000006CC
_02231E04: .word 0x000006F4
	thumb_func_end ov44_02231D9C

	thumb_func_start ov44_02231E08
ov44_02231E08: ; 0x02231E08
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r6, r2, #0
	add r7, r1, #0
	bl ov44_02232798
	add r4, r0, #0
	add r0, r5, #0
	add r1, sp, #0x14
	sub r2, r6, #1
	bl ov44_02232680
	ldr r0, _02231E90 ; =0x000006CC
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02231E5E
	ldr r0, [r0]
	bl ov42_022282DC
	add r1, sp, #0xc
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r2, #8
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	mov r0, #4
	ldrsh r0, [r1, r0]
	ldrsh r2, [r1, r2]
	cmp r0, r2
	bne _02231E5E
	mov r0, #6
	mov r2, #0xa
	ldrsh r0, [r1, r0]
	ldrsh r1, [r1, r2]
	cmp r0, r1
	bne _02231E5E
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02231E5E:
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #0x14
	add r3, r6, #0
	bl ov44_02232800
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_02232884
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov44_022327C8
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02231E90: .word 0x000006CC
	thumb_func_end ov44_02231E08

	thumb_func_start ov44_02231E94
ov44_02231E94: ; 0x02231E94
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #6
	bl ov42_02228188
	ldr r0, _02231ECC ; =ov44_02232BCC
	mov r1, #0
	str r0, [r4, #0x10]
	ldr r0, _02231ED0 ; =ov44_02232914
	str r0, [r4, #0x18]
	mov r0, #2
	strh r0, [r4, #0xc]
	strh r1, [r4, #8]
	ldr r0, [r4, #4]
	bl ov42_0222919C
	ldr r0, [r4, #4]
	bl ov42_022291A0
	add r0, r5, #0
	mov r1, #4
	add r2, r4, #0
	bl ov44_02232C6C
	pop {r3, r4, r5, pc}
	nop
_02231ECC: .word ov44_02232BCC
_02231ED0: .word ov44_02232914
	thumb_func_end ov44_02231E94

	thumb_func_start ov44_02231ED4
ov44_02231ED4: ; 0x02231ED4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl ov42_022290C4
	ldr r0, [r4]
	bl ov42_02228100
	mov r1, #0x1c
	mov r0, #0
_02231EE8:
	strb r0, [r4]
	add r4, r4, #1
	sub r1, r1, #1
	bne _02231EE8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02231ED4

	thumb_func_start ov44_02231EF4
ov44_02231EF4: ; 0x02231EF4
	push {r3, lr}
	ldr r0, [r0]
	mov r1, #4
	bl ov42_02228188
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end ov44_02231EF4

	thumb_func_start ov44_02231F04
ov44_02231F04: ; 0x02231F04
	push {r3, lr}
	ldr r0, [r0]
	mov r1, #6
	bl ov42_02228188
	bl ov42_022282A4
	pop {r3, pc}
	thumb_func_end ov44_02231F04

	thumb_func_start ov44_02231F14
ov44_02231F14: ; 0x02231F14
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5, #0x10]
	add r4, r2, #0
	str r0, [r5, #0x14]
	ldr r0, _02231F84 ; =ov44_02232C48
	mov r1, #4
	str r0, [r5, #0x10]
	ldrh r0, [r5, #0xc]
	strh r0, [r5, #0xe]
	mov r0, #5
	strh r0, [r5, #0xc]
	ldr r0, [r5]
	bl ov42_02228188
	add r3, r0, #0
	add r0, r6, #0
	mov r1, #0
	add r2, r4, #0
	bl ov44_02232C4C
	ldr r0, [r5, #4]
	mov r1, #0
	bl ov42_0222919C
	ldr r0, [r5, #4]
	add r1, r4, #0
	bl ov42_02229218
	ldr r0, [r5]
	mov r1, #0
	bl ov42_02228188
	add r1, sp, #0
	strh r0, [r1]
	ldr r0, [r5]
	mov r1, #1
	bl ov42_02228188
	add r1, sp, #0
	strh r0, [r1, #2]
	mov r3, sp
	ldrh r2, [r1]
	ldr r0, [r5, #4]
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022291D8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02231F84: .word ov44_02232C48
	thumb_func_end ov44_02231F14

	thumb_func_start ov44_02231F88
ov44_02231F88: ; 0x02231F88
	push {r3, lr}
	cmp r1, #0
	beq _02231FA6
	ldr r0, [r1, #0x14]
	cmp r0, #0
	beq _02231FA6
	str r0, [r1, #0x10]
	mov r0, #0
	str r0, [r1, #0x14]
	ldrh r0, [r1, #0xe]
	strh r0, [r1, #0xc]
	ldr r0, [r1, #4]
	mov r1, #1
	bl ov42_0222919C
_02231FA6:
	pop {r3, pc}
	thumb_func_end ov44_02231F88

	thumb_func_start ov44_02231FA8
ov44_02231FA8: ; 0x02231FA8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	add r4, r2, #0
	bl ov44_02232C94
	cmp r0, #0
	bne _02231FBE
	strb r4, [r5, #0xb]
	pop {r4, r5, r6, pc}
_02231FBE:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov44_02232CA8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_02231FA8

	thumb_func_start ov44_02231FCC
ov44_02231FCC: ; 0x02231FCC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov44_02232070
	cmp r0, #1
	bne _02232002
	add r0, r5, #0
	bl ov44_02231CE8
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	sub r0, r0, #3
	lsl r0, r0, #0x18
	asr r4, r0, #0x18
	bmi _02231FEE
	cmp r4, #4
	blt _02231FF2
_02231FEE:
	bl GF_AssertFail
_02231FF2:
	mov r0, #0x6d
	lsl r0, r0, #4
	lsl r1, r4, #0x18
	add r0, r5, r0
	lsr r1, r1, #0x18
	bl ov44_02232E5C
	pop {r3, r4, r5, pc}
_02232002:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02231FCC

	thumb_func_start ov44_02232008
ov44_02232008: ; 0x02232008
	mov r1, #0x6d
	lsl r1, r1, #4
	ldr r3, _02232014 ; =ov44_02232E80
	add r0, r0, r1
	bx r3
	nop
_02232014: .word ov44_02232E80
	thumb_func_end ov44_02232008

	thumb_func_start ov44_02232018
ov44_02232018: ; 0x02232018
	mov r1, #0x6d
	lsl r1, r1, #4
	ldr r3, _02232024 ; =ov44_02232D20
	add r1, r0, r1
	bx r3
	nop
_02232024: .word ov44_02232D20
	thumb_func_end ov44_02232018

	thumb_func_start ov44_02232028
ov44_02232028: ; 0x02232028
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x63
	lsl r0, r0, #2
	mov r6, #0
	add r4, r5, r0
	add r7, r0, #0
_02232036:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _02232042
	add r0, r4, #0
	bl ov44_02231ED4
_02232042:
	add r6, r6, #1
	add r5, #0x1c
	add r4, #0x1c
	cmp r6, #0x30
	blt _02232036
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov44_02232028

	thumb_func_start ov44_02232050
ov44_02232050: ; 0x02232050
	push {r3, lr}
	ldr r1, _0223206C ; =0x000006CC
	ldr r0, [r0, r1]
	mov r1, #5
	ldr r0, [r0]
	bl ov42_02228188
	cmp r0, #0
	bne _02232066
	mov r0, #1
	pop {r3, pc}
_02232066:
	mov r0, #0
	pop {r3, pc}
	nop
_0223206C: .word 0x000006CC
	thumb_func_end ov44_02232050

	thumb_func_start ov44_02232070
ov44_02232070: ; 0x02232070
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _022320FC ; =0x000006CC
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1, #4]
	lsr r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #6]
	strh r0, [r1, #0xe]
	ldr r0, _022320FC ; =0x000006CC
	mov r1, #6
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl ov42_02228188
	add r4, r0, #0
	add r0, sp, #0
	mov r2, sp
	ldrh r1, [r0, #0xc]
	sub r2, r2, #4
	strh r1, [r2]
	ldrh r0, [r0, #0xe]
	add r1, r4, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228270
	add r2, sp, #0
	strh r0, [r2]
	lsr r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	mov r1, #8
	strh r0, [r2, #8]
	ldrh r0, [r2, #2]
	strh r0, [r2, #0xa]
	ldrsh r3, [r2, r1]
	ldr r0, _02232100 ; =0x000006E4
	asr r1, r3, #3
	lsr r1, r1, #0x1c
	add r1, r3, r1
	mov r3, #0xa
	ldrsh r3, [r2, r3]
	lsl r1, r1, #0xc
	ldr r0, [r5, r0]
	asr r2, r3, #3
	lsr r2, r2, #0x1c
	add r2, r3, r2
	lsl r2, r2, #0xc
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl ov42_02227FDC
	cmp r4, #0
	bne _022320F6
	cmp r0, #2
	bne _022320F6
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, pc}
_022320F6:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022320FC: .word 0x000006CC
_02232100: .word 0x000006E4
	thumb_func_end ov44_02232070

	thumb_func_start ov44_02232104
ov44_02232104: ; 0x02232104
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _0223214C ; =0x000006F8
	add r1, sp, #8
	ldr r0, [r5, r0]
	bl ov42_02229AC8
	cmp r0, #1
	bne _02232148
	ldr r7, _02232150 ; =0x000006E8
	add r6, sp, #0
	add r4, sp, #8
_0223211E:
	ldr r0, _02232154 ; =0x000006E4
	ldr r1, [r5, r7]
	ldr r0, [r5, r0]
	add r2, r4, #0
	add r3, r6, #0
	bl ov42_02228C80
	cmp r0, #1
	bne _0223213A
	ldr r0, _02232150 ; =0x000006E8
	add r1, r6, #0
	ldr r0, [r5, r0]
	bl ov42_02228068
_0223213A:
	ldr r0, _0223214C ; =0x000006F8
	add r1, r4, #0
	ldr r0, [r5, r0]
	bl ov42_02229AC8
	cmp r0, #1
	beq _0223211E
_02232148:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223214C: .word 0x000006F8
_02232150: .word 0x000006E8
_02232154: .word 0x000006E4
	thumb_func_end ov44_02232104

	thumb_func_start ov44_02232158
ov44_02232158: ; 0x02232158
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x63
	lsl r0, r0, #2
	mov r6, #0
	add r4, r7, #0
	add r5, r7, r0
_02232166:
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02232186
	mov r2, #0x67
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	add r0, r7, #0
	add r1, r5, #0
	blx r2
	cmp r0, #1
	bne _02232186
	add r0, r5, #0
	bl ov44_02231ED4
_02232186:
	add r6, r6, #1
	add r4, #0x1c
	add r5, #0x1c
	cmp r6, #0x30
	blt _02232166
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov44_02232158

	thumb_func_start ov44_02232194
ov44_02232194: ; 0x02232194
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x63
	lsl r0, r0, #2
	mov r6, #0
	add r4, r7, #0
	add r5, r7, r0
_022321A2:
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022321B8
	mov r2, #0x69
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	add r0, r7, #0
	add r1, r5, #0
	blx r2
_022321B8:
	add r6, r6, #1
	add r4, #0x1c
	add r5, #0x1c
	cmp r6, #0x30
	blt _022321A2
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_02232194

	thumb_func_start ov44_022321C4
ov44_022321C4: ; 0x022321C4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r1]
	ldr r1, _02232200 ; =0x000006E8
	ldr r1, [r4, r1]
	bl ov42_022283BC
	cmp r0, #0
	beq _022321FA
	mov r2, #0x63
	mov r1, #0
	add r5, r4, #0
	lsl r2, r2, #2
_022321DE:
	ldr r3, [r5, r2]
	cmp r3, r0
	bne _022321F2
	mov r0, #0x63
	lsl r0, r0, #2
	add r2, r4, r0
	mov r0, #0x1c
	mul r0, r1
	add r0, r2, r0
	pop {r3, r4, r5, pc}
_022321F2:
	add r1, r1, #1
	add r5, #0x1c
	cmp r1, #0x30
	blt _022321DE
_022321FA:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02232200: .word 0x000006E8
	thumb_func_end ov44_022321C4

	thumb_func_start ov44_02232204
ov44_02232204: ; 0x02232204
	push {r4, r5, lr}
	sub sp, #0xc
	add r3, r1, #0
	mov r1, #0
	add r5, r0, #0
	add r4, r2, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [r5, #0x14]
	mov r2, #0x30
	bl ov42_02228F24
	ldr r1, _02232234 ; =0x000006EC
	add r2, r4, #0
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #2
	bl ov42_02229028
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02232234: .word 0x000006EC
	thumb_func_end ov44_02232204

	thumb_func_start ov44_02232238
ov44_02232238: ; 0x02232238
	ldr r1, _02232240 ; =0x000006EC
	ldr r3, _02232244 ; =ov42_02228F94
	ldr r0, [r0, r1]
	bx r3
	.balign 4, 0
_02232240: .word 0x000006EC
_02232244: .word ov42_02228F94
	thumb_func_end ov44_02232238

	thumb_func_start ov44_02232248
ov44_02232248: ; 0x02232248
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, _02232280 ; =ov44_02235604
	add r4, r1, #0
	add r5, r0, #0
	add r2, sp, #0
	mov r1, #0xb
_02232256:
	ldrb r0, [r6]
	add r6, r6, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02232256
	add r0, sp, #0
	ldrb r1, [r0, #9]
	add r2, sp, #0
	add r1, r1, r3
	strb r1, [r0, #9]
	add r0, r5, #0
	ldr r1, [r5, #0x10]
	add r0, #0x18
	add r3, r4, #0
	bl ov42_022293B8
	ldr r1, _02232284 ; =0x000006F4
	str r0, [r5, r1]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02232280: .word ov44_02235604
_02232284: .word 0x000006F4
	thumb_func_end ov44_02232248

	thumb_func_start ov44_02232288
ov44_02232288: ; 0x02232288
	ldr r1, _02232290 ; =0x000006F4
	ldr r3, _02232294 ; =ov42_0222940C
	ldr r0, [r0, r1]
	bx r3
	.balign 4, 0
_02232290: .word 0x000006F4
_02232294: .word ov42_0222940C
	thumb_func_end ov44_02232288

	thumb_func_start ov44_02232298
ov44_02232298: ; 0x02232298
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	str r2, [sp]
	mov r0, #0x60
	add r1, r7, #4
	add r2, r6, #0
	bl G2dRenderer_Init
	mov r2, #0x32
	str r0, [r7]
	add r0, r7, #4
	mov r1, #0
	lsl r2, r2, #0x10
	bl G2dRenderer_SetSubSurfaceCoords
	mov r4, #0
	add r5, r7, #0
_022322BC:
	mov r0, #0x10
	add r1, r4, #0
	add r2, r6, #0
	bl Create2DGfxResObjMan
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _022322BC
	ldr r2, [sp]
	add r0, r7, #0
	add r1, r6, #0
	bl ov44_02232314
	add r0, r7, #0
	add r1, r6, #0
	bl ov44_02232324
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_02232298

	thumb_func_start ov44_022322E8
ov44_022322E8: ; 0x022322E8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl ov44_0223232C
	add r0, r7, #0
	bl ov44_0223231C
	mov r6, #0x4b
	mov r4, #0
	add r5, r7, #0
	lsl r6, r6, #2
_022322FE:
	ldr r0, [r5, r6]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _022322FE
	ldr r0, [r7]
	bl sub_02024504
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_022322E8

	thumb_func_start ov44_02232314
ov44_02232314: ; 0x02232314
	ldr r3, _02232318 ; =ov44_0223237C
	bx r3
	.balign 4, 0
_02232318: .word ov44_0223237C
	thumb_func_end ov44_02232314

	thumb_func_start ov44_0223231C
ov44_0223231C: ; 0x0223231C
	ldr r3, _02232320 ; =ov44_0223247C
	bx r3
	.balign 4, 0
_02232320: .word ov44_0223247C
	thumb_func_end ov44_0223231C

	thumb_func_start ov44_02232324
ov44_02232324: ; 0x02232324
	ldr r3, _02232328 ; =ov44_022324B0
	bx r3
	.balign 4, 0
_02232328: .word ov44_022324B0
	thumb_func_end ov44_02232324

	thumb_func_start ov44_0223232C
ov44_0223232C: ; 0x0223232C
	ldr r3, _02232330 ; =ov44_02232530
	bx r3
	.balign 4, 0
_02232330: .word ov44_02232530
	thumb_func_end ov44_0223232C

	thumb_func_start ov44_02232334
ov44_02232334: ; 0x02232334
	bx lr
	.balign 4, 0
	thumb_func_end ov44_02232334

	thumb_func_start ov44_02232338
ov44_02232338: ; 0x02232338
	bx lr
	.balign 4, 0
	thumb_func_end ov44_02232338

	thumb_func_start ov44_0223233C
ov44_0223233C: ; 0x0223233C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	mov r0, #1
	add r4, r2, #0
	lsl r0, r0, #8
	mov r2, #0
	add r5, r1, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x1f
	add r3, r2, #0
	str r5, [sp, #4]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	add r0, r4, #0
	mov r1, #0x1e
	add r2, r6, #0
	str r5, [sp, #0xc]
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_0223233C

	thumb_func_start ov44_0223237C
ov44_0223237C: ; 0x0223237C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	add r4, r1, #0
	mov r1, #0x32
	add r5, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r6, r2, #0
	str r4, [sp, #8]
	add r1, #0xfa
	ldr r0, [r5, r1]
	add r1, r6, #0
	mov r2, #0x26
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	mov r1, #0x4f
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r1, #0x32
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	add r1, #0xfe
	ldr r0, [r5, r1]
	add r1, r6, #0
	mov r2, #0x25
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #0x32
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r4, [sp, #8]
	sub r1, #0xc
	ldr r0, [r5, r1]
	add r1, r6, #0
	mov r2, #0x27
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x32
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	str r4, [sp, #8]
	sub r1, #0xc
	ldr r0, [r5, r1]
	add r1, r6, #0
	mov r2, #0x28
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0xc
	ldr r0, [r5, r1]
	bl sub_0200ADA4
	cmp r0, #1
	beq _02232410
	bl GF_AssertFail
_02232410:
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_0200B00C
	cmp r0, #1
	beq _02232422
	bl GF_AssertFail
_02232422:
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200A740
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_0200A740
	mov r1, #0x32
	add r0, r1, #0
	str r1, [sp]
	sub r0, #0x33
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	mov r3, #0x4d
	str r0, [sp, #0xc]
	mov r2, #2
	str r2, [sp, #0x10]
	add r2, r1, #0
	add r2, #0xfa
	ldr r2, [r5, r2]
	lsl r3, r3, #2
	str r2, [sp, #0x14]
	add r2, r1, #0
	add r2, #0xfe
	ldr r2, [r5, r2]
	str r2, [sp, #0x18]
	ldr r2, [r5, r3]
	str r2, [sp, #0x1c]
	add r2, r3, #4
	ldr r2, [r5, r2]
	add r3, #0x18
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r5, r3
	add r2, r1, #0
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov44_0223237C

	thumb_func_start ov44_0223247C
ov44_0223247C: ; 0x0223247C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AEB0
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_0200B0A8
	mov r7, #0x4b
	lsl r7, r7, #2
	add r6, r7, #0
	mov r4, #0
	add r6, #0x10
_0223249E:
	ldr r0, [r5, r7]
	ldr r1, [r5, r6]
	bl DestroySingle2DGfxResObj
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0223249E
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_0223247C

	thumb_func_start ov44_022324B0
ov44_022324B0: ; 0x022324B0
	push {r3, r4, r5, lr}
	sub sp, #0x30
	add r4, r0, #0
	add r2, sp, #0
	mov r0, #0
	add r3, r1, #0
	add r5, r2, #0
	add r1, r0, #0
	stmia r5!, {r0, r1}
	stmia r5!, {r0, r1}
	stmia r5!, {r0, r1}
	stmia r5!, {r0, r1}
	stmia r5!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r1, [r4]
	str r1, [sp]
	mov r1, #0x53
	lsl r1, r1, #2
	add r1, r4, r1
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #0x28]
	lsl r1, r1, #0xc
	str r0, [sp, #0x24]
	add r0, r2, #0
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	str r3, [sp, #0x2c]
	bl CreateSprite
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, sp, #0
	bl CreateSprite
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r0, r1, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add sp, #0x30
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_022324B0

	thumb_func_start ov44_02232530
ov44_02232530: ; 0x02232530
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02024758
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024758
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02232530

	thumb_func_start ov44_0223254C
ov44_0223254C: ; 0x0223254C
	push {r4, lr}
	sub sp, #0x10
	add r1, sp, #0
	add r4, r0, #0
	bl ov44_02232724
	add r2, sp, #0
	mov r0, #0
	ldrsh r1, [r2, r0]
	add r1, #8
	strh r1, [r2]
	mov r1, #2
	ldrsh r3, [r2, r1]
	add r3, #0x20
	strh r3, [r2, #2]
	ldrsh r0, [r2, r0]
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	ldrsh r0, [r2, r1]
	add r1, sp, #4
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020247D4
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_0223254C

	thumb_func_start ov44_02232594
ov44_02232594: ; 0x02232594
	mov r1, #0x61
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	ldr r3, _022325A0 ; =Set2dSpriteVisibleFlag
	mov r1, #0
	bx r3
	.balign 4, 0
_022325A0: .word Set2dSpriteVisibleFlag
	thumb_func_end ov44_02232594

	thumb_func_start ov44_022325A4
ov44_022325A4: ; 0x022325A4
	push {r0, r1, r2, r3}
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r1, sp, #0x18
	mov r0, #4
	ldrsh r0, [r1, r0]
	add r4, r2, #0
	add r0, #8
	lsl r0, r0, #0x10
	asr r0, r0, #4
	str r0, [sp]
	mov r0, #6
	ldrsh r0, [r1, r0]
	add r1, sp, #0
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020247D4
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_02024ADC
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add sp, #0xc
	pop {r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov44_022325A4

	thumb_func_start ov44_022325F4
ov44_022325F4: ; 0x022325F4
	mov r1, #0x62
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	ldr r3, _02232600 ; =Set2dSpriteVisibleFlag
	mov r1, #0
	bx r3
	.balign 4, 0
_02232600: .word Set2dSpriteVisibleFlag
	thumb_func_end ov44_022325F4

	thumb_func_start ov44_02232604
ov44_02232604: ; 0x02232604
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _02232678 ; =0x000006CC
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _02232618
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_02232618:
	ldr r0, [r0]
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	ldr r0, _02232678 ; =0x000006CC
	mov r1, #6
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl ov42_02228188
	add r4, r0, #0
	ldr r0, _0223267C ; =0x000006E4
	add r2, sp, #0
	mov r1, #4
	ldrsh r3, [r2, r1]
	ldr r0, [r5, r0]
	asr r1, r3, #3
	lsr r1, r1, #0x1c
	add r1, r3, r1
	mov r3, #6
	ldrsh r3, [r2, r3]
	lsl r1, r1, #0xc
	lsr r1, r1, #0x10
	asr r2, r3, #3
	lsr r2, r2, #0x1c
	add r2, r3, r2
	lsl r2, r2, #0xc
	lsr r2, r2, #0x10
	bl ov42_02227FDC
	cmp r0, #0xf
	bne _02232670
	cmp r4, #1
	bne _02232670
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, pc}
_02232670:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02232678: .word 0x000006CC
_0223267C: .word 0x000006E4
	thumb_func_end ov44_02232604

	thumb_func_start ov44_02232680
ov44_02232680: ; 0x02232680
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #7
	add r4, r2, #0
	and r4, r0
	ldr r0, _02232720 ; =0x000006E4
	str r1, [sp]
	ldr r0, [r5, r0]
	lsr r7, r2, #3
	bl ov42_02227F40
	add r6, r0, #0
	ldr r0, _02232720 ; =0x000006E4
	ldr r0, [r5, r0]
	bl ov42_02227F44
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	cmp r0, #0
	bls _02232718
	add r0, r7, #3
	str r0, [sp, #0x14]
	add r0, r4, #7
	str r0, [sp, #0xc]
_022326B6:
	mov r4, #0
	cmp r6, #0
	bls _0223270C
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
_022326CC:
	ldr r0, _02232720 ; =0x000006E4
	lsl r1, r4, #0x10
	ldr r0, [r5, r0]
	lsr r1, r1, #0x10
	add r2, r7, #0
	bl ov42_02227FDC
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bne _02232706
	ldr r0, _02232720 ; =0x000006E4
	lsl r1, r4, #0x10
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x10]
	lsr r1, r1, #0x10
	bl ov42_02227FDC
	ldr r1, [sp, #0x14]
	cmp r0, r1
	bne _02232706
	ldr r0, [sp]
	lsl r1, r4, #4
	strh r1, [r0]
	ldr r0, [sp, #8]
	lsl r1, r0, #4
	ldr r0, [sp]
	add sp, #0x18
	strh r1, [r0, #2]
	pop {r3, r4, r5, r6, r7, pc}
_02232706:
	add r4, r4, #1
	cmp r4, r6
	blo _022326CC
_0223270C:
	ldr r0, [sp, #8]
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	cmp r1, r0
	blo _022326B6
_02232718:
	bl GF_AssertFail
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02232720: .word 0x000006E4
	thumb_func_end ov44_02232680

	thumb_func_start ov44_02232724
ov44_02232724: ; 0x02232724
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	ldr r0, _02232794 ; =0x000006E4
	str r1, [sp]
	ldr r0, [r7, r0]
	bl ov42_02227F40
	add r5, r0, #0
	ldr r0, _02232794 ; =0x000006E4
	ldr r0, [r7, r0]
	bl ov42_02227F44
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	cmp r0, #0
	bls _0223278C
_0223274A:
	mov r4, #0
	cmp r5, #0
	bls _02232780
	ldr r0, [sp, #8]
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
_02232756:
	ldr r0, _02232794 ; =0x000006E4
	lsl r1, r4, #0x10
	ldr r0, [r7, r0]
	lsr r1, r1, #0x10
	add r2, r6, #0
	bl ov42_02227FDC
	cmp r0, #0xf
	bne _0223277A
	ldr r0, [sp]
	lsl r1, r4, #4
	strh r1, [r0]
	ldr r0, [sp, #8]
	lsl r1, r0, #4
	ldr r0, [sp]
	add sp, #0xc
	strh r1, [r0, #2]
	pop {r4, r5, r6, r7, pc}
_0223277A:
	add r4, r4, #1
	cmp r4, r5
	blo _02232756
_02232780:
	ldr r0, [sp, #8]
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	cmp r1, r0
	blo _0223274A
_0223278C:
	bl GF_AssertFail
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02232794: .word 0x000006E4
	thumb_func_end ov44_02232724

	thumb_func_start ov44_02232798
ov44_02232798: ; 0x02232798
	push {r4, lr}
	mov r2, #0x63
	mov r1, #0
	add r4, r0, #0
	lsl r2, r2, #2
_022327A2:
	ldr r3, [r4, r2]
	cmp r3, #0
	bne _022327B6
	mov r2, #0x63
	lsl r2, r2, #2
	add r2, r0, r2
	mov r0, #0x1c
	mul r0, r1
	add r0, r2, r0
	pop {r4, pc}
_022327B6:
	add r1, r1, #1
	add r4, #0x1c
	cmp r1, #0x30
	blt _022327A2
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02232798

	thumb_func_start ov44_022327C8
ov44_022327C8: ; 0x022327C8
	push {r3, r4, r5, lr}
	add r3, r0, #0
	ldr r0, _022327FC ; =0x000006EC
	add r5, r1, #0
	ldr r0, [r3, r0]
	ldr r1, [r5]
	ldr r3, [r3, #4]
	add r4, r2, #0
	bl ov42_0222903C
	str r0, [r5, #4]
	cmp r4, #0
	bne _022327F8
	ldr r0, [r5, #4]
	mov r1, #0
	bl ov42_0222919C
	ldr r0, [r5, #4]
	bl ov42_022291A0
	ldr r0, [r5, #4]
	mov r1, #0
	bl ov42_02229200
_022327F8:
	pop {r3, r4, r5, pc}
	nop
_022327FC: .word 0x000006EC
	thumb_func_end ov44_022327C8

	thumb_func_start ov44_02232800
ov44_02232800: ; 0x02232800
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	mov r1, #0
	ldrsh r1, [r2, r1]
	add r5, sp, #0
	strh r1, [r5]
	mov r1, #2
	ldrsh r1, [r2, r1]
	strh r1, [r5, #2]
	ldr r1, [sp, #0x20]
	strh r3, [r5, #4]
	strh r1, [r5, #6]
	add r1, sp, #8
	ldrb r2, [r1, #0x14]
	strh r2, [r5, #8]
	ldrh r1, [r1, #0x10]
	strh r1, [r5, #0xa]
	ldr r1, _02232834 ; =0x000006E8
	ldr r0, [r0, r1]
	add r1, sp, #0
	bl ov42_022280B8
	str r0, [r4]
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_02232834: .word 0x000006E8
	thumb_func_end ov44_02232800

	thumb_func_start ov44_02232838
ov44_02232838: ; 0x02232838
	ldrh r0, [r0, #0xc]
	cmp r0, #5
	bhi _0223285E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223284A: ; jump table
	.short _02232856 - _0223284A - 2 ; case 0
	.short _0223285A - _0223284A - 2 ; case 1
	.short _0223285A - _0223284A - 2 ; case 2
	.short _02232856 - _0223284A - 2 ; case 3
	.short _02232856 - _0223284A - 2 ; case 4
	.short _0223285A - _0223284A - 2 ; case 5
_02232856:
	mov r0, #1
	bx lr
_0223285A:
	mov r0, #0
	bx lr
_0223285E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov44_02232838

	thumb_func_start ov44_02232864
ov44_02232864: ; 0x02232864
	add r2, r1, #0
	ldr r1, _02232878 ; =ov44_02232A60
	ldr r3, _0223287C ; =ov44_02232C6C
	str r1, [r2, #0x10]
	ldr r1, _02232880 ; =ov44_02232910
	str r1, [r2, #0x18]
	mov r1, #0
	strh r1, [r2, #0xc]
	bx r3
	nop
_02232878: .word ov44_02232A60
_0223287C: .word ov44_02232C6C
_02232880: .word ov44_02232910
	thumb_func_end ov44_02232864

	thumb_func_start ov44_02232884
ov44_02232884: ; 0x02232884
	ldr r0, _02232898 ; =ov44_02232B74
	str r0, [r1, #0x10]
	ldr r0, _0223289C ; =ov44_02232914
	str r0, [r1, #0x18]
	mov r0, #0x2d
	strh r0, [r1, #8]
	mov r0, #1
	strh r0, [r1, #0xc]
	bx lr
	nop
_02232898: .word ov44_02232B74
_0223289C: .word ov44_02232914
	thumb_func_end ov44_02232884

	thumb_func_start ov44_022328A0
ov44_022328A0: ; 0x022328A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _022328D8 ; =ov44_02232BE4
	add r4, r1, #0
	str r0, [r4, #0x10]
	ldr r0, _022328DC ; =ov44_02232910
	str r0, [r4, #0x18]
	bl MTRandom
	ldr r1, _022328E0 ; =0x000003FF
	add r2, r4, #0
	and r1, r0
	mov r0, #1
	lsl r0, r0, #8
	add r0, r1, r0
	strh r0, [r4, #8]
	mov r0, #3
	strh r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #0
	bl ov44_02232C6C
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov42_0222919C
	pop {r3, r4, r5, pc}
	nop
_022328D8: .word ov44_02232BE4
_022328DC: .word ov44_02232910
_022328E0: .word 0x000003FF
	thumb_func_end ov44_022328A0

	thumb_func_start ov44_022328E4
ov44_022328E4: ; 0x022328E4
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _02232908 ; =ov44_02232C30
	add r2, r4, #0
	str r1, [r4, #0x10]
	ldr r1, _0223290C ; =ov44_022329B0
	str r1, [r4, #0x18]
	mov r1, #0x1c
	strh r1, [r4, #8]
	mov r1, #4
	strh r1, [r4, #0xc]
	bl ov44_02232C6C
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov42_0222919C
	pop {r4, pc}
	.balign 4, 0
_02232908: .word ov44_02232C30
_0223290C: .word ov44_022329B0
	thumb_func_end ov44_022328E4

	thumb_func_start ov44_02232910
ov44_02232910: ; 0x02232910
	bx lr
	.balign 4, 0
	thumb_func_end ov44_02232910

	thumb_func_start ov44_02232914
ov44_02232914: ; 0x02232914
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	ldr r0, [r4, #4]
	bl ov42_022291AC
	ldr r0, [r4, #4]
	bl ov42_022291F4
	cmp r0, #0
	bne _02232932
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov42_02229200
_02232932:
	ldr r0, [r4]
	mov r1, #0
	bl ov42_02228188
	add r1, sp, #0
	strh r0, [r1, #4]
	ldr r0, [r4]
	mov r1, #1
	bl ov42_02228188
	add r1, sp, #0
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	strh r0, [r1]
	ldrh r0, [r1, #6]
	strh r0, [r1, #2]
	ldrh r0, [r4, #8]
	bl GF_SinDegNoWrap
	ldr r2, _022329AC ; =0xFFF40000
	asr r1, r0, #0x1f
	asr r3, r2, #0x14
	bl _ll_mul
	mov r5, #2
	mov r6, #0
	lsl r5, r5, #0xa
	mov r3, #6
	add r2, sp, #0
	add r5, r0, r5
	adc r1, r6
	lsl r0, r1, #0x14
	lsr r1, r5, #0xc
	orr r1, r0
	ldrsh r3, [r2, r3]
	asr r0, r1, #0xc
	add r0, r3, r0
	strh r0, [r2, #6]
	mov r3, sp
	ldrh r1, [r2, #4]
	ldr r0, [r4, #4]
	sub r3, r3, #4
	strh r1, [r3]
	ldrh r1, [r2, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022291D8
	add r1, sp, #0
	mov r3, sp
	ldrh r2, [r1]
	ldr r0, [r4, #4]
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_02229258
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022329AC: .word 0xFFF40000
	thumb_func_end ov44_02232914

	thumb_func_start ov44_022329B0
ov44_022329B0: ; 0x022329B0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	ldr r0, [r4]
	mov r1, #0
	bl ov42_02228188
	add r1, sp, #0
	strh r0, [r1, #4]
	ldr r0, [r4]
	mov r1, #1
	bl ov42_02228188
	add r1, sp, #0
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	strh r0, [r1]
	ldrh r0, [r1, #6]
	strh r0, [r1, #2]
	mov r0, #8
	ldrsh r0, [r4, r0]
	sub r0, #0x10
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	cmp r0, #0
	ble _02232A26
	mov r1, #6
	bl _s32_div_f
	lsl r0, r1, #0x10
	asr r1, r0, #0x10
	mov r0, #0xb4
	mul r0, r1
	mov r1, #6
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDegNoWrap
	add r1, sp, #0
	mov r2, #6
	ldrsh r3, [r1, r2]
	asr r2, r0, #0x1f
	lsr r5, r0, #0x12
	lsl r2, r2, #0xe
	lsl r6, r0, #0xe
	mov r0, #2
	orr r2, r5
	mov r5, #0
	lsl r0, r0, #0xa
	add r6, r6, r0
	adc r2, r5
	lsl r0, r2, #0x14
	lsr r2, r6, #0xc
	orr r2, r0
	asr r0, r2, #0xc
	sub r0, r3, r0
	strh r0, [r1, #6]
_02232A26:
	add r1, sp, #0
	ldrh r2, [r1, #4]
	mov r3, sp
	ldr r0, [r4, #4]
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022291D8
	add r1, sp, #0
	mov r3, sp
	ldrh r2, [r1]
	ldr r0, [r4, #4]
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #2]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_02229258
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov42_02229218
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_022329B0

	thumb_func_start ov44_02232A60
ov44_02232A60: ; 0x02232A60
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	ldr r0, [r6]
	mov r1, #6
	bl ov42_02228188
	add r4, r0, #0
	ldr r0, [r6]
	mov r1, #4
	bl ov42_02228188
	add r7, r0, #0
	ldr r0, [r6]
	mov r1, #5
	bl ov42_02228188
	cmp r0, #0
	beq _02232A8A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02232A8A:
	ldr r0, _02232B70 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02232AC4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov44_022321C4
	str r0, [sp]
	cmp r0, #0
	beq _02232AC0
	bl ov44_02232838
	cmp r0, #1
	bne _02232ABA
	ldr r0, [sp]
	mov r1, #4
	ldr r0, [r0]
	bl ov42_02228188
	strb r0, [r6, #0xa]
	b _02232AC4
_02232ABA:
	mov r0, #0
	strb r0, [r6, #0xa]
	b _02232AC4
_02232AC0:
	mov r0, #0
	strb r0, [r6, #0xa]
_02232AC4:
	ldr r0, [r5, #0xc]
	cmp r0, #1
	bne _02232ACE
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02232ACE:
	ldr r0, _02232B70 ; =gSystem
	mov r1, #2
	ldr r0, [r0, #0x44]
	add r2, r0, #0
	tst r2, r1
	beq _02232ADC
	mov r1, #3
_02232ADC:
	mov r2, #0x40
	tst r2, r0
	beq _02232B00
	cmp r4, #0
	bne _02232AF2
	add r0, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl ov44_02232C4C
	b _02232B6A
_02232AF2:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	add r3, r7, #0
	bl ov44_02232C4C
	b _02232B6A
_02232B00:
	mov r2, #0x80
	tst r2, r0
	beq _02232B24
	cmp r4, #1
	bne _02232B16
	add r0, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl ov44_02232C4C
	b _02232B6A
_02232B16:
	mov r1, #1
	add r0, r5, #0
	add r2, r1, #0
	add r3, r7, #0
	bl ov44_02232C4C
	b _02232B6A
_02232B24:
	mov r2, #0x20
	tst r2, r0
	beq _02232B48
	cmp r4, #2
	bne _02232B3A
	add r0, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl ov44_02232C4C
	b _02232B6A
_02232B3A:
	add r0, r5, #0
	mov r1, #1
	mov r2, #2
	add r3, r7, #0
	bl ov44_02232C4C
	b _02232B6A
_02232B48:
	mov r2, #0x10
	tst r0, r2
	beq _02232B6A
	cmp r4, #3
	bne _02232B5E
	add r0, r5, #0
	add r2, r4, #0
	add r3, r7, #0
	bl ov44_02232C4C
	b _02232B6A
_02232B5E:
	add r0, r5, #0
	mov r1, #1
	mov r2, #3
	add r3, r7, #0
	bl ov44_02232C4C
_02232B6A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02232B70: .word gSystem
	thumb_func_end ov44_02232A60

	thumb_func_start ov44_02232B74
ov44_02232B74: ; 0x02232B74
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #8
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, #8]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bgt _02232BC4
	ldr r0, [r4, #4]
	bl ov42_022291B8
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov42_0222919C
	ldr r0, _02232BC8 ; =0x000006CC
	mov r1, #4
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl ov42_02228188
	add r6, r0, #0
	ldr r0, [r4]
	mov r1, #4
	bl ov42_02228188
	cmp r0, r6
	bne _02232BBA
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_02232864
	b _02232BC4
_02232BBA:
	ldrb r2, [r4, #0xb]
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_02232CA8
_02232BC4:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02232BC8: .word 0x000006CC
	thumb_func_end ov44_02232B74

	thumb_func_start ov44_02232BCC
ov44_02232BCC: ; 0x02232BCC
	mov r0, #8
	ldrsh r2, [r1, r0]
	add r2, r2, #1
	strh r2, [r1, #8]
	ldrsh r0, [r1, r0]
	cmp r0, #0x2d
	ble _02232BDE
	mov r0, #1
	bx lr
_02232BDE:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov44_02232BCC

	thumb_func_start ov44_02232BE4
ov44_02232BE4: ; 0x02232BE4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #8
	ldrsh r1, [r5, r0]
	sub r1, r1, #1
	strh r1, [r5, #8]
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bgt _02232C26
	bl MTRandom
	ldr r1, _02232C2C ; =0x000003FF
	and r1, r0
	mov r0, #1
	lsl r0, r0, #8
	add r0, r1, r0
	strh r0, [r5, #8]
	bl MTRandom
	add r4, r0, #0
	mov r1, #3
	and r4, r1
	ldr r0, [r5]
	mov r1, #4
	bl ov42_02228188
	add r3, r0, #0
	add r0, r6, #0
	mov r1, #0
	add r2, r4, #0
	bl ov44_02232C4C
_02232C26:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02232C2C: .word 0x000003FF
	thumb_func_end ov44_02232BE4

	thumb_func_start ov44_02232C30
ov44_02232C30: ; 0x02232C30
	mov r0, #8
	ldrsh r2, [r1, r0]
	sub r2, r2, #1
	strh r2, [r1, #8]
	ldrsh r0, [r1, r0]
	cmp r0, #0
	bge _02232C42
	mov r0, #0x1c
	strh r0, [r1, #8]
_02232C42:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov44_02232C30

	thumb_func_start ov44_02232C48
ov44_02232C48: ; 0x02232C48
	mov r0, #0
	bx lr
	thumb_func_end ov44_02232C48

	thumb_func_start ov44_02232C4C
ov44_02232C4C: ; 0x02232C4C
	push {r3, r4, lr}
	sub sp, #4
	add r4, sp, #0
	strh r1, [r4]
	strb r2, [r4, #2]
	ldr r1, _02232C68 ; =0x000006F8
	strb r3, [r4, #3]
	ldr r0, [r0, r1]
	add r1, sp, #0
	bl ov42_02229A8C
	add sp, #4
	pop {r3, r4, pc}
	nop
_02232C68: .word 0x000006F8
	thumb_func_end ov44_02232C4C

	thumb_func_start ov44_02232C6C
ov44_02232C6C: ; 0x02232C6C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	ldr r0, [r4]
	mov r1, #6
	bl ov42_02228188
	add r7, r0, #0
	ldr r0, [r4]
	mov r1, #4
	bl ov42_02228188
	add r3, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov44_02232C4C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_02232C6C

	thumb_func_start ov44_02232C94
ov44_02232C94: ; 0x02232C94
	ldr r1, [r0, #0x18]
	ldr r0, _02232CA4 ; =ov44_02232914
	cmp r1, r0
	beq _02232CA0
	mov r0, #1
	bx lr
_02232CA0:
	mov r0, #0
	bx lr
	.balign 4, 0
_02232CA4: .word ov44_02232914
	thumb_func_end ov44_02232C94

	thumb_func_start ov44_02232CA8
ov44_02232CA8: ; 0x02232CA8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	beq _02232CB6
	cmp r4, #1
	beq _02232CBC
	b _02232CC2
_02232CB6:
	bl ov44_022328A0
	b _02232CC6
_02232CBC:
	bl ov44_022328E4
	b _02232CC6
_02232CC2:
	bl GF_AssertFail
_02232CC6:
	strb r4, [r5, #0xb]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_02232CA8

	thumb_func_start ov44_02232CCC
ov44_02232CCC: ; 0x02232CCC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r3, r0, #0
	add r5, r4, #0
	mov r1, #0x14
	mov r0, #0
_02232CD8:
	strb r0, [r5]
	add r5, r5, #1
	sub r1, r1, #1
	bne _02232CD8
	ldr r3, [r3, #4]
	add r0, r2, #0
	mov r1, #0x20
	add r2, r4, #4
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	str r0, [r4]
	mov r0, #0xf
	strb r0, [r4, #8]
	mov r0, #0
	strb r0, [r4, #9]
	ldrb r0, [r4, #9]
	lsl r1, r0, #1
	ldr r0, _02232D04 ; =ov44_02235600
	ldrh r0, [r0, r1]
	strh r0, [r4, #0xa]
	pop {r3, r4, r5, pc}
	nop
_02232D04: .word ov44_02235600
	thumb_func_end ov44_02232CCC

	thumb_func_start ov44_02232D08
ov44_02232D08: ; 0x02232D08
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4]
	bl FreeToHeap
	mov r1, #0x14
	mov r0, #0
_02232D16:
	strb r0, [r4]
	add r4, r4, #1
	sub r1, r1, #1
	bne _02232D16
	pop {r4, pc}
	thumb_func_end ov44_02232D08

	thumb_func_start ov44_02232D20
ov44_02232D20: ; 0x02232D20
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	bl ov44_02232D34
	add r0, r4, #0
	bl ov44_02232DA0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02232D20

	thumb_func_start ov44_02232D34
ov44_02232D34: ; 0x02232D34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xa
	ldrsh r1, [r5, r0]
	sub r1, r1, #1
	strh r1, [r5, #0xa]
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bgt _02232D9A
	ldrb r0, [r5, #9]
	add r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	strb r0, [r5, #9]
	ldrb r0, [r5, #9]
	lsl r1, r0, #1
	ldr r0, _02232D9C ; =ov44_02235600
	ldrh r0, [r0, r1]
	strh r0, [r5, #0xa]
	ldrb r0, [r5, #9]
	cmp r0, #1
	bne _02232D6C
	mov r6, #2
	b _02232D6E
_02232D6C:
	mov r6, #1
_02232D6E:
	mov r4, #0
	mov r7, #1
_02232D72:
	add r0, r7, #0
	ldrb r1, [r5, #8]
	lsl r0, r4
	tst r0, r1
	beq _02232D94
	add r0, r5, #0
	add r1, r6, #0
	bl ov44_02232E2C
	add r1, r4, #1
	lsl r1, r1, #1
	add r2, r0, #0
	mov r0, #0xf
	add r1, #0xe0
	mov r3, #2
	bl GF_CreateNewVramTransferTask
_02232D94:
	add r4, r4, #1
	cmp r4, #4
	blt _02232D72
_02232D9A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02232D9C: .word ov44_02235600
	thumb_func_end ov44_02232D34

	thumb_func_start ov44_02232DA0
ov44_02232DA0: ; 0x02232DA0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrb r3, [r4, #0xd]
	mov r0, #0
	add r1, r0, #0
	lsl r5, r3, #2
	ldr r3, _02232E1C ; =ov44_0223560F
	add r2, r0, #0
	ldrb r3, [r3, r5]
	cmp r3, #1
	bne _02232DC8
	mov r3, #0xe
	ldrsh r5, [r4, r3]
	sub r5, r5, #1
	strh r5, [r4, #0xe]
	ldrsh r3, [r4, r3]
	cmp r3, #0
	bgt _02232DD2
	mov r2, #1
	b _02232DD2
_02232DC8:
	ldrb r3, [r4, #0x10]
	cmp r3, #0
	beq _02232DD2
	strb r0, [r4, #0x10]
	mov r2, #1
_02232DD2:
	cmp r2, #0
	beq _02232DFE
	ldrb r0, [r4, #0xd]
	add r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	cmp r0, #8
	blo _02232DEA
	add r0, r4, #0
	bl ov44_02232E38
	pop {r3, r4, r5, pc}
_02232DEA:
	lsl r1, r0, #2
	ldr r0, _02232E20 ; =ov44_02235610
	ldrb r0, [r0, r1]
	ldr r1, _02232E24 ; =ov44_02235612
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #0xd]
	lsl r2, r0, #2
	ldr r0, _02232E28 ; =ov44_02235611
	ldrb r1, [r1, r2]
	ldrb r0, [r0, r2]
_02232DFE:
	cmp r0, #0
	beq _02232E1A
	add r0, r4, #0
	bl ov44_02232E2C
	ldrb r1, [r4, #0xc]
	add r2, r0, #0
	mov r0, #0xf
	add r1, r1, #1
	lsl r1, r1, #1
	add r1, #0xe0
	mov r3, #2
	bl GF_CreateNewVramTransferTask
_02232E1A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02232E1C: .word ov44_0223560F
_02232E20: .word ov44_02235610
_02232E24: .word ov44_02235612
_02232E28: .word ov44_02235611
	thumb_func_end ov44_02232DA0

	thumb_func_start ov44_02232E2C
ov44_02232E2C: ; 0x02232E2C
	ldr r0, [r0, #4]
	ldr r2, [r0, #0xc]
	add r0, r1, #1
	lsl r0, r0, #1
	add r0, r2, r0
	bx lr
	thumb_func_end ov44_02232E2C

	thumb_func_start ov44_02232E38
ov44_02232E38: ; 0x02232E38
	ldrb r1, [r0, #0xc]
	ldrb r3, [r0, #8]
	mov r2, #1
	lsl r2, r1
	add r1, r3, #0
	orr r1, r2
	strb r1, [r0, #8]
	mov r1, #0
	strb r1, [r0, #0xc]
	strb r1, [r0, #0xd]
	strh r1, [r0, #0xe]
	strb r1, [r0, #0x10]
	bx lr
	.balign 4, 0
	thumb_func_end ov44_02232E38

	thumb_func_start ov44_02232E54
ov44_02232E54: ; 0x02232E54
	mov r1, #1
	strb r1, [r0, #0x10]
	bx lr
	.balign 4, 0
	thumb_func_end ov44_02232E54

	thumb_func_start ov44_02232E5C
ov44_02232E5C: ; 0x02232E5C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldrb r1, [r5, #0xd]
	cmp r1, #0
	beq _02232E6C
	bl ov44_02232E38
_02232E6C:
	mov r0, #1
	ldrb r1, [r5, #8]
	lsl r0, r4
	eor r0, r1
	strb r0, [r5, #8]
	add r0, r5, #0
	strb r4, [r5, #0xc]
	bl ov44_02232E54
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02232E5C

	thumb_func_start ov44_02232E80
ov44_02232E80: ; 0x02232E80
	push {r3, lr}
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	beq _02232E8C
	bl ov44_02232E54
_02232E8C:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov44_02232E80

	thumb_func_start ov44_02232E90
ov44_02232E90: ; 0x02232E90
	lsl r1, r0, #2
	ldr r0, _02232E98 ; =ov44_02235630
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_02232E98: .word ov44_02235630
	thumb_func_end ov44_02232E90

	thumb_func_start ov44_02232E9C
ov44_02232E9C: ; 0x02232E9C
	lsl r1, r0, #2
	ldr r0, _02232EA4 ; =ov44_0223688C
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_02232EA4: .word ov44_0223688C
	thumb_func_end ov44_02232E9C

	thumb_func_start ov44_02232EA8
ov44_02232EA8: ; 0x02232EA8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	ldr r0, _02232F5C ; =FS_OVERLAY_ID(OVY_42)
	mov r1, #2
	bl HandleLoadOverlay
	bl sub_02039998
	cmp r0, #1
	beq _02232EC6
	bl GF_AssertFail
_02232EC6:
	mov r0, #3
	mov r1, #0x67
	lsl r2, r0, #0xf
	bl CreateHeap
	mov r2, #0xa
	mov r0, #3
	mov r1, #0x68
	lsl r2, r2, #0xc
	bl CreateHeap
	mov r1, #0x8a
	add r0, r4, #0
	lsl r1, r1, #2
	mov r2, #0x67
	bl OverlayManager_CreateAndGetData
	mov r2, #0x8a
	add r4, r0, #0
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0x1c
	mov r1, #1
	mov r2, #4
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0x20
	mov r1, #1
	mov r2, #4
	bl MI_CpuFill8
	mov r0, #0x10
	mov r1, #0x67
	bl GF_CreateVramTransferManager
	bl sub_020398C8
	add r1, r0, #0
	str r0, [r4]
	add r1, #0x22
	ldrb r1, [r1]
	add r0, #0x21
	strb r1, [r0]
	add r0, r4, #0
	bl ov44_022331B0
	strb r0, [r4, #4]
	mov r0, #0xff
	strb r0, [r4, #6]
	add r0, r4, #0
	bl sub_020971F8
	add r0, r4, #0
	bl ov44_02234028
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0x67
	bl ov44_022331C4
	ldr r0, _02232F60 ; =ov44_0223319C
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	bl sub_0203A880
	mov r0, #1
	add r4, #0x27
	strb r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_02232F5C: .word FS_OVERLAY_ID(OVY_42)
_02232F60: .word ov44_0223319C
	thumb_func_end ov44_02232EA8

	thumb_func_start ov44_02232F64
ov44_02232F64: ; 0x02232F64
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	add r7, r0, #0
	ldr r0, [r5]
	cmp r0, #4
	bls _02232F82
	b _0223308A
_02232F82:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02232F8E: ; jump table
	.short _02232F98 - _02232F8E - 2 ; case 0
	.short _02232FB6 - _02232F8E - 2 ; case 1
	.short _02232FC6 - _02232F8E - 2 ; case 2
	.short _0223305C - _02232F8E - 2 ; case 3
	.short _0223307C - _02232F8E - 2 ; case 4
_02232F98:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x67
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0223308A
_02232FB6:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223308A
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0223308A
_02232FC6:
	add r0, r4, #0
	add r0, #0x27
	ldrb r0, [r0]
	cmp r0, #0
	beq _02232FDA
	add r0, r4, #0
	add r1, r7, #0
	mov r2, #0x67
	bl ov44_02233D8C
_02232FDA:
	ldrb r0, [r4, #4]
	cmp r0, #0
	beq _0223300C
	bl sub_02034420
	cmp r0, #1
	bne _02232FF8
	add r0, r4, #0
	bl ov44_0223438C
	bl sub_02034638
	add r0, r4, #0
	bl ov44_02234248
_02232FF8:
	ldrb r3, [r4, #5]
	add r0, r4, #0
	add r1, r7, #0
	lsl r6, r3, #2
	ldr r3, _022330A0 ; =ov44_022365B8
	mov r2, #0x67
	ldr r3, [r3, r6]
	blx r3
	add r6, r0, #0
	b _0223302E
_0223300C:
	ldrb r3, [r4, #5]
	add r0, r4, #0
	add r1, r7, #0
	lsl r6, r3, #2
	ldr r3, _022330A4 ; =ov44_02236540
	mov r2, #0x67
	ldr r3, [r3, r6]
	blx r3
	add r6, r0, #0
	bl sub_02034420
	cmp r0, #1
	bne _0223302E
	add r0, r4, #0
	mov r1, #0x67
	bl ov44_0223427C
_0223302E:
	add r0, r4, #0
	bl ov44_0223407C
	cmp r0, #0
	beq _02233042
	add r0, r4, #0
	add r1, r7, #0
	mov r2, #0x67
	bl ov44_02233A50
_02233042:
	add r0, r4, #0
	bl ov44_022341C0
	cmp r6, #1
	bne _0223308A
	ldrb r0, [r4, #7]
	strb r0, [r7, #3]
	ldrb r0, [r4, #0x11]
	strb r0, [r7, #4]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0223308A
_0223305C:
	mov r0, #6
	str r0, [sp]
	mov r1, #0
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x67
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0223308A
_0223307C:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223308A
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0223308A:
	add r0, r4, #0
	add r0, #0x30
	bl ov44_02233CCC
	ldr r0, [r4, #0x48]
	bl sub_0202457C
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022330A0: .word ov44_022365B8
_022330A4: .word ov44_02236540
	thumb_func_end ov44_02232F64

	thumb_func_start ov44_022330A8
ov44_022330A8: ; 0x022330A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl ov44_02234038
	add r0, r4, #0
	bl ov44_02234204
	add r0, r4, #0
	bl ov44_02233F20
	add r0, r4, #0
	mov r1, #0x67
	bl ov44_02233214
	bl GF_DestroyVramTransferManager
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x68
	bl DestroyHeap
	mov r0, #0x67
	bl DestroyHeap
	ldr r0, _022330FC ; =FS_OVERLAY_ID(OVY_42)
	bl UnloadOverlayByID
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_022330FC: .word FS_OVERLAY_ID(OVY_42)
	thumb_func_end ov44_022330A8

	thumb_func_start ov44_02233100
ov44_02233100: ; 0x02233100
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrb r0, [r5, #4]
	add r4, r1, #0
	cmp r0, #0
	bne _0223315E
	ldrh r6, [r4]
	bl sub_0203769C
	cmp r6, r0
	ldr r0, [r4, #4]
	bne _02233138
	cmp r0, #0
	beq _0223312C
	cmp r0, #1
	beq _02233126
	cmp r0, #2
	beq _02233132
	pop {r4, r5, r6, pc}
_02233126:
	mov r0, #1
	strb r0, [r5, #0x13]
	pop {r4, r5, r6, pc}
_0223312C:
	mov r0, #2
	strb r0, [r5, #0x13]
	pop {r4, r5, r6, pc}
_02233132:
	mov r0, #3
	strb r0, [r5, #0x13]
	pop {r4, r5, r6, pc}
_02233138:
	cmp r0, #0
	beq _02233150
	cmp r0, #1
	beq _02233146
	cmp r0, #2
	beq _02233150
	pop {r4, r5, r6, pc}
_02233146:
	add r0, r5, r6
	mov r1, #1
	add r0, #0x28
	strb r1, [r0]
	pop {r4, r5, r6, pc}
_02233150:
	bl sub_02034420
	cmp r0, #1
	bne _0223315E
	ldrh r0, [r4]
	bl sub_020346E8
_0223315E:
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_02233100

	thumb_func_start ov44_02233160
ov44_02233160: ; 0x02233160
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x2c
	ldrb r1, [r1]
	cmp r1, #0
	bne _02233178
	mov r1, #1
	add r0, #0x2c
	strb r1, [r0]
	mov r0, #0xd
	bl sub_02037AC0
_02233178:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov44_02233160

	thumb_func_start ov44_0223317C
ov44_0223317C: ; 0x0223317C
	ldrb r2, [r0, #4]
	cmp r2, #1
	beq _02233198
	ldrb r2, [r1]
	add r3, r0, #0
	add r0, #0x20
	strb r2, [r0]
	ldrb r0, [r1, #1]
	add r3, #0x20
	strb r0, [r3, #1]
	ldrb r0, [r1, #2]
	strb r0, [r3, #2]
	ldrb r0, [r1, #3]
	strb r0, [r3, #3]
_02233198:
	bx lr
	.balign 4, 0
	thumb_func_end ov44_0223317C

	thumb_func_start ov44_0223319C
ov44_0223319C: ; 0x0223319C
	push {r3, lr}
	ldr r0, [r0, #0x30]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov44_0223319C

	thumb_func_start ov44_022331B0
ov44_022331B0: ; 0x022331B0
	push {r3, lr}
	bl sub_0203769C
	cmp r0, #0
	bne _022331BE
	mov r0, #1
	pop {r3, pc}
_022331BE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov44_022331B0

	thumb_func_start ov44_022331C4
ov44_022331C4: ; 0x022331C4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov44_0223323C
	add r0, r5, #0
	add r0, #0x30
	add r1, r6, #0
	bl ov44_0223325C
	add r0, r5, #0
	add r0, #0x30
	add r1, r4, #0
	add r2, r6, #0
	bl ov44_02233444
	add r0, r5, #0
	add r0, #0x30
	add r1, r4, #0
	add r2, r6, #0
	bl ov44_0223362C
	add r0, r5, #0
	add r0, #0x30
	add r1, r4, #0
	add r2, r6, #0
	bl ov44_02233698
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov44_02233A50
	add r5, #0x30
	add r0, r5, #0
	add r1, r6, #0
	bl ov44_0223376C
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_022331C4

	thumb_func_start ov44_02233214
ov44_02233214: ; 0x02233214
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x30
	add r4, r1, #0
	bl ov44_02233820
	add r0, r5, #0
	add r0, #0x30
	bl ov44_02233678
	add r0, r5, #0
	add r0, #0x30
	add r1, r4, #0
	bl ov44_022335AC
	add r5, #0x30
	add r0, r5, #0
	bl ov44_0223340C
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02233214

	thumb_func_start ov44_0223323C
ov44_0223323C: ; 0x0223323C
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _02233258 ; =ov44_022364E8
	add r3, sp, #0
	mov r2, #5
_02233246:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02233246
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_02233258: .word ov44_022364E8
	thumb_func_end ov44_0223323C

	thumb_func_start ov44_0223325C
ov44_0223325C: ; 0x0223325C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x74
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl BgConfig_Alloc
	add r3, sp, #0x64
	ldr r6, _022333FC ; =ov44_02236474
	str r0, [r5]
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r6, _02233400 ; =ov44_022364B0
	add r3, sp, #0x48
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #0
	str r0, [r3]
	ldr r0, [r5]
	add r3, r1, #0
	bl InitBgFromTemplate
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r6, _02233404 ; =ov44_02236494
	add r3, sp, #0x2c
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #1
	str r0, [r3]
	ldr r0, [r5]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r6, _02233408 ; =ov44_022364CC
	add r3, sp, #0x10
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #2
	str r0, [r3]
	ldr r0, [r5]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	mov r0, #8
	mov r1, #0
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
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #0x58
	add r1, r4, #0
	bl NARC_ctor
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0xe
	mov r2, #0
	mov r3, #0xa0
	add r6, r0, #0
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0
	mov r0, #6
	str r1, [sp]
	lsl r0, r0, #8
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	add r0, r6, #0
	mov r1, #0xd
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r3, #0x79
	lsl r3, r3, #2
	add r0, r6, #0
	mov r1, #0xf
	mov r2, #0
	add r3, r5, r3
	str r4, [sp]
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r2, #0x1e
	lsl r2, r2, #4
	str r0, [r5, r2]
	add r2, #0x10
	add r0, r6, #0
	mov r1, #0x2d
	add r2, r5, r2
	add r3, r4, #0
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	mov r1, #0x7b
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	add r0, r6, #0
	mov r1, #0x2e
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5]
	add r0, r6, #0
	mov r1, #0x2f
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r5, #0
	mov r1, #0
	bl ov44_02233D08
	mov r0, #0x7d
	mov r1, #3
	lsl r0, r0, #2
	strh r1, [r5, r0]
	mov r1, #1
	add r0, r0, #2
	strh r1, [r5, r0]
	add r0, r6, #0
	bl NARC_dtor
	add sp, #0x74
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_022333FC: .word ov44_02236474
_02233400: .word ov44_022364B0
_02233404: .word ov44_02236494
_02233408: .word ov44_022364CC
	thumb_func_end ov44_0223325C

	thumb_func_start ov44_0223340C
ov44_0223340C: ; 0x0223340C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x7b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, [r4]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov44_0223340C

	thumb_func_start ov44_02233444
ov44_02233444: ; 0x02233444
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0
	mov r1, #0x20
	add r4, r2, #0
	bl LoadFontPal1
	ldr r0, [r6, #8]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	str r4, [sp, #4]
	mov r1, #1
	ldr r0, [r5]
	add r2, r1, #0
	mov r3, #2
	bl LoadUserFrameGfx2
	mov r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r5]
	mov r1, #1
	mov r2, #0x1f
	mov r3, #3
	bl LoadUserFrameGfx1
	mov r0, #0
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r5]
	mov r1, #2
	mov r2, #0x30
	mov r3, #4
	bl LoadUserFrameGfx1
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r2, #1
	mov r1, #0x63
	lsl r1, r1, #2
	str r2, [sp, #0xc]
	mov r0, #0x28
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r1, r5, r1
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0x63
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x63
	lsl r0, r0, #2
	mov r1, #1
	add r0, r5, r0
	add r2, r1, #0
	mov r3, #2
	bl DrawFrameAndWindow2
	mov r2, #1
	mov r1, #0x67
	lsl r1, r1, #2
	str r2, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	mov r0, #0x94
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r1, r5, r1
	add r3, r2, #0
	bl AddWindowParameterized
	mov r0, #0x67
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x67
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	mov r2, #0x1f
	mov r3, #3
	bl DrawFrameAndWindow1
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r3, #2
	str r3, [sp, #8]
	mov r2, #1
	str r2, [sp, #0xc]
	mov r1, #0xca
	str r1, [sp, #0x10]
	add r1, #0xe2
	ldr r0, [r5]
	add r1, r5, r1
	bl AddWindowParameterized
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #5
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	mov r2, #1
	mov r1, #0x6f
	lsl r1, r1, #2
	str r2, [sp, #0xc]
	add r0, #0xfa
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r1, r5, r1
	add r3, r2, #0
	bl AddWindowParameterized
	mov r0, #0x6f
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x6f
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	mov r2, #0x1f
	mov r3, #3
	bl DrawFrameAndWindow1
	mov r1, #5
	str r1, [sp]
	mov r0, #7
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r2, #1
	ldr r1, _022335A8 ; =0x000001A2
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	add r1, #0x2a
	ldr r0, [r5]
	add r1, r5, r1
	mov r3, #0x17
	bl AddWindowParameterized
	mov r0, #0x73
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_022335A8: .word 0x000001A2
	thumb_func_end ov44_02233444

	thumb_func_start ov44_022335AC
ov44_022335AC: ; 0x022335AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov44_02233954
	mov r0, #0x63
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #0x63
	lsl r0, r0, #2
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0x67
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x67
	lsl r0, r0, #2
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0x6f
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x6f
	lsl r0, r0, #2
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0x73
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl sub_0200E5D4
	mov r0, #0x73
	lsl r0, r0, #2
	add r0, r5, r0
	bl RemoveWindow
	mov r0, #0x77
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02233628
	add r1, r4, #0
	bl Clear2dMenuWindowAndDelete
_02233628:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_022335AC

	thumb_func_start ov44_0223362C
ov44_0223362C: ; 0x0223362C
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r0, r6, #0
	add r4, r1, #0
	bl ScrStrBufs_new
	str r0, [r5, #4]
	ldr r2, _02233674 ; =0x0000030A
	mov r0, #0
	mov r1, #0x1b
	add r3, r6, #0
	bl NewMsgDataFromNarc
	str r0, [r5, #8]
	mov r0, #1
	lsl r0, r0, #8
	add r1, r6, #0
	bl String_ctor
	str r0, [r5, #0xc]
	mov r0, #1
	lsl r0, r0, #8
	add r1, r6, #0
	bl String_ctor
	str r0, [r5, #0x10]
	mov r0, #0xff
	strb r0, [r5, #0x14]
	ldr r0, [r4, #8]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetTextFrameDelay
	strh r0, [r5, #0x16]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02233674: .word 0x0000030A
	thumb_func_end ov44_0223362C

	thumb_func_start ov44_02233678
ov44_02233678: ; 0x02233678
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl String_dtor
	ldr r0, [r4, #0xc]
	bl String_dtor
	ldr r0, [r4, #8]
	bl DestroyMsgData
	ldr r0, [r4, #4]
	bl ScrStrBufs_delete
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02233678

	thumb_func_start ov44_02233698
ov44_02233698: ; 0x02233698
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r4, r0, #0
	ldrb r0, [r5]
	cmp r0, #3
	bhi _022336DC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022336B2: ; jump table
	.short _022336DC - _022336B2 - 2 ; case 0
	.short _022336BA - _022336B2 - 2 ; case 1
	.short _022336C6 - _022336B2 - 2 ; case 2
	.short _022336D2 - _022336B2 - 2 ; case 3
_022336BA:
	mov r1, #0
	ldr r0, [r4, #4]
	add r2, r1, #0
	bl BufferWiFiPlazaActivityName
	b _022336DC
_022336C6:
	ldr r0, [r4, #4]
	mov r1, #0
	mov r2, #1
	bl BufferWiFiPlazaActivityName
	b _022336DC
_022336D2:
	ldr r0, [r4, #4]
	mov r1, #0
	mov r2, #2
	bl BufferWiFiPlazaActivityName
_022336DC:
	ldrb r2, [r5]
	ldr r1, _02233760 ; =ov44_0223689C
	ldr r0, [r4, #8]
	ldrb r1, [r1, r2]
	ldr r2, [r4, #0x10]
	bl ReadMsgDataIntoString
	ldr r0, [r4, #4]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02233764 ; =0x0001020F
	add r2, #0x9d
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, r2
	ldr r2, [r4, #0xc]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	mov r0, #0x67
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x6f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	ldr r0, [r4, #8]
	ldr r2, [r4, #0xc]
	mov r1, #0x80
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02233768 ; =0x00010200
	add r2, #0xad
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, r2
	ldr r2, [r4, #0xc]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	mov r0, #0x6b
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x63
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02233760: .word ov44_0223689C
_02233764: .word 0x0001020F
_02233768: .word 0x00010200
	thumb_func_end ov44_02233698

	thumb_func_start ov44_0223376C
ov44_0223376C: ; 0x0223376C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r7, r0, #0
	add r6, r1, #0
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x1f
	str r3, [sp, #0xc]
	add r2, r0, #0
	str r6, [sp, #0x10]
	bl OamManager_Create
	ldr r4, _02233818 ; =ov44_02236484
	add r3, sp, #0x14
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	ldr r1, _0223381C ; =0x00200010
	mov r2, #0x10
	str r6, [sp, #0x20]
	bl sub_020215C0
	mov r0, #4
	add r1, r6, #0
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	ldr r1, _0223381C ; =0x00200010
	mov r0, #1
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	add r1, r7, #0
	mov r0, #4
	add r1, #0x1c
	add r2, r6, #0
	bl G2dRenderer_Init
	str r0, [r7, #0x18]
	mov r4, #0
	add r5, r7, #0
_022337D8:
	mov r0, #4
	add r1, r4, #0
	add r2, r6, #0
	bl Create2DGfxResObjMan
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _022337D8
	mov r0, #4
	add r1, r6, #0
	bl ov42_02228010
	mov r1, #0x55
	lsl r1, r1, #2
	str r0, [r7, r1]
	str r6, [sp]
	ldr r0, [r7, #0x18]
	mov r1, #0
	mov r2, #4
	mov r3, #1
	bl ov42_02228EDC
	mov r1, #0x56
	lsl r1, r1, #2
	str r0, [r7, r1]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02233818: .word ov44_02236484
_0223381C: .word 0x00200010
	thumb_func_end ov44_0223376C

	thumb_func_start ov44_02233820
ov44_02233820: ; 0x02233820
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov42_02228F94
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov42_02228050
	ldr r0, [r5, #0x18]
	bl sub_02024504
	mov r6, #0x51
	mov r4, #0
	lsl r6, r6, #2
_02233844:
	ldr r0, [r5, r6]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02233844
	bl sub_0202168C
	bl sub_02022608
	bl OamManager_Free
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_02233820

	thumb_func_start ov44_02233860
ov44_02233860: ; 0x02233860
	push {r3, lr}
	str r3, [sp]
	mov r3, #0
	bl ov44_0223386C
	pop {r3, pc}
	thumb_func_end ov44_02233860

	thumb_func_start ov44_0223386C
ov44_0223386C: ; 0x0223386C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldrb r0, [r5, #0x14]
	add r4, r1, #0
	add r6, r3, #0
	str r2, [sp, #0x10]
	cmp r0, #0xff
	beq _02233890
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _02233890
	ldrb r0, [r5, #0x14]
	bl sub_020200A0
	mov r0, #0xff
	strb r0, [r5, #0x14]
_02233890:
	mov r0, #0x63
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #1
	ldr r1, [sp, #0x28]
	lsl r0, r0, #8
	bl String_ctor
	add r7, r0, #0
	ldr r0, [r5, #8]
	ldr r1, [sp, #0x10]
	add r2, r7, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #4]
	ldr r1, [r5, #0xc]
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r3, #0
	str r3, [sp]
	ldrh r0, [r5, #0x16]
	mov r1, #1
	str r0, [sp, #4]
	ldr r0, _02233910 ; =0x0001020F
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r2, [r5, #0xc]
	add r0, r5, r0
	bl AddTextPrinterParameterized2
	strb r0, [r5, #0x14]
	mov r0, #0x63
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r7, #0
	bl String_dtor
	ldr r0, [r4, #8]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x28]
	mov r1, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	add r2, r1, #0
	mov r3, #2
	bl LoadUserFrameGfx2
	strb r6, [r5, #0x15]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02233910: .word 0x0001020F
	thumb_func_end ov44_0223386C

	thumb_func_start ov44_02233914
ov44_02233914: ; 0x02233914
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0x14]
	cmp r0, #0xff
	bne _0223392C
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	beq _0223393E
	sub r0, r0, #1
	strb r0, [r4, #0x15]
	mov r0, #0
	pop {r4, pc}
_0223392C:
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223393E
	ldrb r0, [r4, #0x14]
	cmp r0, #0xff
	beq _0223393E
	mov r0, #0xff
	strb r0, [r4, #0x14]
_0223393E:
	ldrb r0, [r4, #0x14]
	cmp r0, #0xff
	bne _0223394E
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	bne _0223394E
	mov r0, #1
	pop {r4, pc}
_0223394E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02233914

	thumb_func_start ov44_02233954
ov44_02233954: ; 0x02233954
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0x14]
	cmp r0, #0xff
	beq _02233970
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0223396C
	ldrb r0, [r4, #0x14]
	bl sub_020200A0
_0223396C:
	mov r0, #0xff
	strb r0, [r4, #0x14]
_02233970:
	mov r0, #0x63
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x63
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0
	strb r0, [r4, #0x15]
	pop {r4, pc}
	thumb_func_end ov44_02233954

	thumb_func_start ov44_0223398C
ov44_0223398C: ; 0x0223398C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #1
	add r4, r3, #0
	str r1, [sp, #0x10]
	lsl r0, r0, #8
	add r1, r4, #0
	str r2, [sp, #0x14]
	bl String_ctor
	add r6, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	add r1, r4, #0
	bl String_ctor
	add r7, r0, #0
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	add r0, r5, #0
	mov r3, #0
	str r4, [sp]
	bl ov44_02233C88
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	str r4, [sp]
	add r0, r5, #0
	mov r3, #1
	bl ov44_02233CA0
	ldr r0, [r5, #8]
	mov r1, #0x83
	add r2, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #4]
	add r1, r7, #0
	add r2, r6, #0
	bl StringExpandPlaceholders
	mov r0, #0x73
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02233A30 ; =0x0001020F
	add r2, #0xcd
	str r0, [sp, #8]
	add r0, r5, r2
	add r2, r7, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	mov r0, #0x73
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	mov r2, #0x1f
	mov r3, #3
	bl DrawFrameAndWindow1
	mov r0, #0x73
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02233A30: .word 0x0001020F
	thumb_func_end ov44_0223398C

	thumb_func_start ov44_02233A34
ov44_02233A34: ; 0x02233A34
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x73
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl sub_0200E5D4
	mov r0, #0x73
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	thumb_func_end ov44_02233A34

	thumb_func_start ov44_02233A50
ov44_02233A50: ; 0x02233A50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp, #4]
	add r7, r1, #0
	add r5, r2, #0
	bl sub_02034420
	cmp r0, #0
	beq _02233AB2
	ldr r6, [sp, #4]
	mov r4, #0
	add r6, #0x30
_02233A68:
	cmp r4, #0
	bne _02233A86
	add r0, r4, #0
	bl sub_02034730
	cmp r0, #1
	bne _02233A86
	ldr r0, [sp, #4]
	add r1, r6, #0
	add r2, r7, #0
	add r3, r4, #0
	str r5, [sp]
	bl ov44_02233AB8
	b _02233AAC
_02233A86:
	add r0, r4, #0
	bl sub_02034750
	cmp r0, #1
	bne _02233AA0
	ldr r0, [sp, #4]
	add r1, r6, #0
	add r2, r7, #0
	add r3, r4, #0
	str r5, [sp]
	bl ov44_02233AB8
	b _02233AAC
_02233AA0:
	add r0, r6, #0
	add r1, r7, #0
	add r2, r4, #0
	add r3, r5, #0
	bl ov44_02233C18
_02233AAC:
	add r4, r4, #1
	cmp r4, #4
	blt _02233A68
_02233AB2:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov44_02233A50

	thumb_func_start ov44_02233AB8
ov44_02233AB8: ; 0x02233AB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	ldr r7, [sp, #0x40]
	str r0, [sp, #0x1c]
	mov r0, #1
	add r5, r1, #0
	lsl r0, r0, #8
	add r1, r7, #0
	str r2, [sp, #0x20]
	add r4, r3, #0
	bl String_ctor
	str r0, [sp, #0x28]
	mov r0, #1
	lsl r0, r0, #8
	add r1, r7, #0
	bl String_ctor
	str r0, [sp, #0x24]
	ldr r1, [sp, #0x20]
	str r7, [sp]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl ov44_02233C88
	ldr r0, [r5, #8]
	ldr r2, [sp, #0x28]
	mov r1, #0x81
	bl ReadMsgDataIntoString
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	bl StringExpandPlaceholders
	mov r0, #0xa0
	str r0, [sp]
	mov r0, #0x10
	lsl r6, r4, #4
	str r0, [sp, #4]
	mov r0, #0x6f
	lsl r0, r0, #2
	lsl r3, r6, #0x10
	add r0, r5, r0
	mov r1, #0xf
	mov r2, #0
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	mov r1, #0
	str r6, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02233C14 ; =0x0001020F
	add r2, #0xbd
	str r0, [sp, #8]
	add r0, r5, r2
	ldr r2, [sp, #0x24]
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r1, [sp, #0x20]
	str r7, [sp]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl ov44_02233CA0
	ldr r0, [r5, #8]
	ldr r2, [sp, #0x28]
	mov r1, #0x82
	bl ReadMsgDataIntoString
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	bl StringExpandPlaceholders
	str r6, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02233C14 ; =0x0001020F
	add r2, #0xbd
	str r0, [sp, #8]
	add r0, r5, r2
	mov r1, #0
	ldr r2, [sp, #0x24]
	mov r3, #0x48
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	mov r0, #0x6f
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	bl sub_0203769C
	cmp r4, r0
	bne _02233B98
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	add r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0
	beq _02233B94
	mov r2, #2
	b _02233BAA
_02233B94:
	mov r2, #1
	b _02233BAA
_02233B98:
	ldr r0, [sp, #0x1c]
	add r0, r0, r4
	add r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _02233BA8
	mov r2, #2
	b _02233BAA
_02233BA8:
	mov r2, #1
_02233BAA:
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	lsl r1, r4, #1
	add r4, r1, #5
	mov r1, #2
	str r1, [sp]
	add r3, r0, #0
	lsl r2, r2, #0x19
	str r1, [sp, #4]
	add r3, #0xc
	str r3, [sp, #8]
	lsr r2, r2, #0x18
	str r2, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	ldrh r2, [r0]
	lsl r3, r4, #0x18
	lsr r3, r3, #0x18
	lsl r2, r2, #0x15
	lsr r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r2, #0x12
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl CopyToBgTilemapRect
	mov r1, #2
	str r1, [sp]
	lsl r3, r4, #0x18
	str r1, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r2, #0x12
	lsr r3, r3, #0x18
	bl BgTilemapRectChangePalette
	ldr r0, [r5]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [sp, #0x28]
	bl String_dtor
	ldr r0, [sp, #0x24]
	bl String_dtor
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02233C14: .word 0x0001020F
	thumb_func_end ov44_02233AB8

	thumb_func_start ov44_02233C18
ov44_02233C18: ; 0x02233C18
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #0xa0
	add r4, r2, #0
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0x6f
	lsl r0, r0, #2
	lsl r3, r4, #0x14
	add r0, r5, r0
	mov r1, #0xf
	mov r2, #0
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #2
	str r1, [sp]
	add r2, r0, #0
	lsl r3, r4, #1
	add r3, r3, #5
	lsl r3, r3, #0x18
	str r1, [sp, #4]
	add r2, #0xc
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r2, [r0]
	lsr r3, r3, #0x18
	lsl r2, r2, #0x15
	lsr r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r2, #0x12
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	bl CopyToBgTilemapRect
	ldr r0, [r5]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0x6f
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end ov44_02233C18

	thumb_func_start ov44_02233C88
ov44_02233C88: ; 0x02233C88
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r4, r3, #0
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r5, #4]
	add r1, r4, #0
	bl BufferPlayersName
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02233C88

	thumb_func_start ov44_02233CA0
ov44_02233CA0: ; 0x02233CA0
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, r2, #0
	add r4, r3, #0
	bl sub_02034818
	bl PlayerProfile_GetTrainerID_VisibleHalf
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	add r1, r4, #0
	mov r3, #5
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_02233CA0

	thumb_func_start ov44_02233CCC
ov44_02233CCC: ; 0x02233CCC
	push {r4, lr}
	mov r1, #0x7d
	add r4, r0, #0
	lsl r1, r1, #2
	ldrsh r2, [r4, r1]
	cmp r2, #0
	bgt _02233CFC
	add r1, r1, #2
	ldrsh r1, [r4, r1]
	bl ov44_02233D08
	mov r0, #0x7d
	mov r1, #3
	lsl r0, r0, #2
	strh r1, [r4, r0]
	add r0, r0, #2
	ldrsh r0, [r4, r0]
	mov r1, #0x12
	add r0, r0, #1
	bl _s32_div_f
	ldr r0, _02233D04 ; =0x000001F6
	strh r1, [r4, r0]
	pop {r4, pc}
_02233CFC:
	sub r0, r2, #1
	strh r0, [r4, r1]
	pop {r4, pc}
	nop
_02233D04: .word 0x000001F6
	thumb_func_end ov44_02233CCC

	thumb_func_start ov44_02233D08
ov44_02233D08: ; 0x02233D08
	push {r4, lr}
	mov r2, #0x1f
	add r3, r0, #0
	lsl r2, r2, #4
	ldr r2, [r3, r2]
	add r4, r1, #0
	ldr r3, [r2, #0xc]
	ldr r2, _02233D34 ; =ov44_0223663C
	mov r0, #0xf
	ldrb r2, [r2, r4]
	mov r1, #0
	lsl r2, r2, #5
	add r2, r3, r2
	mov r3, #0x20
	bl GF_CreateNewVramTransferTask
	cmp r0, #0
	bne _02233D30
	bl GF_AssertFail
_02233D30:
	pop {r4, pc}
	nop
_02233D34: .word ov44_0223663C
	thumb_func_end ov44_02233D08

	thumb_func_start ov44_02233D38
ov44_02233D38: ; 0x02233D38
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4]
	add r0, r2, #0
	add r0, #0x22
	ldrb r1, [r0]
	mov r0, #1
	add r2, #0x22
	sub r0, r0, r1
	strb r0, [r2]
	ldr r1, [r4]
	add r0, r1, #0
	add r0, #0x22
	ldrb r0, [r0]
	add r1, #0x21
	strb r0, [r1]
	ldr r0, [r4]
	add r0, #0x21
	ldrb r0, [r0]
	bl ov00_021E70B8
	ldr r0, [r4]
	mov r1, #0x24
	bl ov00_021E6D60
	ldr r0, [r4]
	add r0, #0x21
	ldrb r0, [r0]
	cmp r0, #1
	bne _02233D7C
	add r0, r4, #0
	bl ov44_02233F3C
	b _02233D82
_02233D7C:
	add r0, r4, #0
	bl ov44_02233F50
_02233D82:
	ldr r0, [r4]
	add r0, #0x22
	ldrb r0, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02233D38

	thumb_func_start ov44_02233D8C
ov44_02233D8C: ; 0x02233D8C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldrb r0, [r4, #4]
	cmp r0, #0
	ldrb r0, [r4, #5]
	beq _02233DC0
	add r0, #0xe5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #2
	bls _02233E44
	bl sub_020390C4
	cmp r0, #2
	bgt _02233DD6
	add r0, r4, #0
	bl ov44_02233F64
	cmp r0, #1
	bgt _02233DD6
	add r0, r4, #0
	bl ov44_02233E6C
	cmp r0, #0
	bne _02233DD6
	pop {r3, r4, r5, r6, r7, pc}
_02233DC0:
	cmp r0, #0xf
	beq _02233E44
	cmp r0, #0x10
	beq _02233E44
	cmp r0, #0x11
	beq _02233E44
	add r0, #0xfa
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bls _02233E44
_02233DD6:
	add r0, r4, #0
	bl ov44_02234458
	add r6, r0, #0
	add r0, r4, #0
	bl ov44_02234044
	add r7, r0, #0
	add r0, r4, #0
	bl ov44_02233F64
	add r5, r0, #0
	bl sub_02037454
	cmp r5, r0
	ble _02233DFA
	mov r5, #1
	b _02233DFC
_02233DFA:
	mov r5, #0
_02233DFC:
	bl sub_020390C4
	cmp r0, #3
	bge _02233E34
	bl sub_020393C8
	cmp r0, #0
	bne _02233E34
	bl sub_02039264
	cmp r0, #0
	bne _02233E34
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	beq _02233E34
	add r0, r4, #0
	bl ov44_02233E6C
	cmp r0, #0
	beq _02233E34
	cmp r5, #1
	beq _02233E34
	cmp r6, #1
	beq _02233E34
	cmp r7, #1
	bne _02233E44
_02233E34:
	ldrb r0, [r4, #4]
	cmp r0, #0
	beq _02233E40
	mov r0, #0x1b
	strb r0, [r4, #5]
	pop {r3, r4, r5, r6, r7, pc}
_02233E40:
	mov r0, #0xf
	strb r0, [r4, #5]
_02233E44:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov44_02233D8C

	thumb_func_start ov44_02233E48
ov44_02233E48: ; 0x02233E48
	push {r4, lr}
	add r4, r0, #0
	bl sub_020390C4
	cmp r0, #3
	bgt _02233E64
	bl sub_02039264
	cmp r0, #0
	bne _02233E64
	bl sub_020393C8
	cmp r0, #0
	beq _02233E68
_02233E64:
	mov r0, #0xf
	strb r0, [r4, #5]
_02233E68:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02233E48

	thumb_func_start ov44_02233E6C
ov44_02233E6C: ; 0x02233E6C
	push {r3, lr}
	bl sub_02037454
	cmp r0, #0
	ble _02233E7A
	mov r0, #1
	pop {r3, pc}
_02233E7A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov44_02233E6C

	thumb_func_start ov44_02233E80
ov44_02233E80: ; 0x02233E80
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl sub_02039080
	add r5, r0, #0
	cmp r5, #1
	bne _02233EB0
	cmp r4, #3
	bhi _02233EB0
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02233E9E: ; jump table
	.short _02233EA6 - _02233E9E - 2 ; case 0
	.short _02233EAC - _02233E9E - 2 ; case 1
	.short _02233EAC - _02233E9E - 2 ; case 2
	.short _02233EAC - _02233E9E - 2 ; case 3
_02233EA6:
	bl sub_02039AF8
	b _02233EB0
_02233EAC:
	bl sub_02039B18
_02233EB0:
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02233E80

	thumb_func_start ov44_02233EB4
ov44_02233EB4: ; 0x02233EB4
	ldrb r1, [r1]
	cmp r1, #3
	bhi _02233EEC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02233EC6: ; jump table
	.short _02233ECE - _02233EC6 - 2 ; case 0
	.short _02233ED6 - _02233EC6 - 2 ; case 1
	.short _02233EDE - _02233EC6 - 2 ; case 2
	.short _02233EE6 - _02233EC6 - 2 ; case 3
_02233ECE:
	ldr r1, [r0]
	mov r2, #0x12
	strb r2, [r1, #0x1b]
	b _02233EEC
_02233ED6:
	ldr r1, [r0]
	mov r2, #0x16
	strb r2, [r1, #0x1b]
	b _02233EEC
_02233EDE:
	ldr r1, [r0]
	mov r2, #0x18
	strb r2, [r1, #0x1b]
	b _02233EEC
_02233EE6:
	ldr r1, [r0]
	mov r2, #0x1a
	strb r2, [r1, #0x1b]
_02233EEC:
	ldr r3, _02233EF4 ; =ov00_021E6D60
	ldr r0, [r0]
	mov r1, #0x24
	bx r3
	.balign 4, 0
_02233EF4: .word ov00_021E6D60
	thumb_func_end ov44_02233EB4

	thumb_func_start ov44_02233EF8
ov44_02233EF8: ; 0x02233EF8
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #0x11]
	cmp r1, #1
	bne _02233F06
	mov r0, #0
	pop {r4, pc}
_02233F06:
	bl ov44_02233E6C
	cmp r0, #1
	bne _02233F1A
	mov r0, #0x68
	bl ov00_021E69A8
	mov r0, #1
	strb r0, [r4, #0x11]
	pop {r4, pc}
_02233F1A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02233EF8

	thumb_func_start ov44_02233F20
ov44_02233F20: ; 0x02233F20
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	bne _02233F2E
	mov r0, #0
	pop {r4, pc}
_02233F2E:
	bl ov00_021E6A4C
	mov r0, #0
	strb r0, [r4, #0x11]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02233F20

	thumb_func_start ov44_02233F3C
ov44_02233F3C: ; 0x02233F3C
	push {r3, lr}
	bl ov44_02233EF8
	cmp r0, #0
	beq _02233F4E
	bl GF_GetCurrentPlayingBGM
	bl sub_02005448
_02233F4E:
	pop {r3, pc}
	thumb_func_end ov44_02233F3C

	thumb_func_start ov44_02233F50
ov44_02233F50: ; 0x02233F50
	push {r3, lr}
	bl ov44_02233F20
	cmp r0, #0
	beq _02233F62
	mov r0, #0
	mov r1, #0x78
	bl GF_SndHandleSetInitialVolume
_02233F62:
	pop {r3, pc}
	thumb_func_end ov44_02233F50

	thumb_func_start ov44_02233F64
ov44_02233F64: ; 0x02233F64
	ldr r3, _02233F68 ; =sub_020347A0
	bx r3
	.balign 4, 0
_02233F68: .word sub_020347A0
	thumb_func_end ov44_02233F64

	thumb_func_start ov44_02233F6C
ov44_02233F6C: ; 0x02233F6C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r7, #1
	bl sub_0203769C
	sub r4, r0, #1
	bmi _02233FA2
_02233F7C:
	add r0, r4, #0
	bl sub_02034714
	cmp r0, #1
	bne _02233F92
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov44_022340BC
	b _02233F9E
_02233F92:
	add r0, r4, #0
	bl sub_02034750
	cmp r0, #0
	bne _02233F9E
	mov r7, #0
_02233F9E:
	sub r4, r4, #1
	bpl _02233F7C
_02233FA2:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov44_02233F6C

	thumb_func_start ov44_02233FA8
ov44_02233FA8: ; 0x02233FA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r0, #0
	str r0, [sp, #4]
	mov r5, #1
	mov r6, #0x16
	add r7, sp, #0
	add r4, sp, #0
_02233FB8:
	add r0, r5, #0
	bl sub_02034714
	cmp r0, #1
	bne _02233FDC
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #8
	strh r5, [r4]
	bl sub_02037030
	cmp r0, #1
	beq _02233FD6
	bl GF_AssertFail
_02233FD6:
	add r0, r5, #0
	bl sub_020346E8
_02233FDC:
	add r5, r5, #1
	cmp r5, #4
	blt _02233FB8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov44_02233FA8

	thumb_func_start ov44_02233FE8
ov44_02233FE8: ; 0x02233FE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r0, #0
	str r0, [sp, #4]
	mov r5, #1
	mov r6, #0x16
	add r7, sp, #0
	add r4, sp, #0
_02233FF8:
	add r0, r5, #0
	bl sub_02034730
	cmp r0, #1
	bne _0223401C
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #8
	strh r5, [r4]
	bl sub_02037030
	cmp r0, #1
	beq _02234016
	bl GF_AssertFail
_02234016:
	add r0, r5, #0
	bl sub_020346E8
_0223401C:
	add r5, r5, #1
	cmp r5, #4
	blt _02233FF8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov44_02233FE8

	thumb_func_start ov44_02234028
ov44_02234028: ; 0x02234028
	ldr r3, _02234030 ; =ov00_021E5CA0
	add r1, r0, #0
	ldr r0, _02234034 ; =ov44_02234070
	bx r3
	.balign 4, 0
_02234030: .word ov00_021E5CA0
_02234034: .word ov44_02234070
	thumb_func_end ov44_02234028

	thumb_func_start ov44_02234038
ov44_02234038: ; 0x02234038
	ldr r3, _02234040 ; =ov00_021E5CA0
	mov r0, #0
	add r1, r0, #0
	bx r3
	.balign 4, 0
_02234040: .word ov00_021E5CA0
	thumb_func_end ov44_02234038

	thumb_func_start ov44_02234044
ov44_02234044: ; 0x02234044
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	add r6, r0, #0
	add r4, r7, #0
_0223404C:
	add r5, r6, r4
	ldrb r0, [r5, #0x14]
	cmp r0, #1
	bne _02234066
	ldrb r0, [r5, #0x18]
	bl sub_02034750
	cmp r0, #1
	bne _02234060
	mov r7, #1
_02234060:
	mov r0, #0
	strb r0, [r5, #0x14]
	strb r0, [r5, #0x18]
_02234066:
	add r4, r4, #1
	cmp r4, #4
	blt _0223404C
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_02234044

	thumb_func_start ov44_02234070
ov44_02234070: ; 0x02234070
	mov r2, #1
	add r1, r1, r0
	strb r2, [r1, #0x14]
	strb r0, [r1, #0x18]
	bx lr
	.balign 4, 0
	thumb_func_end ov44_02234070

	thumb_func_start ov44_0223407C
ov44_0223407C: ; 0x0223407C
	push {r3, r4, r5, r6}
	mov r4, #0
	add r3, r4, #0
	mov r2, #1
_02234084:
	add r6, r0, r3
	add r1, r6, #0
	add r1, #0x20
	ldrb r5, [r1]
	ldrb r1, [r6, #0x1c]
	cmp r1, r5
	beq _02234094
	add r4, r2, #0
_02234094:
	add r3, r3, #1
	strb r5, [r6, #0x1c]
	cmp r3, #4
	blt _02234084
	add r1, r0, #0
	add r1, #0x24
	ldrb r1, [r1]
	cmp r1, #0
	beq _022340AE
	mov r1, #0
	add r0, #0x24
	strb r1, [r0]
	mov r4, #1
_022340AE:
	add r0, r4, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end ov44_0223407C

	thumb_func_start ov44_022340B4
ov44_022340B4: ; 0x022340B4
	mov r1, #1
	add r0, #0x24
	strb r1, [r0]
	bx lr
	thumb_func_end ov44_022340B4

	thumb_func_start ov44_022340BC
ov44_022340BC: ; 0x022340BC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	bl sub_02034750
	cmp r0, #0
	bne _022340EA
	add r0, r4, #0
	bl sub_0203476C
	add r0, r5, #0
	add r0, #0x25
	strb r4, [r0]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov44_022340EC
	add r0, r5, #0
	bl ov44_022340B4
_022340EA:
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_022340BC

	thumb_func_start ov44_022340EC
ov44_022340EC: ; 0x022340EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r1, #0
	add r5, r0, #0
	mov r0, #0xc
	add r4, r6, #0
	mul r4, r0
	mov r0, #0x63
	lsl r0, r0, #2
	add r7, r5, r0
	ldr r0, [r7, r4]
	str r2, [sp]
	cmp r0, #0
	bne _022341B8
	ldr r1, _022341BC ; =ov44_02236510
	ldrh r2, [r1, r4]
	add r0, r1, r4
	add r1, sp, #4
	strh r2, [r1]
	ldrh r2, [r0, #2]
	strh r2, [r1, #2]
	ldrh r2, [r0, #4]
	strh r2, [r1, #4]
	ldrh r2, [r0, #6]
	strh r2, [r1, #6]
	ldrh r2, [r0, #8]
	strh r2, [r1, #8]
	ldrh r0, [r0, #0xa]
	strh r0, [r1, #0xa]
	bl sub_0203769C
	cmp r6, r0
	beq _02234148
	add r0, r6, #0
	bl sub_02034818
	add r6, r0, #0
	bne _0223413C
	bl GF_AssertFail
_0223413C:
	add r0, r6, #0
	bl PlayerProfile_GetAvatar
	add r1, sp, #4
	strh r0, [r1, #0xa]
	b _0223415C
_02234148:
	ldr r0, [r5]
	ldrb r0, [r0, #0x1e]
	cmp r0, #0
	add r0, sp, #4
	bne _02234158
	mov r1, #0
	strh r1, [r0, #0xa]
	b _0223415C
_02234158:
	mov r1, #0x61
	strh r1, [r0, #0xa]
_0223415C:
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #4
	bl ov42_022280B8
	str r0, [r7, r4]
	mov r0, #0x62
	add r1, sp, #4
	lsl r0, r0, #2
	ldrh r1, [r1, #0xa]
	ldr r0, [r5, r0]
	bl ov42_02229010
	cmp r0, #0
	bne _0223418E
	mov r0, #0x62
	add r1, sp, #4
	lsl r0, r0, #2
	ldrh r1, [r1, #0xa]
	ldr r0, [r5, r0]
	ldr r3, [sp]
	mov r2, #2
	bl ov42_02228FE0
_0223418E:
	mov r0, #0x19
	lsl r0, r0, #4
	add r6, r5, r0
	sub r0, #8
	ldr r0, [r5, r0]
	ldr r1, [r7, r4]
	ldr r3, [sp]
	mov r2, #0
	bl ov42_0222903C
	str r0, [r6, r4]
	ldr r0, [r6, r4]
	mov r1, #0
	bl ov42_02229200
	mov r0, #0x65
	lsl r0, r0, #2
	add r1, r5, r0
	ldrh r0, [r1, r4]
	add r0, r0, #1
	strh r0, [r1, r4]
_022341B8:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022341BC: .word ov44_02236510
	thumb_func_end ov44_022340EC

	thumb_func_start ov44_022341C0
ov44_022341C0: ; 0x022341C0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x63
	lsl r0, r0, #2
	mov r6, #0
	add r4, r7, r0
	add r5, r7, #0
_022341CE:
	mov r2, #0x65
	lsl r2, r2, #2
	ldrh r2, [r5, r2]
	add r0, r7, #0
	add r1, r4, #0
	lsl r3, r2, #2
	ldr r2, _02234200 ; =ov44_02236464
	ldr r2, [r2, r3]
	blx r2
	add r6, r6, #1
	add r4, #0xc
	add r5, #0xc
	cmp r6, #4
	blt _022341CE
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl ov42_0222807C
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl ov42_022290DC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02234200: .word ov44_02236464
	thumb_func_end ov44_022341C0

	thumb_func_start ov44_02234204
ov44_02234204: ; 0x02234204
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov42_0222901C
	mov r0, #0x63
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	mov r2, #0x30
	bl memset
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02234204

	thumb_func_start ov44_02234224
ov44_02234224: ; 0x02234224
	push {r3, lr}
	sub sp, #8
	add r0, sp, #0
	strh r1, [r0]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x16
	add r1, sp, #0
	mov r2, #8
	bl sub_02037030
	cmp r0, #1
	beq _02234242
	bl GF_AssertFail
_02234242:
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov44_02234224

	thumb_func_start ov44_02234248
ov44_02234248: ; 0x02234248
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0223424E:
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0]
	add r0, r0, #1
	cmp r0, r4
	bge _02234272
	add r0, r4, #0
	bl sub_02034714
	cmp r0, #1
	bne _02234272
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_02234224
	add r0, r4, #0
	bl sub_020346E8
_02234272:
	add r4, r4, #1
	cmp r4, #4
	blt _0223424E
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_02234248

	thumb_func_start ov44_0223427C
ov44_0223427C: ; 0x0223427C
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	add r5, r0, #0
	add r6, r1, #0
	add r7, r4, #0
_02234286:
	add r0, r5, r4
	add r0, #0x28
	ldrb r0, [r0]
	cmp r0, #1
	bne _022342AE
	add r0, r4, #0
	bl sub_02034730
	cmp r0, #1
	bne _022342AE
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov44_022340BC
	add r0, r5, r4
	add r0, #0x28
	strb r7, [r0]
	mov r0, #1
	strb r0, [r5, #0x12]
_022342AE:
	add r4, r4, #1
	cmp r4, #4
	blt _02234286
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov44_0223427C

	thumb_func_start ov44_022342B8
ov44_022342B8: ; 0x022342B8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x86
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022342CA
	bl GF_AssertFail
_022342CA:
	mov r0, #0x6f
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl sub_0200F0AC
	mov r1, #0x86
	lsl r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_022342B8

	thumb_func_start ov44_022342E0
ov44_022342E0: ; 0x022342E0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x86
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	add r6, r2, #0
	cmp r0, #0
	beq _0223431E
	bl sub_0200F450
	mov r0, #0x86
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [r4, #8]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	str r6, [sp, #4]
	mov r1, #1
	ldr r0, [r5, #0x30]
	add r2, r1, #0
	mov r3, #2
	bl LoadUserFrameGfx2
_0223431E:
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_022342E0

	thumb_func_start ov44_02234324
ov44_02234324: ; 0x02234324
	bx lr
	.balign 4, 0
	thumb_func_end ov44_02234324

	thumb_func_start ov44_02234328
ov44_02234328: ; 0x02234328
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov42_0222919C
	ldr r0, [r4, #4]
	bl ov42_022291A0
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov42_02229200
	mov r0, #2
	strh r0, [r4, #8]
	ldr r0, [r4]
	mov r1, #6
	bl ov42_02228188
	ldr r1, _02234358 ; =ov44_02236458
	ldrb r0, [r1, r0]
	add r0, #0x10
	strh r0, [r4, #0xa]
	pop {r4, pc}
	.balign 4, 0
_02234358: .word ov44_02236458
	thumb_func_end ov44_02234328

	thumb_func_start ov44_0223435C
ov44_0223435C: ; 0x0223435C
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #4]
	bl ov42_022291AC
	mov r0, #0xa
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, #0xa]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bgt _02234386
	ldr r0, [r4, #4]
	bl ov42_022291B8
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov42_0222919C
	mov r0, #3
	strh r0, [r4, #8]
_02234386:
	pop {r4, pc}
	thumb_func_end ov44_0223435C

	thumb_func_start ov44_02234388
ov44_02234388: ; 0x02234388
	bx lr
	.balign 4, 0
	thumb_func_end ov44_02234388

	thumb_func_start ov44_0223438C
ov44_0223438C: ; 0x0223438C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	bl sub_02034420
	cmp r0, #0
	beq _02234428
	bl sub_020347A0
	add r7, r0, #0
	bl sub_020346D4
	cmp r0, #0
	beq _022343BA
	mov r0, #5
	bl sub_02037824
	cmp r0, #0
	bne _022343BA
	mov r0, #1
	str r0, [sp]
_022343BA:
	mov r4, #0
	cmp r7, #0
	ble _02234402
_022343C0:
	cmp r4, #0
	bne _022343CC
	ldr r0, [r5]
	add r0, #0x21
	ldrb r0, [r0]
	b _022343E8
_022343CC:
	add r0, r4, #0
	bl sub_02034870
	add r6, r0, #0
	cmp r6, #0x20
	bne _022343DC
	bl GF_AssertFail
_022343DC:
	mov r0, #0x24
	ldr r1, [r5]
	mul r0, r6
	add r0, r1, r0
	add r0, #0x45
	ldrb r0, [r0]
_022343E8:
	add r1, r5, r4
	add r1, #0x20
	ldrb r1, [r1]
	cmp r0, r1
	beq _022343F6
	mov r1, #1
	str r1, [sp]
_022343F6:
	add r1, r5, r4
	add r1, #0x20
	add r4, r4, #1
	strb r0, [r1]
	cmp r4, r7
	blt _022343C0
_02234402:
	ldr r0, [sp]
	cmp r0, #1
	bne _02234428
	add r2, r5, #0
	add r5, #0x20
	ldrb r0, [r5]
	add r1, sp, #4
	add r2, #0x20
	strb r0, [r1]
	ldrb r0, [r2, #1]
	strb r0, [r1, #1]
	ldrb r0, [r2, #2]
	strb r0, [r1, #2]
	ldrb r0, [r2, #3]
	mov r2, #4
	strb r0, [r1, #3]
	mov r0, #0x18
	bl sub_02037030
_02234428:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_0223438C

	thumb_func_start ov44_0223442C
ov44_0223442C: ; 0x0223442C
	push {r3, lr}
	mov r0, #0xd
	bl sub_02037B38
	cmp r0, #0
	beq _0223443C
	mov r0, #1
	pop {r3, pc}
_0223443C:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov44_0223442C

	thumb_func_start ov44_02234440
ov44_02234440: ; 0x02234440
	mov r1, #1
	strb r1, [r0, #0x10]
	ldr r1, _0223444C ; =0x00000708
	str r1, [r0, #0xc]
	bx lr
	nop
_0223444C: .word 0x00000708
	thumb_func_end ov44_02234440

	thumb_func_start ov44_02234450
ov44_02234450: ; 0x02234450
	mov r1, #0
	strb r1, [r0, #0x10]
	bx lr
	.balign 4, 0
	thumb_func_end ov44_02234450

	thumb_func_start ov44_02234458
ov44_02234458: ; 0x02234458
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	bne _02234462
	mov r0, #0
	bx lr
_02234462:
	ldr r1, [r0, #0xc]
	cmp r1, #0
	ble _02234470
	sub r1, r1, #1
	str r1, [r0, #0xc]
	mov r0, #0
	bx lr
_02234470:
	mov r0, #1
	bx lr
	thumb_func_end ov44_02234458

	thumb_func_start ov44_02234474
ov44_02234474: ; 0x02234474
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5]
	add r4, r2, #0
	add r1, #0x21
	ldrb r1, [r1]
	cmp r1, #1
	bne _02234488
	bl ov44_02233F3C
_02234488:
	mov r0, #0
	bl ov00_021E7220
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	bl sub_0203769C
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl ov44_022340EC
	mov r0, #1
	strb r0, [r5, #5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02234474

	thumb_func_start ov44_022344AC
ov44_022344AC: ; 0x022344AC
	push {r4, lr}
	add r4, r0, #0
	add r3, r2, #0
	add r0, #0x30
	mov r2, #0x6b
	bl ov44_02233860
	mov r0, #2
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_022344AC

	thumb_func_start ov44_022344C4
ov44_022344C4: ; 0x022344C4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x30
	add r6, r1, #0
	bl ov44_02233914
	cmp r0, #0
	bne _022344DC
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_022344DC:
	add r0, r5, #0
	bl ov44_02233E6C
	cmp r0, #1
	bne _02234522
	bl sub_02034780
	add r4, r0, #0
	cmp r4, #0xff
	beq _02234522
	ldrb r1, [r5, #6]
	cmp r1, #0
	beq _02234522
	bl sub_02034870
	cmp r0, #0x20
	bne _02234520
	add r0, sp, #0
	strh r4, [r0]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_020346E8
	mov r0, #0x16
	add r1, sp, #0
	mov r2, #8
	bl sub_02037030
	cmp r0, #1
	beq _02234522
	bl GF_AssertFail
	b _02234522
_02234520:
	strb r4, [r5, #6]
_02234522:
	ldr r0, _02234598 ; =gSystem
	mov r1, #1
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _0223455A
	ldr r0, _0223459C ; =0x000005DD
	bl PlaySE
	add r0, r5, #0
	bl ov44_02233E6C
	cmp r0, #0
	bne _02234542
	mov r0, #6
	strb r0, [r5, #5]
	b _02234590
_02234542:
	add r0, r5, #0
	bl ov44_02233F64
	ldrb r1, [r6, #1]
	cmp r1, r0
	bgt _02234554
	mov r0, #8
	strb r0, [r5, #5]
	b _02234590
_02234554:
	mov r0, #6
	strb r0, [r5, #5]
	b _02234590
_0223455A:
	mov r1, #2
	add r2, r0, #0
	tst r2, r1
	beq _0223456E
	ldr r0, _0223459C ; =0x000005DD
	bl PlaySE
	mov r0, #0x16
	strb r0, [r5, #5]
	b _02234590
_0223456E:
	ldrb r2, [r5, #6]
	cmp r2, #0xff
	beq _02234580
	ldr r0, _0223459C ; =0x000005DD
	bl PlaySE
	mov r0, #3
	strb r0, [r5, #5]
	b _02234590
_02234580:
	lsl r1, r1, #9
	tst r0, r1
	beq _02234590
	mov r0, #0x1e
	strb r0, [r5, #5]
	ldr r0, _0223459C ; =0x000005DD
	bl PlaySE
_02234590:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02234598: .word gSystem
_0223459C: .word 0x000005DD
	thumb_func_end ov44_022344C4

	thumb_func_start ov44_022345A0
ov44_022345A0: ; 0x022345A0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r2, #0
	ldrb r2, [r5, #6]
	add r0, #0x30
	add r3, r6, #0
	add r4, r1, #0
	bl ov44_0223398C
	add r0, r5, #0
	add r0, #0x30
	add r1, r4, #0
	mov r2, #0x6c
	add r3, r6, #0
	bl ov44_02233860
	mov r0, #4
	strb r0, [r5, #5]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_022345A0

	thumb_func_start ov44_022345C8
ov44_022345C8: ; 0x022345C8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x30
	add r5, r2, #0
	bl ov44_02233914
	cmp r0, #0
	bne _022345DC
	mov r0, #0
	pop {r3, r4, r5, pc}
_022345DC:
	str r5, [sp]
	ldr r0, [r4, #0x30]
	ldr r1, _022345F8 ; =ov44_0223645C
	mov r2, #0x30
	mov r3, #4
	bl Std_CreateYesNoMenu
	mov r1, #0x83
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #5
	strb r0, [r4, #5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022345F8: .word ov44_0223645C
	thumb_func_end ov44_022345C8

	thumb_func_start ov44_022345FC
ov44_022345FC: ; 0x022345FC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x83
	lsl r0, r0, #2
	add r6, r2, #0
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02234694
	ldrb r2, [r5, #6]
	add r1, sp, #0
	cmp r0, #0
	strh r2, [r1]
	bne _02234660
	mov r0, #1
	str r0, [sp, #4]
	ldrb r1, [r5, #6]
	add r0, r5, #0
	add r2, r6, #0
	bl ov44_022340BC
	ldr r0, [r5]
	add r0, #0x21
	ldrb r0, [r0]
	cmp r0, #1
	bne _02234648
	add r0, r5, #0
	bl ov44_02233F20
	add r0, r5, #0
	bl ov44_02233F3C
_02234648:
	add r0, r5, #0
	bl ov44_02233F64
	ldrb r1, [r4, #2]
	cmp r1, r0
	bgt _0223465A
	mov r0, #8
	strb r0, [r5, #5]
	b _0223466E
_0223465A:
	mov r0, #1
	strb r0, [r5, #5]
	b _0223466E
_02234660:
	mov r0, #0
	str r0, [sp, #4]
	ldrb r0, [r5, #6]
	bl sub_020346E8
	mov r0, #1
	strb r0, [r5, #5]
_0223466E:
	mov r0, #0x16
	add r1, sp, #0
	mov r2, #8
	bl sub_02037030
	cmp r0, #1
	beq _02234680
	bl GF_AssertFail
_02234680:
	mov r0, #0xff
	strb r0, [r5, #6]
	add r0, r5, #0
	add r0, #0x30
	bl ov44_02233A34
	mov r0, #0x83
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_02234694:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_022345FC

	thumb_func_start ov44_0223469C
ov44_0223469C: ; 0x0223469C
	push {r4, lr}
	add r4, r0, #0
	add r3, r2, #0
	add r0, #0x30
	mov r2, #0x77
	bl ov44_02233860
	mov r0, #7
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_0223469C

	thumb_func_start ov44_022346B4
ov44_022346B4: ; 0x022346B4
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _022346C6
	mov r0, #0
	pop {r4, pc}
_022346C6:
	mov r0, #0x13
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_022346B4

	thumb_func_start ov44_022346D0
ov44_022346D0: ; 0x022346D0
	push {r4, lr}
	add r4, r0, #0
	add r3, r2, #0
	add r0, #0x30
	mov r2, #0x6f
	bl ov44_02233860
	mov r0, #9
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_022346D0

	thumb_func_start ov44_022346E8
ov44_022346E8: ; 0x022346E8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x30
	add r5, r2, #0
	bl ov44_02233914
	cmp r0, #0
	bne _022346FC
	mov r0, #0
	pop {r3, r4, r5, pc}
_022346FC:
	str r5, [sp]
	ldr r0, [r4, #0x30]
	ldr r1, _02234718 ; =ov44_0223645C
	mov r2, #0x30
	mov r3, #4
	bl Std_CreateYesNoMenu
	mov r1, #0x83
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0xa
	strb r0, [r4, #5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02234718: .word ov44_0223645C
	thumb_func_end ov44_022346E8

	thumb_func_start ov44_0223471C
ov44_0223471C: ; 0x0223471C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x83
	lsl r0, r0, #2
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r1, r2, #0
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0223475E
	cmp r0, #0
	bne _02234740
	mov r0, #0xb
	strb r0, [r5, #5]
	b _02234756
_02234740:
	add r0, r5, #0
	bl ov44_02233F64
	ldrb r1, [r4, #2]
	cmp r1, r0
	bgt _02234752
	mov r0, #0x13
	strb r0, [r5, #5]
	b _02234756
_02234752:
	mov r0, #1
	strb r0, [r5, #5]
_02234756:
	mov r0, #0x83
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_0223475E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_0223471C

	thumb_func_start ov44_02234764
ov44_02234764: ; 0x02234764
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0x1e
	add r6, r2, #0
	str r1, [r5, #8]
	bl ov44_02233FA8
	add r0, r5, #0
	add r0, #0x30
	add r1, r4, #0
	mov r2, #0x66
	add r3, r6, #0
	bl ov44_02233860
	add r0, r5, #0
	bl ov44_022342B8
	add r0, r5, #0
	bl ov44_02234440
	mov r0, #0xc
	strb r0, [r5, #5]
	bl ov00_021E7130
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_02234764

	thumb_func_start ov44_0223479C
ov44_0223479C: ; 0x0223479C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_02037454
	add r5, r0, #0
	bl sub_020347A0
	cmp r5, r0
	beq _022347B8
	add r0, r4, #0
	bl ov44_02233FA8
	mov r0, #0
	pop {r3, r4, r5, pc}
_022347B8:
	bl ov00_021E70F4
	cmp r0, #0
	bne _022347C4
	mov r0, #0
	pop {r3, r4, r5, pc}
_022347C4:
	mov r0, #1
	bl ov00_021E7220
	mov r0, #0xd
	strb r0, [r4, #5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_0223479C

	thumb_func_start ov44_022347D4
ov44_022347D4: ; 0x022347D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _022347F2
	mov r1, #0
	mov r0, #0x17
	add r2, r1, #0
	bl sub_02037030
	cmp r0, #0
	beq _022347F6
	mov r0, #0xe
	strb r0, [r4, #5]
	b _022347F6
_022347F2:
	sub r0, r0, #1
	str r0, [r4, #8]
_022347F6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_022347D4

	thumb_func_start ov44_022347FC
ov44_022347FC: ; 0x022347FC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0xd
	add r5, r1, #0
	bl sub_02037B38
	cmp r0, #0
	beq _02234822
	add r0, r4, #0
	add r1, r5, #0
	bl ov44_02233EB4
	bl sub_02037BEC
	mov r0, #0xe
	bl sub_02037AC0
	mov r0, #0xf
	strb r0, [r4, #5]
_02234822:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_022347FC

	thumb_func_start ov44_02234828
ov44_02234828: ; 0x02234828
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0xe
	bl sub_02037B38
	cmp r0, #0
	beq _02234852
	ldr r0, [r4]
	ldrb r1, [r0, #0x1b]
	add r0, sp, #0
	strh r1, [r0]
	bl sub_0203769C
	add r1, sp, #0
	bl sub_02037C0C
	cmp r0, #1
	bne _02234852
	mov r0, #0x10
	strb r0, [r4, #5]
_02234852:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov44_02234828

	thumb_func_start ov44_02234858
ov44_02234858: ; 0x02234858
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl ov44_02233F64
	add r7, r0, #0
	bl sub_0203769C
	mov r5, #0
	add r4, r5, #0
	str r0, [sp]
	cmp r7, #0
	ble _0223489C
_02234870:
	ldr r0, [sp]
	cmp r0, r4
	beq _02234894
	add r0, r4, #0
	bl sub_02037C44
	cmp r0, #0
	beq _02234896
	ldrh r1, [r0]
	ldr r0, [r6]
	ldrb r0, [r0, #0x1b]
	cmp r1, r0
	bne _0223488E
	add r5, r5, #1
	b _02234896
_0223488E:
	mov r0, #0x1b
	strb r0, [r6, #5]
	b _02234896
_02234894:
	add r5, r5, #1
_02234896:
	add r4, r4, #1
	cmp r4, r7
	blt _02234870
_0223489C:
	cmp r5, r7
	bne _022348A4
	mov r0, #0x11
	strb r0, [r6, #5]
_022348A4:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_02234858

	thumb_func_start ov44_022348A8
ov44_022348A8: ; 0x022348A8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	add r1, r0, #0
	bl sub_020398D4
	mov r0, #0x12
	bl sub_02037AC0
	mov r0, #0x12
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_022348A8

	thumb_func_start ov44_022348C4
ov44_022348C4: ; 0x022348C4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x12
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02037B38
	cmp r0, #0
	beq _022348E8
	mov r0, #1
	strb r0, [r5, #7]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov44_022342E0
	mov r0, #1
	pop {r4, r5, r6, pc}
_022348E8:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov44_022348C4

	thumb_func_start ov44_022348EC
ov44_022348EC: ; 0x022348EC
	push {r4, lr}
	add r4, r0, #0
	add r3, r2, #0
	add r0, #0x30
	mov r2, #0x78
	bl ov44_02233860
	mov r0, #0x14
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_022348EC

	thumb_func_start ov44_02234904
ov44_02234904: ; 0x02234904
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x30
	add r4, r2, #0
	bl ov44_02233914
	cmp r0, #0
	bne _0223491C
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223491C:
	mov r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r5, #0x30]
	ldr r1, _02234940 ; =ov44_0223645C
	mov r2, #0x30
	mov r3, #4
	bl CreateYesNoMenu
	mov r1, #0x83
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x15
	strb r0, [r5, #5]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02234940: .word ov44_0223645C
	thumb_func_end ov44_02234904

	thumb_func_start ov44_02234944
ov44_02234944: ; 0x02234944
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x83
	lsl r0, r0, #2
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r1, r2, #0
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02234996
	cmp r0, #0
	bne _02234968
	mov r0, #0x16
	strb r0, [r5, #5]
	b _0223498E
_02234968:
	add r0, r5, #0
	bl ov44_02233E6C
	cmp r0, #0
	beq _0223498A
	add r0, r5, #0
	bl ov44_02233F64
	ldrb r1, [r4, #2]
	cmp r1, r0
	bgt _02234984
	mov r0, #8
	strb r0, [r5, #5]
	b _0223498E
_02234984:
	mov r0, #1
	strb r0, [r5, #5]
	b _0223498E
_0223498A:
	mov r0, #1
	strb r0, [r5, #5]
_0223498E:
	mov r0, #0x83
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_02234996:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_02234944

	thumb_func_start ov44_0223499C
ov44_0223499C: ; 0x0223499C
	push {r4, lr}
	add r4, r0, #0
	add r3, r2, #0
	add r0, #0x30
	mov r2, #0x79
	bl ov44_02233860
	mov r0, #0x17
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_0223499C

	thumb_func_start ov44_022349B4
ov44_022349B4: ; 0x022349B4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x30
	add r4, r2, #0
	bl ov44_02233914
	cmp r0, #0
	bne _022349CC
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_022349CC:
	mov r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	ldr r0, [r5, #0x30]
	ldr r1, _022349F0 ; =ov44_0223645C
	mov r2, #0x30
	mov r3, #4
	bl CreateYesNoMenu
	mov r1, #0x83
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x18
	strb r0, [r5, #5]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_022349F0: .word ov44_0223645C
	thumb_func_end ov44_022349B4

	thumb_func_start ov44_022349F4
ov44_022349F4: ; 0x022349F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x83
	lsl r0, r0, #2
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r1, r2, #0
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02234A46
	cmp r0, #0
	bne _02234A18
	mov r0, #0x19
	strb r0, [r5, #5]
	b _02234A3E
_02234A18:
	add r0, r5, #0
	bl ov44_02233E6C
	cmp r0, #0
	beq _02234A3A
	add r0, r5, #0
	bl ov44_02233F64
	ldrb r1, [r4, #2]
	cmp r1, r0
	bgt _02234A34
	mov r0, #8
	strb r0, [r5, #5]
	b _02234A3E
_02234A34:
	mov r0, #1
	strb r0, [r5, #5]
	b _02234A3E
_02234A3A:
	mov r0, #1
	strb r0, [r5, #5]
_02234A3E:
	mov r0, #0x83
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_02234A46:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_022349F4

	thumb_func_start ov44_02234A4C
ov44_02234A4C: ; 0x02234A4C
	push {r4, lr}
	add r4, r0, #0
	add r3, r2, #0
	add r0, #0x30
	mov r2, #0x7a
	bl ov44_02233860
	mov r0, #0x1e
	str r0, [r4, #8]
	mov r0, #0x1a
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02234A4C

	thumb_func_start ov44_02234A68
ov44_02234A68: ; 0x02234A68
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02234A7A
	mov r0, #0
	pop {r4, pc}
_02234A7A:
	ldr r0, [r4, #8]
	sub r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0
	ble _02234A88
	mov r0, #0
	pop {r4, pc}
_02234A88:
	mov r0, #0
	strb r0, [r4, #7]
	bl sub_02039358
	add r0, r4, #0
	bl ov44_02233FE8
	bl sub_02039B58
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02234A68

	thumb_func_start ov44_02234AA8
ov44_02234AA8: ; 0x02234AA8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r6, r1, #0
	add r4, r2, #0
	cmp r0, #0
	beq _02234AC8
	add r1, r4, #0
	bl Clear2dMenuWindowAndDelete
	mov r0, #0x83
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_02234AC8:
	add r0, r5, #0
	add r0, #0x30
	bl ov44_02233A34
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov44_022342E0
	mov r0, #0x1c
	strb r0, [r5, #5]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_02234AA8

	thumb_func_start ov44_02234AE4
ov44_02234AE4: ; 0x02234AE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r3, r2, #0
	add r0, #0x30
	mov r2, #0x76
	add r4, r1, #0
	bl ov44_02233860
	mov r0, #0x1d
	strb r0, [r5, #5]
	add r0, r5, #0
	bl ov44_02233FE8
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_02233EB4
	bl sub_020390C4
	sub r0, r0, #4
	cmp r0, #1
	bhi _02234B14
	bl ov00_021EDB1C
_02234B14:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02234AE4

	thumb_func_start ov44_02234B18
ov44_02234B18: ; 0x02234B18
	push {r4, lr}
	add r4, r0, #0
	bl sub_020390C4
	sub r0, r0, #4
	cmp r0, #1
	bhi _02234B2A
	bl ov00_021EDB1C
_02234B2A:
	add r0, r4, #0
	add r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02234B3A
	mov r0, #0
	pop {r4, pc}
_02234B3A:
	bl sub_02039358
	bl sub_02039B58
	add r0, r4, #0
	bl ov44_02233FE8
	mov r0, #0
	mov r1, #1
	strb r0, [r4, #7]
	bl sub_020398D4
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02234B18

	thumb_func_start ov44_02234B58
ov44_02234B58: ; 0x02234B58
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	add r3, r2, #0
	add r0, #0x21
	ldrb r0, [r0]
	cmp r0, #1
	bne _02234B6C
	mov r2, #0x7d
	b _02234B6E
_02234B6C:
	mov r2, #0x7c
_02234B6E:
	add r0, r4, #0
	add r0, #0x30
	bl ov44_02233860
	mov r0, #0x1f
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02234B58

	thumb_func_start ov44_02234B80
ov44_02234B80: ; 0x02234B80
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x30
	add r5, r2, #0
	bl ov44_02233914
	cmp r0, #0
	bne _02234B94
	mov r0, #0
	pop {r3, r4, r5, pc}
_02234B94:
	str r5, [sp]
	ldr r0, [r4, #0x30]
	ldr r1, _02234BB0 ; =ov44_0223645C
	mov r2, #0x30
	mov r3, #4
	bl Std_CreateYesNoMenu
	mov r1, #0x83
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x20
	strb r0, [r4, #5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02234BB0: .word ov44_0223645C
	thumb_func_end ov44_02234B80

	thumb_func_start ov44_02234BB4
ov44_02234BB4: ; 0x02234BB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x83
	lsl r0, r0, #2
	add r4, r2, #0
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02234BEC
	cmp r0, #0
	bne _02234BE0
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_02233D38
	add r0, r5, #0
	bl ov44_022340B4
_02234BE0:
	mov r0, #1
	strb r0, [r5, #5]
	mov r0, #0x83
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_02234BEC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_02234BB4

	thumb_func_start ov44_02234BF0
ov44_02234BF0: ; 0x02234BF0
	push {r4, lr}
	add r4, r0, #0
	bl sub_02034434
	mov r0, #0
	mov r1, #1
	bl sub_020398D4
	add r0, r4, #0
	bl ov44_02234440
	mov r0, #1
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02234BF0

	thumb_func_start ov44_02234C10
ov44_02234C10: ; 0x02234C10
	push {r4, lr}
	add r1, r2, #0
	add r4, r0, #0
	bl ov44_02233F6C
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	bne _02234C30
	add r0, r4, #0
	bl ov44_02234450
	mov r0, #0xf
	strb r0, [r4, #5]
	b _02234C44
_02234C30:
	mov r0, #0
	bl sub_02034750
	cmp r0, #0
	beq _02234C44
	add r0, r4, #0
	bl ov44_02234450
	mov r0, #2
	strb r0, [r4, #5]
_02234C44:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov44_02234C10

	thumb_func_start ov44_02234C48
ov44_02234C48: ; 0x02234C48
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r2, #0
	add r4, r1, #0
	add r5, r0, #0
	add r1, r6, #0
	bl ov44_02233F6C
	add r0, r5, #0
	mov r2, #0
	add r0, #0x30
	add r1, r4, #0
	add r3, r2, #0
	str r6, [sp]
	bl ov44_02233C88
	add r0, r5, #0
	add r0, #0x30
	add r1, r4, #0
	mov r2, #0x72
	add r3, r6, #0
	bl ov44_02233860
	add r0, r5, #0
	bl ov44_022342B8
	mov r0, #3
	strb r0, [r5, #5]
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_02234C48

	thumb_func_start ov44_02234C88
ov44_02234C88: ; 0x02234C88
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r4, r1, #0
	add r5, r0, #0
	add r1, r6, #0
	bl ov44_02233F6C
	add r0, r5, #0
	add r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02234CA6
	mov r0, #0
	pop {r4, r5, r6, pc}
_02234CA6:
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _02234CE2
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov44_022342E0
	ldrb r0, [r5, #0x13]
	cmp r0, #1
	beq _02234CC6
	cmp r0, #2
	beq _02234CCC
	cmp r0, #3
	beq _02234CD8
	b _02234CE2
_02234CC6:
	mov r0, #4
	strb r0, [r5, #5]
	b _02234CE2
_02234CCC:
	mov r0, #6
	strb r0, [r5, #5]
	mov r0, #0x74
	add r5, #0x2d
	strb r0, [r5]
	b _02234CE2
_02234CD8:
	mov r0, #6
	strb r0, [r5, #5]
	mov r0, #0x84
	add r5, #0x2d
	strb r0, [r5]
_02234CE2:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_02234C88

	thumb_func_start ov44_02234CE8
ov44_02234CE8: ; 0x02234CE8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r2, #0
	mov r2, #0
	add r5, r0, #0
	add r0, #0x30
	add r3, r2, #0
	add r6, r1, #0
	str r4, [sp]
	bl ov44_02233C88
	add r0, r5, #0
	add r0, #0x30
	add r1, r6, #0
	mov r2, #0x73
	mov r3, #0x1e
	str r4, [sp]
	bl ov44_0223386C
	mov r0, #5
	strb r0, [r5, #5]
	bl sub_0203769C
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0x67
	bl ov44_022340BC
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_02234CE8

	thumb_func_start ov44_02234D28
ov44_02234D28: ; 0x02234D28
	push {r4, lr}
	add r4, r0, #0
	add r1, r2, #0
	bl ov44_02233F6C
	add r0, r4, #0
	add r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02234D42
	mov r0, #0
	pop {r4, pc}
_02234D42:
	mov r0, #8
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02234D28

	thumb_func_start ov44_02234D4C
ov44_02234D4C: ; 0x02234D4C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r2, #0
	mov r2, #0
	add r5, r0, #0
	add r0, #0x30
	add r3, r2, #0
	add r4, r1, #0
	str r6, [sp]
	bl ov44_02233C88
	add r2, r5, #0
	add r2, #0x2d
	add r0, r5, #0
	ldrb r2, [r2]
	add r0, #0x30
	add r1, r4, #0
	add r3, r6, #0
	bl ov44_02233860
	mov r0, #7
	strb r0, [r5, #5]
	bl sub_02039358
	bl sub_02039B58
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_02234D4C

	thumb_func_start ov44_02234D88
ov44_02234D88: ; 0x02234D88
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02234D9A
	mov r0, #0
	pop {r4, pc}
_02234D9A:
	mov r0, #0
	mov r1, #1
	strb r0, [r4, #7]
	bl sub_020398D4
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov44_02234D88

	thumb_func_start ov44_02234DA8
ov44_02234DA8: ; 0x02234DA8
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r4, r1, #0
	add r5, r0, #0
	add r1, r6, #0
	bl ov44_02233F6C
	add r0, r5, #0
	add r0, #0x30
	add r1, r4, #0
	mov r2, #0x7b
	add r3, r6, #0
	bl ov44_02233860
	add r0, r5, #0
	bl ov44_022342B8
	mov r0, #9
	strb r0, [r5, #5]
	ldr r0, [r5]
	add r0, #0x21
	ldrb r0, [r0]
	cmp r0, #1
	bne _02234DDE
	add r0, r5, #0
	bl ov44_02233F3C
_02234DDE:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_02234DA8

	thumb_func_start ov44_02234DE4
ov44_02234DE4: ; 0x02234DE4
	push {r4, lr}
	add r4, r0, #0
	add r1, r2, #0
	bl ov44_02233F6C
	add r0, r4, #0
	add r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02234DFE
	mov r0, #0
	pop {r4, pc}
_02234DFE:
	mov r0, #0xa
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02234DE4

	thumb_func_start ov44_02234E08
ov44_02234E08: ; 0x02234E08
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r4, r1, #0
	add r5, r0, #0
	add r1, r6, #0
	bl ov44_02233F6C
	ldrb r0, [r5, #0x12]
	cmp r0, #0
	beq _02234E3C
	mov r0, #0
	strb r0, [r5, #0x12]
	ldr r0, [r5]
	add r0, #0x21
	ldrb r0, [r0]
	cmp r0, #1
	bne _02234E36
	add r0, r5, #0
	bl ov44_02233F20
	add r0, r5, #0
	bl ov44_02233F3C
_02234E36:
	add r0, r5, #0
	bl ov44_022340B4
_02234E3C:
	add r0, r5, #0
	bl ov44_0223442C
	cmp r0, #1
	bne _02234E80
	bl sub_02037BEC
	mov r0, #0xe
	bl sub_02037AC0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov44_022342E0
	add r0, r5, #0
	add r0, #0x30
	add r1, r4, #0
	mov r2, #0x66
	add r3, r6, #0
	bl ov44_02233860
	add r0, r5, #0
	bl ov44_02234440
	mov r0, #0x4b
	lsl r0, r0, #2
	str r0, [r5, #8]
	add r0, r5, #0
	bl ov44_022342B8
	mov r0, #0xb
	strb r0, [r5, #5]
	b _02234E9A
_02234E80:
	ldr r0, _02234EA0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	lsl r0, r0, #0xa
	tst r0, r1
	beq _02234E9A
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov44_022342E0
	mov r0, #0x12
	strb r0, [r5, #5]
_02234E9A:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02234EA0: .word gSystem
	thumb_func_end ov44_02234E08

	thumb_func_start ov44_02234EA4
ov44_02234EA4: ; 0x02234EA4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0xe
	bl sub_02037B38
	cmp r0, #0
	beq _02234EEE
	ldr r0, [r4]
	ldrb r1, [r0, #0x1b]
	add r0, sp, #0
	strh r1, [r0]
	add r0, r4, #0
	bl ov44_02233F64
	add r5, r0, #0
	bl sub_02037454
	cmp r5, r0
	beq _02234EDC
	ldr r0, [r4, #8]
	sub r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #0
	bgt _02234ED8
	mov r0, #0xf
	strb r0, [r4, #5]
_02234ED8:
	mov r0, #0
	pop {r3, r4, r5, pc}
_02234EDC:
	bl sub_0203769C
	add r1, sp, #0
	bl sub_02037C0C
	cmp r0, #1
	bne _02234EEE
	mov r0, #0xc
	strb r0, [r4, #5]
_02234EEE:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_02234EA4

	thumb_func_start ov44_02234EF4
ov44_02234EF4: ; 0x02234EF4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl ov44_02233F64
	add r7, r0, #0
	bl sub_0203769C
	mov r5, #0
	add r4, r5, #0
	str r0, [sp]
	cmp r7, #0
	ble _02234F38
_02234F0C:
	ldr r0, [sp]
	cmp r0, r4
	beq _02234F30
	add r0, r4, #0
	bl sub_02037C44
	cmp r0, #0
	beq _02234F32
	ldrh r1, [r0]
	ldr r0, [r6]
	ldrb r0, [r0, #0x1b]
	cmp r1, r0
	bne _02234F2A
	add r5, r5, #1
	b _02234F32
_02234F2A:
	mov r0, #0xf
	strb r0, [r6, #5]
	b _02234F32
_02234F30:
	add r5, r5, #1
_02234F32:
	add r4, r4, #1
	cmp r4, r7
	blt _02234F0C
_02234F38:
	cmp r5, r7
	bne _02234F40
	mov r0, #0xd
	strb r0, [r6, #5]
_02234F40:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov44_02234EF4

	thumb_func_start ov44_02234F44
ov44_02234F44: ; 0x02234F44
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	add r1, r0, #0
	bl sub_020398D4
	mov r0, #0x12
	bl sub_02037AC0
	mov r0, #0xe
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02234F44

	thumb_func_start ov44_02234F60
ov44_02234F60: ; 0x02234F60
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x12
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02037B38
	cmp r0, #0
	beq _02234F82
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov44_022342E0
	mov r0, #1
	strb r0, [r5, #7]
	pop {r4, r5, r6, pc}
_02234F82:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_02234F60

	thumb_func_start ov44_02234F88
ov44_02234F88: ; 0x02234F88
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r6, r1, #0
	add r4, r2, #0
	cmp r0, #0
	beq _02234FA8
	add r1, r4, #0
	bl Clear2dMenuWindowAndDelete
	mov r0, #0x83
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_02234FA8:
	add r0, r5, #0
	add r0, #0x30
	bl ov44_02233A34
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov44_022342E0
	mov r0, #0x10
	strb r0, [r5, #5]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_02234F88

	thumb_func_start ov44_02234FC4
ov44_02234FC4: ; 0x02234FC4
	push {r4, lr}
	add r4, r0, #0
	add r3, r2, #0
	add r0, #0x30
	mov r2, #0x76
	bl ov44_02233860
	mov r0, #0x11
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02234FC4

	thumb_func_start ov44_02234FDC
ov44_02234FDC: ; 0x02234FDC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02234FEE
	mov r0, #0
	pop {r4, pc}
_02234FEE:
	bl sub_02039358
	bl sub_02039B58
	mov r0, #0
	mov r1, #1
	strb r0, [r4, #7]
	bl sub_020398D4
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov44_02234FDC

	thumb_func_start ov44_02235004
ov44_02235004: ; 0x02235004
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r4, r1, #0
	add r5, r0, #0
	add r1, r6, #0
	bl ov44_02233F6C
	ldr r0, [r5]
	add r0, #0x21
	ldrb r0, [r0]
	cmp r0, #1
	bne _02235020
	mov r2, #0x7d
	b _02235022
_02235020:
	mov r2, #0x7c
_02235022:
	add r0, r5, #0
	add r0, #0x30
	add r1, r4, #0
	add r3, r6, #0
	bl ov44_02233860
	mov r0, #0x13
	strb r0, [r5, #5]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_02235004

	thumb_func_start ov44_02235038
ov44_02235038: ; 0x02235038
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r0, #0
	add r1, r5, #0
	bl ov44_02233F6C
	add r0, r4, #0
	bl ov44_0223442C
	cmp r0, #1
	bne _0223505E
	mov r0, #0xa
	strb r0, [r4, #5]
	add r4, #0x30
	add r0, r4, #0
	bl ov44_02233954
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223505E:
	add r0, r4, #0
	add r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _0223506E
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223506E:
	str r5, [sp]
	ldr r0, [r4, #0x30]
	ldr r1, _0223508C ; =ov44_0223645C
	mov r2, #0x30
	mov r3, #4
	bl Std_CreateYesNoMenu
	mov r1, #0x83
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x14
	strb r0, [r4, #5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0223508C: .word ov44_0223645C
	thumb_func_end ov44_02235038

	thumb_func_start ov44_02235090
ov44_02235090: ; 0x02235090
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r1, r4, #0
	bl ov44_02233F6C
	add r0, r5, #0
	bl ov44_0223442C
	cmp r0, #1
	bne _022350C8
	mov r0, #0xa
	strb r0, [r5, #5]
	add r0, r5, #0
	add r0, #0x30
	bl ov44_02233954
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl Clear2dMenuWindowAndDelete
	mov r1, #0x83
	mov r0, #0
	lsl r1, r1, #2
	str r0, [r5, r1]
	pop {r3, r4, r5, pc}
_022350C8:
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _022350FA
	cmp r0, #0
	bne _022350EE
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_02233D38
	add r0, r5, #0
	bl ov44_022340B4
_022350EE:
	mov r0, #8
	strb r0, [r5, #5]
	mov r0, #0x83
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
_022350FA:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov44_02235090

	thumb_func_start ov44_02235100
ov44_02235100: ; 0x02235100
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl sub_02034870
	add r1, r5, #0
	add r1, #0x26
	strb r0, [r1]
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _02235124
	bl GF_AssertFail
_02235124:
	add r0, r5, #0
	mov r2, #0
	add r0, #0x30
	add r1, r6, #0
	add r3, r2, #0
	str r4, [sp]
	bl ov44_02233C88
	bl sub_02039358
	add r0, r5, #0
	mov r1, #0
	add r0, #0x27
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x30
	add r1, r6, #0
	mov r2, #0x84
	add r3, r4, #0
	bl ov44_02233860
	mov r0, #0x16
	strb r0, [r5, #5]
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov44_02235100

	thumb_func_start ov44_02235158
ov44_02235158: ; 0x02235158
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x30
	add r5, r2, #0
	bl ov44_02233914
	cmp r0, #0
	bne _0223516C
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223516C:
	str r5, [sp]
	ldr r0, [r4, #0x30]
	ldr r1, _02235188 ; =ov44_0223645C
	mov r2, #0x30
	mov r3, #4
	bl Std_CreateYesNoMenu
	mov r1, #0x83
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x17
	strb r0, [r4, #5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02235188: .word ov44_0223645C
	thumb_func_end ov44_02235158

	thumb_func_start ov44_0223518C
ov44_0223518C: ; 0x0223518C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x83
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r2, #0
	bl Handle2dMenuInput_DeleteOnFinish
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _022351B8
	cmp r0, #0
	bne _022351AC
	mov r0, #0x18
	b _022351AE
_022351AC:
	mov r0, #0x1d
_022351AE:
	strb r0, [r4, #5]
	mov r0, #0x83
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_022351B8:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov44_0223518C

	thumb_func_start ov44_022351BC
ov44_022351BC: ; 0x022351BC
	push {r4, lr}
	add r4, r0, #0
	add r3, r2, #0
	add r0, #0x30
	mov r2, #0x11
	bl ov44_02233860
	add r0, r4, #0
	bl ov44_022342B8
	mov r0, #0x5a
	str r0, [r4, #8]
	mov r0, #0x19
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov44_022351BC

	thumb_func_start ov44_022351DC
ov44_022351DC: ; 0x022351DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	add r4, r1, #0
	cmp r0, #0
	ble _022351F0
	sub r0, r0, #1
	str r0, [r5, #8]
	mov r0, #0
	pop {r3, r4, r5, pc}
_022351F0:
	add r0, r5, #0
	add r0, #0x30
	bl ov44_02233914
	cmp r0, #0
	bne _02235200
	mov r0, #0
	pop {r3, r4, r5, pc}
_02235200:
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	ldrb r1, [r4]
	bl ov44_02233E80
	cmp r0, #0
	beq _02235214
	mov r0, #0x1a
	strb r0, [r5, #5]
_02235214:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov44_022351DC

	thumb_func_start ov44_02235218
ov44_02235218: ; 0x02235218
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl ov44_02233E48
	bl sub_020390C4
	cmp r0, #1
	bne _02235262
	mov r0, #0
	bl sub_020373B4
	cmp r0, #1
	bne _02235262
	mov r0, #0
	bl sub_020378E4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov44_022342E0
	mov r1, #0
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #3
	add r2, r1, #0
	add r3, r1, #0
	str r4, [sp, #8]
	bl BeginNormalPaletteFade
	mov r0, #0x1b
	strb r0, [r5, #5]
_02235262:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov44_02235218

	thumb_func_start ov44_02235268
ov44_02235268: ; 0x02235268
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02235324
	ldr r0, [r6, #8]
	mov r1, #0
	bl sub_02034354
	add r0, r5, #0
	mov r1, #1
	add r0, #0x27
	strb r1, [r0]
	add r0, r5, #0
	bl ov44_02234204
	add r0, r5, #0
	add r1, r4, #0
	bl ov44_02233214
	add r0, r5, #0
	mov r2, #0x7e
	add r0, #0x30
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	add r0, r5, #0
	bl ov44_02234028
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov44_022331C4
	bl sub_0203A880
	mov r1, #0
	strb r1, [r5, #0x12]
	strb r1, [r5, #0x13]
	add r0, r5, #0
	add r0, #0x14
	strb r1, [r5, #0x14]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	add r0, r5, #0
	add r0, #0x18
	strb r1, [r5, #0x18]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	add r0, r5, #0
	add r0, #0x1c
	mov r1, #1
	mov r2, #4
	bl MI_CpuFill8
	add r0, r5, #0
	add r0, #0x20
	mov r1, #1
	mov r2, #4
	bl MI_CpuFill8
	add r0, r5, #0
	add r1, r5, #0
	mov r3, #0
	add r0, #0x24
	strb r3, [r0]
	add r0, r5, #0
	add r0, #0x26
	strb r3, [r0]
	add r0, r5, #0
	add r0, #0x28
	strb r3, [r0]
	add r1, #0x28
	strb r3, [r1, #1]
	strb r3, [r1, #2]
	strb r3, [r1, #3]
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #3
	add r2, r1, #0
	str r4, [sp, #8]
	bl BeginNormalPaletteFade
	mov r0, #0x1c
	strb r0, [r5, #5]
_02235324:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov44_02235268

	thumb_func_start ov44_0223532C
ov44_0223532C: ; 0x0223532C
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223533C
	mov r0, #0
	strb r0, [r4, #5]
_0223533C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov44_0223532C

	thumb_func_start ov44_02235340
ov44_02235340: ; 0x02235340
	push {r4, lr}
	add r4, r0, #0
	bl sub_02039358
	bl sub_02039B58
	mov r0, #0
	mov r1, #1
	strb r0, [r4, #7]
	bl sub_020398D4
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov44_02235340

	.rodata

_0223535C:
	.byte 0x01, 0x03, 0x05, 0x00

ov44_02235360: ; 0x02235360
	.byte 0x00, 0x02, 0x04, 0x00

ov44_02235364: ; 0x02235364
	.byte 0x08, 0x07, 0x05, 0x07

ov44_02235368: ; 0x02235368
	.byte 0x00, 0x01, 0x02, 0x01

ov44_0223536C: ; 0x0223536C
	.byte 0xF8, 0xF7, 0xF6, 0xF6
	.byte 0xF7, 0x00, 0x00, 0x00

ov44_02235374: ; 0x02235374
	.byte 0x02, 0x19, 0x0A, 0x06, 0x08, 0x0E, 0x51, 0x00

ov44_0223537C: ; 0x0223537C
	.byte 0x02, 0x19, 0x0A, 0x06
	.byte 0x08, 0x0E, 0x51, 0x00

ov44_02235384: ; 0x02235384
	.byte 0x01, 0x19, 0x10, 0x06, 0x08, 0x0E, 0x89, 0x01

ov44_0223538C: ; 0x0223538C
	.byte 0x02, 0x19, 0x0D, 0x06
	.byte 0x04, 0x0D, 0x51, 0x00

ov44_02235394: ; 0x02235394
	.byte 0xA0, 0xC0, 0x08, 0x40, 0xA0, 0xC0, 0x50, 0xB0, 0xA0, 0xC0, 0xC0, 0xF8

ov44_022353A0: ; 0x022353A0
	.byte 0x27, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF

ov44_022353B0: ; 0x022353B0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_022353C0: ; 0x022353C0
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x40, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00

ov44_022353D0: ; 0x022353D0
	.byte 0x64, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00, 0x6C, 0x00, 0x00, 0x00
	.byte 0x6A, 0x00, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00

ov44_022353E8: ; 0x022353E8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov44_02235404: ; 0x02235404
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1A, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_02235420: ; 0x02235420
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x06, 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_0223543C: ; 0x0223543C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_02235458: ; 0x02235458
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov44_02235474: ; 0x02235474
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_02235490: ; 0x02235490
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1B, 0x02, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_022354AC: ; 0x022354AC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x06
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_022354C8: ; 0x022354C8
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov44_0222C288
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x08, 0x00, 0x10
	.byte 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_022354E8: ; 0x022354E8
	.byte 0x00, 0x2F, 0x00, 0x77, 0x30, 0x5F, 0x00, 0x77
	.byte 0x60, 0x8F, 0x00, 0x77, 0x90, 0xBF, 0x00, 0x77, 0x00, 0x2F, 0x80, 0xFF, 0x30, 0x5F, 0x80, 0xFF
	.byte 0x60, 0x8F, 0x80, 0xFF, 0x90, 0xBF, 0x80, 0xFF

ov44_02235508: ; 0x02235508
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov44_0222C288
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x08, 0x00, 0x10
	.byte 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_02235528: ; 0x02235528
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov44_0222C288
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x08, 0x00, 0x10
	.byte 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_02235548: ; 0x02235548
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_02235570: ; 0x02235570
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x02, 0x00, 0x00, 0xC0, 0x1A, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0xC0, 0x1A, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0xC0, 0x1A, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_02235600: ; 0x02235600
	.byte 0x03, 0x00, 0x02, 0x00

ov44_02235604: ; 0x02235604
	.byte 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x03, 0x00, 0x58, 0x21, 0x00

ov44_0223560F: ; 0x0223560F
	.byte 0x00

ov44_02235610: ; 0x02235610
	.byte 0x00

ov44_02235611: ; 0x02235611
	.byte 0x00

ov44_02235612: ; 0x02235612
	.byte 0x01, 0x01, 0x02, 0x01, 0x00, 0x01, 0x04, 0x01, 0x01, 0x01, 0x02, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x01, 0x02, 0x01, 0x01, 0x01, 0x04, 0x01, 0x00, 0x01, 0x03, 0x01, 0x01, 0x00

ov44_02235630: ; 0x02235630
	.byte 0x10, 0x00, 0x0B, 0x00, 0x10, 0x00, 0x0B, 0x00, 0x16, 0x00, 0x0B, 0x00, 0x1C, 0x00, 0x0B, 0x00

ov44_02235640:
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov44_02235900:
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov44_02235BC0:
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov44_02235F88:
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov44_02236458: ; 0x02236458
	.byte 0x08, 0x00, 0x04, 0x0C

ov44_0223645C: ; 0x0223645C
	.byte 0x02, 0x19, 0x0D, 0x05
	.byte 0x04, 0x01, 0x39, 0x00

ov44_02236464: ; 0x02236464
	.word ov44_02234324
	.word ov44_02234328
	.word ov44_0223435C
	.word ov44_02234388

ov44_02236474: ; 0x02236474
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov44_02236484: ; 0x02236484
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov44_02236494: ; 0x02236494
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1A, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_022364B0: ; 0x022364B0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_022364CC: ; 0x022364CC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x02
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_022364E8: ; 0x022364E8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_02236510: ; 0x02236510
	.byte 0xD0, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xE8, 0x00, 0x48, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x60, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xB8, 0x00, 0x48, 0x00, 0x03, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov44_02236540: ; 0x02236540
	.word ov44_02234BF0
	.word ov44_02234C10
	.word ov44_02234C48
	.word ov44_02234C88
	.word ov44_02234CE8
	.word ov44_02234D28
	.word ov44_02234D4C
	.word ov44_02234D88
	.word ov44_02234DA8
	.word ov44_02234DE4
	.word ov44_02234E08
	.word ov44_02234EA4
	.word ov44_02234EF4
	.word ov44_02234F44
	.word ov44_02234F60
	.word ov44_02234F88
	.word ov44_02234FC4
	.word ov44_02234FDC
	.word ov44_02235004
	.word ov44_02235038
	.word ov44_02235090
	.word ov44_02235100
	.word ov44_02235158
	.word ov44_0223518C
	.word ov44_022351BC
	.word ov44_022351DC
	.word ov44_02235218
	.word ov44_02235268
	.word ov44_0223532C
	.word ov44_02235340

ov44_022365B8: ; 0x022365B8
	.word ov44_02234474
	.word ov44_022344AC
	.word ov44_022344C4
	.word ov44_022345A0
	.word ov44_022345C8
	.word ov44_022345FC
	.word ov44_0223469C
	.word ov44_022346B4
	.word ov44_022346D0
	.word ov44_022346E8
	.word ov44_0223471C
	.word ov44_02234764
	.word ov44_0223479C
	.word ov44_022347D4
	.word ov44_022347FC
	.word ov44_02234828
	.word ov44_02234858
	.word ov44_022348A8
	.word ov44_022348C4
	.word ov44_022348EC
	.word ov44_02234904
	.word ov44_02234944
	.word ov44_0223499C
	.word ov44_022349B4
	.word ov44_022349F4
	.word ov44_02234A4C
	.word ov44_02234A68
	.word ov44_02234AA8
	.word ov44_02234AE4
	.word ov44_02234B18
	.word ov44_02234B58
	.word ov44_02234B80
	.word ov44_02234BB4

ov44_0223663C: ; 0x0223663C
	.byte 0x05, 0x04, 0x03, 0x02
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x05, 0x05, 0x05, 0x00, 0x00

	.data

_02236660:
	.byte 0x1E, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00
	.byte 0x29, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF, 0x20, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00

ov44_02236680: ; 0x02236680
	.word ov44_02230300
	.word ov44_02230E5C
	.word ov44_022307E0
	.word ov44_022308B0
	.word ov44_02230B2C
	.word ov44_02230C68
	.word ov44_02230D8C

ov44_0223669C: ; 0x0223669C
	.byte 0x47, 0x00, 0x00, 0x00
	.byte 0x17, 0x00, 0x00, 0x00, 0x47, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x47, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF

ov44_022366BC: ; 0x022366BC
	.byte 0x5F, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF

ov44_022366DC: ; 0x022366DC
	.byte 0x62, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF

ov44_022366FC: ; 0x022366FC
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov44_0222C288
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x03, 0x00
	.byte 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_0223671C: ; 0x0223671C
	.byte 0x5D, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov44_0223676C: ; 0x0223676C
	.word ov44_0222B228
	.word ov44_0222B36C
	.word ov44_0222B3A8
	.word ov44_0222B42C
	.word ov44_0222B494
	.word ov44_0222B528
	.word ov44_0222B64C
	.word ov44_0222BA6C
	.word ov44_0222BAB8
	.word ov44_0222BAC4
	.word ov44_0222BAD0
	.word ov44_0222BB38
	.word ov44_0222BBA4
	.word ov44_0222BC78
	.word ov44_0222B744
	.word ov44_0222BE3C
	.word ov44_0222C060
	.word ov44_0222C084
	.word ov44_0222C35C
	.word ov44_0222C684
	.word ov44_0222C9AC
	.word ov44_0222C9F4
	.word ov44_0222CB34
	.word ov44_0222CB7C
	.word ov44_0222CC34
	.word ov44_0222CDAC
	.word ov44_0222CE40
	.word ov44_0222CFE0
	.word ov44_0222D0A4
	.word ov44_0222D10C
	.word ov44_0222D1BC
	.word ov44_0222D1C0
	.word ov44_0222D1C4
	.word ov44_0222EB90
	.word ov44_0222F4E0
	.word ov44_0222D1C8
	.word ov44_0222D3DC
	.word ov44_0222D594
	.word ov44_0222DA64
	.word ov44_0222D214
	.word ov44_0222D23C
	.word ov44_0222D2B0
	.word ov44_0222DC18
	.word ov44_0222DD64
	.word ov44_0222E090
	.word ov44_0222E45C
	.word ov44_0222E62C
	.word ov44_0222E630
	.word ov44_0222E634
	.word ov44_0222E860
	.word ov44_0222E908
	.word ov44_0222E948
	.word ov44_0222E9C4
	.word ov44_0222EA2C
	.word ov44_0222EBB8
	.word ov44_0222EBC4
	.word ov44_0222EC14
	.word ov44_0222EC2C
	.word ov44_0222EC98
	.word ov44_0222EDB8
	.word ov44_0222EE10
	.word ov44_0222EE54
	.word ov44_0222EED4
	.word ov44_0222F0AC
	.word ov44_0222F194
	.word ov44_0222BFF0
	.word ov44_0222E5D8
	.word ov44_0222E5DC
	.word ov44_0222D824
	.word ov44_0222BEE0
	.word ov44_0222E5E0
	.word ov44_0222BF6C

ov44_0223688C: ; 0x0223688C
	.word ov44_02235640
	.word ov44_02235900
	.word ov44_02235BC0
	.word ov44_02235F88

ov44_0223689C: ; 0x0223689C
	.byte 0x7E, 0x7F, 0x7F, 0x7F

	.bss

_022368A0:
	.space 0x20
