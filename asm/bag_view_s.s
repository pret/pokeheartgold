#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"
	.public sub_02077924
	.public sub_02077930

	.text

	thumb_func_start sub_02077950
sub_02077950: ; 0x02077950
	push {r3, lr}
	bl sub_0202C028
	bl sub_0202B9E0
	bl sub_0202BACC
	pop {r3, pc}
	thumb_func_end sub_02077950

	thumb_func_start sub_02077960
sub_02077960: ; 0x02077960
	push {r3, lr}
	bl sub_0202C028
	bl sub_0202B9E0
	bl sub_0202BAE8
	pop {r3, pc}
	thumb_func_end sub_02077960

	thumb_func_start sub_02077970
sub_02077970: ; 0x02077970
	push {r3, lr}
	bl sub_0202D918
	mov r1, #0
	add r2, r1, #0
	bl sub_0202D3F8
	pop {r3, pc}
	thumb_func_end sub_02077970

	thumb_func_start TryFormatRegisteredKeyItemUseMessage
TryFormatRegisteredKeyItemUseMessage: ; 0x02077980
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	str r1, [sp, #8]
	add r5, r2, #0
	add r4, r3, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xa
	bl NewMsgDataFromNarc
	add r6, r0, #0
	add r0, r4, #0
	bl ScrStrBufs_new
	add r4, r0, #0
	cmp r5, #0
	bne _020779B0
	add r0, r6, #0
	mov r1, #0x66
	bl NewString_ReadMsgData
	add r5, r0, #0
	b _02077A82
_020779B0:
	mov r1, #0x1b
	lsl r1, r1, #4
	cmp r5, r1
	bne _020779DC
	add r0, r6, #0
	mov r1, #0x64
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r7, #0
	bl sub_02077970
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r4, #0
	mov r3, #4
	bl BufferIntegerAsString
	b _02077A82
_020779DC:
	add r2, r1, #2
	cmp r5, r2
	bne _02077A06
	add r0, r6, #0
	mov r1, #0x5f
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r7, #0
	bl sub_02077930
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r4, #0
	mov r3, #4
	bl BufferIntegerAsString
	b _02077A82
_02077A06:
	add r2, r1, #3
	cmp r5, r2
	bne _02077A48
	add r0, r6, #0
	mov r1, #0x60
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r7, #0
	bl sub_02077950
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r4, #0
	mov r3, #3
	bl BufferIntegerAsString
	add r0, r7, #0
	bl sub_02077960
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	add r0, r4, #0
	mov r3, #2
	str r1, [sp, #4]
	bl BufferIntegerAsString
	b _02077A82
_02077A48:
	add r1, #0xc
	cmp r5, r1
	bne _02077A72
	add r0, r6, #0
	mov r1, #0x3a
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r7, #0
	bl sub_02077924
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r4, #0
	mov r3, #5
	bl BufferIntegerAsString
	b _02077A82
_02077A72:
	bl ScrStrBufs_delete
	add r0, r6, #0
	bl DestroyMsgData
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02077A82:
	ldr r1, [sp, #8]
	add r0, r4, #0
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	add r0, r4, #0
	bl ScrStrBufs_delete
	add r0, r6, #0
	bl DestroyMsgData
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end TryFormatRegisteredKeyItemUseMessage

	thumb_func_start GetItemUseErrorMessage
GetItemUseErrorMessage: ; 0x02077AA4
	; pragma unused r2
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	ldr r4, [sp, #0x18]
	cmp r3, #1
	beq _02077ABA
	cmp r3, #2
	beq _02077AD8
	cmp r3, #3
	beq _02077AF6
	b _02077B14
_02077ABA:
	; You can't dismount your Bike here.
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xa
	add r3, r4, #0
	bl NewMsgDataFromNarc
	add r4, r0, #0
	mov r1, #0x39
	add r2, r5, #0
	bl ReadMsgDataIntoString
	add r0, r4, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
_02077AD8:
	; Can't be used when you have someone with you!
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xa
	add r3, r4, #0
	bl NewMsgDataFromNarc
	add r4, r0, #0
	mov r1, #0x76
	add r2, r5, #0
	bl ReadMsgDataIntoString
	add r0, r4, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
_02077AF6:
	; You can't be doing that now!
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xa
	add r3, r4, #0
	bl NewMsgDataFromNarc
	add r4, r0, #0
	mov r1, #0x77
	add r2, r5, #0
	bl ReadMsgDataIntoString
	add r0, r4, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
_02077B14:
	; Oak's words echoed... {PLAYER}! There's a time and place for everything! But not now.
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x28
	add r3, r4, #0
	bl NewMsgDataFromNarc
	add r7, r0, #0
	add r0, r4, #0
	bl ScrStrBufs_new
	add r4, r0, #0
	add r0, r7, #0
	mov r1, #0x25
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #0
	bl BufferPlayersName
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	bl ScrStrBufs_delete
	add r0, r7, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end GetItemUseErrorMessage
