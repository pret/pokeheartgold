#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
#include "msgdata/msg/msg_0041.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D43B4:
	.space 4

	.text

	thumb_func_start sub_02096318
sub_02096318: ; 0x02096318
	ldr r3, _0209632C ; =OS_IRQTable
	ldr r1, _02096330 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	ldr r3, _02096334 ; =MI_WaitDma
	mov r0, #3
	bx r3
	nop
_0209632C: .word OS_IRQTable
_02096330: .word 0x00003FF8
_02096334: .word MI_WaitDma
	thumb_func_end sub_02096318

	thumb_func_start PrintErrorMessageAndReset
PrintErrorMessageAndReset: ; 0x02096338
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r0, _02096548 ; =_021D43B4
	ldr r1, [r0]
	cmp r1, #1
	bne _02096346
	b _02096544
_02096346:
	mov r1, #1
	str r1, [r0]
	mov r0, #0
	bl OS_GetInitArenaHi
	add r1, r0, #0
	mov r0, #0
	bl OS_SetArenaHi
	mov r0, #0
	bl OS_GetInitArenaLo
	add r1, r0, #0
	mov r0, #0
	bl OS_SetArenaLo
	mov r1, #1
	ldr r0, _0209654C ; =_02108528
	add r2, r1, #0
	mov r3, #0
	bl InitHeapSystem
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #1
	bl OS_DisableIrqMask
	ldr r1, _02096550 ; =sub_02096318
	mov r0, #1
	bl OS_SetIrqFunction
	mov r0, #1
	bl OS_EnableIrqMask
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
	ldr r0, _02096554 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02096558 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	ldr r0, _0209655C ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	ldr r3, _02096560 ; =0x04000050
	mov r0, #0
	strh r0, [r3]
	ldr r2, _02096564 ; =0x04001050
	sub r3, #0x50
	strh r0, [r2]
	ldr r1, [r3]
	ldr r0, _02096568 ; =0xFFFF1FFF
	sub r2, #0x50
	and r1, r0
	str r1, [r3]
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r0, _0209656C ; =_0210855C
	bl GX_SetBanks
	mov r0, #0
	bl BgConfig_Alloc
	str r0, [sp, #0x10]
	ldr r0, _02096570 ; =_02108530
	bl SetBothScreensModesAndDisable
	mov r1, #0
	ldr r0, [sp, #0x10]
	ldr r2, _02096574 ; =_02108540
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x10]
	ldr r2, _02096578 ; =0x000001F7
	mov r3, #2
	str r1, [sp, #4]
	bl sub_0200E3DC
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	bl sub_02003030
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	add r3, r0, #0
	bl BG_ClearCharDataRange
	ldr r1, _0209657C ; =0x00006C21
	mov r0, #0
	bl BG_SetMaskColor
	ldr r1, _0209657C ; =0x00006C21
	mov r0, #4
	bl BG_SetMaskColor
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x29
	mov r3, #0
	bl NewMsgDataFromNarc
	str r0, [sp, #0xc]
	mov r0, #6
	lsl r0, r0, #6
	mov r1, #0
	bl String_ctor
	add r4, r0, #0
	bl sub_02020080
	ldr r0, [sp, #0x10]
	ldr r2, _02096580 ; =_02108520
	add r1, sp, #0x14
	bl AddWindow
	mov r0, #0xd0
	str r0, [sp]
	mov r0, #0x90
	mov r2, #0
	str r0, [sp, #4]
	add r0, sp, #0x14
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r2, _02096578 ; =0x000001F7
	add r0, sp, #0x14
	mov r1, #0
	mov r3, #2
	bl DrawFrameAndWindow1
	ldr r0, [sp, #0xc]
	mov r1, #msg_0041_00003
	add r2, r4, #0
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	add r0, sp, #0x14
	add r2, r4, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl String_dtor
	bl GX_BothDispOn
	mov r0, #0
	bl SetMasterBrightnessNeutral
	mov r0, #1
	bl SetMasterBrightnessNeutral
	mov r0, #0
	mov r1, #0x3f
	mov r2, #3
	bl SetBlendBrightness
	bl sub_02038D90
	mov r4, #1
_020964D8:
	bl HandleDSLidAction
	bl sub_02036144
	bl sub_02039AA4
	cmp r0, #0
	bne _020964F2
	add r0, r4, #0
	add r1, r4, #0
	bl OS_WaitIrq
	b _020964D8
_020964F2:
	ldr r5, _02096584 ; =0x04000130
	ldr r4, _02096588 ; =0x027FFFA8
	ldr r7, _0209658C ; =0x00002FFF
	mov r6, #1
_020964FA:
	bl HandleDSLidAction
	ldrh r1, [r5]
	ldrh r0, [r4]
	orr r1, r0
	ldr r0, _0209658C ; =0x00002FFF
	eor r0, r1
	and r0, r7
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	tst r0, r6
	bne _0209651C
	mov r0, #1
	add r1, r0, #0
	bl OS_WaitIrq
	b _020964FA
_0209651C:
	ldr r1, _02096590 ; =0x00007FFF
	mov r0, #0
	bl sub_0200FBF4
	ldr r1, _02096590 ; =0x00007FFF
	mov r0, #1
	bl sub_0200FBF4
	add r0, sp, #0x14
	bl RemoveWindow
	ldr r0, [sp, #0xc]
	bl DestroyMsgData
	ldr r0, [sp, #0x10]
	bl FreeToHeap
	mov r0, #0
	bl OS_ResetSystem
_02096544:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02096548: .word _021D43B4
_0209654C: .word _02108528
_02096550: .word sub_02096318
_02096554: .word 0xFFFFE0FF
_02096558: .word 0x04001000
_0209655C: .word gSystem + 0x60
_02096560: .word 0x04000050
_02096564: .word 0x04001050
_02096568: .word 0xFFFF1FFF
_0209656C: .word _0210855C
_02096570: .word _02108530
_02096574: .word _02108540
_02096578: .word 0x000001F7
_0209657C: .word 0x00006C21
_02096580: .word _02108520
_02096584: .word 0x04000130
_02096588: .word 0x027FFFA8
_0209658C: .word 0x00002FFF
_02096590: .word 0x00007FFF
	thumb_func_end PrintErrorMessageAndReset

	.rodata

_02108520:
	.byte 0x00, 0x03, 0x03, 0x1A, 0x12, 0x01, 0x23, 0x00
_02108528:
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
_02108530:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02108540:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0210855C:
	.byte 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
