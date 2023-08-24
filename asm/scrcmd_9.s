	.include "asm/macros.inc"
	.include "scrcmd_9.inc"
	.include "global.inc"

	.rodata

_020FBF70:
	.short 0x008D
	.short 0x0091
	.short 0x008E
	.short 0x008F
	.short 0x0090
	.short 0x0000
_020FBF7C:
	.byte 0x00, 0x08, 0x09, 0x0B
	.byte 0x0C, 0x0E, 0x0F, 0x12
_020FBF84:
	.byte 0x00, 0x03, 0x03, 0x04, 0x04, 0x05, 0x05, 0x07
_020FBF8C:
	.byte 0x00, 0x05, 0x04, 0x04
	.byte 0x03, 0x03, 0x02, 0x02, 0x01, 0x01, 0x00, 0x00
_020FBF98:
	.byte 0x00, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09
	.byte 0x0A, 0x0A, 0x0A, 0x00
_020FBFA4:
	.byte 0xD5, 0x00, 0x9D, 0x00, 0xEA, 0x00, 0xD9, 0x00
_020FBFAC:
	.byte 0x00, 0x00
_020FBFAE:
	.byte 0x63, 0x00
	.byte 0x50, 0x00, 0x77, 0x00, 0x64, 0x00, 0x8B, 0x00, 0x78, 0x00, 0x9F, 0x00, 0x8C, 0x00, 0xB3, 0x00
	.byte 0xA0, 0x00, 0xC7, 0x00, 0xB4, 0x00, 0xDB, 0x00, 0xC8, 0x00, 0x2B, 0x01
_020FBFCC:
	.byte 0x64, 0x00
_020FBFCE:
	.byte 0x77, 0x00
	.byte 0x78, 0x00, 0x8B, 0x00, 0x8C, 0x00, 0x9F, 0x00, 0xA0, 0x00, 0xB3, 0x00, 0xB4, 0x00, 0xC7, 0x00
	.byte 0xC8, 0x00, 0xDB, 0x00, 0xDC, 0x00, 0xEF, 0x00, 0xC8, 0x00, 0x2B, 0x01
_020FBFEC:
	.byte 0x5A, 0x00
_020FBFEE:
	.byte 0x8D, 0x00
	.byte 0x5B, 0x00, 0x8E, 0x00, 0x5C, 0x00, 0x8F, 0x00, 0x5D, 0x00, 0x90, 0x00, 0x5E, 0x00, 0x91, 0x00
	.byte 0x02, 0x00, 0x04, 0x00, 0x03, 0x00, 0x06, 0x00, 0x3C, 0x00, 0x03, 0x00, 0x3D, 0x00, 0x08, 0x00
	.byte 0x20, 0x00, 0x3E, 0x00, 0x21, 0x00, 0x3F, 0x00, 0x04, 0x00, 0x34, 0x00, 0x05, 0x00, 0x35, 0x00
	.byte 0x2C, 0x00, 0x01, 0x00, 0x2D, 0x00, 0x02, 0x00, 0x14, 0x00, 0x0F, 0x00, 0x15, 0x00, 0x10, 0x00
	.byte 0x51, 0x00, 0x3B, 0x00, 0x1A, 0x00, 0x3C, 0x00, 0x10, 0x00, 0x09, 0x00, 0x11, 0x00, 0x0C, 0x00
	.byte 0x53, 0x00, 0x17, 0x00, 0x54, 0x00, 0x16, 0x00, 0x47, 0x00, 0x29, 0x00, 0x12, 0x00, 0x2A, 0x00
	.byte 0x0C, 0x00, 0x26, 0x00, 0x0D, 0x00, 0x27, 0x00, 0x0E, 0x00, 0x33, 0x00, 0x0A, 0x00, 0x07, 0x00
	.byte 0x1B, 0x00, 0x11, 0x00, 0x23, 0x00, 0x25, 0x00, 0x31, 0x00, 0x46, 0x00, 0x32, 0x00, 0x46, 0x00
	.byte 0x27, 0x00, 0x0B, 0x00, 0x28, 0x00, 0x0E, 0x00, 0x18, 0x00, 0x0B, 0x00, 0x19, 0x00, 0x0E, 0x00
	.byte 0x35, 0x00, 0x44, 0x00, 0x36, 0x00, 0x45, 0x00, 0x1D, 0x00, 0x0B, 0x00, 0x06, 0x00, 0x05, 0x00
	.byte 0x1C, 0x00, 0x01, 0x00, 0x13, 0x00, 0x2D, 0x00, 0x0B, 0x00, 0x36, 0x00, 0x2E, 0x00, 0x38, 0x00
	.byte 0x09, 0x00, 0x14, 0x00, 0x30, 0x00, 0x32, 0x00, 0x34, 0x00, 0x0A, 0x00, 0x25, 0x00, 0x13, 0x00
	.byte 0x39, 0x00, 0x1F, 0x00, 0x4E, 0x00, 0x1D, 0x00, 0x22, 0x00, 0x24, 0x00, 0x3B, 0x00, 0x28, 0x00
	.byte 0x3A, 0x00, 0x2B, 0x00, 0x26, 0x00, 0x22, 0x00, 0x33, 0x00, 0x3E, 0x00, 0x45, 0x00, 0x0E, 0x00
	.byte 0x50, 0x00, 0x37, 0x00, 0x24, 0x00, 0x0D, 0x00, 0x07, 0x00, 0x0C, 0x00, 0x55, 0x00, 0x23, 0x00
	.byte 0x0F, 0x00, 0x2C, 0x00, 0x16, 0x00, 0x47, 0x00

	.text

	thumb_func_start ScrCmd_410
ScrCmd_410: ; 0x02049CA8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSystem_GetSaveData
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0204A824
	add r5, #0x80
	ldr r1, [r5]
	add r1, #0xa0
	str r0, [r1]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_410

	thumb_func_start ScrCmd_409
ScrCmd_409: ; 0x02049CD8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0xa0
	bl sub_0204A810
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_409

	thumb_func_start ScrCmd_411
ScrCmd_411: ; 0x02049CE8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0xa0
	ldr r0, [r0]
	bl sub_0204AA2C
	add r4, #0x80
	ldr r1, [r4]
	mov r0, #0
	add r1, #0xa0
	str r0, [r1]
	pop {r4, pc}
	thumb_func_end ScrCmd_411

	thumb_func_start ScrCmd_412
