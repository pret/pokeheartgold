#include "constants/pokemon.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov12_022378C0
ov12_022378C0: ; 0x022378C0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r4, r1, #0
	add r6, r0, #0
	bl OverlayManager_GetArgs
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #0xf
	bls _022378D6
	b _02237AFA
_022378D6:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022378E2: ; jump table
	.short _02237902 - _022378E2 - 2 ; case 0
	.short _0223792E - _022378E2 - 2 ; case 1
	.short _02237974 - _022378E2 - 2 ; case 2
	.short _0223798A - _022378E2 - 2 ; case 3
	.short _022379A0 - _022378E2 - 2 ; case 4
	.short _022379B0 - _022378E2 - 2 ; case 5
	.short _022379C6 - _022378E2 - 2 ; case 6
	.short _022379E2 - _022378E2 - 2 ; case 7
	.short _022379F4 - _022378E2 - 2 ; case 8
	.short _02237A10 - _022378E2 - 2 ; case 9
	.short _02237A2C - _022378E2 - 2 ; case 10
	.short _02237A48 - _022378E2 - 2 ; case 11
	.short _02237A64 - _022378E2 - 2 ; case 12
	.short _02237A6A - _022378E2 - 2 ; case 13
	.short _02237AD2 - _022378E2 - 2 ; case 14
	.short _02237AF4 - _022378E2 - 2 ; case 15
_02237902:
	mov r2, #0xb
	mov r0, #3
	mov r1, #5
	lsl r2, r2, #0x10
	bl CreateHeap
	ldr r1, [r5]
	mov r0, #4
	tst r0, r1
	beq _02237928
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	mov r0, #0x10
	tst r0, r1
	bne _02237928
	mov r0, #1
	str r0, [r4]
	b _02237AFA
_02237928:
	mov r0, #3
	str r0, [r4]
	b _02237AFA
_0223792E:
	add r0, r6, #0
	add r1, r5, #0
	bl ov12_022399D4
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02039F68
	bl sub_02039998
	cmp r0, #0
	bne _02237962
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x15
	bl GameStats_Inc
	ldr r0, [r5]
	cmp r0, #0x8f
	beq _0223796E
	mov r0, #1
	bl sub_02005BEC
	b _0223796E
_02237962:
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x1a
	bl GameStats_Inc
_0223796E:
	mov r0, #2
	str r0, [r4]
	b _02237AFA
_02237974:
	add r0, r6, #0
	bl ov12_02239C28
	cmp r0, #1
	bne _022379EC
	add r0, r6, #0
	bl ov12_0223A088
	mov r0, #3
	str r0, [r4]
	b _02237AFA
_0223798A:
	add r0, r6, #0
	bl ov12_0223A0D4
	cmp r0, #1
	bne _0223799A
	mov r0, #4
	str r0, [r4]
	b _02237AFA
_0223799A:
	mov r0, #5
	str r0, [r4]
	b _02237AFA
_022379A0:
	add r0, r6, #0
	bl ov12_0223A218
	cmp r0, #1
	bne _022379EC
	mov r0, #5
	str r0, [r4]
	b _02237AFA
_022379B0:
	add r0, r6, #0
	bl ov12_0223A260
	cmp r0, #1
	bne _022379C0
	mov r0, #6
	str r0, [r4]
	b _02237AFA
_022379C0:
	mov r0, #8
	str r0, [r4]
	b _02237AFA
_022379C6:
	add r0, r6, #0
	bl ov12_0223A3A8
	cmp r0, #1
	bne _022379EC
	ldr r0, _02237B00 ; =FS_OVERLAY_ID(OVY_5)
	bl UnloadOverlayByID
	mov r0, #7
	str r0, [r4]
	mov r0, #0x3d
	bl sub_02037AC0
	b _02237AFA
_022379E2:
	mov r0, #0x3d
	bl sub_02037B38
	cmp r0, #0
	bne _022379EE
_022379EC:
	b _02237AFA
_022379EE:
	mov r0, #8
	str r0, [r4]
	b _02237AFA
_022379F4:
	ldr r0, _02237B04 ; =FS_OVERLAY_ID(OVY_6)
	mov r1, #2
	bl HandleLoadOverlay
	ldr r0, _02237B08 ; =FS_OVERLAY_ID(OVY_7)
	mov r1, #2
	bl HandleLoadOverlay
	add r0, r6, #0
	bl ov12_02237F18
	mov r0, #9
	str r0, [r4]
	b _02237AFA
_02237A10:
	add r0, r6, #0
	bl ov12_02238358
	cmp r0, #1
	bne _02237AFA
	add r0, r6, #0
	bl ov12_0223843C
	mov r0, #0
	bl sub_02005BEC
	mov r0, #0xa
	str r0, [r4]
	b _02237AFA
_02237A2C:
	add r0, r6, #0
	bl ov12_0223A3F0
	cmp r0, #1
	bne _02237A3C
	mov r0, #0xb
	str r0, [r4]
	b _02237AFA
_02237A3C:
	mov r0, #5
	bl DestroyHeap
	mov r0, #0xd
	str r0, [r4]
	b _02237AFA
_02237A48:
	add r0, r6, #0
	bl ov12_0223A5E4
	cmp r0, #1
	bne _02237AFA
	ldr r0, _02237B00 ; =FS_OVERLAY_ID(OVY_5)
	bl UnloadOverlayByID
	mov r0, #5
	bl DestroyHeap
	mov r0, #0xc
	str r0, [r4]
	b _02237AFA
_02237A64:
	mov r0, #0xf
	str r0, [r4]
	b _02237AFA
