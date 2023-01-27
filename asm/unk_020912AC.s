#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_020912AC.inc"
	.include "global.inc"

	.public _02102610

	.text

	thumb_func_start sub_020912AC
sub_020912AC: ; 0x020912AC
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #6
	blt _020912B8
	bl GF_AssertFail
_020912B8:
	cmp r4, #6
	bge _020912C2
	ldr r0, _020912CC ; =_02106060
	ldrb r0, [r0, r4]
	pop {r4, pc}
_020912C2:
	mov r0, #2
	bl LanguageToDexFlag
	pop {r4, pc}
	nop
_020912CC: .word _02106060
	thumb_func_end sub_020912AC

	thumb_func_start sub_020912D0
sub_020912D0: ; 0x020912D0
	push {r4, lr}
	ldr r3, _02091304 ; =_02106060
	mov r4, #0
_020912D6:
	ldrb r2, [r3]
	cmp r2, r0
	bne _020912EE
	add r0, r1, #6
	add r0, r4, r0
	mov r1, #6
	bl _u32_div_f
	ldr r0, _02091304 ; =_02106060
	add r4, r1, #0
	ldrb r0, [r0, r4]
	pop {r4, pc}
_020912EE:
	add r4, r4, #1
	add r3, r3, #1
	cmp r4, #6
	blo _020912D6
	mov r0, #2
	bl LanguageToDexFlag
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	pop {r4, pc}
	nop
_02091304: .word _02106060
	thumb_func_end sub_020912D0

	.rodata

_02106060:
	.byte 0x01, 0x02, 0x03, 0x04, 0x05, 0x00, 0x00, 0x00
