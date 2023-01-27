#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_02091278.inc"
	.include "global.inc"

	.text

	thumb_func_start LanguageToDexFlag
LanguageToDexFlag: ; 0x02091278
	ldr r3, _02091290 ; =_02106058
	mov r2, #0
_0209127C:
	ldrb r1, [r3]
	cmp r0, r1
	beq _0209128A
	add r2, r2, #1
	add r3, r3, #1
	cmp r2, #6
	blt _0209127C
_0209128A:
	add r0, r2, #0
	bx lr
	nop
_02091290: .word _02106058
	thumb_func_end LanguageToDexFlag

	thumb_func_start sub_02091294
sub_02091294: ; 0x02091294
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #6
	blt _020912A0
	bl GF_AssertFail
_020912A0:
	ldr r0, _020912A8 ; =_02106058
	ldrb r0, [r0, r4]
	pop {r4, pc}
	nop
_020912A8: .word _02106058
	thumb_func_end sub_02091294

	.rodata

_02106058:
 	.byte 0x01, 0x02, 0x03, 0x05, 0x04, 0x07, 0x00, 0x00