_02237A6A:
	add r1, sp, #0x20
	add r2, sp, #0x1c
	bl ov12_0223B5EC
	add r6, r0, #0
	beq _02237ACC
	mov r0, #3
	mov r1, #0x47
	lsl r2, r0, #0x10
	bl CreateHeap
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x20]
	bl GetPartyMonByIndex
	mov r2, #0x59
	lsl r2, r2, #2
	add r1, r0, #0
	ldr r0, [r5, r2]
	mov r3, #0x47
	str r0, [sp]
	add r0, r2, #0
	sub r0, #0x54
	ldr r0, [r5, r0]
	str r0, [sp, #4]
	add r0, r2, #0
	sub r0, #0x5c
	ldr r0, [r5, r0]
	sub r2, #0x20
	str r0, [sp, #8]
	ldr r0, [r5, r2]
	add r2, r6, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0x10]
	mov r0, #3
	str r0, [sp, #0x14]
	str r3, [sp, #0x18]
	add r3, #0xe9
	ldr r0, [r5, #4]
	ldr r3, [r5, r3]
	bl sub_02075A7C
	mov r1, #0x66
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xe
	str r0, [r4]
	b _02237AFA
_02237ACC:
	mov r0, #0xf
	str r0, [r4]
	b _02237AFA
_02237AD2:
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r5, [r5, r0]
	add r0, r5, #0
	bl sub_02075D3C
	cmp r0, #1
	bne _02237AFA
	add r0, r5, #0
	bl sub_02075D4C
	mov r0, #0x47
	bl DestroyHeap
	mov r0, #0xd
	str r0, [r4]
	b _02237AFA
_02237AF4:
	add sp, #0x24
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02237AFA:
	mov r0, #0
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02237B00: .word FS_OVERLAY_ID(OVY_5)
_02237B04: .word FS_OVERLAY_ID(OVY_6)
_02237B08: .word FS_OVERLAY_ID(OVY_7)
	thumb_func_end ov12_022378C0

	thumb_func_start ov12_02237B0C
ov12_02237B0C: ; 0x02237B0C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov12_0226631C
	ldr r0, [r4, #4]
	bl ov12_022660A8
	ldr r1, _02237B58 ; =0x000023FF
	mov r0, #4
	ldrb r2, [r4, r1]
	orr r2, r0
	strb r2, [r4, r1]
	bl FontID_Release
	add r0, r4, #0
	mov r1, #3
	bl ov12_0223BBF0
	ldr r0, _02237B5C ; =0x00002445
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _02237B46
	ldr r0, _02237B60 ; =FS_OVERLAY_ID(OVY_7)
	bl UnloadOverlayByID
	b _02237B4C
_02237B46:
	ldr r0, _02237B64 ; =FS_OVERLAY_ID(OVY_10)
	bl UnloadOverlayByID
_02237B4C:
	ldr r0, _02237B68 ; =FS_OVERLAY_ID(OVY_8)
	mov r1, #2
	bl HandleLoadOverlay
	pop {r4, pc}
	nop
_02237B58: .word 0x000023FF
_02237B5C: .word 0x00002445
_02237B60: .word FS_OVERLAY_ID(OVY_7)
_02237B64: .word FS_OVERLAY_ID(OVY_10)
_02237B68: .word FS_OVERLAY_ID(OVY_8)
	thumb_func_end ov12_02237B0C

	thumb_func_start ov12_02237B6C
ov12_02237B6C: ; 0x02237B6C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov12_0226631C
	ldr r0, [r4, #8]
	bl RemoveWindow
	ldr r0, [r4, #4]
	bl ov12_02238A30
	add r0, r4, #0
	bl ov12_02238A64
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x90
	add r1, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D998
	add r4, #0x90
	ldr r0, [r4]
	bl sub_0200D108
	bl GF_DestroyVramTransferManager
	mov r0, #4
	bl FontID_Release
	pop {r4, pc}
	thumb_func_end ov12_02237B6C

	thumb_func_start ov12_02237BB8
ov12_02237BB8: ; 0x02237BB8
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _02237CB0 ; =FS_OVERLAY_ID(OVY_8)
	bl UnloadOverlayByID
	ldr r0, _02237CB4 ; =0x00002445
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _02237BD6
	ldr r0, _02237CB8 ; =FS_OVERLAY_ID(OVY_7)
	mov r1, #2
	bl HandleLoadOverlay
	b _02237BDE
_02237BD6:
	ldr r0, _02237CBC ; =FS_OVERLAY_ID(OVY_10)
	mov r1, #2
	bl HandleLoadOverlay
_02237BDE:
	add r0, r5, #0
	mov r1, #0
	bl ov12_0223BBF0
	bl sub_02026E9C
	add r4, r0, #0
	bl sub_02026E94
	add r1, r0, #0
	mov r0, #0
	add r2, r4, #0
	bl MIi_CpuClear16
	mov r0, #7
	mov r1, #5
	bl NARC_ctor
	add r6, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_ctor
	add r4, r0, #0
	add r0, r5, #0
	bl ov12_0223BFC0
	add r1, r0, #0
	add r0, r5, #0
	bl ov12_0223AAC8
	add r3, r0, #0
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, r4, #0
	str r0, [sp]
	add r0, r6, #0
	add r2, r5, #0
	bl ov12_022660D0
	mov r1, #0x67
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #4
	mov r1, #5
	bl FontID_Alloc
	ldr r1, _02237CC0 ; =0x000023FF
	mov r0, #2
	ldrb r2, [r5, r1]
	orr r0, r2
	strb r0, [r5, r1]
	ldr r0, [r5, #4]
	bl ov12_0226604C
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov12_02266390
	mov r0, #1
	str r0, [sp]
	mov r3, #0
	mov r2, #0x67
	str r3, [sp, #4]
	lsl r2, r2, #2
	ldr r2, [r5, r2]
	add r0, r6, #0
	add r1, r4, #0
	bl ov12_02266508
	mov r1, #0x67
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r4, #0
	bl ov12_02266644
	add r0, r6, #0
	bl NARC_dtor
	add r0, r4, #0
	bl NARC_dtor
	mov r0, #1
	bl sub_020027F0
	add r0, r5, #0
	bl ov12_0223A620
	add r5, #0x90
	ldr r0, [r5]
	bl sub_0200CF6C
	mov r2, #0x11
	mov r1, #0
	lsl r2, r2, #0x10
	bl G2dRenderer_SetSubSurfaceCoords
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02237CB0: .word FS_OVERLAY_ID(OVY_8)
_02237CB4: .word 0x00002445
_02237CB8: .word FS_OVERLAY_ID(OVY_7)
_02237CBC: .word FS_OVERLAY_ID(OVY_10)
_02237CC0: .word 0x000023FF
	thumb_func_end ov12_02237BB8

	thumb_func_start ov12_02237CC4
ov12_02237CC4: ; 0x02237CC4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl RemoveWindow
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #4]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	bl ov12_0223BCC8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_02237CC4

	thumb_func_start ov12_02237D00
ov12_02237D00: ; 0x02237D00
	push {r4, r5, r6, lr}
	sub sp, #0x68
	ldr r1, _02237EB4 ; =0x000023FF
	add r5, r0, #0
	ldrb r2, [r5, r1]
	mov r0, #1
	ldr r4, _02237EB8 ; =ov12_0226C120
	bic r2, r0
	mov r0, #1
	orr r0, r2
	strb r0, [r5, r1]
	add r3, sp, #0x14
	mov r2, #0xa
_02237D1A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02237D1A
	ldr r0, [r4]
	mov r1, #1
	str r0, [r3]
	ldr r0, [r5, #4]
	add r2, sp, #0x14
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #4]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #4]
	mov r1, #2
	add r2, sp, #0x30
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #4]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #4]
	mov r1, #3
	add r2, sp, #0x4c
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #4]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r1, _02237EBC ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strh r2, [r1]
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	add r0, r5, #0
	bl ov12_0223B708
	add r4, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r1, #1
	ldr r0, [r5, #4]
	add r2, r1, #0
	mov r3, #0xa
	bl sub_0200EB80
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	ldr r1, _02237EC0 ; =0x00002404
	ldr r2, [r5, #4]
	ldr r1, [r5, r1]
	mov r0, #7
	add r1, r1, #3
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	add r0, r5, #0
	bl ov12_0223B52C
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r3, _02237EC0 ; =0x00002404
	ldr r0, [r5, #0x28]
	ldr r6, [r5, r3]
	mov r1, #7
	lsl r3, r6, #1
	add r3, r6, r3
	add r3, #0xb0
	add r2, r3, r2
	mov r3, #5
	bl PaletteData_LoadNarc
	add r0, r4, #0
	bl sub_0200E640
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xa0
	str r0, [sp, #8]
	ldr r0, [r5, #0x28]
	mov r1, #0x26
	mov r3, #5
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xb0
	str r0, [sp, #8]
	ldr r0, [r5, #0x28]
	mov r1, #0x10
	mov r2, #8
	mov r3, #5
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	ldr r2, [r5, #4]
	mov r0, #7
	mov r1, #2
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _02237EC4 ; =0xFFFF1FFF
	ldr r3, _02237EC8 ; =0x04001000
	and r2, r1
	str r2, [r0]
	ldr r2, [r3]
	and r1, r2
	add r2, r0, #0
	str r1, [r3]
	add r2, #0x48
	ldrh r3, [r2]
	mov r1, #0x3f
	add r0, #0x4a
	bic r3, r1
	strh r3, [r2]
	ldrh r2, [r0]
	bic r2, r1
	strh r2, [r0]
	bl GX_BothDispOn
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, _02237ECC ; =ov12_02239730
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	ldr r0, _02237EB4 ; =0x000023FF
	mov r3, #2
	ldrb r1, [r5, r0]
	mov r2, #1
	orr r1, r3
	strb r1, [r5, r0]
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0x1f
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	bl AddWindowParameterized
	ldr r0, [r5, #8]
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r5, #8]
	mov r1, #0
	mov r2, #1
	mov r3, #0xa
	bl DrawFrameAndWindow2
	add r0, r5, #0
	bl ov12_0223A620
	add sp, #0x68
	pop {r4, r5, r6, pc}
	nop
_02237EB4: .word 0x000023FF
_02237EB8: .word ov12_0226C120
_02237EBC: .word 0x04000008
_02237EC0: .word 0x00002404
_02237EC4: .word 0xFFFF1FFF
_02237EC8: .word 0x04001000
_02237ECC: .word ov12_02239730
	thumb_func_end ov12_02237D00

	thumb_func_start ov12_02237ED0
ov12_02237ED0: ; 0x02237ED0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02237F0C ; =0x00002445
	add r4, r1, #0
	ldrb r0, [r5, r0]
	cmp r0, r4
	bne _02237EE2
	bl GF_AssertFail
_02237EE2:
	ldr r0, _02237F0C ; =0x00002445
	cmp r4, #0
	strb r4, [r5, r0]
	bne _02237EFA
	ldr r0, _02237F10 ; =FS_OVERLAY_ID(OVY_10)
	bl UnloadOverlayByID
	ldr r0, _02237F14 ; =FS_OVERLAY_ID(OVY_7)
	mov r1, #2
	bl HandleLoadOverlay
	pop {r3, r4, r5, pc}
_02237EFA:
	ldr r0, _02237F14 ; =FS_OVERLAY_ID(OVY_7)
	bl UnloadOverlayByID
	ldr r0, _02237F10 ; =FS_OVERLAY_ID(OVY_10)
	mov r1, #2
	bl HandleLoadOverlay
	pop {r3, r4, r5, pc}
	nop
_02237F0C: .word 0x00002445
_02237F10: .word FS_OVERLAY_ID(OVY_10)
_02237F14: .word FS_OVERLAY_ID(OVY_7)
	thumb_func_end ov12_02237ED0

	thumb_func_start ov12_02237F18
ov12_02237F18: ; 0x02237F18
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetArgs
	add r7, r0, #0
	bl sub_02026E8C
	add r5, r0, #0
	bl sub_02026E84
	add r1, r0, #0
	mov r0, #0
	add r2, r5, #0
	bl MIi_CpuClear16
	bl sub_02026E9C
	add r5, r0, #0
	bl sub_02026E94
	add r1, r0, #0
	mov r0, #0
	add r2, r5, #0
	bl MIi_CpuClear16
	bl ov12_02239644
	str r0, [r4]
	bl HBlankInterruptDisable
	mov r0, #4
	mov r1, #5
	bl FontID_Alloc
	mov r0, #0xe
	mov r1, #2
	mov r2, #0xf
	mov r3, #5
	bl MessagePrinter_new
	mov r1, #0x6a
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r2, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	mov r0, #5
	bl sub_020030E8
	str r0, [r4, #0x28]
	mov r1, #1
	bl sub_02003B50
	mov r2, #2
	ldr r0, [r4, #0x28]
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #5
	bl PaletteData_AllocBuffers
	mov r1, #1
	ldr r0, [r4, #0x28]
	lsl r2, r1, #9
	mov r3, #5
	bl PaletteData_AllocBuffers
	mov r2, #7
	ldr r0, [r4, #0x28]
	mov r1, #2
	lsl r2, r2, #6
	mov r3, #5
	bl PaletteData_AllocBuffers
	mov r2, #2
	ldr r0, [r4, #0x28]
	mov r1, #3
	lsl r2, r2, #8
	mov r3, #5
	bl PaletteData_AllocBuffers
	mov r0, #5
	bl BgConfig_Alloc
	str r0, [r4, #4]
	mov r0, #5
	mov r1, #3
	bl AllocWindows
	str r0, [r4, #8]
	mov r6, #0
	add r5, r4, #0
_02237FD8:
	mov r1, #0x32
	mov r0, #5
	lsl r1, r1, #6
	bl AllocFromHeap
	mov r1, #0x1d
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r6, r6, #1
	add r5, #0x10
	cmp r6, #4
	blt _02237FD8
	mov r0, #0x40
	mov r1, #5
	bl GF_CreateVramTransferManager
	mov r0, #7
	mov r1, #5
	bl NARC_ctor
	add r5, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_ctor
	add r6, r0, #0
	add r0, r4, #0
	bl ov12_0223BFC0
	add r1, r0, #0
	add r0, r4, #0
	bl ov12_0223AAC8
	add r3, r0, #0
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, r6, #0
	str r0, [sp]
	add r0, r5, #0
	add r2, r4, #0
	bl ov12_022660D0
	mov r1, #0x67
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r5, #0
	bl NARC_dtor
	add r0, r6, #0
	bl NARC_dtor
	ldr r1, [r4, #4]
	add r0, r4, #0
	bl ov12_022387AC
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0x1f
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	mov r2, #1
	mov r3, #2
	bl AddWindowParameterized
	ldr r0, [r4, #8]
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r4, #8]
	mov r1, #0
	mov r2, #1
	mov r3, #0xa
	bl DrawFrameAndWindow2
	mov r0, #5
	bl sub_0200CF18
	add r1, r4, #0
	add r1, #0x90
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	ldr r1, _02238314 ; =ov12_0226C060
	ldr r2, _02238318 ; =ov12_0226C018
	mov r3, #0x20
	bl sub_0200CF70
	ldr r1, _0223831C ; =0x00100010
	mov r0, #1
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl sub_0200CF38
	add r1, r4, #0
	add r1, #0x94
	str r0, [r1]
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x90
	add r1, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0x80
	bl sub_0200CFF4
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x90
	add r1, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _02238320 ; =ov12_0226C02C
	bl sub_0200D3F8
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl sub_0200CF6C
	mov r2, #0x11
	mov r1, #0
	lsl r2, r2, #0x10
	bl G2dRenderer_SetSubSurfaceCoords
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov12_02266390
	mov r0, #7
	mov r1, #5
	bl NARC_ctor
	add r6, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_ctor
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r3, #0
	mov r2, #0x67
	str r3, [sp, #4]
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	add r0, r6, #0
	add r1, r5, #0
	bl ov12_02266508
	mov r1, #0x67
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r5, #0
	bl ov12_02266644
	add r0, r6, #0
	bl NARC_dtor
	add r0, r5, #0
	bl NARC_dtor
	mov r0, #5
	bl sub_02007FD4
	add r1, r4, #0
	add r1, #0x88
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	mov r2, #0xc0
	bl sub_02009408
	add r0, r4, #0
	bl ov12_0223BC48
	bl ov12_022396F0
	mov r0, #5
	bl ov07_0221BEDC
	add r1, r4, #0
	add r1, #0x8c
	str r0, [r1]
	add r0, r4, #0
	bl ov12_022389B8
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xc5
	mov r3, #5
	bl NewMsgDataFromNarc
	str r0, [r4, #0xc]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #3
	mov r3, #5
	bl NewMsgDataFromNarc
	str r0, [r4, #0x10]
	mov r0, #5
	bl ScrStrBufs_new
	str r0, [r4, #0x14]
	mov r0, #5
	lsl r0, r0, #6
	mov r1, #5
	bl String_ctor
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x28]
	mov r1, #0
	bl PaletteData_GetUnfadedBuf
	ldr r1, _02238324 ; =0x00002228
	mov r2, #0xe0
	add r1, r4, r1
	bl MIi_CpuCopy16
	ldr r0, [r4, #0x28]
	mov r1, #2
	bl PaletteData_GetUnfadedBuf
	ldr r1, _02238328 ; =0x00002308
	mov r2, #0xe0
	add r1, r4, r1
	bl MIi_CpuCopy16
	add r0, r4, #0
	bl ov12_0223B52C
	mov r1, #0
	lsl r6, r0, #2
	str r1, [sp]
	mov r0, #0x70
	str r0, [sp, #4]
	ldr r3, _0223832C ; =0x00002404
	mov r5, #0xc
	ldr r3, [r4, r3]
	ldr r0, [r4, #0x28]
	mul r5, r3
	ldr r3, _02238330 ; =ov12_0226C1C8
	mov r2, #2
	add r3, r3, r5
	ldr r3, [r6, r3]
	lsl r3, r3, #0x10
	lsr r3, r3, #0x10
	bl sub_02003D5C
	mov r0, #0xc0
	str r0, [sp]
	add r0, #0x40
	str r0, [sp, #4]
	ldr r3, _0223832C ; =0x00002404
	mov r5, #0xc
	ldr r3, [r4, r3]
	ldr r0, [r4, #0x28]
	mul r5, r3
	ldr r3, _02238330 ; =ov12_0226C1C8
	mov r1, #0
	add r3, r3, r5
	ldr r3, [r6, r3]
	mov r2, #2
	lsl r3, r3, #0x10
	lsr r3, r3, #0x10
	bl sub_02003D5C
	mov r0, #0
	str r0, [sp]
	mov r0, #0xdf
	str r0, [sp, #4]
	ldr r3, _0223832C ; =0x00002404
	mov r5, #0xc
	ldr r3, [r4, r3]
	mov r1, #2
	mul r5, r3
	ldr r3, _02238330 ; =ov12_0226C1C8
	ldr r0, [r4, #0x28]
	add r3, r3, r5
	ldr r3, [r6, r3]
	add r2, r1, #0
	lsl r3, r3, #0x10
	lsr r3, r3, #0x10
	bl sub_02003D5C
	mov r1, #0
	mov r0, #0xa0
	str r0, [sp]
	mov r0, #0xc0
	str r0, [sp, #4]
	ldr r0, [r4, #0x28]
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02003D5C
	mov r2, #0
	str r2, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r4, #0x28]
	mov r1, #1
	add r3, r2, #0
	bl sub_02003D5C
	mov r2, #0
	str r2, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r4, #0x28]
	ldr r3, _02238334 ; =0x0000FFFF
	mov r1, #3
	bl sub_02003D5C
	ldr r0, [r4, #0x28]
	mov r1, #0
	mov r2, #0xb
	mov r3, #5
	bl sub_020163E0
	mov r1, #0x1b
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl sub_0201649C
	ldr r0, _02238338 ; =ov12_02239810
	ldr r2, _0223833C ; =0x0000EA60
	add r1, r4, #0
	bl CreateSysTask
	str r0, [r4, #0x1c]
	ldr r0, _02238340 ; =ov12_02239854
	ldr r2, _02238344 ; =0x0000C350
	add r1, r4, #0
	bl CreateSysTask
	str r0, [r4, #0x20]
	mov r2, #0x4b
	ldr r0, _02238348 ; =ov12_0223998C
	add r1, r4, #0
	lsl r2, r2, #4
	bl sub_0200E33C
	str r0, [r4, #0x24]
	mov r1, #0x32
	ldr r0, _0223834C ; =0x00002438
	mvn r1, r1
	str r1, [r4, r0]
	add r0, r4, #0
	bl ov12_0223A620
	add r0, r4, #0
	bl ov12_0223AA84
	bl BagCursor_Battle_Init
	mov r0, #5
	mov r1, #4
	mov r2, #0
	bl sub_02016EDC
	mov r1, #0x72
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #4
	mov r1, #5
	bl sub_02020654
	mov r1, #0x73
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, _02238350 ; =0x0000240C
	ldr r1, [r4, r0]
	mov r0, #0x10
	tst r0, r1
	beq _0223830E
	mov r0, #0x6f
	ldr r1, _02238354 ; =0x00002484
	mov r5, #0
	lsl r0, r0, #2
_02238300:
	add r2, r7, r5
	ldrb r3, [r2, r0]
	add r2, r4, r5
	add r5, r5, #1
	strb r3, [r2, r1]
	cmp r5, #4
	blt _02238300
_0223830E:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02238314: .word ov12_0226C060
_02238318: .word ov12_0226C018
_0223831C: .word 0x00100010
_02238320: .word ov12_0226C02C
_02238324: .word 0x00002228
_02238328: .word 0x00002308
_0223832C: .word 0x00002404
_02238330: .word ov12_0226C1C8
_02238334: .word 0x0000FFFF
_02238338: .word ov12_02239810
_0223833C: .word 0x0000EA60
_02238340: .word ov12_02239854
_02238344: .word 0x0000C350
_02238348: .word ov12_0223998C
_0223834C: .word 0x00002438
_02238350: .word 0x0000240C
_02238354: .word 0x00002484
	thumb_func_end ov12_02237F18

	thumb_func_start ov12_02238358
ov12_02238358: ; 0x02238358
	push {r3, r4, r5, r6, r7, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r2, [r4, #0x2c]
	mov r1, #4
	tst r1, r2
	beq _0223839E
	ldr r1, _02238430 ; =0x0000240C
	mov r2, #0x10
	ldr r3, [r4, r1]
	tst r2, r3
	bne _0223839E
	sub r1, #0x10
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _02238380
	ldr r1, [r4, #0x30]
	bl ov12_022486B0
_02238380:
	ldr r0, [r4, #0x44]
	mov r6, #0
	cmp r0, #0
	ble _0223842A
	add r5, r4, #0
_0223838A:
	ldr r1, [r5, #0x34]
	add r0, r4, #0
	bl ov12_02258E54
	ldr r0, [r4, #0x44]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _0223838A
	b _0223842A
_0223839E:
	ldr r0, _02238434 ; =0x000023FC
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _022383BA
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	bl ov12_022486B0
	ldr r1, _02238438 ; =0x000023FE
	strb r0, [r4, r1]
	add r0, r4, #0
	mov r1, #1
	bl ov12_022621C4
_022383BA:
	ldr r0, [r4, #0x44]
	mov r6, #0
	cmp r0, #0
	ble _022383E0
	add r5, r4, #0
	add r7, r6, #0
_022383C6:
	ldr r1, [r5, #0x34]
	add r0, r4, #0
	bl ov12_02258E54
	add r0, r4, #0
	add r1, r7, #0
	bl ov12_022621C4
	ldr r0, [r4, #0x44]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _022383C6
_022383E0:
	ldr r0, _02238438 ; =0x000023FE
	ldrb r1, [r4, r0]
	cmp r1, #0
	bne _0223842A
	sub r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _02238404
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	bl ov12_022486B0
	ldr r1, _02238438 ; =0x000023FE
	strb r0, [r4, r1]
	add r0, r4, #0
	mov r1, #1
	bl ov12_022621C4
_02238404:
	ldr r0, [r4, #0x44]
	mov r6, #0
	cmp r0, #0
	ble _0223842A
	add r5, r4, #0
	add r7, r6, #0
_02238410:
	ldr r1, [r5, #0x34]
	add r0, r4, #0
	bl ov12_02258E54
	add r0, r4, #0
	add r1, r7, #0
	bl ov12_022621C4
	ldr r0, [r4, #0x44]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _02238410
_0223842A:
	ldr r0, _02238438 ; =0x000023FE
	ldrb r0, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02238430: .word 0x0000240C
_02238434: .word 0x000023FC
_02238438: .word 0x000023FE
	thumb_func_end ov12_02238358

	thumb_func_start ov12_0223843C
ov12_0223843C: ; 0x0223843C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetArgs
	ldr r3, _02238778 ; =0x0000244C
	mov r2, #0x67
	ldr r1, [r4, r3]
	add r7, r0, #0
	lsl r2, r2, #2
	str r1, [r7, r2]
	add r1, r3, #0
	sub r1, #0x40
	ldr r1, [r4, r1]
	sub r2, #0x10
	str r1, [r7, r2]
	sub r3, #0x40
	ldr r2, [r4, r3]
	mov r1, #0x10
	tst r1, r2
	bne _02238470
	bl sub_020302A4
_02238470:
	ldr r0, _0223877C ; =0x00002445
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _02238480
	add r0, r4, #0
	mov r1, #0
	bl ov12_02237ED0
_02238480:
	ldr r1, [r7]
	ldr r0, _02238780 ; =0x00000AA4
	tst r0, r1
	beq _0223848C
	mov r5, #0
	b _022384A0
_0223848C:
	ldr r0, _02238784 ; =0x00002420
	ldrb r0, [r4, r0]
	add r0, #0xfe
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0223849E
	ldr r5, _02238788 ; =0x00007FFF
	b _022384A0
_0223849E:
	mov r5, #0
_022384A0:
	mov r0, #0
	add r1, r5, #0
	bl sub_0200FBF4
	mov r0, #1
	add r1, r5, #0
	bl sub_0200FBF4
	add r0, r4, #0
	bl ov12_0223B798
	ldr r0, _02238784 ; =0x00002420
	ldrb r0, [r4, r0]
	cmp r0, #4
	beq _022384CE
	ldr r0, [r4, #0x6c]
	mov r1, #0
	bl GetPartyMonByIndex
	add r1, r0, #0
	add r0, r4, #0
	bl ov12_0223B870
_022384CE:
	mov r0, #0
	str r0, [sp]
	add r6, r7, #0
	add r5, r4, #0
_022384D6:
	ldr r0, [r5, #0x68]
	ldr r1, [r6, #4]
	bl Party_copy
	ldr r0, [r5, #0x68]
	bl FreeToHeap
	add r1, r6, #0
	add r1, #0xf8
	ldr r0, [r5, #0x48]
	ldr r1, [r1]
	bl PlayerProfile_copy
	ldr r0, [r5, #0x48]
	bl FreeToHeap
	ldr r0, [sp]
	add r6, r6, #4
	add r0, r0, #1
	add r5, r5, #4
	str r0, [sp]
	cmp r0, #4
	blt _022384D6
	mov r0, #0x1b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_020164C4
	mov r1, #0x42
	lsl r1, r1, #2
	ldr r0, [r4, #0x58]
	ldr r1, [r7, r1]
	bl Sav2_Bag_copy
	ldr r0, [r4, #0x58]
	bl FreeToHeap
	mov r1, #0x11
	lsl r1, r1, #4
	ldr r0, [r4, #0x60]
	ldr r1, [r7, r1]
	bl Pokedex_copy
	ldr r0, [r4, #0x60]
	bl FreeToHeap
	mov r0, #0x45
	ldr r1, [r4, #0x64]
	lsl r0, r0, #2
	str r1, [r7, r0]
	add r1, r0, #0
	ldr r2, [r4, #0x5c]
	sub r1, #8
	str r2, [r7, r1]
	add r1, r0, #0
	add r1, #0xac
	ldr r2, [r4, r1]
	add r1, r0, #0
	add r1, #0xa4
	str r2, [r7, r1]
	add r1, r4, #0
	add r1, #0x98
	ldr r2, [r1]
	add r1, r0, #0
	add r1, #0x14
	str r2, [r7, r1]
	add r1, r4, #0
	add r1, #0x9c
	ldr r2, [r1]
	add r1, r0, #0
	add r1, #0x20
	str r2, [r7, r1]
	add r1, r0, #0
	ldr r2, _0223878C ; =0x00002414
	add r1, #0x7c
	ldr r3, [r4, r2]
	add r0, #0x5c
	str r3, [r7, r1]
	add r1, r2, #0
	add r1, #0xc
	ldrb r3, [r4, r1]
	mov r1, #0x3f
	add r2, #0x28
	and r1, r3
	str r1, [r7, #0x14]
	ldr r1, [r4, r2]
	mov r2, #4
	str r1, [r7, r0]
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	mov r3, #0
	bl ov12_022581D4
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r7, r1]
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	mov r2, #3
	mov r3, #0
	bl ov12_022581D4
	mov r1, #0x4e
	lsl r1, r1, #2
	ldr r2, [r7, r1]
	mov r3, #0
	add r0, r2, r0
	str r0, [r7, r1]
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	mov r2, #6
	bl ov12_022581D4
	add r5, r0, #0
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	mov r2, #6
	mov r3, #2
	bl ov12_022581D4
	mov r1, #0x4f
	lsl r1, r1, #2
	ldr r2, [r7, r1]
	add r0, r5, r0
	add r0, r2, r0
	str r0, [r7, r1]
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	mov r2, #7
	mov r3, #0
	bl ov12_022581D4
	add r5, r0, #0
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	mov r2, #7
	mov r3, #2
	bl ov12_022581D4
	mov r1, #5
	lsl r1, r1, #6
	ldr r2, [r7, r1]
	add r0, r5, r0
	add r0, r2, r0
	str r0, [r7, r1]
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	mov r2, #3
	mov r3, #0
	bl ov12_022581D4
	mov r1, #0x6d
	lsl r1, r1, #2
	str r0, [r7, r1]
	ldr r0, _02238790 ; =0x00002478
	add r1, #0x10
	ldr r0, [r4, r0]
	mov r6, #0
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	str r0, [r7, r1]
	mov r7, #0x1d
	add r5, r4, #0
	lsl r7, r7, #4
_0223861E:
	ldr r0, [r5, r7]
	bl FreeToHeap
	add r6, r6, #1
	add r5, #0x10
	cmp r6, #4
	blt _0223861E
	ldr r0, [r4, #0x18]
	bl FreeToHeap
	ldr r0, [r4, #0x28]
	mov r1, #0
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x28]
	mov r1, #1
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x28]
	mov r1, #2
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x28]
	mov r1, #3
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0x28]
	bl sub_02003104
	ldr r0, [r4, #0xc]
	bl DestroyMsgData
	ldr r0, [r4, #0x10]
	bl DestroyMsgData
	ldr r0, [r4, #0x14]
	bl ScrStrBufs_delete
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02016F2C
	bl sub_02014F84
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl ov07_0221BFE0
	ldr r0, [r4, #0x30]
	bl ov12_022486FC
	ldr r0, [r4, #0x44]
	mov r6, #0
	cmp r0, #0
	ble _022386A8
	ldr r7, _02238794 ; =0x000023FD
	add r5, r4, #0
_02238694:
	ldrb r2, [r4, r7]
	ldr r1, [r5, #0x34]
	add r0, r4, #0
	bl ov12_02258E7C
	ldr r0, [r4, #0x44]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _02238694
_022386A8:
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	bl sub_02008524
	ldr r0, _02238794 ; =0x000023FD
	ldrb r0, [r4, r0]
	cmp r0, #2
	beq _022386C0
	add r0, r4, #0
	bl ov12_02237B6C
_022386C0:
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B8C
	ldr r0, [r4, #8]
	mov r1, #3
	bl WindowArray_dtor
	ldr r0, [r4, #4]
	bl FreeToHeap
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl MessagePrinter_delete
	ldr r0, [r4, #0x1c]
	bl DestroySysTask
	ldr r0, [r4, #0x20]
	bl DestroySysTask
	bl sub_02021238
	ldr r0, [r4]
	bl ov12_022396E8
	ldr r0, _02238798 ; =0x00002434
	ldr r0, [r4, r0]
	bl SetLCRNGSeed
	add r0, r4, #0
	bl ov12_0223BD2C
	cmp r0, #0
	beq _0223872E
	ldr r0, _0223879C ; =0x00000704
	mov r1, #0
	bl StopSE
_0223872E:
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0202067C
	add r0, r4, #0
	bl ov12_0223BFEC
	cmp r0, #0
	beq _02238748
	mov r0, #0x7f
	bl sub_020059D0
_02238748:
	mov r0, #0x92
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02238756
	bl ov12_0226BEF0
_02238756:
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, _022387A0 ; =FS_OVERLAY_ID(OVY_6)
	bl UnloadOverlayByID
	ldr r0, _022387A4 ; =FS_OVERLAY_ID(OVY_7)
	bl UnloadOverlayByID
	bl sub_02039998
	cmp r0, #0
	bne _02238776
	ldr r0, _022387A8 ; =FS_OVERLAY_ID(OVY_18)
	bl UnloadOverlayByID
_02238776:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02238778: .word 0x0000244C
_0223877C: .word 0x00002445
_02238780: .word 0x00000AA4
_02238784: .word 0x00002420
_02238788: .word 0x00007FFF
_0223878C: .word 0x00002414
_02238790: .word 0x00002478
_02238794: .word 0x000023FD
_02238798: .word 0x00002434
_0223879C: .word 0x00000704
_022387A0: .word FS_OVERLAY_ID(OVY_6)
_022387A4: .word FS_OVERLAY_ID(OVY_7)
_022387A8: .word FS_OVERLAY_ID(OVY_18)
	thumb_func_end ov12_0223843C

	thumb_func_start ov12_022387AC
ov12_022387AC: ; 0x022387AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x9c
	add r5, r0, #0
	add r4, r1, #0
	bl GX_DisableEngineALayers
	ldr r6, _02238994 ; =ov12_0226C0A8
	add r3, sp, #0x20
	mov r2, #5
_022387BE:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _022387BE
	add r0, sp, #0x20
	bl GX_SetBanks
	mov r1, #6
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x18
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x62
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	mov r1, #0x19
	mov r2, #1
	mov r0, #0
	lsl r1, r1, #0x16
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x66
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	mov r0, #0
	bl SetMasterBrightnessNeutral
	mov r0, #1
	bl SetMasterBrightnessNeutral
	ldr r6, _02238998 ; =ov12_0226BFE8
	add r3, sp, #0x10
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r1, _0223899C ; =0x000023FF
	mov r0, #1
	ldrb r2, [r5, r1]
	ldr r6, _022389A0 ; =ov12_0226C174
	add r3, sp, #0x48
	bic r2, r0
	mov r0, #1
	orr r0, r2
	strb r0, [r5, r1]
	mov r2, #0xa
_02238838:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02238838
	ldr r0, [r6]
	mov r1, #1
	str r0, [r3]
	add r0, r4, #0
	add r2, sp, #0x48
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #2
	add r2, sp, #0x64
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #3
	add r2, sp, #0x80
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r1, _022389A4 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strh r2, [r1]
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl ov12_0226604C
	add r0, r5, #0
	bl ov12_0223B708
	add r7, r0, #0
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #5
	mov r1, #1
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0xa
	bl sub_0200EB80
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	ldr r1, _022389A8 ; =0x00002404
	mov r0, #7
	ldr r1, [r5, r1]
	add r2, r4, #0
	add r1, r1, #3
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	add r0, r5, #0
	bl ov12_0223B52C
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r2, _022389A8 ; =0x00002404
	ldr r0, [r5, #0x28]
	ldr r3, [r5, r2]
	mov r1, #7
	lsl r2, r3, #1
	add r2, r3, r2
	add r2, #0xb0
	add r2, r2, r6
	mov r3, #5
	bl PaletteData_LoadNarc
	add r0, r7, #0
	bl sub_0200E640
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xa0
	str r0, [sp, #8]
	ldr r0, [r5, #0x28]
	mov r1, #0x26
	mov r3, #5
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xb0
	str r0, [sp, #8]
	ldr r0, [r5, #0x28]
	mov r1, #0x10
	mov r2, #8
	mov r3, #5
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	mov r0, #7
	mov r1, #2
	add r2, r4, #0
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _022389AC ; =0xFFFF1FFF
	ldr r3, _022389B0 ; =0x04001000
	and r2, r1
	str r2, [r0]
	ldr r2, [r3]
	and r1, r2
	add r2, r0, #0
	str r1, [r3]
	add r2, #0x48
	ldrh r3, [r2]
	mov r1, #0x3f
	add r0, #0x4a
	bic r3, r1
	strh r3, [r2]
	ldrh r2, [r0]
	bic r2, r1
	strh r2, [r0]
	bl GX_BothDispOn
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, _022389B4 ; =ov12_02239730
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	add sp, #0x9c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02238994: .word ov12_0226C0A8
_02238998: .word ov12_0226BFE8
_0223899C: .word 0x000023FF
_022389A0: .word ov12_0226C174
_022389A4: .word 0x04000008
_022389A8: .word 0x00002404
_022389AC: .word 0xFFFF1FFF
_022389B0: .word 0x04001000
_022389B4: .word ov12_02239730
	thumb_func_end ov12_022387AC

	thumb_func_start ov12_022389B8
ov12_022389B8: ; 0x022389B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov12_0223AB40
	add r4, r0, #0
	mov r0, #0x5f
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r5, #0
	mov r2, #0
	add r3, r4, #0
	bl ov12_02265FD4
	mov r0, #0x63
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r5, #0
	mov r2, #1
	add r3, r4, #0
	bl ov12_02265FD4
	add r0, r5, #0
	bl ov12_0223A7E4
	str r0, [sp]
	ldr r0, [r5, #0x44]
	mov r4, #0
	cmp r0, #0
	ble _02238A2A
	add r6, r5, #0
_022389F4:
	ldr r1, [sp]
	add r0, r5, #0
	mov r2, #2
	add r3, r4, #0
	bl ov12_022581D4
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov12_0223A880
	add r1, r0, #0
	add r0, r5, #0
	bl ov12_0223AA88
	add r2, r0, #0
	ldr r1, [r6, #0x34]
	add r0, r5, #0
	add r3, r7, #0
	bl ov12_02258DB0
	ldr r0, [r5, #0x44]
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, r0
	blt _022389F4
_02238A2A:
	bl ov12_0223A7A0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_022389B8

	thumb_func_start ov12_02238A30
ov12_02238A30: ; 0x02238A30
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	bl ov12_022660A8
	pop {r4, pc}
	thumb_func_end ov12_02238A30

	thumb_func_start ov12_02238A64
ov12_02238A64: ; 0x02238A64
	bx lr
	.balign 4, 0
	thumb_func_end ov12_02238A64

	thumb_func_start ov12_02238A68
ov12_02238A68: ; 0x02238A68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	add r4, r0, #0
	ldr r0, [r1]
	str r1, [sp, #4]
	str r0, [r4, #0x2c]
	mov r7, #0
	add r6, r4, #0
	add r5, r1, #0
_02238A7A:
	mov r0, #5
	bl PlayerProfile_new
	add r1, r0, #0
	add r0, r5, #0
	str r1, [r6, #0x48]
	add r0, #0xf8
	ldr r0, [r0]
	bl PlayerProfile_copy
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r7, r7, #1
	str r0, [r6, #0x78]
	add r6, r6, #4
	add r5, r5, #4
	cmp r7, #4
	blt _02238A7A
	mov r1, #0x1b
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldrh r1, [r0, r1]
	ldr r0, _02238D44 ; =0x00002446
	ldr r3, [sp, #4]
	strh r1, [r4, r0]
	mov r0, #0x1a
	ldr r1, _02238D48 ; =0x00002468
	mov r6, #0
	add r5, r4, #0
	lsl r0, r0, #4
_02238AB8:
	ldr r2, [r3, r0]
	add r6, r6, #1
	str r2, [r5, r1]
	add r3, r3, #4
	add r5, r5, #4
	cmp r6, #4
	blt _02238AB8
	bl GetLCRNGSeed
	ldr r1, _02238D4C ; =0x00002434
	ldr r2, [sp, #4]
	str r0, [r4, r1]
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r3, [r2, r0]
	add r2, r1, #0
	add r2, #0x14
	str r3, [r4, r2]
	ldr r2, [sp, #4]
	ldr r3, [r2, r0]
	add r2, r1, #0
	add r2, #0x18
	str r3, [r4, r2]
	ldr r2, [sp, #4]
	sub r0, #0x10
	ldr r0, [r2, r0]
	sub r1, #0x28
	str r0, [r4, r1]
	mov r0, #5
	bl Sav2_Bag_new
	str r0, [r4, #0x58]
	mov r1, #0x42
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	ldr r1, [r4, #0x58]
	bl Sav2_Bag_copy
	mov r0, #5
	bl Pokedex_new
	str r0, [r4, #0x60]
	mov r1, #0x11
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r1, [r4, #0x60]
	bl Pokedex_copy
	mov r1, #0x45
	lsl r1, r1, #2
	ldr r0, [sp, #4]
	add r2, r1, #0
	ldr r0, [r0, r1]
	add r3, r1, #0
	str r0, [r4, #0x64]
	ldr r0, [sp, #4]
	add r2, #0x1c
	ldr r2, [r0, r2]
	add r0, r1, #0
	add r0, #0xa0
	str r2, [r4, r0]
	add r2, r1, #0
	ldr r0, [sp, #4]
	add r2, #0x34
	ldr r2, [r0, r2]
	add r0, r1, #0
	add r0, #0xa4
	str r2, [r4, r0]
	add r2, r1, #0
	ldr r0, [sp, #4]
	sub r2, #8
	ldr r0, [r0, r2]
	add r2, r1, #0
	str r0, [r4, #0x5c]
	ldr r0, [sp, #4]
	add r2, #0xa4
	ldr r2, [r0, r2]
	add r0, r1, #0
	add r0, #0xac
	str r2, [r4, r0]
	add r2, r1, #0
	ldr r0, [sp, #4]
	add r2, #0x14
	ldr r2, [r0, r2]
	add r0, r4, #0
	add r0, #0x98
	str r2, [r0]
	add r2, r1, #0
	add r5, r1, #0
	ldr r0, [sp, #4]
	add r2, #0x4c
	ldr r2, [r0, r2]
	ldr r0, _02238D50 ; =0x00002424
	add r3, #0x20
	str r2, [r4, r0]
	ldr r2, [sp, #4]
	add r5, #0x58
	ldr r3, [r2, r3]
	add r2, r4, #0
	add r2, #0x9c
	str r3, [r2]
	add r3, r1, #0
	ldr r2, [sp, #4]
	add r3, #0x7c
	ldr r3, [r2, r3]
	add r2, r0, #0
	sub r2, #0x10
	str r3, [r4, r2]
	add r3, r1, #0
	ldr r2, [sp, #4]
	add r3, #0x3c
	ldr r3, [r2, r3]
	add r2, r0, #0
	sub r2, #0x24
	str r3, [r4, r2]
	add r3, r1, #0
	ldr r2, [sp, #4]
	add r3, #0x38
	ldr r3, [r2, r3]
	add r2, r0, #0
	sub r2, #0x20
	str r3, [r4, r2]
	add r3, r1, #0
	ldr r2, [sp, #4]
	add r3, #0x40
	ldr r3, [r2, r3]
	add r2, r0, #0
	sub r2, #0x1c
	str r3, [r4, r2]
	add r3, r1, #0
	ldr r2, [sp, #4]
	add r3, #0x48
	ldr r3, [r2, r3]
	add r2, r0, #0
	sub r2, #0x14
	str r3, [r4, r2]
	add r3, r1, #0
	ldr r2, [sp, #4]
	add r3, #0x80
	ldr r3, [r2, r3]
	add r2, r0, #0
	sub r2, #8
	str r3, [r4, r2]
	add r3, r1, #0
	ldr r2, [sp, #4]
	add r3, #0x50
	ldr r3, [r2, r3]
	add r2, r0, #4
	str r3, [r4, r2]
	add r3, r1, #0
	ldr r2, [sp, #4]
	add r3, #0x54
	ldr r3, [r2, r3]
	add r2, r0, #0
	add r2, #0xc
	str r3, [r4, r2]
	add r2, r0, #0
	add r2, #0x54
	ldr r2, [r4, r2]
	mov r3, #2
	bic r2, r3
	ldr r3, [sp, #4]
	ldr r3, [r3, r5]
	add r5, r1, #0
	lsl r3, r3, #0x1f
	lsr r3, r3, #0x1e
	orr r3, r2
	add r2, r0, #0
	add r2, #0x54
	str r3, [r4, r2]
	add r2, r0, #0
	add r2, #0x54
	ldr r2, [r4, r2]
	mov r3, #8
	bic r2, r3
	ldr r3, [sp, #4]
	add r5, #0xbc
	ldr r3, [r3, r5]
	lsl r3, r3, #0x1f
	lsr r3, r3, #0x1c
	orr r3, r2
	add r2, r0, #0
	add r2, #0x54
	str r3, [r4, r2]
	add r3, r1, #0
	ldr r2, [sp, #4]
	add r3, #0x60
	ldr r2, [r2, r3]
	add r0, #8
	str r2, [r4, r0]
	ldr r0, [sp, #4]
	add r1, #0x30
	ldr r0, [r0, r1]
	mov r1, #0x87
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [sp, #4]
	sub r1, #0xd8
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _02238C52
	bl GF_AssertFail
_02238C52:
	mov r1, #0x72
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	ldr r0, _02238D54 ; =0x00002488
	ldr r5, [sp, #4]
	str r1, [r4, r0]
	mov r0, #0
	str r0, [sp, #8]
	str r4, [sp, #0x34]
	add r6, r5, #0
	add r7, r4, #0
_02238C6A:
	ldr r0, [sp, #0x34]
	ldr r1, [r5, #0x18]
	add r0, #0xa0
	strh r1, [r0]
	add r3, r6, #0
	add r2, r7, #0
	mov r0, #6
	add r3, #0x28
	add r2, #0xac
	mov ip, r0
_02238C7E:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, ip
	sub r0, r0, #1
	mov ip, r0
	bne _02238C7E
	ldr r0, [r3]
	add r5, r5, #4
	str r0, [r2]
	ldr r0, [sp, #0x34]
	add r6, #0x34
	add r0, r0, #2
	str r0, [sp, #0x34]
	ldr r0, [sp, #8]
	add r7, #0x34
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #4
	blt _02238C6A
	add r0, r4, #0
	bl ov12_02248660
	ldr r7, _02238D58 ; =0x0000248C
	str r0, [r4, #0x30]
	mov r5, #0
	add r6, r4, #0
_02238CB2:
	mov r0, #5
	bl SavArray_Party_alloc
	str r0, [r6, #0x68]
	ldr r0, [sp, #4]
	add r6, r6, #4
	add r1, r0, r5
	mov r0, #0x73
	lsl r0, r0, #2
	ldrb r1, [r1, r0]
	add r0, r4, r5
	add r5, r5, #1
	strb r1, [r0, r7]
	cmp r5, #4
	blt _02238CB2
	mov r0, #0
	ldr r6, [sp, #4]
	str r0, [sp, #0xc]
_02238CD6:
	ldr r0, [r6, #4]
	mov r5, #0
	bl GetPartyCount
	cmp r0, #0
	ble _02238D08
_02238CE2:
	ldr r0, [r6, #4]
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r7, r0, #0
	bl GetMonGender
	str r0, [sp, #0x44]
	add r0, r7, #0
	mov r1, #0x6f
	add r2, sp, #0x44
	bl SetMonData
	ldr r0, [r6, #4]
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blt _02238CE2
_02238D08:
	ldr r0, [sp, #0xc]
	add r6, r6, #4
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #4
	blt _02238CD6
	ldr r0, [r4, #0x2c]
	mov r1, #4
	tst r1, r0
	bne _02238D1E
	b _022390CE
_02238D1E:
	add r0, r4, #0
	bl sub_02074E5C
	add r0, r4, #0
	bl ov12_0223BFC0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x38]
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl ov12_0223A664
	ldr r1, [r4, #0x2c]
	mov r0, #0x80
	tst r0, r1
	beq _02238E22
	ldr r6, _02238D5C ; =ov12_0226C2DC
	b _02238D60
	.balign 4, 0
_02238D44: .word 0x00002446
_02238D48: .word 0x00002468
_02238D4C: .word 0x00002434
_02238D50: .word 0x00002424
_02238D54: .word 0x00002488
_02238D58: .word 0x0000248C
_02238D5C: .word ov12_0226C2DC
_02238D60:
	mov r5, #0
	add r7, r4, #0
_02238D64:
	add r0, sp, #0x40
	strb r5, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #1]
	add r0, r4, #0
	add r1, sp, #0x40
	bl ov12_02258D74
	str r0, [r7, #0x34]
	add r5, r5, #1
	add r6, r6, #1
	add r7, r7, #4
	cmp r5, #4
	blt _02238D64
	str r5, [r4, #0x44]
	mov r6, #0
	add r5, r4, #0
_02238D86:
	ldr r1, [r5, #0x34]
	add r0, r4, #0
	bl ov12_02260EA4
	ldr r0, [sp, #4]
	ldr r1, [r5, #0x68]
	ldr r0, [r0, #4]
	bl Party_copy
	ldr r0, [sp, #4]
	add r6, r6, #1
	add r0, r0, #4
	add r5, r5, #4
	str r0, [sp, #4]
	cmp r6, #4
	blt _02238D86
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	ble _02238E18
	add r7, r4, #0
_02238DB2:
	ldr r0, [r7, #0x68]
	mov r5, #0
	bl GetPartyCount
	cmp r0, #0
	ble _02238DFC
_02238DBE:
	ldr r0, [r7, #0x68]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02238DF0
	add r0, r6, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02238DF0
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02238DFC
_02238DF0:
	ldr r0, [r7, #0x68]
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blt _02238DBE
_02238DFC:
	str r5, [sp]
	ldr r1, [r4, #0x30]
	ldr r3, [sp, #0x10]
	add r0, r4, #0
	mov r2, #2
	bl ov12_022582B8
	ldr r0, [sp, #0x10]
	ldr r1, [r4, #0x44]
	add r0, r0, #1
	add r7, r7, #4
	str r0, [sp, #0x10]
	cmp r0, r1
	blt _02238DB2
_02238E18:
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	bl ov12_02256F28
	b _022390C4
_02238E22:
	mov r0, #8
	tst r0, r1
	beq _02238F04
	mov r5, #0
	add r6, r4, #0
_02238E2C:
	add r0, sp, #0x40
	strb r5, [r0]
	ldr r1, [sp, #0x38]
	add r0, r4, #0
	bl ov12_0223BFCC
	lsl r1, r5, #0x10
	add r7, r0, #0
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl ov12_0223BFCC
	ldr r1, _022390DC ; =ov12_0226C008
	lsl r2, r7, #2
	add r1, r1, r2
	ldrb r1, [r0, r1]
	add r0, sp, #0x40
	strb r1, [r0, #1]
	add r0, r4, #0
	add r1, sp, #0x40
	bl ov12_02258D74
	str r0, [r6, #0x34]
	add r5, r5, #1
	add r6, r6, #4
	cmp r5, #4
	blt _02238E2C
	str r5, [r4, #0x44]
	mov r6, #0
	add r5, r4, #0
_02238E68:
	ldr r1, [r5, #0x34]
	add r0, r4, #0
	bl ov12_02260EA4
	ldr r0, [sp, #4]
	ldr r1, [r5, #0x68]
	ldr r0, [r0, #4]
	bl Party_copy
	ldr r0, [sp, #4]
	add r6, r6, #1
	add r0, r0, #4
	add r5, r5, #4
	str r0, [sp, #4]
	cmp r6, #4
	blt _02238E68
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	ble _02238EFA
	add r7, r4, #0
_02238E94:
	ldr r0, [r7, #0x68]
	mov r5, #0
	bl GetPartyCount
	cmp r0, #0
	ble _02238EDE
_02238EA0:
	ldr r0, [r7, #0x68]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02238ED2
	add r0, r6, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02238ED2
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02238EDE
_02238ED2:
	ldr r0, [r7, #0x68]
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blt _02238EA0
_02238EDE:
	str r5, [sp]
	ldr r1, [r4, #0x30]
	ldr r3, [sp, #0x14]
	add r0, r4, #0
	mov r2, #2
	bl ov12_022582B8
	ldr r0, [sp, #0x14]
	ldr r1, [r4, #0x44]
	add r0, r0, #1
	add r7, r7, #4
	str r0, [sp, #0x14]
	cmp r0, r1
	blt _02238E94
_02238EFA:
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	bl ov12_02256F28
	b _022390C4
_02238F04:
	mov r0, #2
	tst r0, r1
	bne _02238F0C
	b _02239018
_02238F0C:
	ldr r0, [sp, #0x38]
	ldr r1, _022390E0 ; =ov12_0226BFE0
	lsl r0, r0, #2
	mov r5, #0
	add r6, r1, r0
	add r7, r4, #0
_02238F18:
	add r0, sp, #0x40
	strb r5, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #1]
	add r0, r4, #0
	add r1, sp, #0x40
	bl ov12_02258D74
	add r1, r0, #0
	add r0, r4, #0
	str r1, [r7, #0x34]
	bl ov12_02260EA4
	add r5, r5, #1
	add r6, r6, #1
	add r7, r7, #4
	cmp r5, #4
	blt _02238F18
	str r5, [r4, #0x44]
	mov r6, #0
	add r5, r4, #0
_02238F42:
	ldr r0, [sp, #4]
	ldr r1, [r5, #0x68]
	ldr r0, [r0, #4]
	bl Party_copy
	ldr r0, [sp, #4]
	add r6, r6, #1
	add r0, r0, #4
	add r5, r5, #4
	str r0, [sp, #4]
	cmp r6, #4
	blt _02238F42
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	ble _02239016
_02238F64:
	ldr r0, [sp, #0x18]
	mov r1, #1
	and r0, r1
	str r0, [sp, #0x30]
	lsl r0, r0, #2
	add r7, r4, r0
	ldr r0, [r7, #0x68]
	mov r6, #0
	bl GetPartyCount
	cmp r0, #0
	ble _02238FFC
_02238F7C:
	ldr r0, [r7, #0x68]
	add r1, r6, #0
	bl GetPartyMonByIndex
	ldr r1, [sp, #0x18]
	add r5, r0, #0
	cmp r1, #1
	ble _02238FC8
	ldr r1, [r4, #0x30]
	ldr r3, [sp, #0x30]
	add r0, r4, #0
	mov r2, #2
	bl ov12_022581D4
	cmp r6, r0
	beq _02238FF0
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02238FF0
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02238FF0
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02238FFC
	b _02238FF0
_02238FC8:
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02238FF0
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02238FF0
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02238FFC
_02238FF0:
	ldr r0, [r7, #0x68]
	add r6, r6, #1
	bl GetPartyCount
	cmp r6, r0
	blt _02238F7C
_02238FFC:
	str r6, [sp]
	ldr r1, [r4, #0x30]
	ldr r3, [sp, #0x18]
	add r0, r4, #0
	mov r2, #2
	bl ov12_022582B8
	ldr r0, [sp, #0x18]
	ldr r1, [r4, #0x44]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, r1
	blt _02238F64
_02239016:
	b _022390C4
_02239018:
	ldr r0, [sp, #0x38]
	ldr r1, _022390E4 ; =ov12_0226BFDC
	lsl r0, r0, #1
	mov r5, #0
	add r6, r1, r0
	add r7, r4, #0
_02239024:
	add r0, sp, #0x40
	strb r5, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #1]
	add r0, r4, #0
	add r1, sp, #0x40
	bl ov12_02258D74
	add r1, r0, #0
	add r0, r4, #0
	str r1, [r7, #0x34]
	bl ov12_02260EA4
	add r5, r5, #1
	add r6, r6, #1
	add r7, r7, #4
	cmp r5, #2
	blt _02239024
	mov r0, #0
	str r5, [r4, #0x44]
	str r0, [sp, #0x1c]
	add r7, r4, #0
_02239050:
	ldr r0, [sp, #4]
	ldr r1, [r7, #0x68]
	ldr r0, [r0, #4]
	bl Party_copy
	ldr r0, [r7, #0x68]
	mov r5, #0
	bl GetPartyCount
	cmp r0, #0
	ble _022390A4
_02239066:
	ldr r0, [r7, #0x68]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02239098
	add r0, r6, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02239098
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _022390A4
_02239098:
	ldr r0, [r7, #0x68]
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blt _02239066
_022390A4:
	str r5, [sp]
	ldr r1, [r4, #0x30]
	ldr r3, [sp, #0x1c]
	add r0, r4, #0
	mov r2, #2
	bl ov12_022582B8
	ldr r0, [sp, #4]
	add r7, r7, #4
	add r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #4
	blt _02239050
_022390C4:
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	bl ov12_02256F28
	b _0223948A
_022390CE:
	mov r1, #0x10
	tst r1, r0
	bne _022390D6
	b _022391EA
_022390D6:
	ldr r6, _022390E8 ; =ov12_0226C2DC
	b _022390EC
	nop
_022390DC: .word ov12_0226C008
_022390E0: .word ov12_0226BFE0
_022390E4: .word ov12_0226BFDC
_022390E8: .word ov12_0226C2DC
_022390EC:
	mov r5, #0
	add r7, r4, #0
_022390F0:
	add r0, sp, #0x40
	strb r5, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #1]
	add r0, r4, #0
	add r1, sp, #0x40
	bl ov12_02258D74
	add r1, r0, #0
	add r0, r4, #0
	str r1, [r7, #0x34]
	bl ov12_02260EA4
	add r5, r5, #1
	add r6, r6, #1
	add r7, r7, #4
	cmp r5, #4
	blt _022390F0
	str r5, [r4, #0x44]
	mov r6, #0
	add r5, r4, #0
_0223911A:
	ldr r0, [sp, #4]
	ldr r1, [r5, #0x68]
	ldr r0, [r0, #4]
	bl Party_copy
	ldr r0, [sp, #4]
	add r6, r6, #1
	add r0, r0, #4
	add r5, r5, #4
	str r0, [sp, #4]
	cmp r6, #4
	blt _0223911A
	ldr r0, [r4, #0x44]
	mov r7, #0
	cmp r0, #0
	ble _022391DA
_0223913A:
	add r0, r4, #0
	add r1, r7, #0
	mov r5, #0
	bl ov12_0223A834
	cmp r0, #0
	ble _022391BE
_02239148:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov12_0223A880
	add r6, r0, #0
	cmp r7, #2
	bne _02239188
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _022391B0
	add r0, r6, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _022391B0
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _022391B0
	ldr r0, [sp, #0x3c]
	cmp r0, r5
	bne _022391BE
	b _022391B0
_02239188:
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _022391B0
	add r0, r6, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _022391B0
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _022391BE
_022391B0:
	add r0, r4, #0
	add r1, r7, #0
	add r5, r5, #1
	bl ov12_0223A834
	cmp r5, r0
	blt _02239148
_022391BE:
	str r5, [sp]
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	mov r2, #2
	add r3, r7, #0
	bl ov12_022582B8
	cmp r7, #0
	bne _022391D2
	str r5, [sp, #0x3c]
_022391D2:
	ldr r0, [r4, #0x44]
	add r7, r7, #1
	cmp r7, r0
	blt _0223913A
_022391DA:
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	bl ov12_02256F28
	ldr r0, _022394D8 ; =0x000023FC
	mov r1, #1
	strb r1, [r4, r0]
	b _0223948A
_022391EA:
	mov r1, #8
	tst r1, r0
	beq _022392BA
	ldr r6, _022394DC ; =ov12_0226C2DC
	mov r5, #0
	add r7, r4, #0
_022391F6:
	add r0, sp, #0x40
	strb r5, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #1]
	add r0, r4, #0
	add r1, sp, #0x40
	bl ov12_02258D74
	add r1, r0, #0
	add r0, r4, #0
	str r1, [r7, #0x34]
	bl ov12_02260EA4
	add r5, r5, #1
	add r6, r6, #1
	add r7, r7, #4
	cmp r5, #4
	blt _022391F6
	str r5, [r4, #0x44]
	mov r6, #0
	add r5, r4, #0
_02239220:
	ldr r0, [sp, #4]
	ldr r1, [r5, #0x68]
	ldr r0, [r0, #4]
	bl Party_copy
	ldr r0, [sp, #4]
	add r6, r6, #1
	add r0, r0, #4
	add r5, r5, #4
	str r0, [sp, #4]
	cmp r6, #4
	blt _02239220
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	ble _022392AA
	add r7, r4, #0
_02239244:
	ldr r0, [r7, #0x68]
	mov r5, #0
	bl GetPartyCount
	cmp r0, #0
	ble _0223928E
_02239250:
	ldr r0, [r7, #0x68]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02239282
	add r0, r6, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02239282
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0223928E
_02239282:
	ldr r0, [r7, #0x68]
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blt _02239250
_0223928E:
	str r5, [sp]
	ldr r1, [r4, #0x30]
	ldr r3, [sp, #0x20]
	add r0, r4, #0
	mov r2, #2
	bl ov12_022582B8
	ldr r0, [sp, #0x20]
	ldr r1, [r4, #0x44]
	add r0, r0, #1
	add r7, r7, #4
	str r0, [sp, #0x20]
	cmp r0, r1
	blt _02239244
_022392AA:
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	bl ov12_02256F28
	ldr r0, _022394D8 ; =0x000023FC
	mov r1, #1
	strb r1, [r4, r0]
	b _0223948A
_022392BA:
	mov r1, #2
	tst r0, r1
	bne _022392C2
	b _022393D6
_022392C2:
	ldr r6, _022394DC ; =ov12_0226C2DC
	mov r5, #0
	add r7, r4, #0
_022392C8:
	add r0, sp, #0x40
	strb r5, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #1]
	add r0, r4, #0
	add r1, sp, #0x40
	bl ov12_02258D74
	add r1, r0, #0
	add r0, r4, #0
	str r1, [r7, #0x34]
	bl ov12_02260EA4
	add r5, r5, #1
	add r6, r6, #1
	add r7, r7, #4
	cmp r5, #4
	blt _022392C8
	str r5, [r4, #0x44]
	mov r6, #0
	add r5, r4, #0
_022392F2:
	ldr r0, [sp, #4]
	ldr r1, [r5, #0x68]
	ldr r0, [r0, #4]
	bl Party_copy
	ldr r0, [sp, #4]
	add r6, r6, #1
	add r0, r0, #4
	add r5, r5, #4
	str r0, [sp, #4]
	cmp r6, #4
	blt _022392F2
	mov r0, #0
	str r0, [sp, #0x24]
	ldr r0, [r4, #0x44]
	cmp r0, #0
	ble _022393C6
_02239314:
	ldr r0, [sp, #0x24]
	mov r1, #1
	and r0, r1
	str r0, [sp, #0x2c]
	lsl r0, r0, #2
	add r7, r4, r0
	ldr r0, [r7, #0x68]
	mov r6, #0
	bl GetPartyCount
	cmp r0, #0
	ble _022393AC
_0223932C:
	ldr r0, [r7, #0x68]
	add r1, r6, #0
	bl GetPartyMonByIndex
	ldr r1, [sp, #0x24]
	add r5, r0, #0
	cmp r1, #1
	ble _02239378
	ldr r1, [r4, #0x30]
	ldr r3, [sp, #0x2c]
	add r0, r4, #0
	mov r2, #2
	bl ov12_022581D4
	cmp r6, r0
	beq _022393A0
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _022393A0
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _022393A0
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _022393AC
	b _022393A0
_02239378:
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _022393A0
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _022393A0
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _022393AC
_022393A0:
	ldr r0, [r7, #0x68]
	add r6, r6, #1
	bl GetPartyCount
	cmp r6, r0
	blt _0223932C
_022393AC:
	str r6, [sp]
	ldr r1, [r4, #0x30]
	ldr r3, [sp, #0x24]
	add r0, r4, #0
	mov r2, #2
	bl ov12_022582B8
	ldr r0, [sp, #0x24]
	ldr r1, [r4, #0x44]
	add r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, r1
	blt _02239314
_022393C6:
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	bl ov12_02256F28
	ldr r0, _022394D8 ; =0x000023FC
	mov r1, #1
	strb r1, [r4, r0]
	b _0223948A
_022393D6:
	ldr r6, _022394E0 ; =_0226BFD8
	mov r5, #0
	add r7, r4, #0
_022393DC:
	add r0, sp, #0x40
	strb r5, [r0]
	ldrb r1, [r6]
	strb r1, [r0, #1]
	add r0, r4, #0
	add r1, sp, #0x40
	bl ov12_02258D74
	add r1, r0, #0
	add r0, r4, #0
	str r1, [r7, #0x34]
	bl ov12_02260EA4
	add r5, r5, #1
	add r6, r6, #1
	add r7, r7, #4
	cmp r5, #2
	blt _022393DC
	mov r0, #0
	str r5, [r4, #0x44]
	str r0, [sp, #0x28]
	add r7, r4, #0
_02239408:
	ldr r0, [sp, #4]
	ldr r1, [r7, #0x68]
	ldr r0, [r0, #4]
	bl Party_copy
	ldr r0, [r7, #0x68]
	mov r5, #0
	bl GetPartyCount
	cmp r0, #0
	ble _0223945C
_0223941E:
	ldr r0, [r7, #0x68]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02239450
	add r0, r6, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02239450
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0223945C
_02239450:
	ldr r0, [r7, #0x68]
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blt _0223941E
_0223945C:
	str r5, [sp]
	ldr r1, [r4, #0x30]
	ldr r3, [sp, #0x28]
	add r0, r4, #0
	mov r2, #2
	bl ov12_022582B8
	ldr r0, [sp, #4]
	add r7, r7, #4
	add r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #4
	blt _02239408
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	bl ov12_02256F28
	ldr r0, _022394D8 ; =0x000023FC
	mov r1, #1
	strb r1, [r4, r0]
_0223948A:
	mov r0, #2
	ldr r1, [r4, #0x2c]
	lsl r0, r0, #8
	tst r0, r1
	beq _022394A6
	ldr r0, [r4, #0x6c]
	mov r1, #0
	bl GetPartyMonByIndex
	add r2, r4, #0
	mov r1, #0x90
	add r2, #0xf4
	bl GetMonData
_022394A6:
	ldr r1, [r4, #0x2c]
	mov r0, #1
	tst r0, r1
	beq _0223954E
	add r0, r4, #0
	add r0, #0xe1
	ldrb r0, [r0]
	bl ov12_022395BC
	cmp r0, #1
	beq _022394C8
	ldr r0, _022394E4 ; =0x00000149
	ldrb r0, [r4, r0]
	bl ov12_022395BC
	cmp r0, #1
	bne _0223954E
_022394C8:
	ldr r0, [r4, #0x68]
	mov r5, #0
	bl GetPartyCount
	cmp r0, #0
	ble _02239516
	ldr r7, _022394E8 ; =0x00002408
	b _022394EC
	.balign 4, 0
_022394D8: .word 0x000023FC
_022394DC: .word ov12_0226C2DC
_022394E0: .word _0226BFD8
_022394E4: .word 0x00000149
_022394E8: .word 0x00002408
_022394EC:
	ldr r0, [r4, #0x68]
	add r1, r5, #0
	bl GetPartyMonByIndex
	ldr r2, [r4, r7]
	add r6, r0, #0
	lsl r2, r2, #0x10
	mov r1, #3
	lsr r2, r2, #0x10
	bl MonApplyFriendshipMod
	add r0, r6, #0
	mov r1, #2
	bl ApplyMonMoodModifier
	ldr r0, [r4, #0x68]
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blt _022394EC
_02239516:
	ldr r0, [r4, #0x70]
	mov r5, #0
	bl GetPartyCount
	cmp r0, #0
	ble _0223954E
	ldr r7, _022395B0 ; =0x00002408
_02239524:
	ldr r0, [r4, #0x70]
	add r1, r5, #0
	bl GetPartyMonByIndex
	ldr r2, [r4, r7]
	add r6, r0, #0
	lsl r2, r2, #0x10
	mov r1, #3
	lsr r2, r2, #0x10
	bl MonApplyFriendshipMod
	add r0, r6, #0
	mov r1, #2
	bl ApplyMonMoodModifier
	ldr r0, [r4, #0x70]
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blt _02239524
_0223954E:
	ldr r0, _022395B4 ; =0x0000247C
	mov r7, #0
	sub r6, r0, #4
	str r7, [r4, r0]
	add r1, r6, #0
	ldr r2, [r4, r1]
	mov r1, #4
	bic r2, r1
	sub r0, r0, #4
	str r2, [r4, r0]
	ldr r0, [r4, #0x44]
	add r5, r7, #0
	cmp r0, #0
	ble _02239594
_0223956A:
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_0223AA40
	bl PlayerProfile_GetVersion
	cmp r0, #GAME_VERSION
	beq _0223957C
	mov r7, #1
_0223957C:
	cmp r0, #7
	beq _0223958C
	cmp r0, #8
	beq _0223958C
	ldr r1, [r4, r6]
	mov r0, #4
	orr r0, r1
	str r0, [r4, r6]
_0223958C:
	ldr r0, [r4, #0x44]
	add r5, r5, #1
	cmp r5, r0
	blt _0223956A
_02239594:
	ldr r0, _022395B8 ; =0x000023FC
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _022395A4
	add r0, #0x80
	add sp, #0x48
	str r7, [r4, r0]
	pop {r3, r4, r5, r6, r7, pc}
_022395A4:
	mov r1, #0
	add r0, #0x80
	str r1, [r4, r0]
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022395B0: .word 0x00002408
_022395B4: .word 0x0000247C
_022395B8: .word 0x000023FC
	thumb_func_end ov12_02238A68

	thumb_func_start ov12_022395BC
ov12_022395BC: ; 0x022395BC
	cmp r0, #0x69
	bgt _0223961A
	bge _0223963C
	cmp r0, #0x62
	bgt _0223960C
	bge _0223963C
	add r1, r0, #0
	sub r1, #0x42
	cmp r1, #0x17
	bhi _02239640
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022395DC: ; jump table
	.short _0223963C - _022395DC - 2 ; case 0
	.short _0223963C - _022395DC - 2 ; case 1
	.short _02239640 - _022395DC - 2 ; case 2
	.short _02239640 - _022395DC - 2 ; case 3
	.short _0223963C - _022395DC - 2 ; case 4
	.short _02239640 - _022395DC - 2 ; case 5
	.short _0223963C - _022395DC - 2 ; case 6
	.short _0223963C - _022395DC - 2 ; case 7
	.short _0223963C - _022395DC - 2 ; case 8
	.short _0223963C - _022395DC - 2 ; case 9
	.short _0223963C - _022395DC - 2 ; case 10
	.short _02239640 - _022395DC - 2 ; case 11
	.short _02239640 - _022395DC - 2 ; case 12
	.short _02239640 - _022395DC - 2 ; case 13
	.short _02239640 - _022395DC - 2 ; case 14
	.short _02239640 - _022395DC - 2 ; case 15
	.short _02239640 - _022395DC - 2 ; case 16
	.short _02239640 - _022395DC - 2 ; case 17
	.short _02239640 - _022395DC - 2 ; case 18
	.short _02239640 - _022395DC - 2 ; case 19
	.short _0223963C - _022395DC - 2 ; case 20
	.short _0223963C - _022395DC - 2 ; case 21
	.short _0223963C - _022395DC - 2 ; case 22
	.short _0223963C - _022395DC - 2 ; case 23
_0223960C:
	cmp r0, #0x67
	bgt _02239614
	beq _0223963C
	b _02239640
_02239614:
	cmp r0, #0x68
	beq _0223963C
	b _02239640
_0223961A:
	cmp r0, #0x6b
	bgt _02239626
	bge _0223963C
	cmp r0, #0x6a
	beq _0223963C
	b _02239640
_02239626:
	cmp r0, #0x6c
	bgt _0223962E
	beq _0223963C
	b _02239640
_0223962E:
	cmp r0, #0x70
	bgt _02239640
	cmp r0, #0x6e
	blt _02239640
	beq _0223963C
	cmp r0, #0x70
	bne _02239640
_0223963C:
	mov r0, #1
	bx lr
_02239640:
	mov r0, #0
	bx lr
	thumb_func_end ov12_022395BC

	thumb_func_start ov12_02239644
ov12_02239644: ; 0x02239644
	push {r3, lr}
	sub sp, #8
	mov r2, #2
	mov r1, #0
	ldr r0, _02239660 ; =ov12_02239664
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, #5
	add r3, r1, #0
	bl GF_3DVramMan_Create
	add sp, #8
	pop {r3, pc}
	nop
_02239660: .word ov12_02239664
	thumb_func_end ov12_02239644

	thumb_func_start ov12_02239664
ov12_02239664: ; 0x02239664
	push {r3, lr}
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r0, _022396D0 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _022396D4 ; =0xFFFFCFFD
	and r2, r1
	strh r2, [r0]
	add r2, r1, #2
	ldrh r3, [r0]
	add r1, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _022396D8 ; =0x0000CFFB
	and r3, r2
	strh r3, [r0]
	ldrh r3, [r0]
	sub r2, #0x1c
	and r3, r1
	mov r1, #8
	orr r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	and r1, r2
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _022396DC ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _022396E0 ; =0xBFFF0000
	ldr r0, _022396E4 ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_022396D0: .word 0x04000008
_022396D4: .word 0xFFFFCFFD
_022396D8: .word 0x0000CFFB
_022396DC: .word 0x00007FFF
_022396E0: .word 0xBFFF0000
_022396E4: .word 0x04000580
	thumb_func_end ov12_02239664

	thumb_func_start ov12_022396E8
ov12_022396E8: ; 0x022396E8
	ldr r3, _022396EC ; =GF_3DVramMan_Delete
	bx r3
	.balign 4, 0
_022396EC: .word GF_3DVramMan_Delete
	thumb_func_end ov12_022396E8

	thumb_func_start ov12_022396F0
ov12_022396F0: ; 0x022396F0
	push {r3, r4, r5, lr}
	ldr r3, _02239728 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r0, #2
	mov r1, #0
	ldr r3, [r3]
	lsl r0, r0, #0xe
	add r2, r1, #0
	blx r3
	ldr r3, _0223972C ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r1, #0
	add r4, r0, #0
	ldr r3, [r3]
	mov r0, #0xc0
	add r2, r1, #0
	blx r3
	add r5, r0, #0
	cmp r4, #0
	bne _02239718
	bl GF_AssertFail
_02239718:
	cmp r5, #0
	bne _02239720
	bl GF_AssertFail
_02239720:
	bl sub_02014DA0
	pop {r3, r4, r5, pc}
	nop
_02239728: .word NNS_GfdDefaultFuncAllocTexVram
_0223972C: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end ov12_022396F0

	thumb_func_start ov12_02239730
ov12_02239730: ; 0x02239730
	push {r3, r4, r5, lr}
	sub sp, #0x50
	ldr r1, _022397C8 ; =0x000023FF
	add r4, r0, #0
	ldrb r2, [r4, r1]
	lsl r0, r2, #0x1f
	lsr r0, r0, #0x1f
	beq _02239750
	mov r0, #1
	bic r2, r0
	strb r2, [r4, r1]
	ldr r0, _022397CC ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _022397D0 ; =0x04001050
	strh r1, [r0]
_02239750:
	ldr r1, _022397C8 ; =0x000023FF
	ldrb r2, [r4, r1]
	lsl r0, r2, #0x1e
	lsr r0, r0, #0x1f
	beq _02239774
	mov r0, #2
	bic r2, r0
	strb r2, [r4, r1]
	ldr r5, _022397D4 ; =ov12_0226C0D0
	add r3, sp, #0x28
	mov r2, #5
_02239766:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02239766
	add r0, sp, #0x28
	bl GX_SetBanks
_02239774:
	ldr r1, _022397C8 ; =0x000023FF
	ldrb r2, [r4, r1]
	lsl r0, r2, #0x1d
	lsr r0, r0, #0x1f
	beq _02239798
	mov r0, #4
	bic r2, r0
	strb r2, [r4, r1]
	ldr r5, _022397D8 ; =ov12_0226C0F8
	add r3, sp, #0
	mov r2, #5
_0223978A:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0223978A
	add r0, sp, #0
	bl GX_SetBanks
_02239798:
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	bl sub_02009418
	bl GF_RunVramTransferTasks
	bl sub_0200D034
	ldr r0, [r4, #0x28]
	bl sub_0200398C
	ldr r0, [r4, #4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _022397DC ; =0x027E0000
	ldr r1, _022397E0 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	add sp, #0x50
	pop {r3, r4, r5, pc}
	nop
_022397C8: .word 0x000023FF
_022397CC: .word 0x04000050
_022397D0: .word 0x04001050
_022397D4: .word ov12_0226C0D0
_022397D8: .word ov12_0226C0F8
_022397DC: .word 0x027E0000
_022397E0: .word 0x00003FF8
	thumb_func_end ov12_02239730

	thumb_func_start ov12_022397E4
ov12_022397E4: ; 0x022397E4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0200398C
	bl GF_RunVramTransferTasks
	ldr r0, [r4, #4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _02239808 ; =0x027E0000
	ldr r1, _0223980C ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_02239808: .word 0x027E0000
_0223980C: .word 0x00003FF8
	thumb_func_end ov12_022397E4

	thumb_func_start ov12_02239810
ov12_02239810: ; 0x02239810
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4, #4]
	mov r0, #5
	bl sub_020399FC
	ldr r0, _02239850 ; =0x000023FD
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _02239828
	cmp r0, #3
	bne _0223984E
_02239828:
	cmp r0, #0
	bne _02239830
	bl ov06_0221BAF0
_02239830:
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	bl sub_02008120
	add r4, #0x94
	ldr r0, [r4]
	bl sub_0200D020
	bl sub_0200D03C
	mov r0, #1
	mov r1, #0
	bl sub_02026E50
_0223984E:
	pop {r4, pc}
	.balign 4, 0
_02239850: .word 0x000023FD
	thumb_func_end ov12_02239810

	thumb_func_start ov12_02239854
ov12_02239854: ; 0x02239854
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r0, r5, #0
	bl ov12_0223A7F0
	str r0, [sp]
	add r0, r5, #0
	mov r6, #0
	bl ov12_0223BD2C
	add r4, r0, #0
	add r0, r5, #0
	bl ov12_0223A7E0
	mov r1, #0x22
	lsl r1, r1, #4
	tst r0, r1
	beq _0223987A
	b _02239984
_0223987A:
	mov r0, #2
	tst r0, r4
	beq _02239898
	mov r0, #1
	tst r0, r4
	beq _02239984
	ldr r0, _02239988 ; =0x00000704
	add r1, r6, #0
	bl StopSE
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223BD3C
	pop {r3, r4, r5, r6, r7, pc}
_02239898:
	ldr r0, [sp]
	add r4, r6, #0
	cmp r0, #0
	ble _02239906
_022398A0:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0223A7E8
	add r7, r0, #0
	bl ov12_02261264
	cmp r0, #0
	bne _022398BE
	add r0, r5, #0
	bl ov12_0223B514
	mov r1, #0x10
	tst r0, r1
	beq _022398D6
_022398BE:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0223AB1C
	cmp r0, #0
	bne _022398FE
	add r0, r5, #0
	bl ov12_0223B514
	mov r1, #0x10
	tst r0, r1
	beq _022398FE
_022398D6:
	add r0, r7, #0
	bl ov12_0226127C
	add r1, r0, #0
	beq _022398FE
	ldr r0, [r1, #0x28]
	ldr r1, [r1, #0x2c]
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	mov r2, #0x30
	bl sub_020880B0
	cmp r0, #1
	bne _022398FE
	add r0, r4, #0
	bl MaskOfFlagNo
	orr r6, r0
_022398FE:
	ldr r0, [sp]
	add r4, r4, #1
	cmp r4, r0
	blt _022398A0
_02239906:
	cmp r6, #0
	beq _0223992C
	add r0, r5, #0
	bl ov12_0223BD2C
	cmp r0, #0
	bne _0223992C
	ldr r0, _02239988 ; =0x00000704
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223BD3C
	add r0, r5, #0
	mov r1, #4
	bl ov12_0223BD68
	b _0223994A
_0223992C:
	cmp r6, #0
	bne _0223994A
	add r0, r5, #0
	bl ov12_0223BD2C
	cmp r0, #0
	beq _0223994A
	ldr r0, _02239988 ; =0x00000704
	mov r1, #0
	bl StopSE
	add r0, r5, #0
	mov r1, #0
	bl ov12_0223BD3C
_0223994A:
	add r0, r5, #0
	bl ov12_0223BD2C
	cmp r0, #0
	beq _02239984
	add r0, r5, #0
	bl ov12_0223BD58
	add r4, r0, #0
	ldr r0, _02239988 ; =0x00000704
	bl IsSEPlaying
	cmp r0, #0
	bne _02239984
	sub r1, r4, #1
	bne _0223997A
	ldr r0, _02239988 ; =0x00000704
	bl PlaySE
	add r0, r5, #0
	mov r1, #4
	bl ov12_0223BD68
	pop {r3, r4, r5, r6, r7, pc}
_0223997A:
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov12_0223BD68
_02239984:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02239988: .word 0x00000704
	thumb_func_end ov12_02239854

	thumb_func_start ov12_0223998C
ov12_0223998C: ; 0x0223998C
	push {r3, r4, r5, lr}
	ldr r3, _022399B8 ; =0x00002438
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, r3]
	mov r1, #1
	add r0, r0, #3
	str r0, [r4, r3]
	ldr r0, [r4, #4]
	ldr r3, [r4, r3]
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r0, _022399B8 ; =0x00002438
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _022399B4
	add r0, r5, #0
	bl DestroySysTask
_022399B4:
	pop {r3, r4, r5, pc}
	nop
_022399B8: .word 0x00002438
	thumb_func_end ov12_0223998C

	thumb_func_start ov12_022399BC
ov12_022399BC: ; 0x022399BC
	push {r3, lr}
	bl sub_02039998
	cmp r0, #0
	bne _022399CE
	ldr r0, _022399D0 ; =FS_OVERLAY_ID(OVY_18)
	mov r1, #2
	bl HandleLoadOverlay
_022399CE:
	pop {r3, pc}
	.balign 4, 0
_022399D0: .word FS_OVERLAY_ID(OVY_18)
	thumb_func_end ov12_022399BC

	thumb_func_start ov12_022399D4
ov12_022399D4: ; 0x022399D4
	push {r4, r5, r6, lr}
	sub sp, #0x68
	add r4, r1, #0
	ldr r1, _02239C00 ; =0x00001028
	mov r2, #5
	bl OverlayManager_CreateAndGetData
	add r5, r0, #0
	ldr r0, _02239C04 ; =0x00001020
	str r4, [r5]
	mov r2, #0
	strb r2, [r5, r0]
	add r1, r0, #1
	strb r2, [r5, r1]
	add r0, r0, #2
	strh r2, [r5, r0]
	mov r0, #5
	bl sub_020030E8
	str r0, [r5, #0xc]
	mov r1, #1
	bl sub_02003B50
	mov r2, #2
	ldr r0, [r5, #0xc]
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #5
	bl PaletteData_AllocBuffers
	mov r1, #0
	mov r0, #1
	str r1, [sp]
	lsl r0, r0, #8
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r2, #2
	add r3, r1, #0
	bl sub_02003D5C
	mov r0, #5
	bl BgConfig_Alloc
	str r0, [r5, #4]
	mov r0, #5
	mov r1, #1
	bl AllocWindows
	str r0, [r5, #8]
	add r0, r5, #0
	bl sub_02074EC4
	bl GX_DisableEngineALayers
	ldr r6, _02239C08 ; =ov12_0226C080
	add r3, sp, #0x40
	mov r2, #5
_02239A46:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02239A46
	add r0, sp, #0x40
	bl GX_SetBanks
	mov r1, #6
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x18
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x62
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	mov r1, #0x19
	mov r2, #1
	mov r0, #0
	lsl r1, r1, #0x16
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x66
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	mov r1, #5
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x18
	lsl r2, r2, #8
	bl MIi_CpuClear16
	ldr r6, _02239C0C ; =ov12_0226BFF8
	add r3, sp, #0x30
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r6, _02239C10 ; =ov12_0226C044
	add r3, sp, #0x14
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
	ldr r0, [r5, #4]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #4]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Options_GetFrame
	add r4, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r1, #1
	ldr r0, [r5, #4]
	add r2, r1, #0
	mov r3, #0xa
	bl sub_0200EB80
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xb0
	str r0, [sp, #8]
	ldr r0, [r5, #0xc]
	mov r1, #0x10
	mov r2, #8
	mov r3, #5
	bl PaletteData_LoadNarc
	add r0, r4, #0
	bl sub_0200E640
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xa0
	str r0, [sp, #8]
	ldr r0, [r5, #0xc]
	mov r1, #0x26
	mov r3, #5
	bl PaletteData_LoadNarc
	mov r1, #0
	mov r0, #1
	str r1, [sp]
	lsl r0, r0, #8
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02003D5C
	bl GX_BothDispOn
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r2, _02239C14 ; =0x04000304
	mov r3, #2
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0x1f
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	mov r2, #1
	bl AddWindowParameterized
	ldr r0, [r5, #8]
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r5, #8]
	mov r1, #0
	mov r2, #1
	mov r3, #0xa
	bl DrawFrameAndWindow2
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xc5
	mov r3, #5
	bl NewMsgDataFromNarc
	add r4, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #5
	bl String_ctor
	add r6, r0, #0
	ldr r1, _02239C18 ; =0x0000039B
	add r0, r4, #0
	add r2, r6, #0
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r5, #8]
	mov r1, #1
	add r2, r6, #0
	bl AddTextPrinterParameterized
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	bl DestroyMsgData
	ldr r0, _02239C1C ; =ov12_022397E4
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r5, #0xc]
	ldr r2, _02239C20 ; =0x0000FFFF
	mov r1, #5
	bl sub_02003370
	ldr r0, [r5, #8]
	mov r1, #1
	bl sub_0200F0AC
	ldr r1, _02239C24 ; =0x00001024
	str r0, [r5, r1]
	bl ov12_0223A7A0
	add sp, #0x68
	pop {r4, r5, r6, pc}
	nop
_02239C00: .word 0x00001028
_02239C04: .word 0x00001020
_02239C08: .word ov12_0226C080
_02239C0C: .word ov12_0226BFF8
_02239C10: .word ov12_0226C044
_02239C14: .word 0x04000304
_02239C18: .word 0x0000039B
_02239C1C: .word ov12_022397E4
_02239C20: .word 0x0000FFFF
_02239C24: .word 0x00001024
	thumb_func_end ov12_022399D4

	thumb_func_start ov12_02239C28
ov12_02239C28: ; 0x02239C28
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r1, [r4, #4]
	mov r0, #5
	bl sub_020399FC
	ldr r0, _02239F2C ; =0x00001021
	mov r7, #0
	ldrb r1, [r4, r0]
	cmp r1, #0x21
	bls _02239C46
	b _0223A06C
_02239C46:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02239C52: ; jump table
	.short _02239C96 - _02239C52 - 2 ; case 0
	.short _02239CAC - _02239C52 - 2 ; case 1
	.short _02239CC0 - _02239C52 - 2 ; case 2
	.short _02239CD0 - _02239C52 - 2 ; case 3
	.short _02239D0A - _02239C52 - 2 ; case 4
	.short _02239FE2 - _02239C52 - 2 ; case 5
	.short _02239D22 - _02239C52 - 2 ; case 6
	.short _02239D3C - _02239C52 - 2 ; case 7
	.short _02239FE2 - _02239C52 - 2 ; case 8
	.short _02239D50 - _02239C52 - 2 ; case 9
	.short _02239D6C - _02239C52 - 2 ; case 10
	.short _02239FE2 - _02239C52 - 2 ; case 11
	.short _02239D80 - _02239C52 - 2 ; case 12
	.short _02239D9A - _02239C52 - 2 ; case 13
	.short _02239FE2 - _02239C52 - 2 ; case 14
	.short _02239DAE - _02239C52 - 2 ; case 15
	.short _02239DC8 - _02239C52 - 2 ; case 16
	.short _02239FE2 - _02239C52 - 2 ; case 17
	.short _02239DDC - _02239C52 - 2 ; case 18
	.short _02239DF6 - _02239C52 - 2 ; case 19
	.short _02239FE2 - _02239C52 - 2 ; case 20
	.short _02239E0A - _02239C52 - 2 ; case 21
	.short _02239E4E - _02239C52 - 2 ; case 22
	.short _02239FE2 - _02239C52 - 2 ; case 23
	.short _02239E8A - _02239C52 - 2 ; case 24
	.short _02239EBE - _02239C52 - 2 ; case 25
	.short _02239FE2 - _02239C52 - 2 ; case 26
	.short _02239EF8 - _02239C52 - 2 ; case 27
	.short _02239F38 - _02239C52 - 2 ; case 28
	.short _02239FE2 - _02239C52 - 2 ; case 29
	.short _02239F74 - _02239C52 - 2 ; case 30
	.short _02239FA8 - _02239C52 - 2 ; case 31
	.short _02239FE2 - _02239C52 - 2 ; case 32
	.short _0223A052 - _02239C52 - 2 ; case 33
_02239C96:
	add r0, r7, #0
	bl SetMasterBrightnessNeutral
	mov r0, #1
	bl sub_02037930
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239CAC:
	ldr r0, [r4, #0xc]
	bl sub_02003B44
	cmp r0, #0
	bne _02239D5A
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239CC0:
	mov r0, #0x32
	bl sub_02037AC0
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239CD0:
	mov r0, #0x32
	bl sub_02037B38
	cmp r0, #0
	beq _02239CF2
	mov r0, #0x33
	bl sub_02037AC0
	ldr r0, _02239F30 ; =0x00001022
	add r1, r7, #0
	strh r1, [r4, r0]
	sub r1, r0, #1
	ldrb r1, [r4, r1]
	sub r0, r0, #1
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239CF2:
	ldr r0, _02239F30 ; =0x00001022
	ldrh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, r0]
	ldrh r1, [r4, r0]
	ldr r0, _02239F34 ; =0x00000708
	cmp r1, r0
	bls _02239D5A
	mov r0, #1
	bl sub_02039AD8
	b _0223A06C
_02239D0A:
	mov r1, #5
	add r0, r4, #0
	lsl r1, r1, #6
	bl sub_02075074
	cmp r0, #1
	bne _02239D5A
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239D22:
	add r0, r4, #0
	bl sub_020750E0
	cmp r0, #1
	bne _02239D5A
	mov r0, #0x34
	bl sub_02037AC0
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239D3C:
	add r0, r4, #0
	bl sub_02075108
	cmp r0, #1
	bne _02239D5A
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239D50:
	add r0, r4, #0
	bl sub_0207514C
	cmp r0, #1
	beq _02239D5C
_02239D5A:
	b _0223A06C
_02239D5C:
	mov r0, #0x35
	bl sub_02037AC0
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239D6C:
	add r0, r4, #0
	bl sub_02075178
	cmp r0, #1
	bne _02239E66
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239D80:
	add r0, r4, #0
	bl sub_020751B8
	cmp r0, #1
	bne _02239E66
	mov r0, #0x36
	bl sub_02037AC0
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239D9A:
	add r0, r4, #0
	bl sub_020751DC
	cmp r0, #1
	bne _02239E66
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239DAE:
	add r0, r4, #0
	bl sub_02075220
	cmp r0, #1
	bne _02239E66
	mov r0, #0x37
	bl sub_02037AC0
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239DC8:
	add r0, r4, #0
	bl sub_02075248
	cmp r0, #1
	bne _02239E66
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239DDC:
	add r0, r4, #0
	bl sub_0207527C
	cmp r0, #1
	bne _02239E66
	mov r0, #0x38
	bl sub_02037AC0
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239DF6:
	add r0, r4, #0
	bl sub_020752D8
	cmp r0, #1
	bne _02239E66
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239E0A:
	ldr r1, [r4]
	ldr r2, [r1]
	mov r1, #0x80
	tst r1, r2
	bne _02239E1A
	mov r1, #0x21
	strb r1, [r4, r0]
	b _0223A06C
_02239E1A:
	bl sub_0203769C
	cmp r0, #0
	beq _02239E32
	mov r0, #0x39
	bl sub_02037AC0
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239E32:
	add r0, r4, #0
	mov r1, #1
	bl sub_0207531C
	cmp r0, #1
	bne _02239E66
	mov r0, #0x39
	bl sub_02037AC0
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239E4E:
	mov r1, #1
	sub r0, r0, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r0, #0
	beq _02239E72
	mov r0, #0x39
	bl sub_02037B38
	cmp r0, #1
	beq _02239E68
_02239E66:
	b _0223A06C
_02239E68:
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239E72:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x39
	bl sub_02075350
	cmp r0, #1
	bne _02239F68
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239E8A:
	bl sub_0203769C
	cmp r0, #0
	beq _02239EA2
	mov r0, #0x3a
	bl sub_02037AC0
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239EA2:
	add r0, r4, #0
	mov r1, #3
	bl sub_0207531C
	cmp r0, #1
	bne _02239F68
	mov r0, #0x3a
	bl sub_02037AC0
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239EBE:
	mov r1, #1
	sub r0, r0, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r0, #0
	beq _02239EE0
	mov r0, #0x3a
	bl sub_02037B38
	cmp r0, #1
	bne _02239F68
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239EE0:
	add r0, r4, #0
	mov r1, #3
	mov r2, #0x3a
	bl sub_02075350
	cmp r0, #1
	bne _02239F68
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239EF8:
	bl sub_0203769C
	cmp r0, #0
	beq _02239F10
	mov r0, #0x3b
	bl sub_02037AC0
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239F10:
	add r0, r4, #0
	mov r1, #1
	bl sub_020753A8
	cmp r0, #1
	bne _02239F68
	mov r0, #0x3b
	bl sub_02037AC0
	ldr r0, _02239F2C ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
	.balign 4, 0
_02239F2C: .word 0x00001021
_02239F30: .word 0x00001022
_02239F34: .word 0x00000708
_02239F38:
	mov r1, #1
	sub r0, r0, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r0, #0
	beq _02239F5A
	mov r0, #0x3b
	bl sub_02037B38
	cmp r0, #1
	bne _02239F68
	ldr r0, _0223A074 ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239F5A:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x3b
	bl sub_020753D4
	cmp r0, #1
	beq _02239F6A
_02239F68:
	b _0223A06C
_02239F6A:
	ldr r0, _0223A074 ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239F74:
	bl sub_0203769C
	cmp r0, #0
	beq _02239F8C
	mov r0, #0x3c
	bl sub_02037AC0
	ldr r0, _0223A074 ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239F8C:
	add r0, r4, #0
	mov r1, #3
	bl sub_020753A8
	cmp r0, #1
	bne _0223A06C
	mov r0, #0x3c
	bl sub_02037AC0
	ldr r0, _0223A074 ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239FA8:
	mov r1, #1
	sub r0, r0, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r0, #0
	beq _02239FCA
	mov r0, #0x3c
	bl sub_02037B38
	cmp r0, #1
	bne _0223A06C
	ldr r0, _0223A074 ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239FCA:
	add r0, r4, #0
	mov r1, #3
	mov r2, #0x3c
	bl sub_020753D4
	cmp r0, #1
	bne _0223A06C
	ldr r0, _0223A074 ; =0x00001021
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0223A06C
_02239FE2:
	bl sub_02037454
	ldr r1, _0223A078 ; =0x00001020
	ldrb r2, [r4, r1]
	cmp r2, r0
	bne _0223A038
	add r0, r1, #1
	ldrb r0, [r4, r0]
	cmp r0, #0x14
	bne _0223A008
	add r6, r7, #0
	add r5, r4, #0
_02239FFA:
	ldr r0, [r5, #0x10]
	bl FreeToHeap
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #4
	blt _02239FFA
_0223A008:
	ldr r0, _0223A078 ; =0x00001020
	mov r3, #0
	strb r3, [r4, r0]
	add r1, r0, #2
	strh r3, [r4, r1]
	add r1, r0, #1
	ldrb r1, [r4, r1]
	add r2, r1, #1
	add r1, r0, #1
	strb r2, [r4, r1]
	add r0, r0, #1
	ldrb r0, [r4, r0]
	cmp r0, #0x21
	bne _0223A06C
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r4, #0xc]
	ldr r2, _0223A07C ; =0x0000FFFF
	mov r1, #5
	bl sub_02003370
	b _0223A06C
_0223A038:
	add r0, r1, #2
	ldrh r0, [r4, r0]
	add r2, r0, #1
	add r0, r1, #2
	strh r2, [r4, r0]
	ldrh r1, [r4, r0]
	ldr r0, _0223A080 ; =0x00000708
	cmp r1, r0
	bls _0223A06C
	mov r0, #1
	bl sub_02039AD8
	b _0223A06C
_0223A052:
	ldr r0, [r4, #0xc]
	bl sub_02003B44
	cmp r0, #0
	bne _0223A06C
	ldr r0, _0223A084 ; =0x00001024
	mov r7, #1
	ldr r0, [r4, r0]
	bl sub_0200F450
	mov r0, #0
	bl sub_02037930
_0223A06C:
	add r0, r7, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0223A074: .word 0x00001021
_0223A078: .word 0x00001020
_0223A07C: .word 0x0000FFFF
_0223A080: .word 0x00000708
_0223A084: .word 0x00001024
	thumb_func_end ov12_02239C28

	thumb_func_start ov12_0223A088
ov12_0223A088: ; 0x0223A088
	push {r4, lr}
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #0xc]
	bl sub_02003104
	ldr r0, [r4, #8]
	mov r1, #1
	bl WindowArray_dtor
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #4]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov12_0223A088

	thumb_func_start ov12_0223A0D4
ov12_0223A0D4: ; 0x0223A0D4
	push {r3, r4, r5, lr}
	ldr r1, _0223A20C ; =0x00002490
	add r5, r0, #0
	mov r2, #5
	bl OverlayManager_CreateAndGetData
	add r4, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetArgs
	add r5, r0, #0
	ldr r2, _0223A20C ; =0x00002490
	mov r0, #0
	add r1, r4, #0
	bl MIi_CpuClearFast
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_02238A68
	ldr r0, [r4, #0x2c]
	mov r1, #4
	tst r1, r0
	beq _0223A114
	ldr r1, _0223A210 ; =0x0000240C
	ldr r2, [r4, r1]
	mov r1, #0x10
	tst r1, r2
	bne _0223A114
	mov r1, #0x80
	tst r0, r1
	beq _0223A11C
_0223A114:
	bl sub_0203A914
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223A11C:
	ldr r0, _0223A214 ; =FS_OVERLAY_ID(OVY_5)
	mov r1, #2
	bl HandleLoadOverlay
	ldr r1, [r4, #0x2c]
	mov r0, #8
	tst r0, r1
	bne _0223A130
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223A130:
	mov r0, #5
	mov r1, #0x30
	bl AllocFromHeap
	mov r1, #0x71
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	mov r0, #0
	mov r2, #0x30
	bl MIi_CpuClearFast
	bl sub_0203769C
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r5, #0
	bl sub_020378AC
	cmp r0, #3
	bhi _0223A1B4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223A166: ; jump table
	.short _0223A16E - _0223A166 - 2 ; case 0
	.short _0223A194 - _0223A166 - 2 ; case 1
	.short _0223A194 - _0223A166 - 2 ; case 2
	.short _0223A16E - _0223A166 - 2 ; case 3
_0223A16E:
	lsl r0, r5, #2
	add r0, r4, r0
	ldr r1, [r0, #0x68]
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	str r1, [r0, #4]
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_0223AB6C
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r1, [r0, #0x68]
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	str r1, [r0, #0xc]
	b _0223A1B4
_0223A194:
	add r0, r4, #0
	add r1, r5, #0
	bl ov12_0223AB6C
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r2, [r0, #0x68]
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	str r2, [r1, #4]
	lsl r1, r5, #2
	add r1, r4, r1
	ldr r1, [r1, #0x68]
	ldr r0, [r4, r0]
	str r1, [r0, #0xc]
_0223A1B4:
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r2, #5
	str r2, [r1, #0x24]
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x28
	strb r1, [r0]
	add r0, r5, #0
	bl sub_020378AC
	cmp r0, #3
	bhi _0223A1FE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223A1DC: ; jump table
	.short _0223A1E4 - _0223A1DC - 2 ; case 0
	.short _0223A1F2 - _0223A1DC - 2 ; case 1
	.short _0223A1F2 - _0223A1DC - 2 ; case 2
	.short _0223A1E4 - _0223A1DC - 2 ; case 3
_0223A1E4:
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x29
	strb r1, [r0]
	b _0223A1FE
_0223A1F2:
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	add r0, #0x29
	strb r1, [r0]
_0223A1FE:
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov05_0221BA00
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223A20C: .word 0x00002490
_0223A210: .word 0x0000240C
_0223A214: .word FS_OVERLAY_ID(OVY_5)
	thumb_func_end ov12_0223A0D4

	thumb_func_start ov12_0223A218
ov12_0223A218: ; 0x0223A218
	push {r3, r4, r5, r6, r7, lr}
	bl OverlayManager_GetData
	add r6, r0, #0
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	add r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0223A25A
	mov r4, #0
	mov r7, #0x71
	add r5, r4, #0
	lsl r7, r7, #2
_0223A236:
	ldr r0, [r6, r7]
	add r0, r0, r5
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _0223A244
	bl FreeToHeap
_0223A244:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0223A236
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223A25A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0223A218

	thumb_func_start ov12_0223A260
ov12_0223A260: ; 0x0223A260
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r5, #0
	bl OverlayManager_GetArgs
	ldr r0, [r4, #0x2c]
	mov r1, #4
	tst r1, r0
	beq _0223A288
	ldr r1, _0223A3A4 ; =0x0000240C
	ldr r2, [r4, r1]
	mov r1, #0x10
	tst r1, r2
	bne _0223A288
	mov r1, #0x80
	tst r0, r1
	beq _0223A290
_0223A288:
	bl sub_0203A914
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0223A290:
	bl sub_0203769C
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	mov r0, #5
	mov r1, #0x30
	bl AllocFromHeap
	mov r1, #0x71
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	mov r0, #0
	mov r2, #0x30
	bl MIi_CpuClearFast
	ldr r1, [r4, #0x2c]
	mov r0, #8
	tst r0, r1
	beq _0223A30E
	mov r6, #0
	add r5, r4, #0
_0223A2BC:
	add r0, r6, #0
	bl sub_020378AC
	mov r2, #0x71
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	lsl r0, r0, #2
	ldr r1, [r5, #0x68]
	add r0, r2, r0
	str r1, [r0, #4]
	add r0, r6, #0
	bl sub_020378AC
	add r7, r0, #0
	ldr r0, [r5, #0x48]
	mov r1, #5
	bl PlayerProfile_GetPlayerName_NewString
	mov r1, #0x71
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	lsl r1, r7, #2
	add r1, r2, r1
	add r6, r6, #1
	add r5, r5, #4
	str r0, [r1, #0x14]
	cmp r6, #4
	blt _0223A2BC
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r2, #5
	str r2, [r1, #0x24]
	ldr r1, [r4, r0]
	mov r2, #1
	add r1, #0x28
	strb r2, [r1]
	ldr r0, [r4, r0]
	add r0, #0x29
	strb r2, [r0]
	b _0223A394
_0223A30E:
	add r0, r5, #0
	lsl r7, r5, #2
	bl sub_020378AC
	mov r2, #0x71
	lsl r2, r2, #2
	add r1, r4, r7
	ldr r2, [r4, r2]
	lsl r0, r0, #2
	ldr r1, [r1, #0x68]
	add r0, r2, r0
	str r1, [r0, #4]
	mov r0, #1
	eor r0, r5
	lsl r6, r0, #2
	str r0, [sp]
	bl sub_020378AC
	add r1, r4, r6
	ldr r2, [r1, #0x68]
	mov r1, #0x71
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	lsl r0, r0, #2
	add r0, r1, r0
	str r2, [r0, #4]
	add r0, r5, #0
	bl sub_020378AC
	add r5, r0, #0
	add r0, r4, r7
	ldr r0, [r0, #0x48]
	mov r1, #5
	bl PlayerProfile_GetPlayerName_NewString
	mov r1, #0x71
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	lsl r1, r5, #2
	add r1, r2, r1
	str r0, [r1, #0x14]
	ldr r0, [sp]
	bl sub_020378AC
	add r5, r0, #0
	add r0, r4, r6
	ldr r0, [r0, #0x48]
	mov r1, #5
	bl PlayerProfile_GetPlayerName_NewString
	mov r1, #0x71
	lsl r1, r1, #2
	ldr r3, [r4, r1]
	lsl r2, r5, #2
	add r2, r3, r2
	str r0, [r2, #0x14]
	ldr r0, [r4, r1]
	mov r2, #5
	str r2, [r0, #0x24]
	ldr r0, [r4, r1]
	mov r2, #1
	add r0, #0x28
	strb r2, [r0]
	ldr r0, [r4, r1]
	mov r2, #0
	add r0, #0x29
	strb r2, [r0]
_0223A394:
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov05_0221BA00
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223A3A4: .word 0x0000240C
	thumb_func_end ov12_0223A260

	thumb_func_start ov12_0223A3A8
ov12_0223A3A8: ; 0x0223A3A8
	push {r3, r4, r5, r6, r7, lr}
	bl OverlayManager_GetData
	add r6, r0, #0
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	add r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0223A3EA
	mov r4, #0
	mov r7, #0x71
	add r5, r4, #0
	lsl r7, r7, #2
_0223A3C6:
	ldr r0, [r6, r7]
	add r0, r0, r5
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _0223A3D4
	bl FreeToHeap
_0223A3D4:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0223A3C6
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223A3EA:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0223A3A8

	thumb_func_start ov12_0223A3F0
ov12_0223A3F0: ; 0x0223A3F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl OverlayManager_GetArgs
	add r7, r0, #0
	ldr r0, [r7]
	mov r1, #4
	tst r1, r0
	beq _0223A414
	mov r1, #0x63
	lsl r1, r1, #2
	ldr r2, [r7, r1]
	mov r1, #0x10
	tst r1, r2
	bne _0223A414
	mov r1, #0x80
	tst r0, r1
	beq _0223A41A
_0223A414:
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0223A41A:
	bl sub_0203769C
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r0, _0223A5DC ; =FS_OVERLAY_ID(OVY_5)
	mov r1, #2
	bl HandleLoadOverlay
	mov r0, #5
	mov r1, #0x30
	bl AllocFromHeap
	add r6, r0, #0
	mov r0, #0x66
	lsl r0, r0, #2
	str r6, [r7, r0]
	mov r0, #0
	add r1, r6, #0
	mov r2, #0x30
	bl MIi_CpuClearFast
	str r7, [r6]
	ldr r0, [r7, #0x14]
	cmp r0, #5
	bhi _0223A4CE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223A458: ; jump table
	.short _0223A4CE - _0223A458 - 2 ; case 0
	.short _0223A464 - _0223A458 - 2 ; case 1
	.short _0223A488 - _0223A458 - 2 ; case 2
	.short _0223A4AC - _0223A458 - 2 ; case 3
	.short _0223A4CE - _0223A458 - 2 ; case 4
	.short _0223A4AC - _0223A458 - 2 ; case 5
_0223A464:
	bl sub_02039998
	cmp r0, #0
	bne _0223A47A
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0x16
	bl GameStats_Inc
	b _0223A4CE
_0223A47A:
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0x1b
	bl GameStats_Inc
	b _0223A4CE
_0223A488:
	bl sub_02039998
	cmp r0, #0
	bne _0223A49E
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0x17
	bl GameStats_Inc
	b _0223A4CE
_0223A49E:
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0x1c
	bl GameStats_Inc
	b _0223A4CE
_0223A4AC:
	bl sub_02039998
	cmp r0, #0
	bne _0223A4C2
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0x18
	bl GameStats_Inc
	b _0223A4CE
_0223A4C2:
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0x1d
	bl GameStats_Inc
_0223A4CE:
	ldr r1, [r7]
	mov r0, #8
	tst r0, r1
	beq _0223A538
	mov r4, #0
	add r5, r7, #0
_0223A4DA:
	add r0, r4, #0
	bl sub_020378AC
	lsl r0, r0, #2
	ldr r1, [r5, #4]
	add r0, r6, r0
	str r1, [r0, #4]
	add r0, r4, #0
	bl sub_020378AC
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	mov r1, #5
	bl PlayerProfile_GetPlayerName_NewString
	ldr r1, [sp, #8]
	add r4, r4, #1
	lsl r1, r1, #2
	add r1, r6, r1
	add r5, r5, #4
	str r0, [r1, #0x14]
	cmp r4, #4
	blt _0223A4DA
	mov r0, #5
	str r0, [r6, #0x24]
	add r0, r6, #0
	mov r1, #2
	add r0, #0x28
	strb r1, [r0]
	add r0, r6, #0
	mov r1, #1
	add r0, #0x29
	strb r1, [r0]
	ldr r1, [r7, #0x14]
	cmp r1, #5
	beq _0223A52E
	add r0, r6, #0
	add r0, #0x2a
	strb r1, [r0]
	b _0223A5C4
_0223A52E:
	add r0, r6, #0
	mov r1, #3
	add r0, #0x2a
	strb r1, [r0]
	b _0223A5C4
_0223A538:
	lsl r0, r4, #2
	str r0, [sp]
	add r0, r4, #0
	bl sub_020378AC
	ldr r1, [sp]
	lsl r0, r0, #2
	add r1, r7, r1
	ldr r1, [r1, #4]
	add r0, r6, r0
	str r1, [r0, #4]
	mov r0, #1
	eor r0, r4
	lsl r5, r0, #2
	str r0, [sp, #4]
	bl sub_020378AC
	add r1, r7, r5
	lsl r0, r0, #2
	ldr r1, [r1, #4]
	add r0, r6, r0
	str r1, [r0, #4]
	add r0, r4, #0
	bl sub_020378AC
	add r4, r0, #0
	ldr r0, [sp]
	mov r1, #5
	add r0, r7, r0
	add r0, #0xf8
	ldr r0, [r0]
	bl PlayerProfile_GetPlayerName_NewString
	lsl r1, r4, #2
	add r1, r6, r1
	str r0, [r1, #0x14]
	ldr r0, [sp, #4]
	bl sub_020378AC
	add r4, r0, #0
	add r0, r7, r5
	add r0, #0xf8
	ldr r0, [r0]
	mov r1, #5
	bl PlayerProfile_GetPlayerName_NewString
	lsl r1, r4, #2
	add r1, r6, r1
	str r0, [r1, #0x14]
	mov r0, #5
	str r0, [r6, #0x24]
	add r0, r6, #0
	mov r1, #2
	add r0, #0x28
	strb r1, [r0]
	add r0, r6, #0
	mov r1, #0
	add r0, #0x29
	strb r1, [r0]
	ldr r1, [r7, #0x14]
	cmp r1, #5
	beq _0223A5BC
	add r0, r6, #0
	add r0, #0x2a
	strb r1, [r0]
	b _0223A5C4
_0223A5BC:
	add r0, r6, #0
	mov r1, #3
	add r0, #0x2a
	strb r1, [r0]
_0223A5C4:
	ldr r0, _0223A5E0 ; =0x000001B2
	ldrb r1, [r7, r0]
	add r0, r6, #0
	add r0, #0x2c
	strb r1, [r0]
	add r0, r6, #0
	bl ov05_0221BA00
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0223A5DC: .word FS_OVERLAY_ID(OVY_5)
_0223A5E0: .word 0x000001B2
	thumb_func_end ov12_0223A3F0

	thumb_func_start ov12_0223A5E4
ov12_0223A5E4: ; 0x0223A5E4
	push {r4, r5, r6, lr}
	bl OverlayManager_GetArgs
	mov r1, #0x66
	lsl r1, r1, #2
	ldr r6, [r0, r1]
	add r0, r6, #0
	add r0, #0x2b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0223A61A
	mov r4, #0
	add r5, r6, #0
_0223A5FE:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _0223A608
	bl FreeToHeap
_0223A608:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0223A5FE
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_0223A61A:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0223A5E4

	thumb_func_start ov12_0223A620
ov12_0223A620: ; 0x0223A620
	push {r3, lr}
	ldr r2, [r0, #0x2c]
	ldr r1, _0223A65C ; =0x00000404
	tst r1, r2
	bne _0223A634
	ldr r1, _0223A660 ; =0x0000240C
	ldr r1, [r0, r1]
	mov r0, #0x10
	tst r0, r1
	beq _0223A648
_0223A634:
	mov r0, #1
	bl sub_02002B50
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B8C
	pop {r3, pc}
_0223A648:
	mov r0, #3
	bl sub_02002B50
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #1
	bl sub_02002B8C
	pop {r3, pc}
	.balign 4, 0
_0223A65C: .word 0x00000404
_0223A660: .word 0x0000240C
	thumb_func_end ov12_0223A620

	thumb_func_start ov12_0223A664
ov12_0223A664: ; 0x0223A664
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	ldr r2, _0223A798 ; =0x0000240C
	str r0, [sp]
	ldr r3, [r0, r2]
	mov r0, #0x10
	tst r0, r3
	beq _0223A680
	ldr r0, [sp]
	mov r1, #1
	sub r2, #0x10
	strb r1, [r0, r2]
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
_0223A680:
	mov r0, #0x5f
	mov r3, #0
	add r4, sp, #0x30
	add r5, sp, #0x20
	lsl r0, r0, #2
_0223A68A:
	stmia r4!, {r3}
	ldr r2, [r1, r0]
	add r3, r3, #1
	add r1, r1, #4
	stmia r5!, {r2}
	cmp r3, #4
	blt _0223A68A
	bl sub_0203769C
	str r0, [sp, #0x10]
	bl sub_02037454
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	sub r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #0
	ble _0223A70A
	add r0, sp, #0x30
	add r2, sp, #0x20
	str r0, [sp, #8]
	str r2, [sp, #0x18]
	mov ip, r0
_0223A6BC:
	ldr r0, [sp, #4]
	add r5, r0, #1
	ldr r0, [sp, #0xc]
	cmp r5, r0
	bge _0223A6F6
	ldr r1, [sp, #0x18]
	lsl r0, r5, #2
	add r3, r1, r0
	mov r1, ip
	add r4, r1, r0
_0223A6D0:
	ldr r0, [r3]
	ldr r7, [r2]
	str r0, [sp, #0x1c]
	cmp r7, r0
	bge _0223A6EA
	ldr r0, [sp, #8]
	ldr r1, [r4]
	ldr r6, [r0]
	str r1, [r0]
	ldr r0, [sp, #0x1c]
	str r6, [r4]
	str r0, [r2]
	str r7, [r3]
_0223A6EA:
	ldr r0, [sp, #0xc]
	add r5, r5, #1
	add r3, r3, #4
	add r4, r4, #4
	cmp r5, r0
	blt _0223A6D0
_0223A6F6:
	ldr r0, [sp, #8]
	add r2, r2, #4
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r1, r0, #1
	ldr r0, [sp, #0x14]
	str r1, [sp, #4]
	cmp r1, r0
	blt _0223A6BC
_0223A70A:
	ldr r1, [sp, #0x30]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	bne _0223A71E
	ldr r0, [sp]
	ldr r1, _0223A79C ; =0x000023FC
	mov r2, #1
	strb r2, [r0, r1]
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
_0223A71E:
	ldr r0, [sp]
	ldr r1, [r0, #0x2c]
	mov r0, #0x80
	tst r0, r1
	bne _0223A792
	mov r0, #8
	tst r0, r1
	beq _0223A784
	ldr r0, [sp, #0x10]
	bl sub_020378AC
	add r4, r0, #0
	ldr r0, [sp, #0x30]
	bl sub_020378AC
	cmp r0, #3
	bhi _0223A792
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223A74C: ; jump table
	.short _0223A754 - _0223A74C - 2 ; case 0
	.short _0223A76C - _0223A74C - 2 ; case 1
	.short _0223A754 - _0223A74C - 2 ; case 2
	.short _0223A76C - _0223A74C - 2 ; case 3
_0223A754:
	mov r0, #1
	tst r0, r4
	beq _0223A792
	ldr r1, _0223A798 ; =0x0000240C
	ldr r0, [sp]
	ldr r2, [r0, r1]
	mov r0, #0x20
	orr r2, r0
	ldr r0, [sp]
	add sp, #0x40
	str r2, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
_0223A76C:
	mov r0, #1
	tst r0, r4
	bne _0223A792
	ldr r1, _0223A798 ; =0x0000240C
	ldr r0, [sp]
	ldr r2, [r0, r1]
	mov r0, #0x20
	orr r2, r0
	ldr r0, [sp]
	add sp, #0x40
	str r2, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
_0223A784:
	ldr r1, _0223A798 ; =0x0000240C
	ldr r0, [sp]
	ldr r2, [r0, r1]
	mov r0, #0x20
	orr r2, r0
	ldr r0, [sp]
	str r2, [r0, r1]
_0223A792:
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223A798: .word 0x0000240C
_0223A79C: .word 0x000023FC
	thumb_func_end ov12_0223A664

	thumb_func_start ov12_0223A7A0
ov12_0223A7A0: ; 0x0223A7A0
	push {r3, lr}
	bl sub_0203A880
	bl sub_02039998
	cmp r0, #0
	beq _0223A7BC
	bl ov00_021EC9D4
	mov r1, #3
	sub r0, r1, r0
	bl sub_0203A930
	pop {r3, pc}
_0223A7BC:
	bl sub_02035650
	cmp r0, #0
	beq _0223A7D0
	bl WM_GetLinkLevel
	mov r1, #3
	sub r0, r1, r0
	bl sub_0203A930
_0223A7D0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_0223A7A0

	thumb_func_start ov12_0223A7D4
ov12_0223A7D4: ; 0x0223A7D4
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov12_0223A7D4

	thumb_func_start ov12_0223A7D8
ov12_0223A7D8: ; 0x0223A7D8
	ldr r2, [r0, #8]
	lsl r0, r1, #4
	add r0, r2, r0
	bx lr
	thumb_func_end ov12_0223A7D8

	thumb_func_start ov12_0223A7E0
ov12_0223A7E0: ; 0x0223A7E0
	ldr r0, [r0, #0x2c]
	bx lr
	thumb_func_end ov12_0223A7E0

	thumb_func_start ov12_0223A7E4
ov12_0223A7E4: ; 0x0223A7E4
	ldr r0, [r0, #0x30]
	bx lr
	thumb_func_end ov12_0223A7E4

	thumb_func_start ov12_0223A7E8
ov12_0223A7E8: ; 0x0223A7E8
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r0, [r0, #0x34]
	bx lr
	thumb_func_end ov12_0223A7E8

	thumb_func_start ov12_0223A7F0
ov12_0223A7F0: ; 0x0223A7F0
	ldr r0, [r0, #0x44]
	bx lr
	thumb_func_end ov12_0223A7F0

	thumb_func_start ov12_0223A7F4
ov12_0223A7F4: ; 0x0223A7F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x2c]
	mov r3, #8
	add r4, r1, #0
	tst r3, r2
	bne _0223A812
	mov r3, #0x10
	tst r2, r3
	beq _0223A81A
	bl ov12_0223AB0C
	mov r1, #1
	tst r0, r1
	beq _0223A81A
_0223A812:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x68]
	pop {r3, r4, r5, pc}
_0223A81A:
	ldr r1, [r5, #0x2c]
	mov r0, #2
	tst r0, r1
	beq _0223A82C
	lsl r0, r4, #0x1f
	lsr r0, r0, #0x1d
	add r0, r5, r0
	ldr r0, [r0, #0x68]
	pop {r3, r4, r5, pc}
_0223A82C:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x68]
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223A7F4

	thumb_func_start ov12_0223A834
ov12_0223A834: ; 0x0223A834
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x2c]
	mov r3, #8
	add r4, r1, #0
	tst r3, r2
	bne _0223A852
	mov r3, #0x10
	tst r2, r3
	beq _0223A85E
	bl ov12_0223AB0C
	mov r1, #1
	tst r0, r1
	beq _0223A85E
_0223A852:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x68]
	bl GetPartyCount
	pop {r3, r4, r5, pc}
_0223A85E:
	ldr r1, [r5, #0x2c]
	mov r0, #2
	tst r0, r1
	beq _0223A874
	lsl r0, r4, #0x1f
	lsr r0, r0, #0x1d
	add r0, r5, r0
	ldr r0, [r0, #0x68]
	bl GetPartyCount
	pop {r3, r4, r5, pc}
_0223A874:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x68]
	bl GetPartyCount
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223A834

	thumb_func_start ov12_0223A880
ov12_0223A880: ; 0x0223A880
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r2, #0
	ldr r2, [r5, #0x2c]
	mov r3, #8
	add r4, r1, #0
	tst r3, r2
	bne _0223A8A0
	mov r3, #0x10
	tst r2, r3
	beq _0223A8AE
	bl ov12_0223AB0C
	mov r1, #1
	tst r0, r1
	beq _0223A8AE
_0223A8A0:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x68]
	add r1, r6, #0
	bl GetPartyMonByIndex
	pop {r4, r5, r6, pc}
_0223A8AE:
	ldr r1, [r5, #0x2c]
	mov r0, #2
	tst r0, r1
	beq _0223A8C6
	lsl r0, r4, #0x1f
	lsr r0, r0, #0x1d
	add r0, r5, r0
	ldr r0, [r0, #0x68]
	add r1, r6, #0
	bl GetPartyMonByIndex
	pop {r4, r5, r6, pc}
_0223A8C6:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x68]
	add r1, r6, #0
	bl GetPartyMonByIndex
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0223A880

	thumb_func_start ov12_0223A8D4
ov12_0223A8D4: ; 0x0223A8D4
	add r0, #0x88
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0223A8D4

	thumb_func_start ov12_0223A8DC
ov12_0223A8DC: ; 0x0223A8DC
	add r0, #0x8c
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0223A8DC

	thumb_func_start ov12_0223A8E4
ov12_0223A8E4: ; 0x0223A8E4
	add r0, #0x90
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0223A8E4

	thumb_func_start ov12_0223A8EC
ov12_0223A8EC: ; 0x0223A8EC
	add r0, #0x94
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0223A8EC

	thumb_func_start ov12_0223A8F4
ov12_0223A8F4: ; 0x0223A8F4
	mov r2, #0x5f
	lsl r2, r2, #2
	add r2, r0, r2
	lsl r0, r1, #4
	add r0, r2, r0
	bx lr
	thumb_func_end ov12_0223A8F4

	thumb_func_start ov12_0223A900
ov12_0223A900: ; 0x0223A900
	mov r1, #0x67
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov12_0223A900

	thumb_func_start ov12_0223A908
ov12_0223A908: ; 0x0223A908
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bx lr
	thumb_func_end ov12_0223A908

	thumb_func_start ov12_0223A914
ov12_0223A914: ; 0x0223A914
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x1a
	lsl r0, r0, #4
	str r2, [r1, r0]
	bx lr
	thumb_func_end ov12_0223A914

	thumb_func_start ov12_0223A920
ov12_0223A920: ; 0x0223A920
	mov r1, #0x6a
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov12_0223A920

	thumb_func_start ov12_0223A928
ov12_0223A928: ; 0x0223A928
	mov r1, #0x6b
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov12_0223A928

	thumb_func_start ov12_0223A930
ov12_0223A930: ; 0x0223A930
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov12_0223A930

	thumb_func_start ov12_0223A934
ov12_0223A934: ; 0x0223A934
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end ov12_0223A934

	thumb_func_start ov12_0223A938
ov12_0223A938: ; 0x0223A938
	ldr r0, [r0, #0x28]
	bx lr
	thumb_func_end ov12_0223A938

	thumb_func_start ov12_0223A93C
ov12_0223A93C: ; 0x0223A93C
	ldr r0, [r0, #0x60]
	bx lr
	thumb_func_end ov12_0223A93C

	thumb_func_start ov12_0223A940
ov12_0223A940: ; 0x0223A940
	mov r1, #0x8a
	lsl r1, r1, #2
	add r0, r0, r1
	bx lr
	thumb_func_end ov12_0223A940

	thumb_func_start ov12_0223A948
ov12_0223A948: ; 0x0223A948
	ldr r1, _0223A950 ; =0x00001228
	add r0, r0, r1
	bx lr
	nop
_0223A950: .word 0x00001228
	thumb_func_end ov12_0223A948

	thumb_func_start ov12_0223A954
ov12_0223A954: ; 0x0223A954
	ldr r1, _0223A95C ; =0x000023E8
	add r0, r0, r1
	bx lr
	nop
_0223A95C: .word 0x000023E8
	thumb_func_end ov12_0223A954

	thumb_func_start ov12_0223A960
ov12_0223A960: ; 0x0223A960
	ldr r1, _0223A968 ; =0x000023EA
	add r0, r0, r1
	bx lr
	nop
_0223A968: .word 0x000023EA
	thumb_func_end ov12_0223A960

	thumb_func_start ov12_0223A96C
ov12_0223A96C: ; 0x0223A96C
	ldr r1, _0223A974 ; =0x000023EC
	add r0, r0, r1
	bx lr
	nop
_0223A974: .word 0x000023EC
	thumb_func_end ov12_0223A96C

	thumb_func_start ov12_0223A978
ov12_0223A978: ; 0x0223A978
	ldr r1, _0223A980 ; =0x000023EE
	add r0, r0, r1
	bx lr
	nop
_0223A980: .word 0x000023EE
	thumb_func_end ov12_0223A978

	thumb_func_start ov12_0223A984
ov12_0223A984: ; 0x0223A984
	ldr r1, _0223A98C ; =0x000023F0
	add r0, r0, r1
	bx lr
	nop
_0223A98C: .word 0x000023F0
	thumb_func_end ov12_0223A984

	thumb_func_start ov12_0223A990
ov12_0223A990: ; 0x0223A990
	ldr r1, _0223A998 ; =0x000023F2
	add r0, r0, r1
	bx lr
	nop
_0223A998: .word 0x000023F2
	thumb_func_end ov12_0223A990

	thumb_func_start ov12_0223A99C
ov12_0223A99C: ; 0x0223A99C
	mov r1, #0x1d
	lsl r1, r1, #4
	add r0, r0, r1
	bx lr
	thumb_func_end ov12_0223A99C

	thumb_func_start ov12_0223A9A4
ov12_0223A9A4: ; 0x0223A9A4
	ldr r0, [r0, #0x14]
	bx lr
	thumb_func_end ov12_0223A9A4

	thumb_func_start ov12_0223A9A8
ov12_0223A9A8: ; 0x0223A9A8
	ldr r0, [r0, #0x18]
	bx lr
	thumb_func_end ov12_0223A9A8

	thumb_func_start ov12_0223A9AC
ov12_0223A9AC: ; 0x0223A9AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x2c]
	mov r3, #8
	add r4, r1, #0
	tst r3, r2
	bne _0223A9CA
	mov r3, #0x10
	tst r2, r3
	beq _0223A9D4
	bl ov12_0223AB0C
	mov r1, #1
	tst r0, r1
	beq _0223A9D4
_0223A9CA:
	lsl r0, r4, #1
	add r0, r5, r0
	add r0, #0xa0
	ldrh r0, [r0]
	pop {r3, r4, r5, pc}
_0223A9D4:
	ldr r1, [r5, #0x2c]
	mov r0, #2
	tst r0, r1
	beq _0223A9E8
	lsl r0, r4, #0x1f
	lsr r0, r0, #0x1e
	add r0, r5, r0
	add r0, #0xa0
	ldrh r0, [r0]
	pop {r3, r4, r5, pc}
_0223A9E8:
	lsl r0, r4, #1
	add r0, r5, r0
	add r0, #0xa0
	ldrh r0, [r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0223A9AC

	thumb_func_start ov12_0223A9F4
ov12_0223A9F4: ; 0x0223A9F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x2c]
	mov r3, #8
	add r4, r1, #0
	tst r3, r2
	bne _0223AA12
	mov r3, #0x10
	tst r2, r3
	beq _0223AA1C
	bl ov12_0223AB0C
	mov r1, #1
	tst r0, r1
	beq _0223AA1C
_0223AA12:
	mov r0, #0x34
	add r5, #0xac
	mul r0, r4
	add r0, r5, r0
	pop {r3, r4, r5, pc}
_0223AA1C:
	ldr r1, [r5, #0x2c]
	mov r0, #2
	tst r0, r1
	beq _0223AA34
	mov r0, #1
	add r1, r4, #0
	and r1, r0
	mov r0, #0x34
	add r5, #0xac
	mul r0, r1
	add r0, r5, r0
	pop {r3, r4, r5, pc}
_0223AA34:
	mov r0, #0x34
	add r5, #0xac
	mul r0, r4
	add r0, r5, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0223A9F4

	thumb_func_start ov12_0223AA40
ov12_0223AA40: ; 0x0223AA40
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x2c]
	mov r3, #8
	add r4, r1, #0
	tst r3, r2
	bne _0223AA5E
	mov r3, #0x10
	tst r2, r3
	beq _0223AA66
	bl ov12_0223AB0C
	mov r1, #1
	tst r0, r1
	beq _0223AA66
_0223AA5E:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x48]
	pop {r3, r4, r5, pc}
_0223AA66:
	ldr r1, [r5, #0x2c]
	mov r0, #2
	tst r0, r1
	beq _0223AA78
	lsl r0, r4, #0x1f
	lsr r0, r0, #0x1d
	add r0, r5, r0
	ldr r0, [r0, #0x48]
	pop {r3, r4, r5, pc}
_0223AA78:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x48]
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223AA40

	thumb_func_start ov12_0223AA80
ov12_0223AA80: ; 0x0223AA80
	ldr r0, [r0, #0x58]
	bx lr
	thumb_func_end ov12_0223AA80

	thumb_func_start ov12_0223AA84
ov12_0223AA84: ; 0x0223AA84
	ldr r0, [r0, #0x5c]
	bx lr
	thumb_func_end ov12_0223AA84

	thumb_func_start ov12_0223AA88
ov12_0223AA88: ; 0x0223AA88
	push {r3, lr}
	ldr r2, _0223AAB4 ; =0x00002478
	ldr r0, [r0, r2]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	beq _0223AAA4
	add r0, r1, #0
	mov r1, #0xb4
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
_0223AAA4:
	add r0, r1, #0
	mov r1, #0x9b
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
	.balign 4, 0
_0223AAB4: .word 0x00002478
	thumb_func_end ov12_0223AA88

	thumb_func_start ov12_0223AAB8
ov12_0223AAB8: ; 0x0223AAB8
	ldr r1, _0223AAC4 ; =0x00002478
	ldr r0, [r0, r1]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bx lr
	nop
_0223AAC4: .word 0x00002478
	thumb_func_end ov12_0223AAB8

	thumb_func_start ov12_0223AAC8
ov12_0223AAC8: ; 0x0223AAC8
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r3, _0223AAD4 ; =PlayerProfile_GetTrainerGender
	ldr r0, [r0, #0x48]
	bx r3
	nop
_0223AAD4: .word PlayerProfile_GetTrainerGender
	thumb_func_end ov12_0223AAC8

	thumb_func_start ov12_0223AAD8
ov12_0223AAD8: ; 0x0223AAD8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x44]
	add r7, r1, #0
	mov r4, #0
	cmp r0, #0
	ble _0223AAFC
	add r5, r6, #0
_0223AAE8:
	ldr r0, [r5, #0x34]
	bl ov12_02261258
	cmp r7, r0
	beq _0223AAFC
	ldr r0, [r6, #0x44]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0223AAE8
_0223AAFC:
	ldr r0, [r6, #0x44]
	cmp r4, r0
	blt _0223AB06
	bl GF_AssertFail
_0223AB06:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0223AAD8

	thumb_func_start ov12_0223AB0C
ov12_0223AB0C: ; 0x0223AB0C
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r3, _0223AB18 ; =ov12_02261258
	ldr r0, [r0, #0x34]
	bx r3
	nop
_0223AB18: .word ov12_02261258
	thumb_func_end ov12_0223AB0C

	thumb_func_start ov12_0223AB1C
ov12_0223AB1C: ; 0x0223AB1C
	push {r3, lr}
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r0, [r0, #0x34]
	bl ov12_02261258
	mov r1, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_0223AB1C

	thumb_func_start ov12_0223AB34
ov12_0223AB34: ; 0x0223AB34
	mov r1, #0x1b
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov12_0223AB34

	thumb_func_start ov12_0223AB3C
ov12_0223AB3C: ; 0x0223AB3C
	ldr r0, [r0, #0x64]
	bx lr
	thumb_func_end ov12_0223AB3C

	thumb_func_start ov12_0223AB40
ov12_0223AB40: ; 0x0223AB40
	mov r1, #9
	lsl r1, r1, #0xa
	ldr r0, [r0, r1]
	cmp r0, #0x18
	bgt _0223AB4E
	cmp r0, #0
	bge _0223AB50
_0223AB4E:
	mov r0, #0x18
_0223AB50:
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0223AB40

	thumb_func_start ov12_0223AB54
ov12_0223AB54: ; 0x0223AB54
	ldr r1, _0223AB5C ; =0x00002404
	ldr r0, [r0, r1]
	bx lr
	nop
_0223AB5C: .word 0x00002404
	thumb_func_end ov12_0223AB54

	thumb_func_start ov12_0223AB60
ov12_0223AB60: ; 0x0223AB60
	ldr r1, _0223AB68 ; =0x00002408
	ldr r0, [r0, r1]
	bx lr
	nop
_0223AB68: .word 0x00002408
	thumb_func_end ov12_0223AB60

	thumb_func_start ov12_0223AB6C
ov12_0223AB6C: ; 0x0223AB6C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl ov12_0223A7F0
	str r0, [sp]
	add r0, r6, #0
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	bne _0223AB88
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0223AB88:
	ldr r0, [sp]
	mov r4, #0
	cmp r0, #0
	ble _0223ABB2
_0223AB90:
	cmp r4, r5
	beq _0223ABAA
	add r0, r6, #0
	add r1, r4, #0
	bl ov12_0223AB1C
	add r7, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl ov12_0223AB1C
	cmp r7, r0
	beq _0223ABB2
_0223ABAA:
	ldr r0, [sp]
	add r4, r4, #1
	cmp r4, r0
	blt _0223AB90
_0223ABB2:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0223AB6C

	thumb_func_start ov12_0223ABB8
ov12_0223ABB8: ; 0x0223ABB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	str r2, [sp]
	bl ov12_0223A7F0
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov12_0223A7E0
	mov r1, #2
	tst r0, r1
	bne _0223ABDC
	mov r0, #1
	add sp, #8
	eor r0, r6
	pop {r3, r4, r5, r6, r7, pc}
_0223ABDC:
	ldr r0, [sp, #4]
	mov r4, #0
	cmp r0, #0
	ble _0223AC18
_0223ABE4:
	cmp r4, r6
	beq _0223AC10
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0223AB0C
	mov r1, #2
	and r1, r0
	ldr r0, [sp]
	cmp r0, r1
	bne _0223AC10
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0223AB1C
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_0223AB1C
	cmp r7, r0
	bne _0223AC18
_0223AC10:
	ldr r0, [sp, #4]
	add r4, r4, #1
	cmp r4, r0
	blt _0223ABE4
_0223AC18:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0223ABB8

	thumb_func_start ov12_0223AC20
ov12_0223AC20: ; 0x0223AC20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r7, r1, #0
	ldr r1, [sp, #0x38]
	add r6, r2, #0
	str r1, [sp, #0x38]
	add r1, r0, #0
	ldr r1, [r1, #0x30]
	add r4, r3, #0
	str r1, [sp, #0x1c]
	mov r1, #0
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	str r0, [sp, #4]
	mov r2, #2
	add r3, r7, #0
	bl ov12_022581D4
	str r0, [sp, #0x10]
	ldr r0, [sp, #4]
	bl ov12_0223A7E0
	cmp r0, #3
	beq _0223AC6A
	ldr r0, [sp, #4]
	bl ov12_0223A7E0
	mov r1, #0x10
	tst r0, r1
	beq _0223AC90
	ldr r0, [sp, #4]
	add r1, r7, #0
	bl ov12_0223AB0C
	mov r1, #1
	tst r0, r1
	bne _0223AC90
_0223AC6A:
	ldr r0, [sp, #4]
	add r1, r7, #0
	bl ov12_0223AB6C
	add r3, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x1c]
	mov r2, #2
	bl ov12_022581D4
	str r0, [sp, #0xc]
	cmp r0, r6
	bne _0223AC94
	ldr r0, [sp, #4]
	add r1, r7, #0
	bl ov12_0223AB6C
	add r7, r0, #0
	b _0223AC94
_0223AC90:
	ldr r0, [sp, #0x10]
	str r0, [sp, #0xc]
_0223AC94:
	ldr r0, [sp, #4]
	add r1, r7, #0
	add r2, r6, #0
	bl ov12_0223A880
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x38]
	mov r1, #0xf
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223AD28
	ldr r0, [sp, #0x18]
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	mov r1, #7
	str r0, [sp, #0x20]
	tst r1, r0
	beq _0223AD28
	mov r1, #7
	bic r0, r1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	mov r1, #0xa0
	add r2, sp, #0x20
	bl SetMonData
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223ACE4
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223AD24
_0223ACE4:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x34
	mov r3, #0
	bl ov12_0224EDE0
	mov r1, #7
	str r0, [sp, #0x20]
	bic r0, r1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x34
	add r3, sp, #0x20
	bl ov12_0224F168
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x35
	mov r3, #0
	bl ov12_0224EDE0
	ldr r1, _0223AF38 ; =0xF7FFFFFF
	str r0, [sp, #0x20]
	and r0, r1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x35
	add r3, sp, #0x20
	bl ov12_0224F168
_0223AD24:
	mov r0, #1
	str r0, [sp, #0x14]
_0223AD28:
	ldr r0, [sp, #0x38]
	mov r1, #0x10
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223AD8C
	ldr r0, [sp, #0x18]
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	ldr r1, _0223AF3C ; =0x00000F88
	str r0, [sp, #0x20]
	tst r1, r0
	beq _0223AD8C
	ldr r1, _0223AF40 ; =0xFFFFF077
	add r2, sp, #0x20
	and r0, r1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	mov r1, #0xa0
	bl SetMonData
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223AD68
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223AD88
_0223AD68:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x34
	mov r3, #0
	bl ov12_0224EDE0
	ldr r1, _0223AF40 ; =0xFFFFF077
	str r0, [sp, #0x20]
	and r0, r1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x34
	add r3, sp, #0x20
	bl ov12_0224F168
_0223AD88:
	mov r0, #1
	str r0, [sp, #0x14]
_0223AD8C:
	ldr r0, [sp, #0x38]
	mov r1, #0x11
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223ADF0
	ldr r0, [sp, #0x18]
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	mov r1, #0x10
	str r0, [sp, #0x20]
	tst r1, r0
	beq _0223ADF0
	mov r1, #0x10
	bic r0, r1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	mov r1, #0xa0
	add r2, sp, #0x20
	bl SetMonData
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223ADCC
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223ADEC
_0223ADCC:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x34
	mov r3, #0
	bl ov12_0224EDE0
	mov r1, #0x10
	str r0, [sp, #0x20]
	bic r0, r1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x34
	add r3, sp, #0x20
	bl ov12_0224F168
_0223ADEC:
	mov r0, #1
	str r0, [sp, #0x14]
_0223ADF0:
	ldr r0, [sp, #0x38]
	mov r1, #0x12
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223AE54
	ldr r0, [sp, #0x18]
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	mov r1, #0x20
	str r0, [sp, #0x20]
	tst r1, r0
	beq _0223AE54
	mov r1, #0x20
	bic r0, r1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	mov r1, #0xa0
	add r2, sp, #0x20
	bl SetMonData
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223AE30
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223AE50
_0223AE30:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x34
	mov r3, #0
	bl ov12_0224EDE0
	mov r1, #0x20
	str r0, [sp, #0x20]
	bic r0, r1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x34
	add r3, sp, #0x20
	bl ov12_0224F168
_0223AE50:
	mov r0, #1
	str r0, [sp, #0x14]
_0223AE54:
	ldr r0, [sp, #0x38]
	mov r1, #0x13
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223AEB8
	ldr r0, [sp, #0x18]
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	mov r1, #0x40
	str r0, [sp, #0x20]
	tst r1, r0
	beq _0223AEB8
	mov r1, #0x40
	bic r0, r1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	mov r1, #0xa0
	add r2, sp, #0x20
	bl SetMonData
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223AE94
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223AEB4
_0223AE94:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x34
	mov r3, #0
	bl ov12_0224EDE0
	mov r1, #0x40
	str r0, [sp, #0x20]
	bic r0, r1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x34
	add r3, sp, #0x20
	bl ov12_0224F168
_0223AEB4:
	mov r0, #1
	str r0, [sp, #0x14]
_0223AEB8:
	ldr r0, [sp, #0x38]
	mov r1, #0x14
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223AF00
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223AED6
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223AF00
_0223AED6:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x35
	mov r3, #0
	bl ov12_0224EDE0
	mov r1, #7
	str r0, [sp, #0x20]
	tst r1, r0
	beq _0223AF00
	mov r1, #7
	bic r0, r1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x35
	add r3, sp, #0x20
	bl ov12_0224F168
	mov r0, #1
	str r0, [sp, #0x14]
_0223AF00:
	ldr r0, [sp, #0x38]
	mov r1, #0x15
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223AF5C
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223AF1E
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223AF5C
_0223AF1E:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x35
	mov r3, #0
	bl ov12_0224EDE0
	mov r1, #0xf
	lsl r1, r1, #0x10
	str r0, [sp, #0x20]
	tst r1, r0
	beq _0223AF5C
	ldr r1, _0223AF44 ; =0xFFF0FFFF
	b _0223AF48
	.balign 4, 0
_0223AF38: .word 0xF7FFFFFF
_0223AF3C: .word 0x00000F88
_0223AF40: .word 0xFFFFF077
_0223AF44: .word 0xFFF0FFFF
_0223AF48:
	mov r2, #0x35
	and r0, r1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	add r3, sp, #0x20
	bl ov12_0224F168
	mov r0, #1
	str r0, [sp, #0x14]
_0223AF5C:
	ldr r0, [sp, #0x38]
	mov r1, #0x16
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223AFB6
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x1c]
	mov r2, #1
	add r3, r7, #0
	bl ov12_022581D4
	str r0, [sp, #0x20]
	cmp r0, #0
	bne _0223AFB6
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x1c]
	mov r2, #0
	add r3, r7, #0
	bl ov12_022581D4
	mov r1, #0x40
	str r0, [sp, #0x20]
	orr r0, r1
	str r0, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x1c]
	mov r2, #0
	add r3, r7, #0
	bl ov12_022582B8
	mov r0, #5
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x1c]
	mov r2, #1
	add r3, r7, #0
	bl ov12_022582B8
	mov r0, #1
	str r0, [sp, #0x14]
_0223AFB6:
	ldr r0, [sp, #0x38]
	mov r1, #0x1b
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223AFF4
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223AFD4
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223AFF4
_0223AFD4:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x13
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #0xc
	bge _0223AFF4
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x13
	mov r3, #1
	bl ov12_0224F794
	mov r0, #1
	str r0, [sp, #0x14]
_0223AFF4:
	ldr r0, [sp, #0x38]
	mov r1, #0x1c
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223B032
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223B012
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223B032
_0223B012:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x14
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #0xc
	bge _0223B032
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x14
	mov r3, #1
	bl ov12_0224F794
	mov r0, #1
	str r0, [sp, #0x14]
_0223B032:
	ldr r0, [sp, #0x38]
	mov r1, #0x1d
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223B070
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223B050
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223B070
_0223B050:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x16
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #0xc
	bge _0223B070
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x16
	mov r3, #1
	bl ov12_0224F794
	mov r0, #1
	str r0, [sp, #0x14]
_0223B070:
	ldr r0, [sp, #0x38]
	mov r1, #0x1e
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223B0AE
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223B08E
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223B0AE
_0223B08E:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x17
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #0xc
	bge _0223B0AE
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x17
	mov r3, #1
	bl ov12_0224F794
	mov r0, #1
	str r0, [sp, #0x14]
_0223B0AE:
	ldr r0, [sp, #0x38]
	mov r1, #0x1f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223B0EC
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223B0CC
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223B0EC
_0223B0CC:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x15
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #0xc
	bge _0223B0EC
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x15
	mov r3, #1
	bl ov12_0224F794
	mov r0, #1
	str r0, [sp, #0x14]
_0223B0EC:
	ldr r0, [sp, #0x38]
	mov r1, #0x20
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223B12A
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223B10A
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223B12A
_0223B10A:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x18
	mov r3, #0
	bl ov12_0224EDE0
	cmp r0, #0xc
	bge _0223B12A
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x18
	mov r3, #1
	bl ov12_0224F794
	mov r0, #1
	str r0, [sp, #0x14]
_0223B12A:
	ldr r0, [sp, #0x38]
	mov r1, #0x21
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223B174
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223B148
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223B174
_0223B148:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x35
	mov r3, #0
	bl ov12_0224EDE0
	mov r1, #1
	lsl r1, r1, #0x14
	add r2, r0, #0
	str r0, [sp, #0x20]
	tst r2, r1
	bne _0223B174
	orr r0, r1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x35
	add r3, sp, #0x20
	bl ov12_0224F168
	mov r0, #1
	str r0, [sp, #0x14]
_0223B174:
	ldr r0, [sp, #0x38]
	mov r1, #0x24
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223B20A
	ldr r0, [sp, #0x38]
	mov r1, #0x37
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	str r0, [sp, #0x20]
	add r1, r4, #0
	ldr r0, [sp, #0x18]
	add r1, #0x3a
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	add r1, r4, #0
	ldr r0, [sp, #0x18]
	add r1, #0x42
	mov r2, #0
	bl GetMonData
	cmp r5, r0
	beq _0223B20A
	add r1, r4, #0
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x20]
	add r1, #0x3a
	bl AddMonData
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223B1CC
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223B206
_0223B1CC:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x35
	mov r3, #0
	bl ov12_0224EDE0
	mov r1, #2
	lsl r1, r1, #0x14
	tst r0, r1
	bne _0223B206
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x4b
	mov r3, #0
	bl ov12_0224EDE0
	add r5, r0, #0
	add r0, r4, #0
	bl MaskOfFlagNo
	tst r0, r5
	bne _0223B206
	add r4, #0x1f
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	add r1, r7, #0
	add r2, r4, #0
	bl ov12_0224F794
_0223B206:
	mov r0, #1
	str r0, [sp, #0x14]
_0223B20A:
	ldr r0, [sp, #0x38]
	mov r1, #0x25
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223B2A8
	ldr r0, [sp, #0x38]
	mov r1, #0x37
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	str r0, [sp, #0x20]
	mov r4, #0
_0223B22E:
	add r1, r4, #0
	ldr r0, [sp, #0x18]
	add r1, #0x3a
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	add r1, r4, #0
	ldr r0, [sp, #0x18]
	add r1, #0x42
	mov r2, #0
	bl GetMonData
	cmp r5, r0
	beq _0223B2A2
	add r1, r4, #0
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x20]
	add r1, #0x3a
	bl AddMonData
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223B264
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223B29E
_0223B264:
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x35
	mov r3, #0
	bl ov12_0224EDE0
	mov r1, #2
	lsl r1, r1, #0x14
	tst r0, r1
	bne _0223B29E
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x4b
	mov r3, #0
	bl ov12_0224EDE0
	add r5, r0, #0
	add r0, r4, #0
	bl MaskOfFlagNo
	tst r0, r5
	bne _0223B29E
	add r2, r4, #0
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	add r1, r7, #0
	add r2, #0x1f
	bl ov12_0224F794
_0223B29E:
	mov r0, #1
	str r0, [sp, #0x14]
_0223B2A2:
	add r4, r4, #1
	cmp r4, #4
	blt _0223B22E
_0223B2A8:
	ldr r0, [sp, #0x38]
	mov r1, #0x26
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	bne _0223B2BC
	b _0223B3C4
_0223B2BC:
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x38]
	mov r1, #0x17
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223B2E6
	ldr r0, [sp, #0x18]
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0223B2F2
	mov r0, #1
	str r0, [sp, #0x20]
	b _0223B2F2
_0223B2E6:
	ldr r0, [sp, #0x18]
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x20]
_0223B2F2:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0223B3C4
	ldr r0, [sp, #0x18]
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	ldr r0, [sp, #0x18]
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	cmp r4, r0
	beq _0223B3C4
	ldr r0, [sp, #0x38]
	mov r1, #0x36
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	str r0, [sp, #0x20]
	cmp r0, #0xfd
	beq _0223B352
	cmp r0, #0xfe
	beq _0223B33C
	cmp r0, #0xff
	bne _0223B372
	ldr r0, [sp, #0x18]
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x20]
	b _0223B372
_0223B33C:
	ldr r0, [sp, #0x18]
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	lsr r0, r0, #1
	str r0, [sp, #0x20]
	bne _0223B372
	mov r0, #1
	str r0, [sp, #0x20]
	b _0223B372
_0223B352:
	ldr r0, [sp, #0x18]
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	mov r1, #0x19
	mul r1, r0
	add r0, r1, #0
	mov r1, #0x64
	bl _u32_div_f
	str r0, [sp, #0x20]
	cmp r0, #0
	bne _0223B372
	mov r0, #1
	str r0, [sp, #0x20]
_0223B372:
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x20]
	mov r1, #0xa3
	bl AddMonData
	ldr r0, [sp, #0x38]
	mov r1, #0x17
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	bne _0223B3C0
	ldr r0, [sp, #4]
	add r1, r7, #0
	bl ov12_0223AB1C
	cmp r0, #0
	beq _0223B3A8
	ldr r0, [sp, #0x1c]
	add r1, r7, #0
	mov r2, #0x5f
	add r3, sp, #0x20
	bl ov12_0224F168
	b _0223B3C0
_0223B3A8:
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223B3B4
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223B3C0
_0223B3B4:
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	add r1, r7, #0
	mov r2, #0x2f
	bl ov12_0224F794
_0223B3C0:
	mov r0, #1
	str r0, [sp, #0x14]
_0223B3C4:
	ldr r0, [sp, #0x38]
	mov r1, #0x2d
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223B3FA
	ldr r0, [sp, #0x18]
	mov r1, #9
	mov r2, #0
	bl GetMonData
	cmp r0, #0x64
	bhs _0223B3FA
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _0223B3FA
	ldr r0, [sp, #0x38]
	mov r1, #0x38
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	str r0, [sp, #8]
_0223B3FA:
	ldr r0, [sp, #0x38]
	mov r1, #0x2e
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223B43E
	ldr r0, [sp, #0x18]
	mov r1, #9
	mov r2, #0
	bl GetMonData
	cmp r0, #0x64
	blo _0223B43E
	ldr r0, [sp, #0x18]
	mov r1, #9
	mov r2, #0
	bl GetMonData
	cmp r0, #0xc8
	bhs _0223B43E
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _0223B43E
	ldr r0, [sp, #0x38]
	mov r1, #0x39
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	str r0, [sp, #8]
_0223B43E:
	ldr r0, [sp, #0x38]
	mov r1, #0x2f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0
	beq _0223B474
	ldr r0, [sp, #0x18]
	mov r1, #9
	mov r2, #0
	bl GetMonData
	cmp r0, #0xc8
	blo _0223B474
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _0223B474
	ldr r0, [sp, #0x38]
	mov r1, #0x3a
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r2, #5
	bl GetItemAttr
	str r0, [sp, #8]
_0223B474:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0223B4FA
	ble gApp_MainMenu_SelectOption_MigrateFromAgb
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x18]
	bl ov12_0223AA88
	bl BallToItemId
	cmp r0, #0xb
	bne _0223B492
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
_0223B492:
	ldr r0, [sp, #0x18]
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	ldr r0, [sp, #4]
	bl ov12_0223AB60
	cmp r4, r0
	bne _0223B4AE
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
_0223B4AE:
	ldr r0, [sp, #0x18]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x20]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #1
	mov r2, #5
	bl GetItemAttr
	cmp r0, #0x35
	bne gApp_MainMenu_SelectOption_MigrateFromAgb
	ldr r1, [sp, #8]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x64
	bl _s32_div_f
	str r0, [sp, #8]
gApp_MainMenu_SelectOption_MigrateFromAgb:
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #8]
	mov r1, #9
	bl AddMonData
	ldr r0, [sp, #0x10]
	cmp r0, r6
	beq _0223B4EE
	ldr r0, [sp, #0xc]
	cmp r0, r6
	bne _0223B4FA
_0223B4EE:
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #8]
	add r1, r7, #0
	mov r2, #0x2c
	bl ov12_0224F794
_0223B4FA:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _0223B50C
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x18]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ApplyItemEffectOnMonMood
_0223B50C:
	ldr r0, [sp, #0x14]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0223AC20

	thumb_func_start ov12_0223B514
ov12_0223B514: ; 0x0223B514
	ldr r1, _0223B51C ; =0x0000240C
	ldr r0, [r0, r1]
	bx lr
	nop
_0223B51C: .word 0x0000240C
	thumb_func_end ov12_0223B514

	thumb_func_start ov12_0223B520
ov12_0223B520: ; 0x0223B520
	ldr r1, _0223B528 ; =0x00002410
	ldr r0, [r0, r1]
	bx lr
	nop
_0223B528: .word 0x00002410
	thumb_func_end ov12_0223B520

	thumb_func_start ov12_0223B52C
ov12_0223B52C: ; 0x0223B52C
	ldr r2, _0223B57C ; =0x00002404
	ldr r1, [r0, r2]
	cmp r1, #5
	bhi _0223B576
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223B540: ; jump table
	.short _0223B54C - _0223B540 - 2 ; case 0
	.short _0223B54C - _0223B540 - 2 ; case 1
	.short _0223B54C - _0223B540 - 2 ; case 2
	.short _0223B54C - _0223B540 - 2 ; case 3
	.short _0223B54C - _0223B540 - 2 ; case 4
	.short _0223B54C - _0223B540 - 2 ; case 5
_0223B54C:
	add r2, #0xc
	ldr r1, [r0, r2]
	cmp r1, #4
	bhi _0223B578
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223B560: ; jump table
	.short _0223B56A - _0223B560 - 2 ; case 0
	.short _0223B56A - _0223B560 - 2 ; case 1
	.short _0223B56E - _0223B560 - 2 ; case 2
	.short _0223B572 - _0223B560 - 2 ; case 3
	.short _0223B572 - _0223B560 - 2 ; case 4
_0223B56A:
	mov r0, #0
	bx lr
_0223B56E:
	mov r0, #1
	bx lr
_0223B572:
	mov r0, #2
	bx lr
_0223B576:
	mov r0, #0
_0223B578:
	bx lr
	nop
_0223B57C: .word 0x00002404
	thumb_func_end ov12_0223B52C

	thumb_func_start ov12_0223B580
ov12_0223B580: ; 0x0223B580
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl ov12_0223AB0C
	cmp r0, #4
	bne _0223B5E8
	ldr r1, [r5, #0x2c]
	mov r0, #8
	tst r0, r1
	bne _0223B5E8
	mov r0, #4
	tst r0, r1
	beq _0223B5B2
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_0223AB6C
	bl MaskOfFlagNo
	tst r0, r4
	bne _0223B5E8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0223B5B2:
	ldr r1, [r5, #0x30]
	add r0, r5, #0
	mov r2, #0xc
	mov r3, #0
	bl ov12_022581D4
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r1, [r5, #0x30]
	add r0, r5, #0
	mov r2, #8
	mov r3, #0
	bl ov12_022581D4
	cmp r0, #0xe
	bne _0223B5D6
	cmp r6, #0x10
	bhi _0223B5E0
_0223B5D6:
	mov r0, #0
	bl MaskOfFlagNo
	tst r0, r4
	beq _0223B5E4
_0223B5E0:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0223B5E4:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0223B5E8:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0223B580

	thumb_func_start ov12_0223B5EC
ov12_0223B5EC: ; 0x0223B5EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x14]
	add r4, r1, #0
	add r7, r2, #0
	cmp r0, #1
	beq _0223B60E
	cmp r0, #4
	beq _0223B60E
	cmp r0, #5
	beq _0223B60E
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0223B60E:
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0223B682
_0223B618:
	mov r0, #0
	str r0, [r4]
	cmp r0, #6
	bge _0223B650
	mov r6, #0x5e
	lsl r6, r6, #2
_0223B624:
	bl MaskOfFlagNo
	ldr r1, [r5, r6]
	tst r0, r1
	beq _0223B646
	ldr r0, [r4]
	bl MaskOfFlagNo
	mov r3, #0x5e
	lsl r3, r3, #2
	mov r2, #0
	mvn r2, r2
	ldr r1, [r5, r3]
	eor r0, r2
	and r0, r1
	str r0, [r5, r3]
	b _0223B650
_0223B646:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	cmp r0, #6
	blt _0223B624
_0223B650:
	ldr r1, [r4]
	cmp r1, #6
	bge _0223B678
	ldr r0, [r5, #4]
	bl GetPartyMonByIndex
	mov r3, #0x16
	str r7, [sp]
	lsl r3, r3, #4
	ldr r3, [r5, r3]
	add r1, r0, #0
	lsl r3, r3, #0x10
	ldr r0, [r5, #4]
	mov r2, #0
	lsr r3, r3, #0x10
	bl GetMonEvolution
	str r0, [sp, #4]
	cmp r0, #0
	bne _0223B684
_0223B678:
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _0223B618
_0223B682:
	ldr r0, [sp, #4]
_0223B684:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_0223B5EC

	thumb_func_start ov12_0223B688
ov12_0223B688: ; 0x0223B688
	ldr r1, _0223B690 ; =0x000023FC
	ldrb r0, [r0, r1]
	bx lr
	nop
_0223B690: .word 0x000023FC
	thumb_func_end ov12_0223B688

	thumb_func_start ov12_0223B694
ov12_0223B694: ; 0x0223B694
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	bne _0223B6A2
	bl GF_AssertFail
_0223B6A2:
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	mov r2, #5
	mov r3, #0
	bl ov12_022581D4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, pc}
	thumb_func_end ov12_0223B694

	thumb_func_start ov12_0223B6B4
ov12_0223B6B4: ; 0x0223B6B4
	ldr r1, _0223B6BC ; =0x00002414
	ldr r0, [r0, r1]
	bx lr
	nop
_0223B6BC: .word 0x00002414
	thumb_func_end ov12_0223B6B4

	thumb_func_start ov12_0223B6C0
ov12_0223B6C0: ; 0x0223B6C0
	ldr r2, _0223B6C8 ; =0x00002414
	str r1, [r0, r2]
	bx lr
	nop
_0223B6C8: .word 0x00002414
	thumb_func_end ov12_0223B6C0

	thumb_func_start ov12_0223B6CC
ov12_0223B6CC: ; 0x0223B6CC
	mov r1, #0x6d
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov12_0223B6CC

	thumb_func_start ov12_0223B6D4
ov12_0223B6D4: ; 0x0223B6D4
	push {r3, lr}
	ldr r2, [r0, #0x2c]
	mov r1, #4
	tst r1, r2
	beq _0223B6EC
	ldr r1, _0223B704 ; =0x0000240C
	ldr r2, [r0, r1]
	mov r1, #0x10
	tst r1, r2
	bne _0223B6EC
	mov r0, #1
	pop {r3, pc}
_0223B6EC:
	mov r1, #0x6d
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl Options_GetBattleScene
	cmp r0, #0
	bne _0223B6FE
	mov r0, #1
	pop {r3, pc}
_0223B6FE:
	mov r0, #0
	pop {r3, pc}
	nop
_0223B704: .word 0x0000240C
	thumb_func_end ov12_0223B6D4

	thumb_func_start ov12_0223B708
ov12_0223B708: ; 0x0223B708
	mov r1, #0x6d
	lsl r1, r1, #2
	ldr r3, _0223B714 ; =Options_GetFrame
	ldr r0, [r0, r1]
	bx r3
	nop
_0223B714: .word Options_GetFrame
	thumb_func_end ov12_0223B708

	thumb_func_start ov12_0223B718
ov12_0223B718: ; 0x0223B718
	push {r3, lr}
	ldr r2, [r0, #0x2c]
	mov r1, #4
	tst r1, r2
	beq _0223B730
	ldr r1, _0223B73C ; =0x0000240C
	ldr r2, [r0, r1]
	mov r1, #0x10
	tst r1, r2
	bne _0223B730
	mov r0, #1
	pop {r3, pc}
_0223B730:
	mov r1, #0x6d
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl Options_GetTextFrameDelay
	pop {r3, pc}
	.balign 4, 0
_0223B73C: .word 0x0000240C
	thumb_func_end ov12_0223B718

	thumb_func_start ov12_0223B740
ov12_0223B740: ; 0x0223B740
	mov r1, #0x6d
	lsl r1, r1, #2
	ldr r3, _0223B74C ; =Options_GetBattleStyle
	ldr r0, [r0, r1]
	bx r3
	nop
_0223B74C: .word Options_GetBattleStyle
	thumb_func_end ov12_0223B740

	thumb_func_start ov12_0223B750
ov12_0223B750: ; 0x0223B750
	mov r1, #0x72
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov12_0223B750

	thumb_func_start ov12_0223B758
ov12_0223B758: ; 0x0223B758
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x2c]
	mov r3, #8
	add r4, r1, #0
	tst r3, r2
	bne _0223B776
	mov r3, #0x10
	tst r2, r3
	beq _0223B77E
	bl ov12_0223AB0C
	mov r1, #1
	tst r0, r1
	beq _0223B77E
_0223B776:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x78]
	pop {r3, r4, r5, pc}
_0223B77E:
	ldr r1, [r5, #0x2c]
	mov r0, #2
	tst r0, r1
	beq _0223B790
	lsl r0, r4, #0x1f
	lsr r0, r0, #0x1d
	add r0, r5, r0
	ldr r0, [r0, #0x78]
	pop {r3, r4, r5, pc}
_0223B790:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x78]
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223B758

	thumb_func_start ov12_0223B798
ov12_0223B798: ; 0x0223B798
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r1, #0xa9
	ldr r2, [r5, #0x2c]
	lsl r1, r1, #2
	tst r1, r2
	bne _0223B84E
	mov r4, #0
	add r1, r4, #0
	bl ov12_0223A834
	cmp r0, #0
	ble _0223B84E
	add r7, r4, #0
_0223B7B4:
	add r0, r5, #0
	mov r1, #0
	add r2, r4, #0
	bl ov12_0223A880
	mov r1, #0xae
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0x67
	lsl r0, r0, #2
	cmp r1, r0
	bne _0223B840
	add r0, r4, #0
	bl MaskOfFlagNo
	ldr r1, _0223B850 ; =0x00002418
	ldrb r1, [r5, r1]
	tst r0, r1
	beq _0223B840
	add r0, r5, #0
	bl ov12_0223AB40
	cmp r0, #0x17
	bhi _0223B828
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223B7F8: ; jump table
	.short _0223B82C - _0223B7F8 - 2 ; case 0
	.short _0223B82C - _0223B7F8 - 2 ; case 1
	.short _0223B828 - _0223B7F8 - 2 ; case 2
	.short _0223B828 - _0223B7F8 - 2 ; case 3
	.short _0223B82C - _0223B7F8 - 2 ; case 4
	.short _0223B82C - _0223B7F8 - 2 ; case 5
	.short _0223B828 - _0223B7F8 - 2 ; case 6
	.short _0223B828 - _0223B7F8 - 2 ; case 7
	.short _0223B828 - _0223B7F8 - 2 ; case 8
	.short _0223B832 - _0223B7F8 - 2 ; case 9
	.short _0223B828 - _0223B7F8 - 2 ; case 10
	.short _0223B832 - _0223B7F8 - 2 ; case 11
	.short _0223B832 - _0223B7F8 - 2 ; case 12
	.short _0223B832 - _0223B7F8 - 2 ; case 13
	.short _0223B832 - _0223B7F8 - 2 ; case 14
	.short _0223B832 - _0223B7F8 - 2 ; case 15
	.short _0223B832 - _0223B7F8 - 2 ; case 16
	.short _0223B82C - _0223B7F8 - 2 ; case 17
	.short _0223B832 - _0223B7F8 - 2 ; case 18
	.short _0223B832 - _0223B7F8 - 2 ; case 19
	.short _0223B832 - _0223B7F8 - 2 ; case 20
	.short _0223B832 - _0223B7F8 - 2 ; case 21
	.short _0223B832 - _0223B7F8 - 2 ; case 22
	.short _0223B82C - _0223B7F8 - 2 ; case 23
_0223B828:
	str r7, [sp]
	b _0223B836
_0223B82C:
	mov r0, #1
	str r0, [sp]
	b _0223B836
_0223B832:
	mov r0, #2
	str r0, [sp]
_0223B836:
	add r0, r6, #0
	mov r1, #0x70
	add r2, sp, #0
	bl SetMonData
_0223B840:
	add r0, r5, #0
	mov r1, #0
	add r4, r4, #1
	bl ov12_0223A834
	cmp r4, r0
	blt _0223B7B4
_0223B84E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223B850: .word 0x00002418
	thumb_func_end ov12_0223B798

	thumb_func_start ov12_0223B854
ov12_0223B854: ; 0x0223B854
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r4, r1, #0
	bl MaskOfFlagNo
	ldr r1, _0223B86C ; =0x00002418
	add r2, r5, r1
	ldrb r1, [r2, r4]
	orr r0, r1
	strb r0, [r2, r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223B86C: .word 0x00002418
	thumb_func_end ov12_0223B854

	thumb_func_start ov12_0223B870
ov12_0223B870: ; 0x0223B870
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0223B870

	thumb_func_start ov12_0223B874
ov12_0223B874: ; 0x0223B874
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	mov r1, #1
	add r4, r0, #0
	mov r0, #5
	lsl r1, r1, #0x10
	bl AllocFromHeap
	mov r1, #0x22
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #5
	sub r1, #0x20
	bl AllocFromHeap
	mov r1, #0x89
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, r1, #4
	mov r2, #1
	ldr r0, _0223BACC ; =0x06010000
	ldr r1, [r4, r1]
	lsl r2, r2, #0x10
	bl MIi_CpuCopy32
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r5, [r4, r0]
	ldr r0, [r4, #0x28]
	mov r1, #0
	bl PaletteData_GetUnfadedBuf
	mov r2, #2
	add r1, r5, #0
	lsl r2, r2, #8
	bl MIi_CpuCopy32
	mov r0, #0x19
	lsl r0, r0, #0x16
	str r0, [sp, #0x24]
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl sub_02024B1C
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x24]
	add r0, r0, r1
	str r0, [sp, #0x24]
	mov r0, #0x14
	str r0, [sp, #0x28]
	lsl r0, r0, #0xb
	str r0, [sp, #0xc]
_0223B8E0:
	mov r0, #0x10
	mov ip, r0
	lsl r0, r0, #6
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	mov r7, #1
	sub r0, #0x14
	lsl r1, r0, #8
	ldr r0, [sp, #0x24]
	add r0, r0, r1
	str r0, [sp, #0x10]
_0223B8F6:
	mov r0, ip
	sub r0, #0x10
	ldr r1, [sp, #0x10]
	lsl r3, r0, #5
	add r3, r1, r3
	ldr r5, [sp, #0xc]
	ldr r1, [sp, #0x14]
	mov r2, #0
	add r6, r5, r1
_0223B908:
	cmp r0, #8
	bge _0223B930
	add r1, r2, #0
	tst r1, r7
	beq _0223B922
	lsr r1, r2, #0x1f
	add r1, r2, r1
	asr r1, r1, #1
	ldrb r5, [r3, r1]
	mov r1, #0xf0
	and r1, r5
	asr r1, r1, #4
	b _0223B95E
_0223B922:
	lsr r1, r2, #0x1f
	add r1, r2, r1
	asr r1, r1, #1
	ldrb r5, [r3, r1]
	mov r1, #0xf
	and r1, r5
	b _0223B95E
_0223B930:
	mov r1, #1
	tst r1, r2
	beq _0223B94C
	lsr r1, r2, #0x1f
	add r1, r2, r1
	asr r1, r1, #1
	add r5, r3, r1
	mov r1, #7
	lsl r1, r1, #8
	ldrb r5, [r5, r1]
	mov r1, #0xf0
	and r1, r5
	asr r1, r1, #4
	b _0223B95E
_0223B94C:
	lsr r1, r2, #0x1f
	add r1, r2, r1
	asr r1, r1, #1
	add r5, r3, r1
	mov r1, #7
	lsl r1, r1, #8
	ldrb r5, [r5, r1]
	mov r1, #0xf
	and r1, r5
_0223B95E:
	cmp r1, #0
	beq _0223B96E
	mov r5, #0x22
	lsl r5, r5, #4
	ldr r5, [r4, r5]
	add r1, #0x70
	add r5, r6, r5
	strb r1, [r2, r5]
_0223B96E:
	add r2, r2, #1
	cmp r2, #0x40
	blt _0223B908
	ldr r0, [sp, #0x14]
	add r0, #0x40
	str r0, [sp, #0x14]
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	cmp r0, #0x20
	blt _0223B8F6
	mov r1, #2
	ldr r0, [sp, #0xc]
	lsl r1, r1, #0xa
	add r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #0x1c
	blt _0223B8E0
	mov r0, #0x19
	lsl r0, r0, #0x16
	str r0, [sp, #8]
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl sub_02024B1C
	ldr r1, [r0, #4]
	ldr r0, [sp, #8]
	mov r7, #0x26
	add r0, r0, r1
	str r0, [sp, #8]
	mov r3, #0
	mov r0, #0xf
	mov r1, #0xf0
	lsl r7, r7, #0xa
	mov r2, #1
_0223B9BE:
	add r5, r3, #0
	tst r5, r2
	beq _0223B9D4
	lsr r5, r3, #0x1f
	add r5, r3, r5
	asr r6, r5, #1
	ldr r5, [sp, #8]
	ldrb r5, [r5, r6]
	and r5, r1
	asr r5, r5, #4
	b _0223B9E0
_0223B9D4:
	lsr r5, r3, #0x1f
	add r5, r3, r5
	asr r6, r5, #1
	ldr r5, [sp, #8]
	ldrb r5, [r5, r6]
	and r5, r0
_0223B9E0:
	cmp r5, #0
	beq _0223B9F0
	mov r6, #0x22
	lsl r6, r6, #4
	ldr r6, [r4, r6]
	add r5, #0x70
	add r6, r6, r3
	strb r5, [r6, r7]
_0223B9F0:
	mov r5, #2
	add r3, r3, #1
	lsl r5, r5, #0xa
	cmp r3, r5
	blt _0223B9BE
	mov r0, #0x1c
	str r0, [sp, #4]
	lsl r0, r0, #0xb
	str r0, [sp, #0x18]
_0223BA02:
	ldr r0, [sp, #4]
	mov r2, #0
	sub r0, #0x1c
	lsl r1, r0, #8
	ldr r0, [sp, #8]
	str r2, [sp, #0x20]
	add r0, r0, r1
	str r0, [sp, #0x1c]
	mov r7, #1
_0223BA14:
	asr r0, r2, #2
	lsr r0, r0, #0x1d
	add r0, r2, r0
	asr r0, r0, #3
	lsl r1, r0, #0xa
	ldr r0, [sp, #0x1c]
	lsr r5, r2, #0x1f
	add r6, r0, r1
	lsl r1, r2, #0x1d
	sub r1, r1, r5
	mov r0, #0x1d
	ror r1, r0
	add r0, r5, r1
	lsl r0, r0, #5
	ldr r5, [sp, #0x18]
	ldr r1, [sp, #0x20]
	mov r3, #0
	add r0, r6, r0
	add r1, r5, r1
_0223BA3A:
	add r5, r3, #0
	tst r5, r7
	beq _0223BA56
	lsr r5, r3, #0x1f
	add r5, r3, r5
	asr r5, r5, #1
	add r6, r0, r5
	mov r5, #1
	lsl r5, r5, #0xa
	ldrb r6, [r6, r5]
	mov r5, #0xf0
	and r5, r6
	asr r5, r5, #4
	b _0223BA68
_0223BA56:
	lsr r5, r3, #0x1f
	add r5, r3, r5
	asr r5, r5, #1
	add r6, r0, r5
	mov r5, #1
	lsl r5, r5, #0xa
	ldrb r6, [r6, r5]
	mov r5, #0xf
	and r5, r6
_0223BA68:
	cmp r5, #0
	beq _0223BA78
	mov r6, #0x22
	lsl r6, r6, #4
	ldr r6, [r4, r6]
	add r5, #0x70
	add r6, r1, r6
	strb r5, [r3, r6]
_0223BA78:
	add r3, r3, #1
	cmp r3, #0x40
	blt _0223BA3A
	ldr r0, [sp, #0x20]
	add r2, r2, #1
	add r0, #0x40
	str r0, [sp, #0x20]
	cmp r2, #0x18
	blt _0223BA14
	mov r3, #2
	ldr r0, [sp, #0x18]
	lsl r3, r3, #0xa
	add r0, r0, r3
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #0x20
	blt _0223BA02
	mov r0, #0
	mov r2, #0x22
	str r0, [sp]
	lsl r2, r2, #4
	ldr r0, [r4, #4]
	ldr r2, [r4, r2]
	mov r1, #3
	lsl r3, r3, #5
	bl BG_LoadCharTilesData
	mov r0, #0x5f
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov12_02266008
	mov r0, #0x63
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov12_02266008
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_0223BACC: .word 0x06010000
	thumb_func_end ov12_0223B874

	thumb_func_start ov12_0223BAD0
ov12_0223BAD0: ; 0x0223BAD0
	mov r1, #0x22
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov12_0223BAD0

	thumb_func_start ov12_0223BAD8
ov12_0223BAD8: ; 0x0223BAD8
	mov r1, #0x89
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov12_0223BAD8

	thumb_func_start ov12_0223BAE0
ov12_0223BAE0: ; 0x0223BAE0
	ldr r1, _0223BAE8 ; =0x00002228
	add r0, r0, r1
	bx lr
	nop
_0223BAE8: .word 0x00002228
	thumb_func_end ov12_0223BAE0

	thumb_func_start ov12_0223BAEC
ov12_0223BAEC: ; 0x0223BAEC
	ldr r1, _0223BAF4 ; =0x00002308
	add r0, r0, r1
	bx lr
	nop
_0223BAF4: .word 0x00002308
	thumb_func_end ov12_0223BAEC

	thumb_func_start ov12_0223BAF8
ov12_0223BAF8: ; 0x0223BAF8
	ldr r1, _0223BB00 ; =0x0000242C
	ldr r0, [r0, r1]
	bx lr
	nop
_0223BB00: .word 0x0000242C
	thumb_func_end ov12_0223BAF8

	thumb_func_start ov12_0223BB04
ov12_0223BB04: ; 0x0223BB04
	ldr r1, _0223BB0C ; =0x00002421
	ldrb r0, [r0, r1]
	bx lr
	nop
_0223BB0C: .word 0x00002421
	thumb_func_end ov12_0223BB04

	thumb_func_start ov12_0223BB10
ov12_0223BB10: ; 0x0223BB10
	ldr r2, _0223BB18 ; =0x00002421
	strb r1, [r0, r2]
	bx lr
	nop
_0223BB18: .word 0x00002421
	thumb_func_end ov12_0223BB10

	thumb_func_start ov12_0223BB1C
ov12_0223BB1C: ; 0x0223BB1C
	ldr r1, _0223BB24 ; =0x00002430
	ldr r0, [r0, r1]
	bx lr
	nop
_0223BB24: .word 0x00002430
	thumb_func_end ov12_0223BB1C

	thumb_func_start ov12_0223BB28
ov12_0223BB28: ; 0x0223BB28
	push {r3, lr}
	ldr r2, _0223BB40 ; =0x0000240C
	ldr r3, [r0, r2]
	mov r2, #0x10
	tst r2, r3
	bne _0223BB3E
	mov r2, #0x87
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	bl GameStats_Inc
_0223BB3E:
	pop {r3, pc}
	.balign 4, 0
_0223BB40: .word 0x0000240C
	thumb_func_end ov12_0223BB28

	thumb_func_start ov12_0223BB44
ov12_0223BB44: ; 0x0223BB44
	push {r3, lr}
	ldr r1, _0223BB60 ; =0x0000240C
	ldr r2, [r0, r1]
	mov r1, #0x10
	tst r1, r2
	bne _0223BB5C
	mov r1, #0x87
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0x15
	bl GameStats_AddSpecial
_0223BB5C:
	pop {r3, pc}
	nop
_0223BB60: .word 0x0000240C
	thumb_func_end ov12_0223BB44

	thumb_func_start ov12_0223BB64
ov12_0223BB64: ; 0x0223BB64
	mov r2, #0x91
	lsl r2, r2, #6
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov12_0223BB64

	thumb_func_start ov12_0223BB6C
ov12_0223BB6C: ; 0x0223BB6C
	ldr r2, _0223BB74 ; =0x00002444
	strb r1, [r0, r2]
	bx lr
	nop
_0223BB74: .word 0x00002444
	thumb_func_end ov12_0223BB6C

	thumb_func_start ov12_0223BB78
ov12_0223BB78: ; 0x0223BB78
	mov r1, #0x6f
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov12_0223BB78

	thumb_func_start ov12_0223BB80
ov12_0223BB80: ; 0x0223BB80
	mov r2, #0x6f
	lsl r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov12_0223BB80

	thumb_func_start ov12_0223BB88
ov12_0223BB88: ; 0x0223BB88
	mov r2, #0x1d
	lsl r2, r2, #4
	add r2, r0, r2
	lsl r0, r1, #4
	add r0, r2, r0
	bx lr
	thumb_func_end ov12_0223BB88

	thumb_func_start ov12_0223BB94
ov12_0223BB94: ; 0x0223BB94
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #4
	blt _0223BBA2
	bl GF_AssertFail
_0223BBA2:
	lsl r0, r5, #4
	ldr r0, [r4, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223BB94

	thumb_func_start ov12_0223BBA8
ov12_0223BBA8: ; 0x0223BBA8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #4
	blt _0223BBB8
	bl GF_AssertFail
_0223BBB8:
	lsl r0, r4, #4
	add r0, r5, r0
	str r6, [r0, #4]
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0223BBA8

	thumb_func_start ov12_0223BBC0
ov12_0223BBC0: ; 0x0223BBC0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #4
	blt _0223BBD0
	bl GF_AssertFail
_0223BBD0:
	lsl r0, r4, #4
	add r0, r5, r0
	str r6, [r0, #8]
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0223BBC0

	thumb_func_start ov12_0223BBD8
ov12_0223BBD8: ; 0x0223BBD8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #4
	blt _0223BBE8
	bl GF_AssertFail
_0223BBE8:
	lsl r0, r4, #4
	add r0, r5, r0
	str r6, [r0, #0xc]
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0223BBD8

	thumb_func_start ov12_0223BBF0
ov12_0223BBF0: ; 0x0223BBF0
	ldr r2, _0223BBF8 ; =0x000023FD
	strb r1, [r0, r2]
	bx lr
	nop
_0223BBF8: .word 0x000023FD
	thumb_func_end ov12_0223BBF0

	thumb_func_start ov12_0223BBFC
ov12_0223BBFC: ; 0x0223BBFC
	ldr r2, _0223BC04 ; =0x000023F4
	str r1, [r0, r2]
	bx lr
	nop
_0223BC04: .word 0x000023F4
	thumb_func_end ov12_0223BBFC

	thumb_func_start ov12_0223BC08
ov12_0223BC08: ; 0x0223BC08
	ldr r2, _0223BC10 ; =0x000023F8
	str r1, [r0, r2]
	bx lr
	nop
_0223BC10: .word 0x000023F8
	thumb_func_end ov12_0223BC08

	thumb_func_start ov12_0223BC14
ov12_0223BC14: ; 0x0223BC14
	ldr r2, _0223BC1C ; =0x000023F4
	ldr r0, [r0, r2]
	strb r1, [r0]
	bx lr
	.balign 4, 0
_0223BC1C: .word 0x000023F4
	thumb_func_end ov12_0223BC14

	thumb_func_start ov12_0223BC20
ov12_0223BC20: ; 0x0223BC20
	ldr r2, _0223BC28 ; =0x000023F8
	ldr r0, [r0, r2]
	strb r1, [r0]
	bx lr
	.balign 4, 0
_0223BC28: .word 0x000023F8
	thumb_func_end ov12_0223BC20

	thumb_func_start ov12_0223BC2C
ov12_0223BC2C: ; 0x0223BC2C
	ldr r2, _0223BC34 ; =0x000023FE
	strb r1, [r0, r2]
	bx lr
	nop
_0223BC34: .word 0x000023FE
	thumb_func_end ov12_0223BC2C

	thumb_func_start ov12_0223BC38
ov12_0223BC38: ; 0x0223BC38
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r3, _0223BC44 ; =ov12_0226127C
	ldr r0, [r0, #0x34]
	bx r3
	nop
_0223BC44: .word ov12_0226127C
	thumb_func_end ov12_0223BC38

	thumb_func_start ov12_0223BC48
ov12_0223BC48: ; 0x0223BC48
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x44]
	mov r7, #0
	cmp r0, #0
	ble _0223BC94
	add r5, r6, #0
_0223BC56:
	ldr r0, [r5, #0x34]
	bl ov12_0226127C
	add r4, r0, #0
	str r6, [r4, #0xc]
	ldr r0, [r5, #0x34]
	bl ov12_02261258
	str r0, [sp]
	add r0, r6, #0
	bl ov12_0223A7E0
	add r1, r0, #0
	ldr r0, [sp]
	bl ov12_02265B64
	add r1, r4, #0
	add r1, #0x25
	strb r0, [r1]
	add r0, r4, #0
	bl ov12_02264BCC
	add r0, r4, #0
	mov r1, #0
	bl ov12_02264F28
	ldr r0, [r6, #0x44]
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, r0
	blt _0223BC56
_0223BC94:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0223BC48

	thumb_func_start ov12_0223BC98
ov12_0223BC98: ; 0x0223BC98
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x44]
	mov r4, #0
	cmp r0, #0
	ble _0223BCC4
	add r5, r6, #0
	mov r7, #1
_0223BCA8:
	ldr r0, [r5, #0x34]
	bl ov12_0226127C
	ldr r1, [r0, #0x28]
	cmp r1, #0
	beq _0223BCBA
	add r1, r7, #0
	bl ov12_02264F28
_0223BCBA:
	ldr r0, [r6, #0x44]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0223BCA8
_0223BCC4:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0223BC98

	thumb_func_start ov12_0223BCC8
ov12_0223BCC8: ; 0x0223BCC8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x44]
	mov r4, #0
	cmp r0, #0
	ble _0223BCEE
	add r5, r6, #0
	add r7, r4, #0
_0223BCD8:
	ldr r0, [r5, #0x34]
	bl ov12_0226127C
	add r1, r7, #0
	bl ov12_02264F28
	ldr r0, [r6, #0x44]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0223BCD8
_0223BCEE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_0223BCC8

	thumb_func_start ov12_0223BCF0
ov12_0223BCF0: ; 0x0223BCF0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x44]
	mov r4, #0
	cmp r0, #0
	ble _0223BD12
	add r5, r6, #0
_0223BCFE:
	ldr r0, [r5, #0x34]
	bl ov12_0226127C
	bl ov12_02264C68
	ldr r0, [r6, #0x44]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0223BCFE
_0223BD12:
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0223BCF0

	thumb_func_start ov12_0223BD14
ov12_0223BD14: ; 0x0223BD14
	ldr r1, _0223BD1C ; =0x00002420
	ldrb r0, [r0, r1]
	bx lr
	nop
_0223BD1C: .word 0x00002420
	thumb_func_end ov12_0223BD14

	thumb_func_start ov12_0223BD20
ov12_0223BD20: ; 0x0223BD20
	ldr r2, _0223BD28 ; =0x00002420
	strb r1, [r0, r2]
	bx lr
	nop
_0223BD28: .word 0x00002420
	thumb_func_end ov12_0223BD20

	thumb_func_start ov12_0223BD2C
ov12_0223BD2C: ; 0x0223BD2C
	ldr r1, _0223BD38 ; =0x000023FF
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1e
	bx lr
	nop
_0223BD38: .word 0x000023FF
	thumb_func_end ov12_0223BD2C

	thumb_func_start ov12_0223BD3C
ov12_0223BD3C: ; 0x0223BD3C
	push {r3, r4}
	ldr r3, _0223BD54 ; =0x000023FF
	lsl r1, r1, #0x1e
	ldrb r4, [r0, r3]
	mov r2, #0x18
	lsr r1, r1, #0x1b
	bic r4, r2
	orr r1, r4
	strb r1, [r0, r3]
	pop {r3, r4}
	bx lr
	nop
_0223BD54: .word 0x000023FF
	thumb_func_end ov12_0223BD3C

	thumb_func_start ov12_0223BD58
ov12_0223BD58: ; 0x0223BD58
	ldr r1, _0223BD64 ; =0x000023FF
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1d
	bx lr
	nop
_0223BD64: .word 0x000023FF
	thumb_func_end ov12_0223BD58

	thumb_func_start ov12_0223BD68
ov12_0223BD68: ; 0x0223BD68
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xf
	blo _0223BD76
	bl GF_AssertFail
_0223BD76:
	ldr r1, _0223BD88 ; =0x000023FF
	mov r0, #0xe0
	ldrb r2, [r5, r1]
	bic r2, r0
	lsl r0, r4, #0x1d
	lsr r0, r0, #0x18
	orr r0, r2
	strb r0, [r5, r1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223BD88: .word 0x000023FF
	thumb_func_end ov12_0223BD68

	thumb_func_start ov12_0223BD8C
ov12_0223BD8C: ; 0x0223BD8C
	ldr r2, _0223BD94 ; =0x0000243C
	str r1, [r0, r2]
	bx lr
	nop
_0223BD94: .word 0x0000243C
	thumb_func_end ov12_0223BD8C

	thumb_func_start ov12_0223BD98
ov12_0223BD98: ; 0x0223BD98
	push {r3, r4}
	ldr r2, _0223BDB8 ; =0x00002448
	ldr r1, _0223BDBC ; =0x41C64E6D
	ldr r3, [r0, r2]
	add r4, r3, #0
	mul r4, r1
	ldr r1, _0223BDC0 ; =0x00006073
	add r1, r4, r1
	str r1, [r0, r2]
	ldr r0, [r0, r2]
	lsr r0, r0, #0x10
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4}
	bx lr
	nop
_0223BDB8: .word 0x00002448
_0223BDBC: .word 0x41C64E6D
_0223BDC0: .word 0x00006073
	thumb_func_end ov12_0223BD98

	thumb_func_start ov12_0223BDC4
ov12_0223BDC4: ; 0x0223BDC4
	ldr r1, _0223BDCC ; =0x0000244C
	ldr r0, [r0, r1]
	bx lr
	nop
_0223BDCC: .word 0x0000244C
	thumb_func_end ov12_0223BDC4

	thumb_func_start ov12_0223BDD0
ov12_0223BDD0: ; 0x0223BDD0
	ldr r2, _0223BDD8 ; =0x0000244C
	str r1, [r0, r2]
	bx lr
	nop
_0223BDD8: .word 0x0000244C
	thumb_func_end ov12_0223BDD0

	thumb_func_start ov12_0223BDDC
ov12_0223BDDC: ; 0x0223BDDC
	push {r4, r5, r6, lr}
	add r6, r1, #0
	ldr r1, _0223BE08 ; =0x0000240C
	mov r3, #0x10
	ldr r4, [r0, r1]
	tst r4, r3
	bne _0223BE04
	add r1, #0x54
	add r4, r0, r1
	lsl r5, r6, #1
	ldrh r1, [r4, r5]
	lsl r0, r3, #6
	cmp r1, r0
	bhs _0223BE04
	add r0, r6, #0
	bl sub_02030260
	ldrh r0, [r4, r5]
	add r0, r0, #1
	strh r0, [r4, r5]
_0223BE04:
	pop {r4, r5, r6, pc}
	nop
_0223BE08: .word 0x0000240C
	thumb_func_end ov12_0223BDDC

	thumb_func_start ov12_0223BE0C
ov12_0223BE0C: ; 0x0223BE0C
	push {r3, r4, r5, r6, r7, lr}
	str r2, [sp]
	add r3, r1, #0
	ldr r1, [sp]
	mov r2, #0xff
	strb r2, [r1]
	ldr r1, _0223BE60 ; =0x0000240C
	mov r6, #0x10
	ldr r2, [r0, r1]
	and r2, r6
	beq _0223BE44
	add r1, #0x54
	lsl r5, r3, #1
	add r4, r0, r1
	ldrh r1, [r4, r5]
	lsl r6, r6, #6
	cmp r1, r6
	bhs _0223BE44
	add r0, r3, #0
	bl sub_0203027C
	ldr r1, [sp]
	mov r7, #0
	strb r0, [r1]
	ldrh r0, [r4, r5]
	add r0, r0, #1
	strh r0, [r4, r5]
	b _0223BE5A
_0223BE44:
	cmp r2, #0
	beq _0223BE5A
	lsl r1, r3, #1
	add r1, r0, r1
	ldr r0, _0223BE64 ; =0x00002460
	ldrh r1, [r1, r0]
	mov r0, #1
	lsl r0, r0, #0xa
	cmp r1, r0
	blo _0223BE5A
	mov r7, #1
_0223BE5A:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223BE60: .word 0x0000240C
_0223BE64: .word 0x00002460
	thumb_func_end ov12_0223BE0C

	thumb_func_start ov12_0223BE68
ov12_0223BE68: ; 0x0223BE68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	mov r6, #0
	ldr r0, [r0, #0x44]
	add r7, r6, #0
	str r1, [sp, #4]
	cmp r0, #0
	ble _0223BEFC
_0223BE7A:
	ldr r0, [sp]
	lsl r1, r7, #1
	add r5, r0, r1
	ldr r0, _0223BF0C ; =0x00002460
	add r1, r0, #0
	sub r1, #0x10
	ldrh r2, [r5, r0]
	ldrh r1, [r5, r1]
	cmp r2, r1
	beq _0223BEEE
	add r1, r6, #1
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	ldr r1, [sp, #4]
	add r3, r0, #0
	strb r7, [r1, r6]
	add r1, r2, #1
	lsl r1, r1, #0x18
	sub r3, #0x10
	lsr r6, r1, #0x18
	ldrh r1, [r5, r0]
	ldrh r3, [r5, r3]
	mov r4, #0
	sub r3, r1, r3
	ldr r1, [sp, #4]
	strb r3, [r1, r2]
	ldrh r1, [r5, r0]
	sub r0, #0x10
	ldrh r0, [r5, r0]
	sub r0, r1, r0
	cmp r0, #0
	ble _0223BEE6
_0223BEBA:
	ldr r1, _0223BF10 ; =0x00002450
	add r0, r7, #0
	ldrh r1, [r5, r1]
	add r1, r4, r1
	bl sub_0203027C
	add r2, r6, #1
	lsl r2, r2, #0x18
	add r1, r6, #0
	lsr r6, r2, #0x18
	ldr r2, [sp, #4]
	strb r0, [r2, r1]
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r0, _0223BF0C ; =0x00002460
	ldrh r1, [r5, r0]
	sub r0, #0x10
	ldrh r0, [r5, r0]
	sub r0, r1, r0
	cmp r4, r0
	blt _0223BEBA
_0223BEE6:
	ldr r0, _0223BF0C ; =0x00002460
	ldrh r1, [r5, r0]
	sub r0, #0x10
	strh r1, [r5, r0]
_0223BEEE:
	add r0, r7, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [sp]
	ldr r0, [r0, #0x44]
	cmp r7, r0
	blt _0223BE7A
_0223BEFC:
	cmp r6, #0x1c
	bls _0223BF04
	bl GF_AssertFail
_0223BF04:
	add r0, r6, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223BF0C: .word 0x00002460
_0223BF10: .word 0x00002450
	thumb_func_end ov12_0223BE68

	thumb_func_start ov12_0223BF14
ov12_0223BF14: ; 0x0223BF14
	push {r0, r1, r2, r3}
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	mov r1, #0
	add r0, sp, #8
	strb r1, [r0]
	ldr r0, [sp]
	add r6, r2, #0
	ldr r1, [r0, #0x2c]
	mov r0, #4
	tst r0, r1
	beq _0223BF9E
	ldr r1, _0223BFA8 ; =0x000023FC
	ldr r0, [sp]
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _0223BF9E
	add r0, sp, #0x20
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _0223BF9E
_0223BF40:
	add r0, r6, #0
	add r1, sp, #8
	add r2, sp, #0x24
	bl ov12_0223BFB0
	add r5, r0, #0
	add r0, r6, #0
	add r1, sp, #8
	add r2, sp, #0x24
	bl ov12_0223BFB0
	add r7, r0, #0
	mov r4, #0
	cmp r7, #0
	ble _0223BF86
	ldr r0, [sp]
	lsl r1, r5, #1
	add r0, r0, r1
	str r0, [sp, #4]
_0223BF66:
	add r0, r6, #0
	add r1, sp, #8
	add r2, sp, #0x24
	bl ov12_0223BFB0
	add r2, r0, #0
	ldr r3, [sp, #4]
	ldr r1, _0223BFAC ; =0x00002458
	add r0, r5, #0
	ldrh r1, [r3, r1]
	add r1, r4, r1
	bl sub_02030260
	add r4, r4, #1
	cmp r4, r7
	blt _0223BF66
_0223BF86:
	ldr r0, [sp]
	lsl r1, r5, #1
	add r2, r0, r1
	ldr r0, _0223BFAC ; =0x00002458
	ldrh r0, [r2, r0]
	add r1, r0, r7
	ldr r0, _0223BFAC ; =0x00002458
	strh r1, [r2, r0]
	add r0, sp, #0x20
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _0223BF40
_0223BF9E:
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_0223BFA8: .word 0x000023FC
_0223BFAC: .word 0x00002458
	thumb_func_end ov12_0223BF14

	thumb_func_start ov12_0223BFB0
ov12_0223BFB0: ; 0x0223BFB0
	ldrh r3, [r2]
	sub r3, r3, #1
	strh r3, [r2]
	ldrb r3, [r1]
	add r2, r3, #1
	strb r2, [r1]
	ldrb r0, [r0, r3]
	bx lr
	thumb_func_end ov12_0223BFB0

	thumb_func_start ov12_0223BFC0
ov12_0223BFC0: ; 0x0223BFC0
	ldr r1, _0223BFC8 ; =0x00002446
	ldrh r0, [r0, r1]
	bx lr
	nop
_0223BFC8: .word 0x00002446
	thumb_func_end ov12_0223BFC0

	thumb_func_start ov12_0223BFCC
ov12_0223BFCC: ; 0x0223BFCC
	lsl r1, r1, #2
	add r1, r0, r1
	ldr r0, _0223BFD8 ; =0x00002468
	ldr r0, [r1, r0]
	bx lr
	nop
_0223BFD8: .word 0x00002468
	thumb_func_end ov12_0223BFCC

	thumb_func_start ov12_0223BFDC
ov12_0223BFDC: ; 0x0223BFDC
	mov r3, #0x34
	mul r3, r1
	add r1, r0, r3
	lsl r0, r2, #1
	add r0, r1, r0
	add r0, #0xb0
	ldrh r0, [r0]
	bx lr
	thumb_func_end ov12_0223BFDC

	thumb_func_start ov12_0223BFEC
ov12_0223BFEC: ; 0x0223BFEC
	ldr r1, _0223BFF8 ; =0x00002478
	ldr r0, [r0, r1]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bx lr
	nop
_0223BFF8: .word 0x00002478
	thumb_func_end ov12_0223BFEC

	thumb_func_start ov12_0223BFFC
ov12_0223BFFC: ; 0x0223BFFC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r1, _0223C078 ; =0x0000240C
	add r5, r0, #0
	ldr r3, [r5, r1]
	mov r2, #0x10
	tst r2, r3
	beq _0223C072
	add r1, #0x6c
	ldr r1, [r5, r1]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	bne _0223C072
	ldr r1, [r5, #0x30]
	mov r2, #0xd
	mov r3, #0
	bl ov12_022581D4
	cmp r0, #0x2c
	beq _0223C072
	ldr r1, [r5, #0x30]
	add r0, r5, #0
	mov r2, #0xe
	mov r3, #0
	bl ov12_022581D4
	cmp r0, #0x2c
	beq _0223C072
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl ov12_0226AA8C
	mov r1, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
	bl sub_02005FA0
	mov r0, #0
	bl sub_020059D0
	ldr r1, _0223C07C ; =0x00002478
	mov r0, #1
	ldr r2, [r5, r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	str r0, [r5, r1]
_0223C072:
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0223C078: .word 0x0000240C
_0223C07C: .word 0x00002478
	thumb_func_end ov12_0223BFFC

	thumb_func_start ov12_0223C080
ov12_0223C080: ; 0x0223C080
	push {r4, lr}
	ldr r1, _0223C0C0 ; =0x0000240C
	add r4, r0, #0
	ldr r3, [r4, r1]
	mov r2, #0x10
	tst r2, r3
	beq _0223C0B6
	add r1, #0x6c
	ldr r1, [r4, r1]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	bne _0223C0B6
	ldr r1, [r4, #0x30]
	mov r2, #0xd
	mov r3, #0
	bl ov12_022581D4
	cmp r0, #0x2c
	beq _0223C0B6
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	mov r2, #0xe
	mov r3, #0
	bl ov12_022581D4
	cmp r0, #0x2c
	bne _0223C0BA
_0223C0B6:
	mov r0, #0
	pop {r4, pc}
_0223C0BA:
	mov r0, #1
	pop {r4, pc}
	nop
_0223C0C0: .word 0x0000240C
	thumb_func_end ov12_0223C080

	thumb_func_start ov12_0223C0C4
ov12_0223C0C4: ; 0x0223C0C4
	push {r4, lr}
	ldr r1, _0223C0E8 ; =0x0000240C
	add r4, r0, #0
	ldr r3, [r4, r1]
	mov r2, #0x10
	tst r2, r3
	beq _0223C0E4
	add r1, #0x74
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _0223C0E4
	bl ov12_0226BEC4
	mov r1, #0x92
	lsl r1, r1, #6
	str r0, [r4, r1]
_0223C0E4:
	pop {r4, pc}
	nop
_0223C0E8: .word 0x0000240C
	thumb_func_end ov12_0223C0C4

	thumb_func_start ov12_0223C0EC
ov12_0223C0EC: ; 0x0223C0EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x2c]
	mov r3, #8
	add r4, r1, #0
	tst r3, r2
	bne _0223C10A
	mov r3, #0x10
	tst r2, r3
	beq _0223C112
	bl ov12_0223AB0C
	mov r1, #1
	tst r0, r1
	beq _0223C112
_0223C10A:
	ldr r0, _0223C130 ; =0x00002484
	add r1, r5, r4
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
_0223C112:
	ldr r1, [r5, #0x2c]
	mov r0, #2
	tst r0, r1
	beq _0223C126
	mov r0, #1
	and r0, r4
	add r1, r5, r0
	ldr r0, _0223C130 ; =0x00002484
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
_0223C126:
	ldr r0, _0223C130 ; =0x00002484
	add r1, r5, r4
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
	nop
_0223C130: .word 0x00002484
	thumb_func_end ov12_0223C0EC

	thumb_func_start ov12_0223C134
ov12_0223C134: ; 0x0223C134
	ldr r1, _0223C13C ; =0x00002488
	ldr r0, [r0, r1]
	bx lr
	nop
_0223C13C: .word 0x00002488
	thumb_func_end ov12_0223C134

	thumb_func_start ov12_0223C140
ov12_0223C140: ; 0x0223C140
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	blo _0223C14E
	mov r0, #0xff
	pop {r3, r4, r5, pc}
_0223C14E:
	mov r3, #0xa9
	ldr r2, [r5, #0x2c]
	lsl r3, r3, #2
	tst r3, r2
	beq _0223C15C
	mov r0, #0xff
	pop {r3, r4, r5, pc}
_0223C15C:
	mov r3, #2
	tst r2, r3
	beq _0223C170
	bl ov12_0223AB0C
	mov r1, #1
	tst r0, r1
	beq _0223C170
	mov r0, #0xff
	pop {r3, r4, r5, pc}
_0223C170:
	ldr r1, [r5, #0x2c]
	mov r0, #8
	tst r0, r1
	beq _0223C180
	ldr r0, _0223C19C ; =0x0000248C
	add r1, r5, r4
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
_0223C180:
	mov r0, #2
	tst r0, r1
	beq _0223C192
	mov r0, #1
	and r0, r4
	add r1, r5, r0
	ldr r0, _0223C19C ; =0x0000248C
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
_0223C192:
	ldr r0, _0223C19C ; =0x0000248C
	add r1, r5, r4
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
	nop
_0223C19C: .word 0x0000248C
	thumb_func_end ov12_0223C140

	thumb_func_start ov12_0223C1A0
ov12_0223C1A0: ; 0x0223C1A0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x44]
	add r7, r1, #0
	mov r4, #0
	cmp r0, #0
	ble _0223C1C2
	add r5, r6, #0
_0223C1B0:
	ldr r0, [r5, #0x34]
	bl ov12_02261258
	strb r4, [r7, r0]
	ldr r0, [r6, #0x44]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0223C1B0
_0223C1C2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_0223C1A0

	thumb_func_start ov12_0223C1C4
ov12_0223C1C4: ; 0x0223C1C4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	mov r1, #0
	mov r0, #0xff
_0223C1CE:
	strb r0, [r6, r1]
	add r1, r1, #1
	cmp r1, #4
	blt _0223C1CE
	ldr r0, [r7, #0x44]
	mov r5, #0
	cmp r0, #0
	ble _0223C1F2
	add r4, r7, #0
_0223C1E0:
	ldr r0, [r4, #0x34]
	bl ov12_02261258
	strb r0, [r6, r5]
	ldr r0, [r7, #0x44]
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r0
	blt _0223C1E0
_0223C1F2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_0223C1C4

	thumb_func_start ov12_0223C1F4
ov12_0223C1F4: ; 0x0223C1F4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0
	add r6, r1, #0
	add r5, r0, #0
_0223C1FE:
	add r0, r0, #1
	stmia r1!, {r5}
	cmp r0, #4
	blt _0223C1FE
	ldr r0, [r7, #0x44]
	cmp r0, #0
	ble _0223C220
	add r4, r7, #0
_0223C20E:
	ldr r0, [r4, #0x34]
	bl ov12_02261270
	stmia r6!, {r0}
	ldr r0, [r7, #0x44]
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r0
	blt _0223C20E
_0223C220:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_0223C1F4

	thumb_func_start ov12_0223C224
ov12_0223C224: ; 0x0223C224
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x44]
	add r7, r1, #0
	mov r4, #0
	cmp r0, #0
	ble _0223C24A
	add r5, r6, #0
_0223C234:
	ldr r0, [r5, #0x34]
	bl ov12_0226127C
	add r1, r7, #0
	bl ov12_02264EE0
	ldr r0, [r6, #0x44]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0223C234
_0223C24A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_0223C224

	thumb_func_start ov12_0223C24C
ov12_0223C24C: ; 0x0223C24C
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	bl PlayerProfile_CountBadges
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #8
	bls _0223C262
	mov r4, #8
_0223C262:
	add r0, r5, #0
	bl Party_GetMaxLevel
	ldr r1, _0223C284 ; =ov12_0226C2E0
	lsl r0, r0, #2
	ldrb r1, [r1, r4]
	add r4, r1, #0
	mul r4, r0
	add r0, r6, #0
	bl PlayerProfile_GetMoney
	cmp r4, r0
	bls _0223C27E
	add r4, r0, #0
_0223C27E:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_0223C284: .word ov12_0226C2E0
	thumb_func_end ov12_0223C24C

	thumb_func_start ov12_0223C288
ov12_0223C288: ; 0x0223C288
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	lsl r0, r6, #2
	add r0, r5, r0
	ldr r0, [r0, #0x34]
	bl ov12_02261258
	add r4, r0, #0
	ldr r1, [r5, #0x30]
	add r0, r5, #0
	mov r2, #2
	add r3, r6, #0
	bl ov12_022581D4
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov12_0223A880
	add r6, r0, #0
	ldr r0, [r5, #0x2c]
	mov r1, #0x84
	tst r1, r0
	bne _0223C2CE
	mov r1, #1
	tst r1, r4
	bne _0223C2C6
	sub r0, #0x4a
	cmp r0, #1
	bhi _0223C2CE
_0223C2C6:
	ldr r0, [r5, #0x60]
	add r1, r6, #0
	bl Pokedex_SetMonSeenFlag
_0223C2CE:
	mov r0, #1
	tst r0, r4
	bne _0223C2EE
	add r0, r6, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	mov r1, #0x67
	lsl r1, r1, #2
	cmp r0, r1
	bne _0223C2EE
	ldr r0, [r5, #0x60]
	add r1, r6, #0
	bl Pokedex_SetMonCaughtFlag
_0223C2EE:
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0223C288

	thumb_func_start ov12_0223C2F0
ov12_0223C2F0: ; 0x0223C2F0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x34]
	bl ov12_02261258
	ldr r2, [r5, #0x2c]
	mov r1, #0x84
	tst r1, r2
	bne _0223C32C
	mov r1, #1
	tst r0, r1
	beq _0223C32C
	ldr r1, [r5, #0x30]
	add r0, r5, #0
	mov r2, #2
	add r3, r4, #0
	bl ov12_022581D4
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0223A880
	add r1, r0, #0
	ldr r0, [r5, #0x60]
	bl Pokedex_SetMonCaughtFlag
_0223C32C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0223C2F0

	thumb_func_start ov12_0223C330
ov12_0223C330: ; 0x0223C330
	ldr r3, _0223C33C ; =Pokedex_CheckMonCaughtFlag
	lsl r1, r1, #0x10
	ldr r0, [r0, #0x60]
	lsr r1, r1, #0x10
	bx r3
	nop
_0223C33C: .word Pokedex_CheckMonCaughtFlag
	thumb_func_end ov12_0223C330

	thumb_func_start ov12_0223C340
ov12_0223C340: ; 0x0223C340
	ldr r0, _0223C348 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	bx lr
	.balign 4, 0
_0223C348: .word 0x04000050
	thumb_func_end ov12_0223C340

	thumb_func_start ov12_0223C34C
ov12_0223C34C: ; 0x0223C34C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	add r6, r0, #0
	mov r1, #0
	str r2, [sp, #0xc]
	add r5, r3, #0
	bl ov12_0223A7D8
	add r7, r0, #0
	ldr r0, [r6, #0x2c]
	mov r2, #0x80
	add r1, r0, #0
	tst r1, r2
	beq _0223C454
	ldr r1, _0223C488 ; =0x00002710
	cmp r4, r1
	beq _0223C376
	lsl r1, r2, #6
	tst r0, r1
	beq _0223C3D2
_0223C376:
	cmp r5, #0x64
	bne _0223C38E
	ldr r0, [sp, #0xc]
	add r2, r6, #0
	mov r1, #0x34
	add r2, #0xd0
	mul r1, r0
	add r0, r2, r1
	mov r1, #5
	bl MailMsg_GetExpandedString
	b _0223C3A0
_0223C38E:
	ldr r0, [sp, #0xc]
	add r2, r6, #0
	mov r1, #0x34
	add r2, #0xd8
	mul r1, r0
	add r0, r2, r1
	mov r1, #5
	bl MailMsg_GetExpandedString
_0223C3A0:
	add r4, r0, #0
	add r0, r7, #0
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r6, #0x18]
	add r1, r4, #0
	bl StringCopy
	mov r3, #0
	ldr r0, [sp, #0x30]
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0223C48C ; =ov12_0223CF14
	mov r1, #1
	str r0, [sp, #8]
	ldr r2, [r6, #0x18]
	add r0, r7, #0
	bl AddTextPrinterParameterized
	add r5, r0, #0
	add r0, r4, #0
	bl String_dtor
	b _0223C480
_0223C3D2:
	cmp r5, #0x64
	bne _0223C3E0
	lsl r0, r4, #1
	add r0, r4, r0
	add r0, r0, #1
	str r0, [sp, #0x10]
	b _0223C3E8
_0223C3E0:
	lsl r0, r4, #1
	add r0, r4, r0
	add r0, r0, #2
	str r0, [sp, #0x10]
_0223C3E8:
	mov r4, #0
	add r5, r6, #0
_0223C3EC:
	ldr r0, [r5, #0x48]
	bl PlayerProfile_GetVersion
	cmp r0, #0
	beq _0223C3FE
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0223C3EC
_0223C3FE:
	cmp r4, #4
	bne _0223C408
	mov r2, #0xb5
	lsl r2, r2, #2
	b _0223C40A
_0223C408:
	ldr r2, _0223C490 ; =0x000002D3
_0223C40A:
	mov r0, #0
	mov r1, #0x1b
	mov r3, #5
	bl NewMsgDataFromNarc
	ldr r1, [sp, #0x10]
	str r0, [sp, #0x14]
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r7, #0
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r6, #0x18]
	add r1, r4, #0
	bl StringCopy
	mov r3, #0
	ldr r0, [sp, #0x30]
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0223C48C ; =ov12_0223CF14
	mov r1, #1
	str r0, [sp, #8]
	ldr r2, [r6, #0x18]
	add r0, r7, #0
	bl AddTextPrinterParameterized
	add r5, r0, #0
	add r0, r4, #0
	bl String_dtor
	ldr r0, [sp, #0x14]
	bl DestroyMsgData
	b _0223C480
_0223C454:
	ldr r2, [r6, #0x18]
	add r0, r4, #0
	add r1, r5, #0
	mov r3, #5
	bl GetTrainerMessageByIdPair
	add r0, r7, #0
	mov r1, #0xff
	bl FillWindowPixelBuffer
	mov r3, #0
	ldr r0, [sp, #0x30]
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0223C48C ; =ov12_0223CF14
	mov r1, #1
	str r0, [sp, #8]
	ldr r2, [r6, #0x18]
	add r0, r7, #0
	bl AddTextPrinterParameterized
	add r5, r0, #0
_0223C480:
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223C488: .word 0x00002710
_0223C48C: .word ov12_0223CF14
_0223C490: .word 0x000002D3
	thumb_func_end ov12_0223C34C

	thumb_func_start ov12_0223C494
ov12_0223C494: ; 0x0223C494
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #0xc]
	add r5, r0, #0
	add r4, r2, #0
	mov r1, #0
	add r6, r3, #0
	bl ov12_0223A7D8
	add r7, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0223C558
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0223C754
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	add r2, r4, #0
	bl ov12_0223CEF4
	add r0, r7, #0
	mov r1, #0xff
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	ldr r0, _0223C4E4 ; =ov12_0223CF14
	str r6, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [r5, #0x18]
	add r0, r7, #0
	mov r1, #1
	bl AddTextPrinterParameterized
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223C4E4: .word ov12_0223CF14
	thumb_func_end ov12_0223C494

	thumb_func_start ov12_0223C4E8
ov12_0223C4E8: ; 0x0223C4E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r3, #0
	add r4, r1, #0
	add r5, r0, #0
	add r1, r7, #0
	add r6, r2, #0
	bl ov12_0223C558
	add r0, r5, #0
	add r1, r7, #0
	bl ov12_0223C754
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov12_0223CEF4
	ldr r1, [sp, #0x28]
	mov r0, #1
	tst r0, r1
	beq _0223C51C
	add r0, r4, #0
	mov r1, #0xff
	bl FillWindowPixelBuffer
_0223C51C:
	ldr r1, [sp, #0x28]
	mov r0, #2
	tst r0, r1
	beq _0223C534
	mov r0, #0
	ldr r1, [r5, #0x18]
	add r2, r0, #0
	bl FontID_String_GetWidth
	ldr r1, [sp, #0x2c]
	sub r3, r1, r0
	b _0223C536
_0223C534:
	mov r3, #0
_0223C536:
	ldr r0, [sp, #0x24]
	mov r1, #0
	str r0, [sp]
	ldr r0, [sp, #0x30]
	str r0, [sp, #4]
	ldr r0, _0223C554 ; =ov12_0223CF14
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r4, [sp, #0x20]
	ldr r2, [r5, #0x18]
	add r3, r4, r3
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223C554: .word ov12_0223CF14
	thumb_func_end ov12_0223C4E8

	thumb_func_start ov12_0223C558
ov12_0223C558: ; 0x0223C558
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r0, #0
	bl ov12_0223A7E0
	add r5, r0, #0
	ldrb r0, [r4, #1]
	mov r1, #0x80
	tst r1, r0
	bne _0223C57E
	mov r1, #0x40
	tst r1, r0
	beq _0223C588
	ldr r1, [r4, #0x20]
	add r0, r6, #0
	bl ov12_0223AB1C
	cmp r0, #0
	bne _0223C580
_0223C57E:
	b _0223C752
_0223C580:
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C588:
	mov r1, #0x3f
	and r0, r1
	cmp r0, #0x3c
	bls _0223C592
	b _0223C74E
_0223C592:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223C59E: ; jump table
	.short _0223C752 - _0223C59E - 2 ; case 0
	.short _0223C618 - _0223C59E - 2 ; case 1
	.short _0223C630 - _0223C59E - 2 ; case 2
	.short _0223C752 - _0223C59E - 2 ; case 3
	.short _0223C752 - _0223C59E - 2 ; case 4
	.short _0223C752 - _0223C59E - 2 ; case 5
	.short _0223C752 - _0223C59E - 2 ; case 6
	.short _0223C752 - _0223C59E - 2 ; case 7
	.short _0223C752 - _0223C59E - 2 ; case 8
	.short _0223C692 - _0223C59E - 2 ; case 9
	.short _0223C630 - _0223C59E - 2 ; case 10
	.short _0223C630 - _0223C59E - 2 ; case 11
	.short _0223C630 - _0223C59E - 2 ; case 12
	.short _0223C630 - _0223C59E - 2 ; case 13
	.short _0223C630 - _0223C59E - 2 ; case 14
	.short _0223C630 - _0223C59E - 2 ; case 15
	.short _0223C630 - _0223C59E - 2 ; case 16
	.short _0223C630 - _0223C59E - 2 ; case 17
	.short _0223C630 - _0223C59E - 2 ; case 18
	.short _0223C630 - _0223C59E - 2 ; case 19
	.short _0223C656 - _0223C59E - 2 ; case 20
	.short _0223C66E - _0223C59E - 2 ; case 21
	.short _0223C752 - _0223C59E - 2 ; case 22
	.short _0223C66E - _0223C59E - 2 ; case 23
	.short _0223C752 - _0223C59E - 2 ; case 24
	.short _0223C752 - _0223C59E - 2 ; case 25
	.short _0223C752 - _0223C59E - 2 ; case 26
	.short _0223C752 - _0223C59E - 2 ; case 27
	.short _0223C752 - _0223C59E - 2 ; case 28
	.short _0223C752 - _0223C59E - 2 ; case 29
	.short _0223C752 - _0223C59E - 2 ; case 30
	.short _0223C692 - _0223C59E - 2 ; case 31
	.short _0223C692 - _0223C59E - 2 ; case 32
	.short _0223C692 - _0223C59E - 2 ; case 33
	.short _0223C630 - _0223C59E - 2 ; case 34
	.short _0223C630 - _0223C59E - 2 ; case 35
	.short _0223C6F0 - _0223C59E - 2 ; case 36
	.short _0223C630 - _0223C59E - 2 ; case 37
	.short _0223C630 - _0223C59E - 2 ; case 38
	.short _0223C630 - _0223C59E - 2 ; case 39
	.short _0223C630 - _0223C59E - 2 ; case 40
	.short _0223C630 - _0223C59E - 2 ; case 41
	.short _0223C630 - _0223C59E - 2 ; case 42
	.short _0223C6F0 - _0223C59E - 2 ; case 43
	.short _0223C630 - _0223C59E - 2 ; case 44
	.short _0223C630 - _0223C59E - 2 ; case 45
	.short _0223C630 - _0223C59E - 2 ; case 46
	.short _0223C630 - _0223C59E - 2 ; case 47
	.short _0223C66E - _0223C59E - 2 ; case 48
	.short _0223C752 - _0223C59E - 2 ; case 49
	.short _0223C752 - _0223C59E - 2 ; case 50
	.short _0223C752 - _0223C59E - 2 ; case 51
	.short _0223C6F0 - _0223C59E - 2 ; case 52
	.short _0223C6F0 - _0223C59E - 2 ; case 53
	.short _0223C6F0 - _0223C59E - 2 ; case 54
	.short _0223C6F0 - _0223C59E - 2 ; case 55
	.short _0223C752 - _0223C59E - 2 ; case 56
	.short _0223C752 - _0223C59E - 2 ; case 57
	.short _0223C752 - _0223C59E - 2 ; case 58
	.short _0223C752 - _0223C59E - 2 ; case 59
	.short _0223C752 - _0223C59E - 2 ; case 60
_0223C618:
	ldr r1, [r4, #4]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov12_0223AB1C
	cmp r0, #0
	beq _0223C64C
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C630:
	ldr r1, [r4, #4]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov12_0223AB1C
	cmp r0, #0
	beq _0223C64C
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	mov r0, #1
	tst r0, r5
	bne _0223C64E
_0223C64C:
	b _0223C752
_0223C64E:
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C656:
	ldr r1, [r4, #8]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov12_0223AB1C
	cmp r0, #0
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C66E:
	ldr r1, [r4, #8]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov12_0223AB1C
	cmp r0, #0
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	mov r0, #1
	tst r0, r5
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C692:
	ldr r1, [r4, #4]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov12_0223AB1C
	cmp r0, #0
	beq _0223C6CC
	ldrh r0, [r4, #2]
	add r0, r0, #3
	strh r0, [r4, #2]
	mov r0, #1
	tst r0, r5
	beq _0223C6B4
	ldrh r0, [r4, #2]
	add r0, r0, #2
	strh r0, [r4, #2]
_0223C6B4:
	ldr r1, [r4, #8]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov12_0223AB1C
	cmp r0, #0
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C6CC:
	ldr r1, [r4, #8]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov12_0223AB1C
	cmp r0, #0
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	mov r0, #1
	tst r0, r5
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C6F0:
	ldr r1, [r4, #4]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov12_0223AB1C
	cmp r0, #0
	beq _0223C72A
	ldrh r0, [r4, #2]
	add r0, r0, #3
	strh r0, [r4, #2]
	mov r0, #1
	tst r0, r5
	beq _0223C712
	ldrh r0, [r4, #2]
	add r0, r0, #2
	strh r0, [r4, #2]
_0223C712:
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov12_0223AB1C
	cmp r0, #0
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C72A:
	ldr r1, [r4, #0xc]
	add r0, r6, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov12_0223AB1C
	cmp r0, #0
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	mov r0, #1
	tst r0, r5
	beq _0223C752
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	pop {r4, r5, r6, pc}
_0223C74E:
	bl GF_AssertFail
_0223C752:
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_0223C558

	thumb_func_start ov12_0223C754
ov12_0223C754: ; 0x0223C754
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r2, [r4, #1]
	mov r1, #0x3f
	add r5, r0, #0
	and r1, r2
	cmp r1, #0x3c
	bls _0223C766
	b _0223CDCA
_0223C766:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223C772: ; jump table
	.short _0223CDCE - _0223C772 - 2 ; case 0
	.short _0223CDCE - _0223C772 - 2 ; case 1
	.short _0223C7EC - _0223C772 - 2 ; case 2
	.short _0223C7F6 - _0223C772 - 2 ; case 3
	.short _0223C800 - _0223C772 - 2 ; case 4
	.short _0223C80A - _0223C772 - 2 ; case 5
	.short _0223C814 - _0223C772 - 2 ; case 6
	.short _0223C81E - _0223C772 - 2 ; case 7
	.short _0223C82A - _0223C772 - 2 ; case 8
	.short _0223C834 - _0223C772 - 2 ; case 9
	.short _0223C848 - _0223C772 - 2 ; case 10
	.short _0223C85C - _0223C772 - 2 ; case 11
	.short _0223C870 - _0223C772 - 2 ; case 12
	.short _0223C884 - _0223C772 - 2 ; case 13
	.short _0223C898 - _0223C772 - 2 ; case 14
	.short _0223C8AC - _0223C772 - 2 ; case 15
	.short _0223C8C0 - _0223C772 - 2 ; case 16
	.short _0223C8D4 - _0223C772 - 2 ; case 17
	.short _0223C8E8 - _0223C772 - 2 ; case 18
	.short _0223C8FC - _0223C772 - 2 ; case 19
	.short _0223C7F6 - _0223C772 - 2 ; case 20
	.short _0223C910 - _0223C772 - 2 ; case 21
	.short _0223C924 - _0223C772 - 2 ; case 22
	.short _0223C938 - _0223C772 - 2 ; case 23
	.short _0223C94C - _0223C772 - 2 ; case 24
	.short _0223C960 - _0223C772 - 2 ; case 25
	.short _0223C974 - _0223C772 - 2 ; case 26
	.short _0223C988 - _0223C772 - 2 ; case 27
	.short _0223C99C - _0223C772 - 2 ; case 28
	.short _0223C9B0 - _0223C772 - 2 ; case 29
	.short _0223C9C4 - _0223C772 - 2 ; case 30
	.short _0223C9D8 - _0223C772 - 2 ; case 31
	.short _0223C9F6 - _0223C772 - 2 ; case 32
	.short _0223CA14 - _0223C772 - 2 ; case 33
	.short _0223CA32 - _0223C772 - 2 ; case 34
	.short _0223CA50 - _0223C772 - 2 ; case 35
	.short _0223CA6E - _0223C772 - 2 ; case 36
	.short _0223CA8C - _0223C772 - 2 ; case 37
	.short _0223CAAA - _0223C772 - 2 ; case 38
	.short _0223CAC8 - _0223C772 - 2 ; case 39
	.short _0223CAE6 - _0223C772 - 2 ; case 40
	.short _0223CB04 - _0223C772 - 2 ; case 41
	.short _0223CB22 - _0223C772 - 2 ; case 42
	.short _0223CB40 - _0223C772 - 2 ; case 43
	.short _0223CB5E - _0223C772 - 2 ; case 44
	.short _0223CB7C - _0223C772 - 2 ; case 45
	.short _0223CB9A - _0223C772 - 2 ; case 46
	.short _0223CBB8 - _0223C772 - 2 ; case 47
	.short _0223CBD6 - _0223C772 - 2 ; case 48
	.short _0223CBF4 - _0223C772 - 2 ; case 49
	.short _0223CC12 - _0223C772 - 2 ; case 50
	.short _0223CC30 - _0223C772 - 2 ; case 51
	.short _0223CC4E - _0223C772 - 2 ; case 52
	.short _0223CC76 - _0223C772 - 2 ; case 53
	.short _0223CC9E - _0223C772 - 2 ; case 54
	.short _0223CCC6 - _0223C772 - 2 ; case 55
	.short _0223CCEE - _0223C772 - 2 ; case 56
	.short _0223CD16 - _0223C772 - 2 ; case 57
	.short _0223CD3E - _0223C772 - 2 ; case 58
	.short _0223CD66 - _0223C772 - 2 ; case 59
	.short _0223CD8E - _0223C772 - 2 ; case 60
_0223C7EC:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223C7F6:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223C800:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CE68
	pop {r3, r4, r5, pc}
_0223C80A:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CE00
	pop {r3, r4, r5, pc}
_0223C814:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CE0C
	pop {r3, r4, r5, pc}
_0223C81E:
	ldr r2, [r4, #4]
	ldr r3, [r4, #0x1c]
	mov r1, #0
	bl ov12_0223CE24
	pop {r3, r4, r5, pc}
_0223C82A:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CECC
	pop {r3, r4, r5, pc}
_0223C834:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223C848:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223C85C:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	pop {r3, r4, r5, pc}
_0223C870:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE68
	pop {r3, r4, r5, pc}
_0223C884:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE50
	pop {r3, r4, r5, pc}
_0223C898:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE80
	pop {r3, r4, r5, pc}
_0223C8AC:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE00
	pop {r3, r4, r5, pc}
_0223C8C0:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CEA4
	pop {r3, r4, r5, pc}
_0223C8D4:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE0C
	pop {r3, r4, r5, pc}
_0223C8E8:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	pop {r3, r4, r5, pc}
_0223C8FC:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CEE4
	pop {r3, r4, r5, pc}
_0223C910:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDF4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223C924:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDF4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223C938:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CE5C
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223C94C:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CE00
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223C960:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CE0C
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE0C
	pop {r3, r4, r5, pc}
_0223C974:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CECC
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	pop {r3, r4, r5, pc}
_0223C988:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CECC
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223C99C:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CECC
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE00
	pop {r3, r4, r5, pc}
_0223C9B0:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CECC
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE0C
	pop {r3, r4, r5, pc}
_0223C9C4:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	pop {r3, r4, r5, pc}
_0223C9D8:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223C9F6:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE5C
	pop {r3, r4, r5, pc}
_0223CA14:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE00
	pop {r3, r4, r5, pc}
_0223CA32:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDF4
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223CA50:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDF4
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE0C
	pop {r3, r4, r5, pc}
_0223CA6E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223CA8C:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223CAAA:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE00
	pop {r3, r4, r5, pc}
_0223CAC8:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE68
	pop {r3, r4, r5, pc}
_0223CAE6:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE50
	pop {r3, r4, r5, pc}
_0223CB04:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE74
	pop {r3, r4, r5, pc}
_0223CB22:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE0C
	pop {r3, r4, r5, pc}
_0223CB40:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE00
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223CB5E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE00
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223CB7C:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE00
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE68
	pop {r3, r4, r5, pc}
_0223CB9A:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE00
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE74
	pop {r3, r4, r5, pc}
_0223CBB8:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CEE4
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CEE4
	pop {r3, r4, r5, pc}
_0223CBD6:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CE00
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CEA8
	pop {r3, r4, r5, pc}
_0223CBF4:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CECC
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223CC12:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223CC30:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CE00
	pop {r3, r4, r5, pc}
_0223CC4E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CDF4
	pop {r3, r4, r5, pc}
_0223CC76:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CE5C
	pop {r3, r4, r5, pc}
_0223CC9E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE5C
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CE68
	pop {r3, r4, r5, pc}
_0223CCC6:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CDD0
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CE00
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CE00
	pop {r3, r4, r5, pc}
_0223CCEE:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CECC
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CDD0
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CECC
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223CD16:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223CD3E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CECC
	pop {r3, r4, r5, pc}
_0223CD66:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CEB4
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CECC
	pop {r3, r4, r5, pc}
_0223CD8E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov12_0223CECC
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CDD0
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CEB4
	ldr r2, [r4, #0x14]
	add r0, r5, #0
	mov r1, #4
	bl ov12_0223CECC
	ldr r2, [r4, #0x18]
	add r0, r5, #0
	mov r1, #5
	bl ov12_0223CDD0
	pop {r3, r4, r5, pc}
_0223CDCA:
	bl GF_AssertFail
_0223CDCE:
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223C754

	thumb_func_start ov12_0223CDD0
ov12_0223CDD0: ; 0x0223CDD0
	push {r3, r4, r5, lr}
	mov r3, #0xff
	lsl r3, r3, #8
	add r4, r1, #0
	lsl r1, r2, #0x18
	and r2, r3
	add r5, r0, #0
	lsr r1, r1, #0x18
	asr r2, r2, #8
	bl ov12_0223A880
	add r2, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl BufferBoxMonNickname
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0223CDD0

	thumb_func_start ov12_0223CDF4
ov12_0223CDF4: ; 0x0223CDF4
	ldr r3, _0223CDFC ; =BufferMoveName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CDFC: .word BufferMoveName
	thumb_func_end ov12_0223CDF4

	thumb_func_start ov12_0223CE00
ov12_0223CE00: ; 0x0223CE00
	ldr r3, _0223CE08 ; =BufferItemName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CE08: .word BufferItemName
	thumb_func_end ov12_0223CE00

	thumb_func_start ov12_0223CE0C
ov12_0223CE0C: ; 0x0223CE0C
	push {r3, lr}
	sub sp, #8
	mov r3, #0
	str r3, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldr r0, [r0, #0x14]
	mov r3, #5
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov12_0223CE0C

	thumb_func_start ov12_0223CE24
ov12_0223CE24: ; 0x0223CE24
	push {r4, lr}
	sub sp, #8
	cmp r3, #0
	beq _0223CE3C
	mov r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	ldr r0, [r0, #0x14]
	bl BufferIntegerAsString
	add sp, #8
	pop {r4, pc}
_0223CE3C:
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, [r0, #0x14]
	mov r3, #5
	bl BufferIntegerAsString
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0223CE24

	thumb_func_start ov12_0223CE50
ov12_0223CE50: ; 0x0223CE50
	ldr r3, _0223CE58 ; =BufferTypeName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CE58: .word BufferTypeName
	thumb_func_end ov12_0223CE50

	thumb_func_start ov12_0223CE5C
ov12_0223CE5C: ; 0x0223CE5C
	ldr r3, _0223CE64 ; =BufferAbilityName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CE64: .word BufferAbilityName
	thumb_func_end ov12_0223CE5C

	thumb_func_start ov12_0223CE68
ov12_0223CE68: ; 0x0223CE68
	ldr r3, _0223CE70 ; =BufferStatName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CE70: .word BufferStatName
	thumb_func_end ov12_0223CE68

	thumb_func_start ov12_0223CE74
ov12_0223CE74: ; 0x0223CE74
	ldr r3, _0223CE7C ; =BufferStatusName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CE7C: .word BufferStatusName
	thumb_func_end ov12_0223CE74

	thumb_func_start ov12_0223CE80
ov12_0223CE80: ; 0x0223CE80
	push {r3, r4, r5, lr}
	mov r3, #0xff
	lsl r3, r3, #8
	add r4, r1, #0
	lsl r1, r2, #0x18
	and r2, r3
	add r5, r0, #0
	lsr r1, r1, #0x18
	asr r2, r2, #8
	bl ov12_0223A880
	add r2, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl BufferBoxMonSpeciesName
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0223CE80

	thumb_func_start ov12_0223CEA4
ov12_0223CEA4: ; 0x0223CEA4
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0223CEA4

	thumb_func_start ov12_0223CEA8
ov12_0223CEA8: ; 0x0223CEA8
	ldr r3, _0223CEB0 ; =BufferFlavorDislikeText
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CEB0: .word BufferFlavorDislikeText
	thumb_func_end ov12_0223CEA8

	thumb_func_start ov12_0223CEB4
ov12_0223CEB4: ; 0x0223CEB4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r1, r2, #0
	bl ov12_0223A9F4
	add r2, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl BufferTrainerClassNameFromDataStruct
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223CEB4

	thumb_func_start ov12_0223CECC
ov12_0223CECC: ; 0x0223CECC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r1, r2, #0
	bl ov12_0223A9F4
	add r2, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl BufferTrainerNameFromDataStruct
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223CECC

	thumb_func_start ov12_0223CEE4
ov12_0223CEE4: ; 0x0223CEE4
	push {r4, lr}
	add r4, r0, #0
	add r3, r2, #0
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x64]
	bl BufferPCBoxName
	pop {r4, pc}
	thumb_func_end ov12_0223CEE4

	thumb_func_start ov12_0223CEF4
ov12_0223CEF4: ; 0x0223CEF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	ldrh r1, [r2, #2]
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223CEF4

	thumb_func_start ov12_0223CF14
ov12_0223CF14: ; 0x0223CF14
	push {r4, lr}
	mov r4, #0
	cmp r1, #5
	bhi _0223CF5C
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223CF28: ; jump table
	.short _0223CF5C - _0223CF28 - 2 ; case 0
	.short _0223CF34 - _0223CF28 - 2 ; case 1
	.short _0223CF3C - _0223CF28 - 2 ; case 2
	.short _0223CF44 - _0223CF28 - 2 ; case 3
	.short _0223CF4C - _0223CF28 - 2 ; case 4
	.short _0223CF54 - _0223CF28 - 2 ; case 5
_0223CF34:
	bl GF_IsAnySEPlaying
	add r4, r0, #0
	b _0223CF5C
_0223CF3C:
	bl IsFanfarePlaying
	add r4, r0, #0
	b _0223CF5C
_0223CF44:
	ldr r0, _0223CF60 ; =0x000004A3
	bl PlayFanfare
	b _0223CF5C
_0223CF4C:
	ldr r0, _0223CF64 ; =0x000005E6
	bl PlaySE
	b _0223CF5C
_0223CF54:
	mov r0, #0x4a
	lsl r0, r0, #4
	bl PlayFanfare
_0223CF5C:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_0223CF60: .word 0x000004A3
_0223CF64: .word 0x000005E6
	thumb_func_end ov12_0223CF14

	.rodata

_0226BFD8:
	.byte 0x00, 0x01, 0x00, 0x00

ov12_0226BFDC: ; 0x0226BFDC
	.byte 0x00, 0x01, 0x01, 0x00

ov12_0226BFE0: ; 0x0226BFE0
	.byte 0x02, 0x03, 0x04, 0x05, 0x03, 0x02, 0x05, 0x04

ov12_0226BFE8: ; 0x0226BFE8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov12_0226BFF8: ; 0x0226BFF8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov12_0226C008: ; 0x0226C008
	.byte 0x02, 0x05, 0x04, 0x03, 0x03, 0x04, 0x05, 0x02
	.byte 0x02, 0x05, 0x04, 0x03, 0x03, 0x04, 0x05, 0x02

ov12_0226C018: ; 0x0226C018
	.byte 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x00, 0x00

ov12_0226C02C: ; 0x0226C02C
	.byte 0x60, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00

ov12_0226C044: ; 0x0226C044
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov12_0226C060: ; 0x0226C060
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov12_0226C080: ; 0x0226C080
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov12_0226C0A8: ; 0x0226C0A8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov12_0226C0D0: ; 0x0226C0D0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov12_0226C0F8: ; 0x0226C0F8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov12_0226C120: ; 0x0226C120
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x02, 0x03
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x01, 0x06, 0x04, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov12_0226C174: ; 0x0226C174
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x02, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x01, 0x06, 0x04
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov12_0226C1C8: ; 0x0226C1C8
	.byte 0x51, 0x7B, 0x00, 0x00, 0x3E, 0x02, 0x00, 0x00
	.byte 0x00, 0x5E, 0x00, 0x00, 0x51, 0x7B, 0x00, 0x00, 0x3E, 0x02, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x00
	.byte 0x51, 0x7B, 0x00, 0x00, 0x3E, 0x02, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x00, 0xAB, 0x16, 0x00, 0x00
	.byte 0xAB, 0x16, 0x00, 0x00, 0xAB, 0x16, 0x00, 0x00, 0x51, 0x7B, 0x00, 0x00, 0x3E, 0x02, 0x00, 0x00
	.byte 0x00, 0x5E, 0x00, 0x00, 0x5F, 0x7F, 0x00, 0x00, 0x5F, 0x5B, 0x00, 0x00, 0xD8, 0x5A, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xA5, 0x1C, 0x00, 0x00, 0xA5, 0x1C, 0x00, 0x00, 0xA5, 0x1C, 0x00, 0x00
	.byte 0xA5, 0x1C, 0x00, 0x00, 0xA5, 0x1C, 0x00, 0x00, 0xA5, 0x1C, 0x00, 0x00, 0xA5, 0x1C, 0x00, 0x00
	.byte 0xA5, 0x1C, 0x00, 0x00, 0xA5, 0x1C, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00

ov12_0226C2DC: ; 0x0226C2DC
	.byte 0x02, 0x03, 0x04, 0x05

ov12_0226C2E0: ; 0x0226C2E0
	.byte 0x02, 0x04, 0x06, 0x09, 0x0C, 0x10, 0x14, 0x19, 0x1E, 0x00, 0x00, 0x00
