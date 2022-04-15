#include "constants/sndseq.h"
#include "constants/moves.h"
#include "constants/std_script.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "constants/maps.h"
#include "constants/mmodel.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021F3F50
ov01_021F3F50: ; 0x021F3F50
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [r1, #0xc]
	add r5, r0, #0
	add r0, r4, #0
	bl Save_FlyPoints_get
	bl FlyPoints_GetPosition
	add r6, r0, #0
	add r0, r4, #0
	bl Sav2_Pokedex_get
	add r7, r0, #0
	ldr r0, [r6]
	bl MapHeader_GetMapSec
	str r0, [r5, #4]
	add r0, r7, #0
	bl Pokedex_IsEnabled
	cmp r0, #0
	beq _021F3F84
	add r0, r7, #0
	bl Pokedex_CountDexOwned
	b _021F3F86
_021F3F84:
	mov r0, #0
_021F3F86:
	str r0, [r5]
	add r0, r4, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r5, #8]
	add r0, r4, #0
	bl Sav2_PlayerData_GetIGTAddr
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F3F50

	thumb_func_start ov01_021F3F9C
ov01_021F3F9C: ; 0x021F3F9C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	ldr r2, [r4, #4]
	mov r1, #0
	add r5, r0, #0
	bl BufferLandmarkName
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BufferPlayersName
	ldr r0, [r4, #8]
	bl PlayerProfile_CountBadges
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	mov r1, #2
	str r0, [sp, #4]
	add r0, r5, #0
	add r3, r1, #0
	bl BufferIntegerAsString
	ldr r2, [r4]
	cmp r2, #0x64
	blt _021F3FDC
	mov r3, #3
	mov r0, #0
	b _021F3FEA
_021F3FDC:
	cmp r2, #0xa
	blt _021F3FE6
	mov r3, #3
	mov r0, #1
	b _021F3FEA
_021F3FE6:
	mov r3, #2
	mov r0, #1
_021F3FEA:
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #3
	bl BufferIntegerAsString
	ldr r0, [r4, #0xc]
	bl GetIGTHours
	add r2, r0, #0
	cmp r2, #0x64
	blt _021F400A
	mov r3, #3
	mov r0, #0
	b _021F4018
_021F400A:
	cmp r2, #0xa
	blt _021F4014
	mov r3, #3
	mov r0, #1
	b _021F4018
_021F4014:
	mov r3, #2
	mov r0, #1
_021F4018:
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #4
	bl BufferIntegerAsString
	ldr r0, [r4, #0xc]
	bl GetIGTMinutes
	mov r3, #2
	add r2, r0, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #5
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F3F9C

	thumb_func_start ov01_021F4044
ov01_021F4044: ; 0x021F4044
	mov r0, #0xa
	bx lr
	thumb_func_end ov01_021F4044

	thumb_func_start ov01_021F4048
ov01_021F4048: ; 0x021F4048
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #0
	mov r1, #1
	bl GetFontAttribute
	add r4, r0, #0
	mov r0, #0
	mov r1, #3
	bl GetFontAttribute
	add r0, r4, r0
	str r0, [sp, #0x14]
	mov r4, #0
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r3, [r5, #4]
	add r2, r4, #0
	bl ReadMsgData_ExpandPlaceholders
	add r1, r4, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5, #0x10]
	add r2, r6, #0
	add r3, r1, #0
	bl AddTextPrinterParameterized
	add r0, r6, #0
	bl String_dtor
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, _021F4124 ; =ov01_02206AF4
	ldr r7, _021F4128 ; =ov01_02206AE4
	str r0, [sp, #0xc]
_021F4098:
	ldr r0, [sp, #0xc]
	ldr r1, [r0]
	cmp r1, #3
	bne _021F40A6
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _021F410E
_021F40A6:
	ldr r0, [sp, #0x14]
	add r4, r4, r0
	ldr r0, [r5, #0x18]
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r1, #0
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r5, #0x10]
	add r2, r6, #0
	add r3, r1, #0
	bl AddTextPrinterParameterized
	add r0, r6, #0
	bl String_dtor
	sub r2, r7, #4
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r2, [r2]
	ldr r3, [r5, #4]
	bl ReadMsgData_ExpandPlaceholders
	add r6, r0, #0
	mov r0, #0
	mov r1, #2
	bl GetFontAttribute
	add r2, r0, #0
	mov r0, #0
	add r1, r6, #0
	bl FontID_String_GetWidth
	mov r1, #0x68
	sub r3, r1, r0
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r5, #0x10]
	mov r1, #0
	add r2, r6, #0
	bl AddTextPrinterParameterized
	add r0, r6, #0
	bl String_dtor
_021F410E:
	ldr r0, [sp, #0xc]
	add r7, r7, #4
	add r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #5
	blo _021F4098
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F4124: .word ov01_02206AF4
_021F4128: .word ov01_02206AE4
	thumb_func_end ov01_021F4048

	thumb_func_start SaveStatsPrinter_Print
SaveStatsPrinter_Print: ; 0x021F412C
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #0x10
	bl AllocFromHeap
	str r0, [r4, #0x10]
	mov r3, #1
	str r3, [sp]
	ldr r0, [r4, #0x2c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _021F419C ; =0x00000189
	str r0, [sp, #0x10]
	ldrb r2, [r4, #8]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	bl AddWindowParameterized
	mov r0, #0
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r2, _021F41A0 ; =0x000003D9
	str r0, [sp, #4]
	ldrb r1, [r4, #8]
	ldr r0, [r4, #0xc]
	mov r3, #0xb
	bl LoadUserFrameGfx1
	mov r0, #0
	mov r1, #6
	bl GetFontAttribute
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl ov01_021F4048
	ldr r0, [r4, #0x10]
	ldr r2, _021F41A0 ; =0x000003D9
	mov r1, #0
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_021F419C: .word 0x00000189
_021F41A0: .word 0x000003D9
	thumb_func_end SaveStatsPrinter_Print

	thumb_func_start SaveStatsPrinter_RemoveFromScreen
SaveStatsPrinter_RemoveFromScreen: ; 0x021F41A4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_0200E5D4
	ldr r0, [r4, #0x10]
	bl RemoveWindow
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end SaveStatsPrinter_RemoveFromScreen

	thumb_func_start Field_CreateSaveStatsPrinter
Field_CreateSaveStatsPrinter: ; 0x021F41C0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x34
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	str r6, [r4]
	str r5, [r4, #4]
	strb r7, [r4, #8]
	ldr r0, [r6, #8]
	str r0, [r4, #0xc]
	add r0, r5, #0
	bl ScrStrBufs_new
	str r0, [r4, #0x14]
	ldr r2, _021F4218 ; =0x000001A7
	mov r0, #1
	mov r1, #0x1b
	add r3, r5, #0
	bl NewMsgDataFromNarc
	str r0, [r4, #0x18]
	add r0, r4, #0
	ldr r1, [r4]
	add r0, #0x1c
	bl ov01_021F3F50
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #0x1c
	bl ov01_021F3F9C
	mov r0, #0xd
	str r0, [r4, #0x2c]
	add r0, r4, #0
	add r0, #0x1c
	bl ov01_021F4044
	str r0, [r4, #0x30]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F4218: .word 0x000001A7
	thumb_func_end Field_CreateSaveStatsPrinter

	thumb_func_start SaveStatsPrinter_Delete
SaveStatsPrinter_Delete: ; 0x021F421C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	bl DestroyMsgData
	ldr r0, [r4, #0x14]
	bl ScrStrBufs_delete
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end SaveStatsPrinter_Delete

	thumb_func_start ov01_021F4234
ov01_021F4234: ; 0x021F4234
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	cmp r2, #1
	beq _021F4244
	cmp r2, #2
	beq _021F4254
	b _021F4268
_021F4244:
	add r0, r3, #0
	add r2, r4, #0
	bl FontID_String_GetWidth
	ldrb r1, [r5, #7]
	lsl r1, r1, #3
	sub r4, r1, r0
	b _021F4268
_021F4254:
	add r0, r3, #0
	add r2, r4, #0
	bl FontID_String_GetWidth
	ldrb r1, [r5, #7]
	lsl r1, r1, #3
	sub r1, r1, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r4, r0, #1
_021F4268:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021F4234

	thumb_func_start ov01_021F426C
ov01_021F426C: ; 0x021F426C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0
	mov r1, #1
	bl GetFontAttribute
	add r4, r0, #0
	mov r0, #0
	mov r1, #3
	bl GetFontAttribute
	add r0, r4, r0
	ldr r4, _021F42F0 ; =ov01_02206B04
	str r0, [sp, #0x10]
	mov r7, #0
_021F428C:
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	bne _021F429C
	ldr r0, [r4]
	cmp r0, #0xb
	beq _021F42E2
	cmp r0, #7
	beq _021F42E2
_021F429C:
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r2, [r4]
	ldr r3, [r5, #4]
	bl ReadMsgData_ExpandPlaceholders
	add r6, r0, #0
	ldr r0, [r5, #0x10]
	ldr r2, [r4, #4]
	add r1, r6, #0
	mov r3, #0
	bl ov01_021F4234
	add r3, r0, #0
	ldr r1, [r4, #8]
	ldr r0, [sp, #0x10]
	add r2, r6, #0
	mul r1, r0
	str r1, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	lsl r1, r0, #2
	ldr r0, _021F42F4 ; =ov01_02206AD8
	ldr r0, [r0, r1]
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x10]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
_021F42E2:
	add r7, r7, #1
	add r4, #0x10
	cmp r7, #9
	blo _021F428C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021F42F0: .word ov01_02206B04
_021F42F4: .word ov01_02206AD8
	thumb_func_end ov01_021F426C

	thumb_func_start ov01_021F42F8
ov01_021F42F8: ; 0x021F42F8
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #0x10
	bl AllocFromHeap
	str r0, [r4, #0x10]
	mov r0, #2
	str r0, [sp]
	ldr r0, [r4, #0x2c]
	mov r3, #7
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r0, _021F4348 ; =0x0000010B
	str r0, [sp, #0x10]
	ldrb r2, [r4, #8]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	bl AddWindowParameterized
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl ov01_021F426C
	ldr r0, [r4, #0x10]
	bl CopyWindowToVram
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_021F4348: .word 0x0000010B
	thumb_func_end ov01_021F42F8

	thumb_func_start ov01_021F434C
ov01_021F434C: ; 0x021F434C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl RemoveWindow
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F434C

	thumb_func_start ov01_021F4360
ov01_021F4360: ; 0x021F4360
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x34
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	str r6, [r4]
	str r5, [r4, #4]
	strb r7, [r4, #8]
	ldr r0, [r6, #8]
	str r0, [r4, #0xc]
	add r0, r5, #0
	bl ScrStrBufs_new
	str r0, [r4, #0x14]
	ldr r2, _021F43CC ; =0x000001A7
	mov r0, #1
	mov r1, #0x1b
	add r3, r5, #0
	bl NewMsgDataFromNarc
	str r0, [r4, #0x18]
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #1
	bl sub_02002B8C
	add r0, r4, #0
	ldr r1, [r4]
	add r0, #0x1c
	bl ov01_021F3F50
	add r1, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #0x1c
	bl ov01_021F3F9C
	mov r0, #0x13
	str r0, [r4, #0x2c]
	add r0, r4, #0
	add r0, #0x1c
	bl ov01_021F4044
	str r0, [r4, #0x30]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F43CC: .word 0x000001A7
	thumb_func_end ov01_021F4360

	thumb_func_start ov01_021F43D0
ov01_021F43D0: ; 0x021F43D0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	bl DestroyMsgData
	ldr r0, [r4, #0x14]
	bl ScrStrBufs_delete
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov01_021F43D0

	thumb_func_start Field_SaveGameNormal
Field_SaveGameNormal: ; 0x021F43E8
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021F4404
	ldr r0, [r4, #0xc]
	bl SaveGameNormal
	cmp r0, #2
	bne _021F43FE
	mov r0, #1
	pop {r4, pc}
_021F43FE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end Field_SaveGameNormal

	thumb_func_start ov01_021F4404
ov01_021F4404: ; 0x021F4404
	push {r4, lr}
	add r4, r0, #0
	bl Fsys_SyncMapObjectsToSave
	add r0, r4, #0
	mov r1, #4
	mov r2, #0
	bl ov01_021F6830
	ldr r0, [r4, #0x40]
	bl GetPlayerXCoord
	ldr r1, [r4, #0x20]
	str r0, [r1, #8]
	ldr r0, [r4, #0x40]
	bl GetPlayerYCoord
	ldr r1, [r4, #0x20]
	str r0, [r1, #0xc]
	mov r1, #0
	ldr r0, [r4, #0x20]
	mvn r1, r1
	str r1, [r0, #4]
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	ldr r1, [r4, #0x20]
	str r0, [r1, #0x10]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F4404

	thumb_func_start ov01_021F4440
ov01_021F4440: ; 0x021F4440
	push {r3, lr}
	cmp r0, #0
	bne _021F444C
	bl GF_AssertFail
	pop {r3, pc}
_021F444C:
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	cmp r1, #MAP_UNION
	beq _021F4460
	cmp r1, #MAP_DIRECT2
	beq _021F4460
	cmp r1, #MAP_DIRECT4
	beq _021F4460
	bl ov01_021F4404
_021F4460:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021F4440

	.rodata

ov01_02206AD8: ; 0x02206AD8
	.byte 0x00, 0x02, 0x0F, 0x00, 0x00, 0x02, 0x0E, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00

ov01_02206AE4: ; 0x02206AE4
	.byte 0x0E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov01_02206AF4: ; 0x02206AF4
	.byte 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00

ov01_02206B04: ; 0x02206B04
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
