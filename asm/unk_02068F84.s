	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02068F84
sub_02068F84: ; 0x02068F84
	push {r4, lr}
	add r4, r2, #0
	bl ReadMsgDataIntoString
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl sub_02002F30
	pop {r4, pc}
	thumb_func_end sub_02068F84

	thumb_func_start sub_02068F98
sub_02068F98: ; 0x02068F98
	push {r4, r5, r6, lr}
	add r3, r1, #0
	mov r1, #0x1b
	add r6, r2, #0
	add r2, r1, #0
	add r5, r0, #0
	mov r0, #1
	add r2, #0xfc
	bl NewMsgDataFromNarc
	add r4, r0, #0
	add r0, r5, #0
	bl MapHeader_GetMapSec
	add r1, r0, #0
	add r0, r4, #0
	add r2, r6, #0
	bl sub_02068F84
	add r0, r4, #0
	bl DestroyMsgData
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02068F98
