#include "constants/sndseq.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"
	.public ov62_021E68CC

	.text

	thumb_func_start ov60_021E5900
ov60_021E5900: ; 0x021E5900
	push {r4, lr}
	ldr r1, _021E59B4 ; =0x00007FFF
	add r4, r0, #0
	mov r0, #0
	bl sub_0200FBF4
	ldr r1, _021E59B4 ; =0x00007FFF
	mov r0, #1
	bl sub_0200FBF4
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	add r1, r0, #0
	bl Main_SetHBlankIntrCB
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E59B8 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E59BC ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	mov r2, #5
	mov r0, #3
	mov r1, #0x1e
	lsl r2, r2, #0x10
	bl CreateHeap
	mov r1, #0xbe
	add r0, r4, #0
	lsl r1, r1, #2
	mov r2, #0x1e
	bl OverlayManager_CreateAndGetData
	mov r2, #0xbe
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	mov r1, #0x2e
	mov r0, #0x1e
	lsl r1, r1, #4
	str r0, [r4]
	mov r2, #0
	add r0, r1, #0
	strh r2, [r4, r1]
	add r0, #0x10
	str r2, [r4, r0]
	add r0, r1, #0
	add r0, #0x14
	str r2, [r4, r0]
	sub r1, #0x10
	str r2, [r4, r1]
	bl ov60_021E5D7C
	add r0, r4, #0
	bl ov60_021E6074
	add r0, r4, #0
	bl ov60_021E5D9C
	ldr r0, _021E59C0 ; =ov60_021E5D44
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	bl GX_BothDispOn
	ldr r0, _021E59C4 ; =gGameVersion
	ldrb r1, [r0]
	mov r0, #0xb3
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
	nop
_021E59B4: .word 0x00007FFF
_021E59B8: .word 0xFFFFE0FF
_021E59BC: .word 0x04001000
_021E59C0: .word ov60_021E5D44
_021E59C4: .word gGameVersion
	thumb_func_end ov60_021E5900

	thumb_func_start ov60_021E59C8
ov60_021E59C8: ; 0x021E59C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [r5]
	cmp r0, #6
	bhi _021E5A04
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E59E6: ; jump table
	.short _021E59F4 - _021E59E6 - 2 ; case 0
	.short _021E5A20 - _021E59E6 - 2 ; case 1
	.short _021E5A38 - _021E59E6 - 2 ; case 2
	.short _021E5B62 - _021E59E6 - 2 ; case 3
	.short _021E5BD0 - _021E59E6 - 2 ; case 4
	.short _021E5C1C - _021E59E6 - 2 ; case 5
	.short _021E5C68 - _021E59E6 - 2 ; case 6
