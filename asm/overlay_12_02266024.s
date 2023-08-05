	.include "asm/macros.inc"
	.include "overlay_12_02266024.inc"
	.include "global.inc"

	.text
    .public BattleInput_New


	thumb_func_start ov12_022660D0
ov12_022660D0: ; 0x022660D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r2, [sp, #0xc]
	add r4, r3, #0
	bl BattleInput_New
	add r6, r0, #0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x38]
	str r0, [r6]
	ldr r0, _022662EC ; =0x0000068D
	cmp r1, #0
	strb r4, [r6, r0]
	str r1, [r6, #4]
	beq _022660F4
	ldrb r1, [r1]
	add r0, #0x53
	strb r1, [r6, r0]
_022660F4:
	ldr r0, [sp, #0xc]
	bl BattleSystem_GetPaletteData
	str r0, [sp, #0x18]
	ldr r0, [sp, #0xc]
	bl ov12_0223AB54
	str r0, [sp, #0x14]
	cmp r0, #0x17
	blo _02266110
	mov r0, #0
	str r0, [sp, #0x14]
	bl GF_AssertFail
_02266110:
	mov r0, #0xd
	mov r1, #5
	bl sub_02013534
	ldr r2, _022662F0 ; =0x000004CC
	add r1, r6, #0
	str r0, [r6, r2]
	ldr r0, _022662F4 ; =ov12_022698C4
	add r2, #0x52
	bl CreateSysTask
	ldr r1, _022662F8 ; =0x00000698
	mov r4, #0
	str r0, [r6, r1]
	ldr r7, _022662FC ; =ov12_0226E298
	b _02266184
_02266130:
	mov r1, #2
	mov r0, #5
	lsl r1, r1, #0xa
	bl AllocFromHeap
	lsl r1, r4, #2
	add r1, r6, r1
	str r0, [r1, #0x40]
	ldr r0, [sp, #0xc]
	bl ov12_0226ADC4
	cmp r0, #0
	beq _02266156
	lsl r0, r4, #1
	ldrh r0, [r7, r0]
	cmp r0, #0x2b
	bne _02266156
	mov r1, #0xae
	b _0226615A
_02266156:
	lsl r0, r4, #1
	ldrh r1, [r7, r0]
_0226615A:
	mov r0, #5
	str r0, [sp]
	mov r0, #7
	mov r2, #1
	add r3, sp, #0x20
	bl GfGfxLoader_GetScrnData
	add r5, r0, #0
	lsl r0, r4, #2
	add r0, r6, r0
	ldr r1, [r0, #0x40]
	ldr r0, [sp, #0x20]
	mov r2, #2
	add r0, #0xc
	lsl r2, r2, #0xa
	bl MIi_CpuCopy32
	add r0, r5, #0
	bl FreeToHeap
	add r4, r4, #1
_02266184:
	cmp r4, #7
	blt _02266130
	ldr r0, [sp, #0xc]
	bl ov12_0226ADC4
	cmp r0, #0
	beq _02266196
	ldr r4, _02266300 ; =0x0000015D
	b _02266198
_02266196:
	mov r4, #0xf6
_02266198:
	mov r1, #2
	mov r0, #5
	lsl r1, r1, #8
	bl AllocFromHeap
	str r0, [r6, #0x5c]
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	mov r1, #7
	add r2, r4, #0
	mov r3, #5
	bl PaletteData_LoadNarc
	ldr r0, [sp, #0x14]
	ldr r2, _02266304 ; =ov12_0226E580
	lsl r3, r0, #2
	ldrh r1, [r2, r3]
	ldr r0, _02266308 ; =0x0000FFFF
	cmp r1, r0
	beq _022661E0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldrh r2, [r2, r3]
	ldr r0, [sp, #0x18]
	mov r1, #7
	mov r3, #5
	bl PaletteData_LoadNarc
_022661E0:
	ldr r0, [sp, #0x18]
	mov r1, #1
	bl PaletteData_GetUnfadedBuf
	mov r2, #2
	ldr r1, [r6, #0x5c]
	lsl r2, r2, #8
	bl MIi_CpuCopy16
	add r5, r6, #0
	mov r7, #0x46
	mov r4, #0
	add r5, #0x6c
	lsl r7, r7, #2
	b _0226620E
_022661FE:
	add r0, r4, #0
	mul r0, r7
	add r0, r5, r0
	mov r1, #0xff
	mov r2, #0x18
	bl MI_CpuFill8
	add r4, r4, #1
_0226620E:
	cmp r4, #4
	blt _022661FE
	mov r0, #0
	str r0, [sp, #0x10]
	mov r7, #6
	b _0226624A
_0226621A:
	mov r0, #0x46
	ldr r1, [sp, #0x10]
	lsl r0, r0, #2
	mul r0, r1
	mov r5, #0
	add r4, r6, r0
	b _02266240
_02266228:
	add r0, r7, #0
	bl sub_0208805C
	add r1, r0, #0
	mov r0, #5
	bl AllocFromHeap
	lsl r1, r5, #2
	add r1, r4, r1
	add r1, #0x84
	str r0, [r1]
	add r5, r5, #1
_02266240:
	cmp r5, #4
	blt _02266228
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
_0226624A:
	ldr r0, [sp, #0x10]
	cmp r0, #4
	blt _0226621A
	mov r0, #5
	mov r1, #0x40
	bl AllocFromHeap
	str r0, [r6, #0x60]
	mov r0, #5
	mov r1, #0x40
	bl AllocFromHeap
	str r0, [r6, #0x64]
	ldr r1, [r6, #0x60]
	ldr r0, [r6, #0x5c]
	mov r2, #0x20
	bl MIi_CpuCopy16
	ldr r1, [r6, #0x60]
	ldr r0, [r6, #0x5c]
	add r1, #0x20
	add r0, #0xe0
	mov r2, #0x20
	bl MIi_CpuCopy16
	ldr r0, [sp, #0xc]
	bl ov12_0226ADC4
	cmp r0, #0
	beq _0226628A
	ldr r1, _0226630C ; =0x0000015E
	b _0226629C
_0226628A:
	ldr r0, [sp, #0x14]
	lsl r1, r0, #2
	ldr r0, _02266304 ; =ov12_0226E580
	add r0, r0, r1
	ldrh r1, [r0, #2]
	ldr r0, _02266308 ; =0x0000FFFF
	cmp r1, r0
	bne _0226629C
	ldr r1, _02266310 ; =0x0000010F
_0226629C:
	mov r0, #7
	add r2, sp, #0x1c
	mov r3, #5
	bl GfGfxLoader_GetPlttData
	add r4, r0, #0
	ldr r0, [sp, #0xc]
	bl ov12_0226ADC4
	cmp r0, #0
	ldr r1, [r6, #0x64]
	beq _022662C0
	ldr r0, [sp, #0x1c]
	mov r2, #0x40
	ldr r0, [r0, #0xc]
	bl MIi_CpuCopy16
	b _022662CA
_022662C0:
	ldr r0, [sp, #0x1c]
	mov r2, #0x20
	ldr r0, [r0, #0xc]
	bl MIi_CpuCopy16
_022662CA:
	add r0, r4, #0
	bl FreeToHeap
	bl sub_02002BD4
	bl sub_02002BF4
	ldr r0, _02266314 ; =ov12_02269954
	ldr r2, _02266318 ; =0x0000D6D8
	add r1, r6, #0
	bl CreateSysTask
	str r0, [r6, #0x68]
	add r0, r6, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_022662EC: .word 0x0000068D
_022662F0: .word 0x000004CC
_022662F4: .word ov12_022698C4
_022662F8: .word 0x00000698
_022662FC: .word ov12_0226E298
_02266300: .word 0x0000015D
_02266304: .word ov12_0226E580
_02266308: .word 0x0000FFFF
_0226630C: .word 0x0000015E
_02266310: .word 0x0000010F
_02266314: .word ov12_02269954
_02266318: .word 0x0000D6D8
	thumb_func_end ov12_022660D0

	thumb_func_start ov12_0226631C
ov12_0226631C: ; 0x0226631C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r1, [r6, #4]
	cmp r1, #0
	beq _0226632E
	mov r0, #0x6e
	lsl r0, r0, #4
	ldrb r0, [r6, r0]
	strb r0, [r1]
_0226632E:
	add r0, r6, #0
	bl ov12_02268DAC
	add r0, r6, #0
	bl ov12_02266804
	add r0, r6, #0
	bl ov12_02266490
	ldr r0, _02266388 ; =0x000004CC
	ldr r0, [r6, r0]
	bl sub_020135AC
	ldr r0, _0226638C ; =0x00000698
	ldr r0, [r6, r0]
	bl DestroySysTask
	mov r4, #0
	add r5, r6, #0
_02266354:
	ldr r0, [r5, #0x40]
	bl FreeToHeap
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #7
	blt _02266354
	ldr r0, [r6, #0x5c]
	bl FreeToHeap
	add r0, r6, #0
	bl ov12_022687AC
	ldr r0, [r6, #0x60]
	bl FreeToHeap
	ldr r0, [r6, #0x64]
	bl FreeToHeap
	ldr r0, [r6, #0x68]
	bl DestroySysTask
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02266388: .word 0x000004CC
_0226638C: .word 0x00000698
	thumb_func_end ov12_0226631C

	thumb_func_start ov12_02266390
ov12_02266390: ; 0x02266390
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r0, #0
	ldr r0, [r7]
	bl ov12_0223A8E4
	add r6, r0, #0
	ldr r0, [r7]
	bl ov12_0223A8EC
	add r4, r0, #0
	ldr r0, [r7]
	bl BattleSystem_GetBgConfig
	add r5, r0, #0
	ldr r0, [r7]
	bl BattleSystem_GetPaletteData
	str r0, [sp, #0x14]
	ldr r0, [r7]
	bl ov12_0226ADC4
	cmp r0, #0
	beq _022663C4
	mov r1, #0xad
	b _022663C6
_022663C4:
	mov r1, #0x1c
_022663C6:
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	mov r0, #7
	add r2, r5, #0
	mov r3, #4
	bl GfGfxLoader_LoadCharData
	ldr r2, _02266474 ; =0x00004E31
	add r0, r6, #0
	add r1, r4, #0
	add r3, r2, #0
	bl sub_0207775C
	ldr r0, [r7]
	bl BattleSystem_GetPaletteData
	mov r1, #2
	str r1, [sp]
	ldr r1, _02266478 ; =0x00004E34
	add r2, r6, #0
	str r1, [sp, #4]
	mov r1, #3
	add r3, r4, #0
	bl sub_02077720
	mov r5, #0
_02266408:
	ldr r0, _0226647C ; =0x00004E39
	add r1, r4, #0
	add r0, r5, r0
	str r0, [sp]
	add r0, r6, #0
	mov r2, #2
	mov r3, #0
	bl sub_020776B8
	add r5, r5, #1
	cmp r5, #4
	blt _02266408
	ldr r0, [r7]
	bl BattleSystem_GetBattleType
	mov r1, #1
	lsl r1, r1, #0xa
	tst r0, r1
	beq _02266470
	ldr r1, _02266480 ; =0x00004FBE
	ldr r0, _02266484 ; =0x00004E44
	str r1, [sp]
	str r0, [sp, #4]
	sub r0, r1, #7
	str r0, [sp, #8]
	sub r1, #0x12
	str r1, [sp, #0xc]
	ldr r3, [sp, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #5
	bl BattleFinger_LoadResources
	ldr r0, _02266484 ; =0x00004E44
	ldr r3, _02266488 ; =0x00004FB7
	str r0, [sp]
	add r0, r3, #0
	str r3, [sp, #4]
	sub r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xa
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #5
	add r3, r3, #7
	bl BattleFinger_New
	ldr r1, _0226648C ; =0x000006E4
	str r0, [r7, r1]
_02266470:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02266474: .word 0x00004E31
_02266478: .word 0x00004E34
_0226647C: .word 0x00004E39
_02266480: .word 0x00004FBE
_02266484: .word 0x00004E44
_02266488: .word 0x00004FB7
_0226648C: .word 0x000006E4
	thumb_func_end ov12_02266390

	thumb_func_start ov12_02266490
ov12_02266490: ; 0x02266490
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [r7]
	bl ov12_0223A8E4
	ldr r0, [r7]
	bl ov12_0223A8EC
	ldr r6, _022664F0 ; =0x00004E39
	add r5, r0, #0
	mov r4, #0
_022664A6:
	add r0, r5, #0
	add r1, r4, r6
	bl sub_020777A4
	add r4, r4, #1
	cmp r4, #4
	blt _022664A6
	ldr r1, _022664F4 ; =0x00004E34
	add r0, r5, #0
	bl sub_020777AC
	ldr r1, _022664F8 ; =0x00004E31
	add r0, r5, #0
	add r2, r1, #0
	bl sub_020777B4
	ldr r0, [r7]
	bl BattleSystem_GetBattleType
	mov r1, #1
	lsl r1, r1, #0xa
	tst r0, r1
	beq _022664EE
	ldr r0, _022664FC ; =0x000006E4
	ldr r0, [r7, r0]
	bl BattleFinger_Delete
	ldr r3, _02266500 ; =0x00004FAC
	ldr r2, _02266504 ; =0x00004E44
	add r1, r3, #0
	str r3, [sp]
	add r0, r5, #0
	add r1, #0x12
	add r3, #0xb
	bl BattleFinger_FreeResources
_022664EE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022664F0: .word 0x00004E39
_022664F4: .word 0x00004E34
_022664F8: .word 0x00004E31
_022664FC: .word 0x000006E4
_02266500: .word 0x00004FAC
_02266504: .word 0x00004E44
	thumb_func_end ov12_02266490

	thumb_func_start ov12_02266508
ov12_02266508: ; 0x02266508
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r0, [sp, #0x48]
	str r1, [sp, #0x18]
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x4c]
	add r7, r2, #0
	str r3, [sp, #0x1c]
	cmp r0, #0
	beq _02266526
	add r1, r7, #0
	add r1, #0x1c
	mov r2, #0x22
	bl MI_CpuCopy8
_02266526:
	ldr r0, _02266628 ; =0x0000068E
	mov r1, #0
	strb r1, [r7, r0]
	ldr r0, [r7]
	bl BattleSystem_GetBgConfig
	str r0, [sp, #0x28]
	ldr r0, [r7]
	bl ov12_0223A8E4
	str r0, [sp, #0x24]
	ldr r0, [r7]
	bl ov12_0223A8EC
	str r0, [sp, #0x20]
	ldr r0, _0226662C ; =0x0000068B
	ldrsb r2, [r7, r0]
	mov r0, #0
	mvn r0, r0
	cmp r2, r0
	bne _02266558
	mov r0, #1
	str r0, [sp, #0x48]
	mov r5, #0
	b _02266560
_02266558:
	mov r0, #0x30
	ldr r1, _02266630 ; =ov12_0226E70C
	mul r0, r2
	add r5, r1, r0
_02266560:
	ldr r0, [sp, #0x1c]
	mov r1, #0x30
	ldr r2, _02266630 ; =ov12_0226E70C
	mul r1, r0
	add r0, r2, r1
	str r0, [sp, #0x2c]
	ldr r0, [r7]
	bl BattleSystem_GetPaletteData
	mov r1, #2
	lsl r1, r1, #8
	str r1, [sp]
	ldr r1, [r7, #0x5c]
	mov r2, #1
	mov r3, #0
	bl PaletteData_LoadPalette
	ldr r6, [sp, #0x2c]
	mov r4, #0
_02266586:
	ldrh r2, [r6, #4]
	ldr r0, _02266634 ; =0x0000FFFF
	cmp r2, r0
	beq _022665BC
	ldr r0, [sp, #0x48]
	cmp r0, #1
	beq _0226659A
	ldrh r0, [r5, #4]
	cmp r2, r0
	beq _022665BC
_0226659A:
	lsl r2, r2, #2
	add r1, r4, #4
	add r2, r7, r2
	lsl r1, r1, #0x18
	mov r3, #2
	ldr r0, [sp, #0x28]
	ldr r2, [r2, #0x40]
	lsr r1, r1, #0x18
	lsl r3, r3, #0xa
	bl BG_LoadScreenTilemapData
	add r1, r4, #4
	lsl r1, r1, #0x18
	ldr r0, [sp, #0x28]
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
_022665BC:
	add r4, r4, #1
	add r6, r6, #2
	add r5, r5, #2
	cmp r4, #4
	blt _02266586
	ldr r0, [r7]
	bl BattleSystem_GetPaletteData
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x24]
	str r1, [sp]
	mov r1, #0x48
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #7
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	ldr r1, _02266638 ; =0x00004E37
	ldr r3, [sp, #0x20]
	str r1, [sp, #0x14]
	mov r1, #3
	bl sub_0200D68C
	ldr r1, _0226662C ; =0x0000068B
	ldr r0, [sp, #0x1c]
	mov r2, #0xf
	strb r0, [r7, r1]
	mov r0, #0xc
	str r0, [sp]
	ldr r0, _0226663C ; =0x04001050
	mov r1, #2
	mov r3, #8
	bl G2x_SetBlendAlpha_
	add r0, r7, #0
	bl ov12_02268DAC
	ldr r0, [sp, #0x2c]
	ldr r3, [r0, #0x28]
	cmp r3, #0
	beq _0226661A
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x48]
	add r0, r7, #0
	blx r3
_0226661A:
	ldr r0, _02266640 ; =ov12_02269830
	add r1, r7, #0
	mov r2, #0xa
	bl sub_0200E374
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02266628: .word 0x0000068E
_0226662C: .word 0x0000068B
_02266630: .word ov12_0226E70C
_02266634: .word 0x0000FFFF
_02266638: .word 0x00004E37
_0226663C: .word 0x04001050
_02266640: .word ov12_02269830
	thumb_func_end ov12_02266508

	thumb_func_start ov12_02266644
ov12_02266644: ; 0x02266644
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r1, [sp, #0x14]
	add r4, r0, #0
	ldr r1, _022667D0 ; =0x000005D8
	ldr r0, [sp, #0x14]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _02266660
	ldr r0, [sp, #0x14]
	add r1, #0x18
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02266664
_02266660:
	bl GF_AssertFail
_02266664:
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	bl ov12_0223A8E4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	bl ov12_0223A8EC
	add r7, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _022667D4 ; =0x00004E37
	add r1, r7, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	add r2, r4, #0
	mov r3, #0xd0
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	ldr r0, _022667D8 ; =0x00004E2F
	add r1, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	add r2, r4, #0
	mov r3, #0xcf
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _022667D8 ; =0x00004E2F
	add r1, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	add r2, r4, #0
	mov r3, #0xd1
	bl sub_0200D71C
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _022667DC ; =0x00004E38
	add r1, r7, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	add r2, r4, #0
	mov r3, #0xcd
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	ldr r0, _022667E0 ; =0x00004E30
	add r1, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	add r2, r4, #0
	mov r3, #0xcc
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _022667E0 ; =0x00004E30
	add r1, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	add r2, r4, #0
	mov r3, #0xce
	bl sub_0200D71C
	mov r0, #0
	ldr r4, [sp, #0x14]
	str r0, [sp, #0x1c]
	mov r6, #0xc
	mov r5, #0xf6
_02266702:
	ldr r0, [sp, #0x18]
	ldr r2, _022667E4 ; =ov12_0226E448
	add r1, r7, #0
	bl sub_0200D734
	ldr r1, _022667D0 ; =0x000005D8
	mov r3, #0x11
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	lsl r1, r6, #0x10
	ldr r0, [r0]
	asr r1, r1, #0x10
	mov r2, #0xd
	lsl r3, r3, #0x10
	bl sub_0200DDC4
	ldr r0, _022667D0 ; =0x000005D8
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_0200DF98
	ldr r0, [sp, #0x18]
	ldr r2, _022667E8 ; =ov12_0226E47C
	add r1, r7, #0
	bl sub_0200D734
	mov r1, #0x5f
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	lsl r1, r5, #0x10
	mov r3, #0x11
	ldr r0, [r0]
	asr r1, r1, #0x10
	mov r2, #9
	lsl r3, r3, #0x10
	bl sub_0200DDC4
	ldr r0, [sp, #0x1c]
	add r4, r4, #4
	add r0, r0, #1
	add r6, #0x13
	sub r5, #0xc
	str r0, [sp, #0x1c]
	cmp r0, #6
	blt _02266702
	ldr r0, [sp, #0x14]
	bl ov12_02266B34
	ldr r0, [sp, #0x14]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02266774
	bl GF_AssertFail
_02266774:
	ldr r0, _022667EC ; =ov12_022668D0
	ldr r1, [sp, #0x14]
	ldr r2, _022667F0 ; =0x00000514
	bl CreateSysTask
	ldr r1, [sp, #0x14]
	str r0, [r1, #8]
	add r0, r1, #0
	ldr r0, [r0]
	bl BattleSystem_GetPaletteData
	ldr r1, _022667F4 ; =0x00004FBD
	add r2, r0, #0
	ldr r0, _022667F8 ; =0x00004E43
	str r1, [sp]
	str r0, [sp, #4]
	sub r0, r1, #7
	str r0, [sp, #8]
	sub r1, #0x12
	str r1, [sp, #0xc]
	ldr r0, [sp, #0x18]
	add r1, r7, #0
	mov r3, #5
	bl BattleCursor_LoadResources
	ldr r0, _022667F8 ; =0x00004E43
	ldr r3, _022667FC ; =0x00004FB6
	str r0, [sp]
	add r0, r3, #0
	str r3, [sp, #4]
	sub r0, #0xb
	str r0, [sp, #8]
	mov r2, #5
	str r2, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	add r1, r7, #0
	add r3, r3, #7
	bl BattleCursor_New
	ldr r2, _02266800 ; =0x000006D8
	ldr r1, [sp, #0x14]
	str r0, [r1, r2]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022667D0: .word 0x000005D8
_022667D4: .word 0x00004E37
_022667D8: .word 0x00004E2F
_022667DC: .word 0x00004E38
_022667E0: .word 0x00004E30
_022667E4: .word ov12_0226E448
_022667E8: .word ov12_0226E47C
_022667EC: .word ov12_022668D0
_022667F0: .word 0x00000514
_022667F4: .word 0x00004FBD
_022667F8: .word 0x00004E43
_022667FC: .word 0x00004FB6
_02266800: .word 0x000006D8
	thumb_func_end ov12_02266644

	thumb_func_start ov12_02266804
ov12_02266804: ; 0x02266804
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _022668B0 ; =0x000005D8
	ldr r1, [r6, r0]
	cmp r1, #0
	beq _02266818
	add r0, #0x18
	ldr r0, [r6, r0]
	cmp r0, #0
	bne _0226681C
_02266818:
	bl GF_AssertFail
_0226681C:
	ldr r0, [r6]
	bl ov12_0223A8E4
	ldr r0, [r6]
	bl ov12_0223A8EC
	ldr r1, _022668B4 ; =0x00004E37
	add r7, r0, #0
	bl sub_0200D958
	ldr r1, _022668B8 ; =0x00004E2F
	add r0, r7, #0
	bl sub_0200D978
	ldr r1, _022668B8 ; =0x00004E2F
	add r0, r7, #0
	bl sub_0200D988
	ldr r1, _022668BC ; =0x00004E38
	add r0, r7, #0
	bl sub_0200D958
	ldr r1, _022668C0 ; =0x00004E30
	add r0, r7, #0
	bl sub_0200D978
	ldr r1, _022668C0 ; =0x00004E30
	add r0, r7, #0
	bl sub_0200D988
	ldr r1, _022668B4 ; =0x00004E37
	add r0, r7, #0
	bl sub_0200D968
	mov r4, #0
	add r5, r6, #0
_02266864:
	ldr r0, _022668B0 ; =0x000005D8
	ldr r0, [r5, r0]
	bl sub_0200D9DC
	ldr r0, _022668B0 ; =0x000005D8
	mov r1, #0
	str r1, [r5, r0]
	add r0, #0x18
	ldr r0, [r5, r0]
	bl sub_0200D9DC
	mov r0, #0x5f
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _02266864
	ldr r0, [r6, #8]
	bl DestroySysTask
	ldr r3, _022668C4 ; =0x00004FAB
	mov r0, #0
	str r0, [r6, #8]
	add r1, r3, #0
	str r3, [sp]
	ldr r2, _022668C8 ; =0x00004E43
	add r0, r7, #0
	add r1, #0x12
	add r3, #0xb
	bl BattleCursor_FreeResources
	ldr r0, _022668CC ; =0x000006D8
	ldr r0, [r6, r0]
	bl BattleCursor_Delete
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022668B0: .word 0x000005D8
_022668B4: .word 0x00004E37
_022668B8: .word 0x00004E2F
_022668BC: .word 0x00004E38
_022668C0: .word 0x00004E30
_022668C4: .word 0x00004FAB
_022668C8: .word 0x00004E43
_022668CC: .word 0x000006D8
	thumb_func_end ov12_02266804

	thumb_func_start ov12_022668D0
ov12_022668D0: ; 0x022668D0
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02266A44 ; =0x00000648
	add r5, r1, #0
	mov r7, #0
	add r4, r5, r0
	mov r6, #0xc
_022668DC:
	ldrb r0, [r4, #3]
	cmp r0, #4
	bhi _022668F8
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022668EE: ; jump table
	.short _022668F8 - _022668EE - 2 ; case 0
	.short _02266938 - _022668EE - 2 ; case 1
	.short _0226694A - _022668EE - 2 ; case 2
	.short _022669E2 - _022668EE - 2 ; case 3
	.short _0226694A - _022668EE - 2 ; case 4
_022668F8:
	ldr r0, _02266A48 ; =0x000005D8
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl sub_0200DCF4
	cmp r0, #0
	beq _0226690C
	ldrb r0, [r4, #2]
	cmp r0, #0x57
	bhs _0226690E
_0226690C:
	b _02266A32
_0226690E:
	mov r0, #0
	strb r0, [r4, #4]
	mov r0, #0xa
	strb r0, [r4, #5]
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r3, r0, #0x1d
	ldrb r2, [r4, #5]
	sub r3, r3, r1
	mov r0, #0x1d
	ror r3, r0
	add r0, r1, r3
	add r0, r2, r0
	strb r0, [r4, #5]
	mov r0, #2
	strb r0, [r4, #7]
	ldrb r0, [r4, #3]
	add r0, r0, #1
	strb r0, [r4, #3]
	b _02266A32
_02266938:
	ldrb r1, [r4, #5]
	cmp r1, #0
	beq _02266944
	sub r0, r1, #1
	strb r0, [r4, #5]
	b _02266A32
_02266944:
	add r0, r0, #1
	strb r0, [r4, #3]
	b _02266A32
_0226694A:
	ldr r0, _02266A48 ; =0x000005D8
	mov r1, #2
	ldr r0, [r5, r0]
	lsl r1, r1, #0xa
	bl sub_0200E098
	mov r0, #0
	ldrsh r1, [r4, r0]
	mov r0, #6
	lsl r0, r0, #6
	add r0, r1, r0
	strh r0, [r4]
	mov r1, #0
	ldrsh r1, [r4, r1]
	ldr r0, _02266A48 ; =0x000005D8
	mov r3, #0x11
	asr r2, r1, #7
	lsr r2, r2, #0x18
	add r2, r1, r2
	asr r1, r2, #8
	add r1, r1, r6
	lsl r1, r1, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	mov r2, #0xd
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	ldrb r0, [r4, #6]
	add r0, r0, #1
	strb r0, [r4, #6]
	ldrb r1, [r4, #6]
	ldrb r0, [r4, #7]
	cmp r1, r0
	blo _02266A32
	mov r0, #0
	strb r0, [r4, #6]
	ldrb r0, [r4, #3]
	cmp r0, #2
	bne _022669A0
	add r0, r0, #1
	strb r0, [r4, #3]
	b _02266A32
_022669A0:
	ldr r0, _02266A48 ; =0x000005D8
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200E074
	ldr r0, _02266A48 ; =0x000005D8
	lsl r1, r6, #0x10
	mov r3, #0x11
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	mov r2, #0xd
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	mov r0, #0
	strh r0, [r4]
	ldrb r0, [r4, #8]
	cmp r0, #1
	bhs _022669DA
	add r0, r0, #1
	strb r0, [r4, #8]
	ldrb r0, [r4, #7]
	cmp r0, #1
	bls _022669D4
	sub r0, r0, #1
	strb r0, [r4, #7]
_022669D4:
	mov r0, #2
	strb r0, [r4, #3]
	b _02266A32
_022669DA:
	mov r0, #0
	strb r0, [r4, #8]
	strb r0, [r4, #3]
	b _02266A32
_022669E2:
	ldr r0, _02266A48 ; =0x000005D8
	ldr r1, _02266A4C ; =0xFFFFF800
	ldr r0, [r5, r0]
	bl sub_0200E098
	mov r0, #0
	ldrsh r1, [r4, r0]
	mov r0, #6
	lsl r0, r0, #6
	sub r0, r1, r0
	strh r0, [r4]
	mov r1, #0
	ldrsh r1, [r4, r1]
	ldr r0, _02266A48 ; =0x000005D8
	mov r3, #0x11
	asr r2, r1, #7
	lsr r2, r2, #0x18
	add r2, r1, r2
	asr r1, r2, #8
	add r1, r1, r6
	lsl r1, r1, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	mov r2, #0xd
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	ldrb r0, [r4, #6]
	add r0, r0, #1
	strb r0, [r4, #6]
	ldrb r1, [r4, #7]
	ldrb r0, [r4, #6]
	lsl r1, r1, #1
	cmp r0, r1
	blt _02266A32
	mov r0, #0
	strb r0, [r4, #6]
	ldrb r0, [r4, #3]
	add r0, r0, #1
	strb r0, [r4, #3]
_02266A32:
	add r7, r7, #1
	add r4, #0xa
	add r5, r5, #4
	add r6, #0x13
	cmp r7, #6
	bge _02266A40
	b _022668DC
_02266A40:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02266A44: .word 0x00000648
_02266A48: .word 0x000005D8
_02266A4C: .word 0xFFFFF800
	thumb_func_end ov12_022668D0

	thumb_func_start ov12_02266A50
ov12_02266A50: ; 0x02266A50
	push {r3, r4}
	ldr r2, _02266A68 ; =0x0000064A
	mov r4, #0
_02266A56:
	ldrb r3, [r1, r4]
	add r4, r4, #1
	strb r3, [r0, r2]
	add r0, #0xa
	cmp r4, #6
	blt _02266A56
	pop {r3, r4}
	bx lr
	nop
_02266A68: .word 0x0000064A
	thumb_func_end ov12_02266A50

	thumb_func_start ov12_02266A6C
ov12_02266A6C: ; 0x02266A6C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	mov r4, #0
_02266A76:
	ldrb r0, [r6, r4]
	bl ov12_022684F8
	add r1, r0, #0
	ldr r0, _02266ABC ; =0x000005D8
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02266ABC ; =0x000005D8
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl sub_0200DC0C
	ldrb r0, [r7, r4]
	bl ov12_022684F8
	add r1, r0, #0
	mov r0, #0x5f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x5f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl sub_0200DC0C
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _02266A76
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02266ABC: .word 0x000005D8
	thumb_func_end ov12_02266A6C

	thumb_func_start ov12_02266AC0
ov12_02266AC0: ; 0x02266AC0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02266B30 ; =0x000005D8
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _02266AD4
	add r0, #0x18
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _02266AD8
_02266AD4:
	bl GF_AssertFail
_02266AD8:
	ldr r0, [r5]
	bl BattleSystem_GetBattleType
	mov r1, #1
	lsl r1, r1, #0xc
	tst r0, r1
	beq _02266AEA
	mov r7, #1
	b _02266AEC
_02266AEA:
	mov r7, #6
_02266AEC:
	mov r6, #0
	cmp r7, #0
	ble _02266B08
	add r4, r5, #0
_02266AF4:
	ldr r0, _02266B30 ; =0x000005D8
	mov r1, #1
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl sub_0200DCE0
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r7
	blt _02266AF4
_02266B08:
	ldr r0, [r5]
	bl BattleSystem_GetBattleType
	mov r1, #1
	tst r0, r1
	beq _02266B2E
	mov r6, #0x5f
	mov r4, #0
	add r7, r1, #0
	lsl r6, r6, #4
_02266B1C:
	ldr r0, [r5, r6]
	add r1, r7, #0
	ldr r0, [r0]
	bl sub_0200DCE0
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _02266B1C
_02266B2E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02266B30: .word 0x000005D8
	thumb_func_end ov12_02266AC0

	thumb_func_start ov12_02266B34
ov12_02266B34: ; 0x02266B34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02266B74 ; =0x000005D8
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _02266B48
	add r0, #0x18
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _02266B4C
_02266B48:
	bl GF_AssertFail
_02266B4C:
	ldr r7, _02266B74 ; =0x000005D8
	mov r4, #0
	add r6, r7, #0
	add r6, #0x18
_02266B54:
	ldr r0, [r5, r7]
	mov r1, #0
	ldr r0, [r0]
	bl sub_0200DCE0
	ldr r0, [r5, r6]
	mov r1, #0
	ldr r0, [r0]
	bl sub_0200DCE0
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _02266B54
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02266B74: .word 0x000005D8
	thumb_func_end ov12_02266B34

	thumb_func_start ov12_02266B78
ov12_02266B78: ; 0x02266B78
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02266C54 ; =0x0000068B
	mov r6, #0
	ldrsb r1, [r5, r0]
	sub r0, r6, #1
	cmp r1, r0
	bne _02266B8C
	bl GF_AssertFail
_02266B8C:
	ldr r0, _02266C54 ; =0x0000068B
	ldr r3, _02266C58 ; =ov12_0226E70C
	ldrsb r2, [r5, r0]
	mov r1, #0x30
	mul r1, r2
	add r4, r3, r1
	ldr r1, [r4, #0x14]
	cmp r1, #0
	beq _02266BA6
	add r0, r0, #3
	ldrb r0, [r5, r0]
	cmp r0, #1
	bne _02266BAC
_02266BA6:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02266BAC:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _02266BB6
	bl GF_AssertFail
_02266BB6:
	ldr r0, [r5]
	bl BattleSystem_GetBattleType
	mov r1, #1
	lsl r1, r1, #0xa
	tst r0, r1
	beq _02266BCE
	add r0, r5, #0
	bl ov12_0226A8F4
	add r7, r0, #0
	b _02266BE8
_02266BCE:
	ldr r0, [r4, #0x14]
	bl sub_02025224
	add r7, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r7, r0
	bne _02266BE8
	add r0, r5, #0
	bl ov12_02269A24
	add r7, r0, #0
	add r6, r6, #1
_02266BE8:
	mov r0, #0
	mvn r0, r0
	str r0, [sp]
	cmp r7, r0
	bne _02266BF6
	mov r2, #0xff
	b _02266C02
_02266BF6:
	ldr r1, [r4, #0x18]
	lsl r0, r7, #2
	ldr r0, [r1, r0]
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	ldrb r2, [r0, r7]
_02266C02:
	ldr r3, [r4, #0x2c]
	cmp r3, #0
	beq _02266C4E
	ldr r1, [sp]
	add r0, r5, #0
	blx r3
	mov r1, #0
	mvn r1, r1
	str r0, [sp]
	cmp r0, r1
	beq _02266C4E
	ldr r2, [r4, #0x24]
	cmp r2, #0
	beq _02266C24
	add r0, r5, #0
	add r1, r7, #0
	blx r2
_02266C24:
	ldr r0, _02266C5C ; =0x000006DC
	mov r1, #0
	add r0, r5, r0
	mov r2, #4
	bl MI_CpuFill8
	ldr r0, _02266C60 ; =0x000006D8
	ldr r0, [r5, r0]
	bl BattleCursor_Disable
	cmp r6, #0
	ble _02266C46
	mov r0, #0x6e
	mov r1, #1
	lsl r0, r0, #4
	strb r1, [r5, r0]
	b _02266C4E
_02266C46:
	mov r0, #0x6e
	mov r1, #0
	lsl r0, r0, #4
	strb r1, [r5, r0]
_02266C4E:
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02266C54: .word 0x0000068B
_02266C58: .word ov12_0226E70C
_02266C5C: .word 0x000006DC
_02266C60: .word 0x000006D8
	thumb_func_end ov12_02266B78

	thumb_func_start ov12_02266C64
ov12_02266C64: ; 0x02266C64
	push {r3, lr}
	ldr r1, [r0, #0xc]
	cmp r1, #0
	bne _02266C7E
	ldr r1, [r0, #0x10]
	cmp r1, #0
	bne _02266C7E
	bl ov12_022698B0
	cmp r0, #1
	bne _02266C7E
	mov r0, #1
	pop {r3, pc}
_02266C7E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_02266C64

	thumb_func_start ov12_02266C84
ov12_02266C84: ; 0x02266C84
	push {r3, lr}
	cmp r0, #0x40
	bgt _02266CBA
	bge _02266D10
	cmp r0, #0x10
	bgt _02266CB4
	bge _02266CE8
	cmp r0, #8
	bhi _02266D20
	add r2, r0, r0
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02266CA2: ; jump table
	.short _02266CDC - _02266CA2 - 2 ; case 0
	.short _02266CE8 - _02266CA2 - 2 ; case 1
	.short _02266CE8 - _02266CA2 - 2 ; case 2
	.short _02266D20 - _02266CA2 - 2 ; case 3
	.short _02266CF4 - _02266CA2 - 2 ; case 4
	.short _02266D20 - _02266CA2 - 2 ; case 5
	.short _02266D20 - _02266CA2 - 2 ; case 6
	.short _02266D20 - _02266CA2 - 2 ; case 7
	.short _02266CF8 - _02266CA2 - 2 ; case 8
_02266CB4:
	cmp r0, #0x20
	beq _02266D18
	b _02266D20
_02266CBA:
	mov r2, #1
	lsl r2, r2, #8
	cmp r0, r2
	bgt _02266CCA
	bge _02266D04
	cmp r0, #0x80
	beq _02266CF4
	b _02266D20
_02266CCA:
	lsl r1, r2, #1
	cmp r0, r1
	bgt _02266CD4
	beq _02266D14
	b _02266D20
_02266CD4:
	lsl r1, r2, #2
	cmp r0, r1
	beq _02266D1C
	b _02266D20
_02266CDC:
	cmp r1, #4
	bne _02266CE4
	mov r0, #9
	pop {r3, pc}
_02266CE4:
	mov r0, #8
	pop {r3, pc}
_02266CE8:
	cmp r1, #4
	bne _02266CF0
	mov r0, #6
	pop {r3, pc}
_02266CF0:
	mov r0, #4
	pop {r3, pc}
_02266CF4:
	mov r0, #1
	pop {r3, pc}
_02266CF8:
	cmp r1, #4
	bne _02266D00
	mov r0, #7
	pop {r3, pc}
_02266D00:
	mov r0, #2
	pop {r3, pc}
_02266D04:
	cmp r1, #4
	bne _02266D0C
	mov r0, #4
	pop {r3, pc}
_02266D0C:
	mov r0, #6
	pop {r3, pc}
_02266D10:
	mov r0, #3
	pop {r3, pc}
_02266D14:
	mov r0, #0xa
	pop {r3, pc}
_02266D18:
	mov r0, #5
	pop {r3, pc}
_02266D1C:
	mov r0, #0xb
	pop {r3, pc}
_02266D20:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov12_02266C84

	thumb_func_start ov12_02266D28
ov12_02266D28: ; 0x02266D28
	push {r4, r5}
	ldr r1, _02266D88 ; =0x04001000
	ldr r2, _02266D8C ; =0xFFFF1FFF
	ldr r3, [r1]
	add r5, r1, #0
	and r3, r2
	lsr r2, r1, #0xd
	orr r2, r3
	str r2, [r1]
	add r5, #0x4a
	ldrh r4, [r5]
	mov r3, #0x3f
	mov r2, #0x1f
	bic r4, r3
	orr r2, r4
	mov r4, #0x20
	orr r2, r4
	strh r2, [r5]
	add r1, #0x48
	ldrh r5, [r1]
	mov r2, #0x1b
	bic r5, r3
	orr r2, r5
	orr r2, r4
	strh r2, [r1]
	ldr r1, _02266D90 ; =0x000006CC
	ldr r1, [r0, r1]
	asr r0, r1, #7
	lsr r0, r0, #0x18
	add r0, r1, r0
	asr r1, r0, #8
	mov r0, #0xff
	sub r0, r0, r1
	bpl _02266D6E
	mov r0, #0
_02266D6E:
	lsl r1, r0, #8
	mov r0, #0xff
	lsl r0, r0, #8
	and r1, r0
	mov r0, #0xff
	orr r0, r1
	ldr r1, _02266D94 ; =0x04001040
	strh r0, [r1]
	mov r0, #0xc0
	strh r0, [r1, #4]
	pop {r4, r5}
	bx lr
	nop
_02266D88: .word 0x04001000
_02266D8C: .word 0xFFFF1FFF
_02266D90: .word 0x000006CC
_02266D94: .word 0x04001040
	thumb_func_end ov12_02266D28

	thumb_func_start ov12_02266D98
ov12_02266D98: ; 0x02266D98
	push {r4, lr}
	lsl r4, r2, #8
	ldr r2, _02266DBC ; =0x000006CC
	add r3, r0, #0
	ldr r0, [r3, r2]
	cmp r0, r4
	beq _02266DBA
	add r0, r2, #4
	str r1, [r3, r0]
	add r2, #8
	str r4, [r3, r2]
	mov r2, #0x4b
	ldr r0, _02266DC0 ; =ov12_02266DC4
	add r1, r3, #0
	lsl r2, r2, #4
	bl CreateSysTask
_02266DBA:
	pop {r4, pc}
	.balign 4, 0
_02266DBC: .word 0x000006CC
_02266DC0: .word ov12_02266DC4
	thumb_func_end ov12_02266D98

	thumb_func_start ov12_02266DC4
ov12_02266DC4: ; 0x02266DC4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	ldr r0, [r5]
	mov r4, #0
	bl BattleSystem_GetBgConfig
	add r7, r0, #0
	ldr r0, _02266E58 ; =0x000006CC
	add r1, r0, #4
	ldr r2, [r5, r0]
	ldr r1, [r5, r1]
	add r1, r2, r1
	str r1, [r5, r0]
	add r1, r0, #4
	ldr r1, [r5, r1]
	cmp r1, #0
	bgt _02266DF4
	add r2, r0, #0
	add r2, #8
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	cmp r0, r2
	ble _02266E04
_02266DF4:
	cmp r1, #0
	ble _02266E0A
	ldr r0, _02266E5C ; =0x000006D4
	ldr r2, [r5, r0]
	sub r0, #8
	ldr r0, [r5, r0]
	cmp r0, r2
	blt _02266E0A
_02266E04:
	ldr r0, _02266E58 ; =0x000006CC
	mov r4, #1
	str r2, [r5, r0]
_02266E0A:
	ldr r3, _02266E58 ; =0x000006CC
	add r0, r7, #0
	ldr r3, [r5, r3]
	mov r1, #6
	asr r6, r3, #7
	lsr r6, r6, #0x18
	add r6, r3, r6
	mov r2, #0
	asr r3, r6, #8
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	bl ov12_02266D28
	cmp r4, #1
	bne _02266E54
	ldr r2, _02266E60 ; =0x000002FF
	add r0, r7, #0
	mov r1, #7
	bl BgFillTilemapBufferAndCommit
	mov r0, #7
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #7
	mov r1, #0
	bl SetBgPriority
	ldr r2, _02266E64 ; =0x04001000
	ldr r0, _02266E68 ; =0xFFFF1FFF
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r0, [sp]
	bl DestroySysTask
_02266E54:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02266E58: .word 0x000006CC
_02266E5C: .word 0x000006D4
_02266E60: .word 0x000002FF
_02266E64: .word 0x04001000
_02266E68: .word 0xFFFF1FFF
	thumb_func_end ov12_02266DC4

	thumb_func_start ov12_02266E6C
ov12_02266E6C: ; 0x02266E6C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	ldr r0, _02266F40 ; =0x0000068E
	mov r1, #1
	strb r1, [r5, r0]
	ldr r1, _02266F44 ; =0x0400104A
	mov r4, #0x3f
	ldrh r2, [r1]
	mov r0, #0xf
	mov r7, #0xc
	bic r2, r4
	orr r0, r2
	mov r2, #0x20
	orr r0, r2
	strh r0, [r1]
	sub r0, r1, #2
	ldrh r3, [r0]
	bic r3, r4
	orr r3, r7
	orr r3, r2
	strh r3, [r0]
	ldrh r4, [r0]
	ldr r3, _02266F48 ; =0xFFFFC0FF
	lsl r2, r2, #8
	and r4, r3
	lsl r3, r7, #8
	orr r3, r4
	orr r2, r3
	strh r2, [r0]
	add r2, r1, #0
	mov r0, #0xff
	sub r2, #0xa
	strh r0, [r2]
	mov r3, #0x90
	sub r2, r1, #6
	strh r3, [r2]
	add r2, r1, #0
	sub r2, #8
	strh r0, [r2]
	sub r0, r1, #4
	ldr r2, _02266F4C ; =0x000090C0
	sub r1, #0x4a
	strh r2, [r0]
	ldr r2, [r1]
	ldr r0, _02266F50 ; =0xFFFF1FFF
	and r2, r0
	lsl r0, r7, #0xb
	orr r0, r2
	str r0, [r1]
	mov r0, #5
	mov r1, #0x14
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	str r5, [r4]
	ldr r0, _02266F54 ; =0xFFFF9C64
	strb r6, [r4, #0x12]
	strh r0, [r4, #8]
	mov r0, #0xfa
	lsl r0, r0, #4
	strh r0, [r4, #0xa]
	mov r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, _02266F58 ; =0x0000639C
	sub r0, r0, r1
	mov r1, #0x64
	bl _s32_div_f
	strh r0, [r4, #0xc]
	mov r0, #0xa
	ldrsh r1, [r4, r0]
	mov r0, #0xfa
	lsl r0, r0, #4
	sub r0, r0, r1
	mov r1, #0x64
	bl _s32_div_f
	strh r0, [r4, #0xe]
	ldr r0, _02266F5C ; =0x0000070E
	bl PlaySE
	ldr r0, _02266F60 ; =ov12_02269568
	ldr r2, _02266F64 ; =0x000004BA
	add r1, r4, #0
	bl CreateSysTask
	ldr r0, _02266F68 ; =ov12_02269774
	add r1, r4, #0
	bl Main_SetHBlankIntrCB
	cmp r0, #1
	beq _02266F32
	bl GF_AssertFail
_02266F32:
	ldr r0, _02266F6C ; =ov12_02269668
	add r1, r4, #0
	mov r2, #0xa
	bl sub_0200E33C
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02266F40: .word 0x0000068E
_02266F44: .word 0x0400104A
_02266F48: .word 0xFFFFC0FF
_02266F4C: .word 0x000090C0
_02266F50: .word 0xFFFF1FFF
_02266F54: .word 0xFFFF9C64
_02266F58: .word 0x0000639C
_02266F5C: .word 0x0000070E
_02266F60: .word ov12_02269568
_02266F64: .word 0x000004BA
_02266F68: .word ov12_02269774
_02266F6C: .word ov12_02269668
	thumb_func_end ov12_02266E6C

	thumb_func_start ov12_02266F70
ov12_02266F70: ; 0x02266F70
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r4, [r5, #0x1c]
	bl ov12_02266F84
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02266E6C
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02266F70

	thumb_func_start ov12_02266F84
ov12_02266F84: ; 0x02266F84
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r5, r0, #0
	add r6, r5, #0
	add r6, #0x1c
	ldrb r7, [r5, #0x1c]
	ldrb r1, [r6, #8]
	ldr r0, _022672F0 ; =0x000006E1
	strb r1, [r5, r0]
	ldr r0, [r5]
	bl ov12_0223A930
	add r4, r0, #0
	ldr r0, _022672F4 ; =0x0000068A
	strb r7, [r5, r0]
	ldr r0, [r5]
	bl BattleSystem_GetBattleType
	mov r1, #0x20
	tst r0, r1
	beq _02266FD0
	ldr r1, _022672F8 ; =0x000003A3
	add r0, r4, #0
	bl NewString_ReadMsgData
	mov r1, #0xe9
	str r0, [sp, #0x34]
	add r0, r4, #0
	lsl r1, r1, #2
	bl NewString_ReadMsgData
	str r0, [sp, #0x30]
	ldr r1, _022672FC ; =0x000003A5
	add r0, r4, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x2c]
	b _02267050
_02266FD0:
	ldr r0, [r5]
	bl BattleSystem_GetBattleType
	mov r1, #2
	lsl r1, r1, #8
	tst r0, r1
	beq _02267000
	ldr r1, _02267300 ; =0x000004C7
	add r0, r4, #0
	bl NewString_ReadMsgData
	mov r1, #0xe9
	str r0, [sp, #0x34]
	add r0, r4, #0
	lsl r1, r1, #2
	bl NewString_ReadMsgData
	str r0, [sp, #0x30]
	ldr r1, _022672FC ; =0x000003A5
	add r0, r4, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x2c]
	b _02267050
_02267000:
	ldr r0, [r5]
	bl BattleSystem_GetBattleType
	mov r1, #1
	lsl r1, r1, #0xc
	tst r0, r1
	beq _02267030
	mov r1, #0xe7
	add r0, r4, #0
	lsl r1, r1, #2
	bl NewString_ReadMsgData
	str r0, [sp, #0x34]
	ldr r1, _02267304 ; =0x000004F6
	add r0, r4, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x30]
	ldr r1, _02267308 ; =0x0000039E
	add r0, r4, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x2c]
	b _02267050
_02267030:
	mov r1, #0xe7
	add r0, r4, #0
	lsl r1, r1, #2
	bl NewString_ReadMsgData
	str r0, [sp, #0x34]
	ldr r1, _0226730C ; =0x0000039D
	add r0, r4, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x30]
	ldr r1, _02267308 ; =0x0000039E
	add r0, r4, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x2c]
_02267050:
	ldr r0, _022672F0 ; =0x000006E1
	ldrb r0, [r5, r0]
	cmp r0, #1
	bne _02267068
	mov r1, #0x3a
	add r0, r4, #0
	lsl r1, r1, #4
	bl NewString_ReadMsgData
	str r0, [sp, #0x28]
	mov r1, #1
	b _02267074
_02267068:
	ldr r1, _02267310 ; =0x0000039F
	add r0, r4, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x28]
	mov r1, #0
_02267074:
	ldr r0, _02267314 ; =0x0000068F
	ldr r2, [sp, #0x34]
	strb r1, [r5, r0]
	ldr r0, _02267318 ; =0x00010203
	mov r1, #0x4d
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _0226731C ; =0x00004E37
	lsl r1, r1, #4
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	mov r0, #0x53
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #4
	bl ov12_02268550
	ldr r0, _02267320 ; =0x00040506
	ldr r1, _02267324 ; =0x000004E4
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _0226731C ; =0x00004E37
	ldr r2, [sp, #0x30]
	str r0, [sp, #8]
	mov r0, #0x28
	str r0, [sp, #0xc]
	mov r0, #0xa9
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #4
	bl ov12_02268550
	ldr r0, _02267328 ; =0x00070809
	ldr r1, _0226732C ; =0x000004F8
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _0226731C ; =0x00004E37
	ldr r2, [sp, #0x2c]
	str r0, [sp, #8]
	mov r0, #0xd8
	str r0, [sp, #0xc]
	mov r0, #0xa8
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #4
	bl ov12_02268550
	ldr r0, _02267330 ; =0x000A0B0C
	ldr r1, _02267334 ; =0x0000050C
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _0226731C ; =0x00004E37
	ldr r2, [sp, #0x28]
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	mov r0, #0xb0
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r5, r1
	mov r3, #4
	bl ov12_02268550
	ldr r0, [sp, #0x34]
	bl String_Delete
	ldr r0, [sp, #0x30]
	bl String_Delete
	ldr r0, [sp, #0x2c]
	bl String_Delete
	ldr r0, [sp, #0x28]
	bl String_Delete
	ldr r0, [r5]
	bl BattleSystem_GetBattleType
	mov r1, #0x22
	lsl r1, r1, #4
	tst r0, r1
	bne _022671C2
	ldrb r1, [r6, #1]
	ldrb r2, [r6, #2]
	ldr r0, [r5]
	bl BattleSystem_GetPartyMon
	str r0, [sp, #0x38]
	add r0, r5, #0
	bl ov12_02268194
	ldrh r0, [r6, #6]
	mov r3, #4
	ldr r1, [sp, #0x38]
	str r0, [sp]
	ldrb r0, [r6, #3]
	add r2, r7, #0
	str r0, [sp, #4]
	ldrsh r3, [r6, r3]
	add r0, r5, #0
	bl ov12_022682BC
	add r6, r0, #0
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, sp, #0x40
	add r2, sp, #0x3c
	bl sub_02013794
	cmp r7, #4
	bne _02267194
	mov r0, #0x4e
	lsl r0, r0, #4
	ldrh r0, [r5, r0]
	ldr r1, [sp, #0x40]
	add r0, #0x10
	add r0, r1, r0
	str r0, [sp, #0x40]
	b _0226719A
_02267194:
	ldr r0, [sp, #0x40]
	sub r0, #0x10
	str r0, [sp, #0x40]
_0226719A:
	mov r3, #0x11
	ldr r1, [sp, #0x40]
	ldr r2, [sp, #0x3c]
	lsl r3, r3, #4
	sub r2, r2, r3
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	add r0, r6, #0
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	lsl r3, r3, #0xc
	bl sub_0200DDF4
	ldr r0, [r5]
	bl BattleSystem_GetBattleType
	mov r1, #1
	lsl r1, r1, #0xc
	tst r0, r1
	bne _022671C4
_022671C2:
	b _02267384
_022671C4:
	ldr r0, [r5]
	mov r6, #0
	bl ov12_0223A9A4
	str r0, [sp, #0x1c]
	mov r0, #0x20
	mov r1, #5
	bl String_New
	add r7, r0, #0
	ldr r0, [r5]
	bl ov12_0223C134
	str r0, [sp, #0x24]
	cmp r0, #0
	beq _022672B6
	mov r1, #5
	add r2, r6, #0
	bl GetMonData
	cmp r0, #0
	beq _022672B6
	ldr r0, [sp, #0x24]
	bl GetMonGender
	cmp r0, #0
	beq _02267200
	cmp r0, #1
	beq _0226720E
	b _0226721C
_02267200:
	ldr r1, _0226732C ; =0x000004F8
	add r0, r4, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x20]
	ldr r6, _02267338 ; =0x000C0D00
	b _02267220
_0226720E:
	ldr r1, _0226733C ; =0x000004F9
	add r0, r4, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x20]
	ldr r6, _02267340 ; =0x000E0F00
	b _02267220
_0226721C:
	add r0, r6, #0
	str r0, [sp, #0x20]
_02267220:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _02267252
	str r6, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, _0226731C ; =0x00004E37
	mov r1, #0x52
	str r0, [sp, #8]
	mov r0, #0x88
	str r0, [sp, #0xc]
	mov r0, #0x10
	str r0, [sp, #0x10]
	mov r3, #0
	lsl r1, r1, #4
	str r3, [sp, #0x14]
	ldr r2, [sp, #0x20]
	add r0, r5, #0
	add r1, r5, r1
	str r3, [sp, #0x18]
	bl ov12_02268550
	ldr r0, [sp, #0x20]
	bl String_Delete
_02267252:
	ldr r0, [sp, #0x24]
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r0, [sp, #0x1c]
	mov r3, #3
	str r1, [sp, #4]
	bl BufferIntegerAsString
	ldr r1, _02267344 ; =0x000004FA
	add r0, r4, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	add r2, r6, #0
	bl StringExpandPlaceholders
	ldr r0, _02267348 ; =0x00090800
	ldr r1, _0226734C ; =0x00000534
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, _0226731C ; =0x00004E37
	mov r3, #0
	str r0, [sp, #8]
	mov r0, #0x90
	str r0, [sp, #0xc]
	mov r0, #0x10
	str r0, [sp, #0x10]
	str r3, [sp, #0x14]
	add r0, r5, #0
	add r1, r5, r1
	add r2, r7, #0
	str r3, [sp, #0x18]
	bl ov12_02268550
	add r0, r6, #0
	bl String_Delete
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	bl ov12_02268440
_022672B6:
	ldr r0, [r5]
	bl BattleSystem_GetSafariBallCount
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	mov r3, #2
	bl BufferIntegerAsString
	ldr r1, _02267350 ; =0x000004F7
	add r0, r4, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	ldr r0, _02267348 ; =0x00090800
	ldr r1, _02267354 ; =0x00000548
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, _0226731C ; =0x00004E37
	b _02267358
	.balign 4, 0
_022672F0: .word 0x000006E1
_022672F4: .word 0x0000068A
_022672F8: .word 0x000003A3
_022672FC: .word 0x000003A5
_02267300: .word 0x000004C7
_02267304: .word 0x000004F6
_02267308: .word 0x0000039E
_0226730C: .word 0x0000039D
_02267310: .word 0x0000039F
_02267314: .word 0x0000068F
_02267318: .word 0x00010203
_0226731C: .word 0x00004E37
_02267320: .word 0x00040506
_02267324: .word 0x000004E4
_02267328: .word 0x00070809
_0226732C: .word 0x000004F8
_02267330: .word 0x000A0B0C
_02267334: .word 0x0000050C
_02267338: .word 0x000C0D00
_0226733C: .word 0x000004F9
_02267340: .word 0x000E0F00
_02267344: .word 0x000004FA
_02267348: .word 0x00090800
_0226734C: .word 0x00000534
_02267350: .word 0x000004F7
_02267354: .word 0x00000548
_02267358:
	mov r3, #0
	str r0, [sp, #8]
	mov r0, #0xe0
	str r0, [sp, #0xc]
	mov r0, #0x10
	str r0, [sp, #0x10]
	str r3, [sp, #0x14]
	add r0, r5, #0
	add r1, r5, r1
	add r2, r7, #0
	str r3, [sp, #0x18]
	bl ov12_02268550
	add r0, r4, #0
	bl String_Delete
	add r0, r5, #0
	bl ov12_0226AC70
	add r0, r7, #0
	bl String_Delete
_02267384:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov12_02266F84

	thumb_func_start ov12_02267388
ov12_02267388: ; 0x02267388
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r4, [r5, #0x1c]
	bl ov12_0226739C
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02266E6C
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02267388

	thumb_func_start ov12_0226739C
ov12_0226739C: ; 0x0226739C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	bl ov12_02266F84
	ldr r0, [r5]
	bl BattleSystem_GetBgConfig
	mov r1, #0x10
	str r1, [sp]
	mov r1, #0x20
	str r1, [sp, #4]
	mov r1, #8
	str r1, [sp, #8]
	mov r1, #0x11
	str r1, [sp, #0xc]
	ldr r2, _022673F4 ; =0x000002FF
	add r4, r0, #0
	mov r1, #4
	mov r3, #0
	bl FillBgTilemapRect
	add r0, r4, #0
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _022673F8 ; =0x000004E4
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020137C0
	ldr r0, _022673FC ; =0x000004F8
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020137C0
	ldr r0, _02267400 ; =0x0000050C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020137C0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_022673F4: .word 0x000002FF
_022673F8: .word 0x000004E4
_022673FC: .word 0x000004F8
_02267400: .word 0x0000050C
	thumb_func_end ov12_0226739C

	thumb_func_start ov12_02267404
ov12_02267404: ; 0x02267404
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r4, [r5, #0x1c]
	bl ov12_02267418
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02266E6C
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02267404

	thumb_func_start ov12_02267418
ov12_02267418: ; 0x02267418
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	bl ov12_02266F84
	ldr r0, [r5]
	bl BattleSystem_GetBgConfig
	mov r1, #0x10
	str r1, [sp]
	mov r1, #0xa
	str r1, [sp, #4]
	mov r1, #8
	str r1, [sp, #8]
	mov r1, #0x11
	str r1, [sp, #0xc]
	ldr r2, _02267480 ; =0x000002FF
	mov r1, #4
	mov r3, #0
	add r4, r0, #0
	bl FillBgTilemapRect
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r2, _02267480 ; =0x000002FF
	add r0, r4, #0
	mov r1, #4
	mov r3, #0x16
	bl FillBgTilemapRect
	add r0, r4, #0
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _02267484 ; =0x000004E4
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020137C0
	ldr r0, _02267488 ; =0x000004F8
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020137C0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02267480: .word 0x000002FF
_02267484: .word 0x000004E4
_02267488: .word 0x000004F8
	thumb_func_end ov12_02267418

	thumb_func_start ov12_0226748C
ov12_0226748C: ; 0x0226748C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	add r6, r5, #0
	add r6, #0x1c
	bne _0226749C
	bl GF_AssertFail
_0226749C:
	ldrb r1, [r6, #0x10]
	ldr r0, _02267720 ; =0x0000068A
	strb r1, [r5, r0]
	ldr r0, [r5]
	bl ov12_0223A930
	str r0, [sp, #0x1c]
	ldrb r1, [r6, #0x10]
	add r0, r5, #0
	bl ov12_02268798
	str r0, [sp, #0x20]
	add r0, r5, #0
	bl ov12_02268AD0
	ldr r0, _02267724 ; =0x00070809
	mov r1, #0x4d
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, _02267728 ; =0x00004E37
	lsl r1, r1, #4
	str r0, [sp, #8]
	mov r0, #0x40
	str r0, [sp, #0xc]
	mov r0, #0x2d
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x20]
	add r1, r5, r1
	add r0, #0x28
	str r0, [sp, #0x18]
	add r0, r5, #0
	mov r2, #0
	mov r3, #4
	bl ov12_02268550
	ldr r0, _02267724 ; =0x00070809
	ldr r1, _0226772C ; =0x000004E4
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, _02267728 ; =0x00004E37
	add r1, r5, r1
	str r0, [sp, #8]
	mov r0, #0xc0
	str r0, [sp, #0xc]
	mov r0, #0x2c
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x20]
	mov r2, #0
	add r0, #0x3c
	str r0, [sp, #0x18]
	add r0, r5, #0
	mov r3, #4
	bl ov12_02268550
	ldr r0, _02267724 ; =0x00070809
	ldr r1, _02267730 ; =0x000004F8
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, _02267728 ; =0x00004E37
	add r1, r5, r1
	str r0, [sp, #8]
	mov r0, #0x40
	str r0, [sp, #0xc]
	mov r0, #0x6c
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x20]
	mov r2, #0
	add r0, #0x50
	str r0, [sp, #0x18]
	add r0, r5, #0
	mov r3, #4
	bl ov12_02268550
	ldr r0, _02267724 ; =0x00070809
	ldr r1, _02267734 ; =0x0000050C
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, _02267728 ; =0x00004E37
	add r1, r5, r1
	str r0, [sp, #8]
	mov r0, #0xc0
	str r0, [sp, #0xc]
	mov r0, #0x6b
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x20]
	mov r2, #0
	add r0, #0x64
	str r0, [sp, #0x18]
	add r0, r5, #0
	mov r3, #4
	bl ov12_02268550
	ldr r0, [sp, #0x20]
	mov r4, #0
	str r0, [sp, #0x28]
	add r0, #0x78
	str r0, [sp, #0x28]
	mov r0, #0x4d
	lsl r0, r0, #4
	add r7, r5, r0
	ldr r0, [sp, #0x20]
	add r0, #0xc8
	str r0, [sp, #0x20]
	b _0226760E
_02267584:
	add r1, r6, r4
	ldrb r0, [r1, #8]
	ldrb r1, [r1, #0xc]
	bl ov12_02269504
	str r0, [sp, #0x24]
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02267728 ; =0x00004E37
	ldr r1, _02267738 ; =ov12_0226E308
	str r0, [sp, #8]
	lsl r0, r4, #2
	ldrh r1, [r1, r0]
	add r2, r4, #0
	add r2, #9
	str r1, [sp, #0xc]
	ldr r1, _02267738 ; =ov12_0226E308
	add r0, r1, r0
	ldrh r0, [r0, #2]
	add r1, r4, #0
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	mov r0, #0x14
	mul r1, r0
	ldr r0, [sp, #0x28]
	add r0, r0, r1
	mov r1, #0x14
	mul r1, r2
	mov r2, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r7, r1
	add r3, r2, #0
	bl ov12_02268550
	ldr r0, [sp, #0x24]
	ldr r1, _0226773C ; =ov12_0226E2C8
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _02267728 ; =0x00004E37
	add r2, r4, #5
	str r0, [sp, #8]
	lsl r0, r4, #2
	ldrh r1, [r1, r0]
	str r1, [sp, #0xc]
	ldr r1, _0226773C ; =ov12_0226E2C8
	add r0, r1, r0
	ldrh r0, [r0, #2]
	add r1, r4, #0
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	mov r0, #0x14
	mul r1, r0
	ldr r0, [sp, #0x20]
	add r0, r0, r1
	mov r1, #0x14
	mul r1, r2
	mov r2, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r7, r1
	add r3, r2, #0
	bl ov12_02268550
	add r4, r4, #1
_0226760E:
	cmp r4, #4
	blt _02267584
	ldr r0, [sp, #0x1c]
	ldr r1, _02267740 ; =0x000003A1
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, _02267744 ; =0x000A0B0C
	mov r1, #0x52
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02267728 ; =0x00004E37
	lsl r1, r1, #4
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	mov r0, #0xaf
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r5, r1
	add r2, r4, #0
	mov r3, #4
	bl ov12_02268550
	add r0, r4, #0
	bl String_Delete
	mov r4, #0
	mov r7, #3
	b _0226767A
_02267654:
	lsl r0, r4, #1
	ldrh r0, [r6, r0]
	cmp r0, #0
	beq _0226766E
	add r1, r7, #0
	bl GetMoveAttr
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl ov12_02268C30
	b _02267678
_0226766E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02268C4C
	b _0226767E
_02267678:
	add r4, r4, #1
_0226767A:
	cmp r4, #4
	blt _02267654
_0226767E:
	ldr r0, [r5]
	bl BattleSystem_GetBgConfig
	ldrh r0, [r6]
	cmp r0, #0
	bne _022676AA
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020137C0
	ldr r0, _02267748 ; =0x00000534
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020137C0
	ldr r0, _0226774C ; =0x00000584
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020137C0
_022676AA:
	ldrh r0, [r6, #2]
	cmp r0, #0
	bne _022676CE
	ldr r0, _0226772C ; =0x000004E4
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020137C0
	ldr r0, _02267750 ; =0x00000548
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020137C0
	ldr r0, _02267754 ; =0x00000598
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020137C0
_022676CE:
	ldrh r0, [r6, #4]
	cmp r0, #0
	bne _022676F2
	ldr r0, _02267730 ; =0x000004F8
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020137C0
	ldr r0, _02267758 ; =0x0000055C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020137C0
	ldr r0, _0226775C ; =0x000005AC
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020137C0
_022676F2:
	ldrh r0, [r6, #6]
	cmp r0, #0
	bne _0226771A
	ldr r0, _02267734 ; =0x0000050C
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_020137C0
	mov r0, #0x57
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020137C0
	mov r0, #0x17
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020137C0
_0226771A:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02267720: .word 0x0000068A
_02267724: .word 0x00070809
_02267728: .word 0x00004E37
_0226772C: .word 0x000004E4
_02267730: .word 0x000004F8
_02267734: .word 0x0000050C
_02267738: .word ov12_0226E308
_0226773C: .word ov12_0226E2C8
_02267740: .word 0x000003A1
_02267744: .word 0x000A0B0C
_02267748: .word 0x00000534
_0226774C: .word 0x00000584
_02267750: .word 0x00000548
_02267754: .word 0x00000598
_02267758: .word 0x0000055C
_0226775C: .word 0x000005AC
	thumb_func_end ov12_0226748C

	thumb_func_start ov12_02267760
ov12_02267760: ; 0x02267760
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, [r5]
	bl ov12_0223A930
	mov r1, #0xeb
	lsl r1, r1, #2
	add r6, r0, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _022677E8 ; =0x000003AD
	add r0, r6, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, _022677EC ; =0x00010203
	mov r1, #0x4d
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _022677F0 ; =0x00004E37
	lsl r1, r1, #4
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	mov r0, #0x43
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r5, r1
	add r2, r4, #0
	mov r3, #4
	bl ov12_02268550
	ldr r0, _022677F4 ; =0x000A0B0C
	ldr r1, _022677F8 ; =0x000004E4
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _022677F0 ; =0x00004E37
	add r1, r5, r1
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	mov r0, #0x8b
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #4
	bl ov12_02268550
	add r0, r4, #0
	bl String_Delete
	add r0, r6, #0
	bl String_Delete
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_022677E8: .word 0x000003AD
_022677EC: .word 0x00010203
_022677F0: .word 0x00004E37
_022677F4: .word 0x000A0B0C
_022677F8: .word 0x000004E4
	thumb_func_end ov12_02267760

	thumb_func_start ov12_022677FC
ov12_022677FC: ; 0x022677FC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, [r5]
	bl ov12_0223A930
	ldr r1, _02267884 ; =0x0000049D
	add r6, r0, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _02267888 ; =0x0000049E
	add r0, r6, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, _0226788C ; =0x00010203
	mov r1, #0x4d
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02267890 ; =0x00004E37
	lsl r1, r1, #4
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	mov r0, #0x43
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r5, r1
	add r2, r4, #0
	mov r3, #4
	bl ov12_02268550
	ldr r0, _02267894 ; =0x000A0B0C
	ldr r1, _02267898 ; =0x000004E4
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02267890 ; =0x00004E37
	add r1, r5, r1
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	mov r0, #0x8b
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #4
	bl ov12_02268550
	add r0, r4, #0
	bl String_Delete
	add r0, r6, #0
	bl String_Delete
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	nop
_02267884: .word 0x0000049D
_02267888: .word 0x0000049E
_0226788C: .word 0x00010203
_02267890: .word 0x00004E37
_02267894: .word 0x000A0B0C
_02267898: .word 0x000004E4
	thumb_func_end ov12_022677FC

	thumb_func_start ov12_0226789C
ov12_0226789C: ; 0x0226789C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldr r0, [r5]
	bl ov12_0223A930
	add r6, r0, #0
	ldr r0, [r5]
	bl ov12_0223A9A4
	add r4, r0, #0
	ldr r1, _0226796C ; =0x000004A2
	add r0, r6, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x1c]
	ldr r1, _02267970 ; =0x000004A3
	add r0, r6, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x20]
	mov r0, #0x64
	mov r1, #5
	bl String_New
	add r6, r0, #0
	mov r0, #0x64
	mov r1, #5
	bl String_New
	add r7, r0, #0
	ldrh r2, [r5, #0x1c]
	add r0, r4, #0
	mov r1, #0
	bl BufferMoveName
	ldr r2, [sp, #0x1c]
	add r0, r4, #0
	add r1, r6, #0
	bl StringExpandPlaceholders
	ldr r2, [sp, #0x20]
	add r0, r4, #0
	add r1, r7, #0
	bl StringExpandPlaceholders
	ldr r0, _02267974 ; =0x00010203
	mov r1, #0x4d
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02267978 ; =0x00004E37
	lsl r1, r1, #4
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	mov r0, #0x43
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r5, r1
	add r2, r6, #0
	mov r3, #4
	bl ov12_02268550
	ldr r0, _0226797C ; =0x000A0B0C
	ldr r1, _02267980 ; =0x000004E4
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02267978 ; =0x00004E37
	add r1, r5, r1
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	mov r0, #0x8b
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r2, r7, #0
	mov r3, #4
	bl ov12_02268550
	ldr r0, [sp, #0x1c]
	bl String_Delete
	ldr r0, [sp, #0x20]
	bl String_Delete
	add r0, r6, #0
	bl String_Delete
	add r0, r7, #0
	bl String_Delete
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0226796C: .word 0x000004A2
_02267970: .word 0x000004A3
_02267974: .word 0x00010203
_02267978: .word 0x00004E37
_0226797C: .word 0x000A0B0C
_02267980: .word 0x000004E4
	thumb_func_end ov12_0226789C

	thumb_func_start ov12_02267984
ov12_02267984: ; 0x02267984
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _02267A48 ; =0x04001050
	mov r1, #2
	mov r2, #0xf
	mov r3, #0x1f
	bl G2x_SetBlendAlpha_
	ldr r0, [r5]
	bl ov12_0223A930
	ldr r1, _02267A4C ; =0x000004EC
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #5
	str r0, [sp]
	mov r0, #7
	mov r1, #0x28
	mov r2, #1
	add r3, sp, #0x1c
	bl GfGfxLoader_GetScrnData
	add r6, r0, #0
	ldr r0, [sp, #0x1c]
	mov r2, #2
	ldr r1, [r5, #0x58]
	add r0, #0xc
	lsl r2, r2, #0xa
	bl MIi_CpuCopy32
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, [r5]
	bl BattleSystem_GetBgConfig
	mov r1, #4
	ldr r2, [r5, #0x58]
	add r6, r0, #0
	lsl r3, r1, #9
	bl BG_LoadScreenTilemapData
	add r0, r6, #0
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5]
	bl BattleSystem_GetBgConfig
	mov r2, #2
	add r6, r0, #0
	ldr r1, [r5, #0x50]
	mov r0, #0
	lsl r2, r2, #0xa
	bl MIi_CpuClear32
	mov r3, #2
	ldr r2, [r5, #0x50]
	add r0, r6, #0
	mov r1, #5
	lsl r3, r3, #0xa
	bl BG_LoadScreenTilemapData
	add r0, r6, #0
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _02267A50 ; =0x00010203
	mov r1, #0x4d
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02267A54 ; =0x00004E37
	lsl r1, r1, #4
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	mov r0, #0xab
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r5, r1
	add r2, r4, #0
	mov r3, #4
	bl ov12_02268550
	add r0, r4, #0
	bl String_Delete
	add sp, #0x20
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02267A48: .word 0x04001050
_02267A4C: .word 0x000004EC
_02267A50: .word 0x00010203
_02267A54: .word 0x00004E37
	thumb_func_end ov12_02267984

	thumb_func_start ov12_02267A58
ov12_02267A58: ; 0x02267A58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldr r0, [r5]
	bl ov12_0223A930
	add r6, r0, #0
	ldr r0, [r5]
	bl ov12_0223A9A4
	add r4, r0, #0
	ldr r1, _02267B28 ; =0x000004C1
	add r0, r6, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x1c]
	ldr r1, _02267B2C ; =0x000004C2
	add r0, r6, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x20]
	mov r0, #0x64
	mov r1, #5
	bl String_New
	add r6, r0, #0
	mov r0, #0x64
	mov r1, #5
	bl String_New
	add r7, r0, #0
	ldrh r2, [r5, #0x1c]
	add r0, r4, #0
	mov r1, #0
	bl BufferMoveName
	ldr r2, [sp, #0x1c]
	add r0, r4, #0
	add r1, r6, #0
	bl StringExpandPlaceholders
	ldr r2, [sp, #0x20]
	add r0, r4, #0
	add r1, r7, #0
	bl StringExpandPlaceholders
	ldr r0, _02267B30 ; =0x00010203
	mov r1, #0x4d
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02267B34 ; =0x00004E37
	lsl r1, r1, #4
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	mov r0, #0x43
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r5, r1
	add r2, r6, #0
	mov r3, #4
	bl ov12_02268550
	ldr r0, _02267B38 ; =0x000A0B0C
	ldr r1, _02267B3C ; =0x000004E4
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02267B34 ; =0x00004E37
	add r1, r5, r1
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	mov r0, #0x8b
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r2, r7, #0
	mov r3, #4
	bl ov12_02268550
	ldr r0, [sp, #0x1c]
	bl String_Delete
	ldr r0, [sp, #0x20]
	bl String_Delete
	add r0, r6, #0
	bl String_Delete
	add r0, r7, #0
	bl String_Delete
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02267B28: .word 0x000004C1
_02267B2C: .word 0x000004C2
_02267B30: .word 0x00010203
_02267B34: .word 0x00004E37
_02267B38: .word 0x000A0B0C
_02267B3C: .word 0x000004E4
	thumb_func_end ov12_02267A58

	thumb_func_start ov12_02267B40
ov12_02267B40: ; 0x02267B40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldr r0, [r5]
	bl ov12_0223A930
	add r6, r0, #0
	ldr r0, [r5]
	bl ov12_0223A9A4
	add r4, r0, #0
	ldr r1, _02267C10 ; =0x000004BF
	add r0, r6, #0
	bl NewString_ReadMsgData
	mov r1, #0x13
	str r0, [sp, #0x1c]
	add r0, r6, #0
	lsl r1, r1, #6
	bl NewString_ReadMsgData
	str r0, [sp, #0x20]
	mov r0, #0x64
	mov r1, #5
	bl String_New
	add r6, r0, #0
	mov r0, #0x64
	mov r1, #5
	bl String_New
	add r7, r0, #0
	ldrh r2, [r5, #0x1c]
	add r0, r4, #0
	mov r1, #0
	bl BufferMoveName
	ldr r2, [sp, #0x1c]
	add r0, r4, #0
	add r1, r6, #0
	bl StringExpandPlaceholders
	ldr r2, [sp, #0x20]
	add r0, r4, #0
	add r1, r7, #0
	bl StringExpandPlaceholders
	ldr r0, _02267C14 ; =0x00010203
	mov r1, #0x4d
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02267C18 ; =0x00004E37
	lsl r1, r1, #4
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	mov r0, #0x43
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r5, r1
	add r2, r6, #0
	mov r3, #4
	bl ov12_02268550
	ldr r0, _02267C1C ; =0x000A0B0C
	ldr r1, _02267C20 ; =0x000004E4
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02267C18 ; =0x00004E37
	add r1, r5, r1
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	mov r0, #0x8b
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r2, r7, #0
	mov r3, #4
	bl ov12_02268550
	ldr r0, [sp, #0x1c]
	bl String_Delete
	ldr r0, [sp, #0x20]
	bl String_Delete
	add r0, r6, #0
	bl String_Delete
	add r0, r7, #0
	bl String_Delete
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02267C10: .word 0x000004BF
_02267C14: .word 0x00010203
_02267C18: .word 0x00004E37
_02267C1C: .word 0x000A0B0C
_02267C20: .word 0x000004E4
	thumb_func_end ov12_02267B40

	thumb_func_start ov12_02267C24
ov12_02267C24: ; 0x02267C24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r5, r0, #0
	add r7, r5, #0
	add r7, #0x1c
	add r0, r7, #0
	add r0, #0x21
	ldrb r1, [r0]
	ldr r0, _02267DEC ; =0x0000068C
	strb r1, [r5, r0]
	add r1, r7, #0
	add r1, #0x20
	ldrb r1, [r1]
	sub r0, r0, #2
	strb r1, [r5, r0]
	ldr r0, [r5]
	bl ov12_0223A930
	str r0, [sp, #0x2c]
	ldr r0, [r5]
	bl ov12_0223A9A4
	str r0, [sp, #0x1c]
	add r0, r5, #0
	add r1, sp, #0x40
	mov r2, #0
	bl ov12_02268DD4
	add r0, r5, #0
	bl ov12_02268194
	add r0, r5, #0
	bl ov12_022686BC
	add r1, sp, #0x38
	ldr r0, [r5]
	add r1, #2
	bl ov12_0223C1C4
	ldr r0, [r5]
	add r1, sp, #0x34
	bl ov12_0223C1A0
	mov r0, #0x18
	mov r1, #5
	bl String_New
	str r0, [sp, #0x28]
	mov r0, #0x4d
	lsl r0, r0, #4
	add r0, r5, r0
	mov r4, #0
	str r0, [sp, #0x30]
	b _02267D9C
_02267C90:
	add r1, r4, #2
	add r0, sp, #0x34
	ldrb r6, [r0, r1]
	lsl r0, r6, #3
	add r0, r7, r0
	ldrb r1, [r0, #1]
	lsl r0, r1, #0x1d
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _02267D8A
	add r0, sp, #0x40
	ldrb r0, [r0, r4]
	cmp r0, #1
	bne _02267D8A
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1e
	bne _02267CBE
	ldr r0, [sp, #0x2c]
	ldr r1, _02267DF0 ; =0x000003C2
	bl NewString_ReadMsgData
	str r0, [sp, #0x24]
	b _02267CDA
_02267CBE:
	cmp r0, #1
	bne _02267CCE
	ldr r0, [sp, #0x2c]
	ldr r1, _02267DF4 ; =0x000003C3
	bl NewString_ReadMsgData
	str r0, [sp, #0x24]
	b _02267CDA
_02267CCE:
	mov r1, #0xf1
	ldr r0, [sp, #0x2c]
	lsl r1, r1, #2
	bl NewString_ReadMsgData
	str r0, [sp, #0x24]
_02267CDA:
	lsl r2, r6, #3
	ldrb r2, [r7, r2]
	ldr r0, [r5]
	add r1, r6, #0
	bl BattleSystem_GetPartyMon
	str r0, [sp, #0x20]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [sp, #0x1c]
	mov r1, #0
	bl BufferBoxMonNickname
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x24]
	bl StringExpandPlaceholders
	mov r0, #1
	tst r0, r4
	beq _02267D0A
	ldr r0, _02267DF8 ; =0x00010203
	b _02267D0C
_02267D0A:
	ldr r0, _02267DFC ; =0x00040506
_02267D0C:
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	ldr r0, _02267E00 ; =0x00004E37
	ldr r1, _02267E04 ; =ov12_0226E370
	str r0, [sp, #8]
	lsl r0, r4, #2
	ldrh r1, [r1, r0]
	add r2, r4, #0
	mov r3, #4
	str r1, [sp, #0xc]
	ldr r1, _02267E04 ; =ov12_0226E370
	add r0, r1, r0
	ldrh r0, [r0, #2]
	mov r1, #0x14
	mul r2, r1
	ldr r1, [sp, #0x30]
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	add r1, r1, r2
	str r0, [sp, #0x18]
	ldr r2, [sp, #0x28]
	add r0, r5, #0
	bl ov12_02268550
	ldr r0, [sp, #0x24]
	bl String_Delete
	cmp r4, #1
	beq _02267D52
	cmp r4, #3
	beq _02267D6E
	b _02267D9A
_02267D52:
	lsl r0, r6, #3
	add r6, r7, r0
	ldrh r0, [r6, #6]
	mov r3, #4
	ldr r1, [sp, #0x20]
	str r0, [sp]
	ldrb r0, [r6, #2]
	mov r2, #3
	str r0, [sp, #4]
	ldrsh r3, [r6, r3]
	add r0, r5, #0
	bl ov12_022682BC
	b _02267D9A
_02267D6E:
	lsl r0, r6, #3
	add r6, r7, r0
	ldrh r0, [r6, #6]
	mov r3, #4
	ldr r1, [sp, #0x20]
	str r0, [sp]
	ldrb r0, [r6, #2]
	mov r2, #5
	str r0, [sp, #4]
	ldrsh r3, [r6, r3]
	add r0, r5, #0
	bl ov12_022682BC
	b _02267D9A
_02267D8A:
	add r0, sp, #0x40
	ldrb r0, [r0, r4]
	cmp r0, #0
	bne _02267D9A
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02268CA0
_02267D9A:
	add r4, r4, #1
_02267D9C:
	cmp r4, #4
	bge _02267DA2
	b _02267C90
_02267DA2:
	ldr r0, [sp, #0x28]
	bl String_Delete
	ldr r0, [sp, #0x2c]
	ldr r1, _02267E08 ; =0x000003A2
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, _02267E0C ; =0x000A0B0C
	add r2, r4, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _02267E00 ; =0x00004E37
	mov r3, #4
	str r0, [sp, #8]
	ldr r0, _02267E10 ; =ov12_0226E37C
	ldrh r1, [r0, #4]
	str r1, [sp, #0xc]
	ldrh r0, [r0, #6]
	mov r1, #0x52
	lsl r1, r1, #4
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r5, r1
	bl ov12_02268550
	add r0, r4, #0
	bl String_Delete
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_02267DEC: .word 0x0000068C
_02267DF0: .word 0x000003C2
_02267DF4: .word 0x000003C3
_02267DF8: .word 0x00010203
_02267DFC: .word 0x00040506
_02267E00: .word 0x00004E37
_02267E04: .word ov12_0226E370
_02267E08: .word 0x000003A2
_02267E0C: .word 0x000A0B0C
_02267E10: .word ov12_0226E37C
	thumb_func_end ov12_02267C24

	thumb_func_start ov12_02267E14
ov12_02267E14: ; 0x02267E14
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	mov r0, #0xff
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #1
	cmp r0, #5
	bhi _02267E3C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02267E30: ; jump table
	.short _02267E3C - _02267E30 - 2 ; case 0
	.short _02267E3C - _02267E30 - 2 ; case 1
	.short _02267E40 - _02267E30 - 2 ; case 2
	.short _02267E64 - _02267E30 - 2 ; case 3
	.short _02267E6A - _02267E30 - 2 ; case 4
	.short _02267E70 - _02267E30 - 2 ; case 5
_02267E3C:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_02267E40:
	ldr r0, _02267EDC ; =0x0000068A
	mov r7, #0
	ldrb r0, [r4, r0]
	add r6, r7, #0
	cmp r0, #0
	beq _02267E56
	cmp r0, #2
	beq _02267E5A
	cmp r0, #4
	beq _02267E5A
	b _02267E74
_02267E56:
	str r0, [sp]
	b _02267E74
_02267E5A:
	ldr r0, _02267EDC ; =0x0000068A
	ldrb r0, [r4, r0]
	sub r0, r0, #2
	str r0, [sp]
	b _02267E74
_02267E64:
	mov r7, #1
	add r6, r7, #0
	b _02267E74
_02267E6A:
	mov r7, #2
	mov r6, #1
	b _02267E74
_02267E70:
	mov r7, #3
	mov r6, #1
_02267E74:
	add r0, r4, #0
	add r1, r2, #0
	bl ov12_02268EE0
	ldr r0, _02267EE0 ; =ov12_02268F58
	add r1, r4, #0
	bl ov12_02268E84
	ldr r0, _02267EE4 ; =ov12_0226E3D8
	sub r2, r5, #1
	mov r1, #6
	mul r1, r2
	add r0, r0, r1
	mov r1, #0x6a
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, _02267EE8 ; =ov12_0226E318
	lsl r2, r2, #2
	add r3, r0, r2
	add r0, r1, #4
	str r3, [r4, r0]
	add r0, r1, #0
	mov r3, #1
	add r0, #0xc
	strb r3, [r4, r0]
	add r0, r1, #0
	add r0, #8
	str r5, [r4, r0]
	add r0, r1, #0
	add r0, #0xd
	strb r7, [r4, r0]
	add r0, r1, #0
	ldr r7, [sp]
	add r0, #0xe
	strb r7, [r4, r0]
	add r0, r1, #0
	add r0, #0xf
	strb r6, [r4, r0]
	ldr r0, _02267EEC ; =ov12_0226E2D8
	add r6, r0, r2
	ldrh r2, [r0, r2]
	add r0, r1, #0
	add r0, #0x12
	strh r2, [r4, r0]
	add r0, r1, #0
	ldrh r2, [r6, #2]
	add r0, #0x14
	add r1, #0x10
	strh r2, [r4, r0]
	strb r3, [r4, r1]
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02267EDC: .word 0x0000068A
_02267EE0: .word ov12_02268F58
_02267EE4: .word ov12_0226E3D8
_02267EE8: .word ov12_0226E318
_02267EEC: .word ov12_0226E2D8
	thumb_func_end ov12_02267E14

	thumb_func_start ov12_02267EF0
ov12_02267EF0: ; 0x02267EF0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0
	add r4, r1, #0
	mvn r0, r0
	add r1, r2, #0
	cmp r4, r0
	bne _02267F04
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_02267F04:
	add r2, r5, #0
	add r2, #0x1c
	cmp r4, #1
	blt _02267F1A
	cmp r4, #4
	bgt _02267F1A
	sub r3, r4, #1
	lsl r3, r3, #1
	ldrh r2, [r2, r3]
	cmp r2, #0
	beq _02267F88
_02267F1A:
	sub r0, r4, #1
	cmp r4, #4
	bgt _02267F3C
	add r2, r4, #1
	bmi _02267F40
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02267F30: ; jump table
	.short _02267F40 - _02267F30 - 2 ; case 0
	.short _02267F40 - _02267F30 - 2 ; case 1
	.short _02267F46 - _02267F30 - 2 ; case 2
	.short _02267F46 - _02267F30 - 2 ; case 3
	.short _02267F46 - _02267F30 - 2 ; case 4
	.short _02267F46 - _02267F30 - 2 ; case 5
_02267F3C:
	cmp r4, #0xff
	beq _02267F56
_02267F40:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02267F46:
	mov r2, #6
	mul r2, r0
	ldr r3, _02267F8C ; =ov12_0226E428
	lsl r0, r0, #2
	add r7, r3, r2
	ldr r2, _02267F90 ; =ov12_0226E398
	add r6, r2, r0
	b _02267F5A
_02267F56:
	ldr r7, _02267F94 ; =ov12_0226E440
	ldr r6, _02267F98 ; =ov12_0226E3A8
_02267F5A:
	add r0, r5, #0
	bl ov12_02268EE0
	ldr r0, _02267F9C ; =ov12_022690A8
	add r1, r5, #0
	bl ov12_02268E84
	mov r1, #0x6a
	lsl r1, r1, #4
	str r7, [r5, r1]
	add r0, r1, #4
	str r6, [r5, r0]
	add r0, r1, #0
	mov r2, #3
	add r0, #0xc
	strb r2, [r5, r0]
	add r0, r1, #0
	add r0, #8
	str r4, [r5, r0]
	mov r0, #1
	add r1, #0x10
	strb r0, [r5, r1]
	add r0, r4, #0
_02267F88:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02267F8C: .word ov12_0226E428
_02267F90: .word ov12_0226E398
_02267F94: .word ov12_0226E440
_02267F98: .word ov12_0226E3A8
_02267F9C: .word ov12_022690A8
	thumb_func_end ov12_02267EF0

	thumb_func_start ov12_02267FA0
ov12_02267FA0: ; 0x02267FA0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0
	add r4, r1, #0
	mvn r0, r0
	cmp r4, r0
	beq _02267FB6
	cmp r4, #1
	beq _02267FBA
	cmp r4, #0xff
	beq _02267FBE
_02267FB6:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_02267FBA:
	mov r6, #0
	b _02267FC0
_02267FBE:
	mov r6, #1
_02267FC0:
	add r0, r5, #0
	add r1, r2, #0
	bl ov12_02268EE0
	ldr r0, _0226800C ; =ov12_02268F58
	add r1, r5, #0
	bl ov12_02268E84
	cmp r4, #1
	bne _02267FE0
	mov r0, #0x6a
	ldr r1, _02268010 ; =ov12_0226E286
	lsl r0, r0, #4
	str r1, [r5, r0]
	ldr r1, _02268014 ; =ov12_0226E24C
	b _02267FEA
_02267FE0:
	mov r0, #0x6a
	ldr r1, _02268018 ; =ov12_0226E280
	lsl r0, r0, #4
	str r1, [r5, r0]
	ldr r1, _0226801C ; =ov12_0226E248
_02267FEA:
	add r0, r0, #4
	str r1, [r5, r0]
	ldr r0, _02268020 ; =0x000006AC
	mov r1, #6
	strb r1, [r5, r0]
	sub r1, r0, #4
	str r4, [r5, r1]
	add r1, r0, #1
	strb r6, [r5, r1]
	add r1, r0, #3
	mov r2, #3
	strb r2, [r5, r1]
	mov r1, #1
	add r0, r0, #4
	strb r1, [r5, r0]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0226800C: .word ov12_02268F58
_02268010: .word ov12_0226E286
_02268014: .word ov12_0226E24C
_02268018: .word ov12_0226E280
_0226801C: .word ov12_0226E248
_02268020: .word 0x000006AC
	thumb_func_end ov12_02267FA0

	thumb_func_start ov12_02268024
ov12_02268024: ; 0x02268024
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r1, #0
	add r1, sp, #0
	mov r2, #1
	add r4, r0, #0
	bl ov12_02268DD4
	cmp r5, #4
	bgt _02268054
	add r0, r5, #1
	bmi _02268058
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02268048: ; jump table
	.short _02268058 - _02268048 - 2 ; case 0
	.short _02268058 - _02268048 - 2 ; case 1
	.short _0226805E - _02268048 - 2 ; case 2
	.short _0226806E - _02268048 - 2 ; case 3
	.short _0226807E - _02268048 - 2 ; case 4
	.short _0226808E - _02268048 - 2 ; case 5
_02268054:
	cmp r5, #0xff
	beq _0226809E
_02268058:
	add sp, #4
	add r0, r5, #0
	pop {r3, r4, r5, r6, pc}
_0226805E:
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0
	bne _022680E4
	mov r0, #0
	add sp, #4
	mvn r0, r0
	pop {r3, r4, r5, r6, pc}
_0226806E:
	add r0, sp, #0
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _022680E4
	mov r0, #0
	add sp, #4
	mvn r0, r0
	pop {r3, r4, r5, r6, pc}
_0226807E:
	add r0, sp, #0
	ldrb r0, [r0, #2]
	cmp r0, #0
	bne _022680E4
	mov r0, #0
	add sp, #4
	mvn r0, r0
	pop {r3, r4, r5, r6, pc}
_0226808E:
	add r0, sp, #0
	ldrb r0, [r0, #3]
	cmp r0, #0
	bne _022680E4
	mov r0, #0
	add sp, #4
	mvn r0, r0
	pop {r3, r4, r5, r6, pc}
_0226809E:
	add r0, r4, #0
	mov r1, #4
	bl ov12_02268EE0
	ldr r0, _02268118 ; =ov12_02268F58
	add r1, r4, #0
	bl ov12_02268E84
	mov r1, #0x6a
	ldr r0, _0226811C ; =ov12_0226E420
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r2, _02268120 ; =ov12_0226E358
	add r0, r1, #4
	str r2, [r4, r0]
	add r0, r1, #0
	mov r2, #4
	add r0, #0xc
	strb r2, [r4, r0]
	add r0, r1, #0
	add r0, #8
	str r5, [r4, r0]
	add r0, r1, #0
	add r0, #0xd
	strb r2, [r4, r0]
	add r0, r1, #0
	mov r2, #3
	add r0, #0xf
	strb r2, [r4, r0]
	mov r0, #1
	add r1, #0x10
	strb r0, [r4, r1]
	add sp, #4
	add r0, r5, #0
	pop {r3, r4, r5, r6, pc}
_022680E4:
	ldr r0, [r4]
	bl BattleSystem_GetBgConfig
	ldr r2, _02268124 ; =0x000002FF
	add r6, r0, #0
	mov r1, #5
	bl BgFillTilemapBufferAndCommit
	add r0, r6, #0
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_02268EDC
	ldr r0, _02268128 ; =ov12_02269360
	add r1, r4, #0
	bl ov12_02268E84
	ldr r0, _0226812C ; =0x000006BC
	str r5, [r4, r0]
	add r0, r5, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02268118: .word ov12_02268F58
_0226811C: .word ov12_0226E420
_02268120: .word ov12_0226E358
_02268124: .word 0x000002FF
_02268128: .word ov12_02269360
_0226812C: .word 0x000006BC
	thumb_func_end ov12_02268024

	thumb_func_start ov12_02268130
ov12_02268130: ; 0x02268130
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0
	mvn r1, r1
	add r5, r0, #0
	cmp r4, r1
	beq _02268142
	cmp r4, #1
	beq _02268146
_02268142:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_02268146:
	add r1, r2, #0
	bl ov12_02268EE0
	ldr r0, _02268188 ; =ov12_02268F58
	add r1, r5, #0
	bl ov12_02268E84
	mov r1, #0x6a
	ldr r0, _0226818C ; =ov12_0226E228
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r2, _02268190 ; =ov12_0226E20C
	add r0, r1, #4
	str r2, [r5, r0]
	add r0, r1, #0
	mov r2, #6
	add r0, #0xc
	strb r2, [r5, r0]
	add r0, r1, #0
	add r0, #8
	str r4, [r5, r0]
	add r0, r1, #0
	mov r3, #0
	add r0, #0xd
	strb r3, [r5, r0]
	add r0, r1, #0
	mov r2, #3
	add r0, #0xf
	strb r2, [r5, r0]
	add r1, #0x10
	strb r3, [r5, r1]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02268188: .word ov12_02268F58
_0226818C: .word ov12_0226E228
_02268190: .word ov12_0226E20C
	thumb_func_end ov12_02268130

	thumb_func_start ov12_02268194
ov12_02268194: ; 0x02268194
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, [r5]
	bl ov12_0223A8E4
	add r4, r0, #0
	ldr r0, [r5]
	bl ov12_0223A8EC
	add r6, r0, #0
	ldr r0, [r5]
	bl BattleSystem_GetPaletteData
	add r5, r0, #0
	bl sub_02074490
	mov r1, #0x14
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r1, #3
	str r1, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _0226820C ; =0x00004E36
	add r2, r4, #0
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r3, r6, #0
	bl sub_0200D644
	bl sub_02074498
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _02268210 ; =0x00004E35
	add r1, r6, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x14
	bl sub_0200D6D4
	bl sub_020744A4
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _02268210 ; =0x00004E35
	add r1, r6, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x14
	bl sub_0200D704
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_0226820C: .word 0x00004E36
_02268210: .word 0x00004E35
	thumb_func_end ov12_02268194

	thumb_func_start ov12_02268214
ov12_02268214: ; 0x02268214
	push {r4, lr}
	ldr r0, [r0]
	bl ov12_0223A8EC
	ldr r1, _02268250 ; =0x00004E44
	add r4, r0, #0
	bl sub_0200D958
	ldr r1, _02268254 ; =0x00004E45
	add r0, r4, #0
	bl sub_0200D958
	ldr r1, _02268258 ; =0x00004E46
	add r0, r4, #0
	bl sub_0200D958
	ldr r1, _0226825C ; =0x00004E35
	add r0, r4, #0
	bl sub_0200D978
	ldr r1, _0226825C ; =0x00004E35
	add r0, r4, #0
	bl sub_0200D988
	ldr r1, _02268260 ; =0x00004E36
	add r0, r4, #0
	bl sub_0200D968
	pop {r4, pc}
	nop
_02268250: .word 0x00004E44
_02268254: .word 0x00004E45
_02268258: .word 0x00004E46
_0226825C: .word 0x00004E35
_02268260: .word 0x00004E36
	thumb_func_end ov12_02268214

	thumb_func_start ov12_02268264
ov12_02268264: ; 0x02268264
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	str r0, [sp]
	add r5, r0, #0
	add r6, r4, #0
	add r7, r4, #0
_02268270:
	ldr r0, _022682B0 ; =0x00000628
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02268280
	bl sub_0200D9DC
	ldr r0, _022682B0 ; =0x00000628
	str r6, [r5, r0]
_02268280:
	ldr r0, _022682B4 ; =0x00000638
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02268290
	bl DestroySysTask
	ldr r0, _022682B4 ; =0x00000638
	str r7, [r5, r0]
_02268290:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02268270
	ldr r1, _022682B8 ; =0x000006EC
	ldr r0, [sp]
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _022682AE
	bl sub_0200D9DC
	ldr r1, _022682B8 ; =0x000006EC
	ldr r0, [sp]
	mov r2, #0
	str r2, [r0, r1]
_022682AE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022682B0: .word 0x00000628
_022682B4: .word 0x00000638
_022682B8: .word 0x000006EC
	thumb_func_end ov12_02268264

	thumb_func_start ov12_022682BC
ov12_022682BC: ; 0x022682BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	add r6, r2, #0
	add r4, r0, #0
	str r1, [sp, #0xc]
	str r3, [sp, #0x10]
	cmp r6, #2
	blt _022682D0
	sub r5, r6, #2
	b _022682D2
_022682D0:
	add r5, r6, #0
_022682D2:
	lsl r0, r5, #2
	add r1, r4, r0
	ldr r0, _0226841C ; =0x00000628
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022682E2
	bl GF_AssertFail
_022682E2:
	lsl r0, r5, #2
	add r1, r4, r0
	ldr r0, _02268420 ; =0x00000638
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022682F2
	bl GF_AssertFail
_022682F2:
	cmp r6, #5
	bhi _0226831A
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02268302: ; jump table
	.short _0226830E - _02268302 - 2 ; case 0
	.short _0226831A - _02268302 - 2 ; case 1
	.short _0226830E - _02268302 - 2 ; case 2
	.short _02268312 - _02268302 - 2 ; case 3
	.short _0226830E - _02268302 - 2 ; case 4
	.short _02268316 - _02268302 - 2 ; case 5
_0226830E:
	ldr r6, _02268424 ; =0x00004E44
	b _02268324
_02268312:
	ldr r6, _02268428 ; =0x00004E45
	b _02268324
_02268316:
	ldr r6, _0226842C ; =0x00004E46
	b _02268324
_0226831A:
	bl GF_AssertFail
	add sp, #0x50
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02268324:
	ldr r0, [r4]
	bl ov12_0223A8E4
	str r0, [sp, #0x18]
	ldr r0, [r4]
	bl ov12_0223A8EC
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	bl Pokemon_GetIconNaix
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	mov r2, #0x14
	str r6, [sp, #8]
	bl sub_0200D4A4
	ldr r3, _02268430 ; =ov12_0226E4E4
	add r2, sp, #0x1c
	mov r7, #6
_02268356:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r7, r7, #1
	bne _02268356
	ldr r0, [r3]
	lsl r3, r5, #2
	str r0, [r2]
	ldr r2, _02268434 ; =ov12_0226E328
	str r6, [sp, #0x30]
	ldrh r1, [r2, r3]
	add r0, sp, #0x1c
	strh r1, [r0]
	add r1, r2, r3
	ldrh r1, [r1, #2]
	add r2, sp, #0x1c
	strh r1, [r0, #2]
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	bl sub_0200D734
	add r3, sp, #0x1c
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	mov r3, #0x11
	lsl r3, r3, #0x10
	add r6, r0, #0
	bl sub_0200DDF4
	ldr r0, [sp, #0xc]
	bl Pokemon_GetIconPalette
	add r1, r0, #0
	ldr r0, [r6]
	bl sub_02024AA8
	ldr r0, [sp, #0x10]
	mov r7, #0
	cmp r0, #0
	beq _022683F4
	ldr r0, [sp, #0x6c]
	cmp r0, #2
	beq _022683F4
	cmp r0, #3
	beq _022683F4
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x68]
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	mov r2, #0x30
	bl sub_020880B0
	cmp r0, #4
	bhi _022683EC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022683D4: ; jump table
	.short _022683EC - _022683D4 - 2 ; case 0
	.short _022683EA - _022683D4 - 2 ; case 1
	.short _022683E6 - _022683D4 - 2 ; case 2
	.short _022683E2 - _022683D4 - 2 ; case 3
	.short _022683DE - _022683D4 - 2 ; case 4
_022683DE:
	mov r7, #1
	b _022683EC
_022683E2:
	mov r7, #2
	b _022683EC
_022683E6:
	mov r7, #3
	b _022683EC
_022683EA:
	mov r7, #4
_022683EC:
	add r0, r6, #0
	add r1, r7, #0
	bl sub_0200DC4C
_022683F4:
	add r0, r6, #0
	bl sub_0200DC18
	lsl r0, r5, #2
	add r1, r4, r0
	ldr r0, _0226841C ; =0x00000628
	ldr r2, _02268438 ; =0x00000514
	str r6, [r1, r0]
	ldr r0, _0226843C ; =ov12_022684EC
	add r1, r6, #0
	bl CreateSysTask
	lsl r1, r5, #2
	add r2, r4, r1
	ldr r1, _02268420 ; =0x00000638
	str r0, [r2, r1]
	add r0, r6, #0
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226841C: .word 0x00000628
_02268420: .word 0x00000638
_02268424: .word 0x00004E44
_02268428: .word 0x00004E45
_0226842C: .word 0x00004E46
_02268430: .word ov12_0226E4E4
_02268434: .word ov12_0226E328
_02268438: .word 0x00000514
_0226843C: .word ov12_022684EC
	thumb_func_end ov12_022682BC

	thumb_func_start ov12_02268440
ov12_02268440: ; 0x02268440
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r5, r0, #0
	ldr r0, _022684E0 ; =0x000006EC
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02268454
	bl GF_AssertFail
_02268454:
	ldr r0, [r5]
	bl ov12_0223A8E4
	add r7, r0, #0
	ldr r0, [r5]
	bl ov12_0223A8EC
	add r4, r0, #0
	ldr r0, [sp, #0xc]
	bl Pokemon_GetIconNaix
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _022684E4 ; =0x00004E47
	add r1, r4, #0
	str r0, [sp, #8]
	add r0, r7, #0
	mov r2, #0x14
	bl sub_0200D4A4
	ldr r6, _022684E8 ; =ov12_0226E4E4
	add r3, sp, #0x10
	mov r2, #6
_02268488:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02268488
	ldr r0, [r6]
	mov r1, #0x78
	str r0, [r3]
	ldr r0, _022684E4 ; =0x00004E47
	add r2, sp, #0x10
	str r0, [sp, #0x24]
	add r0, sp, #0x10
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	add r0, r7, #0
	add r1, r4, #0
	bl sub_0200D734
	add r3, sp, #0x10
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	mov r3, #0x11
	lsl r3, r3, #0x10
	add r4, r0, #0
	bl sub_0200DDF4
	ldr r0, [sp, #0xc]
	bl Pokemon_GetIconPalette
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_02024AA8
	add r0, r4, #0
	bl sub_0200DC18
	ldr r0, _022684E0 ; =0x000006EC
	str r4, [r5, r0]
	add r0, r4, #0
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_022684E0: .word 0x000006EC
_022684E4: .word 0x00004E47
_022684E8: .word ov12_0226E4E4
	thumb_func_end ov12_02268440

	thumb_func_start ov12_022684EC
ov12_022684EC: ; 0x022684EC
	ldr r3, _022684F4 ; =sub_0200DC18
	add r0, r1, #0
	bx r3
	nop
_022684F4: .word sub_0200DC18
	thumb_func_end ov12_022684EC

	thumb_func_start ov12_022684F8
ov12_022684F8: ; 0x022684F8
	cmp r0, #3
	bhi _02268510
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02268508: ; jump table
	.short _02268510 - _02268508 - 2 ; case 0
	.short _02268514 - _02268508 - 2 ; case 1
	.short _02268518 - _02268508 - 2 ; case 2
	.short _0226851C - _02268508 - 2 ; case 3
_02268510:
	mov r0, #0
	bx lr
_02268514:
	mov r0, #1
	bx lr
_02268518:
	mov r0, #3
	bx lr
_0226851C:
	mov r0, #2
	bx lr
	thumb_func_end ov12_022684F8

	thumb_func_start ov12_02268520
ov12_02268520: ; 0x02268520
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r6, r2, #0
	add r0, r1, #0
	add r1, r4, #0
	mov r2, #0
	add r7, r3, #0
	bl FontID_String_GetWidth
	add r4, r0, #0
	asr r1, r4, #2
	lsr r1, r1, #0x1d
	add r1, r4, r1
	asr r5, r1, #3
	mov r1, #8
	bl FX_ModS32
	cmp r0, #0
	beq _02268548
	add r5, r5, #1
_02268548:
	str r4, [r6]
	str r5, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_02268520

	thumb_func_start ov12_02268550
ov12_02268550: ; 0x02268550
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	ldr r6, [sp, #0x9c]
	ldr r4, [sp, #0xa8]
	cmp r0, #0
	beq _0226856A
	bl GF_AssertFail
_0226856A:
	ldr r0, [r7]
	bl ov12_0223A8EC
	str r0, [sp, #0x20]
	ldr r0, [r7]
	bl BattleSystem_GetBgConfig
	str r0, [sp, #0x24]
	cmp r4, #0
	bne _0226858C
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	add r2, sp, #0x2c
	add r3, sp, #0x28
	bl ov12_02268520
	b _02268594
_0226858C:
	ldrh r0, [r4, #0x12]
	str r0, [sp, #0x2c]
	ldrh r0, [r4, #0x10]
	str r0, [sp, #0x28]
_02268594:
	cmp r4, #0
	bne _022685D2
	add r0, sp, #0x3c
	bl InitWindow
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x28]
	ldr r0, [sp, #0x24]
	lsl r2, r2, #0x18
	add r1, sp, #0x3c
	lsr r2, r2, #0x18
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x90]
	ldr r1, [sp, #0x1c]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r2, [sp, #0x18]
	add r0, sp, #0x3c
	str r3, [sp, #0x14]
	bl AddTextPrinterParameterized3
	b _022685DE
_022685D2:
	add r3, r4, #0
	add r2, sp, #0x3c
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
_022685DE:
	add r0, sp, #0x3c
	mov r1, #2
	mov r2, #5
	bl sub_02013688
	mov r1, #1
	mov r2, #2
	add r3, sp, #0x30
	bl sub_02021AC8
	ldr r0, [sp, #0xa4]
	cmp r0, #1
	bne _02268602
	ldr r1, [sp, #0x2c]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	sub r6, r6, r0
_02268602:
	ldr r0, _02268680 ; =0x000004CC
	ldr r0, [r7, r0]
	str r0, [sp, #0x4c]
	add r0, sp, #0x3c
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x20]
	bl sub_0200E2B0
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x98]
	bl sub_0200D934
	str r0, [sp, #0x58]
	mov r0, #0
	ldr r1, [sp, #0x34]
	str r0, [sp, #0x5c]
	str r0, [sp, #0x6c]
	mov r0, #0x64
	str r1, [sp, #0x60]
	mov r1, #0x42
	str r0, [sp, #0x70]
	mov r0, #2
	str r0, [sp, #0x74]
	mov r0, #5
	str r0, [sp, #0x78]
	ldr r2, [sp, #0xa0]
	lsl r1, r1, #2
	add r1, r2, r1
	add r0, sp, #0x4c
	str r6, [sp, #0x64]
	str r1, [sp, #0x68]
	bl sub_020135D8
	ldr r1, [sp, #0x94]
	add r7, r0, #0
	bl sub_020138E0
	mov r2, #0x42
	ldr r3, [sp, #0xa0]
	lsl r2, r2, #2
	add r0, r7, #0
	add r1, r6, #0
	add r2, r3, r2
	bl sub_020136B4
	cmp r4, #0
	bne _02268668
	add r0, sp, #0x3c
	bl RemoveWindow
_02268668:
	str r7, [r5]
	add r3, sp, #0x30
	ldmia r3!, {r0, r1}
	add r2, r5, #4
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #0x2c]
	strh r0, [r5, #0x10]
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	nop
_02268680: .word 0x000004CC
	thumb_func_end ov12_02268550

	thumb_func_start ov12_02268684
ov12_02268684: ; 0x02268684
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _022686B8 ; =0x000004D4
	mov r6, #0
	add r4, r5, r0
	add r7, r6, #0
_02268690:
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _022686AA
	bl sub_02013660
	add r0, r4, #0
	bl sub_02021B5C
	mov r0, #0x4d
	lsl r0, r0, #4
	str r7, [r5, r0]
_022686AA:
	add r6, r6, #1
	add r5, #0x14
	add r4, #0x14
	cmp r6, #0xd
	blt _02268690
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022686B8: .word 0x000004D4
	thumb_func_end ov12_02268684

	thumb_func_start ov12_022686BC
ov12_022686BC: ; 0x022686BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	ldr r0, [r7]
	bl BattleSystem_GetBgConfig
	mov r1, #5
	bl GetBgTilemapBuffer
	add r4, r0, #0
	add r0, r7, #0
	add r1, sp, #4
	mov r2, #0
	bl ov12_02268DD4
	add r0, sp, #0
	ldrb r0, [r0, #4]
	cmp r0, #1
	bne _02268736
	add r0, r7, #0
	mov r1, #1
	add r2, sp, #0
	mov r3, #0
	bl ov12_02268E2C
	add r0, sp, #0
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _0226871A
	mov r5, #0xc
	mov r0, #0xa9
	lsl r6, r5, #5
	lsl r0, r0, #2
	mov r2, #0xf
_02268700:
	lsl r1, r6, #1
	add r1, r4, r1
	add r3, r2, #0
	add r1, #0x1e
_02268708:
	add r3, r3, #1
	strh r0, [r1]
	add r1, r1, #2
	cmp r3, #0x10
	ble _02268708
	add r5, r5, #1
	add r6, #0x20
	cmp r5, #0x10
	ble _02268700
_0226871A:
	add r0, sp, #0
	ldrb r0, [r0, #3]
	cmp r0, #1
	bne _02268736
	mov r0, #0xa1
	lsl r0, r0, #2
	add r1, r4, r0
	mov r2, #2
	add r0, #0x20
_0226872C:
	add r2, r2, #1
	strh r0, [r1]
	add r1, r1, #2
	cmp r2, #0xc
	ble _0226872C
_02268736:
	add r0, sp, #0
	ldrb r0, [r0, #5]
	cmp r0, #1
	bne _02268790
	add r0, r7, #0
	mov r1, #2
	add r2, sp, #0
	mov r3, #0
	bl ov12_02268E2C
	add r0, sp, #0
	ldrb r0, [r0, #2]
	cmp r0, #1
	bne _02268764
	ldr r0, _02268794 ; =0x000002A6
	mov r2, #0x13
	add r1, r4, r0
	sub r0, r0, #2
_0226875A:
	add r2, r2, #1
	strh r0, [r1]
	add r1, r1, #2
	cmp r2, #0x1d
	ble _0226875A
_02268764:
	add r0, sp, #0
	ldrb r0, [r0, #3]
	cmp r0, #1
	bne _02268790
	mov r0, #0xa9
	mov r5, #3
	mov r3, #0x60
	lsl r0, r0, #2
	mov r2, #0xf
_02268776:
	lsl r1, r3, #1
	add r1, r4, r1
	add r6, r2, #0
	add r1, #0x1e
_0226877E:
	add r6, r6, #1
	strh r0, [r1]
	add r1, r1, #2
	cmp r6, #0x10
	ble _0226877E
	add r5, r5, #1
	add r3, #0x20
	cmp r5, #7
	ble _02268776
_02268790:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02268794: .word 0x000002A6
	thumb_func_end ov12_022686BC

	thumb_func_start ov12_02268798
ov12_02268798: ; 0x02268798
	cmp r1, #2
	blt _0226879E
	sub r1, r1, #2
_0226879E:
	mov r2, #0x46
	lsl r2, r2, #2
	add r0, #0x6c
	mul r2, r1
	add r0, r0, r2
	bx lr
	.balign 4, 0
	thumb_func_end ov12_02268798

	thumb_func_start ov12_022687AC
ov12_022687AC: ; 0x022687AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp]
	mov r1, #0x4d
	str r0, [sp, #0x10]
	add r0, #0x94
	str r0, [sp, #0x10]
	ldr r0, [sp]
	lsl r1, r1, #2
	str r0, [sp, #0xc]
	add r0, #0xe4
	str r0, [sp, #0xc]
	ldr r0, [sp]
	add r0, r0, r1
	str r0, [sp, #8]
_022687D0:
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp]
	ldr r7, [sp, #0x10]
	ldr r6, [sp, #0xc]
	ldr r5, [sp, #8]
	str r0, [sp, #4]
	add r4, r0, #0
_022687E0:
	ldr r0, [sp, #4]
	add r0, #0x84
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	cmp r0, #0
	beq _022687FA
	add r0, r7, #0
	bl RemoveWindow
_022687FA:
	add r0, r4, #0
	add r0, #0xf0
	ldr r0, [r0]
	cmp r0, #0
	beq _0226880A
	add r0, r6, #0
	bl RemoveWindow
_0226880A:
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0226881A
	add r0, r5, #0
	bl RemoveWindow
_0226881A:
	ldr r0, [sp, #4]
	add r4, #0x14
	add r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	add r7, #0x14
	add r0, r0, #1
	add r6, #0x14
	add r5, #0x14
	str r0, [sp, #0x18]
	cmp r0, #4
	blt _022687E0
	mov r0, #0x46
	ldr r1, [sp]
	lsl r0, r0, #2
	add r1, r1, r0
	str r1, [sp]
	ldr r1, [sp, #0x10]
	add r1, r1, r0
	str r1, [sp, #0x10]
	ldr r1, [sp, #0xc]
	add r1, r1, r0
	str r1, [sp, #0xc]
	ldr r1, [sp, #8]
	add r0, r1, r0
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #4
	blt _022687D0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov12_022687AC

	thumb_func_start ov12_0226885C
ov12_0226885C: ; 0x0226885C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	add r7, r0, #0
	ldr r0, [r7]
	add r5, r1, #0
	str r2, [sp, #8]
	bl ov12_0223A930
	add r4, r0, #0
	add r0, r7, #0
	add r1, r5, #0
	bl ov12_02268798
	str r0, [sp, #0x38]
	mov r0, #6
	bl sub_0208805C
	str r0, [sp, #0xc]
	ldr r1, _02268A58 ; =0x000003AA
	add r0, r4, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x28]
	ldr r0, [r7]
	bl ov12_0223A9A4
	str r0, [sp, #0x24]
	mov r0, #0x10
	mov r1, #5
	bl String_New
	str r0, [sp, #0x30]
	ldr r1, _02268A5C ; =0x000003A9
	add r0, r4, #0
	bl NewString_ReadMsgData
	ldr r4, [sp, #0x38]
	str r0, [sp, #0x2c]
	mov r0, #0
	str r0, [sp, #0x34]
	add r0, r4, #0
	str r0, [sp, #0x1c]
	str r0, [sp, #0x18]
	add r0, #0x28
	str r0, [sp, #0x18]
	add r0, r4, #0
	str r0, [sp, #0x14]
	add r0, #0x78
	str r0, [sp, #0x14]
	add r0, r4, #0
	str r0, [sp, #0x10]
	add r0, #0xc8
	ldr r5, [sp, #8]
	add r6, r4, #0
	str r0, [sp, #0x10]
_022688CA:
	ldrh r0, [r5]
	ldrh r1, [r4]
	cmp r0, r1
	beq _02268910
	cmp r0, #0
	beq _02268910
	mov r1, #3
	bl GetMoveAttr
	str r0, [sp, #0x3c]
	bl sub_020776B4
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x3c]
	bl sub_02077678
	add r1, r0, #0
	mov r0, #5
	str r0, [sp]
	ldr r0, [sp, #0x40]
	mov r2, #1
	add r3, sp, #0x4c
	bl GfGfxLoader_GetCharData
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x4c]
	ldr r1, [sp, #0x1c]
	ldr r0, [r0, #0x14]
	ldr r1, [r1, #0x18]
	ldr r2, [sp, #0xc]
	bl MIi_CpuCopy32
	ldr r0, [sp, #0x44]
	bl FreeToHeap
_02268910:
	ldr r0, [r6, #0x34]
	cmp r0, #0
	beq _02268922
	ldrh r1, [r5]
	ldrh r0, [r4]
	cmp r1, r0
	beq _02268942
	cmp r1, #0
	beq _02268942
_02268922:
	ldrh r0, [r5]
	mov r1, #5
	bl GetMoveName
	str r0, [sp, #0x48]
	ldr r0, _02268A60 ; =0x00070809
	ldr r1, [sp, #0x48]
	str r0, [sp]
	ldr r3, [sp, #0x18]
	add r0, r7, #0
	mov r2, #4
	bl ov12_02268A64
	ldr r0, [sp, #0x48]
	bl String_Delete
_02268942:
	add r0, r6, #0
	add r0, #0x84
	ldr r0, [r0]
	cmp r0, #0
	beq _02268972
	add r0, r6, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _02268972
	ldrh r1, [r5]
	cmp r1, #0
	bne _02268972
	ldrh r0, [r4]
	cmp r1, r0
	bne _02268972
	ldrh r1, [r5, #8]
	ldrh r0, [r4, #8]
	cmp r1, r0
	bne _02268972
	ldrh r1, [r5, #0x10]
	ldrh r0, [r4, #0x10]
	cmp r1, r0
	beq _02268A02
_02268972:
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrh r2, [r5, #8]
	ldr r0, [sp, #0x24]
	mov r1, #0
	mov r3, #2
	bl BufferIntegerAsString
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrh r2, [r5, #0x10]
	ldr r0, [sp, #0x24]
	mov r1, #1
	mov r3, #2
	bl BufferIntegerAsString
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x30]
	ldr r2, [sp, #0x2c]
	bl StringExpandPlaceholders
	ldrh r0, [r5, #8]
	ldrh r1, [r5, #0x10]
	bl ov12_02269504
	str r0, [sp, #0x20]
	add r0, r6, #0
	add r0, #0x84
	ldr r0, [r0]
	cmp r0, #0
	beq _022689C8
	ldrh r1, [r5]
	ldrh r0, [r4]
	cmp r1, r0
	bne _022689C8
	ldrh r1, [r5, #8]
	ldrh r0, [r4, #8]
	cmp r1, r0
	beq _022689D8
_022689C8:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x30]
	str r0, [sp]
	ldr r3, [sp, #0x14]
	add r0, r7, #0
	mov r2, #0
	bl ov12_02268A64
_022689D8:
	add r0, r6, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _022689F2
	ldrh r1, [r5]
	ldrh r0, [r4]
	cmp r1, r0
	bne _022689F2
	ldrh r1, [r5, #8]
	ldrh r0, [r4, #8]
	cmp r1, r0
	beq _02268A02
_022689F2:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x28]
	str r0, [sp]
	ldr r3, [sp, #0x10]
	add r0, r7, #0
	mov r2, #0
	bl ov12_02268A64
_02268A02:
	ldr r0, [sp, #0x1c]
	add r4, r4, #2
	add r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	add r5, r5, #2
	add r0, #0x14
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r6, #0x14
	add r0, #0x14
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r0, #0x14
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x34]
	add r0, r0, #1
	str r0, [sp, #0x34]
	cmp r0, #4
	bge _02268A2C
	b _022688CA
_02268A2C:
	ldr r0, [sp, #0x28]
	bl String_Delete
	ldr r0, [sp, #0x2c]
	bl String_Delete
	ldr r0, [sp, #0x30]
	bl String_Delete
	mov r0, #0xc
_02268A40:
	ldr r1, [sp, #8]
	ldrh r2, [r1]
	add r1, r1, #2
	str r1, [sp, #8]
	ldr r1, [sp, #0x38]
	strh r2, [r1]
	add r1, r1, #2
	str r1, [sp, #0x38]
	sub r0, r0, #1
	bne _02268A40
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02268A58: .word 0x000003AA
_02268A5C: .word 0x000003A9
_02268A60: .word 0x00070809
	thumb_func_end ov12_0226885C

	thumb_func_start ov12_02268A64
ov12_02268A64: ; 0x02268A64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r7, r2, #0
	add r6, r1, #0
	add r5, r0, #0
	add r4, r3, #0
	add r0, r6, #0
	add r1, r7, #0
	add r2, sp, #0x1c
	add r3, sp, #0x18
	bl ov12_02268520
	ldr r0, [sp, #0x1c]
	strh r0, [r4, #0x12]
	ldr r0, [sp, #0x18]
	strh r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02268A90
	add r0, r4, #0
	bl RemoveWindow
_02268A90:
	add r0, r4, #0
	bl InitWindow
	ldr r0, [r5]
	bl BattleSystem_GetBgConfig
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r2, [sp, #0x18]
	add r1, r4, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	add r1, r7, #0
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	add r0, r4, #0
	add r2, r6, #0
	str r3, [sp, #0x14]
	bl AddTextPrinterParameterized3
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_02268A64

	thumb_func_start ov12_02268AD0
ov12_02268AD0: ; 0x02268AD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r5, r0, #0
	str r0, [sp, #4]
	add r0, #0x1c
	str r0, [sp, #4]
	ldr r0, [r5]
	bl ov12_0223A8E4
	str r0, [sp, #0xc]
	ldr r0, [r5]
	bl ov12_0223A8EC
	ldr r1, _02268BA4 ; =0x0000068A
	str r0, [sp, #8]
	ldrb r1, [r5, r1]
	add r0, r5, #0
	bl ov12_02268798
	ldr r4, _02268BA8 ; =ov12_0226E4B0
	str r0, [sp]
	add r3, sp, #0x10
	mov r2, #6
_02268AFE:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02268AFE
	ldr r0, [r4]
	mov r4, #0
	str r0, [r3]
	add r6, sp, #0x10
	b _02268B9C
_02268B10:
	lsl r0, r4, #2
	add r1, r5, r0
	ldr r0, _02268BAC ; =0x00000608
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02268B20
	bl GF_AssertFail
_02268B20:
	ldr r0, [sp, #4]
	lsl r1, r4, #1
	ldrh r0, [r0, r1]
	cmp r0, #0
	beq _02268B9A
	mov r1, #3
	bl GetMoveAttr
	add r2, r0, #0
	ldr r0, _02268BB0 ; =0x00004E39
	ldr r1, _02268BB4 ; =ov12_0226E2B8
	add r0, r4, r0
	str r0, [sp, #0x24]
	lsl r0, r4, #2
	ldrh r1, [r1, r0]
	add r3, sp, #0x10
	strh r1, [r6]
	ldr r1, _02268BB4 ; =ov12_0226E2B8
	add r0, r1, r0
	ldrh r0, [r0, #2]
	ldr r1, [sp, #8]
	strh r0, [r6, #2]
	ldr r0, [sp, #0xc]
	bl sub_020777C8
	lsl r1, r4, #2
	add r2, r5, r1
	ldr r1, _02268BAC ; =0x00000608
	mov r3, #0x11
	str r0, [r2, r1]
	add r0, r1, #0
	ldr r0, [r2, r0]
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	lsl r0, r4, #2
	add r1, r5, r0
	ldr r0, _02268BAC ; =0x00000608
	ldr r0, [r1, r0]
	ldr r0, [r0]
	bl sub_02024B1C
	add r7, r0, #0
	mov r0, #6
	bl sub_0208805C
	add r2, r0, #0
	ldr r0, [sp]
	lsl r3, r4, #2
	add r0, r0, r3
	mov r3, #0x66
	ldr r1, [r7, #8]
	lsl r3, r3, #0x14
	ldr r0, [r0, #0x18]
	add r1, r3, r1
	bl MIi_CpuCopy16
_02268B9A:
	add r4, r4, #1
_02268B9C:
	cmp r4, #4
	blt _02268B10
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02268BA4: .word 0x0000068A
_02268BA8: .word ov12_0226E4B0
_02268BAC: .word 0x00000608
_02268BB0: .word 0x00004E39
_02268BB4: .word ov12_0226E2B8
	thumb_func_end ov12_02268AD0

	thumb_func_start ov12_02268BB8
ov12_02268BB8: ; 0x02268BB8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl ov12_0223A8E4
	ldr r0, [r5]
	bl ov12_0223A8EC
	mov r4, #0
	ldr r7, _02268BE8 ; =0x00000608
	add r6, r4, #0
_02268BCE:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _02268BDC
	bl sub_020777F8
	ldr r0, _02268BE8 ; =0x00000608
	str r6, [r5, r0]
_02268BDC:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02268BCE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02268BE8: .word 0x00000608
	thumb_func_end ov12_02268BB8

	thumb_func_start ov12_02268BEC
ov12_02268BEC: ; 0x02268BEC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl ov12_0223A8E4
	ldr r0, [r5]
	bl ov12_0223A8EC
	mov r4, #0
	add r6, r0, #0
	add r7, r4, #0
_02268C02:
	ldr r0, _02268C28 ; =0x00000618
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02268C1C
	bl sub_02077870
	ldr r1, _02268C2C ; =0x00004E3D
	add r0, r6, #0
	add r1, r4, r1
	bl sub_02077868
	ldr r0, _02268C28 ; =0x00000618
	str r7, [r5, r0]
_02268C1C:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02268C02
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02268C28: .word 0x00000618
_02268C2C: .word 0x00004E3D
	thumb_func_end ov12_02268BEC

	thumb_func_start ov12_02268C30
ov12_02268C30: ; 0x02268C30
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	add r5, r1, #0
	add r4, r2, #0
	bl BattleSystem_GetPaletteData
	add r4, #8
	add r1, r5, #0
	mov r2, #5
	mov r3, #1
	str r4, [sp]
	bl ov06_0221BA1C
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02268C30

	thumb_func_start ov12_02268C4C
ov12_02268C4C: ; 0x02268C4C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	bl BattleSystem_GetPaletteData
	add r6, r0, #0
	mov r7, #0
	b _02268C92
_02268C5E:
	ldr r1, _02268C98 ; =ov12_0226E258
	lsl r2, r4, #1
	add r1, r1, r2
	ldr r2, _02268C9C ; =ov12_0226E2A8
	lsl r3, r4, #2
	add r2, r2, r3
	add r0, r5, #0
	mov r3, #3
	str r7, [sp]
	bl ov12_02268EE4
	mov r0, #0x20
	str r0, [sp]
	add r3, r4, #0
	mov r1, #7
	add r3, #8
	lsl r3, r3, #0x14
	ldr r2, [r5, #0x5c]
	lsl r1, r1, #6
	add r1, r2, r1
	add r0, r6, #0
	mov r2, #1
	lsr r3, r3, #0x10
	bl PaletteData_LoadPalette
	add r4, r4, #1
_02268C92:
	cmp r4, #4
	blt _02268C5E
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02268C98: .word ov12_0226E258
_02268C9C: .word ov12_0226E2A8
	thumb_func_end ov12_02268C4C

	thumb_func_start ov12_02268CA0
ov12_02268CA0: ; 0x02268CA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r1, #0
	ldr r1, _02268D4C ; =ov12_0226E1FC
	add r5, r0, #0
	ldrb r2, [r1, #6]
	add r0, sp, #0x10
	strb r2, [r0]
	ldrb r2, [r1, #7]
	strb r2, [r0, #1]
	ldrb r2, [r1, #8]
	ldrb r1, [r1, #9]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldr r0, [r5]
	bl BattleSystem_GetBgConfig
	add r6, r0, #0
	ldr r0, [r5]
	bl BattleSystem_GetPaletteData
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r2, _02268D50 ; =ov12_0226E238
	lsl r1, r4, #1
	add r1, r2, r1
	ldr r3, _02268D54 ; =ov12_0226E2F8
	lsl r2, r4, #2
	add r2, r3, r2
	add r0, r5, #0
	mov r3, #4
	bl ov12_02268EE4
	mov r0, #0x20
	str r0, [sp]
	add r3, sp, #0x10
	ldrb r3, [r3, r4]
	mov r1, #7
	ldr r2, [r5, #0x5c]
	lsl r1, r1, #6
	lsl r3, r3, #0x14
	add r1, r2, r1
	add r0, r7, #0
	mov r2, #1
	lsr r3, r3, #0x10
	bl PaletteData_LoadPalette
	add r0, r6, #0
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _02268D54 ; =ov12_0226E2F8
	lsl r1, r4, #2
	ldrb r2, [r0, r1]
	add r3, r0, r1
	str r2, [sp]
	ldrb r4, [r3, #3]
	ldrb r2, [r3, #2]
	sub r2, r4, r2
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	str r2, [sp, #4]
	ldrb r0, [r0, r1]
	ldrb r2, [r3, #1]
	mov r1, #5
	sub r0, r2, r0
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldrb r3, [r3, #2]
	ldr r2, _02268D58 ; =0x000002FF
	add r0, r6, #0
	bl FillBgTilemapRect
	add r0, r6, #0
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02268D4C: .word ov12_0226E1FC
_02268D50: .word ov12_0226E238
_02268D54: .word ov12_0226E2F8
_02268D58: .word 0x000002FF
	thumb_func_end ov12_02268CA0

	thumb_func_start ov12_02268D5C
ov12_02268D5C: ; 0x02268D5C
	push {r4, r5, r6, lr}
	mov r5, #0
	mov r6, #1
	add r4, r5, #0
_02268D64:
	add r0, r5, #4
	cmp r0, #6
	beq _02268D76
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r4, #0
	bl ToggleBgLayer
	b _02268D80
_02268D76:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
_02268D80:
	add r5, r5, #1
	cmp r5, #4
	blt _02268D64
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_02268D5C

	thumb_func_start ov12_02268D88
ov12_02268D88: ; 0x02268D88
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #1
	bne _02268D96
	bl ov12_02268DAC
_02268D96:
	cmp r4, #1
	bne _02268DA4
	ldr r0, _02268DA8 ; =ov12_0226989C
	add r1, r5, #0
	mov r2, #0xa
	bl sub_0200E374
_02268DA4:
	pop {r3, r4, r5, pc}
	nop
_02268DA8: .word ov12_0226989C
	thumb_func_end ov12_02268D88

	thumb_func_start ov12_02268DAC
ov12_02268DAC: ; 0x02268DAC
	push {r4, lr}
	add r4, r0, #0
	bl ov12_02268BB8
	add r0, r4, #0
	bl ov12_02268BEC
	add r0, r4, #0
	bl ov12_02268684
	add r0, r4, #0
	bl ov12_02268214
	add r0, r4, #0
	bl ov12_02268264
	add r0, r4, #0
	bl ov12_0226AD60
	pop {r4, pc}
	thumb_func_end ov12_02268DAC

	thumb_func_start ov12_02268DD4
ov12_02268DD4: ; 0x02268DD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r5, #0
	add r1, sp, #0
	add r7, r2, #0
	add r6, #0x1c
	bl ov12_0223C1A0
	mov r0, #0
	b _02268E1C
_02268DEE:
	add r2, r0, #2
	add r1, sp, #0
	ldrb r1, [r1, r2]
	cmp r7, #1
	bne _02268E0A
	lsl r1, r1, #3
	add r1, r6, r1
	ldrb r1, [r1, #1]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	bne _02268E0A
	mov r1, #0
	strb r1, [r4, r0]
	b _02268E1A
_02268E0A:
	ldr r1, _02268E24 ; =0x0000068C
	lsl r2, r0, #2
	ldrb r1, [r5, r1]
	lsl r3, r1, #4
	ldr r1, _02268E28 ; =ov12_0226E64C
	add r1, r1, r3
	ldr r1, [r2, r1]
	strb r1, [r4, r0]
_02268E1A:
	add r0, r0, #1
_02268E1C:
	cmp r0, #4
	blt _02268DEE
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02268E24: .word 0x0000068C
_02268E28: .word ov12_0226E64C
	thumb_func_end ov12_02268DD4

	thumb_func_start ov12_02268E2C
ov12_02268E2C: ; 0x02268E2C
	push {r4, lr}
	ldr r4, _02268E80 ; =0x0000068C
	ldrb r4, [r0, r4]
	cmp r4, #0xb
	bhi _02268E74
	add r4, r4, r4
	add r4, pc
	ldrh r4, [r4, #6]
	lsl r4, r4, #0x10
	asr r4, r4, #0x10
	add pc, r4
_02268E42: ; jump table
	.short _02268E5A - _02268E42 - 2 ; case 0
	.short _02268E74 - _02268E42 - 2 ; case 1
	.short _02268E74 - _02268E42 - 2 ; case 2
	.short _02268E74 - _02268E42 - 2 ; case 3
	.short _02268E74 - _02268E42 - 2 ; case 4
	.short _02268E74 - _02268E42 - 2 ; case 5
	.short _02268E74 - _02268E42 - 2 ; case 6
	.short _02268E74 - _02268E42 - 2 ; case 7
	.short _02268E5A - _02268E42 - 2 ; case 8
	.short _02268E5A - _02268E42 - 2 ; case 9
	.short _02268E5A - _02268E42 - 2 ; case 10
	.short _02268E5A - _02268E42 - 2 ; case 11
_02268E5A:
	mov r4, #0
	add r0, r4, #0
	mov r3, #1
	sub r1, r1, #1
_02268E62:
	cmp r4, r1
	bne _02268E6A
	strb r3, [r2, r4]
	b _02268E6C
_02268E6A:
	strb r0, [r2, r4]
_02268E6C:
	add r4, r4, #1
	cmp r4, #4
	blt _02268E62
	pop {r4, pc}
_02268E74:
	add r1, r2, #0
	add r2, r3, #0
	bl ov12_02268DD4
	pop {r4, pc}
	nop
_02268E80: .word 0x0000068C
	thumb_func_end ov12_02268E2C

	thumb_func_start ov12_02268E84
ov12_02268E84: ; 0x02268E84
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02268E94
	bl GF_AssertFail
_02268E94:
	ldr r0, _02268EB0 ; =0x0000069C
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x24
	bl MI_CpuFill8
	ldr r2, _02268EB4 ; =0x00000514
	add r0, r5, #0
	add r1, r4, #0
	bl CreateSysTask
	str r0, [r4, #0xc]
	pop {r3, r4, r5, pc}
	nop
_02268EB0: .word 0x0000069C
_02268EB4: .word 0x00000514
	thumb_func_end ov12_02268E84

	thumb_func_start ov12_02268EB8
ov12_02268EB8: ; 0x02268EB8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02268ED4
	bl DestroySysTask
	ldr r0, _02268ED8 ; =0x0000069C
	mov r1, #0
	add r0, r4, r0
	mov r2, #0x24
	str r1, [r4, #0xc]
	bl MI_CpuFill8
_02268ED4:
	pop {r4, pc}
	nop
_02268ED8: .word 0x0000069C
	thumb_func_end ov12_02268EB8

	thumb_func_start ov12_02268EDC
ov12_02268EDC: ; 0x02268EDC
	bx lr
	.balign 4, 0
	thumb_func_end ov12_02268EDC

	thumb_func_start ov12_02268EE0
ov12_02268EE0: ; 0x02268EE0
	bx lr
	.balign 4, 0
	thumb_func_end ov12_02268EE0

	thumb_func_start ov12_02268EE4
ov12_02268EE4: ; 0x02268EE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	add r4, r2, #0
	add r7, r3, #0
	bl BattleSystem_GetBgConfig
	mov r1, #4
	str r0, [sp, #4]
	bl GetBgTilemapBuffer
	mov ip, r0
	lsl r0, r7, #2
	add r0, r5, r0
	ldr r0, [r0, #0x40]
	ldrb r7, [r4]
	str r0, [sp]
	ldr r0, [sp, #0x20]
	lsl r0, r0, #1
	ldrsh r1, [r6, r0]
	ldrb r0, [r4, #1]
	cmp r7, r0
	bgt _02268F4C
	lsl r6, r7, #5
_02268F18:
	lsl r2, r6, #1
	mov r0, ip
	add r5, r0, r2
	ldr r0, [sp]
	ldrb r3, [r4, #3]
	add r2, r0, r2
	ldrb r0, [r4, #2]
	cmp r0, r3
	bgt _02268F42
	lsl r3, r0, #1
	add r2, r2, r3
	add r3, r5, r3
_02268F30:
	ldrh r5, [r2]
	add r0, r0, #1
	add r2, r2, #2
	add r5, r1, r5
	strh r5, [r3]
	ldrb r5, [r4, #3]
	add r3, r3, #2
	cmp r0, r5
	ble _02268F30
_02268F42:
	ldrb r0, [r4, #1]
	add r7, r7, #1
	add r6, #0x20
	cmp r7, r0
	ble _02268F18
_02268F4C:
	ldr r0, [sp, #4]
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_02268EE4

	thumb_func_start ov12_02268F58
ov12_02268F58: ; 0x02268F58
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r0, [r4]
	bl BattleSystem_GetBgConfig
	ldr r3, _0226909C ; =0x0000069C
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _02268F76
	cmp r0, #1
	beq _02268FE8
	cmp r0, #2
	beq _02269004
	b _02269076
_02268F76:
	mov r0, #2
	str r0, [sp]
	add r1, r3, #4
	add r2, r3, #0
	add r3, #0x10
	add r2, #8
	ldrb r3, [r4, r3]
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r0, r4, #0
	bl ov12_02268EE4
	ldr r0, _022690A0 ; =0x000006AD
	add r2, sp, #4
	ldrb r1, [r4, r0]
	mov r0, #0x14
	mul r0, r1
	add r1, r4, r0
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #8
	bl sub_02013794
	ldr r0, _022690A0 ; =0x000006AD
	ldr r2, [sp, #4]
	ldrb r1, [r4, r0]
	mov r0, #0x14
	sub r2, r2, #2
	mul r0, r1
	add r1, r4, r0
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	ldr r1, [sp, #8]
	bl sub_020136B4
	ldr r0, _022690A4 ; =0x000006AE
	ldrb r1, [r4, r0]
	cmp r1, #0xff
	beq _02268FDC
	lsl r1, r1, #2
	add r1, r4, r1
	sub r0, #0x86
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02268FDC
	mov r1, #0
	sub r2, r1, #2
	bl sub_0200DED0
_02268FDC:
	ldr r0, _0226909C ; =0x0000069C
	add sp, #0xc
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	pop {r3, r4, pc}
_02268FE8:
	add r0, r3, #2
	ldrsh r0, [r4, r0]
	add r1, r0, #1
	add r0, r3, #2
	strh r1, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02269098
	mov r1, #0
	add r0, r3, #2
	strh r1, [r4, r0]
	ldrsh r0, [r4, r3]
	add r0, r0, #1
	strh r0, [r4, r3]
_02269004:
	mov r0, #1
	mov r3, #0x6a
	str r0, [sp]
	lsl r3, r3, #4
	add r2, r3, #4
	ldr r1, [r4, r3]
	add r3, #0xc
	ldrb r3, [r4, r3]
	ldr r2, [r4, r2]
	add r0, r4, #0
	bl ov12_02268EE4
	ldr r0, _022690A0 ; =0x000006AD
	add r2, sp, #4
	ldrb r1, [r4, r0]
	mov r0, #0x14
	mul r0, r1
	add r1, r4, r0
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #8
	bl sub_02013794
	ldr r0, _022690A0 ; =0x000006AD
	ldr r2, [sp, #4]
	ldrb r1, [r4, r0]
	mov r0, #0x14
	add r2, r2, #1
	mul r0, r1
	add r1, r4, r0
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	ldr r1, [sp, #8]
	bl sub_020136B4
	ldr r0, _022690A4 ; =0x000006AE
	ldrb r1, [r4, r0]
	cmp r1, #0xff
	beq _0226906A
	lsl r1, r1, #2
	add r1, r4, r1
	sub r0, #0x86
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0226906A
	mov r1, #0
	mov r2, #1
	bl sub_0200DED0
_0226906A:
	ldr r0, _0226909C ; =0x0000069C
	add sp, #0xc
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	pop {r3, r4, pc}
_02269076:
	add r0, r3, #2
	ldrsh r0, [r4, r0]
	add r1, r0, #1
	add r0, r3, #2
	strh r1, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02269098
	add r3, #0x14
	ldrb r1, [r4, r3]
	add r0, r4, #0
	mov r2, #0
	bl ov12_02268D88
	add r0, r4, #0
	bl ov12_02268EB8
_02269098:
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0226909C: .word 0x0000069C
_022690A0: .word 0x000006AD
_022690A4: .word 0x000006AE
	thumb_func_end ov12_02268F58

	thumb_func_start ov12_022690A8
ov12_022690A8: ; 0x022690A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r1, #0
	ldr r0, [r4]
	bl BattleSystem_GetBgConfig
	ldr r0, _02269350 ; =0x000006A8
	add r1, r4, #0
	ldr r0, [r4, r0]
	add r1, #0x1c
	cmp r0, #4
	bgt _022690DA
	cmp r0, #0
	blt _02269116
	add r2, r0, r0
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_022690D0: ; jump table
	.short _02269116 - _022690D0 - 2 ; case 0
	.short _022690DE - _022690D0 - 2 ; case 1
	.short _022690EC - _022690D0 - 2 ; case 2
	.short _022690FA - _022690D0 - 2 ; case 3
	.short _02269108 - _022690D0 - 2 ; case 4
_022690DA:
	cmp r0, #0xff
	b _02269116
_022690DE:
	mov r0, #5
	str r0, [sp, #8]
	ldrh r0, [r1]
	mov r5, #0
	mov r6, #9
	str r0, [sp, #4]
	b _0226911E
_022690EC:
	mov r0, #6
	str r0, [sp, #8]
	ldrh r0, [r1, #2]
	mov r5, #1
	mov r6, #0xa
	str r0, [sp, #4]
	b _0226911E
_022690FA:
	mov r0, #7
	str r0, [sp, #8]
	ldrh r0, [r1, #4]
	mov r5, #2
	mov r6, #0xb
	str r0, [sp, #4]
	b _0226911E
_02269108:
	mov r0, #8
	str r0, [sp, #8]
	ldrh r0, [r1, #6]
	mov r5, #3
	mov r6, #0xc
	str r0, [sp, #4]
	b _0226911E
_02269116:
	mov r5, #0
	add r6, r5, #0
	str r5, [sp, #8]
	str r5, [sp, #4]
_0226911E:
	ldr r3, _02269354 ; =0x0000069C
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _02269132
	cmp r0, #1
	beq _02269214
	cmp r0, #2
	bne _02269130
	b _02269232
_02269130:
	b _02269314
_02269132:
	mov r0, #2
	str r0, [sp]
	add r1, r3, #4
	add r2, r3, #0
	add r3, #0x10
	add r2, #8
	ldrb r3, [r4, r3]
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r0, r4, #0
	bl ov12_02268EE4
	ldr r0, _02269350 ; =0x000006A8
	add r1, sp, #0x20
	ldr r0, [r4, r0]
	cmp r0, #0xff
	beq _022691EC
	mov r0, #0x4d
	lsl r0, r0, #4
	add r7, r4, r0
	mov r0, #0x14
	mul r0, r5
	str r0, [sp, #0xc]
	ldr r0, [r7, r0]
	add r2, sp, #0x1c
	bl sub_02013794
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x1c]
	ldr r0, [r7, r0]
	ldr r1, [sp, #0x20]
	sub r2, r2, #2
	bl sub_020136B4
	mov r0, #0x4d
	lsl r0, r0, #4
	add r7, r4, r0
	mov r0, #0x14
	mul r0, r6
	str r0, [sp, #0x10]
	ldr r0, [r7, r0]
	add r1, sp, #0x20
	add r2, sp, #0x1c
	bl sub_02013794
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x1c]
	ldr r0, [r7, r0]
	ldr r1, [sp, #0x20]
	sub r2, r2, #2
	bl sub_020136B4
	mov r0, #0x4d
	lsl r0, r0, #4
	add r6, r4, r0
	ldr r0, [sp, #8]
	mov r1, #0x14
	add r7, r0, #0
	mul r7, r1
	ldr r0, [r6, r7]
	add r1, sp, #0x20
	add r2, sp, #0x1c
	bl sub_02013794
	ldr r2, [sp, #0x1c]
	ldr r0, [r6, r7]
	ldr r1, [sp, #0x20]
	sub r2, r2, #2
	bl sub_020136B4
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02269208
	lsl r5, r5, #2
	ldr r0, _02269358 ; =0x00000608
	add r1, r4, r5
	ldr r0, [r1, r0]
	mov r1, #0
	ldr r0, [r0]
	sub r2, r1, #2
	bl sub_0200DEA0
	ldr r0, _0226935C ; =0x00000618
	add r1, r4, r5
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02269208
	mov r1, #0
	ldr r0, [r0]
	sub r2, r1, #2
	bl sub_0200DEA0
	b _02269208
_022691EC:
	mov r0, #0x52
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, sp, #0x1c
	bl sub_02013794
	mov r0, #0x52
	lsl r0, r0, #4
	ldr r2, [sp, #0x1c]
	ldr r0, [r4, r0]
	ldr r1, [sp, #0x20]
	sub r2, r2, #2
	bl sub_020136B4
_02269208:
	ldr r0, _02269354 ; =0x0000069C
	add sp, #0x24
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	pop {r4, r5, r6, r7, pc}
_02269214:
	add r0, r3, #2
	ldrsh r0, [r4, r0]
	add r1, r0, #1
	add r0, r3, #2
	strh r1, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bgt _02269226
	b _0226934C
_02269226:
	mov r1, #0
	add r0, r3, #2
	strh r1, [r4, r0]
	ldrsh r0, [r4, r3]
	add r0, r0, #1
	strh r0, [r4, r3]
_02269232:
	mov r0, #1
	mov r3, #0x6a
	str r0, [sp]
	lsl r3, r3, #4
	add r2, r3, #4
	ldr r1, [r4, r3]
	add r3, #0xc
	ldrb r3, [r4, r3]
	ldr r2, [r4, r2]
	add r0, r4, #0
	bl ov12_02268EE4
	ldr r0, _02269350 ; =0x000006A8
	add r1, sp, #0x20
	ldr r0, [r4, r0]
	cmp r0, #0xff
	beq _022692EC
	mov r0, #0x4d
	lsl r0, r0, #4
	add r7, r4, r0
	mov r0, #0x14
	mul r0, r5
	str r0, [sp, #0x14]
	ldr r0, [r7, r0]
	add r2, sp, #0x1c
	bl sub_02013794
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x1c]
	ldr r0, [r7, r0]
	ldr r1, [sp, #0x20]
	add r2, r2, #1
	bl sub_020136B4
	mov r0, #0x4d
	lsl r0, r0, #4
	add r7, r4, r0
	mov r0, #0x14
	mul r0, r6
	str r0, [sp, #0x18]
	ldr r0, [r7, r0]
	add r1, sp, #0x20
	add r2, sp, #0x1c
	bl sub_02013794
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	ldr r0, [r7, r0]
	ldr r1, [sp, #0x20]
	add r2, r2, #1
	bl sub_020136B4
	mov r0, #0x4d
	lsl r0, r0, #4
	add r6, r4, r0
	ldr r0, [sp, #8]
	mov r1, #0x14
	add r7, r0, #0
	mul r7, r1
	ldr r0, [r6, r7]
	add r1, sp, #0x20
	add r2, sp, #0x1c
	bl sub_02013794
	ldr r2, [sp, #0x1c]
	ldr r0, [r6, r7]
	ldr r1, [sp, #0x20]
	add r2, r2, #1
	bl sub_020136B4
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02269308
	lsl r5, r5, #2
	ldr r0, _02269358 ; =0x00000608
	add r1, r4, r5
	ldr r0, [r1, r0]
	mov r1, #0
	ldr r0, [r0]
	mov r2, #1
	bl sub_0200DEA0
	ldr r0, _0226935C ; =0x00000618
	add r1, r4, r5
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02269308
	ldr r0, [r0]
	mov r1, #0
	mov r2, #1
	bl sub_0200DEA0
	b _02269308
_022692EC:
	mov r0, #0x52
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r2, sp, #0x1c
	bl sub_02013794
	mov r0, #0x52
	lsl r0, r0, #4
	ldr r2, [sp, #0x1c]
	ldr r0, [r4, r0]
	ldr r1, [sp, #0x20]
	add r2, r2, #1
	bl sub_020136B4
_02269308:
	ldr r0, _02269354 ; =0x0000069C
	add sp, #0x24
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	pop {r4, r5, r6, r7, pc}
_02269314:
	add r0, r3, #2
	ldrsh r0, [r4, r0]
	add r1, r0, #1
	add r0, r3, #2
	strh r1, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0226934C
	mov r0, #0
	str r0, [sp]
	add r1, r3, #4
	add r2, r3, #0
	add r3, #0x10
	add r2, #8
	ldrb r3, [r4, r3]
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	add r0, r4, #0
	bl ov12_02268EE4
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov12_02268D88
	add r0, r4, #0
	bl ov12_02268EB8
_0226934C:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02269350: .word 0x000006A8
_02269354: .word 0x0000069C
_02269358: .word 0x00000608
_0226935C: .word 0x00000618
	thumb_func_end ov12_022690A8

	thumb_func_start ov12_02269360
ov12_02269360: ; 0x02269360
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	ldr r0, [r4]
	bl BattleSystem_GetBgConfig
	ldr r1, _022694F0 ; =0x0000069C
	ldrsh r0, [r4, r1]
	cmp r0, #3
	bls _02269376
	b _022694DA
_02269376:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02269382: ; jump table
	.short _0226938A - _02269382 - 2 ; case 0
	.short _02269414 - _02269382 - 2 ; case 1
	.short _02269430 - _02269382 - 2 ; case 2
	.short _022694BA - _02269382 - 2 ; case 3
_0226938A:
	add r1, #0x20
	ldr r1, [r4, r1]
	add r0, r4, #0
	add r2, sp, #4
	mov r3, #1
	bl ov12_02268E2C
	mov r5, #0
	mov r7, #2
	add r6, sp, #4
	b _02269404
_022693A0:
	ldrb r0, [r6, r5]
	cmp r0, #1
	bne _02269402
	mov r1, #6
	add r2, r5, #0
	mul r2, r1
	ldr r1, _022694F4 ; =ov12_0226E408
	lsl r3, r5, #2
	add r1, r1, r2
	ldr r2, _022694F8 ; =ov12_0226E348
	add r0, r4, #0
	add r2, r2, r3
	mov r3, #4
	str r7, [sp]
	bl ov12_02268EE4
	mov r0, #0x14
	mul r0, r5
	add r1, r4, r0
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022693EE
	add r1, sp, #0xc
	add r2, sp, #8
	bl sub_02013794
	mov r0, #0x14
	mul r0, r5
	add r1, r4, r0
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r2, [sp, #8]
	ldr r0, [r1, r0]
	ldr r1, [sp, #0xc]
	sub r2, r2, #2
	bl sub_020136B4
_022693EE:
	lsl r0, r5, #2
	add r1, r4, r0
	ldr r0, _022694FC ; =0x00000628
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02269402
	mov r1, #0
	sub r2, r1, #2
	bl sub_0200DED0
_02269402:
	add r5, r5, #1
_02269404:
	cmp r5, #4
	blt _022693A0
	ldr r0, _022694F0 ; =0x0000069C
	add sp, #0x10
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02269414:
	add r0, r1, #2
	ldrsh r0, [r4, r0]
	add r2, r0, #1
	add r0, r1, #2
	strh r2, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _022694EA
	mov r2, #0
	add r0, r1, #2
	strh r2, [r4, r0]
	ldrsh r0, [r4, r1]
	add r0, r0, #1
	strh r0, [r4, r1]
_02269430:
	ldr r1, _02269500 ; =0x000006BC
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r2, sp, #4
	mov r3, #1
	bl ov12_02268E2C
	mov r5, #0
	mov r7, #1
	add r6, sp, #4
	b _022694AA
_02269446:
	ldrb r0, [r6, r5]
	cmp r0, #1
	bne _022694A8
	mov r1, #6
	add r2, r5, #0
	mul r2, r1
	ldr r1, _022694F4 ; =ov12_0226E408
	lsl r3, r5, #2
	add r1, r1, r2
	ldr r2, _022694F8 ; =ov12_0226E348
	add r0, r4, #0
	add r2, r2, r3
	mov r3, #4
	str r7, [sp]
	bl ov12_02268EE4
	mov r0, #0x14
	mul r0, r5
	add r1, r4, r0
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _02269494
	add r1, sp, #0xc
	add r2, sp, #8
	bl sub_02013794
	mov r0, #0x14
	mul r0, r5
	add r1, r4, r0
	mov r0, #0x4d
	lsl r0, r0, #4
	ldr r2, [sp, #8]
	ldr r0, [r1, r0]
	ldr r1, [sp, #0xc]
	add r2, r2, #1
	bl sub_020136B4
_02269494:
	lsl r0, r5, #2
	add r1, r4, r0
	ldr r0, _022694FC ; =0x00000628
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _022694A8
	mov r1, #0
	mov r2, #1
	bl sub_0200DED0
_022694A8:
	add r5, r5, #1
_022694AA:
	cmp r5, #4
	blt _02269446
	ldr r0, _022694F0 ; =0x0000069C
	add sp, #0x10
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_022694BA:
	add r0, r1, #2
	ldrsh r0, [r4, r0]
	add r2, r0, #1
	add r0, r1, #2
	strh r2, [r4, r0]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _022694EA
	mov r2, #0
	add r0, r1, #2
	strh r2, [r4, r0]
	ldrsh r0, [r4, r1]
	add sp, #0x10
	add r0, r0, #1
	strh r0, [r4, r1]
	pop {r3, r4, r5, r6, r7, pc}
_022694DA:
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov12_02268D88
	add r0, r4, #0
	bl ov12_02268EB8
_022694EA:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022694F0: .word 0x0000069C
_022694F4: .word ov12_0226E408
_022694F8: .word ov12_0226E348
_022694FC: .word 0x00000628
_02269500: .word 0x000006BC
	thumb_func_end ov12_02269360

	thumb_func_start ov12_02269504
ov12_02269504: ; 0x02269504
	cmp r0, #0
	bne _0226950C
	ldr r0, _0226955C ; =0x00070800
	bx lr
_0226950C:
	cmp r1, r0
	bne _02269514
	ldr r0, _02269560 ; =0x00010200
	bx lr
_02269514:
	cmp r1, #2
	bgt _02269520
	cmp r0, #1
	bne _02269558
	ldr r0, _02269564 ; =0x00050600
	bx lr
_02269520:
	cmp r1, #7
	bgt _02269538
	cmp r0, #1
	beq _0226952E
	cmp r0, #2
	beq _02269532
	b _02269558
_0226952E:
	ldr r0, _02269564 ; =0x00050600
	bx lr
_02269532:
	mov r0, #0xc1
	lsl r0, r0, #0xa
	bx lr
_02269538:
	asr r2, r1, #1
	lsr r2, r2, #0x1e
	add r2, r1, r2
	asr r2, r2, #2
	cmp r0, r2
	bgt _02269548
	ldr r0, _02269564 ; =0x00050600
	bx lr
_02269548:
	lsr r2, r1, #0x1f
	add r2, r1, r2
	asr r1, r2, #1
	cmp r0, r1
	bgt _02269558
	mov r0, #0xc1
	lsl r0, r0, #0xa
	bx lr
_02269558:
	ldr r0, _02269560 ; =0x00010200
	bx lr
	.balign 4, 0
_0226955C: .word 0x00070800
_02269560: .word 0x00010200
_02269564: .word 0x00050600
	thumb_func_end ov12_02269504

	thumb_func_start ov12_02269568
ov12_02269568: ; 0x02269568
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl BattleSystem_GetBgConfig
	add r4, r0, #0
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _02269584
	cmp r0, #1
	beq _022695DA
	b _02269606
_02269584:
	mov r2, #8
	ldrsh r1, [r5, r2]
	ldr r0, _02269658 ; =0x000018E7
	add r1, r1, r0
	strh r1, [r5, #8]
	mov r1, #0xa
	ldrsh r3, [r5, r1]
	mov r1, #0xfa
	lsl r1, r1, #2
	sub r1, r3, r1
	strh r1, [r5, #0xa]
	ldrsh r1, [r5, r2]
	lsl r0, r0, #2
	sub r0, r0, r1
	mov r1, #0x64
	bl _s32_div_f
	strh r0, [r5, #0xc]
	mov r0, #0xa
	ldrsh r0, [r5, r0]
	mov r1, #0x64
	neg r0, r0
	bl _s32_div_f
	strh r0, [r5, #0xe]
	mov r0, #8
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bge _022695C6
	mov r0, #0xa
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bgt _02269656
_022695C6:
	mov r1, #0
	strh r1, [r5, #8]
	mov r0, #0x90
	strh r0, [r5, #0xa]
	strh r1, [r5, #0xc]
	strh r1, [r5, #0xe]
	ldrb r0, [r5, #0x13]
	add r0, r0, #1
	strb r0, [r5, #0x13]
	pop {r4, r5, r6, pc}
_022695DA:
	ldr r1, [r5]
	ldr r0, _0226965C ; =0x0000068E
	mov r2, #0
	strb r2, [r1, r0]
	ldr r0, [r5, #4]
	bl DestroySysTask
	bl HBlankInterruptDisable
	ldr r2, _02269660 ; =0x04001000
	ldr r0, _02269664 ; =0xFFFF1FFF
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r0, [r5]
	mov r1, #1
	bl ov12_022698AC
	ldrb r0, [r5, #0x13]
	add r0, r0, #1
	strb r0, [r5, #0x13]
	pop {r4, r5, r6, pc}
_02269606:
	ldr r0, [r5]
	bl ov12_022698B0
	cmp r0, #0
	beq _02269656
	mov r2, #0
	add r0, r4, #0
	mov r1, #4
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r4, #0
	mov r1, #4
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r2, #0
	add r0, r4, #0
	mov r1, #5
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r4, #0
	mov r1, #5
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5]
	mov r1, #1
	ldr r0, [r0]
	bl ov12_0223BB64
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_02269656:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02269658: .word 0x000018E7
_0226965C: .word 0x0000068E
_02269660: .word 0x04001000
_02269664: .word 0xFFFF1FFF
	thumb_func_end ov12_02269568

	thumb_func_start ov12_02269668
ov12_02269668: ; 0x02269668
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl BattleSystem_GetBgConfig
	add r6, r0, #0
	ldrb r0, [r5, #0x12]
	cmp r0, #4
	bne _022696B6
	mov r0, #0xc
	ldrsh r1, [r5, r0]
	mov r0, #0xff
	sub r3, r0, r1
	cmp r3, #0
	ble _0226968A
	mov r3, #0
_0226968A:
	add r0, r6, #0
	mov r1, #4
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r3, #0xc
	ldrsh r4, [r5, r3]
	mov r3, #0xff
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	sub r3, r3, r4
	bl BgSetPosTextAndCommit
	mov r0, #8
	ldrsh r0, [r5, r0]
	mov r1, #0x64
	neg r0, r0
	bl _s32_div_f
	add r4, r0, #0
	b _022696E6
_022696B6:
	mov r0, #0xc
	ldrsh r3, [r5, r0]
	cmp r3, #0
	bge _022696C0
	mov r3, #0
_022696C0:
	add r0, r6, #0
	mov r1, #4
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r3, #0xc
	ldrsh r3, [r5, r3]
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r0, #8
	ldrsh r0, [r5, r0]
	mov r1, #0x64
	bl _s32_div_f
	add r4, r0, #0
	add r4, #0xff
_022696E6:
	add r0, r6, #0
	mov r1, #4
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, r6, #0
	mov r1, #5
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r0, #0xa
	ldrsh r0, [r5, r0]
	mov r1, #0x64
	bl _s32_div_f
	add r0, #0x90
	cmp r4, #0
	bge _02269712
	mov r4, #0
	b _02269718
_02269712:
	cmp r4, #0xff
	ble _02269718
	mov r4, #0xff
_02269718:
	cmp r0, #0xc0
	ble _02269720
	mov r0, #0xc0
	b _02269726
_02269720:
	cmp r0, #0
	bge _02269726
	mov r0, #0
_02269726:
	ldrb r1, [r5, #0x12]
	cmp r1, #4
	bne _0226973A
	lsl r1, r4, #0x18
	ldr r2, _0226976C ; =0x04001040
	lsr r1, r1, #0x18
	strh r1, [r2]
	mov r1, #0x90
	strh r1, [r2, #4]
	b _02269750
_0226973A:
	cmp r4, #0
	bne _02269740
	mov r4, #1
_02269740:
	mov r1, #0xff
	lsl r2, r4, #8
	lsl r1, r1, #8
	and r1, r2
	ldr r2, _0226976C ; =0x04001040
	strh r1, [r2]
	mov r1, #0x90
	strh r1, [r2, #4]
_02269750:
	ldr r2, _02269770 ; =0x04001042
	mov r1, #0xff
	lsl r0, r0, #0x18
	strh r1, [r2]
	lsr r1, r0, #0x18
	mov r0, #9
	lsl r0, r0, #0xc
	orr r0, r1
	strh r0, [r2, #4]
	mov r0, #0xe
	ldrsh r0, [r5, r0]
	strh r0, [r5, #0x10]
	pop {r4, r5, r6, pc}
	nop
_0226976C: .word 0x04001040
_02269770: .word 0x04001042
	thumb_func_end ov12_02269668

	thumb_func_start ov12_02269774
ov12_02269774: ; 0x02269774
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, _0226982C ; =0x04000006
	ldrh r0, [r0]
	cmp r0, #0x90
	bne _022697BE
	ldr r0, [r4]
	ldr r0, [r0]
	bl BattleSystem_GetBgConfig
	mov r2, #0
	mov r1, #4
	add r3, r2, #0
	add r5, r0, #0
	bl BgSetPosTextAndCommit
	mov r3, #0x10
	ldrsh r3, [r4, r3]
	add r0, r5, #0
	mov r1, #4
	mov r2, #3
	bl BgSetPosTextAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #5
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	mov r3, #0x10
	ldrsh r3, [r4, r3]
	add r0, r5, #0
	mov r1, #5
	mov r2, #3
	bl BgSetPosTextAndCommit
	pop {r4, r5, r6, pc}
_022697BE:
	cmp r0, #0xc0
	ble _02269828
	ldr r0, [r4]
	ldr r0, [r0]
	bl BattleSystem_GetBgConfig
	ldrb r1, [r4, #0x12]
	add r5, r0, #0
	cmp r1, #4
	bne _022697F6
	mov r3, #0xc
	ldrsh r6, [r4, r3]
	mov r3, #0xff
	mov r1, #4
	mov r2, #0
	sub r3, r3, r6
	bl BgSetPosTextAndCommit
	mov r3, #0xc
	ldrsh r4, [r4, r3]
	mov r3, #0xff
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	sub r3, r3, r4
	bl BgSetPosTextAndCommit
	b _02269810
_022697F6:
	mov r3, #0xc
	ldrsh r3, [r4, r3]
	mov r1, #4
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r3, #0xc
	ldrsh r3, [r4, r3]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl BgSetPosTextAndCommit
_02269810:
	add r0, r5, #0
	mov r1, #4
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #5
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
_02269828:
	pop {r4, r5, r6, pc}
	nop
_0226982C: .word 0x04000006
	thumb_func_end ov12_02269774

	thumb_func_start ov12_02269830
ov12_02269830: ; 0x02269830
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, _02269890 ; =0x0000068B
	ldr r2, _02269894 ; =ov12_0226E70C
	ldrsb r1, [r1, r0]
	mov r0, #0x30
	ldr r7, _02269898 ; =0x0000FFFF
	mul r0, r1
	add r6, r2, r0
	mov r4, #0
	add r5, r6, #0
_02269846:
	ldrh r0, [r5, #4]
	cmp r0, r7
	bne _0226985A
	add r0, r4, #4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #0
	bl ToggleBgLayer
	b _02269866
_0226985A:
	add r0, r4, #4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #1
	bl ToggleBgLayer
_02269866:
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #4
	blt _02269846
	mov r4, #0
_02269870:
	ldrh r1, [r6, #0xc]
	add r0, r4, #4
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl SetBgPriority
	add r4, r4, #1
	add r6, r6, #2
	cmp r4, #4
	blt _02269870
	ldr r0, [sp]
	bl DestroySysTask
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02269890: .word 0x0000068B
_02269894: .word ov12_0226E70C
_02269898: .word 0x0000FFFF
	thumb_func_end ov12_02269830

	thumb_func_start ov12_0226989C
ov12_0226989C: ; 0x0226989C
	push {r4, lr}
	add r4, r0, #0
	bl ov12_02268D5C
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	thumb_func_end ov12_0226989C

	thumb_func_start ov12_022698AC
ov12_022698AC: ; 0x022698AC
	bx lr
	.balign 4, 0
	thumb_func_end ov12_022698AC

	thumb_func_start ov12_022698B0
ov12_022698B0: ; 0x022698B0
	ldr r1, _022698C0 ; =0x00000684
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _022698BC
	mov r0, #1
	bx lr
_022698BC:
	mov r0, #0
	bx lr
	.balign 4, 0
_022698C0: .word 0x00000684
	thumb_func_end ov12_022698B0

	thumb_func_start ov12_022698C4
ov12_022698C4: ; 0x022698C4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	ldr r0, [r5]
	bl BattleSystem_GetPaletteData
	add r4, r0, #0
	bl sub_02003B44
	cmp r0, #0
	bne _02269944
	ldr r0, _02269948 ; =0x00000696
	mov r1, #1
	ldrsh r0, [r5, r0]
	add r2, r1, #0
	add r3, r1, #0
	asr r0, r0, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, _0226994C ; =0x00007E37
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_02003E5C
	ldr r1, _02269950 ; =0x00000694
	ldrb r0, [r5, r1]
	cmp r0, #0
	bne _0226990A
	add r0, r1, #2
	ldrsh r2, [r5, r0]
	mov r0, #2
	lsl r0, r0, #8
	add r2, r2, r0
	b _02269914
_0226990A:
	add r0, r1, #2
	ldrsh r2, [r5, r0]
	mov r0, #2
	lsl r0, r0, #8
	sub r2, r2, r0
_02269914:
	add r0, r1, #2
	strh r2, [r5, r0]
	ldr r0, _02269948 ; =0x00000696
	mov r1, #0x11
	ldrsh r2, [r5, r0]
	lsl r1, r1, #8
	cmp r2, r1
	blt _02269934
	mov r1, #0xf
	lsl r1, r1, #8
	strh r1, [r5, r0]
	mov r1, #1
	sub r0, r0, #2
	add sp, #8
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
_02269934:
	cmp r2, #0
	bgt _02269944
	mov r1, #1
	lsl r1, r1, #8
	strh r1, [r5, r0]
	mov r1, #0
	sub r0, r0, #2
	strb r1, [r5, r0]
_02269944:
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02269948: .word 0x00000696
_0226994C: .word 0x00007E37
_02269950: .word 0x00000694
	thumb_func_end ov12_022698C4

	thumb_func_start ov12_02269954
ov12_02269954: ; 0x02269954
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	bl sub_02002BC4
	add r6, r0, #0
	bl sub_02002BE4
	add r7, r0, #0
	bl sub_02002BD4
	bl sub_02002BF4
	ldr r0, [r5]
	bl BattleSystem_GetPaletteData
	add r4, r0, #0
	bl sub_02003B44
	cmp r0, #0
	bne _02269A1C
	add r0, r4, #0
	mov r1, #1
	bl PaletteData_GetFadedBuf
	add r4, r0, #0
	ldr r0, _02269A20 ; =gSystem + 0x40
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	beq _022699DA
	cmp r6, #1
	beq _02269996
	cmp r7, #1
	bne _022699DA
_02269996:
	ldr r1, [r5, #0x60]
	add r0, r4, #0
	add r0, #0x10
	add r1, #0x10
	mov r2, #0x10
	bl memcmp
	cmp r0, #0
	bne _02269A1C
	ldr r0, [r5]
	bl ov12_0226ADC4
	cmp r0, #0
	ldr r0, [r5, #0x64]
	beq _022699CC
	add r1, r4, #0
	mov r2, #0x20
	bl MIi_CpuCopy16
	ldr r0, [r5, #0x64]
	add r4, #0xe0
	add r0, #0x20
	add r1, r4, #0
	mov r2, #0x20
	bl MIi_CpuCopy16
	pop {r3, r4, r5, r6, r7, pc}
_022699CC:
	add r4, #0x10
	add r0, #0x10
	add r1, r4, #0
	mov r2, #0x10
	bl MIi_CpuCopy16
	pop {r3, r4, r5, r6, r7, pc}
_022699DA:
	ldr r1, [r5, #0x64]
	add r0, r4, #0
	add r0, #0x10
	add r1, #0x10
	mov r2, #0x10
	bl memcmp
	cmp r0, #0
	bne _02269A1C
	ldr r0, [r5]
	bl ov12_0226ADC4
	cmp r0, #0
	ldr r0, [r5, #0x60]
	beq _02269A10
	add r1, r4, #0
	mov r2, #0x20
	bl MIi_CpuCopy16
	ldr r0, [r5, #0x60]
	add r4, #0xe0
	add r0, #0x20
	add r1, r4, #0
	mov r2, #0x20
	bl MIi_CpuCopy16
	pop {r3, r4, r5, r6, r7, pc}
_02269A10:
	add r4, #0x10
	add r0, #0x10
	add r1, r4, #0
	mov r2, #0x10
	bl MIi_CpuCopy16
_02269A1C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02269A20: .word gSystem + 0x40
	thumb_func_end ov12_02269954

	thumb_func_start ov12_02269A24
ov12_02269A24: ; 0x02269A24
	push {r4, r5, r6, lr}
	ldr r6, _02269A88 ; =0x000006DC
	add r5, r0, #0
	add r2, r6, #0
	sub r2, #0x51
	ldrsb r2, [r5, r2]
	ldr r1, _02269A8C ; =ov12_0226E70C
	mov r3, #0x30
	add r4, r2, #0
	mul r4, r3
	add r4, r1, r4
	ldr r2, [r4, #0x20]
	cmp r2, #0
	bne _02269A46
	sub r3, #0x31
	add r0, r3, #0
	pop {r4, r5, r6, pc}
_02269A46:
	ldrb r1, [r5, r6]
	cmp r1, #0
	bne _02269A80
	add r0, r6, #4
	ldrb r0, [r5, r0]
	cmp r0, #1
	beq _02269A5E
	ldr r1, _02269A90 ; =gSystem
	ldr r2, [r1, #0x48]
	ldr r1, _02269A94 ; =0x00000CF3
	tst r1, r2
	beq _02269A7A
_02269A5E:
	cmp r0, #0
	bne _02269A68
	ldr r0, _02269A98 ; =0x000005DC
	bl PlaySE
_02269A68:
	mov r1, #1
	mov r0, #0x6e
	strb r1, [r5, r6]
	mov r2, #0
	lsl r0, r0, #4
	strb r2, [r5, r0]
	ldr r2, [r4, #0x20]
	add r0, r5, #0
	blx r2
_02269A7A:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_02269A80:
	mov r1, #0
	blx r2
	pop {r4, r5, r6, pc}
	nop
_02269A88: .word 0x000006DC
_02269A8C: .word ov12_0226E70C
_02269A90: .word gSystem
_02269A94: .word 0x00000CF3
_02269A98: .word 0x000005DC
	thumb_func_end ov12_02269A24

	thumb_func_start ov12_02269A9C
ov12_02269A9C: ; 0x02269A9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #8]
	ldr r1, _02269C5C ; =0x000006DC
	add r6, r0, #0
	add r2, r1, #0
	sub r2, #0x51
	ldrsb r3, [r6, r2]
	add r4, r6, r1
	mov r2, #0x30
	sub r1, #0x52
	ldr r0, _02269C60 ; =ov12_0226E70C
	mul r2, r3
	add r7, r0, r2
	ldrb r1, [r6, r1]
	ldr r0, [r6]
	bl ov12_0223AAD8
	add r1, r0, #0
	ldr r0, [r6]
	bl BattleSystem_GetOpponentData
	bl ov12_02261280
	ldr r1, [sp, #8]
	cmp r1, #1
	bne _02269B20
	mov r1, #0
	ldrsb r1, [r0, r1]
	ldr r2, _02269C64 ; =ov12_0226E220
	strb r1, [r4, #2]
	mov r1, #1
	ldrsb r0, [r0, r1]
	strb r0, [r4, #1]
	ldrsb r1, [r4, r1]
	lsl r0, r1, #1
	add r3, r1, r0
	mov r0, #2
	ldrsb r1, [r4, r0]
	add r0, r2, r3
	ldrb r1, [r1, r0]
	ldr r0, [r7, #0x14]
	lsl r3, r1, #2
	add r0, r0, r3
	ldrb r0, [r0, #1]
	sub r0, #8
	str r0, [sp]
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	ldr r4, [r7, #0x14]
	ldr r0, _02269C68 ; =0x000006D8
	add r2, r4, r3
	ldrb r1, [r2, #2]
	ldrb r2, [r2, #3]
	ldrb r3, [r4, r3]
	ldr r0, [r6, r0]
	add r1, #8
	sub r2, #8
	add r3, #8
	bl ov12_0226BB1C
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02269B20:
	ldr r0, _02269C6C ; =0x0000068B
	ldrsb r0, [r6, r0]
	cmp r0, #5
	beq _02269B2C
	cmp r0, #6
	bne _02269B3C
_02269B2C:
	mov r1, #1
	ldr r3, _02269C64 ; =ov12_0226E220
	add r0, r4, #0
	add r2, r1, #0
	bl ov12_0226A6EC
	add r5, r0, #0
	b _02269BA6
_02269B3C:
	mov r0, #1
	ldrsb r1, [r4, r0]
	lsl r0, r1, #1
	add r2, r1, r0
	mov r0, #2
	ldr r1, _02269C64 ; =ov12_0226E220
	ldrsb r0, [r4, r0]
	add r1, r1, r2
	ldrb r0, [r0, r1]
	str r0, [sp, #0xc]
	cmp r0, #3
	bne _02269B5E
	ldr r0, _02269C70 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0x40
	tst r0, r1
	bne _02269BA6
_02269B5E:
	ldr r3, _02269C64 ; =ov12_0226E220
	add r0, r4, #0
	mov r1, #3
	mov r2, #2
	bl ov12_0226A6EC
	add r5, r0, #0
	bne _02269BA6
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _02269BA6
	ldr r0, _02269C70 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0x20
	tst r0, r1
	beq _02269B90
	mov r0, #0
	strb r0, [r4, #2]
	mov r0, #1
	strb r0, [r4, #1]
	ldr r0, _02269C74 ; =0x000005DC
	bl PlaySE
	mov r5, #0x20
	b _02269BA6
_02269B90:
	mov r0, #0x10
	tst r0, r1
	beq _02269BA6
	mov r0, #2
	strb r0, [r4, #2]
	mov r0, #1
	strb r0, [r4, #1]
	ldr r0, _02269C74 ; =0x000005DC
	bl PlaySE
	mov r5, #0x10
_02269BA6:
	cmp r5, #0x20
	bhi _02269BC2
	bhs _02269BCE
	cmp r5, #2
	bhi _02269BBC
	cmp r5, #1
	blo _02269C52
	beq _02269C0C
	cmp r5, #2
	beq _02269C22
	b _02269C52
_02269BBC:
	cmp r5, #0x10
	beq _02269BCE
	b _02269C52
_02269BC2:
	cmp r5, #0x40
	bhi _02269BCA
	beq _02269BCE
	b _02269C52
_02269BCA:
	cmp r5, #0x80
	bne _02269C52
_02269BCE:
	mov r0, #1
	ldrsb r1, [r4, r0]
	ldr r2, _02269C64 ; =ov12_0226E220
	lsl r0, r1, #1
	add r3, r1, r0
	mov r0, #2
	ldrsb r1, [r4, r0]
	add r0, r2, r3
	ldrb r1, [r1, r0]
	ldr r0, [r7, #0x14]
	lsl r3, r1, #2
	add r0, r0, r3
	ldrb r0, [r0, #1]
	sub r0, #8
	str r0, [sp]
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	ldr r4, [r7, #0x14]
	ldr r0, _02269C68 ; =0x000006D8
	add r2, r4, r3
	ldrb r1, [r2, #2]
	ldrb r2, [r2, #3]
	ldrb r3, [r4, r3]
	ldr r0, [r6, r0]
	add r1, #8
	sub r2, #8
	add r3, #8
	bl ov12_0226BB1C
	b _02269C52
_02269C0C:
	mov r0, #1
	ldrsb r1, [r4, r0]
	ldr r2, _02269C64 ; =ov12_0226E220
	add sp, #0x10
	lsl r0, r1, #1
	add r3, r1, r0
	mov r0, #2
	ldrsb r1, [r4, r0]
	add r0, r2, r3
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02269C22:
	ldr r0, _02269C78 ; =0x0000068F
	ldrb r0, [r6, r0]
	cmp r0, #1
	bne _02269C52
	mov r0, #0
	add r2, r0, #0
	mov r3, #1
	ldr r1, [r7, #0x18]
	ldr r5, [r7, #0x14]
	b _02269C40
_02269C36:
	lsl r4, r0, #2
	ldr r4, [r1, r4]
	cmp r4, #4
	beq _02269C56
	add r0, r0, #1
_02269C40:
	lsl r4, r0, #2
	ldrb r4, [r5, r4]
	cmp r0, r4
	bge _02269C4C
	add r4, r3, #0
	b _02269C4E
_02269C4C:
	add r4, r2, #0
_02269C4E:
	cmp r4, #0xff
	bne _02269C36
_02269C52:
	mov r0, #0
	mvn r0, r0
_02269C56:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02269C5C: .word 0x000006DC
_02269C60: .word ov12_0226E70C
_02269C64: .word ov12_0226E220
_02269C68: .word 0x000006D8
_02269C6C: .word 0x0000068B
_02269C70: .word gSystem
_02269C74: .word 0x000005DC
_02269C78: .word 0x0000068F
	thumb_func_end ov12_02269A9C

	thumb_func_start ov12_02269C7C
ov12_02269C7C: ; 0x02269C7C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, _02269CD0 ; =0x0000068A
	ldr r0, [r5]
	ldrb r1, [r5, r1]
	bl ov12_0223AAD8
	add r1, r0, #0
	cmp r4, #3
	bne _02269C9A
	ldr r0, _02269CD4 ; =0x000006E1
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _02269CCE
_02269C9A:
	ldr r0, [r5]
	bl BattleSystem_GetOpponentData
	bl ov12_02261280
	mov r5, #0
	ldr r1, _02269CD8 ; =ov12_0226E220
	add r2, r5, #0
	b _02269CCA
_02269CAC:
	lsl r6, r5, #1
	add r6, r5, r6
	add r3, r2, #0
	add r7, r1, r6
	b _02269CC4
_02269CB6:
	ldrb r6, [r3, r7]
	cmp r4, r6
	bne _02269CC2
	strb r3, [r0]
	strb r5, [r0, #1]
	pop {r3, r4, r5, r6, r7, pc}
_02269CC2:
	add r3, r3, #1
_02269CC4:
	cmp r3, #3
	blt _02269CB6
	add r5, r5, #1
_02269CCA:
	cmp r5, #2
	blt _02269CAC
_02269CCE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02269CD0: .word 0x0000068A
_02269CD4: .word 0x000006E1
_02269CD8: .word ov12_0226E220
	thumb_func_end ov12_02269C7C

	thumb_func_start ov12_02269CDC
ov12_02269CDC: ; 0x02269CDC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	ldr r0, _02269DC4 ; =0x000006DC
	ldr r2, _02269DC8 ; =ov12_0226E70C
	add r3, r0, #0
	sub r3, #0x51
	ldrsb r5, [r6, r3]
	mov r3, #0x30
	add r4, r6, r0
	mul r3, r5
	add r5, r2, r3
	cmp r1, #1
	bne _02269D3E
	mov r1, #0
	strb r1, [r4, #2]
	strb r1, [r4, #1]
	mov r1, #1
	ldrsb r2, [r4, r1]
	mov r3, #2
	ldr r1, _02269DCC ; =ov12_0226E1FC
	ldrsb r3, [r4, r3]
	add r1, r1, r2
	sub r0, r0, #4
	ldrb r2, [r3, r1]
	ldr r1, [r5, #0x14]
	lsl r3, r2, #2
	add r1, r1, r3
	ldrb r1, [r1, #1]
	sub r1, #8
	str r1, [sp]
	mov r1, #0x11
	lsl r1, r1, #0x10
	str r1, [sp, #4]
	ldr r4, [r5, #0x14]
	ldr r0, [r6, r0]
	add r2, r4, r3
	ldrb r1, [r2, #2]
	ldrb r2, [r2, #3]
	ldrb r3, [r4, r3]
	add r1, #8
	sub r2, #8
	add r3, #8
	bl ov12_0226BB1C
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r4, r5, r6, pc}
_02269D3E:
	ldr r3, _02269DCC ; =ov12_0226E1FC
	add r0, r4, #0
	mov r1, #1
	mov r2, #2
	bl ov12_0226A6EC
	cmp r0, #0x20
	bhi _02269D64
	bhs _02269D70
	cmp r0, #2
	bhi _02269D5E
	cmp r0, #1
	blo _02269DBC
	beq _02269DAA
	cmp r0, #2
	b _02269DBC
_02269D5E:
	cmp r0, #0x10
	beq _02269D70
	b _02269DBC
_02269D64:
	cmp r0, #0x40
	bhi _02269D6C
	beq _02269D70
	b _02269DBC
_02269D6C:
	cmp r0, #0x80
	bne _02269DBC
_02269D70:
	mov r0, #1
	ldrsb r3, [r4, r0]
	mov r0, #2
	ldr r2, _02269DCC ; =ov12_0226E1FC
	ldrsb r1, [r4, r0]
	add r0, r2, r3
	ldrb r1, [r1, r0]
	ldr r0, [r5, #0x14]
	lsl r3, r1, #2
	add r0, r0, r3
	ldrb r0, [r0, #1]
	sub r0, #8
	str r0, [sp]
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	ldr r4, [r5, #0x14]
	ldr r0, _02269DD0 ; =0x000006D8
	add r2, r4, r3
	ldrb r1, [r2, #2]
	ldrb r2, [r2, #3]
	ldrb r3, [r4, r3]
	ldr r0, [r6, r0]
	add r1, #8
	sub r2, #8
	add r3, #8
	bl ov12_0226BB1C
	b _02269DBC
_02269DAA:
	mov r0, #1
	ldrsb r3, [r4, r0]
	mov r0, #2
	ldr r2, _02269DCC ; =ov12_0226E1FC
	ldrsb r1, [r4, r0]
	add r0, r2, r3
	add sp, #8
	ldrb r0, [r1, r0]
	pop {r4, r5, r6, pc}
_02269DBC:
	mov r0, #0
	mvn r0, r0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02269DC4: .word 0x000006DC
_02269DC8: .word ov12_0226E70C
_02269DCC: .word ov12_0226E1FC
_02269DD0: .word 0x000006D8
	thumb_func_end ov12_02269CDC

	thumb_func_start ov12_02269DD4
ov12_02269DD4: ; 0x02269DD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r1, #0
	add r5, r0, #0
	ldr r1, _02269F40 ; =0x0000068A
	ldr r0, [r5]
	ldrb r1, [r5, r1]
	bl ov12_0223AAD8
	add r1, r0, #0
	ldr r0, [r5]
	bl BattleSystem_GetOpponentData
	bl ov12_02261280
	ldr r1, _02269F44 ; =0x000006DC
	add r3, r0, #0
	add r4, r5, r1
	sub r1, #0x51
	ldrsb r2, [r5, r1]
	mov r1, #0x30
	ldr r0, _02269F48 ; =ov12_0226E70C
	mul r1, r2
	add r2, r5, #0
	add r6, r0, r1
	add r2, #0x1c
	cmp r7, #1
	bne _02269E82
	mov r0, #2
	ldrsb r0, [r3, r0]
	strb r0, [r4, #2]
	mov r0, #3
	ldrsb r0, [r3, r0]
	strb r0, [r4, #1]
	mov r0, #1
	ldrsb r0, [r4, r0]
	lsl r1, r0, #1
	mov r0, #2
	ldrsb r7, [r4, r0]
	ldr r0, _02269F4C ; =ov12_0226E218
	add r0, r0, r1
	ldrb r0, [r7, r0]
	cmp r0, #0
	beq _02269E50
	sub r1, r0, #1
	lsl r1, r1, #1
	ldrh r1, [r2, r1]
	cmp r1, #0
	bne _02269E50
	mov r0, #0
	strb r0, [r3, #2]
	strb r0, [r3, #3]
	strb r0, [r4, #2]
	strb r0, [r4, #1]
	mov r0, #1
	ldrsb r0, [r4, r0]
	lsl r2, r0, #1
	mov r0, #2
	ldrsb r1, [r4, r0]
	ldr r0, _02269F4C ; =ov12_0226E218
	add r0, r0, r2
	ldrb r0, [r1, r0]
_02269E50:
	ldr r1, [r6, #0x14]
	lsl r3, r0, #2
	add r0, r1, r3
	ldrb r0, [r0, #1]
	sub r0, #8
	str r0, [sp]
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	ldr r4, [r6, #0x14]
	ldr r0, _02269F50 ; =0x000006D8
	add r2, r4, r3
	ldrb r1, [r2, #2]
	ldrb r2, [r2, #3]
	ldrb r3, [r4, r3]
	ldr r0, [r5, r0]
	add r1, #8
	sub r2, #8
	add r3, #8
	bl ov12_0226BB1C
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02269E82:
	ldr r0, _02269F4C ; =ov12_0226E218
	add r1, sp, #8
	mov r2, #6
	bl MI_CpuCopy8
	add r0, r4, #0
	mov r1, #2
	mov r2, #3
	add r3, sp, #8
	bl ov12_0226A6EC
	cmp r0, #0x20
	bhi _02269EB4
	bhs _02269EC0
	cmp r0, #2
	bhi _02269EAE
	cmp r0, #1
	blo _02269F38
	beq _02269EFC
	cmp r0, #2
	beq _02269F10
	b _02269F38
_02269EAE:
	cmp r0, #0x10
	beq _02269EC0
	b _02269F38
_02269EB4:
	cmp r0, #0x40
	bhi _02269EBC
	beq _02269EC0
	b _02269F38
_02269EBC:
	cmp r0, #0x80
	bne _02269F38
_02269EC0:
	mov r0, #1
	ldrsb r0, [r4, r0]
	ldr r2, _02269F4C ; =ov12_0226E218
	lsl r3, r0, #1
	mov r0, #2
	ldrsb r1, [r4, r0]
	add r0, r2, r3
	ldrb r1, [r1, r0]
	ldr r0, [r6, #0x14]
	lsl r3, r1, #2
	add r0, r0, r3
	ldrb r0, [r0, #1]
	sub r0, #8
	str r0, [sp]
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	ldr r4, [r6, #0x14]
	ldr r0, _02269F50 ; =0x000006D8
	add r2, r4, r3
	ldrb r1, [r2, #2]
	ldrb r2, [r2, #3]
	ldrb r3, [r4, r3]
	ldr r0, [r5, r0]
	add r1, #8
	sub r2, #8
	add r3, #8
	bl ov12_0226BB1C
	b _02269F38
_02269EFC:
	mov r0, #1
	ldrsb r0, [r4, r0]
	ldr r2, _02269F4C ; =ov12_0226E218
	add sp, #0x10
	lsl r3, r0, #1
	mov r0, #2
	ldrsb r1, [r4, r0]
	add r0, r2, r3
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02269F10:
	mov r0, #0
	add r2, r0, #0
	mov r3, #1
	ldr r1, [r6, #0x18]
	ldr r5, [r6, #0x14]
	b _02269F26
_02269F1C:
	lsl r4, r0, #2
	ldr r4, [r1, r4]
	cmp r4, #0xff
	beq _02269F3C
	add r0, r0, #1
_02269F26:
	lsl r4, r0, #2
	ldrb r4, [r5, r4]
	cmp r0, r4
	bge _02269F32
	add r4, r3, #0
	b _02269F34
_02269F32:
	add r4, r2, #0
_02269F34:
	cmp r4, #0xff
	bne _02269F1C
_02269F38:
	mov r0, #0
	mvn r0, r0
_02269F3C:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02269F40: .word 0x0000068A
_02269F44: .word 0x000006DC
_02269F48: .word ov12_0226E70C
_02269F4C: .word ov12_0226E218
_02269F50: .word 0x000006D8
	thumb_func_end ov12_02269DD4

	thumb_func_start ov12_02269F54
ov12_02269F54: ; 0x02269F54
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	beq _02269F9A
	ldr r1, _02269F9C ; =0x0000068A
	ldr r0, [r5]
	ldrb r1, [r5, r1]
	bl ov12_0223AAD8
	add r1, r0, #0
	ldr r0, [r5]
	bl BattleSystem_GetOpponentData
	bl ov12_02261280
	mov r3, #0
	ldr r7, _02269FA0 ; =ov12_0226E218
	add r1, r3, #0
	b _02269F96
_02269F7A:
	lsl r5, r3, #1
	add r2, r1, #0
	add r6, r7, r5
	b _02269F90
_02269F82:
	ldrb r5, [r2, r6]
	cmp r4, r5
	bne _02269F8E
	strb r2, [r0, #2]
	strb r3, [r0, #3]
	pop {r3, r4, r5, r6, r7, pc}
_02269F8E:
	add r2, r2, #1
_02269F90:
	cmp r2, #2
	blt _02269F82
	add r3, r3, #1
_02269F96:
	cmp r3, #3
	blt _02269F7A
_02269F9A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02269F9C: .word 0x0000068A
_02269FA0: .word ov12_0226E218
	thumb_func_end ov12_02269F54

	thumb_func_start ov12_02269FA4
ov12_02269FA4: ; 0x02269FA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	str r1, [sp, #0x18]
	add r6, r0, #0
	ldr r1, _0226A284 ; =0x0000068A
	mov r0, #0
	str r0, [sp, #0x44]
	ldrb r1, [r6, r1]
	ldr r0, [r6]
	bl ov12_0223AAD8
	add r1, r0, #0
	ldr r0, [r6]
	bl BattleSystem_GetOpponentData
	bl ov12_02261280
	ldr r1, _0226A288 ; =0x000006DC
	str r0, [sp, #0x1c]
	add r7, r6, r1
	sub r1, #0x51
	ldrsb r2, [r6, r1]
	mov r1, #0x30
	ldr r0, _0226A28C ; =ov12_0226E70C
	mul r1, r2
	add r0, r0, r1
	str r0, [sp, #0x48]
	ldr r0, _0226A290 ; =ov12_0226E210
	add r1, sp, #0x50
	mov r2, #6
	bl MI_CpuCopy8
	add r1, sp, #0x58
	add r0, r6, #0
	add r1, #2
	mov r2, #1
	bl ov12_02268DD4
	add r1, sp, #0x54
	add r0, r6, #0
	add r1, #2
	mov r2, #0
	bl ov12_02268DD4
	add r0, sp, #0x54
	mov r2, #0
	mov r4, #0xff
	add r0, #2
	b _0226A022
_0226A006:
	lsl r5, r2, #1
	add r1, sp, #0x50
	mov r3, #0
	add r1, r1, r5
	b _0226A01C
_0226A010:
	ldrb r5, [r3, r1]
	ldrb r5, [r0, r5]
	cmp r5, #0
	bne _0226A01A
	strb r4, [r3, r1]
_0226A01A:
	add r3, r3, #1
_0226A01C:
	cmp r3, #2
	blt _0226A010
	add r2, r2, #1
_0226A022:
	cmp r2, #2
	blt _0226A006
	ldr r0, _0226A294 ; =0x0000068C
	ldrb r0, [r6, r0]
	cmp r0, #0xb
	bhi _0226A052
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0226A03A: ; jump table
	.short _0226A052 - _0226A03A - 2 ; case 0
	.short _0226A05C - _0226A03A - 2 ; case 1
	.short _0226A05C - _0226A03A - 2 ; case 2
	.short _0226A05C - _0226A03A - 2 ; case 3
	.short _0226A052 - _0226A03A - 2 ; case 4
	.short _0226A05C - _0226A03A - 2 ; case 5
	.short _0226A052 - _0226A03A - 2 ; case 6
	.short _0226A05C - _0226A03A - 2 ; case 7
	.short _0226A052 - _0226A03A - 2 ; case 8
	.short _0226A052 - _0226A03A - 2 ; case 9
	.short _0226A052 - _0226A03A - 2 ; case 10
	.short _0226A052 - _0226A03A - 2 ; case 11
_0226A052:
	mov r0, #2
	mov ip, r0
	mov r0, #3
	str r0, [sp, #0x4c]
	b _0226A236
_0226A05C:
	mov r0, #1
	str r0, [sp, #0x44]
	mov ip, r0
	mov r0, #2
	str r0, [sp, #0x4c]
	add r0, sp, #0x50
	ldrb r1, [r0, #9]
	cmp r1, #1
	bne _0226A096
	ldrb r0, [r0, #7]
	cmp r0, #1
	bne _0226A096
	ldr r0, [sp, #0x48]
	ldr r1, [r0, #0x14]
	ldrb r0, [r1, #0xe]
	ldrb r2, [r1, #0xd]
	str r0, [sp, #0x34]
	add r0, #8
	str r0, [sp, #0x34]
	ldrb r0, [r1, #7]
	sub r2, #8
	str r0, [sp, #0x30]
	sub r0, #8
	str r0, [sp, #0x30]
	ldrb r0, [r1, #0xc]
	str r0, [sp, #0x38]
	add r0, #8
	str r0, [sp, #0x38]
	b _0226A102
_0226A096:
	add r0, sp, #0x50
	ldrb r1, [r0, #9]
	cmp r1, #1
	bne _0226A0C6
	ldrb r0, [r0, #7]
	cmp r0, #0
	bne _0226A0C6
	ldr r0, [sp, #0x48]
	ldr r1, [r0, #0x14]
	ldrb r0, [r1, #0xe]
	ldrb r2, [r1, #0xd]
	str r0, [sp, #0x34]
	add r0, #8
	str r0, [sp, #0x34]
	ldrb r0, [r1, #0xf]
	sub r2, #8
	str r0, [sp, #0x30]
	sub r0, #8
	str r0, [sp, #0x30]
	ldrb r0, [r1, #0xc]
	str r0, [sp, #0x38]
	add r0, #8
	str r0, [sp, #0x38]
	b _0226A102
_0226A0C6:
	add r0, sp, #0x50
	ldrb r1, [r0, #9]
	cmp r1, #0
	bne _0226A0F6
	ldrb r0, [r0, #7]
	cmp r0, #1
	bne _0226A0F6
	ldr r0, [sp, #0x48]
	ldr r1, [r0, #0x14]
	ldrb r0, [r1, #6]
	ldrb r2, [r1, #5]
	str r0, [sp, #0x34]
	add r0, #8
	str r0, [sp, #0x34]
	ldrb r0, [r1, #7]
	sub r2, #8
	str r0, [sp, #0x30]
	sub r0, #8
	str r0, [sp, #0x30]
	ldrb r0, [r1, #4]
	str r0, [sp, #0x38]
	add r0, #8
	str r0, [sp, #0x38]
	b _0226A102
_0226A0F6:
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x34]
	str r0, [sp, #0x30]
	str r0, [sp, #0x38]
	add r2, r0, #0
_0226A102:
	add r0, sp, #0x50
	ldrb r1, [r0, #6]
	cmp r1, #1
	bne _0226A12A
	ldrb r0, [r0, #8]
	cmp r0, #1
	bne _0226A12A
	ldr r0, [sp, #0x48]
	ldr r0, [r0, #0x14]
	ldrb r3, [r0, #2]
	ldrb r4, [r0, #0xb]
	ldrb r5, [r0]
	ldrb r0, [r0, #1]
	add r3, #8
	sub r4, #8
	str r0, [sp, #0x2c]
	sub r0, #8
	add r5, #8
	str r0, [sp, #0x2c]
	b _0226A184
_0226A12A:
	add r0, sp, #0x50
	ldrb r1, [r0, #6]
	cmp r1, #1
	bne _0226A152
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0226A152
	ldr r0, [sp, #0x48]
	ldr r0, [r0, #0x14]
	ldrb r3, [r0, #2]
	ldrb r4, [r0, #3]
	ldrb r5, [r0]
	ldrb r0, [r0, #1]
	add r3, #8
	sub r4, #8
	str r0, [sp, #0x2c]
	sub r0, #8
	add r5, #8
	str r0, [sp, #0x2c]
	b _0226A184
_0226A152:
	add r0, sp, #0x50
	ldrb r1, [r0, #6]
	cmp r1, #0
	bne _0226A17A
	ldrb r0, [r0, #8]
	cmp r0, #1
	bne _0226A17A
	ldr r0, [sp, #0x48]
	ldr r0, [r0, #0x14]
	ldrb r3, [r0, #0xa]
	ldrb r4, [r0, #0xb]
	ldrb r5, [r0, #8]
	ldrb r0, [r0, #9]
	add r3, #8
	sub r4, #8
	str r0, [sp, #0x2c]
	sub r0, #8
	add r5, #8
	str r0, [sp, #0x2c]
	b _0226A184
_0226A17A:
	mov r3, #0
	mvn r3, r3
	add r4, r3, #0
	add r5, r3, #0
	str r3, [sp, #0x2c]
_0226A184:
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x40]
	str r0, [sp, #0x3c]
	str r0, [sp, #0x28]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x34]
	cmp r0, r3
	beq _0226A1BA
	add r1, r0, #0
	ldr r0, [sp, #0x40]
	cmp r1, r0
	beq _0226A1A2
	cmp r3, r0
	beq _0226A1BA
_0226A1A2:
	mov r1, #0
	ldr r0, [sp, #0x34]
	mvn r1, r1
	cmp r0, r1
	bne _0226A1B4
	cmp r3, r1
	beq _0226A1B4
	str r3, [sp, #0x34]
	b _0226A1BA
_0226A1B4:
	mov r0, #2
	str r3, [sp, #0x40]
	str r0, [sp, #0x20]
_0226A1BA:
	ldr r0, [sp, #0x30]
	cmp r0, r4
	beq _0226A1E4
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0226A1CC
	cmp r4, r1
	beq _0226A1E4
_0226A1CC:
	mov r1, #0
	ldr r0, [sp, #0x30]
	mvn r1, r1
	cmp r0, r1
	bne _0226A1DE
	cmp r4, r1
	beq _0226A1DE
	str r4, [sp, #0x30]
	b _0226A1E4
_0226A1DE:
	mov r0, #3
	str r4, [sp, #0x40]
	str r0, [sp, #0x20]
_0226A1E4:
	mov r1, #0
	ldr r0, [sp, #0x38]
	mvn r1, r1
	cmp r0, r1
	beq _0226A1F2
	cmp r5, r1
	beq _0226A206
_0226A1F2:
	mov r1, #0
	ldr r0, [sp, #0x38]
	mvn r1, r1
	cmp r0, r1
	bne _0226A204
	cmp r5, r1
	beq _0226A204
	str r5, [sp, #0x38]
	b _0226A206
_0226A204:
	str r2, [sp, #0x3c]
_0226A206:
	mov r1, #0
	mvn r1, r1
	cmp r2, r1
	beq _0226A218
	ldr r0, [sp, #0x2c]
	cmp r0, r1
	bne _0226A218
	str r2, [sp, #0x2c]
	b _0226A236
_0226A218:
	mov r1, #0
	mvn r1, r1
	cmp r2, r1
	bne _0226A226
	ldr r0, [sp, #0x2c]
	cmp r0, r1
	bne _0226A236
_0226A226:
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x20]
	cmp r0, #2
	bne _0226A234
	str r2, [sp, #0x24]
	b _0226A236
_0226A234:
	str r2, [sp, #0x28]
_0226A236:
	ldr r0, [sp, #0x18]
	cmp r0, #1
	beq _0226A23E
	b _0226A3AA
_0226A23E:
	ldr r0, [sp, #0x44]
	cmp r0, #0
	bne _0226A2EE
	ldr r0, [sp, #0x1c]
	mov r1, #6
	ldrsb r1, [r0, r1]
	ldr r0, _0226A294 ; =0x0000068C
	ldrb r0, [r6, r0]
	cmp r1, r0
	bne _0226A264
	ldr r0, [sp, #0x1c]
	mov r1, #4
	ldrsb r0, [r0, r1]
	mov r1, #5
	strb r0, [r7, #2]
	ldr r0, [sp, #0x1c]
	ldrsb r0, [r0, r1]
	strb r0, [r7, #1]
	b _0226A2AE
_0226A264:
	add r0, sp, #0x50
	ldrb r1, [r0, #0xd]
	cmp r1, #1
	bne _0226A274
	mov r0, #0
	strb r0, [r7, #2]
	strb r0, [r7, #1]
	b _0226A2AE
_0226A274:
	ldrb r1, [r0, #0xb]
	cmp r1, #1
	bne _0226A298
	mov r0, #1
	strb r0, [r7, #2]
	mov r0, #0
	strb r0, [r7, #1]
	b _0226A2AE
	.balign 4, 0
_0226A284: .word 0x0000068A
_0226A288: .word 0x000006DC
_0226A28C: .word ov12_0226E70C
_0226A290: .word ov12_0226E210
_0226A294: .word 0x0000068C
_0226A298:
	ldrb r0, [r0, #0xa]
	cmp r0, #1
	bne _0226A2A8
	mov r0, #0
	strb r0, [r7, #2]
	mov r0, #1
	strb r0, [r7, #1]
	b _0226A2AE
_0226A2A8:
	mov r0, #1
	strb r0, [r7, #2]
	strb r0, [r7, #1]
_0226A2AE:
	mov r0, #1
	ldrsb r0, [r7, r0]
	ldr r2, _0226A58C ; =ov12_0226E210
	lsl r3, r0, #1
	mov r0, #2
	ldrsb r1, [r7, r0]
	add r0, r2, r3
	ldrb r1, [r1, r0]
	ldr r0, [sp, #0x48]
	lsl r3, r1, #2
	ldr r0, [r0, #0x14]
	ldr r1, [sp, #0x48]
	add r0, r0, r3
	ldrb r0, [r0, #1]
	sub r0, #8
	str r0, [sp]
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	ldr r4, [r1, #0x14]
	ldr r0, _0226A590 ; =0x000006D8
	add r2, r4, r3
	ldrb r1, [r2, #2]
	ldrb r2, [r2, #3]
	ldrb r3, [r4, r3]
	ldr r0, [r6, r0]
	add r1, #8
	sub r2, #8
	add r3, #8
	bl ov12_0226BB1C
	b _0226A3A2
_0226A2EE:
	mov r2, #0
	strb r2, [r7, #2]
	ldr r0, [sp, #0x24]
	sub r1, r2, #1
	strb r2, [r7, #1]
	cmp r0, r1
	bne _0226A302
	ldr r0, [sp, #0x28]
	cmp r0, r1
	beq _0226A30C
_0226A302:
	mov r1, #0
	ldr r0, [sp, #0x40]
	mvn r1, r1
	cmp r0, r1
	bne _0226A326
_0226A30C:
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x34]
	str r0, [sp]
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0226A590 ; =0x000006D8
	ldr r2, [sp, #0x30]
	ldr r0, [r6, r0]
	ldr r3, [sp, #0x38]
	bl ov12_0226BB1C
	b _0226A384
_0226A326:
	ldr r0, [sp, #0x24]
	cmp r0, r1
	beq _0226A35C
	ldr r0, [sp, #0x28]
	cmp r0, r1
	bne _0226A35C
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x34]
	str r0, [sp]
	ldr r0, [sp, #0x34]
	ldr r2, [sp, #0x38]
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x30]
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x10]
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, _0226A590 ; =0x000006D8
	ldr r0, [r6, r0]
	bl ov12_0226BA4C
	b _0226A384
_0226A35C:
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x34]
	str r0, [sp]
	ldr r0, [sp, #0x34]
	ldr r2, [sp, #0x38]
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	str r0, [sp, #0x10]
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, _0226A590 ; =0x000006D8
	ldr r0, [r6, r0]
	bl ov12_0226BA4C
_0226A384:
	mov r1, #0
	ldr r0, [sp, #0x40]
	mvn r1, r1
	cmp r0, r1
	beq _0226A3A2
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp]
	ldr r0, _0226A590 ; =0x000006D8
	ldr r1, [sp, #0x40]
	ldr r0, [r6, r0]
	ldr r2, [sp, #0x3c]
	ldr r3, [sp, #0x20]
	bl ov12_0226BB40
_0226A3A2:
	mov r0, #0
	add sp, #0x60
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0226A3AA:
	ldr r0, [sp, #0x44]
	cmp r0, #0
	bne _0226A3BE
	ldr r2, [sp, #0x4c]
	add r0, r7, #0
	mov r1, ip
	add r3, sp, #0x50
	bl ov12_0226A6EC
	b _0226A3CA
_0226A3BE:
	ldr r2, [sp, #0x4c]
	add r0, r7, #0
	mov r1, ip
	mov r3, #0
	bl ov12_0226A6EC
_0226A3CA:
	cmp r0, #0x20
	bhi _0226A3EA
	bhs _0226A3F8
	cmp r0, #2
	bhi _0226A3E4
	cmp r0, #1
	blo _0226A3E2
	bne _0226A3DC
	b _0226A532
_0226A3DC:
	cmp r0, #2
	bne _0226A3E2
	b _0226A57E
_0226A3E2:
	b _0226A584
_0226A3E4:
	cmp r0, #0x10
	beq _0226A3F8
	b _0226A584
_0226A3EA:
	cmp r0, #0x40
	bhi _0226A3F2
	beq _0226A3F8
	b _0226A584
_0226A3F2:
	cmp r0, #0x80
	beq _0226A3F8
	b _0226A584
_0226A3F8:
	ldr r0, [sp, #0x44]
	cmp r0, #0
	bne _0226A43E
	mov r0, #1
	ldrsb r0, [r7, r0]
	ldr r2, _0226A58C ; =ov12_0226E210
	lsl r3, r0, #1
	mov r0, #2
	ldrsb r1, [r7, r0]
	add r0, r2, r3
	ldrb r1, [r1, r0]
	ldr r0, [sp, #0x48]
	lsl r3, r1, #2
	ldr r0, [r0, #0x14]
	ldr r1, [sp, #0x48]
	add r0, r0, r3
	ldrb r0, [r0, #1]
	sub r0, #8
	str r0, [sp]
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	ldr r4, [r1, #0x14]
	ldr r0, _0226A590 ; =0x000006D8
	add r2, r4, r3
	ldrb r1, [r2, #2]
	ldrb r2, [r2, #3]
	ldrb r3, [r4, r3]
	ldr r0, [r6, r0]
	add r1, #8
	sub r2, #8
	add r3, #8
	bl ov12_0226BB1C
	b _0226A584
_0226A43E:
	mov r2, #1
	ldrsb r0, [r7, r2]
	cmp r0, #0
	bne _0226A500
	ldr r0, [sp, #0x28]
	sub r1, r2, #2
	cmp r0, r1
	bne _0226A454
	ldr r0, [sp, #0x24]
	cmp r0, r1
	beq _0226A45E
_0226A454:
	mov r1, #0
	ldr r0, [sp, #0x40]
	mvn r1, r1
	cmp r0, r1
	bne _0226A478
_0226A45E:
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x34]
	str r0, [sp]
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0226A590 ; =0x000006D8
	ldr r2, [sp, #0x30]
	ldr r0, [r6, r0]
	ldr r3, [sp, #0x38]
	bl ov12_0226BB1C
	b _0226A4D6
_0226A478:
	ldr r0, [sp, #0x24]
	cmp r0, r1
	beq _0226A4AE
	ldr r0, [sp, #0x28]
	cmp r0, r1
	bne _0226A4AE
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x34]
	str r0, [sp]
	ldr r0, [sp, #0x34]
	ldr r2, [sp, #0x38]
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x30]
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x10]
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, _0226A590 ; =0x000006D8
	ldr r0, [r6, r0]
	bl ov12_0226BA4C
	b _0226A4D6
_0226A4AE:
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x34]
	str r0, [sp]
	ldr r0, [sp, #0x34]
	ldr r2, [sp, #0x38]
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	str r0, [sp, #0x10]
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, _0226A590 ; =0x000006D8
	ldr r0, [r6, r0]
	bl ov12_0226BA4C
_0226A4D6:
	mov r1, #0
	ldr r0, [sp, #0x40]
	mvn r1, r1
	cmp r0, r1
	beq _0226A4F6
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp]
	ldr r0, _0226A590 ; =0x000006D8
	ldr r1, [sp, #0x40]
	ldr r0, [r6, r0]
	ldr r2, [sp, #0x3c]
	ldr r3, [sp, #0x20]
	bl ov12_0226BB40
	b _0226A584
_0226A4F6:
	ldr r0, _0226A590 ; =0x000006D8
	ldr r0, [r6, r0]
	bl ov12_0226BB84
	b _0226A584
_0226A500:
	ldr r0, [sp, #0x48]
	ldr r1, [sp, #0x48]
	ldr r0, [r0, #0x14]
	ldrb r0, [r0, #0x11]
	sub r0, #8
	str r0, [sp]
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	ldr r3, [r1, #0x14]
	ldr r0, _0226A590 ; =0x000006D8
	ldrb r1, [r3, #0x12]
	ldrb r2, [r3, #0x13]
	ldrb r3, [r3, #0x10]
	ldr r0, [r6, r0]
	add r1, #8
	sub r2, #8
	add r3, #8
	bl ov12_0226BB1C
	ldr r0, _0226A590 ; =0x000006D8
	ldr r0, [r6, r0]
	bl ov12_0226BB84
	b _0226A584
_0226A532:
	ldr r0, [sp, #0x44]
	cmp r0, #1
	bne _0226A55C
	mov r0, #1
	ldrsb r0, [r7, r0]
	cmp r0, #0
	ble _0226A546
	add sp, #0x60
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_0226A546:
	add r2, sp, #0x58
	mov r0, #0
	add r2, #2
	b _0226A556
_0226A54E:
	ldrb r1, [r2, r0]
	cmp r1, #1
	beq _0226A588
	add r0, r0, #1
_0226A556:
	cmp r0, #4
	blt _0226A54E
	b _0226A584
_0226A55C:
	mov r0, #1
	ldrsb r0, [r7, r0]
	ldr r2, _0226A58C ; =ov12_0226E210
	lsl r3, r0, #1
	mov r0, #2
	ldrsb r1, [r7, r0]
	add r0, r2, r3
	ldrb r0, [r1, r0]
	cmp r0, #4
	beq _0226A588
	add r1, sp, #0x58
	add r1, #2
	ldrb r1, [r1, r0]
	cmp r1, #1
	bne _0226A584
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
_0226A57E:
	add sp, #0x60
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_0226A584:
	mov r0, #0
	mvn r0, r0
_0226A588:
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0226A58C: .word ov12_0226E210
_0226A590: .word 0x000006D8
	thumb_func_end ov12_02269FA4

	thumb_func_start ov12_0226A594
ov12_0226A594: ; 0x0226A594
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	beq _0226A5E2
	ldr r1, _0226A5E4 ; =0x0000068A
	ldr r0, [r5]
	ldrb r1, [r5, r1]
	bl ov12_0223AAD8
	add r1, r0, #0
	ldr r0, [r5]
	bl BattleSystem_GetOpponentData
	bl ov12_02261280
	ldr r1, _0226A5E8 ; =0x0000068C
	mov r3, #0
	ldrb r1, [r5, r1]
	ldr r7, _0226A5EC ; =ov12_0226E210
	strb r1, [r0, #6]
	add r1, r3, #0
	b _0226A5DE
_0226A5C2:
	lsl r5, r3, #1
	add r2, r1, #0
	add r6, r7, r5
	b _0226A5D8
_0226A5CA:
	ldrb r5, [r2, r6]
	cmp r4, r5
	bne _0226A5D6
	strb r2, [r0, #4]
	strb r3, [r0, #5]
	pop {r3, r4, r5, r6, r7, pc}
_0226A5D6:
	add r2, r2, #1
_0226A5D8:
	cmp r2, #2
	blt _0226A5CA
	add r3, r3, #1
_0226A5DE:
	cmp r3, #3
	blt _0226A5C2
_0226A5E2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0226A5E4: .word 0x0000068A
_0226A5E8: .word 0x0000068C
_0226A5EC: .word ov12_0226E210
	thumb_func_end ov12_0226A594

	thumb_func_start ov12_0226A5F0
ov12_0226A5F0: ; 0x0226A5F0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	ldr r0, _0226A6DC ; =0x000006DC
	ldr r2, _0226A6E0 ; =ov12_0226E70C
	add r3, r0, #0
	sub r3, #0x51
	ldrsb r5, [r6, r3]
	mov r3, #0x30
	add r4, r6, r0
	mul r3, r5
	add r5, r2, r3
	cmp r1, #1
	bne _0226A64C
	mov r1, #1
	ldrsb r2, [r4, r1]
	mov r3, #2
	ldr r1, _0226A6E4 ; =ov12_0226E200
	ldrsb r3, [r4, r3]
	add r1, r1, r2
	sub r0, r0, #4
	ldrb r2, [r3, r1]
	ldr r1, [r5, #0x14]
	lsl r3, r2, #2
	add r1, r1, r3
	ldrb r1, [r1, #1]
	sub r1, #8
	str r1, [sp]
	mov r1, #0x11
	lsl r1, r1, #0x10
	str r1, [sp, #4]
	ldr r4, [r5, #0x14]
	ldr r0, [r6, r0]
	add r2, r4, r3
	ldrb r1, [r2, #2]
	ldrb r2, [r2, #3]
	ldrb r3, [r4, r3]
	add r1, #8
	sub r2, #8
	add r3, #8
	bl ov12_0226BB1C
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r4, r5, r6, pc}
_0226A64C:
	ldr r3, _0226A6E4 ; =ov12_0226E200
	add r0, r4, #0
	mov r1, #1
	mov r2, #2
	bl ov12_0226A6EC
	cmp r0, #0x20
	bhi _0226A674
	bhs _0226A680
	cmp r0, #2
	bhi _0226A66E
	cmp r0, #1
	blo _0226A6D2
	beq _0226A6BA
	cmp r0, #2
	beq _0226A6CC
	b _0226A6D2
_0226A66E:
	cmp r0, #0x10
	beq _0226A680
	b _0226A6D2
_0226A674:
	cmp r0, #0x40
	bhi _0226A67C
	beq _0226A680
	b _0226A6D2
_0226A67C:
	cmp r0, #0x80
	bne _0226A6D2
_0226A680:
	mov r0, #1
	ldrsb r3, [r4, r0]
	mov r0, #2
	ldr r2, _0226A6E4 ; =ov12_0226E200
	ldrsb r1, [r4, r0]
	add r0, r2, r3
	ldrb r1, [r1, r0]
	ldr r0, [r5, #0x14]
	lsl r3, r1, #2
	add r0, r0, r3
	ldrb r0, [r0, #1]
	sub r0, #8
	str r0, [sp]
	mov r0, #0x11
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	ldr r4, [r5, #0x14]
	ldr r0, _0226A6E8 ; =0x000006D8
	add r2, r4, r3
	ldrb r1, [r2, #2]
	ldrb r2, [r2, #3]
	ldrb r3, [r4, r3]
	ldr r0, [r6, r0]
	add r1, #8
	sub r2, #8
	add r3, #8
	bl ov12_0226BB1C
	b _0226A6D2
_0226A6BA:
	mov r0, #1
	ldrsb r3, [r4, r0]
	mov r0, #2
	ldr r2, _0226A6E4 ; =ov12_0226E200
	ldrsb r1, [r4, r0]
	add r0, r2, r3
	add sp, #8
	ldrb r0, [r1, r0]
	pop {r4, r5, r6, pc}
_0226A6CC:
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0226A6D2:
	mov r0, #0
	mvn r0, r0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0226A6DC: .word 0x000006DC
_0226A6E0: .word ov12_0226E70C
_0226A6E4: .word ov12_0226E200
_0226A6E8: .word 0x000006D8
	thumb_func_end ov12_0226A5F0

	thumb_func_start ov12_0226A6EC
ov12_0226A6EC: ; 0x0226A6EC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #2
	ldrsb r1, [r0, r1]
	add r6, r2, #0
	add r2, r3, #0
	cmp r1, r4
	blt _0226A700
	sub r1, r4, #1
	strb r1, [r0, #2]
_0226A700:
	mov r1, #1
	ldrsb r1, [r0, r1]
	cmp r1, r6
	blt _0226A70C
	sub r1, r6, #1
	strb r1, [r0, #1]
_0226A70C:
	mov r7, #2
	ldrsb r1, [r0, r7]
	mov r5, #1
	mov r3, #0x40
	str r1, [sp]
	ldrsb r1, [r0, r5]
	mov ip, r1
	ldr r1, _0226A8DC ; =gSystem
	ldr r1, [r1, #0x48]
	tst r3, r1
	beq _0226A772
	mov r1, ip
	sub r1, r1, #1
	strb r1, [r0, #1]
	ldrsb r1, [r0, r5]
	cmp r1, #0
	bge _0226A732
	mov r1, #0
	strb r1, [r0, #1]
_0226A732:
	cmp r2, #0
	beq _0226A76E
	mov r3, #1
	mov r1, #2
	ldrsb r3, [r0, r3]
	ldrsb r1, [r0, r1]
	mul r3, r4
	add r1, r1, r3
	ldrb r1, [r2, r1]
	cmp r1, #0xff
	bne _0226A76E
	add r1, r0, #1
	mov r7, #0
	mov r6, #1
_0226A74E:
	ldrsb r3, [r1, r7]
	sub r3, r3, #1
	strb r3, [r1]
	ldrsb r3, [r0, r6]
	cmp r3, #0
	bge _0226A760
	mov r1, ip
	strb r1, [r0, #1]
	b _0226A76E
_0226A760:
	mov r5, #2
	ldrsb r5, [r0, r5]
	mul r3, r4
	add r5, r2, r5
	ldrb r3, [r3, r5]
	cmp r3, #0xff
	beq _0226A74E
_0226A76E:
	mov r5, #0x40
	b _0226A886
_0226A772:
	mov r3, #0x80
	tst r3, r1
	beq _0226A7C8
	mov r1, ip
	add r1, r1, #1
	strb r1, [r0, #1]
	ldrsb r1, [r0, r5]
	cmp r1, r6
	blt _0226A788
	sub r1, r6, #1
	strb r1, [r0, #1]
_0226A788:
	cmp r2, #0
	beq _0226A7C4
	mov r3, #1
	mov r1, #2
	ldrsb r3, [r0, r3]
	ldrsb r1, [r0, r1]
	mul r3, r4
	add r1, r1, r3
	ldrb r1, [r2, r1]
	cmp r1, #0xff
	bne _0226A7C4
	add r1, r0, #1
	mov r7, #1
_0226A7A2:
	mov r3, #0
	ldrsb r3, [r1, r3]
	add r3, r3, #1
	strb r3, [r1]
	ldrsb r3, [r0, r7]
	cmp r3, r6
	blt _0226A7B6
	mov r1, ip
	strb r1, [r0, #1]
	b _0226A7C4
_0226A7B6:
	mov r5, #2
	ldrsb r5, [r0, r5]
	mul r3, r4
	add r5, r2, r5
	ldrb r3, [r3, r5]
	cmp r3, #0xff
	beq _0226A7A2
_0226A7C4:
	mov r5, #0x80
	b _0226A886
_0226A7C8:
	mov r3, #0x20
	tst r3, r1
	beq _0226A81E
	ldr r1, [sp]
	sub r1, r1, #1
	strb r1, [r0, #2]
	ldrsb r1, [r0, r7]
	cmp r1, #0
	bge _0226A7DE
	mov r1, #0
	strb r1, [r0, #2]
_0226A7DE:
	cmp r2, #0
	beq _0226A81A
	mov r3, #1
	mov r1, #2
	ldrsb r3, [r0, r3]
	ldrsb r1, [r0, r1]
	mul r3, r4
	add r1, r1, r3
	ldrb r1, [r2, r1]
	cmp r1, #0xff
	bne _0226A81A
	add r5, r0, #2
	mov r7, #0
	mov r6, #2
_0226A7FA:
	ldrsb r1, [r5, r7]
	sub r1, r1, #1
	strb r1, [r5]
	ldrsb r3, [r0, r6]
	cmp r3, #0
	bge _0226A80C
	ldr r1, [sp]
	strb r1, [r0, #2]
	b _0226A81A
_0226A80C:
	mov r1, #1
	ldrsb r1, [r0, r1]
	add r3, r2, r3
	mul r1, r4
	ldrb r1, [r1, r3]
	cmp r1, #0xff
	beq _0226A7FA
_0226A81A:
	mov r5, #0x20
	b _0226A886
_0226A81E:
	mov r3, #0x10
	tst r3, r1
	beq _0226A874
	ldr r1, [sp]
	add r1, r1, #1
	strb r1, [r0, #2]
	ldrsb r1, [r0, r7]
	cmp r1, r4
	blt _0226A834
	sub r1, r4, #1
	strb r1, [r0, #2]
_0226A834:
	cmp r2, #0
	beq _0226A870
	mov r3, #1
	mov r1, #2
	ldrsb r3, [r0, r3]
	ldrsb r1, [r0, r1]
	mul r3, r4
	add r1, r1, r3
	ldrb r1, [r2, r1]
	cmp r1, #0xff
	bne _0226A870
	add r5, r0, #2
	mov r7, #0
	mov r6, #2
_0226A850:
	ldrsb r1, [r5, r7]
	add r1, r1, #1
	strb r1, [r5]
	ldrsb r3, [r0, r6]
	cmp r3, r4
	blt _0226A862
	ldr r1, [sp]
	strb r1, [r0, #2]
	b _0226A870
_0226A862:
	mov r1, #1
	ldrsb r1, [r0, r1]
	add r3, r2, r3
	mul r1, r4
	ldrb r1, [r1, r3]
	cmp r1, #0xff
	beq _0226A850
_0226A870:
	mov r5, #0x10
	b _0226A886
_0226A874:
	add r3, r1, #0
	tst r3, r5
	bne _0226A886
	tst r1, r7
	beq _0226A882
	add r5, r7, #0
	b _0226A886
_0226A882:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0226A886:
	cmp r2, #0
	beq _0226A8B0
	mov r1, ip
	add r3, r4, #0
	mul r3, r1
	ldr r1, [sp]
	add r1, r1, r3
	mov r3, #2
	ldrsb r6, [r0, r3]
	mov r3, #1
	ldrsb r3, [r0, r3]
	ldrb r1, [r2, r1]
	mul r3, r4
	add r3, r6, r3
	ldrb r2, [r2, r3]
	cmp r1, r2
	bne _0226A8B0
	ldr r1, [sp]
	strb r1, [r0, #2]
	mov r1, ip
	strb r1, [r0, #1]
_0226A8B0:
	mov r1, #2
	ldrsb r2, [r0, r1]
	ldr r1, [sp]
	cmp r2, r1
	bne _0226A8C4
	mov r1, #1
	ldrsb r1, [r0, r1]
	mov r0, ip
	cmp r1, r0
	beq _0226A8CC
_0226A8C4:
	ldr r0, _0226A8E0 ; =0x000005DC
	bl PlaySE
	b _0226A8D6
_0226A8CC:
	mov r0, #0xf0
	tst r0, r5
	beq _0226A8D6
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0226A8D6:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226A8DC: .word gSystem
_0226A8E0: .word 0x000005DC
	thumb_func_end ov12_0226A6EC

	thumb_func_start ov12_0226A8E4
ov12_0226A8E4: ; 0x0226A8E4
	mov r1, #0x6e
	lsl r1, r1, #4
	ldrb r0, [r0, r1]
	bx lr
	thumb_func_end ov12_0226A8E4

	thumb_func_start ov12_0226A8EC
ov12_0226A8EC: ; 0x0226A8EC
	mov r2, #0x6e
	lsl r2, r2, #4
	strb r1, [r0, r2]
	bx lr
	thumb_func_end ov12_0226A8EC

	thumb_func_start ov12_0226A8F4
ov12_0226A8F4: ; 0x0226A8F4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8E4
	ldr r0, [r4]
	bl ov12_0223A8EC
	ldr r0, [r4]
	bl BattleSystem_GetPaletteData
	ldr r0, [r4]
	bl ov12_0223BB04
	cmp r0, #0
	bne _0226A930
	ldr r0, _0226A954 ; =0x000006E8
	ldrb r0, [r4, r0]
	cmp r0, #2
	blo _0226A920
	bl GF_AssertFail
_0226A920:
	ldr r1, _0226A954 ; =0x000006E8
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r2, r1, #2
	ldr r1, _0226A958 ; =ov12_0226E260
	ldr r1, [r1, r2]
	blx r1
	b _0226A936
_0226A930:
	add r0, r4, #0
	bl ov12_0226AA10
_0226A936:
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0226A952
	ldr r1, _0226A95C ; =0x000006E9
	mov r3, #0
	strb r3, [r4, r1]
	add r2, r1, #1
	strb r3, [r4, r2]
	sub r2, r1, #1
	ldrb r2, [r4, r2]
	sub r1, r1, #1
	add r2, r2, #1
	strb r2, [r4, r1]
_0226A952:
	pop {r4, pc}
	.balign 4, 0
_0226A954: .word 0x000006E8
_0226A958: .word ov12_0226E260
_0226A95C: .word 0x000006E9
	thumb_func_end ov12_0226A8F4

	thumb_func_start ov12_0226A960
ov12_0226A960: ; 0x0226A960
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0226A9B0 ; =0x000006E9
	ldrb r1, [r4, r0]
	cmp r1, #0
	bne _0226A990
	sub r0, r0, #5
	mov r3, #0x11
	ldr r0, [r4, r0]
	mov r1, #0x80
	mov r2, #0x3b
	lsl r3, r3, #0x10
	bl ov12_0226BCFC
	ldr r0, _0226A9B4 ; =0x000006E4
	mov r1, #0x3c
	ldr r0, [r4, r0]
	bl ov12_0226BD4C
	ldr r0, _0226A9B0 ; =0x000006E9
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0226A9A8
_0226A990:
	sub r0, r0, #5
	ldr r0, [r4, r0]
	bl ov12_0226BD50
	cmp r0, #1
	bne _0226A9A8
	ldr r0, _0226A9B0 ; =0x000006E9
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r0, #0
	pop {r4, pc}
_0226A9A8:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	nop
_0226A9B0: .word 0x000006E9
_0226A9B4: .word 0x000006E4
	thumb_func_end ov12_0226A960

	thumb_func_start ov12_0226A9B8
ov12_0226A9B8: ; 0x0226A9B8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0226AA08 ; =0x000006E9
	ldrb r1, [r4, r0]
	cmp r1, #0
	bne _0226A9E8
	sub r0, r0, #5
	mov r3, #0x11
	ldr r0, [r4, r0]
	mov r1, #0x40
	mov r2, #0x15
	lsl r3, r3, #0x10
	bl ov12_0226BCFC
	ldr r0, _0226AA0C ; =0x000006E4
	mov r1, #0x3c
	ldr r0, [r4, r0]
	bl ov12_0226BD4C
	ldr r0, _0226AA08 ; =0x000006E9
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0226AA00
_0226A9E8:
	sub r0, r0, #5
	ldr r0, [r4, r0]
	bl ov12_0226BD50
	cmp r0, #1
	bne _0226AA00
	ldr r0, _0226AA08 ; =0x000006E9
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0226AA00:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	nop
_0226AA08: .word 0x000006E9
_0226AA0C: .word 0x000006E4
	thumb_func_end ov12_0226A9B8

	thumb_func_start ov12_0226AA10
ov12_0226AA10: ; 0x0226AA10
	push {r4, lr}
	ldr r1, _0226AA84 ; =0x000006E9
	add r4, r0, #0
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _0226AA22
	cmp r0, #1
	beq _0226AA40
	b _0226AA64
_0226AA22:
	add r0, r1, #1
	ldrb r0, [r4, r0]
	add r2, r0, #1
	add r0, r1, #1
	strb r2, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #0x3c
	bls _0226AA7C
	mov r2, #0
	add r0, r1, #1
	strb r2, [r4, r0]
	ldrb r0, [r4, r1]
	add r0, r0, #1
	strb r0, [r4, r1]
	b _0226AA7C
_0226AA40:
	sub r0, r1, #5
	mov r3, #0x11
	ldr r0, [r4, r0]
	mov r1, #0x28
	mov r2, #0x91
	lsl r3, r3, #0x10
	bl ov12_0226BCFC
	ldr r0, _0226AA88 ; =0x000006E4
	mov r1, #0x3c
	ldr r0, [r4, r0]
	bl ov12_0226BD4C
	ldr r0, _0226AA84 ; =0x000006E9
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0226AA7C
_0226AA64:
	sub r0, r1, #5
	ldr r0, [r4, r0]
	bl ov12_0226BD50
	cmp r0, #1
	bne _0226AA7C
	ldr r0, _0226AA84 ; =0x000006E9
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0226AA7C:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	nop
_0226AA84: .word 0x000006E9
_0226AA88: .word 0x000006E4
	thumb_func_end ov12_0226AA10

	thumb_func_start ov12_0226AA8C
ov12_0226AA8C: ; 0x0226AA8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp, #0x1c]
	ldr r0, [r0]
	add r4, r1, #0
	bl BattleSystem_GetBgConfig
	add r5, r0, #0
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	bl BattleSystem_GetPaletteData
	add r6, r0, #0
	ldr r1, _0226AC50 ; =0x0000068B
	ldr r0, [sp, #0x1c]
	ldrsb r0, [r0, r1]
	cmp r0, #0x12
	beq _0226AAB4
	bl GF_AssertFail
_0226AAB4:
	mov r0, #0
	str r0, [sp]
	mov r1, #5
	add r0, r5, #0
	mov r2, #0x20
	mov r3, #1
	str r1, [sp, #4]
	bl LoadUserFrameGfx1
	add r0, r6, #0
	mov r1, #1
	mov r2, #0x10
	mov r3, #0x20
	bl sub_020032A4
	mov r0, #6
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	str r3, [sp, #8]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0x20
	str r3, [sp, #0xc]
	bl FillBgTilemapRect
	mov r0, #6
	str r0, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0x21
	mov r3, #2
	bl FillBgTilemapRect
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0x22
	mov r3, #0x1e
	bl FillBgTilemapRect
	mov r0, #7
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0x23
	str r3, [sp, #0xc]
	bl FillBgTilemapRect
	mov r0, #7
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0x25
	mov r3, #0x1e
	bl FillBgTilemapRect
	mov r0, #0xb
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	str r3, [sp, #8]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0x26
	str r3, [sp, #0xc]
	bl FillBgTilemapRect
	mov r0, #0xb
	str r0, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0x27
	mov r3, #2
	bl FillBgTilemapRect
	mov r0, #0xb
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0x28
	mov r3, #0x1e
	bl FillBgTilemapRect
	mov r0, #7
	str r0, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0x24
	mov r3, #2
	bl FillBgTilemapRect
	add r0, r5, #0
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [sp, #0x1c]
	ldr r0, [r0]
	bl ov12_0223A930
	ldr r2, _0226AC54 ; =ov12_0226E23C
	str r0, [sp, #0x20]
	ldrh r3, [r2, #0x2c]
	add r1, sp, #0x2c
	add r0, sp, #0x2c
	strh r3, [r1]
	ldrh r3, [r2, #0x2e]
	ldr r6, [sp, #0x1c]
	mov r7, #0
	strh r3, [r1, #2]
	ldrh r3, [r2, #0x30]
	mov r5, #0x40
	strh r3, [r1, #4]
	ldrh r3, [r2, #0x32]
	strh r3, [r1, #6]
	ldrh r3, [r2, #0x34]
	ldrh r2, [r2, #0x36]
	strh r3, [r1, #8]
	strh r2, [r1, #0xa]
	lsl r1, r4, #2
	add r4, r0, r1
	mov r1, #0x4d
	lsl r1, r1, #4
	add r0, r6, #0
	add r0, r0, r1
	str r0, [sp, #0x28]
_0226ABF4:
	ldr r0, _0226AC58 ; =0x000004E4
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0226AC04
	bl GF_AssertFail
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
_0226AC04:
	ldrh r1, [r4]
	ldr r0, [sp, #0x20]
	bl NewString_ReadMsgData
	str r0, [sp, #0x24]
	ldr r0, _0226AC5C ; =0x00010200
	add r1, r7, #1
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _0226AC60 ; =0x00004E37
	mov r2, #0x14
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mul r2, r1
	ldr r1, [sp, #0x28]
	str r5, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	add r1, r1, r2
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x24]
	mov r3, #0
	bl ov12_02268550
	ldr r0, [sp, #0x24]
	bl String_Delete
	add r7, r7, #1
	add r6, #0x14
	add r4, r4, #2
	add r5, #0x10
	cmp r7, #2
	blt _0226ABF4
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0226AC50: .word 0x0000068B
_0226AC54: .word ov12_0226E23C
_0226AC58: .word 0x000004E4
_0226AC5C: .word 0x00010200
_0226AC60: .word 0x00004E37
	thumb_func_end ov12_0226AA8C

	thumb_func_start ov12_0226AC64
ov12_0226AC64: ; 0x0226AC64
	ldr r1, _0226AC6C ; =0x000006E1
	ldrb r0, [r0, r1]
	bx lr
	nop
_0226AC6C: .word 0x000006E1
	thumb_func_end ov12_0226AC64

	thumb_func_start ov12_0226AC70
ov12_0226AC70: ; 0x0226AC70
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0226AC84
	bl GF_AssertFail
_0226AC84:
	ldr r0, [r5]
	bl ov12_0223A8E4
	add r4, r0, #0
	ldr r0, [r5]
	bl ov12_0223A8EC
	add r6, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_New
	add r7, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _0226AD44 ; =0x00004E48
	ldr r3, _0226AD48 ; =0x00000157
	str r0, [sp, #8]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	ldr r0, _0226AD4C ; =0x00004E36
	mov r3, #0x56
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	lsl r3, r3, #2
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _0226AD4C ; =0x00004E36
	ldr r3, _0226AD50 ; =0x00000159
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_0200D71C
	add r0, r7, #0
	bl NARC_Delete
	ldr r2, _0226AD54 ; =ov12_0226E54C
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0200D734
	ldr r1, _0226AD58 ; =0x000006F4
	mov r3, #0x11
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #0xd0
	mov r2, #0x10
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	ldr r0, _0226AD58 ; =0x000006F4
	ldr r0, [r5, r0]
	bl sub_0200DC18
	ldr r2, _0226AD5C ; =ov12_0226E518
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0200D734
	mov r1, #0x6f
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #1
	ldr r0, [r0]
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x6f
	lsl r0, r0, #4
	mov r3, #0x11
	ldr r0, [r5, r0]
	mov r1, #0x58
	mov r2, #8
	lsl r3, r3, #0x10
	bl sub_0200DDF4
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200DC18
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0226AD44: .word 0x00004E48
_0226AD48: .word 0x00000157
_0226AD4C: .word 0x00004E36
_0226AD50: .word 0x00000159
_0226AD54: .word ov12_0226E54C
_0226AD58: .word 0x000006F4
_0226AD5C: .word ov12_0226E518
	thumb_func_end ov12_0226AC70

	thumb_func_start ov12_0226AD60
ov12_0226AD60: ; 0x0226AD60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0226ADB4
	add r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0226ADB4
	ldr r0, [r5]
	bl ov12_0223A8EC
	add r4, r0, #0
	mov r0, #0x6f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200D9DC
	ldr r0, _0226ADB8 ; =0x000006F4
	ldr r0, [r5, r0]
	bl sub_0200D9DC
	mov r0, #0x6f
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	add r0, r0, #4
	str r1, [r5, r0]
	ldr r1, _0226ADBC ; =0x00004E48
	add r0, r4, #0
	bl sub_0200D958
	ldr r1, _0226ADC0 ; =0x00004E36
	add r0, r4, #0
	bl sub_0200D978
	ldr r1, _0226ADC0 ; =0x00004E36
	add r0, r4, #0
	bl sub_0200D988
_0226ADB4:
	pop {r3, r4, r5, pc}
	nop
_0226ADB8: .word 0x000006F4
_0226ADBC: .word 0x00004E48
_0226ADC0: .word 0x00004E36
	thumb_func_end ov12_0226AD60

	thumb_func_start ov12_0226ADC4
ov12_0226ADC4: ; 0x0226ADC4
	push {r3, lr}
	bl BattleSystem_GetBattleType
	mov r1, #0x80
	add r2, r0, #0
	tst r2, r1
	beq _0226ADDC
	lsl r1, r1, #6
	tst r0, r1
	bne _0226ADDC
	mov r0, #1
	pop {r3, pc}
_0226ADDC:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov12_0226ADC4

    .rodata
ov12_0226E1F8:
	.byte 0x04, 0x00, 0x00, 0x00

ov12_0226E1FC: ; 0x0226E1FC
	.byte 0x00, 0x01, 0x00, 0x00

ov12_0226E200: ; 0x0226E200
	.byte 0x00, 0x01, 0x06, 0x0C, 0x0D, 0x05, 0x00, 0x00

ov12_0226E208:
	.byte 0x01, 0x00, 0x00, 0x00

ov12_0226E20C: ; 0x0226E20C
	.byte 0x12, 0x17, 0x00, 0x1F

ov12_0226E210: ; 0x0226E210
	.byte 0x03, 0x01, 0x00, 0x02, 0x04, 0x04, 0x00, 0x00

ov12_0226E218: ; 0x0226E218
	.byte 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00, 0x00

ov12_0226E220: ; 0x0226E220
	.byte 0x00, 0x00, 0x00, 0x01, 0x03, 0x02, 0x00, 0x00

ov12_0226E228: ; 0x0226E228
	.byte 0x00, 0x00, 0xC0, 0x00, 0x80, 0x01

ov12_0226E22E:
	.byte 0x98, 0xC0
	.byte 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00

ov12_0226E238: ; 0x0226E238
	.byte 0x38, 0x02, 0x35, 0x02

ov12_0226E23C: ; 0x0226E23C
	.byte 0x32, 0x02, 0x3B, 0x02

ov12_0226E240:
	.byte 0x18, 0x90, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov12_0226E248: ; 0x0226E248
	.byte 0x0D, 0x14, 0x00, 0x1F

ov12_0226E24C: ; 0x0226E24C
	.byte 0x04, 0x0B, 0x00, 0x1F

ov12_0226E250:
	.byte 0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00

ov12_0226E258: ; 0x0226E258
	.byte 0x2F, 0x02, 0x2C, 0x02, 0x29, 0x02, 0x26, 0x02

ov12_0226E260: ; 0x0226E260
	.word ov12_0226A960
	.word ov12_0226A9B8
	.byte 0xED, 0x04, 0xEE, 0x04, 0xEF, 0x04, 0xF0, 0x04
	.byte 0xF1, 0x04, 0xF2, 0x04

ov12_0226E274:
	.byte 0x28, 0x80, 0x18, 0xE8, 0x98, 0xC0, 0x58, 0xA8, 0xFF, 0x00, 0x00, 0x00

ov12_0226E280: ; 0x0226E280
	.byte 0x00, 0x00, 0x05, 0x00, 0x0A, 0x00

ov12_0226E286: ; 0x0226E286
	.byte 0x00, 0x00, 0xC0, 0x00, 0x80, 0x01

ov12_0226E28C:
	.byte 0x28, 0x60, 0x08, 0xF8
	.byte 0x70, 0xA8, 0x08, 0xF8, 0xFF, 0x00, 0x00, 0x00

.public ov12_0226E298
ov12_0226E298: ; 0x0226E298
	.byte 0x2B, 0x00, 0x24, 0x00, 0x29, 0x00, 0x25, 0x00
	.byte 0x26, 0x00, 0x2A, 0x00, 0x27, 0x00, 0x00, 0x00

ov12_0226E2A8: ; 0x0226E2A8
	.byte 0x03, 0x09, 0x00, 0x0F, 0x03, 0x09, 0x10, 0x1F
	.byte 0x0B, 0x11, 0x00, 0x0F, 0x0B, 0x11, 0x10, 0x1F

ov12_0226E2B8: ; 0x0226E2B8
	.byte 0x20, 0x00, 0x3D, 0x00, 0xA0, 0x00, 0x3C, 0x00
	.byte 0x20, 0x00, 0x7C, 0x00, 0xA0, 0x00, 0x7B, 0x00

ov12_0226E2C8: ; 0x0226E2C8
	.byte 0x3B, 0x00, 0x3D, 0x00, 0xBB, 0x00, 0x3C, 0x00
	.byte 0x3B, 0x00, 0x7C, 0x00, 0xBB, 0x00, 0x7B, 0x00

ov12_0226E2D8: ; 0x0226E2D8
	.byte 0x80, 0x00, 0x4C, 0x00, 0x28, 0x00, 0xA4, 0x00
	.byte 0xD8, 0x00, 0xA4, 0x00, 0x80, 0x00, 0xA8, 0x00

ov12_0226E2E8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

ov12_0226E2F8: ; 0x0226E2F8
	.byte 0x0B, 0x11, 0x00, 0x0E, 0x01, 0x09, 0x11, 0x1F
	.byte 0x0B, 0x11, 0x11, 0x1F, 0x01, 0x09, 0x00, 0x0E

ov12_0226E308: ; 0x0226E308
	.byte 0x4C, 0x00, 0x3D, 0x00, 0xCC, 0x00, 0x3C, 0x00
	.byte 0x4C, 0x00, 0x7C, 0x00, 0xCC, 0x00, 0x7B, 0x00

ov12_0226E318: ; 0x0226E318
	.byte 0x04, 0x0F, 0x02, 0x1D, 0x11, 0x17, 0x00, 0x09
	.byte 0x11, 0x17, 0x16, 0x1F, 0x12, 0x17, 0x0B, 0x14

ov12_0226E328: ; 0x0226E328
	.byte 0x3C, 0x00, 0x74, 0x00, 0xC4, 0x00, 0x38, 0x00
	.byte 0xC4, 0x00, 0x74, 0x00, 0x3C, 0x00, 0x38, 0x00

ov12_0226E338:
	.byte 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov12_0226E348: ; 0x0226E348
	.byte 0x0A, 0x11, 0x00, 0x0E, 0x00, 0x09, 0x11, 0x1F
	.byte 0x0A, 0x11, 0x11, 0x1F, 0x00, 0x09, 0x00, 0x0E

ov12_0226E358: ; 0x0226E358
	.byte 0x12, 0x17, 0x01, 0x1E

ov12_0226E35C:
	.byte 0x18, 0x90, 0x00, 0xFF
	.byte 0x90, 0xC0, 0x00, 0x50, 0x90, 0xC0, 0xB0, 0xFF, 0x98, 0xC0, 0x58, 0xA8, 0xFF, 0x00, 0x00, 0x00

ov12_0226E370: ; 0x0226E370
	.byte 0x3C, 0x00, 0x74, 0x00, 0xC4, 0x00, 0x20, 0x00, 0xC4, 0x00, 0x74, 0x00

ov12_0226E37C: ; 0x0226E37C
	.byte 0x3C, 0x00, 0x20, 0x00
	.byte 0x80, 0x00, 0xAF, 0x00

ov12_0226E384:
	.byte 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

ov12_0226E398: ; 0x0226E398
	.byte 0x02, 0x09, 0x00, 0x0F, 0x02, 0x09, 0x10, 0x1F
	.byte 0x0A, 0x11, 0x00, 0x0F, 0x0A, 0x11, 0x10, 0x1F

ov12_0226E3A8: ; 0x0226E3A8
	.byte 0x12, 0x17, 0x01, 0x1E

ov12_0226E3AC:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00

ov12_0226E3C0:
	.byte 0x98, 0xC0, 0x08, 0xF8, 0x18, 0x50, 0x00, 0x80, 0x18, 0x50, 0x80, 0xFF, 0x58, 0x90, 0x00, 0x80
	.byte 0x58, 0x90, 0x80, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov12_0226E3D8: ; 0x0226E3D8
	.byte 0x00, 0x00, 0xC0, 0x00, 0x80, 0x01, 0x00, 0x00
	.byte 0xC0, 0x00, 0x80, 0x01, 0x00, 0x00, 0xC0, 0x00, 0x80, 0x01, 0x00, 0x00, 0xC0, 0x00, 0x80, 0x01

ov12_0226E3F0:
	.byte 0x58, 0x90, 0x00, 0x78, 0x08, 0x50, 0x88, 0xFF, 0x58, 0x90, 0x88, 0xFF, 0x08, 0x50, 0x00, 0x78
	.byte 0x98, 0xC0, 0x08, 0xF8, 0xFF, 0x00, 0x00, 0x00

ov12_0226E408: ; 0x0226E408
	.byte 0x00, 0x00, 0xC0, 0x00, 0x80, 0x01, 0x00, 0x00
	.byte 0xC0, 0x00, 0x80, 0x01, 0x00, 0x00, 0xC0, 0x00, 0x80, 0x01, 0x00, 0x00, 0xC0, 0x00, 0x80, 0x01

ov12_0226E420: ; 0x0226E420
	.byte 0x00, 0x00, 0xC0, 0x00, 0x80, 0x01, 0x00, 0x00

ov12_0226E428: ; 0x0226E428
	.byte 0x00, 0x00, 0xC0, 0x00, 0x80, 0x01, 0x00, 0x00
	.byte 0xC0, 0x00, 0x80, 0x01, 0x00, 0x00, 0xC0, 0x00, 0x80, 0x01, 0x00, 0x00, 0xC0, 0x00, 0x80, 0x01

ov12_0226E440: ; 0x0226E440
	.byte 0x00, 0x00, 0xC0, 0x00, 0x80, 0x01, 0x00, 0x00

ov12_0226E448: ; 0x0226E448
	.byte 0x0C, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x37, 0x4E, 0x00, 0x00
	.byte 0x37, 0x4E, 0x00, 0x00, 0x2F, 0x4E, 0x00, 0x00, 0x2F, 0x4E, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov12_0226E47C: ; 0x0226E47C
	.byte 0xF6, 0x00, 0x09, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x38, 0x4E, 0x00, 0x00, 0x37, 0x4E, 0x00, 0x00, 0x30, 0x4E, 0x00, 0x00, 0x30, 0x4E, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov12_0226E4B0: ; 0x0226E4B0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x39, 0x4E, 0x00, 0x00, 0x34, 0x4E, 0x00, 0x00, 0x31, 0x4E, 0x00, 0x00
	.byte 0x31, 0x4E, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov12_0226E4E4: ; 0x0226E4E4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x45, 0x4E, 0x00, 0x00, 0x36, 0x4E, 0x00, 0x00
	.byte 0x35, 0x4E, 0x00, 0x00, 0x35, 0x4E, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov12_0226E518: ; 0x0226E518
	.byte 0x58, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x48, 0x4E, 0x00, 0x00
	.byte 0x37, 0x4E, 0x00, 0x00, 0x36, 0x4E, 0x00, 0x00, 0x36, 0x4E, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov12_0226E54C: ; 0x0226E54C
	.byte 0xD0, 0x00, 0x08, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x48, 0x4E, 0x00, 0x00, 0x37, 0x4E, 0x00, 0x00, 0x36, 0x4E, 0x00, 0x00, 0x36, 0x4E, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

.public ov12_0226E580
ov12_0226E580: ; 0x0226E580
	.byte 0xF7, 0x00, 0x0F, 0x01, 0xF8, 0x00, 0x10, 0x01, 0xF9, 0x00, 0x11, 0x01, 0xFA, 0x00, 0x12, 0x01
	.byte 0xFB, 0x00, 0x13, 0x01, 0xFC, 0x00, 0x14, 0x01, 0xFD, 0x00, 0x15, 0x01, 0xFE, 0x00, 0x16, 0x01
	.byte 0xFF, 0x00, 0x17, 0x01, 0x00, 0x01, 0x18, 0x01, 0x01, 0x01, 0x19, 0x01, 0x02, 0x01, 0x1A, 0x01
	.byte 0x03, 0x01, 0x1B, 0x01, 0x04, 0x01, 0x1C, 0x01, 0x05, 0x01, 0x1D, 0x01, 0x06, 0x01, 0x1E, 0x01
	.byte 0x07, 0x01, 0x1F, 0x01, 0x20, 0x01, 0x21, 0x01, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF

.public ov12_0226E5DC
ov12_0226E5DC: ; 0x0226E5DC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0C, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov12_0226E64C: ; 0x0226E64C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov12_0226E70C: ; 0x0226E70C
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0xF6, 0x00
	.byte 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E35C
	.word ov12_0226E2E8
	.word ov12_0226EB04
	.word ov12_02269A9C
	.word ov12_02269C7C
	.word ov12_02266F70
	.word ov12_02267E14
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E35C
	.word ov12_0226E2E8
	.word ov12_0226EB04
	.word ov12_02269A9C
	.word ov12_02269C7C
	.word ov12_02266F70
	.word ov12_02267E14
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E35C
	.word ov12_0226E2E8
	.word ov12_0226EB04
	.word ov12_02269A9C
	.word ov12_02269C7C
	.word ov12_02266F84
	.word ov12_02267E14
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E35C
	.word ov12_0226E2E8
	.word ov12_0226EB04
	.word ov12_02269A9C
	.word ov12_02269C7C
	.word ov12_02266F84
	.word ov12_02267E14
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E240
	.word ov12_0226E2E8
	.word ov12_0226EB04
	.word ov12_02269A9C
	.word ov12_02269C7C
	.word ov12_02267388
	.word ov12_02267E14
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E240
	.word ov12_0226E2E8
	.word ov12_0226EB04
	.word ov12_02269A9C
	.word ov12_02269C7C
	.word ov12_0226739C
	.word ov12_02267E14
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x01, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E35C
	.word ov12_0226E2E8
	.word ov12_0226EB04
	.word ov12_02269A9C
	.word ov12_02269C7C
	.word ov12_02266F70
	.word ov12_02267E14
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x01, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E35C
	.word ov12_0226E2E8
	.word ov12_0226EB04
	.word ov12_02269A9C
	.word ov12_02269C7C
	.word ov12_02266F84
	.word ov12_02267E14
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x01, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E274
	.word ov12_0226E338
	.word ov12_0226EB00
	.word ov12_02269CDC
	.word 0x00000000
	.word ov12_02267404
	.word ov12_02267E14
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x01, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E274
	.word ov12_0226E338
	.word ov12_0226EB00
	.word ov12_02269CDC
	.word 0x00000000
	.word ov12_02267418
	.word ov12_02267E14
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x03, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E3C0
	.word ov12_0226E384
	.word ov12_0226EB08
	.word ov12_02269DD4
	.word ov12_02269F54
	.word ov12_0226748C
	.word ov12_02267EF0
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x04, 0x00, 0x05, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E3F0
	.word ov12_0226E3AC
	.word ov12_0226EB10
	.word ov12_02269FA4
	.word ov12_0226A594
	.word ov12_02267C24
	.word ov12_02268024
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x06, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E28C
	.word ov12_0226E250
	.word ov12_0226EAFC
	.word ov12_0226A5F0
	.word 0x00000000
	.word ov12_02267760
	.word ov12_02267FA0
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x06, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E28C
	.word ov12_0226E250
	.word ov12_0226EAFC
	.word ov12_0226A5F0
	.word 0x00000000
	.word ov12_022677FC
	.word ov12_02267FA0
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x06, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E28C
	.word ov12_0226E250
	.word ov12_0226EAFC
	.word ov12_0226A5F0
	.word 0x00000000
	.word ov12_0226789C
	.word ov12_02267FA0
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x06, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E28C
	.word ov12_0226E250
	.word ov12_0226EAFC
	.word ov12_0226A5F0
	.word 0x00000000
	.word ov12_02267A58
	.word ov12_02267FA0
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x06, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E28C
	.word ov12_0226E250
	.word ov12_0226EAFC
	.word ov12_0226A5F0
	.word 0x00000000
	.word ov12_02267B40
	.word ov12_02267FA0
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x06, 0x00, 0x04, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E22E
	.word ov12_0226E208
	.word ov12_0226E1F8
	.word 0x00000000
	.word 0x00000000
	.word ov12_02267984
	.word ov12_02268130
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E35C
	.word ov12_0226E2E8
	.word ov12_0226EB04
	.word ov12_02269A9C
	.word ov12_02269C7C
	.word ov12_02266F70
	.word ov12_02267E14
	.byte 0x1C, 0x00, 0xF6, 0x00
	.byte 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00
	.word ov12_0226E35C
	.word ov12_0226E2E8
	.word ov12_0226EB04
	.word ov12_02269A9C
	.word ov12_02269C7C
	.word ov12_02266F84
	.word ov12_02267E14

ov12_0226EAFC:
	.byte 0x01, 0x04, 0x00, 0x00

ov12_0226EB00:
	.byte 0x01, 0x04, 0x00, 0x00

ov12_0226EB04:
	.byte 0x01, 0x02, 0x03, 0x04

ov12_0226EB08:
	.byte 0x04, 0x08, 0x09, 0x0A, 0x0B, 0x00, 0x00, 0x00

ov12_0226EB10:
	.byte 0x06, 0x0C, 0x0D, 0x05, 0x04, 0x00, 0x00, 0x00
