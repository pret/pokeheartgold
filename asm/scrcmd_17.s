	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0204E610
sub_0204E610: ; 0x0204E610
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0202A5F4
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204E610

	thumb_func_start sub_0204E640
sub_0204E640: ; 0x0204E640
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	bl sub_0202A614
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0204E640

	thumb_func_start sub_0204E654
sub_0204E654: ; 0x0204E654
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
	bl sub_0203B9C4
	bl sub_0203B9B4
	bl sub_0205C7C8
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204E654

	thumb_func_start sub_0204E684
sub_0204E684: ; 0x0204E684
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	bl sub_0203B9B4
	mov r1, #1
	bl sub_0205C7DC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0204E684

	thumb_func_start sub_0204E6A0
sub_0204E6A0: ; 0x0204E6A0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	cmp r4, #0x10
	blo _0204E6D2
	bl GF_AssertFail
_0204E6D2:
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r4, #0
	bl PlayerProfile_TestBadgeFlag
	strh r0, [r6]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0204E6A0

	thumb_func_start sub_0204E6E8
sub_0204E6E8: ; 0x0204E6E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	cmp r4, #0x10
	blo _0204E706
	bl GF_AssertFail
_0204E706:
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r4, #0
	bl PlayerProfile_SetBadgeFlag
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204E6E8

	thumb_func_start sub_0204E71C
sub_0204E71C: ; 0x0204E71C
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
	bl SavArray_Flags_get
	bl sub_020665F8
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204E71C

	thumb_func_start sub_0204E748
sub_0204E748: ; 0x0204E748
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
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_CountBadges
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204E748

	thumb_func_start sub_0204E774
sub_0204E774: ; 0x0204E774
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_020665EC
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0204E774

	thumb_func_start sub_0204E788
sub_0204E788: ; 0x0204E788
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
	bl SavArray_Flags_get
	bl sub_02066644
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204E788

	thumb_func_start sub_0204E7B4
sub_0204E7B4: ; 0x0204E7B4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066624
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0204E7B4

	thumb_func_start sub_0204E7C8
sub_0204E7C8: ; 0x0204E7C8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066634
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0204E7C8

	thumb_func_start sub_0204E7DC
sub_0204E7DC: ; 0x0204E7DC
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
	bl SavArray_Flags_get
	bl sub_020666B4
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204E7DC

	thumb_func_start sub_0204E808
sub_0204E808: ; 0x0204E808
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	cmp r1, #0
	beq _0204E826
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066694
	b _0204E834
_0204E826:
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_020666A4
_0204E834:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0204E808

	thumb_func_start sub_0204E838
sub_0204E838: ; 0x0204E838
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
	bl SavArray_Flags_get
	bl sub_02066684
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204E838

	thumb_func_start sub_0204E864
sub_0204E864: ; 0x0204E864
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066664
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0204E864

	thumb_func_start sub_0204E878
sub_0204E878: ; 0x0204E878
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066674
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0204E878

	thumb_func_start sub_0204E88C
sub_0204E88C: ; 0x0204E88C
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
	bl SavArray_Flags_get
	bl sub_02066614
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204E88C

	thumb_func_start sub_0204E8B8
sub_0204E8B8: ; 0x0204E8B8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066604
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0204E8B8

	thumb_func_start sub_0204E8CC
sub_0204E8CC: ; 0x0204E8CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	ldr r2, [r5, #8]
	add r4, r0, #0
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	cmp r1, #0
	beq _0204E8FA
	cmp r1, #1
	beq _0204E8F2
	cmp r1, #2
	beq _0204E902
	b _0204E920
_0204E8F2:
	mov r1, #1
	bl sub_020668C0
	b _0204E924
_0204E8FA:
	mov r1, #0
	bl sub_020668C0
	b _0204E924
_0204E902:
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #2
	bl sub_020668C0
	strh r0, [r5]
	b _0204E924
_0204E920:
	bl GF_AssertFail
_0204E924:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0204E8CC

	thumb_func_start sub_0204E928
sub_0204E928: ; 0x0204E928
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	ldr r2, [r5, #8]
	add r4, r0, #0
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	cmp r1, #0
	beq _0204E954
	cmp r1, #1
	beq _0204E94E
	cmp r1, #2
	beq _0204E95A
	b _0204E976
_0204E94E:
	bl sub_020668D0
	b _0204E97A
_0204E954:
	bl sub_020668E0
	b _0204E97A
_0204E95A:
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl sub_020668F0
	strh r0, [r5]
	b _0204E97A
_0204E976:
	bl GF_AssertFail
_0204E97A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204E928

	thumb_func_start sub_0204E980
sub_0204E980: ; 0x0204E980
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	ldr r2, [r5, #8]
	add r4, r0, #0
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	cmp r1, #0
	beq _0204E9AC
	cmp r1, #1
	beq _0204E9A6
	cmp r1, #2
	beq _0204E9B2
	b _0204E9CE
_0204E9A6:
	bl sub_02066900
	b _0204E9D2
_0204E9AC:
	bl sub_02066910
	b _0204E9D2
_0204E9B2:
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02066920
	strh r0, [r5]
	b _0204E9D2
_0204E9CE:
	bl GF_AssertFail
_0204E9D2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204E980
