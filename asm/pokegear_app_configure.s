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

	thumb_func_start PokegearConfigure_Init
PokegearConfigure_Init: ; 0x021EE8E8
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
	mov r1, #0x4c
	mov r2, #0x5b
	bl OverlayManager_CreateAndGetData
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x4c
	bl memset
	str r5, [r4, #0xc]
	mov r0, #0x5b
	str r0, [r4]
	add r0, r4, #0
	bl ov101_021EE9D0
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end PokegearConfigure_Init

	thumb_func_start PokegearConfigure_Main
PokegearConfigure_Main: ; 0x021EE924
	push {r4, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	cmp r1, #9
	bhi _021EE99E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021EE93E: ; jump table
	.short _021EE952 - _021EE93E - 2 ; case 0
	.short _021EE95A - _021EE93E - 2 ; case 1
	.short _021EE962 - _021EE93E - 2 ; case 2
	.short _021EE96A - _021EE93E - 2 ; case 3
	.short _021EE972 - _021EE93E - 2 ; case 4
	.short _021EE97A - _021EE93E - 2 ; case 5
	.short _021EE982 - _021EE93E - 2 ; case 6
	.short _021EE98A - _021EE93E - 2 ; case 7
	.short _021EE992 - _021EE93E - 2 ; case 8
	.short _021EE99A - _021EE93E - 2 ; case 9
_021EE952:
	bl ov101_021EEA4C
	str r0, [r4]
	b _021EE99E
_021EE95A:
	bl ov101_021EEA70
	str r0, [r4]
	b _021EE99E
_021EE962:
	bl ov101_021EEAC4
	str r0, [r4]
	b _021EE99E
_021EE96A:
	bl ov101_021EEAD8
	str r0, [r4]
	b _021EE99E
_021EE972:
	bl ov101_021EEAE0
	str r0, [r4]
	b _021EE99E
_021EE97A:
	bl ov101_021EEAF4
	str r0, [r4]
	b _021EE99E
_021EE982:
	bl ov101_021EEBA4
	str r0, [r4]
	b _021EE99E
_021EE98A:
	bl ov101_021EEC04
	str r0, [r4]
	b _021EE99E
_021EE992:
	bl ov101_021EEC8C
	str r0, [r4]
	b _021EE99E
_021EE99A:
	mov r0, #1
	pop {r4, pc}
_021EE99E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end PokegearConfigure_Main

	thumb_func_start PokegearConfigure_Exit
PokegearConfigure_Exit: ; 0x021EE9A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov101_021EEA2C
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
	thumb_func_end PokegearConfigure_Exit

	thumb_func_start ov101_021EE9D0
ov101_021EE9D0: ; 0x021EE9D0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, _021EEA20 ; =ov101_021EF4B0
	str r4, [r0, #0x64]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl Pokegear_GetBackgroundStyle
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x19
	ldrh r2, [r4, #0x12]
	ldr r1, _021EEA24 ; =0xFFFF01FF
	lsr r0, r0, #0x10
	and r1, r2
	orr r0, r1
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x28]
	bl sub_0202EE98
	ldrh r1, [r4, #0x12]
	ldr r2, _021EEA28 ; =0xFFFFFE00
	add r3, r1, #0
	lsr r1, r2, #0x17
	and r3, r2
	and r0, r1
	orr r0, r3
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0x12]
	add r1, r0, #0
	and r1, r2
	mov r0, #0xff
	orr r0, r1
	strh r0, [r4, #0x12]
	pop {r4, pc}
	nop
_021EEA20: .word ov101_021EF4B0
_021EEA24: .word 0xFFFF01FF
_021EEA28: .word 0xFFFFFE00
	thumb_func_end ov101_021EE9D0

	thumb_func_start ov101_021EEA2C
ov101_021EEA2C: ; 0x021EEA2C
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0x12]
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x10
	ldr r0, [r0, #0x28]
	lsr r1, r1, #0x19
	bl Pokegear_SetBackgroundStyle
	ldr r0, [r4, #0xc]
	mov r1, #0
	str r1, [r0, #0x5c]
	ldr r0, [r4, #0xc]
	str r1, [r0, #0x60]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEA2C

	thumb_func_start ov101_021EEA4C
ov101_021EEA4C: ; 0x021EEA4C
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021EED44
	cmp r0, #0
	bne _021EEA5C
	mov r0, #0
	pop {r4, pc}
_021EEA5C:
	ldr r0, [r4, #0xc]
	ldrb r0, [r0, #5]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _021EEA6A
	mov r0, #7
	pop {r4, pc}
_021EEA6A:
	mov r0, #5
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEA4C

	thumb_func_start ov101_021EEA70
ov101_021EEA70: ; 0x021EEA70
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021EF7D4
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021EEA9A
	ldr r0, [r4, #0xc]
	bl PokegearApp_HandleInputModeChangeToButtons
	ldr r0, [r4, #0xc]
	ldrb r1, [r0, #6]
	cmp r1, #1
	bne _021EEA94
	bl PokegearApp_HandleKeyInput_SwitchApps
	b _021EEA9A
_021EEA94:
	add r0, r4, #0
	bl ov101_021EF6E4
_021EEA9A:
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021EEAC0
	cmp r0, #4
	beq _021EEAAC
	cmp r0, #8
	beq _021EEAB4
	b _021EEAB8
_021EEAAC:
	ldr r1, [r4, #0xc]
	str r0, [r1, #0x1c]
	mov r0, #6
	pop {r4, pc}
_021EEAB4:
	mov r0, #3
	pop {r4, pc}
_021EEAB8:
	ldr r1, [r4, #0xc]
	str r0, [r1, #0x1c]
	mov r0, #8
	pop {r4, pc}
_021EEAC0:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov101_021EEA70

	thumb_func_start ov101_021EEAC4
ov101_021EEAC4: ; 0x021EEAC4
	push {r3, lr}
	bl ov101_021EED98
	cmp r0, #0
	beq _021EEAD2
	mov r0, #9
	pop {r3, pc}
_021EEAD2:
	mov r0, #2
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEAC4

	thumb_func_start ov101_021EEAD8
ov101_021EEAD8: ; 0x021EEAD8
	ldr r3, _021EEADC ; =ov101_021EEDC4
	bx r3
	.balign 4, 0
_021EEADC: .word ov101_021EEDC4
	thumb_func_end ov101_021EEAD8

	thumb_func_start ov101_021EEAE0
ov101_021EEAE0: ; 0x021EEAE0
	push {r3, lr}
	bl ov101_021EEE80
	cmp r0, #0
	beq _021EEAEE
	mov r0, #1
	pop {r3, pc}
_021EEAEE:
	mov r0, #4
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEAE0

	thumb_func_start ov101_021EEAF4
ov101_021EEAF4: ; 0x021EEAF4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EEB06
	cmp r0, #1
	beq _021EEB8A
	b _021EEB9C
_021EEB06:
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
_021EEB20:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021EEB20
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
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021EEB9C
_021EEB8A:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EEB9C
	mov r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021EEB9C:
	mov r0, #5
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEAF4

	thumb_func_start ov101_021EEBA4
ov101_021EEBA4: ; 0x021EEBA4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EEBB6
	cmp r0, #1
	beq _021EEBD6
	b _021EEBFC
_021EEBB6:
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
	b _021EEBFC
_021EEBD6:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021EEBFC
	mov r4, #0
	add r6, r4, #0
_021EEBE2:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r6, #0
	bl ToggleBgLayer
	add r4, r4, #1
	cmp r4, #8
	blt _021EEBE2
	mov r0, #0
	str r0, [r5, #4]
	add sp, #0xc
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_021EEBFC:
	mov r0, #6
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEBA4

	thumb_func_start ov101_021EEC04
ov101_021EEC04: ; 0x021EEC04
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EEC18
	cmp r0, #1
	beq _021EEC5E
	cmp r0, #2
	beq _021EEC72
	b _021EEC88
_021EEC18:
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	mov r0, #0
	mov r1, #0xe
	mov r2, #1
	bl SetBlendBrightness
	mov r6, #1
	mov r4, #0
	add r7, r6, #0
_021EEC32:
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
	blt _021EEC32
	ldr r0, [r5, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021EEC88
_021EEC5E:
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl Pokegear_RunFadeLayers123
	cmp r0, #0
	beq _021EEC88
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021EEC88
_021EEC72:
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	ldr r0, [r5, #0xc]
	mov r1, #0
	strb r1, [r0, #9]
	str r1, [r5, #4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021EEC88:
	mov r0, #7
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021EEC04

	thumb_func_start ov101_021EEC8C
ov101_021EEC8C: ; 0x021EEC8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021EECA2
	cmp r0, #1
	beq _021EECBA
	cmp r0, #2
	beq _021EECCE
	b _021EED3C
_021EECA2:
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
	b _021EED3C
_021EECBA:
	ldr r0, [r5, #0xc]
	mov r1, #1
	bl Pokegear_RunFadeLayers123
	cmp r0, #0
	beq _021EED3C
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _021EED3C
_021EECCE:
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
	mov r4, #0
	add r6, r4, #0
	add r7, r4, #0
_021EED06:
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
	blt _021EED06
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
_021EED3C:
	mov r0, #8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEC8C

	thumb_func_start ov101_021EED44
ov101_021EED44: ; 0x021EED44
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _021EED54
	cmp r1, #1
	beq _021EED6E
	b _021EED8C
_021EED54:
	bl ov101_021EEF0C
	add r0, r4, #0
	bl ov101_021EEFE8
	add r0, r4, #0
	bl ov101_021EF00C
	add r0, r4, #0
	mov r1, #1
	bl ov101_021EF26C
	b _021EED8C
_021EED6E:
	bl ov101_021EF03C
	add r0, r4, #0
	bl ov101_021EF0E0
	add r0, r4, #0
	bl ov101_021EF130
	add r0, r4, #0
	bl ov101_021EF17C
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
_021EED8C:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EED44

	thumb_func_start ov101_021EED98
ov101_021EED98: ; 0x021EED98
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021EF16C
	add r0, r4, #0
	bl ov101_021EF120
	add r0, r4, #0
	bl ov101_021EF0C8
	add r0, r4, #0
	bl ov101_021EF028
	add r0, r4, #0
	bl ov101_021EEFFC
	add r0, r4, #0
	bl ov101_021EEFDC
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EED98

	thumb_func_start ov101_021EEDC4
ov101_021EEDC4: ; 0x021EEDC4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	bl TouchscreenListMenu_HandleInput
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021EEE0A
	ldr r0, [r5, #0x40]
	bl TouchscreenListMenu_WasLastInputTouch
	ldr r1, [r5, #0xc]
	str r0, [r1, #0xc]
	ldr r0, [r5, #0x40]
	bl TouchscreenListMenu_Destroy
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov101_021EF5A4
	ldr r0, [r5, #0xc]
	ldr r1, _021EEE10 ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #1
	bl PokegearAppSwitch_SetCursorSpritesAnimateFlag
	cmp r4, #0
	bne _021EEE06
	mov r0, #4
	pop {r3, r4, r5, pc}
_021EEE06:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021EEE0A:
	mov r0, #3
	pop {r3, r4, r5, pc}
	nop
_021EEE10: .word 0x0000FFFF
	thumb_func_end ov101_021EEDC4

	thumb_func_start ov101_021EEE14
ov101_021EEE14: ; 0x021EEE14
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021EF260
	ldrh r1, [r4, #0x12]
	ldr r0, _021EEE7C ; =0xFFFF01FF
	and r1, r0
	ldrb r0, [r4, #0x11]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r4, #0x12]
	ldrh r0, [r4, #0x12]
	lsl r0, r0, #0x10
	lsr r1, r0, #0x19
	ldr r0, [r4, #0xc]
	strb r1, [r0, #8]
	ldrh r1, [r4, #0x12]
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x19
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov100_021E5EB4
	ldrh r1, [r4, #0x12]
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x10
	add r0, #0x94
	lsr r1, r1, #0x19
	lsl r1, r1, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x18
	bl ov100_021E6A58
	add r0, r4, #0
	bl ov101_021EF1D8
	add r0, r4, #0
	mov r1, #0
	bl ov101_021EF26C
	add r0, r4, #0
	bl ov101_021EF414
	ldrh r1, [r4, #0x12]
	add r0, r4, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x19
	bl ov101_021EF384
	pop {r4, pc}
	.balign 4, 0
_021EEE7C: .word 0xFFFF01FF
	thumb_func_end ov101_021EEE14

	thumb_func_start ov101_021EEE80
ov101_021EEE80: ; 0x021EEE80
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _021EEF00
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EEE98: ; jump table
	.short _021EEEA0 - _021EEE98 - 2 ; case 0
	.short _021EEEB8 - _021EEE98 - 2 ; case 1
	.short _021EEECE - _021EEE98 - 2 ; case 2
	.short _021EEEE8 - _021EEE98 - 2 ; case 3
_021EEEA0:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r1, [r4]
	mov r3, #0
	str r1, [sp, #8]
	mov r1, #4
	add r2, r1, #0
	bl BeginNormalPaletteFade
	b _021EEF00
_021EEEB8:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _021EEEC6
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021EEEC6:
	add r0, r4, #0
	bl ov101_021EEE14
	b _021EEF00
_021EEECE:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r1, #3
	str r0, [sp, #8]
	mov r0, #2
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	b _021EEF00
_021EEEE8:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _021EEEF6
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_021EEEF6:
	mov r0, #0
	str r0, [r4, #8]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_021EEF00:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov101_021EEE80

	thumb_func_start ov101_021EEF0C
ov101_021EEF0C: ; 0x021EEF0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xac
	mov r1, #0
	add r5, r0, #0
	mov r0, #1
	add r2, r1, #0
	bl GX_SetGraphicsMode
	ldr r4, _021EEFD8 ; =ov101_021F8254
	add r3, sp, #4
	mov r2, #0x15
_021EEF22:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021EEF22
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
_021EEF90:
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
	blt _021EEF90
	add sp, #0xac
	pop {r4, r5, r6, r7, pc}
	nop
_021EEFD8: .word ov101_021F8254
	thumb_func_end ov101_021EEF0C

	thumb_func_start ov101_021EEFDC
ov101_021EEFDC: ; 0x021EEFDC
	ldr r3, _021EEFE4 ; =Pokegear_ClearAppBgLayers
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021EEFE4: .word Pokegear_ClearAppBgLayers
	thumb_func_end ov101_021EEFDC

	thumb_func_start ov101_021EEFE8
ov101_021EEFE8: ; 0x021EEFE8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #4
	bl FontID_Alloc
	add r0, r4, #0
	bl ov101_021EF1D8
	pop {r4, pc}
	thumb_func_end ov101_021EEFE8

	thumb_func_start ov101_021EEFFC
ov101_021EEFFC: ; 0x021EEFFC
	push {r3, lr}
	bl ov101_021EF260
	mov r0, #4
	bl FontID_Release
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021EEFFC

	thumb_func_start ov101_021EF00C
ov101_021EF00C: ; 0x021EF00C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl PokegearApp_CreateSpriteManager
	ldr r1, [r4, #0xc]
	ldr r0, [r4]
	ldr r1, [r1, #0x78]
	bl TouchscreenListMenuSpawner_Create
	str r0, [r4, #0x38]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF00C

	thumb_func_start ov101_021EF028
ov101_021EF028: ; 0x021EF028
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x38]
	bl TouchscreenListMenuSpawner_Destroy
	ldr r0, [r4, #0xc]
	bl PokegearApp_DestroySpriteManager
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF028

	thumb_func_start ov101_021EF03C
ov101_021EF03C: ; 0x021EF03C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r4, _021EF0C4 ; =ov101_021F82FC
	mov r7, #0
	add r5, r6, #0
_021EF046:
	ldr r1, [r6, #0xc]
	add r2, r4, #0
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteSystem_CreateSpriteFromResourceHeader
	str r0, [r5, #0x14]
	mov r1, #1
	bl thunk_Sprite_SetPriority
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl Sprite_SetDrawFlag
	ldr r0, [r5, #0x14]
	mov r1, #1
	bl Sprite_SetAnimActiveFlag
	add r7, r7, #1
	add r4, #0x28
	add r5, r5, #4
	cmp r7, #4
	ble _021EF046
	add r4, r6, #0
	ldr r7, _021EF0C4 ; =ov101_021F82FC
	mov r5, #5
	add r4, #0x14
_021EF082:
	ldr r1, [r6, #0xc]
	sub r3, r5, #5
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	mov r2, #0x28
	mul r2, r3
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r7, r2
	bl SpriteSystem_CreateSpriteFromResourceHeader
	str r0, [r4, #0x14]
	mov r1, #1
	bl thunk_Sprite_SetPriority
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl thunk_Sprite_SetDrawPriority
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl Sprite_SetDrawFlag
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl Sprite_SetAnimActiveFlag
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #8
	ble _021EF082
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021EF0C4: .word ov101_021F82FC
	thumb_func_end ov101_021EF03C

	thumb_func_start ov101_021EF0C8
ov101_021EF0C8: ; 0x021EF0C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_021EF0CE:
	ldr r0, [r5, #0x14]
	bl thunk_Sprite_Delete
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #9
	blt _021EF0CE
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF0C8

	thumb_func_start ov101_021EF0E0
ov101_021EF0E0: ; 0x021EF0E0
	push {r4, lr}
	sub sp, #0x18
	mov r3, #0
	add r4, r0, #0
	str r3, [sp]
	ldr r0, [r4]
	ldr r1, _021EF11C ; =ov101_021F820C
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	mov r2, #6
	str r0, [sp, #8]
	ldr r0, [r4, #0x18]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x1c]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x20]
	str r0, [sp, #0x14]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_AddButtons
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	add sp, #0x18
	pop {r4, pc}
	nop
_021EF11C: .word ov101_021F820C
	thumb_func_end ov101_021EF0E0

	thumb_func_start ov101_021EF120
ov101_021EF120: ; 0x021EF120
	ldr r0, [r0, #0xc]
	ldr r3, _021EF12C ; =PokegearAppSwitch_RemoveButtons
	ldr r0, [r0, #0x7c]
	mov r1, #1
	bx r3
	nop
_021EF12C: .word PokegearAppSwitch_RemoveButtons
	thumb_func_end ov101_021EF120

	thumb_func_start ov101_021EF130
ov101_021EF130: ; 0x021EF130
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #2
	bl ListMenuItems_New
	str r0, [r5, #0x3c]
	mov r1, #0x1b
	add r2, r1, #0
	ldr r3, [r5]
	mov r0, #0
	add r2, #0xf3
	bl NewMsgDataFromNarc
	add r6, r0, #0
	mov r4, #0
_021EF150:
	ldr r0, [r5, #0x3c]
	add r1, r6, #0
	add r2, r4, #0
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
	add r4, r4, #1
	cmp r4, #2
	blt _021EF150
	add r0, r6, #0
	bl DestroyMsgData
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF130

	thumb_func_start ov101_021EF16C
ov101_021EF16C: ; 0x021EF16C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl ListMenuItems_Delete
	mov r0, #0
	str r0, [r4, #0x3c]
	pop {r4, pc}
	thumb_func_end ov101_021EF16C

	thumb_func_start ov101_021EF17C
ov101_021EF17C: ; 0x021EF17C
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021EF414
	ldr r1, [r4, #0xc]
	ldrb r0, [r1, #6]
	cmp r0, #1
	ldr r0, [r1, #0x7c]
	bne _021EF1B6
	mov r1, #0
	mov r2, #1
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r4, #0xc]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	pop {r4, pc}
_021EF1B6:
	mov r1, #0
	add r2, r1, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	add r2, r1, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	pop {r4, pc}
	thumb_func_end ov101_021EF17C

	thumb_func_start ov101_021EF1D8
ov101_021EF1D8: ; 0x021EF1D8
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x91
	bl NARC_New
	add r4, r0, #0
	ldrh r0, [r5, #0x12]
	add r2, r4, #0
	mov r3, #0x91
	lsl r0, r0, #0x10
	lsr r0, r0, #0x19
	add r0, #0xa
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	ldrh r0, [r5, #0x12]
	add r2, r4, #0
	mov r3, #0x91
	lsl r0, r0, #0x10
	lsr r0, r0, #0x19
	add r0, #0x10
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	ldr r0, [r5]
	add r3, r5, #0
	str r0, [sp]
	ldrh r1, [r5, #0x12]
	add r0, r4, #0
	mov r2, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x19
	add r1, #0x16
	add r3, #0x48
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	str r0, [r5, #0x44]
	add r0, r4, #0
	bl NARC_Delete
	ldr r0, [r5, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov101_021EF1D8

	thumb_func_start ov101_021EF260
ov101_021EF260: ; 0x021EF260
	ldr r3, _021EF268 ; =FreeToHeap
	ldr r0, [r0, #0x44]
	bx r3
	nop
_021EF268: .word FreeToHeap
	thumb_func_end ov101_021EF260

	thumb_func_start ov101_021EF26C
ov101_021EF26C: ; 0x021EF26C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	ldr r1, [r5]
	mov r0, #0x91
	bl NARC_New
	add r4, r0, #0
	mov r1, #0
	mov r0, #7
	str r1, [sp]
	lsl r0, r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldrh r2, [r5, #0x12]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x19
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	add r2, r2, #4
	bl PaletteData_LoadFromOpenNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldrh r2, [r5, #0x12]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x19
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	add r2, r2, #4
	bl PaletteData_LoadFromOpenNarc
	cmp r6, #0
	beq _021EF304
	mov r0, #2
	str r0, [sp]
	mov r0, #0x16
	lsl r0, r0, #4
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
	mov r0, #0x16
	lsl r0, r0, #4
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
_021EF304:
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	cmp r6, #0
	beq _021EF33E
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
	b _021EF366
_021EF33E:
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r3, #1
	ldr r0, [r0, #0x78]
	add r2, r1, #0
	lsl r3, r3, #8
	bl PaletteData_BlendPalette
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	add r3, r1, #0
	ldr r0, [r0, #0x78]
	add r3, #0xfe
	bl PaletteData_BlendPalette
_021EF366:
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
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF26C

	thumb_func_start ov101_021EF384
ov101_021EF384: ; 0x021EF384
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r6, r1, #0
	ldrh r1, [r5, #0x12]
	ldr r0, _021EF410 ; =0xFFFF01FF
	and r1, r0
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x19
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r5, #0x12]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl BgClearTilemapBufferAndCommit
	add r0, r6, #0
	mov r1, #3
	ldr r4, [r5, #0x48]
	bl _s32_div_f
	add r7, r1, #0
	add r0, r6, #0
	mov r1, #3
	bl _s32_div_f
	add r3, r0, #0
	mov r0, #9
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xc
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldrh r0, [r4]
	mov r2, #0xa
	mul r2, r7
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r4, #2]
	lsl r4, r3, #3
	add r3, r3, r4
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	add r2, r2, #2
	add r3, r3, #2
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r0, #0x74]
	mov r1, #2
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl CopyToBgTilemapRect
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021EF410: .word 0xFFFF01FF
	thumb_func_end ov101_021EF384

	thumb_func_start ov101_021EF414
ov101_021EF414: ; 0x021EF414
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r7, r0, #0
	mov r4, #1
	mov r6, #0
_021EF41E:
	ldrh r0, [r7, #0x12]
	lsl r0, r0, #0x17
	lsr r0, r0, #0x17
	tst r0, r4
	beq _021EF42A
	b _021EF48A
_021EF42A:
	add r0, r6, #0
	mov r1, #3
	ldr r5, [r7, #0x48]
	bl _s32_div_f
	str r1, [sp, #0x1c]
	add r0, r6, #0
	mov r1, #3
	bl _s32_div_f
	mov ip, r0
	mov r0, #6
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0xc
	str r0, [sp, #8]
	mov r0, #6
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldrh r0, [r5]
	ldr r3, [sp, #0x1c]
	mov r2, #0xa
	mul r2, r3
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r5, #2]
	mov r3, ip
	lsl r5, r3, #3
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	mov r3, ip
	str r0, [sp, #0x18]
	ldr r0, [r7, #0xc]
	add r3, r3, r5
	add r2, r2, #3
	add r3, r3, #3
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r0, #0x74]
	mov r1, #3
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl CopyToBgTilemapRect
_021EF48A:
	lsl r0, r4, #0x11
	add r6, r6, #1
	lsr r4, r0, #0x10
	cmp r6, #6
	blt _021EF41E
	ldr r0, [r7, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldrh r1, [r7, #0x12]
	add r0, r7, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x19
	bl ov101_021EF384
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF414

	thumb_func_start ov101_021EF4B0
ov101_021EF4B0: ; 0x021EF4B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	mov r2, #0xff
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	add r2, r1, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	add r2, r1, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021EF4B0

	thumb_func_start ov101_021EF4DC
ov101_021EF4DC: ; 0x021EF4DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	strb r1, [r0, #6]
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	mov r2, #0xff
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	add r2, r1, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r4, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x7c]
	add r2, r1, #0
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	pop {r4, pc}
	thumb_func_end ov101_021EF4DC

	thumb_func_start ov101_021EF50C
ov101_021EF50C: ; 0x021EF50C
	push {r4, r5, r6, lr}
	sub sp, #0x28
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0x10
	mov r1, #0
	mov r2, #0x18
	strb r4, [r5, #0x11]
	bl MI_CpuFill8
	ldr r2, _021EF590 ; =ov101_021F83C4
	add r0, sp, #0x10
	ldrh r3, [r2]
	ldr r6, _021EF594 ; =ov101_021F83D0
	add r1, sp, #0x10
	strh r3, [r0]
	ldrh r3, [r2, #2]
	strh r3, [r0, #2]
	ldrh r3, [r2, #4]
	strh r3, [r0, #4]
	ldrh r3, [r2, #6]
	strh r3, [r0, #6]
	ldrh r3, [r2, #8]
	ldrh r2, [r2, #0xa]
	strh r3, [r0, #8]
	strh r2, [r0, #0xa]
	ldr r2, [r5, #0x3c]
	str r2, [sp, #0x1c]
	ldr r2, [r5, #0xc]
	ldr r2, [r2, #0x74]
	str r2, [sp, #0x20]
	mov r2, #2
	strb r2, [r0, #0x14]
	lsl r0, r4, #1
	add r3, r4, r0
	ldr r0, _021EF598 ; =ov101_021F83D0 + 1
	ldrb r0, [r0, r3]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _021EF59C ; =ov101_021F83D0 + 2
	ldrb r0, [r0, r3]
	ldrb r3, [r6, r3]
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	ldr r0, [r5, #0x38]
	ldr r2, [r2, #0xc]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl TouchscreenListMenu_CreateWithAlignment
	str r0, [r5, #0x40]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov101_021EF5A4
	ldr r0, [r5, #0xc]
	ldr r1, _021EF5A0 ; =0x0000FFFF
	ldr r0, [r0, #0x7c]
	mov r2, #0
	bl PokegearAppSwitch_SetCursorSpritesAnimateFlag
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021EF590: .word ov101_021F83C4
_021EF594: .word ov101_021F83D0
_021EF598: .word ov101_021F83D0 + 1
_021EF59C: .word ov101_021F83D0 + 2
_021EF5A0: .word 0x0000FFFF
	thumb_func_end ov101_021EF50C

	thumb_func_start ov101_021EF5A4
ov101_021EF5A4: ; 0x021EF5A4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	cmp r2, #0
	beq _021EF680
	ldr r1, _021EF6B8 ; =0x04000048
	mov r3, #0x3f
	ldrh r2, [r1]
	mov r5, #0x1f
	bic r2, r3
	orr r2, r5
	strh r2, [r1]
	ldrh r6, [r1]
	ldr r2, _021EF6BC ; =0xFFFFC0FF
	and r6, r2
	lsl r2, r5, #8
	orr r2, r6
	strh r2, [r1]
	ldrh r2, [r1, #2]
	bic r2, r3
	add r3, r2, #0
	orr r3, r5
	mov r2, #0x20
	orr r2, r3
	strh r2, [r1, #2]
	ldr r6, [r0, #0x40]
	add r0, r6, #0
	add r0, #0x28
	ldrb r0, [r0]
	lsl r5, r0, #3
	add r0, r6, #0
	add r6, #0x26
	ldrb r6, [r6]
	add r0, #0x29
	ldrb r0, [r0]
	add r6, r6, #2
	lsl r6, r6, #3
	lsl r3, r0, #3
	lsl r2, r5, #8
	mov r0, #0xff
	add r5, r5, r6
	lsl r0, r0, #8
	lsl r5, r5, #0x18
	and r2, r0
	lsr r5, r5, #0x18
	orr r5, r2
	add r2, r1, #0
	sub r2, #8
	strh r5, [r2]
	lsl r2, r3, #8
	add r3, #0x38
	and r2, r0
	lsl r0, r3, #0x18
	lsr r0, r0, #0x18
	orr r2, r0
	sub r0, r1, #4
	strh r2, [r0]
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	mov r0, #0x50
	add r2, r1, #0
	mul r2, r0
	add r0, r2, #0
	add r0, #0x18
	lsl r1, r0, #8
	mov r0, #0xff
	lsl r0, r0, #8
	add r2, #0x48
	and r1, r0
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	orr r1, r0
	ldr r0, _021EF6C0 ; =0x04000042
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	mov r1, #0x48
	add r2, r0, #0
	mul r2, r1
	add r0, r2, #0
	add r0, #0x18
	lsl r1, r0, #8
	mov r0, #0xff
	lsl r0, r0, #8
	add r2, #0x40
	and r1, r0
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	orr r1, r0
	ldr r0, _021EF6C4 ; =0x04000046
	add r3, r0, #0
	strh r1, [r0]
	sub r3, #0x46
	ldr r2, [r3]
	ldr r1, _021EF6C8 ; =0xFFFF1FFF
	add r0, #0xa
	and r2, r1
	mov r1, #6
	lsl r1, r1, #0xc
	orr r1, r2
	str r1, [r3]
	mov r1, #0x1f
	add r2, r1, #0
	sub r2, #0x27
	bl G2x_SetBlendBrightness_
	pop {r4, r5, r6, pc}
_021EF680:
	ldr r0, _021EF6B8 ; =0x04000048
	mov r2, #0x3f
	ldrh r1, [r0]
	bic r1, r2
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _021EF6BC ; =0xFFFFC0FF
	and r1, r3
	strh r1, [r0]
	ldrh r1, [r0, #2]
	add r3, r0, #0
	sub r3, #0x48
	bic r1, r2
	strh r1, [r0, #2]
	ldr r2, [r3]
	ldr r1, _021EF6C8 ; =0xFFFF1FFF
	add r0, #8
	and r1, r2
	str r1, [r3]
	mov r1, #0x1f
	mov r2, #0
	bl G2x_SetBlendBrightness_
	ldr r0, _021EF6CC ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	pop {r4, r5, r6, pc}
	nop
_021EF6B8: .word 0x04000048
_021EF6BC: .word 0xFFFFC0FF
_021EF6C0: .word 0x04000042
_021EF6C4: .word 0x04000046
_021EF6C8: .word 0xFFFF1FFF
_021EF6CC: .word 0x04000050
	thumb_func_end ov101_021EF5A4

	thumb_func_start ov101_021EF6D0
ov101_021EF6D0: ; 0x021EF6D0
	mov r2, #1
	ldrh r0, [r0, #0x12]
	lsl r2, r1
	lsl r1, r2, #0x10
	lsl r0, r0, #0x17
	lsr r1, r1, #0x10
	lsr r0, r0, #0x17
	and r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021EF6D0

	thumb_func_start ov101_021EF6E4
ov101_021EF6E4: ; 0x021EF6E4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _021EF7C8 ; =gSystem
	mov r2, #2
	ldr r0, [r0, #0x48]
	add r1, r0, #0
	tst r1, r2
	beq _021EF730
	ldr r0, [r4, #0xc]
	mov r1, #1
	strb r1, [r0, #6]
	ldr r0, [r4, #0xc]
	mov r2, #0
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	mov r2, #1
	bl PokegearAppSwitchCursor_SetCursorSpritesDrawState
	ldr r0, [r4, #0xc]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_SetSpecIndexAndCursorPos
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EF730:
	mov r1, #1
	add r3, r0, #0
	tst r3, r1
	beq _021EF766
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x7c]
	bl PokegearAppSwitch_GetCursorPos
	add r5, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov101_021EF6D0
	cmp r0, #0
	bne _021EF754
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EF754:
	add r0, r4, #0
	add r1, r5, #0
	bl ov101_021EF50C
	ldr r0, _021EF7CC ; =0x00000941
	bl PlaySE
	mov r0, #8
	pop {r3, r4, r5, pc}
_021EF766:
	mov r3, #0x20
	tst r3, r0
	beq _021EF77E
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
	ldr r0, _021EF7D0 ; =0x0000093F
	bl PlaySE
	b _021EF7C2
_021EF77E:
	mov r3, #0x10
	tst r3, r0
	beq _021EF794
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
	ldr r0, _021EF7D0 ; =0x0000093F
	bl PlaySE
	b _021EF7C2
_021EF794:
	mov r1, #0x40
	tst r1, r0
	beq _021EF7AC
	ldr r0, [r4, #0xc]
	add r1, r2, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
	ldr r0, _021EF7D0 ; =0x0000093F
	bl PlaySE
	b _021EF7C2
_021EF7AC:
	mov r1, #0x80
	tst r0, r1
	beq _021EF7C2
	ldr r0, [r4, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x7c]
	bl ov100_021E73AC
	ldr r0, _021EF7D0 ; =0x0000093F
	bl PlaySE
_021EF7C2:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EF7C8: .word gSystem
_021EF7CC: .word 0x00000941
_021EF7D0: .word 0x0000093F
	thumb_func_end ov101_021EF6E4

	thumb_func_start ov101_021EF7D4
ov101_021EF7D4: ; 0x021EF7D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl PokegearApp_HandleTouchInput_SwitchApps
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021EF83C
	ldr r0, _021EF840 ; =ov101_021F83E4
	bl TouchscreenHitbox_FindRectAtTouchNew
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021EF83C
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov101_021EF6D0
	cmp r0, #0
	bne _021EF80A
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021EF80A:
	ldr r0, [r5, #0xc]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _021EF818
	add r0, r5, #0
	bl ov101_021EF4DC
_021EF818:
	ldr r0, [r5, #0xc]
	lsl r1, r4, #0x18
	ldr r0, [r0, #0x7c]
	lsr r1, r1, #0x18
	bl ov100_021E73C8
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov101_021EF50C
	ldr r0, _021EF844 ; =0x00000941
	bl PlaySE
	ldr r0, [r5, #0xc]
	mov r1, #1
	str r1, [r0, #0xc]
	mov r0, #8
_021EF83C:
	pop {r3, r4, r5, pc}
	nop
_021EF840: .word ov101_021F83E4
_021EF844: .word 0x00000941
	thumb_func_end ov101_021EF7D4

    .rodata


ov101_021F820C: ; 0x021F820C
	.byte 0x00, 0x00, 0x02, 0x01
	.byte 0x03, 0x03, 0x30, 0x2C, 0xEA, 0x16, 0xEE, 0x12, 0x01, 0x00, 0x00, 0x02, 0x04, 0x04, 0x80, 0x2C
	.byte 0xEA, 0x16, 0xEE, 0x12, 0x02, 0x00, 0x01, 0x00, 0x05, 0x05, 0xD0, 0x2C, 0xEA, 0x16, 0xEE, 0x12
	.byte 0x03, 0x00, 0x05, 0x04, 0x00, 0x00, 0x30, 0x74, 0xEA, 0x16, 0xEE, 0x12, 0x04, 0x00, 0x03, 0x05
	.byte 0x01, 0x01, 0x80, 0x74, 0xEA, 0x16, 0xEE, 0x12, 0x05, 0x00, 0x04, 0x03, 0x02, 0x02, 0xD0, 0x74
	.byte 0xEA, 0x16, 0xEE, 0x12

ov101_021F8254: ; 0x021F8254
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F82FC: ; 0x021F82FC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov101_021F83C4: ; 0x021F83C4
	.short 0x0003
	.short 0x0A01
	.short 0x0101
	.short 0x001C
	.short 0x0001
	.short 0x0040

ov101_021F83D0: ; 0x021F83D0
	.byte 0x0A, 0x02, 0x00
	.byte 0x14, 0x02, 0x00
	.byte 0x16, 0x02, 0x02
	.byte 0x0A, 0x0B, 0x00
	.byte 0x14, 0x0B, 0x00
	.byte 0x16, 0x0B, 0x02

	.balign 4, 0
ov101_021F83E4: ; 0x021F83E4
	.byte 0x18, 0x40, 0x18, 0x48
	.byte 0x18, 0x40, 0x68, 0x98
	.byte 0x18, 0x40, 0xB8, 0xE8
	.byte 0x60, 0x88, 0x18, 0x48
	.byte 0x60, 0x88, 0x68, 0x98
	.byte 0x60, 0x88, 0xB8, 0xE8
	.byte 0xFF, 0x00, 0x00, 0x00
