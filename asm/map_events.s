	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0203B610
sub_0203B610: ; 0x0203B610
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	add r4, r1, #0
	cmp r0, #0
	beq _0203B620
	bl GF_AssertFail
_0203B620:
	ldr r1, _0203B62C ; =0x000009E4
	add r0, r4, #0
	bl AllocFromHeap
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203B62C: .word 0x000009E4
	thumb_func_end sub_0203B610

	thumb_func_start sub_0203B630
sub_0203B630: ; 0x0203B630
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0203B63E
	bl GF_AssertFail
_0203B63E:
	ldr r0, [r4, #0x14]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203B630

	thumb_func_start sub_0203B648
sub_0203B648: ; 0x0203B648
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	add r4, r1, #0
	cmp r0, #0
	bne _0203B658
	bl GF_AssertFail
_0203B658:
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl MapEvents_ReadFromNarc
	ldr r0, [r5, #0x14]
	bl MapEvents_ComputeRamHeader
	mov r0, #0x92
	ldr r1, [r5, #0x14]
	lsl r0, r0, #4
	add r0, r1, r0
	add r1, r4, #0
	bl WildEncounters_ReadFromNarc
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl LevelScripts_ReadFromNarc
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203B648

	thumb_func_start MapEvents_ReadFromNarc
MapEvents_ReadFromNarc: ; 0x0203B680
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl MapHeader_GetEventsBank
	add r4, r0, #0
	mov r0, #0x20
	add r1, r4, #0
	bl GetNarcMemberSizeByIdPair
	mov r1, #2
	lsl r1, r1, #0xa
	cmp r0, r1
	blo _0203B6A0
	bl GF_AssertFail
_0203B6A0:
	add r5, #0x20
	add r0, r5, #0
	mov r1, #0x20
	add r2, r4, #0
	bl ReadWholeNarcMemberByIdPair
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end MapEvents_ReadFromNarc

	thumb_func_start sub_0203B6B0
sub_0203B6B0: ; 0x0203B6B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	ldr r4, [r0, #4]
	cmp r0, #0
	bne _0203B6C0
	bl GF_AssertFail
_0203B6C0:
	cmp r4, #0
	beq _0203B6D4
	ldr r1, [r5, #0x20]
	ldr r3, [r5, #0x14]
	ldr r0, [r5, #0x3c]
	ldr r1, [r1]
	ldr r3, [r3, #0x14]
	add r2, r4, #0
	bl sub_0205E9AC
_0203B6D4:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203B6B0

	thumb_func_start sub_0203B6D8
sub_0203B6D8: ; 0x0203B6D8
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x10]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B6D8

	thumb_func_start sub_0203B6E0
sub_0203B6E0: ; 0x0203B6E0
	ldr r0, [r0, #0x14]
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B6E0

	thumb_func_start sub_0203B6E8
sub_0203B6E8: ; 0x0203B6E8
	ldr r2, [r0, #0x14]
	ldr r0, [r2, #8]
	cmp r1, r0
	blo _0203B6F4
	mov r0, #0
	bx lr
_0203B6F4:
	mov r0, #0xc
	ldr r2, [r2, #0x18]
	mul r0, r1
	add r0, r2, r0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B6E8

	thumb_func_start sub_0203B700
sub_0203B700: ; 0x0203B700
	push {r4, r5, r6, r7}
	ldr r5, [r0, #0x14]
	mov r3, #0
	ldr r0, [r5, #8]
	cmp r0, #0
	bls _0203B732
	ldr r6, [r5, #0x18]
	add r4, r3, #0
	add r0, r6, #0
_0203B712:
	ldrh r7, [r0]
	cmp r1, r7
	bne _0203B726
	add r7, r6, r4
	ldrh r7, [r7, #2]
	cmp r2, r7
	bne _0203B726
	add r0, r3, #0
	pop {r4, r5, r6, r7}
	bx lr
_0203B726:
	ldr r7, [r5, #8]
	add r3, r3, #1
	add r0, #0xc
	add r4, #0xc
	cmp r3, r7
	blo _0203B712
_0203B732:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B700

	thumb_func_start sub_0203B73C
sub_0203B73C: ; 0x0203B73C
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0xc]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B73C

	thumb_func_start sub_0203B744
sub_0203B744: ; 0x0203B744
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x1c]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B744

	thumb_func_start sub_0203B74C
sub_0203B74C: ; 0x0203B74C
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B74C

	thumb_func_start sub_0203B754
sub_0203B754: ; 0x0203B754
	ldr r0, [r0, #0x14]
	ldr r0, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B754

	thumb_func_start sub_0203B75C
sub_0203B75C: ; 0x0203B75C
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, [r0, #0x14]
	add r4, r1, #0
	ldr r5, [r0, #4]
	add r7, r2, #0
	add r1, r3, #0
	mov r2, #0
	ldr r3, [r0, #0x14]
	cmp r5, #0
	bls _0203B78C
	add r6, r3, #0
_0203B772:
	ldrh r0, [r6]
	cmp r4, r0
	bne _0203B784
	lsl r0, r2, #5
	add r0, r3, r0
	strh r7, [r0, #0x18]
	strh r1, [r0, #0x1a]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0203B784:
	add r2, r2, #1
	add r6, #0x20
	cmp r2, r5
	blo _0203B772
_0203B78C:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0203B75C

	thumb_func_start sub_0203B794
sub_0203B794: ; 0x0203B794
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x14]
	mov r3, #0
	ldr r5, [r0, #4]
	ldr r4, [r0, #0x14]
	cmp r5, #0
	bls _0203B7BC
	add r6, r4, #0
_0203B7A4:
	ldrh r0, [r6]
	cmp r1, r0
	bne _0203B7B4
	lsl r0, r3, #5
	add r0, r4, r0
	strh r2, [r0, #0xc]
	mov r0, #1
	pop {r4, r5, r6, pc}
_0203B7B4:
	add r3, r3, #1
	add r6, #0x20
	cmp r3, r5
	blo _0203B7A4
_0203B7BC:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203B794

	thumb_func_start sub_0203B7C4
sub_0203B7C4: ; 0x0203B7C4
	push {r4, r5, r6, lr}
	ldr r0, [r0, #0x14]
	mov r3, #0
	ldr r5, [r0, #4]
	ldr r4, [r0, #0x14]
	cmp r5, #0
	bls _0203B7EC
	add r6, r4, #0
_0203B7D4:
	ldrh r0, [r6]
	cmp r1, r0
	bne _0203B7E4
	lsl r0, r3, #5
	add r0, r4, r0
	strh r2, [r0, #4]
	mov r0, #1
	pop {r4, r5, r6, pc}
_0203B7E4:
	add r3, r3, #1
	add r6, #0x20
	cmp r3, r5
	blo _0203B7D4
_0203B7EC:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203B7C4

	thumb_func_start sub_0203B7F4
sub_0203B7F4: ; 0x0203B7F4
	push {r3, r4}
	ldr r0, [r0, #0x14]
	ldr r4, [r0, #0x18]
	mov r0, #0xc
	mul r0, r1
	strh r2, [r4, r0]
	add r0, r4, r0
	strh r3, [r0, #2]
	mov r0, #1
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203B7F4

	thumb_func_start sub_0203B80C
sub_0203B80C: ; 0x0203B80C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_0203B6D8
	mov r1, #0x14
	mul r1, r5
	add r0, r0, r1
	str r4, [r0, #4]
	str r6, [r0, #8]
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203B80C

	thumb_func_start MapEvents_ComputeRamHeader
MapEvents_ComputeRamHeader: ; 0x0203B828
	add r1, r0, #0
	ldr r2, [r0, #0x20]
	add r1, #0x20
	add r1, r1, #4
	str r2, [r0]
	cmp r2, #0
	beq _0203B83A
	str r1, [r0, #0x10]
	b _0203B83E
_0203B83A:
	mov r2, #0
	str r2, [r0, #0x10]
_0203B83E:
	ldr r3, [r0]
	mov r2, #0x14
	mul r2, r3
	add r3, r1, r2
	ldr r2, [r1, r2]
	add r1, r3, #4
	str r2, [r0, #4]
	cmp r2, #0
	beq _0203B854
	str r1, [r0, #0x14]
	b _0203B858
_0203B854:
	mov r2, #0
	str r2, [r0, #0x14]
_0203B858:
	ldr r2, [r0, #4]
	lsl r2, r2, #5
	add r3, r1, r2
	ldr r2, [r1, r2]
	add r1, r3, #4
	str r2, [r0, #8]
	cmp r2, #0
	beq _0203B86C
	str r1, [r0, #0x18]
	b _0203B870
_0203B86C:
	mov r2, #0
	str r2, [r0, #0x18]
_0203B870:
	ldr r3, [r0, #8]
	mov r2, #0xc
	mul r2, r3
	add r3, r1, r2
	ldr r1, [r1, r2]
	str r1, [r0, #0xc]
	cmp r1, #0
	beq _0203B886
	add r1, r3, #4
	str r1, [r0, #0x1c]
	bx lr
_0203B886:
	mov r1, #0
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end MapEvents_ComputeRamHeader

	thumb_func_start WildEncounters_ReadFromNarc
WildEncounters_ReadFromNarc: ; 0x0203B88C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0
	mov r2, #0xc4
	add r5, r0, #0
	bl memset
	add r0, r4, #0
	bl MapHeader_HasWildEncounters
	cmp r0, #0
	beq _0203B8B4
	add r0, r4, #0
	bl MapHeader_GetWildEncounterBank
	add r2, r0, #0
	add r0, r5, #0
#ifdef HEARTGOLD
	mov r1, #0x25 ; NARC_fielddata_encountdata_g_enc_data
#else
	mov r1, #0x88 ; NARC_fielddata_encountdata_s_enc_data
#endif
	bl ReadWholeNarcMemberByIdPair
_0203B8B4:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end WildEncounters_ReadFromNarc

	thumb_func_start MapEvents_GetLoadedEncTable
MapEvents_GetLoadedEncTable: ; 0x0203B8B8
	ldr r1, [r0, #0x14]
	mov r0, #0x92
	lsl r0, r0, #4
	add r0, r1, r0
	bx lr
	.balign 4, 0
	thumb_func_end MapEvents_GetLoadedEncTable

	thumb_func_start LevelScripts_ReadFromNarc
LevelScripts_ReadFromNarc: ; 0x0203B8C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl MapHeader_GetLevelScriptsBank
	mov r1, #0x82
	lsl r1, r1, #4
	mov r2, #1
	add r4, r0, #0
	mov r0, #0
	add r1, r5, r1
	lsl r2, r2, #8
	bl MIi_CpuClearFast
	mov r0, #0xc ; NARC_fielddata_script_scr_seq
	add r1, r4, #0
	bl GetNarcMemberSizeByIdPair
	mov r1, #1
	lsl r1, r1, #8
	cmp r0, r1
	blo _0203B8F4
	bl GF_AssertFail
_0203B8F4:
	mov r0, #0x82
	lsl r0, r0, #4
	add r0, r5, r0
	mov r1, #0xc ; NARC_fielddata_script_scr_seq
	add r2, r4, #0
	bl ReadWholeNarcMemberByIdPair
	pop {r3, r4, r5, pc}
	thumb_func_end LevelScripts_ReadFromNarc

	thumb_func_start MapEvents_GetLoadedLevelScripts
MapEvents_GetLoadedLevelScripts: ; 0x0203B904
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0203B912
	bl GF_AssertFail
_0203B912:
	mov r0, #0x82
	ldr r1, [r4, #0x14]
	lsl r0, r0, #4
	add r0, r1, r0
	pop {r4, pc}
	thumb_func_end MapEvents_GetLoadedLevelScripts
