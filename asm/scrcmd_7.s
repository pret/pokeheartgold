	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02049460
sub_02049460: ; 0x02049460
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	bne _020494C0
	add r0, r4, #0
	mov r1, #0x19
	bl sub_020402F0
	str r0, [sp, #0x18]
	add r0, r4, #0
	mov r1, #0x1a
	bl sub_020402F0
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0x1b
	bl sub_020402F0
	add r0, r4, #0
	mov r1, #0x1c
	bl sub_020402F0
	add r0, r4, #0
	mov r1, #0x1d
	bl sub_020402F0
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #0x1e
	bl sub_020402F0
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x1f
	bl sub_020402F0
	b _02049500
_020494C0:
	add r0, r4, #0
	mov r1, #0x20
	bl sub_020402F0
	str r0, [sp, #0x18]
	add r0, r4, #0
	mov r1, #0x21
	bl sub_020402F0
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0x22
	bl sub_020402F0
	add r0, r4, #0
	mov r1, #0x23
	bl sub_020402F0
	add r0, r4, #0
	mov r1, #0x24
	bl sub_020402F0
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #0x25
	bl sub_020402F0
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x26
	bl sub_020402F0
_02049500:
	add r7, r0, #0
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x10]
	ldr r0, [r0]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	ldr r1, [r6]
	ldr r2, [r4, #0x40]
	ldr r3, [r3]
	add r0, r4, #0
	bl sub_0206457C
	str r0, [r7]
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02049460

	thumb_func_start sub_0204952C
sub_0204952C: ; 0x0204952C
	push {r4, r5, r6, lr}
	add r5, r0, #0
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
	bl GetVarPointer
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4]
	cmp r6, #0
	bne _0204956A
	add r5, #0x80
	ldr r0, [r5]
	mov r1, #0x1f
	bl sub_020402F0
	b _02049574
_0204956A:
	add r5, #0x80
	ldr r0, [r5]
	mov r1, #0x26
	bl sub_020402F0
_02049574:
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	bne _02049582
	mov r0, #1
	strh r0, [r4]
	pop {r4, r5, r6, pc}
_02049582:
	bl sub_02064598
	cmp r0, #1
	bne _02049598
	ldr r0, [r5]
	bl sub_020645AC
	mov r0, #0
	str r0, [r5]
	mov r0, #1
	strh r0, [r4]
_02049598:
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0204952C

	thumb_func_start sub_0204959C
sub_0204959C: ; 0x0204959C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x1d
	bl sub_020402F0
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	ldrh r1, [r5]
	strh r1, [r0]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0204959C

	thumb_func_start sub_020495C4
sub_020495C4: ; 0x020495C4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x1c
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x23
	bl sub_020402F0
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
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	cmp r7, #0
	bne _0204960E
	ldrh r1, [r4]
	b _02049610
_0204960E:
	ldrh r1, [r6]
_02049610:
	strh r1, [r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020495C4

	thumb_func_start sub_02049618
sub_02049618: ; 0x02049618
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #8
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldrh r0, [r4]
	bl sub_020404C8
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02049618

	thumb_func_start sub_02049648
sub_02049648: ; 0x02049648
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r0, #0x80
	ldr r7, [r0]
	mov r1, #8
	add r0, r7, #0
	bl sub_020402F0
	add r0, r7, #0
	mov r1, #0x18
	bl sub_020402F0
	str r0, [sp, #0x1c]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0x10]
	ldr r0, [r5, #8]
	add r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0]
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r4, [r1]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066644
	cmp r0, #1
	bne _020496BE
	ldr r0, [r7, #0xc]
	bl SavArray_Flags_get
	bl sub_02066AD0
	str r0, [sp, #0x18]
_020496BE:
	str r6, [sp]
	str r4, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x74]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x18]
	bl sub_02051370
	mov r0, #1
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02049648

	thumb_func_start sub_020496DC
sub_020496DC: ; 0x020496DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x18
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
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
	bl VarGet
	add r2, r0, #0
	ldr r0, [r5, #8]
	add r3, r6, #0
	add r1, r0, #1
	str r1, [r5, #8]
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r0]
	add r1, r7, #0
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [r5, #0x74]
	bl sub_02051370
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020496DC

	thumb_func_start sub_02049750
sub_02049750: ; 0x02049750
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #8
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldrh r0, [r4]
	bl sub_020404C8
	bl sub_02040500
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _020497B2
	mov r0, #0
	mov r1, #2
	add r2, r0, #0
	b _020497CC
_020497B2:
	ldrh r0, [r4]
	bl sub_020404EC
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _020497C6
	mov r0, #3
	mov r1, #5
	mov r2, #6
	b _020497CC
_020497C6:
	mov r0, #7
	mov r1, #9
	mov r2, #0xa
_020497CC:
	strh r0, [r7]
	strh r1, [r6]
	strh r2, [r5]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02049750

	thumb_func_start sub_020497D8
sub_020497D8: ; 0x020497D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #8
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldrh r0, [r4]
	bl sub_020404C8
	bl sub_02040500
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _0204983A
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	b _02049854
_0204983A:
	ldrh r0, [r4]
	bl sub_020404EC
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _0204984E
	mov r0, #0x12
	mov r1, #0
	mov r2, #6
	b _02049854
_0204984E:
	mov r0, #0x13
	mov r1, #0
	mov r2, #0xa
_02049854:
	strh r0, [r7]
	strh r1, [r6]
	strh r2, [r5]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020497D8

	thumb_func_start sub_02049860
sub_02049860: ; 0x02049860
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #8
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldrh r0, [r4]
	bl sub_020404C8
	bl sub_02040500
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02049860

	thumb_func_start sub_02049894
sub_02049894: ; 0x02049894
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	bl MapHeader_IsKanto
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02055098
	bl sub_02005304
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02049894

	thumb_func_start sub_020498C8
sub_020498C8: ; 0x020498C8
	push {r3, lr}
	ldr r0, [r0, #0x74]
	bl sub_0205297C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020498C8

	thumb_func_start sub_020498D4
sub_020498D4: ; 0x020498D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x18
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02052554
	strh r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020498D4

	thumb_func_start sub_02049904
sub_02049904: ; 0x02049904
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	ldr r1, [r5, #8]
	add r4, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r0, [r1]
	cmp r0, #1
	bne _02049936
	add r5, #0x80
	ldr r0, [r5]
	ldr r1, _0204994C ; =0x00004013
	bl VarGet
	bl sub_02052564
	b _02049946
_02049936:
	add r5, #0x80
	ldr r0, [r5]
	mov r1, #0x18
	bl sub_020402F0
	ldr r0, [r0]
	bl sub_02052564
_02049946:
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0204994C: .word 0x00004013
	thumb_func_end sub_02049904

	thumb_func_start sub_02049950
sub_02049950: ; 0x02049950
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x18
	bl sub_020402F0
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_02052574
	strh r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02049950

	thumb_func_start sub_02049980
sub_02049980: ; 0x02049980
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
	bl SavArray_PlayerParty_get
	bl HasEnoughAlivePokemonForDoubleBattle
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02049980

	thumb_func_start sub_020499AC
sub_020499AC: ; 0x020499AC
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x18
	bl sub_020402F0
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	mov r1, #0xb
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x74]
	mov r1, #1
	add r3, r2, #0
	bl sub_02051370
	mov r0, #1
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end sub_020499AC

	thumb_func_start sub_020499D8
sub_020499D8: ; 0x020499D8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xa
	bl sub_020402F0
	ldr r0, [r0]
	bl sub_0205F24C
	add r1, r0, #0
	add r4, #0x80
	ldr r0, [r4]
	lsl r1, r1, #0x10
	ldr r0, [r0, #0xc]
	lsr r1, r1, #0x10
	bl sub_0204052C
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_020499D8

	thumb_func_start sub_02049A00
sub_02049A00: ; 0x02049A00
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0xa
	add r0, r5, #0
	bl sub_020402F0
	add r4, r0, #0
	add r0, r7, #0
	bl ScriptReadWord
	add r6, r0, #0
	ldr r0, [r4]
	bl sub_0205F24C
	add r1, r0, #0
	lsl r1, r1, #0x10
	ldr r0, [r5, #0xc]
	lsr r1, r1, #0x10
	bl sub_02040514
	cmp r0, #1
	bne _02049A3E
	ldr r1, [r7, #8]
	add r0, r7, #0
	add r1, r1, r6
	bl ScriptJump
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02049A3E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02049A00
