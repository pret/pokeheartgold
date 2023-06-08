#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "constants/pokemon.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "unk_0208E600.inc"
	.include "global.inc"

	.public _020FA484
	.public gNatureStatMods

	.text

	thumb_func_start sub_0208E600
sub_0208E600: ; 0x0208E600
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	add r0, r7, #0
	mov r1, #0x3c
	bl AllocFromHeap
	add r4, r0, #0
	ldr r2, _0208E974 ; =0x0000012E
	str r7, [r4]
	mov r0, #1
	mov r1, #0x1b
	add r3, r7, #0
	bl NewMsgDataFromNarc
	str r0, [r4, #4]
	ldr r2, [r4]
	mov r0, #9
	mov r1, #0x20
	bl MessageFormat_New_Custom
	str r0, [r4, #8]
	str r5, [r4, #0xc]
	str r6, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	str r0, [r4, #0x38]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	bl sub_0208F070
	cmp r0, #0x14
	bls _0208E656
	b _0208E990
_0208E656:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208E662: ; jump table
	.short _0208E68C - _0208E662 - 2 ; case 0
	.short _0208E6B8 - _0208E662 - 2 ; case 1
	.short _0208E6E4 - _0208E662 - 2 ; case 2
	.short _0208E710 - _0208E662 - 2 ; case 3
	.short _0208E73C - _0208E662 - 2 ; case 4
	.short _0208E768 - _0208E662 - 2 ; case 5
	.short _0208E794 - _0208E662 - 2 ; case 6
	.short _0208E7C0 - _0208E662 - 2 ; case 7
	.short _0208E7EC - _0208E662 - 2 ; case 8
	.short _0208E818 - _0208E662 - 2 ; case 9
	.short _0208E83A - _0208E662 - 2 ; case 10
	.short _0208E85C - _0208E662 - 2 ; case 11
	.short _0208E87E - _0208E662 - 2 ; case 12
	.short _0208E8A0 - _0208E662 - 2 ; case 13
	.short _0208E8C2 - _0208E662 - 2 ; case 14
	.short _0208E8E4 - _0208E662 - 2 ; case 15
	.short _0208E910 - _0208E662 - 2 ; case 16
	.short _0208E92A - _0208E662 - 2 ; case 17
	.short _0208E942 - _0208E662 - 2 ; case 18
	.short _0208E95C - _0208E662 - 2 ; case 19
	.short _0208E978 - _0208E662 - 2 ; case 20
_0208E68C:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x31
	bl sub_0208EA84
	mov r0, #6
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #7
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E6B8:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x32
	bl sub_0208EA84
	mov r0, #6
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #7
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E6E4:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x33
	bl sub_0208EA84
	mov r0, #6
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #7
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E710:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x34
	bl sub_0208EA84
	mov r0, #8
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #9
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E73C:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x35
	bl sub_0208EA84
	mov r0, #8
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #9
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E768:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x36
	bl sub_0208EA84
	mov r0, #8
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #9
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E794:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x37
	bl sub_0208EA84
	mov r0, #8
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #9
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E7C0:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x38
	bl sub_0208EA84
	mov r0, #7
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #8
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E7EC:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x39
	bl sub_0208EA84
	mov r0, #7
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #8
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E818:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x3a
	bl sub_0208EA84
	mov r0, #9
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	b _0208E990
_0208E83A:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x3b
	bl sub_0208EA84
	mov r0, #9
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	b _0208E990
_0208E85C:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x3c
	bl sub_0208EA84
	mov r0, #9
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	b _0208E990
_0208E87E:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x3d
	bl sub_0208EA84
	mov r0, #9
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	b _0208E990
_0208E8A0:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x3e
	bl sub_0208EA84
	mov r0, #9
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	b _0208E990
_0208E8C2:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x3f
	bl sub_0208EA84
	mov r0, #9
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	b _0208E990
_0208E8E4:
	mov r0, #1
	str r0, [r4, #0x14]
	add r0, r4, #0
	bl sub_0208EA5C
	mov r0, #2
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x40
	bl sub_0208EBA4
	mov r0, #6
	str r0, [r4, #0x24]
	add r0, r4, #0
	bl sub_0208EE08
	mov r0, #7
	str r0, [r4, #0x2c]
	add r0, r4, #0
	bl sub_0208EFF4
	b _0208E990
_0208E910:
	mov r0, #1
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x65
	mov r2, #0
	bl sub_0208ED00
	mov r0, #6
	str r0, [r4, #0x34]
	add r0, r4, #0
	bl sub_0208F030
	b _0208E990
_0208E92A:
	mov r2, #1
	add r0, r4, #0
	mov r1, #0x66
	str r2, [r4, #0x1c]
	bl sub_0208ED00
	mov r0, #6
	str r0, [r4, #0x34]
	add r0, r4, #0
	bl sub_0208F030
	b _0208E990
_0208E942:
	mov r0, #1
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x67
	mov r2, #0
	bl sub_0208ED00
	mov r0, #6
	str r0, [r4, #0x34]
	add r0, r4, #0
	bl sub_0208F030
	b _0208E990
_0208E95C:
	mov r2, #1
	add r0, r4, #0
	mov r1, #0x67
	str r2, [r4, #0x1c]
	bl sub_0208ED00
	mov r0, #6
	str r0, [r4, #0x34]
	add r0, r4, #0
	bl sub_0208F030
	b _0208E990
	.balign 4, 0
_0208E974: .word 0x0000012E
_0208E978:
	mov r0, #1
	str r0, [r4, #0x1c]
	add r0, r4, #0
	mov r1, #0x68
	mov r2, #0
	bl sub_0208ED00
	mov r0, #6
	str r0, [r4, #0x34]
	add r0, r4, #0
	bl sub_0208F030
_0208E990:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0208E600

	thumb_func_start sub_0208E994
sub_0208E994: ; 0x0208E994
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _0208E9A2
	bl FreeToHeap
_0208E9A2:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0208E9AC
	bl FreeToHeap
_0208E9AC:
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _0208E9B6
	bl FreeToHeap
_0208E9B6:
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _0208E9C0
	bl FreeToHeap
_0208E9C0:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0208E9CA
	bl FreeToHeap
_0208E9CA:
	ldr r0, [r4, #8]
	bl MessageFormat_Delete
	ldr r0, [r4, #4]
	bl DestroyMsgData
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208E994

	thumb_func_start sub_0208E9E0
sub_0208E9E0: ; 0x0208E9E0
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r4, r0, #0
	add r0, r6, #0
	add r1, r2, #0
	bl sub_0208F070
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r0, r6, #0
	mov r1, #MON_DATA_GAME_VERSION
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0xf9
	lsl r1, r1, #0x18
	lsl r0, r0, #0x18
	lsr r1, r1, #0x18
	lsr r0, r0, #0x18
	cmp r1, #1
	bhi _0208EA14
	cmp r4, #1
	beq _0208EA14
	mov r0, #1
	pop {r4, r5, r6, pc}
_0208EA14:
	cmp r4, #3
	bhi _0208EA58
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0208EA24: ; jump table
	.short _0208EA58 - _0208EA24 - 2 ; case 0
	.short _0208EA2C - _0208EA24 - 2 ; case 1
	.short _0208EA58 - _0208EA24 - 2 ; case 2
	.short _0208EA58 - _0208EA24 - 2 ; case 3
_0208EA2C:
	cmp r5, #1
	bne _0208EA58
	cmp r0, #0xa
	beq _0208EA3C
	cmp r0, #0xb
	beq _0208EA3C
	cmp r0, #0xc
	bne _0208EA58
_0208EA3C:
	add r0, r6, #0
	mov r1, #MON_DATA_MET_LOCATION
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x56
	bl sub_02017FE4
	cmp r4, r0
	bne _0208EA58
	mov r0, #1
	pop {r4, r5, r6, pc}
_0208EA58:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0208E9E0

	thumb_func_start sub_0208EA5C
sub_0208EA5C: ; 0x0208EA5C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl GetMonNature
	add r4, r0, #0
	cmp r4, #0x18
	bgt _0208EA82
	ldr r1, [r5]
	mov r0, #0x48
	bl String_New
	str r0, [r5, #0x18]
	add r4, #0x18
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x18]
	add r1, r4, #0
	bl ReadMsgDataIntoString
_0208EA82:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0208EA5C

	thumb_func_start sub_0208EA84
sub_0208EA84: ; 0x0208EA84
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #9
	ldr r1, [r5]
	lsl r0, r0, #6
	bl String_New
	add r4, r0, #0
	mov r0, #9
	ldr r1, [r5]
	lsl r0, r0, #6
	bl String_New
	str r0, [r5, #0x20]
	ldr r0, [r5, #4]
	add r1, r6, #0
	add r2, r4, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0xc]
	mov r1, #MON_DATA_MET_YEAR
	mov r2, #0
	bl GetMonData
	mov r3, #2
	add r2, r0, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	mov r1, #0
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #MON_DATA_MET_MONTH
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #1
	bl BufferMonthNameAbbr
	ldr r0, [r5, #0xc]
	mov r1, #MON_DATA_MET_DAY
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #2
	ldr r0, [r5, #8]
	add r3, r1, #0
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #MON_DATA_MET_LEVEL
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #3
	ldr r0, [r5, #8]
	add r3, r1, #0
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #MON_DATA_MET_LOCATION
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #4
	bl BufferLocationName
	ldr r0, [r5, #0xc]
	mov r1, #MON_DATA_EGG_MET_YEAR
	mov r2, #0
	bl GetMonData
	mov r3, #2
	add r2, r0, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	mov r1, #5
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #MON_DATA_EGG_MET_MONTH
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #6
	bl BufferMonthNameAbbr
	ldr r0, [r5, #0xc]
	mov r1, #MON_DATA_EGG_MET_DAY
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	mov r1, #7
	mov r3, #2
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #MON_DATA_EGG_MET_LOCATION
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #8
	bl BufferLocationName
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x20]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_Delete
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0208EA84

	thumb_func_start sub_0208EBA4
sub_0208EBA4: ; 0x0208EBA4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	add r6, r1, #0
	mov r0, #0x12
	ldr r1, [r4]
	lsl r0, r0, #4
	bl String_New
	add r5, r0, #0
	mov r0, #0x12
	ldr r1, [r4]
	lsl r0, r0, #4
	bl String_New
	str r0, [r4, #0x20]
	ldr r0, [r4, #4]
	add r1, r6, #0
	add r2, r5, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0xc]
	mov r1, #0x95
	mov r2, #0
	bl GetMonData
	mov r3, #2
	add r2, r0, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	mov r1, #0
	bl BufferIntegerAsString
	ldr r0, [r4, #0xc]
	mov r1, #0x96
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #1
	bl BufferMonthNameAbbr
	ldr r0, [r4, #0xc]
	mov r1, #0x97
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #2
	ldr r0, [r4, #8]
	add r3, r1, #0
	bl BufferIntegerAsString
	ldr r0, [r4, #0xc]
	mov r1, #0x9c
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #3
	ldr r0, [r4, #8]
	add r3, r1, #0
	bl BufferIntegerAsString
	ldr r0, [r4, #0xc]
	mov r1, #0x7a
	mov r2, #0
	bl GetMonData
	cmp r0, #0xf
	bhi _0208EC74
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208EC54: ; jump table
	.short _0208EC74 - _0208EC54 - 2 ; case 0
	.short _0208ECB0 - _0208EC54 - 2 ; case 1
	.short _0208ECB0 - _0208EC54 - 2 ; case 2
	.short _0208ECB0 - _0208EC54 - 2 ; case 3
	.short _0208EC88 - _0208EC54 - 2 ; case 4
	.short _0208EC88 - _0208EC54 - 2 ; case 5
	.short _0208EC74 - _0208EC54 - 2 ; case 6
	.short _0208EC9C - _0208EC54 - 2 ; case 7
	.short _0208EC9C - _0208EC54 - 2 ; case 8
	.short _0208EC74 - _0208EC54 - 2 ; case 9
	.short _0208ECD8 - _0208EC54 - 2 ; case 10
	.short _0208ECD8 - _0208EC54 - 2 ; case 11
	.short _0208ECD8 - _0208EC54 - 2 ; case 12
	.short _0208EC74 - _0208EC54 - 2 ; case 13
	.short _0208EC74 - _0208EC54 - 2 ; case 14
	.short _0208ECC4 - _0208EC54 - 2 ; case 15
_0208EC74:
	mov r0, #1
	mov r1, #7
	bl sub_02017FE4
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #4
	bl BufferLocationName
	b _0208ECEA
_0208EC88:
	mov r0, #1
	mov r1, #3
	bl sub_02017FE4
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #4
	bl BufferLocationName
	b _0208ECEA
_0208EC9C:
	mov r0, #1
	mov r1, #4
	bl sub_02017FE4
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #4
	bl BufferLocationName
	b _0208ECEA
_0208ECB0:
	mov r0, #1
	mov r1, #5
	bl sub_02017FE4
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #4
	bl BufferLocationName
	b _0208ECEA
_0208ECC4:
	mov r0, #1
	mov r1, #8
	bl sub_02017FE4
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #4
	bl BufferLocationName
	b _0208ECEA
_0208ECD8:
	mov r0, #1
	mov r1, #7
	bl sub_02017FE4
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #4
	bl BufferLocationName
_0208ECEA:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x20]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_Delete
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0208EBA4

	thumb_func_start sub_0208ED00
sub_0208ED00: ; 0x0208ED00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #0x5a
	ldr r1, [r5]
	lsl r0, r0, #2
	add r6, r2, #0
	bl String_New
	add r4, r0, #0
	mov r0, #0x5a
	ldr r1, [r5]
	lsl r0, r0, #2
	bl String_New
	str r0, [r5, #0x20]
	ldr r0, [r5, #4]
	add r1, r7, #0
	add r2, r4, #0
	bl ReadMsgDataIntoString
	cmp r6, #0
	ldr r0, [r5, #0xc]
	bne _0208ED94
	mov r1, #0x92
	mov r2, #0
	bl GetMonData
	mov r3, #2
	add r2, r0, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	mov r1, #5
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #0x93
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #6
	bl BufferMonthNameAbbr
	ldr r0, [r5, #0xc]
	mov r1, #0x94
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	mov r1, #7
	mov r3, #2
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #8
	bl BufferLocationName
	b _0208EDF4
_0208ED94:
	mov r1, #0x95
	mov r2, #0
	bl GetMonData
	mov r3, #2
	add r2, r0, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	mov r1, #5
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #0x96
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #6
	bl BufferMonthNameAbbr
	ldr r0, [r5, #0xc]
	mov r1, #0x97
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	mov r1, #7
	mov r3, #2
	bl BufferIntegerAsString
	ldr r0, [r5, #0xc]
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r5, #8]
	mov r1, #8
	bl BufferLocationName
_0208EDF4:
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x20]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_Delete
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0208ED00

	thumb_func_start sub_0208EE08
sub_0208EE08: ; 0x0208EE08
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #0x48
	bl String_New
	str r0, [r4, #0x28]
	ldr r0, [r4, #0xc]
	mov r1, #0x46
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xc]
	ldr r0, [r4, #0xc]
	mov r1, #0x47
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	mov r1, #0x48
	mov r2, #0
	bl GetMonData
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	mov r1, #0x49
	mov r2, #0
	bl GetMonData
	str r0, [sp]
	ldr r0, [r4, #0xc]
	mov r1, #0x4a
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0x4b
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r1, #0
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl GetMonData
	mov r1, #6
	bl _u32_div_f
	cmp r1, #5
	bhi _0208EE8C
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208EE80: ; jump table
	.short _0208EE8C - _0208EE80 - 2 ; case 0
	.short _0208EEC4 - _0208EE80 - 2 ; case 1
	.short _0208EEFA - _0208EE80 - 2 ; case 2
	.short _0208EF30 - _0208EE80 - 2 ; case 3
	.short _0208EF66 - _0208EE80 - 2 ; case 4
	.short _0208EF9C - _0208EE80 - 2 ; case 5
_0208EE8C:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	add r2, r0, #0
	mov r5, #0
	cmp r2, r1
	bge _0208EE9C
	mov r5, #1
	add r0, r1, #0
_0208EE9C:
	ldr r1, [sp, #4]
	cmp r0, r1
	bge _0208EEA6
	mov r5, #2
	add r0, r1, #0
_0208EEA6:
	ldr r1, [sp]
	cmp r0, r1
	bge _0208EEB0
	mov r5, #3
	add r0, r1, #0
_0208EEB0:
	cmp r0, r7
	bge _0208EEB8
	mov r5, #4
	add r0, r7, #0
_0208EEB8:
	cmp r0, r6
	blt _0208EEBE
	b _0208EFD0
_0208EEBE:
	mov r5, #5
	add r0, r6, #0
	b _0208EFD0
_0208EEC4:
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	add r2, r0, #0
	mov r5, #1
	cmp r2, r1
	bge _0208EED4
	mov r5, #2
	add r0, r1, #0
_0208EED4:
	ldr r1, [sp]
	cmp r0, r1
	bge _0208EEDE
	mov r5, #3
	add r0, r1, #0
_0208EEDE:
	cmp r0, r7
	bge _0208EEE6
	mov r5, #4
	add r0, r7, #0
_0208EEE6:
	cmp r0, r6
	bge _0208EEEE
	mov r5, #5
	add r0, r6, #0
_0208EEEE:
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bge _0208EFD0
	mov r5, #0
	add r0, r1, #0
	b _0208EFD0
_0208EEFA:
	ldr r0, [sp, #4]
	ldr r1, [sp]
	add r2, r0, #0
	mov r5, #2
	cmp r2, r1
	bge _0208EF0A
	mov r5, #3
	add r0, r1, #0
_0208EF0A:
	cmp r0, r7
	bge _0208EF12
	mov r5, #4
	add r0, r7, #0
_0208EF12:
	cmp r0, r6
	bge _0208EF1A
	mov r5, #5
	add r0, r6, #0
_0208EF1A:
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bge _0208EF24
	mov r5, #0
	add r0, r1, #0
_0208EF24:
	ldr r1, [sp, #8]
	cmp r0, r1
	bge _0208EFD0
	mov r5, #1
	add r0, r1, #0
	b _0208EFD0
_0208EF30:
	ldr r0, [sp]
	mov r5, #3
	add r1, r0, #0
	cmp r1, r7
	bge _0208EF3E
	mov r5, #4
	add r0, r7, #0
_0208EF3E:
	cmp r0, r6
	bge _0208EF46
	mov r5, #5
	add r0, r6, #0
_0208EF46:
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bge _0208EF50
	mov r5, #0
	add r0, r1, #0
_0208EF50:
	ldr r1, [sp, #8]
	cmp r0, r1
	bge _0208EF5A
	mov r5, #1
	add r0, r1, #0
_0208EF5A:
	ldr r1, [sp, #4]
	cmp r0, r1
	bge _0208EFD0
	mov r5, #2
	add r0, r1, #0
	b _0208EFD0
_0208EF66:
	mov r5, #4
	add r0, r7, #0
	cmp r7, r6
	bge _0208EF72
	mov r5, #5
	add r0, r6, #0
_0208EF72:
	ldr r1, [sp, #0xc]
	cmp r0, r1
	bge _0208EF7C
	mov r5, #0
	add r0, r1, #0
_0208EF7C:
	ldr r1, [sp, #8]
	cmp r0, r1
	bge _0208EF86
	mov r5, #1
	add r0, r1, #0
_0208EF86:
	ldr r1, [sp, #4]
	cmp r0, r1
	bge _0208EF90
	mov r5, #2
	add r0, r1, #0
_0208EF90:
	ldr r1, [sp]
	cmp r0, r1
	bge _0208EFD0
	mov r5, #3
	add r0, r1, #0
	b _0208EFD0
_0208EF9C:
	ldr r1, [sp, #0xc]
	mov r5, #5
	add r0, r6, #0
	cmp r6, r1
	bge _0208EFAA
	mov r5, #0
	add r0, r1, #0
_0208EFAA:
	ldr r1, [sp, #8]
	cmp r0, r1
	bge _0208EFB4
	mov r5, #1
	add r0, r1, #0
_0208EFB4:
	ldr r1, [sp, #4]
	cmp r0, r1
	bge _0208EFBE
	mov r5, #2
	add r0, r1, #0
_0208EFBE:
	ldr r1, [sp]
	cmp r0, r1
	bge _0208EFC8
	mov r5, #3
	add r0, r1, #0
_0208EFC8:
	cmp r0, r7
	bge _0208EFD0
	mov r5, #4
	add r0, r7, #0
_0208EFD0:
	mov r1, #5
	bl _s32_div_f
	mov r2, #0xa
	add r6, r5, #0
	mul r6, r2
	ldr r3, _0208EFF0 ; =_021053F4
	lsl r2, r1, #1
	add r1, r3, r6
	ldrh r1, [r2, r1]
	ldr r0, [r4, #4]
	ldr r2, [r4, #0x28]
	bl ReadMsgDataIntoString
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208EFF0: .word _021053F4
	thumb_func_end sub_0208EE08

	thumb_func_start sub_0208EFF4
sub_0208EFF4: ; 0x0208EFF4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x48
	bl String_New
	mov r6, #0
	str r0, [r5, #0x30]
	add r4, r6, #0
_0208F006:
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	bl MonGetFlavorPreference
	cmp r0, #1
	bne _0208F014
	add r6, r4, #1
_0208F014:
	add r4, r4, #1
	cmp r4, #5
	blt _0208F006
	ldr r1, _0208F02C ; =_021053E8
	lsl r2, r6, #1
	ldrh r1, [r1, r2]
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x30]
	bl ReadMsgDataIntoString
	pop {r4, r5, r6, pc}
	nop
_0208F02C: .word _021053E8
	thumb_func_end sub_0208EFF4

	thumb_func_start sub_0208F030
sub_0208F030: ; 0x0208F030
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r1, #9
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	mov r0, #0x12
	ldr r1, [r5]
	lsl r0, r0, #4
	bl String_New
	str r0, [r5, #0x38]
	cmp r4, #5
	bgt _0208F054
	mov r1, #0x69
	b _0208F066
_0208F054:
	cmp r4, #0xa
	bgt _0208F05C
	mov r1, #0x6a
	b _0208F066
_0208F05C:
	cmp r4, #0x28
	bgt _0208F064
	mov r1, #0x6b
	b _0208F066
_0208F064:
	mov r1, #0x6c
_0208F066:
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x38]
	bl ReadMsgDataIntoString
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0208F030

	thumb_func_start sub_0208F070
sub_0208F070: ; 0x0208F070
	push {r4, r5, r6, lr}
	add r4, r1, #0
	mov r1, #0x4c
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0208F084
	b _0208F212
_0208F084:
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0208F0F0
	add r0, r5, #0
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #0
	mov r1, #0x37
	bl sub_02017FE4
	cmp r6, r0
	bne _0208F0AE
	mov r0, #0xf
	pop {r4, r5, r6, pc}
_0208F0AE:
	add r0, r5, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0208F0C8
	cmp r4, #1
	bne _0208F0C4
	mov r0, #7
	pop {r4, r5, r6, pc}
_0208F0C4:
	mov r0, #8
	pop {r4, r5, r6, pc}
_0208F0C8:
	add r0, r5, #0
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	mov r0, #1
	add r1, r0, #0
	bl sub_02017FE4
	cmp r5, r0
	bne _0208F0E4
	mov r0, #2
	pop {r4, r5, r6, pc}
_0208F0E4:
	cmp r4, #1
	bne _0208F0EC
	mov r0, #0
	pop {r4, r5, r6, pc}
_0208F0EC:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0208F0F0:
	add r0, r5, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0208F152
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #2
	bl sub_02017FE4
	cmp r6, r0
	bne _0208F122
	cmp r4, #1
	bne _0208F11E
	mov r0, #0xd
	pop {r4, r5, r6, pc}
_0208F11E:
	mov r0, #0xe
	pop {r4, r5, r6, pc}
_0208F122:
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	mov r0, #2
	mov r1, #1
	bl sub_02017FE4
	cmp r5, r0
	bne _0208F146
	cmp r4, #1
	bne _0208F142
	mov r0, #0xb
	pop {r4, r5, r6, pc}
_0208F142:
	mov r0, #0xc
	pop {r4, r5, r6, pc}
_0208F146:
	cmp r4, #1
	bne _0208F14E
	mov r0, #9
	pop {r4, r5, r6, pc}
_0208F14E:
	mov r0, #0xa
	pop {r4, r5, r6, pc}
_0208F152:
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	add r1, r0, #0
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #0
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #9
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #0xa
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #0xb
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	mov r0, #1
	mov r1, #0xd
	bl sub_02017FE4
	cmp r6, r0
	beq _0208F1FA
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	mov r0, #1
	mov r1, #0xe
	bl sub_02017FE4
	cmp r5, r0
	bne _0208F206
_0208F1FA:
	cmp r4, #1
	bne _0208F202
	mov r0, #5
	pop {r4, r5, r6, pc}
_0208F202:
	mov r0, #6
	pop {r4, r5, r6, pc}
_0208F206:
	cmp r4, #1
	bne _0208F20E
	mov r0, #3
	pop {r4, r5, r6, pc}
_0208F20E:
	mov r0, #4
	pop {r4, r5, r6, pc}
_0208F212:
	cmp r4, #1
	bne _0208F248
	add r0, r5, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0208F244
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	mov r0, #2
	mov r1, #1
	bl sub_02017FE4
	cmp r4, r0
	bne _0208F240
	mov r0, #0x14
	pop {r4, r5, r6, pc}
_0208F240:
	mov r0, #0x12
	pop {r4, r5, r6, pc}
_0208F244:
	mov r0, #0x10
	pop {r4, r5, r6, pc}
_0208F248:
	add r0, r5, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0208F25A
	mov r0, #0x13
	pop {r4, r5, r6, pc}
_0208F25A:
	mov r0, #0x11
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0208F070

	thumb_func_start MonSetTrainerMemo
MonSetTrainerMemo: ; 0x0208F260
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	str r4, [sp]
	bl sub_0208F270
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end MonSetTrainerMemo

	thumb_func_start sub_0208F270
sub_0208F270: ; 0x0208F270
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r7, r1, #0
	add r5, r3, #0
	ldr r6, [sp, #0x18]
	cmp r2, #7
	bls _0208F280
	b _0208F500
_0208F280:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0208F28C: ; jump table
	.short _0208F29C - _0208F28C - 2 ; case 0
	.short _0208F34A - _0208F28C - 2 ; case 1
	.short _0208F394 - _0208F28C - 2 ; case 2
	.short _0208F3B4 - _0208F28C - 2 ; case 3
	.short _0208F3D0 - _0208F28C - 2 ; case 4
	.short _0208F458 - _0208F28C - 2 ; case 5
	.short _0208F478 - _0208F28C - 2 ; case 6
	.short _0208F2F8 - _0208F28C - 2 ; case 7
_0208F29C:
	mov r0, #1
	mov r1, #0
	bl sub_02017FE4
	cmp r5, r0
	ble _0208F2B2
	mov r0, #2
	add r1, r0, #0
	bl sub_02017FE4
	add r5, r0, #0
_0208F2B2:
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0208F2DA
	add r0, r4, #0
	mov r1, #0
	bl sub_0208F5C8
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0208F550
	add r0, r4, #0
	bl sub_0208F628
	b _0208F2EC
_0208F2DA:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl sub_0208F550
	add r0, r4, #0
	mov r1, #1
	bl sub_0208F5C8
_0208F2EC:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0208F504
	pop {r3, r4, r5, r6, r7, pc}
_0208F2F8:
	mov r0, #1
	mov r1, #0
	bl sub_02017FE4
	cmp r5, r0
	ble _0208F30E
	mov r0, #2
	add r1, r0, #0
	bl sub_02017FE4
	add r5, r0, #0
_0208F30E:
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0208F336
	add r0, r4, #0
	mov r1, #0
	bl sub_0208F5C8
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0208F550
	add r0, r4, #0
	bl sub_0208F628
	pop {r3, r4, r5, r6, r7, pc}
_0208F336:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl sub_0208F550
	add r0, r4, #0
	mov r1, #1
	bl sub_0208F5C8
	pop {r3, r4, r5, r6, r7, pc}
_0208F34A:
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0208F378
	add r0, r4, #0
	mov r1, #0
	bl sub_0208F5C8
	mov r0, #1
	add r1, r0, #0
	bl sub_02017FE4
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl sub_0208F550
	add r0, r4, #0
	bl sub_0208F628
	pop {r3, r4, r5, r6, r7, pc}
_0208F378:
	add r0, r4, #0
	mov r1, #0
	bl sub_0208F5C8
	mov r0, #1
	add r1, r0, #0
	bl sub_02017FE4
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl sub_0208F550
	pop {r3, r4, r5, r6, r7, pc}
_0208F394:
	mov r1, #0
	bl sub_0208F5C8
	mov r0, #0
	mov r1, #0x37
	bl sub_02017FE4
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl sub_0208F550
	add r0, r4, #0
	bl sub_0208F628
	pop {r3, r4, r5, r6, r7, pc}
_0208F3B4:
	add r1, r5, #0
	mov r2, #0
	bl sub_0208F550
	add r0, r4, #0
	mov r1, #1
	bl sub_0208F5C8
	add r0, r4, #0
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0208F504
	pop {r3, r4, r5, r6, r7, pc}
_0208F3D0:
	add r2, r6, #0
	bl BoxmonBelongsToPlayer
	cmp r0, #1
	bne _0208F416
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0208F402
	add r0, r4, #0
	mov r1, #0
	bl sub_0208F5C8
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0208F550
	add r0, r4, #0
	bl sub_0208F628
	b _0208F450
_0208F402:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl sub_0208F550
	add r0, r4, #0
	mov r1, #1
	bl sub_0208F5C8
	b _0208F450
_0208F416:
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0208F43E
	add r0, r4, #0
	mov r1, #0
	bl sub_0208F5C8
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0208F550
	add r0, r4, #0
	bl sub_0208F628
	b _0208F450
_0208F43E:
	add r0, r4, #0
	mov r1, #0
	bl sub_0208F5C8
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0208F550
_0208F450:
	add r0, r4, #0
	bl sub_0208F648
	pop {r3, r4, r5, r6, r7, pc}
_0208F458:
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0208F500
	mov r0, #1
	mov r1, #2
	bl sub_02017FE4
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl sub_0208F550
	pop {r3, r4, r5, r6, r7, pc}
_0208F478:
	mov r0, #1
	mov r1, #0
	bl sub_02017FE4
	cmp r5, r0
	ble _0208F486
	mov r5, #0
_0208F486:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r6, #0
	bl BoxmonBelongsToPlayer
	cmp r0, #0
	bne _0208F4EC
	add r0, r4, #0
	mov r1, #0x99
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x98
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x95
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x92
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x96
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x93
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x97
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x94
	add r2, sp, #0
	bl SetBoxMonData
_0208F4EC:
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0208F550
	add r0, r4, #0
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0208F504
_0208F500:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0208F270

	thumb_func_start sub_0208F504
sub_0208F504: ; 0x0208F504
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	bl PlayerProfile_GetTrainerID
	str r0, [sp, #4]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	bl PlayerProfile_GetPlayerName_NewString
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #7
	add r2, sp, #4
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x9d
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x91
	add r2, r4, #0
	bl SetBoxMonData
	add r0, r4, #0
	bl String_Delete
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0208F504

	thumb_func_start sub_0208F550
sub_0208F550: ; 0x0208F550
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, sp, #0
	add r4, r2, #0
	bl GF_RTC_CopyDate
	cmp r4, #0
	add r2, sp, #0x24
	bne _0208F596
	add r0, r5, #0
	mov r1, #0x98
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x92
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x93
	add r2, sp, #4
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x94
	add r2, sp, #8
	bl SetBoxMonData
	add sp, #0x10
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
_0208F596:
	add r0, r5, #0
	mov r1, #0x99
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x95
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x96
	add r2, sp, #4
	bl SetBoxMonData
	add r0, r5, #0
	mov r1, #0x97
	add r2, sp, #8
	bl SetBoxMonData
	add sp, #0x10
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end sub_0208F550

	thumb_func_start sub_0208F5C8
sub_0208F5C8: ; 0x0208F5C8
	push {r3, r4, lr}
	sub sp, #4
	mov r2, #0
	add r4, r0, #0
	str r2, [sp]
	cmp r1, #0
	add r2, sp, #0
	bne _0208F600
	mov r1, #0x98
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x92
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x93
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x94
	add r2, sp, #0
	bl SetBoxMonData
	add sp, #4
	pop {r3, r4, pc}
_0208F600:
	mov r1, #0x99
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x95
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x96
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	mov r1, #0x97
	add r2, sp, #0
	bl SetBoxMonData
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_0208F5C8

	thumb_func_start sub_0208F628
sub_0208F628: ; 0x0208F628
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x9c
	add r2, sp, #0
	bl SetBoxMonData
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0208F628

	thumb_func_start sub_0208F648
sub_0208F648: ; 0x0208F648
	push {r3, lr}
	mov r1, #1
	str r1, [sp]
	mov r1, #0x6e
	add r2, sp, #0
	bl SetBoxMonData
	pop {r3, pc}
	thumb_func_end sub_0208F648

	.rodata

_021053E8:
	.byte 0x46, 0x00, 0x41, 0x00, 0x42, 0x00, 0x43, 0x00
	.byte 0x44, 0x00, 0x45, 0x00
_021053F4:
	.byte 0x47, 0x00, 0x48, 0x00, 0x49, 0x00, 0x4A, 0x00, 0x4B, 0x00, 0x4C, 0x00
	.byte 0x4D, 0x00, 0x4E, 0x00, 0x4F, 0x00, 0x50, 0x00, 0x51, 0x00, 0x52, 0x00, 0x53, 0x00, 0x54, 0x00
	.byte 0x55, 0x00, 0x56, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A, 0x00, 0x5B, 0x00, 0x5C, 0x00
	.byte 0x5D, 0x00, 0x5E, 0x00, 0x5F, 0x00, 0x60, 0x00, 0x61, 0x00, 0x62, 0x00, 0x63, 0x00, 0x64, 0x00
