	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FBF70:
	.short 0x008D
	.short 0x0091
	.short 0x008E
	.short 0x008F
	.short 0x0090

	.text

	thumb_func_start sub_02049CA8
sub_02049CA8: ; 0x02049CA8
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
	bl ScriptEnvironment_GetSav2Ptr
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0204A824
	add r5, #0x80
	ldr r1, [r5]
	add r1, #0xa0
	str r0, [r1]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02049CA8

	thumb_func_start sub_02049CD8
sub_02049CD8: ; 0x02049CD8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	add r0, #0xa0
	bl sub_0204A810
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02049CD8

	thumb_func_start sub_02049CE8
sub_02049CE8: ; 0x02049CE8
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
	thumb_func_end sub_02049CE8

	thumb_func_start sub_02049D04
sub_02049D04: ; 0x02049D04
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
	bl sub_020402F0
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
	bl sub_020402F0
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
	bl MIi_CpuFill8
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
	thumb_func_end sub_02049D04

	thumb_func_start sub_02049FC8
sub_02049FC8: ; 0x02049FC8
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
	thumb_func_end sub_02049FC8

	thumb_func_start sub_0204A048
sub_0204A048: ; 0x0204A048
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
	thumb_func_end sub_0204A048

	thumb_func_start sub_0204A070
sub_0204A070: ; 0x0204A070
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
	thumb_func_end sub_0204A070

	thumb_func_start sub_0204A098
sub_0204A098: ; 0x0204A098
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
	thumb_func_end sub_0204A098

	thumb_func_start sub_0204A184
sub_0204A184: ; 0x0204A184
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
	thumb_func_end sub_0204A184

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

	thumb_func_start sub_0204A230
sub_0204A230: ; 0x0204A230
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
	thumb_func_end sub_0204A230

	thumb_func_start sub_0204A27C
sub_0204A27C: ; 0x0204A27C
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
	thumb_func_end sub_0204A27C

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

	thumb_func_start sub_0204A2EC
sub_0204A2EC: ; 0x0204A2EC
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
	bl sub_0202D918
	mov r1, #0
	add r2, r1, #0
	bl sub_0202D3F8
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0204A2EC

	thumb_func_start sub_0204A31C
sub_0204A31C: ; 0x0204A31C
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
	bl Sav2_GameStats_get
	mov r1, #0x45
	add r2, r6, #0
	bl sub_0202D144
	add r0, r4, #0
	bl sub_0202D918
	add r1, r6, #0
	mov r2, #5
	bl sub_0202D3F8
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0204A31C

	thumb_func_start sub_0204A360
sub_0204A360: ; 0x0204A360
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
	bl Sav2_GameStats_get
	mov r1, #0x46
	add r2, r6, #0
	bl sub_0202D144
	add r0, r4, #0
	bl sub_0202D918
	add r1, r6, #0
	mov r2, #6
	bl sub_0202D3F8
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0204A360

	thumb_func_start sub_0204A3A4
sub_0204A3A4: ; 0x0204A3A4
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
	bl sub_0202D918
	mov r1, #0
	add r2, r1, #0
	bl sub_0202D3F8
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
	thumb_func_end sub_0204A3A4