ScrCmd_412: ; 0x02049D04
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	bl ScriptReadHalfword
	str r0, [sp]
	add r0, r7, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r7, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r7, #0
	bl ScriptReadHalfword
	str r0, [sp, #4]
	add r0, r7, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r7, #0
	add r0, #0x80
	ldr r1, [r0]
	add r0, r1, #0
	add r0, #0xa0
	ldr r5, [r0]
	ldr r0, [sp]
	cmp r0, #0x3a
	bgt _02049DD2
	cmp r0, #0
	blt _02049DDA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02049D5C: ; jump table
	.short _02049FB6 - _02049D5C - 2 ; case 0
	.short _02049DDC - _02049D5C - 2 ; case 1
	.short _02049DFC - _02049D5C - 2 ; case 2
	.short _02049E02 - _02049D5C - 2 ; case 3
	.short _02049E0E - _02049D5C - 2 ; case 4
	.short _02049E1C - _02049D5C - 2 ; case 5
	.short _02049E24 - _02049D5C - 2 ; case 6
	.short _02049FB6 - _02049D5C - 2 ; case 7
	.short _02049E2C - _02049D5C - 2 ; case 8
	.short _02049E38 - _02049D5C - 2 ; case 9
	.short _02049E46 - _02049D5C - 2 ; case 10
	.short _02049E54 - _02049D5C - 2 ; case 11
	.short _02049E60 - _02049D5C - 2 ; case 12
	.short _02049FB6 - _02049D5C - 2 ; case 13
	.short _02049E6A - _02049D5C - 2 ; case 14
	.short _02049E74 - _02049D5C - 2 ; case 15
	.short _02049E7E - _02049D5C - 2 ; case 16
	.short _02049FB6 - _02049D5C - 2 ; case 17
	.short _02049FB6 - _02049D5C - 2 ; case 18
	.short _02049FB6 - _02049D5C - 2 ; case 19
	.short _02049FB6 - _02049D5C - 2 ; case 20
	.short _02049FB6 - _02049D5C - 2 ; case 21
	.short _02049FB6 - _02049D5C - 2 ; case 22
	.short _02049FB6 - _02049D5C - 2 ; case 23
	.short _02049FB6 - _02049D5C - 2 ; case 24
	.short _02049FB6 - _02049D5C - 2 ; case 25
	.short _02049FB6 - _02049D5C - 2 ; case 26
	.short _02049FB6 - _02049D5C - 2 ; case 27
	.short _02049FB6 - _02049D5C - 2 ; case 28
	.short _02049FB6 - _02049D5C - 2 ; case 29
	.short _02049E90 - _02049D5C - 2 ; case 30
	.short _02049EA8 - _02049D5C - 2 ; case 31
	.short _02049EC2 - _02049D5C - 2 ; case 32
	.short _02049FB6 - _02049D5C - 2 ; case 33
	.short _02049FB6 - _02049D5C - 2 ; case 34
	.short _02049ECE - _02049D5C - 2 ; case 35
	.short _02049FB6 - _02049D5C - 2 ; case 36
	.short _02049ED8 - _02049D5C - 2 ; case 37
	.short _02049EE2 - _02049D5C - 2 ; case 38
	.short _02049EEC - _02049D5C - 2 ; case 39
	.short _02049FB6 - _02049D5C - 2 ; case 40
	.short _02049EFC - _02049D5C - 2 ; case 41
	.short _02049FB6 - _02049D5C - 2 ; case 42
	.short _02049F08 - _02049D5C - 2 ; case 43
	.short _02049FB6 - _02049D5C - 2 ; case 44
	.short _02049F12 - _02049D5C - 2 ; case 45
	.short _02049FB6 - _02049D5C - 2 ; case 46
	.short _02049F1C - _02049D5C - 2 ; case 47
	.short _02049F26 - _02049D5C - 2 ; case 48
	.short _02049F32 - _02049D5C - 2 ; case 49
	.short _02049F3E - _02049D5C - 2 ; case 50
	.short _02049F52 - _02049D5C - 2 ; case 51
	.short _02049F5C - _02049D5C - 2 ; case 52
	.short _02049F66 - _02049D5C - 2 ; case 53
	.short _02049F70 - _02049D5C - 2 ; case 54
	.short _02049F7E - _02049D5C - 2 ; case 55
	.short _02049EF4 - _02049D5C - 2 ; case 56
	.short _02049F8C - _02049D5C - 2 ; case 57
	.short _02049FA8 - _02049D5C - 2 ; case 58
_02049DD2:
	ldr r0, [sp]
	cmp r0, #0x64
	bne _02049DDA
	b _02049F98
_02049DDA:
	b _02049FB6
_02049DDC:
	cmp r6, #0
	bne _02049DEE
	ldrb r0, [r5, #0xe]
	ldr r1, [r1, #0xc]
	mov r2, #1
	bl sub_0204A5B0
	strh r0, [r4]
	b _02049FBE
_02049DEE:
	ldr r1, [r1, #0xc]
	add r0, r6, #0
	mov r2, #1
	bl sub_0204A5B0
	strh r0, [r4]
	b _02049FBE
_02049DFC:
	bl sub_0204A68C
	b _02049FBE
_02049E02:
	ldr r0, [r1, #0xc]
	bl sub_0202D908
	bl sub_0204A698
	b _02049FBE
_02049E0E:
	ldr r0, [r1, #0xc]
	bl sub_0202D908
	bl sub_0204A6A0
	strh r0, [r4]
	b _02049FBE
_02049E1C:
	add r0, r1, #0
	bl sub_0204A6A8
	b _02049FBE
_02049E24:
	add r0, r1, #0
	bl sub_0204A6E8
	b _02049FBE
_02049E2C:
	ldr r0, [r1, #0xc]
	add r1, r6, #0
	bl sub_0204A6F8
	strh r0, [r4]
	b _02049FBE
_02049E38:
	ldr r1, [r1, #0xc]
	mov r0, #0
	mov r2, #2
	bl sub_0204B120
	strh r0, [r4]
	b _02049FBE
_02049E46:
	mov r0, #0
	ldr r1, [r1, #0xc]
	add r2, r0, #0
	bl sub_0204B120
	strh r0, [r4]
	b _02049FBE
_02049E54:
	ldr r0, [r1, #0xc]
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	bl sub_0204A730
	b _02049FBE
_02049E60:
	ldr r0, [r1, #0xc]
	bl sub_0204A750
	strh r0, [r4]
	b _02049FBE
_02049E6A:
	ldr r0, [r1, #0xc]
	bl sub_0204A764
	strh r0, [r4]
	b _02049FBE
_02049E74:
	ldr r0, [r1, #0xc]
	bl sub_0204A800
	strh r0, [r4]
	b _02049FBE
_02049E7E:
	ldrh r3, [r4]
	ldr r0, [r7, #0x74]
	ldr r2, [sp, #4]
	add r1, r6, #0
	bl sub_02067200
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02049E90:
	add r0, r1, #0
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r2, r0, #0
	ldr r1, [r7, #0x74]
	add r0, r5, #0
	bl sub_0204AA58
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02049EA8:
	add r0, r1, #0
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r7, #0x80
	ldr r2, [r7]
	add r1, r0, #0
	ldr r2, [r2, #0xc]
	add r0, r5, #0
	bl sub_0204AA78
	strh r0, [r4]
	b _02049FBE
_02049EC2:
	ldr r1, [r1, #0xc]
	add r0, r5, #0
	bl sub_0204AB10
	strh r0, [r4]
	b _02049FBE
_02049ECE:
	add r0, r5, #0
	bl sub_0204AC7C
	strh r0, [r4]
	b _02049FBE
_02049ED8:
	ldr r1, [r1, #0xc]
	add r0, r5, #0
	bl sub_0204AD04
	b _02049FBE
_02049EE2:
	ldr r1, [r1, #0xc]
	add r0, r5, #0
	bl sub_0204AE20
	b _02049FBE
_02049EEC:
	add r0, r5, #0
	bl sub_0204AF2C
	b _02049FBE
_02049EF4:
	add r0, r5, #0
	bl sub_0204AFE0
	b _02049FBE
_02049EFC:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0204B044
	strh r0, [r4]
	b _02049FBE
_02049F08:
	add r0, r5, #0
	bl sub_0204B05C
	strh r0, [r4]
	b _02049FBE
_02049F12:
	add r0, r5, #0
	bl sub_0204B060
	strh r0, [r4]
	b _02049FBE
_02049F1C:
	ldr r1, [r1, #0xc]
	add r0, r5, #0
	bl sub_0204B0E0
	b _02049FBE
_02049F26:
	ldr r1, [r1, #0xc]
	add r0, r5, #0
	bl sub_0204B1CC
	strh r0, [r4]
	b _02049FBE
_02049F32:
	ldr r1, [r1, #0xc]
	add r0, r5, #0
	bl sub_0204B204
	strh r0, [r4]
	b _02049FBE
_02049F3E:
	ldrb r1, [r5, #0x10]
	mov r0, #0xe0
	bic r1, r0
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x18
	orr r0, r1
	strb r0, [r5, #0x10]
	b _02049FBE
_02049F52:
	ldrb r0, [r5, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1d
	strh r0, [r4]
	b _02049FBE
_02049F5C:
	ldr r1, [r1, #0xc]
	add r0, r5, #0
	bl sub_0204ABC8
	b _02049FBE
_02049F66:
	add r0, r5, r6
	add r0, #0x2a
	ldrb r0, [r0]
	strh r0, [r4]
	b _02049FBE
_02049F70:
	ldr r1, [r1, #0xc]
	add r0, r5, #0
	mov r2, #1
	bl sub_0204B120
	strh r0, [r4]
	b _02049FBE
_02049F7E:
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0204A2A8
	strh r0, [r4]
	b _02049FBE
_02049F8C:
	ldr r1, [r1, #0xc]
	add r0, r5, #0
	bl sub_0204B258
	strh r0, [r4]
	b _02049FBE
_02049F98:
	cmp r5, #0
	bne _02049FA2
	mov r0, #1
	strh r0, [r4]
	b _02049FBE
_02049FA2:
	mov r0, #0
	strh r0, [r4]
	b _02049FBE
_02049FA8:
	ldr r0, _02049FC4 ; =0x00000884
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x46
	bl MI_CpuFill8
	b _02049FBE
_02049FB6:
	bl GF_AssertFail
	mov r0, #0
	strh r0, [r4]
_02049FBE:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02049FC4: .word 0x00000884
	thumb_func_end ScrCmd_412

	thumb_func_start ScrCmd_413
ScrCmd_413: ; 0x02049FC8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	add r1, #0xa0
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	lsl r2, r6, #4
	add r2, r6, r2
	mov r1, #0x38
	lsl r2, r2, #4
	mul r1, r7
	add r2, r4, r2
	add r3, r2, r1
	mov r2, #0xb2
	lsl r2, r2, #2
	ldrh r1, [r3, r2]
	lsl r1, r1, #0x15
	lsr r4, r1, #0x15
	ldr r1, [sp]
	strh r4, [r1]
	add r1, r2, #4
	ldrh r1, [r3, r1]
	strh r1, [r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_413

	thumb_func_start ScrCmd_414
ScrCmd_414: ; 0x0204A048
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_020672D8
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_414

	thumb_func_start ScrCmd_415
ScrCmd_415: ; 0x0204A070
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_02067398
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_415

	thumb_func_start ScrCmd_416
ScrCmd_416: ; 0x0204A098
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #4]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0xa0
	ldr r6, [r0]
	mov r0, #0
	strh r0, [r4]
	cmp r7, #0
	beq _0204A0F4
	cmp r7, #1
	beq _0204A10C
	cmp r7, #2
	beq _0204A120
	b _0204A134
_0204A0F4:
	mov r0, #0x3e
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x80
	ldr r1, [r0]
	add r0, r1, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, [r1, #0xc]
	bl sub_0204B6AC
	b _0204A134
_0204A10C:
	mov r0, #0x3f
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0xa0
	ldr r0, [r0]
	bl sub_0204B708
	b _0204A134
_0204A120:
	mov r0, #0x40
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [sp, #4]
	add r0, #0xa0
	ldr r0, [r0]
	bl sub_0204B720
_0204A134:
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0205C298
	cmp r0, #1
	bne _0204A15E
	bl sub_0203769C
	ldr r1, _0204A180 ; =0x0000083E
	add r1, r6, r1
	bl sub_02037C0C
	cmp r0, #1
	bne _0204A158
	mov r0, #1
	strh r0, [r4]
	b _0204A178
_0204A158:
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0204A15E:
	add r0, r6, #0
	bl sub_02096910
	ldr r1, _0204A180 ; =0x0000083E
	ldr r0, [sp]
	add r1, r6, r1
	mov r2, #0x46
	bl sub_02037030
	cmp r0, #1
	bne _0204A178
	mov r0, #1
	strh r0, [r4]
_0204A178:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0204A180: .word 0x0000083E
	thumb_func_end ScrCmd_416

	thumb_func_start ScrCmd_417
ScrCmd_417: ; 0x0204A184
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	add r1, #0xa0
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0205C298
	cmp r0, #1
	bne _0204A1CC
	add r5, #0x80
	ldr r0, [r5]
	add r1, r6, #0
	ldr r0, [r0, #0x10]
	add r2, r7, #0
	bl sub_020672A4
	b _0204A1DC
_0204A1CC:
	ldr r0, _0204A1E0 ; =0x000008DA
	ldr r1, _0204A1E4 ; =sub_0204A1E8
	strh r7, [r4, r0]
	sub r0, r0, #5
	strb r6, [r4, r0]
	add r0, r5, #0
	bl SetupNativeScript
_0204A1DC:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204A1E0: .word 0x000008DA
_0204A1E4: .word sub_0204A1E8
	thumb_func_end ScrCmd_417

	thumb_func_start sub_0204A1E8
sub_0204A1E8: ; 0x0204A1E8
	push {r4, lr}
	add r0, #0x80
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0xa0
	ldr r4, [r1]
	ldr r1, _0204A224 ; =0x000008DA
	ldrh r1, [r4, r1]
	bl GetVarPointer
	ldr r1, _0204A228 ; =0x000008D5
	ldrb r1, [r4, r1]
	cmp r1, #1
	bne _0204A208
	mov r3, #1
	b _0204A20A
_0204A208:
	mov r3, #2
_0204A20A:
	ldr r1, _0204A22C ; =0x000008D4
	ldrb r2, [r4, r1]
	cmp r2, r3
	bne _0204A220
	mov r2, #0
	strb r2, [r4, r1]
	add r1, r1, #4
	ldrh r1, [r4, r1]
	strh r1, [r0]
	mov r0, #1
	pop {r4, pc}
_0204A220:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0204A224: .word 0x000008DA
_0204A228: .word 0x000008D5
_0204A22C: .word 0x000008D4
	thumb_func_end sub_0204A1E8

	thumb_func_start ScrCmd_418
ScrCmd_418: ; 0x0204A230
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202D928
	add r1, sp, #0
	bl sub_0202D8D0
	add r0, sp, #0
	ldrb r1, [r0]
	strh r1, [r4]
	ldrb r0, [r0, #1]
	strh r0, [r6]
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ScrCmd_418

	thumb_func_start ScrCmd_419
ScrCmd_419: ; 0x0204A27C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0202D928
	bl sub_0202D7B8
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_419

	thumb_func_start sub_0204A2A8
sub_0204A2A8: ; 0x0204A2A8
	cmp r1, #2
	bne _0204A2B4
	ldrb r0, [r0, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1d
	bx lr
_0204A2B4:
	cmp r1, #1
	bne _0204A2DA
	ldrb r1, [r0, #0xf]
	cmp r1, #2
	bne _0204A2CC
	ldrb r0, [r0, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1d
	lsl r1, r0, #1
	ldr r0, _0204A2E8 ; =_020FBF70
	ldrh r0, [r0, r1]
	bx lr
_0204A2CC:
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	beq _0204A2D6
	mov r0, #0x61
	bx lr
_0204A2D6:
	mov r0, #0
	bx lr
_0204A2DA:
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	beq _0204A2E4
	mov r0, #0x61
	bx lr
_0204A2E4:
	mov r0, #0
	bx lr
	.balign 4, 0
_0204A2E8: .word _020FBF70
	thumb_func_end sub_0204A2A8

	thumb_func_start ScrCmd_554
ScrCmd_554: ; 0x0204A2EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r4, [r1, #0xc]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl Save_FrontierData_Get
	mov r1, #0
	add r2, r1, #0
	bl FrontierData_BattlePointAction
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_554

	thumb_func_start ScrCmd_555
ScrCmd_555: ; 0x0204A31C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r4, [r1, #0xc]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_GameStats_Get
	mov r1, #0x45
	add r2, r6, #0
	bl GameStats_Add
	add r0, r4, #0
	bl Save_FrontierData_Get
	add r1, r6, #0
	mov r2, #5
	bl FrontierData_BattlePointAction
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_555

	thumb_func_start ScrCmd_556
ScrCmd_556: ; 0x0204A360
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r4, [r1, #0xc]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_GameStats_Get
	mov r1, #0x46
	add r2, r6, #0
	bl GameStats_Add
	add r0, r4, #0
	bl Save_FrontierData_Get
	add r1, r6, #0
	mov r2, #6
	bl FrontierData_BattlePointAction
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_556

	thumb_func_start ScrCmd_CheckBattlePoints
ScrCmd_CheckBattlePoints: ; 0x0204A3A4
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r5, [r1, #0xc]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl Save_FrontierData_Get
	mov r1, #0
	add r2, r1, #0
	bl FrontierData_BattlePointAction
	cmp r0, r6
	bhs _0204A3EA
	mov r0, #0
	b _0204A3EC
_0204A3EA:
	mov r0, #1
_0204A3EC:
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_CheckBattlePoints

	thumb_func_start sub_0204A3F4
sub_0204A3F4: ; 0x0204A3F4
	cmp r0, #6
	bhi _0204A41E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0204A404: ; jump table
	.short _0204A412 - _0204A404 - 2 ; case 0
	.short _0204A416 - _0204A404 - 2 ; case 1
	.short _0204A41A - _0204A404 - 2 ; case 2
	.short _0204A41A - _0204A404 - 2 ; case 3
	.short _0204A412 - _0204A404 - 2 ; case 4
	.short _0204A412 - _0204A404 - 2 ; case 5
	.short _0204A41A - _0204A404 - 2 ; case 6
_0204A412:
	mov r0, #3
	bx lr
_0204A416:
	mov r0, #4
	bx lr
_0204A41A:
	mov r0, #2
	bx lr
_0204A41E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0204A3F4

	thumb_func_start sub_0204A424
sub_0204A424: ; 0x0204A424
	push {r4, r5}
	mov r5, #0
	cmp r3, #0
	ble _0204A44A
_0204A42C:
	ldrh r4, [r0]
	cmp r1, r4
	bne _0204A442
	cmp r2, #0
	beq _0204A442
	ldrh r4, [r0, #2]
	cmp r2, r4
	bne _0204A442
	mov r0, #1
	pop {r4, r5}
	bx lr
_0204A442:
	add r5, r5, #1
	add r0, r0, #4
	cmp r5, r3
	blt _0204A42C
_0204A44A:
	mov r0, #0
	pop {r4, r5}
	bx lr
	thumb_func_end sub_0204A424

	thumb_func_start sub_0204A450
sub_0204A450: ; 0x0204A450
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov lr, r0
	sub r0, r5, #1
	mov r7, #0
	mov ip, r0
	cmp r0, #0
	ble _0204A49C
	mov r3, lr
_0204A462:
	add r2, r7, #1
	cmp r2, r5
	bge _0204A492
	ldrh r6, [r3]
	lsl r1, r2, #2
	mov r0, lr
	add r4, r0, r1
_0204A470:
	ldrh r0, [r4]
	cmp r6, r0
	bne _0204A47A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204A47A:
	ldrh r1, [r3, #2]
	cmp r1, #0
	beq _0204A48A
	ldrh r0, [r4, #2]
	cmp r1, r0
	bne _0204A48A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204A48A:
	add r2, r2, #1
	add r4, r4, #4
	cmp r2, r5
	blt _0204A470
_0204A492:
	add r7, r7, #1
	mov r0, ip
	add r3, r3, #4
	cmp r7, r0
	blt _0204A462
_0204A49C:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0204A450

	thumb_func_start sub_0204A4A0
sub_0204A4A0: ; 0x0204A4A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r0, [sp]
	add r7, r1, #0
	add r6, r2, #0
	add r0, sp, #0x20
	mov r1, #0
	mov r2, #0x10
	str r3, [sp, #4]
	bl MI_CpuFill8
	mov r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _0204A5A8
	ldr r0, [sp]
	str r0, [sp, #0x10]
_0204A4C4:
	ldr r0, [sp, #0x10]
	ldrh r1, [r0]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r0, [sp, #0x10]
	ldrh r1, [r0, #2]
	add r0, sp, #0x20
	strh r1, [r0, #2]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, r6
	bge _0204A596
	lsl r1, r0, #2
	ldr r0, [sp]
	add r0, r0, r1
	str r0, [sp, #0xc]
_0204A4E6:
	ldr r0, [sp, #0xc]
	cmp r7, #2
	ldrh r1, [r0]
	add r0, sp, #0x20
	strh r1, [r0, #4]
	ldr r0, [sp, #0xc]
	ldrh r1, [r0, #2]
	add r0, sp, #0x20
	strh r1, [r0, #6]
	bne _0204A50C
	add r0, sp, #0x20
	add r1, r7, #0
	bl sub_0204A450
	cmp r0, #0
	beq _0204A586
	add sp, #0x30
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0204A50C:
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, r6
	bge _0204A586
	lsl r1, r0, #2
	ldr r0, [sp]
	add r0, r0, r1
	str r0, [sp, #8]
_0204A51E:
	ldr r0, [sp, #8]
	cmp r7, #3
	ldrh r1, [r0]
	add r0, sp, #0x20
	strh r1, [r0, #8]
	ldr r0, [sp, #8]
	ldrh r1, [r0, #2]
	add r0, sp, #0x20
	strh r1, [r0, #0xa]
	bne _0204A544
	add r0, sp, #0x20
	add r1, r7, #0
	bl sub_0204A450
	cmp r0, #0
	beq _0204A576
	add sp, #0x30
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0204A544:
	ldr r0, [sp, #0x14]
	add r4, r0, #1
	cmp r4, r6
	bge _0204A576
	ldr r0, [sp]
	lsl r1, r4, #2
	add r5, r0, r1
_0204A552:
	ldrh r1, [r5]
	add r0, sp, #0x20
	strh r1, [r0, #0xc]
	ldrh r1, [r5, #2]
	strh r1, [r0, #0xe]
	add r0, sp, #0x20
	add r1, r7, #0
	bl sub_0204A450
	cmp r0, #0
	beq _0204A56E
	add sp, #0x30
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0204A56E:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _0204A552
_0204A576:
	ldr r0, [sp, #8]
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, r6
	blt _0204A51E
_0204A586:
	ldr r0, [sp, #0xc]
	add r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, r6
	blt _0204A4E6
_0204A596:
	ldr r0, [sp, #0x10]
	add r0, r0, #4
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x1c]
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #0x1c]
	cmp r1, r0
	blt _0204A4C4
_0204A5A8:
	mov r0, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204A4A0

	thumb_func_start sub_0204A5B0
sub_0204A5B0: ; 0x0204A5B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r0, [sp]
	add r0, r1, #0
	str r2, [sp, #4]
	bl SaveArray_Party_Get
	str r0, [sp, #8]
	bl Party_GetCount
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	str r1, [sp, #0x10]
	ldr r0, [sp]
	cmp r1, r0
	bge _0204A5D6
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204A5D6:
	mov r4, #0
	str r4, [sp, #0x14]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bls _0204A66C
_0204A5E0:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x14]
	bl Party_GetMonByIndex
	mov r1, #5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r6, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0204A61C
	mov r7, #0
_0204A61C:
	add r0, r6, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0204A65C
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl IsPokemonBannedFromBattleFrontier 
	cmp r0, #1
	beq _0204A65C
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _0204A64C
	add r0, sp, #0x18
	add r1, r5, #0
	add r2, r7, #0
	add r3, r4, #0
	bl sub_0204A424
	cmp r0, #1
	beq _0204A65C
_0204A64C:
	lsl r1, r4, #2
	add r0, sp, #0x18
	add r2, r0, r1
	strh r5, [r0, r1]
	add r0, r4, #1
	lsl r0, r0, #0x18
	strh r7, [r2, #2]
	lsr r4, r0, #0x18
_0204A65C:
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	blo _0204A5E0
_0204A66C:
	ldr r0, [sp]
	cmp r4, r0
	bge _0204A678
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204A678:
	ldr r1, [sp]
	add r0, sp, #0x18
	add r3, r1, #0
	sub r3, r4, r3
	add r2, r4, #0
	add r3, r3, #1
	bl sub_0204A4A0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0204A5B0

	thumb_func_start sub_0204A68C
sub_0204A68C: ; 0x0204A68C
	ldr r3, _0204A694 ; =OS_ResetSystem
	mov r0, #0
	bx r3
	nop
_0204A694: .word OS_ResetSystem
	thumb_func_end sub_0204A68C

	thumb_func_start sub_0204A698
sub_0204A698: ; 0x0204A698
	ldr r3, _0204A69C ; =sub_0202D234
	bx r3
	.balign 4, 0
_0204A69C: .word sub_0202D234
	thumb_func_end sub_0204A698

	thumb_func_start sub_0204A6A0
sub_0204A6A0: ; 0x0204A6A0
	ldr r3, _0204A6A4 ; =sub_0202D3DC
	bx r3
	.balign 4, 0
_0204A6A4: .word sub_0202D3DC
	thumb_func_end sub_0204A6A0

	thumb_func_start sub_0204A6A8
sub_0204A6A8: ; 0x0204A6A8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_LocalFieldData_Get
	bl LocalFieldData_GetDynamicWarp
	add r4, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	ldr r1, [r5, #0x20]
	ldr r1, [r1]
	str r1, [r4]
	mov r1, #0
	mvn r1, r1
	str r1, [r4, #4]
	str r0, [r4, #8]
	str r6, [r4, #0xc]
	mov r0, #0
	str r0, [r4, #0x10]
	ldr r0, [r5, #0xc]
	bl Save_VarsFlags_Get
	bl SetFlag966
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0204A6A8

	thumb_func_start sub_0204A6E8
sub_0204A6E8: ; 0x0204A6E8
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl Save_VarsFlags_Get
	bl ClearFlag966
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0204A6E8

	thumb_func_start sub_0204A6F8
sub_0204A6F8: ; 0x0204A6F8
	push {r4, lr}
	add r4, r1, #0
	cmp r4, #5
	bne _0204A704
	mov r0, #0
	pop {r4, pc}
_0204A704:
	cmp r4, #6
	bne _0204A720
	bl sub_0203107C
	add r4, r0, #0
	mov r0, #0x71
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x71
	bl sub_020310BC
	pop {r4, pc}
_0204A720:
	bl sub_0203107C
	lsl r1, r4, #1
	add r1, r1, #1
	mov r2, #0xff
	bl sub_020310BC
	pop {r4, pc}
	thumb_func_end sub_0204A6F8

	thumb_func_start sub_0204A730
sub_0204A730: ; 0x0204A730
	push {r4, lr}
	add r4, r1, #0
	bl Save_FrontierData_Get
	cmp r4, #0
	bne _0204A746
	mov r1, #5
	mov r2, #2
	bl sub_0202D5DC
	pop {r4, pc}
_0204A746:
	mov r1, #5
	mov r2, #1
	bl sub_0202D5DC
	pop {r4, pc}
	thumb_func_end sub_0204A730

	thumb_func_start sub_0204A750
sub_0204A750: ; 0x0204A750
	push {r3, lr}
	bl Save_FrontierData_Get
	mov r1, #5
	mov r2, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
	thumb_func_end sub_0204A750

	thumb_func_start sub_0204A764
sub_0204A764: ; 0x0204A764
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0202D908
	add r4, r0, #0
	add r0, r5, #0
	bl Save_FrontierData_Get
	mov r1, #0
	add r6, r0, #0
	add r0, r4, #0
	add r2, r1, #0
	bl sub_0202D284
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #5
	bne _0204A78C
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204A78C:
	cmp r4, #6
	bne _0204A7AC
	add r0, r5, #0
	bl sub_0203107C
	add r7, r0, #0
	mov r0, #0x64
	bl sub_0205C268
	add r2, r0, #0
	add r0, r7, #0
	mov r1, #0x64
	mov r3, #0
	bl sub_02031108
	b _0204A7BC
_0204A7AC:
	add r1, r4, #0
	add r1, #8
	lsl r1, r1, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	mov r2, #2
	bl sub_0202D5DC
_0204A7BC:
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #2
	bl sub_0202D57C
	add r0, r5, #0
	bl sub_0203107C
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205C310
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0205C310
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	mov r3, #0
	bl sub_02031108
	cmp r4, #4
	beq _0204A7FA
	cmp r4, #6
	beq _0204A7FA
	add r0, r5, #0
	bl sub_020674E0
_0204A7FA:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204A764

	thumb_func_start sub_0204A800
sub_0204A800: ; 0x0204A800
	push {r3, lr}
	bl sub_0202D928
	bl sub_0202D7B0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
	thumb_func_end sub_0204A800

	thumb_func_start sub_0204A810
sub_0204A810: ; 0x0204A810
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0204A81E
	bl GF_AssertFail
_0204A81E:
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_0204A810

	thumb_func_start sub_0204A824
sub_0204A824: ; 0x0204A824
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r0, #0
	ldr r1, _0204AA1C ; =0x000008DC
	mov r0, #0xb
	add r7, r2, #0
	bl AllocFromHeap
	ldr r2, _0204AA1C ; =0x000008DC
	mov r1, #0
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0xb
	str r0, [r4, #4]
	add r0, r6, #0
	bl sub_0202D908
	str r0, [r4, #0x70]
	add r0, r6, #0
	bl Save_FrontierData_Get
	str r0, [r4, #0x74]
	ldr r0, _0204AA20 ; =0x12345678
	mov r1, #0
	str r0, [r4]
	ldr r0, [r4, #0x70]
	bl sub_0202D3E4
	cmp r5, #0
	bne _0204A8B4
	strb r7, [r4, #0xf]
	ldrb r0, [r4, #0xf]
	bl sub_0204A3F4
	strb r0, [r4, #0xe]
	mov r0, #1
	strb r0, [r4, #0xc]
	mov r2, #0
	strb r2, [r4, #0xd]
	mov r1, #0xff
_0204A878:
	add r0, r4, r2
	add r0, #0x2a
	strb r1, [r0]
	add r0, r2, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	cmp r2, #4
	blo _0204A878
	ldr r1, _0204AA24 ; =0x0000FFFF
	mov r2, #0
_0204A88C:
	lsl r0, r2, #1
	add r0, r4, r0
	strh r1, [r0, #0x3e]
	add r0, r2, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	cmp r2, #0xe
	blo _0204A88C
	ldr r0, [r4, #0x70]
	bl sub_0202D234
	ldrb r1, [r4, #0xf]
	add r0, sp, #8
	add r2, sp, #8
	strb r1, [r0]
	ldr r0, [r4, #0x70]
	mov r1, #0
	bl sub_0202D308
	b _0204A972
_0204A8B4:
	mov r1, #0
	ldr r0, [r4, #0x70]
	add r2, r1, #0
	bl sub_0202D284
	strb r0, [r4, #0xf]
	ldr r0, [r4, #0x70]
	mov r1, #1
	mov r2, #0
	bl sub_0202D284
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0xc]
	sub r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xf]
	bl sub_0204A3F4
	strb r0, [r4, #0xe]
	add r2, r4, #0
	ldr r0, [r4, #0x70]
	mov r1, #5
	add r2, #0x2a
	bl sub_0202D284
	add r2, r4, #0
	ldr r0, [r4, #0x70]
	mov r1, #8
	add r2, #0x3e
	bl sub_0202D284
	ldr r0, [r4, #0x70]
	mov r1, #0xa
	mov r2, #0
	bl sub_0202D284
	str r0, [r4, #8]
	ldrb r0, [r4, #0xf]
	cmp r0, #2
	bne _0204A972
	ldr r0, [r4, #0x70]
	mov r1, #9
	mov r2, #0
	bl sub_0202D284
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1d
	ldrb r1, [r4, #0x10]
	mov r2, #0xe0
	lsr r0, r0, #0x18
	bic r1, r2
	orr r0, r1
	strb r0, [r4, #0x10]
	ldrb r3, [r4, #0x10]
	ldr r2, _0204AA28 ; =0x000007E8
	ldr r0, [r4, #0x70]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x1d
	add r2, r4, r2
	lsl r3, r3, #4
	mov r1, #6
	add r2, r2, r3
	bl sub_0202D284
	ldrb r0, [r4, #0x10]
	mov r1, #7
	mov r2, #0
	lsl r0, r0, #0x18
	lsr r5, r0, #0x1d
	ldr r0, [r4, #0x70]
	bl sub_0202D284
	add r3, r0, #0
	ldr r0, _0204AA28 ; =0x000007E8
	mov r1, #0xa6
	lsl r1, r1, #2
	add r0, r4, r0
	lsl r2, r5, #4
	add r0, r0, r2
	add r2, r5, r2
	str r0, [sp]
	ldr r0, [r4, #4]
	add r1, r4, r1
	lsl r2, r2, #4
	add r1, r1, r2
	mov r2, #0x4b
	lsl r2, r2, #2
	add r2, r5, r2
	lsl r2, r2, #0x10
	str r0, [sp, #4]
	add r0, r4, #0
	lsr r2, r2, #0x10
	bl sub_0204BA50
_0204A972:
	add r0, r6, #0
	bl Save_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	strb r0, [r4, #0x11]
	ldrb r0, [r4, #0xf]
	cmp r0, #5
	beq _0204A9F8
	add r0, r6, #0
	bl sub_0203107C
	add r5, r0, #0
	add r0, r6, #0
	bl Save_GameStats_Get
	ldrb r1, [r4, #0xf]
	add r7, r0, #0
	cmp r1, #6
	bne _0204A9A6
	add r0, r6, #0
	bl Save_VarsFlags_Get
	bl Save_VarsFlags_GetVar4052
	b _0204A9B8
_0204A9A6:
	add r1, #8
	lsl r1, r1, #0x10
	ldr r0, [r4, #0x74]
	lsr r1, r1, #0x10
	mov r2, #0
	bl sub_0202D5DC
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
_0204A9B8:
	cmp r0, #0
	beq _0204A9EE
	ldrb r1, [r4, #0xf]
	cmp r1, #6
	bne _0204A9D4
	mov r0, #0x71
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0x71
	bl sub_020310BC
	b _0204A9E0
_0204A9D4:
	lsl r1, r1, #1
	add r0, r5, #0
	add r1, r1, #1
	mov r2, #0xff
	bl sub_020310BC
_0204A9E0:
	strh r0, [r4, #0x1a]
	ldrb r1, [r4, #0xf]
	ldr r0, [r4, #0x74]
	mov r2, #0
	bl sub_0202D57C
	strh r0, [r4, #0x1c]
_0204A9EE:
	add r0, r7, #0
	mov r1, #0x1e
	bl GameStats_GetCapped
	str r0, [r4, #0x20]
_0204A9F8:
	ldrb r0, [r4, #0xf]
	cmp r0, #6
	bne _0204AA16
	ldrh r0, [r4, #0x1a]
	mov r1, #7
	bl _s32_div_f
	add r2, r0, #0
	lsl r2, r2, #0x10
	ldr r0, [r4, #0x74]
	mov r1, #6
	lsr r2, r2, #0x10
	bl sub_0202D5C4
	strh r0, [r4, #0x1c]
_0204AA16:
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0204AA1C: .word 0x000008DC
_0204AA20: .word 0x12345678
_0204AA24: .word 0x0000FFFF
_0204AA28: .word 0x000007E8
	thumb_func_end sub_0204A824

	thumb_func_start sub_0204AA2C
sub_0204AA2C: ; 0x0204AA2C
	push {r4, lr}
	add r4, r0, #0
	beq _0204AA4E
	ldr r1, [r4]
	ldr r0, _0204AA50 ; =0x12345678
	cmp r1, r0
	beq _0204AA3E
	bl GF_AssertFail
_0204AA3E:
	ldr r2, _0204AA54 ; =0x000008DC
	add r0, r4, #0
	mov r1, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
_0204AA4E:
	pop {r4, pc}
	.balign 4, 0
_0204AA50: .word 0x12345678
_0204AA54: .word 0x000008DC
	thumb_func_end sub_0204AA2C

	thumb_func_start sub_0204AA58
sub_0204AA58: ; 0x0204AA58
	push {r3, lr}
	sub sp, #0x10
	ldrb r0, [r0, #0xe]
	mov r3, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x64
	str r0, [sp, #8]
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0x11
	str r3, [sp, #0xc]
	bl sub_02067118
	add sp, #0x10
	pop {r3, pc}
	thumb_func_end sub_0204AA58

	thumb_func_start sub_0204AA78
sub_0204AA78: ; 0x0204AA78
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r1]
	str r1, [sp]
	str r0, [sp, #4]
	add r0, #0x27
	ldrb r0, [r0]
	cmp r0, #0
	bne _0204AA96
	ldr r0, [sp, #4]
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #7
	bne _0204AAA6
_0204AA96:
	ldr r0, [sp, #4]
	bl FreeToHeap
	ldr r1, [sp]
	mov r0, #0
	str r0, [r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0204AAA6:
	add r0, r2, #0
	bl SaveArray_Party_Get
	str r0, [sp, #8]
	ldrb r0, [r5, #0xe]
	mov r4, #0
	cmp r0, #0
	ble _0204AAFA
_0204AAB6:
	ldr r0, [sp, #4]
	add r0, r0, r4
	add r0, #0x30
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r5, r4
	add r0, #0x2a
	strb r1, [r0]
	add r1, r5, r4
	add r1, #0x2a
	ldrb r1, [r1]
	ldr r0, [sp, #8]
	bl Party_GetMonByIndex
	lsl r1, r4, #1
	add r6, r5, r1
	add r7, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r6, #0x2e]
	add r0, r7, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r6, #0x36]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldrb r0, [r5, #0xe]
	cmp r4, r0
	blt _0204AAB6
_0204AAFA:
	ldr r0, [sp]
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, [sp]
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204AA78

	thumb_func_start sub_0204AB10
sub_0204AB10: ; 0x0204AB10
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp]
	add r0, r1, #0
	bl SaveArray_Party_Get
	str r0, [sp, #4]
	ldr r0, [sp]
	mov r5, #0
	ldrb r0, [r0, #0xe]
	cmp r0, #0
	ble _0204AB98
	add r7, sp, #0xc
	add r4, sp, #0x14
_0204AB2C:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	add r1, r1, r5
	add r1, #0x2a
	ldrb r1, [r1]
	bl Party_GetMonByIndex
	str r0, [sp, #8]
	lsl r6, r5, #1
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r4, r6]
	ldr r0, [sp, #8]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r7, r6]
	cmp r5, #0
	beq _0204AB8A
	mov r0, #0
	cmp r5, #0
	bls _0204AB8A
	ldrh r1, [r4, r6]
	ldrh r2, [r7, r6]
_0204AB62:
	lsl r6, r0, #1
	ldrh r3, [r4, r6]
	cmp r1, r3
	bne _0204AB70
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0204AB70:
	cmp r2, #0
	beq _0204AB80
	ldrh r3, [r7, r6]
	cmp r2, r3
	bne _0204AB80
	add sp, #0x1c
	mov r0, #2
	pop {r4, r5, r6, r7, pc}
_0204AB80:
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, r5
	blo _0204AB62
_0204AB8A:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	ldr r0, [sp]
	ldrb r0, [r0, #0xe]
	cmp r5, r0
	blt _0204AB2C
_0204AB98:
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204AB10

	thumb_func_start sub_0204ABA0
sub_0204ABA0: ; 0x0204ABA0
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	bls _0204ABC0
_0204ABA8:
	lsl r3, r4, #1
	ldrh r3, [r0, r3]
	cmp r1, r3
	bne _0204ABB6
	mov r0, #1
	pop {r3, r4}
	bx lr
_0204ABB6:
	add r3, r4, #1
	lsl r3, r3, #0x10
	lsr r4, r3, #0x10
	cmp r4, r2
	blo _0204ABA8
_0204ABC0:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0204ABA0

	thumb_func_start sub_0204ABC8
sub_0204ABC8: ; 0x0204ABC8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrb r1, [r5, #0xf]
	cmp r1, #2
	beq _0204ABDC
	cmp r1, #6
	beq _0204ABDC
	cmp r1, #3
	bne _0204AC3A
_0204ABDC:
	cmp r1, #3
	bne _0204ABE8
	ldrh r2, [r5, #0x14]
	ldrh r0, [r5, #0x1c]
	cmp r2, r0
	bhi _0204ABF6
_0204ABE8:
	cmp r1, #6
	bne _0204ABF4
	ldrh r2, [r5, #0x14]
	ldrh r0, [r5, #0x1c]
	cmp r2, r0
	bhi _0204ABF6
_0204ABF4:
	ldrh r2, [r5, #0x1c]
_0204ABF6:
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	str r0, [sp, #4]
	add r0, #0x3e
	mov r4, #0
	add r6, r5, #0
	str r0, [sp, #4]
_0204AC08:
	lsr r2, r4, #0x1f
	add r2, r4, r2
	lsl r2, r2, #0x17
	ldrb r3, [r5, #0xf]
	ldr r1, [sp]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl sub_0204B73C
	add r7, r0, #0
	lsl r2, r4, #0x10
	ldr r0, [sp, #4]
	add r1, r7, #0
	lsr r2, r2, #0x10
	bl sub_0204ABA0
	cmp r0, #0
	bne _0204AC08
	add r4, r4, #1
	strh r7, [r6, #0x3e]
	add r6, r6, #2
	cmp r4, #0xe
	blt _0204AC08
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0204AC3A:
	str r0, [sp, #8]
	add r0, #0x3e
	mov r4, #0
	add r6, r5, #0
	str r0, [sp, #8]
_0204AC44:
	ldrh r1, [r5, #0x1c]
	lsl r2, r4, #0x18
	ldrb r3, [r5, #0xf]
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl sub_0204B73C
	add r7, r0, #0
	lsl r2, r4, #0x10
	ldr r0, [sp, #8]
	add r1, r7, #0
	lsr r2, r2, #0x10
	bl sub_0204ABA0
	cmp r0, #0
	bne _0204AC44
	add r4, r4, #1
	strh r7, [r6, #0x3e]
	add r6, r6, #2
	cmp r4, #7
	blt _0204AC44
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204ABC8

	thumb_func_start sub_0204AC78
sub_0204AC78: ; 0x0204AC78
	ldrb r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0204AC78

	thumb_func_start sub_0204AC7C
sub_0204AC7C: ; 0x0204AC7C
	ldrb r2, [r0, #0x10]
	lsl r1, r2, #0x1f
	lsr r1, r1, #0x1f
	beq _0204AC88
	mov r0, #1
	bx lr
_0204AC88:
	ldrb r1, [r0, #0xc]
	cmp r1, #7
	bls _0204AC9C
	mov r1, #1
	bic r2, r1
	mov r1, #1
	orr r2, r1
	strb r2, [r0, #0x10]
	add r0, r1, #0
	bx lr
_0204AC9C:
	mov r0, #0
	bx lr
	thumb_func_end sub_0204AC7C

	thumb_func_start sub_0204ACA0
sub_0204ACA0: ; 0x0204ACA0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldrb r2, [r4, #0xf]
	cmp r2, #0
	beq _0204ACB8
	cmp r2, #1
	beq _0204AD00
	cmp r2, #4
	beq _0204ACC2
	add sp, #4
	pop {r3, r4, pc}
_0204ACB8:
	mov r2, #0
	bl sub_0204B470
	add sp, #4
	pop {r3, r4, pc}
_0204ACC2:
	mov r2, #1
	bl sub_0204B470
	ldrh r1, [r4, #0x28]
	ldrh r2, [r4, #0x24]
	ldrh r3, [r4, #0x26]
	lsl r1, r1, #0x18
	ldr r0, [r4, #0x70]
	lsr r1, r1, #0x18
	bl sub_0202D3B0
	ldrb r1, [r4, #0xf]
	add r0, sp, #0
	add r2, sp, #0
	strb r1, [r0]
	ldr r0, [r4, #0x70]
	mov r1, #0
	bl sub_0202D308
	ldrb r1, [r4, #0xc]
	add r0, sp, #0
	add r2, sp, #0
	strb r1, [r0]
	ldr r0, [r4, #0x70]
	mov r1, #1
	bl sub_0202D308
	ldr r0, [r4, #0x74]
	ldr r1, [r4, #0x70]
	bl sub_0202D4FC
_0204AD00:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_0204ACA0

	thumb_func_start sub_0204AD04
sub_0204AD04: ; 0x0204AD04
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	add r5, r0, #0
	add r0, r7, #0
	bl Save_GameStats_Get
	str r0, [sp, #4]
	add r0, r7, #0
	bl sub_0203107C
	str r0, [sp]
	ldrb r0, [r5, #0xf]
	cmp r0, #5
	beq _0204AE16
	cmp r0, #6
	bne _0204AD2A
	mov r4, #0x70
	b _0204AD2C
_0204AD2A:
	lsl r4, r0, #1
_0204AD2C:
	add r0, r4, #0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [sp]
	add r1, r4, #0
	bl sub_020310BC
	add r0, r4, #0
	bl sub_0205C268
	add r2, r0, #0
	ldrh r6, [r5, #0x1a]
	ldrb r3, [r5, #0xd]
	ldr r0, [sp]
	add r1, r4, #0
	add r3, r6, r3
	lsl r3, r3, #0x10
	lsr r3, r3, #0x10
	bl sub_0203126C
	ldrb r1, [r5, #0xf]
	cmp r1, #6
	bne _0204AD76
	add r0, r7, #0
	bl sub_0203107C
	add r6, r0, #0
	mov r0, #0x64
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	mov r1, #0x64
	bl sub_020310BC
	b _0204AD84
_0204AD76:
	add r1, #8
	lsl r1, r1, #0x10
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x10
	mov r2, #0
	bl sub_0202D5DC
_0204AD84:
	add r0, r4, #1
	bl sub_0205C268
	add r1, r4, #1
	add r2, r0, #0
	ldrh r4, [r5, #0x1a]
	ldrb r3, [r5, #0xd]
	ldr r0, [sp]
	add r3, r4, r3
	lsl r3, r3, #0x10
	lsr r3, r3, #0x10
	bl sub_02031108
	ldrb r1, [r5, #0xf]
	add r4, r0, #0
	cmp r1, #6
	bne _0204ADC2
	add r0, r7, #0
	bl sub_0203107C
	add r6, r0, #0
	mov r0, #0x64
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	mov r1, #0x64
	mov r3, #0
	bl sub_02031108
	b _0204ADD0
_0204ADC2:
	add r1, #8
	lsl r1, r1, #0x10
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x10
	mov r2, #2
	bl sub_0202D5DC
_0204ADD0:
	ldrb r2, [r5, #0xd]
	ldr r0, [sp, #4]
	mov r1, #0x1e
	bl GameStats_Add
	ldrb r1, [r5, #0xf]
	ldr r0, [r5, #0x74]
	mov r2, #2
	bl sub_0202D57C
	ldrb r0, [r5, #0xf]
	cmp r0, #6
	beq _0204ADF8
	add r0, r7, #0
	bl Save_GameStats_Get
	mov r1, #0x10
	mov r2, #1
	bl GameStats_Add
_0204ADF8:
	add r0, r5, #0
	bl sub_0204B318
	ldr r0, _0204AE1C ; =0x0000270F
	add r4, r4, #1
	cmp r4, r0
	bls _0204AE08
	add r4, r0, #0
_0204AE08:
	lsl r3, r4, #0x10
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0
	lsr r3, r3, #0x10
	bl sub_0204ACA0
_0204AE16:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0204AE1C: .word 0x0000270F
	thumb_func_end sub_0204AD04

	thumb_func_start sub_0204AE20
sub_0204AE20: ; 0x0204AE20
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrb r0, [r5, #0xf]
	add r7, r1, #0
	cmp r0, #5
	beq _0204AF26
	add r0, r7, #0
	bl Save_GameStats_Get
	str r0, [sp, #4]
	add r0, r7, #0
	bl sub_0203107C
	ldrb r1, [r5, #0xf]
	str r0, [sp]
	cmp r1, #6
	bne _0204AE48
	mov r4, #0x70
	b _0204AE4A
_0204AE48:
	lsl r4, r1, #1
_0204AE4A:
	cmp r1, #6
	bne _0204AE68
	add r0, r7, #0
	bl sub_0203107C
	add r6, r0, #0
	mov r0, #0x64
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	mov r1, #0x64
	bl sub_020310BC
	b _0204AE76
_0204AE68:
	add r1, #8
	lsl r1, r1, #0x10
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x10
	mov r2, #0
	bl sub_0202D5DC
_0204AE76:
	add r0, r4, #1
	bl sub_0205C268
	add r2, r0, #0
	ldrh r6, [r5, #0x1a]
	ldrb r3, [r5, #0xd]
	ldr r0, [sp]
	add r1, r4, #1
	add r3, r6, r3
	lsl r3, r3, #0x10
	lsr r3, r3, #0x10
	bl sub_02031108
	ldrb r1, [r5, #0xf]
	add r6, r0, #0
	cmp r1, #6
	bne _0204AEB4
	add r0, r7, #0
	bl sub_0203107C
	str r0, [sp, #8]
	mov r0, #0x64
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [sp, #8]
	mov r1, #0x64
	mov r3, #1
	bl sub_02031108
	b _0204AEC2
_0204AEB4:
	add r1, #8
	lsl r1, r1, #0x10
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x10
	mov r2, #1
	bl sub_0202D5DC
_0204AEC2:
	add r0, r4, #0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [sp]
	add r1, r4, #0
	bl sub_020310BC
	add r0, r4, #0
	bl sub_0205C268
	add r2, r0, #0
	lsl r3, r6, #0x10
	ldr r0, [sp]
	add r1, r4, #0
	lsr r3, r3, #0x10
	bl sub_0203126C
	ldr r0, [sp, #4]
	mov r1, #0x1e
	mov r2, #7
	bl GameStats_Add
	ldrb r1, [r5, #0xf]
	ldr r0, [r5, #0x74]
	mov r2, #3
	bl sub_0202D57C
	ldrb r0, [r5, #0xf]
	cmp r0, #6
	beq _0204AF0A
	ldr r0, [sp, #4]
	mov r1, #0x10
	mov r2, #1
	bl GameStats_Add
_0204AF0A:
	ldr r0, [sp, #4]
	mov r1, #0xe
	bl GameStats_AddSpecial
	add r0, r5, #0
	bl sub_0204B318
	lsl r3, r6, #0x10
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #1
	lsr r3, r3, #0x10
	bl sub_0204ACA0
_0204AF26:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204AE20

	thumb_func_start sub_0204AF2C
sub_0204AF2C: ; 0x0204AF2C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldrb r1, [r4, #0xf]
	add r0, sp, #0
	add r2, sp, #0
	strb r1, [r0]
	ldr r0, [r4, #0x70]
	mov r1, #0
	bl sub_0202D308
	ldrb r1, [r4, #0xc]
	add r0, sp, #0
	add r2, sp, #0
	strb r1, [r0]
	ldr r0, [r4, #0x70]
	mov r1, #1
	bl sub_0202D308
	add r2, r4, #0
	ldr r0, [r4, #0x70]
	mov r1, #5
	add r2, #0x2a
	bl sub_0202D308
	ldrh r1, [r4, #0x28]
	ldrh r2, [r4, #0x24]
	ldrh r3, [r4, #0x26]
	lsl r1, r1, #0x18
	ldr r0, [r4, #0x70]
	lsr r1, r1, #0x18
	bl sub_0202D3B0
	add r2, r4, #0
	ldr r0, [r4, #0x70]
	mov r1, #8
	add r2, #0x3e
	bl sub_0202D308
	add r2, r4, #0
	ldr r0, [r4, #0x70]
	mov r1, #0xa
	add r2, #8
	bl sub_0202D308
	ldr r0, [r4, #0x70]
	mov r1, #1
	bl sub_0202D3E4
	ldrb r0, [r4, #0xf]
	cmp r0, #2
	bne _0204AFD2
	ldrb r0, [r4, #0x10]
	add r2, sp, #0
	lsl r0, r0, #0x18
	lsr r1, r0, #0x1d
	add r0, sp, #0
	strb r1, [r0]
	ldr r0, [r4, #0x70]
	mov r1, #9
	bl sub_0202D308
	ldrb r3, [r4, #0x10]
	ldr r2, _0204AFD8 ; =0x000007E8
	ldr r0, [r4, #0x70]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x1d
	add r2, r4, r2
	lsl r3, r3, #4
	mov r1, #6
	add r2, r2, r3
	bl sub_0202D308
	ldr r2, _0204AFDC ; =0x00000838
	ldr r0, [r4, #0x70]
	add r3, r4, r2
	ldrb r2, [r4, #0x10]
	mov r1, #7
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1d
	add r2, r3, r2
	bl sub_0202D308
_0204AFD2:
	add sp, #4
	pop {r3, r4, pc}
	nop
_0204AFD8: .word 0x000007E8
_0204AFDC: .word 0x00000838
	thumb_func_end sub_0204AF2C

	thumb_func_start sub_0204AFE0
sub_0204AFE0: ; 0x0204AFE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, _0204B03C ; =0x000007E8
	mov r4, #0
	add r6, r5, r0
	mov r0, #0xa6
	lsl r0, r0, #2
	add r7, r5, r0
	add r0, r5, #0
	str r0, [sp, #0x10]
	add r0, #0x2e
	str r0, [sp, #0x10]
	add r0, r5, #0
	str r0, [sp, #0x14]
	add r0, #0x36
	str r0, [sp, #0x14]
_0204B002:
	ldr r0, [sp, #0x10]
	mov r2, #0x4b
	str r0, [sp]
	ldr r0, [sp, #0x14]
	lsl r2, r2, #2
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r5, #4]
	add r2, r4, r2
	str r0, [sp, #0xc]
	lsl r2, r2, #0x10
	ldrb r3, [r5, #0xe]
	add r0, r5, #0
	add r1, r7, #0
	lsr r2, r2, #0x10
	bl sub_0204BA04
	add r2, r5, r4
	ldr r1, _0204B040 ; =0x00000838
	add r4, r4, #1
	strb r0, [r2, r1]
	mov r0, #0x11
	lsl r0, r0, #4
	add r6, #0x10
	add r7, r7, r0
	cmp r4, #5
	blt _0204B002
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204B03C: .word 0x000007E8
_0204B040: .word 0x00000838
	thumb_func_end sub_0204AFE0

	thumb_func_start sub_0204B044
sub_0204B044: ; 0x0204B044
	lsl r2, r1, #4
	add r1, r1, r2
	lsl r1, r1, #4
	add r0, r0, r1
	add r0, #0x7c
	ldrh r0, [r0]
	ldr r3, _0204B058 ; =sub_0204B5E8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx r3
	.balign 4, 0
_0204B058: .word sub_0204B5E8
	thumb_func_end sub_0204B044

	thumb_func_start sub_0204B05C
sub_0204B05C: ; 0x0204B05C
	ldrb r0, [r0, #0xf]
	bx lr
	thumb_func_end sub_0204B05C

	thumb_func_start sub_0204B060
sub_0204B060: ; 0x0204B060
	ldrb r0, [r0, #0x10]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1e
	bx lr
	thumb_func_end sub_0204B060

	thumb_func_start sub_0204B068
sub_0204B068: ; 0x0204B068
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrb r1, [r4, #0xf]
	cmp r1, #5
	bne _0204B076
	mov r0, #0
	pop {r3, r4, r5, pc}
_0204B076:
	cmp r1, #4
	bne _0204B088
	ldr r0, [r4, #0x74]
	mov r1, #0
	bl sub_0202D488
	ldr r1, _0204B0D4 ; =_020FBF98
	ldrb r5, [r1, r0]
	b _0204B0C6
_0204B088:
	cmp r1, #3
	beq _0204B090
	cmp r1, #6
	bne _0204B0A6
_0204B090:
	ldr r0, [r4, #0x74]
	mov r2, #0
	bl sub_0202D57C
	cmp r0, #7
	blo _0204B0A0
	mov r5, #0x12
	b _0204B0C6
_0204B0A0:
	ldr r1, _0204B0D8 ; =_020FBF7C
	ldrb r5, [r1, r0]
	b _0204B0C6
_0204B0A6:
	ldr r0, [r4, #0x74]
	mov r2, #0
	bl sub_0202D57C
	ldrb r1, [r4, #0x10]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1e
	beq _0204B0BA
	mov r5, #0x14
	b _0204B0C6
_0204B0BA:
	cmp r0, #7
	blo _0204B0C2
	mov r5, #7
	b _0204B0C6
_0204B0C2:
	ldr r1, _0204B0DC ; =_020FBF84
	ldrb r5, [r1, r0]
_0204B0C6:
	ldr r0, [r4, #0x74]
	add r1, r5, #0
	mov r2, #5
	bl FrontierData_BattlePointAction
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0204B0D4: .word _020FBF98
_0204B0D8: .word _020FBF7C
_0204B0DC: .word _020FBF84
	thumb_func_end sub_0204B068

	thumb_func_start sub_0204B0E0
sub_0204B0E0: ; 0x0204B0E0
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	ldrb r1, [r4, #0xf]
	bl sub_0204A6F8
	cmp r0, #0x32
	bhs _0204B0F4
	mov r0, #0
	pop {r4, pc}
_0204B0F4:
	cmp r0, #0x64
	ldr r0, [r4, #0x74]
	blo _0204B10A
	mov r1, #1
	mov r2, #0
	bl sub_0202D5DC
	cmp r0, #0
	beq _0204B11A
	mov r0, #0
	pop {r4, pc}
_0204B10A:
	mov r1, #0
	add r2, r1, #0
	bl sub_0202D5DC
	cmp r0, #0
	beq _0204B11A
	mov r0, #0
	pop {r4, pc}
_0204B11A:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0204B0E0

	thumb_func_start sub_0204B120
sub_0204B120: ; 0x0204B120
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r4, r2, #0
	bl Save_FrontierData_Get
	add r6, r0, #0
	cmp r4, #0
	beq _0204B13C
	cmp r4, #1
	beq _0204B144
	cmp r4, #2
	beq _0204B180
	b _0204B1C4
_0204B13C:
	mov r1, #0
	bl sub_0202D488
	pop {r4, r5, r6, pc}
_0204B144:
	mov r1, #4
	mov r2, #2
	bl sub_0202D5DC
	add r0, r6, #0
	mov r1, #0
	bl sub_0202D488
	add r4, r0, #0
	cmp r4, #0xa
	bne _0204B166
	ldrb r1, [r5, #0x10]
	mov r0, #0x10
	orr r0, r1
	strb r0, [r5, #0x10]
	mov r0, #0
	pop {r4, r5, r6, pc}
_0204B166:
	add r0, r6, #0
	mov r1, #3
	bl sub_0202D488
	add r0, r4, #1
	cmp r0, #5
	blt _0204B17C
	ldrb r1, [r5, #0x10]
	mov r0, #0x10
	orr r0, r1
	strb r0, [r5, #0x10]
_0204B17C:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0204B180:
	mov r1, #3
	bl sub_0202D450
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #0
	bl sub_0202D488
	cmp r0, #1
	bne _0204B198
	mov r0, #0
	pop {r4, r5, r6, pc}
_0204B198:
	sub r1, r0, #1
	ldr r0, _0204B1C8 ; =_020FBF8C
	ldrb r0, [r0, r1]
	cmp r4, r0
	blo _0204B1C0
	add r0, r6, #0
	mov r1, #4
	bl sub_0202D488
	add r0, r6, #0
	mov r1, #2
	bl sub_0202D450
	add r0, r6, #0
	mov r1, #4
	mov r2, #2
	bl sub_0202D5DC
	mov r0, #1
	pop {r4, r5, r6, pc}
_0204B1C0:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0204B1C4:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0204B1C8: .word _020FBF8C
	thumb_func_end sub_0204B120

	thumb_func_start sub_0204B1CC
sub_0204B1CC: ; 0x0204B1CC
	push {r3, lr}
	add r2, r0, #0
	ldrb r0, [r2, #0xf]
	cmp r0, #0
	beq _0204B1DA
	mov r0, #0
	pop {r3, pc}
_0204B1DA:
	ldrb r0, [r2, #0x10]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1e
	cmp r0, #1
	beq _0204B1EA
	cmp r0, #2
	beq _0204B1F4
	b _0204B1FE
_0204B1EA:
	add r0, r1, #0
	mov r1, #0x1a
	bl sub_0204B2B8
	pop {r3, pc}
_0204B1F4:
	add r0, r1, #0
	mov r1, #0x1b
	bl sub_0204B2B8
	pop {r3, pc}
_0204B1FE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0204B1CC

	thumb_func_start sub_0204B204
sub_0204B204: ; 0x0204B204
	push {r4, lr}
	add r2, r0, #0
	ldrb r0, [r2, #0xf]
	cmp r0, #5
	bne _0204B212
	mov r0, #0
	pop {r4, pc}
_0204B212:
	cmp r0, #6
	bne _0204B21A
	mov r0, #0
	pop {r4, pc}
_0204B21A:
	ldrb r4, [r2, #0x10]
	lsl r4, r4, #0x1b
	lsr r4, r4, #0x1f
	bne _0204B226
	mov r0, #0
	pop {r4, pc}
_0204B226:
	cmp r0, #4
	bhi _0204B24E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0204B236: ; jump table
	.short _0204B24E - _0204B236 - 2 ; case 0
	.short _0204B240 - _0204B236 - 2 ; case 1
	.short _0204B244 - _0204B236 - 2 ; case 2
	.short _0204B248 - _0204B236 - 2 ; case 3
	.short _0204B24C - _0204B236 - 2 ; case 4
_0204B240:
	mov r3, #0x1c
	b _0204B24E
_0204B244:
	mov r3, #0x1d
	b _0204B24E
_0204B248:
	mov r3, #0x1e
	b _0204B24E
_0204B24C:
	mov r3, #0x1f
_0204B24E:
	add r0, r1, #0
	add r1, r3, #0
	bl sub_0204B2B8
	pop {r4, pc}
	thumb_func_end sub_0204B204

	thumb_func_start sub_0204B258
sub_0204B258: ; 0x0204B258
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldrb r1, [r5, #0xf]
	cmp r1, #6
	bne _0204B27E
	add r0, r4, #0
	bl sub_0203107C
	add r6, r0, #0
	mov r0, #0x64
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	mov r1, #0x64
	bl sub_020310BC
	b _0204B28C
_0204B27E:
	add r1, #8
	lsl r1, r1, #0x10
	ldr r0, [r5, #0x74]
	lsr r1, r1, #0x10
	mov r2, #0
	bl sub_0202D5DC
_0204B28C:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0
	bne _0204B29C
	add r0, r4, #0
	bl sub_020674E0
	b _0204B2A2
_0204B29C:
	add r0, r4, #0
	bl sub_0206751C
_0204B2A2:
	str r0, [r5, #8]
	ldr r0, [r5, #8]
	ldr r1, _0204B2B4 ; =0x0000FFFF
	bl _u32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
	nop
_0204B2B4: .word 0x0000FFFF
	thumb_func_end sub_0204B258

	thumb_func_start sub_0204B2B8
sub_0204B2B8: ; 0x0204B2B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r5, r2, #0
	mov r2, #1
	add r1, sp, #8
	strb r2, [r1]
	bl SaveArray_Party_Get
	str r0, [sp]
	mov r7, #0
	ldrb r0, [r5, #0xe]
	add r4, r7, #0
	cmp r0, #0
	ble _0204B308
_0204B2D6:
	add r1, r5, r4
	add r1, #0x2a
	ldrb r1, [r1]
	ldr r0, [sp]
	bl Party_GetMonByIndex
	add r1, r6, #0
	mov r2, #0
	str r0, [sp, #4]
	bl GetMonData
	cmp r0, #0
	bne _0204B300
	ldr r0, [sp, #4]
	add r1, r6, #0
	add r2, sp, #8
	bl SetMonData
	add r0, r7, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
_0204B300:
	ldrb r0, [r5, #0xe]
	add r4, r4, #1
	cmp r4, r0
	blt _0204B2D6
_0204B308:
	cmp r7, #0
	bne _0204B312
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0204B312:
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0204B2B8

	thumb_func_start sub_0204B318
sub_0204B318: ; 0x0204B318
	ldrb r1, [r0, #0xf]
	cmp r1, #5
	beq _0204B32A
	cmp r1, #0
	beq _0204B32A
	cmp r1, #6
	beq _0204B32A
	cmp r1, #4
	bne _0204B32E
_0204B32A:
	mov r0, #0
	bx lr
_0204B32E:
	ldrh r2, [r0, #0x1a]
	ldrb r1, [r0, #0xd]
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	cmp r1, #0x32
	bhs _0204B340
	mov r0, #0
	bx lr
_0204B340:
	ldrb r2, [r0, #0x10]
	mov r1, #0x10
	orr r1, r2
	strb r1, [r0, #0x10]
	mov r0, #1
	bx lr
	thumb_func_end sub_0204B318

	thumb_func_start sub_0204B34C
sub_0204B34C: ; 0x0204B34C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	ldr r1, [sp]
	lsl r0, r0, #0x10
	ldrh r1, [r1]
	ldr r2, _0204B468 ; =0xFFFFF800
	lsr r3, r0, #0x10
	lsr r0, r2, #0x15
	and r1, r2
	and r0, r3
	orr r1, r0
	ldr r0, [sp]
	mov r2, #0
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #0x70
	bl GetMonData
	ldr r1, [sp]
	lsl r0, r0, #0x10
	ldrh r2, [r1]
	ldr r1, _0204B46C ; =0xFFFF07FF
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1b
	and r1, r2
	lsr r0, r0, #0x10
	orr r1, r0
	ldr r0, [sp]
	mov r2, #0
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #6
	bl GetMonData
	ldr r1, [sp]
	mov r4, #0
	strh r0, [r1, #2]
	add r0, r1, #0
	str r0, [sp, #4]
	add r0, #0x1e
	add r6, r1, #0
	add r7, r4, #0
	str r0, [sp, #4]
_0204B3B0:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	strh r0, [r6, #4]
	add r0, r5, #0
	add r1, #0x3e
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #4]
	lsl r0, r7
	ldrb r1, [r1]
	add r4, r4, #1
	add r6, r6, #2
	orr r1, r0
	ldr r0, [sp, #4]
	add r7, r7, #2
	strb r1, [r0]
	cmp r4, #4
	blt _0204B3B0
	add r0, r5, #0
	mov r1, #0xc
	mov r2, #0
	bl GetMonData
	ldr r1, [sp]
	mov r2, #0
	strb r0, [r1, #0x1f]
	add r0, r5, #0
	mov r1, #7
	bl GetMonData
	ldr r1, [sp]
	str r0, [r1, #0xc]
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl GetMonData
	ldr r1, [sp]
	mov r2, #0
	str r0, [r1, #0x10]
	add r0, r5, #0
	mov r1, #0xaf
	bl GetMonData
	ldr r1, [sp]
	mov r4, #0
	str r0, [r1, #0x14]
	add r6, r4, #0
_0204B41C:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0xd
	add r2, r6, #0
	bl GetMonData
	ldr r1, [sp]
	add r1, r1, r4
	add r4, r4, #1
	strb r0, [r1, #0x18]
	cmp r4, #6
	blt _0204B41C
	add r0, r5, #0
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	ldr r1, [sp]
	mov r2, #0
	add r1, #0x20
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #9
	bl GetMonData
	ldr r1, [sp]
	ldr r2, [sp]
	add r1, #0x21
	strb r0, [r1]
	add r2, #0x22
	add r0, r5, #0
	mov r1, #0x75
	str r2, [sp]
	bl GetMonData
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0204B468: .word 0xFFFFF800
_0204B46C: .word 0xFFFF07FF
	thumb_func_end sub_0204B34C

	thumb_func_start sub_0204B470
sub_0204B470: ; 0x0204B470
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	ldr r0, [r6, #4]
	add r4, r1, #0
	mov r1, #0xa8
	str r2, [sp]
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0xa8
	str r0, [sp, #4]
	bl MI_CpuFill8
	add r0, r4, #0
	bl SaveArray_Party_Get
	ldr r5, [sp, #4]
	add r7, r0, #0
	mov r4, #0
_0204B498:
	add r1, r6, r4
	add r1, #0x2a
	ldrb r1, [r1]
	add r0, r7, #0
	bl Party_GetMonByIndex
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0204B34C
	add r4, r4, #1
	add r5, #0x38
	cmp r4, #3
	blt _0204B498
	ldr r0, [r6, #0x74]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl sub_0202D4B8
	ldr r0, [sp, #4]
	mov r1, #0
	mov r2, #0xa8
	bl MI_CpuFill8
	ldr r0, [sp, #4]
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204B470

	thumb_func_start sub_0204B4D4
sub_0204B4D4: ; 0x0204B4D4
	cmp r0, #0x64
	bhs _0204B4DC
	mov r0, #3
	bx lr
_0204B4DC:
	cmp r0, #0x78
	bhs _0204B4E4
	mov r0, #6
	bx lr
_0204B4E4:
	cmp r0, #0x8c
	bhs _0204B4EC
	mov r0, #9
	bx lr
_0204B4EC:
	cmp r0, #0xa0
	bhs _0204B4F4
	mov r0, #0xc
	bx lr
_0204B4F4:
	cmp r0, #0xb4
	bhs _0204B4FC
	mov r0, #0xf
	bx lr
_0204B4FC:
	cmp r0, #0xc8
	bhs _0204B504
	mov r0, #0x12
	bx lr
_0204B504:
	cmp r0, #0xdc
	bhs _0204B50C
	mov r0, #0x15
	bx lr
_0204B50C:
	mov r0, #0x1f
	bx lr
	thumb_func_end sub_0204B4D4

	thumb_func_start sub_0204B510
sub_0204B510: ; 0x0204B510
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xf]
	cmp r0, #6
	bne _0204B520
	bl LCRandom
	pop {r4, pc}
_0204B520:
	ldr r0, [r4, #8]
	bl sub_020674A4
	ldr r1, _0204B534 ; =0x0000FFFF
	str r0, [r4, #8]
	bl _u32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, pc}
	.balign 4, 0
_0204B534: .word 0x0000FFFF
	thumb_func_end sub_0204B510

	thumb_func_start sub_0204B538
sub_0204B538: ; 0x0204B538
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r0, #0
	add r7, r1, #0
	str r2, [sp, #8]
	mov r0, #0xe
	mov r1, #4
	str r3, [sp, #0xc]
	ldr r5, [sp, #0x38]
	bl String_New
	add r6, r0, #0
	mov r0, #2
	mov r1, #4
	bl String_New
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl Save_Pokedex_Get
	str r0, [sp, #0x18]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xed
	mov r3, #4
	bl NewMsgDataFromNarc
	str r0, [sp, #0x10]
	mov r0, #0x13
	mov r1, #0xe
	mov r2, #4
	bl MessageFormat_New_Custom
	mov r1, #0
	str r1, [sp]
	mov r3, #1
	add r2, r7, #0
	str r0, [sp, #0x14]
	str r3, [sp, #4]
	bl BufferIntegerAsString
	mov r4, #0
_0204B58C:
	add r0, r4, #0
	bl GetBannedBattleFrontierPokemon 
	add r7, r0, #0
	ldr r0, [sp, #0x18]
	add r1, r7, #0
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	beq _0204B5C6
	ldr r0, [sp, #0x10]
	add r1, r7, #0
	add r2, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [sp, #0xc]
	add r2, r6, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldrb r1, [r5]
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #8]
	add r1, r1, #1
	bl BufferString
	ldrb r0, [r5]
	add r0, r0, #1
	strb r0, [r5]
_0204B5C6:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0x12
	blo _0204B58C
	ldr r0, [sp, #0x10]
	bl DestroyMsgData
	ldr r0, [sp, #0x1c]
	bl String_Delete
	add r0, r6, #0
	bl String_Delete
	ldr r0, [sp, #0x14]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0204B538

	thumb_func_start sub_0204B5E8
sub_0204B5E8: ; 0x0204B5E8
	ldr r3, _0204B608 ; =_020FBFEC
	mov r2, #0
_0204B5EC:
	ldrh r1, [r3]
	cmp r0, r1
	bne _0204B5FA
	ldr r0, _0204B60C ; =_020FBFEE
	lsl r1, r2, #2
	ldrh r0, [r0, r1]
	bx lr
_0204B5FA:
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, #0x3f
	blo _0204B5EC
	mov r0, #3
	bx lr
	nop
_0204B608: .word _020FBFEC
_0204B60C: .word _020FBFEE
	thumb_func_end sub_0204B5E8

	thumb_func_start sub_0204B610
sub_0204B610: ; 0x0204B610
	push {r3, r4}
	add r0, #0xa0
	ldr r3, [r0]
	ldrh r0, [r1]
	mov r2, #0
	strb r0, [r3, #0x12]
	ldrh r0, [r1, #2]
	strh r0, [r3, #0x16]
	ldrh r0, [r1, #4]
	strh r0, [r3, #0x18]
	ldrh r0, [r1, #6]
	mov r1, #0xe0
	strh r0, [r3, #0x14]
	ldrb r0, [r3, #0x10]
	bic r0, r1
	ldrb r1, [r3, #0x12]
	add r1, r1, #5
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r3, #0x10]
	ldrh r4, [r3, #0x16]
	ldrh r1, [r3, #0x2e]
	cmp r1, r4
	beq _0204B64C
	ldrh r0, [r3, #0x18]
	cmp r1, r0
	bne _0204B652
_0204B64C:
	add r0, r2, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
_0204B652:
	ldrh r1, [r3, #0x30]
	cmp r1, r4
	beq _0204B65E
	ldrh r0, [r3, #0x18]
	cmp r1, r0
	bne _0204B664
_0204B65E:
	add r0, r2, #2
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
_0204B664:
	add r0, r2, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0204B610

	thumb_func_start sub_0204B66C
sub_0204B66C: ; 0x0204B66C
	push {r3, r4, r5, lr}
	add r0, #0xa0
	add r5, r1, #0
	ldr r4, [r0]
	bl sub_0203769C
	cmp r0, #0
	bne _0204B680
	mov r0, #0
	pop {r3, r4, r5, pc}
_0204B680:
	add r4, #0x3e
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x1c
	bl MI_CpuCopy8
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0204B66C

	thumb_func_start sub_0204B690
sub_0204B690: ; 0x0204B690
	add r0, #0xa0
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bne _0204B6A2
	ldrh r0, [r1]
	cmp r0, #0
	beq _0204B6A6
_0204B6A2:
	mov r0, #1
	bx lr
_0204B6A6:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0204B690

	thumb_func_start sub_0204B6AC
sub_0204B6AC: ; 0x0204B6AC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r6, r0, #0
	add r0, r4, #0
	bl Save_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	ldr r1, _0204B700 ; =0x0000083E
	strh r0, [r6, r1]
	add r0, r4, #0
	bl SaveArray_Party_Get
	add r7, r0, #0
	mov r4, #0
	add r5, r6, #0
_0204B6CC:
	add r1, r6, r4
	add r1, #0x2a
	ldrb r1, [r1]
	add r0, r7, #0
	bl Party_GetMonByIndex
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x21
	lsl r1, r1, #6
	strh r0, [r5, r1]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #2
	blt _0204B6CC
	ldr r0, [r6, #0x74]
	mov r1, #3
	mov r2, #0
	bl sub_0202D57C
	ldr r1, _0204B704 ; =0x00000844
	strh r0, [r6, r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0204B700: .word 0x0000083E
_0204B704: .word 0x00000844
	thumb_func_end sub_0204B6AC

	thumb_func_start sub_0204B708
sub_0204B708: ; 0x0204B708
	ldr r1, _0204B718 ; =0x0000083E
	add r2, r0, #0
	add r1, r2, r1
	ldr r3, _0204B71C ; =MI_CpuCopy8
	add r0, #0x3e
	mov r2, #0x1c
	bx r3
	nop
_0204B718: .word 0x0000083E
_0204B71C: .word MI_CpuCopy8
	thumb_func_end sub_0204B708

	thumb_func_start sub_0204B720
sub_0204B720: ; 0x0204B720
	ldrb r3, [r0, #0x10]
	mov r2, #8
	bic r3, r2
	lsl r2, r1, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1c
	orr r2, r3
	strb r2, [r0, #0x10]
	ldr r2, _0204B738 ; =0x0000083E
	strh r1, [r0, r2]
	bx lr
	.balign 4, 0
_0204B738: .word 0x0000083E
	thumb_func_end sub_0204B720

	thumb_func_start sub_0204B73C
sub_0204B73C: ; 0x0204B73C
	push {r3, r4, r5, lr}
	cmp r3, #0
	bne _0204B75A
	cmp r1, #2
	bne _0204B74E
	cmp r2, #6
	bne _0204B74E
	ldr r0, _0204B7B8 ; =0x00000131
	pop {r3, r4, r5, pc}
_0204B74E:
	cmp r1, #6
	bne _0204B75A
	cmp r2, #6
	bne _0204B75A
	ldr r0, _0204B7BC ; =0x00000132
	pop {r3, r4, r5, pc}
_0204B75A:
	cmp r1, #7
	bhs _0204B7A6
	cmp r2, #6
	bne _0204B784
	lsl r5, r1, #2
	ldr r1, _0204B7C0 ; =_020FBFCC
	ldrh r4, [r1, r5]
	bl sub_0204B510
	ldr r1, _0204B7C4 ; =_020FBFCE
	ldrh r1, [r1, r5]
	sub r1, r1, r4
	add r1, r1, #1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl _s32_div_f
	add r0, r4, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, pc}
_0204B784:
	lsl r4, r1, #2
	ldr r1, _0204B7C8 ; =_020FBFAC
	ldrh r5, [r1, r4]
	bl sub_0204B510
	ldr r1, _0204B7CC ; =_020FBFAE
	ldrh r1, [r1, r4]
	sub r1, r1, r5
	add r1, r1, #1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl _s32_div_f
	add r0, r5, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, pc}
_0204B7A6:
	bl sub_0204B510
	mov r1, #0x64
	bl _s32_div_f
	add r1, #0xc8
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0204B7B8: .word 0x00000131
_0204B7BC: .word 0x00000132
_0204B7C0: .word _020FBFCC
_0204B7C4: .word _020FBFCE
_0204B7C8: .word _020FBFAC
_0204B7CC: .word _020FBFAE
	thumb_func_end sub_0204B73C

	thumb_func_start sub_0204B7D0
sub_0204B7D0: ; 0x0204B7D0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r6, r2, #0
	mov r1, #0x1b
	add r5, r0, #0
	mov r0, #1
	add r2, r1, #0
	add r3, r6, #0
	bl NewMsgDataFromNarc
	mov r2, #0x11
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #4
	bl MI_CpuFill8
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0204BC7C
	add r6, r0, #0
	ldr r0, _0204B830 ; =0x0000FFFF
	str r4, [r5]
	strh r0, [r5, #0x18]
	lsl r0, r4, #1
	add r0, r4, r0
	strh r0, [r5, #0x1a]
	ldrh r0, [r6]
	add r1, r4, #0
	strh r0, [r5, #4]
	add r0, r7, #0
	bl NewString_ReadMsgData
	add r5, #8
	add r4, r0, #0
	add r1, r5, #0
	mov r2, #8
	bl CopyStringToU16Array
	add r0, r4, #0
	bl String_Delete
	add r0, r7, #0
	bl DestroyMsgData
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204B830: .word 0x0000FFFF
	thumb_func_end sub_0204B7D0

	thumb_func_start sub_0204B834
sub_0204B834: ; 0x0204B834
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	add r4, r0, #0
	add r6, r2, #0
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x38
	str r3, [sp]
	bl MI_CpuFill8
	add r0, sp, #8
	add r1, r6, #0
	bl sub_0204BC8C
	add r2, sp, #8
	ldrh r0, [r5]
	ldr r1, _0204B9DC ; =0xFFFFF800
	ldrh r3, [r2]
	and r0, r1
	lsr r1, r1, #0x15
	and r1, r3
	orr r0, r1
	strh r0, [r5]
	ldrh r1, [r5]
	ldr r0, _0204B9E0 ; =0xFFFF07FF
	and r1, r0
	ldrh r0, [r2, #0xe]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r5]
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _0204B886
	add r0, sp, #0x20
	ldrb r0, [r0, #0x18]
	lsl r1, r0, #1
	ldr r0, _0204B9E4 ; =_020FBFA4
	ldrh r0, [r0, r1]
	b _0204B888
_0204B886:
	ldrh r0, [r2, #0xc]
_0204B888:
	strh r0, [r5, #2]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	add r1, sp, #8
	add r2, r5, #0
	add r3, r0, #0
_0204B896:
	ldrh r6, [r1, #2]
	strh r6, [r2, #4]
	ldrh r6, [r1, #2]
	cmp r6, #0xda
	bne _0204B8A2
	str r3, [sp, #4]
_0204B8A2:
	add r0, r0, #1
	add r1, r1, #2
	add r2, r2, #2
	cmp r0, #4
	blt _0204B896
	ldr r0, [sp]
	ldr r7, [sp, #0x30]
	str r0, [r5, #0xc]
	cmp r7, #0
	bne _0204B8E8
_0204B8B6:
	add r0, r4, #0
	bl sub_0204B510
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0204B510
	lsl r0, r0, #0x10
	add r7, r6, #0
	orr r7, r0
	add r0, r7, #0
	bl GetNatureFromPersonality
	add r1, sp, #8
	ldrb r1, [r1, #0xb]
	cmp r1, r0
	bne _0204B8B6
	ldr r0, [sp]
	add r1, r7, #0
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #1
	beq _0204B8B6
	str r7, [r5, #0x10]
	b _0204B8EA
_0204B8E8:
	str r7, [r5, #0x10]
_0204B8EA:
	add r0, sp, #0x20
	ldrb r1, [r0, #0x14]
	ldr r2, [r5, #0x14]
	mov r0, #0x1f
	bic r2, r0
	mov r0, #0x1f
	and r0, r1
	orr r2, r0
	ldr r0, _0204B9E8 ; =0xFFFFFC1F
	mov r6, #0
	and r2, r0
	lsl r0, r1, #0x1b
	lsr r1, r0, #0x16
	orr r2, r1
	ldr r1, _0204B9EC ; =0xFFFF83FF
	add r4, r6, #0
	and r2, r1
	lsr r1, r0, #0x11
	orr r2, r1
	ldr r1, _0204B9F0 ; =0xFFF07FFF
	and r2, r1
	lsr r1, r0, #0xc
	orr r2, r1
	ldr r1, _0204B9F4 ; =0xFE0FFFFF
	and r2, r1
	lsr r1, r0, #7
	orr r2, r1
	ldr r1, _0204B9F8 ; =0xC1FFFFFF
	lsr r0, r0, #2
	and r1, r2
	orr r0, r1
	str r0, [r5, #0x14]
_0204B92A:
	add r0, r4, #0
	bl MaskOfFlagNo
	add r1, sp, #8
	ldrb r1, [r1, #0xa]
	tst r0, r1
	beq _0204B93A
	add r6, r6, #1
_0204B93A:
	add r4, r4, #1
	cmp r4, #6
	blt _0204B92A
	ldr r0, _0204B9FC ; =0x000001FE
	add r1, r6, #0
	bl _s32_div_f
	cmp r0, #0xff
	ble _0204B94E
	mov r0, #0xff
_0204B94E:
	lsl r0, r0, #0x18
	mov r4, #0
	lsr r6, r0, #0x18
_0204B954:
	add r0, r4, #0
	bl MaskOfFlagNo
	add r1, sp, #8
	ldrb r1, [r1, #0xa]
	tst r0, r1
	beq _0204B966
	add r0, r5, r4
	strb r6, [r0, #0x18]
_0204B966:
	add r4, r4, #1
	cmp r4, #6
	blt _0204B954
	mov r0, #0
	strb r0, [r5, #0x1e]
	ldr r0, _0204BA00 ; =gGameLanguage
	mov r1, #0x19
	ldrb r0, [r0]
	strb r0, [r5, #0x1f]
	ldrh r0, [r5]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	bl GetMonBaseStat
	cmp r0, #0
	beq _0204B9AA
	ldr r2, [r5, #0x10]
	mov r1, #1
	tst r1, r2
	beq _0204B996
	add r1, r5, #0
	add r1, #0x20
	strb r0, [r1]
	b _0204B9BC
_0204B996:
	ldrh r0, [r5]
	mov r1, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	bl GetMonBaseStat
	add r1, r5, #0
	add r1, #0x20
	strb r0, [r1]
	b _0204B9BC
_0204B9AA:
	ldrh r0, [r5]
	mov r1, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	bl GetMonBaseStat
	add r1, r5, #0
	add r1, #0x20
	strb r0, [r1]
_0204B9BC:
	add r1, r5, #0
	ldr r0, [sp, #4]
	add r1, #0x21
	strb r0, [r1]
	ldrh r0, [r5]
	add r5, #0x22
	ldr r1, [sp, #0x40]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	add r2, r5, #0
	bl GetSpeciesNameIntoArray
	add r0, r7, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0204B9DC: .word 0xFFFFF800
_0204B9E0: .word 0xFFFF07FF
_0204B9E4: .word _020FBFA4
_0204B9E8: .word 0xFFFFFC1F
_0204B9EC: .word 0xFFFF83FF
_0204B9F0: .word 0xFFF07FFF
_0204B9F4: .word 0xFE0FFFFF
_0204B9F8: .word 0xC1FFFFFF
_0204B9FC: .word 0x000001FE
_0204BA00: .word gGameLanguage
	thumb_func_end sub_0204B834

	thumb_func_start sub_0204BA04
sub_0204BA04: ; 0x0204BA04
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r2, #0
	add r5, r1, #0
	str r0, [sp, #0x14]
	ldr r2, [sp, #0x3c]
	add r6, r3, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0204B7D0
	add r7, r0, #0
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x30]
	add r5, #0x30
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	add r1, r7, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x38]
	add r2, r4, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	add r3, r5, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	bl sub_0204BABC
	add r4, r0, #0
	add r0, r7, #0
	bl FreeToHeap
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204BA04

	thumb_func_start sub_0204BA50
sub_0204BA50: ; 0x0204BA50
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x38]
	add r5, r1, #0
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	add r4, r2, #0
	str r0, [sp, #0x3c]
	ldr r2, [sp, #0x3c]
	add r0, r5, #0
	add r1, r4, #0
	str r3, [sp, #0x18]
	bl sub_0204B7D0
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl sub_0204B4D4
	ldr r6, [sp, #0x38]
	str r0, [sp, #0x20]
	mov r7, #0
	add r4, r6, #0
	add r5, #0x30
_0204BA80:
	ldr r0, [r6, #8]
	ldr r3, [sp, #0x38]
	str r0, [sp]
	ldr r0, [sp, #0x20]
	add r1, r5, #0
	str r0, [sp, #4]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0x10]
	ldrh r2, [r4, #4]
	ldr r0, [sp, #0x14]
	ldr r3, [r3]
	bl sub_0204B834
	add r7, r7, #1
	add r6, r6, #4
	add r4, r4, #2
	add r5, #0x38
	cmp r7, #2
	blt _0204BA80
	ldr r0, [sp, #0x1c]
	bl FreeToHeap
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204BA50

	thumb_func_start sub_0204BABC
sub_0204BABC: ; 0x0204BABC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x94]
	str r2, [sp, #0x1c]
	str r0, [sp, #0x94]
	ldr r0, [sp, #0x98]
	str r1, [sp, #0x18]
	str r0, [sp, #0x98]
	ldr r0, [sp, #0x9c]
	str r3, [sp, #0x20]
	str r0, [sp, #0x9c]
	ldr r0, [sp, #0xa0]
	str r0, [sp, #0xa0]
	mov r0, #0
	str r0, [sp, #0x28]
	add r0, sp, #0x80
	ldrb r0, [r0, #0x10]
	cmp r0, #4
	bls _0204BAE8
	bl GF_AssertFail
_0204BAE8:
	add r0, sp, #0x80
	ldrb r6, [r0, #0x10]
	mov r4, #0
	str r4, [sp, #0x2c]
	cmp r6, #0
	beq _0204BBDA
	add r0, sp, #0x6c
	str r0, [sp, #0x24]
_0204BAF8:
	ldr r0, [sp, #0x14]
	bl sub_0204B510
	ldr r1, [sp, #0x18]
	ldrh r1, [r1, #2]
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r1, r0, #0x17
	ldr r0, [sp, #0x18]
	add r0, r0, r1
	ldrh r0, [r0, #4]
	str r0, [sp, #0x30]
	ldr r1, [sp, #0x30]
	add r0, sp, #0x3c
	bl sub_0204BC8C
	mov r7, #0
	cmp r4, #0
	ble _0204BB3C
	add r5, sp, #0x6c
_0204BB22:
	ldr r1, [r5]
	add r0, sp, #0x4c
	bl sub_0204BC8C
	add r0, sp, #0x3c
	ldrh r1, [r0, #0x10]
	ldrh r0, [r0]
	cmp r1, r0
	beq _0204BB3C
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, r4
	blt _0204BB22
_0204BB3C:
	cmp r7, r4
	bne _0204BBD6
	ldr r0, [sp, #0x94]
	cmp r0, #0
	beq _0204BB64
	mov r3, #0
	cmp r6, #0
	ble _0204BB60
	add r1, r0, #0
	add r0, sp, #0x3c
	ldrh r2, [r0]
_0204BB52:
	ldrh r0, [r1]
	cmp r2, r0
	beq _0204BB60
	add r3, r3, #1
	add r1, r1, #2
	cmp r3, r6
	blt _0204BB52
_0204BB60:
	cmp r3, r6
	bne _0204BBD6
_0204BB64:
	ldr r0, [sp, #0x2c]
	cmp r0, #0x32
	bge _0204BBCC
	mov r7, #0
	cmp r4, #0
	ble _0204BB90
	add r5, sp, #0x6c
_0204BB72:
	ldr r1, [r5]
	add r0, sp, #0x4c
	bl sub_0204BC8C
	add r0, sp, #0x3c
	ldrh r1, [r0, #0x1c]
	cmp r1, #0
	beq _0204BB88
	ldrh r0, [r0, #0xc]
	cmp r1, r0
	beq _0204BB90
_0204BB88:
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, r4
	blt _0204BB72
_0204BB90:
	cmp r7, r4
	beq _0204BB9C
	ldr r0, [sp, #0x2c]
	add r0, r0, #1
	str r0, [sp, #0x2c]
	b _0204BBD6
_0204BB9C:
	ldr r0, [sp, #0x98]
	cmp r0, #0
	beq _0204BBCC
	mov r3, #0
	cmp r6, #0
	ble _0204BBC0
	add r1, r0, #0
	add r0, sp, #0x3c
	ldrh r2, [r0, #0xc]
_0204BBAE:
	ldrh r0, [r1]
	cmp r2, r0
	bne _0204BBB8
	cmp r0, #0
	bne _0204BBC0
_0204BBB8:
	add r3, r3, #1
	add r1, r1, #2
	cmp r3, r6
	blt _0204BBAE
_0204BBC0:
	cmp r3, r6
	beq _0204BBCC
	ldr r0, [sp, #0x2c]
	add r0, r0, #1
	str r0, [sp, #0x2c]
	b _0204BBD6
_0204BBCC:
	ldr r1, [sp, #0x30]
	ldr r0, [sp, #0x24]
	add r4, r4, #1
	stmia r0!, {r1}
	str r0, [sp, #0x24]
_0204BBD6:
	cmp r4, r6
	bne _0204BAF8
_0204BBDA:
	ldr r0, [sp, #0x1c]
	bl sub_0204B4D4
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x14]
	bl sub_0204B510
	add r5, r0, #0
	ldr r0, [sp, #0x14]
	bl sub_0204B510
	lsl r0, r0, #0x10
	orr r0, r5
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x2c]
	cmp r0, #0x32
	blt _0204BC00
	mov r0, #1
	str r0, [sp, #0x28]
_0204BC00:
	mov r5, #0
	cmp r4, #0
	ble _0204BC40
	add r7, sp, #0x6c
	add r6, sp, #0x5c
_0204BC0A:
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x20]
	str r0, [sp, #4]
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x34]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0xa0]
	str r0, [sp, #0x10]
	ldr r2, [r7]
	ldr r0, [sp, #0x14]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	bl sub_0204B834
	stmia r6!, {r0}
	ldr r0, [sp, #0x20]
	add r5, r5, #1
	add r0, #0x38
	add r7, r7, #4
	str r0, [sp, #0x20]
	cmp r5, r4
	blt _0204BC0A
_0204BC40:
	ldr r0, [sp, #0x9c]
	cmp r0, #0
	bne _0204BC4C
	ldr r0, [sp, #0x28]
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
_0204BC4C:
	ldr r1, [sp, #0x34]
	ldr r2, [sp, #0x9c]
	str r1, [r0]
	mov r3, #0
	add r0, sp, #0x6c
	add r1, sp, #0x5c
_0204BC58:
	ldr r5, [r0]
	ldr r4, [sp, #0x9c]
	add r3, r3, #1
	strh r5, [r4, #4]
	ldr r4, [r1]
	add r0, r0, #4
	str r4, [r2, #8]
	ldr r4, [sp, #0x9c]
	add r1, r1, #4
	add r4, r4, #2
	add r2, r2, #4
	str r4, [sp, #0x9c]
	cmp r3, #2
	blt _0204BC58
	ldr r0, [sp, #0x28]
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204BABC

	thumb_func_start sub_0204BC7C
sub_0204BC7C: ; 0x0204BC7C
	add r3, r0, #0
	add r2, r1, #0
	add r1, r3, #0
	ldr r3, _0204BC88 ; =AllocAndReadWholeNarcMemberByIdPair
	mov r0, #0xcc
	bx r3
	.balign 4, 0
_0204BC88: .word AllocAndReadWholeNarcMemberByIdPair
	thumb_func_end sub_0204BC7C

	thumb_func_start sub_0204BC8C
sub_0204BC8C: ; 0x0204BC8C
	ldr r3, _0204BC94 ; =ReadWholeNarcMemberByIdPair
	add r2, r1, #0
	mov r1, #0xcd
	bx r3
	.balign 4, 0
_0204BC94: .word ReadWholeNarcMemberByIdPair
	thumb_func_end sub_0204BC8C
