	.include "asm/macros.inc"
	.include "overlay_100.inc"
	.include "global.inc"

    .extern ov100_021E5BB0
    .extern ov100_021E5DDC
    .extern ov100_021E5E88
    .extern ov100_021E6408
    .extern ov100_021E69E8
    .extern ov100_021E6AB0

	.text

	thumb_func_start Phone_Init
Phone_Init: ; 0x021E642C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetArgs
	add r5, r0, #0
	mov r0, #0
	bl sub_0200616C
	mov r2, #0x32
	mov r0, #3
	mov r1, #0x5a
	lsl r2, r2, #0xc
	bl CreateHeap
	add r0, r4, #0
	mov r1, #0xcc
	mov r2, #0x5a
	bl OverlayManager_CreateAndGetData
	add r4, r0, #0
	mov r1, #0
	mov r2, #0xcc
	bl memset
	str r5, [r4, #0x20]
	mov r0, #0x5a
	str r0, [r4]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x24]
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x24]
	bl SaveData_GSPlayerMisc_Get
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x24]
	bl Save_VarsFlags_Get
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x24]
	bl Save_PlayerData_GetOptionsAddr
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x24]
	bl Save_PlayerData_GetProfile
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x28]
	bl Pokegear_GetRegisteredCardsArray
	ldrb r2, [r4, #5]
	mov r1, #0x7f
	bic r2, r1
	mov r1, #0x7f
	and r0, r1
	orr r0, r2
	strb r0, [r4, #5]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x28]
	bl MenuInputStateMgr_GetState
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x28]
	bl sub_0202EE7C
	strb r0, [r4, #8]
	ldr r0, [r4, #0x20]
	ldrb r0, [r0]
	cmp r0, #0
	beq _021E64C8
	cmp r0, #1
	bne _021E64C8
	mov r0, #3
	strb r0, [r4, #4]
	b _021E64FC
_021E64C8:
	ldr r0, [r4, #0x28]
	bl sub_0202EDF8
	strb r0, [r4, #4]
	ldrb r0, [r4, #4]
	cmp r0, #2
	bne _021E64E8
	ldrb r0, [r4, #5]
	lsl r0, r0, #0x19
	lsr r1, r0, #0x19
	mov r0, #1
	tst r0, r1
	bne _021E64FC
	mov r0, #0
	strb r0, [r4, #4]
	b _021E64FC
_021E64E8:
	cmp r0, #1
	bne _021E64FC
	ldrb r0, [r4, #5]
	lsl r0, r0, #0x19
	lsr r1, r0, #0x19
	mov r0, #2
	tst r0, r1
	bne _021E64FC
	mov r0, #0
	strb r0, [r4, #4]
_021E64FC:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x38
	strb r1, [r0]
	add r0, r4, #0
	ldr r2, _021E651C ; =0x0000FFFF
	add r0, #0x56
	strh r2, [r0]
	mov r0, #1
	strb r0, [r4, #6]
	mov r0, #0x37
	add r2, r1, #0
	bl sub_02004EC4
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E651C: .word 0x0000FFFF
	thumb_func_end Phone_Init

	thumb_func_start Phone_Main
Phone_Main: ; 0x021E6520
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	cmp r1, #0xc
	bhi _021E65B8
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E653A: ; jump table
	.short _021E6554 - _021E653A - 2 ; case 0
	.short _021E655C - _021E653A - 2 ; case 1
	.short _021E6564 - _021E653A - 2 ; case 2
	.short _021E656C - _021E653A - 2 ; case 3
	.short _021E6574 - _021E653A - 2 ; case 4
	.short _021E657C - _021E653A - 2 ; case 5
	.short _021E6584 - _021E653A - 2 ; case 6
	.short _021E658C - _021E653A - 2 ; case 7
	.short _021E6594 - _021E653A - 2 ; case 8
	.short _021E659C - _021E653A - 2 ; case 9
	.short _021E65A4 - _021E653A - 2 ; case 10
	.short _021E65AC - _021E653A - 2 ; case 11
	.short _021E65B4 - _021E653A - 2 ; case 12
_021E6554:
	bl ov100_021E665C
	str r0, [r4]
	b _021E65B8
_021E655C:
	bl ov100_021E669C
	str r0, [r4]
	b _021E65B8
_021E6564:
	bl ov100_021E67D4
	str r0, [r4]
	b _021E65B8
_021E656C:
	bl ov100_021E67EC
	str r0, [r4]
	b _021E65B8
_021E6574:
	bl ov100_021E68A8
	str r0, [r4]
	b _021E65B8
_021E657C:
	bl ov100_021E68C0
	str r0, [r4]
	b _021E65B8
_021E6584:
	bl ov100_021E66B0
	str r0, [r4]
	b _021E65B8
_021E658C:
	bl ov100_021E66C8
	str r0, [r4]
	b _021E65B8
_021E6594:
	bl ov100_021E673C
	str r0, [r4]
	b _021E65B8
_021E659C:
	bl ov100_021E6794
	str r0, [r4]
	b _021E65B8
_021E65A4:
	bl ov100_021E6840
	str r0, [r4]
	b _021E65B8
_021E65AC:
	bl ov100_021E6858
	str r0, [r4]
	b _021E65B8
_021E65B4:
	mov r0, #1
	pop {r4, pc}
_021E65B8:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end Phone_Main

	thumb_func_start Phone_Exit
Phone_Exit: ; 0x021E65BC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldrb r1, [r4, #4]
	ldr r0, [r4, #0x28]
	bl sub_0202EDFC
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl MenuInputStateMgr_SetState
	ldr r4, [r4]
	add r0, r5, #0
	bl OverlayManager_FreeData
	bl sub_02004B10
	bl sub_0203E354
	add r0, r4, #0
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end Phone_Exit

	thumb_func_start ov100_021E65F4
ov100_021E65F4: ; 0x021E65F4
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #0x58]
	cmp r2, #0
	beq _021E6602
	ldr r1, [r4, #0x64]
	blx r2
_021E6602:
	ldr r0, [r4, #0x78]
	cmp r0, #0
	beq _021E660C
	bl PaletteData_PushTransparentBuffers
_021E660C:
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _021E663C
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	beq _021E6632
	add r0, r4, #0
	mov r1, #0
	bl ov100_021E5BB0
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	bl ov100_021E6AB0
_021E6632:
	add r0, r4, #0
	bl ov100_021E69E8
	bl thunk_OamManager_ApplyAndResetBuffers
_021E663C:
	bl GF_RunVramTransferTasks
	ldr r0, [r4, #0x74]
	bl DoScheduledBgGpuUpdates
	ldr r3, _021E6654 ; =0x027E0000
	ldr r1, _021E6658 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_021E6654: .word 0x027E0000
_021E6658: .word 0x00003FF8
	thumb_func_end ov100_021E65F4

	thumb_func_start ov100_021E665C
ov100_021E665C: ; 0x021E665C
	push {r4, lr}
	add r4, r0, #0
	bl ov100_021E5DDC
	cmp r0, #0
	bne _021E666C
	mov r0, #0
	pop {r4, pc}
_021E666C:
	ldrb r0, [r4, #4]
	cmp r0, #4
	bhi _021E6698
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E667E: ; jump table
	.short _021E6694 - _021E667E - 2 ; case 0
	.short _021E668C - _021E667E - 2 ; case 1
	.short _021E6688 - _021E667E - 2 ; case 2
	.short _021E6690 - _021E667E - 2 ; case 3
	.short _021E6688 - _021E667E - 2 ; case 4
_021E6688:
	mov r0, #6
	pop {r4, pc}
_021E668C:
	mov r0, #4
	pop {r4, pc}
_021E6690:
	mov r0, #0xa
	pop {r4, pc}
_021E6694:
	mov r0, #2
	pop {r4, pc}
_021E6698:
	mov r0, #2
	pop {r4, pc}
	thumb_func_end ov100_021E665C

	thumb_func_start ov100_021E669C
ov100_021E669C: ; 0x021E669C
	push {r3, lr}
	bl ov100_021E5E88
	cmp r0, #0
	beq _021E66AA
	mov r0, #0xc
	pop {r3, pc}
_021E66AA:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov100_021E669C

	thumb_func_start ov100_021E66B0
ov100_021E66B0: ; 0x021E66B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E66C4 ; =ov100_021E762C
	ldr r2, [r4]
	add r1, r4, #0
	bl OverlayManager_New
	str r0, [r4, #0x70]
	mov r0, #7
	pop {r4, pc}
	.balign 4, 0
_021E66C4: .word ov100_021E762C
	thumb_func_end ov100_021E66B0

	thumb_func_start ov100_021E66C8
ov100_021E66C8: ; 0x021E66C8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x70
	bl ov100_021E6408
	cmp r0, #0
	bne _021E66DA
	mov r0, #7
	pop {r4, pc}
_021E66DA:
	ldr r0, [r4, #0x1c]
	mov r1, #0
	str r1, [r4, #0x1c]
	cmp r0, #6
	bhi _021E6736
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E66F0: ; jump table
	.short _021E670E - _021E66F0 - 2 ; case 0
	.short _021E671A - _021E66F0 - 2 ; case 1
	.short _021E66FE - _021E66F0 - 2 ; case 2
	.short _021E6728 - _021E66F0 - 2 ; case 3
	.short _021E6736 - _021E66F0 - 2 ; case 4
	.short _021E6736 - _021E66F0 - 2 ; case 5
	.short _021E6706 - _021E66F0 - 2 ; case 6
_021E66FE:
	mov r0, #2
	strb r0, [r4, #4]
	mov r0, #6
	pop {r4, pc}
_021E6706:
	mov r0, #4
	strb r0, [r4, #4]
	mov r0, #8
	pop {r4, pc}
_021E670E:
	strb r1, [r4, #4]
	ldr r0, [r4, #0x74]
	bl DoScheduledBgGpuUpdates
	mov r0, #2
	pop {r4, pc}
_021E671A:
	mov r0, #1
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl DoScheduledBgGpuUpdates
	mov r0, #4
	pop {r4, pc}
_021E6728:
	mov r0, #3
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl DoScheduledBgGpuUpdates
	mov r0, #0xa
	pop {r4, pc}
_021E6736:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov100_021E66C8

	thumb_func_start ov100_021E673C
ov100_021E673C: ; 0x021E673C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ov100_021E5E88
	cmp r0, #0
	bne _021E6750
	add sp, #4
	mov r0, #8
	pop {r3, r4, pc}
_021E6750:
	ldr r3, [r4, #0x20]
	ldr r0, [r4]
	str r0, [sp]
	mov r0, #0
	ldr r2, [r3, #0x24]
	ldr r3, [r3, #0x28]
	add r1, r0, #0
	bl EasyChat_CreateArgs
	str r0, [r4, #0x6c]
	add r0, r4, #0
	ldr r1, _021E678C ; =0x0000FFFF
	add r0, #0x56
	strh r1, [r0]
	add r1, r4, #0
	add r1, #0x56
	ldrh r1, [r1]
	ldr r0, [r4, #0x6c]
	bl sub_02090D14
	ldr r0, _021E6790 ; =ov100_021E761C
	ldr r1, [r4, #0x6c]
	ldr r2, [r4]
	bl OverlayManager_New
	str r0, [r4, #0x70]
	mov r0, #9
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E678C: .word 0x0000FFFF
_021E6790: .word ov100_021E761C
	thumb_func_end ov100_021E673C

	thumb_func_start ov100_021E6794
ov100_021E6794: ; 0x021E6794
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x70
	bl ov100_021E6408
	cmp r0, #0
	bne _021E67A6
	mov r0, #9
	pop {r4, pc}
_021E67A6:
	ldr r0, [r4, #0x6c]
	bl sub_02090D48
	cmp r0, #0
	bne _021E67BC
	ldr r0, [r4, #0x6c]
	bl sub_02090D50
	add r1, r4, #0
	add r1, #0x56
	strh r0, [r1]
_021E67BC:
	ldr r0, [r4, #0x6c]
	bl EasyChat_FreeArgs
	add r0, r4, #0
	mov r1, #1
	add r0, #0x38
	strb r1, [r0]
	mov r0, #4
	strb r0, [r4, #4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6794

	thumb_func_start ov100_021E67D4
ov100_021E67D4: ; 0x021E67D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E67E8 ; =ov100_021E760C
	ldr r2, [r4]
	add r1, r4, #0
	bl OverlayManager_New
	str r0, [r4, #0x70]
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_021E67E8: .word ov100_021E760C
	thumb_func_end ov100_021E67D4

	thumb_func_start ov100_021E67EC
ov100_021E67EC: ; 0x021E67EC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x70
	bl ov100_021E6408
	cmp r0, #0
	bne _021E67FE
	mov r0, #3
	pop {r4, pc}
_021E67FE:
	ldr r1, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x1c]
	cmp r1, #1
	beq _021E6820
	cmp r1, #2
	beq _021E6812
	cmp r1, #3
	beq _021E682E
	b _021E683C
_021E6812:
	mov r0, #2
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl DoScheduledBgGpuUpdates
	mov r0, #6
	pop {r4, pc}
_021E6820:
	mov r0, #1
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl DoScheduledBgGpuUpdates
	mov r0, #4
	pop {r4, pc}
_021E682E:
	mov r0, #3
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl DoScheduledBgGpuUpdates
	mov r0, #0xa
	pop {r4, pc}
_021E683C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov100_021E67EC

	thumb_func_start ov100_021E6840
ov100_021E6840: ; 0x021E6840
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E6854 ; =ov100_021E75FC
	ldr r2, [r4]
	add r1, r4, #0
	bl OverlayManager_New
	str r0, [r4, #0x70]
	mov r0, #0xb
	pop {r4, pc}
	.balign 4, 0
_021E6854: .word ov100_021E75FC
	thumb_func_end ov100_021E6840

	thumb_func_start ov100_021E6858
ov100_021E6858: ; 0x021E6858
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x70
	bl ov100_021E6408
	cmp r0, #0
	bne _021E686A
	mov r0, #0xb
	pop {r4, pc}
_021E686A:
	ldr r1, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x1c]
	cmp r1, #0
	beq _021E688A
	cmp r1, #1
	beq _021E6896
	cmp r1, #2
	bne _021E68A4
	mov r0, #2
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl DoScheduledBgGpuUpdates
	mov r0, #6
	pop {r4, pc}
_021E688A:
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl DoScheduledBgGpuUpdates
	mov r0, #2
	pop {r4, pc}
_021E6896:
	mov r0, #1
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl DoScheduledBgGpuUpdates
	mov r0, #4
	pop {r4, pc}
_021E68A4:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov100_021E6858

	thumb_func_start ov100_021E68A8
ov100_021E68A8: ; 0x021E68A8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E68BC ; =ov100_021E763C
	ldr r2, [r4]
	add r1, r4, #0
	bl OverlayManager_New
	str r0, [r4, #0x70]
	mov r0, #5
	pop {r4, pc}
	.balign 4, 0
_021E68BC: .word ov100_021E763C
	thumb_func_end ov100_021E68A8

	thumb_func_start ov100_021E68C0
ov100_021E68C0: ; 0x021E68C0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x70
	bl ov100_021E6408
	cmp r0, #0
	bne _021E68D2
	mov r0, #5
	pop {r4, pc}
_021E68D2:
	ldr r1, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x1c]
	cmp r1, #0
	beq _021E68F4
	cmp r1, #2
	beq _021E68E6
	cmp r1, #3
	beq _021E6900
	b _021E690E
_021E68E6:
	mov r0, #2
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl DoScheduledBgGpuUpdates
	mov r0, #6
	pop {r4, pc}
_021E68F4:
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl DoScheduledBgGpuUpdates
	mov r0, #2
	pop {r4, pc}
_021E6900:
	mov r0, #3
	strb r0, [r4, #4]
	ldr r0, [r4, #0x74]
	bl DoScheduledBgGpuUpdates
	mov r0, #0xa
	pop {r4, pc}
_021E690E:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov100_021E68C0

    .rodata

ov100_021E75FC: ; 0x021E75FC
	.word ov101_021EF848, ov101_021EF890, ov101_021EF940, FS_OVERLAY_ID(OVY_101)

ov100_021E760C: ; 0x021E760C
	.word ov101_021EE8E8, ov101_021EE924, ov101_021EE9A4, FS_OVERLAY_ID(OVY_101)

ov100_021E761C: ; 0x021E761C
	.word EasyChat_Init, EasyChat_Main, EasyChat_Exit, FS_OVERLAY_ID(OVY_102)

ov100_021E762C: ; 0x021E762C
	.word ov101_021E7740, ov101_021E779C, ov101_021E7834, FS_OVERLAY_ID(OVY_101)

ov100_021E763C: ; 0x021E763C
	.word ov101_021F4480, ov101_021F44BC, ov101_021F452C, FS_OVERLAY_ID(OVY_101)
