	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FA09C:
	.byte 0x01, 0x01, 0x01, 0x1F
	.byte 0x02, 0x01, 0x02, 0x1D, 0x03, 0x0F, 0x0A, 0x0A, 0x0C, 0x03, 0x0C, 0x1F

	.text

	thumb_func_start sub_0203BBB4
sub_0203BBB4: ; 0x0203BBB4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	bl MapHeader_GetWeatherType
	ldr r1, _0203BC08 ; =0x000001D1
	add r7, r0, #0
	cmp r5, r1
	bne _0203BC04
	ldr r0, [r4, #0xc]
	bl Sav2_SysInfo_RTC_get
	add r3, r0, #0
	ldr r5, [r3, #8]
	ldr r1, _0203BC0C ; =_020FA09C
	mov r2, #0
_0203BBD6:
	lsl r6, r2, #1
	add r0, r1, r6
	ldrb r6, [r1, r6]
	ldrb r0, [r0, #1]
	cmp r5, r6
	bne _0203BBF8
	ldr r6, [r3, #0xc]
	cmp r6, r0
	bne _0203BBF8
	add r0, r4, #0
	bl sub_02055670
	cmp r0, #0
	bne _0203BBF4
	mov r7, #8
_0203BBF4:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0203BBF8:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #8
	blo _0203BBD6
	add r0, r7, #0
_0203BC04:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203BC08: .word 0x000001D1
_0203BC0C: .word _020FA09C
	thumb_func_end sub_0203BBB4
