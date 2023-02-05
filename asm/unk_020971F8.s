#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_020971F8.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020971F8
sub_020971F8: ; 0x020971F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0203AC88
	add r4, r0, #0
	bl sub_0203AC90
	add r1, r0, #0
	add r0, r4, #0
	add r2, r5, #0
	bl sub_0203410C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020971F8

	thumb_func_start sub_02097214
sub_02097214: ; 0x02097214
	push {r4, lr}
	bl sub_0203AC88
	add r4, r0, #0
	bl sub_0203AC90
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl sub_0203410C
	pop {r4, pc}
	thumb_func_end sub_02097214

	thumb_func_start sub_0209722C
sub_0209722C: ; 0x0209722C
	mov r0, #0
	bx lr
	thumb_func_end sub_0209722C

	thumb_func_start sub_02097230
sub_02097230: ; 0x02097230
	mov r0, #8
	bx lr
	thumb_func_end sub_02097230

	thumb_func_start sub_02097234
sub_02097234: ; 0x02097234
	mov r0, #4
	bx lr
	thumb_func_end sub_02097234

	thumb_func_start sub_02097238
sub_02097238: ; 0x02097238
	push {r3, lr}
	cmp r3, #0
	beq _02097246
	add r0, r3, #0
	add r1, r2, #0
	bl ov44_02233100
_02097246:
	pop {r3, pc}
	thumb_func_end sub_02097238

	thumb_func_start sub_02097248
sub_02097248: ; 0x02097248
	push {r3, lr}
	cmp r3, #0
	beq _02097254
	add r0, r3, #0
	bl ov44_02233160
_02097254:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02097248

	thumb_func_start sub_02097258
sub_02097258: ; 0x02097258
	push {r3, lr}
	cmp r3, #0
	beq _02097266
	add r0, r3, #0
	add r1, r2, #0
	bl ov44_0223317C
_02097266:
	pop {r3, pc}
	thumb_func_end sub_02097258

	; File boundary?