_021E59F4:
	add r0, r4, #0
	ldr r1, [r4, #4]
	ldr r2, [r4]
	add r0, #0xcc
	bl ov60_021E6244
	cmp r0, #1
	beq _021E5A06
_021E5A04:
	b _021E5C8E
_021E5A06:
	add r0, r4, #0
	mov r2, #0
	add r0, #0xcc
	str r2, [r0]
	mov r0, #0xb9
	mov r1, #0x1e
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, _021E5C94 ; =gSystem
	str r2, [r0, #0x70]
	mov r0, #1
	str r0, [r5]
	b _021E5C8E
_021E5A20:
	mov r0, #0
	bl sub_02004AD8
	mov r0, #1
	mov r1, #SEQ_GS_POKEMON_THEME>>4
	lsl r1, r1, #4
	add r2, r0, #0
	bl sub_02004EC4
	mov r0, #2
	str r0, [r5]
	b _021E5C8E
_021E5A38:
	mov r0, #0xb9
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _021E5A5A
	sub r1, r1, #1
	str r1, [r4, r0]
	mov r1, #0
	sub r0, #0x70
	str r1, [r4, r0]
	add r0, r4, #0
	ldr r1, [r4, #4]
	ldr r2, [r4]
	add r0, #0xcc
	bl ov60_021E641C
	b _021E5C8E
_021E5A5A:
	mov r1, #1
	sub r0, #0x70
	str r1, [r4, r0]
	add r0, r4, #0
	ldr r1, [r4, #4]
	ldr r2, [r4]
	add r0, #0xcc
	bl ov60_021E641C
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	mov r2, #1
	add r1, r1, #1
	str r1, [r4, r0]
	ldr r1, _021E5C94 ; =gSystem
	ldr r3, [r1, #0x48]
	add r6, r3, #0
	and r6, r2
	cmp r6, #1
	beq _021E5A94
	mov r7, #8
	and r3, r7
	cmp r3, #8
	beq _021E5A94
	ldr r3, _021E5C98 ; =gSystem + 0x40
	ldrh r3, [r3, #0x24]
	cmp r3, #0
	beq _021E5AD2
_021E5A94:
	mov r0, #0x2e
	mov r1, #1
	lsl r0, r0, #4
	strh r1, [r4, r0]
	mov r0, #0
	mov r1, #0x3c
	bl GF_SndStartFadeOutBGM
#ifdef HEARTGOLD
	mov r0, #SPECIES_HO_OH
#else
	mov r0, #SPECIES_LUGIA
#endif
	mov r1, #0
	bl PlayCry
	mov r0, #1
	mov r1, #0x30
	bl GF_SetVolumeBySeqNo
	mov r0, #5
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x1e
	str r0, [sp, #8]
	mov r0, #0
	ldr r3, _021E5C9C ; =0x00007FFF
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #3
	str r0, [r5]
	b _021E5C8E
_021E5AD2:
	ldr r3, [r1, #0x44]
	mov r6, #0x46
	and r6, r3
	cmp r6, #0x46
	bne _021E5AFE
	mov r1, #2
	sub r0, #0x10
	strh r1, [r4, r0]
	mov r0, #6
	str r0, [sp]
	str r2, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #6
	str r0, [r5]
	b _021E5C8E
_021E5AFE:
	mov r6, #0x32
	lsl r6, r6, #6
	and r3, r6
	cmp r3, r6
	bne _021E5B2A
	mov r1, #5
	sub r0, #0x10
	strh r1, [r4, r0]
	mov r0, #6
	str r0, [sp]
	str r2, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #6
	str r0, [r5]
	b _021E5C8E
_021E5B2A:
	ldr r6, [r4, r0]
	ldr r3, _021E5CA0 ; =0x00000924
	cmp r6, r3
	ble _021E5B50
	mov r3, #3
	sub r0, #0x10
	strh r3, [r4, r0]
	str r2, [r1, #0x70]
	add r0, r7, #0
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0
	mov r1, #0x3c
	bl GF_SndStartFadeOutBGM
	mov r0, #5
	str r0, [r5]
	b _021E5C8E
_021E5B50:
	add r0, r4, #0
	add r0, #0xcc
	bl ov60_021E69D4
	add r4, #0xcc
	add r0, r4, #0
	bl ov60_021E6B08
	b _021E5C8E
_021E5B62:
	add r0, r4, #0
	add r0, #0xcc
	bl ov60_021E6B08
	mov r0, #0x9d
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	ldr r1, [r4, #4]
	ldr r2, [r4]
	add r0, #0xcc
	bl ov60_021E641C
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5BA0
	mov r0, #0xc
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x1e
	str r0, [sp, #8]
	ldr r3, _021E5C9C ; =0x00007FFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	mov r0, #4
	str r0, [r5]
_021E5BA0:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _021E5C8E
	mov r0, #0x3f
	lsl r0, r0, #4
	mov r1, #0
	bl StopBGM
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #6
	str r0, [r5]
	b _021E5C8E
_021E5BD0:
	add r0, r4, #0
	add r0, #0xcc
	bl ov60_021E6B08
	mov r0, #0x9d
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	ldr r1, [r4, #4]
	ldr r2, [r4]
	add r0, #0xcc
	bl ov60_021E641C
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _021E5C8E
	mov r0, #0x3f
	lsl r0, r0, #4
	mov r1, #0
	bl StopBGM
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #6
	str r0, [r5]
	b _021E5C8E
_021E5C1C:
	add r0, r4, #0
	add r0, #0xcc
	bl ov60_021E6B08
	mov r0, #0x9d
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	ldr r1, [r4, #4]
	ldr r2, [r4]
	add r0, #0xcc
	bl ov60_021E641C
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _021E5C8E
	mov r0, #0x3f
	lsl r0, r0, #4
	mov r1, #0
	bl StopBGM
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #6
	str r0, [r5]
	b _021E5C8E
_021E5C68:
	add r0, r4, #0
	add r0, #0xcc
	bl ov60_021E6B08
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021E5C8E
	add r0, r4, #0
	ldr r1, [r4, #4]
	ldr r2, [r4]
	add r0, #0xcc
	bl ov60_021E6544
	cmp r0, #1
	bne _021E5C8E
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E5C8E:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E5C94: .word gSystem
_021E5C98: .word gSystem + 0x40
_021E5C9C: .word 0x00007FFF
_021E5CA0: .word 0x00000924
	thumb_func_end ov60_021E59C8

	.public _02108278
	.public _0210820C

	thumb_func_start ov60_021E5CA4
ov60_021E5CA4: ; 0x021E5CA4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl OverlayManager_GetData
	add r6, r0, #0
	mov r0, #0x2e
	lsl r0, r0, #4
	ldrh r4, [r6, r0]
	mov r0, #0
	add r1, r0, #0
	ldr r5, [r6]
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	bl ov60_021E5DCC
	add r0, r6, #0
	bl ov60_021E61C8
	add r0, r7, #0
	bl OverlayManager_FreeData
	add r0, r5, #0
	bl DestroyHeap
	cmp r4, #5
	bhi _021E5CF2
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E5CE6: ; jump table
	.short _021E5CF2 - _021E5CE6 - 2 ; case 0
	.short _021E5CF2 - _021E5CE6 - 2 ; case 1
	.short _021E5CFE - _021E5CE6 - 2 ; case 2
	.short _021E5D0A - _021E5CE6 - 2 ; case 3
	.short _021E5CF2 - _021E5CE6 - 2 ; case 4
	.short _021E5D1A - _021E5CE6 - 2 ; case 5
_021E5CF2:
	mov r0, #0
	ldr r1, _021E5D2C ; =_02108278
	mvn r0, r0
	bl RegisterMainOverlay
	b _021E5D28
_021E5CFE:
	mov r0, #0
	ldr r1, _021E5D30 ; =_0210820C
	mvn r0, r0
	bl RegisterMainOverlay
	b _021E5D28
_021E5D0A:
	mov r0, #0
	bl sub_02004AD8
	ldr r0, _021E5D34 ; =FS_OVERLAY_ID(OVY_60)
	ldr r1, _021E5D38 ; =ov60_021EB030
	bl RegisterMainOverlay
	b _021E5D28
_021E5D1A:
	mov r0, #0
	bl sub_02004AD8
	ldr r0, _021E5D3C ; =FS_OVERLAY_ID(OVY_62)
	ldr r1, _021E5D40 ; =ov62_021E68CC
	bl RegisterMainOverlay
_021E5D28:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E5D2C: .word _02108278
_021E5D30: .word _0210820C
_021E5D34: .word FS_OVERLAY_ID(OVY_60)
_021E5D38: .word ov60_021EB030
_021E5D3C: .word FS_OVERLAY_ID(OVY_62)
_021E5D40: .word ov62_021E68CC
	thumb_func_end ov60_021E5CA4

	thumb_func_start ov60_021E5D44
ov60_021E5D44: ; 0x021E5D44
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5D66
	mov r0, #0
	bl SetMasterBrightnessNeutral
	mov r0, #1
	bl SetMasterBrightnessNeutral
	mov r0, #0xbd
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_021E5D66:
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5D74
	bl sub_0200398C
_021E5D74:
	ldr r0, [r4, #4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	pop {r4, pc}
	thumb_func_end ov60_021E5D44

	thumb_func_start ov60_021E5D7C
ov60_021E5D7C: ; 0x021E5D7C
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E5D98 ; =_021EAF18
	add r3, sp, #0
	mov r2, #5
_021E5D86:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5D86
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E5D98: .word _021EAF18
	thumb_func_end ov60_021E5D7C

	thumb_func_start ov60_021E5D9C
ov60_021E5D9C: ; 0x021E5D9C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #4
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	mov r2, #1
	add r3, r1, #0
	bl GF_3DVramMan_Create
	str r0, [r4, #8]
	ldr r1, _021E5DC8 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	strh r0, [r1]
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021E5DC8: .word 0x04000008
	thumb_func_end ov60_021E5D9C

	thumb_func_start ov60_021E5DCC
ov60_021E5DCC: ; 0x021E5DCC
	ldr r3, _021E5DD4 ; =GF_3DVramMan_Delete
	ldr r0, [r0, #8]
	bx r3
	nop
_021E5DD4: .word GF_3DVramMan_Delete
	thumb_func_end ov60_021E5DCC

	thumb_func_start ov60_021E5DD8
ov60_021E5DD8: ; 0x021E5DD8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r1, #0
	add r5, r0, #0
	mov r1, #0
	add r7, r2, #0
	ldr r4, [sp, #0x30]
	str r3, [sp]
	add r2, r5, #0
	add r0, r1, #0
_021E5DEC:
	str r0, [r2, #0x70]
	str r0, [r2, #0x60]
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #4
	blt _021E5DEC
	add r0, r5, #0
	add r0, #0x80
	add r1, r4, #0
	mov r2, #4
	bl GF_ExpHeap_FndInitAllocator
	mov r0, #0x2e
	add r1, r6, #0
	add r2, r4, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	add r1, r5, #0
	add r2, r5, #0
	str r0, [r5, #0x5c]
	add r0, r5, #4
	add r1, #0x58
	add r2, #0x5c
	bl sub_0201F51C
	ldr r0, [r5, #0x5c]
	bl NNS_G3dGetTex
	add r6, r0, #0
	cmp r7, #0
	ble _021E5E5E
	mov r0, #0x2e
	add r1, r7, #0
	add r2, r4, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	str r0, [r5, #0x60]
	mov r1, #0
	bl NNS_G3dGetAnmByIdx
	add r7, r0, #0
	add r0, r5, #0
	ldr r2, [r5, #0x58]
	add r0, #0x80
	add r1, r7, #0
	bl NNS_G3dAllocAnmObj
	str r0, [r5, #0x70]
	ldr r2, [r5, #0x58]
	add r1, r7, #0
	add r3, r6, #0
	bl NNS_G3dAnmObjInit
	ldr r1, [r5, #0x70]
	add r0, r5, #4
	bl NNS_G3dRenderObjAddAnmObj
_021E5E5E:
	ldr r0, [sp]
	cmp r0, #0
	ble _021E5E98
	ldr r1, [sp]
	mov r0, #0x2e
	add r2, r4, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	str r0, [r5, #0x64]
	mov r1, #0
	bl NNS_G3dGetAnmByIdx
	add r7, r0, #0
	add r0, r5, #0
	ldr r2, [r5, #0x58]
	add r0, #0x80
	add r1, r7, #0
	bl NNS_G3dAllocAnmObj
	str r0, [r5, #0x74]
	ldr r2, [r5, #0x58]
	add r1, r7, #0
	add r3, r6, #0
	bl NNS_G3dAnmObjInit
	ldr r1, [r5, #0x74]
	add r0, r5, #4
	bl NNS_G3dRenderObjAddAnmObj
_021E5E98:
	ldr r1, [sp, #0x28]
	cmp r1, #0
	ble _021E5ED0
	mov r0, #0x2e
	add r2, r4, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	str r0, [r5, #0x68]
	mov r1, #0
	bl NNS_G3dGetAnmByIdx
	add r7, r0, #0
	add r0, r5, #0
	ldr r2, [r5, #0x58]
	add r0, #0x80
	add r1, r7, #0
	bl NNS_G3dAllocAnmObj
	str r0, [r5, #0x78]
	ldr r2, [r5, #0x58]
	add r1, r7, #0
	add r3, r6, #0
	bl NNS_G3dAnmObjInit
	ldr r1, [r5, #0x78]
	add r0, r5, #4
	bl NNS_G3dRenderObjAddAnmObj
_021E5ED0:
	ldr r1, [sp, #0x2c]
	cmp r1, #0
	ble _021E5F08
	mov r0, #0x2e
	add r2, r4, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	str r0, [r5, #0x6c]
	mov r1, #0
	bl NNS_G3dGetAnmByIdx
	add r4, r0, #0
	add r0, r5, #0
	ldr r2, [r5, #0x58]
	add r0, #0x80
	add r1, r4, #0
	bl NNS_G3dAllocAnmObj
	str r0, [r5, #0x7c]
	ldr r2, [r5, #0x58]
	add r1, r4, #0
	add r3, r6, #0
	bl NNS_G3dAnmObjInit
	ldr r1, [r5, #0x7c]
	add r0, r5, #4
	bl NNS_G3dRenderObjAddAnmObj
_021E5F08:
	ldr r6, _021E5F44 ; =_021EAE30
	add r3, sp, #4
	mov r2, #0
	str r2, [r3]
	str r2, [r3, #4]
	add r4, r5, #0
	ldmia r6!, {r0, r1}
	str r2, [r3, #8]
	add r4, #0x90
	stmia r4!, {r0, r1}
	ldr r0, [r6]
	ldr r6, _021E5F48 ; =_021EAE24
	str r0, [r4]
	add r4, r5, #0
	ldmia r6!, {r0, r1}
	add r4, #0x9c
	stmia r4!, {r0, r1}
	ldr r0, [r6]
	str r0, [r4]
	add r4, r5, #0
	ldmia r3!, {r0, r1}
	add r4, #0xa8
	stmia r4!, {r0, r1}
	ldr r0, [r3]
	add r5, #0xb8
	str r0, [r4]
	str r2, [r5]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5F44: .word _021EAE30
_021E5F48: .word _021EAE24
	thumb_func_end ov60_021E5DD8

	thumb_func_start ov60_021E5F4C
ov60_021E5F4C: ; 0x021E5F4C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r7, #0
	mov r4, #0
	add r5, r7, #0
	add r6, #0x80
_021E5F58:
	ldr r1, [r5, #0x70]
	cmp r1, #0
	beq _021E5F6A
	add r0, r6, #0
	bl NNS_G3dFreeAnmObj
	ldr r0, [r5, #0x60]
	bl FreeToHeap
_021E5F6A:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E5F58
	ldr r0, [r7, #0x5c]
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov60_021E5F4C

	thumb_func_start ov60_021E5F7C
ov60_021E5F7C: ; 0x021E5F7C
	push {r3, r4, r5, r6}
	cmp r1, #0
	bne _021E5F9A
	mov r3, #0
	add r1, r3, #0
_021E5F86:
	ldr r2, [r0]
	cmp r2, #0
	beq _021E5F8E
	str r1, [r2]
_021E5F8E:
	add r3, r3, #1
	add r0, r0, #4
	cmp r3, #4
	blt _021E5F86
	pop {r3, r4, r5, r6}
	bx lr
_021E5F9A:
	mov r4, #0
	add r5, r4, #0
_021E5F9E:
	ldr r3, [r0]
	cmp r3, #0
	beq _021E5FBA
	ldr r2, [r3]
	add r2, r2, r1
	str r2, [r3]
	ldr r3, [r0]
	ldr r6, [r3, #8]
	ldr r2, [r3]
	ldrh r6, [r6, #4]
	lsl r6, r6, #0xc
	cmp r2, r6
	bne _021E5FBA
	str r5, [r3]
_021E5FBA:
	add r4, r4, #1
	add r0, r0, #4
	cmp r4, #4
	blt _021E5F9E
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end ov60_021E5F7C

	thumb_func_start ov60_021E5FC8
ov60_021E5FC8: ; 0x021E5FC8
	push {r4, r5, lr}
	sub sp, #0x24
	ldr r5, _021E6070 ; =_021EAEF4
	add r4, r0, #0
	add r3, sp, #0
	mov r2, #4
_021E5FD4:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E5FD4
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [r4]
	cmp r0, #0
	beq _021E606A
	cmp r0, #1
	beq _021E5FF2
	cmp r0, #2
	beq _021E6006
	add sp, #0x24
	pop {r4, r5, pc}
_021E5FF2:
	bl sub_02026E48
	mov r0, #0
	mov r1, #1
	bl sub_02026E50
	mov r0, #0
	add sp, #0x24
	str r0, [r4]
	pop {r4, r5, pc}
_021E6006:
	bl sub_02026E48
	bl sub_02023154
	add r1, r4, #0
	add r0, sp, #0
	add r1, #0xa8
	bl sub_02020D2C
	add r1, r4, #0
	add r3, r4, #0
	add r0, r4, #4
	add r1, #0x90
	add r2, sp, #0
	add r3, #0x9c
	bl Draw3dModel
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	cmp r0, #0
	beq _021E603E
	cmp r0, #1
	beq _021E604C
	cmp r0, #2
	beq _021E605E
	add sp, #0x24
	pop {r4, r5, pc}
_021E603E:
	add r4, #0x70
	add r0, r4, #0
	mov r1, #0
	bl ov60_021E5F7C
	add sp, #0x24
	pop {r4, r5, pc}
_021E604C:
	ldr r0, [r4, #0x70]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E605E
	mov r0, #0
	add r4, #0xb8
	add sp, #0x24
	str r0, [r4]
	pop {r4, r5, pc}
_021E605E:
	add r4, #0x70
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl ov60_021E5F7C
_021E606A:
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_021E6070: .word _021EAEF4
	thumb_func_end ov60_021E5FC8

	thumb_func_start ov60_021E6074
ov60_021E6074: ; 0x021E6074
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	add r4, r0, #0
	ldr r0, [r4]
	bl BgConfig_Alloc
	add r3, sp, #0xa8
	ldr r5, _021E61AC ; =_021EAE3C
	str r0, [r4, #4]
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E61B0 ; =_021EAEA0
	add r3, sp, #0x8c
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
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _021E61B4 ; =_021EAEBC
	add r3, sp, #0x70
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
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _021E61B8 ; =_021EAE4C
	add r3, sp, #0x54
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
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _021E61BC ; =_021EAE68
	add r3, sp, #0x38
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
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _021E61C0 ; =_021EAE84
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [r4, #4]
	mov r1, #2
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _021E61C4 ; =_021EAED8
	add r3, sp, #0
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
	ldr r0, [r4, #4]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
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
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	nop
_021E61AC: .word _021EAE3C
_021E61B0: .word _021EAEA0
_021E61B4: .word _021EAEBC
_021E61B8: .word _021EAE4C
_021E61BC: .word _021EAE68
_021E61C0: .word _021EAE84
_021E61C4: .word _021EAED8
	thumb_func_end ov60_021E6074

	thumb_func_start ov60_021E61C8
ov60_021E61C8: ; 0x021E61C8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
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
	ldr r0, [r4, #4]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	mov r1, #7
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #4]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov60_021E61C8

	thumb_func_start ov60_021E6244
ov60_021E6244: ; 0x021E6244
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl ov60_021E68B0
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	bl ov60_021E65B4
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	cmp r0, #7
	bne _021E6294
	mov r0, #0x1d
	str r0, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	add r0, r5, #4
	mov r1, #0x19
	mov r2, #0x1a
	mov r3, #0x1b
	str r4, [sp, #8]
	bl ov60_021E5DD8
	mov r3, #0x28
	str r3, [sp]
	sub r3, #0x29
	add r0, r5, #0
	str r3, [sp, #4]
	add r0, #0xc0
	mov r1, #0x26
	mov r2, #0x27
	str r4, [sp, #8]
	bl ov60_021E5DD8
	b _021E62C0
_021E6294:
	mov r0, #0x17
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #4
	mov r1, #0x14
	mov r2, #0x15
	mov r3, #0x16
	str r4, [sp, #8]
	bl ov60_021E5DD8
	mov r3, #0x2b
	str r3, [sp]
	sub r3, #0x2c
	add r0, r5, #0
	str r3, [sp, #4]
	add r0, #0xc0
	mov r1, #0x29
	mov r2, #0x2a
	str r4, [sp, #8]
	bl ov60_021E5DD8
_021E62C0:
	ldr r0, _021E6408 ; =0x04000060
	ldr r2, _021E640C ; =0xFFFFCFFF
	ldrh r1, [r0]
	add r3, r1, #0
	and r3, r2
	mov r1, #0x10
	orr r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	and r2, r1
	mov r1, #8
	orr r1, r2
	strh r1, [r0]
	mov r0, #0x71
	lsl r0, r0, #2
	add r1, r0, #0
	ldr r2, [r5, r0]
	sub r1, #0x34
	str r2, [r5, r1]
	add r1, r0, #4
	ldr r2, [r5, r1]
	add r1, r0, #0
	sub r1, #0x30
	str r2, [r5, r1]
	add r1, r0, #0
	add r1, #8
	ldr r2, [r5, r1]
	add r1, r0, #0
	sub r1, #0x2c
	str r2, [r5, r1]
	add r1, r0, #0
	sub r1, #0x18
	ldr r2, [r5, r1]
	add r1, r0, #0
	sub r1, #0x28
	str r2, [r5, r1]
	add r1, r0, #0
	sub r1, #0x14
	ldr r2, [r5, r1]
	add r1, r0, #0
	sub r1, #0x24
	str r2, [r5, r1]
	add r1, r0, #0
	sub r1, #0x10
	ldr r1, [r5, r1]
	sub r0, #0x20
	str r1, [r5, r0]
	add r0, r4, #0
	bl GF_Camera_Create
	add r1, r5, #0
	add r1, #0xb8
	str r0, [r1]
	mov r3, #0
	add r0, r5, #0
	mov r1, #0x19
	mov r2, #0xb6
	str r3, [sp]
	add r0, #0xb8
	ldr r0, [r0]
	lsl r1, r1, #4
	str r0, [sp, #4]
	add r0, r5, r1
	add r1, #0xc
	add r1, r5, r1
	lsl r2, r2, #4
	bl sub_02023308
	add r2, r5, #0
	add r2, #0xb8
	mov r1, #2
	ldr r2, [r2]
	mov r0, #0
	lsl r1, r1, #0xa
	bl GF_Camera_SetClipBounds
	add r1, r5, #0
	add r1, #0xb8
	ldr r1, [r1]
	mov r0, #0
	bl sub_020233D8
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl GF_Camera_RegisterToStaticPtr
	mov r3, #0x77
	lsl r3, r3, #2
	add r2, r3, #2
	ldrsh r1, [r5, r3]
	add r3, r3, #4
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	mov r0, #0
	bl NNS_G3dGlbLightVector
	ldr r1, _021E6410 ; =0x00007FFF
	mov r0, #0
	bl NNS_G3dGlbLightColor
	ldr r3, _021E6414 ; =0x000001E2
	mov r0, #1
	add r2, r3, #2
	ldrsh r1, [r5, r3]
	add r3, r3, #4
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	bl NNS_G3dGlbLightVector
	ldr r1, _021E6410 ; =0x00007FFF
	mov r0, #1
	bl NNS_G3dGlbLightColor
	ldr r2, _021E6408 ; =0x04000060
	ldr r0, _021E640C ; =0xFFFFCFFF
	ldrh r1, [r2]
	and r1, r0
	mov r0, #0x10
	orr r0, r1
	strh r0, [r2]
	ldr r0, _021E6418 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r1, #2
	add r0, r5, #0
	str r1, [r5, #4]
	add r0, #0xc0
	str r1, [r0]
	mov r0, #0x7f
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	sub r0, r0, #4
	str r1, [r5, r0]
	mov r0, #0x1e
	bl sub_020030E8
	mov r1, #0x81
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #1
	lsl r2, r1, #9
	mov r3, #0x1e
	bl PaletteData_AllocBuffers
	mov r0, #0x81
	lsl r0, r0, #2
	mov r1, #1
	ldr r0, [r5, r0]
	mov r2, #0
	lsl r3, r1, #9
	bl sub_020032A4
	mov r0, #0x82
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E6408: .word 0x04000060
_021E640C: .word 0xFFFFCFFF
_021E6410: .word 0x00007FFF
_021E6414: .word 0x000001E2
_021E6418: .word gSystem + 0x60
	thumb_func_end ov60_021E6244

	thumb_func_start ov60_021E641C
ov60_021E641C: ; 0x021E641C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r4, #0
	cmp r0, #0
	beq _021E642E
	cmp r0, #1
	beq _021E64D2
	b _021E651A
_021E642E:
	add r1, r5, #0
	mov r0, #0x1d
	add r1, #0xb8
	lsl r0, r0, #4
	ldr r1, [r1]
	add r0, r5, r0
	bl sub_0202365C
	add r1, r5, #0
	mov r0, #0x6e
	add r1, #0xb8
	lsl r0, r0, #2
	ldr r1, [r1]
	add r0, r5, r0
	bl sub_0202366C
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl SetMasterBrightnessNeutral
	mov r0, #1
	bl SetMasterBrightnessNeutral
	add r0, r4, #0
	mov r1, #6
	mov r2, #1
	bl SetBlendBrightness
	add r0, r4, #0
	mov r1, #7
	mov r2, #2
	bl SetBlendBrightness
	mov r0, #0x1f
	str r0, [sp]
	ldr r0, _021E653C ; =0x04001050
	mov r1, #4
	mov r2, #0x39
	add r3, r4, #0
	bl G2x_SetBlendAlpha_
	add r0, r5, #0
	mov r1, #2
	add r0, #0xbc
	str r1, [r0]
	mov r0, #0x5e
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r1, _021E6540 ; =0x00007FFF
	mov r0, #1
	bl NNS_G3dGlbLightColor
	mov r0, #0x5f
	add r1, r4, #0
	lsl r0, r0, #2
	strh r1, [r5, r0]
	mov r0, #1
	str r0, [r5]
	b _021E651A
_021E64D2:
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #1
	bne _021E64FC
	sub r0, #0x2c
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _021E64EE
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	b _021E6504
_021E64EE:
	cmp r0, #0x1e
	bne _021E6504
	mov r0, #8
	add r1, r4, #0
	bl GX_EngineAToggleLayers
	b _021E6504
_021E64FC:
	mov r0, #8
	add r1, r4, #0
	bl GX_EngineAToggleLayers
_021E6504:
	mov r0, #0x5f
	lsl r0, r0, #2
	ldrh r1, [r5, r0]
	add r1, r1, #1
	strh r1, [r5, r0]
	ldrh r1, [r5, r0]
	cmp r1, #0x2d
	blo _021E6518
	mov r1, #0
	strh r1, [r5, r0]
_021E6518:
	mov r4, #1
_021E651A:
	add r0, r5, #4
	bl ov60_021E5FC8
	add r0, r5, #0
	add r0, #0xc0
	bl ov60_021E5FC8
	mov r0, #0
	mov r1, #1
	bl sub_02026E50
	add r0, r5, #0
	bl ov60_021E67E8
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021E653C: .word 0x04001050
_021E6540: .word 0x00007FFF
	thumb_func_end ov60_021E641C

	thumb_func_start ov60_021E6544
ov60_021E6544: ; 0x021E6544
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x81
	lsl r0, r0, #2
	add r4, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	add r6, r2, #0
	bl PaletteData_FreeBuffers
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02003104
	mov r0, #0x81
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl sub_02023120
	add r0, r5, #4
	bl ov60_021E5F4C
	add r0, r5, #0
	add r0, #0xc0
	bl ov60_021E5F4C
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ov60_021E68A0
	ldr r2, _021E65A8 ; =0x04000050
	mov r3, #0
	strh r3, [r2]
	add r2, #0x10
	ldrh r1, [r2]
	ldr r0, _021E65AC ; =0x0000CFDF
	and r0, r1
	strh r0, [r2]
	ldr r0, _021E65B0 ; =gSystem + 0x60
	strb r3, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E65A8: .word 0x04000050
_021E65AC: .word 0x0000CFDF
_021E65B0: .word gSystem + 0x60
	thumb_func_end ov60_021E6544

	thumb_func_start ov60_021E65B4
ov60_021E65B4: ; 0x021E65B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	mov r0, #2
	add r4, r2, #0
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	add r5, r1, #0
	cmp r0, #7
	bne _021E65F6
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x2e
	mov r1, #0x22
	add r2, r6, #0
	mov r3, #7
	str r5, [sp, #0xc]
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x2e
	mov r1, #0x23
	add r2, r6, #0
	mov r3, #7
	str r5, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	b _021E6622
_021E65F6:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x2e
	mov r1, #0x24
	add r2, r6, #0
	mov r3, #7
	str r5, [sp, #0xc]
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x2e
	mov r1, #0x25
	add r2, r6, #0
	mov r3, #7
	str r5, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
_021E6622:
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	add r3, r5, #0
	bl BG_ClearCharDataRange
	add r0, r6, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #7
	bne _021E6646
	mov r1, #4
	mov r7, #0xd
	b _021E664A
_021E6646:
	mov r1, #2
	mov r7, #0xe
_021E664A:
	mov r3, #0
	str r3, [sp]
	mov r0, #0x2e
	mov r2, #4
	str r5, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r2, #0
	str r2, [sp]
	mov r0, #0x2e
	add r1, r7, #0
	add r3, r2, #0
	str r5, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #7
	bne _021E6678
	mov r1, #3
	mov r7, #4
	b _021E667C
_021E6678:
	mov r1, #1
	mov r7, #2
_021E667C:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x2e
	add r2, r6, #0
	mov r3, #6
	str r5, [sp, #0xc]
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	mov r0, #0x2e
	add r1, r7, #0
	mov r2, #6
	lsl r3, r3, #0xe
	str r5, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x2e
	add r2, r6, #0
	mov r3, #6
	str r5, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x2e
	mov r1, #0xf
	add r2, r6, #0
	mov r3, #5
	str r5, [sp, #0xc]
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x2e
	mov r1, #0x11
	add r2, r6, #0
	mov r3, #5
	str r5, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	mov r0, #5
	mov r1, #0
	bl BG_SetMaskColor
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	add r3, r5, #0
	bl BG_ClearCharDataRange
	ldr r2, _021E67D0 ; =0x000002CF
	mov r0, #1
	mov r1, #0x1b
	add r3, r5, #0
	bl NewMsgDataFromNarc
	add r7, r0, #0
	mov r0, #0x40
	add r1, r5, #0
	bl String_ctor
	mov r1, #6
	lsl r1, r1, #6
	add r5, r0, #0
	ldr r2, _021E67D4 ; =_021EAE1C
	add r0, r6, #0
	add r1, r4, r1
	bl AddWindow
	mov r1, #1
	lsl r1, r1, #8
	str r1, [sp]
	mov r0, #0x10
	add r1, #0x80
	str r0, [sp, #4]
	add r0, r4, r1
	mov r1, #0
	add r2, r1, #0
	add r3, r1, #0
	bl FillWindowPixelRect
	add r0, r7, #0
	mov r1, #0
	add r2, r5, #0
	bl ReadMsgDataIntoString
	mov r0, #0
	add r1, r5, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r0, #2
	lsl r0, r0, #8
	ldr r1, [r4, r0]
	cmp r1, #7
	bne _021E677C
	mov r1, #0
	str r1, [sp]
	ldr r2, _021E67D8 ; =0x00010100
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r2, #1
	str r2, [sp, #0xc]
	sub r0, #0x80
	str r1, [sp, #0x10]
	add r0, r4, r0
	add r2, r5, #0
	add r3, r1, #0
	str r1, [sp, #0x14]
	bl AddTextPrinterParameterized3
	b _021E679A
_021E677C:
	mov r1, #0
	str r1, [sp]
	ldr r2, _021E67DC ; =0x00020200
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r2, #1
	str r2, [sp, #0xc]
	sub r0, #0x80
	str r1, [sp, #0x10]
	add r0, r4, r0
	add r2, r5, #0
	add r3, r1, #0
	str r1, [sp, #0x14]
	bl AddTextPrinterParameterized3
_021E679A:
	add r0, r5, #0
	bl String_dtor
	add r0, r7, #0
	bl DestroyMsgData
	ldr r1, _021E67E0 ; =0x0000011B
	add r0, sp, #0x18
	strh r1, [r0, #2]
	ldr r1, _021E67E4 ; =0x00007F80
	mov r2, #2
	strh r1, [r0]
	add r1, sp, #0x18
	mov r0, #3
	add r1, #2
	mov r3, #0x42
	bl BG_LoadPlttData
	mov r0, #3
	add r1, sp, #0x18
	mov r2, #2
	mov r3, #0x44
	bl BG_LoadPlttData
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021E67D0: .word 0x000002CF
_021E67D4: .word _021EAE1C
_021E67D8: .word 0x00010100
_021E67DC: .word 0x00020200
_021E67E0: .word 0x0000011B
_021E67E4: .word 0x00007F80
	thumb_func_end ov60_021E65B4

	thumb_func_start ov60_021E67E8
ov60_021E67E8: ; 0x021E67E8
	push {r3, lr}
	sub sp, #8
	mov r1, #0x82
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	cmp r2, #3
	bhi _021E687A
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021E6802: ; jump table
	.short _021E680A - _021E6802 - 2 ; case 0
	.short _021E681A - _021E6802 - 2 ; case 1
	.short _021E683E - _021E6802 - 2 ; case 2
	.short _021E6862 - _021E6802 - 2 ; case 3
_021E680A:
	mov r2, #1
	str r2, [r0, r1]
	add r2, r1, #4
	mov r3, #0
	str r3, [r0, r2]
	add r1, #8
	str r3, [r0, r1]
	b _021E687A
_021E681A:
	add r2, r1, #0
	add r2, #8
	ldr r2, [r0, r2]
	add r3, r2, #1
	add r2, r1, #0
	add r2, #8
	str r3, [r0, r2]
	add r2, r1, #0
	add r2, #8
	ldr r2, [r0, r2]
	cmp r2, #0x3c
	ble _021E687A
	mov r3, #0
	add r2, r1, #4
	str r3, [r0, r2]
	mov r2, #2
	str r2, [r0, r1]
	b _021E687A
_021E683E:
	add r2, r1, #0
	add r2, #8
	ldr r2, [r0, r2]
	sub r3, r2, #1
	add r2, r1, #0
	add r2, #8
	str r3, [r0, r2]
	add r2, r1, #0
	add r2, #8
	ldr r2, [r0, r2]
	cmp r2, #0
	bne _021E687A
	mov r2, #3
	str r2, [r0, r1]
	mov r2, #0
	add r1, r1, #4
	str r2, [r0, r1]
	b _021E687A
_021E6862:
	add r2, r1, #4
	ldr r2, [r0, r2]
	add r3, r2, #1
	add r2, r1, #4
	str r3, [r0, r2]
	ldr r2, [r0, r2]
	cmp r2, #0x14
	ble _021E687A
	mov r2, #0
	str r2, [r0, r1]
	add r1, r1, #4
	str r2, [r0, r1]
_021E687A:
	mov r1, #0x21
	lsl r1, r1, #4
	ldr r2, [r0, r1]
	sub r1, #0xc
	str r2, [sp]
	ldr r2, _021E689C ; =0x0000318C
	mov r3, #0xa0
	str r2, [sp, #4]
	ldr r0, [r0, r1]
	mov r2, #0xff
	mov r1, #2
	lsl r2, r2, #8
	bl sub_020040AC
	add sp, #8
	pop {r3, pc}
	nop
_021E689C: .word 0x0000318C
	thumb_func_end ov60_021E67E8

	thumb_func_start ov60_021E68A0
ov60_021E68A0: ; 0x021E68A0
	mov r0, #6
	lsl r0, r0, #6
	ldr r3, _021E68AC ; =RemoveWindow
	add r0, r2, r0
	bx r3
	nop
_021E68AC: .word RemoveWindow
	thumb_func_end ov60_021E68A0

	thumb_func_start ov60_021E68B0
ov60_021E68B0: ; 0x021E68B0
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #2
	lsl r0, r0, #8
	ldr r1, [r4, r0]
	cmp r1, #7
	bne _021E68F2
	add r2, r0, #0
	mov r1, #0
	sub r2, #0x54
	str r1, [r4, r2]
	mov r3, #0x41
	add r2, r0, #0
	lsl r3, r3, #0xc
	sub r2, #0x50
	str r3, [r4, r2]
	mov r3, #0x12
	add r2, r0, #0
	lsl r3, r3, #0xe
	sub r2, #0x4c
	str r3, [r4, r2]
	add r2, r0, #0
	ldr r3, _021E69B4 ; =0x00271000
	sub r2, #0x48
	str r3, [r4, r2]
	mov r3, #0x26
	add r2, r0, #0
	lsl r3, r3, #0xe
	sub r2, #0x44
	str r3, [r4, r2]
	lsl r3, r0, #0xb
	b _021E6924
_021E68F2:
	add r2, r0, #0
	mov r1, #0
	sub r2, #0x54
	str r1, [r4, r2]
	mov r3, #0x41
	add r2, r0, #0
	lsl r3, r3, #0xc
	sub r2, #0x50
	str r3, [r4, r2]
	mov r3, #0x12
	add r2, r0, #0
	lsl r3, r3, #0xe
	sub r2, #0x4c
	str r3, [r4, r2]
	mov r3, #0x69
	add r2, r0, #0
	lsl r3, r3, #0xe
	sub r2, #0x48
	str r3, [r4, r2]
	mov r3, #0x57
	add r2, r0, #0
	lsl r3, r3, #0xc
	sub r2, #0x44
	str r3, [r4, r2]
	ldr r3, _021E69B8 ; =0x0014B000
_021E6924:
	add r2, r0, #0
	sub r2, #0x40
	str r3, [r4, r2]
	add r2, r0, #0
	sub r2, #0x3c
	str r1, [r4, r2]
	mov r3, #0x5a
	add r2, r0, #0
	lsl r3, r3, #0xc
	sub r2, #0x38
	str r3, [r4, r2]
	add r2, r0, #0
	sub r2, #0x34
	str r1, [r4, r2]
	add r2, r0, #0
	ldr r3, _021E69BC ; =0xFFFFE000
	sub r2, #0x30
	str r3, [r4, r2]
	mov r3, #0x1f
	add r2, r0, #0
	lsl r3, r3, #0xe
	sub r2, #0x2c
	str r3, [r4, r2]
	add r2, r0, #0
	ldr r3, _021E69C0 ; =0xFFFDA000
	sub r2, #0x28
	str r3, [r4, r2]
	add r2, r0, #0
	sub r2, #0x24
	strh r1, [r4, r2]
	add r2, r0, #0
	ldr r3, _021E69C4 ; =0x00000A2B
	sub r2, #0x22
	strh r3, [r4, r2]
	add r2, r0, #0
	sub r2, #0x20
	strh r1, [r4, r2]
	add r2, r0, #0
	sub r2, #0x1e
	strh r1, [r4, r2]
	add r2, r0, #0
	ldr r3, _021E69C8 ; =0x000007A1
	sub r2, #0x1c
	strh r3, [r4, r2]
	add r2, r0, #0
	sub r2, #0x1a
	strh r1, [r4, r2]
	mov r1, #3
	lsl r1, r1, #0xc
	sub r0, #0x14
	str r1, [r4, r0]
	mov r1, #0
	ldr r0, _021E69C4 ; =0x00000A2B
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	add r0, sp, #0xc
	add r1, sp, #0
	bl VEC_Normalize
	mov r0, #0x77
	ldr r1, [sp]
	lsl r0, r0, #2
	strh r1, [r4, r0]
	add r1, r0, #2
	ldr r2, [sp, #4]
	add r0, r0, #4
	strh r2, [r4, r1]
	ldr r1, [sp, #8]
	strh r1, [r4, r0]
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_021E69B4: .word 0x00271000
_021E69B8: .word 0x0014B000
_021E69BC: .word 0xFFFFE000
_021E69C0: .word 0xFFFDA000
_021E69C4: .word 0x00000A2B
_021E69C8: .word 0x000007A1
	thumb_func_end ov60_021E68B0

	thumb_func_start ov60_021E69CC
ov60_021E69CC: ; 0x021E69CC
	cmp r0, #0
	bge _021E69D2
	neg r0, r0
_021E69D2:
	bx lr
	thumb_func_end ov60_021E69CC

	thumb_func_start ov60_021E69D4
ov60_021E69D4: ; 0x021E69D4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #2
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	cmp r0, #7
	bne _021E69E8
	ldr r4, _021E6AFC ; =_021EAF40
	b _021E69EA
_021E69E8:
	ldr r4, _021E6B00 ; =_021EAF90
_021E69EA:
	mov r2, #0x7d
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	mov r3, #0x1e
	add r0, r0, #1
	str r0, [r5, r2]
	sub r0, r2, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r2]
	lsl r0, r0, #4
	add r0, r4, r0
	ldr r6, [r0, #0xc]
	mul r3, r6
	cmp r1, r3
	ble _021E6AF6
	sub r2, #0x3c
	add r1, r5, r2
	add r2, sp, #0
	bl VEC_Subtract
	mov r0, #1
	ldr r1, [sp]
	lsl r0, r0, #0xc
	cmp r1, r0
	ble _021E6A2A
	mov r1, #0x6e
	lsl r1, r1, #2
	mov r0, #5
	ldr r2, [r5, r1]
	lsl r0, r0, #0xc
	add r0, r2, r0
	str r0, [r5, r1]
_021E6A2A:
	ldr r1, [sp]
	ldr r0, _021E6B04 ; =0xFFFFF000
	cmp r1, r0
	bge _021E6A40
	mov r1, #0x6e
	lsl r1, r1, #2
	mov r0, #5
	ldr r2, [r5, r1]
	lsl r0, r0, #0xc
	sub r0, r2, r0
	str r0, [r5, r1]
_021E6A40:
	mov r0, #1
	ldr r1, [sp, #4]
	lsl r0, r0, #0xc
	cmp r1, r0
	ble _021E6A58
	mov r1, #0x6f
	lsl r1, r1, #2
	mov r0, #5
	ldr r2, [r5, r1]
	lsl r0, r0, #0xc
	add r0, r2, r0
	str r0, [r5, r1]
_021E6A58:
	ldr r1, [sp, #4]
	ldr r0, _021E6B04 ; =0xFFFFF000
	cmp r1, r0
	bge _021E6A6E
	mov r1, #0x6f
	lsl r1, r1, #2
	mov r0, #5
	ldr r2, [r5, r1]
	lsl r0, r0, #0xc
	sub r0, r2, r0
	str r0, [r5, r1]
_021E6A6E:
	mov r0, #1
	ldr r1, [sp, #8]
	lsl r0, r0, #0xc
	cmp r1, r0
	ble _021E6A86
	mov r1, #7
	lsl r1, r1, #6
	mov r0, #5
	ldr r2, [r5, r1]
	lsl r0, r0, #0xc
	add r0, r2, r0
	str r0, [r5, r1]
_021E6A86:
	ldr r1, [sp, #8]
	ldr r0, _021E6B04 ; =0xFFFFF000
	cmp r1, r0
	bge _021E6A9C
	mov r1, #7
	lsl r1, r1, #6
	mov r0, #5
	ldr r2, [r5, r1]
	lsl r0, r0, #0xc
	sub r0, r2, r0
	str r0, [r5, r1]
_021E6A9C:
	add r1, r5, #0
	mov r0, #0x6e
	add r1, #0xb8
	lsl r0, r0, #2
	ldr r1, [r1]
	add r0, r5, r0
	bl sub_0202366C
	ldr r0, [sp]
	bl ov60_021E69CC
	mov r1, #1
	lsl r1, r1, #0xc
	cmp r0, r1
	bgt _021E6AF6
	ldr r0, [sp, #4]
	bl ov60_021E69CC
	mov r1, #1
	lsl r1, r1, #0xc
	cmp r0, r1
	bgt _021E6AF6
	ldr r0, [sp, #8]
	bl ov60_021E69CC
	mov r1, #1
	lsl r1, r1, #0xc
	cmp r0, r1
	bgt _021E6AF6
	mov r1, #0x7d
	lsl r1, r1, #2
	mov r0, #0
	str r0, [r5, r1]
	sub r2, r1, #4
	ldr r2, [r5, r2]
	add r3, r2, #1
	sub r2, r1, #4
	str r3, [r5, r2]
	ldr r2, [r5, r2]
	lsl r2, r2, #4
	ldr r2, [r4, r2]
	cmp r2, #0
	bne _021E6AF6
	sub r1, r1, #4
	str r0, [r5, r1]
_021E6AF6:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021E6AFC: .word _021EAF40
_021E6B00: .word _021EAF90
_021E6B04: .word 0xFFFFF000
	thumb_func_end ov60_021E69D4

	thumb_func_start ov60_021E6B08
ov60_021E6B08: ; 0x021E6B08
	push {r3, lr}
	mov r1, #0x7f
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	add r2, r2, #1
	str r2, [r0, r1]
	ldr r2, [r0, r1]
	cmp r2, #3
	ble _021E6B5A
	sub r2, r1, #4
	ldr r3, [r0, r2]
	lsr r2, r3, #0x1f
	add r2, r3, r2
	asr r2, r2, #1
	lsl r3, r2, #0x10
	ldr r2, _021E6B5C ; =0x01FF0000
	and r3, r2
	ldr r2, _021E6B60 ; =0x04001018
	str r3, [r2]
	sub r2, r1, #4
	ldr r2, [r0, r2]
	add r3, r2, #1
	sub r2, r1, #4
	str r3, [r0, r2]
	ldr r2, [r0, r2]
	cmp r2, #0x1f
	ble _021E6B44
	mov r2, #0x1f
	sub r1, r1, #4
	str r2, [r0, r1]
_021E6B44:
	mov r1, #0x7e
	lsl r1, r1, #2
	ldr r3, [r0, r1]
	mov r0, #0x1f
	sub r0, r0, r3
	str r0, [sp]
	ldr r0, _021E6B64 ; =0x04001050
	mov r1, #4
	mov r2, #0x39
	bl G2x_SetBlendAlpha_
_021E6B5A:
	pop {r3, pc}
	.balign 4, 0
_021E6B5C: .word 0x01FF0000
_021E6B60: .word 0x04001018
_021E6B64: .word 0x04001050
	thumb_func_end ov60_021E6B08

	thumb_func_start ov60_021E6B68
ov60_021E6B68: ; 0x021E6B68
	push {r4, lr}
	add r4, r0, #0
	bl sub_0200B528
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	add r1, r0, #0
	bl Main_SetHBlankIntrCB
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	mov r2, #0x1a
	mov r0, #3
	mov r1, #0x4a
	lsl r2, r2, #0xe
	bl CreateHeap
	ldr r1, _021E6BFC ; =0x0000062C
	add r0, r4, #0
	mov r2, #0x4a
	bl OverlayManager_CreateAndGetData
	ldr r2, _021E6BFC ; =0x0000062C
	mov r1, #0
	add r4, r0, #0
	bl memset
	mov r0, #0x4a
	str r0, [r4]
	mov r1, #0
	ldr r0, _021E6C00 ; =0x00000628
	str r1, [r4, #8]
	strb r1, [r4, r0]
	ldr r0, _021E6C04 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	bl GetLCRNGSeed
	mov r1, #0x53
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	bl SetLCRNGSeed
	ldr r0, [r4]
	bl BgConfig_Alloc
	str r0, [r4, #0xc]
	bl ov60_021E6E14
	add r0, r4, #0
	bl ov60_021E6E40
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_021E6BFC: .word 0x0000062C
_021E6C00: .word 0x00000628
_021E6C04: .word gSystem + 0x60
	thumb_func_end ov60_021E6B68

	thumb_func_start ov60_021E6C08
ov60_021E6C08: ; 0x021E6C08
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, _021E6CE0 ; =0x00000628
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _021E6C4A
	ldr r0, _021E6CE4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	bne _021E6C32
	mov r0, #8
	tst r0, r1
	bne _021E6C32
	ldr r0, _021E6CE8 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021E6C4A
_021E6C32:
	mov r0, #1
	str r0, [r4, #8]
	ldr r1, _021E6CE4 ; =gSystem
	mov r0, #0
	str r0, [r1, #0x70]
	ldr r1, _021E6CEC ; =0x00007FFF
	bl sub_0200FBF4
	ldr r1, _021E6CEC ; =0x00007FFF
	mov r0, #1
	bl sub_0200FBF4
_021E6C4A:
	ldr r0, [r5]
	cmp r0, #0
	beq _021E6C5A
	cmp r0, #1
	beq _021E6C78
	cmp r0, #2
	beq _021E6CBC
	b _021E6CC0
_021E6C5A:
	ldr r0, _021E6CE0 ; =0x00000628
	mov r2, #1
	add r1, r4, r0
	mov r0, #0x55
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #SEQ_GS_TITLE>>2
	mov r0, #2
	lsl r1, r1, #2
	bl sub_02004EC4
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _021E6CC4
_021E6C78:
	add r0, r4, #0
	bl ov60_021E7900
	ldr r2, _021E6CF0 ; =0x0000062B
	add r1, r0, #0
	ldrb r2, [r4, r2]
	add r0, r4, #0
	lsl r3, r2, #2
	ldr r2, _021E6CF4 ; =_021EB860
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	beq _021E6CB2
	ldr r1, _021E6CF0 ; =0x0000062B
	mov r2, #0
	ldrb r0, [r4, r1]
	add r0, r0, #1
	strb r0, [r4, r1]
	sub r0, r1, #2
	strb r2, [r4, r0]
	sub r0, r1, #1
	strb r2, [r4, r0]
	ldrb r0, [r4, r1]
	cmp r0, #5
	blo _021E6CC4
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _021E6CC4
_021E6CB2:
	ldr r0, _021E6CF8 ; =0x0000062A
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _021E6CC4
_021E6CBC:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6CC0:
	bl GF_AssertFail
_021E6CC4:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021E6CCE
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6CCE:
	add r0, r4, #0
	bl ov60_021E6E34
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E6CE0: .word 0x00000628
_021E6CE4: .word gSystem
_021E6CE8: .word gSystem + 0x40
_021E6CEC: .word 0x00007FFF
_021E6CF0: .word 0x0000062B
_021E6CF4: .word _021EB860
_021E6CF8: .word 0x0000062A
	thumb_func_end ov60_021E6C08

	thumb_func_start ov60_021E6CFC
ov60_021E6CFC: ; 0x021E6CFC
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl OverlayManager_GetData
	add r6, r0, #0
	ldr r1, _021E6DEC ; =0x00007FFF
	mov r0, #0
	bl sub_0200FBF4
	ldr r1, _021E6DEC ; =0x00007FFF
	mov r0, #1
	bl sub_0200FBF4
	add r0, r6, #0
	bl ov60_021E6EC0
	ldr r0, [r6, #0xc]
	bl FreeToHeap
	mov r0, #0x47
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _021E6D38
	bl DestroySysTask
	mov r0, #0x47
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r6, r0]
_021E6D38:
	ldr r0, _021E6DF0 ; =0x00000488
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _021E6D4A
	bl DestroySysTask
	ldr r0, _021E6DF0 ; =0x00000488
	mov r1, #0
	str r1, [r6, r0]
_021E6D4A:
	mov r4, #0
	add r5, r6, #0
	add r7, r4, #0
_021E6D50:
	ldr r0, _021E6DF4 ; =0x000004AC
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E6D60
	bl DestroySysTask
	ldr r0, _021E6DF4 ; =0x000004AC
	str r7, [r5, r0]
_021E6D60:
	add r4, r4, #1
	add r5, #0x1c
	cmp r4, #8
	blt _021E6D50
	mov r5, #0
	add r4, r6, #0
	add r7, r5, #0
_021E6D6E:
	ldr r0, _021E6DF8 ; =0x00000588
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E6D7E
	bl DestroySysTask
	ldr r0, _021E6DF8 ; =0x00000588
	str r7, [r4, r0]
_021E6D7E:
	add r5, r5, #1
	add r4, #0x4c
	cmp r5, #2
	blt _021E6D6E
	ldr r0, _021E6DFC ; =0x0000061C
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _021E6D98
	bl DestroySysTask
	ldr r0, _021E6DFC ; =0x0000061C
	mov r1, #0
	str r1, [r6, r0]
_021E6D98:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	add r1, r0, #0
	bl Main_SetHBlankIntrCB
	ldr r3, _021E6E00 ; =0x04000050
	mov r0, #0
	strh r0, [r3]
	ldr r2, _021E6E04 ; =0x04001050
	sub r3, #0x50
	strh r0, [r2]
	ldr r1, [r3]
	ldr r0, _021E6E08 ; =0xFFFF1FFF
	sub r2, #0x50
	and r1, r0
	str r1, [r3]
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	bl sub_0200FB70
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl SetLCRNGSeed
	ldr r0, [sp]
	bl OverlayManager_FreeData
	mov r0, #0x4a
	bl DestroyHeap
	ldr r0, _021E6E0C ; =FS_OVERLAY_ID(OVY_60)
	ldr r1, _021E6E10 ; =ov60_021EAFE0
	bl RegisterMainOverlay
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6DEC: .word 0x00007FFF
_021E6DF0: .word 0x00000488
_021E6DF4: .word 0x000004AC
_021E6DF8: .word 0x00000588
_021E6DFC: .word 0x0000061C
_021E6E00: .word 0x04000050
_021E6E04: .word 0x04001050
_021E6E08: .word 0xFFFF1FFF
_021E6E0C: .word FS_OVERLAY_ID(OVY_60)
_021E6E10: .word ov60_021EAFE0
	thumb_func_end ov60_021E6CFC

	thumb_func_start ov60_021E6E14
ov60_021E6E14: ; 0x021E6E14
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E6E30 ; =_021EB008
	add r3, sp, #0
	mov r2, #5
_021E6E1E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E6E1E
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E6E30: .word _021EB008
	thumb_func_end ov60_021E6E14

	thumb_func_start ov60_021E6E34
ov60_021E6E34: ; 0x021E6E34
	ldr r3, _021E6E3C ; =sub_0202457C
	ldr r0, [r0, #0x10]
	bx r3
	nop
_021E6E3C: .word sub_0202457C
	thumb_func_end ov60_021E6E34

	thumb_func_start ov60_021E6E40
ov60_021E6E40: ; 0x021E6E40
	push {r4, r5, lr}
	sub sp, #0x24
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	add r4, r0, #0
	add r3, r1, #0
	ldr r0, _021E6EB4 ; =0xFFCFFFEF
	mov r1, #0x10
	and r3, r0
	orr r3, r1
	str r3, [r2]
	ldr r3, _021E6EB8 ; =0x04001000
	ldr r5, _021E6EBC ; =_021EAFF8
	ldr r2, [r3]
	and r0, r2
	orr r0, r1
	str r0, [r3]
	add r3, sp, #0x14
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl sub_020215A0
	mov r0, #0xa
	mov r1, #0x4a
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x80
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x20
	str r3, [sp, #0xc]
	mov r2, #0x4a
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	add r1, r4, #0
	mov r0, #0x14
	add r1, #0x14
	mov r2, #0x4a
	bl G2dRenderer_Init
	str r0, [r4, #0x10]
	add sp, #0x24
	pop {r4, r5, pc}
	.balign 4, 0
_021E6EB4: .word 0xFFCFFFEF
_021E6EB8: .word 0x04001000
_021E6EBC: .word _021EAFF8
	thumb_func_end ov60_021E6E40

	thumb_func_start ov60_021E6EC0
ov60_021E6EC0: ; 0x021E6EC0
	push {r3, lr}
	ldr r0, [r0, #0x10]
	bl sub_02024504
	bl OamManager_Free
	bl sub_0202168C
	bl sub_02022608
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov60_021E6EC0

	thumb_func_start ov60_021E6ED8
ov60_021E6ED8: ; 0x021E6ED8
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0x4f
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	lsl r7, r7, #2
_021E6EE4:
	ldrb r0, [r6, r4]
	add r1, r4, #0
	mov r2, #0x4a
	bl Create2DGfxResObjMan
	lsl r1, r4, #2
	add r1, r5, r1
	str r0, [r1, r7]
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E6EE4
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E6ED8

	thumb_func_start ov60_021E6F00
ov60_021E6F00: ; 0x021E6F00
	push {r4, r5, r6, lr}
	mov r6, #0x4f
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #2
_021E6F0A:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, r6]
	bl Destroy2DGfxResObjMan
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E6F0A
	pop {r4, r5, r6, pc}
	thumb_func_end ov60_021E6F00

	thumb_func_start ov60_021E6F20
ov60_021E6F20: ; 0x021E6F20
	mov r1, #0x4f
	lsl r1, r1, #2
	add r0, r0, r1
	bx lr
	thumb_func_end ov60_021E6F20

	thumb_func_start ov60_021E6F28
ov60_021E6F28: ; 0x021E6F28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl Set2dSpriteAnimActiveFlag
	add r0, r5, #0
	add r1, r4, #0
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, pc}
	thumb_func_end ov60_021E6F28

	thumb_func_start ov60_021E6F3C
ov60_021E6F3C: ; 0x021E6F3C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r7, r0, #0
	mov r0, #0
	str r7, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	add r5, r1, #0
	str r0, [sp, #8]
	mov r1, #0
	mov r0, #0x4f
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	str r2, [sp, #0x10]
	ldr r2, [r5, r0]
	add r6, r3, #0
	str r2, [sp, #0x14]
	add r2, r0, #4
	ldr r2, [r5, r2]
	add r3, r7, #0
	str r2, [sp, #0x18]
	add r2, r0, #0
	add r2, #8
	ldr r2, [r5, r2]
	add r0, #0xc
	str r2, [sp, #0x1c]
	ldr r0, [r5, r0]
	add r2, r7, #0
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	str r1, [sp, #0x28]
	ldr r0, [sp, #0x44]
	add r1, r7, #0
	ldr r4, [sp, #0x40]
	bl CreateSpriteResourcesHeader
	ldr r0, [r5, #0x10]
	mov r1, #0
	str r0, [r4]
	ldr r0, [sp, #0x44]
	str r0, [r4, #4]
	str r1, [r4, #8]
	str r1, [r4, #0xc]
	mov r0, #1
	str r1, [r4, #0x10]
	lsl r0, r0, #0xc
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	strh r1, [r4, #0x20]
	str r1, [r4, #0x24]
	str r6, [r4, #0x28]
	mov r0, #0x4a
	str r0, [r4, #0x2c]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E6F3C

	thumb_func_start ov60_021E6FAC
ov60_021E6FAC: ; 0x021E6FAC
	push {r4, r5, r6, lr}
	add r6, r2, #0
	ldr r2, [sp, #0x10]
	add r5, r0, #0
	add r4, r1, #0
	add r0, #0x14
	lsl r1, r3, #0xc
	lsl r2, r2, #0xc
	bl G2dRenderer_SetSubSurfaceCoords
	add r5, #0x14
	add r0, r5, #0
	lsl r1, r4, #0xc
	lsl r2, r6, #0xc
	bl G2dRenderer_SetMainSurfaceCoords
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov60_021E6FAC

	thumb_func_start ov60_021E6FD0
ov60_021E6FD0: ; 0x021E6FD0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	strb r4, [r5]
	strb r4, [r5, #2]
	ldr r0, [sp, #0x14]
	strb r4, [r5, #3]
	str r0, [r5, #0x10]
	str r1, [r5, #8]
	str r2, [r5, #0xc]
	ldr r0, [sp, #0x10]
	strb r3, [r5, #1]
	str r0, [r5, #0x14]
	ldr r0, _021E6FF8 ; =ov60_021E6FFC
	add r1, r5, #0
	add r2, r4, #0
	bl CreateSysTask
	str r0, [r5, #4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6FF8: .word ov60_021E6FFC
	thumb_func_end ov60_021E6FD0

	thumb_func_start ov60_021E6FFC
ov60_021E6FFC: ; 0x021E6FFC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	mov r0, #0x1f
	mul r0, r1
	ldrb r1, [r4, #1]
	bl _s32_div_f
	strb r0, [r4, #2]
	ldrb r0, [r4, #2]
	cmp r0, #0x1f
	blo _021E702E
	mov r0, #0x1f
	strb r0, [r4, #2]
	ldr r0, [r4, #4]
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #3]
_021E702E:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _021E7038
	ldrb r3, [r4, #2]
	b _021E703E
_021E7038:
	ldrb r1, [r4, #2]
	mov r0, #0x1f
	sub r3, r0, r1
_021E703E:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _021E7058
	mov r0, #0x1f
	sub r0, r0, r3
	str r0, [sp]
	ldr r0, _021E706C ; =0x04000050
	ldr r1, [r4, #8]
	ldr r2, [r4, #0xc]
	bl G2x_SetBlendAlpha_
	add sp, #4
	pop {r3, r4, pc}
_021E7058:
	mov r0, #0x1f
	sub r0, r0, r3
	str r0, [sp]
	ldr r0, _021E7070 ; =0x04001050
	ldr r1, [r4, #8]
	ldr r2, [r4, #0xc]
	bl G2x_SetBlendAlpha_
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021E706C: .word 0x04000050
_021E7070: .word 0x04001050
	thumb_func_end ov60_021E6FFC

	thumb_func_start ov60_021E7074
ov60_021E7074: ; 0x021E7074
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r2, #0
	add r6, r0, #0
	add r0, r5, #0
	add r4, r1, #0
	add r7, r3, #0
	bl ov60_021E734C
	mov r1, #0x1c
	mul r1, r0
	add r4, r4, r1
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E709A
	bl GF_AssertFail
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E709A:
	ldr r1, [sp, #0x24]
	cmp r1, #0
	bne _021E70DE
	add r0, r6, #0
	add r1, r5, #0
	bl Bg_GetXpos
	str r0, [sp]
	add r0, r6, #0
	add r1, r5, #0
	bl Bg_GetYpos
	str r0, [sp, #4]
	ldr r3, [sp]
	add r1, sp, #0x10
	mov r0, #0x10
	ldrsh r4, [r1, r0]
	lsl r1, r5, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	mov r2, #0
	add r3, r7, r3
	bl BgSetPosTextAndCommit
	ldr r3, [sp, #4]
	lsl r1, r5, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	mov r2, #3
	add r3, r4, r3
	bl BgSetPosTextAndCommit
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E70DE:
	str r6, [r4]
	str r5, [r4, #8]
	mov r0, #0
	strb r0, [r4, #0xe]
	strb r0, [r4, #0xf]
	strh r1, [r4, #0xc]
	add r0, r6, #0
	add r1, r5, #0
	bl Bg_GetXpos
	strh r0, [r4, #0x18]
	add r0, r6, #0
	add r1, r5, #0
	bl Bg_GetYpos
	strh r0, [r4, #0x1a]
	strh r7, [r4, #0x14]
	add r1, sp, #0x10
	mov r0, #0x10
	ldrsh r0, [r1, r0]
	add r1, r4, #0
	mov r2, #0
	strh r0, [r4, #0x16]
	mov r0, #1
	str r0, [r4, #4]
	ldr r0, _021E711C ; =ov60_021E71CC
	bl sub_0200E33C
	str r0, [r4, #0x10]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E711C: .word ov60_021E71CC
	thumb_func_end ov60_021E7074

	thumb_func_start ov60_021E7120
ov60_021E7120: ; 0x021E7120
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r2, #0
	add r6, r0, #0
	add r0, r5, #0
	add r4, r1, #0
	add r7, r3, #0
	bl ov60_021E734C
	mov r1, #0x1c
	mul r1, r0
	add r4, r4, r1
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E7146
	bl GF_AssertFail
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E7146:
	ldr r1, [sp, #0x24]
	cmp r1, #0
	bne _021E718A
	add r0, r6, #0
	add r1, r5, #0
	bl Bg_GetXpos
	str r0, [sp]
	add r0, r6, #0
	add r1, r5, #0
	bl Bg_GetYpos
	str r0, [sp, #4]
	ldr r3, [sp]
	add r1, sp, #0x10
	mov r0, #0x10
	ldrsh r4, [r1, r0]
	lsl r1, r5, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	mov r2, #0
	add r3, r7, r3
	bl BgSetPosTextAndCommit
	ldr r3, [sp, #4]
	lsl r1, r5, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	mov r2, #3
	add r3, r4, r3
	bl BgSetPosTextAndCommit
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E718A:
	str r6, [r4]
	str r5, [r4, #8]
	mov r0, #0
	strb r0, [r4, #0xe]
	strb r0, [r4, #0xf]
	strh r1, [r4, #0xc]
	add r0, r6, #0
	add r1, r5, #0
	bl Bg_GetXpos
	strh r0, [r4, #0x18]
	add r0, r6, #0
	add r1, r5, #0
	bl Bg_GetYpos
	strh r0, [r4, #0x1a]
	strh r7, [r4, #0x14]
	add r1, sp, #0x10
	mov r0, #0x10
	ldrsh r0, [r1, r0]
	add r1, r4, #0
	mov r2, #0
	strh r0, [r4, #0x16]
	mov r0, #1
	str r0, [r4, #4]
	ldr r0, _021E71C8 ; =ov60_021E7264
	bl CreateSysTask
	str r0, [r4, #0x10]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E71C8: .word ov60_021E7264
	thumb_func_end ov60_021E7120

	thumb_func_start ov60_021E71CC
ov60_021E71CC: ; 0x021E71CC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r0, #0xc
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bge _021E71F8
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl Bg_GetXpos
	mov r1, #0x14
	ldrsh r1, [r5, r1]
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl Bg_GetYpos
	mov r1, #0x16
	ldrsh r1, [r5, r1]
	add r7, r1, r0
	b _021E7242
_021E71F8:
	ldrb r1, [r5, #0xe]
	add r1, r1, #1
	strb r1, [r5, #0xe]
	ldrsh r6, [r5, r0]
	mov r0, #0x14
	ldrsh r1, [r5, r0]
	ldrb r4, [r5, #0xe]
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	add r7, r0, #0
	mov r0, #0x16
	ldrsh r1, [r5, r0]
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	mov r1, #0x18
	ldrsh r1, [r5, r1]
	add r1, r7, r1
	str r1, [sp]
	mov r1, #0x1a
	ldrsh r1, [r5, r1]
	add r7, r0, r1
	cmp r4, r6
	blt _021E7242
	ldr r0, [r5, #0x10]
	bl DestroySysTask
	mov r1, #0
	str r1, [r5, #0x10]
	mov r0, #1
	strb r0, [r5, #0xf]
	str r1, [r5, #4]
_021E7242:
	ldr r1, [r5, #8]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	ldr r3, [sp]
	lsr r1, r1, #0x18
	mov r2, #0
	bl BgSetPosTextAndCommit
	ldr r1, [r5, #8]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #3
	add r3, r7, #0
	bl BgSetPosTextAndCommit
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E71CC

	thumb_func_start ov60_021E7264
ov60_021E7264: ; 0x021E7264
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r0, #0xc
	ldrsh r1, [r5, r0]
	cmp r1, #0
	bge _021E7290
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl Bg_GetXpos
	mov r1, #0x14
	ldrsh r1, [r5, r1]
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, [r5, #8]
	bl Bg_GetYpos
	mov r1, #0x16
	ldrsh r1, [r5, r1]
	add r7, r1, r0
	b _021E72DA
_021E7290:
	ldrb r1, [r5, #0xe]
	add r1, r1, #1
	strb r1, [r5, #0xe]
	ldrsh r6, [r5, r0]
	mov r0, #0x14
	ldrsh r1, [r5, r0]
	ldrb r4, [r5, #0xe]
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	add r7, r0, #0
	mov r0, #0x16
	ldrsh r1, [r5, r0]
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	mov r1, #0x18
	ldrsh r1, [r5, r1]
	add r1, r7, r1
	str r1, [sp]
	mov r1, #0x1a
	ldrsh r1, [r5, r1]
	add r7, r0, r1
	cmp r4, r6
	blt _021E72DA
	ldr r0, [r5, #0x10]
	bl DestroySysTask
	mov r1, #0
	str r1, [r5, #0x10]
	mov r0, #1
	strb r0, [r5, #0xf]
	str r1, [r5, #4]
_021E72DA:
	ldr r1, [r5, #8]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	ldr r3, [sp]
	lsr r1, r1, #0x18
	mov r2, #0
	bl ScheduleSetBgPosText
	ldr r1, [r5, #8]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #3
	add r3, r7, #0
	bl ScheduleSetBgPosText
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E7264

	thumb_func_start ov60_021E72FC
ov60_021E72FC: ; 0x021E72FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r4, #0
	bl ov60_021E734C
	mov r1, #0x1c
	mul r1, r0
	add r1, r5, r1
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _021E7318
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E7318:
	ldrb r0, [r1, #0xf]
	cmp r0, #0
	beq _021E7320
	mov r4, #1
_021E7320:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov60_021E72FC

	thumb_func_start ov60_021E7324
ov60_021E7324: ; 0x021E7324
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl ov60_021E734C
	mov r1, #0x1c
	mul r1, r0
	add r4, r4, r1
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E734A
	ldr r0, [r4, #0x10]
	bl DestroySysTask
	mov r1, #0
	str r1, [r4, #0x10]
	mov r0, #1
	strb r0, [r4, #0xf]
	str r1, [r4, #4]
_021E734A:
	pop {r4, pc}
	thumb_func_end ov60_021E7324

	thumb_func_start ov60_021E734C
ov60_021E734C: ; 0x021E734C
	push {r4, lr}
	mov r4, #0
	cmp r0, #7
	bhi _021E738E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E7360: ; jump table
	.short _021E7370 - _021E7360 - 2 ; case 0
	.short _021E7372 - _021E7360 - 2 ; case 1
	.short _021E7376 - _021E7360 - 2 ; case 2
	.short _021E737A - _021E7360 - 2 ; case 3
	.short _021E737E - _021E7360 - 2 ; case 4
	.short _021E7382 - _021E7360 - 2 ; case 5
	.short _021E7386 - _021E7360 - 2 ; case 6
	.short _021E738A - _021E7360 - 2 ; case 7
_021E7370:
	b _021E7392
_021E7372:
	mov r4, #1
	b _021E7392
_021E7376:
	mov r4, #2
	b _021E7392
_021E737A:
	mov r4, #3
	b _021E7392
_021E737E:
	mov r4, #4
	b _021E7392
_021E7382:
	mov r4, #5
	b _021E7392
_021E7386:
	mov r4, #6
	b _021E7392
_021E738A:
	mov r4, #7
	b _021E7392
_021E738E:
	bl GF_AssertFail
_021E7392:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov60_021E734C

	thumb_func_start ov60_021E7398
ov60_021E7398: ; 0x021E7398
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r2, #0
	add r4, r3, #0
	str r6, [sp]
	ldrh r2, [r4, #0x28]
	ldrh r3, [r4, #0x2a]
	add r5, r0, #0
	str r1, [sp, #4]
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x24]
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov60_021E74F0
	ldr r0, [sp, #4]
	cmp r0, #0
	bgt _021E73D4
	str r6, [sp]
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	ldr r2, [r4, #0x18]
	ldr r3, [r4, #0x1c]
	bl ov60_021E75C4
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E73D4:
	cmp r6, #0
	bne _021E73DA
	add r5, #0x4c
_021E73DA:
	add r2, r5, #0
	add r3, r4, #0
	add r2, #0x10
	mov r7, #5
_021E73E2:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r7, r7, #1
	bne _021E73E2
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #4]
	strh r0, [r5, #8]
	mov r0, #0
	strb r0, [r5, #0xa]
	mov r0, #1
	strb r0, [r5, #0xb]
	str r0, [r5]
	str r6, [r5, #4]
	ldr r0, [r4]
	str r0, [r5, #0x3c]
	ldr r0, [r4, #4]
	str r0, [r5, #0x40]
	ldr r0, [r4, #8]
	str r0, [r5, #0x44]
	ldr r0, [r4, #0xc]
	str r0, [r5, #0x48]
	str r6, [sp]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl ov60_021E75C4
	ldr r0, _021E7430 ; =ov60_021E7454
	add r1, r5, #0
	mov r2, #0
	bl sub_0200E33C
	str r0, [r5, #0xc]
	add r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7430: .word ov60_021E7454
	thumb_func_end ov60_021E7398

	thumb_func_start ov60_021E7434
ov60_021E7434: ; 0x021E7434
	cmp r1, #0
	bne _021E743A
	add r0, #0x4c
_021E743A:
	ldr r1, [r0]
	cmp r1, #0
	bne _021E7444
	mov r0, #1
	bx lr
_021E7444:
	ldrb r0, [r0, #0xb]
	cmp r0, #0
	beq _021E744E
	mov r0, #1
	bx lr
_021E744E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov60_021E7434

	thumb_func_start ov60_021E7454
ov60_021E7454: ; 0x021E7454
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	ldrb r0, [r5, #0xa]
	add r0, r0, #1
	strb r0, [r5, #0xa]
	ldr r7, [r5, #0x10]
	ldr r0, [r5, #0x20]
	ldrb r4, [r5, #0xa]
	sub r1, r0, r7
	mov r0, #8
	ldrsh r6, [r5, r0]
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	add r0, r7, r0
	str r0, [sp, #0xc]
	ldr r7, [r5, #0x14]
	ldr r0, [r5, #0x24]
	sub r1, r0, r7
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	add r0, r7, r0
	str r0, [sp, #8]
	ldr r7, [r5, #0x18]
	ldr r0, [r5, #0x28]
	sub r1, r0, r7
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	add r7, r7, r0
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0x2c]
	str r0, [sp, #4]
	sub r1, r1, r0
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	ldr r1, [sp, #4]
	add r4, r1, r0
	ldr r0, [sp, #0xc]
	str r0, [r5, #0x3c]
	ldr r0, [sp, #8]
	str r0, [r5, #0x40]
	str r7, [r5, #0x44]
	str r4, [r5, #0x48]
	mov r0, #8
	ldrb r1, [r5, #0xa]
	ldrsh r0, [r5, r0]
	cmp r1, r0
	blt _021E74DC
	ldr r0, [r5, #0xc]
	bl DestroySysTask
	mov r1, #0
	str r1, [r5, #0xc]
	mov r0, #1
	strb r0, [r5, #0xb]
	str r1, [r5]
_021E74DC:
	ldr r0, [r5, #4]
	ldr r1, [sp, #8]
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r2, r7, #0
	add r3, r4, #0
	bl ov60_021E75C4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E7454

	thumb_func_start ov60_021E74F0
ov60_021E74F0: ; 0x021E74F0
	push {r4, r5}
	add r4, r0, #0
	add r0, r1, #0
	ldr r1, [sp, #8]
	cmp r1, #0
	ldr r1, _021E75A8 ; =0xFFFF1FFF
	beq _021E7554
	mov r5, #1
	lsl r5, r5, #0x1a
	ldr r3, [r5]
	and r3, r1
	mov r1, #6
	lsl r1, r1, #0xc
	orr r1, r3
	str r1, [r5]
	add r5, #0x48
	ldrh r3, [r5]
	mov r1, #0x3f
	bic r3, r1
	orr r3, r4
	cmp r2, #0
	beq _021E7520
	mov r1, #0x20
	orr r3, r1
_021E7520:
	ldr r5, _021E75AC ; =0x04000048
	ldr r1, _021E75B0 ; =0xFFFFC0FF
	strh r3, [r5]
	ldrh r3, [r5]
	and r3, r1
	lsl r1, r4, #8
	orr r3, r1
	cmp r2, #0
	beq _021E7536
	lsr r1, r5, #0xd
	orr r3, r1
_021E7536:
	ldr r1, _021E75AC ; =0x04000048
	strh r3, [r1]
	ldrh r3, [r1, #2]
	mov r1, #0x3f
	bic r3, r1
	add r1, r3, #0
	orr r1, r0
	cmp r2, #0
	beq _021E754C
	mov r0, #0x20
	orr r1, r0
_021E754C:
	ldr r0, _021E75B4 ; =0x0400004A
	strh r1, [r0]
	pop {r4, r5}
	bx lr
_021E7554:
	ldr r5, _021E75B8 ; =0x04001000
	ldr r2, [r5]
	and r2, r1
	mov r1, #6
	lsl r1, r1, #0xc
	orr r1, r2
	str r1, [r5]
	add r5, #0x48
	ldrh r2, [r5]
	mov r1, #0x3f
	bic r2, r1
	orr r2, r4
	cmp r3, #0
	beq _021E7574
	mov r1, #0x20
	orr r2, r1
_021E7574:
	ldr r5, _021E75BC ; =0x04001048
	ldr r1, _021E75B0 ; =0xFFFFC0FF
	strh r2, [r5]
	ldrh r2, [r5]
	and r2, r1
	lsl r1, r4, #8
	orr r2, r1
	cmp r3, #0
	beq _021E758A
	lsr r1, r5, #0xd
	orr r2, r1
_021E758A:
	ldr r1, _021E75BC ; =0x04001048
	strh r2, [r1]
	ldrh r2, [r1, #2]
	mov r1, #0x3f
	bic r2, r1
	add r1, r2, #0
	orr r1, r0
	cmp r3, #0
	beq _021E75A0
	mov r0, #0x20
	orr r1, r0
_021E75A0:
	ldr r0, _021E75C0 ; =0x0400104A
	strh r1, [r0]
	pop {r4, r5}
	bx lr
	.balign 4, 0
_021E75A8: .word 0xFFFF1FFF
_021E75AC: .word 0x04000048
_021E75B0: .word 0xFFFFC0FF
_021E75B4: .word 0x0400004A
_021E75B8: .word 0x04001000
_021E75BC: .word 0x04001048
_021E75C0: .word 0x0400104A
	thumb_func_end ov60_021E74F0

	thumb_func_start ov60_021E75C4
ov60_021E75C4: ; 0x021E75C4
	push {r4, r5}
	add r4, r1, #0
	add r1, r3, #0
	cmp r0, #0
	bne _021E7624
	cmp r2, #0xff
	bne _021E7624
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _021E75FE
	ldr r0, _021E7678 ; =0x04000042
	mov r2, #1
	strh r2, [r0]
	mov r2, #0xff
	lsl r1, r1, #0x18
	lsl r3, r4, #8
	lsl r2, r2, #8
	and r2, r3
	lsr r1, r1, #0x18
	orr r1, r2
	lsl r1, r1, #0x10
	lsr r3, r1, #0x10
	strh r3, [r0, #4]
	lsr r2, r0, #0x12
	sub r1, r0, #2
	strh r2, [r1]
	strh r3, [r0, #2]
	pop {r4, r5}
	bx lr
_021E75FE:
	ldr r0, _021E767C ; =0x04001042
	mov r2, #1
	strh r2, [r0]
	mov r2, #0xff
	lsl r1, r1, #0x18
	lsl r3, r4, #8
	lsl r2, r2, #8
	and r2, r3
	lsr r1, r1, #0x18
	orr r1, r2
	lsl r1, r1, #0x10
	lsr r3, r1, #0x10
	strh r3, [r0, #4]
	lsr r2, r0, #0x12
	sub r1, r0, #2
	strh r2, [r1]
	strh r3, [r0, #2]
	pop {r4, r5}
	bx lr
_021E7624:
	ldr r3, [sp, #8]
	cmp r3, #0
	beq _021E7650
	lsl r0, r0, #8
	mov r3, #0xff
	add r5, r0, #0
	lsl r3, r3, #8
	lsl r0, r2, #0x18
	and r5, r3
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	add r2, r5, #0
	orr r2, r0
	ldr r0, _021E7680 ; =0x04000040
	lsr r1, r1, #0x18
	strh r2, [r0]
	lsl r2, r4, #8
	and r2, r3
	orr r1, r2
	strh r1, [r0, #4]
	pop {r4, r5}
	bx lr
_021E7650:
	lsl r0, r0, #8
	mov r3, #0xff
	add r5, r0, #0
	lsl r3, r3, #8
	lsl r0, r2, #0x18
	and r5, r3
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	add r2, r5, #0
	orr r2, r0
	ldr r0, _021E7684 ; =0x04001040
	lsr r1, r1, #0x18
	strh r2, [r0]
	lsl r2, r4, #8
	and r2, r3
	orr r1, r2
	strh r1, [r0, #4]
	pop {r4, r5}
	bx lr
	nop
_021E7678: .word 0x04000042
_021E767C: .word 0x04001042
_021E7680: .word 0x04000040
_021E7684: .word 0x04001040
	thumb_func_end ov60_021E75C4

	thumb_func_start ov60_021E7688
ov60_021E7688: ; 0x021E7688
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov60_021E7688

	thumb_func_start ov60_021E768C
ov60_021E768C: ; 0x021E768C
	ldr r1, _021E7694 ; =0x0000046C
	add r0, r0, r1
	bx lr
	nop
_021E7694: .word 0x0000046C
	thumb_func_end ov60_021E768C

	thumb_func_start ov60_021E7698
ov60_021E7698: ; 0x021E7698
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end ov60_021E7698

	thumb_func_start ov60_021E769C
ov60_021E769C: ; 0x021E769C
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov60_021E769C

	thumb_func_start ov60_021E76A0
ov60_021E76A0: ; 0x021E76A0
	push {r3, r4, r5, r6, r7, lr}
	ldr r3, _021E76E8 ; =0x04000050
	add r5, r0, #0
	mov r4, #0
	strh r4, [r3]
	ldr r0, _021E76EC ; =0x04001050
	sub r3, #0x50
	strh r4, [r0]
	ldr r2, [r3]
	ldr r1, _021E76F0 ; =0xFFFF1FFF
	sub r0, #0x50
	and r2, r1
	str r2, [r3]
	ldr r2, [r0]
	and r1, r2
	str r1, [r0]
	mov r6, #3
	add r7, r4, #0
_021E76C4:
	lsl r1, r4, #0x18
	mov r2, #0
	ldr r0, [r5, #0xc]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	lsl r1, r4, #0x18
	ldr r0, [r5, #0xc]
	lsr r1, r1, #0x18
	add r2, r6, #0
	add r3, r7, #0
	bl BgSetPosTextAndCommit
	add r4, r4, #1
	cmp r4, #8
	blt _021E76C4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E76E8: .word 0x04000050
_021E76EC: .word 0x04001050
_021E76F0: .word 0xFFFF1FFF
	thumb_func_end ov60_021E76A0

	thumb_func_start ov60_021E76F4
ov60_021E76F4: ; 0x021E76F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r2, #0
	mov r2, #0x1f
	str r2, [sp, #8]
	ldr r2, _021E7790 ; =0x00000614
	mov r5, #0
	add r4, r0, r2
	mov r7, #1
	str r7, [r4]
	strb r5, [r4, #0x12]
	strb r3, [r4, #0x10]
	strb r5, [r4, #0x11]
	lsl r0, r7, #0xc
	str r6, [r4, #4]
	strh r0, [r4, #0xc]
	strh r5, [r4, #0xe]
	str r5, [sp, #4]
	strb r1, [r4, #0x13]
	cmp r6, #0
	beq _021E7724
	add r2, r5, #0
	add r7, r5, #0
	b _021E7726
_021E7724:
	mov r2, #4
_021E7726:
	ldrb r0, [r4, #0x13]
	cmp r0, #1
	bhi _021E7730
	ldr r1, _021E7794 ; =0x00007FFF
	b _021E7732
_021E7730:
	mov r1, #0
_021E7732:
	lsl r0, r2, #0x18
	lsl r1, r1, #0x10
	lsr r0, r0, #0x18
	lsr r1, r1, #0x10
	bl BG_SetMaskColor
	ldrb r0, [r4, #0x13]
	cmp r0, #0
	beq _021E7748
	cmp r0, #2
	bne _021E7752
_021E7748:
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x1f
	str r0, [sp, #4]
	mov r5, #1
_021E7752:
	mov r0, #0
	add r1, r0, #0
	mov r2, #0xff
	mov r3, #0xc0
	str r6, [sp]
	bl ov60_021E75C4
	mov r2, #1
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	add r3, r2, #0
	str r6, [sp]
	bl ov60_021E74F0
	cmp r5, #0
	beq _021E7778
	add r0, r7, #0
	bl SetMasterBrightnessNeutral
_021E7778:
	ldr r0, _021E7798 ; =ov60_021E77C0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r4, #8]
	ldr r0, _021E779C ; =ov60_021E7864
	add r1, r4, #0
	bl Main_SetHBlankIntrCB
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7790: .word 0x00000614
_021E7794: .word 0x00007FFF
_021E7798: .word ov60_021E77C0
_021E779C: .word ov60_021E7864
	thumb_func_end ov60_021E76F4

	thumb_func_start ov60_021E77A0
ov60_021E77A0: ; 0x021E77A0
	ldr r1, _021E77BC ; =0x00000614
	add r1, r0, r1
	ldr r0, [r1]
	cmp r0, #0
	bne _021E77AE
	mov r0, #1
	bx lr
_021E77AE:
	ldrb r0, [r1, #0x12]
	cmp r0, #0
	beq _021E77B8
	mov r0, #1
	bx lr
_021E77B8:
	mov r0, #0
	bx lr
	.balign 4, 0
_021E77BC: .word 0x00000614
	thumb_func_end ov60_021E77A0

	thumb_func_start ov60_021E77C0
ov60_021E77C0: ; 0x021E77C0
	push {r4, lr}
	add r4, r1, #0
	ldrb r0, [r4, #0x11]
	ldrb r1, [r4, #0x10]
	lsl r0, r0, #0xf
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r2, r0, #1
	add r0, r2, #1
	ldr r1, _021E7854 ; =FX_SinCosTable_
	lsl r0, r0, #1
	ldrsh r0, [r1, r0]
	strh r0, [r4, #0xc]
	lsl r0, r2, #1
	ldrsh r0, [r1, r0]
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #0x11]
	add r0, r0, #1
	strb r0, [r4, #0x11]
	ldrb r1, [r4, #0x11]
	ldrb r0, [r4, #0x10]
	cmp r1, r0
	blo _021E7850
	ldr r0, [r4, #8]
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #8]
	mov r1, #1
	strb r1, [r4, #0x12]
	str r0, [r4]
	ldr r2, [r4, #4]
	cmp r2, #0
	beq _021E780C
	add r1, r0, #0
_021E780C:
	lsl r0, r1, #0x18
	ldrb r1, [r4, #0x13]
	lsr r0, r0, #0x18
	cmp r1, #1
	bne _021E781E
	ldr r1, _021E7858 ; =0x00007FFF
	bl sub_0200FBF4
	b _021E7848
_021E781E:
	cmp r1, #3
	bne _021E782A
	mov r1, #0
	bl sub_0200FBF4
	b _021E7848
_021E782A:
	cmp r2, #0
	ldr r1, _021E785C ; =0xFFFF1FFF
	beq _021E783C
	mov r3, #1
	lsl r3, r3, #0x1a
	ldr r2, [r3]
	and r1, r2
	str r1, [r3]
	b _021E7844
_021E783C:
	ldr r3, _021E7860 ; =0x04001000
	ldr r2, [r3]
	and r1, r2
	str r1, [r3]
_021E7844:
	bl SetMasterBrightnessNeutral
_021E7848:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetHBlankIntrCB
_021E7850:
	pop {r4, pc}
	nop
_021E7854: .word FX_SinCosTable_
_021E7858: .word 0x00007FFF
_021E785C: .word 0xFFFF1FFF
_021E7860: .word 0x04001000
	thumb_func_end ov60_021E77C0

	thumb_func_start ov60_021E7864
ov60_021E7864: ; 0x021E7864
	push {r3, r4, lr}
	sub sp, #4
	ldr r1, _021E78F8 ; =0x04000006
	add r4, r0, #0
	ldrh r2, [r1]
	cmp r2, #0xbf
	ble _021E7886
	ldr r0, [r4, #4]
	mov r2, #0x7f
	str r0, [sp]
	mov r0, #0
	add r1, r0, #0
	mov r3, #0xc0
	bl ov60_021E75C4
	add sp, #4
	pop {r3, r4, pc}
_021E7886:
	mov r0, #0xc
	ldrsh r3, [r4, r0]
	lsr r0, r1, #0xe
	cmp r3, r0
	bne _021E78A4
	ldr r0, [r4, #4]
	mov r2, #0xff
	str r0, [sp]
	mov r0, #0
	add r1, r0, #0
	mov r3, #0xc0
	bl ov60_021E75C4
	add sp, #4
	pop {r3, r4, pc}
_021E78A4:
	ldr r0, _021E78FC ; =0xFFFFF000
	cmp r3, r0
	bne _021E78BE
	ldr r0, [r4, #4]
	mov r3, #0xc0
	str r0, [sp]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	bl ov60_021E75C4
	add sp, #4
	pop {r3, r4, pc}
_021E78BE:
	mov r0, #0xe
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bgt _021E78CA
	mov r0, #0
	b _021E78D2
_021E78CA:
	add r0, r2, #0
	mul r0, r3
	bl _s32_div_f
_021E78D2:
	add r2, r0, #0
	add r2, #0x7f
	cmp r2, #0xff
	ble _021E78DE
	mov r2, #0xff
	b _021E78E4
_021E78DE:
	cmp r2, #0
	bge _021E78E4
	mov r2, #0
_021E78E4:
	ldr r0, [r4, #4]
	mov r3, #0xc0
	str r0, [sp]
	mov r0, #0
	add r1, r0, #0
	bl ov60_021E75C4
	add sp, #4
	pop {r3, r4, pc}
	nop
_021E78F8: .word 0x04000006
_021E78FC: .word 0xFFFFF000
	thumb_func_end ov60_021E7864

	thumb_func_start ov60_021E7900
ov60_021E7900: ; 0x021E7900
	push {r4, lr}
	ldr r1, _021E7950 ; =0x0000062B
	mov r4, #0
	ldrb r1, [r0, r1]
	cmp r1, #4
	bhi _021E7948
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E7918: ; jump table
	.short _021E7922 - _021E7918 - 2 ; case 0
	.short _021E792A - _021E7918 - 2 ; case 1
	.short _021E7932 - _021E7918 - 2 ; case 2
	.short _021E793A - _021E7918 - 2 ; case 3
	.short _021E7942 - _021E7918 - 2 ; case 4
_021E7922:
	mov r1, #0x15
	lsl r1, r1, #4
	add r4, r0, r1
	b _021E794C
_021E792A:
	mov r1, #0x17
	lsl r1, r1, #4
	add r4, r0, r1
	b _021E794C
_021E7932:
	mov r1, #0x89
	lsl r1, r1, #2
	add r4, r0, r1
	b _021E794C
_021E793A:
	mov r1, #0xfe
	lsl r1, r1, #2
	add r4, r0, r1
	b _021E794C
_021E7942:
	ldr r1, _021E7954 ; =0x00000468
	add r4, r0, r1
	b _021E794C
_021E7948:
	bl GF_AssertFail
_021E794C:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_021E7950: .word 0x0000062B
_021E7954: .word 0x00000468
	thumb_func_end ov60_021E7900

	thumb_func_start ov60_021E7958
ov60_021E7958: ; 0x021E7958
	ldr r1, _021E7968 ; =0x00000629
	ldrb r2, [r0, r1]
	add r2, r2, #1
	strb r2, [r0, r1]
	mov r2, #0
	add r1, r1, #1
	strb r2, [r0, r1]
	bx lr
	.balign 4, 0
_021E7968: .word 0x00000629
	thumb_func_end ov60_021E7958

	thumb_func_start ov60_021E796C
ov60_021E796C: ; 0x021E796C
	ldr r1, _021E7974 ; =0x00000629
	ldrb r0, [r0, r1]
	bx lr
	nop
_021E7974: .word 0x00000629
	thumb_func_end ov60_021E796C

	thumb_func_start ov60_021E7978
ov60_021E7978: ; 0x021E7978
	ldr r1, _021E7980 ; =0x0000062A
	ldrb r0, [r0, r1]
	bx lr
	nop
_021E7980: .word 0x0000062A
	thumb_func_end ov60_021E7978

	thumb_func_start ov60_021E7984
ov60_021E7984: ; 0x021E7984
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov60_021E7698
	cmp r0, #0
	beq _021E7996
	mov r0, #2
	strb r0, [r4]
_021E7996:
	ldrb r0, [r4]
	cmp r0, #0
	beq _021E79A6
	cmp r0, #1
	beq _021E79B6
	cmp r0, #2
	beq _021E79D2
	b _021E79DE
_021E79A6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E79F4
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021E79DE
_021E79B6:
	add r0, r5, #0
	bl ov60_021E769C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E7A50
	cmp r0, #0
	beq _021E79DE
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021E79DE
_021E79D2:
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E7C5C
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E79DE:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov60_021E7984

	thumb_func_start ov60_021E79E4
ov60_021E79E4: ; 0x021E79E4
	push {r3, lr}
	bl ov60_021E7688
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl OamManager_ApplyAndResetBuffers
	pop {r3, pc}
	thumb_func_end ov60_021E79E4

	thumb_func_start ov60_021E79F4
ov60_021E79F4: ; 0x021E79F4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov60_021E7688
	add r6, r0, #0
	bl sub_020216C8
	bl sub_02022638
	ldr r0, _021E7A48 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	add r0, r5, #0
	bl ov60_021E7CC4
	add r0, r5, #0
	bl ov60_021E76A0
	ldr r0, _021E7A4C ; =ov60_021E79E4
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	bl ov60_021E7E0C
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E7F94
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E8050
	add r0, r5, #0
	bl ov60_021E7F74
	mov r0, #1
	strb r0, [r4, #1]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E7A48: .word gSystem + 0x60
_021E7A4C: .word ov60_021E79E4
	thumb_func_end ov60_021E79F4

	thumb_func_start ov60_021E7A50
ov60_021E7A50: ; 0x021E7A50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r7, r1, #0
	bl ov60_021E7688
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ov60_021E768C
	add r4, r0, #0
	add r0, r5, #0
	bl ov60_021E7978
	add r6, r0, #0
	add r0, r5, #0
	bl ov60_021E796C
	cmp r0, #0xa
	bhi _021E7B42
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E7A84: ; jump table
	.short _021E7A9A - _021E7A84 - 2 ; case 0
	.short _021E7ABE - _021E7A84 - 2 ; case 1
	.short _021E7AEE - _021E7A84 - 2 ; case 2
	.short _021E7B02 - _021E7A84 - 2 ; case 3
	.short _021E7B3E - _021E7A84 - 2 ; case 4
	.short _021E7B4C - _021E7A84 - 2 ; case 5
	.short _021E7B6C - _021E7A84 - 2 ; case 6
	.short _021E7BD6 - _021E7A84 - 2 ; case 7
	.short _021E7C06 - _021E7A84 - 2 ; case 8
	.short _021E7C1A - _021E7A84 - 2 ; case 9
	.short _021E7C3E - _021E7A84 - 2 ; case 10
_021E7A9A:
	ldr r0, [sp, #0xc]
	mov r1, #0
	mov r2, #3
	mov r3, #0x80
	bl BgSetPosTextAndCommit
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	add r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7ABE:
	cmp r6, #0x1e
	blo _021E7B42
	mov r1, #1
	str r1, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x20
	mov r3, #0x3c
	bl ov60_021E6FD0
	mov r1, #1
	add r4, #0x18
	str r1, [sp]
	add r0, r4, #0
	mov r2, #0x20
	mov r3, #0x3c
	str r1, [sp, #4]
	bl ov60_021E6FD0
	add r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7AEE:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _021E7B42
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	beq _021E7B42
	add r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7B02:
	cmp r6, #0x14
	blo _021E7B42
	ldr r1, [r7, #4]
	mov r0, #1
	strb r0, [r1]
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r1, #0
	ldr r0, [sp, #0xc]
	mov r2, #3
	add r3, r1, #0
	bl BgSetPosTextAndCommit
	mov r0, #0
	str r0, [sp]
	ldr r0, _021E7C54 ; =0x04000050
	mov r1, #1
	mov r2, #0x20
	mov r3, #0x1f
	bl G2x_SetBlendAlpha_
	add r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7B3E:
	cmp r6, #0x6e
	bhs _021E7B44
_021E7B42:
	b _021E7C4C
_021E7B44:
	add r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7B4C:
	mov r0, #0xe
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
	ldr r0, [r7, #0x18]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7B6C:
	cmp r6, #1
	blo _021E7C4C
	mov r1, #1
	str r1, [sp]
	add r0, r4, #0
	mov r2, #0x1e
	mov r3, #0x50
	str r1, [sp, #4]
	bl ov60_021E6FD0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x18
	mov r1, #2
	mov r2, #0x1e
	mov r3, #0x50
	bl ov60_021E6FD0
	mov r0, #0x1f
	mvn r0, r0
	str r0, [sp]
	mov r0, #0xf0
	str r0, [sp, #4]
	add r1, r4, #0
	ldr r0, [sp, #0xc]
	add r1, #0x30
	mov r2, #1
	mov r3, #0
	bl ov60_021E7074
	mov r0, #0xf
	mvn r0, r0
	str r0, [sp]
	mov r0, #0xf0
	str r0, [sp, #4]
	add r4, #0x30
	ldr r0, [sp, #0xc]
	add r1, r4, #0
	mov r2, #2
	mov r3, #0
	bl ov60_021E7074
	ldr r0, [r7, #0x18]
	mov r1, #1
	bl ov60_021E6F28
	add r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7BD6:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _021E7C4C
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	beq _021E7C4C
	add r0, r4, #0
	add r0, #0x30
	mov r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E7C4C
	add r4, #0x30
	add r0, r4, #0
	mov r1, #2
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E7C4C
	add r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7C06:
	cmp r6, #0x80
	blo _021E7C4C
	ldr r0, [r7, #0x1c]
	mov r1, #1
	bl ov60_021E6F28
	add r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7C1A:
	cmp r6, #0x5a
	blo _021E7C4C
	mov r0, #0x41
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	mov r0, #0
	ldr r3, _021E7C58 ; =0x00007FFF
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	add r0, r5, #0
	bl ov60_021E7958
	b _021E7C4C
_021E7C3E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E7C4C
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E7C4C:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7C54: .word 0x04000050
_021E7C58: .word 0x00007FFF
	thumb_func_end ov60_021E7A50

	thumb_func_start ov60_021E7C5C
ov60_021E7C5C: ; 0x021E7C5C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl ov60_021E7688
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _021E7CC2
	add r0, r6, #0
	add r1, r5, #0
	bl ov60_021E8028
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #7
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #0
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	mov r0, #0
	strb r0, [r5, #1]
_021E7CC2:
	pop {r4, r5, r6, pc}
	thumb_func_end ov60_021E7C5C

	thumb_func_start ov60_021E7CC4
ov60_021E7CC4: ; 0x021E7CC4
	push {r3, r4, r5, lr}
	sub sp, #0xf0
	bl ov60_021E7688
	add r3, sp, #0xe0
	ldr r5, _021E7DE8 ; =_021EB044
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E7DEC ; =_021EB0C4
	add r3, sp, #0xc4
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
	ldr r5, _021E7DF0 ; =_021EB0E0
	add r3, sp, #0xa8
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
	ldr r5, _021E7DF4 ; =_021EB08C
	add r3, sp, #0x8c
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
	ldr r5, _021E7DF8 ; =_021EB070
	add r3, sp, #0x70
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
	ldr r5, _021E7DFC ; =_021EB0A8
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	mov r1, #0
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r5, _021E7E00 ; =_021EB0FC
	add r3, sp, #0x38
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
	ldr r5, _021E7E04 ; =_021EB054
	add r3, sp, #0x1c
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
	ldr r5, _021E7E08 ; =_021EB118
	add r3, sp, #0
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
	add sp, #0xf0
	pop {r3, r4, r5, pc}
	nop
_021E7DE8: .word _021EB044
_021E7DEC: .word _021EB0C4
_021E7DF0: .word _021EB0E0
_021E7DF4: .word _021EB08C
_021E7DF8: .word _021EB070
_021E7DFC: .word _021EB0A8
_021E7E00: .word _021EB0FC
_021E7E04: .word _021EB054
_021E7E08: .word _021EB118
	thumb_func_end ov60_021E7CC4

	thumb_func_start ov60_021E7E0C
ov60_021E7E0C: ; 0x021E7E0C
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #4
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharData
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #5
	add r2, r4, #0
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0xc
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnData
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0xd
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0xe
	add r2, r4, #0
	mov r3, #4
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
#ifdef HEARTGOLD
	mov r1, #6
#else
	mov r1, #8
#endif
	add r2, r4, #0
	mov r3, #7
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
#ifdef HEARTGOLD
	mov r1, #7
#else
	mov r1, #9
#endif
	add r2, r4, #0
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
#ifdef HEARTGOLD
	mov r1, #0xf
#else
	mov r1, #0x13
#endif
	add r2, r4, #0
	mov r3, #7
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
#ifdef HEARTGOLD
	mov r1, #0x12
#else
	mov r1, #0x16
#endif
	add r2, r4, #0
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
#ifdef HEARTGOLD
	mov r1, #0x11
#else
	mov r1, #0x15
#endif
	add r2, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
#ifdef HEARTGOLD
	mov r1, #0x10
#else
	mov r1, #0x14
#endif
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnData
	mov r0, #5
	lsl r0, r0, #6
	str r0, [sp]
	mov r0, #0x4a
#ifdef HEARTGOLD
	mov r1, #0
	str r0, [sp, #4]
	add r0, #0xbe
	mov r2, #4
	add r3, r1, #0
#else
	str r0, [sp, #4]
	add r0, #0xbe
	mov r1, #2
	mov r2, #4
	mov r3, #0
#endif
	bl GfGfxLoader_GXLoadPal
	mov r0, #5
	lsl r0, r0, #6
	str r0, [sp]
	mov r0, #0x4a
	mov r2, #0
	str r0, [sp, #4]
	add r0, #0xbe
#ifdef HEARTGOLD
	mov r1, #1
#else
	mov r1, #3
#endif
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0xf
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0xf
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl OS_WaitIrq
	bl GX_BothDispOn
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov60_021E7E0C

	thumb_func_start ov60_021E7F74
ov60_021E7F74: ; 0x021E7F74
	push {r3, lr}
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	mov r0, #1
	bl SetMasterBrightnessNeutral
	mov r0, #0
	bl SetMasterBrightnessNeutral
	pop {r3, pc}
	thumb_func_end ov60_021E7F74

	thumb_func_start ov60_021E7F94
ov60_021E7F94: ; 0x021E7F94
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r1, #0
	ldr r1, _021E8024 ; =_021EB134
	add r4, r0, #0
	bl ov60_021E6ED8
	add r0, r4, #0
	bl ov60_021E6F20
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	add r4, r0, #0
	ldr r0, [r4]
	add r1, #0xbe
#ifdef HEARTGOLD
	mov r2, #0x18
#else
	mov r2, #0x1C
#endif
	bl AddCharResObjFromNarc
	str r0, [r5, #8]
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	add r1, #0xbe
#ifdef HEARTGOLD
	mov r2, #0x17
#else
	mov r2, #0x1B
#endif
	mov r3, #0
	bl AddPlttResObjFromNarc
	str r0, [r5, #0xc]
	mov r3, #1
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #8]
	add r1, #0xbe
#ifdef HEARTGOLD
	mov r2, #0x1a
#else
	mov r2, #0x1E
#endif
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x10]
	mov r3, #1
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, #0xbe
#ifdef HEARTGOLD
	mov r2, #0x19
#else
	mov r2, #0x1D
#endif
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x14]
	ldr r0, [r5, #8]
	bl sub_0200ACF0
	ldr r0, [r5, #0xc]
	bl sub_0200AF94
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E8024: .word _021EB134
	thumb_func_end ov60_021E7F94

	thumb_func_start ov60_021E8028
ov60_021E8028: ; 0x021E8028
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x18]
	bl sub_02024758
	ldr r0, [r4, #0x1c]
	bl sub_02024758
	ldr r0, [r4, #8]
	bl sub_0200AEB0
	ldr r0, [r4, #0xc]
	bl sub_0200B0A8
	add r0, r5, #0
	bl ov60_021E6F00
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov60_021E8028

	thumb_func_start ov60_021E8050
ov60_021E8050: ; 0x021E8050
	push {r4, r5, lr}
	sub sp, #0x5c
	add r5, r0, #0
	add r0, sp, #8
	str r0, [sp]
	add r0, sp, #0x38
	str r0, [sp, #4]
	mov r0, #1
	add r4, r1, #0
	add r1, r5, #0
	add r2, r0, #0
	add r3, r0, #0
	bl ov60_021E6F3C
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x10]
	mov r0, #6
	lsl r0, r0, #0x10
	str r0, [sp, #0x14]
	add r0, sp, #8
	bl CreateSprite
	str r0, [r4, #0x18]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #8
	str r0, [sp]
	add r0, sp, #0x38
	str r0, [sp, #4]
	mov r0, #1
	add r1, r5, #0
	mov r2, #0
	add r3, r0, #0
	bl ov60_021E6F3C
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x10]
	mov r0, #6
	lsl r0, r0, #0x10
	str r0, [sp, #0x14]
	add r0, sp, #8
	bl CreateSprite
	str r0, [r4, #0x1c]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x1c]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, #0x1c]
	mov r1, #2
	bl sub_0202487C
	add sp, #0x5c
	pop {r4, r5, pc}
	thumb_func_end ov60_021E8050

	thumb_func_start ov60_021E80E0
ov60_021E80E0: ; 0x021E80E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov60_021E7698
	cmp r0, #0
	beq _021E80F2
	mov r0, #2
	strb r0, [r4]
_021E80F2:
	ldrb r0, [r4]
	cmp r0, #0
	beq _021E8102
	cmp r0, #1
	beq _021E8112
	cmp r0, #2
	beq _021E812E
	b _021E813A
_021E8102:
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E8150
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021E813A
_021E8112:
	add r0, r5, #0
	bl ov60_021E769C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E8240
	cmp r0, #0
	beq _021E813A
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021E813A
_021E812E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E85E0
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E813A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov60_021E80E0

	thumb_func_start ov60_021E8140
ov60_021E8140: ; 0x021E8140
	push {r3, lr}
	bl ov60_021E7688
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl OamManager_ApplyAndResetBuffers
	pop {r3, pc}
	thumb_func_end ov60_021E8140

	thumb_func_start ov60_021E8150
ov60_021E8150: ; 0x021E8150
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, _021E81CC ; =0x00007FFF
	mov r0, #0
	bl sub_0200FBF4
	ldr r1, _021E81CC ; =0x00007FFF
	mov r0, #1
	bl sub_0200FBF4
	add r0, r5, #0
	bl ov60_021E7688
	add r6, r0, #0
	bl sub_020216C8
	bl sub_02022638
	ldr r0, _021E81D0 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	add r0, r5, #0
	bl ov60_021E866C
	add r0, r5, #0
	bl ov60_021E76A0
	ldr r0, _021E81D4 ; =ov60_021E8140
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	bl ov60_021E8724
	mov r1, #0
	mov r0, #0xc0
	str r0, [sp]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov60_021E6FAC
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E87FC
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E8978
	add r0, r5, #0
	add r1, r6, #0
	bl ov60_021E81D8
	mov r0, #1
	strb r0, [r4, #1]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E81CC: .word 0x00007FFF
_021E81D0: .word gSystem + 0x60
_021E81D4: .word ov60_021E8140
	thumb_func_end ov60_021E8150

	thumb_func_start ov60_021E81D8
ov60_021E81D8: ; 0x021E81D8
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	bl ov60_021E768C
	add r4, r0, #0
	mov r0, #5
	lsl r0, r0, #6
	add r1, r4, #0
	str r0, [sp]
	mov r3, #0
	add r0, r5, #0
	add r1, #0x30
	mov r2, #1
	str r3, [sp, #4]
	bl ov60_021E7074
	mov r0, #0xc0
	mov r2, #0
	str r0, [sp]
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x30
	add r3, r2, #0
	str r2, [sp, #4]
	bl ov60_021E7074
	mov r0, #0x40
	str r0, [sp]
	sub r0, #0x41
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, #0x30
	mov r2, #2
	mov r3, #0
	bl ov60_021E7074
	mov r0, #0x40
	str r0, [sp]
	sub r0, #0x41
	add r4, #0x30
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #4
	mov r3, #0
	bl ov60_021E7074
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov60_021E81D8

	thumb_func_start ov60_021E8240
ov60_021E8240: ; 0x021E8240
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r4, r1, #0
	bl ov60_021E7688
	add r7, r0, #0
	add r0, r6, #0
	bl ov60_021E768C
	add r5, r0, #0
	add r0, r6, #0
	bl ov60_021E7978
	str r0, [sp, #0xc]
	add r0, r6, #0
	bl ov60_021E796C
	cmp r0, #7
	bls _021E826A
	b _021E85D8
_021E826A:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E8276: ; jump table
	.short _021E8286 - _021E8276 - 2 ; case 0
	.short _021E82A8 - _021E8276 - 2 ; case 1
	.short _021E8340 - _021E8276 - 2 ; case 2
	.short _021E83D4 - _021E8276 - 2 ; case 3
	.short _021E845E - _021E8276 - 2 ; case 4
	.short _021E84EA - _021E8276 - 2 ; case 5
	.short _021E8576 - _021E8276 - 2 ; case 6
	.short _021E85C8 - _021E8276 - 2 ; case 7
_021E8286:
	mov r0, #3
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	ldr r3, _021E85C0 ; =0x00007FFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	mov r0, #0
	strb r0, [r4, #3]
	add r0, r6, #0
	bl ov60_021E7958
	b _021E85D8
_021E82A8:
	ldrb r0, [r4, #3]
	cmp r0, #0xa
	bhs _021E82CA
	ldr r1, _021E85C4 ; =_021EB1CC
	lsl r0, r0, #2
	ldr r2, [r1, r0]
	ldr r1, [sp, #0xc]
	cmp r1, r2
	bne _021E82CA
	add r0, r4, r0
	ldr r0, [r0, #0x3c]
	mov r1, #1
	bl ov60_021E6F28
	ldrb r0, [r4, #3]
	add r0, r0, #1
	strb r0, [r4, #3]
_021E82CA:
	ldr r0, [sp, #0xc]
	cmp r0, #0x37
	bls _021E837C
	mov r0, #0xbf
	mvn r0, r0
	str r0, [sp]
	mov r0, #5
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, #0x30
	mov r2, #1
	mov r3, #0
	bl ov60_021E7120
	mov r0, #0xbf
	mvn r0, r0
	str r0, [sp]
	mov r0, #5
	add r5, #0x30
	mov r2, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r3, r2, #0
	bl ov60_021E7120
	mov r0, #5
	mov r1, #0
	str r0, [sp]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0xc0
	bl ov60_021E8AE0
	mov r0, #5
	str r0, [sp]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	mov r3, #0xc0
	bl ov60_021E8AE0
	mov r1, #0
	mov r0, #8
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	mov r0, #4
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
	add r0, r6, #0
	bl ov60_021E7958
	b _021E85D8
_021E8340:
	add r0, r5, #0
	add r0, #0x30
	mov r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E837C
	add r0, r5, #0
	add r0, #0x30
	mov r1, #0
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E837C
	add r0, r4, #0
	mov r1, #0
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E837C
	add r0, r4, #0
	mov r1, #1
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E837C
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _021E837E
_021E837C:
	b _021E85D8
_021E837E:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x5a
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, #0x30
	mov r2, #1
	mov r3, #0x20
	bl ov60_021E7120
	mov r2, #0
	add r5, #0x30
	str r2, [sp]
	mov r0, #0x5a
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	mov r3, #0x20
	bl ov60_021E7120
	mov r1, #0
	mov r0, #0x5a
	add r2, r1, #0
	str r0, [sp]
	add r0, r4, #0
	sub r2, #0x20
	add r3, r1, #0
	bl ov60_021E8AE0
	mov r1, #1
	mov r0, #0x5a
	add r2, r1, #0
	str r0, [sp]
	add r0, r4, #0
	sub r2, #0x21
	mov r3, #0
	bl ov60_021E8AE0
	add r0, r6, #0
	bl ov60_021E7958
	b _021E85D8
_021E83D4:
	add r0, r5, #0
	add r0, #0x30
	mov r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E8492
	add r0, r5, #0
	add r0, #0x30
	mov r1, #0
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E8492
	add r0, r4, #0
	mov r1, #0
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E8492
	add r0, r4, #0
	mov r1, #1
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E8492
	mov r0, #0
	str r0, [sp]
	mov r0, #7
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, #0x30
	mov r2, #1
	mov r3, #0x40
	bl ov60_021E7120
	mov r2, #0
	add r5, #0x30
	str r2, [sp]
	mov r0, #7
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	mov r3, #0x40
	bl ov60_021E7120
	mov r1, #0
	mov r0, #7
	add r2, r1, #0
	str r0, [sp]
	add r0, r4, #0
	sub r2, #0x40
	add r3, r1, #0
	bl ov60_021E8AE0
	mov r1, #1
	mov r0, #7
	add r2, r1, #0
	str r0, [sp]
	add r0, r4, #0
	sub r2, #0x41
	mov r3, #0
	bl ov60_021E8AE0
	add r0, r6, #0
	bl ov60_021E7958
	b _021E85D8
_021E845E:
	add r0, r5, #0
	add r0, #0x30
	mov r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E8492
	add r0, r5, #0
	add r0, #0x30
	mov r1, #0
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E8492
	add r0, r4, #0
	mov r1, #0
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E8492
	add r0, r4, #0
	mov r1, #1
	bl ov60_021E8B58
	cmp r0, #0
	bne _021E8494
_021E8492:
	b _021E85D8
_021E8494:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x42
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, #0x30
	mov r2, #1
	mov r3, #0x20
	bl ov60_021E7120
	mov r2, #0
	add r5, #0x30
	str r2, [sp]
	mov r0, #0x42
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	mov r3, #0x20
	bl ov60_021E7120
	mov r1, #0
	mov r0, #0x42
	add r2, r1, #0
	str r0, [sp]
	add r0, r4, #0
	sub r2, #0x20
	add r3, r1, #0
	bl ov60_021E8AE0
	mov r1, #1
	mov r0, #0x42
	add r2, r1, #0
	str r0, [sp]
	add r0, r4, #0
	sub r2, #0x21
	mov r3, #0
	bl ov60_021E8AE0
	add r0, r6, #0
	bl ov60_021E7958
	b _021E85D8
_021E84EA:
	add r0, r5, #0
	add r0, #0x30
	mov r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E85D8
	add r0, r5, #0
	add r0, #0x30
	mov r1, #0
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E85D8
	add r0, r4, #0
	mov r1, #0
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E85D8
	add r0, r4, #0
	mov r1, #1
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E85D8
	mov r0, #0x7f
	mvn r0, r0
	str r0, [sp]
	mov r0, #0xa
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, #0x30
	mov r2, #1
	mov r3, #0
	bl ov60_021E7120
	mov r0, #0x3f
	mvn r0, r0
	str r0, [sp]
	mov r0, #5
	add r5, #0x30
	mov r2, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r3, r2, #0
	bl ov60_021E7120
	mov r0, #0xa
	mov r1, #0
	str r0, [sp]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0x80
	bl ov60_021E8AE0
	mov r0, #0xa
	str r0, [sp]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	mov r3, #0x80
	bl ov60_021E8AE0
	add r0, r6, #0
	bl ov60_021E7958
	b _021E85D8
_021E8576:
	add r0, r5, #0
	add r0, #0x30
	mov r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E85D8
	add r5, #0x30
	add r0, r5, #0
	mov r1, #0
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E85D8
	add r0, r4, #0
	mov r1, #0
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E85D8
	add r0, r4, #0
	mov r1, #1
	bl ov60_021E8B58
	cmp r0, #0
	beq _021E85D8
	mov r1, #1
	add r0, r6, #0
	add r2, r1, #0
	mov r3, #8
	bl ov60_021E76F4
	add r0, r6, #0
	bl ov60_021E7958
	b _021E85D8
	nop
_021E85C0: .word 0x00007FFF
_021E85C4: .word _021EB1CC
_021E85C8:
	add r0, r6, #0
	bl ov60_021E77A0
	cmp r0, #0
	beq _021E85D8
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E85D8:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov60_021E8240

	thumb_func_start ov60_021E85E0
ov60_021E85E0: ; 0x021E85E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r6, r1, #0
	bl ov60_021E768C
	str r0, [sp, #4]
	ldr r0, [sp]
	bl ov60_021E7688
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _021E8666
	mov r4, #0
	add r7, r4, #0
_021E8608:
	mov r0, #0x28
	mul r0, r4
	add r5, r6, r0
	ldr r0, [r5, #0x6c]
	cmp r0, #0
	beq _021E861A
	bl DestroySysTask
	str r7, [r5, #0x6c]
_021E861A:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _021E8608
	ldr r0, [sp]
	add r1, r6, #0
	bl ov60_021E8914
	ldr r0, [sp, #4]
	mov r1, #4
	add r0, #0x30
	bl ov60_021E7324
	ldr r0, [sp, #4]
	mov r1, #2
	add r0, #0x30
	str r0, [sp, #4]
	bl ov60_021E7324
	ldr r0, [sp, #8]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [sp, #8]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [sp, #8]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [sp, #8]
	mov r1, #2
	bl FreeBgTilemapBuffer
	mov r0, #0
	strb r0, [r6, #1]
_021E8666:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov60_021E85E0

	thumb_func_start ov60_021E866C
ov60_021E866C: ; 0x021E866C
	push {r3, r4, r5, lr}
	sub sp, #0x80
	bl ov60_021E7688
	add r3, sp, #0x70
	ldr r5, _021E8710 ; =_021EB14C
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E8714 ; =_021EB15C
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
	ldr r5, _021E8718 ; =_021EB194
	add r3, sp, #0x38
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
	ldr r5, _021E871C ; =_021EB1B0
	add r3, sp, #0x1c
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
	ldr r5, _021E8720 ; =_021EB178
	add r3, sp, #0
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
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_021E8710: .word _021EB14C
_021E8714: .word _021EB15C
_021E8718: .word _021EB194
_021E871C: .word _021EB1B0
_021E8720: .word _021EB178
	thumb_func_end ov60_021E866C

	thumb_func_start ov60_021E8724
ov60_021E8724: ; 0x021E8724
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x21
	add r2, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x22
	add r2, r4, #0
	mov r3, #4
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x23
	add r2, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x24
	add r2, r4, #0
	mov r3, #4
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x25
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnData
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x26
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x80
	str r0, [sp]
	mov r0, #0x4a
	mov r2, #0
	str r0, [sp, #4]
	add r0, #0xbe
	mov r1, #0x20
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x80
	str r0, [sp]
	mov r0, #0x4a
	str r0, [sp, #4]
	add r0, #0xbe
	mov r1, #0x1f
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #1
	add r1, r0, #0
	bl OS_WaitIrq
	bl GX_BothDispOn
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov60_021E8724

	thumb_func_start ov60_021E87FC
ov60_021E87FC: ; 0x021E87FC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r1, #0
	ldr r1, _021E8910 ; =_021EB138
	add r4, r0, #0
	bl ov60_021E6ED8
	add r0, r4, #0
	bl ov60_021E6F20
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4]
	add r1, #0xbe
	mov r2, #0x4e
	mov r3, #1
	bl AddCharResObjFromNarc
	str r0, [r5, #4]
	mov r3, #0
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	add r1, #0xbe
	mov r2, #0x4d
	bl AddPlttResObjFromNarc
	str r0, [r5, #8]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #8]
	add r1, #0xbe
	mov r2, #0x50
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0xc]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, #0xbe
	mov r2, #0x4f
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r2, #0x4a
	add r1, r2, #0
	str r0, [r5, #0x10]
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	str r2, [sp, #8]
	ldr r0, [r4]
	add r1, #0xbe
	bl AddCharResObjFromNarc
	str r0, [r5, #0x14]
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	add r1, #0xbe
	mov r2, #0x49
	mov r3, #0
	bl AddPlttResObjFromNarc
	str r0, [r5, #0x18]
	mov r3, #1
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #8]
	add r1, #0xbe
	mov r2, #0x4c
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x1c]
	mov r3, #1
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, #0xbe
	mov r2, #0x4b
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x20]
	mov r4, #0
_021E88E0:
	lsl r0, r4, #4
	add r6, r5, r0
	ldr r0, [r6, #4]
	bl sub_0200ACF0
	ldr r0, [r6, #8]
	bl sub_0200AF94
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _021E88E0
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E8910: .word _021EB138
	thumb_func_end ov60_021E87FC

	thumb_func_start ov60_021E8914
ov60_021E8914: ; 0x021E8914
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5, #0x24]
	bl sub_02024758
	ldr r0, [r5, #0x28]
	bl sub_02024758
	ldr r0, [r5, #0x2c]
	bl sub_02024758
	ldr r0, [r5, #0x30]
	bl sub_02024758
	ldr r0, [r5, #0x34]
	bl sub_02024758
	ldr r0, [r5, #0x38]
	bl sub_02024758
	mov r4, #0
_021E8940:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x3c]
	bl sub_02024758
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0xa
	blo _021E8940
	mov r4, #0
_021E8956:
	lsl r0, r4, #4
	add r6, r5, r0
	ldr r0, [r6, #4]
	bl sub_0200AEB0
	ldr r0, [r6, #8]
	bl sub_0200B0A8
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _021E8956
	add r0, r7, #0
	bl ov60_021E6F00
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E8914

	thumb_func_start ov60_021E8978
ov60_021E8978: ; 0x021E8978
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	ldr r3, _021E8AD8 ; =_021EB140
	add r5, r1, #0
	str r0, [sp, #8]
	add r2, sp, #0xc
	mov r1, #0xa
_021E8986:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _021E8986
	add r0, sp, #0x18
	str r0, [sp]
	add r0, sp, #0x48
	str r0, [sp, #4]
	mov r0, #0
	ldr r1, [sp, #8]
	add r2, r0, #0
	mov r3, #3
	bl ov60_021E6F3C
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x20]
	mov r0, #3
	lsl r0, r0, #0x12
	str r0, [sp, #0x24]
	mov r4, #0
	add r7, sp, #0xc
_021E89B6:
	lsl r0, r4, #2
	add r6, r5, r0
	add r0, sp, #0x18
	bl CreateSprite
	str r0, [r6, #0x3c]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r6, #0x3c]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldrb r1, [r7, r4]
	ldr r0, [r6, #0x3c]
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0xa
	blo _021E89B6
	add r0, sp, #0x18
	str r0, [sp]
	add r0, sp, #0x48
	str r0, [sp, #4]
	mov r0, #1
	ldr r1, [sp, #8]
	add r2, r0, #0
	add r3, r0, #0
	bl ov60_021E6F3C
	mov r0, #1
	lsl r0, r0, #0x12
	str r0, [sp, #0x20]
	ldr r0, _021E8ADC ; =0xFFFA0000
	str r0, [sp, #0x24]
	add r0, sp, #0x18
	bl CreateSprite
	str r0, [r5, #0x24]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x24]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x24]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x18
	bl CreateSprite
	str r0, [r5, #0x2c]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x2c]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x2c]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x18
	bl CreateSprite
	str r0, [r5, #0x34]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x34]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x34]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x18
	str r0, [sp]
	add r0, sp, #0x48
	str r0, [sp, #4]
	mov r0, #1
	ldr r1, [sp, #8]
	add r2, r0, #0
	add r3, r0, #0
	bl ov60_021E6F3C
	mov r0, #5
	lsl r0, r0, #0x12
	str r0, [sp, #0x20]
	ldr r0, _021E8ADC ; =0xFFFA0000
	str r0, [sp, #0x24]
	add r0, sp, #0x18
	bl CreateSprite
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x28]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x28]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x28]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x18
	bl CreateSprite
	str r0, [r5, #0x30]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x30]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x30]
	mov r1, #4
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x18
	bl CreateSprite
	str r0, [r5, #0x38]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x38]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x38]
	mov r1, #5
	bl Set2dSpriteAnimSeqNo
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E8AD8: .word _021EB140
_021E8ADC: .word 0xFFFA0000
	thumb_func_end ov60_021E8978

	thumb_func_start ov60_021E8AE0
ov60_021E8AE0: ; 0x021E8AE0
	push {r4, r5, r6, lr}
	add r5, r2, #0
	add r6, r3, #0
	cmp r1, #0
	bne _021E8AFA
	add r4, r0, #0
	ldr r1, [r0, #0x24]
	add r4, #0x64
	str r1, [r4, #0x1c]
	ldr r1, [r0, #0x2c]
	str r1, [r4, #0x20]
	ldr r0, [r0, #0x34]
	b _021E8B08
_021E8AFA:
	add r4, r0, #0
	ldr r1, [r0, #0x28]
	add r4, #0x8c
	str r1, [r4, #0x1c]
	ldr r1, [r0, #0x30]
	str r1, [r4, #0x20]
	ldr r0, [r0, #0x38]
_021E8B08:
	str r0, [r4, #0x24]
	ldr r0, [r4]
	cmp r0, #0
	beq _021E8B14
	bl GF_AssertFail
_021E8B14:
	mov r0, #1
	str r0, [r4]
	ldr r0, [sp, #0x10]
	strh r0, [r4, #4]
	mov r0, #0
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	ldr r0, [r4, #0x1c]
	bl sub_020248AC
	ldr r2, [r0]
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	str r1, [r4, #0x14]
	ldr r1, [r0, #4]
	mov r2, #0
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	str r0, [r4, #0x18]
	str r5, [r4, #0xc]
	ldr r0, _021E8B54 ; =ov60_021E8B7C
	add r1, r4, #0
	str r6, [r4, #0x10]
	bl CreateSysTask
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
	nop
_021E8B54: .word ov60_021E8B7C
	thumb_func_end ov60_021E8AE0

	thumb_func_start ov60_021E8B58
ov60_021E8B58: ; 0x021E8B58
	cmp r1, #0
	bne _021E8B60
	add r0, #0x64
	b _021E8B62
_021E8B60:
	add r0, #0x8c
_021E8B62:
	ldr r1, [r0]
	cmp r1, #0
	bne _021E8B6C
	mov r0, #1
	bx lr
_021E8B6C:
	ldrb r0, [r0, #7]
	cmp r0, #0
	beq _021E8B76
	mov r0, #1
	bx lr
_021E8B76:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov60_021E8B58

	thumb_func_start ov60_021E8B7C
ov60_021E8B7C: ; 0x021E8B7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r1, sp, #4
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldrb r0, [r5, #6]
	add r0, r0, #1
	strb r0, [r5, #6]
	mov r0, #4
	ldrb r4, [r5, #6]
	ldrsh r6, [r5, r0]
	ldr r1, [r5, #0xc]
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	ldr r1, [r5, #0x10]
	add r7, r0, #0
	add r0, r1, #0
	mul r0, r4
	add r1, r6, #0
	bl _s32_div_f
	ldr r1, [r5, #0x14]
	add r1, r7, r1
	str r1, [sp]
	ldr r1, [r5, #0x18]
	add r7, r0, r1
	cmp r4, r6
	blt _021E8BD0
	ldr r0, [r5, #8]
	bl DestroySysTask
	mov r1, #0
	str r1, [r5, #8]
	mov r0, #1
	strb r0, [r5, #7]
	str r1, [r5]
_021E8BD0:
	ldr r0, [sp]
	add r1, sp, #4
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	lsl r0, r7, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, #0x1c]
	bl sub_020247D4
	ldr r0, [r5, #0x20]
	add r1, sp, #4
	bl sub_020247D4
	ldr r0, [r5, #0x24]
	add r1, sp, #4
	bl sub_020247D4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov60_021E8B7C

	thumb_func_start ov60_021E8BF8
ov60_021E8BF8: ; 0x021E8BF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov60_021E7698
	cmp r0, #0
	beq _021E8C0A
	mov r0, #2
	strb r0, [r4]
_021E8C0A:
	ldrb r0, [r4]
	cmp r0, #0
	beq _021E8C1A
	cmp r0, #1
	beq _021E8C2A
	cmp r0, #2
	beq _021E8C46
	b _021E8C52
_021E8C1A:
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E8C68
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021E8C52
_021E8C2A:
	add r0, r5, #0
	bl ov60_021E769C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E8D38
	cmp r0, #0
	beq _021E8C52
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021E8C52
_021E8C46:
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E94A0
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E8C52:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov60_021E8BF8

	thumb_func_start ov60_021E8C58
ov60_021E8C58: ; 0x021E8C58
	push {r3, lr}
	bl ov60_021E7688
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl OamManager_ApplyAndResetBuffers
	pop {r3, pc}
	thumb_func_end ov60_021E8C58

	thumb_func_start ov60_021E8C68
ov60_021E8C68: ; 0x021E8C68
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	bl ov60_021E7688
	add r6, r0, #0
	bl sub_020216C8
	bl sub_02022638
	ldr r0, _021E8CF8 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	add r0, r5, #0
	bl ov60_021E9580
	add r0, r5, #0
	bl ov60_021E76A0
	ldr r0, _021E8CFC ; =ov60_021E8C58
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	add r1, r4, #0
	bl ov60_021E9638
	mov r1, #0
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov60_021E6FAC
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E9768
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E98C0
	mov r0, #4
	str r0, [sp]
	ldr r0, _021E8D00 ; =ov60_021E9BFC
	mov r1, #0
	str r0, [sp, #4]
	mov r0, #0x4a
	mov r2, #1
	add r3, r1, #0
	bl GF_3DVramMan_Create
	mov r1, #0x6f
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov60_021E99B8
	add r0, r4, #0
	add r1, r6, #0
	bl ov60_021E8D04
	mov r0, #1
	strb r0, [r4, #1]
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021E8CF8: .word gSystem + 0x60
_021E8CFC: .word ov60_021E8C58
_021E8D00: .word ov60_021E9BFC
	thumb_func_end ov60_021E8C68

	thumb_func_start ov60_021E8D04
ov60_021E8D04: ; 0x021E8D04
	push {r3, lr}
	ldr r0, [r0, #0x64]
	mov r1, #1
	bl ov60_021E6F28
	mov r0, #6
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #0
	add r1, r0, #0
	bl BG_SetMaskColor
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	pop {r3, pc}
	thumb_func_end ov60_021E8D04

	thumb_func_start ov60_021E8D38
ov60_021E8D38: ; 0x021E8D38
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #8
	add r6, r0, #0
	add r5, r1, #0
	bl ov60_021E7688
	add r7, r0, #0
	add r0, r6, #0
	bl ov60_021E768C
	add r4, r0, #0
	add r0, r6, #0
	bl ov60_021E7978
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ov60_021E9B60
	add r0, r6, #0
	bl ov60_021E796C
	cmp r0, #0x17
	bhi _021E8DEA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E8D74: ; jump table
	.short _021E8DA4 - _021E8D74 - 2 ; case 0
	.short _021E8DC6 - _021E8D74 - 2 ; case 1
	.short _021E8DE0 - _021E8D74 - 2 ; case 2
	.short _021E8E12 - _021E8D74 - 2 ; case 3
	.short _021E8E2C - _021E8D74 - 2 ; case 4
	.short _021E8E5C - _021E8D74 - 2 ; case 5
	.short _021E8E76 - _021E8D74 - 2 ; case 6
	.short _021E8E90 - _021E8D74 - 2 ; case 7
	.short _021E8EA4 - _021E8D74 - 2 ; case 8
	.short _021E8EB6 - _021E8D74 - 2 ; case 9
	.short _021E8F08 - _021E8D74 - 2 ; case 10
	.short _021E8F38 - _021E8D74 - 2 ; case 11
	.short _021E8FBE - _021E8D74 - 2 ; case 12
	.short _021E9016 - _021E8D74 - 2 ; case 13
	.short _021E9070 - _021E8D74 - 2 ; case 14
	.short _021E90B6 - _021E8D74 - 2 ; case 15
	.short _021E90F4 - _021E8D74 - 2 ; case 16
	.short _021E910C - _021E8D74 - 2 ; case 17
	.short _021E918E - _021E8D74 - 2 ; case 18
	.short _021E920C - _021E8D74 - 2 ; case 19
	.short _021E9278 - _021E8D74 - 2 ; case 20
	.short _021E936E - _021E8D74 - 2 ; case 21
	.short _021E93D8 - _021E8D74 - 2 ; case 22
	.short _021E9460 - _021E8D74 - 2 ; case 23
_021E8DA4:
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov60_021E9C84
	add r0, r6, #0
	mov r1, #0
	mov r2, #1
	mov r3, #8
	bl ov60_021E76F4
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8DC6:
	ldr r0, [sp, #0x10]
	cmp r0, #0x28
	bls _021E8DEA
	add r0, r6, #0
	mov r1, #3
	mov r2, #1
	mov r3, #8
	bl ov60_021E76F4
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8DE0:
	add r0, r6, #0
	bl ov60_021E77A0
	cmp r0, #0
	bne _021E8DEC
_021E8DEA:
	b _021E9476
_021E8DEC:
	add r0, r6, #0
	mov r1, #2
	mov r2, #1
	mov r3, #8
	bl ov60_021E76F4
	mov r0, #0x1d
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov60_021E9C84
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8E12:
	ldr r0, [sp, #0x10]
	cmp r0, #0x2e
	bls _021E8F0E
	add r0, r6, #0
	mov r1, #3
	mov r2, #1
	mov r3, #8
	bl ov60_021E76F4
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8E2C:
	add r0, r6, #0
	bl ov60_021E77A0
	cmp r0, #0
	beq _021E8F0E
	add r0, r6, #0
	mov r1, #2
	mov r2, #1
	mov r3, #8
	bl ov60_021E76F4
	mov r0, #0x1d
	mov r1, #2
	lsl r0, r0, #4
	str r1, [r5, r0]
	ldr r0, [r5, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov60_021E9C84
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8E5C:
	ldr r0, [sp, #0x10]
	cmp r0, #0x62
	bls _021E8F0E
	add r0, r6, #0
	mov r1, #3
	mov r2, #1
	mov r3, #8
	bl ov60_021E76F4
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8E76:
	add r0, r6, #0
	bl ov60_021E77A0
	cmp r0, #0
	beq _021E8F0E
	mov r0, #0x1d
	ldr r1, _021E91A8 ; =0x0000FFFF
	lsl r0, r0, #4
	str r1, [r5, r0]
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8E90:
	add r0, r6, #0
	mov r1, #2
	mov r2, #0
	mov r3, #8
	bl ov60_021E76F4
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8EA4:
	add r0, r6, #0
	bl ov60_021E77A0
	cmp r0, #0
	beq _021E8F0E
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8EB6:
	ldr r3, _021E91AC ; =_021EB250
	add r2, sp, #0x1f8
	ldmia r3!, {r0, r1}
	add r4, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldrb r2, [r5, #3]
	lsl r0, r2, #2
	ldr r1, [r4, r0]
	ldr r0, [sp, #0x10]
	cmp r0, r1
	blt _021E8F0E
	add r0, r2, #1
	strb r0, [r5, #3]
	ldrb r0, [r5, #3]
	mov r1, #4
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r3, [r0, #0x24]
	add r0, r7, #0
	add r2, r3, #0
	ldr r3, [r3, #8]
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	add r0, r7, #0
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	ldrb r0, [r5, #3]
	cmp r0, #3
	blo _021E8F0E
	ldr r0, [r5, #0x64]
	mov r1, #0
	bl ov60_021E6F28
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8F08:
	ldr r0, [sp, #0x10]
	cmp r0, #0xa
	bhs _021E8F10
_021E8F0E:
	b _021E9476
_021E8F10:
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r3, [r5, #0x34]
	add r0, r7, #0
	add r2, r3, #0
	ldr r3, [r3, #8]
	mov r1, #4
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	add r0, r7, #0
	mov r1, #4
	bl ScheduleBgTilemapBufferTransfer
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8F38:
	ldr r0, [sp, #0x10]
	cmp r0, #5
	bne _021E8F60
	ldr r3, _021E91B0 ; =_021EB3C8
	add r2, sp, #0x1cc
	mov r5, #5
_021E8F44:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E8F44
	ldr r0, [r3]
	mov r1, #5
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x1cc
	bl ov60_021E7398
_021E8F60:
	ldr r0, [sp, #0x10]
	cmp r0, #0x2c
	blo _021E9024
	ldr r3, _021E91B4 ; =_021EB3F4
	add r2, sp, #0x1a0
	mov r5, #5
_021E8F6C:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E8F6C
	ldr r0, [r3]
	mov r1, #7
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x1a0
	bl ov60_021E7398
	ldr r2, _021E91B8 ; =0x04001000
	mov r3, #0xff
	ldr r1, [r2]
	ldr r0, _021E91BC ; =0xFFFF1FFF
	add r4, #0x30
	and r1, r0
	lsr r0, r2, #0xd
	orr r0, r1
	str r0, [r2]
	mov r0, #0
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #4
	mvn r3, r3
	bl ov60_021E7074
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineBToggleLayers
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E8FBE:
	add r0, r4, #0
	add r0, #0x30
	mov r1, #4
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9024
	ldr r3, _021E91C0 ; =_021EB420
	add r2, sp, #0x174
	mov r5, #5
_021E8FD2:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E8FD2
	ldr r0, [r3]
	mov r1, #7
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x174
	bl ov60_021E7398
	mov r0, #0
	mov r2, #5
	str r0, [sp]
	mov r0, #7
	add r4, #0x30
	add r3, r2, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	add r3, #0xfb
	bl ov60_021E7074
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E9016:
	add r0, r4, #0
	add r0, #0x30
	mov r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	bne _021E9026
_021E9024:
	b _021E9476
_021E9026:
	ldr r3, _021E91C4 ; =_021EB44C
	add r2, sp, #0x148
	mov r5, #5
_021E902C:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E902C
	ldr r0, [r3]
	mov r1, #1
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x148
	bl ov60_021E7398
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	add r4, #0x30
	mov r3, #0xff
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #6
	mvn r3, r3
	bl ov60_021E7074
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E9070:
	add r4, #0x30
	add r0, r4, #0
	mov r1, #6
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E912E
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _021E91BC ; =0xFFFF1FFF
	ldr r3, _021E91B8 ; =0x04001000
	and r2, r1
	str r2, [r0]
	ldr r2, [r3]
	lsr r0, r0, #0xc
	and r1, r2
	str r1, [r3]
	mov r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x29
	add r2, r7, #0
	mov r3, #7
	bl GfGfxLoader_LoadCharData
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E90B6:
	ldr r0, [sp, #0x10]
	cmp r0, #0x2a
	blo _021E912E
	ldr r5, _021E91C8 ; =_021EB478
	add r3, sp, #0x11c
	mov r2, #5
_021E90C2:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E90C2
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x11c
	bl ov60_021E7398
	ldr r2, _021E91B8 ; =0x04001000
	ldr r0, _021E91BC ; =0xFFFF1FFF
	ldr r1, [r2]
	and r1, r0
	lsr r0, r2, #0xd
	orr r0, r1
	str r0, [r2]
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E90F4:
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #0
	bl ov60_021E7434
	cmp r0, #0
	beq _021E912E
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E910C:
	ldr r0, [sp, #0x10]
	cmp r0, #0x38
	bne _021E911A
	ldr r0, [r5, #0x68]
	mov r1, #1
	bl ov60_021E6F28
_021E911A:
	ldr r0, [sp, #0x10]
	cmp r0, #0x91
	bne _021E9128
	ldr r0, [r5, #0x6c]
	mov r1, #1
	bl ov60_021E6F28
_021E9128:
	ldr r0, [sp, #0x10]
	cmp r0, #0x91
	bhs _021E9130
_021E912E:
	b _021E9476
_021E9130:
	ldr r3, _021E91CC ; =_021EB4A4
	add r2, sp, #0xf0
	mov r5, #5
_021E9136:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E9136
	ldr r0, [r3]
	mov r1, #0xa
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0xf0
	bl ov60_021E7398
	ldr r1, _021E91D0 ; =0x000046B9
	ldr r0, _021E91D4 ; =0x04001042
	add r4, #0x30
	strh r1, [r0]
	ldr r1, _021E91D8 ; =0x000040C0
	strh r1, [r0, #4]
	ldrh r2, [r0, #6]
	ldr r1, _021E91DC ; =0xFFFFC0FF
	and r2, r1
	mov r1, #0x1d
	lsl r1, r1, #8
	orr r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	strh r1, [r0, #6]
	mov r0, #0
	mov r2, #5
	str r0, [sp]
	mov r0, #0xa
	add r3, r2, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	sub r3, #0x79
	bl ov60_021E7074
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E918E:
	add r0, r4, #0
	add r0, #0x30
	mov r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9294
	mov r0, #2
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r5, _021E91E0 ; =_021EB4D0
	b _021E91E4
	.balign 4, 0
_021E91A8: .word 0x0000FFFF
_021E91AC: .word _021EB250
_021E91B0: .word _021EB3C8
_021E91B4: .word _021EB3F4
_021E91B8: .word 0x04001000
_021E91BC: .word 0xFFFF1FFF
_021E91C0: .word _021EB420
_021E91C4: .word _021EB44C
_021E91C8: .word _021EB478
_021E91CC: .word _021EB4A4
_021E91D0: .word 0x000046B9
_021E91D4: .word 0x04001042
_021E91D8: .word 0x000040C0
_021E91DC: .word 0xFFFFC0FF
_021E91E0: .word _021EB4D0
_021E91E4:
	add r3, sp, #0xc4
	mov r2, #5
_021E91E8:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E91E8
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	add r2, r1, #0
	add r3, sp, #0xc4
	bl ov60_021E7398
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E920C:
	ldr r0, [r5, #0x70]
	mov r1, #1
	bl ov60_021E6F28
	ldr r0, [sp, #0x10]
	cmp r0, #0xa
	blo _021E9294
	ldr r3, _021E9480 ; =_021EB4FC
	add r2, sp, #0x98
	mov r5, #5
_021E9220:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E9220
	ldr r0, [r3]
	mov r1, #0xa
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x98
	bl ov60_021E7398
	ldr r1, _021E9484 ; =0x000046B9
	ldr r0, _021E9488 ; =0x04001042
	add r4, #0x30
	strh r1, [r0]
	ldr r1, _021E948C ; =0x00004080
	strh r1, [r0, #4]
	ldrh r2, [r0, #6]
	ldr r1, _021E9490 ; =0xFFFFC0FF
	and r2, r1
	mov r1, #0x19
	lsl r1, r1, #8
	orr r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	strh r1, [r0, #6]
	mov r0, #0
	mov r2, #6
	str r0, [sp]
	mov r0, #0xa
	add r3, r2, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	sub r3, #0x7a
	bl ov60_021E7074
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E9278:
	add r0, r4, #0
	add r0, #0x30
	mov r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9294
	add r0, r4, #0
	add r0, #0x30
	mov r1, #6
	bl ov60_021E72FC
	cmp r0, #0
	bne _021E9296
_021E9294:
	b _021E9476
_021E9296:
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #5
	ldr r2, _021E9494 ; =_021EB528
	add r3, sp, #0x6c
	mov ip, r0
_021E92A6:
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	mov r0, ip
	sub r0, r0, #1
	mov ip, r0
	bne _021E92A6
	ldr r0, [r2]
	mov r1, #0
	str r0, [r3]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	add r2, r1, #0
	add r3, sp, #0x6c
	bl ov60_021E7398
	ldr r3, [r5, #0x38]
	add r0, r7, #0
	add r2, r3, #0
	ldr r3, [r3, #8]
	mov r1, #5
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r3, [r5, #0x3c]
	add r0, r7, #0
	add r2, r3, #0
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r3, [r5, #0x40]
	add r0, r7, #0
	add r2, r3, #0
	ldr r3, [r3, #8]
	mov r1, #7
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	add r0, r7, #0
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add r0, r7, #0
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r7, #0
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	mov r2, #0
	add r0, r7, #0
	mov r1, #5
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r7, #0
	mov r1, #5
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r2, #0
	add r0, r7, #0
	mov r1, #6
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r7, #0
	mov r1, #6
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r2, #0
	add r0, r7, #0
	mov r1, #7
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r7, #0
	mov r1, #7
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E936E:
	ldr r0, [r5, #0x74]
	mov r1, #1
	bl ov60_021E6F28
	ldr r0, [sp, #0x10]
	cmp r0, #0x1e
	blo _021E9476
	ldr r3, _021E9498 ; =_021EB370
	add r2, sp, #0x40
	mov r5, #5
_021E9382:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E9382
	ldr r0, [r3]
	mov r1, #0xa
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x40
	bl ov60_021E7398
	ldr r1, _021E9484 ; =0x000046B9
	ldr r0, _021E9488 ; =0x04001042
	add r4, #0x30
	strh r1, [r0]
	ldr r1, _021E948C ; =0x00004080
	mov r3, #0x74
	strh r1, [r0, #4]
	ldrh r2, [r0, #6]
	ldr r1, _021E9490 ; =0xFFFFC0FF
	and r2, r1
	mov r1, #0x1e
	lsl r1, r1, #8
	orr r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	strh r1, [r0, #6]
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #4
	bl ov60_021E7074
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E93D8:
	add r0, r4, #0
	add r0, #0x30
	mov r1, #4
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9476
	mov r0, #1
	mov r1, #0
	bl GX_EngineBToggleLayers
	ldr r3, _021E949C ; =_021EB39C
	add r2, sp, #0x14
	mov r5, #5
_021E93F4:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _021E93F4
	ldr r0, [r3]
	mov r1, #0xfd
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r4, r0
	mov r2, #0
	add r3, sp, #0x14
	bl ov60_021E7398
	mov r0, #0x2f
	mvn r0, r0
	str r0, [sp]
	mov r0, #0xfe
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, #0x30
	mov r2, #5
	mov r3, #0
	bl ov60_021E7074
	mov r0, #0x1f
	mvn r0, r0
	str r0, [sp]
	mov r0, #0xfe
	add r1, r4, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, #0x30
	mov r2, #6
	mov r3, #0
	bl ov60_021E7074
	mov r0, #7
	mvn r0, r0
	str r0, [sp]
	mov r0, #0xfe
	add r4, #0x30
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #7
	mov r3, #0
	bl ov60_021E7074
	add r0, r6, #0
	bl ov60_021E7958
	b _021E9476
_021E9460:
	add r4, #0x30
	add r0, r4, #0
	mov r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9476
	add sp, #0x1fc
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E9476:
	mov r0, #0
	add sp, #0x1fc
	add sp, #8
	pop {r4, r5, r6, r7, pc}
	nop
_021E9480: .word _021EB4FC
_021E9484: .word 0x000046B9
_021E9488: .word 0x04001042
_021E948C: .word 0x00004080
_021E9490: .word 0xFFFFC0FF
_021E9494: .word _021EB528
_021E9498: .word _021EB370
_021E949C: .word _021EB39C
	thumb_func_end ov60_021E8D38

	thumb_func_start ov60_021E94A0
ov60_021E94A0: ; 0x021E94A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r7, r1, #0
	bl ov60_021E7688
	str r0, [sp, #4]
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _021E957C
	bl sub_02023148
	add r0, r7, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_02023120
	mov r0, #0
	str r0, [sp, #8]
_021E94CE:
	ldr r1, [sp, #8]
	mov r0, #0x68
	mul r0, r1
	mov r5, #0
	add r6, r7, r0
_021E94D8:
	lsl r4, r5, #2
	add r1, r6, r4
	mov r0, #7
	add r1, #0xe4
	lsl r0, r0, #6
	ldr r1, [r1]
	add r0, r7, r0
	bl NNS_G3dFreeAnmObj
	add r0, r6, r4
	add r0, #0xdc
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _021E94D8
	add r6, #0xd8
	ldr r0, [r6]
	bl FreeToHeap
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	cmp r0, #3
	blo _021E94CE
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl GF_3DVramMan_Delete
	mov r4, #0
_021E9520:
	lsl r0, r4, #2
	add r0, r7, r0
	ldr r0, [r0, #4]
	bl FreeToHeap
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E9520
	mov r4, #0
_021E9536:
	lsl r0, r4, #2
	add r0, r7, r0
	ldr r0, [r0, #0x18]
	bl FreeToHeap
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _021E9536
	ldr r0, [r7, #0x14]
	bl FreeToHeap
	ldr r0, [sp]
	add r1, r7, #0
	bl ov60_021E9878
	ldr r0, [sp, #4]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [sp, #4]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [sp, #4]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [sp, #4]
	mov r1, #7
	bl FreeBgTilemapBuffer
	mov r0, #0
	strb r0, [r7, #1]
_021E957C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E94A0

	thumb_func_start ov60_021E9580
ov60_021E9580: ; 0x021E9580
	push {r3, r4, r5, lr}
	sub sp, #0x80
	bl ov60_021E7688
	add r3, sp, #0x70
	ldr r5, _021E9624 ; =_021EB268
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021E9628 ; =_021EB2DC
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
	ldr r5, _021E962C ; =_021EB2F8
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
	ldr r5, _021E9630 ; =_021EB314
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
	ldr r5, _021E9634 ; =_021EB330
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
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_021E9624: .word _021EB268
_021E9628: .word _021EB2DC
_021E962C: .word _021EB2F8
_021E9630: .word _021EB314
_021E9634: .word _021EB330
	thumb_func_end ov60_021E9580

	thumb_func_start ov60_021E9638
ov60_021E9638: ; 0x021E9638
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r3, _021E9760 ; =_021EB288
	str r0, [sp, #0x10]
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x20
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r3, _021E9764 ; =_021EB25C
	add r2, sp, #0x14
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #0x28
	str r0, [r2]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0xbe
	mov r3, #4
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0xbe
	mov r1, #0x2e
	mov r3, #7
	bl GfGfxLoader_LoadScrnData
	add r7, r6, #0
	mov r4, #0
	add r7, #0x24
_021E9692:
	mov r0, #0x4a
	lsl r5, r4, #2
	str r0, [sp]
	add r1, sp, #0x20
	ldr r1, [r1, r5]
	add r0, #0xbe
	mov r2, #1
	add r3, r7, r5
	bl GfGfxLoader_GetScrnData
	add r1, r6, r5
	str r0, [r1, #4]
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E9692
	add r7, r6, #0
	mov r5, #0
	add r7, #0x38
_021E96BA:
	mov r0, #0x4a
	lsl r4, r5, #2
	str r0, [sp]
	add r1, sp, #0x14
	ldr r1, [r1, r4]
	add r0, #0xbe
	mov r2, #1
	add r3, r7, r4
	bl GfGfxLoader_GetScrnData
	add r1, r6, r4
	str r0, [r1, #0x18]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _021E96BA
	mov r0, #0x4a
	add r3, r6, #0
	str r0, [sp]
	add r0, #0xbe
	mov r1, #0x2f
	mov r2, #1
	add r3, #0x34
	bl GfGfxLoader_GetScrnData
	str r0, [r6, #0x14]
	ldr r3, [r6, #0x24]
	mov r0, #0
	str r0, [sp]
	add r2, r3, #0
	ldr r0, [sp, #0x10]
	ldr r3, [r3, #8]
	mov r1, #4
	add r2, #0xc
	bl BgCopyOrUncompressTilemapBufferRangeToVram
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0xbe
	mov r1, #0x30
	mov r3, #5
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, #0xbe
	mov r1, #0x31
	mov r3, #6
	bl GfGfxLoader_LoadScrnData
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0x4a
	str r0, [sp, #4]
	add r0, #0xbe
	mov r1, #0x27
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #1
	add r1, r0, #0
	bl OS_WaitIrq
	bl GX_BothDispOn
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E9760: .word _021EB288
_021E9764: .word _021EB25C
	thumb_func_end ov60_021E9638

	thumb_func_start ov60_021E9768
ov60_021E9768: ; 0x021E9768
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r1, #0
	ldr r1, _021E9874 ; =_021EB1F4
	add r4, r0, #0
	bl ov60_021E6ED8
	add r0, r4, #0
	bl ov60_021E6F20
	add r4, r0, #0
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4]
	add r1, #0xbe
	mov r2, #0x42
	mov r3, #1
	bl AddCharResObjFromNarc
	str r0, [r5, #0x44]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	add r1, #0xbe
	mov r2, #0x41
	mov r3, #0
	bl AddPlttResObjFromNarc
	str r0, [r5, #0x48]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #8]
	add r1, #0xbe
	mov r2, #0x44
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x4c]
	mov r0, #2
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, #0xbe
	mov r2, #0x43
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x50]
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4]
	add r1, #0xbe
	mov r2, #0x46
	mov r3, #1
	bl AddCharResObjFromNarc
	str r0, [r5, #0x54]
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	add r1, #0xbe
	mov r2, #0x45
	mov r3, #0
	bl AddPlttResObjFromNarc
	str r0, [r5, #0x58]
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #8]
	add r1, #0xbe
	mov r2, #0x48
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x5c]
	mov r0, #3
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r4, #0xc]
	add r1, #0xbe
	mov r2, #0x47
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x60]
	mov r4, #0
_021E984E:
	lsl r0, r4, #4
	add r6, r5, r0
	ldr r0, [r6, #0x44]
	bl sub_0200ACF0
	ldr r0, [r6, #0x48]
	bl sub_0200AF94
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _021E984E
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E9874: .word _021EB1F4
	thumb_func_end ov60_021E9768

	thumb_func_start ov60_021E9878
ov60_021E9878: ; 0x021E9878
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5, #0x64]
	bl sub_02024758
	ldr r0, [r5, #0x68]
	bl sub_02024758
	ldr r0, [r5, #0x6c]
	bl sub_02024758
	ldr r0, [r5, #0x70]
	bl sub_02024758
	ldr r0, [r5, #0x74]
	bl sub_02024758
	mov r4, #0
_021E989E:
	lsl r0, r4, #4
	add r6, r5, r0
	ldr r0, [r6, #0x44]
	bl sub_0200AEB0
	ldr r0, [r6, #0x48]
	bl sub_0200B0A8
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _021E989E
	add r0, r7, #0
	bl ov60_021E6F00
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov60_021E9878

	thumb_func_start ov60_021E98C0
ov60_021E98C0: ; 0x021E98C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x78
	ldr r3, _021E99B0 ; =_021EB214
	str r0, [sp, #8]
	add r5, r1, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x18
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021E99B4 ; =_021EB220
	str r0, [r2]
	ldmia r3!, {r0, r1}
	add r2, sp, #0xc
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r1, [sp, #8]
	str r0, [r2]
	add r0, sp, #0x24
	str r0, [sp]
	add r0, sp, #0x54
	str r0, [sp, #4]
	mov r0, #2
	mov r2, #0
	add r3, r0, #0
	bl ov60_021E6F3C
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x2c]
	mov r0, #0x26
	lsl r0, r0, #0x10
	str r0, [sp, #0x30]
	add r0, sp, #0x24
	bl CreateSprite
	str r0, [r5, #0x64]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x64]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x64]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x24
	str r0, [sp]
	add r0, sp, #0x54
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	mov r0, #3
	mov r2, #0
	mov r3, #2
	bl ov60_021E6F3C
	mov r0, #2
	lsl r0, r0, #0x10
	str r0, [sp, #0x2c]
	mov r0, #0x26
	lsl r0, r0, #0x10
	str r0, [sp, #0x30]
	add r0, sp, #0x24
	bl CreateSprite
	str r0, [r5, #0x68]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x68]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x68]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	mov r7, #0
	add r6, sp, #0x18
	add r4, sp, #0xc
_021E9962:
	add r0, sp, #0x24
	str r0, [sp]
	add r0, sp, #0x54
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	mov r0, #3
	mov r2, #0
	mov r3, #2
	bl ov60_021E6F3C
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x2c]
	ldr r0, [r6]
	lsl r0, r0, #0xc
	str r0, [sp, #0x30]
	add r0, sp, #0x24
	bl CreateSprite
	str r0, [r5, #0x6c]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x6c]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x6c]
	ldr r1, [r4]
	bl Set2dSpriteAnimSeqNo
	add r7, r7, #1
	add r6, r6, #4
	add r5, r5, #4
	add r4, r4, #4
	cmp r7, #3
	blt _021E9962
	add sp, #0x78
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E99B0: .word _021EB214
_021E99B4: .word _021EB220
	thumb_func_end ov60_021E98C0

	thumb_func_start ov60_021E99B8
ov60_021E99B8: ; 0x021E99B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp, #0xc]
	mov r0, #0x42
	lsl r0, r0, #2
	mov r1, #0x4a
	bl NARC_ctor
	str r0, [sp, #0x18]
	mov r1, #7
	ldr r0, [sp, #0xc]
	lsl r1, r1, #6
	add r0, r0, r1
	mov r1, #0x4a
	mov r2, #4
	bl GF_ExpHeap_FndInitAllocator
	mov r0, #0
	str r0, [sp, #0x1c]
_021E99DE:
	ldr r0, [sp, #0x1c]
	mov r1, #0x68
	add r7, r0, #0
	mul r7, r1
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	lsl r2, r1, #2
	ldr r1, _021E9B44 ; =_021EB22C
	ldr r1, [r1, r2]
	mov r2, #0x4a
	bl NARC_AllocAndReadWholeMember
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0xc]
	add r1, r1, r7
	add r1, #0xd8
	str r0, [r1]
	ldr r0, [sp, #0xc]
	add r2, #0xd8
	add r0, #0x84
	add r0, r0, r7
	add r1, sp, #0x28
	add r2, r2, r7
	bl sub_0201F51C
	ldr r0, [sp, #0xc]
	add r0, r0, r7
	add r0, #0xd8
	ldr r0, [r0]
	bl NNS_G3dGetTex
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x28]
	mov r1, #0
	mov r2, #0x40
	bl NNSi_G3dModifyMatFlag
	ldr r0, [sp, #0x28]
	mov r1, #0
	mov r2, #0x80
	bl NNSi_G3dModifyMatFlag
	mov r2, #2
	ldr r0, [sp, #0x28]
	mov r1, #0
	lsl r2, r2, #8
	bl NNSi_G3dModifyMatFlag
	mov r2, #1
	ldr r0, [sp, #0x28]
	mov r1, #0
	lsl r2, r2, #0xa
	bl NNSi_G3dModifyMatFlag
	ldr r0, [sp, #0x28]
	mov r1, #0
	mov r2, #0xf
	bl NNSi_G3dModifyPolygonAttrMask
	ldr r0, [sp, #0x1c]
	ldr r1, _021E9B48 ; =_021EB2C4
	lsl r0, r0, #3
	add r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	mov r6, #0
	add r5, r0, r7
	str r0, [sp, #0x20]
	add r0, #0x84
	str r0, [sp, #0x20]
_021E9A6A:
	ldr r1, [sp, #0x10]
	lsl r4, r6, #2
	ldr r0, [sp, #0x18]
	ldr r1, [r1, r4]
	mov r2, #0x4a
	bl NARC_AllocAndReadWholeMember
	add r1, r5, r4
	add r1, #0xdc
	str r0, [r1]
	add r0, r5, r4
	add r0, #0xdc
	ldr r0, [r0]
	mov r1, #0
	bl NNS_G3dGetAnmByIdx
	str r0, [sp, #0x24]
	mov r0, #7
	ldr r1, [sp, #0xc]
	lsl r0, r0, #6
	add r0, r1, r0
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	bl NNS_G3dAllocAnmObj
	add r1, r5, r4
	add r1, #0xe4
	str r0, [r1]
	add r0, r5, r4
	add r0, #0xe4
	ldr r0, [r0]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x14]
	bl NNS_G3dAnmObjInit
	add r1, r5, r4
	ldr r0, [sp, #0x20]
	add r1, #0xe4
	ldr r1, [r1]
	add r0, r0, r7
	bl NNS_G3dRenderObjAddAnmObj
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #2
	blo _021E9A6A
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	cmp r0, #3
	blo _021E99DE
	ldr r0, [sp, #0x18]
	bl NARC_dtor
	mov r0, #0x4a
	bl GF_Camera_Create
	ldr r1, [sp, #0xc]
	add r3, sp, #0x2c
	add r1, #0x80
	ldr r4, _021E9B4C ; =_021EB238
	str r0, [r1]
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	ldr r1, _021E9B50 ; =0x0019AEC1
	str r0, [r3]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r3, _021E9B54 ; =0x000005C1
	add r0, #0x80
	ldr r0, [r0]
	str r0, [sp, #8]
	add r0, r2, #0
	ldr r2, _021E9B58 ; =_021EB29C
	bl GF_Camera_InitFromTargetDistanceAndAngle
	ldr r1, [sp, #0xc]
	ldr r0, _021E9B5C ; =0x00000981
	add r1, #0x80
	ldr r1, [r1]
	bl GF_Camera_SetPerspectiveAngle
	ldr r0, [sp, #0xc]
	add r0, #0x80
	str r0, [sp, #0xc]
	ldr r0, [r0]
	bl GF_Camera_RegisterToStaticPtr
	mov r0, #0x1f
	str r0, [sp]
	mov r0, #2
	lsl r0, r0, #0xe
	mov r1, #0
	str r0, [sp, #4]
	mov r0, #5
	mov r2, #2
	add r3, r1, #0
	bl NNS_G3dGlbPolygonAttr
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E9B44: .word _021EB22C
_021E9B48: .word _021EB2C4
_021E9B4C: .word _021EB238
_021E9B50: .word 0x0019AEC1
_021E9B54: .word 0x000005C1
_021E9B58: .word _021EB29C
_021E9B5C: .word 0x00000981
	thumb_func_end ov60_021E99B8

	thumb_func_start ov60_021E9B60
ov60_021E9B60: ; 0x021E9B60
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	ldr r4, _021E9BF0 ; =_021EB34C
	add r5, r0, #0
	add r3, sp, #0x18
	mov r2, #4
_021E9B6C:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E9B6C
	ldr r0, [r4]
	add r2, sp, #0xc
	str r0, [r3]
	ldr r3, _021E9BF4 ; =_021EB244
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0
	str r0, [r2]
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r4, [r5, r0]
	ldr r0, _021E9BF8 ; =0x0000FFFF
	cmp r4, r0
	beq _021E9BEC
	bl sub_02026E48
	bl sub_02023154
	lsl r0, r4, #0x18
	lsr r1, r0, #0x18
	mov r4, #1
	mov r0, #0x68
	add r7, r1, #0
	mul r7, r0
	mov r2, #0
	add r3, r5, r7
	lsl r4, r4, #0xc
_021E9BB4:
	lsl r0, r2, #2
	add r0, r3, r0
	add r0, #0xe4
	ldr r1, [r0]
	ldr r6, [r1, #8]
	ldr r0, [r1]
	ldrh r6, [r6, #4]
	add r0, r0, r4
	lsl r6, r6, #0xc
	cmp r0, r6
	bge _021E9BCC
	str r0, [r1]
_021E9BCC:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #2
	blo _021E9BB4
	add r5, #0x84
	add r0, r5, r7
	add r1, sp, #0
	add r2, sp, #0x18
	add r3, sp, #0xc
	bl Draw3dModel
	mov r0, #0
	mov r1, #1
	bl sub_02026E50
_021E9BEC:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E9BF0: .word _021EB34C
_021E9BF4: .word _021EB244
_021E9BF8: .word 0x0000FFFF
	thumb_func_end ov60_021E9B60

	thumb_func_start ov60_021E9BFC
ov60_021E9BFC: ; 0x021E9BFC
	push {r3, lr}
	ldr r0, _021E9C68 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	strh r2, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _021E9C6C ; =0xFFFFCFFD
	and r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	add r2, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _021E9C70 ; =0x0000CFFB
	and r2, r3
	strh r2, [r0]
	add r2, r1, #2
	ldrh r3, [r0]
	add r1, r1, #2
	and r3, r2
	mov r2, #8
	orr r2, r3
	strh r2, [r0]
	ldrh r2, [r0]
	and r2, r1
	mov r1, #0x20
	orr r1, r2
	strh r1, [r0]
	ldr r0, _021E9C74 ; =_021EB278
	bl G3X_SetEdgeColorTable
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _021E9C78 ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _021E9C7C ; =0xBFFF0000
	ldr r0, _021E9C80 ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	nop
_021E9C68: .word 0x04000008
_021E9C6C: .word 0xFFFFCFFD
_021E9C70: .word 0x0000CFFB
_021E9C74: .word _021EB278
_021E9C78: .word 0x00007FFF
_021E9C7C: .word 0xBFFF0000
_021E9C80: .word 0x04000580
	thumb_func_end ov60_021E9BFC

	thumb_func_start ov60_021E9C84
ov60_021E9C84: ; 0x021E9C84
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [sp]
	mov r1, #0x30
	mul r1, r0
	ldr r2, _021E9CF0 ; =_021EB554
	lsl r0, r0, #3
	add r6, r2, r1
	ldr r1, _021E9CF4 ; =_021EB2AC
	mov r4, #0
	add r5, r1, r0
	mov r7, #0xc
_021E9C9C:
	add r1, r4, #0
	mul r1, r7
	add r3, r6, r1
	ldr r2, [r3, #4]
	ldr r1, [r6, r1]
	ldr r3, [r3, #8]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	add r0, r4, #0
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl NNS_G3dGlbLightVector
	lsl r1, r4, #1
	ldrh r1, [r5, r1]
	add r0, r4, #0
	bl NNS_G3dGlbLightColor
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021E9C9C
	ldr r0, [sp]
	ldr r1, _021E9CF8 ; =_021EB208
	lsl r4, r0, #1
	ldr r0, _021E9CFC ; =_021EB202
	ldrh r1, [r1, r4]
	ldrh r0, [r0, r4]
	mov r2, #0
	bl NNS_G3dGlbMaterialColorDiffAmb
	ldr r0, _021E9D00 ; =_021EB1FC
	ldr r1, _021E9D04 ; =_021EB20E
	ldrh r0, [r0, r4]
	ldrh r1, [r1, r4]
	mov r2, #0
	bl NNS_G3dGlbMaterialColorSpecEmi
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E9CF0: .word _021EB554
_021E9CF4: .word _021EB2AC
_021E9CF8: .word _021EB208
_021E9CFC: .word _021EB202
_021E9D00: .word _021EB1FC
_021E9D04: .word _021EB20E
	thumb_func_end ov60_021E9C84

	thumb_func_start ov60_021E9D08
ov60_021E9D08: ; 0x021E9D08
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov60_021E7698
	cmp r0, #0
	beq _021E9D1A
	mov r0, #2
	strb r0, [r4]
_021E9D1A:
	ldrb r0, [r4]
	cmp r0, #0
	beq _021E9D2A
	cmp r0, #1
	beq _021E9D3A
	cmp r0, #2
	beq _021E9D56
	b _021E9D62
_021E9D2A:
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E9D78
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021E9D62
_021E9D3A:
	add r0, r5, #0
	bl ov60_021E769C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021E9E84
	cmp r0, #0
	beq _021E9D62
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021E9D62
_021E9D56:
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021EA21C
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E9D62:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov60_021E9D08

	thumb_func_start ov60_021E9D68
ov60_021E9D68: ; 0x021E9D68
	push {r3, lr}
	bl ov60_021E7688
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl OamManager_ApplyAndResetBuffers
	pop {r3, pc}
	thumb_func_end ov60_021E9D68

	thumb_func_start ov60_021E9D78
ov60_021E9D78: ; 0x021E9D78
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	bl ov60_021E7688
	add r6, r0, #0
	bl sub_020216C8
	bl sub_02022638
	ldr r0, _021E9E6C ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	add r0, r5, #0
	bl ov60_021EA2A0
	add r0, r5, #0
	bl ov60_021E76A0
	ldr r0, _021E9E70 ; =ov60_021E9D68
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	add r1, r4, #0
	bl ov60_021EA3A0
	mov r1, #0
	mov r0, #1
	lsl r0, r0, #8
	str r0, [sp]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov60_021E6FAC
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021EA508
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021EA700
	mov r0, #4
	str r0, [sp]
	ldr r0, _021E9E74 ; =ov60_021EA918
	mov r1, #0
	str r0, [sp, #4]
	mov r0, #0x4a
	mov r2, #1
	add r3, r1, #0
	bl GF_3DVramMan_Create
	str r0, [r4, #0x5c]
	bl sub_02014DA0
	mov r1, #0x12
	mov r0, #0x4a
	lsl r1, r1, #0xa
	bl AllocFromHeap
	str r0, [r4, #0x60]
	mov r0, #1
	str r0, [sp]
	mov r0, #0x4a
	str r0, [sp, #4]
	mov r3, #0x12
	ldr r0, _021E9E78 ; =ov60_021EA828
	ldr r1, _021E9E7C ; =ov60_021EA84C
	ldr r2, [r4, #0x60]
	lsl r3, r3, #0xa
	bl sub_02014DB4
	str r0, [r4, #0x64]
	bl sub_02015524
	add r2, r0, #0
	mov r0, #1
	mov r1, #0xe1
	lsl r0, r0, #0xc
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	mov r0, #0x3b
	mov r1, #4
	mov r2, #0x4a
	bl sub_02015264
	add r1, r0, #0
	ldr r0, [r4, #0x64]
	mov r2, #0xa
	mov r3, #1
	bl sub_0201526C
	add r0, r5, #0
	add r1, r6, #0
	bl ov60_021EA4AC
	mov r1, #0
	ldr r0, _021E9E80 ; =0x04000050
	mov r2, #0x3e
	add r3, r1, #0
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	mov r0, #1
	strb r0, [r4, #1]
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021E9E6C: .word gSystem + 0x60
_021E9E70: .word ov60_021E9D68
_021E9E74: .word ov60_021EA918
_021E9E78: .word ov60_021EA828
_021E9E7C: .word ov60_021EA84C
_021E9E80: .word 0x04000050
	thumb_func_end ov60_021E9D78

	thumb_func_start ov60_021E9E84
ov60_021E9E84: ; 0x021E9E84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xc0
	add r6, r0, #0
	add r4, r1, #0
	bl ov60_021E7688
	str r0, [sp, #0xc]
	add r0, r6, #0
	bl ov60_021E768C
	add r5, r0, #0
	add r0, r6, #0
	bl ov60_021E7978
	add r7, r0, #0
	add r0, r6, #0
	bl ov60_021E796C
	cmp r0, #0x14
	bls _021E9EAE
	b _021EA1FA
_021E9EAE:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E9EBA: ; jump table
	.short _021E9EE4 - _021E9EBA - 2 ; case 0
	.short _021E9F04 - _021E9EBA - 2 ; case 1
	.short _021E9F14 - _021E9EBA - 2 ; case 2
	.short _021E9FAE - _021E9EBA - 2 ; case 3
	.short _021E9FD2 - _021E9EBA - 2 ; case 4
	.short _021E9FE0 - _021E9EBA - 2 ; case 5
	.short _021EA05A - _021E9EBA - 2 ; case 6
	.short _021EA0B2 - _021E9EBA - 2 ; case 7
	.short _021EA0C2 - _021E9EBA - 2 ; case 8
	.short _021EA0D2 - _021E9EBA - 2 ; case 9
	.short _021EA0E6 - _021E9EBA - 2 ; case 10
	.short _021EA0F6 - _021E9EBA - 2 ; case 11
	.short _021EA106 - _021E9EBA - 2 ; case 12
	.short _021EA116 - _021E9EBA - 2 ; case 13
	.short _021EA128 - _021E9EBA - 2 ; case 14
	.short _021EA138 - _021E9EBA - 2 ; case 15
	.short _021EA148 - _021E9EBA - 2 ; case 16
	.short _021EA158 - _021E9EBA - 2 ; case 17
	.short _021EA182 - _021E9EBA - 2 ; case 18
	.short _021EA1D4 - _021E9EBA - 2 ; case 19
	.short _021EA1EA - _021E9EBA - 2 ; case 20
_021E9EE4:
	mov r0, #0xa
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #9
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021E9F04:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E9FD6
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021E9F14:
	ldr r3, _021EA204 ; =_021EB73C
	add r2, sp, #0x94
	mov r7, #5
_021E9F1A:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r7, r7, #1
	bne _021E9F1A
	ldr r0, [r3]
	mov r1, #0xa
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r5, r0
	mov r2, #0
	add r3, sp, #0x94
	bl ov60_021E7398
	ldr r3, _021EA208 ; =_021EB768
	add r2, sp, #0x68
	mov r7, #5
_021E9F3C:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r7, r7, #1
	bne _021E9F3C
	ldr r0, [r3]
	mov r1, #0xa
	str r0, [r2]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r5, r0
	mov r2, #1
	add r3, sp, #0x68
	bl ov60_021E7398
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r1, r5, #0
	ldr r0, [sp, #0xc]
	add r1, #0x30
	mov r2, #5
	mov r3, #0xc0
	bl ov60_021E7074
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	mov r2, #1
	str r0, [sp, #4]
	add r5, #0x30
	add r3, r2, #0
	ldr r0, [sp, #0xc]
	add r1, r5, #0
	sub r3, #0xc1
	bl ov60_021E7074
	ldr r0, [r4, #0x44]
	mov r1, #1
	bl ov60_021E6F28
	ldr r0, [r4, #0x48]
	mov r1, #1
	bl ov60_021E6F28
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021E9FAE:
	add r0, r5, #0
	add r0, #0x30
	mov r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9FD6
	add r5, #0x30
	add r0, r5, #0
	mov r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021E9FD6
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021E9FD2:
	cmp r7, #0x19
	bhi _021E9FD8
_021E9FD6:
	b _021EA1FA
_021E9FD8:
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021E9FE0:
	ldr r4, _021EA20C ; =_021EB794
	add r3, sp, #0x3c
	mov r2, #5
_021E9FE6:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E9FE6
	ldr r0, [r4]
	mov r1, #0xa
	str r0, [r3]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r5, r0
	mov r2, #0
	add r3, sp, #0x3c
	bl ov60_021E7398
	ldr r4, _021EA210 ; =_021EB710
	add r3, sp, #0x10
	mov r2, #5
_021EA008:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021EA008
	ldr r0, [r4]
	mov r1, #0xa
	str r0, [r3]
	mov r0, #0x11
	lsl r0, r0, #4
	add r0, r5, r0
	mov r2, #1
	add r3, sp, #0x10
	bl ov60_021E7398
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r1, r5, #0
	ldr r0, [sp, #0xc]
	add r1, #0x30
	mov r2, #5
	mov r3, #0xc0
	bl ov60_021E7074
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	mov r2, #1
	str r0, [sp, #4]
	add r5, #0x30
	add r3, r2, #0
	ldr r0, [sp, #0xc]
	add r1, r5, #0
	sub r3, #0xc1
	bl ov60_021E7074
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA05A:
	add r0, r5, #0
	add r0, #0x30
	mov r1, #5
	bl ov60_021E72FC
	cmp r0, #0
	beq _021EA0DC
	add r5, #0x30
	add r0, r5, #0
	mov r1, #1
	bl ov60_021E72FC
	cmp r0, #0
	beq _021EA0DC
	ldr r0, [r4, #0x44]
	mov r1, #0
	bl ov60_021E6F28
	ldr r0, [r4, #0x48]
	mov r1, #0
	bl ov60_021E6F28
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021EA214 ; =0xFFFF1FFF
	and r1, r0
	str r1, [r2]
	ldr r2, _021EA218 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA0B2:
	ldr r0, [r4, #0x50]
	mov r1, #1
	bl ov60_021E6F28
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA0C2:
	add r0, r4, #0
	mov r1, #0
	bl ov60_021EA8C8
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA0D2:
	ldr r0, [r4, #0x64]
	bl sub_020154B0
	cmp r0, #0
	beq _021EA0DE
_021EA0DC:
	b _021EA1FA
_021EA0DE:
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA0E6:
	add r0, r4, #0
	mov r1, #0
	bl ov60_021EA990
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA0F6:
	ldr r0, [r4, #0x54]
	mov r1, #1
	bl ov60_021E6F28
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA106:
	add r0, r4, #0
	mov r1, #1
	bl ov60_021EA8C8
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA116:
	ldr r0, [r4, #0x64]
	bl sub_020154B0
	cmp r0, #0
	bne _021EA1FA
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA128:
	add r0, r4, #0
	mov r1, #1
	bl ov60_021EA990
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA138:
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl ov60_021E6F28
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA148:
	add r0, r4, #0
	mov r1, #2
	bl ov60_021EA8C8
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA158:
	ldr r0, [r4, #0x64]
	bl sub_020154B0
	cmp r0, #0
	bne _021EA1FA
	mov r0, #0x1a
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #8
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA182:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EA1FA
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r5, #0
	add r7, r5, #0
_021EA1B6:
	lsl r0, r5, #2
	add r0, r4, r0
	ldr r0, [r0, #0x50]
	add r1, r7, #0
	bl ov60_021E6F28
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _021EA1B6
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA1D4:
	mov r0, #0
	bl SetMasterBrightnessNeutral
	ldr r0, [r4, #0x4c]
	mov r1, #1
	bl ov60_021E6F28
	add r0, r6, #0
	bl ov60_021E7958
	b _021EA1FA
_021EA1EA:
	ldr r0, [r4, #0x4c]
	bl sub_02024B68
	cmp r0, #0
	bne _021EA1FA
	add sp, #0xc0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EA1FA:
	bl ov60_021EA8B0
	mov r0, #0
	add sp, #0xc0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA204: .word _021EB73C
_021EA208: .word _021EB768
_021EA20C: .word _021EB794
_021EA210: .word _021EB710
_021EA214: .word 0xFFFF1FFF
_021EA218: .word 0x04001000
	thumb_func_end ov60_021E9E84

	thumb_func_start ov60_021EA21C
ov60_021EA21C: ; 0x021EA21C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl ov60_021E7688
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _021EA28A
	ldr r0, _021EA29C ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r5, #0x64]
	bl sub_02014EBC
	ldr r0, [r5, #0x60]
	bl FreeToHeap
	ldr r0, [r5, #0x5c]
	bl GF_3DVramMan_Delete
	add r0, r6, #0
	add r1, r5, #0
	bl ov60_021EA6AC
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
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #7
	bl FreeBgTilemapBuffer
	mov r0, #0
	strb r0, [r5, #1]
_021EA28A:
	ldr r0, [r5, #0x6c]
	cmp r0, #0
	beq _021EA298
	bl DestroySysTask
	mov r0, #0
	str r0, [r5, #0x6c]
_021EA298:
	pop {r4, r5, r6, pc}
	nop
_021EA29C: .word 0x04000050
	thumb_func_end ov60_021EA21C

	thumb_func_start ov60_021EA2A0
ov60_021EA2A0: ; 0x021EA2A0
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	bl ov60_021E7688
	add r3, sp, #0xa8
	ldr r5, _021EA384 ; =_021EB634
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021EA388 ; =_021EB644
	add r3, sp, #0x8c
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
	ldr r5, _021EA38C ; =_021EB660
	add r3, sp, #0x70
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
	ldr r5, _021EA390 ; =_021EB67C
	add r3, sp, #0x54
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
	ldr r5, _021EA394 ; =_021EB698
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
	ldr r5, _021EA398 ; =_021EB6B4
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	add r0, r4, #0
	mov r1, #6
	mov r3, #0
	bl InitBgFromTemplate
	ldr r5, _021EA39C ; =_021EB6D0
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
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	nop
_021EA384: .word _021EB634
_021EA388: .word _021EB644
_021EA38C: .word _021EB660
_021EA390: .word _021EB67C
_021EA394: .word _021EB698
_021EA398: .word _021EB6B4
_021EA39C: .word _021EB6D0
	thumb_func_end ov60_021EA2A0

	thumb_func_start ov60_021EA3A0
ov60_021EA3A0: ; 0x021EA3A0
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x36
	add r2, r4, #0
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x36
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x3a
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x37
	add r2, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x38
	add r2, r4, #0
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x39
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x37
	add r2, r4, #0
	mov r3, #6
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x38
	add r2, r4, #0
	mov r3, #7
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x80
	str r0, [sp]
	mov r0, #0x4a
	mov r2, #0
	str r0, [sp, #4]
	add r0, #0xbe
	mov r1, #0x35
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x80
	str r0, [sp]
	mov r0, #0x4a
	str r0, [sp, #4]
	add r0, #0xbe
	mov r1, #0x35
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #1
	add r1, r0, #0
	bl OS_WaitIrq
	bl GX_BothDispOn
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov60_021EA3A0

	thumb_func_start ov60_021EA4AC
ov60_021EA4AC: ; 0x021EA4AC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	bl ov60_021E768C
	add r4, r0, #0
	mov r0, #0
	mov r2, #5
	str r0, [sp]
	add r1, r4, #0
	add r3, r2, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, #0x30
	sub r3, #0xc5
	bl ov60_021E7074
	mov r0, #0
	str r0, [sp]
	add r4, #0x30
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	mov r3, #0xc0
	bl ov60_021E7074
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov60_021EA4AC

	thumb_func_start ov60_021EA508
ov60_021EA508: ; 0x021EA508
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	ldr r3, _021EA694 ; =_021EB610
	add r4, r0, #0
	str r1, [sp, #0x10]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x48
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021EA698 ; =_021EB5EC
	str r0, [r2]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x3c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021EA69C ; =_021EB604
	str r0, [r2]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x30
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021EA6A0 ; =_021EB628
	str r0, [r2]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x24
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _021EA6A4 ; =_021EB5F8
	str r0, [r2]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x18
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r1, _021EA6A8 ; =_021EB5E4
	str r0, [r2]
	add r0, r4, #0
	bl ov60_021E6ED8
	add r0, r4, #0
	bl ov60_021E6F20
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r7]
	add r1, #0xbe
	mov r2, #0x52
	mov r3, #1
	bl AddCharResObjFromNarc
	ldr r1, [sp, #0x10]
	mov r3, #0
	str r0, [r1, #4]
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r1, #0x4a
	str r1, [sp, #0xc]
	ldr r0, [r7, #4]
	add r1, #0xbe
	mov r2, #0x51
	bl AddPlttResObjFromNarc
	ldr r1, [sp, #0x10]
	mov r2, #0x54
	str r0, [r1, #8]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r7, #8]
	add r1, #0xbe
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	ldr r1, [sp, #0x10]
	mov r2, #0x53
	str r0, [r1, #0xc]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	ldr r0, [r7, #0xc]
	add r1, #0xbe
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	ldr r1, [sp, #0x10]
	str r0, [r1, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
_021EA5D2:
	ldr r0, [sp, #0x14]
	add r2, sp, #0x3c
	lsl r6, r0, #2
	add r0, sp, #0x18
	ldr r4, [r0, r6]
	ldr r0, [sp, #0x14]
	mov r3, #1
	lsl r1, r0, #4
	ldr r0, [sp, #0x10]
	str r4, [sp]
	add r5, r0, r1
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	mov r1, #0x42
	ldr r0, [r7]
	ldr r2, [r2, r6]
	lsl r1, r1, #2
	bl AddCharResObjFromNarc
	str r0, [r5, #0x14]
	mov r1, #0x42
	str r4, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r2, sp, #0x48
	ldr r0, [r7, #4]
	ldr r2, [r2, r6]
	lsl r1, r1, #2
	mov r3, #0
	bl AddPlttResObjFromNarc
	str r0, [r5, #0x18]
	mov r1, #0x42
	str r4, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	add r2, sp, #0x24
	ldr r0, [r7, #8]
	ldr r2, [r2, r6]
	lsl r1, r1, #2
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x1c]
	mov r1, #0x42
	str r4, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	add r2, sp, #0x30
	ldr r0, [r7, #0xc]
	ldr r2, [r2, r6]
	lsl r1, r1, #2
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	str r0, [r5, #0x20]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	cmp r0, #3
	blo _021EA5D2
	mov r4, #0
_021EA664:
	ldr r0, [sp, #0x10]
	lsl r1, r4, #4
	add r5, r0, r1
	ldr r0, [r5, #4]
	bl sub_0200ACF0
	ldr r0, [r5, #8]
	bl sub_0200AF94
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021EA664
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021EA694: .word _021EB610
_021EA698: .word _021EB5EC
_021EA69C: .word _021EB604
_021EA6A0: .word _021EB628
_021EA6A4: .word _021EB5F8
_021EA6A8: .word _021EB5E4
	thumb_func_end ov60_021EA508

	thumb_func_start ov60_021EA6AC
ov60_021EA6AC: ; 0x021EA6AC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5, #0x44]
	bl sub_02024758
	ldr r0, [r5, #0x48]
	bl sub_02024758
	ldr r0, [r5, #0x4c]
	bl sub_02024758
	mov r4, #0
_021EA6C6:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x50]
	bl sub_02024758
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _021EA6C6
	mov r4, #0
_021EA6DC:
	lsl r0, r4, #4
	add r6, r5, r0
	ldr r0, [r6, #4]
	bl sub_0200AEB0
	ldr r0, [r6, #8]
	bl sub_0200B0A8
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _021EA6DC
	add r0, r7, #0
	bl ov60_021E6F00
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov60_021EA6AC

	thumb_func_start ov60_021EA700
ov60_021EA700: ; 0x021EA700
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x68
	ldr r3, _021EA824 ; =_021EB61C
	add r7, r0, #0
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #8
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r7, #0
	str r0, [r2]
	add r0, sp, #0x14
	str r0, [sp]
	add r0, sp, #0x44
	str r0, [sp, #4]
	mov r0, #0
	add r2, r0, #0
	mov r3, #2
	bl ov60_021E6F3C
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x1c]
	mov r0, #0x16
	lsl r0, r0, #0x10
	str r0, [sp, #0x20]
	add r0, sp, #0x14
	bl CreateSprite
	str r0, [r6, #0x44]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r6, #0x44]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r6, #0x44]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x14
	str r0, [sp]
	add r0, sp, #0x44
	str r0, [sp, #4]
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	mov r3, #1
	bl ov60_021E6F3C
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x1c]
	mov r0, #6
	lsl r0, r0, #0x10
	str r0, [sp, #0x20]
	add r0, sp, #0x14
	bl CreateSprite
	str r0, [r6, #0x48]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r6, #0x48]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r6, #0x48]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add r0, sp, #0x14
	str r0, [sp]
	add r0, sp, #0x44
	str r0, [sp, #4]
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	mov r3, #1
	bl ov60_021E6F3C
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x1c]
	mov r0, #6
	lsl r0, r0, #0x10
	str r0, [sp, #0x20]
	add r0, sp, #0x14
	bl CreateSprite
	str r0, [r6, #0x4c]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r6, #0x4c]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r6, #0x4c]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	mov r4, #0
_021EA7D0:
	add r0, sp, #0x14
	str r0, [sp]
	add r0, sp, #0x44
	str r0, [sp, #4]
	lsl r5, r4, #2
	add r0, sp, #8
	ldr r0, [r0, r5]
	add r1, r7, #0
	mov r2, #0
	mov r3, #1
	bl ov60_021E6F3C
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [sp, #0x1c]
	mov r0, #6
	lsl r0, r0, #0x10
	str r0, [sp, #0x20]
	add r5, r6, r5
	add r0, sp, #0x14
	bl CreateSprite
	str r0, [r5, #0x50]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r5, #0x50]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x50]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #3
	blo _021EA7D0
	add sp, #0x68
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EA824: .word _021EB61C
	thumb_func_end ov60_021EA700

	thumb_func_start ov60_021EA828
ov60_021EA828: ; 0x021EA828
	push {r4, lr}
	ldr r3, _021EA848 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r2, #0
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bl sub_02015354
	cmp r4, #0
	bne _021EA840
	bl GF_AssertFail
_021EA840:
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_021EA848: .word NNS_GfdDefaultFuncAllocTexVram
	thumb_func_end ov60_021EA828

	thumb_func_start ov60_021EA84C
ov60_021EA84C: ; 0x021EA84C
	push {r4, lr}
	ldr r3, _021EA86C ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r2, #1
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bne _021EA85E
	bl GF_AssertFail
_021EA85E:
	add r0, r4, #0
	bl sub_02015394
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_021EA86C: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end ov60_021EA84C

	thumb_func_start ov60_021EA870
ov60_021EA870: ; 0x021EA870
	push {r3}
	sub sp, #0xc
	add r1, sp, #0
	mov r2, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	mov r1, #0x40
	str r2, [sp]
	str r2, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [r0, #0x28]
	ldr r1, [r0, #0x20]
	ldr r2, [sp, #4]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	add r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r1, [r0, #0x20]
	ldr r2, [sp, #8]
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	add r1, r2, r1
	str r1, [r0, #0x30]
	add sp, #0xc
	pop {r3}
	bx lr
	.balign 4, 0
	thumb_func_end ov60_021EA870

	thumb_func_start ov60_021EA8B0
ov60_021EA8B0: ; 0x021EA8B0
	push {r3, lr}
	bl sub_02026E48
	bl sub_0201543C
	bl sub_02015460
	mov r0, #1
	mov r1, #0
	bl sub_02026E50
	pop {r3, pc}
	thumb_func_end ov60_021EA8B0

	thumb_func_start ov60_021EA8C8
ov60_021EA8C8: ; 0x021EA8C8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x64]
	add r6, r1, #0
	mov r1, #1
	bl sub_02015528
	mov r0, #0xc
	add r4, r6, #0
	mul r4, r0
	ldr r1, _021EA908 ; =_021EB6EC
	ldr r0, [r5, #0x64]
	ldr r1, [r1, r4]
	ldr r2, _021EA90C ; =ov60_021EA870
	mov r3, #0
	bl sub_02015494
	ldr r1, _021EA910 ; =_021EB6F0
	ldr r0, [r5, #0x64]
	ldr r1, [r1, r4]
	ldr r2, _021EA90C ; =ov60_021EA870
	mov r3, #0
	bl sub_02015494
	ldr r1, _021EA914 ; =_021EB6F4
	ldr r0, [r5, #0x64]
	ldr r1, [r1, r4]
	ldr r2, _021EA90C ; =ov60_021EA870
	mov r3, #0
	bl sub_02015494
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EA908: .word _021EB6EC
_021EA90C: .word ov60_021EA870
_021EA910: .word _021EB6F0
_021EA914: .word _021EB6F4
	thumb_func_end ov60_021EA8C8

	thumb_func_start ov60_021EA918
ov60_021EA918: ; 0x021EA918
	push {r3, lr}
	ldr r0, _021EA978 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	strh r2, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _021EA97C ; =0xFFFFCFFD
	and r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	add r2, r1, #2
	add r1, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _021EA980 ; =0x0000CFFB
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
	ldr r2, _021EA984 ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _021EA988 ; =0xBFFF0000
	ldr r0, _021EA98C ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_021EA978: .word 0x04000008
_021EA97C: .word 0xFFFFCFFD
_021EA980: .word 0x0000CFFB
_021EA984: .word 0x00007FFF
_021EA988: .word 0xBFFF0000
_021EA98C: .word 0x04000580
	thumb_func_end ov60_021EA918

	thumb_func_start ov60_021EA990
ov60_021EA990: ; 0x021EA990
	push {r4, lr}
	add r4, r0, #0
	str r1, [r4, #0x68]
	ldr r0, _021EA9A4 ; =ov60_021EA9A8
	add r1, r4, #0
	mov r2, #0
	bl sub_0200E33C
	str r0, [r4, #0x6c]
	pop {r4, pc}
	.balign 4, 0
_021EA9A4: .word ov60_021EA9A8
	thumb_func_end ov60_021EA990

	thumb_func_start ov60_021EA9A8
ov60_021EA9A8: ; 0x021EA9A8
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x68]
	cmp r0, #0
	beq _021EA9DA
	ldr r0, _021EAA10 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineBToggleLayers
	b _021EAA00
_021EA9DA:
	ldr r0, _021EAA10 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineBToggleLayers
_021EAA00:
	bl GX_SwapDisplay
	ldr r0, [r4, #0x6c]
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #0x6c]
	pop {r4, pc}
	.balign 4, 0
_021EAA10: .word gSystem + 0x60
	thumb_func_end ov60_021EA9A8

	thumb_func_start ov60_021EAA14
ov60_021EAA14: ; 0x021EAA14
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov60_021E7698
	cmp r0, #0
	beq _021EAA26
	mov r0, #2
	strb r0, [r4]
_021EAA26:
	ldrb r0, [r4]
	cmp r0, #0
	beq _021EAA36
	cmp r0, #1
	beq _021EAA46
	cmp r0, #2
	beq _021EAA62
	b _021EAA6E
_021EAA36:
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021EAA84
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021EAA6E
_021EAA46:
	add r0, r5, #0
	bl ov60_021E769C
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021EAB04
	cmp r0, #0
	beq _021EAA6E
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _021EAA6E
_021EAA62:
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021EAC14
	mov r0, #1
	pop {r3, r4, r5, pc}
_021EAA6E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov60_021EAA14

	thumb_func_start ov60_021EAA74
ov60_021EAA74: ; 0x021EAA74
	push {r3, lr}
	bl ov60_021E7688
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl OamManager_ApplyAndResetBuffers
	pop {r3, pc}
	thumb_func_end ov60_021EAA74

	thumb_func_start ov60_021EAA84
ov60_021EAA84: ; 0x021EAA84
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r1, #0
	bl ov60_021E7688
	add r6, r0, #0
	ldr r0, _021EAAFC ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	add r0, r5, #0
	bl ov60_021EAC5C
	add r0, r5, #0
	bl ov60_021E76A0
	ldr r0, _021EAB00 ; =ov60_021EAA74
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	add r0, r6, #0
	add r1, r4, #0
	bl ov60_021EAD14
	mov r1, #0
	mov r0, #1
	lsl r0, r0, #8
	str r0, [sp]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov60_021E6FAC
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021EAE10
	add r0, r5, #0
	add r1, r4, #0
	bl ov60_021EAE18
	add r0, r4, #0
	add r1, r6, #0
	bl ov60_021EADF0
	mov r0, #1
	strb r0, [r4, #1]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021EAAFC: .word gSystem + 0x60
_021EAB00: .word ov60_021EAA74
	thumb_func_end ov60_021EAA84

	thumb_func_start ov60_021EAB04
ov60_021EAB04: ; 0x021EAB04
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov60_021E7688
	add r6, r0, #0
	add r0, r4, #0
	bl ov60_021E768C
	add r5, r0, #0
	add r0, r4, #0
	bl ov60_021E7978
	add r7, r0, #0
	add r0, r4, #0
	bl ov60_021E796C
	cmp r0, #4
	bhi _021EAC08
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EAB36: ; jump table
	.short _021EAB40 - _021EAB36 - 2 ; case 0
	.short _021EAB5E - _021EAB36 - 2 ; case 1
	.short _021EAB6E - _021EAB36 - 2 ; case 2
	.short _021EABD6 - _021EAB36 - 2 ; case 3
	.short _021EABFA - _021EAB36 - 2 ; case 4
_021EAB40:
	mov r0, #0x12
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #0x4a
	str r1, [sp, #8]
	mov r1, #9
	mov r2, #5
	mov r3, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	bl ov60_021E7958
	b _021EAC08
_021EAB5E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EAC08
	add r0, r4, #0
	bl ov60_021E7958
	b _021EAC08
_021EAB6E:
	mov r0, #0x3f
	mvn r0, r0
	str r0, [sp]
	mov r0, #0x49
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, #0x30
	mov r2, #1
	mov r3, #0
	bl ov60_021E7074
#ifdef HEARTGOLD
	mov r0, #0x3f
	mvn r0, r0
#else
	mov r0, #0x40
#endif
	str r0, [sp]
	mov r0, #0x49
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, #0x30
	mov r2, #2
	mov r3, #0
	bl ov60_021E7074
#ifdef HEARTGOLD
	mov r0, #0x3f
	mvn r0, r0
#else
	mov r0, #0x40
#endif
	str r0, [sp]
	mov r0, #0x49
	add r1, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, #0x30
	mov r2, #5
	mov r3, #0
	bl ov60_021E7074
#ifdef HEARTGOLD
	mov r0, #0x3f
	mvn r0, r0
#else
	mov r0, #0x40
#endif
	str r0, [sp]
	mov r0, #0x49
	add r5, #0x30
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #6
	mov r3, #0
	bl ov60_021E7074
	add r0, r4, #0
	bl ov60_021E7958
	b _021EAC08
_021EABD6:
	cmp r7, #0x14
	blo _021EAC08
	mov r0, #0x32
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x4a
	str r0, [sp, #8]
	mov r0, #0
	ldr r3, _021EAC10 ; =0x00007FFF
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	bl ov60_021E7958
	b _021EAC08
_021EABFA:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EAC08
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021EAC08:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
#ifdef HEARTGOLD
	nop
#endif
_021EAC10: .word 0x00007FFF
	thumb_func_end ov60_021EAB04

	thumb_func_start ov60_021EAC14
ov60_021EAC14: ; 0x021EAC14
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl ov60_021E7688
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _021EAC5A
	add r0, r6, #0
	add r1, r5, #0
	bl ov60_021EAE14
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	mov r0, #0
	strb r0, [r5, #1]
_021EAC5A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov60_021EAC14

	thumb_func_start ov60_021EAC5C
ov60_021EAC5C: ; 0x021EAC5C
	push {r3, r4, r5, lr}
	sub sp, #0x80
	bl ov60_021E7688
	add r3, sp, #0x70
	ldr r5, _021EAD00 ; =_021EB7C0
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _021EAD04 ; =_021EB7EC
	add r3, sp, #0x54
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
	ldr r5, _021EAD08 ; =_021EB7D0
	add r3, sp, #0x38
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
	ldr r5, _021EAD0C ; =_021EB808
	add r3, sp, #0x1c
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
	ldr r5, _021EAD10 ; =_021EB824
	add r3, sp, #0
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
	add sp, #0x80
	pop {r3, r4, r5, pc}
	nop
_021EAD00: .word _021EB7C0
_021EAD04: .word _021EB7EC
_021EAD08: .word _021EB7D0
_021EAD0C: .word _021EB808
_021EAD10: .word _021EB824
	thumb_func_end ov60_021EAC5C

	thumb_func_start ov60_021EAD14
ov60_021EAD14: ; 0x021EAD14
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x3b
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x3c
	add r2, r4, #0
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x3f
	add r2, r4, #0
	mov r3, #5
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x3d
	add r2, r4, #0
	mov r3, #6
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #1
	str r3, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x3e
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x4a
	str r0, [sp, #0xc]
	add r0, #0xbe
	mov r1, #0x40
	add r2, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0x4a
	mov r2, #0
	str r0, [sp, #4]
	add r0, #0xbe
	mov r1, #0x1f
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp]
	mov r0, #0x4a
	str r0, [sp, #4]
	add r0, #0xbe
	mov r1, #0x27
	mov r2, #4
	mov r3, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #1
	add r1, r0, #0
	bl OS_WaitIrq
	bl GX_BothDispOn
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov60_021EAD14

	thumb_func_start ov60_021EADF0
ov60_021EADF0: ; 0x021EADF0
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #2
	mov r2, #3
	mov r3, #0xa0
	bl BgSetPosTextAndCommit
	add r0, r4, #0
	mov r1, #6
	mov r2, #3
	mov r3, #0xa0
	bl BgSetPosTextAndCommit
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov60_021EADF0

	thumb_func_start ov60_021EAE10
ov60_021EAE10: ; 0x021EAE10
	bx lr
	.balign 4, 0
	thumb_func_end ov60_021EAE10

	thumb_func_start ov60_021EAE14
ov60_021EAE14: ; 0x021EAE14
	bx lr
	.balign 4, 0
	thumb_func_end ov60_021EAE14

	thumb_func_start ov60_021EAE18
ov60_021EAE18: ; 0x021EAE18
	bx lr
	.balign 4, 0
	thumb_func_end ov60_021EAE18

	.rodata

_021EAE1C:
	.byte 0x03, 0x00, 0x12, 0x20
	.byte 0x02, 0x02, 0x01, 0x00
_021EAE24:
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
_021EAE30:
	.byte 0x00, 0xE0, 0x01, 0x00, 0x00, 0xF0, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00
_021EAE3C:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_021EAE4C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x14, 0x04
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EAE68:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x07, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021EAE84:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x05, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EAEA0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x12, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EAEBC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x10, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EAED8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021EAEF4:
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
_021EAF18:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
_021EAF40:
	.byte 0x00, 0x40, 0x0B, 0x00, 0x00, 0x10, 0x0B, 0x00, 0x00, 0xD0, 0x12, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0xF0, 0x14, 0x00, 0x00, 0xB0, 0xED, 0xFF, 0x00, 0x80, 0x12, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x40, 0x0B, 0x00, 0x00, 0x10, 0x0B, 0x00, 0x00, 0xD0, 0x12, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x27, 0x00, 0x00, 0x80, 0x09, 0x00, 0x00, 0x00, 0x10, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EAF90:
	.byte 0x00, 0x90, 0x06, 0x00, 0x00, 0x20, 0x0A, 0x00, 0x00, 0x30, 0x12, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0xB0, 0x18, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0xF0, 0x0B, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x90, 0x06, 0x00, 0x00, 0x20, 0x0A, 0x00, 0x00, 0x30, 0x12, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x40, 0x1A, 0x00, 0x00, 0x70, 0x05, 0x00, 0x00, 0xB0, 0x14, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.public ov60_021EAFE0
ov60_021EAFE0:
	.word ov60_021E5900, ov60_021E59C8, ov60_021E5CA4, 0xFFFFFFFF
	.byte 0x4A, 0x00, 0x00, 0x00, 0x4A, 0x00, 0x00, 0x00
_021EAFF8:
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x4A, 0x00, 0x00, 0x00
_021EB008:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.public ov60_021EB030
ov60_021EB030:
	.word ov60_021E6B68, ov60_021E6C08, ov60_021E6CFC, 0xFFFFFFFF
	.byte 0x4A, 0x00, 0x00, 0x00
_021EB044:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021EB054:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB070:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x03, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB08C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x03
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB0A8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021EB0C4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB0E0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB0FC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x02
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB118:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x02, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021EB134:
	.byte 0x01, 0x01, 0x01, 0x01
_021EB138:
	.byte 0x02, 0x02, 0x02, 0x02, 0x4A, 0x00, 0x00, 0x00
_021EB140:
	.byte 0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x00, 0x00
_021EB14C:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB15C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB178:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x05, 0x02, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021EB194:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB1B0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x01, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB1CC:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00
_021EB1F4:
	.byte 0x02, 0x02, 0x02, 0x02, 0x4A, 0x00, 0x00, 0x00
_021EB1FC:
	.byte 0x10, 0x42, 0xCE, 0x41
	.byte 0x31, 0x46
_021EB202:
	.byte 0xEF, 0x3D, 0xCE, 0x41, 0xEF, 0x3D
_021EB208:
	.byte 0x69, 0x2D, 0x4A, 0x29, 0x8B, 0x31
_021EB20E:
	.byte 0xCE, 0x39
	.byte 0x08, 0x2D, 0x08, 0x1D
_021EB214:
	.byte 0x20, 0x02, 0x00, 0x00, 0xA0, 0x02, 0x00, 0x00, 0x60, 0x02, 0x00, 0x00
_021EB220:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
_021EB22C:
	.byte 0x67, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x00
_021EB238:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x00
_021EB244:
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
_021EB250:
	.byte 0x38, 0x00, 0x00, 0x00, 0x49, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00
_021EB25C:
	.byte 0x32, 0x00, 0x00, 0x00
	.byte 0x33, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00
_021EB268:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_021EB278:
	.byte 0x00, 0x00, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10
	.byte 0x84, 0x10, 0x84, 0x10, 0x84, 0x10, 0x84, 0x10
_021EB288:
	.byte 0x2A, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00
	.byte 0x2C, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0xC1, 0xAE, 0x19, 0x00
_021EB29C:
	.byte 0x02, 0xD6, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x05, 0x00, 0x00, 0x00, 0x00
_021EB2AC:
	.byte 0xD6, 0x52, 0x00, 0x00
	.byte 0x80, 0x24, 0x00, 0x00, 0x6B, 0x41, 0x00, 0x00, 0x52, 0x01, 0x00, 0x00, 0x13, 0x32, 0x00, 0x00
	.byte 0xD0, 0x00, 0x00, 0x00
_021EB2C4:
	.byte 0x68, 0x00, 0x00, 0x00, 0x69, 0x00, 0x00, 0x00, 0x65, 0x00, 0x00, 0x00
	.byte 0x66, 0x00, 0x00, 0x00, 0x62, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00
_021EB2DC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB2F8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021EB314:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB330:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x03, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB34C:
	.byte 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
_021EB370:
	.byte 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
_021EB39C:
	.byte 0x46, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
_021EB3C8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00
_021EB3F4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
_021EB420:
	.byte 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
_021EB44C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
_021EB478:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB9, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00
_021EB4A4:
	.byte 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
_021EB4D0:
	.byte 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
_021EB4FC:
	.byte 0x46, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
_021EB528:
	.byte 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0xB9, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0xB9, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00
_021EB554:
	.byte 0x7E, 0xF8, 0xFF, 0xFF, 0x24, 0xF2, 0xFF, 0xFF, 0xD8, 0xFE, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x86, 0xF8, 0xFF, 0xFF, 0x24, 0xF2, 0xFF, 0xFF, 0xD8, 0xFE, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x86, 0xF8, 0xFF, 0xFF, 0x24, 0xF2, 0xFF, 0xFF, 0xD8, 0xFE, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00
_021EB5E4:
	.byte 0x04, 0x04, 0x04, 0x04, 0x4A, 0x00, 0x00, 0x00
_021EB5EC:
	.byte 0x56, 0x00, 0x00, 0x00
	.byte 0x5E, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00
_021EB5F8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00
_021EB604:
	.byte 0x57, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x00, 0x00
_021EB610:
	.byte 0x55, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00, 0x59, 0x00, 0x00, 0x00
_021EB61C:
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
_021EB628:
	.byte 0x58, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x5C, 0x00, 0x00, 0x00
_021EB634:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
_021EB644:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB660:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB67C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x01
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB698:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021EB6B4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB6D0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x02, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB6EC:
	.byte 0x06, 0x00, 0x00, 0x00
_021EB6F0:
	.byte 0x07, 0x00, 0x00, 0x00
_021EB6F4:
	.byte 0x08, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_021EB710:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
_021EB73C:
	.byte 0xFF, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
_021EB768:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00
_021EB794:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
_021EB7C0:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB7D0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x01, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB7EC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021EB808:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021EB824:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_021EB860:
	.word ov60_021E7984
	.word ov60_021E80E0
	.word ov60_021E8BF8
	.word ov60_021E9D08
	.word ov60_021EAA14
	; 0x021EB880
