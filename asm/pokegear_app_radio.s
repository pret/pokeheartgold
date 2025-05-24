#include "constants/species.h"
#include "constants/sndseq.h"
#include "constants/maps.h"
#include "constants/items.h"
#include "constants/phone_contacts.h"
#include "constants/flags.h"
#include "msgdata/msg/msg_0271.h"
#include "msgdata/msg/msg_0416.h"
#include "msgdata/msg/msg_0411.h"
#include "msgdata/msg/msg_0640.h"
#include "msgdata/msg/msg_0664.h"
	.include "asm/macros.inc"
	.include "overlay_101.inc"
	.include "global.inc"

	.text

	// File boundary?

	// File boundary?

	// File boundary?

	thumb_func_start PokegearRadio_Init
PokegearRadio_Init: ; 0x021F4480
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetArgs
	mov r2, #2
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x5b
	lsl r2, r2, #0x10
	bl CreateHeap
	add r0, r4, #0
	mov r1, #0x6c
	mov r2, #0x5b
	bl OverlayManager_CreateAndGetData
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x6c
	bl memset
	str r5, [r4, #0xc]
	mov r0, #0x5b
	str r0, [r4]
	add r0, r4, #0
	bl ov101_021F4558
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end PokegearRadio_Init

	thumb_func_start PokegearRadio_Main
PokegearRadio_Main: ; 0x021F44BC
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	cmp r1, #9
	bhi _021F4526
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F44D6: ; jump table
	.short _021F44EA - _021F44D6 - 2 ; case 0
	.short _021F44F2 - _021F44D6 - 2 ; case 1
	.short _021F44FA - _021F44D6 - 2 ; case 2
	.short _021F4526 - _021F44D6 - 2 ; case 3
	.short _021F4526 - _021F44D6 - 2 ; case 4
	.short _021F4502 - _021F44D6 - 2 ; case 5
	.short _021F450A - _021F44D6 - 2 ; case 6
	.short _021F4512 - _021F44D6 - 2 ; case 7
	.short _021F451A - _021F44D6 - 2 ; case 8
	.short _021F4522 - _021F44D6 - 2 ; case 9
_021F44EA:
	bl ov101_021F46C8
	str r0, [r4]
	b _021F4526
_021F44F2:
	bl ov101_021F46EC
	str r0, [r4]
	b _021F4526
_021F44FA:
	bl ov101_021F4750
	str r0, [r4]
	b _021F4526
_021F4502:
	bl ov101_021F4764
	str r0, [r4]
	b _021F4526
_021F450A:
	bl ov101_021F4824
	str r0, [r4]
	b _021F4526
_021F4512:
	bl ov101_021F4888
	str r0, [r4]
	b _021F4526
_021F451A:
	bl ov101_021F4928
	str r0, [r4]
	b _021F4526
_021F4522:
	mov r0, #1
	pop {r4, pc}
_021F4526:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end PokegearRadio_Main

	thumb_func_start PokegearRadio_Exit
PokegearRadio_Exit: ; 0x021F452C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov101_021F45D4
	ldr r2, [r4, #0xc]
	mov r0, #0x80
	ldrb r1, [r2, #5]
	orr r0, r1
	strb r0, [r2, #5]
	ldr r4, [r4]
	add r0, r5, #0
	bl OverlayManager_FreeData
	add r0, r4, #0
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end PokegearRadio_Exit

	thumb_func_start ov101_021F4558
ov101_021F4558: ; 0x021F4558
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, _021F45CC ; =ov101_021F4FCC
	str r4, [r0, #0x64]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x5c]
	ldr r1, _021F45D0 ; =ov101_021F4FDC
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x60]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl Pokegear_GetBackgroundStyle
	add r1, r4, #0
	add r1, #0x25
	strb r0, [r1]
	ldr r0, [r4, #0xc]
	add r1, r4, #0
	add r2, r4, #0
	ldr r0, [r0, #0x28]
	add r1, #0x28
	add r2, #0x2a
	bl sub_0202EEB4
	add r0, r4, #0
	add r0, #0x24
	ldrb r1, [r0]
	mov r0, #0xe0
	bic r1, r0
	mov r0, #0x60
	orr r1, r0
	add r0, r4, #0
	add r0, #0x24
	strb r1, [r0]
	add r0, r4, #0
	bl ov101_021F4634
	add r1, r4, #0
	add r1, #0x26
	ldrb r2, [r1]
	mov r1, #0xf
	bic r2, r1
	mov r1, #0xf
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	add r0, r4, #0
	add r0, #0x26
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0xff
	add r0, #0x27
	strb r1, [r0]
	bl GF_GetCurrentPlayingBGM
	strh r0, [r4, #0x2c]
	pop {r4, pc}
	.balign 4, 0
_021F45CC: .word ov101_021F4FCC
_021F45D0: .word ov101_021F4FDC
	thumb_func_end ov101_021F4558

	thumb_func_start ov101_021F45D4
ov101_021F45D4: ; 0x021F45D4
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	ldr r0, [r0, #0x28]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl sub_0202EEAC
	ldr r0, [r4, #0xc]
	mov r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x60]
	pop {r4, pc}
	thumb_func_end ov101_021F45D4

	thumb_func_start ov101_021F45FC
ov101_021F45FC: ; 0x021F45FC
	push {r4, r5}
	ldr r5, _021F462C ; =ov101_021F87AC
	mov r2, #0
	ldrb r3, [r5, r1]
	cmp r3, #0
	ble _021F4624
	ldr r3, _021F4630 ; =ov101_021FB2C0
	lsl r4, r1, #2
	ldrb r1, [r5, r1]
	ldr r4, [r3, r4]
_021F4610:
	ldrh r3, [r4]
	cmp r0, r3
	bne _021F461C
	mov r0, #1
	pop {r4, r5}
	bx lr
_021F461C:
	add r2, r2, #1
	add r4, r4, #2
	cmp r2, r1
	blt _021F4610
_021F4624:
	mov r0, #0
	pop {r4, r5}
	bx lr
	nop
_021F462C: .word ov101_021F87AC
_021F4630: .word ov101_021FB2C0
	thumb_func_end ov101_021F45FC

	thumb_func_start ov101_021F4634
ov101_021F4634: ; 0x021F4634
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrh r5, [r0, #0x10]
	add r0, r5, #0
	bl MapHeader_CanReceiveRadioSignal
	cmp r0, #0
	bne _021F464C
	mov r0, #3
	pop {r3, r4, r5, pc}
_021F464C:
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F45FC
	cmp r0, #0
	beq _021F465C
	mov r0, #4
	pop {r3, r4, r5, pc}
_021F465C:
	add r0, r5, #0
	bl MapHeader_IsInKanto
	cmp r0, #0
	beq _021F4690
	ldr r0, [r4, #0xc]
	mov r1, #FLAG_RESTORED_POWER>>2
	ldr r0, [r0, #0x2c]
	lsl r1, r1, #2
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F467A
	mov r0, #3
	pop {r3, r4, r5, pc}
_021F467A:
	ldr r0, [r4, #0xc]
	ldr r1, _021F46C4 ; =FLAG_GOT_EXPN_CARD
	ldr r0, [r0, #0x2c]
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	beq _021F468C
	mov r0, #2
	pop {r3, r4, r5, pc}
_021F468C:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F4690:
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F45FC
	cmp r0, #0
	beq _021F46AE
	ldr r0, [r4, #0xc]
	mov r1, #0xca
	ldr r0, [r0, #0x2c]
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F46AE
	mov r0, #6
	pop {r3, r4, r5, pc}
_021F46AE:
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x2c]
	bl Save_VarsFlags_IsInRocketTakeover
	cmp r0, #0
	beq _021F46BE
	mov r0, #5
	pop {r3, r4, r5, pc}
_021F46BE:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F46C4: .word FLAG_GOT_EXPN_CARD
	thumb_func_end ov101_021F4634

	thumb_func_start ov101_021F46C8
ov101_021F46C8: ; 0x021F46C8
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F49F8
	cmp r0, #0
	bne _021F46D8
	mov r0, #0
	pop {r4, pc}
_021F46D8:
	ldr r0, [r4, #0xc]
	ldrb r0, [r0, #5]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _021F46E6
	mov r0, #7
	pop {r4, pc}
_021F46E6:
	mov r0, #5
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F46C8

	thumb_func_start ov101_021F46EC
ov101_021F46EC: ; 0x021F46EC
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	str r1, [sp]
	add r1, sp, #0
	add r4, r0, #0
	bl ov101_021F5468
	ldr r1, [sp]
	cmp r1, #0
	bne _021F471C
	ldr r0, [r4, #0xc]
	bl PokegearApp_HandleInputModeChangeToButtons
	ldr r0, [r4, #0xc]
	ldrb r1, [r0, #6]
	cmp r1, #1
	bne _021F4716
	bl PokegearApp_HandleKeyInput_SwitchApps
	b _021F471C
_021F4716:
	add r0, r4, #0
	bl ov101_021F5304
_021F471C:
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021F4748
	cmp r0, #4
	beq _021F472E
	cmp r0, #8
	beq _021F4738
	b _021F473E
_021F472E:
	ldr r1, [r4, #0xc]
	add sp, #4
	str r0, [r1, #0x1c]
	mov r0, #6
	pop {r3, r4, pc}
_021F4738:
	add sp, #4
	mov r0, #3
	pop {r3, r4, pc}
_021F473E:
	ldr r1, [r4, #0xc]
	add sp, #4
	str r0, [r1, #0x1c]
	mov r0, #8
	pop {r3, r4, pc}
_021F4748:
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F46EC

	thumb_func_start ov101_021F4750
ov101_021F4750: ; 0x021F4750
	push {r3, lr}
	bl ov101_021F4A4C
	cmp r0, #0
	beq _021F475E
	mov r0, #9
	pop {r3, pc}
_021F475E:
	mov r0, #2
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021F4750

	thumb_func_start ov101_021F4764
ov101_021F4764: ; 0x021F4764
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021F4776
	cmp r0, #1
	beq _021F4804
	b _021F481C
_021F4776:
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r4, #0
	mov r6, #1
_021F4790:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021F4790
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl PaletteData_BlendPalette
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl PaletteData_BlendPalette
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl PaletteData_PushTransparentBuffers
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineATogglePlanes
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	bl GF_GetCurrentPlayingBGM
	mov r1, #6
	bl StopBGM
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021F481C
_021F4804:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021F481C
	add r0, r5, #0
	bl ov101_021F5090
	mov r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021F481C:
	mov r0, #5
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F4764

	thumb_func_start ov101_021F4824
ov101_021F4824: ; 0x021F4824
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021F4836
	cmp r0, #1
	beq _021F4856
	b _021F4882
_021F4836:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021F4882
_021F4856:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021F4882
	add r0, r5, #0
	bl ov101_021F5048
	mov r4, #0
	add r6, r4, #0
_021F4868:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021F4868
	mov r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_021F4882:
	mov r0, #6
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov101_021F4824

	thumb_func_start ov101_021F4888
ov101_021F4888: ; 0x021F4888
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021F489C
	cmp r0, #1
	beq _021F48E4
	cmp r0, #2
	beq _021F4904
	b _021F4922
_021F489C:
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F50F0
	ldr r0, [r5, #0xc]
	mov r4, #0
	strb r4, [r0, #9]
	mov r6, #1
_021F48B6:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #3
	blt _021F48B6
	mov r0, #0
	mov r1, #0xe
	mov r2, #1
	bl SetBlendBrightness
	bl GF_GetCurrentPlayingBGM
	mov r1, #6
	bl StopBGM
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021F4922
_021F48E4:
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl ov100_021E5D3C
	cmp r0, #0
	beq _021F4922
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F51C0
	cmp r0, #0
	beq _021F4922
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021F4922
_021F4904:
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	ldr r0, [r5, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	add r0, r5, #0
	bl ov101_021F5090
	mov r0, #0
	str r0, [r5, #4]
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F4922:
	mov r0, #7
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F4888

	thumb_func_start ov101_021F4928
ov101_021F4928: ; 0x021F4928
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _021F493E
	cmp r1, #1
	beq _021F495C
	cmp r1, #2
	beq _021F497C
	b _021F49F0
_021F493E:
	mov r1, #1
	bl ov101_021F50F0
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	ldr r0, [r5, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021F49F0
_021F495C:
	ldr r0, [r5, #0xc]
	mov r1, #1
	bl ov100_021E5D3C
	cmp r0, #0
	beq _021F49F0
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F51C0
	cmp r0, #0
	beq _021F49F0
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021F49F0
_021F497C:
	mov r0, #0x10
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl PaletteData_BlendPalette
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl PaletteData_BlendPalette
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl PaletteData_PushTransparentBuffers
	add r0, r5, #0
	bl ov101_021F5048
	mov r4, #0
	add r6, r4, #0
	add r7, r4, #0
_021F49BA:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r0, r4, #5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r7, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #3
	blt _021F49BA
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	ldr r0, [r5, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	add sp, #8
	str r1, [r5, #4]
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_021F49F0:
	mov r0, #8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021F4928

	thumb_func_start ov101_021F49F8
ov101_021F49F8: ; 0x021F49F8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021F4A08
	cmp r1, #1
	beq _021F4A26
	b _021F4A3E
_021F4A08:
	bl ov101_021F4AEC
	add r0, r4, #0
	bl ov101_021F4BC8
	add r0, r4, #0
	bl ov101_021F4DC8
	add r0, r4, #0
	bl ov101_021F4E6C
	add r0, r4, #0
	bl ov101_021F4CE8
	b _021F4A3E
_021F4A26:
	bl ov101_021F4E84
	add r0, r4, #0
	bl ov101_021F4F00
	ldr r1, _021F4A48 ; =ov101_021F50D8
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x58]
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021F4A3E:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021F4A48: .word ov101_021F50D8
	thumb_func_end ov101_021F49F8

	thumb_func_start ov101_021F4A4C
ov101_021F4A4C: ; 0x021F4A4C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021F4A60
	cmp r1, #1
	beq _021F4AA0
	cmp r1, #2
	beq _021F4ABE
	b _021F4AE8
_021F4A60:
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	mov r3, #0
	bl ov101_021F54AC
	cmp r0, #0xff
	beq _021F4A88
	ldr r1, [r4, #0x60]
	add r0, r1, #0
	add r0, #0x66
	ldrb r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bne _021F4A88
	add r1, #0x59
	ldrb r0, [r1]
	cmp r0, #0xb
	bne _021F4A92
_021F4A88:
	mov r0, #0
	mov r1, #4
	bl GF_SndStartFadeOutBGM
	b _021F4A98
_021F4A92:
	mov r0, #2
	str r0, [r4, #8]
	b _021F4AE8
_021F4A98:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _021F4AE8
_021F4AA0:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _021F4AE8
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrh r0, [r0, #2]
	bl PlayBGM
	bl sub_0203E354
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _021F4AE8
_021F4ABE:
	ldr r1, [r4, #0xc]
	mov r2, #0
	str r2, [r1, #0x58]
	bl ov101_021F4EE8
	add r0, r4, #0
	bl ov101_021F4E78
	add r0, r4, #0
	bl ov101_021F4E48
	add r0, r4, #0
	bl ov101_021F4CD8
	add r0, r4, #0
	bl ov101_021F4BBC
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021F4AE8:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov101_021F4A4C

	thumb_func_start ov101_021F4AEC
ov101_021F4AEC: ; 0x021F4AEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xac
	mov r1, #0
	add r5, r0, #0
	mov r0, #1
	add r2, r1, #0
	bl GX_SetGraphicsMode
	ldr r4, _021F4BB8 ; =ov101_021F87F4
	add r3, sp, #4
	mov r2, #0x15
_021F4B02:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021F4B02
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x74]
	add r2, sp, #4
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x74]
	add r2, sp, #0x20
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x74]
	add r2, sp, #0x3c
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #5
	ldr r0, [r0, #0x74]
	add r2, sp, #0x58
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #6
	ldr r0, [r0, #0x74]
	add r2, sp, #0x74
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #7
	ldr r0, [r0, #0x74]
	add r2, sp, #0x90
	bl InitBgFromTemplateEx
	mov r4, #0
	mov r6, #0x20
	add r7, r4, #0
_021F4B70:
	ldr r0, [r5, #0xc]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #1
	lsl r0, r0, #0x18
	ldr r3, [r5]
	lsr r0, r0, #0x18
	add r1, r6, #0
	add r2, r7, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5, #0xc]
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #5
	lsl r0, r0, #0x18
	ldr r3, [r5]
	lsr r0, r0, #0x18
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	add r4, r4, #1
	cmp r4, #3
	blt _021F4B70
	add sp, #0xac
	pop {r4, r5, r6, r7, pc}
	nop
_021F4BB8: .word ov101_021F87F4
	thumb_func_end ov101_021F4AEC

	thumb_func_start ov101_021F4BBC
ov101_021F4BBC: ; 0x021F4BBC
	ldr r3, _021F4BC4 ; =ov100_021E5CA4
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021F4BC4: .word ov100_021E5CA4
	thumb_func_end ov101_021F4BBC

	thumb_func_start ov101_021F4BC8
ov101_021F4BC8: ; 0x021F4BC8
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #4
	bl FontID_Alloc
	ldr r1, [r5]
	mov r0, #0x93
	bl NARC_New
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0]
	add r2, r4, #0
	mov r3, #0x93
	add r0, #0x10
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0]
	add r2, r4, #0
	mov r3, #0x93
	add r0, #0x22
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0]
	add r2, r4, #0
	mov r3, #0x93
	add r0, #0x16
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	lsl r0, r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0]
	add r2, r4, #0
	mov r3, #0x93
	add r0, #0x1c
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	lsl r0, r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	add r0, r5, #0
	add r0, #0x25
	ldrb r0, [r0]
	add r2, r4, #0
	mov r3, #0x93
	add r0, #0x28
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	lsl r0, r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	ldr r0, [r5]
	add r1, r5, #0
	str r0, [sp]
	add r1, #0x25
	ldrb r1, [r1]
	add r3, r5, #0
	add r0, r4, #0
	add r1, #0x16
	mov r2, #0
	add r3, #0x68
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	str r0, [r5, #0x64]
	add r0, r4, #0
	bl NARC_Delete
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0xc]
	mov r1, #7
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov101_021F4BC8

	thumb_func_start ov101_021F4CD8
ov101_021F4CD8: ; 0x021F4CD8
	push {r3, lr}
	ldr r0, [r0, #0x64]
	bl FreeToHeap
	mov r0, #4
	bl FontID_Release
	pop {r3, pc}
	thumb_func_end ov101_021F4CD8

	thumb_func_start ov101_021F4CE8
ov101_021F4CE8: ; 0x021F4CE8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x93
	bl NARC_New
	add r4, r0, #0
	mov r1, #0
	mov r0, #7
	add r2, r5, #0
	str r1, [sp]
	lsl r0, r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	add r2, #0x25
	ldr r0, [r5, #0xc]
	ldrb r2, [r2]
	ldr r0, [r0, #0x78]
	ldr r3, [r5]
	add r1, r4, #0
	add r2, #0xa
	bl PaletteData_LoadFromOpenNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r2, r5, #0
	add r2, #0x25
	ldr r0, [r5, #0xc]
	ldrb r2, [r2]
	ldr r0, [r0, #0x78]
	ldr r3, [r5]
	add r1, r4, #0
	add r2, r2, #4
	bl PaletteData_LoadFromOpenNarc
	mov r0, #2
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	bl PaletteData_LoadFromOpenNarc
	mov r0, #3
	str r0, [sp]
	lsl r0, r0, #7
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	bl PaletteData_LoadFromOpenNarc
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	mov r0, #0x10
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl PaletteData_BlendPalette
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl PaletteData_BlendPalette
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl PaletteData_PushTransparentBuffers
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	add r0, r4, #0
	bl NARC_Delete
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F4CE8

	thumb_func_start ov101_021F4DC8
ov101_021F4DC8: ; 0x021F4DC8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r5, r7, #0
	ldr r4, _021F4E40 ; =ov101_021F87DC
	mov r6, #0
	add r5, #0x30
_021F4DD6:
	ldrb r0, [r4, #2]
	add r1, r5, #0
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	ldrb r0, [r4, #4]
	str r0, [sp, #8]
	ldrb r0, [r4, #5]
	str r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	str r0, [sp, #0x10]
	ldr r0, [r7, #0xc]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r0, #0x74]
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #3
	blt _021F4DD6
	ldr r4, [r7, #0xc]
	ldr r5, [r4, #0x20]
	ldrh r0, [r5, #0x10]
	bl MapHeader_IsInKanto
	add r3, r0, #0
	add r0, r7, #0
	add r0, #0x30
	str r0, [sp]
	add r0, r7, #0
	add r0, #0x50
	str r0, [sp, #4]
	add r0, r7, #0
	add r0, #0x40
	str r0, [sp, #8]
	ldr r0, _021F4E44 ; =0x00010200
	str r0, [sp, #0xc]
	ldr r0, [r7]
	str r0, [sp, #0x10]
	ldrh r1, [r5, #0x10]
	ldrh r2, [r5, #0x12]
	ldr r0, [r4, #0x24]
	bl ov101_021F57B8
	str r0, [r7, #0x60]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F4E40: .word ov101_021F87DC
_021F4E44: .word 0x00010200
	thumb_func_end ov101_021F4DC8

	thumb_func_start ov101_021F4E48
ov101_021F4E48: ; 0x021F4E48
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x60]
	bl ov101_021F58A0
	mov r4, #0
	add r5, #0x30
_021F4E56:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _021F4E56
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F4E48

	thumb_func_start ov101_021F4E6C
ov101_021F4E6C: ; 0x021F4E6C
	ldr r3, _021F4E74 ; =ov100_021E6978
	ldr r0, [r0, #0xc]
	mov r1, #1
	bx r3
	.balign 4, 0
_021F4E74: .word ov100_021E6978
	thumb_func_end ov101_021F4E6C

	thumb_func_start ov101_021F4E78
ov101_021F4E78: ; 0x021F4E78
	ldr r3, _021F4E80 ; =ov100_021E69C8
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021F4E80: .word ov100_021E69C8
	thumb_func_end ov101_021F4E78

	thumb_func_start ov101_021F4E84
ov101_021F4E84: ; 0x021F4E84
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r4, _021F4EE4 ; =ov101_021F889C
	mov r6, #0
	add r5, r7, #0
_021F4E8E:
	ldr r1, [r7, #0xc]
	add r2, r4, #0
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	str r0, [r5, #0x10]
	mov r1, #1
	bl thunk_Sprite_SetPriority
	ldr r0, [r5, #0x10]
	mov r1, #0
	bl Sprite_SetDrawFlag
	ldr r0, [r5, #0x10]
	mov r1, #1
	bl Sprite_SetAnimActiveFlag
	add r6, r6, #1
	add r4, #0x28
	add r5, r5, #4
	cmp r6, #5
	blt _021F4E8E
	ldr r0, [r7, #0x20]
	mov r1, #3
	bl thunk_Sprite_SetPriority
	ldr r0, [r7, #0x20]
	mov r1, #1
	bl Sprite_SetDrawFlag
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r7, r1]
	ldrsh r2, [r7, r2]
	ldr r0, [r7, #0x20]
	bl Sprite_SetPositionXY
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F4EE4: .word ov101_021F889C
	thumb_func_end ov101_021F4E84

	thumb_func_start ov101_021F4EE8
ov101_021F4EE8: ; 0x021F4EE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_021F4EEE:
	ldr r0, [r5, #0x10]
	bl thunk_Sprite_Delete
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #5
	blt _021F4EEE
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F4EE8

	thumb_func_start ov101_021F4F00
ov101_021F4F00: ; 0x021F4F00
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	ldrb r0, [r1, #6]
	cmp r0, #1
	ldr r0, [r1, #0x7c]
	bne _021F4F2A
	mov r1, #0
	mov r2, #1
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r4, #0xc]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	pop {r4, pc}
_021F4F2A:
	mov r1, #0
	add r2, r1, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	pop {r4, pc}
	thumb_func_end ov101_021F4F00

	thumb_func_start ov101_021F4F34
ov101_021F4F34: ; 0x021F4F34
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r4, r1, #0
	cmp r2, #4
	bhs _021F4F7A
	ldr r0, [r5, #0x68]
	mov r1, #4
	str r1, [sp]
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	mov r1, #0x18
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	lsl r3, r2, #1
	ldr r2, _021F4FC4 ; =ov101_021FB2C8
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	ldr r6, _021F4FC8 ; =ov101_021FB2C8 + 1
	ldrb r2, [r2, r3]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	ldrb r3, [r6, r3]
	ldr r0, [r0, #0x74]
	mov r1, #2
	bl CopyToBgTilemapRect
_021F4F7A:
	cmp r4, #4
	bhs _021F4FB6
	ldr r0, [r5, #0x68]
	mov r2, #4
	str r2, [sp]
	add r1, r0, #0
	str r2, [sp, #4]
	add r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	mov r1, #0x18
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	lsl r3, r4, #1
	ldr r2, _021F4FC4 ; =ov101_021FB2C8
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	ldr r4, _021F4FC8 ; =ov101_021FB2C8 + 1
	ldrb r2, [r2, r3]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	ldrb r3, [r4, r3]
	ldr r0, [r0, #0x74]
	mov r1, #2
	bl CopyToBgTilemapRect
_021F4FB6:
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021F4FC4: .word ov101_021FB2C8
_021F4FC8: .word ov101_021FB2C8 + 1
	thumb_func_end ov101_021F4F34

	thumb_func_start ov101_021F4FCC
ov101_021F4FCC: ; 0x021F4FCC
	add r1, r0, #0
	add r1, #0x24
	ldrb r2, [r1]
	mov r1, #0x1e
	add r0, #0x24
	bic r2, r1
	strb r2, [r0]
	bx lr
	thumb_func_end ov101_021F4FCC

	thumb_func_start ov101_021F4FDC
ov101_021F4FDC: ; 0x021F4FDC
	add r1, r0, #0
	add r1, #0x24
	ldrb r2, [r1]
	mov r1, #0x1e
	ldr r3, _021F4FFC ; =PokegearAppSwitchCursor_SetCursorSpritesDrawState
	bic r2, r1
	add r1, r0, #0
	add r1, #0x24
	strb r2, [r1]
	ldr r2, [r0, #0xc]
	mov r1, #0
	strb r1, [r2, #6]
	ldr r0, [r0, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x7c]
	bx r3
	.balign 4, 0
_021F4FFC: .word PokegearAppSwitchCursor_SetCursorSpritesDrawState
	thumb_func_end ov101_021F4FDC

	thumb_func_start ov101_021F5000
ov101_021F5000: ; 0x021F5000
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x26
	ldrb r0, [r0]
	lsl r1, r0, #0x18
	lsr r1, r1, #0x1e
	bne _021F5044
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1e
	cmp r0, #2
	ldr r0, [r4, #0x60]
	bne _021F5026
	add r1, r4, #0
	add r1, #0x27
	ldrb r1, [r1]
	mov r2, #0
	bl ov101_021F5970
	b _021F5032
_021F5026:
	add r1, r4, #0
	add r1, #0x27
	ldrb r1, [r1]
	mov r2, #1
	bl ov101_021F5970
_021F5032:
	add r0, r4, #0
	add r0, #0x26
	ldrb r1, [r0]
	mov r0, #0xc0
	add r4, #0x26
	bic r1, r0
	mov r0, #0x40
	orr r0, r1
	strb r0, [r4]
_021F5044:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F5000

	thumb_func_start ov101_021F5048
ov101_021F5048: ; 0x021F5048
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x26
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	beq _021F508E
	ldr r0, [r4, #0x60]
	bl ov101_021F5A50
	add r0, r4, #0
	add r0, #0x50
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x40
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x50
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x40
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x26
	ldrb r1, [r0]
	mov r0, #0xc0
	add r4, #0x26
	bic r1, r0
	strb r1, [r4]
_021F508E:
	pop {r4, pc}
	thumb_func_end ov101_021F5048

	thumb_func_start ov101_021F5090
ov101_021F5090: ; 0x021F5090
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	add r3, sp, #0
	bl ov101_021F54AC
	add r1, r4, #0
	add r1, #0x27
	strb r0, [r1]
	add r0, r4, #0
	add r0, #0x26
	ldrb r1, [r0]
	mov r0, #0x30
	bic r1, r0
	add r0, sp, #0
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1a
	orr r1, r0
	add r0, r4, #0
	add r0, #0x26
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x27
	ldrb r0, [r0]
	cmp r0, #8
	bhs _021F50D4
	add r0, r4, #0
	bl ov101_021F5000
_021F50D4:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov101_021F5090

	thumb_func_start ov101_021F50D8
ov101_021F50D8: ; 0x021F50D8
	push {r3, lr}
	add r0, r1, #0
	add r0, #0x26
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	beq _021F50EC
	ldr r0, [r1, #0x60]
	bl ov101_021F5B94
_021F50EC:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021F50D8

	thumb_func_start ov101_021F50F0
ov101_021F50F0: ; 0x021F50F0
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _021F51AC ; =0x04001040
	add r5, r0, #0
	mov r0, #0xff
	strh r0, [r2]
	ldr r3, _021F51B0 ; =0x000070C0
	add r4, r2, #0
	strh r3, [r2, #4]
	lsl r0, r0, #8
	strh r0, [r2, #2]
	strh r3, [r2, #6]
	add r4, #0xa
	ldrh r6, [r4]
	mov r3, #0x3f
	mov r0, #0x11
	bic r6, r3
	orr r0, r6
	strh r0, [r4]
	add r0, r2, #0
	add r0, #8
	ldrh r4, [r0]
	sub r2, #0x40
	bic r4, r3
	mov r3, #0x1f
	orr r4, r3
	strh r4, [r0]
	ldrh r6, [r0]
	ldr r4, _021F51B4 ; =0xFFFFC0FF
	lsl r3, r3, #8
	and r4, r6
	orr r3, r4
	strh r3, [r0]
	ldr r3, [r2]
	ldr r0, _021F51B8 ; =0xFFFF1FFF
	and r3, r0
	mov r0, #6
	lsl r0, r0, #0xc
	orr r0, r3
	str r0, [r2]
	cmp r1, #0
	bne _021F5170
	mov r6, #3
	add r7, r6, #0
	mov r4, #0
	sub r7, #0x53
_021F514A:
	ldr r0, [r5, #0xc]
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r2, r6, #0
	add r3, r7, #0
	bl BgSetPosTextAndCommit
	add r0, r4, #5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #1
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #3
	blt _021F514A
	b _021F519A
_021F5170:
	ldr r0, [r5, #0xc]
	mov r1, #5
	ldr r0, [r0, #0x74]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0xc]
	mov r1, #6
	ldr r0, [r0, #0x74]
	mov r2, #5
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0xc]
	mov r1, #7
	ldr r0, [r0, #0x74]
	mov r2, #5
	mov r3, #0
	bl BgSetPosTextAndCommit
_021F519A:
	ldrh r1, [r5, #0x2e]
	ldr r0, _021F51BC ; =0xFFFF8000
	and r1, r0
	strh r1, [r5, #0x2e]
	ldrh r1, [r5, #0x2e]
	sub r0, r0, #1
	and r0, r1
	strh r0, [r5, #0x2e]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F51AC: .word 0x04001040
_021F51B0: .word 0x000070C0
_021F51B4: .word 0xFFFFC0FF
_021F51B8: .word 0xFFFF1FFF
_021F51BC: .word 0xFFFF8000
	thumb_func_end ov101_021F50F0

	thumb_func_start ov101_021F51C0
ov101_021F51C0: ; 0x021F51C0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0x2e]
	add r4, r1, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	beq _021F51D2
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F51D2:
	cmp r4, #0
	ldr r0, [r5, #0xc]
	bne _021F5202
	ldr r0, [r0, #0x74]
	mov r1, #5
	mov r2, #4
	mov r3, #0xa
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0xc]
	mov r1, #6
	ldr r0, [r0, #0x74]
	mov r2, #4
	mov r3, #0xa
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0xc]
	mov r1, #7
	ldr r0, [r0, #0x74]
	mov r2, #4
	mov r3, #0xa
	bl BgSetPosTextAndCommit
	b _021F522A
_021F5202:
	mov r1, #5
	ldr r0, [r0, #0x74]
	add r2, r1, #0
	mov r3, #0xa
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0xc]
	mov r1, #6
	ldr r0, [r0, #0x74]
	mov r2, #5
	mov r3, #0xa
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0xc]
	mov r1, #7
	ldr r0, [r0, #0x74]
	mov r2, #5
	mov r3, #0xa
	bl BgSetPosTextAndCommit
_021F522A:
	ldrh r3, [r5, #0x2e]
	add r1, r5, #0
	ldr r2, _021F52F4 ; =0xFFFF8000
	add r0, r3, #0
	lsl r3, r3, #0x11
	lsr r3, r3, #0x11
	add r3, r3, #1
	lsl r3, r3, #0x10
	lsr r6, r3, #0x10
	lsr r3, r2, #0x11
	and r0, r2
	and r3, r6
	orr r0, r3
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x2e]
	add r1, #0x2e
	lsl r0, r0, #0x11
	lsr r0, r0, #0x11
	cmp r0, #8
	bhs _021F5256
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F5256:
	ldrh r0, [r1]
	and r0, r2
	strh r0, [r1]
	ldrh r2, [r1]
	mov r0, #2
	lsl r0, r0, #0xe
	orr r0, r2
	strh r0, [r1]
	cmp r4, #1
	bne _021F52B0
	mov r4, #0
	add r6, r4, #0
	mov r7, #3
_021F5270:
	add r0, r4, #5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	ldr r0, [r5, #0xc]
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0xc]
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	add r2, r7, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #0xc]
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add r4, r4, #1
	cmp r4, #3
	blt _021F5270
_021F52B0:
	ldr r0, _021F52F8 ; =0x04001000
	ldr r1, _021F52FC ; =0xFFFF1FFF
	ldr r2, [r0]
	add r4, r0, #0
	and r1, r2
	str r1, [r0]
	add r1, r0, #0
	mov r2, #0
	add r1, #0x40
	strh r2, [r1]
	add r1, r0, #0
	add r1, #0x44
	strh r2, [r1]
	add r1, r0, #0
	add r1, #0x42
	strh r2, [r1]
	add r1, r0, #0
	add r1, #0x46
	strh r2, [r1]
	add r4, #0x48
	ldrh r1, [r4]
	mov r2, #0x3f
	add r0, #0x4a
	bic r1, r2
	strh r1, [r4]
	ldrh r3, [r4]
	ldr r1, _021F5300 ; =0xFFFFC0FF
	and r1, r3
	strh r1, [r4]
	ldrh r1, [r0]
	bic r1, r2
	strh r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F52F4: .word 0xFFFF8000
_021F52F8: .word 0x04001000
_021F52FC: .word 0xFFFF1FFF
_021F5300: .word 0xFFFFC0FF
	thumb_func_end ov101_021F51C0

	thumb_func_start ov101_021F5304
ov101_021F5304: ; 0x021F5304
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _021F545C ; =gSystem
	mov r4, #0
	ldr r2, [r1, #0x48]
	mov r3, #2
	add r5, r0, #0
	add r6, r4, #0
	tst r3, r2
	beq _021F5344
	ldr r0, [r5, #0xc]
	mov r2, #1
	strb r2, [r0, #6]
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r5, #0xc]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	sub r0, r4, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F5344:
	mov r3, #1
	tst r2, r3
	beq _021F53A4
	add r1, r5, #0
	add r1, #0x24
	ldrb r1, [r1]
	mov r3, #0xe0
	lsl r1, r1, #0x18
	lsr r2, r1, #0x1d
	add r1, r5, #0
	add r1, #0x24
	ldrb r1, [r1]
	bic r1, r3
	add r3, r2, #1
	lsr r6, r3, #0x1f
	lsl r4, r3, #0x1e
	sub r4, r4, r6
	mov r3, #0x1e
	ror r4, r3
	add r3, r6, r4
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x1d
	lsr r3, r3, #0x18
	orr r3, r1
	add r1, r5, #0
	add r1, #0x24
	strb r3, [r1]
	add r1, r5, #0
	add r1, #0x24
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1d
	bl ov101_021F4F34
	add r0, r5, #0
	add r5, #0x24
	ldrb r1, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1d
	bl ov101_021F5780
	ldr r0, _021F5460 ; =0x0000093F
	bl PlaySE
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F53A4:
	ldr r0, [r1, #0x44]
	mov r1, #0x20
	add r2, r0, #0
	tst r2, r1
	beq _021F53B2
	add r4, r1, #0
	sub r4, #0x22
_021F53B2:
	mov r1, #0x10
	tst r1, r0
	beq _021F53BA
	mov r4, #2
_021F53BA:
	mov r1, #0x40
	add r2, r0, #0
	tst r2, r1
	beq _021F53C6
	add r6, r1, #0
	sub r6, #0x42
_021F53C6:
	mov r1, #0x80
	tst r0, r1
	beq _021F53CE
	mov r6, #2
_021F53CE:
	cmp r4, #0
	bne _021F53DC
	cmp r6, #0
	bne _021F53DC
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F53DC:
	mov r0, #0x28
	ldrsh r7, [r5, r0]
	mov r0, #0x2a
	ldrsh r0, [r5, r0]
	add r1, r7, r4
	str r0, [sp]
	ldr r0, _021F5464 ; =ov101_021F8968
	ldr r2, [sp]
	bl TouchscreenHitbox_PointIsIn
	cmp r0, #0
	beq _021F53FC
	mov r0, #0x28
	ldrsh r0, [r5, r0]
	add r0, r0, r4
	strh r0, [r5, #0x28]
_021F53FC:
	mov r2, #0x2a
	mov r1, #0x28
	ldrsh r2, [r5, r2]
	ldrsh r1, [r5, r1]
	ldr r0, _021F5464 ; =ov101_021F8968
	add r2, r2, r6
	bl TouchscreenHitbox_PointIsIn
	cmp r0, #0
	beq _021F5418
	mov r0, #0x2a
	ldrsh r0, [r5, r0]
	add r0, r0, r6
	strh r0, [r5, #0x2a]
_021F5418:
	mov r0, #0x28
	ldrsh r1, [r5, r0]
	cmp r1, r7
	bne _021F542A
	mov r0, #0x2a
	ldrsh r2, [r5, r0]
	ldr r0, [sp]
	cmp r2, r0
	beq _021F5434
_021F542A:
	mov r2, #0x2a
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #0x20]
	bl Sprite_SetPositionXY
_021F5434:
	add r2, r5, #0
	add r2, #0x24
	ldrb r2, [r2]
	add r0, r5, #0
	mov r1, #4
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1d
	bl ov101_021F4F34
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	add r0, r5, #0
	bl ov101_021F56B4
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F545C: .word gSystem
_021F5460: .word 0x0000093F
_021F5464: .word ov101_021F8968
	thumb_func_end ov101_021F5304

	thumb_func_start ov101_021F5468
ov101_021F5468: ; 0x021F5468
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r2, #0
	str r2, [r4]
	add r2, r5, #0
	add r2, #0x24
	ldrb r2, [r2]
	lsl r2, r2, #0x1b
	lsr r2, r2, #0x1c
	beq _021F5488
	mov r1, #1
	str r1, [r4]
	bl ov101_021F5650
	pop {r4, r5, r6, pc}
_021F5488:
	bl ov101_021F5524
	add r6, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021F54A8
	ldr r0, [r5, #0xc]
	mov r1, #1
	str r1, [r0, #0xc]
	ldr r0, [r5, #0xc]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _021F54A8
	add r0, r5, #0
	bl ov101_021F4FDC
_021F54A8:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F5468

	thumb_func_start ov101_021F54AC
ov101_021F54AC: ; 0x021F54AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x26
	ldrb r0, [r0]
	add r4, r3, #0
	lsl r0, r0, #0x1c
	lsr r3, r0, #0x1a
	ldr r0, _021F5520 ; =ov101_021FB2D0
	ldr r0, [r0, r3]
	bl TouchscreenHitbox_FindHitboxAtPoint
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021F54D6
	mov r2, #0xff
	cmp r4, #0
	beq _021F551A
	mov r0, #0
	strb r0, [r4]
	b _021F551A
_021F54D6:
	add r5, #0x26
	ldrb r1, [r5]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	cmp r1, #6
	bhi _021F550A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F54EE: ; jump table
	.short _021F54FC - _021F54EE - 2 ; case 0
	.short _021F54FC - _021F54EE - 2 ; case 1
	.short _021F54FC - _021F54EE - 2 ; case 2
	.short _021F54FC - _021F54EE - 2 ; case 3
	.short _021F550A - _021F54EE - 2 ; case 4
	.short _021F5502 - _021F54EE - 2 ; case 5
	.short _021F5506 - _021F54EE - 2 ; case 6
_021F54FC:
	lsl r1, r0, #0x17
	lsr r2, r1, #0x18
	b _021F550C
_021F5502:
	mov r2, #6
	b _021F550C
_021F5506:
	mov r2, #7
	b _021F550C
_021F550A:
	mov r2, #5
_021F550C:
	cmp r4, #0
	beq _021F551A
	mov r1, #1
	and r1, r0
	mov r0, #2
	sub r0, r0, r1
	strb r0, [r4]
_021F551A:
	add r0, r2, #0
	pop {r3, r4, r5, pc}
	nop
_021F5520: .word ov101_021FB2D0
	thumb_func_end ov101_021F54AC

	thumb_func_start ov101_021F5524
ov101_021F5524: ; 0x021F5524
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r1, #0
	bl System_GetTouchNew
	cmp r0, #0
	bne _021F553C
	mov r0, #0
	add sp, #4
	mvn r0, r0
	pop {r3, r4, r5, r6, pc}
_021F553C:
	ldr r0, [r5, #0xc]
	bl PokegearApp_HandleTouchInput_SwitchApps
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021F5552
	mov r1, #1
	add sp, #4
	str r1, [r4]
	pop {r3, r4, r5, r6, pc}
_021F5552:
	ldr r0, _021F5640 ; =ov101_021F8984
	bl TouchscreenHitbox_FindRectAtTouchNew
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021F55A8
	add r2, r5, #0
	add r2, #0x24
	ldrb r2, [r2]
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x1d
	bl ov101_021F4F34
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov101_021F5780
	ldr r0, _021F5644 ; =0x0000093F
	bl PlaySE
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	mov r1, #0xe0
	add r5, #0x24
	bic r0, r1
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	str r0, [r4]
	add sp, #4
	sub r0, r0, #2
	pop {r3, r4, r5, r6, pc}
_021F55A8:
	ldr r2, _021F5648 ; =gSystem + 0x40
	ldr r0, _021F564C ; =ov101_021F8968
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl TouchscreenHitbox_PointIsIn
	cmp r0, #0
	bne _021F55C0
	mov r0, #0
	add sp, #4
	mvn r0, r0
	pop {r3, r4, r5, r6, pc}
_021F55C0:
	mov r0, #0xfe
	add r1, sp, #0
	strb r0, [r1]
	mov r0, #8
	strb r0, [r1, #3]
	mov r0, #0x28
	ldrsh r0, [r5, r0]
	ldr r2, _021F5648 ; =gSystem + 0x40
	strb r0, [r1, #1]
	mov r0, #0x2a
	ldrsh r0, [r5, r0]
	strb r0, [r1, #2]
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	add r0, sp, #0
	bl TouchscreenHitbox_PointIsIn
	cmp r0, #0
	beq _021F5636
	ldr r0, _021F5648 ; =gSystem + 0x40
	mov r2, #0x2a
	ldrh r1, [r0, #0x20]
	strh r1, [r5, #0x28]
	ldrh r0, [r0, #0x22]
	mov r1, #0x28
	strh r0, [r5, #0x2a]
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #0x20]
	bl Sprite_SetPositionXY
	add r0, r5, #0
	add r0, #0x24
	ldrb r1, [r0]
	mov r0, #0x1e
	add r2, r5, #0
	bic r1, r0
	mov r0, #2
	orr r1, r0
	add r0, r5, #0
	add r0, #0x24
	strb r1, [r0]
	mov r0, #1
	str r0, [r4]
	add r2, #0x24
	ldrb r2, [r2]
	add r0, r5, #0
	mov r1, #4
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1d
	bl ov101_021F4F34
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	add r0, r5, #0
	bl ov101_021F56B4
_021F5636:
	mov r0, #0
	mvn r0, r0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021F5640: .word ov101_021F8984
_021F5644: .word 0x0000093F
_021F5648: .word gSystem + 0x40
_021F564C: .word ov101_021F8968
	thumb_func_end ov101_021F5524

	thumb_func_start ov101_021F5650
ov101_021F5650: ; 0x021F5650
	push {r4, lr}
	add r4, r0, #0
	bl System_GetTouchHeld
	cmp r0, #0
	bne _021F5670
	add r0, r4, #0
	add r0, #0x24
	ldrb r1, [r0]
	mov r0, #0x1e
	add r4, #0x24
	bic r1, r0
	mov r0, #0
	strb r1, [r4]
	mvn r0, r0
	pop {r4, pc}
_021F5670:
	ldr r2, _021F56AC ; =gSystem + 0x40
	ldr r0, _021F56B0 ; =ov101_021F8968
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl TouchscreenHitbox_PointIsIn
	cmp r0, #0
	beq _021F56A6
	ldr r0, _021F56AC ; =gSystem + 0x40
	mov r2, #0x2a
	ldrh r1, [r0, #0x20]
	strh r1, [r4, #0x28]
	ldrh r0, [r0, #0x22]
	mov r1, #0x28
	strh r0, [r4, #0x2a]
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x20]
	bl Sprite_SetPositionXY
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	add r0, r4, #0
	bl ov101_021F56B4
_021F56A6:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
_021F56AC: .word gSystem + 0x40
_021F56B0: .word ov101_021F8968
	thumb_func_end ov101_021F5650

	thumb_func_start ov101_021F56B4
ov101_021F56B4: ; 0x021F56B4
	push {r3, r4, r5, lr}
	mov r4, #0
	add r3, sp, #0
	strb r4, [r3]
	add r3, sp, #0
	add r5, r0, #0
	bl ov101_021F54AC
	add r4, r0, #0
	cmp r4, #0xff
	bne _021F5700
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1e
	beq _021F56E6
	add r0, r5, #0
	bl ov101_021F5048
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
_021F56E6:
	add r0, r5, #0
	add r0, #0x26
	ldrb r1, [r0]
	mov r0, #0x30
	bic r1, r0
	add r0, r5, #0
	add r0, #0x26
	strb r1, [r0]
	mov r0, #0xff
	add r5, #0x27
	strb r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F5700:
	add r0, r5, #0
	add r0, #0x27
	ldrb r0, [r0]
	cmp r4, r0
	bne _021F574C
	add r0, sp, #0
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1e
	cmp r1, r0
	beq _021F5748
	cmp r1, #2
	ldr r0, [r5, #0x60]
	bne _021F572A
	mov r1, #0
	bl ov101_021F5A9C
	b _021F5730
_021F572A:
	mov r1, #1
	bl ov101_021F5A9C
_021F5730:
	add r0, r5, #0
	add r0, #0x26
	ldrb r1, [r0]
	mov r0, #0x30
	add r5, #0x26
	bic r1, r0
	add r0, sp, #0
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1a
	orr r0, r1
	strb r0, [r5]
_021F5748:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F574C:
	cmp r0, #0xff
	beq _021F5756
	add r0, r5, #0
	bl ov101_021F5048
_021F5756:
	add r0, r5, #0
	add r0, #0x27
	strb r4, [r0]
	add r0, r5, #0
	add r0, #0x26
	ldrb r1, [r0]
	mov r0, #0x30
	bic r1, r0
	add r0, sp, #0
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1a
	orr r1, r0
	add r0, r5, #0
	add r0, #0x26
	strb r1, [r0]
	add r0, r5, #0
	bl ov101_021F5000
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F56B4

	thumb_func_start ov101_021F5780
ov101_021F5780: ; 0x021F5780
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F57B0 ; =ov101_021F89B4 + 1
	lsl r1, r1, #3
	ldrb r0, [r0, r1]
	mov r2, #0x2a
	strh r0, [r4, #0x28]
	ldr r0, _021F57B4 ; =ov101_021F89B4 + 2
	ldrb r0, [r0, r1]
	mov r1, #0x28
	strh r0, [r4, #0x2a]
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x20]
	bl Sprite_SetPositionXY
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	add r0, r4, #0
	bl ov101_021F56B4
	pop {r4, pc}
	.balign 4, 0
_021F57B0: .word ov101_021F89B4 + 1
_021F57B4: .word ov101_021F89B4 + 2
	thumb_func_end ov101_021F5780

	thumb_func_start ov101_021F57B8
ov101_021F57B8: ; 0x021F57B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	bl Save_LocalFieldData_Get
	add r4, r0, #0
	bl LocalFieldData_GetPlayer
	str r0, [sp, #4]
	add r0, r4, #0
	bl LocalFieldData_GetMusicIdAddr
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	mov r1, #0x74
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x74
	bl MI_CpuFill8
	str r5, [r4, #4]
	strh r6, [r4, #8]
	add r0, r4, #0
	strh r7, [r4, #0xa]
	add r0, #0x66
	ldrb r0, [r0]
	mov r1, #4
	ldr r3, [sp, #0x30]
	bic r0, r1
	ldr r1, [sp]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1d
	orr r1, r0
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
	ldr r0, [sp, #0x20]
	str r0, [r4, #0xc]
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x28]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x2c]
	str r0, [r4, #0x18]
	lsr r1, r0, #0x10
	add r0, r4, #0
	add r0, #0x5b
	strb r1, [r0]
	ldr r0, [r4, #0x18]
	lsr r1, r0, #8
	add r0, r4, #0
	add r0, #0x5d
	strb r1, [r0]
	add r0, r4, #0
	ldr r1, [r4, #0x18]
	add r0, #0x5c
	strb r1, [r0]
	mov r1, #0x1b
	add r2, r1, #0
	str r3, [r4]
	mov r0, #0
	add r2, #0xf2
	bl NewMsgDataFromNarc
	str r0, [r4, #0x20]
	ldr r2, [r4]
	mov r0, #8
	mov r1, #0x33
	bl MessageFormat_New_Custom
	str r0, [r4, #0x44]
	ldr r1, [r4]
	mov r0, #0x33
	bl String_New
	str r0, [r4, #0x48]
	ldr r1, [r4]
	mov r0, #0x33
	bl String_New
	str r0, [r4, #0x4c]
	ldr r1, [r4]
	mov r0, #0x33
	bl String_New
	str r0, [r4, #0x50]
	ldr r0, _021F589C ; =0x00000547
	ldr r1, [r4]
	bl String_New
	str r0, [r4, #0x6c]
	ldr r0, _021F589C ; =0x00000547
	ldr r1, [r4]
	bl String_New
	str r0, [r4, #0x70]
	ldr r0, [sp, #4]
	bl sub_0205C7EC
	cmp r0, #1
	beq _021F5896
	ldr r0, [sp, #8]
	mov r1, #0
	strh r1, [r0]
_021F5896:
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F589C: .word 0x00000547
	thumb_func_end ov101_021F57B8

	thumb_func_start ov101_021F58A0
ov101_021F58A0: ; 0x021F58A0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x70]
	bl String_Delete
	ldr r0, [r4, #0x6c]
	bl String_Delete
	ldr r0, [r4, #0x50]
	bl String_Delete
	ldr r0, [r4, #0x4c]
	bl String_Delete
	ldr r0, [r4, #0x48]
	bl String_Delete
	ldr r0, [r4, #0x44]
	bl MessageFormat_Delete
	ldr r0, [r4, #0x20]
	bl DestroyMsgData
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x74
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov101_021F58A0

	thumb_func_start ov101_021F58E0
ov101_021F58E0: ; 0x021F58E0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #8
	blt _021F58EC
	mov r5, #0
_021F58EC:
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	beq _021F590A
	add r0, r4, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r4, #0x66
	bic r1, r0
	strb r1, [r4]
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_021F590A:
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x28
	add r1, #0x38
	bl GF_RTC_CopyDateTime
	cmp r5, #7
	bhi _021F596C
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F5926: ; jump table
	.short _021F5936 - _021F5926 - 2 ; case 0
	.short _021F593A - _021F5926 - 2 ; case 1
	.short _021F593E - _021F5926 - 2 ; case 2
	.short _021F594C - _021F5926 - 2 ; case 3
	.short _021F595C - _021F5926 - 2 ; case 4
	.short _021F5960 - _021F5926 - 2 ; case 5
	.short _021F5964 - _021F5926 - 2 ; case 6
	.short _021F5968 - _021F5926 - 2 ; case 7
_021F5936:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F593A:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F593E:
	ldr r1, [r4, #0x38]
	mov r0, #1
	and r0, r1
	add r0, r0, #5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F594C:
	ldr r0, [r4, #0x38]
	mov r1, #3
	bl _u32_div_f
	add r0, r1, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, pc}
_021F595C:
	mov r0, #7
	pop {r3, r4, r5, pc}
_021F5960:
	mov r0, #8
	pop {r3, r4, r5, pc}
_021F5964:
	mov r0, #9
	pop {r3, r4, r5, pc}
_021F5968:
	mov r0, #0xa
	pop {r3, r4, r5, pc}
_021F596C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F58E0

	thumb_func_start ov101_021F5970
ov101_021F5970: ; 0x021F5970
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x66
	add r4, r2, #0
	ldrb r2, [r0]
	mov r0, #1
	bic r2, r0
	add r0, r5, #0
	add r0, #0x66
	strb r2, [r0]
	cmp r1, #8
	blt _021F598A
	mov r1, #0
_021F598A:
	add r0, r5, #0
	add r0, #0x58
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x59
	ldrb r2, [r0]
	cmp r2, #0xb
	beq _021F59A0
	add r0, r5, #0
	add r0, #0x5a
	strb r2, [r0]
_021F59A0:
	add r0, r5, #0
	bl ov101_021F58E0
	add r1, r5, #0
	add r1, #0x59
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #0
	add r0, #0x5e
	strb r1, [r0]
	add r0, r5, #0
	mov r2, #0x2d
	add r0, #0x68
	strb r2, [r0]
	add r0, r5, #0
	add r0, #0x67
	strb r1, [r0]
	add r0, r5, #0
	mov r2, #8
	add r0, #0x6a
	strb r2, [r0]
	add r0, r5, #0
	add r0, #0x69
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x66
	ldrb r0, [r0]
	mov r2, #2
	bic r0, r2
	lsl r2, r4, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1e
	orr r2, r0
	add r0, r5, #0
	add r0, #0x66
	strb r2, [r0]
	add r0, r5, #0
	add r0, #0x66
	ldrb r2, [r0]
	mov r0, #8
	bic r2, r0
	add r0, r5, #0
	add r0, #0x66
	strb r2, [r0]
	add r0, r5, #0
	add r0, #0x5f
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x59
	ldrb r2, [r0]
	cmp r2, #0xb
	beq _021F5A16
	add r0, r5, #0
	add r0, #0x5a
	ldrb r0, [r0]
	cmp r0, r2
	beq _021F5A16
	str r1, [r5, #0x54]
_021F5A16:
	add r0, r5, #0
	add r0, #0x5c
	ldrb r2, [r0]
	ldr r0, [r5, #0xc]
	lsl r1, r2, #4
	orr r1, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0xc]
	bl CopyWindowToVram
	add r1, r5, #0
	add r1, #0x59
	ldrb r2, [r1]
	mov r1, #0xc
	add r0, r5, #0
	add r3, r2, #0
	mul r3, r1
	ldr r1, _021F5A4C ; =ov101_021F8A04
	ldr r1, [r1, r3]
	blx r1
	add r0, r5, #0
	bl ov101_021F5C44
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F5A4C: .word ov101_021F8A04
	thumb_func_end ov101_021F5970

	thumb_func_start ov101_021F5A50
ov101_021F5A50: ; 0x021F5A50
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x1c]
	cmp r1, #0
	beq _021F5A6C
	add r1, r4, #0
	add r1, #0x59
	ldrb r2, [r1]
	mov r1, #0xc
	add r3, r2, #0
	mul r3, r1
	ldr r1, _021F5A98 ; =ov101_021F8A04 + 8
	ldr r1, [r1, r3]
	blx r1
_021F5A6C:
	add r0, r4, #0
	add r0, #0x5c
	ldrb r2, [r0]
	ldr r0, [r4, #0xc]
	lsl r1, r2, #4
	orr r1, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0xc]
	bl CopyWindowToVram
	add r0, r4, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r4, #0x66
	bic r1, r0
	strb r1, [r4]
	pop {r4, pc}
	nop
_021F5A98: .word ov101_021F8A04 + 8
	thumb_func_end ov101_021F5A50

	thumb_func_start ov101_021F5A9C
ov101_021F5A9C: ; 0x021F5A9C
	add r2, r0, #0
	add r2, #0x66
	ldrb r3, [r2]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #2
	lsl r1, r1, #0x1f
	bic r3, r2
	lsr r1, r1, #0x1e
	orr r1, r3
	add r0, #0x66
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F5A9C

	thumb_func_start ov101_021F5AB8
ov101_021F5AB8: ; 0x021F5AB8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x67
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x68
	ldrb r0, [r0]
	cmp r1, r0
	bhs _021F5ADA
	add r0, r4, #0
	add r0, #0x67
	ldrb r0, [r0]
	add r4, #0x67
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #0
	pop {r4, pc}
_021F5ADA:
	add r0, r4, #0
	add r0, #0x69
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F5AF6
	mov r1, #0
	ldr r0, [r4, #0xc]
	mov r2, #2
	add r3, r1, #0
	bl ScrollWindow
	ldr r0, [r4, #0xc]
	bl CopyWindowToVram
_021F5AF6:
	add r0, r4, #0
	add r0, #0x69
	ldrb r2, [r0]
	add r0, r4, #0
	add r0, #0x69
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x69
	strb r1, [r0]
	cmp r2, #8
	bhs _021F5B12
	mov r0, #0
	pop {r4, pc}
_021F5B12:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x69
	strb r1, [r0]
	add r4, #0x67
	strb r1, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F5AB8

	thumb_func_start ov101_021F5B24
ov101_021F5B24: ; 0x021F5B24
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	ldr r0, [r4, #0xc]
	mov r2, #2
	add r3, r1, #0
	bl ScrollWindow
	ldr r0, [r4, #0xc]
	bl CopyWindowToVram
	add r0, r4, #0
	add r0, #0x69
	ldrb r2, [r0]
	add r0, r4, #0
	add r0, #0x69
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x69
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x6a
	ldrb r0, [r0]
	cmp r2, r0
	bhs _021F5B5C
	mov r0, #0
	pop {r4, pc}
_021F5B5C:
	mov r0, #0
	add r4, #0x69
	strb r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F5B24

	thumb_func_start ov101_021F5B68
ov101_021F5B68: ; 0x021F5B68
	add r1, r0, #0
	add r1, #0x67
	ldrb r3, [r1]
	add r1, r0, #0
	add r1, #0x67
	ldrb r1, [r1]
	add r2, r1, #1
	add r1, r0, #0
	add r1, #0x67
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x68
	ldrb r1, [r1]
	cmp r3, r1
	bhs _021F5B8A
	mov r0, #0
	bx lr
_021F5B8A:
	mov r1, #0
	add r0, #0x67
	strb r1, [r0]
	mov r0, #1
	bx lr
	thumb_func_end ov101_021F5B68

	thumb_func_start ov101_021F5B94
ov101_021F5B94: ; 0x021F5B94
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x5e
	ldrb r1, [r1]
	cmp r1, #3
	bhi _021F5C38
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F5BAE: ; jump table
	.short _021F5BB6 - _021F5BAE - 2 ; case 0
	.short _021F5BCE - _021F5BAE - 2 ; case 1
	.short _021F5BFE - _021F5BAE - 2 ; case 2
	.short _021F5C14 - _021F5BAE - 2 ; case 3
_021F5BB6:
	add r1, r4, #0
	add r1, #0x59
	ldrb r2, [r1]
	mov r1, #0xc
	add r3, r2, #0
	mul r3, r1
	ldr r1, _021F5C3C ; =ov101_021F8A04 + 4
	ldr r1, [r1, r3]
	blx r1
	add r4, #0x5e
	strb r0, [r4]
	pop {r4, pc}
_021F5BCE:
	add r1, r4, #0
	add r1, #0x59
	ldrb r2, [r1]
	mov r1, #0xc
	add r3, r2, #0
	mul r3, r1
	ldr r1, _021F5C40 ; =ov101_021F8A04 + 8
	ldr r1, [r1, r3]
	blx r1
	add r0, r4, #0
	mov r1, #0x10
	add r0, #0x6a
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0xf
	add r0, #0x68
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x5e
	ldrb r0, [r0]
	add r4, #0x5e
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_021F5BFE:
	bl ov101_021F5B24
	cmp r0, #0
	beq _021F5C38
	add r0, r4, #0
	add r0, #0x5e
	ldrb r0, [r0]
	add r4, #0x5e
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_021F5C14:
	bl ov101_021F5B68
	cmp r0, #0
	beq _021F5C38
	add r2, r4, #0
	add r2, #0x66
	add r1, r4, #0
	ldrb r2, [r2]
	add r1, #0x58
	ldrb r1, [r1]
	lsl r2, r2, #0x1e
	add r0, r4, #0
	lsr r2, r2, #0x1f
	bl ov101_021F5970
	mov r0, #0
	add r4, #0x5e
	strb r0, [r4]
_021F5C38:
	pop {r4, pc}
	nop
_021F5C3C: .word ov101_021F8A04 + 4
_021F5C40: .word ov101_021F8A04 + 8
	thumb_func_end ov101_021F5B94

	thumb_func_start ov101_021F5C44
ov101_021F5C44: ; 0x021F5C44
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021F5C9C ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #0x4c]
	bl AddTextPrinterParameterizedWithColor
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021F5C9C ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x50]
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [r4, #0x10]
	bl ScheduleWindowCopyToVram
	ldr r0, [r4, #0x14]
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	nop
_021F5C9C: .word 0x00010200
	thumb_func_end ov101_021F5C44

	thumb_func_start PrintRadioLine
PrintRadioLine: ; 0x021F5CA0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r4, r1, #0
	add r6, r2, #0
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021F5CBE
	add r0, r4, #0
	mov r1, #0x46
	bl String_RadioAddStatic
_021F5CBE:
	lsl r0, r6, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0xc]
	add r2, r4, #0
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end PrintRadioLine

	thumb_func_start RadioPrintAdvance
RadioPrintAdvance: ; 0x021F5CDC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x66
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _021F5CFE
	add r0, r4, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r1, r0
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
_021F5CFE:
	add r0, r4, #0
	add r0, #0x62
	ldrb r2, [r0]
	add r0, r4, #0
	add r0, #0x62
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x62
	strb r1, [r0]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x6c]
	bl String_GetLineN
	ldr r1, [r4, #0x48]
	add r0, r4, #0
	mov r2, #1
	bl PrintRadioLine
	ldr r0, [r4, #0xc]
	bl CopyWindowToVram
	add r0, r4, #0
	add r0, #0x62
	add r4, #0x63
	ldrb r1, [r0]
	ldrb r0, [r4]
	cmp r1, r0
	blo _021F5D3C
	mov r0, #1
	pop {r4, pc}
_021F5D3C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end RadioPrintAdvance

	thumb_func_start RadioPrintInit
RadioPrintInit: ; 0x021F5D40
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x65
	strb r2, [r0]
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x70]
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x70]
	bl StringExpandPlaceholders
	add r0, r4, #0
	mov r1, #0
	add r0, #0x62
	strb r1, [r0]
	ldr r0, [r4, #0x6c]
	bl String_CountLines
	add r1, r4, #0
	add r1, #0x63
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x64
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x62
	ldrb r2, [r0]
	add r0, r4, #0
	add r0, #0x62
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x62
	strb r1, [r0]
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x6c]
	bl String_GetLineN
	add r2, r4, #0
	add r2, #0x66
	ldrb r2, [r2]
	ldr r1, [r4, #0x48]
	add r0, r4, #0
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1f
	bl PrintRadioLine
	ldr r0, [r4, #0xc]
	bl CopyWindowToVram
	add r0, r4, #0
	add r0, #0x62
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x63
	ldrb r0, [r0]
	cmp r1, r0
	blo _021F5DC2
	mov r0, #5
	add r4, #0x64
	strb r0, [r4]
	pop {r4, pc}
_021F5DC2:
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _021F5DD6
	mov r0, #1
	add r4, #0x64
	strb r0, [r4]
	pop {r4, pc}
_021F5DD6:
	mov r0, #3
	add r4, #0x64
	strb r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioPrintInit

	thumb_func_start RadioPrintInitEz
RadioPrintInitEz: ; 0x021F5DE0
	ldr r3, _021F5DE8 ; =RadioPrintInit
	mov r2, #0
	bx r3
	nop
_021F5DE8: .word RadioPrintInit
	thumb_func_end RadioPrintInitEz

	thumb_func_start RadioPrintAndPlayJingle
RadioPrintAndPlayJingle: ; 0x021F5DEC
	push {r4, lr}
	add r4, r0, #0
	bl RadioPrintInitEz
	add r0, r4, #0
	mov r1, #1
	add r0, #0x65
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #8
	add r4, #0x66
	orr r0, r1
	strb r0, [r4]
	mov r0, #0
	bl SndRadio_StopSeq
	ldr r0, _021F5E18 ; =SEQ_GS_RADIO_JINGLE
	bl SndRadio_StartSeq
	pop {r4, pc}
	.balign 4, 0
_021F5E18: .word SEQ_GS_RADIO_JINGLE
	thumb_func_end RadioPrintAndPlayJingle

	thumb_func_start Radio_RunTextPrinter
Radio_RunTextPrinter: ; 0x021F5E1C
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x64
	ldrb r1, [r1]
	cmp r1, #6
	bhi _021F5EB0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F5E36: ; jump table
	.short _021F5EB0 - _021F5E36 - 2 ; case 0
	.short _021F5E7E - _021F5E36 - 2 ; case 1
	.short _021F5E44 - _021F5E36 - 2 ; case 2
	.short _021F5E6E - _021F5E36 - 2 ; case 3
	.short _021F5E8E - _021F5E36 - 2 ; case 4
	.short _021F5E9E - _021F5E36 - 2 ; case 5
	.short _021F5EA6 - _021F5E36 - 2 ; case 6
_021F5E44:
	bl RadioPrintAdvance
	cmp r0, #0
	beq _021F5E66
	add r0, r4, #0
	add r0, #0x65
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F5E5E
	mov r0, #6
	add r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E5E:
	mov r0, #4
	add r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E66:
	mov r0, #3
	add r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E6E:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F5EB0
	mov r0, #2
	add r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E7E:
	bl ov101_021F5B68
	cmp r0, #0
	beq _021F5EB0
	mov r0, #2
	add r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E8E:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F5EB0
	mov r0, #6
	add r4, #0x64
	strb r0, [r4]
	b _021F5EB0
_021F5E9E:
	bl ov101_021F5B68
	cmp r0, #0
	beq _021F5EB0
_021F5EA6:
	mov r0, #0
	add r4, #0x64
	strb r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021F5EB0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end Radio_RunTextPrinter

	thumb_func_start Radio_RunTextPrinter_WaitJingle
Radio_RunTextPrinter_WaitJingle: ; 0x021F5EB4
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x5f
	ldrb r1, [r1]
	cmp r1, #0
	beq _021F5EC8
	cmp r1, #1
	beq _021F5EDE
	b _021F5EF0
_021F5EC8:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F5EF0
	add r0, r4, #0
	add r0, #0x5f
	ldrb r0, [r0]
	add r4, #0x5f
	add r0, r0, #1
	strb r0, [r4]
	b _021F5EF0
_021F5EDE:
	bl SndRadio_CountPlayingSeq
	cmp r0, #0
	bne _021F5EF0
	mov r0, #0
	add r4, #0x5f
	strb r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021F5EF0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end Radio_RunTextPrinter_WaitJingle

	thumb_func_start RadioShow_PokemonMusic_StartPlaying
RadioShow_PokemonMusic_StartPlaying: ; 0x021F5EF4
	push {r4, lr}
	ldr r4, [r0, #0x1c]
	cmp r1, #4
	bne _021F5F1A
	bl LCRandom
	ldr r1, _021F5F34 ; =25000
	bl _s32_div_f
	add r0, r1, #0
	mov r1, #1000>>2
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	lsl r2, r1, #1
	ldr r0, _021F5F38 ; =ov101_021F8A9C
	b _021F5F1E
_021F5F1A:
	ldr r0, _021F5F3C ; =ov101_021F8A94
	lsl r2, r1, #1
_021F5F1E:
	ldrb r3, [r4, #4]
	ldrh r0, [r0, r2]
	mov r2, #0xfe
	lsl r1, r1, #0x19
	bic r3, r2
	lsr r1, r1, #0x18
	orr r1, r3
	strb r1, [r4, #4]
	bl SndRadio_StartSeq
	pop {r4, pc}
	.balign 4, 0
_021F5F34: .word 25000
_021F5F38: .word ov101_021F8A9C
_021F5F3C: .word ov101_021F8A94
	thumb_func_end RadioShow_PokemonMusic_StartPlaying

	thumb_func_start RadioShow_PokemonMusic_Setup
RadioShow_PokemonMusic_Setup: ; 0x021F5F40
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0x38
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x38
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	bl Save_Pokedex_Get
	bl Pokedex_GetNatDexFlag
	ldrb r1, [r4, #4]
	mov r2, #1
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #1
	and r0, r2
	orr r0, r1
	strb r0, [r4, #4]
	add r0, r4, #0
	add r0, #0xc
	add r1, sp, #0
	bl GF_RTC_CopyDateTime
	ldr r0, [r4, #0x18]
	strb r0, [r4, #6]
	ldrb r0, [r4, #6]
	add r0, r0, #msg_0416_00003
	strb r0, [r4, #5]
	ldrb r0, [r4, #6]
	cmp r0, #6
	bhi _021F6006
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F5F9A: ; jump table
	.short _021F5FA8 - _021F5F9A - 2 ; case 0
	.short _021F5FCC - _021F5F9A - 2 ; case 1
	.short _021F5FEA - _021F5F9A - 2 ; case 2
	.short _021F5FD2 - _021F5F9A - 2 ; case 3
	.short _021F5FF0 - _021F5F9A - 2 ; case 4
	.short _021F5FCC - _021F5F9A - 2 ; case 5
	.short _021F5FEA - _021F5F9A - 2 ; case 6
_021F5FA8:
	ldr r0, [r5, #4]
	bl Save_Bag_Get
	ldr r1, _021F603C ; =ITEM_GB_SOUNDS
	ldr r3, [r4]
	mov r2, #1
	bl Bag_HasItem
	cmp r0, #0
	beq _021F5FC2
	mov r0, #4
	strb r0, [r4, #7]
	b _021F6006
_021F5FC2:
	mov r0, #0
	strb r0, [r4, #7]
	mov r0, #msg_0416_00012 ; Sunday March
	strb r0, [r4, #5]
	b _021F6006
_021F5FCC:
	mov r0, #0
	strb r0, [r4, #7]
	b _021F6006
_021F5FD2:
	ldrb r0, [r4, #4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021F5FE4
	mov r0, #2
	strb r0, [r4, #7]
	mov r0, #msg_0416_00010 ; Wednesday Hoenn
	strb r0, [r4, #5]
	b _021F6006
_021F5FE4:
	mov r0, #0
	strb r0, [r4, #7]
	b _021F6006
_021F5FEA:
	mov r0, #1
	strb r0, [r4, #7]
	b _021F6006
_021F5FF0:
	ldrb r0, [r4, #4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021F6002
	mov r0, #3
	strb r0, [r4, #7]
	mov r0, #msg_0416_00011 ; Thursday Sinnoh
	strb r0, [r4, #5]
	b _021F6006
_021F6002:
	mov r0, #1
	strb r0, [r4, #7]
_021F6006:
	add r0, r5, #0
	str r4, [r5, #0x1c]
	mov r1, #0
	add r0, #0x61
	strb r1, [r0]
	add r0, r5, #0
	bl RadioShow_PokemonMusic_InitGMM
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	ldrb r1, [r4, #7]
	add r0, r5, #0
	bl RadioShow_PokemonMusic_StartPlaying
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #1
	add r5, #0x66
	bic r1, r0
	strb r1, [r5]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021F603C: .word ITEM_GB_SOUNDS
	thumb_func_end RadioShow_PokemonMusic_Setup

	thumb_func_start RadioShow_PokemonMusic_Teardown
RadioShow_PokemonMusic_Teardown: ; 0x021F6040
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F613C
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0x38
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_PokemonMusic_Teardown

	thumb_func_start RadioShow_PokemonMusic_Print
RadioShow_PokemonMusic_Print: ; 0x021F6060
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrb r1, [r4, #8]
	cmp r1, #4
	bhi _021F610E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F607A: ; jump table
	.short _021F6084 - _021F607A - 2 ; case 0
	.short _021F6092 - _021F607A - 2 ; case 1
	.short _021F60A2 - _021F607A - 2 ; case 2
	.short _021F60BA - _021F607A - 2 ; case 3
	.short _021F6100 - _021F607A - 2 ; case 4
_021F6084:
	mov r1, #2
	bl RadioPrintInitEz
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _021F610E
_021F6092:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F610E
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _021F610E
_021F60A2:
	add r0, r4, #0
	add r0, #0x1c
	bl GF_RTC_CopyDate
	ldrb r1, [r4, #5]
	add r0, r5, #0
	bl RadioPrintInitEz
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _021F610E
_021F60BA:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F610E
	add r0, sp, #0
	bl GF_RTC_CopyDate
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x24]
	cmp r1, r0
	bne _021F60E0
	ldr r0, [r4, #0x14]
	cmp r1, r0
	bne _021F60E0
	mov r0, #2
	strb r0, [r4, #8]
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F60E0:
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #8
	add r5, #0x66
	orr r0, r1
	strb r0, [r5]
	bl GF_GetCurrentPlayingBGM
	mov r1, #0x1e
	bl StopBGM
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	b _021F610E
_021F6100:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F610E
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F610E:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end RadioShow_PokemonMusic_Print

	thumb_func_start RadioShow_PokemonMusic_InitGMM
RadioShow_PokemonMusic_InitGMM: ; 0x021F6114
	push {r4, lr}
	add r4, r0, #0
	mov r2, #0x1a
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #4
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	pop {r4, pc}
	thumb_func_end RadioShow_PokemonMusic_InitGMM

	thumb_func_start ov101_021F613C
ov101_021F613C: ; 0x021F613C
	ldr r3, _021F6144 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6144: .word DestroyMsgData
	thumb_func_end ov101_021F613C

	thumb_func_start RadioShow_PokeFlute_Setup
RadioShow_PokeFlute_Setup: ; 0x021F6148
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #4
	bl AllocFromHeap
	mov r1, #0
	mov r2, #4
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl ov101_021F61A4
	bl GF_GetCurrentPlayingBGM
	mov r1, #1
	bl StopBGM
	ldr r0, _021F617C ; =SEQ_GS_HUE
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F617C: .word SEQ_GS_HUE
	thumb_func_end RadioShow_PokeFlute_Setup

	thumb_func_start RadioShow_PokeFlute_Teardown
RadioShow_PokeFlute_Teardown: ; 0x021F6180
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F61CC
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_PokeFlute_Teardown

	thumb_func_start RadioShow_PokeFlute_Print
RadioShow_PokeFlute_Print: ; 0x021F61A0
	mov r0, #0
	bx lr
	thumb_func_end RadioShow_PokeFlute_Print

	thumb_func_start ov101_021F61A4
ov101_021F61A4: ; 0x021F61A4
	push {r4, lr}
	add r4, r0, #0
	ldr r2, _021F61C8 ; =0x000001A1
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x50]
	bl String_SetEmpty
	pop {r4, pc}
	nop
_021F61C8: .word 0x000001A1
	thumb_func_end ov101_021F61A4

	thumb_func_start ov101_021F61CC
ov101_021F61CC: ; 0x021F61CC
	ldr r3, _021F61D4 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F61D4: .word DestroyMsgData
	thumb_func_end ov101_021F61CC

	thumb_func_start RadioShow_Unown_Setup
RadioShow_Unown_Setup: ; 0x021F61D8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #4
	bl AllocFromHeap
	mov r1, #0
	mov r2, #4
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_Unown_Init
	bl GF_GetCurrentPlayingBGM
	mov r1, #1
	bl StopBGM
	ldr r0, _021F620C ; =SEQ_GS_RADIO_UNKNOWN
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F620C: .word SEQ_GS_RADIO_UNKNOWN
	thumb_func_end RadioShow_Unown_Setup

	thumb_func_start RadioShow_Unown_Teardown
RadioShow_Unown_Teardown: ; 0x021F6210
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F625C
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #4
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_Unown_Teardown

	thumb_func_start RadioShow_Unown_Print
RadioShow_Unown_Print: ; 0x021F6230
	mov r0, #0
	bx lr
	thumb_func_end RadioShow_Unown_Print

	thumb_func_start RadioShow_Unown_Init
RadioShow_Unown_Init: ; 0x021F6234
	push {r4, lr}
	add r4, r0, #0
	ldr r2, _021F6258 ; =0x0000019A
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x50]
	bl String_SetEmpty
	pop {r4, pc}
	nop
_021F6258: .word 0x0000019A
	thumb_func_end RadioShow_Unown_Init

	thumb_func_start ov101_021F625C
ov101_021F625C: ; 0x021F625C
	ldr r3, _021F6264 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6264: .word DestroyMsgData
	thumb_func_end ov101_021F625C

	thumb_func_start RadioShow_TeamRocket_Setup
RadioShow_TeamRocket_Setup: ; 0x021F6268
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_TeamRocket_Init
	bl GF_GetCurrentPlayingBGM
	mov r1, #1
	bl StopBGM
	mov r0, #0
	strb r0, [r4, #4]
	ldr r0, _021F62A0 ; =SEQ_GS_SENKYO_R
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F62A0: .word SEQ_GS_SENKYO_R
	thumb_func_end RadioShow_TeamRocket_Setup

	thumb_func_start RadioShow_TeamRocket_Teardown
RadioShow_TeamRocket_Teardown: ; 0x021F62A4
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F6320
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_TeamRocket_Teardown

	thumb_func_start RadioShow_TeamRocket_Print
RadioShow_TeamRocket_Print: ; 0x021F62C4
	push {r4, lr}
	ldr r4, [r0, #0x1c]
	ldrb r1, [r4, #4]
	cmp r1, #0
	beq _021F62D4
	cmp r1, #1
	beq _021F62E2
	b _021F62EE
_021F62D4:
	mov r1, #2
	bl RadioPrintInitEz
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _021F62EE
_021F62E2:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F62EE
	mov r0, #0
	strb r0, [r4, #4]
_021F62EE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_TeamRocket_Print

	thumb_func_start RadioShow_TeamRocket_Init
RadioShow_TeamRocket_Init: ; 0x021F62F4
	push {r4, lr}
	add r4, r0, #0
	ldr r2, _021F631C ; =0x000001A2
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	pop {r4, pc}
	nop
_021F631C: .word 0x000001A2
	thumb_func_end RadioShow_TeamRocket_Init

	thumb_func_start ov101_021F6320
ov101_021F6320: ; 0x021F6320
	ldr r3, _021F6328 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6328: .word DestroyMsgData
	thumb_func_end ov101_021F6320

	thumb_func_start RadioShow_SerialRadioDrama_Setup
RadioShow_SerialRadioDrama_Setup: ; 0x021F632C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_SerialRadioDrama_Init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	ldr r0, _021F6360 ; =SEQ_GS_RADIO_VARIETY
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F6360: .word SEQ_GS_RADIO_VARIETY
	thumb_func_end RadioShow_SerialRadioDrama_Setup

	thumb_func_start RadioShow_SerialRadioDrama_Teardown
RadioShow_SerialRadioDrama_Teardown: ; 0x021F6364
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x1c]
	cmp r1, #0
	bne _021F6372
	mov r0, #0
	pop {r4, pc}
_021F6372:
	bl ov101_021F6470
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end RadioShow_SerialRadioDrama_Teardown

	thumb_func_start RadioShow_SerialRadioDrama_Print
RadioShow_SerialRadioDrama_Print: ; 0x021F638C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #4
	bhi _021F641C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F63A4: ; jump table
	.short _021F63AE - _021F63A4 - 2 ; case 0
	.short _021F63BC - _021F63A4 - 2 ; case 1
	.short _021F63DA - _021F63A4 - 2 ; case 2
	.short _021F63EA - _021F63A4 - 2 ; case 3
	.short _021F6402 - _021F63A4 - 2 ; case 4
_021F63AE:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F641C
_021F63BC:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F641C
	ldrh r1, [r4, #6]
	add r0, r5, #0
	add r1, r1, #4
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F641C
_021F63DA:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F641C
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F641C
_021F63EA:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F641C
	add r0, r5, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F641C
_021F6402:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F641C
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r5, #0x66
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F641C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end RadioShow_SerialRadioDrama_Print

	thumb_func_start RadioShow_SerialRadioDrama_Init
RadioShow_SerialRadioDrama_Init: ; 0x021F6420
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldr r2, _021F646C ; =0x0000019D
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r5, #0x24]
	ldr r2, [r5, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	bl LCRandom
	mov r1, #0x16
	bl _s32_div_f
	strh r1, [r4, #6]
	ldrh r1, [r4, #6]
	ldr r0, [r5, #0x54]
	cmp r1, r0
	bne _021F6464
	add r0, r1, #1
	mov r1, #0x16
	bl _s32_div_f
	strh r1, [r4, #6]
_021F6464:
	ldrh r0, [r4, #6]
	str r0, [r5, #0x54]
	pop {r3, r4, r5, pc}
	nop
_021F646C: .word 0x0000019D
	thumb_func_end RadioShow_SerialRadioDrama_Init

	thumb_func_start ov101_021F6470
ov101_021F6470: ; 0x021F6470
	ldr r3, _021F6478 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6478: .word DestroyMsgData
	thumb_func_end ov101_021F6470

	thumb_func_start RadioShow_Commercials_Setup
RadioShow_Commercials_Setup: ; 0x021F647C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0x34
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x34
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	bic r1, r0
	add r0, r5, #0
	add r0, #0x66
	strb r1, [r0]
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_Commercials_Init
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end RadioShow_Commercials_Setup

	thumb_func_start RadioShow_Commercials_Teardown
RadioShow_Commercials_Teardown: ; 0x021F64B0
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F6614
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0x34
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_Commercials_Teardown

	thumb_func_start RadioShow_Commercials_Print
RadioShow_Commercials_Print: ; 0x021F64D0
	push {r4, lr}
	ldr r4, [r0, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #0
	beq _021F64E4
	cmp r1, #1
	beq _021F64F4
	cmp r1, #2
	beq _021F6504
	b _021F6510
_021F64E4:
	ldrh r1, [r4, #6]
	mov r2, #1
	bl RadioPrintInit
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6510
_021F64F4:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6510
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6510
_021F6504:
	bl ov101_021F5B68
	cmp r0, #0
	beq _021F6510
	mov r0, #1
	pop {r4, pc}
_021F6510:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end RadioShow_Commercials_Print

	thumb_func_start RadioShow_Commercials_Init
RadioShow_Commercials_Init: ; 0x021F6514
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r6, #0
	mov r2, #0x67
	ldr r4, [r5, #0x1c]
	ldr r3, [r5]
	add r0, r6, #0
	mov r1, #0x1b
	lsl r2, r2, #2
	bl NewMsgDataFromNarc
	str r0, [r5, #0x24]
	ldr r2, [r5, #0x4c]
	add r1, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x50]
	bl String_SetEmpty
	add r0, r4, #0
	add r0, #8
	add r1, r6, #0
	mov r2, #8
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0x10
	add r1, r6, #0
	mov r2, #0x24
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	bl Save_VarsFlags_Get
	mov r1, #1
	strb r1, [r4, #8]
	add r7, r0, #0
	mov r1, #0x6b
	bl Save_VarsFlags_CheckFlagInArray
	strb r0, [r4, #9]
	add r0, r7, #0
	mov r1, #2
	mov r2, #0x10
	bl Save_VarsFlags_FlypointFlagAction
	strb r0, [r4, #0xa]
	add r0, r7, #0
	mov r1, #2
	mov r2, #0x12
	bl Save_VarsFlags_FlypointFlagAction
	strb r0, [r4, #0xb]
	add r0, r7, #0
	mov r1, #2
	mov r2, #0x11
	bl Save_VarsFlags_FlypointFlagAction
	strb r0, [r4, #0xc]
	add r0, r7, #0
	mov r1, #2
	mov r2, #5
	bl Save_VarsFlags_FlypointFlagAction
	strb r0, [r4, #0xe]
	ldr r1, _021F660C ; =0x00000964
	add r0, r7, #0
	bl Save_VarsFlags_CheckFlagInArray
	mov r1, #0x46
	strb r0, [r4, #0xd]
	add r0, r7, #0
	lsl r1, r1, #2
	bl Save_VarsFlags_CheckFlagInArray
	ldr r7, _021F6610 ; =ov101_021F8AD0
	strb r0, [r4, #0xf]
	add r1, r6, #0
_021F65B0:
	lsl r0, r1, #1
	add r0, r1, r0
	add r2, r7, r0
	ldrb r0, [r7, r0]
	add r0, r4, r0
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _021F65EE
	ldrb r0, [r2, #2]
	cmp r0, #0xff
	beq _021F65D0
	add r3, r5, #0
	add r3, #0x58
	ldrb r3, [r3]
	cmp r0, r3
	bne _021F65EE
_021F65D0:
	add r0, r5, #0
	add r0, #0x66
	ldrb r0, [r0]
	ldrb r2, [r2, #1]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	add r0, r0, #1
	tst r0, r2
	beq _021F65EE
	add r0, r6, #0
	add r2, r6, #1
	lsl r2, r2, #0x18
	add r0, r4, r0
	lsr r6, r2, #0x18
	strb r1, [r0, #0x10]
_021F65EE:
	add r0, r1, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #0x24
	blo _021F65B0
	bl LCRandom
	add r1, r6, #0
	bl _s32_div_f
	add r0, r4, r1
	ldrb r0, [r0, #0x10]
	add r0, r0, #2
	strh r0, [r4, #6]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F660C: .word 0x00000964
_021F6610: .word ov101_021F8AD0
	thumb_func_end RadioShow_Commercials_Init

	thumb_func_start ov101_021F6614
ov101_021F6614: ; 0x021F6614
	ldr r3, _021F661C ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F661C: .word DestroyMsgData
	thumb_func_end ov101_021F6614

	thumb_func_start RadioShow_PokemonSearchParty_Setup
RadioShow_PokemonSearchParty_Setup: ; 0x021F6620
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0x20
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_PokemonSearchParty_Init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	ldr r0, _021F6654 ; =SEQ_GS_RADIO_VARIETY
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F6654: .word SEQ_GS_RADIO_VARIETY
	thumb_func_end RadioShow_PokemonSearchParty_Setup

	thumb_func_start RadioShow_PokemonSearchParty_Teardown
RadioShow_PokemonSearchParty_Teardown: ; 0x021F6658
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F6800
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0x20
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_PokemonSearchParty_Teardown

	thumb_func_start RadioShow_PokemonSearchParty_Print
RadioShow_PokemonSearchParty_Print: ; 0x021F6678
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #4
	bhi _021F670C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F6690: ; jump table
	.short _021F669A - _021F6690 - 2 ; case 0
	.short _021F66A8 - _021F6690 - 2 ; case 1
	.short _021F66CA - _021F6690 - 2 ; case 2
	.short _021F66DA - _021F6690 - 2 ; case 3
	.short _021F66F2 - _021F6690 - 2 ; case 4
_021F669A:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F670C
_021F66A8:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F670C
	ldrh r1, [r4, #6]
	add r0, r5, #0
	add r1, r4, r1
	ldrb r1, [r1, #0x10]
	add r1, r1, #4
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F670C
_021F66CA:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F670C
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F670C
_021F66DA:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F670C
	add r0, r5, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F670C
_021F66F2:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F670C
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r5, #0x66
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F670C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end RadioShow_PokemonSearchParty_Print

	thumb_func_start RadioShow_PokemonSearchParty_Init
RadioShow_PokemonSearchParty_Init: ; 0x021F6710
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r4, #0
	ldr r5, [r6, #0x1c]
	ldr r2, _021F67F8 ; =0x000001A3
	ldr r3, [r6]
	add r0, r4, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r6, #0x24]
	ldr r2, [r6, #0x4c]
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r0, [r6, #0x24]
	ldr r2, [r6, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	add r0, r5, #0
	add r0, #8
	add r1, r4, #0
	mov r2, #8
	bl MI_CpuFill8
	add r0, r5, #0
	add r0, #0x10
	add r1, r4, #0
	mov r2, #0xd
	bl MI_CpuFill8
	ldr r0, [r6, #4]
	bl Save_VarsFlags_Get
	add r7, r0, #0
	ldr r0, [r6, #4]
	bl Save_PlayerData_GetProfile
	str r0, [sp]
	mov r0, #1
	strb r0, [r5, #8]
	add r0, r7, #0
	mov r1, #FLAG_BEAT_AZALEA_ROCKETS
	bl Save_VarsFlags_CheckFlagInArray
	strb r0, [r5, #9]
	ldr r0, [sp]
	mov r1, #2
	bl PlayerProfile_TestBadgeFlag
	strb r0, [r5, #0xa]
	add r0, r7, #0
	mov r1, #FLAG_BEAT_RADIO_TOWER_ROCKETS
	bl Save_VarsFlags_CheckFlagInArray
	strb r0, [r5, #0xb]
	ldr r0, [sp]
	bl PlayerProfile_CountBadges
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #8
	blo _021F6794
	mov r0, #1
	strb r0, [r5, #0xc]
_021F6794:
	cmp r1, #9
	blo _021F679C
	mov r0, #1
	strb r0, [r5, #0xd]
_021F679C:
	cmp r1, #0x10
	blo _021F67A4
	mov r0, #1
	strb r0, [r5, #0xf]
_021F67A4:
	add r0, r7, #0
	mov r1, #2
	mov r2, #5
	bl Save_VarsFlags_FlypointFlagAction
	strb r0, [r5, #0xe]
	ldr r0, _021F67FC ; =ov101_021F8B3C
	mov r1, #0
_021F67B4:
	ldrb r2, [r0, r1]
	add r2, r5, r2
	ldrb r2, [r2, #8]
	cmp r2, #0
	beq _021F67CA
	add r2, r4, #0
	add r3, r4, #1
	lsl r3, r3, #0x18
	add r2, r5, r2
	lsr r4, r3, #0x18
	strb r1, [r2, #0x10]
_021F67CA:
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #0xd
	blo _021F67B4
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	strh r1, [r5, #6]
	ldrh r1, [r5, #6]
	ldr r0, [r6, #0x54]
	cmp r1, r0
	bne _021F67F2
	add r0, r1, #1
	add r1, r4, #0
	bl _s32_div_f
	strh r1, [r5, #6]
_021F67F2:
	ldrh r0, [r5, #6]
	str r0, [r6, #0x54]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F67F8: .word 0x000001A3
_021F67FC: .word ov101_021F8B3C
	thumb_func_end RadioShow_PokemonSearchParty_Init

	thumb_func_start ov101_021F6800
ov101_021F6800: ; 0x021F6800
	ldr r3, _021F6808 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6808: .word DestroyMsgData
	thumb_func_end ov101_021F6800

	thumb_func_start RadioShow_BuenasPassword_Setup
RadioShow_BuenasPassword_Setup: ; 0x021F680C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_BuenasPassword_Init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	mov r0, #SEQ_GS_AIKOTOBA>>4
	lsl r0, r0, #4
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end RadioShow_BuenasPassword_Setup

	thumb_func_start RadioShow_BuenasPassword_Teardown
RadioShow_BuenasPassword_Teardown: ; 0x021F6840
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F699C
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_BuenasPassword_Teardown

	thumb_func_start RadioShow_BuenasPassword_Print
RadioShow_BuenasPassword_Print: ; 0x021F6860
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #4
	bhi _021F68FC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F6878: ; jump table
	.short _021F6882 - _021F6878 - 2 ; case 0
	.short _021F6890 - _021F6878 - 2 ; case 1
	.short _021F68BA - _021F6878 - 2 ; case 2
	.short _021F68CA - _021F6878 - 2 ; case 3
	.short _021F68E2 - _021F6878 - 2 ; case 4
_021F6882:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F6890:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F68FC
	ldrh r1, [r4, #6]
	add r0, r5, #0
	bl RadioPrintInitEz
	ldrh r0, [r4, #6]
	cmp r0, #4
	bne _021F68B2
	ldr r0, [r5, #4]
	bl Save_VarsFlags_Get
	ldr r1, _021F6900 ; =FLAG_DAILY_HEARD_BUENAS_PASSWORD
	bl Save_VarsFlags_SetFlagInArray
_021F68B2:
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F68BA:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F68FC
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F68CA:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F68FC
	add r0, r5, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F68E2:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F68FC
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r5, #0x66
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F68FC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F6900: .word FLAG_DAILY_HEARD_BUENAS_PASSWORD
	thumb_func_end RadioShow_BuenasPassword_Print

	thumb_func_start RadioShow_BuenasPassword_Init
RadioShow_BuenasPassword_Init: ; 0x021F6904
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldr r2, _021F6998 ; =0x0000019B
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r5, #0x24]
	ldr r2, [r5, #0x4c]
	mov r1, #msg_0411_00000
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x50]
	mov r1, #msg_0411_00001
	bl ReadMsgDataIntoString
	ldr r0, [r5, #4]
	bl Save_Bag_Get
	mov r1, #ITEM_BLUE_CARD>>2
	ldr r3, [r5]
	lsl r1, r1, #2
	mov r2, #1
	bl Bag_HasItem
	cmp r0, #0
	beq _021F6946
	mov r0, #msg_0411_00004
	b _021F6948
_021F6946:
	mov r0, #msg_0411_00005
_021F6948:
	strh r0, [r4, #6]
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x42 ; msg_0066_D23R0102.gmm
	bl NewMsgDataFromNarc
	add r4, r0, #0
	ldr r0, [r5, #4]
	bl Save_VarsFlags_Get
	bl Save_VarsFlags_GetBuenasPasswordSet
	mov r1, #0x1e
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r1, r0, #0x10
	add r0, r4, #0
	add r1, #0x28
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r3, #2
	str r3, [sp, #4]
	ldr r0, [r5, #0x44]
	mov r1, #0
	add r2, r6, #0
	bl BufferString
	add r0, r6, #0
	bl String_Delete
	add r0, r4, #0
	bl DestroyMsgData
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F6998: .word 0x0000019B
	thumb_func_end RadioShow_BuenasPassword_Init

	thumb_func_start ov101_021F699C
ov101_021F699C: ; 0x021F699C
	ldr r3, _021F69A4 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F69A4: .word DestroyMsgData
	thumb_func_end ov101_021F699C

	thumb_func_start RadioShow_ThatTownThesePeople_Setup
RadioShow_ThatTownThesePeople_Setup: ; 0x021F69A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0x24
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x24
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_ThatTownThesePeople_Init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	ldr r0, _021F69DC ; =SEQ_GS_RADIO_PT
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F69DC: .word SEQ_GS_RADIO_PT
	thumb_func_end RadioShow_ThatTownThesePeople_Setup

	thumb_func_start RadioShow_ThatTownThesePeople_Teardown
RadioShow_ThatTownThesePeople_Teardown: ; 0x021F69E0
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F6B7C
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0x24
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_ThatTownThesePeople_Teardown

	thumb_func_start RadioShow_ThatTownThesePeople_Print
RadioShow_ThatTownThesePeople_Print: ; 0x021F6A00
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #5
	bhi _021F6AA8
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F6A18: ; jump table
	.short _021F6A24 - _021F6A18 - 2 ; case 0
	.short _021F6A32 - _021F6A18 - 2 ; case 1
	.short _021F6A40 - _021F6A18 - 2 ; case 2
	.short _021F6A54 - _021F6A18 - 2 ; case 3
	.short _021F6A76 - _021F6A18 - 2 ; case 4
	.short _021F6A8E - _021F6A18 - 2 ; case 5
_021F6A24:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A32:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6AA8
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
_021F6A40:
	ldrb r1, [r4, #9]
	add r0, r5, #0
	add r1, r4, r1
	ldrb r1, [r1, #6]
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A54:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6AA8
	ldrb r0, [r4, #9]
	add r0, r0, #1
	strb r0, [r4, #9]
	ldrb r0, [r4, #9]
	cmp r0, #3
	bhs _021F6A6E
	mov r0, #2
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A6E:
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A76:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F6AA8
	add r0, r5, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A8E:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F6AA8
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r5, #0x66
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F6AA8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end RadioShow_ThatTownThesePeople_Print

	thumb_func_start RadioShow_ThatTownThesePeople_Init
RadioShow_ThatTownThesePeople_Init: ; 0x021F6AAC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldr r2, _021F6B74 ; =0x0000019F
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r5, #0x24]
	ldr r2, [r5, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	add r0, r4, #0
	add r0, #0xa
	mov r1, #0
	mov r2, #5
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0xf
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	bl Save_VarsFlags_Get
	mov r1, #1
	strb r1, [r4, #0xa]
	add r5, r0, #0
	mov r1, #2
	mov r2, #0xf
	bl Save_VarsFlags_FlypointFlagAction
	strb r0, [r4, #0xb]
	add r0, r5, #0
	mov r1, #2
	mov r2, #0x13
	bl Save_VarsFlags_FlypointFlagAction
	strb r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	mov r2, #0x15
	bl Save_VarsFlags_FlypointFlagAction
	strb r0, [r4, #0xd]
	add r0, r5, #0
	mov r1, #2
	mov r2, #5
	bl Save_VarsFlags_FlypointFlagAction
	mov r6, #0
	strb r0, [r4, #0xe]
	ldr r1, _021F6B78 ; =ov101_021F8B4C
	add r0, r6, #0
_021F6B2A:
	ldrb r2, [r1]
	add r2, r4, r2
	ldrb r2, [r2, #0xa]
	cmp r2, #0
	beq _021F6B3A
	add r2, r4, r6
	add r6, r6, #1
	strb r0, [r2, #0xf]
_021F6B3A:
	add r0, r0, #1
	add r1, r1, #1
	cmp r0, #0x14
	blt _021F6B2A
	mov r5, #0
_021F6B44:
	bl LCRandom
	add r1, r6, #0
	bl _s32_div_f
	add r0, r4, r1
	ldrb r0, [r0, #0xf]
	lsl r2, r5, #0x18
	lsr r2, r2, #0x18
	add r0, r0, #4
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r4, #0
	add r1, r7, #0
	bl ov101_021F6B88
	cmp r0, #0
	bne _021F6B44
	add r0, r4, r5
	add r5, r5, #1
	strb r7, [r0, #6]
	cmp r5, #3
	blt _021F6B44
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F6B74: .word 0x0000019F
_021F6B78: .word ov101_021F8B4C
	thumb_func_end RadioShow_ThatTownThesePeople_Init

	thumb_func_start ov101_021F6B7C
ov101_021F6B7C: ; 0x021F6B7C
	ldr r3, _021F6B84 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6B84: .word DestroyMsgData
	thumb_func_end ov101_021F6B7C

	thumb_func_start ov101_021F6B88
ov101_021F6B88: ; 0x021F6B88
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	ble _021F6BA4
_021F6B90:
	add r3, r0, r4
	ldrb r3, [r3, #6]
	cmp r1, r3
	bne _021F6B9E
	mov r0, #1
	pop {r3, r4}
	bx lr
_021F6B9E:
	add r4, r4, #1
	cmp r4, r2
	blt _021F6B90
_021F6BA4:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F6B88

	thumb_func_start RadioShow_TrainerProfiles_Setup
RadioShow_TrainerProfiles_Setup: ; 0x021F6BAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0xc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_TrainerProfiles_Init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	ldr r0, _021F6BE0 ; =SEQ_GS_RADIO_TRAINER
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F6BE0: .word SEQ_GS_RADIO_TRAINER
	thumb_func_end RadioShow_TrainerProfiles_Setup

	thumb_func_start RadioShow_TrainerProfiles_Teardown
RadioShow_TrainerProfiles_Teardown: ; 0x021F6BE4
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F6D0C
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_TrainerProfiles_Teardown

	thumb_func_start RadioShow_TrainerProfiles_Print
RadioShow_TrainerProfiles_Print: ; 0x021F6C04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #5
	bhi _021F6CAC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F6C1C: ; jump table
	.short _021F6C28 - _021F6C1C - 2 ; case 0
	.short _021F6C36 - _021F6C1C - 2 ; case 1
	.short _021F6C44 - _021F6C1C - 2 ; case 2
	.short _021F6C58 - _021F6C1C - 2 ; case 3
	.short _021F6C7A - _021F6C1C - 2 ; case 4
	.short _021F6C92 - _021F6C1C - 2 ; case 5
_021F6C28:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C36:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6CAC
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
_021F6C44:
	ldrb r1, [r4, #9]
	add r0, r5, #0
	add r1, r4, r1
	ldrb r1, [r1, #6]
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C58:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6CAC
	ldrb r0, [r4, #9]
	add r0, r0, #1
	strb r0, [r4, #9]
	ldrb r0, [r4, #9]
	cmp r0, #3
	bhs _021F6C72
	mov r0, #2
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C72:
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C7A:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F6CAC
	add r0, r5, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C92:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F6CAC
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r5, #0x66
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F6CAC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end RadioShow_TrainerProfiles_Print

	thumb_func_start RadioShow_TrainerProfiles_Init
RadioShow_TrainerProfiles_Init: ; 0x021F6CB0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	mov r2, #0x69
	ldr r5, [r4, #0x1c]
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #2
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	mov r4, #0
	mov r7, #0x1c
_021F6CDC:
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r0, r0, #0x1c
	sub r0, r0, r1
	ror r0, r7
	add r0, r1, r0
	add r0, r0, #4
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	lsl r2, r4, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl ov101_021F6D18
	cmp r0, #0
	bne _021F6CDC
	add r0, r5, r4
	add r4, r4, #1
	strb r6, [r0, #6]
	cmp r4, #3
	blt _021F6CDC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end RadioShow_TrainerProfiles_Init

	thumb_func_start ov101_021F6D0C
ov101_021F6D0C: ; 0x021F6D0C
	ldr r3, _021F6D14 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6D14: .word DestroyMsgData
	thumb_func_end ov101_021F6D0C

	thumb_func_start ov101_021F6D18
ov101_021F6D18: ; 0x021F6D18
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	ble _021F6D34
_021F6D20:
	add r3, r0, r4
	ldrb r3, [r3, #6]
	cmp r1, r3
	bne _021F6D2E
	mov r0, #1
	pop {r3, r4}
	bx lr
_021F6D2E:
	add r4, r4, #1
	cmp r4, r2
	blt _021F6D20
_021F6D34:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F6D18

	thumb_func_start RadioShow_PokemonTalk_Setup
RadioShow_PokemonTalk_Setup: ; 0x021F6D3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0x95
	ldr r0, [r5]
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x95
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_PokemonTalk_Init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	ldr r0, _021F6D74 ; =SEQ_GS_OHKIDO_RABO
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F6D74: .word SEQ_GS_OHKIDO_RABO
	thumb_func_end RadioShow_PokemonTalk_Setup

	thumb_func_start RadioShow_PokemonTalk_Teardown
RadioShow_PokemonTalk_Teardown: ; 0x021F6D78
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F6FC0
	mov r2, #0x95
	ldr r0, [r4, #0x1c]
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end RadioShow_PokemonTalk_Teardown

	thumb_func_start RadioShow_PokemonTalk_Print
RadioShow_PokemonTalk_Print: ; 0x021F6D98
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r4, [r6, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #7
	bhi _021F6DD8
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F6DB2: ; jump table
	.short _021F6DC2 - _021F6DB2 - 2 ; case 0
	.short _021F6DD0 - _021F6DB2 - 2 ; case 1
	.short _021F6E10 - _021F6DB2 - 2 ; case 2
	.short _021F6E1E - _021F6DB2 - 2 ; case 3
	.short _021F6E56 - _021F6DB2 - 2 ; case 4
	.short _021F6EB2 - _021F6DB2 - 2 ; case 5
	.short _021F6ED8 - _021F6DB2 - 2 ; case 6
	.short _021F6EF0 - _021F6DB2 - 2 ; case 7
_021F6DC2:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6DD0:
	bl Radio_RunTextPrinter
	cmp r0, #0
	bne _021F6DDA
_021F6DD8:
	b _021F6F0C
_021F6DDA:
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _021F6DE6
	mov r0, #3
	strh r0, [r4, #4]
	b _021F6F0C
_021F6DE6:
	ldrh r0, [r4, #8]
	bl MapHeader_GetMapSec
	add r2, r0, #0
	ldr r0, [r6, #0x44]
	mov r1, #0
	bl BufferLandmarkName
	ldrh r2, [r4, #6]
	ldr r0, [r6, #0x44]
	mov r1, #1
	bl BufferSpeciesName
	add r0, r6, #0
	mov r1, #0x20
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6E10:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6F0C
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
_021F6E1E:
	mov r2, #0x25
	lsl r2, r2, #4
	ldrb r2, [r4, r2]
	ldr r0, [r6, #0x44]
	mov r1, #0
	lsl r2, r2, #2
	add r2, r4, r2
	ldrh r2, [r2, #0x10]
	bl BufferLandmarkName
	mov r2, #0x25
	lsl r2, r2, #4
	ldrb r2, [r4, r2]
	ldr r0, [r6, #0x44]
	mov r1, #1
	lsl r2, r2, #2
	add r2, r4, r2
	ldrh r2, [r2, #0x12]
	bl BufferSpeciesName
	add r0, r6, #0
	mov r1, #4
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6E56:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6F0C
	mov r5, #0
	str r5, [sp, #8]
	add r7, r5, #0
_021F6E64:
	mov r1, #0x25
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	ldr r0, [r6, #0x24]
	ldr r2, [r6, #0x48]
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, r5, r1
	ldrh r1, [r1, #0x24]
	add r1, r1, #6
	add r1, r7, r1
	bl ReadMsgDataIntoString
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r0, [r6, #0x44]
	ldr r2, [r6, #0x48]
	add r1, r1, #2
	mov r3, #1
	bl BufferString
	ldr r0, [sp, #8]
	add r5, r5, #2
	add r0, r0, #1
	add r7, #0xd
	str r0, [sp, #8]
	cmp r0, #2
	blt _021F6E64
	add r0, r6, #0
	mov r1, #5
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6EB2:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6F0C
	mov r0, #0x25
	lsl r0, r0, #4
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #5
	bhs _021F6ED0
	mov r0, #3
	strh r0, [r4, #4]
	b _021F6F0C
_021F6ED0:
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6ED8:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F6F0C
	add r0, r6, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6EF0:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F6F0C
	add r0, r6, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r6, #0x66
	orr r0, r1
	strb r0, [r6]
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021F6F0C:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end RadioShow_PokemonTalk_Print

	thumb_func_start RadioShow_PokemonTalk_Init
RadioShow_PokemonTalk_Init: ; 0x021F6F14
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r5, [r4, #0x1c]
	ldr r2, _021F6FBC ; =0x0000019E
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	ldr r0, [r4, #4]
	bl Save_Roamers_Get
	add r6, r0, #0
	bl RoamerSave_OutbreakActive
	cmp r0, #0
	beq _021F6F5C
	add r0, r6, #0
	mov r1, #2
	bl Roamers_GetRand
	add r1, r5, #0
	add r1, #8
	add r2, r5, #6
	bl GetSwarmInfoFromRand
_021F6F5C:
	add r0, r4, #0
	add r1, r5, #0
	bl ov101_021F6FCC
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r0, r1, #1
	lsl r6, r0, #1
	bl LCRandom
	mov r1, #0xd
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r7, r0, #0x18
	bl LCRandom
	mov r1, #0xd
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	mov r0, #0
	str r0, [sp]
_021F6F92:
	strh r7, [r5, #0x24]
	add r0, r7, r6
	mov r1, #0xd
	strh r4, [r5, #0x26]
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r7, r0, #0x18
	add r0, r4, r6
	mov r1, #0xd
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	ldr r0, [sp]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #5
	blt _021F6F92
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F6FBC: .word 0x0000019E
	thumb_func_end RadioShow_PokemonTalk_Init

	thumb_func_start ov101_021F6FC0
ov101_021F6FC0: ; 0x021F6FC0
	ldr r3, _021F6FC8 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6FC8: .word DestroyMsgData
	thumb_func_end ov101_021F6FC0

	thumb_func_start ov101_021F6FCC
ov101_021F6FCC: ; 0x021F6FCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	ldr r0, [r7, #4]
	add r5, r1, #0
	bl Save_Pokedex_Get
	str r0, [sp, #8]
	ldr r0, [r7, #4]
	bl Save_VarsFlags_Get
	mov r1, #2
	mov r2, #0x19
	bl Save_VarsFlags_FlypointFlagAction
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0x4b
	add r0, #0x38
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	mov r0, #0x59
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	mov r2, #0x76
	bl MI_CpuFill8
	ldr r0, _021F70E8 ; =0x000001DA
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x76
	bl MI_CpuFill8
	mov r4, #0
	strh r4, [r5, #0xa]
	strh r4, [r5, #0xc]
	add r6, r5, #0
	strh r4, [r5, #0xe]
	add r6, #0xa
_021F7020:
	add r0, r4, #0
	bl MapHeader_HasWildEncounters
	cmp r0, #0
	beq _021F707C
	add r0, r4, #0
	bl MapHeader_IsInKanto
	add r1, r7, #0
	add r1, #0x66
	ldrb r1, [r1]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	cmp r1, r0
	bne _021F707C
	ldr r2, _021F70EC ; =ov101_021F8B60
	mov r1, #0
_021F7042:
	ldrh r0, [r2]
	cmp r4, r0
	beq _021F7050
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, #0xe
	blo _021F7042
_021F7050:
	cmp r1, #0xe
	blo _021F707C
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _021F7062
	cmp r4, #0x97
	beq _021F707C
	cmp r4, #0x98
	beq _021F707C
_021F7062:
	ldrh r0, [r6]
	ldrh r1, [r5, #0xa]
	add r0, r0, #1
	strh r0, [r6]
	lsl r0, r1, #1
	add r0, r5, r0
	strh r4, [r0, #0x38]
	ldrh r0, [r5, #0xa]
	cmp r0, #0x96
	blo _021F707C
	bl GF_AssertFail
	b _021F7086
_021F707C:
	mov r0, #0x87
	add r4, r4, #1
	lsl r0, r0, #2
	cmp r4, r0
	blt _021F7020
_021F7086:
	mov r0, #0
	str r0, [sp]
	str r5, [sp, #4]
_021F708C:
	mov r0, #0
	strh r0, [r5, #0xc]
	strh r0, [r5, #0xe]
	ldr r0, [sp]
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_021F7098:
	bl LCRandom
	ldrh r1, [r5, #0xa]
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0xf
	add r6, r5, r0
	ldrh r0, [r6, #0x38]
	bl MapHeader_GetMapSec
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	bl ov101_021F70F0
	cmp r0, #0
	bne _021F7098
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	strh r7, [r0, #0x10]
	ldrh r2, [r6, #0x38]
	add r0, r5, #0
	bl ov101_021F7174
	ldr r1, [sp, #4]
	strh r0, [r1, #0x12]
	add r0, r1, #0
	add r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #5
	blt _021F708C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F70E8: .word 0x000001DA
_021F70EC: .word ov101_021F8B60
	thumb_func_end ov101_021F6FCC

	thumb_func_start ov101_021F70F0
ov101_021F70F0: ; 0x021F70F0
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	ble _021F710C
_021F70F8:
	ldrh r3, [r0, #0x10]
	cmp r1, r3
	bne _021F7104
	mov r0, #1
	pop {r3, r4}
	bx lr
_021F7104:
	add r4, r4, #1
	add r0, r0, #4
	cmp r4, r2
	blt _021F70F8
_021F710C:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F70F0

	thumb_func_start ov101_021F7114
ov101_021F7114: ; 0x021F7114
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r4, r2, #0
	beq _021F7168
	ldr r0, _021F716C ; =0x000001ED
	cmp r4, r0
	bhi _021F7168
	ldrh r6, [r5, #0xc]
	mov r2, #0
	cmp r6, #0
	ble _021F713E
	add r3, r5, #0
	sub r0, #0x89
_021F7130:
	ldrh r1, [r3, r0]
	cmp r4, r1
	beq _021F7168
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, r6
	blt _021F7130
_021F713E:
	ldrh r0, [r5, #0xc]
	add r0, r0, #1
	strh r0, [r5, #0xc]
	lsl r0, r6, #1
	add r1, r5, r0
	mov r0, #0x59
	lsl r0, r0, #2
	strh r4, [r1, r0]
	add r0, r7, #0
	add r1, r4, #0
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #0
	bne _021F7168
	ldrh r1, [r5, #0xe]
	add r0, r1, #1
	strh r0, [r5, #0xe]
	lsl r0, r1, #1
	add r1, r5, r0
	ldr r0, _021F7170 ; =0x000001DA
	strh r4, [r1, r0]
_021F7168:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F716C: .word 0x000001ED
_021F7170: .word 0x000001DA
	thumb_func_end ov101_021F7114

	thumb_func_start ov101_021F7174
ov101_021F7174: ; 0x021F7174
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc4
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0
	add r1, r2, #0
	bl WildEncounters_ReadFromNarc
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F71BA
	mov r7, #0
	add r6, sp, #0
_021F7190:
	ldrh r2, [r6, #0x14]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	ldrh r2, [r6, #0x2c]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r2, r6, #0
	add r2, #0x44
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #2
	cmp r7, #0xc
	blt _021F7190
_021F71BA:
	add r0, sp, #0
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _021F71DC
	mov r7, #0
	add r6, sp, #0
_021F71C6:
	add r2, r6, #0
	add r2, #0x66
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #5
	blt _021F71C6
_021F71DC:
	add r0, sp, #0
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _021F71FE
	mov r7, #0
	add r6, sp, #0
_021F71E8:
	add r2, r6, #0
	add r2, #0x7a
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #2
	blt _021F71E8
_021F71FE:
	add r0, sp, #0
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _021F7220
	mov r7, #0
	add r6, sp, #0
_021F720A:
	add r2, r6, #0
	add r2, #0x82
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #5
	blt _021F720A
_021F7220:
	add r0, sp, #0
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _021F7242
	mov r7, #0
	add r6, sp, #0
_021F722C:
	add r2, r6, #0
	add r2, #0x96
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #5
	blt _021F722C
_021F7242:
	add r0, sp, #0
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _021F7264
	mov r7, #0
	add r6, sp, #0
_021F724E:
	add r2, r6, #0
	add r2, #0xaa
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #5
	blt _021F724E
_021F7264:
	add r0, sp, #0xc0
	ldrh r2, [r0]
	cmp r2, #0
	beq _021F7274
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
_021F7274:
	ldrh r0, [r5, #0xe]
	cmp r0, #0
	beq _021F7292
	cmp r0, #1
	bne _021F72AA
	bl LCRandom
	mov r1, #0xfa
	lsl r1, r1, #2
	bl _s32_div_f
	mov r0, #0x7d
	lsl r0, r0, #2
	cmp r1, r0
	bge _021F72AA
_021F7292:
	bl LCRandom
	ldrh r1, [r5, #0xc]
	bl _s32_div_f
	lsl r0, r1, #1
	add r1, r5, r0
	mov r0, #0x59
	lsl r0, r0, #2
	add sp, #0xc4
	ldrh r0, [r1, r0]
	pop {r4, r5, r6, r7, pc}
_021F72AA:
	bl LCRandom
	ldrh r1, [r5, #0xe]
	bl _s32_div_f
	lsl r0, r1, #1
	add r1, r5, r0
	ldr r0, _021F72C0 ; =0x000001DA
	ldrh r0, [r1, r0]
	add sp, #0xc4
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F72C0: .word 0x000001DA
	thumb_func_end ov101_021F7174

	thumb_func_start RadioShow_MahoganySignal_Setup
RadioShow_MahoganySignal_Setup: ; 0x021F72C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_MahoganySignal_Init
	bl GF_GetCurrentPlayingBGM
	mov r1, #1
	bl StopBGM
	mov r0, #0
	strb r0, [r4, #4]
	ldr r0, _021F72FC ; =SEQ_GS_KAIDENPA
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F72FC: .word SEQ_GS_KAIDENPA
	thumb_func_end RadioShow_MahoganySignal_Setup

	thumb_func_start RadioShow_MahoganySignal_Teardown
RadioShow_MahoganySignal_Teardown: ; 0x021F7300
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F734C
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_MahoganySignal_Teardown

	thumb_func_start RadioShow_MahoganySignal_Print
RadioShow_MahoganySignal_Print: ; 0x021F7320
	mov r0, #0
	bx lr
	thumb_func_end RadioShow_MahoganySignal_Print

	thumb_func_start RadioShow_MahoganySignal_Init
RadioShow_MahoganySignal_Init: ; 0x021F7324
	push {r4, lr}
	add r4, r0, #0
	ldr r2, _021F7348 ; =0x00000199
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x50]
	bl String_SetEmpty
	pop {r4, pc}
	nop
_021F7348: .word 0x00000199
	thumb_func_end RadioShow_MahoganySignal_Init

	thumb_func_start ov101_021F734C
ov101_021F734C: ; 0x021F734C
	ldr r3, _021F7354 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F7354: .word DestroyMsgData
	thumb_func_end ov101_021F734C

	.rodata

	.balign 4, 0
ov101_021F87AC: ; 0x021F87AC
	.byte 0x05, 0x11, 0x00, 0x00

ov101_021F87B0:
	.short 0x013B, 0x0143, 0x01EA, 0x01EB, 0x01EC

ov101_021F87BA:
	.short 0x0057, 0x0085, 0x008C
	.short 0x018C, 0x018D, 0x00F6, 0x0170, 0x0074, 0x00F7, 0x00F8, 0x00F9
	.short 0x002D, 0x008E, 0x00F5, 0x0058, 0x0126, 0x0127

ov101_021F87DC: ; 0x021F87DC
	// window templates
	.byte 0x06, 0x02, 0x13, 0x1C, 0x04, 0x00, 0x8F, 0x03
	.byte 0x06, 0x04, 0x10, 0x0E, 0x02, 0x00, 0x73, 0x03
	.byte 0x01, 0x05, 0x01, 0x16, 0x02, 0x00, 0xD3, 0x03

ov101_021F87F4: ; 0x021F87F4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F889C: ; 0x021F889C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov101_021F8964:
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F8968: ; 0x021F8968
	.byte 0xFE, 0x80, 0x5C, 0x34

ov101_021F896C:
	.byte 0xFE, 0x80, 0x5C, 0x26
	.byte 0xFE, 0x80, 0x5C, 0x34
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F8978:
	.byte 0xFE, 0x80, 0x5C, 0x04
	.byte 0xFE, 0x80, 0x5C, 0x10
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F8984: ; 0x021F8984
	.byte 0x30, 0x4C, 0x10, 0x30
	.byte 0x30, 0x4C, 0xD0, 0xF0
	.byte 0x70, 0x8C, 0x10, 0x30
	.byte 0x70, 0x8C, 0xD0, 0xF0
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F8998:
	.byte 0xFE, 0x70, 0x4C, 0x04
	.byte 0xFE, 0x70, 0x4C, 0x10
	.byte 0xFE, 0x98, 0x4C, 0x04
	.byte 0xFE, 0x98, 0x4C, 0x14
	.byte 0xFE, 0x60, 0x6C, 0x04
	.byte 0xFE, 0x60, 0x6C, 0x10
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F89B4:
	.byte 0xFE, 0x70, 0x4C, 0x04
	.byte 0xFE, 0x70, 0x4C, 0x10
	.byte 0xFE, 0x98, 0x4C, 0x04
	.byte 0xFE, 0x98, 0x4C, 0x14
	.byte 0xFE, 0x60, 0x6C, 0x04
	.byte 0xFE, 0x60, 0x6C, 0x10
	.byte 0xFE, 0x88, 0x74, 0x04
	.byte 0xFE, 0x88, 0x74, 0x14
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F89D8:
	.byte 0xFE, 0x70, 0x4C, 0x04
	.byte 0xFE, 0x70, 0x4C, 0x10
	.byte 0xFE, 0x98, 0x4C, 0x04
	.byte 0xFE, 0x98, 0x4C, 0x14
	.byte 0xFE, 0x60, 0x6C, 0x04
	.byte 0xFE, 0x60, 0x6C, 0x10
	.byte 0xFE, 0x88, 0x74, 0x04
	.byte 0xFE, 0x88, 0x74, 0x14
	.byte 0xFE, 0x80, 0x30, 0x04
	.byte 0xFE, 0x80, 0x30, 0x08
	.byte 0xFF, 0x00, 0x00, 0x00

ov101_021F8A04: ; 0x021F8A04
	.word RadioShow_PokemonMusic_Setup, RadioShow_PokemonMusic_Print, RadioShow_PokemonMusic_Teardown ; RADIO_STATION_POKEMON_MUSIC
	.word RadioShow_PokemonTalk_Setup, RadioShow_PokemonTalk_Print, RadioShow_PokemonTalk_Teardown ; RADIO_STATION_POKEMON_TALK
	.word RadioShow_PokemonSearchParty_Setup, RadioShow_PokemonSearchParty_Print, RadioShow_PokemonSearchParty_Teardown ; RADIO_STATION_POKEMON_SEARCH_PARTY
	.word RadioShow_SerialRadioDrama_Setup, RadioShow_SerialRadioDrama_Print, RadioShow_SerialRadioDrama_Teardown ; RADIO_STATION_SERIAL_RADIO_DRAMA
	.word RadioShow_BuenasPassword_Setup, RadioShow_BuenasPassword_Print, RadioShow_BuenasPassword_Teardown ; RADIO_STATION_BUENAS_PASSWORD
	.word RadioShow_TrainerProfiles_Setup, RadioShow_TrainerProfiles_Print, RadioShow_TrainerProfiles_Teardown ; RADIO_STATION_TRAINER_PROFILES
	.word RadioShow_ThatTownThesePeople_Setup, RadioShow_ThatTownThesePeople_Print, RadioShow_ThatTownThesePeople_Teardown ; RADIO_STATION_THAT_TOWN_THESE_PEOPLE
	.word RadioShow_PokeFlute_Setup, RadioShow_PokeFlute_Print, RadioShow_PokeFlute_Teardown ; RADIO_STATION_POKE_FLUTE
	.word RadioShow_Unown_Setup, RadioShow_Unown_Print, RadioShow_Unown_Teardown ; RADIO_STATION_UNOWN
	.word RadioShow_TeamRocket_Setup, RadioShow_TeamRocket_Print, RadioShow_TeamRocket_Teardown ; RADIO_STATION_TEAM_ROCKET
	.word RadioShow_MahoganySignal_Setup, RadioShow_MahoganySignal_Print, RadioShow_MahoganySignal_Teardown ; RADIO_STATION_MAHOGANY_SIGNAL
	.word RadioShow_Commercials_Setup, RadioShow_Commercials_Print, RadioShow_Commercials_Teardown ; RADIO_STATION_COMMERCIALS

	// file boundary?

    .global ov101_021F8A94
ov101_021F8A94:
	.short SEQ_GS_RADIO_MARCH, SEQ_GS_RADIO_KOMORIUTA, SEQ_GS_RADIO_R_101, SEQ_GS_RADIO_R_201
    .global ov101_021F8A9C
ov101_021F8A9C:
	.short SEQ_GS_P_TITLE, SEQ_GS_P_OPENING_TITLE_G, SEQ_GS_P_ENDING, SEQ_GS_P_ENDING2
    .global ov101_021F8AA4
ov101_021F8AA4:
	.byte 0x1A, 0x05, 0x25, 0x05, 0x26, 0x05, 0x27, 0x05, 0x28, 0x05, 0x29, 0x05
	.byte 0x2A, 0x05, 0x2B, 0x05, 0x2C, 0x05, 0x2D, 0x05, 0x2E, 0x05, 0x2F, 0x05, 0x34, 0x05, 0x24, 0x05
	.byte 0x1E, 0x05, 0x23, 0x05, 0x20, 0x05, 0x1F, 0x05, 0x22, 0x05, 0xC6, 0x04, 0xFF, 0x04, 0x00, 0x00

    .global ov101_021F8AD0
ov101_021F8AD0: ; 0x021F8AD0
	.byte 0x00, 0x03, 0xFF, 0x00, 0x03, 0xFF, 0x00, 0x03, 0xFF, 0x00, 0x03, 0xFF, 0x00, 0x03, 0xFF, 0x00
	.byte 0x01, 0xFF, 0x00, 0x01, 0xFF, 0x00, 0x01, 0xFF, 0x00, 0x01, 0xFF, 0x00, 0x03, 0x02, 0x00, 0x03
	.byte 0x02, 0x01, 0x03, 0xFF, 0x01, 0x03, 0xFF, 0x01, 0x03, 0xFF, 0x01, 0x03, 0xFF, 0x02, 0x01, 0x03
	.byte 0x02, 0x01, 0x03, 0x02, 0x01, 0x03, 0x02, 0x01, 0x02, 0x02, 0x01, 0x02, 0x02, 0x03, 0x02, 0x03
	.byte 0x03, 0x02, 0x03, 0x01, 0x03, 0x04, 0x03, 0x01, 0x04, 0x03, 0x01, 0x04, 0x03, 0x01, 0x04, 0x03
	.byte 0x01, 0x04, 0x03, 0x01, 0x04, 0x03, 0x01, 0x05, 0x03, 0x03, 0x06, 0x02, 0x03, 0x06, 0x02, 0x03
	.byte 0x06, 0x02, 0x03, 0x06, 0x02, 0x03, 0x06, 0x02, 0x03, 0x07, 0x03, 0x03

    .global ov101_021F8B3C
ov101_021F8B3C: ; 0x021F8B3C
	.byte 0x00, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x06, 0x06, 0x07, 0x07, 0x07

	.balign 4, 0
    .global ov101_021F8B4C
ov101_021F8B4C: ; 0x021F8B4C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x03, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04

    .global ov101_021F8B60
ov101_021F8B60: ; 0x021F8B60
	.short MAP_MOUNT_MOON_SQUARE
	.short MAP_MOUNT_MOON_SQUARE_CLEFAIRY_EVENT
	.short MAP_NATIONAL_PARK_BUG_CATCHING_CONTEST
	.short MAP_RUINS_OF_ALPH_UNDERGROUND_HALL
	.short MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT
	.short MAP_RUINS_OF_ALPH_HALL_ENTRANCE_SINJOH_EVENT
	.short MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2
	.short MAP_ICE_PATH_B1F
	.short MAP_ICE_PATH_B2F
	.short MAP_ICE_PATH_B3F
	.short MAP_WHIRL_ISLANDS_B1F, MAP_WHIRL_ISLANDS_B2F
	.short MAP_TOHJO_FALLS_HIDDEN_ROOM
	.short MAP_SAFARI_ZONE_ENTRANCE_EXTERIOR

	.data

ov101_021FB2C0:
	.word ov101_021F87B0
	.word ov101_021F87BA

ov101_021FB2C8: ; 0x021FB2C8
	.byte  2,  6
	.byte 26,  6
	.byte  2, 14
	.byte 26, 14

ov101_021FB2D0: ; 0x021FB2D0
	.word ov101_021F89B4
	.word ov101_021F8998
	.word ov101_021F89D8
	.word ov101_021F8964
	.word ov101_021F8978
	.word ov101_021F896C
	.word ov101_021F896C
	; 0x021FB300
