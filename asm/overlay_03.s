	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov03_02253E20
ov03_02253E20: ; 0x02253E20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02253ECC ; =ov03_022598A0
	add r4, r1, #0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	bne _02253E42
	ldr r0, _02253ECC ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_020200A0
_02253E42:
	cmp r4, #0
	beq _02253E64
	ldr r0, _02253ECC ; =ov03_022598A0
	add r1, r5, #0
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #0x10]
	bl ReadMsgDataIntoString
	ldr r0, _02253ECC ; =ov03_022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x58]
	ldr r1, [r2, #0x14]
	ldr r2, [r2, #0x10]
	bl StringExpandPlaceholders
	b _02253E72
_02253E64:
	ldr r0, _02253ECC ; =ov03_022598A0
	add r1, r5, #0
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #0x14]
	bl ReadMsgDataIntoString
_02253E72:
	ldr r0, _02253ECC ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x40
	bl WindowIsInUse
	cmp r0, #0
	bne _02253E90
	ldr r0, _02253ECC ; =ov03_022598A0
	mov r2, #3
	ldr r1, [r0]
	ldr r0, [r1, #0x68]
	add r1, #0x40
	ldr r0, [r0, #8]
	bl sub_0205B514
_02253E90:
	ldr r0, _02253ECC ; =ov03_022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x68]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r1, r0, #0
	ldr r0, _02253ECC ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x40
	bl sub_0205B564
	ldr r0, _02253ECC ; =ov03_022598A0
	ldr r4, [r0]
	ldr r0, [r4, #0x68]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r2, r0, #0
	add r0, r4, #0
	ldr r1, [r4, #0x14]
	add r0, #0x40
	mov r3, #1
	bl sub_0205B5B4
	ldr r1, _02253ECC ; =ov03_022598A0
	ldr r1, [r1]
	add r1, #0x94
	strb r0, [r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02253ECC: .word ov03_022598A0
	thumb_func_end ov03_02253E20

	thumb_func_start ov03_02253ED0
ov03_02253ED0: ; 0x02253ED0
	push {r0, r1, r2, r3}
	push {r3, r4, lr}
	sub sp, #0x34
	ldr r0, _02253F6C ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x20
	bl WindowIsInUse
	cmp r0, #0
	bne _02253F14
	ldr r0, _02253F6C ; =ov03_022598A0
	add r3, sp, #0x60
	ldr r1, [r0]
	add r0, sp, #0x64
	ldrb r0, [r0]
	ldrb r3, [r3]
	mov r2, #3
	str r0, [sp]
	add r0, sp, #0x68
	ldrb r0, [r0]
	str r0, [sp, #4]
	add r0, sp, #0x6c
	ldrb r0, [r0]
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	add r0, sp, #0x40
	ldrh r0, [r0, #0x30]
	str r0, [sp, #0x10]
	ldr r0, [r1, #0x68]
	add r1, #0x20
	ldr r0, [r0, #8]
	bl AddWindowParameterized
_02253F14:
	ldr r0, _02253F6C ; =ov03_022598A0
	ldr r2, _02253F70 ; =0x000003D9
	ldr r0, [r0]
	mov r1, #1
	add r0, #0x20
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add r4, sp, #0x40
	add r3, sp, #0x14
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, _02253F6C ; =ov03_022598A0
	mov r3, #4
	ldr r1, [r0]
	ldr r0, [r1, #0x64]
	add r1, #0x20
	str r1, [sp, #0x20]
	str r0, [sp, #0x14]
	mov r1, #0
	add r0, r2, #0
	add r2, r1, #0
	bl ListMenuInit
	ldr r1, _02253F6C ; =ov03_022598A0
	ldr r2, [r1]
	str r0, [r2, #0x5c]
	ldr r0, [r1]
	add r0, #0x20
	bl CopyWindowToVram
	add sp, #0x34
	pop {r3, r4}
	pop {r3}
	add sp, #0x10
	bx r3
	nop
_02253F6C: .word ov03_022598A0
_02253F70: .word 0x000003D9
	thumb_func_end ov03_02253ED0

	thumb_func_start ov03_02253F74
ov03_02253F74: ; 0x02253F74
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, _02254050 ; =ov03_022598A0
	ldr r0, [r0]
	cmp r0, #0
	beq _02253F84
	bl GF_AssertFail
_02253F84:
	mov r0, #4
	mov r1, #0xac
	bl AllocFromHeap
	ldr r1, _02254050 ; =ov03_022598A0
	mov r2, #0xac
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _02254050 ; =ov03_022598A0
	mov r2, #0
	ldr r1, [r0]
	mov r3, #4
	add r1, #0x88
	str r2, [r1]
	ldr r1, [r0]
	str r4, [r1, #0x68]
	ldr r0, [r0]
	mov r1, #0x1b
	add r0, #0x97
	strb r2, [r0]
	mov r0, #1
	mov r2, #0xb6
	bl NewMsgDataFromNarc
	ldr r1, _02254050 ; =ov03_022598A0
	ldr r2, [r1]
	str r0, [r2, #0x74]
	ldr r0, [r1]
	ldr r0, [r0, #0x68]
	bl Fsys_GetSaveDataPtr
	bl Sav2_PlayerData_GetProfileAddr
	ldr r1, _02254050 ; =ov03_022598A0
	ldr r1, [r1]
	str r0, [r1, #0x78]
	mov r0, #4
	bl PlayerProfile_new
	ldr r1, _02254050 ; =ov03_022598A0
	ldr r2, [r1]
	str r0, [r2, #0x7c]
	ldr r0, [r1]
	add r0, #0x20
	bl InitWindow
	ldr r0, _02254050 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x30
	bl InitWindow
	ldr r0, _02254050 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x40
	bl InitWindow
	mov r0, #4
	bl ScrStrBufs_new
	ldr r1, _02254050 ; =ov03_022598A0
	ldr r1, [r1]
	str r0, [r1, #0x50]
	mov r0, #4
	bl ScrStrBufs_new
	ldr r1, _02254050 ; =ov03_022598A0
	ldr r1, [r1]
	str r0, [r1, #0x54]
	mov r0, #4
	bl ScrStrBufs_new
	ldr r1, _02254050 ; =ov03_022598A0
	ldr r2, [r1]
	str r0, [r2, #0x58]
	ldr r0, [r1]
	mov r2, #0
	add r0, #0x98
	strb r2, [r0]
	add r5, r2, #0
_02254026:
	ldr r0, [r1]
	add r0, r0, r2
	add r0, #0x80
	add r2, r2, #1
	strb r5, [r0]
	cmp r2, #8
	blt _02254026
	ldr r6, _02254050 ; =ov03_022598A0
	add r4, r5, #0
	mov r7, #0x8c
_0225403A:
	add r0, r7, #0
	mov r1, #4
	bl String_ctor
	ldr r1, [r6]
	add r5, r5, #1
	str r0, [r1, r4]
	add r4, r4, #4
	cmp r5, #8
	blt _0225403A
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02254050: .word ov03_022598A0
	thumb_func_end ov03_02253F74

	thumb_func_start ov03_02254054
ov03_02254054: ; 0x02254054
	push {r4, r5, r6, lr}
	mov r4, #0
	ldr r6, _022540E4 ; =ov03_022598A0
	add r5, r4, #0
_0225405C:
	ldr r0, [r6]
	ldr r0, [r0, r5]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _0225405C
	ldr r0, _022540E4 ; =ov03_022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x7c]
	bl FreeToHeap
	ldr r0, _022540E4 ; =ov03_022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x50]
	cmp r0, #0
	beq _0225408C
	bl ScrStrBufs_delete
	ldr r0, _022540E4 ; =ov03_022598A0
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x50]
_0225408C:
	ldr r0, _022540E4 ; =ov03_022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x54]
	cmp r0, #0
	beq _022540A2
	bl ScrStrBufs_delete
	ldr r0, _022540E4 ; =ov03_022598A0
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x54]
_022540A2:
	ldr r0, _022540E4 ; =ov03_022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x58]
	cmp r0, #0
	beq _022540B8
	bl ScrStrBufs_delete
	ldr r0, _022540E4 ; =ov03_022598A0
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x58]
_022540B8:
	ldr r0, _022540E4 ; =ov03_022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x74]
	bl DestroyMsgData
	ldr r0, _022540E4 ; =ov03_022598A0
	ldr r0, [r0]
	ldr r1, [r0, #0x4c]
	cmp r1, #0
	beq _022540D2
	add r0, #0x40
	bl RemoveWindow
_022540D2:
	ldr r0, _022540E4 ; =ov03_022598A0
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _022540E4 ; =ov03_022598A0
	mov r1, #0
	str r1, [r0]
	pop {r4, r5, r6, pc}
	nop
_022540E4: .word ov03_022598A0
	thumb_func_end ov03_02254054

	thumb_func_start ov03_022540E8
ov03_022540E8: ; 0x022540E8
	push {r4, lr}
	add r4, r0, #0
	bl ov03_02255B98
	add r2, r0, #0
	ldr r0, [r4, #0x68]
	add r4, #0x91
	ldrb r1, [r4]
	bl sub_02058124
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov03_022540E8

	thumb_func_start ov03_02254100
ov03_02254100: ; 0x02254100
	push {r3, lr}
	ldr r0, _02254118 ; =ov03_022598A0
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x98
	strb r1, [r0]
	cmp r2, #0
	bne _02254116
	ldr r0, _0225411C ; =0x000005DC
	bl PlaySE
_02254116:
	pop {r3, pc}
	.balign 4, 0
_02254118: .word ov03_022598A0
_0225411C: .word 0x000005DC
	thumb_func_end ov03_02254100

	thumb_func_start ov03_02254120
ov03_02254120: ; 0x02254120
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #3
	add r5, r0, #0
	mov r4, #0
	bl ListMenuGetTemplateField
	cmp r0, #0
	bls _0225414E
	add r6, r4, #0
	mov r7, #3
_02254134:
	lsl r2, r4, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl ov03_02254150
	add r0, r5, #0
	add r1, r7, #0
	add r4, r4, #1
	bl ListMenuGetTemplateField
	cmp r4, r0
	blo _02254134
_0225414E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov03_02254120

	thumb_func_start ov03_02254150
ov03_02254150: ; 0x02254150
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r2, #0
	bl sub_0203511C
	add r4, r0, #0
	mov r2, #0
	add r0, sp, #0xc
	strh r2, [r0]
	ldr r0, _022542C4 ; =ov03_022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x5c]
	cmp r0, #0
	beq _02254172
	add r1, sp, #0xc
	bl ListMenuGetScrollAndRow
_02254172:
	add r0, sp, #0xc
	ldrh r1, [r0]
	add r1, r1, r5
	strh r1, [r0]
	ldr r0, _022542C4 ; =ov03_022598A0
	lsl r5, r5, #4
	ldr r0, [r0]
	add r0, #0x20
	bl GetWindowWidth
	lsl r0, r0, #3
	sub r0, #8
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, _022542C4 ; =ov03_022598A0
	lsl r3, r5, #0x10
	ldr r0, [r0]
	mov r1, #0xf
	add r0, #0x20
	mov r2, #8
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	add r0, sp, #0xc
	ldrh r2, [r0]
	cmp r2, r4
	bge _02254274
	ldr r1, _022542C4 ; =ov03_022598A0
	add r0, r2, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x7c]
	bl sub_020351DC
	mov r3, #2
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _022542C4 ; =ov03_022598A0
	add r2, sp, #0xc
	ldr r0, [r0]
	ldrh r2, [r2]
	ldr r0, [r0, #0x50]
	mov r1, #0
	add r2, r2, #1
	bl BufferIntegerAsString
	ldr r0, _022542C4 ; =ov03_022598A0
	mov r1, #1
	ldr r2, [r0]
	ldr r0, [r2, #0x50]
	ldr r2, [r2, #0x7c]
	bl BufferPlayersName
	ldr r0, _022542C4 ; =ov03_022598A0
	mov r1, #0x4c
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #4]
	bl ReadMsgDataIntoString
	ldr r0, _022542C4 ; =ov03_022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x50]
	ldmia r2!, {r1, r2}
	bl StringExpandPlaceholders
	ldr r0, _022542C4 ; =ov03_022598A0
	mov r1, #0
	ldr r2, [r0]
	mov r0, #0xff
	str r5, [sp]
	str r0, [sp, #4]
	add r0, r2, #0
	str r1, [sp, #8]
	ldr r2, [r2]
	add r0, #0x20
	mov r3, #8
	bl AddTextPrinterParameterized
	ldr r0, _022542C4 ; =ov03_022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x7c]
	bl PlayerProfile_GetTrainerID
	add r2, r0, #0
	mov r1, #2
	lsl r2, r2, #0x10
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _022542C4 ; =ov03_022598A0
	lsr r2, r2, #0x10
	ldr r0, [r0]
	mov r3, #5
	ldr r0, [r0, #0x50]
	bl BufferIntegerAsString
	ldr r0, _022542C4 ; =ov03_022598A0
	mov r1, #0x4e
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #0xc]
	bl ReadMsgDataIntoString
	ldr r0, _022542C4 ; =ov03_022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x50]
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	bl StringExpandPlaceholders
	ldr r0, _022542C4 ; =ov03_022598A0
	mov r1, #0
	ldr r2, [r0]
	mov r0, #0xff
	str r5, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	add r0, r2, #0
	ldr r2, [r2, #8]
	add r0, #0x20
	mov r3, #0x58
	bl AddTextPrinterParameterized
	add sp, #0x10
	pop {r3, r4, r5, pc}
_02254274:
	mov r3, #2
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _022542C4 ; =ov03_022598A0
	mov r1, #0
	ldr r0, [r0]
	add r2, r2, #1
	ldr r0, [r0, #0x50]
	bl BufferIntegerAsString
	ldr r0, _022542C4 ; =ov03_022598A0
	mov r1, #0x4d
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #4]
	bl ReadMsgDataIntoString
	ldr r0, _022542C4 ; =ov03_022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x50]
	ldmia r2!, {r1, r2}
	bl StringExpandPlaceholders
	ldr r0, _022542C4 ; =ov03_022598A0
	mov r1, #0
	ldr r2, [r0]
	mov r0, #0xff
	str r5, [sp]
	str r0, [sp, #4]
	add r0, r2, #0
	str r1, [sp, #8]
	ldr r2, [r2]
	add r0, #0x20
	mov r3, #8
	bl AddTextPrinterParameterized
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_022542C4: .word ov03_022598A0
	thumb_func_end ov03_02254150

	thumb_func_start ov03_022542C8
ov03_022542C8: ; 0x022542C8
	push {r4, lr}
	sub sp, #0x68
	add r4, r0, #0
	ldr r0, _02254398 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x30
	bl WindowIsInUse
	cmp r0, #0
	bne _02254302
	ldr r0, _02254398 ; =ov03_022598A0
	mov r2, #3
	ldr r1, [r0]
	mov r0, #2
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0xc9
	str r0, [sp, #0x10]
	ldr r0, [r1, #0x68]
	add r1, #0x30
	ldr r0, [r0, #8]
	mov r3, #0x17
	bl AddWindowParameterized
_02254302:
	ldr r0, _02254398 ; =ov03_022598A0
	ldr r2, _0225439C ; =0x000003D9
	ldr r0, [r0]
	mov r1, #1
	add r0, #0x30
	mov r3, #0xb
	bl DrawFrameAndWindow1
	ldr r0, _02254398 ; =ov03_022598A0
	mov r1, #0xf
	ldr r0, [r0]
	add r0, #0x30
	bl FillWindowPixelBuffer
	ldr r0, _02254398 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x30
	bl CopyWindowToVram
	add r0, r4, #0
	mov r1, #1
	add r0, #0x97
	strb r1, [r0]
	ldr r0, _022543A0 ; =ov03_02254D64
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	ldr r0, _02254398 ; =ov03_022598A0
	ldr r0, [r0]
	bl ov03_022543AC
	ldr r3, _022543A4 ; =ov03_0225927A
	add r2, sp, #0x14
	mov r1, #0x29
_02254348:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _02254348
	ldr r0, _02254398 ; =ov03_022598A0
	ldr r1, [r0]
	add r0, r1, #0
	add r0, #0x91
	ldrb r0, [r0]
	cmp r0, #8
	bne _02254370
	add r1, #0x92
	ldrb r0, [r1]
	mov r1, #0
	add r0, #0x7a
	bl ov03_02253E20
	b _0225438E
_02254370:
	cmp r0, #0x28
	bne _02254382
	add r1, #0x92
	ldrb r0, [r1]
	mov r1, #0
	add r0, #0x94
	bl ov03_02253E20
	b _0225438E
_02254382:
	lsl r1, r0, #1
	add r0, sp, #0x14
	ldrh r0, [r0, r1]
	mov r1, #0
	bl ov03_02253E20
_0225438E:
	ldr r0, _022543A8 ; =ov03_02254420
	bl ov03_02254B4C
	add sp, #0x68
	pop {r4, pc}
	.balign 4, 0
_02254398: .word ov03_022598A0
_0225439C: .word 0x000003D9
_022543A0: .word ov03_02254D64
_022543A4: .word ov03_0225927A
_022543A8: .word ov03_02254420
	thumb_func_end ov03_022542C8

	thumb_func_start ov03_022543AC
ov03_022543AC: ; 0x022543AC
	push {lr}
	sub sp, #0xc
	ldr r0, _0225441C ; =ov03_022598A0
	mov r1, #0
	ldr r2, [r0]
	ldr r0, [r2, #0x54]
	ldr r2, [r2, #0x78]
	bl BufferPlayersName
	ldr r0, _0225441C ; =ov03_022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x78]
	bl PlayerProfile_GetTrainerID
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r1, #1
	lsl r2, r2, #0x10
	ldr r0, _0225441C ; =ov03_022598A0
	str r1, [sp, #4]
	ldr r0, [r0]
	lsr r2, r2, #0x10
	ldr r0, [r0, #0x54]
	mov r3, #5
	bl BufferIntegerAsString
	ldr r0, _0225441C ; =ov03_022598A0
	mov r1, #0x4b
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #0x18]
	bl ReadMsgDataIntoString
	ldr r0, _0225441C ; =ov03_022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x54]
	ldr r1, [r2, #0x1c]
	ldr r2, [r2, #0x18]
	bl StringExpandPlaceholders
	ldr r0, _0225441C ; =ov03_022598A0
	mov r3, #2
	ldr r2, [r0]
	mov r1, #0
	str r3, [sp]
	str r1, [sp, #4]
	add r0, r2, #0
	str r1, [sp, #8]
	ldr r2, [r2, #0x1c]
	add r0, #0x30
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {pc}
	nop
_0225441C: .word ov03_022598A0
	thumb_func_end ov03_022543AC

	thumb_func_start ov03_02254420
ov03_02254420: ; 0x02254420
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r0, _022544EC ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _022544E6
	mov r0, #0x10
	mov r1, #4
	bl ListMenuItems_ctor
	ldr r4, _022544EC ; =ov03_022598A0
	mov r5, #0
	ldr r1, [r4]
	mov r6, #2
	str r0, [r1, #0x64]
	mov r7, #1
_02254448:
	str r6, [sp]
	str r7, [sp, #4]
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0, #0x50]
	add r2, r5, #1
	add r3, r6, #0
	bl BufferIntegerAsString
	ldr r2, [r4]
	mov r1, #0x4d
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #4]
	bl ReadMsgDataIntoString
	ldr r2, [r4]
	ldr r0, [r2, #0x50]
	ldmia r2!, {r1, r2}
	bl StringExpandPlaceholders
	ldr r1, [r4]
	mov r2, #0
	ldr r0, [r1, #0x64]
	ldr r1, [r1]
	bl ListMenuItems_AddItem
	add r5, r5, #1
	cmp r5, #0x10
	blt _02254448
	mov r1, #1
	str r1, [sp, #0x10]
	mov r0, #2
	str r0, [sp, #0x14]
	mov r0, #0x14
	str r0, [sp, #0x18]
	mov r0, #0xa
	mov r4, sp
	str r0, [sp, #0x1c]
	sub r4, #0x10
	ldr r3, _022544F0 ; =ov03_02259164
	str r1, [sp, #0x20]
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1, r2, r3}
	bl ov03_02253ED0
	ldr r0, _022544EC ; =ov03_022598A0
	ldr r2, _022544F4 ; =ov03_02259134
	ldr r1, [r0]
	add r1, #0x9c
	str r2, [r1]
	ldr r1, [r0]
	mov r2, #2
	add r1, #0xa0
	strb r2, [r1]
	ldr r1, [r0]
	ldr r2, _022544F8 ; =0x0000FFFF
	add r1, #0xa2
	strh r2, [r1]
	ldr r1, [r0]
	mov r2, #0
	add r1, #0xa1
	strb r2, [r1]
	ldr r2, [r0]
	mov r1, #7
	ldr r0, [r2, #0x68]
	add r2, #0x9c
	bl ov01_021F6A9C
	ldr r0, _022544FC ; =ov03_02254500
	bl ov03_02254B4C
_022544E6:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_022544EC: .word ov03_022598A0
_022544F0: .word ov03_02259164
_022544F4: .word ov03_02259134
_022544F8: .word 0x0000FFFF
_022544FC: .word ov03_02254500
	thumb_func_end ov03_02254420

	thumb_func_start ov03_02254500
ov03_02254500: ; 0x02254500
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov03_022543AC
	ldr r0, [r4, #0x68]
	bl ov01_021F6B10
	cmp r0, #1
	bne _022545F2
	bl sub_02037700
	cmp r0, #0
	beq _02254536
	ldr r0, _022545F4 ; =ov03_022598A0
	mov r1, #3
	ldr r0, [r0]
	add r0, #0x88
	str r1, [r0]
	bl ov03_02254B44
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_0225574C
	pop {r3, r4, r5, pc}
_02254536:
	bl sub_02035184
	cmp r0, #0
	bne _02254574
	ldr r0, _022545F4 ; =ov03_022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x5c]
	bl ListMenu_ProcessInput
	mov r2, #0
	mvn r2, r2
	cmp r0, r2
	bne _02254578
	add r1, r4, #0
	add r1, #0xa2
	ldrh r1, [r1]
	cmp r1, #0
	bne _0225456C
	ldr r0, _022545F4 ; =ov03_022598A0
	add r1, sp, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x5c]
	bl ListMenuGetCurrentItemArrayId
	add r0, sp, #0
	ldrh r0, [r0]
	b _02254578
_0225456C:
	cmp r1, #1
	bne _02254578
	sub r0, r2, #1
	b _02254578
_02254574:
	mov r0, #0
	mvn r0, r0
_02254578:
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _0225458E
	add r1, r1, #1
	cmp r0, r1
	bne _022545AC
	add r0, r4, #0
	bl ov03_02254600
	pop {r3, r4, r5, pc}
_0225458E:
	ldr r0, _022545F8 ; =0x000005DC
	bl PlaySE
	ldr r0, _022545F4 ; =ov03_022598A0
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x88
	str r1, [r0]
	bl ov03_02254B44
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_0225574C
	pop {r3, r4, r5, pc}
_022545AC:
	ldr r0, _022545F8 ; =0x000005DC
	bl PlaySE
	add r1, r4, #0
	ldr r0, [r4, #0x5c]
	add r1, #0x8e
	bl ListMenuGetCurrentItemArrayId
	bl sub_0203511C
	add r1, r4, #0
	add r1, #0x8e
	ldrh r1, [r1]
	cmp r0, r1
	ble _022545F2
	add r0, r4, #0
	bl ov03_02254600
	add r0, r4, #0
	add r0, #0x8e
	ldrh r0, [r0]
	bl sub_02035150
	add r1, r4, #0
	add r1, #0x8e
	add r4, #0x8e
	strh r0, [r1]
	ldrh r0, [r4]
	bl sub_02058164
	bl sub_02037BC8
	ldr r0, _022545FC ; =ov03_02254660
	bl ov03_02254B4C
_022545F2:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022545F4: .word ov03_022598A0
_022545F8: .word 0x000005DC
_022545FC: .word ov03_02254660
	thumb_func_end ov03_02254500

	thumb_func_start ov03_02254600
ov03_02254600: ; 0x02254600
	push {r3, lr}
	sub sp, #8
	bl sub_02035184
	cmp r0, #0
	bne _02254618
	ldr r0, _0225465C ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x98
	ldrb r0, [r0]
	cmp r0, #0
	beq _02254656
_02254618:
	ldr r0, _0225465C ; =ov03_022598A0
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x98
	strb r1, [r0]
	bl sub_02035198
	mov r0, #0xc
	str r0, [sp]
	mov r0, #0x50
	str r0, [sp, #4]
	ldr r0, _0225465C ; =ov03_022598A0
	mov r1, #0xf
	ldr r0, [r0]
	mov r2, #8
	add r0, #0x20
	mov r3, #0
	bl FillWindowPixelRect
	ldr r0, _0225465C ; =ov03_022598A0
	mov r1, #0
	ldr r0, [r0]
	add r2, r1, #0
	ldr r0, [r0, #0x5c]
	bl ov03_02254120
	ldr r0, _0225465C ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x20
	bl CopyWindowToVram
_02254656:
	add sp, #8
	pop {r3, pc}
	nop
_0225465C: .word ov03_022598A0
	thumb_func_end ov03_02254600

	thumb_func_start ov03_02254660
ov03_02254660: ; 0x02254660
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02037700
	cmp r0, #0
	beq _02254690
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_0225574C
	mov r0, #0
	add r1, r0, #0
	bl ov03_02253E20
	add r0, r4, #0
	bl ov03_02255ADC
	ldr r0, _022546AC ; =ov03_022598A0
	mov r1, #1
	ldr r0, [r0]
	add r0, #0xa1
	strb r1, [r0]
	pop {r3, r4, r5, pc}
_02254690:
	bl sub_0203769C
	bl sub_02034818
	cmp r0, #0
	beq _022546A8
	bl sub_02037BC8
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_022546B0
_022546A8:
	pop {r3, r4, r5, pc}
	nop
_022546AC: .word ov03_022598A0
	thumb_func_end ov03_02254660

	thumb_func_start ov03_022546B0
ov03_022546B0: ; 0x022546B0
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02037700
	cmp r0, #0
	beq _022546E4
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_0225574C
	mov r0, #0
	add r1, r0, #0
	bl ov03_02253E20
	add r0, r4, #0
	bl ov03_02255ADC
	ldr r0, _022547D0 ; =ov03_022598A0
	mov r1, #1
	ldr r0, [r0]
	add sp, #0xc
	add r0, #0xa1
	strb r1, [r0]
	pop {r4, r5, pc}
_022546E4:
	ldr r1, _022547D0 ; =ov03_022598A0
	add r0, r4, #0
	add r0, #0x8e
	ldr r1, [r1]
	ldrh r0, [r0]
	ldr r1, [r1, #0x7c]
	bl sub_020351DC
	ldr r2, _022547D0 ; =ov03_022598A0
	ldr r0, [r4, #0x58]
	ldr r2, [r2]
	mov r1, #1
	ldr r2, [r2, #0x7c]
	bl BufferPlayersName
	bl ov03_02255B70
	cmp r0, #2
	bgt _02254714
	mov r0, #1
	add r1, r0, #0
	bl ov03_02253E20
	b _022547B4
_02254714:
	ldr r0, _022547D0 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	bne _02254730
	ldr r0, _022547D0 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_020200A0
_02254730:
	ldr r0, _022547D0 ; =ov03_022598A0
	mov r1, #2
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #0x10]
	bl ReadMsgDataIntoString
	ldr r0, _022547D0 ; =ov03_022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x58]
	ldr r1, [r2, #0x14]
	ldr r2, [r2, #0x10]
	bl StringExpandPlaceholders
	ldr r0, _022547D0 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x40
	bl WindowIsInUse
	cmp r0, #0
	bne _0225476A
	ldr r0, _022547D0 ; =ov03_022598A0
	mov r2, #3
	ldr r1, [r0]
	ldr r0, [r1, #0x68]
	add r1, #0x40
	ldr r0, [r0, #8]
	bl sub_0205B514
_0225476A:
	ldr r0, _022547D0 ; =ov03_022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x68]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r1, r0, #0
	ldr r0, _022547D0 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x40
	bl sub_0205B564
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B8C
	ldr r0, _022547D0 ; =ov03_022598A0
	mov r3, #0
	ldr r2, [r0]
	mov r1, #1
	str r3, [sp]
	str r1, [sp, #4]
	add r0, r2, #0
	str r3, [sp, #8]
	ldr r2, [r2, #0x14]
	add r0, #0x40
	bl AddTextPrinterParameterized
	ldr r1, _022547D0 ; =ov03_022598A0
	ldr r1, [r1]
	add r1, #0x94
	strb r0, [r1]
_022547B4:
	ldr r0, _022547D0 ; =ov03_022598A0
	mov r2, #0
	ldr r1, [r0]
	add r1, #0xa8
	str r2, [r1]
	ldr r0, [r0]
	mov r1, #1
	add r0, #0xa1
	strb r1, [r0]
	ldr r0, _022547D4 ; =ov03_022548E0
	bl ov03_02254B4C
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_022547D0: .word ov03_022598A0
_022547D4: .word ov03_022548E0
	thumb_func_end ov03_022546B0

	thumb_func_start ov03_022547D8
ov03_022547D8: ; 0x022547D8
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r4, r1, #0
	bl sub_02037700
	cmp r0, #0
	beq _022547FE
	add r0, r6, #0
	add r1, r4, #0
	bl ov03_0225574C
	mov r0, #0
	add r1, r0, #0
	bl ov03_02253E20
	add r0, r4, #0
	bl ov03_02255ADC
	b _022548D2
_022547FE:
	mov r0, #0
	mov r1, #3
	bl sub_02037BA0
	add r5, r0, #0
	bl sub_0203769C
	cmp r5, r0
	bne _02254824
	bl sub_02037BC8
	add r0, r6, #0
	add r1, r4, #0
	bl ov03_0225574C
	add r0, r4, #0
	bl ov03_02255A70
	b _022548D2
_02254824:
	mov r0, #0
	mov r1, #5
	bl sub_02037BA0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02254848
	bl sub_02037BC8
	add r0, r6, #0
	add r1, r4, #0
	bl ov03_0225574C
	add r0, r4, #0
	bl ov03_02255A70
	b _022548D2
_02254848:
	mov r0, #0
	mov r1, #4
	bl sub_02037BA0
	add r5, r0, #0
	bl sub_0203769C
	cmp r5, r0
	bne _0225486A
	mov r0, #0x74
	mov r1, #0
	bl ov03_02253E20
	ldr r0, _022548D8 ; =ov03_02255280
	bl ov03_02254B4C
	b _022548D2
_0225486A:
	mov r0, #0
	mov r1, #2
	bl sub_02037BA0
	add r5, r0, #0
	bl sub_0203769C
	cmp r5, r0
	bne _022548B6
	bl sub_02037BC8
	bl sub_020347A0
	add r1, r4, #0
	add r1, #0x90
	strb r0, [r1]
	ldr r0, _022548DC ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	bne _022548A6
	ldr r0, _022548DC ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_020200A0
_022548A6:
	add r0, r6, #0
	add r1, r4, #0
	bl ov03_0225574C
	add r0, r4, #0
	bl ov03_02255804
	b _022548D2
_022548B6:
	bl ov03_02255C80
	cmp r0, #0
	beq _022548CE
	add r0, r6, #0
	add r1, r4, #0
	bl ov03_0225574C
	add r0, r4, #0
	bl ov03_02255A70
	b _022548D2
_022548CE:
	mov r0, #0
	pop {r4, r5, r6, pc}
_022548D2:
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_022548D8: .word ov03_02255280
_022548DC: .word ov03_022598A0
	thumb_func_end ov03_022547D8

	thumb_func_start ov03_022548E0
ov03_022548E0: ; 0x022548E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02254984 ; =ov03_022598A0
	add r4, r1, #0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _02254980
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _02254936
	ldr r0, _02254984 ; =ov03_022598A0
	ldr r2, _02254988 ; =_0225912C
	ldr r1, [r0]
	add r1, #0x9c
	str r2, [r1]
	ldr r1, [r0]
	mov r2, #1
	add r1, #0xa0
	strb r2, [r1]
	ldr r1, [r0]
	ldr r2, _0225498C ; =0x0000FFFF
	add r1, #0xa2
	strh r2, [r1]
	ldr r1, [r0]
	mov r2, #0
	add r1, #0xa1
	strb r2, [r1]
	ldr r2, [r0]
	mov r1, #7
	ldr r0, [r2, #0x68]
	add r2, #0x9c
	bl ov01_021F6A9C
	mov r0, #1
	add r4, #0xa8
	str r0, [r4]
	pop {r3, r4, r5, pc}
_02254936:
	ldr r0, [r4, #0x68]
	bl ov01_021F6B10
	cmp r0, #1
	bne _02254980
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_022547D8
	cmp r0, #0
	beq _02254954
	mov r0, #2
	add r4, #0xa1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02254954:
	ldr r0, _02254990 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	bne _02254968
	add r0, r4, #0
	add r0, #0xa2
	ldrh r0, [r0]
	cmp r0, #0
	bne _02254980
_02254968:
	ldr r0, _02254994 ; =0x000005DC
	bl PlaySE
	mov r1, #0
	add r4, #0xa8
	mov r0, #3
	str r1, [r4]
	bl ov03_02253E20
	ldr r0, _02254998 ; =ov03_0225499C
	bl ov03_02254B4C
_02254980:
	pop {r3, r4, r5, pc}
	nop
_02254984: .word ov03_022598A0
_02254988: .word _0225912C
_0225498C: .word 0x0000FFFF
_02254990: .word gSystem
_02254994: .word 0x000005DC
_02254998: .word ov03_0225499C
	thumb_func_end ov03_022548E0

	thumb_func_start ov03_0225499C
ov03_0225499C: ; 0x0225499C
	push {r4, lr}
	add r4, r1, #0
	bl ov03_022547D8
	cmp r0, #0
	beq _022549B0
	mov r0, #2
	add r4, #0xa1
	strb r0, [r4]
	pop {r4, pc}
_022549B0:
	ldr r0, _022549D0 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _022549CC
	add r0, r4, #0
	bl ov03_02255C84
	ldr r0, _022549D4 ; =ov03_022549D8
	bl ov03_02254B4C
_022549CC:
	pop {r4, pc}
	nop
_022549D0: .word ov03_022598A0
_022549D4: .word ov03_022549D8
	thumb_func_end ov03_0225499C

	thumb_func_start ov03_022549D8
ov03_022549D8: ; 0x022549D8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _022549FA
	add r0, r4, #0
	bl ov03_02255CA0
	cmp r0, #1
	bne _02254A4E
	add r0, r4, #0
	mov r1, #1
	add r0, #0xa8
	str r1, [r0]
_022549FA:
	add r0, r4, #0
	bl ov03_02255CD0
	cmp r0, #0
	beq _02254A4E
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_022547D8
	cmp r0, #0
	beq _02254A18
	add r0, r4, #0
	bl ov03_02255CE4
	pop {r3, r4, r5, pc}
_02254A18:
	ldr r0, [r4, #0x68]
	bl ov01_021F6AEC
	cmp r0, #6
	bne _02254A4E
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	cmp r0, #0
	bne _02254A44
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_0225574C
	mov r0, #6
	mov r1, #0
	bl ov03_02253E20
	add r0, r4, #0
	bl ov03_02255ADC
	pop {r3, r4, r5, pc}
_02254A44:
	cmp r0, #1
	bne _02254A4E
	ldr r0, _02254A50 ; =ov03_022546B0
	bl ov03_02254B4C
_02254A4E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02254A50: .word ov03_022546B0
	thumb_func_end ov03_022549D8

	thumb_func_start ov03_02254A54
ov03_02254A54: ; 0x02254A54
	push {r4, lr}
	sub sp, #0x10
	add r4, r2, #0
	mov r2, #0
	add r0, sp, #0xc
	strh r2, [r0]
	ldr r0, _02254B28 ; =ov03_022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x5c]
	cmp r0, #0
	beq _02254A70
	add r1, sp, #0xc
	bl ListMenuGetScrollAndRow
_02254A70:
	add r0, sp, #0xc
	ldrh r1, [r0]
	add r1, r1, r4
	strh r1, [r0]
	ldrh r0, [r0]
	bl sub_02034818
	cmp r0, #0
	beq _02254B22
	add r0, sp, #0xc
	ldrh r0, [r0]
	bl sub_02034818
	add r2, r0, #0
	ldr r0, _02254B28 ; =ov03_022598A0
	mov r1, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x50]
	bl BufferPlayersName
	ldr r0, _02254B28 ; =ov03_022598A0
	mov r1, #0x4f
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #4]
	bl ReadMsgDataIntoString
	ldr r0, _02254B28 ; =ov03_022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x50]
	ldmia r2!, {r1, r2}
	bl StringExpandPlaceholders
	ldr r0, _02254B28 ; =ov03_022598A0
	lsl r4, r4, #4
	ldr r2, [r0]
	mov r1, #0
	str r4, [sp]
	str r1, [sp, #4]
	add r0, r2, #0
	str r1, [sp, #8]
	ldr r2, [r2]
	add r0, #0x20
	mov r3, #8
	bl AddTextPrinterParameterized
	add r0, sp, #0xc
	ldrh r0, [r0]
	bl sub_02034818
	bl PlayerProfile_GetTrainerID_VisibleHalf
	mov r1, #2
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _02254B28 ; =ov03_022598A0
	mov r3, #5
	ldr r0, [r0]
	ldr r0, [r0, #0x50]
	bl BufferIntegerAsString
	ldr r0, _02254B28 ; =ov03_022598A0
	mov r1, #0x4e
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #0xc]
	bl ReadMsgDataIntoString
	ldr r0, _02254B28 ; =ov03_022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x50]
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	bl StringExpandPlaceholders
	ldr r0, _02254B28 ; =ov03_022598A0
	mov r1, #0
	ldr r2, [r0]
	mov r3, #0x48
	str r4, [sp]
	str r1, [sp, #4]
	add r0, r2, #0
	str r1, [sp, #8]
	ldr r2, [r2, #8]
	add r0, #0x20
	bl AddTextPrinterParameterized
_02254B22:
	add sp, #0x10
	pop {r4, pc}
	nop
_02254B28: .word ov03_022598A0
	thumb_func_end ov03_02254A54

	thumb_func_start ov03_02254B2C
ov03_02254B2C: ; 0x02254B2C
	push {r4, lr}
	add r4, r0, #0
	bl ov03_02255B98
	add r2, r0, #0
	ldr r0, [r4, #0x68]
	add r4, #0x91
	ldrb r1, [r4]
	bl sub_020580E4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov03_02254B2C

	thumb_func_start ov03_02254B44
ov03_02254B44: ; 0x02254B44
	ldr r3, _02254B48 ; =sub_02058284
	bx r3
	.balign 4, 0
_02254B48: .word sub_02058284
	thumb_func_end ov03_02254B44

	thumb_func_start ov03_02254B4C
ov03_02254B4C: ; 0x02254B4C
	ldr r1, _02254B54 ; =ov03_022598A0
	ldr r1, [r1]
	str r0, [r1, #0x6c]
	bx lr
	.balign 4, 0
_02254B54: .word ov03_022598A0
	thumb_func_end ov03_02254B4C

	thumb_func_start ov03_02254B58
ov03_02254B58: ; 0x02254B58
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, _02254BDC ; =ov03_02254D64
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	bl ov03_02254BEC
	ldr r0, _02254BE0 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x30
	bl WindowIsInUse
	cmp r0, #0
	bne _02254BA0
	ldr r0, _02254BE0 ; =ov03_022598A0
	mov r2, #3
	ldr r1, [r0]
	mov r0, #2
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0xcd
	str r0, [sp, #0x10]
	ldr r0, [r1, #0x68]
	add r1, #0x30
	ldr r0, [r0, #8]
	mov r3, #0x16
	bl AddWindowParameterized
_02254BA0:
	ldr r0, _02254BE0 ; =ov03_022598A0
	ldr r2, _02254BE4 ; =0x000003D9
	ldr r0, [r0]
	mov r1, #1
	add r0, #0x30
	mov r3, #0xb
	bl DrawFrameAndWindow1
	ldr r0, _02254BE0 ; =ov03_022598A0
	mov r1, #0xf
	ldr r0, [r0]
	add r0, #0x30
	bl FillWindowPixelBuffer
	ldr r0, _02254BE0 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x30
	bl CopyWindowToVram
	mov r0, #1
	add r4, #0x97
	strb r0, [r4]
	mov r0, #0
	bl sub_0203476C
	ldr r0, _02254BE8 ; =ov03_02254D78
	bl ov03_02254B4C
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_02254BDC: .word ov03_02254D64
_02254BE0: .word ov03_022598A0
_02254BE4: .word 0x000003D9
_02254BE8: .word ov03_02254D78
	thumb_func_end ov03_02254B58

	thumb_func_start ov03_02254BEC
ov03_02254BEC: ; 0x02254BEC
	push {lr}
	sub sp, #0x54
	ldr r3, _02254C94 ; =ov03_0225931E
	add r2, sp, #0
	mov r1, #0x29
_02254BF6:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _02254BF6
	ldr r0, _02254C98 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x91
	ldrb r0, [r0]
	cmp r0, #0x29
	blo _02254C12
	bl GF_AssertFail
_02254C12:
	ldr r0, _02254C98 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x91
	ldrb r0, [r0]
	cmp r0, #8
	bne _02254C4E
	bl sub_020347A0
	cmp r0, #1
	ble _02254C3A
	ldr r0, _02254C98 ; =ov03_022598A0
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x92
	ldrb r0, [r0]
	add r0, #0x7f
	bl ov03_02253E20
	add sp, #0x54
	pop {pc}
_02254C3A:
	ldr r0, _02254C98 ; =ov03_022598A0
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x92
	ldrb r0, [r0]
	add r0, #0x75
	bl ov03_02253E20
	add sp, #0x54
	pop {pc}
_02254C4E:
	cmp r0, #0x28
	bne _02254C82
	bl sub_020347A0
	cmp r0, #1
	ble _02254C6E
	ldr r0, _02254C98 ; =ov03_022598A0
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x92
	ldrb r0, [r0]
	add r0, #0x9a
	bl ov03_02253E20
	add sp, #0x54
	pop {pc}
_02254C6E:
	ldr r0, _02254C98 ; =ov03_022598A0
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x92
	ldrb r0, [r0]
	add r0, #0x8e
	bl ov03_02253E20
	add sp, #0x54
	pop {pc}
_02254C82:
	lsl r1, r0, #1
	add r0, sp, #0
	ldrh r0, [r0, r1]
	mov r1, #0
	bl ov03_02253E20
	add sp, #0x54
	pop {pc}
	nop
_02254C94: .word ov03_0225931E
_02254C98: .word ov03_022598A0
	thumb_func_end ov03_02254BEC

	thumb_func_start ov03_02254C9C
ov03_02254C9C: ; 0x02254C9C
	push {r3, r4, lr}
	sub sp, #0xc
	bl sub_020347A0
	add r4, r0, #0
	bl ov03_02255B70
	cmp r4, r0
	blt _02254CB8
	bl sub_020347A0
	add r2, r0, #0
	mov r4, #0x51
	b _02254CC6
_02254CB8:
	bl ov03_02255B70
	add r4, r0, #0
	bl sub_020347A0
	sub r2, r4, r0
	mov r4, #0x50
_02254CC6:
	mov r0, #5
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _02254D20 ; =ov03_022598A0
	mov r1, #0
	ldr r0, [r0]
	mov r3, #2
	ldr r0, [r0, #0x54]
	bl BufferIntegerAsString
	ldr r0, _02254D20 ; =ov03_022598A0
	mov r1, #0xf
	ldr r0, [r0]
	add r0, #0x30
	bl FillWindowPixelBuffer
	ldr r0, _02254D20 ; =ov03_022598A0
	add r1, r4, #0
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #0x1c]
	bl ReadMsgDataIntoString
	ldr r0, _02254D20 ; =ov03_022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x54]
	ldr r1, [r2, #0x18]
	ldr r2, [r2, #0x1c]
	bl StringExpandPlaceholders
	ldr r0, _02254D20 ; =ov03_022598A0
	mov r3, #2
	ldr r2, [r0]
	mov r1, #0
	str r3, [sp]
	str r1, [sp, #4]
	add r0, r2, #0
	str r1, [sp, #8]
	ldr r2, [r2, #0x18]
	add r0, #0x30
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02254D20: .word ov03_022598A0
	thumb_func_end ov03_02254C9C

	thumb_func_start ov03_02254D24
ov03_02254D24: ; 0x02254D24
	push {r4, r5, lr}
	sub sp, #0x54
	ldr r5, _02254D60 ; =ov03_02259370
	add r4, r1, #0
	add r3, sp, #0
	mov r2, #0x29
_02254D30:
	ldrh r1, [r5]
	add r5, r5, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _02254D30
	bl sub_02034818
	add r2, r0, #0
	beq _02254D4C
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl BufferPlayersName
_02254D4C:
	add r4, #0x91
	ldrb r0, [r4]
	lsl r1, r0, #1
	add r0, sp, #0
	ldrh r0, [r0, r1]
	mov r1, #1
	bl ov03_02253E20
	add sp, #0x54
	pop {r4, r5, pc}
	.balign 4, 0
_02254D60: .word ov03_02259370
	thumb_func_end ov03_02254D24

	thumb_func_start ov03_02254D64
ov03_02254D64: ; 0x02254D64
	push {r3, lr}
	ldr r2, _02254D74 ; =ov03_022598A0
	ldr r2, [r2]
	ldr r2, [r2, #0x6c]
	cmp r2, #0
	beq _02254D72
	blx r2
_02254D72:
	pop {r3, pc}
	.balign 4, 0
_02254D74: .word ov03_022598A0
	thumb_func_end ov03_02254D64

	thumb_func_start ov03_02254D78
ov03_02254D78: ; 0x02254D78
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r0, r1, #0
	bl ov03_02254C9C
	ldr r0, _02254E58 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _02254E52
	mov r0, #5
	mov r1, #4
	bl ListMenuItems_ctor
	ldr r4, _02254E58 ; =ov03_022598A0
	mov r5, #0
	ldr r1, [r4]
	mov r6, #0x52
	str r0, [r1, #0x64]
	add r7, r5, #0
_02254DA6:
	ldr r1, [r4]
	add r2, r6, #0
	ldr r0, [r1, #0x64]
	ldr r1, [r1, #0x74]
	add r3, r7, #0
	bl ListMenuItems_AppendFromMsgData
	add r5, r5, #1
	cmp r5, #5
	blt _02254DA6
	ldr r1, _02254E58 ; =ov03_022598A0
	mov r2, #1
	ldr r0, [r1]
	mov r3, #0
	add r0, #0x98
	strb r2, [r0]
	add r2, r3, #0
_02254DC8:
	ldr r0, [r1]
	add r0, r0, r3
	add r0, #0x80
	add r3, r3, #1
	strb r2, [r0]
	cmp r3, #8
	blt _02254DC8
	mov r1, #1
	str r1, [sp, #0x10]
	mov r0, #2
	str r0, [sp, #0x14]
	mov r0, #0x11
	str r0, [sp, #0x18]
	mov r0, #0xc
	mov r4, sp
	str r0, [sp, #0x1c]
	sub r4, #0x10
	ldr r3, _02254E5C ; =ov03_02259144
	str r1, [sp, #0x20]
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1, r2, r3}
	bl ov03_02253ED0
	ldr r0, _02254E60 ; =ov03_02254E70
	bl ov03_02254B4C
	bl ov03_02255B84
	cmp r0, #2
	ble _02254E22
	ldr r0, _02254E58 ; =ov03_022598A0
	ldr r2, _02254E64 ; =ov03_0225913C
	ldr r1, [r0]
	add r1, #0x9c
	str r2, [r1]
	mov r1, #2
	b _02254E2E
_02254E22:
	ldr r0, _02254E58 ; =ov03_022598A0
	ldr r2, _02254E68 ; =ov03_02259130
	ldr r1, [r0]
	add r1, #0x9c
	str r2, [r1]
	mov r1, #1
_02254E2E:
	ldr r0, [r0]
	ldr r2, _02254E6C ; =0x0000FFFF
	add r0, #0xa0
	strb r1, [r0]
	ldr r0, _02254E58 ; =ov03_022598A0
	ldr r1, [r0]
	add r1, #0xa2
	strh r2, [r1]
	ldr r1, [r0]
	mov r2, #0
	add r1, #0xa1
	strb r2, [r1]
	ldr r2, [r0]
	mov r1, #7
	ldr r0, [r2, #0x68]
	add r2, #0x9c
	bl ov01_021F6A9C
_02254E52:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02254E58: .word ov03_022598A0
_02254E5C: .word ov03_02259144
_02254E60: .word ov03_02254E70
_02254E64: .word ov03_0225913C
_02254E68: .word ov03_02259130
_02254E6C: .word 0x0000FFFF
	thumb_func_end ov03_02254D78

	thumb_func_start ov03_02254E70
ov03_02254E70: ; 0x02254E70
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	str r0, [sp]
	ldr r0, [r1, #0x68]
	str r1, [sp, #4]
	bl ov01_021F6B10
	cmp r0, #1
	beq _02254E84
	b _02255058
_02254E84:
	ldr r0, [sp, #4]
	bl ov03_02254C9C
	mov r7, #1
	ldr r4, _0225505C ; =ov03_022598A0
	mov r5, #0
	add r6, r7, #0
_02254E92:
	add r0, r5, #0
	bl sub_02034714
	cmp r0, #0
	beq _02254EB0
	cmp r5, #0
	beq _02254EB0
	ldr r0, [r4]
	add r0, r0, r5
	add r0, #0x80
	strb r6, [r0]
	ldr r0, [r4]
	add r0, #0x98
	strb r6, [r0]
	b _02254EFA
_02254EB0:
	add r0, r5, #0
	bl sub_02034818
	cmp r0, #0
	beq _02254ED4
	ldr r1, [r4]
	add r0, r1, r5
	add r0, #0x80
	ldrb r0, [r0]
	cmp r0, #0
	bne _02254ED4
	add r0, r1, r5
	add r0, #0x80
	strb r7, [r0]
	ldr r0, [r4]
	add r0, #0x98
	strb r7, [r0]
	b _02254EFA
_02254ED4:
	add r0, r5, #0
	bl sub_02034818
	cmp r0, #0
	bne _02254EFA
	ldr r1, [r4]
	add r0, r1, r5
	add r0, #0x80
	ldrb r0, [r0]
	cmp r0, #0
	beq _02254EFA
	add r1, r1, r5
	add r1, #0x80
	mov r0, #0
	strb r0, [r1]
	ldr r1, [r4]
	mov r0, #1
	add r1, #0x98
	strb r0, [r1]
_02254EFA:
	add r5, r5, #1
	cmp r5, #8
	blt _02254E92
	ldr r1, _0225505C ; =ov03_022598A0
	ldr r2, [r1]
	add r0, r2, #0
	add r0, #0x98
	ldrb r0, [r0]
	cmp r0, #0
	beq _02254F52
	mov r0, #0
	add r2, #0x98
	strb r0, [r2]
	ldr r0, [r1]
	ldr r0, [r0, #0x5c]
	bl RedrawListMenu
	ldr r0, _0225505C ; =ov03_022598A0
	mov r1, #3
	ldr r0, [r0]
	mov r5, #0
	ldr r0, [r0, #0x5c]
	bl ListMenuGetTemplateField
	cmp r0, #0
	bls _02254F52
	ldr r4, _0225505C ; =ov03_022598A0
	add r6, r5, #0
	mov r7, #3
_02254F34:
	ldr r0, [r4]
	lsl r2, r5, #0x18
	ldr r0, [r0, #0x5c]
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl ov03_02254A54
	ldr r0, [r4]
	add r1, r7, #0
	ldr r0, [r0, #0x5c]
	add r5, r5, #1
	bl ListMenuGetTemplateField
	cmp r5, r0
	blo _02254F34
_02254F52:
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x5c]
	bl ListMenu_ProcessInput
	add r4, r0, #0
	bl sub_02034780
	cmp r0, #0xff
	beq _02254F92
	bl sub_02034780
	ldr r1, [sp, #4]
	add r1, #0x95
	strb r0, [r1]
	ldr r0, _02255060 ; =0x0000060C
	bl PlaySE
	ldr r0, [sp, #4]
	mov r1, #1
	add r0, #0xa1
	strb r1, [r0]
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	add r0, #0x95
	ldrb r0, [r0]
	bl ov03_02254D24
	ldr r0, _02255064 ; =ov03_02255714
	bl ov03_02254B4C
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
_02254F92:
	bl sub_02037700
	cmp r0, #0
	beq _02254FB4
	bl ov03_02254B44
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ov03_0225574C
	ldr r0, _0225505C ; =ov03_022598A0
	mov r1, #3
	ldr r0, [r0]
	add sp, #0x5c
	add r0, #0x88
	str r1, [r0]
	pop {r4, r5, r6, r7, pc}
_02254FB4:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _02254FEE
	bl ov03_02255B84
	cmp r0, #2
	ble _02254FDE
	ldr r0, _0225505C ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0xa2
	ldrh r0, [r0]
	cmp r0, #0
	bne _02254FD4
	mov r4, #0
	b _02254FEE
_02254FD4:
	cmp r0, #1
	bne _02254FEE
	mov r4, #1
	mvn r4, r4
	b _02254FEE
_02254FDE:
	ldr r0, _0225505C ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0xa2
	ldrh r0, [r0]
	cmp r0, #0
	bne _02254FEE
	mov r4, #1
	mvn r4, r4
_02254FEE:
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _02254FFE
	add r0, r0, #1
	cmp r4, r0
	beq _02255058
	b _0225500E
_02254FFE:
	ldr r0, _02255068 ; =0x000005DC
	bl PlaySE
	ldr r0, _0225506C ; =ov03_0225558C
	bl ov03_02254B4C
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
_0225500E:
	bl ov03_02255B70
	add r4, r0, #0
	bl sub_020347A0
	cmp r4, r0
	bgt _02255058
	ldr r3, _02255070 ; =ov03_02259184
	add r2, sp, #8
	mov r1, #0x29
_02255022:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _02255022
	ldr r0, _02255068 ; =0x000005DC
	bl PlaySE
	bl sub_020347A0
	ldr r1, [sp, #4]
	add r1, #0x90
	strb r0, [r1]
	ldr r0, [sp, #4]
	add r0, #0x91
	str r0, [sp, #4]
	ldrb r0, [r0]
	lsl r1, r0, #1
	add r0, sp, #8
	ldrh r0, [r0, r1]
	mov r1, #0
	bl ov03_02253E20
	ldr r0, _02255074 ; =ov03_022553C8
	bl ov03_02254B4C
_02255058:
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225505C: .word ov03_022598A0
_02255060: .word 0x0000060C
_02255064: .word ov03_02255714
_02255068: .word 0x000005DC
_0225506C: .word ov03_0225558C
_02255070: .word ov03_02259184
_02255074: .word ov03_022553C8
	thumb_func_end ov03_02254E70

	thumb_func_start ov03_02255078
ov03_02255078: ; 0x02255078
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	bl ov03_02254C9C
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _022550A0
	add r0, r5, #0
	bl ov03_02255CA0
	cmp r0, #1
	bne _022550AA
	add r0, r5, #0
	mov r1, #1
	add r0, #0xa8
	str r1, [r0]
_022550A0:
	add r0, r5, #0
	bl ov03_02255CD0
	cmp r0, #0
	bne _022550AC
_022550AA:
	b _0225526E
_022550AC:
	add r0, r5, #0
	add r0, #0x95
	ldrb r0, [r0]
	bl sub_020373B4
	cmp r0, #0
	bne _02255128
	add r0, r5, #0
	bl ov03_02255CE4
	add r0, r5, #0
	add r0, #0x91
	ldrb r0, [r0]
	cmp r0, #8
	beq _022550CE
	cmp r0, #0x28
	bne _02255110
_022550CE:
	mov r5, #1
	bl ov03_02255B84
	cmp r0, #1
	ble _02255100
	mov r4, #5
_022550DA:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _022550F6
	add r0, r5, #0
	bl sub_020346E8
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl sub_02037B8C
_022550F6:
	add r5, r5, #1
	bl ov03_02255B84
	cmp r5, r0
	blt _022550DA
_02255100:
	mov r0, #0
	add r1, r0, #0
	bl ov03_02253E20
	ldr r0, _02255270 ; =ov03_022552C8
	bl ov03_02254B4C
	pop {r4, r5, r6, pc}
_02255110:
	add r5, #0x95
	ldrb r0, [r5]
	bl sub_020346E8
	mov r0, #0
	add r1, r0, #0
	bl ov03_02253E20
	ldr r0, _02255270 ; =ov03_022552C8
	bl ov03_02254B4C
	pop {r4, r5, r6, pc}
_02255128:
	bl sub_02037700
	cmp r0, #0
	bne _02255138
	bl ov03_02255C80
	cmp r0, #0
	beq _02255156
_02255138:
	add r0, r5, #0
	bl ov03_02255CE4
	add r5, #0x95
	ldrb r0, [r5]
	bl sub_020346E8
	mov r0, #0
	add r1, r0, #0
	bl ov03_02253E20
	ldr r0, _02255270 ; =ov03_022552C8
	bl ov03_02254B4C
	pop {r4, r5, r6, pc}
_02255156:
	ldr r0, [r5, #0x68]
	bl ov01_021F6AEC
	cmp r0, #6
	beq _02255162
	b _0225526E
_02255162:
	add r0, r5, #0
	add r0, #0xa4
	ldr r0, [r0]
	cmp r0, #0
	bne _02255200
	add r0, r5, #0
	add r0, #0x91
	ldrb r0, [r0]
	cmp r0, #1
	beq _02255184
	cmp r0, #2
	beq _02255184
	add r0, #0xdb
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _022551A6
_02255184:
	bl sub_020348F0
	cmp r0, #0
	bne _022551A6
	mov r0, #0x74
	mov r1, #0
	bl ov03_02253E20
	ldr r0, _02255274 ; =ov03_02255280
	bl ov03_02254B4C
	add r5, #0x95
	ldrb r1, [r5]
	mov r0, #4
	bl sub_02037B8C
	pop {r4, r5, r6, pc}
_022551A6:
	add r0, r5, #0
	add r0, #0x95
	ldrb r0, [r0]
	bl sub_0203476C
	add r1, r5, #0
	add r1, #0x95
	ldrb r1, [r1]
	mov r0, #2
	bl sub_02037B8C
	bl ov03_02255B84
	add r4, r0, #0
	bl sub_020347A0
	cmp r4, r0
	bne _022551F4
	bl sub_020347A0
	add r1, r5, #0
	add r1, #0x90
	strb r0, [r1]
	bl ov03_02255B84
	cmp r0, #2
	ble _022551E4
	ldr r0, _02255278 ; =ov03_02255388
	bl ov03_02254B4C
	pop {r4, r5, r6, pc}
_022551E4:
	add r0, r6, #0
	add r1, r5, #0
	bl ov03_0225574C
	add r0, r5, #0
	bl ov03_022557CC
	pop {r4, r5, r6, pc}
_022551F4:
	bl ov03_02254BEC
	ldr r0, _0225527C ; =ov03_0225530C
	bl ov03_02254B4C
	pop {r4, r5, r6, pc}
_02255200:
	cmp r0, #1
	bne _0225526E
	add r0, r5, #0
	add r0, #0x91
	ldrb r0, [r0]
	cmp r0, #8
	beq _02255212
	cmp r0, #0x28
	bne _02255250
_02255212:
	mov r5, #1
	bl ov03_02255B84
	cmp r0, #1
	ble _02255244
	mov r4, #5
_0225521E:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	beq _0225523A
	add r0, r5, #0
	bl sub_020346E8
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl sub_02037B8C
_0225523A:
	add r5, r5, #1
	bl ov03_02255B84
	cmp r5, r0
	blt _0225521E
_02255244:
	bl ov03_02254BEC
	ldr r0, _0225527C ; =ov03_0225530C
	bl ov03_02254B4C
	pop {r4, r5, r6, pc}
_02255250:
	add r0, r5, #0
	add r0, #0x95
	ldrb r0, [r0]
	bl sub_020346E8
	add r5, #0x95
	ldrb r1, [r5]
	mov r0, #3
	bl sub_02037B8C
	bl ov03_02254BEC
	ldr r0, _0225527C ; =ov03_0225530C
	bl ov03_02254B4C
_0225526E:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02255270: .word ov03_022552C8
_02255274: .word ov03_02255280
_02255278: .word ov03_02255388
_0225527C: .word ov03_0225530C
	thumb_func_end ov03_02255078

	thumb_func_start ov03_02255280
ov03_02255280: ; 0x02255280
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _022552C0 ; =ov03_022598A0
	add r4, r1, #0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _022552BE
	ldr r0, _022552C4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _022552A8
	bl System_GetTouchNew
	cmp r0, #1
	bne _022552BE
_022552A8:
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_0225574C
	bl ov03_02254B44
	ldr r0, _022552C0 ; =ov03_022598A0
	mov r1, #4
	ldr r0, [r0]
	add r0, #0x88
	str r1, [r0]
_022552BE:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022552C0: .word ov03_022598A0
_022552C4: .word gSystem
	thumb_func_end ov03_02255280

	thumb_func_start ov03_022552C8
ov03_022552C8: ; 0x022552C8
	push {r3, lr}
	add r0, r1, #0
	bl ov03_02254C9C
	ldr r0, _02255300 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _022552FC
	ldr r0, _02255304 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _022552F2
	bl System_GetTouchNew
	cmp r0, #1
	bne _022552FC
_022552F2:
	bl ov03_02254BEC
	ldr r0, _02255308 ; =ov03_0225530C
	bl ov03_02254B4C
_022552FC:
	pop {r3, pc}
	nop
_02255300: .word ov03_022598A0
_02255304: .word gSystem
_02255308: .word ov03_0225530C
	thumb_func_end ov03_022552C8

	thumb_func_start ov03_0225530C
ov03_0225530C: ; 0x0225530C
	push {r3, lr}
	add r0, r1, #0
	bl ov03_02254C9C
	ldr r0, _02255374 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _02255370
	ldr r0, _02255378 ; =ov03_02254E70
	bl ov03_02254B4C
	bl ov03_02255B84
	cmp r0, #2
	ble _02255340
	ldr r0, _02255374 ; =ov03_022598A0
	ldr r2, _0225537C ; =ov03_0225913C
	ldr r1, [r0]
	add r1, #0x9c
	str r2, [r1]
	mov r1, #2
	b _0225534C
_02255340:
	ldr r0, _02255374 ; =ov03_022598A0
	ldr r2, _02255380 ; =ov03_02259130
	ldr r1, [r0]
	add r1, #0x9c
	str r2, [r1]
	mov r1, #1
_0225534C:
	ldr r0, [r0]
	ldr r2, _02255384 ; =0x0000FFFF
	add r0, #0xa0
	strb r1, [r0]
	ldr r0, _02255374 ; =ov03_022598A0
	ldr r1, [r0]
	add r1, #0xa2
	strh r2, [r1]
	ldr r1, [r0]
	mov r2, #0
	add r1, #0xa1
	strb r2, [r1]
	ldr r2, [r0]
	mov r1, #7
	ldr r0, [r2, #0x68]
	add r2, #0x9c
	bl ov01_021F6A9C
_02255370:
	pop {r3, pc}
	nop
_02255374: .word ov03_022598A0
_02255378: .word ov03_02254E70
_0225537C: .word ov03_0225913C
_02255380: .word ov03_02259130
_02255384: .word 0x0000FFFF
	thumb_func_end ov03_0225530C

	thumb_func_start ov03_02255388
ov03_02255388: ; 0x02255388
	push {r3, r4, lr}
	sub sp, #0x54
	ldr r3, _022553C0 ; =ov03_022591D6
	add r4, r1, #0
	add r2, sp, #0
	mov r1, #0x29
_02255394:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _02255394
	add r0, r4, #0
	bl ov03_02254C9C
	add r4, #0x91
	ldrb r0, [r4]
	lsl r1, r0, #1
	add r0, sp, #0
	ldrh r0, [r0, r1]
	mov r1, #0
	bl ov03_02253E20
	ldr r0, _022553C4 ; =ov03_022553C8
	bl ov03_02254B4C
	add sp, #0x54
	pop {r3, r4, pc}
	.balign 4, 0
_022553C0: .word ov03_022591D6
_022553C4: .word ov03_022553C8
	thumb_func_end ov03_02255388

	thumb_func_start ov03_022553C8
ov03_022553C8: ; 0x022553C8
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	bl ov03_02254C9C
	mov r0, #0
	bl sub_02037EC0
	ldr r0, [r4, #0x5c]
	bl ListMenu_ProcessInput
	ldr r0, _022553FC ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _022553FA
	add r0, r4, #0
	bl ov03_02255C84
	ldr r0, _02255400 ; =ov03_02255404
	bl ov03_02254B4C
_022553FA:
	pop {r4, pc}
	.balign 4, 0
_022553FC: .word ov03_022598A0
_02255400: .word ov03_02255404
	thumb_func_end ov03_022553C8

	thumb_func_start ov03_02255404
ov03_02255404: ; 0x02255404
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov03_02254C9C
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _0225542C
	add r0, r4, #0
	bl ov03_02255CA0
	cmp r0, #1
	bne _022554D0
	add r0, r4, #0
	mov r1, #1
	add r0, #0xa8
	str r1, [r0]
_0225542C:
	add r0, r4, #0
	bl ov03_02255CD0
	cmp r0, #0
	beq _022554D0
	bl sub_02037700
	cmp r0, #0
	bne _0225544C
	bl sub_02037454
	add r1, r4, #0
	add r1, #0x90
	ldrb r1, [r1]
	cmp r1, r0
	beq _0225545A
_0225544C:
	add r0, r4, #0
	bl ov03_02255CE4
	ldr r0, _022554D4 ; =ov03_022554E0
	bl ov03_02254B4C
	pop {r3, r4, r5, pc}
_0225545A:
	ldr r0, [r4, #0x68]
	bl ov01_021F6AEC
	cmp r0, #6
	bne _022554D0
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	cmp r0, #0
	bne _022554B0
	add r4, #0x91
	ldrb r0, [r4]
	cmp r0, #8
	beq _0225547A
	cmp r0, #0x28
	bne _022554A2
_0225547A:
	mov r4, #1
	bl sub_02037454
	cmp r0, #1
	ble _022554A2
_02255484:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_020373B4
	cmp r0, #0
	bne _02255498
	ldr r0, _022554D4 ; =ov03_022554E0
	bl ov03_02254B4C
	pop {r3, r4, r5, pc}
_02255498:
	add r4, r4, #1
	bl sub_02037454
	cmp r4, r0
	blt _02255484
_022554A2:
	mov r0, #0xa
	bl sub_02037AC0
	ldr r0, _022554D8 ; =ov03_022556BC
	bl ov03_02254B4C
	pop {r3, r4, r5, pc}
_022554B0:
	cmp r0, #1
	bne _022554D0
	mov r0, #1
	bl sub_02037EC0
	bl ov03_02254B44
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_0225574C
	ldr r0, _022554DC ; =ov03_022598A0
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x88
	str r1, [r0]
_022554D0:
	pop {r3, r4, r5, pc}
	nop
_022554D4: .word ov03_022554E0
_022554D8: .word ov03_022556BC
_022554DC: .word ov03_022598A0
	thumb_func_end ov03_02255404

	thumb_func_start ov03_022554E0
ov03_022554E0: ; 0x022554E0
	push {r4, r5, lr}
	sub sp, #0x54
	ldr r5, _02255540 ; =ov03_022592CC
	add r4, r1, #0
	add r3, sp, #0
	mov r2, #0x29
_022554EC:
	ldrh r1, [r5]
	add r5, r5, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _022554EC
	add r1, r4, #0
	bl ov03_0225574C
	ldr r0, _02255544 ; =ov03_022598A0
	ldr r1, [r0]
	add r0, r1, #0
	add r0, #0x91
	ldrb r0, [r0]
	cmp r0, #8
	bne _0225551A
	add r1, #0x92
	ldrb r0, [r1]
	mov r1, #0
	add r0, #0x89
	bl ov03_02253E20
	b _0225552C
_0225551A:
	add r0, r4, #0
	add r0, #0x91
	ldrb r0, [r0]
	lsl r1, r0, #1
	add r0, sp, #0
	ldrh r0, [r0, r1]
	mov r1, #0
	bl ov03_02253E20
_0225552C:
	bl sub_02058284
	ldr r0, _02255548 ; =ov03_0225554C
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add sp, #0x54
	pop {r4, r5, pc}
	nop
_02255540: .word ov03_022592CC
_02255544: .word ov03_022598A0
_02255548: .word ov03_0225554C
	thumb_func_end ov03_022554E0

	thumb_func_start ov03_0225554C
ov03_0225554C: ; 0x0225554C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02255584 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _02255582
	ldr r0, _02255588 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _02255572
	bl System_GetTouchNew
	cmp r0, #1
	bne _02255582
_02255572:
	ldr r0, _02255584 ; =ov03_022598A0
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x88
	str r1, [r0]
	add r0, r4, #0
	bl DestroySysTask
_02255582:
	pop {r4, pc}
	.balign 4, 0
_02255584: .word ov03_022598A0
_02255588: .word gSystem
	thumb_func_end ov03_0225554C

	thumb_func_start ov03_0225558C
ov03_0225558C: ; 0x0225558C
	push {r4, r5, lr}
	sub sp, #0x54
	ldr r3, _022555E8 ; =ov03_022593C2
	add r4, r1, #0
	add r5, r0, #0
	add r2, sp, #0
	mov r1, #0x29
_0225559A:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _0225559A
	add r0, r4, #0
	bl ov03_02254C9C
	bl sub_020347A0
	cmp r0, #1
	ble _022555CE
	add r4, #0x91
	ldrb r0, [r4]
	lsl r1, r0, #1
	add r0, sp, #0
	ldrh r0, [r0, r1]
	mov r1, #0
	bl ov03_02253E20
	ldr r0, _022555EC ; =ov03_022555F4
	bl ov03_02254B4C
	add sp, #0x54
	pop {r4, r5, pc}
_022555CE:
	bl ov03_02254B44
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_0225574C
	ldr r0, _022555F0 ; =ov03_022598A0
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x88
	str r1, [r0]
	add sp, #0x54
	pop {r4, r5, pc}
	.balign 4, 0
_022555E8: .word ov03_022593C2
_022555EC: .word ov03_022555F4
_022555F0: .word ov03_022598A0
	thumb_func_end ov03_0225558C

	thumb_func_start ov03_022555F4
ov03_022555F4: ; 0x022555F4
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	bl ov03_02254C9C
	ldr r0, [r4, #0x5c]
	bl ListMenu_ProcessInput
	ldr r0, _02255624 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _02255620
	add r0, r4, #0
	bl ov03_02255C84
	ldr r0, _02255628 ; =ov03_0225562C
	bl ov03_02254B4C
_02255620:
	pop {r4, pc}
	nop
_02255624: .word ov03_022598A0
_02255628: .word ov03_0225562C
	thumb_func_end ov03_022555F4

	thumb_func_start ov03_0225562C
ov03_0225562C: ; 0x0225562C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov03_02254C9C
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _02255654
	add r0, r4, #0
	bl ov03_02255CA0
	cmp r0, #1
	bne _022556B2
	add r0, r4, #0
	mov r1, #1
	add r0, #0xa8
	str r1, [r0]
_02255654:
	add r0, r4, #0
	bl ov03_02255CD0
	cmp r0, #0
	beq _022556B2
	bl sub_02037700
	cmp r0, #0
	beq _02255678
	add r0, r4, #0
	bl ov03_02255CE4
	bl ov03_02254BEC
	ldr r0, _022556B4 ; =ov03_0225530C
	bl ov03_02254B4C
	pop {r3, r4, r5, pc}
_02255678:
	ldr r0, [r4, #0x68]
	bl ov01_021F6AEC
	cmp r0, #6
	bne _022556B2
	add r0, r4, #0
	add r0, #0xa4
	ldr r0, [r0]
	cmp r0, #0
	bne _022556A4
	bl ov03_02254B44
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_0225574C
	ldr r0, _022556B8 ; =ov03_022598A0
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x88
	str r1, [r0]
	pop {r3, r4, r5, pc}
_022556A4:
	cmp r0, #1
	bne _022556B2
	bl ov03_02254BEC
	ldr r0, _022556B4 ; =ov03_0225530C
	bl ov03_02254B4C
_022556B2:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022556B4: .word ov03_0225530C
_022556B8: .word ov03_022598A0
	thumb_func_end ov03_0225562C

	thumb_func_start ov03_022556BC
ov03_022556BC: ; 0x022556BC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02037700
	cmp r0, #0
	bne _022556D8
	bl sub_02037454
	add r1, r4, #0
	add r1, #0x90
	ldrb r1, [r1]
	cmp r1, r0
	beq _022556E0
_022556D8:
	ldr r0, _02255710 ; =ov03_022554E0
	bl ov03_02254B4C
	pop {r3, r4, r5, pc}
_022556E0:
	add r0, r4, #0
	bl ov03_02254C9C
	ldr r0, [r4, #0x5c]
	bl ListMenu_ProcessInput
	mov r0, #0xa
	bl sub_02037B38
	cmp r0, #0
	beq _0225570C
	bl sub_02037A10
	cmp r0, #0
	beq _0225570C
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_0225574C
	add r0, r4, #0
	bl ov03_02255B44
_0225570C:
	pop {r3, r4, r5, pc}
	nop
_02255710: .word ov03_022554E0
	thumb_func_end ov03_022556BC

	thumb_func_start ov03_02255714
ov03_02255714: ; 0x02255714
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	bl ov03_02254C9C
	ldr r0, [r4, #0x5c]
	bl ListMenu_ProcessInput
	ldr r0, _02255744 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _02255740
	add r0, r4, #0
	bl ov03_02255C84
	ldr r0, _02255748 ; =ov03_02255078
	bl ov03_02254B4C
_02255740:
	pop {r4, pc}
	nop
_02255744: .word ov03_022598A0
_02255748: .word ov03_02255078
	thumb_func_end ov03_02255714

	thumb_func_start ov03_0225574C
ov03_0225574C: ; 0x0225574C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _022557C8 ; =ov03_022598A0
	add r4, r1, #0
	ldr r0, [r0]
	mov r1, #0xf
	add r0, #0x40
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x20
	mov r1, #0
	bl sub_0200E5D4
	ldr r0, [r4, #0x64]
	bl ListMenuItems_dtor
	mov r1, #0
	ldr r0, [r4, #0x5c]
	add r2, r1, #0
	bl DestroyListMenu
	mov r0, #0
	str r0, [r4, #0x5c]
	add r0, r4, #0
	add r0, #0x20
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	add r0, #0x20
	bl RemoveWindow
	add r0, r4, #0
	add r0, #0x97
	ldrb r0, [r0]
	cmp r0, #0
	beq _022557BC
	ldr r0, _022557C8 ; =ov03_022598A0
	mov r1, #0
	ldr r0, [r0]
	add r0, #0x30
	bl sub_0200E5D4
	ldr r0, _022557C8 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x30
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _022557C8 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x30
	bl RemoveWindow
	mov r0, #0
	add r4, #0x97
	strb r0, [r4]
_022557BC:
	cmp r5, #0
	beq _022557C6
	add r0, r5, #0
	bl DestroySysTask
_022557C6:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022557C8: .word ov03_022598A0
	thumb_func_end ov03_0225574C

	thumb_func_start ov03_022557CC
ov03_022557CC: ; 0x022557CC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl BufferPlayersName
	mov r0, #0x45
	mov r1, #1
	bl ov03_02253E20
	ldr r0, _022557FC ; =ov03_02254D64
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	ldr r0, _02255800 ; =ov03_02255860
	bl ov03_02254B4C
	pop {r4, pc}
	nop
_022557FC: .word ov03_02254D64
_02255800: .word ov03_02255860
	thumb_func_end ov03_022557CC

	thumb_func_start ov03_02255804
ov03_02255804: ; 0x02255804
	push {r4, lr}
	ldr r1, _02255854 ; =ov03_022598A0
	add r4, r0, #0
	add r0, #0x8e
	ldr r1, [r1]
	ldrh r0, [r0]
	ldr r1, [r1, #0x7c]
	bl sub_020351DC
	ldr r2, _02255854 ; =ov03_022598A0
	ldr r0, [r4, #0x58]
	ldr r2, [r2]
	mov r1, #1
	ldr r2, [r2, #0x7c]
	bl BufferPlayersName
	mov r0, #4
	mov r1, #1
	bl ov03_02253E20
	bl sub_02037454
	add r1, r4, #0
	add r1, #0x90
	strb r0, [r1]
	ldr r0, _02255858 ; =ov03_02254D64
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	ldr r0, _0225585C ; =ov03_02255860
	bl ov03_02254B4C
	ldr r0, _02255854 ; =ov03_022598A0
	mov r1, #0x5a
	ldr r0, [r0]
	add r0, #0x96
	strb r1, [r0]
	pop {r4, pc}
	nop
_02255854: .word ov03_022598A0
_02255858: .word ov03_02254D64
_0225585C: .word ov03_02255860
	thumb_func_end ov03_02255804

	thumb_func_start ov03_02255860
ov03_02255860: ; 0x02255860
	push {r4, lr}
	add r4, r1, #0
	bl sub_0203769C
	cmp r0, #0
	bne _02255880
	bl sub_02037454
	add r4, #0x90
	ldrb r1, [r4]
	cmp r1, r0
	beq _02255880
	ldr r0, _022558B8 ; =ov03_02255A00
	bl ov03_02254B4C
	pop {r4, pc}
_02255880:
	bl ov03_02255C80
	cmp r0, #0
	bne _02255890
	bl sub_02037700
	cmp r0, #0
	beq _02255898
_02255890:
	ldr r0, _022558B8 ; =ov03_02255A00
	bl ov03_02254B4C
	pop {r4, pc}
_02255898:
	ldr r0, _022558BC ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _022558B4
	mov r0, #0xa
	bl sub_02037AC0
	ldr r0, _022558C0 ; =ov03_022558C4
	bl ov03_02254B4C
_022558B4:
	pop {r4, pc}
	nop
_022558B8: .word ov03_02255A00
_022558BC: .word ov03_022598A0
_022558C0: .word ov03_022558C4
	thumb_func_end ov03_02255860

	thumb_func_start ov03_022558C4
ov03_022558C4: ; 0x022558C4
	push {r4, r5, lr}
	sub sp, #0x54
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203769C
	cmp r0, #0
	bne _022558EA
	bl sub_02037454
	add r1, r4, #0
	add r1, #0x90
	ldrb r1, [r1]
	cmp r1, r0
	beq _022558EA
	ldr r0, _022559F4 ; =ov03_02255A00
	bl ov03_02254B4C
	b _0225597A
_022558EA:
	bl ov03_02255C80
	cmp r0, #0
	bne _022558FA
	bl sub_02037700
	cmp r0, #0
	beq _02255904
_022558FA:
	ldr r0, _022559F4 ; =ov03_02255A00
	bl ov03_02254B4C
	add sp, #0x54
	pop {r4, r5, pc}
_02255904:
	mov r0, #0
	bl sub_020373B4
	cmp r0, #0
	bne _02255918
	ldr r0, _022559F4 ; =ov03_02255A00
	bl ov03_02254B4C
	add sp, #0x54
	pop {r4, r5, pc}
_02255918:
	mov r0, #0
	mov r1, #5
	bl sub_02037BA0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02255932
	ldr r0, _022559F4 ; =ov03_02255A00
	bl ov03_02254B4C
	add sp, #0x54
	pop {r4, r5, pc}
_02255932:
	mov r0, #0xa
	bl sub_02037B38
	cmp r0, #0
	beq _0225597A
	bl sub_02037A10
	cmp r0, #0
	beq _0225597A
	ldr r0, _022559F8 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	bne _02255960
	ldr r0, _022559F8 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_020200A0
_02255960:
	bl sub_02037454
	add r1, r4, #0
	add r1, #0x90
	strb r0, [r1]
	add r0, r4, #0
	bl ov03_02255B44
	add r0, r5, #0
	bl DestroySysTask
	add sp, #0x54
	pop {r4, r5, pc}
_0225597A:
	ldr r2, _022559F8 ; =ov03_022598A0
	ldr r0, [r2]
	add r1, r0, #0
	add r1, #0x96
	ldrb r1, [r1]
	cmp r1, #0
	beq _022559F0
	add r1, r0, #0
	add r1, #0x96
	ldrb r1, [r1]
	add r0, #0x96
	sub r1, r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	add r1, r0, #0
	add r1, #0x96
	ldrb r1, [r1]
	cmp r1, #0
	bne _022559F0
	ldr r5, _022559FC ; =ov03_02259228
	add r3, sp, #0
	mov r2, #0x29
_022559A6:
	ldrh r1, [r5]
	add r5, r5, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _022559A6
	add r1, r0, #0
	add r1, #0x91
	ldrb r1, [r1]
	cmp r1, #8
	bne _022559CC
	add r0, #0x92
	ldrb r0, [r0]
	mov r1, #0
	add r0, #0x84
	bl ov03_02253E20
	add sp, #0x54
	pop {r4, r5, pc}
_022559CC:
	cmp r1, #0x28
	bne _022559E0
	add r0, #0x92
	ldrb r0, [r0]
	mov r1, #0
	add r0, #0xa0
	bl ov03_02253E20
	add sp, #0x54
	pop {r4, r5, pc}
_022559E0:
	add r4, #0x91
	ldrb r0, [r4]
	lsl r1, r0, #1
	add r0, sp, #0
	ldrh r0, [r0, r1]
	mov r1, #0
	bl ov03_02253E20
_022559F0:
	add sp, #0x54
	pop {r4, r5, pc}
	.balign 4, 0
_022559F4: .word ov03_02255A00
_022559F8: .word ov03_022598A0
_022559FC: .word ov03_02259228
	thumb_func_end ov03_022558C4

	thumb_func_start ov03_02255A00
ov03_02255A00: ; 0x02255A00
	push {r3, lr}
	ldr r0, _02255A24 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _02255A20
	mov r0, #0
	add r1, r0, #0
	bl ov03_02253E20
	ldr r0, _02255A28 ; =ov03_02255A2C
	bl ov03_02254B4C
_02255A20:
	pop {r3, pc}
	nop
_02255A24: .word ov03_022598A0
_02255A28: .word ov03_02255A2C
	thumb_func_end ov03_02255A00

	thumb_func_start ov03_02255A2C
ov03_02255A2C: ; 0x02255A2C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02255A68 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _02255A66
	ldr r0, _02255A6C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _02255A52
	bl System_GetTouchNew
	cmp r0, #1
	bne _02255A66
_02255A52:
	add r0, r4, #0
	bl DestroySysTask
	bl ov03_02254B44
	ldr r0, _02255A68 ; =ov03_022598A0
	mov r1, #1
	ldr r0, [r0]
	add r0, #0x88
	str r1, [r0]
_02255A66:
	pop {r4, pc}
	.balign 4, 0
_02255A68: .word ov03_022598A0
_02255A6C: .word gSystem
	thumb_func_end ov03_02255A2C

	thumb_func_start ov03_02255A70
ov03_02255A70: ; 0x02255A70
	push {r4, lr}
	ldr r1, _02255AA8 ; =ov03_022598A0
	add r4, r0, #0
	add r0, #0x8e
	ldr r1, [r1]
	ldrh r0, [r0]
	ldr r1, [r1, #0x7c]
	bl sub_020351DC
	ldr r2, _02255AA8 ; =ov03_022598A0
	ldr r0, [r4, #0x58]
	ldr r2, [r2]
	mov r1, #1
	ldr r2, [r2, #0x7c]
	bl BufferPlayersName
	mov r0, #5
	mov r1, #1
	bl ov03_02253E20
	bl sub_02058180
	ldr r0, _02255AAC ; =ov03_02255AB0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	pop {r4, pc}
	.balign 4, 0
_02255AA8: .word ov03_022598A0
_02255AAC: .word ov03_02255AB0
	thumb_func_end ov03_02255A70

	thumb_func_start ov03_02255AB0
ov03_02255AB0: ; 0x02255AB0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02255AD8 ; =ov03_022598A0
	add r4, r1, #0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _02255AD6
	bl sub_02058180
	add r0, r4, #0
	bl ov03_022542C8
	add r0, r5, #0
	bl DestroySysTask
_02255AD6:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02255AD8: .word ov03_022598A0
	thumb_func_end ov03_02255AB0

	thumb_func_start ov03_02255ADC
ov03_02255ADC: ; 0x02255ADC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02058180
	mov r4, #0
_02255AE6:
	add r0, r4, #0
	bl sub_020346E8
	add r4, r4, #1
	cmp r4, #8
	blt _02255AE6
	ldr r0, _02255B00 ; =ov03_02255B04
	add r1, r5, #0
	mov r2, #0
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	nop
_02255B00: .word ov03_02255B04
	thumb_func_end ov03_02255ADC

	thumb_func_start ov03_02255B04
ov03_02255B04: ; 0x02255B04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02255B3C ; =ov03_022598A0
	add r4, r1, #0
	ldr r0, [r0]
	add r0, #0x94
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #0
	beq _02255B38
	ldr r0, _02255B40 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _02255B2C
	bl System_GetTouchNew
	cmp r0, #1
	bne _02255B38
_02255B2C:
	add r0, r4, #0
	bl ov03_022542C8
	add r0, r5, #0
	bl DestroySysTask
_02255B38:
	pop {r3, r4, r5, pc}
	nop
_02255B3C: .word ov03_022598A0
_02255B40: .word gSystem
	thumb_func_end ov03_02255B04

	thumb_func_start ov03_02255B44
ov03_02255B44: ; 0x02255B44
	push {r3, lr}
	mov r0, #0
	bl sub_02037EC0
	ldr r0, _02255B6C ; =ov03_022598A0
	mov r1, #2
	ldr r0, [r0]
	add r0, #0x88
	str r1, [r0]
	mov r0, #1
	add r1, r0, #0
	bl sub_020398D4
	bl sub_02034434
	mov r0, #1
	bl sub_020356C0
	pop {r3, pc}
	nop
_02255B6C: .word ov03_022598A0
	thumb_func_end ov03_02255B44

	thumb_func_start ov03_02255B70
ov03_02255B70: ; 0x02255B70
	ldr r0, _02255B7C ; =ov03_022598A0
	ldr r3, _02255B80 ; =sub_0203775C
	ldr r0, [r0]
	add r0, #0x91
	ldrb r0, [r0]
	bx r3
	.balign 4, 0
_02255B7C: .word ov03_022598A0
_02255B80: .word sub_0203775C
	thumb_func_end ov03_02255B70

	thumb_func_start ov03_02255B84
ov03_02255B84: ; 0x02255B84
	ldr r0, _02255B90 ; =ov03_022598A0
	ldr r3, _02255B94 ; =sub_0203774C
	ldr r0, [r0]
	add r0, #0x91
	ldrb r0, [r0]
	bx r3
	.balign 4, 0
_02255B90: .word ov03_022598A0
_02255B94: .word sub_0203774C
	thumb_func_end ov03_02255B84

	thumb_func_start ov03_02255B98
ov03_02255B98: ; 0x02255B98
	ldr r0, _02255BAC ; =ov03_022598A0
	ldr r2, [r0]
	add r0, r2, #0
	add r0, #0x92
	add r2, #0x93
	ldrb r1, [r0]
	ldrb r0, [r2]
	lsl r0, r0, #4
	add r0, r1, r0
	bx lr
	.balign 4, 0
_02255BAC: .word ov03_022598A0
	thumb_func_end ov03_02255B98

	thumb_func_start ov03_02255BB0
ov03_02255BB0: ; 0x02255BB0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov03_02253F74
	ldr r0, _02255BE8 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x91
	strb r4, [r0]
	sub r0, r4, #3
	cmp r0, #1
	bhi _02255BD2
	mov r0, #0
	add r5, #0xa4
	str r0, [r5]
_02255BD2:
	ldr r0, _02255BE8 ; =ov03_022598A0
	ldr r1, [r0]
	add r1, #0x92
	strb r6, [r1]
	ldr r1, [r0]
	add r1, #0x93
	strb r7, [r1]
	ldr r0, [r0]
	bl ov03_022540E8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02255BE8: .word ov03_022598A0
	thumb_func_end ov03_02255BB0

	thumb_func_start ov03_02255BEC
ov03_02255BEC: ; 0x02255BEC
	ldr r0, _02255BF4 ; =ov03_022598A0
	ldr r3, _02255BF8 ; =ov03_022542C8
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_02255BF4: .word ov03_022598A0
_02255BF8: .word ov03_022542C8
	thumb_func_end ov03_02255BEC

	thumb_func_start ov03_02255BFC
ov03_02255BFC: ; 0x02255BFC
	push {r4, lr}
	ldr r0, _02255C14 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x88
	ldr r4, [r0]
	cmp r4, #0
	beq _02255C0E
	bl ov03_02254054
_02255C0E:
	add r0, r4, #0
	pop {r4, pc}
	nop
_02255C14: .word ov03_022598A0
	thumb_func_end ov03_02255BFC

	thumb_func_start ov03_02255C18
ov03_02255C18: ; 0x02255C18
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov03_02253F74
	ldr r0, _02255C50 ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x91
	strb r4, [r0]
	sub r0, r4, #3
	cmp r0, #1
	bhi _02255C3A
	mov r0, #0
	add r5, #0xa4
	str r0, [r5]
_02255C3A:
	ldr r0, _02255C50 ; =ov03_022598A0
	ldr r1, [r0]
	add r1, #0x92
	strb r6, [r1]
	ldr r1, [r0]
	add r1, #0x93
	strb r7, [r1]
	ldr r0, [r0]
	bl ov03_02254B2C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02255C50: .word ov03_022598A0
	thumb_func_end ov03_02255C18

	thumb_func_start ov03_02255C54
ov03_02255C54: ; 0x02255C54
	ldr r0, _02255C5C ; =ov03_022598A0
	ldr r3, _02255C60 ; =ov03_02254B58
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_02255C5C: .word ov03_022598A0
_02255C60: .word ov03_02254B58
	thumb_func_end ov03_02255C54

	thumb_func_start ov03_02255C64
ov03_02255C64: ; 0x02255C64
	push {r4, lr}
	ldr r0, _02255C7C ; =ov03_022598A0
	ldr r0, [r0]
	add r0, #0x88
	ldr r4, [r0]
	cmp r4, #0
	beq _02255C76
	bl ov03_02254054
_02255C76:
	add r0, r4, #0
	pop {r4, pc}
	nop
_02255C7C: .word ov03_022598A0
	thumb_func_end ov03_02255C64

	thumb_func_start ov03_02255C80
ov03_02255C80: ; 0x02255C80
	mov r0, #0
	bx lr
	thumb_func_end ov03_02255C80

	thumb_func_start ov03_02255C84
ov03_02255C84: ; 0x02255C84
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x68]
	mov r1, #3
	mov r2, #0
	bl ov01_021F6A9C
	add r0, r4, #0
	mov r1, #0
	add r0, #0xa8
	str r1, [r0]
	add r4, #0xa4
	str r1, [r4]
	pop {r4, pc}
	thumb_func_end ov03_02255C84

	thumb_func_start ov03_02255CA0
ov03_02255CA0: ; 0x02255CA0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x68]
	bl ov01_021F6B00
	add r4, r0, #0
	ldr r0, [r5, #0x68]
	bl ov01_021F6B10
	cmp r4, #3
	bne _02255CCC
	cmp r0, #1
	bne _02255CCC
	ldr r0, [r5, #0x68]
	mov r1, #3
	add r5, #0xa4
	add r2, r1, #0
	add r3, r5, #0
	bl ov01_021F6ABC
	mov r0, #1
	pop {r3, r4, r5, pc}
_02255CCC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov03_02255CA0

	thumb_func_start ov03_02255CD0
ov03_02255CD0: ; 0x02255CD0
	push {r3, lr}
	ldr r0, [r0, #0x68]
	bl ov01_021F6AEC
	cmp r0, #4
	blt _02255CE0
	mov r0, #1
	pop {r3, pc}
_02255CE0:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov03_02255CD0

	thumb_func_start ov03_02255CE4
ov03_02255CE4: ; 0x02255CE4
	push {r3, lr}
	add r3, r0, #0
	ldr r0, [r3, #0x68]
	mov r1, #3
	mov r2, #0xb
	add r3, #0xa4
	bl ov01_021F6ABC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov03_02255CE4

	thumb_func_start ov03_02255CF8
ov03_02255CF8: ; 0x02255CF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x54
	add r4, r1, #0
	bl WindowIsInUse
	cmp r0, #0
	bne _02255D32
	add r0, r5, #0
	add r0, #0x54
	bl InitWindow
	ldr r0, [r5, #0x10]
	add r1, r5, #0
	ldr r0, [r0, #8]
	add r1, #0x54
	mov r2, #3
	bl sub_0205B514
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x54
	bl sub_0205B564
	b _02255D3A
_02255D32:
	add r0, r5, #0
	add r0, #0x54
	bl sub_0205B5A8
_02255D3A:
	ldr r0, [r5, #0x68]
	ldr r2, [r5, #0x14]
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x64]
	ldr r1, [r5, #0x18]
	ldr r2, [r5, #0x14]
	bl StringExpandPlaceholders
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r2, r0, #0
	add r0, r5, #0
	ldr r1, [r5, #0x18]
	add r0, #0x54
	mov r3, #1
	bl sub_0205B5B4
	str r0, [r5, #0x74]
	pop {r3, r4, r5, pc}
	thumb_func_end ov03_02255CF8

	thumb_func_start ov03_02255D68
ov03_02255D68: ; 0x02255D68
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	beq _02255D80
	add r0, #0x54
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r0, #0x54
	bl ClearWindowTilemapAndCopyToVram
_02255D80:
	add r4, #0x54
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov03_02255D68

	thumb_func_start ov03_02255D8C
ov03_02255D8C: ; 0x02255D8C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	mov r3, #4
	bl sub_0202921C
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0
	ldr r0, [r4, #0x64]
	ldr r2, [r4, #0x1c]
	add r3, r1, #0
	bl BufferString
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov03_02255D8C

	thumb_func_start ov03_02255DB8
ov03_02255DB8: ; 0x02255DB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	add r4, r5, #0
	ldr r0, [r0, #0xc]
	mov r1, #0
	add r4, #0x34
	bl sub_020291A4
	mov r6, #5
	cmp r0, #0
	beq _02255DD4
	add r6, r6, #1
_02255DD4:
	add r0, r4, #0
	bl WindowIsInUse
	cmp r0, #0
	bne _02255E66
	add r0, r6, #2
	mov r1, #4
	bl ListMenuItems_ctor
	str r0, [r5, #8]
	mov r3, #1
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	add r0, r6, #2
	lsl r0, r0, #0x19
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	ldr r0, [r0, #8]
	mov r2, #3
	bl AddWindowParameterized
	add r0, r5, #0
	ldr r2, _02255EB4 ; =0x000003D9
	add r0, #0x34
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x68]
	mov r2, #0x8a
	mov r3, #0xc
	bl ListMenuItems_AppendFromMsgData
	mov r4, #0
	cmp r6, #0
	ble _02255E58
	mov r7, #0x80
_02255E2C:
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_02255D8C
	ldr r0, [r5, #0x68]
	ldr r2, [r5, #0x1c]
	add r1, r7, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x64]
	ldr r1, [r5, #0x20]
	ldr r2, [r5, #0x1c]
	bl StringExpandPlaceholders
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x20]
	add r2, r4, #0
	bl ListMenuItems_AddItem
	add r4, r4, #1
	cmp r4, r6
	blt _02255E2C
_02255E58:
	mov r2, #0x81
	add r3, r2, #0
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x68]
	sub r3, #0x83
	bl ListMenuItems_AppendFromMsgData
_02255E66:
	ldr r4, _02255EB8 ; =ov03_0225943C
	add r3, sp, #0x14
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r6, #2
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	add r0, sp, #0x14
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x12]
	ldr r0, [r5, #8]
	mov r1, #0
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r0, #0x34
	str r0, [sp, #0x20]
	add r0, r2, #0
	add r2, r5, #0
	str r5, [sp, #0x30]
	add r2, #0x78
	ldrh r2, [r2]
	mov r3, #4
	bl ListMenuInit
	str r0, [r5]
	add r5, #0x34
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_02255EB4: .word 0x000003D9
_02255EB8: .word ov03_0225943C
	thumb_func_end ov03_02255DB8

	thumb_func_start ov03_02255EBC
ov03_02255EBC: ; 0x02255EBC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02255EF6
	mov r1, #0
	add r2, r1, #0
	bl DestroyListMenu
	add r0, r4, #0
	add r0, #0x34
	mov r1, #1
	bl sub_0200E5D4
	add r1, r4, #0
	add r1, #0x38
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	bl ScheduleBgTilemapBufferTransfer
	add r0, r4, #0
	add r0, #0x34
	bl RemoveWindow
	ldr r0, [r4, #8]
	bl ListMenuItems_dtor
	mov r0, #0
	str r0, [r4]
_02255EF6:
	pop {r4, pc}
	thumb_func_end ov03_02255EBC

	thumb_func_start ov03_02255EF8
ov03_02255EF8: ; 0x02255EF8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl ListMenu_ProcessInput
	add r4, r0, #0
	add r2, r5, #0
	ldr r0, [r5]
	mov r1, #0
	add r2, #0x78
	bl ListMenuGetScrollAndRow
	add r0, r5, #0
	add r0, #0x80
	ldrh r6, [r0]
	add r1, r5, #0
	ldr r0, [r5]
	add r1, #0x80
	bl ListMenuGetCurrentItemArrayId
	add r0, r5, #0
	add r0, #0x80
	ldrh r0, [r0]
	cmp r6, r0
	beq _02255F30
	ldr r0, _02255F94 ; =0x000005DC
	bl PlaySE
_02255F30:
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _02255F60
	add r0, r0, #1
	cmp r4, r0
	beq _02255F44
	cmp r4, #0xc
	beq _02255F48
	b _02255F7A
_02255F44:
	mov r0, #0
	pop {r4, r5, r6, pc}
_02255F48:
	ldr r0, _02255F94 ; =0x000005DC
	bl PlaySE
	ldr r0, [r5, #0x10]
	mov r1, #0
	add r0, #0xa4
	str r1, [r0]
	add r0, r5, #0
	bl ov03_02255EBC
	mov r0, #2
	pop {r4, r5, r6, pc}
_02255F60:
	ldr r0, _02255F94 ; =0x000005DC
	bl PlaySE
	ldr r0, [r5, #0x10]
	mov r1, #0
	add r0, #0xa4
	str r1, [r0]
	add r0, r5, #0
	bl ov03_02255EBC
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_02255F7A:
	ldr r0, _02255F94 ; =0x000005DC
	bl PlaySE
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	ldr r0, [r0, #0xc]
	bl sub_020291E8
	ldr r1, [r5, #0x10]
	add r1, #0xa4
	str r0, [r1]
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02255F94: .word 0x000005DC
	thumb_func_end ov03_02255EF8

	thumb_func_start ov03_02255F98
ov03_02255F98: ; 0x02255F98
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	add r5, r0, #0
	mov r0, #3
	mov r1, #4
	ldr r4, _0225603C ; =ov03_02259838
	bl ListMenuItems_ctor
	str r0, [r5, #0xc]
	mov r0, #0xa
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _02256040 ; =0x00000201
	add r1, r5, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	add r1, #0x44
	ldr r0, [r0, #8]
	mov r2, #3
	mov r3, #0x16
	bl AddWindowParameterized
	add r0, r5, #0
	ldr r2, _02256044 ; =0x000003D9
	add r0, #0x44
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	mov r6, #0
_02255FDE:
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x68]
	ldr r2, [r4]
	ldr r3, [r4, #4]
	bl ListMenuItems_AppendFromMsgData
	add r6, r6, #1
	add r4, #8
	cmp r6, #3
	blt _02255FDE
	ldr r4, _02256048 ; =ov03_0225943C
	add r3, sp, #0x14
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	mov r1, #3
	add r0, sp, #0x14
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x12]
	ldr r0, [r5, #0xc]
	mov r1, #0
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r0, #0x44
	str r0, [sp, #0x20]
	add r0, r2, #0
	add r2, r5, #0
	str r5, [sp, #0x30]
	add r2, #0x7a
	ldrh r2, [r2]
	mov r3, #4
	bl ListMenuInit
	str r0, [r5, #4]
	add r5, #0x44
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	nop
_0225603C: .word ov03_02259838
_02256040: .word 0x00000201
_02256044: .word 0x000003D9
_02256048: .word ov03_0225943C
	thumb_func_end ov03_02255F98

	thumb_func_start ov03_0225604C
ov03_0225604C: ; 0x0225604C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	bl ListMenu_ProcessInput
	add r4, r0, #0
	add r2, r5, #0
	ldr r0, [r5, #4]
	mov r1, #0
	add r2, #0x7a
	bl ListMenuGetScrollAndRow
	add r0, r5, #0
	add r0, #0x82
	ldrh r6, [r0]
	add r1, r5, #0
	ldr r0, [r5, #4]
	add r1, #0x82
	bl ListMenuGetCurrentItemArrayId
	add r0, r5, #0
	add r0, #0x82
	ldrh r0, [r0]
	cmp r6, r0
	beq _02256084
	ldr r0, _022560E8 ; =0x000005DC
	bl PlaySE
_02256084:
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _02256096
	add r0, r0, #1
	cmp r4, r0
	bne _022560A2
	mov r0, #0
	pop {r4, r5, r6, pc}
_02256096:
	ldr r0, _022560E8 ; =0x000005DC
	bl PlaySE
	mov r4, #0
	mvn r4, r4
	b _022560AE
_022560A2:
	ldr r0, _022560E8 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	bl ov03_02255EBC
_022560AE:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _022560E4
	mov r1, #0
	add r2, r1, #0
	bl DestroyListMenu
	add r0, r5, #0
	add r0, #0x44
	mov r1, #1
	bl sub_0200E5D4
	add r1, r5, #0
	add r1, #0x48
	ldrb r1, [r1]
	ldr r0, [r5, #0x44]
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	add r0, #0x44
	bl RemoveWindow
	ldr r0, [r5, #0xc]
	bl ListMenuItems_dtor
	mov r0, #0
	str r0, [r5, #4]
_022560E4:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022560E8: .word 0x000005DC
	thumb_func_end ov03_0225604C

	thumb_func_start ov03_022560EC
ov03_022560EC: ; 0x022560EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r0, [sp, #0x14]
	ldr r6, [r0, #0x64]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xb6
	mov r3, #4
	bl NewMsgDataFromNarc
	str r0, [sp, #0x30]
	mov r0, #0xb4
	mov r1, #4
	bl String_ctor
	str r0, [sp, #0x2c]
	mov r0, #0xb4
	mov r1, #4
	bl String_ctor
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x14]
	mov r2, #3
	str r0, [sp, #0x24]
	add r0, #0x24
	str r0, [sp, #0x24]
	mov r0, #2
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x13
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x24]
	ldr r0, [r0, #0x10]
	mov r3, #4
	ldr r0, [r0, #8]
	bl AddWindowParameterized
	ldr r0, [sp, #0x24]
	ldr r2, _022563B8 ; =0x000003D9
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	ldr r0, [sp, #0x24]
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	add r1, r0, #0
	add r1, #0x78
	ldrh r1, [r1]
	sub r1, r1, #1
	bl ov03_02255D8C
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x2c]
	mov r1, #0x71
	bl ReadMsgDataIntoString
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	add r0, r6, #0
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x28]
	mov r3, #0x39
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	mov r5, #0
	mov r4, #0x10
	mov r7, #0xff
_02256192:
	add r1, r5, #0
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x2c]
	add r1, #0x5d
	bl ReadMsgDataIntoString
	str r4, [sp]
	str r7, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x2c]
	mov r1, #0
	mov r3, #2
	bl AddTextPrinterParameterized
	add r5, r5, #1
	add r4, #0xf
	cmp r5, #9
	blt _02256192
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, _022563BC ; =ov03_0225982C
	ldr r7, _022563C0 ; =ov03_02259820
	str r0, [sp, #0x20]
	mov r0, #0x10
	str r0, [sp, #0x1c]
_022561C8:
	ldr r0, [sp, #0x14]
	ldrb r1, [r7]
	ldr r0, [r0, #0x10]
	add r0, #0xa4
	ldr r0, [r0]
	bl sub_020290FC
	add r4, r0, #0
	ldr r0, [sp, #0x20]
	ldrb r5, [r0]
	ldrb r0, [r7]
	cmp r0, #0xb
	bls _022561E4
	b _02256348
_022561E4:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022561F0: ; jump table
	.short _02256348 - _022561F0 - 2 ; case 0
	.short _02256208 - _022561F0 - 2 ; case 1
	.short _0225621C - _022561F0 - 2 ; case 2
	.short _02256232 - _022561F0 - 2 ; case 3
	.short _02256342 - _022561F0 - 2 ; case 4
	.short _02256250 - _022561F0 - 2 ; case 5
	.short _02256348 - _022561F0 - 2 ; case 6
	.short _022562CE - _022561F0 - 2 ; case 7
	.short _02256348 - _022561F0 - 2 ; case 8
	.short _02256342 - _022561F0 - 2 ; case 9
	.short _02256342 - _022561F0 - 2 ; case 10
	.short _02256320 - _022561F0 - 2 ; case 11
_02256208:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	add r2, r4, #0
	mov r3, #1
	bl BufferIntegerAsString
	b _02256348
_0225621C:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	add r2, r4, #0
	mov r3, #3
	bl BufferIntegerAsString
	b _02256348
_02256232:
	cmp r4, #0
	bne _0225623A
	mov r5, #0x72
	b _02256348
_0225623A:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	add r2, r4, #0
	mov r3, #3
	bl BufferIntegerAsString
	b _02256348
_02256250:
	cmp r4, #0
	ldr r0, _022563C4 ; =0x00002710
	blt _0225626A
	mul r0, r4
	mov r1, #0xfe
	bl _s32_div_f
	add r0, r0, #5
	mov r1, #0xa
	bl _s32_div_f
	add r4, r0, #0
	b _0225627E
_0225626A:
	neg r1, r4
	mul r0, r1
	mov r1, #0xfe
	bl _s32_div_f
	add r0, r0, #5
	mov r1, #0xa
	bl _s32_div_f
	neg r4, r0
_0225627E:
	add r0, r4, #0
	mov r1, #0xc
	bl _s32_div_f
	bl abs
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	mov r3, #2
	bl BufferIntegerAsString
	add r0, r4, #0
	mov r1, #0xc
	bl _s32_div_f
	add r0, r1, #0
	bl abs
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #1
	mov r3, #2
	bl BufferIntegerAsString
	cmp r4, #0
	bne _022562C8
	mov r5, #0x72
	b _02256348
_022562C8:
	ble _02256348
	add r5, r5, #1
	b _02256348
_022562CE:
	cmp r4, #0
	ldr r0, _022563C8 ; =0x00035D2E
	blt _022562E6
	add r1, r4, #0
	mul r1, r0
	ldr r0, _022563CC ; =0x0000C350
	add r0, r1, r0
	ldr r1, _022563D0 ; =0x000186A0
	bl _s32_div_f
	add r4, r0, #0
	b _022562F8
_022562E6:
	neg r1, r4
	add r2, r1, #0
	mul r2, r0
	ldr r0, _022563CC ; =0x0000C350
	ldr r1, _022563D0 ; =0x000186A0
	add r0, r2, r0
	bl _s32_div_f
	neg r4, r0
_022562F8:
	add r0, r4, #0
	bl abs
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	cmp r4, #0
	bne _0225631A
	mov r5, #0x72
	b _02256348
_0225631A:
	ble _02256348
	add r5, r5, #1
	b _02256348
_02256320:
	ldr r0, [sp, #0x14]
	mov r1, #0xd
	ldr r0, [r0, #0x10]
	add r0, #0xa4
	ldr r0, [r0]
	bl sub_020290FC
	mov r1, #2
	lsl r1, r1, #0xe
	cmp r0, r1
	bne _0225633A
	mov r5, #0x73
	b _02256348
_0225633A:
	cmp r4, #0
	bne _02256348
	add r5, r5, #1
	b _02256348
_02256342:
	cmp r4, #0
	bne _02256348
	add r5, r5, #1
_02256348:
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x2c]
	add r1, r5, #0
	bl ReadMsgDataIntoString
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	add r0, r6, #0
	bl StringExpandPlaceholders
	mov r0, #0
	ldr r1, [sp, #0x28]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r4, r0, #0
	ldr r0, [sp, #0x1c]
	mov r3, #0xbf
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x28]
	mov r1, #0
	sub r3, r3, r4
	bl AddTextPrinterParameterized
	ldr r0, [sp, #0x20]
	add r7, r7, #1
	add r0, r0, #1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r0, #0xf
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #9
	bge _0225639C
	b _022561C8
_0225639C:
	ldr r0, [sp, #0x2c]
	bl String_dtor
	ldr r0, [sp, #0x28]
	bl String_dtor
	ldr r0, [sp, #0x30]
	bl DestroyMsgData
	ldr r0, [sp, #0x24]
	bl CopyWindowToVram
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022563B8: .word 0x000003D9
_022563BC: .word ov03_0225982C
_022563C0: .word ov03_02259820
_022563C4: .word 0x00002710
_022563C8: .word 0x00035D2E
_022563CC: .word 0x0000C350
_022563D0: .word 0x000186A0
	thumb_func_end ov03_022560EC

	thumb_func_start ov03_022563D4
ov03_022563D4: ; 0x022563D4
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x24
	mov r1, #1
	bl sub_0200E5D4
	add r1, r4, #0
	add r1, #0x28
	ldrb r1, [r1]
	ldr r0, [r4, #0x24]
	bl ScheduleBgTilemapBufferTransfer
	add r4, #0x24
	add r0, r4, #0
	bl RemoveWindow
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov03_022563D4

	thumb_func_start ov03_022563F8
ov03_022563F8: ; 0x022563F8
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #0x6c]
	add r0, #0xa4
	ldr r0, [r0]
	bl sub_02074CD0
	cmp r0, #0
	beq _02256422
	cmp r0, #1
	beq _02256462
	cmp r0, #4
	beq _02256428
	b _02256462
_02256422:
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_02256428:
	ldr r0, _022564A4 ; =0x000005F3
	bl PlaySE
	add r1, r4, #0
	add r1, #0x78
	ldrh r1, [r1]
	add r0, r4, #0
	sub r1, r1, #1
	bl ov03_02255D8C
	ldr r0, [r4, #0x10]
	mov r1, #1
	add r0, #0xa4
	ldr r0, [r0]
	bl sub_020290FC
	mov r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	add r2, r0, #0
	ldr r0, [r4, #0x64]
	add r3, r1, #0
	bl BufferIntegerAsString
	add r0, r4, #0
	mov r1, #0x7a
	bl ov03_02255CF8
	b _0225649C
_02256462:
	ldr r0, _022564A4 ; =0x000005F3
	bl PlaySE
	add r1, r4, #0
	add r1, #0x78
	ldrh r1, [r1]
	add r0, r4, #0
	sub r1, r1, #1
	bl ov03_02255D8C
	ldr r0, [r4, #0x10]
	mov r1, #3
	add r0, #0xa4
	ldr r0, [r0]
	bl sub_020290FC
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r0, [r4, #0x64]
	mov r3, #3
	bl BufferIntegerAsString
	add r0, r4, #0
	mov r1, #0x88
	bl ov03_02255CF8
_0225649C:
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	nop
_022564A4: .word 0x000005F3
	thumb_func_end ov03_022563F8

	thumb_func_start ov03_022564A8
ov03_022564A8: ; 0x022564A8
	push {r4, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4, #0x7c]
	cmp r1, #0xb
	bls _022564C0
	b _02256636
_022564C0:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022564CC: ; jump table
	.short _022564E4 - _022564CC - 2 ; case 0
	.short _022564F2 - _022564CC - 2 ; case 1
	.short _02256510 - _022564CC - 2 ; case 2
	.short _02256542 - _022564CC - 2 ; case 3
	.short _0225654E - _022564CC - 2 ; case 4
	.short _02256574 - _022564CC - 2 ; case 5
	.short _0225658E - _022564CC - 2 ; case 6
	.short _022565AC - _022564CC - 2 ; case 7
	.short _022565C0 - _022564CC - 2 ; case 8
	.short _022565E2 - _022564CC - 2 ; case 9
	.short _0225663A - _022564CC - 2 ; case 10
	.short _022565F6 - _022564CC - 2 ; case 11
_022564E4:
	mov r1, #0x78
	bl ov03_02255CF8
	ldr r0, [r4, #0x7c]
	add r0, r0, #1
	str r0, [r4, #0x7c]
	b _0225663A
_022564F2:
	ldr r0, [r4, #0x74]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #0
	bne _02256502
	b _0225663A
_02256502:
	add r0, r4, #0
	bl ov03_02255DB8
	ldr r0, [r4, #0x7c]
	add r0, r0, #1
	str r0, [r4, #0x7c]
	b _0225663A
_02256510:
	bl ov03_02255EF8
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02256528
	ldr r0, [r4, #0x70]
	mov r1, #2
	strh r1, [r0]
	mov r0, #0xb
	str r0, [r4, #0x7c]
	b _0225663A
_02256528:
	cmp r0, #2
	bne _02256538
	ldr r0, [r4, #0x70]
	mov r1, #3
	strh r1, [r0]
	mov r0, #0xb
	str r0, [r4, #0x7c]
	b _0225663A
_02256538:
	cmp r0, #1
	bne _0225663A
	mov r0, #3
	str r0, [r4, #0x7c]
	b _0225663A
_02256542:
	bl ov03_02255F98
	ldr r0, [r4, #0x7c]
	add r0, r0, #1
	str r0, [r4, #0x7c]
	b _0225663A
_0225654E:
	bl ov03_0225604C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02256560
	mov r0, #2
	str r0, [r4, #0x7c]
	b _0225663A
_02256560:
	cmp r0, #1
	bne _0225656A
	mov r0, #5
	str r0, [r4, #0x7c]
	b _0225663A
_0225656A:
	cmp r0, #2
	bne _0225663A
	mov r0, #7
	str r0, [r4, #0x7c]
	b _0225663A
_02256574:
	bl ov03_022563F8
	cmp r0, #0
	beq _02256588
	ldr r0, [r4, #0x70]
	mov r1, #1
	strh r1, [r0]
	mov r0, #0xb
	str r0, [r4, #0x7c]
	b _0225663A
_02256588:
	mov r0, #6
	str r0, [r4, #0x7c]
	b _0225663A
_0225658E:
	ldr r0, [r4, #0x74]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #0
	beq _0225663A
	ldr r0, _02256640 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0225663A
	mov r0, #0
	str r0, [r4, #0x7c]
	b _0225663A
_022565AC:
	mov r1, #1
	bl ov03_02255D68
	add r0, r4, #0
	bl ov03_022560EC
	ldr r0, [r4, #0x7c]
	add r0, r0, #1
	str r0, [r4, #0x7c]
	b _0225663A
_022565C0:
	ldr r1, _02256640 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #3
	tst r1, r2
	beq _0225663A
	bl ov03_022563D4
	add r0, r4, #0
	mov r1, #0x78
	bl ov03_02255CF8
	add r0, r4, #0
	bl ov03_02255DB8
	mov r0, #9
	str r0, [r4, #0x7c]
	b _0225663A
_022565E2:
	ldr r0, [r4, #0x74]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #0
	beq _0225663A
	mov r0, #3
	str r0, [r4, #0x7c]
	b _0225663A
_022565F6:
	bl ov03_02255EBC
	add r0, r4, #0
	mov r1, #0
	bl ov03_02255D68
	ldr r0, [r4, #0x64]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x68]
	bl DestroyMsgData
	ldr r0, [r4, #0x14]
	bl String_dtor
	ldr r0, [r4, #0x18]
	bl String_dtor
	ldr r0, [r4, #0x1c]
	bl String_dtor
	ldr r0, [r4, #0x20]
	bl String_dtor
	ldr r0, [r4, #0x6c]
	bl sub_0207495C
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, pc}
_02256636:
	mov r0, #1
	pop {r4, pc}
_0225663A:
	mov r0, #0
	pop {r4, pc}
	nop
_02256640: .word gSystem
	thumb_func_end ov03_022564A8

	thumb_func_start ov03_02256644
ov03_02256644: ; 0x02256644
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x84
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x84
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	str r0, [r4, #0x7c]
	str r5, [r4, #0x10]
	add r5, #0xa4
	str r0, [r5]
	mov r0, #4
	bl ScrStrBufs_new
	str r0, [r4, #0x64]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x2e
	mov r3, #4
	bl NewMsgDataFromNarc
	str r0, [r4, #0x68]
	mov r0, #0xb4
	mov r1, #4
	bl String_ctor
	str r0, [r4, #0x14]
	mov r0, #0xb4
	mov r1, #4
	bl String_ctor
	str r0, [r4, #0x18]
	mov r0, #0xb4
	mov r1, #4
	bl String_ctor
	str r0, [r4, #0x1c]
	mov r0, #0xb4
	mov r1, #4
	bl String_ctor
	str r0, [r4, #0x20]
	mov r0, #0xb
	bl sub_02074944
	str r0, [r4, #0x6c]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov03_02256644

	thumb_func_start ov03_022566B0
ov03_022566B0: ; 0x022566B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl TaskManager_GetSys
	bl ov03_02256644
	add r2, r0, #0
	ldr r1, _022566CC ; =ov03_022564A8
	add r0, r5, #0
	str r4, [r2, #0x70]
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022566CC: .word ov03_022564A8
	thumb_func_end ov03_022566B0

	thumb_func_start ov03_022566D0
ov03_022566D0: ; 0x022566D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb4
	mov r1, #4
	add r7, r2, #0
	bl String_ctor
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	add r1, r7, #0
	add r2, r4, #0
	mov r3, #4
	bl sub_0202921C
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	mov r1, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	add r3, r1, #0
	bl BufferString
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov03_022566D0

	thumb_func_start ov03_02256710
ov03_02256710: ; 0x02256710
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0xc
	beq _0225671C
	cmp r1, #6
	bne _02256724
_0225671C:
	mov r0, #0
	add r4, #0xa4
	str r0, [r4]
	pop {r4, pc}
_02256724:
	ldr r0, [r4, #0xc]
	bl sub_020291E8
	add r4, #0xa4
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov03_02256710

	thumb_func_start ov03_02256730
ov03_02256730: ; 0x02256730
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r0, [sp, #0x14]
	mov r0, #2
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x13
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	add r4, r2, #0
	ldr r0, [r0, #8]
	mov r2, #3
	mov r3, #4
	str r1, [sp, #0x18]
	bl AddWindowParameterized
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r2, _02256A10 ; =0x000003D9
	ldr r0, [r0, #8]
	mov r1, #3
	mov r3, #0xb
	bl LoadUserFrameGfx1
	ldr r0, [sp, #0x18]
	ldr r2, _02256A10 ; =0x000003D9
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	ldr r0, [sp, #0x18]
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xb6
	mov r3, #4
	bl NewMsgDataFromNarc
	str r0, [sp, #0x30]
	mov r0, #4
	bl ScrStrBufs_new
	add r6, r0, #0
	mov r0, #0xb4
	mov r1, #4
	bl String_ctor
	add r7, r0, #0
	mov r0, #0xb4
	mov r1, #4
	bl String_ctor
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x14]
	add r1, r6, #0
	add r2, r4, #0
	bl ov03_022566D0
	ldr r0, [sp, #0x30]
	mov r1, #0x71
	add r2, r7, #0
	bl ReadMsgDataIntoString
	ldr r1, [sp, #0x2c]
	add r0, r6, #0
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x2c]
	mov r3, #0x39
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	mov r0, #0
	str r0, [sp, #0x28]
	mov r0, #0x10
	str r0, [sp, #0x1c]
	ldr r0, _02256A14 ; =ov03_02259820
	str r0, [sp, #0x24]
	ldr r0, _02256A18 ; =ov03_0225982C
	str r0, [sp, #0x20]
_022567F0:
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x30]
	add r1, #0x5d
	add r2, r7, #0
	bl ReadMsgDataIntoString
	ldr r0, [sp, #0x1c]
	mov r1, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	add r2, r7, #0
	mov r3, #2
	bl AddTextPrinterParameterized
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x24]
	add r0, #0xa4
	ldrb r1, [r1]
	ldr r0, [r0]
	bl sub_020290FC
	add r4, r0, #0
	ldr r0, [sp, #0x20]
	ldrb r5, [r0]
	ldr r0, [sp, #0x24]
	ldrb r0, [r0]
	cmp r0, #0xb
	bls _02256832
	b _02256994
_02256832:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225683E: ; jump table
	.short _02256994 - _0225683E - 2 ; case 0
	.short _02256856 - _0225683E - 2 ; case 1
	.short _0225686A - _0225683E - 2 ; case 2
	.short _02256880 - _0225683E - 2 ; case 3
	.short _0225698E - _0225683E - 2 ; case 4
	.short _0225689E - _0225683E - 2 ; case 5
	.short _02256994 - _0225683E - 2 ; case 6
	.short _0225691C - _0225683E - 2 ; case 7
	.short _02256994 - _0225683E - 2 ; case 8
	.short _0225698E - _0225683E - 2 ; case 9
	.short _0225698E - _0225683E - 2 ; case 10
	.short _0225696E - _0225683E - 2 ; case 11
_02256856:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	add r2, r4, #0
	mov r3, #1
	bl BufferIntegerAsString
	b _02256994
_0225686A:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	add r2, r4, #0
	mov r3, #3
	bl BufferIntegerAsString
	b _02256994
_02256880:
	cmp r4, #0
	bne _02256888
	mov r5, #0x72
	b _02256994
_02256888:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	add r2, r4, #0
	mov r3, #3
	bl BufferIntegerAsString
	b _02256994
_0225689E:
	cmp r4, #0
	ldr r0, _02256A1C ; =0x00002710
	blt _022568B8
	mul r0, r4
	mov r1, #0xfe
	bl _s32_div_f
	add r0, r0, #5
	mov r1, #0xa
	bl _s32_div_f
	add r4, r0, #0
	b _022568CC
_022568B8:
	neg r1, r4
	mul r0, r1
	mov r1, #0xfe
	bl _s32_div_f
	add r0, r0, #5
	mov r1, #0xa
	bl _s32_div_f
	neg r4, r0
_022568CC:
	add r0, r4, #0
	mov r1, #0xc
	bl _s32_div_f
	bl abs
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	mov r3, #2
	bl BufferIntegerAsString
	add r0, r4, #0
	mov r1, #0xc
	bl _s32_div_f
	add r0, r1, #0
	bl abs
	add r2, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #1
	mov r3, #2
	bl BufferIntegerAsString
	cmp r4, #0
	bne _02256916
	mov r5, #0x72
	b _02256994
_02256916:
	ble _02256994
	add r5, r5, #1
	b _02256994
_0225691C:
	cmp r4, #0
	ldr r0, _02256A20 ; =0x00035D2E
	blt _02256934
	add r1, r4, #0
	mul r1, r0
	ldr r0, _02256A24 ; =0x0000C350
	add r0, r1, r0
	ldr r1, _02256A28 ; =0x000186A0
	bl _s32_div_f
	add r4, r0, #0
	b _02256946
_02256934:
	neg r1, r4
	add r2, r1, #0
	mul r2, r0
	ldr r0, _02256A24 ; =0x0000C350
	ldr r1, _02256A28 ; =0x000186A0
	add r0, r2, r0
	bl _s32_div_f
	neg r4, r0
_02256946:
	add r0, r4, #0
	bl abs
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	cmp r4, #0
	bne _02256968
	mov r5, #0x72
	b _02256994
_02256968:
	ble _02256994
	add r5, r5, #1
	b _02256994
_0225696E:
	ldr r0, [sp, #0x14]
	mov r1, #0xd
	add r0, #0xa4
	ldr r0, [r0]
	bl sub_020290FC
	mov r1, #2
	lsl r1, r1, #0xe
	cmp r0, r1
	bne _02256986
	mov r5, #0x73
	b _02256994
_02256986:
	cmp r4, #0
	bne _02256994
	add r5, r5, #1
	b _02256994
_0225698E:
	cmp r4, #0
	bne _02256994
	add r5, r5, #1
_02256994:
	ldr r0, [sp, #0x30]
	add r1, r5, #0
	add r2, r7, #0
	bl ReadMsgDataIntoString
	ldr r1, [sp, #0x2c]
	add r0, r6, #0
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r0, #0
	ldr r1, [sp, #0x2c]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r4, r0, #0
	ldr r0, [sp, #0x1c]
	mov r3, #0xbf
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x2c]
	mov r1, #0
	sub r3, r3, r4
	bl AddTextPrinterParameterized
	ldr r0, [sp, #0x1c]
	add r0, #0xf
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x24]
	add r0, r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #9
	bge _022569EC
	b _022567F0
_022569EC:
	ldr r0, [sp, #0x2c]
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	add r0, r6, #0
	bl ScrStrBufs_delete
	ldr r0, [sp, #0x30]
	bl DestroyMsgData
	ldr r0, [sp, #0x18]
	bl CopyWindowToVram
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_02256A10: .word 0x000003D9
_02256A14: .word ov03_02259820
_02256A18: .word ov03_0225982C
_02256A1C: .word 0x00002710
_02256A20: .word 0x00035D2E
_02256A24: .word 0x0000C350
_02256A28: .word 0x000186A0
	thumb_func_end ov03_02256730

	thumb_func_start ov03_02256A2C
ov03_02256A2C: ; 0x02256A2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #8]
	ldr r0, [r0, #0xc]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	bl SavArray_PlayerParty_get
	add r6, r0, #0
	mov r0, #0xb
	bl sub_02074944
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	cmp r0, #0xa
	bne _02256A84
	add r0, r6, #0
	bl GetPartyCount
	add r7, r0, #0
	add r5, r7, #0
	mov r4, #0
	cmp r7, #0
	ble _02256A78
_02256A5C:
	add r0, r6, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02256A72
	sub r5, r5, #1
_02256A72:
	add r4, r4, #1
	cmp r4, r7
	blt _02256A5C
_02256A78:
	cmp r5, #2
	bge _02256A80
	mov r4, #7
	b _02256A94
_02256A80:
	mov r4, #0
	b _02256A94
_02256A84:
	ldr r0, [sp, #8]
	ldr r2, [sp, #0x14]
	add r0, #0xa4
	ldr r0, [r0]
	add r1, r6, #0
	bl sub_02074CD0
	add r4, r0, #0
_02256A94:
	ldr r0, [sp, #0x14]
	bl sub_0207495C
	cmp r4, #7
	bhi _02256B0E
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02256AAA: ; jump table
	.short _02256ABA - _02256AAA - 2 ; case 0
	.short _02256B0E - _02256AAA - 2 ; case 1
	.short _02256B0E - _02256AAA - 2 ; case 2
	.short _02256B0E - _02256AAA - 2 ; case 3
	.short _02256AC0 - _02256AAA - 2 ; case 4
	.short _02256B0E - _02256AAA - 2 ; case 5
	.short _02256B0E - _02256AAA - 2 ; case 6
	.short _02256AEE - _02256AAA - 2 ; case 7
_02256ABA:
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02256AC0:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	bl ov03_022566D0
	ldr r0, [sp, #8]
	mov r1, #1
	add r0, #0xa4
	str r0, [sp, #8]
	ldr r0, [r0]
	bl sub_020290FC
	mov r1, #1
	add r2, r0, #0
	str r1, [sp]
	ldr r0, [sp, #0xc]
	add r3, r1, #0
	str r1, [sp, #4]
	bl BufferIntegerAsString
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02256AEE:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	bl ov03_022566D0
	mov r1, #1
	str r1, [sp]
	ldr r0, [sp, #0xc]
	mov r2, #2
	add r3, r1, #0
	str r1, [sp, #4]
	bl BufferIntegerAsString
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02256B0E:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	bl ov03_022566D0
	ldr r0, [sp, #8]
	mov r1, #3
	add r0, #0xa4
	str r0, [sp, #8]
	ldr r0, [r0]
	bl sub_020290FC
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r0, [sp, #0xc]
	mov r3, #3
	str r1, [sp, #4]
	bl BufferIntegerAsString
	mov r0, #2
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov03_02256A2C

	thumb_func_start ov03_02256B40
ov03_02256B40: ; 0x02256B40
	cmp r0, #0xb
	bhi _02256B7E
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02256B50: ; jump table
	.short _02256B7E - _02256B50 - 2 ; case 0
	.short _02256B7E - _02256B50 - 2 ; case 1
	.short _02256B7E - _02256B50 - 2 ; case 2
	.short _02256B7E - _02256B50 - 2 ; case 3
	.short _02256B7E - _02256B50 - 2 ; case 4
	.short _02256B7E - _02256B50 - 2 ; case 5
	.short _02256B68 - _02256B50 - 2 ; case 6
	.short _02256B6C - _02256B50 - 2 ; case 7
	.short _02256B70 - _02256B50 - 2 ; case 8
	.short _02256B74 - _02256B50 - 2 ; case 9
	.short _02256B78 - _02256B50 - 2 ; case 10
	.short _02256B78 - _02256B50 - 2 ; case 11
_02256B68:
	mov r0, #0xff
	bx lr
_02256B6C:
	mov r0, #0
	bx lr
_02256B70:
	mov r0, #3
	bx lr
_02256B74:
	mov r0, #4
	bx lr
_02256B78:
	mov r0, #0
	mvn r0, r0
	bx lr
_02256B7E:
	cmp r0, #9
	blo _02256B84
	mov r0, #0xff
_02256B84:
	bx lr
	.balign 4, 0
	thumb_func_end ov03_02256B40

	thumb_func_start ScrCmd_710
ScrCmd_710: ; 0x02256B88
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_02256B8E:
	add r0, r5, #0
	add r0, #0x80
	lsl r1, r4, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x18
	bl ov03_02256BA8
	add r4, r4, #1
	cmp r4, #3
	blt _02256B8E
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_710

	thumb_func_start ov03_02256BA8
ov03_02256BA8: ; 0x02256BA8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	ldr r0, _02256BE8 ; =ov03_0225945C
	lsl r1, r6, #1
	ldrh r4, [r0, r1]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r1, r4, #0
	bl ov01_022040D0
	add r7, r0, #0
	bne _02256BCA
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
_02256BCA:
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	add r1, r6, #0
	bl sub_020669B4
	add r1, r0, #0
	ldr r0, [r5, #0x54]
	mov r2, #1
	str r0, [sp]
	add r0, r4, #0
	add r3, r7, #0
	bl ov01_021E8970
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02256BE8: .word ov03_0225945C
	thumb_func_end ov03_02256BA8

	thumb_func_start ov03_02256BEC
ov03_02256BEC: ; 0x02256BEC
	push {r3, r4}
	sub r2, r2, #3
	cmp r2, #1
	ldr r3, _02256C28 ; =0x0000FFFF
	bhi _02256C0C
	mov r0, #1
	mov r2, #0
	lsl r0, r0, #8
_02256BFC:
	ldrh r4, [r1]
	cmp r4, r3
	beq _02256C20
	add r2, r2, #1
	add r1, r1, #4
	cmp r2, r0
	blt _02256BFC
	b _02256C20
_02256C0C:
	mov r1, #1
	mov r2, #0
	lsl r1, r1, #8
_02256C12:
	ldrh r4, [r0]
	cmp r4, r3
	beq _02256C20
	add r2, r2, #1
	add r0, r0, #2
	cmp r2, r1
	blt _02256C12
_02256C20:
	add r0, r2, #0
	pop {r3, r4}
	bx lr
	nop
_02256C28: .word 0x0000FFFF
	thumb_func_end ov03_02256BEC

	thumb_func_start ov03_02256C2C
ov03_02256C2C: ; 0x02256C2C
	push {r4, r5, r6, r7}
	add r4, r0, #0
	mov r0, #0x27
	lsl r0, r0, #4
	ldrb r7, [r4, r0]
	add r3, r1, #0
	mov r1, #0
	add r0, r1, #0
	mov ip, r2
	cmp r7, #0
	ble _02256C80
_02256C42:
	mov r2, ip
	cmp r2, #0
	ldrh r6, [r3]
	bne _02256C6C
	cmp r6, #4
	bne _02256C5E
	mov r2, #0x27
	lsl r2, r2, #4
	ldrb r2, [r4, r2]
	sub r5, r2, #1
	mov r2, #0x27
	lsl r2, r2, #4
	strb r5, [r4, r2]
	b _02256C78
_02256C5E:
	mov r2, #0x9a
	lsl r2, r2, #2
	ldr r5, [r4, r2]
	lsl r2, r1, #1
	strh r6, [r5, r2]
	add r1, r1, #1
	b _02256C78
_02256C6C:
	mov r2, #0x9a
	lsl r2, r2, #2
	ldr r5, [r4, r2]
	lsl r2, r1, #1
	strh r6, [r5, r2]
	add r1, r1, #1
_02256C78:
	add r0, r0, #1
	add r3, r3, #2
	cmp r0, r7
	blt _02256C42
_02256C80:
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov03_02256C2C

	thumb_func_start ov03_02256C84
ov03_02256C84: ; 0x02256C84
	push {r4, r5, r6, r7}
	mov r3, #0x27
	lsl r3, r3, #4
	ldrb r3, [r0, r3]
	mov r2, #0
	cmp r3, #0
	ble _02256CAE
	mov r4, #0x9a
	lsl r4, r4, #2
	add r5, r4, #0
	add r3, r2, #0
	add r5, #8
_02256C9C:
	ldrh r7, [r1]
	ldr r6, [r0, r4]
	add r2, r2, #1
	strh r7, [r6, r3]
	ldrb r6, [r0, r5]
	add r3, r3, #2
	add r1, r1, #4
	cmp r2, r6
	blt _02256C9C
_02256CAE:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end ov03_02256C84

	thumb_func_start ov03_02256CB4
ov03_02256CB4: ; 0x02256CB4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	ldr r2, _02256D14 ; =0x00000283
	add r5, r0, #0
	add r4, r1, #0
	add r7, r3, #0
	ldrb r2, [r5, r2]
	add r0, r4, #0
	add r1, r7, #0
	bl ov03_02256BEC
	mov r1, #0x27
	lsl r1, r1, #4
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r0, #0xff
	blo _02256CDA
	bl GF_AssertFail
_02256CDA:
	mov r1, #0x27
	lsl r1, r1, #4
	ldrb r1, [r5, r1]
	mov r0, #0xb
	lsl r1, r1, #1
	bl AllocFromHeap
	mov r1, #0x9a
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r1, #0x1b
	ldrb r0, [r5, r1]
	add r0, #0xfd
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02256D06
	add r0, r5, #0
	add r1, r7, #0
	bl ov03_02256C84
	pop {r3, r4, r5, r6, r7, pc}
_02256D06:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov03_02256C2C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02256D14: .word 0x00000283
	thumb_func_end ov03_02256CB4

	thumb_func_start ov03_02256D18
ov03_02256D18: ; 0x02256D18
	push {r4, lr}
	mov r1, #0xa9
	mov r0, #0xb
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0xa9
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov03_02256D18

	thumb_func_start InitMartUI
InitMartUI: ; 0x02256D34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	str r2, [sp]
	add r6, r3, #0
	bl ov03_02256D18
	add r4, r0, #0
	ldr r0, [r5, #8]
	mov r1, #0xb
	str r0, [r4]
	mov r0, #0x60
	bl String_ctor
	mov r1, #0x9d
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	mov r1, #0x25
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r5, #0xc]
	bl Sav2_GameStats_get
	mov r1, #0x97
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	mov r1, #0x26
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r5, #0xc]
	bl Save_ApricornBox_get
	mov r1, #0x96
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r2, [sp, #0x1c]
	add r0, #0xc
	str r2, [r4, r0]
	add r0, r1, #0
	add r0, #0x2b
	add r2, r1, #0
	strb r6, [r4, r0]
	mov r0, #0
	add r2, #0x19
	strb r0, [r4, r2]
	add r2, r1, #0
	add r2, #0x38
	str r0, [r4, r2]
	add r2, r1, #0
	sub r3, r0, #1
	add r2, #0x3c
	str r3, [r4, r2]
	add r1, #0x40
	str r0, [r4, r1]
	ldr r0, [r5, #0xc]
	bl Save_Pokeathlon_get
	mov r1, #0x95
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r2, [sp, #0x20]
	add r0, #0x18
	str r2, [r4, r0]
	add r0, sp, #8
	ldrb r2, [r0, #0x10]
	add r0, r1, #0
	add r0, #0x1f
	add r1, #0x2f
	strb r2, [r4, r0]
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _02256DEA
	add r0, #0xfd
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02256DF8
_02256DEA:
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	mov r1, #0x93
	lsl r1, r1, #2
	str r0, [r4, r1]
	b _02256E04
_02256DF8:
	ldr r0, [r5, #0xc]
	bl Sav2_SealCase_get
	mov r1, #0x93
	lsl r1, r1, #2
	str r0, [r4, r1]
_02256E04:
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl CheckFlag09A
	add r2, r0, #0
	ldr r1, [sp]
	ldr r3, [sp, #0x20]
	add r0, r4, #0
	bl ov03_02256CB4
	ldr r1, _02256E28 ; =ov03_02256E2C
	add r0, r7, #0
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02256E28: .word ov03_02256E2C
	thumb_func_end InitMartUI

	thumb_func_start ov03_02256E2C
ov03_02256E2C: ; 0x02256E2C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	ldr r1, _02257064 ; =0x00000272
	add r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #0x1b
	bhi _02256F08
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02256E52: ; jump table
	.short _02256E8A - _02256E52 - 2 ; case 0
	.short _02256EA6 - _02256E52 - 2 ; case 1
	.short _02256EC0 - _02256E52 - 2 ; case 2
	.short _02256ECE - _02256E52 - 2 ; case 3
	.short _02256EF6 - _02256E52 - 2 ; case 4
	.short _02256F2C - _02256E52 - 2 ; case 5
	.short _02256EFC - _02256E52 - 2 ; case 6
	.short _02256F36 - _02256E52 - 2 ; case 7
	.short _02256F5E - _02256E52 - 2 ; case 8
	.short _02256F68 - _02256E52 - 2 ; case 9
	.short _02256F72 - _02256E52 - 2 ; case 10
	.short _02256F7C - _02256E52 - 2 ; case 11
	.short _02256F9A - _02256E52 - 2 ; case 12
	.short _02256FA4 - _02256E52 - 2 ; case 13
	.short _02256FAE - _02256E52 - 2 ; case 14
	.short _02256FB8 - _02256E52 - 2 ; case 15
	.short _02256FC2 - _02256E52 - 2 ; case 16
	.short _02256FCC - _02256E52 - 2 ; case 17
	.short _02256FE0 - _02256E52 - 2 ; case 18
	.short _02256FEE - _02256E52 - 2 ; case 19
	.short _02256FF8 - _02256E52 - 2 ; case 20
	.short _02257002 - _02256E52 - 2 ; case 21
	.short _0225700C - _02256E52 - 2 ; case 22
	.short _02257016 - _02256E52 - 2 ; case 23
	.short _02257036 - _02256E52 - 2 ; case 24
	.short _02257036 - _02256E52 - 2 ; case 25
	.short _0225701E - _02256E52 - 2 ; case 26
	.short _0225702C - _02256E52 - 2 ; case 27
_02256E8A:
	bl ov03_0225706C
	ldr r0, _02257068 ; =0x00000273
	ldrb r1, [r4, r0]
	cmp r1, #0
	bne _02256E9E
	mov r1, #1
	sub r0, r0, #1
	strb r1, [r4, r0]
	b _02257036
_02256E9E:
	mov r1, #0x16
	sub r0, r0, #1
	strb r1, [r4, r0]
	b _02257036
_02256EA6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_022570D4
	add r0, r5, #0
	mov r1, #2
	add r2, r4, #0
	bl ov01_021F6A9C
	ldr r0, _02257064 ; =0x00000272
	mov r1, #2
	strb r1, [r4, r0]
	b _02257036
_02256EC0:
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_02257334
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256ECE:
	add r1, #0x22
	mov r2, #0
	ldr r1, [r4, r1]
	mvn r2, r2
	cmp r1, r2
	bne _02256EE4
	bl ov03_02257510
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256EE4:
	bl ov03_0225761C
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	mov r0, #0
	mvn r0, r0
	add r1, #0x22
	str r0, [r4, r1]
	b _02257036
_02256EF6:
	mov r0, #3
	strb r0, [r4, r1]
	b _02257036
_02256EFC:
	sub r1, #0x52
	ldr r0, [r4, r1]
	bl sub_02024B68
	cmp r0, #0
	beq _02256F0A
_02256F08:
	b _02257036
_02256F0A:
	mov r3, #0x9a
	lsl r3, r3, #2
	add r2, r3, #0
	ldr r1, [r4, r3]
	add r2, #0x28
	add r3, #9
	ldr r5, [r4, r2]
	ldrb r2, [r4, r3]
	add r0, r4, #0
	add r2, r5, r2
	lsl r2, r2, #1
	ldrh r1, [r1, r2]
	bl ov03_02257874
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256F2C:
	bl ov03_02257944
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256F36:
	add r1, #0x22
	mov r2, #0
	ldr r1, [r4, r1]
	mvn r2, r2
	cmp r1, r2
	bne _02256F4C
	bl ov03_02257ADC
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256F4C:
	bl ov03_02257B4C
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	mov r0, #0
	mvn r0, r0
	add r1, #0x22
	str r0, [r4, r1]
	b _02257036
_02256F5E:
	bl ov03_022579E0
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256F68:
	bl ov03_02257A70
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256F72:
	bl ov03_02257D6C
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256F7C:
	add r1, #0x22
	mov r2, #0
	ldr r1, [r4, r1]
	mvn r2, r2
	cmp r1, r2
	beq _02257036
	bl ov03_02257D90
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	mov r0, #0
	mvn r0, r0
	add r1, #0x22
	str r0, [r4, r1]
	b _02257036
_02256F9A:
	bl ov03_02257E6C
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256FA4:
	bl ov03_02257F24
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256FAE:
	bl ov03_02257FF8
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256FB8:
	bl ov03_02258078
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256FC2:
	bl ov03_022577D0
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256FCC:
	bl ov03_022572EC
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_02258164
	ldr r0, _02257064 ; =0x00000272
	mov r1, #0x12
	strb r1, [r4, r0]
	b _02257036
_02256FE0:
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_02258170
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256FEE:
	bl ov03_022576F8
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256FF8:
	bl ov03_02257728
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02257002:
	bl ov03_022586E0
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_0225700C:
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_0225874C
	b _02257036
_02257016:
	add r0, r6, #0
	bl ov03_02258764
	b _02257036
_0225701E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_022587D4
	ldr r1, _02257064 ; =0x00000272
	strb r0, [r4, r1]
	b _02257036
_0225702C:
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_0225709C
	pop {r3, r4, r5, r6, r7, pc}
_02257036:
	mov r7, #0x7e
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #2
_0225703E:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0225704C
	mov r1, #1
	lsl r1, r1, #0xc
	bl sub_020249B0
_0225704C:
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #0x13
	blt _0225703E
	add r4, #0x94
	ldr r0, [r4]
	cmp r0, #0
	beq _02257060
	bl sub_0202457C
_02257060:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02257064: .word 0x00000272
_02257068: .word 0x00000273
	thumb_func_end ov03_02256E2C

	thumb_func_start ov03_0225706C
ov03_0225706C: ; 0x0225706C
	ldr r3, _02257070 ; =ov03_02257074
	bx r3
	.balign 4, 0
_02257070: .word ov03_02257074
	thumb_func_end ov03_0225706C

	thumb_func_start ov03_02257074
ov03_02257074: ; 0x02257074
	push {r4, lr}
	ldr r2, _02257098 ; =0x000001B3
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0xb
	bl NewMsgDataFromNarc
	add r1, r4, #0
	add r1, #0x88
	str r0, [r1]
	mov r0, #0xb
	bl ScrStrBufs_new
	add r4, #0x8c
	str r0, [r4]
	pop {r4, pc}
	nop
_02257098: .word 0x000001B3
	thumb_func_end ov03_02257074

	thumb_func_start ov03_0225709C
ov03_0225709C: ; 0x0225709C
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	bl DestroyMsgData
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl ScrStrBufs_delete
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov03_0225709C

	thumb_func_start ov03_022570D4
ov03_022570D4: ; 0x022570D4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x12
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #6
	mov r2, #0
	str r0, [sp, #8]
	add r4, r1, #0
	str r2, [sp, #0xc]
	ldr r0, [r4]
	mov r1, #3
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add r0, r4, #0
	bl ov03_02257134
	mov r0, #0xb
	bl GF_Camera_Create
	add r1, r4, #0
	add r1, #0x90
	str r0, [r1]
	add r1, r4, #0
	add r1, #0x90
	ldr r0, [r5, #0x24]
	ldr r1, [r1]
	bl sub_02023128
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl GF_Camera_RegisterToStaticPtr
	ldr r0, _02257130 ; =0x00000281
	mov r1, #0
	strb r1, [r4, r0]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02257130: .word 0x00000281
	thumb_func_end ov03_022570D4

	thumb_func_start ov03_02257134
ov03_02257134: ; 0x02257134
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r5, #0
	ldr r7, _02257178 ; =ov03_022594C6
	mov r6, #0
	add r4, #8
_02257140:
	ldr r0, _0225717C ; =0x00000283
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _02257160
	cmp r0, #3
	beq _02257160
	cmp r0, #4
	beq _02257160
	cmp r6, #1
	bne _02257160
	ldr r0, [r5]
	ldr r2, _02257180 ; =ov03_02259464
	add r1, r4, #0
	bl AddWindow
	b _0225716A
_02257160:
	ldr r0, [r5]
	add r1, r4, #0
	add r2, r7, #0
	bl AddWindow
_0225716A:
	add r6, r6, #1
	add r4, #0x10
	add r7, #8
	cmp r6, #6
	blo _02257140
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02257178: .word ov03_022594C6
_0225717C: .word 0x00000283
_02257180: .word ov03_02259464
	thumb_func_end ov03_02257134

	thumb_func_start ov03_02257184
ov03_02257184: ; 0x02257184
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x28
	mov r1, #1
	bl sub_0200E5D4
	mov r4, #0
	add r5, #8
_02257194:
	add r0, r5, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #6
	blo _02257194
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov03_02257184

	thumb_func_start ov03_022571AC
ov03_022571AC: ; 0x022571AC
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	add r4, r0, #0
	str r1, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r2, [r4]
	mov r0, #0x3c
	mov r3, #1
	bl GfGfxLoader_LoadCharData
	ldr r0, _02257258 ; =0x00000283
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _022571DA
	add r0, #0xfd
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _022571F4
_022571DA:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r2, [r4]
	mov r0, #0x3c
	mov r1, #2
	mov r3, #1
	bl GfGfxLoader_LoadScrnData
	b _0225720C
_022571F4:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r2, [r4]
	mov r0, #0x3c
	mov r1, #3
	mov r3, #1
	bl GfGfxLoader_LoadScrnData
_0225720C:
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0xb
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x3c
	mov r1, #1
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r3, #0xb
	str r3, [sp, #4]
	ldr r0, [r4]
	mov r1, #3
	mov r2, #0x1f
	bl LoadUserFrameGfx1
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r1, #3
	mov r2, #1
	mov r3, #0xa
	bl LoadUserFrameGfx2
	add sp, #0x10
	pop {r4, pc}
	nop
_02257258: .word 0x00000283
	thumb_func_end ov03_022571AC

	thumb_func_start ov03_0225725C
ov03_0225725C: ; 0x0225725C
	push {r4, lr}
	add r4, r0, #0
	bl GX_EngineAGetLayers
	mov r1, #0x9f
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4]
	mov r1, #0
	bl GetBgPriority
	mov r1, #0x9e
	lsl r1, r1, #2
	strb r0, [r4, r1]
	ldr r0, [r4]
	mov r1, #1
	bl GetBgPriority
	ldr r1, _022572E0 ; =0x00000279
	strb r0, [r4, r1]
	ldr r0, [r4]
	mov r1, #2
	bl GetBgPriority
	ldr r1, _022572E4 ; =0x0000027A
	strb r0, [r4, r1]
	ldr r0, [r4]
	mov r1, #3
	bl GetBgPriority
	ldr r1, _022572E8 ; =0x0000027B
	strb r0, [r4, r1]
	mov r0, #0
	mov r1, #3
	bl SetBgPriority
	mov r0, #1
	mov r1, #2
	bl SetBgPriority
	mov r0, #2
	mov r1, #1
	bl SetBgPriority
	mov r0, #3
	mov r1, #0
	bl SetBgPriority
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
	pop {r4, pc}
	nop
_022572E0: .word 0x00000279
_022572E4: .word 0x0000027A
_022572E8: .word 0x0000027B
	thumb_func_end ov03_0225725C

	thumb_func_start ov03_022572EC
ov03_022572EC: ; 0x022572EC
	push {r4, lr}
	mov r1, #0x9e
	add r4, r0, #0
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	mov r0, #0
	bl SetBgPriority
	ldr r1, _02257328 ; =0x00000279
	mov r0, #1
	ldrb r1, [r4, r1]
	bl SetBgPriority
	ldr r1, _0225732C ; =0x0000027A
	mov r0, #2
	ldrb r1, [r4, r1]
	bl SetBgPriority
	ldr r1, _02257330 ; =0x0000027B
	mov r0, #3
	ldrb r1, [r4, r1]
	bl SetBgPriority
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl GX_EngineASetLayers
	pop {r4, pc}
	nop
_02257328: .word 0x00000279
_0225732C: .word 0x0000027A
_02257330: .word 0x0000027B
	thumb_func_end ov03_022572EC

	thumb_func_start ov03_02257334
ov03_02257334: ; 0x02257334
	push {r4, lr}
	add r4, r1, #0
	bl ov01_021F6B10
	cmp r0, #1
	beq _02257344
	mov r0, #2
	pop {r4, pc}
_02257344:
	ldr r0, _02257374 ; =0x00000281
	mov r1, #0
	strb r1, [r4, r0]
	add r0, r4, #0
	bl ov03_022571AC
	add r0, r4, #0
	bl ov03_0225725C
	mov r1, #0x29
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov03_022573D4
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #3
	pop {r4, pc}
	nop
_02257374: .word 0x00000281
	thumb_func_end ov03_02257334

	thumb_func_start ov03_02257378
ov03_02257378: ; 0x02257378
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r2, #0
	beq _0225738A
	cmp r2, #1
	beq _022573C0
	cmp r2, #2
	pop {r3, r4, r5, pc}
_0225738A:
	mov r1, #0x22
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, #0x70
	ldr r1, [r4, r1]
	lsl r2, r1, #2
	ldr r1, _022573C4 ; =ov03_022594A0
	ldrb r1, [r1, r2]
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r1, _022573C8 ; =ov03_022594A1
	lsl r5, r5, #2
	ldrb r1, [r1, r5]
	ldr r0, [r4, r0]
	bl sub_0200DD08
	ldr r1, _022573CC ; =ov03_0225949E
	ldr r2, _022573D0 ; =ov03_0225949F
	mov r0, #0x22
	lsl r0, r0, #4
	ldrb r1, [r1, r5]
	ldrb r2, [r2, r5]
	ldr r0, [r4, r0]
	bl sub_0200DD88
_022573C0:
	pop {r3, r4, r5, pc}
	nop
_022573C4: .word ov03_022594A0
_022573C8: .word ov03_022594A1
_022573CC: .word ov03_0225949E
_022573D0: .word ov03_0225949F
	thumb_func_end ov03_02257378

	thumb_func_start ov03_022573D4
ov03_022573D4: ; 0x022573D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r3, #0x9a
	lsl r3, r3, #2
	add r4, r0, #0
	add r2, r3, #0
	ldr r0, [r4, r3]
	add r2, #0x28
	add r3, #9
	ldr r5, [r4, r2]
	ldrb r2, [r4, r3]
	add r2, r5, r2
	lsl r2, r2, #1
	ldrh r5, [r0, r2]
	cmp r1, #8
	bls _022573F6
	b _02257504
_022573F6:
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02257402: ; jump table
	.short _02257414 - _02257402 - 2 ; case 0
	.short _02257414 - _02257402 - 2 ; case 1
	.short _02257414 - _02257402 - 2 ; case 2
	.short _02257414 - _02257402 - 2 ; case 3
	.short _02257414 - _02257402 - 2 ; case 4
	.short _02257414 - _02257402 - 2 ; case 5
	.short _02257504 - _02257402 - 2 ; case 6
	.short _02257504 - _02257402 - 2 ; case 7
	.short _022574EA - _02257402 - 2 ; case 8
_02257414:
	add r0, r4, #0
	add r0, #0x18
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0x29
	lsl r2, r2, #4
	add r0, r2, #0
	sub r0, #0x1f
	ldrb r0, [r4, r0]
	ldr r1, [r4, r2]
	add r1, r1, r0
	add r0, r2, #0
	sub r0, #0x20
	ldrb r0, [r4, r0]
	cmp r1, r0
	bge _022574D4
	add r0, r2, #0
	sub r0, #0xd
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _0225744C
	add r0, r1, #0
	add r0, #0xfd
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02257460
_0225744C:
	mov r0, #0x82
	mov r1, #0xb
	bl String_ctor
	add r1, r5, #0
	mov r2, #0xb
	add r6, r0, #0
	bl GetItemDescIntoString
	b _022574AA
_02257460:
	cmp r1, #1
	bne _02257484
	mov r0, #0
	mov r1, #0x1b
	add r2, #0x51
	mov r3, #0xb
	bl NewMsgDataFromNarc
	add r1, r5, #0
	add r7, r0, #0
	add r1, #0x8a
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r7, #0
	bl DestroyMsgData
	b _022574AA
_02257484:
	mov r0, #0
	mov r1, #0x1b
	sub r2, #0xde
	mov r3, #0xb
	bl NewMsgDataFromNarc
	add r7, r0, #0
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_020910B8
	add r1, r0, #0
	add r0, r7, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r7, #0
	bl DestroyMsgData
_022574AA:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02257508 ; =0x000F0E00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x18
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	add r1, r5, #0
	bl ov03_022585A4
	b _022574DE
_022574D4:
	sub r2, #0x8c
	ldr r0, [r4, r2]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_022574DE:
	add r4, #0x18
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_022574EA:
	add r0, r4, #0
	add r0, #0x18
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _0225750C ; =0x0000FFFF
	add r0, r4, #0
	bl ov03_022585A4
	add r4, #0x18
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
_02257504:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02257508: .word 0x000F0E00
_0225750C: .word 0x0000FFFF
	thumb_func_end ov03_022573D4

	thumb_func_start ov03_02257510
ov03_02257510: ; 0x02257510
	push {r4, r5, r6, lr}
	ldr r1, _02257604 ; =gSystem
	mov r2, #0x40
	ldr r1, [r1, #0x48]
	add r5, r0, #0
	mov r4, #0
	tst r2, r1
	beq _02257538
	mov r0, #0x29
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	lsl r2, r1, #2
	ldr r1, _02257608 ; =ov03_0225947A
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	ldr r0, _0225760C ; =0x000005DC
	bl PlaySE
	add r4, r4, #1
	b _022575B0
_02257538:
	mov r2, #0x80
	tst r2, r1
	beq _02257556
	mov r0, #0x29
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	lsl r2, r1, #2
	ldr r1, _02257610 ; =ov03_0225947B
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	ldr r0, _0225760C ; =0x000005DC
	bl PlaySE
	add r4, r4, #1
	b _022575B0
_02257556:
	mov r2, #0x20
	tst r2, r1
	beq _02257584
	mov r2, #0x29
	lsl r2, r2, #4
	ldr r1, [r5, r2]
	ldr r3, _02257614 ; =ov03_0225947C
	lsl r6, r1, #2
	ldrb r3, [r3, r6]
	cmp r3, #6
	bne _02257574
	mov r1, #6
	bl ov03_0225761C
	pop {r4, r5, r6, pc}
_02257574:
	cmp r1, #8
	beq _022575B0
	ldr r0, _0225760C ; =0x000005DC
	str r3, [r5, r2]
	bl PlaySE
	add r4, r4, #1
	b _022575B0
_02257584:
	mov r2, #0x10
	tst r1, r2
	beq _022575B0
	mov r2, #0x29
	lsl r2, r2, #4
	ldr r1, [r5, r2]
	ldr r3, _02257618 ; =ov03_0225947D
	lsl r6, r1, #2
	ldrb r3, [r3, r6]
	cmp r3, #7
	bne _022575A2
	mov r1, #7
	bl ov03_0225761C
	pop {r4, r5, r6, pc}
_022575A2:
	cmp r1, #8
	beq _022575B0
	ldr r0, _0225760C ; =0x000005DC
	str r3, [r5, r2]
	bl PlaySE
	add r4, r4, #1
_022575B0:
	cmp r4, #0
	beq _022575CE
	mov r1, #0x29
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #0
	bl ov03_02257378
	mov r1, #0x29
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov03_022573D4
_022575CE:
	ldr r0, _02257604 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _022575EC
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r5, #0
	mov r1, #0xd
	mov r2, #0x10
	bl ov03_022586CC
	pop {r4, r5, r6, pc}
_022575EC:
	mov r0, #1
	tst r0, r1
	beq _02257600
	mov r1, #0x29
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov03_0225761C
	pop {r4, r5, r6, pc}
_02257600:
	mov r0, #3
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02257604: .word gSystem
_02257608: .word ov03_0225947A
_0225760C: .word 0x000005DC
_02257610: .word ov03_0225947B
_02257614: .word ov03_0225947C
_02257618: .word ov03_0225947D
	thumb_func_end ov03_02257510

	thumb_func_start ov03_0225761C
ov03_0225761C: ; 0x0225761C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	cmp r1, #8
	bhi _022576EA
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02257630: ; jump table
	.short _02257642 - _02257630 - 2 ; case 0
	.short _02257642 - _02257630 - 2 ; case 1
	.short _02257642 - _02257630 - 2 ; case 2
	.short _02257642 - _02257630 - 2 ; case 3
	.short _02257642 - _02257630 - 2 ; case 4
	.short _02257642 - _02257630 - 2 ; case 5
	.short _02257682 - _02257630 - 2 ; case 6
	.short _0225769C - _02257630 - 2 ; case 7
	.short _022576BC - _02257630 - 2 ; case 8
_02257642:
	ldr r3, _022576F0 ; =0x00000271
	ldrb r2, [r4, r3]
	add r5, r1, r2
	sub r2, r3, #1
	ldrb r2, [r4, r2]
	cmp r5, r2
	bhs _022576EA
	add r2, r3, #0
	add r2, #0x1f
	str r1, [r4, r2]
	add r3, #0x1f
	ldr r1, [r4, r3]
	mov r2, #0
	bl ov03_02257378
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x13
	bl Set2dSpriteAnimSeqNo
	ldr r0, _022576F4 ; =0x000005DC
	bl PlaySE
	mov r1, #0x29
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov03_022573D4
	mov r0, #6
	pop {r3, r4, r5, pc}
_02257682:
	ldr r0, _022576F0 ; =0x00000271
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _022576EA
	ldr r0, _022576F4 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0x13
	bl ov03_022586CC
	pop {r3, r4, r5, pc}
_0225769C:
	ldr r0, _022576F0 ; =0x00000271
	ldrb r1, [r4, r0]
	sub r0, r0, #1
	ldrb r0, [r4, r0]
	add r1, r1, #6
	cmp r1, r0
	bge _022576EA
	ldr r0, _022576F4 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #0x14
	bl ov03_022586CC
	pop {r3, r4, r5, pc}
_022576BC:
	mov r2, #0
	bl ov03_02257378
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #7
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #8
	bl ov03_022573D4
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0x10
	bl ov03_022586CC
	pop {r3, r4, r5, pc}
_022576EA:
	mov r0, #3
	pop {r3, r4, r5, pc}
	nop
_022576F0: .word 0x00000271
_022576F4: .word 0x000005DC
	thumb_func_end ov03_0225761C

	thumb_func_start ov03_022576F8
ov03_022576F8: ; 0x022576F8
	push {r4, lr}
	ldr r2, _02257724 ; =0x00000271
	add r4, r0, #0
	ldrb r1, [r4, r2]
	sub r1, r1, #6
	strb r1, [r4, r2]
	ldrb r1, [r4, r2]
	sub r2, r2, #1
	ldrb r2, [r4, r2]
	bl ov03_02257758
	mov r1, #0xa6
	mov r0, #1
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #8
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov03_022573D4
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_02257724: .word 0x00000271
	thumb_func_end ov03_022576F8

	thumb_func_start ov03_02257728
ov03_02257728: ; 0x02257728
	push {r4, lr}
	ldr r2, _02257754 ; =0x00000271
	add r4, r0, #0
	ldrb r1, [r4, r2]
	add r1, r1, #6
	strb r1, [r4, r2]
	ldrb r1, [r4, r2]
	sub r2, r2, #1
	ldrb r2, [r4, r2]
	bl ov03_02257758
	mov r1, #0xa6
	mov r0, #1
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #8
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov03_022573D4
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
_02257754: .word 0x00000271
	thumb_func_end ov03_02257728

	thumb_func_start ov03_02257758
ov03_02257758: ; 0x02257758
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r4, #0
	str r0, [sp]
	add r5, r0, #0
	lsl r0, r1, #1
	str r4, [sp, #8]
	sub r7, r2, r1
	str r0, [sp, #4]
_0225776A:
	cmp r7, #6
	ble _02257772
	mov r0, #6
	b _0225777C
_02257772:
	cmp r7, #0
	bge _0225777A
	mov r0, #0
	b _0225777C
_0225777A:
	add r0, r7, #0
_0225777C:
	cmp r4, r0
	bge _022577A8
	ldr r0, [sp]
	mov r3, #0x9a
	add r6, r0, #0
	lsl r3, r3, #2
	ldr r6, [r6, r3]
	ldr r3, [sp, #4]
	add r1, r4, #3
	add r6, r3, r6
	ldr r3, [sp, #8]
	add r2, r4, #2
	ldrh r3, [r3, r6]
	bl ov03_02258648
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _022577B4
_022577A8:
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_022577B4:
	ldr r0, [sp, #8]
	add r4, r4, #1
	add r0, r0, #2
	add r5, r5, #4
	str r0, [sp, #8]
	cmp r4, #6
	blt _0225776A
	ldr r0, [sp]
	mov r1, #0
	bl ov03_022582C0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov03_02257758

	thumb_func_start ov03_022577D0
ov03_022577D0: ; 0x022577D0
	push {r4, lr}
	add r4, r0, #0
	bl ov03_02257184
	ldr r0, [r4]
	mov r1, #1
	mov r2, #0
	bl BgFillTilemapBufferAndSchedule
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x11
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov03_022577D0

	thumb_func_start ov03_022577F4
ov03_022577F4: ; 0x022577F4
	push {r3, lr}
	sub r1, r1, #3
	cmp r1, #1
	bhi _02257808
	mov r1, #0x95
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl SavePokeathlon_GetAthletePoints
	pop {r3, pc}
_02257808:
	mov r1, #0x92
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl PlayerProfile_GetMoney
	pop {r3, pc}
	thumb_func_end ov03_022577F4

	thumb_func_start ov03_02257814
ov03_02257814: ; 0x02257814
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _02257870 ; =0x00000283
	add r5, r0, #0
	ldrb r0, [r5, r1]
	cmp r0, #3
	bne _02257840
	add r0, r1, #0
	add r2, r1, #0
	sub r1, #0x12
	add r2, #0xd
	sub r0, #0x2f
	ldrb r1, [r5, r1]
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	add r1, r2, r1
	bl sub_02031AB8
	cmp r0, #0
	beq _0225785E
	mov r0, #2
	pop {r3, r4, r5, pc}
_02257840:
	cmp r0, #4
	bne _0225785E
	add r2, r1, #1
	add r0, r1, #0
	sub r0, #0x2f
	ldrh r2, [r5, r2]
	sub r1, #0x8a
	ldr r0, [r5, r0]
	sub r1, r2, r1
	bl sub_02031A78
	cmp r0, #0
	beq _0225785E
	mov r0, #3
	pop {r3, r4, r5, pc}
_0225785E:
	mov r0, #0xa3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r4, r0
	bhs _0225786C
	mov r0, #1
	pop {r3, r4, r5, pc}
_0225786C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02257870: .word 0x00000283
	thumb_func_end ov03_02257814

	thumb_func_start ov03_02257874
ov03_02257874: ; 0x02257874
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl sub_020248B8
	mov r1, #0x91
	lsl r1, r1, #2
	strh r0, [r5, r1]
	sub r1, #0x48
	ldr r0, [r5, r1]
	bl sub_020248B8
	ldr r1, _0225793C ; =0x00000246
	strh r0, [r5, r1]
	sub r1, #0x4e
	ldr r0, [r5, r1]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	mov r1, #1
	bl ov03_022586BC
	mov r1, #0xa1
	lsl r1, r1, #2
	strh r4, [r5, r1]
	mov r2, #1
	add r0, r1, #2
	strh r2, [r5, r0]
	ldrh r1, [r5, r1]
	add r0, r5, #0
	bl ov03_02258120
	mov r1, #0xa3
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #9
	ldrb r1, [r5, r1]
	add r0, r5, #0
	bl ov03_022577F4
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov03_02257814
	cmp r0, #0
	beq _022578F2
	mov r0, #0xa6
	mov r1, #0xa
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #0xe
	pop {r3, r4, r5, pc}
_022578F2:
	mov r1, #0xa3
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r4, #0
	bl _u32_div_f
	mov r1, #0xa2
	lsl r1, r1, #2
	strh r0, [r5, r1]
	ldrh r0, [r5, r1]
	cmp r0, #0x63
	bls _0225790E
	mov r0, #0x63
	strh r0, [r5, r1]
_0225790E:
	ldr r0, _02257940 ; =0x00000283
	ldrb r0, [r5, r0]
	cmp r0, #1
	beq _02257920
	add r0, #0xfd
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02257928
_02257920:
	add r0, r5, #0
	bl ov03_02257CA0
	pop {r3, r4, r5, pc}
_02257928:
	add r0, r5, #0
	mov r1, #1
	bl ov03_022582C0
	mov r0, #0xa6
	mov r1, #2
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #5
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225793C: .word 0x00000246
_02257940: .word 0x00000283
	thumb_func_end ov03_02257874

	thumb_func_start ov03_02257944
ov03_02257944: ; 0x02257944
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xa
	lsl r0, r0, #6
	ldrb r0, [r4, r0]
	bl sub_0205B624
	cmp r0, #0
	bne _0225795A
	mov r0, #5
	pop {r4, pc}
_0225795A:
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #7
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov03_02257944

	thumb_func_start ov03_02257978
ov03_02257978: ; 0x02257978
	push {r4, lr}
	ldr r3, _022579D8 ; =0x00000283
	add r2, r0, #0
	ldrb r4, [r2, r3]
	cmp r4, #0
	beq _02257994
	cmp r4, #1
	beq _02257994
	add r0, r4, #0
	add r0, #0xfd
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _022579C0
_02257994:
	ldr r3, _022579DC ; =0x000001E5
	cmp r1, r3
	blt _022579AE
	add r0, r3, #6
	cmp r1, r0
	bgt _022579AE
	add r0, r3, #0
	add r0, #0x73
	ldr r0, [r2, r0]
	sub r1, r1, r3
	bl ApricornBox_CountApricorn
	pop {r4, pc}
_022579AE:
	mov r1, #0x93
	lsl r1, r1, #2
	ldr r0, [r2, r1]
	add r1, #0x38
	ldrh r1, [r2, r1]
	mov r2, #0xb
	bl Bag_GetQuantity
	pop {r4, pc}
_022579C0:
	cmp r4, #2
	bne _022579D4
	add r0, r3, #0
	add r1, r3, #1
	sub r0, #0x37
	ldrh r1, [r2, r1]
	ldr r0, [r2, r0]
	bl SealCase_CountSealOccurrenceAnywhere
	pop {r4, pc}
_022579D4:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_022579D8: .word 0x00000283
_022579DC: .word 0x000001E5
	thumb_func_end ov03_02257978

	thumb_func_start ov03_022579E0
ov03_022579E0: ; 0x022579E0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	add r0, #0x48
	mov r1, #1
	bl sub_0200E5D4
	add r0, r4, #0
	add r0, #0x38
	mov r1, #1
	bl sub_0200E5D4
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0xa6
	mov r1, #7
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, #0x58
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov03_02257CA0
	pop {r4, pc}
	thumb_func_end ov03_022579E0

	thumb_func_start ov03_02257A70
ov03_02257A70: ; 0x02257A70
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x48
	mov r1, #1
	bl sub_0200E5D4
	add r0, r4, #0
	add r0, #0x38
	mov r1, #1
	bl sub_0200E5D4
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0
	bl ov03_02258560
	mov r1, #0x7e
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x4c
	ldrh r1, [r4, r1]
	bl Set2dSpriteVisibleFlag
	mov r1, #0x7f
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x4a
	ldrh r1, [r4, r1]
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #0
	bl ov03_022586BC
	add r0, r4, #0
	mov r1, #0
	bl ov03_022582C0
	mov r0, #0xa6
	mov r1, #4
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, #0x6c
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #3
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov03_02257A70

	thumb_func_start ov03_02257ADC
ov03_02257ADC: ; 0x02257ADC
	push {r4, lr}
	ldr r1, _02257B3C ; =0x00000286
	add r4, r0, #0
	add r0, r4, r1
	add r1, r1, #2
	ldrh r1, [r4, r1]
	bl sub_020881C0
	cmp r0, #0
	beq _02257B02
	ldr r0, _02257B40 ; =0x00000637
	bl PlaySE
	mov r0, #0xa6
	mov r1, #6
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #7
	pop {r4, pc}
_02257B02:
	ldr r0, _02257B44 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02257B1E
	ldr r0, _02257B48 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #8
	bl ov03_022586CC
	pop {r4, pc}
_02257B1E:
	mov r0, #2
	tst r0, r1
	beq _02257B38
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #9
	bl ov03_022586CC
	pop {r4, pc}
_02257B38:
	mov r0, #7
	pop {r4, pc}
	.balign 4, 0
_02257B3C: .word 0x00000286
_02257B40: .word 0x00000637
_02257B44: .word gSystem
_02257B48: .word 0x000005DC
	thumb_func_end ov03_02257ADC

	thumb_func_start ov03_02257B4C
ov03_02257B4C: ; 0x02257B4C
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #5
	bhi _02257B76
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02257B60: ; jump table
	.short _02257B6C - _02257B60 - 2 ; case 0
	.short _02257BAC - _02257B60 - 2 ; case 1
	.short _02257BEA - _02257B60 - 2 ; case 2
	.short _02257C2A - _02257B60 - 2 ; case 3
	.short _02257C6A - _02257B60 - 2 ; case 4
	.short _02257C7C - _02257B60 - 2 ; case 5
_02257B6C:
	mov r0, #0xa2
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #0xa
	bhs _02257B78
_02257B76:
	b _02257C90
_02257B78:
	sub r0, r0, #2
	ldrsh r0, [r4, r0]
	mov r2, #0xa
	bl ov03_022587E8
	ldr r1, _02257C94 ; =0x00000286
	strh r0, [r4, r1]
	sub r1, #0x56
	ldr r0, [r4, r1]
	mov r1, #0
	bl sub_020249D4
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0xd
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02257C98 ; =0x00000637
	bl PlaySE
	mov r0, #0xa6
	mov r1, #6
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _02257C90
_02257BAC:
	mov r0, #0xa2
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #1
	beq _02257C90
	sub r0, r0, #2
	ldrsh r0, [r4, r0]
	mov r2, #1
	bl ov03_022587E8
	ldr r1, _02257C94 ; =0x00000286
	strh r0, [r4, r1]
	sub r1, #0x52
	ldr r0, [r4, r1]
	mov r1, #0
	bl sub_020249D4
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xd
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02257C98 ; =0x00000637
	bl PlaySE
	mov r0, #0xa6
	mov r1, #6
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _02257C90
_02257BEA:
	mov r0, #0xa2
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #0xa
	blo _02257C90
	sub r0, r0, #2
	ldrsh r0, [r4, r0]
	mov r2, #9
	mvn r2, r2
	bl ov03_022587E8
	ldr r1, _02257C94 ; =0x00000286
	strh r0, [r4, r1]
	sub r1, #0x4e
	ldr r0, [r4, r1]
	mov r1, #0
	bl sub_020249D4
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xf
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02257C98 ; =0x00000637
	bl PlaySE
	mov r0, #0xa6
	mov r1, #6
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _02257C90
_02257C2A:
	mov r0, #0xa2
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #1
	beq _02257C90
	sub r0, r0, #2
	ldrsh r0, [r4, r0]
	mov r2, #0
	mvn r2, r2
	bl ov03_022587E8
	ldr r1, _02257C94 ; =0x00000286
	strh r0, [r4, r1]
	sub r1, #0x4a
	ldr r0, [r4, r1]
	mov r1, #0
	bl sub_020249D4
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xf
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02257C98 ; =0x00000637
	bl PlaySE
	mov r0, #0xa6
	mov r1, #6
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _02257C90
_02257C6A:
	ldr r0, _02257C9C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #8
	bl ov03_022586CC
	pop {r4, pc}
_02257C7C:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #9
	bl ov03_022586CC
	pop {r4, pc}
_02257C90:
	mov r0, #7
	pop {r4, pc}
	.balign 4, 0
_02257C94: .word 0x00000286
_02257C98: .word 0x00000637
_02257C9C: .word 0x000005DC
	thumb_func_end ov03_02257B4C

	thumb_func_start ov03_02257CA0
ov03_02257CA0: ; 0x02257CA0
	push {r4, lr}
	ldr r2, _02257D64 ; =0x00000283
	add r4, r0, #0
	ldrb r0, [r4, r2]
	cmp r0, #0
	bne _02257CC2
	add r0, r2, #0
	add r1, r2, #1
	add r2, r2, #3
	sub r0, #0x37
	ldrh r1, [r4, r1]
	ldrh r2, [r4, r2]
	ldr r0, [r4, r0]
	mov r3, #0xb
	bl Bag_HasSpaceForItem
	b _02257D4C
_02257CC2:
	cmp r0, #1
	bne _02257CCA
	mov r0, #0
	b _02257D4C
_02257CCA:
	add r0, #0xfd
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02257D3A
	add r0, r2, #1
	ldrh r1, [r4, r0]
	add r0, r2, #0
	sub r0, #0x9e
	cmp r1, r0
	blo _02257D06
	add r0, r2, #0
	sub r0, #0x98
	cmp r1, r0
	bhi _02257D06
	add r0, r2, #0
	sub r0, #0x2b
	sub r2, #0x9e
	ldr r0, [r4, r0]
	sub r1, r1, r2
	bl ApricornBox_CountApricorn
	cmp r0, #0x63
	bne _02257D26
	mov r0, #0xa6
	mov r1, #0xc
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0xe
	pop {r4, pc}
_02257D06:
	mov r2, #0x93
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	add r2, #0x3a
	ldrh r2, [r4, r2]
	mov r3, #0xb
	bl Bag_HasSpaceForItem
	cmp r0, #0
	bne _02257D26
	mov r0, #0xa6
	mov r1, #0xc
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0xe
	pop {r4, pc}
_02257D26:
	add r0, r4, #0
	mov r1, #2
	bl ov03_022582C0
	mov r0, #0xa6
	mov r1, #3
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0xa
	pop {r4, pc}
_02257D3A:
	add r0, r2, #0
	add r1, r2, #1
	add r2, r2, #3
	sub r0, #0x37
	ldrh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, r0]
	bl SealCase_CheckSealQuantity
_02257D4C:
	cmp r0, #0
	bne _02257D60
	ldr r0, _02257D68 ; =0x00000286
	mov r1, #0
	strh r1, [r4, r0]
	mov r1, #0xb
	add r0, #0x12
	str r1, [r4, r0]
	mov r0, #0xd
	pop {r4, pc}
_02257D60:
	mov r0, #0xa
	pop {r4, pc}
	.balign 4, 0
_02257D64: .word 0x00000283
_02257D68: .word 0x00000286
	thumb_func_end ov03_02257CA0

	thumb_func_start ov03_02257D6C
ov03_02257D6C: ; 0x02257D6C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xa
	lsl r0, r0, #6
	ldrb r0, [r4, r0]
	bl sub_0205B624
	cmp r0, #0
	bne _02257D82
	mov r0, #0xa
	pop {r4, pc}
_02257D82:
	mov r0, #0xa6
	mov r1, #8
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0xb
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov03_02257D6C

	thumb_func_start ov03_02257D90
ov03_02257D90: ; 0x02257D90
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	beq _02257D9E
	cmp r1, #1
	beq _02257DAA
	b _02257DF2
_02257D9E:
	mov r0, #0xa6
	mov r1, #9
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0xc
	pop {r4, pc}
_02257DAA:
	add r0, #0x58
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0
	bl ov03_02258560
	mov r1, #0x7e
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x4c
	ldrh r1, [r4, r1]
	bl Set2dSpriteVisibleFlag
	mov r1, #0x7f
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x4a
	ldrh r1, [r4, r1]
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #0
	bl ov03_022586BC
	add r0, r4, #0
	mov r1, #0
	bl ov03_022582C0
	mov r0, #0xa6
	mov r1, #4
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
_02257DF2:
	mov r0, #0xb
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov03_02257D90

	thumb_func_start ov03_02257DF8
ov03_02257DF8: ; 0x02257DF8
	push {r4, lr}
	ldr r3, _02257E30 ; =0x00000283
	add r2, r0, #0
	ldrb r0, [r2, r3]
	add r0, #0xfd
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02257E18
	sub r3, #0x2f
	lsl r1, r1, #0x10
	ldr r0, [r2, r3]
	lsr r1, r1, #0x10
	bl SavePokeathlon_SubAthletePoints
	pop {r4, pc}
_02257E18:
	add r1, r3, #0
	add r1, #9
	ldr r4, [r2, r1]
	add r1, r3, #3
	add r0, r3, #0
	ldrsh r1, [r2, r1]
	sub r0, #0x3b
	ldr r0, [r2, r0]
	mul r1, r4
	bl PlayerProfile_SubMoney
	pop {r4, pc}
	.balign 4, 0
_02257E30: .word 0x00000283
	thumb_func_end ov03_02257DF8

	thumb_func_start ov03_02257E34
ov03_02257E34: ; 0x02257E34
	push {r3, lr}
	ldr r2, _02257E68 ; =0x000001E5
	add r3, r0, #0
	cmp r1, r2
	blt _02257E54
	add r0, r2, #6
	cmp r1, r0
	bgt _02257E54
	add r0, r2, #0
	add r0, #0x73
	ldr r0, [r3, r0]
	sub r1, r1, r2
	mov r2, #1
	bl ApricornBox_GiveApricorn
	pop {r3, pc}
_02257E54:
	mov r1, #0x93
	lsl r1, r1, #2
	ldr r0, [r3, r1]
	add r1, #0x38
	ldrh r1, [r3, r1]
	mov r2, #1
	mov r3, #0xb
	bl Bag_AddItem
	pop {r3, pc}
	.balign 4, 0
_02257E68: .word 0x000001E5
	thumb_func_end ov03_02257E34

	thumb_func_start ov03_02257E6C
ov03_02257E6C: ; 0x02257E6C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0xa
	lsl r0, r0, #6
	ldrb r0, [r4, r0]
	bl sub_0205B624
	cmp r0, #0
	bne _02257E82
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_02257E82:
	ldr r2, _02257F20 ; =0x00000283
	ldrb r0, [r4, r2]
	cmp r0, #0
	bne _02257EA0
	add r0, r2, #0
	add r1, r2, #1
	add r2, r2, #3
	sub r0, #0x37
	ldrh r1, [r4, r1]
	ldrh r2, [r4, r2]
	ldr r0, [r4, r0]
	mov r3, #0xb
	bl Bag_AddItem
	b _02257EF0
_02257EA0:
	cmp r0, #3
	bne _02257EC6
	add r1, r2, #1
	ldrh r1, [r4, r1]
	add r0, r4, #0
	bl ov03_02257E34
	mov r2, #0x95
	lsl r2, r2, #2
	add r1, r2, #0
	ldr r0, [r4, r2]
	add r1, #0x3c
	add r2, #0x1d
	ldr r3, [r4, r1]
	ldrb r1, [r4, r2]
	add r1, r3, r1
	bl sub_02031ACC
	b _02257EF0
_02257EC6:
	cmp r0, #4
	bne _02257EDE
	add r1, r2, #1
	add r0, r2, #0
	sub r0, #0x2f
	ldrh r1, [r4, r1]
	sub r2, #0x8a
	ldr r0, [r4, r0]
	sub r1, r1, r2
	bl sub_02031A98
	b _02257EF0
_02257EDE:
	add r0, r2, #0
	add r1, r2, #1
	add r2, r2, #3
	sub r0, #0x37
	ldrh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, r0]
	bl GiveOrTakeSeal
_02257EF0:
	mov r1, #0xa3
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	sub r1, r1, #6
	ldrsh r1, [r4, r1]
	add r0, r4, #0
	mul r1, r2
	bl ov03_02257DF8
	mov r3, #0x97
	lsl r3, r3, #2
	add r2, r3, #0
	ldr r0, [r4, r3]
	add r2, #0x30
	add r3, #0x2a
	ldr r5, [r4, r2]
	ldrsh r2, [r4, r3]
	mov r1, #0x24
	mul r2, r5
	bl GameStats_Add
	mov r0, #0xd
	pop {r3, r4, r5, pc}
	nop
_02257F20: .word 0x00000283
	thumb_func_end ov03_02257E6C

	thumb_func_start ov03_02257F24
ov03_02257F24: ; 0x02257F24
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xa
	lsl r0, r0, #6
	ldrb r0, [r4, r0]
	bl sub_0205B624
	cmp r0, #0
	bne _02257F3A
	mov r0, #0xd
	pop {r4, pc}
_02257F3A:
	ldr r0, _02257FEC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _02257F4C
	ldr r0, _02257FF0 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _02257FE6
_02257F4C:
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _02257F5E
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02066D80
_02257F5E:
	ldr r1, _02257FF4 ; =0x00000283
	ldrb r0, [r4, r1]
	cmp r0, #0
	bne _02257F9E
	add r0, r1, #1
	ldrh r0, [r4, r0]
	cmp r0, #4
	bne _02257F9E
	add r0, r1, #3
	ldrsh r0, [r4, r0]
	cmp r0, #0xa
	blt _02257F9E
	sub r1, #0x37
	ldr r0, [r4, r1]
	mov r1, #0xc
	mov r2, #1
	mov r3, #0xb
	bl Bag_AddItem
	cmp r0, #1
	bne _02257F9E
	mov r0, #0xa6
	mov r1, #0xd
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, #0x3c
	ldr r0, [r4, r0]
	mov r1, #0x33
	bl GameStats_Inc
	mov r0, #0xf
	pop {r4, pc}
_02257F9E:
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0
	bl ov03_02258560
	mov r1, #0x7e
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x4c
	ldrh r1, [r4, r1]
	bl Set2dSpriteVisibleFlag
	mov r1, #0x7f
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x4a
	ldrh r1, [r4, r1]
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #0
	bl ov03_022586BC
	add r0, r4, #0
	mov r1, #0
	bl ov03_022582C0
	mov r1, #0xa6
	mov r0, #4
	lsl r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
_02257FE6:
	mov r0, #0xd
	pop {r4, pc}
	nop
_02257FEC: .word gSystem
_02257FF0: .word gSystem + 0x40
_02257FF4: .word 0x00000283
	thumb_func_end ov03_02257F24

	thumb_func_start ov03_02257FF8
ov03_02257FF8: ; 0x02257FF8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xa
	lsl r0, r0, #6
	ldrb r0, [r4, r0]
	bl sub_0205B624
	cmp r0, #0
	bne _0225800E
	mov r0, #0xe
	pop {r4, pc}
_0225800E:
	ldr r0, _02258070 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _02258020
	ldr r0, _02258074 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _0225806A
_02258020:
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0
	bl ov03_02258560
	mov r1, #0x7e
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x4c
	ldrh r1, [r4, r1]
	bl Set2dSpriteVisibleFlag
	mov r1, #0x7f
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x4a
	ldrh r1, [r4, r1]
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #0
	bl ov03_022586BC
	add r0, r4, #0
	mov r1, #0
	bl ov03_022582C0
	mov r0, #0xa6
	mov r1, #5
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #4
	pop {r4, pc}
_0225806A:
	mov r0, #0xe
	pop {r4, pc}
	nop
_02258070: .word gSystem
_02258074: .word gSystem + 0x40
	thumb_func_end ov03_02257FF8

	thumb_func_start ov03_02258078
ov03_02258078: ; 0x02258078
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xa
	lsl r0, r0, #6
	ldrb r0, [r4, r0]
	bl sub_0205B624
	cmp r0, #0
	bne _0225808E
	mov r0, #0xf
	pop {r4, pc}
_0225808E:
	ldr r0, _022580F0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _022580A0
	ldr r0, _022580F4 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _022580EA
_022580A0:
	add r0, r4, #0
	add r0, #0x58
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0
	bl ov03_02258560
	mov r1, #0x7e
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x4c
	ldrh r1, [r4, r1]
	bl Set2dSpriteVisibleFlag
	mov r1, #0x7f
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x4a
	ldrh r1, [r4, r1]
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #0
	bl ov03_022586BC
	add r0, r4, #0
	mov r1, #0
	bl ov03_022582C0
	mov r0, #0xa6
	mov r1, #4
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #3
	pop {r4, pc}
_022580EA:
	mov r0, #0xf
	pop {r4, pc}
	nop
_022580F0: .word gSystem
_022580F4: .word gSystem + 0x40
	thumb_func_end ov03_02258078

	thumb_func_start ov03_022580F8
ov03_022580F8: ; 0x022580F8
	push {r3, r4, r5, lr}
	mov r4, #0
	cmp r2, #0
	ble _02258118
	add r5, r1, #0
_02258102:
	ldrh r3, [r5]
	cmp r0, r3
	bne _02258110
	lsl r0, r4, #2
	add r0, r1, r0
	ldrh r0, [r0, #2]
	pop {r3, r4, r5, pc}
_02258110:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r2
	blt _02258102
_02258118:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov03_022580F8

	thumb_func_start ov03_02258120
ov03_02258120: ; 0x02258120
	push {r3, lr}
	ldr r3, _02258160 ; =0x00000283
	add r2, r0, #0
	ldrb r0, [r2, r3]
	cmp r0, #0
	bne _02258138
	add r0, r1, #0
	mov r1, #0
	mov r2, #0xb
	bl GetItemAttr
	pop {r3, pc}
_02258138:
	cmp r0, #1
	bne _02258140
	mov r0, #0x64
	pop {r3, pc}
_02258140:
	add r0, #0xfd
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0225815C
	add r0, r1, #0
	add r1, r3, #0
	sub r1, #0x17
	sub r3, #0x13
	ldr r1, [r2, r1]
	ldrb r2, [r2, r3]
	bl ov03_022580F8
	pop {r3, pc}
_0225815C:
	mov r0, #0x64
	pop {r3, pc}
	.balign 4, 0
_02258160: .word 0x00000283
	thumb_func_end ov03_02258120

	thumb_func_start ov03_02258164
ov03_02258164: ; 0x02258164
	ldr r3, _0225816C ; =ov01_021F6A9C
	ldr r1, [r0, #0x1c]
	mov r2, #0
	bx r3
	.balign 4, 0
_0225816C: .word ov01_021F6A9C
	thumb_func_end ov03_02258164

	thumb_func_start ov03_02258170
ov03_02258170: ; 0x02258170
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021F6B10
	cmp r0, #0
	bne _0225818C
	add r0, r5, #0
	bl ov01_021F6B00
	cmp r0, #1
	beq _0225818C
	mov r0, #0x12
	pop {r3, r4, r5, pc}
_0225818C:
	ldr r0, _022581B8 ; =0x00000281
	mov r1, #0
	strb r1, [r4, r0]
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	ldr r1, [r5, #0x24]
	bl sub_02023128
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl sub_02023120
	ldr r0, [r5, #0x24]
	bl GF_Camera_RegisterToStaticPtr
	add r0, r4, #0
	bl ov03_02258288
	mov r0, #0x1b
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022581B8: .word 0x00000281
	thumb_func_end ov03_02258170

	thumb_func_start ov03_022581BC
ov03_022581BC: ; 0x022581BC
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0225827C ; =ov03_0225946C
	add r7, r0, #0
	add r0, #0x94
	mov r2, #0x13
	mov r3, #0xb
	bl ov01_021E7FDC
	add r0, r7, #0
	str r0, [sp]
	add r0, #0x94
	ldr r4, _02258280 ; =ov03_022594F8
	mov r6, #0
	add r5, r7, #0
	str r0, [sp]
_022581DA:
	ldr r0, [sp]
	add r1, r4, #0
	bl ov01_021E81F0
	mov r1, #0x7e
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r6, r6, #1
	add r4, #0x28
	add r5, r5, #4
	cmp r6, #0x13
	blo _022581DA
	add r0, r1, #0
	add r0, #0x34
	ldr r0, [r7, r0]
	mov r1, #1
	bl sub_02024A04
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r7, r0]
	mov r1, #1
	bl sub_02024A04
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r7, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r7, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r7, #0
	mov r1, #0
	bl ov03_022582C0
	mov r1, #0x29
	lsl r1, r1, #4
	ldr r1, [r7, r1]
	add r0, r7, #0
	mov r2, #0
	bl ov03_02257378
	ldr r2, _02258284 ; =0x00000271
	add r0, r7, #0
	ldrb r1, [r7, r2]
	sub r2, r2, #1
	ldrb r2, [r7, r2]
	bl ov03_02257758
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225827C: .word ov03_0225946C
_02258280: .word ov03_022594F8
_02258284: .word 0x00000271
	thumb_func_end ov03_022581BC

	thumb_func_start ov03_02258288
ov03_02258288: ; 0x02258288
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r7, #0x7e
	str r0, [sp]
	add r5, r0, #0
	add r6, r4, #0
	lsl r7, r7, #2
_02258296:
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02024758
	str r6, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x13
	blo _02258296
	ldr r0, [sp]
	add r0, #0x94
	bl ov01_021E8194
	ldr r0, [sp]
	mov r1, #0
	add r0, #0x94
	str r0, [sp]
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov03_02258288

	thumb_func_start ov03_022582C0
ov03_022582C0: ; 0x022582C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	cmp r1, #0
	beq _022582DA
	cmp r1, #1
	bne _022582D0
	b _022583F4
_022582D0:
	cmp r1, #2
	bne _022582D6
	b _022584F2
_022582D6:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_022582DA:
	ldr r4, _02258554 ; =ov03_022594F8
	mov r7, #0
	add r6, r5, #0
_022582E0:
	mov r0, #0xa4
	ldrsh r0, [r4, r0]
	lsl r0, r0, #0xc
	str r0, [sp, #0x18]
	mov r0, #0xa6
	ldrsh r0, [r4, r0]
	lsl r1, r0, #0xc
	mov r0, #3
	lsl r0, r0, #0x12
	add r0, r1, r0
	str r0, [sp, #0x1c]
	mov r0, #0xa8
	ldrsh r0, [r4, r0]
	add r1, sp, #0x18
	lsl r0, r0, #0xc
	str r0, [sp, #0x20]
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_020247D4
	add r7, r7, #1
	add r4, #0x28
	add r6, r6, #4
	cmp r7, #6
	blt _022582E0
	mov r7, #0x27
	ldr r4, _02258558 ; =ov03_02259850
	mov r6, #0
	lsl r7, r7, #4
_0225831C:
	ldrb r1, [r4, #1]
	cmp r1, #4
	bne _02258354
	ldr r0, _0225855C ; =0x00000271
	ldrb r0, [r5, r0]
	add r1, r0, #6
	ldrb r0, [r5, r7]
	cmp r1, r0
	ldrb r0, [r4]
	bge _02258342
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _022583D0
_02258342:
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _022583D0
_02258354:
	cmp r1, #3
	bne _02258386
	ldr r0, _0225855C ; =0x00000271
	ldrb r0, [r5, r0]
	cmp r0, #0
	ldrb r0, [r4]
	bne _02258374
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _022583D0
_02258374:
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _022583D0
_02258386:
	cmp r1, #5
	bne _022583C0
	ldr r0, _0225855C ; =0x00000271
	ldrb r0, [r5, r0]
	add r1, r0, r6
	mov r0, #0x27
	lsl r0, r0, #4
	ldrb r0, [r5, r0]
	cmp r1, r0
	ldrb r0, [r4]
	bge _022583AE
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _022583D0
_022583AE:
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _022583D0
_022583C0:
	ldrb r0, [r4]
	lsl r0, r0, #2
	add r2, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	bl Set2dSpriteVisibleFlag
_022583D0:
	add r6, r6, #1
	add r4, r4, #3
	cmp r6, #0xf
	blo _0225831C
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020249D4
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_022583F4:
	mov r7, #0x56
	ldr r4, _02258558 ; =ov03_02259850
	mov r6, #0
	lsl r7, r7, #0xc
_022583FC:
	ldrb r1, [r4, #2]
	cmp r1, #2
	bne _02258452
	mov r0, #0x29
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, r6
	bne _0225843E
	mov r0, #0x43
	lsl r0, r0, #0xe
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	ldrb r0, [r4]
	str r7, [sp, #0xc]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0xc
	bl sub_020247D4
	ldrb r0, [r4]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _022584CE
_0225843E:
	ldrb r0, [r4]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _022584CE
_02258452:
	ldrb r0, [r4]
	cmp r0, #0xe
	beq _0225845C
	cmp r0, #0x10
	bne _0225848A
_0225845C:
	mov r1, #0xa2
	lsl r1, r1, #2
	ldrh r1, [r5, r1]
	cmp r1, #0xa
	bhs _02258478
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _022584CE
_02258478:
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _022584CE
_0225848A:
	cmp r0, #0xf
	beq _02258492
	cmp r0, #0x11
	bne _022584C0
_02258492:
	mov r1, #0xa2
	lsl r1, r1, #2
	ldrh r1, [r5, r1]
	cmp r1, #1
	bne _022584AE
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _022584CE
_022584AE:
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _022584CE
_022584C0:
	lsl r0, r0, #2
	add r2, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	bl Set2dSpriteVisibleFlag
_022584CE:
	add r6, r6, #1
	add r4, r4, #3
	cmp r6, #0xf
	blo _022583FC
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_020249D4
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x1a
	bl Set2dSpriteAnimSeqNo
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_022584F2:
	mov r7, #0x56
	ldr r4, _02258558 ; =ov03_02259850
	mov r6, #0
	lsl r7, r7, #0xc
_022584FA:
	mov r0, #0x29
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, r6
	bne _02258536
	mov r0, #0x43
	lsl r0, r0, #0xe
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldrb r0, [r4]
	str r7, [sp]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	bl sub_020247D4
	ldrb r0, [r4]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _02258548
_02258536:
	ldrb r0, [r4]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_02258548:
	add r6, r6, #1
	add r4, r4, #3
	cmp r6, #0xf
	blo _022584FA
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02258554: .word ov03_022594F8
_02258558: .word ov03_02259850
_0225855C: .word 0x00000271
	thumb_func_end ov03_022582C0

	thumb_func_start ov03_02258560
ov03_02258560: ; 0x02258560
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	bne _02258586
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xb1
	mov r2, #8
	bl sub_0200DD88
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xb1
	mov r2, #0x84
	bl sub_0200DD88
	pop {r4, pc}
_02258586:
	mov r0, #0x7e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xa2
	mov r2, #0x6c
	bl sub_0200DD88
	mov r0, #0x7f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xa2
	mov r2, #0x84
	bl sub_0200DD88
	pop {r4, pc}
	thumb_func_end ov03_02258560

	thumb_func_start ov03_022585A4
ov03_022585A4: ; 0x022585A4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _02258644 ; =0x00000283
	add r6, r1, #0
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _022585CA
	cmp r1, #3
	beq _022585CA
	cmp r1, #4
	beq _022585CA
	sub r0, #0x7f
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add sp, #8
	pop {r4, r5, r6, pc}
_022585CA:
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl Get2DGfxResObjById
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #1
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r5, #0
	mov r2, #0x12
	bl ReplaceCharResObjFromNarc
	add r0, r5, #0
	bl sub_0200AE8C
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Get2DGfxResObjById
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #2
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r5, #0
	mov r2, #0x12
	bl ReplacePlttResObjFromNarc
	add r0, r5, #0
	bl sub_0200B084
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02258644: .word 0x00000283
	thumb_func_end ov03_022585A4

	thumb_func_start ov03_02258648
ov03_02258648: ; 0x02258648
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r6, r3, #0
	add r7, r2, #0
	bl Get2DGfxResObjById
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #1
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r5, #0
	mov r2, #0x12
	bl ReplaceCharResObjFromNarc
	add r0, r5, #0
	bl sub_0200AE8C
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r7, #0
	bl Get2DGfxResObjById
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #2
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r5, #0
	mov r2, #0x12
	bl ReplacePlttResObjFromNarc
	add r0, r5, #0
	bl sub_0200B084
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov03_02258648

	thumb_func_start ov03_022586BC
ov03_022586BC: ; 0x022586BC
	mov r2, #2
	lsl r2, r2, #8
	ldr r3, _022586C8 ; =sub_0200DD08
	ldr r0, [r0, r2]
	bx r3
	nop
_022586C8: .word sub_0200DD08
	thumb_func_end ov03_022586BC

	thumb_func_start ov03_022586CC
ov03_022586CC: ; 0x022586CC
	mov r3, #0xa7
	lsl r3, r3, #2
	add r3, r0, r3
	strb r1, [r3]
	mov r0, #0
	strb r0, [r3, #1]
	strb r0, [r3, #2]
	strb r2, [r3, #3]
	mov r0, #0x15
	bx lr
	thumb_func_end ov03_022586CC

	thumb_func_start ov03_022586E0
ov03_022586E0: ; 0x022586E0
	push {r4, lr}
	mov r1, #0xa7
	lsl r1, r1, #2
	add r4, r0, r1
	ldrb r2, [r4, #1]
	cmp r2, #0
	beq _022586F8
	cmp r2, #1
	beq _02258710
	cmp r2, #2
	beq _02258738
	b _02258748
_022586F8:
	ldrb r2, [r4]
	sub r1, #0xa4
	lsl r2, r2, #2
	add r0, r0, r2
	ldr r0, [r0, r1]
	mov r1, #7
	bl sub_0200DD08
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	b _02258748
_02258710:
	ldrb r2, [r4, #2]
	add r2, r2, #1
	strb r2, [r4, #2]
	ldrb r2, [r4, #2]
	cmp r2, #4
	bne _02258748
	ldrb r2, [r4]
	sub r1, #0xa4
	lsl r2, r2, #2
	add r0, r0, r2
	ldr r0, [r0, r1]
	mov r1, #6
	bl sub_0200DD08
	mov r0, #0
	strb r0, [r4, #2]
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	b _02258748
_02258738:
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	ldrb r0, [r4, #2]
	cmp r0, #2
	bne _02258748
	ldrb r0, [r4, #3]
	pop {r4, pc}
_02258748:
	mov r0, #0x15
	pop {r4, pc}
	thumb_func_end ov03_022586E0

	thumb_func_start ov03_0225874C
ov03_0225874C: ; 0x0225874C
	push {r4, lr}
	mov r0, #0
	add r4, r1, #0
	bl ov01_021E636C
	ldr r0, _02258760 ; =0x00000272
	mov r1, #0x17
	strb r1, [r4, r0]
	pop {r4, pc}
	nop
_02258760: .word 0x00000272
	thumb_func_end ov03_0225874C

	thumb_func_start ov03_02258764
ov03_02258764: ; 0x02258764
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _022587C2
	add r0, r6, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	ldr r1, _022587C8 ; =ov03_022597F0
	mov r2, #0xb
	bl CreateBagView
	str r0, [r4, #4]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp]
	add r3, r5, #0
	add r3, #0x94
	ldr r0, [r4, #4]
	ldr r1, [r5, #0xc]
	ldr r3, [r3]
	mov r2, #2
	bl sub_0207789C
	ldr r1, [r4, #4]
	add r0, r5, #0
	bl sub_0203E3D4
	ldr r1, _022587CC ; =sub_02092B04
	add r0, r6, #0
	add r2, r4, #0
	bl TaskManager_Jump
	ldr r0, _022587D0 ; =0x00000272
	mov r1, #0x18
	strb r1, [r4, r0]
_022587C2:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_022587C8: .word ov03_022597F0
_022587CC: .word sub_02092B04
_022587D0: .word 0x00000272
	thumb_func_end ov03_02258764

	thumb_func_start ov03_022587D4
ov03_022587D4: ; 0x022587D4
	push {r3, lr}
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _022587E2
	mov r0, #0x1a
	pop {r3, pc}
_022587E2:
	mov r0, #0x1b
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov03_022587D4

	thumb_func_start ov03_022587E8
ov03_022587E8: ; 0x022587E8
	cmp r2, #0
	ble _022587FE
	cmp r0, r1
	bne _022587F4
	mov r0, #1
	bx lr
_022587F4:
	add r0, r0, r2
	cmp r0, r1
	ble _0225880E
	add r0, r1, #0
	bx lr
_022587FE:
	cmp r0, #1
	bne _02258806
	add r0, r1, #0
	bx lr
_02258806:
	add r0, r0, r2
	cmp r0, #0
	bgt _0225880E
	mov r0, #1
_0225880E:
	bx lr
	thumb_func_end ov03_022587E8

	thumb_func_start ov03_02258810
ov03_02258810: ; 0x02258810
	str r0, [r1]
	bx lr
	thumb_func_end ov03_02258810

	thumb_func_start ov03_02258814
ov03_02258814: ; 0x02258814
	ldr r3, _02258820 ; =sub_0203410C
	add r2, r0, #0
	ldr r0, _02258824 ; =ov03_022597FC
	mov r1, #1
	bx r3
	nop
_02258820: .word sub_0203410C
_02258824: .word ov03_022597FC
	thumb_func_end ov03_02258814

	thumb_func_start ov03_02258828
ov03_02258828: ; 0x02258828
	mov r0, #0xba
	lsl r0, r0, #2
	bx lr
	.balign 4, 0
	thumb_func_end ov03_02258828

	thumb_func_start ov03_02258830
ov03_02258830: ; 0x02258830
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #2
	blt _0225883E
	bl GF_AssertFail
_0225883E:
	mov r0, #0xba
	lsl r0, r0, #2
	add r4, #8
	mul r0, r5
	add r0, r4, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov03_02258830

	thumb_func_start ov03_0225884C
ov03_0225884C: ; 0x0225884C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r2, #0
	add r4, r3, #0
	bl sub_0203769C
	cmp r5, r0
	beq _02258876
	ldr r0, [r4, #4]
	mov r1, #1
	add r2, r6, #0
	bl SafariZone_SetAreaSet
	add r0, r5, #0
	bl sub_02034818
	add r1, r0, #0
	ldr r0, [r4, #4]
	mov r2, #0xb
	bl SafariZone_SetLinkLeaderFromProfile
_02258876:
	pop {r4, r5, r6, pc}
	thumb_func_end ov03_0225884C

	thumb_func_start ov03_02258878
ov03_02258878: ; 0x02258878
	push {r4, lr}
	ldr r1, _02258890 ; =0x000005D8
	mov r0, #0xb
	bl AllocFromHeapAtEnd
	ldr r2, _02258890 ; =0x000005D8
	mov r1, #0
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02258890: .word 0x000005D8
	thumb_func_end ov03_02258878

	thumb_func_start ov03_02258894
ov03_02258894: ; 0x02258894
	push {r3, lr}
	bl TaskManager_GetEnv
	ldr r1, [r0]
	cmp r1, #0
	bne _022588A8
	bl FreeToHeap
	mov r0, #1
	pop {r3, pc}
_022588A8:
	blx r1
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov03_02258894

	thumb_func_start ov03_022588B0
ov03_022588B0: ; 0x022588B0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xd
	bl sub_02037B38
	cmp r0, #0
	beq _022588D2
	bl sub_0203769C
	mov r1, #1
	sub r0, r1, r0
	bl sub_02034818
	mov r0, #0
	add r1, r4, #0
	bl ov03_02258810
_022588D2:
	pop {r4, pc}
	thumb_func_end ov03_022588B0

	thumb_func_start ov03_022588D4
ov03_022588D4: ; 0x022588D4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xc
	bl sub_02037B38
	cmp r0, #0
	beq _0225890A
	mov r0, #1
	bl sub_02034818
	cmp r0, #0
	beq _0225890A
	ldr r0, [r4, #4]
	mov r1, #0
	bl SafariZone_GetAreaSet
	add r1, r0, #0
	mov r0, #0x16
	bl sub_020376D4
	mov r0, #0xd
	bl sub_02037AC0
	ldr r0, _0225890C ; =ov03_022588B0
	add r1, r4, #0
	bl ov03_02258810
_0225890A:
	pop {r4, pc}
	.balign 4, 0
_0225890C: .word ov03_022588B0
	thumb_func_end ov03_022588D4

	thumb_func_start ov03_02258910
ov03_02258910: ; 0x02258910
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov03_02258878
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_SafariZone_get
	str r0, [r4, #4]
	add r0, r4, #0
	bl ov03_02258814
	mov r0, #0xc
	bl sub_02037AC0
	ldr r0, _02258944 ; =ov03_022588D4
	add r1, r4, #0
	bl ov03_02258810
	ldr r0, [r5, #0x10]
	ldr r1, _02258948 ; =ov03_02258894
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	nop
_02258944: .word ov03_022588D4
_02258948: .word ov03_02258894
	thumb_func_end ov03_02258910

	thumb_func_start ScrCmd_716
ScrCmd_716: ; 0x0225894C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0203EB08
	str r0, [r4]
	ldr r1, _02258974 ; =ScrNative_WaitApplication_DestroyTaskData
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02258974: .word ScrNative_WaitApplication_DestroyTaskData
	thumb_func_end ScrCmd_716

	thumb_func_start ScrCmd_717
ScrCmd_717: ; 0x02258978
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r1, r0, #0
	ldr r0, [r4, #0x74]
	bl sub_02097720
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ScrCmd_717

	thumb_func_start ScrCmd_718
ScrCmd_718: ; 0x02258998
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	ldr r1, [r5, #8]
	add r6, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	ldrb r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r2, r0, #0
	lsl r2, r2, #0x18
	ldr r0, [r6]
	add r1, r4, #0
	lsr r2, r2, #0x18
	bl BufferSafariZoneObjectName
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_718

	thumb_func_start ScrCmd_719
ScrCmd_719: ; 0x022589D4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r6, [r0]
	mov r1, #0x10
	add r0, r6, #0
	bl FieldSysGetAttrAddr
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r1, r0, #0
	add r0, r6, #0
	bl ov02_0224E754
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_719

	thumb_func_start ScrCmd_720
ScrCmd_720: ; 0x02258A18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r4, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0x10
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	str r0, [sp]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r4, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	add r6, r0, #0
	add r0, r4, #0
	bl GetDeltaXByFacingDirection
	add r7, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	str r0, [sp, #0x14]
	add r0, r4, #0
	bl GetDeltaYByFacingDirection
	add r2, r6, r7
	sub r2, #0x20
	asr r1, r2, #4
	lsr r1, r1, #0x1b
	add r1, r2, r1
	ldr r2, [sp, #0x14]
	asr r1, r1, #5
	add r2, r2, r0
	sub r2, #0x20
	asr r0, r2, #4
	lsr r0, r0, #0x1b
	add r0, r2, r0
	asr r2, r0, #5
	lsl r0, r2, #1
	add r0, r2, r0
	add r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	bl Save_SafariZone_get
	mov r1, #0
	bl SafariZone_GetAreaSet
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x2c]
	bl ov01_021F6320
	add r4, r0, #0
	lsl r0, r4, #0x18
	ldr r1, [r5, #0x2c]
	lsr r0, r0, #0x18
	add r2, sp, #0x20
	bl ov01_021F630C
	lsl r1, r4, #0x18
	ldr r0, [r5, #0x2c]
	lsr r1, r1, #0x18
	bl ov01_021F65E4
	str r0, [sp, #8]
	lsl r1, r4, #0x18
	ldr r0, [r5, #0x2c]
	lsr r1, r1, #0x18
	bl ov01_021F65F0
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	mov r1, #0x7a
	mul r1, r0
	ldr r0, [sp, #0xc]
	add r0, r0, r1
	add r1, r0, #2
	ldr r0, [sp]
	lsl r0, r0, #2
	add r4, r1, r0
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	add r2, r0, #0
	lsl r2, r2, #0x18
	ldrb r1, [r4]
	add r0, sp, #0x1c
	lsr r2, r2, #0x18
	bl sub_02097268
	ldrb r0, [r4, #3]
	mov ip, r0
	add r0, sp, #0x1c
	ldrb r0, [r0, #1]
	lsl r0, r0, #0x19
	lsr r1, r0, #0x1d
	mov r0, ip
	sub r1, r0, r1
	mov r0, ip
	cmp r0, r1
	ble _02258B54
	mov r0, ip
	lsl r6, r0, #5
_02258B02:
	add r7, sp, #0x1c
	ldrb r0, [r7, #1]
	ldrb r1, [r4, #1]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1d
	add r0, r1, r0
	cmp r1, r0
	bge _02258B3A
	ldr r0, [sp, #4]
	lsl r3, r6, #1
	add r0, r0, r6
	add r2, r0, r1
	ldr r0, [sp, #8]
	add r3, r0, r3
	lsl r0, r1, #1
	add r3, r3, r0
_02258B22:
	ldrb r0, [r2]
	add r1, r1, #1
	add r2, r2, #1
	strh r0, [r3]
	ldrb r5, [r7, #1]
	ldrb r0, [r4, #1]
	add r3, r3, #2
	lsl r5, r5, #0x1c
	lsr r5, r5, #0x1d
	add r0, r0, r5
	cmp r1, r0
	blt _02258B22
_02258B3A:
	add r1, sp, #0x1c
	mov r0, ip
	ldrb r1, [r1, #1]
	sub r0, r0, #1
	mov ip, r0
	lsl r1, r1, #0x19
	ldrb r0, [r4, #3]
	lsr r1, r1, #0x1d
	sub r6, #0x20
	sub r1, r0, r1
	mov r0, ip
	cmp r0, r1
	bgt _02258B02
_02258B54:
	mov r5, #0
_02258B56:
	lsl r1, r5, #0x18
	ldr r0, [sp, #0x20]
	lsr r1, r1, #0x18
	bl ov01_021F3B44
	str r0, [sp, #0x18]
	bl ov01_021F3B30
	cmp r0, #0
	beq _02258BC0
	ldr r1, [sp, #0x18]
	add r0, sp, #0x24
	bl ov01_021F3B0C
	ldr r0, [sp, #0x2c]
	ldrb r2, [r4, #1]
	asr r1, r0, #0xc
	add r1, #0xf8
	asr r0, r1, #3
	lsr r0, r0, #0x1c
	add r0, r1, r0
	lsl r0, r0, #0xc
	asr r3, r0, #0x10
	ldr r0, [sp, #0x24]
	asr r1, r0, #0xc
	add r1, #0xf8
	asr r0, r1, #3
	lsr r0, r0, #0x1c
	add r0, r1, r0
	lsl r0, r0, #0xc
	asr r1, r0, #0x10
	cmp r1, r2
	blt _02258BC0
	ldrb r0, [r4, #3]
	cmp r3, r0
	bgt _02258BC0
	add r6, sp, #0x1c
	ldrb r7, [r6, #1]
	lsl r6, r7, #0x1c
	lsr r6, r6, #0x1d
	add r2, r2, r6
	cmp r1, r2
	bge _02258BC0
	lsl r1, r7, #0x19
	lsr r1, r1, #0x1d
	sub r0, r0, r1
	cmp r3, r0
	ble _02258BC0
	ldr r0, [sp, #0x18]
	mov r1, #1
	bl ov01_021F3B2C
	b _02258BC6
_02258BC0:
	add r5, r5, #1
	cmp r5, #0x20
	blt _02258B56
_02258BC6:
	ldr r2, [sp]
	ldr r0, [sp, #0xc]
	lsl r2, r2, #0x18
	ldr r1, [sp, #0x10]
	lsr r2, r2, #0x18
	bl SafariZone_RemoveObjectFromArea
	mov r0, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_720

	thumb_func_start ScrCmd_721
ScrCmd_721: ; 0x02258BDC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	bl ov02_0224E698
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_721

	thumb_func_start ScrCmd_791
ScrCmd_791: ; 0x02258C00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r2, _02258CD4 ; =ov03_02259808
	add r1, sp, #0x14
	ldrh r3, [r2]
	ldrh r2, [r2, #2]
	add r5, r0, #0
	strh r3, [r1]
	strh r2, [r1, #2]
	add r1, r5, #0
	add r1, #0x80
	ldr r2, [r5, #8]
	ldr r4, [r1]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	str r1, [sp, #8]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	str r0, [sp]
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [sp, #4]
	bl GetPartyCount
	add r6, r0, #0
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerID
	str r0, [sp, #0xc]
	ldr r0, _02258CD8 ; =0x00000165
	bl MapHeader_GetMapSec
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	mov r5, #0
	cmp r6, #0
	ble _02258CCA
	ldr r0, [sp, #8]
	lsl r0, r0, #1
	str r0, [sp, #0x10]
_02258C62:
	ldr r0, [sp, #4]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _02258CC4
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0xc]
	cmp r1, r0
	bne _02258CC4
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x10]
	add r2, sp, #0x14
	ldrh r1, [r2, r1]
	cmp r1, r0
	bne _02258CC4
	add r0, r4, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02258CC4
	add r0, r4, #0
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	cmp r7, r0
	bne _02258CC4
	ldr r0, [sp]
	mov r1, #1
	strh r1, [r0]
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02258CC4:
	add r5, r5, #1
	cmp r5, r6
	blt _02258C62
_02258CCA:
	ldr r1, [sp]
	mov r0, #0
	strh r0, [r1]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02258CD4: .word ov03_02259808
_02258CD8: .word 0x00000165
	thumb_func_end ScrCmd_791

	thumb_func_start ScrCmd_792
ScrCmd_792: ; 0x02258CDC
	push {r3, r4, r5, lr}
	add r0, #0x80
	ldr r5, [r0]
	ldr r0, [r5, #0xc]
	bl Save_SafariZone_get
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetIGTAddr
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0202F784
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_792

	thumb_func_start ov03_02258CFC
ov03_02258CFC: ; 0x02258CFC
	push {r4, r5, r6, lr}
	add r6, r1, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x40
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	str r0, [r4]
	str r6, [r4, #4]
	ldr r0, [r5, #8]
	str r0, [r4, #0xc]
	str r5, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Save_Pokeathlon_get
	str r0, [r4, #0x20]
	bl sub_0203199C
	str r0, [r4, #0x24]
	ldr r0, [r5, #0x10]
	ldr r1, _02258D38 ; =ov03_02258D3C
	add r2, r4, #0
	bl TaskManager_Call
	pop {r4, r5, r6, pc}
	nop
_02258D38: .word ov03_02258D3C
	thumb_func_end ov03_02258CFC

	thumb_func_start ov03_02258D3C
ov03_02258D3C: ; 0x02258D3C
	push {r4, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _02258D58
	cmp r1, #1
	beq _02258D6C
	b _02258D84
_02258D58:
	bl ov03_02258DE8
	ldr r1, [r4, #4]
	add r0, r4, #0
	bl ov03_02258EE8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02258D84
_02258D6C:
	bl ov03_02258D88
	cmp r0, #0
	beq _02258D84
	add r0, r4, #0
	bl ov03_02258E88
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, pc}
_02258D84:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov03_02258D3C

	thumb_func_start ov03_02258D88
ov03_02258D88: ; 0x02258D88
	push {r4, lr}
	add r4, r0, #0
	bl System_GetTouchNew
	cmp r0, #0
	beq _02258DAC
	ldr r0, _02258DDC ; =0x000005DD
	bl PlaySE
	mov r0, #0x43
	ldr r1, [r4, #8]
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #1
	bl sub_02018410
	mov r0, #1
	pop {r4, pc}
_02258DAC:
	ldr r0, _02258DE0 ; =gSystem
	ldr r1, [r0, #0x48]
	ldr r0, _02258DE4 ; =0x00000CF3
	tst r0, r1
	beq _02258DC4
	mov r0, #0x43
	ldr r1, [r4, #8]
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #0
	bl sub_02018410
_02258DC4:
	ldr r0, _02258DE0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _02258DD8
	ldr r0, _02258DDC ; =0x000005DD
	bl PlaySE
	mov r0, #1
	pop {r4, pc}
_02258DD8:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02258DDC: .word 0x000005DD
_02258DE0: .word gSystem
_02258DE4: .word 0x00000CF3
	thumb_func_end ov03_02258D88

	thumb_func_start ov03_02258DE8
ov03_02258DE8: ; 0x02258DE8
	push {r3, r4, lr}
	sub sp, #0x14
	mov r1, #1
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r0, #0x16
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4, #0xc]
	add r1, #0x10
	mov r2, #3
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	ldr r2, _02258E84 ; =0x000003D9
	mov r1, #3
	mov r3, #0xb
	bl LoadUserFrameGfx1
	add r0, r4, #0
	ldr r2, _02258E84 ; =0x000003D9
	add r0, #0x10
	mov r1, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add r0, r4, #0
	add r0, #0x10
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r1, #0x1b
	add r2, r1, #0
	mov r0, #0
	add r2, #0xfa
	mov r3, #4
	bl NewMsgDataFromNarc
	str r0, [r4, #0x28]
	mov r0, #3
	mov r1, #0x10
	mov r2, #4
	bl ScrStrBufs_new_custom
	str r0, [r4, #0x2c]
	mov r0, #0x80
	mov r1, #4
	bl String_ctor
	str r0, [r4, #0x30]
	mov r0, #0x80
	mov r1, #4
	bl String_ctor
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x28]
	mov r1, #1
	bl NewString_ReadMsgData
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x28]
	mov r1, #3
	bl NewString_ReadMsgData
	str r0, [r4, #0x3c]
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_02258E84: .word 0x000003D9
	thumb_func_end ov03_02258DE8

	thumb_func_start ov03_02258E88
ov03_02258E88: ; 0x02258E88
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl String_dtor
	ldr r0, [r4, #0x38]
	bl String_dtor
	ldr r0, [r4, #0x34]
	bl String_dtor
	ldr r0, [r4, #0x30]
	bl String_dtor
	ldr r0, [r4, #0x2c]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x28]
	bl DestroyMsgData
	add r0, r4, #0
	add r0, #0x10
	mov r1, #1
	bl sub_0200E5D4
	add r0, r4, #0
	add r0, #0x10
	bl RemoveWindow
	ldr r0, [r4, #0xc]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	pop {r4, pc}
	thumb_func_end ov03_02258E88

	thumb_func_start ov03_02258ECC
ov03_02258ECC: ; 0x02258ECC
	push {r3, lr}
	ldr r2, _02258EE4 ; =ov03_02259880
	ldrb r1, [r2, r1]
	cmp r1, #0
	bne _02258EDA
	mov r0, #1
	pop {r3, pc}
_02258EDA:
	ldr r0, [r0, #0x20]
	sub r1, r1, #1
	bl sub_02031A78
	pop {r3, pc}
	.balign 4, 0
_02258EE4: .word ov03_02259880
	thumb_func_end ov03_02258ECC

	thumb_func_start ov03_02258EE8
ov03_02258EE8: ; 0x02258EE8
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _02258F44 ; =ov03_0225980C
	add r6, r0, #0
	lsl r0, r1, #2
	str r0, [sp]
	ldr r0, [r2, r0]
	mov r7, #0
	cmp r0, #0
	ble _02258F32
	mov r0, #0xa
	add r4, r1, #0
	mul r4, r0
	mov r5, #8
_02258F02:
	add r0, r6, #0
	add r1, r4, #0
	bl ov03_02258ECC
	cmp r0, #0
	beq _02258F1A
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl ov03_02258F8C
	b _02258F22
_02258F1A:
	add r0, r6, #0
	add r1, r5, #0
	bl ov03_02258F48
_02258F22:
	ldr r1, _02258F44 ; =ov03_0225980C
	ldr r0, [sp]
	add r7, r7, #1
	ldr r0, [r1, r0]
	add r4, r4, #1
	add r5, #0x10
	cmp r7, r0
	blt _02258F02
_02258F32:
	add r0, r6, #0
	add r0, #0x10
	bl ScheduleWindowCopyToVram
	ldr r0, [r6, #0xc]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02258F44: .word ov03_0225980C
	thumb_func_end ov03_02258EE8

	thumb_func_start ov03_02258F48
ov03_02258F48: ; 0x02258F48
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02258F88 ; =0x0001020F
	mov r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r5, #0x3c]
	add r0, #0x10
	mov r3, #8
	bl AddTextPrinterParameterized2
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02258F88 ; =0x0001020F
	mov r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r5, #0x38]
	add r0, #0x10
	mov r3, #8
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02258F88: .word 0x0001020F
	thumb_func_end ov03_02258F48

	thumb_func_start ov03_02258F8C
ov03_02258F8C: ; 0x02258F8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r0, [r5, #0x28]
	ldr r2, [r5, #0x34]
	add r1, r6, #4
	bl ReadMsgDataIntoString
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02259064 ; =0x0001020F
	mov r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r5, #0x34]
	add r0, #0x10
	mov r3, #8
	bl AddTextPrinterParameterized2
	ldr r0, [r5, #0x24]
	add r1, r6, #0
	bl ov03_02259070
	add r7, r0, #0
	ldr r0, _02259068 ; =0x0098967F
	cmp r7, r0
	blo _02258FCC
	add r7, r0, #0
_02258FCC:
	cmp r6, #9
	bne _02259028
	ldr r0, [r5, #0x28]
	ldr r2, [r5, #0x30]
	mov r1, #2
	bl ReadMsgDataIntoString
	add r0, r7, #0
	mov r1, #0x3c
	bl _u32_div_f
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r7, #0
	mov r1, #0x3c
	bl _u32_div_f
	lsl r0, r1, #0x10
	lsr r7, r0, #0x10
	ldr r0, _0225906C ; =0x000003E7
	cmp r6, r0
	bls _02258FFA
	add r6, r0, #0
_02258FFA:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x2c]
	mov r1, #0
	add r2, r6, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r3, #2
	str r3, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r0, [r5, #0x2c]
	add r2, r7, #0
	bl BufferIntegerAsString
	ldr r0, [r5, #0x2c]
	ldr r1, [r5, #0x34]
	ldr r2, [r5, #0x30]
	bl StringExpandPlaceholders
	b _02259036
_02259028:
	mov r3, #1
	str r3, [sp]
	ldr r0, [r5, #0x34]
	add r1, r7, #0
	mov r2, #7
	bl String16_FormatInteger
_02259036:
	mov r0, #0
	ldr r1, [r5, #0x34]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0xe0
	sub r3, r1, r0
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02259064 ; =0x0001020F
	mov r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r5, #0x34]
	add r0, #0x10
	sub r3, #8
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02259064: .word 0x0001020F
_02259068: .word 0x0098967F
_0225906C: .word 0x000003E7
	thumb_func_end ov03_02258F8C

	thumb_func_start ov03_02259070
ov03_02259070: ; 0x02259070
	cmp r1, #0xa
	blt _02259082
	cmp r1, #0x13
	bgt _02259082
	sub r1, #0xa
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r0, [r0, #0x44]
	bx lr
_02259082:
	cmp r1, #0x1c
	bhi _02259128
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02259092: ; jump table
	.short _022590CC - _02259092 - 2 ; case 0
	.short _022590D0 - _02259092 - 2 ; case 1
	.short _022590D4 - _02259092 - 2 ; case 2
	.short _022590D8 - _02259092 - 2 ; case 3
	.short _022590DC - _02259092 - 2 ; case 4
	.short _022590F0 - _02259092 - 2 ; case 5
	.short _022590F4 - _02259092 - 2 ; case 6
	.short _022590F8 - _02259092 - 2 ; case 7
	.short _022590FC - _02259092 - 2 ; case 8
	.short _02259100 - _02259092 - 2 ; case 9
	.short _02259128 - _02259092 - 2 ; case 10
	.short _02259128 - _02259092 - 2 ; case 11
	.short _02259128 - _02259092 - 2 ; case 12
	.short _02259128 - _02259092 - 2 ; case 13
	.short _02259128 - _02259092 - 2 ; case 14
	.short _02259128 - _02259092 - 2 ; case 15
	.short _02259128 - _02259092 - 2 ; case 16
	.short _02259128 - _02259092 - 2 ; case 17
	.short _02259128 - _02259092 - 2 ; case 18
	.short _02259128 - _02259092 - 2 ; case 19
	.short _02259104 - _02259092 - 2 ; case 20
	.short _02259108 - _02259092 - 2 ; case 21
	.short _0225910C - _02259092 - 2 ; case 22
	.short _02259110 - _02259092 - 2 ; case 23
	.short _02259114 - _02259092 - 2 ; case 24
	.short _02259118 - _02259092 - 2 ; case 25
	.short _0225911C - _02259092 - 2 ; case 26
	.short _02259120 - _02259092 - 2 ; case 27
	.short _02259124 - _02259092 - 2 ; case 28
_022590CC:
	ldr r0, [r0, #4]
	bx lr
_022590D0:
	ldr r0, [r0, #8]
	bx lr
_022590D4:
	ldr r0, [r0, #0xc]
	bx lr
_022590D8:
	ldr r0, [r0, #0x10]
	bx lr
_022590DC:
	mov r3, #0
	add r2, r3, #0
_022590E0:
	ldr r1, [r0, #0x44]
	add r2, r2, #1
	add r3, r3, r1
	add r0, r0, #4
	cmp r2, #0xa
	blt _022590E0
	add r0, r3, #0
	bx lr
_022590F0:
	ldr r0, [r0, #0x6c]
	bx lr
_022590F4:
	ldr r0, [r0, #0x38]
	bx lr
_022590F8:
	ldr r0, [r0, #0x3c]
	bx lr
_022590FC:
	ldr r0, [r0, #0x40]
	bx lr
_02259100:
	ldr r0, [r0]
	bx lr
_02259104:
	ldr r0, [r0, #0x14]
	bx lr
_02259108:
	ldr r0, [r0, #0x2c]
	bx lr
_0225910C:
	ldr r0, [r0, #0x1c]
	bx lr
_02259110:
	ldr r0, [r0, #0x24]
	bx lr
_02259114:
	ldr r0, [r0, #0x30]
	bx lr
_02259118:
	ldr r0, [r0, #0x34]
	bx lr
_0225911C:
	ldr r0, [r0, #0x20]
	bx lr
_02259120:
	ldr r0, [r0, #0x18]
	bx lr
_02259124:
	ldr r0, [r0, #0x28]
	bx lr
_02259128:
	mov r0, #0
	bx lr
	thumb_func_end ov03_02259070

	.rodata

_0225912C:
	.byte 0x4F, 0x01, 0x00, 0x00

ov03_02259130: ; 0x02259130
	.byte 0x4E, 0x01, 0x00, 0x00

ov03_02259134: ; 0x02259134
	.byte 0x4D, 0x01, 0x00, 0x00, 0x4E, 0x01, 0x00, 0x00

ov03_0225913C: ; 0x0225913C
	.byte 0x50, 0x01, 0x00, 0x00
	.byte 0x4E, 0x01, 0x00, 0x00

ov03_02259144: ; 0x02259144
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x05, 0x00, 0x00, 0x01, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x80
	.byte 0x00, 0x00, 0x00, 0x00

ov03_02259164: ; 0x02259164
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x41, 0x25, 0x02, 0x21, 0x41, 0x25, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x05, 0x00, 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov03_02259184: ; 0x02259184
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x26, 0x00, 0x26, 0x00, 0x26, 0x00
	.byte 0x27, 0x00, 0x28, 0x00, 0x29, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x2A, 0x00

ov03_022591D6: ; 0x022591D6
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x26, 0x00, 0x26, 0x00
	.byte 0x26, 0x00, 0x27, 0x00, 0x28, 0x00, 0x29, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2A, 0x00

ov03_02259228: ; 0x02259228
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46, 0x00
	.byte 0x46, 0x00, 0x46, 0x00, 0x47, 0x00, 0x48, 0x00, 0x49, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4A, 0x00

ov03_0225927A: ; 0x0225927A
	.byte 0x30, 0x00, 0x31, 0x00, 0x32, 0x00
	.byte 0x34, 0x00, 0x33, 0x00, 0x33, 0x00, 0x38, 0x00, 0x39, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x3C, 0x00, 0x3D, 0x00, 0x00, 0x00, 0x3E, 0x00, 0x3F, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x35, 0x00, 0x36, 0x00, 0x37, 0x00

ov03_022592CC: ; 0x022592CC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x41, 0x00, 0x42, 0x00, 0x43, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x00

ov03_0225931E: ; 0x0225931E
	.byte 0x07, 0x00
	.byte 0x08, 0x00, 0x09, 0x00, 0x0B, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x11, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x13, 0x00, 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x16, 0x00, 0x17, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x00, 0x00

ov03_02259370: ; 0x02259370
	.byte 0x18, 0x00, 0x19, 0x00, 0x1A, 0x00, 0x1B, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x25, 0x00, 0x1F, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x21, 0x00, 0x00, 0x00, 0x22, 0x00, 0x23, 0x00
	.byte 0x24, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x1C, 0x00, 0x1D, 0x00
	.byte 0x1E, 0x00

ov03_022593C2: ; 0x022593C2
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x2B, 0x00, 0x2B, 0x00, 0x2C, 0x00
	.byte 0x2D, 0x00, 0x2E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x2F, 0x00, 0xBF, 0x00, 0x00, 0x00, 0xBF, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x37, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x37, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov03_0225943C: ; 0x0225943C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00

ov03_0225945C: ; 0x0225945C
	.byte 0x95, 0x00, 0x98, 0x00
	.byte 0x99, 0x00, 0x00, 0x00

ov03_02259464: ; 0x02259464
	.byte 0x02, 0x01, 0x12, 0x1B, 0x06, 0x0D, 0xFD, 0x00

ov03_0225946C: ; 0x0225946C
	.byte 0x42, 0x00, 0x43, 0x00
	.byte 0x41, 0x00, 0x40, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x58, 0x00

ov03_0225947A: ; 0x0225947A
	.byte 0x04

ov03_0225947B: ; 0x0225947B
	.byte 0x02

ov03_0225947C: ; 0x0225947C
	.byte 0x06

ov03_0225947D: ; 0x0225947D
	.byte 0x01, 0x08, 0x03
	.byte 0x00, 0x07, 0x00, 0x04, 0x06, 0x03, 0x01, 0x05, 0x02, 0x07, 0x02, 0x00, 0x06, 0x05, 0x03, 0x08
	.byte 0x04, 0x07, 0x04, 0x00, 0x08, 0x08, 0x04, 0x00, 0x08, 0x08, 0x05, 0x01, 0x08, 0x08

ov03_0225949E: ; 0x0225949E
	.byte 0x30

ov03_0225949F: ; 0x0225949F
	.byte 0x38

ov03_022594A0: ; 0x022594A0
	.byte 0x00

ov03_022594A1: ; 0x022594A1
	.byte 0x07, 0xB0, 0x38, 0x00, 0x07, 0x30, 0x60, 0x00, 0x07, 0xB0, 0x60, 0x00, 0x07, 0x30, 0x88
	.byte 0x00, 0x07, 0xB0, 0x88, 0x00, 0x07, 0x18, 0xB0, 0x04, 0x07, 0x40, 0xB0, 0x04, 0x07, 0xE0, 0xB0
	.byte 0x07, 0x07, 0xA0, 0xB0, 0x07, 0x07

ov03_022594C6: ; 0x022594C6
	.byte 0x02, 0x0D, 0x02, 0x12, 0x0E, 0x0D, 0x01, 0x00, 0x02, 0x05
	.byte 0x12, 0x1B, 0x06, 0x0D, 0xFD, 0x00, 0x03, 0x01, 0x01, 0x0A, 0x04, 0x0D, 0x28, 0x00, 0x03, 0x13
	.byte 0x0D, 0x0C, 0x04, 0x0D, 0x50, 0x00, 0x03, 0x01, 0x0F, 0x0E, 0x02, 0x0D, 0x80, 0x00, 0x03, 0x02
	.byte 0x13, 0x1B, 0x04, 0x0C, 0x9C, 0x00, 0x00, 0x00

ov03_022594F8: ; 0x022594F8
	.byte 0x00, 0x00, 0x00, 0x00, 0xB1, 0x00, 0x08, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xB1, 0x00, 0x84, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x16, 0x00, 0xAC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x16, 0x00, 0x3B, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x98, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x16, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x98, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x16, 0x00, 0x8B, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x98, 0x00, 0x8B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x18, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x40, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x88, 0x00, 0x68, 0x00
	.byte 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x68, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x88, 0x00, 0x98, 0x00
	.byte 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x98, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x88, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov03_022597F0: ; 0x022597F0
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0xFF, 0x00, 0x00, 0x00

ov03_022597FC: ; 0x022597FC
	.byte 0x4D, 0x88, 0x25, 0x02
	.byte 0x29, 0x88, 0x25, 0x02, 0x31, 0x88, 0x25, 0x02

ov03_02259808: ; 0x02259808
	.byte 0x4A, 0x00, 0x1B, 0x00

ov03_0225980C: ; 0x0225980C
	.byte 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00

	.data


ov03_02259820: ; 0x02259820
	.byte 0x01, 0x02, 0x03, 0x05, 0x07, 0x04, 0x0B, 0x0A, 0x09, 0x00, 0x00, 0x00

ov03_0225982C: ; 0x0225982C
	.byte 0x66, 0x67, 0x68, 0x69
	.byte 0x6B, 0x6D, 0x6D, 0x6D, 0x6F, 0x00, 0x00, 0x00

ov03_02259838: ; 0x02259838
	.byte 0x82, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x83, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF

ov03_02259850: ; 0x02259850
	.byte 0x04, 0x05, 0x02, 0x05, 0x05, 0x02, 0x06, 0x05, 0x02, 0x07, 0x05, 0x02, 0x08, 0x05, 0x02, 0x09
	.byte 0x05, 0x02, 0x0A, 0x01, 0x00, 0x0B, 0x03, 0x00, 0x0C, 0x04, 0x00, 0x0D, 0x01, 0x01, 0x0E, 0x00
	.byte 0x01, 0x0F, 0x00, 0x01, 0x10, 0x00, 0x01, 0x11, 0x00, 0x01, 0x12, 0x00, 0x01, 0x00, 0x00, 0x00

ov03_02259880: ; 0x02259880
	.byte 0x00, 0x01, 0x02, 0x19, 0x15, 0x16, 0x00, 0x13, 0x14, 0x1B, 0x05, 0x07, 0x12, 0x08, 0x09, 0x11
	.byte 0x06, 0x10, 0x0A, 0x18, 0x1A, 0x03, 0x04, 0x0E, 0x17, 0x0D, 0x0B, 0x0C, 0x0F, 0x00, 0x00, 0x00

	.bss

ov03_022598A0: ; 0x022598A0
	.space 0x20
