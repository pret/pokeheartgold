#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "unk_0207CB7C.inc"
	.include "global.inc"

	.public gOverlayTemplate_Battle
	.public gNatureStatMods
	.extern sub_0207CB7C
	.extern sub_0207CB9C
	.extern sub_0207CD84
	.extern sub_0207D268
	.extern sub_0207D2E4
	.extern sub_0207D4AC
	.extern sub_0207D988
	.extern sub_0207DA64
	.extern sub_0207E17C
	.extern sub_0207E1DC
	.extern sub_0207E264
	.extern sub_0207E278
	.extern sub_0207E28C
	.extern sub_0207E358
	.extern sub_0207E3A8
	.extern sub_0207E684
	.extern sub_0207E6B4
	.extern sub_0207E6E8
	.extern sub_0207E714
	.extern sub_0207E748

	.text

	thumb_func_start sub_0207E778
sub_0207E778: ; 0x0207E778
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	mov r1, #0xc9
	add r6, r0, #0
	lsl r1, r1, #4
	add r7, r6, r1
	ldr r1, [r7, #0xc]
	mov r4, #0
	cmp r1, #1
	bne _0207E7A2
	bl sub_0207CC24
	cmp r0, #0
	bne _0207E79C
	add sp, #8
	ldr r0, [r7, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0207E79C:
	add sp, #8
	sub r0, r4, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207E7A2:
	ldr r0, _0207E930 ; =_02110180
	bl TouchscreenHitbox_FindRectAtTouchNew
	add r7, r0, #0
	sub r0, r4, #1
	cmp r7, r0
	beq _0207E81E
	ldrb r0, [r5, #3]
	ldrb r1, [r5, #2]
	add r2, r7, #0
	bl sub_0207E684
	cmp r0, #1
	beq _0207E7C0
	b _0207E900
_0207E7C0:
	cmp r7, #7
	bne _0207E7CE
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	b _0207E7D4
_0207E7CE:
	ldr r0, _0207E934 ; =0x000005DC
	bl PlaySE
_0207E7D4:
	mov r0, #0
	str r0, [sp]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #1]
	ldrb r3, [r5, #3]
	add r0, r6, #0
	bl sub_0207E3A8
	ldrb r0, [r5, #3]
	add r1, r5, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #1]
	add r0, r6, #0
	bl sub_0207E28C
	ldrb r0, [r5, #3]
	ldrb r1, [r5, #2]
	add r2, r7, #0
	bl sub_0207E6B4
	strb r0, [r5, #1]
	ldrb r2, [r5, #1]
	ldr r3, [r5, #4]
	add r0, r6, #0
	lsl r2, r2, #3
	add r2, r3, r2
	ldr r2, [r2, #4]
	add r1, r5, #0
	bl sub_0207CB9C
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0207E81E:
	ldr r0, _0207E938 ; =gSystem
	mov r2, #0x40
	ldr r1, [r0, #0x4c]
	tst r2, r1
	beq _0207E83A
	ldrb r1, [r5, #2]
	add r0, r5, #1
	add r2, r4, #0
	bl sub_0207E714
	cmp r0, #0
	beq _0207E900
	add r4, r4, #1
	b _0207E900
_0207E83A:
	mov r2, #0x80
	tst r2, r1
	beq _0207E852
	ldrb r1, [r5, #2]
	add r0, r5, #1
	mov r2, #1
	bl sub_0207E714
	cmp r0, #0
	beq _0207E900
	add r4, r4, #1
	b _0207E900
_0207E852:
	mov r2, #0x20
	tst r2, r1
	bne _0207E85E
	mov r2, #0x10
	tst r1, r2
	beq _0207E870
_0207E85E:
	ldrb r1, [r5, #2]
	add r0, r5, #1
	mov r2, #2
	bl sub_0207E714
	cmp r0, #0
	beq _0207E900
	add r4, r4, #1
	b _0207E900
_0207E870:
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207E8B2
	ldrb r0, [r5, #3]
	ldrb r1, [r5, #2]
	mov r2, #7
	bl sub_0207E6B4
	ldrb r1, [r5, #1]
	cmp r1, r0
	bne _0207E892
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	b _0207E898
_0207E892:
	ldr r0, _0207E934 ; =0x000005DC
	bl PlaySE
_0207E898:
	ldrb r2, [r5, #1]
	ldr r3, [r5, #4]
	add r0, r6, #0
	lsl r2, r2, #3
	add r2, r3, r2
	ldr r2, [r2, #4]
	add r1, r5, #0
	bl sub_0207CB9C
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0207E8B2:
	mov r0, #2
	tst r0, r1
	beq _0207E900
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	str r0, [sp]
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #1]
	ldrb r3, [r5, #3]
	add r0, r6, #0
	bl sub_0207E3A8
	ldrb r0, [r5, #3]
	add r1, r5, #4
	str r0, [sp]
	add r0, r4, #0
	str r0, [sp, #4]
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #1]
	add r0, r6, #0
	bl sub_0207E28C
	ldrb r0, [r5, #3]
	ldrb r1, [r5, #2]
	mov r2, #7
	bl sub_0207E6B4
	strb r0, [r5, #1]
	add r0, r6, #0
	add r1, r5, #0
	sub r2, r4, #2
	bl sub_0207CB9C
	add sp, #8
	sub r0, r4, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207E900:
	cmp r4, #0
	beq _0207E926
	ldr r0, _0207E934 ; =0x000005DC
	bl PlaySE
	ldrb r1, [r5, #2]
	ldrb r2, [r5, #1]
	ldrb r3, [r5, #3]
	add r0, r6, #0
	bl sub_0207E54C
	ldrb r0, [r5, #3]
	add r1, r5, #4
	str r0, [sp]
	ldrb r2, [r5, #2]
	ldrb r3, [r5, #1]
	add r0, r6, #0
	bl sub_0207E358
_0207E926:
	mov r0, #0
	mvn r0, r0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207E930: .word _02110180
_0207E934: .word 0x000005DC
_0207E938: .word gSystem
	thumb_func_end sub_0207E778

	thumb_func_start sub_0207E93C
sub_0207E93C: ; 0x0207E93C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	mov r1, #0xc9
	add r5, r0, #0
	lsl r1, r1, #4
	add r7, r5, r1
	ldr r1, [r7, #0xc]
	mov r6, #0
	cmp r1, #1
	bne _0207E966
	bl sub_0207CC24
	cmp r0, #0
	bne _0207E960
	add sp, #8
	ldr r0, [r7, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0207E960:
	add sp, #8
	sub r0, r6, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207E966:
	ldr r0, _0207EB18 ; =_02110168
	bl TouchscreenHitbox_FindRectAtTouchNew
	add r7, r0, #0
	sub r0, r6, #1
	cmp r7, r0
	beq _0207EA0E
	cmp r7, #4
	bne _0207E9BA
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r6, #0
	str r0, [sp]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	bl sub_0207E3A8
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	add r0, r6, #0
	str r0, [sp, #4]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	add r0, r5, #0
	bl sub_0207E28C
	ldrb r0, [r4, #2]
	add r1, r4, #0
	sub r2, r6, #2
	sub r0, r0, #1
	strb r0, [r4, #1]
	add r0, r5, #0
	bl sub_0207CB9C
	add sp, #8
	sub r0, r6, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207E9BA:
	ldrb r0, [r4, #3]
	ldrb r1, [r4, #2]
	add r2, r7, #0
	bl sub_0207E6E8
	cmp r0, #1
	beq _0207E9CA
	b _0207EAEA
_0207E9CA:
	ldr r0, _0207EB1C ; =0x000005DC
	bl PlaySE
	add r0, r6, #0
	str r0, [sp]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	bl sub_0207E3A8
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	add r0, r6, #0
	str r0, [sp, #4]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	add r0, r5, #0
	bl sub_0207E28C
	strb r7, [r4, #1]
	ldrb r2, [r4, #1]
	ldr r3, [r4, #4]
	add r0, r5, #0
	lsl r2, r2, #3
	add r2, r3, r2
	ldr r2, [r2, #4]
	add r1, r4, #0
	bl sub_0207CB9C
	add sp, #8
	sub r0, r6, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207EA0E:
	ldr r2, _0207EB20 ; =gSystem
	mov r1, #0x40
	ldr r0, [r2, #0x4c]
	tst r1, r0
	beq _0207EA2A
	ldrb r1, [r4, #2]
	add r0, r4, #1
	add r2, r6, #0
	bl sub_0207E748
	cmp r0, #0
	beq _0207EAEA
	add r6, r6, #1
	b _0207EAEA
_0207EA2A:
	mov r1, #0x80
	tst r0, r1
	beq _0207EA42
	ldrb r1, [r4, #2]
	add r0, r4, #1
	mov r2, #1
	bl sub_0207E748
	cmp r0, #0
	beq _0207EAEA
	add r6, r6, #1
	b _0207EAEA
_0207EA42:
	ldr r1, [r2, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207EAA2
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #1]
	sub r0, r0, #1
	cmp r1, r0
	bne _0207EA5E
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	b _0207EA64
_0207EA5E:
	ldr r0, _0207EB1C ; =0x000005DC
	bl PlaySE
_0207EA64:
	mov r0, #0
	str r0, [sp]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	bl sub_0207E3A8
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	add r0, r5, #0
	bl sub_0207E28C
	ldrb r2, [r4, #1]
	ldr r3, [r4, #4]
	add r0, r5, #0
	lsl r2, r2, #3
	add r2, r3, r2
	ldr r2, [r2, #4]
	add r1, r4, #0
	bl sub_0207CB9C
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0207EAA2:
	mov r0, #2
	tst r0, r1
	beq _0207EAEA
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r6, #0
	str r0, [sp]
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	bl sub_0207E3A8
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	add r0, r6, #0
	str r0, [sp, #4]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	add r0, r5, #0
	bl sub_0207E28C
	ldrb r0, [r4, #2]
	add r1, r4, #0
	sub r2, r6, #2
	sub r0, r0, #1
	strb r0, [r4, #1]
	add r0, r5, #0
	bl sub_0207CB9C
	add sp, #8
	sub r0, r6, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207EAEA:
	cmp r6, #0
	beq _0207EB10
	ldr r0, _0207EB1C ; =0x000005DC
	bl PlaySE
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #1]
	ldrb r3, [r4, #3]
	add r0, r5, #0
	bl sub_0207E54C
	ldrb r0, [r4, #3]
	add r1, r4, #4
	str r0, [sp]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #1]
	add r0, r5, #0
	bl sub_0207E358
_0207EB10:
	mov r0, #0
	mvn r0, r0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207EB18: .word _02110168
_0207EB1C: .word 0x000005DC
_0207EB20: .word gSystem
	thumb_func_end sub_0207E93C

	.rodata

	.global _021015AC
_021015AC:
	.short 0, 2, 6, 8, 3, 5, 1, 7

	.global _021015BC
_021015BC:
	.short 0x0008, 0x0002, 0x0014, 0x000E
	.short 0x0009, 0x0003, 0x0015, 0x000F
	.short 0x000A, 0x0004, 0x0016, 0x0010
	.short 0x000B, 0x0005, 0x0017, 0x0011
	.short 0x000C, 0x0006, 0x0018, 0x0012
	.short 0x000D, 0x0007, 0x0019, 0x0013

	.global _021015EC
_021015EC:
	.byte 0x10, 0x03, 0x10, 0x04
	.byte 0x10, 0x07, 0x10, 0x04
	.byte 0x10, 0x0B, 0x10, 0x04
	.byte 0x00, 0x02, 0x10, 0x04
	.byte 0x00, 0x06, 0x10, 0x04
	.byte 0x00, 0x0A, 0x10, 0x04
	.byte 0x00, 0x0E, 0x10, 0x04
	.byte 0x19, 0x13, 0x07, 0x05
	.byte 0x10, 0x02, 0x10, 0x04
	.byte 0x10, 0x06, 0x10, 0x04
	.byte 0x10, 0x0A, 0x10, 0x04
	.byte 0x10, 0x0E, 0x10, 0x04

	.global _0210161C
_0210161C:
// struct WindowTemplate[]
	.byte 0x01, 0x1A, 0x15, 0x05, 0x02, 0x00
	.short 0x0180
	.byte 0x01, 0x19, 0x14, 0x07, 0x02, 0x00
	.short 0x018A
	.byte 0x00, 0x02, 0x15, 0x14, 0x02, 0x0D
	.short 0x0198
	.byte 0x00, 0x02, 0x13, 0x0D, 0x04, 0x0D
	.short 0x01C0
	.byte 0x00, 0x02, 0x13, 0x1B, 0x04, 0x0D
	.short 0x01F4
	.byte 0x00, 0x13, 0x11, 0x0C, 0x06, 0x00
	.short 0x0260
	.byte 0x00, 0x13, 0x0F, 0x0C, 0x08, 0x00
	.short 0x0260

	.global _02101654
_02101654:
// struct WindowTemplate[]
	.byte 0x00, 0x11, 0x04, 0x0E, 0x02, 0x02
	.short 0x0260
	.byte 0x00, 0x11, 0x08, 0x0E, 0x02, 0x02
	.short 0x027C
	.byte 0x00, 0x11, 0x0C, 0x0E, 0x02, 0x02
	.short 0x0298
	.byte 0x00, 0x01, 0x03, 0x0E, 0x02, 0x02
	.short 0x02B4
	.byte 0x00, 0x01, 0x07, 0x0E, 0x02, 0x02
	.short 0x02D0
	.byte 0x00, 0x01, 0x0B, 0x0E, 0x02, 0x02
	.short 0x02EC
	.byte 0x00, 0x01, 0x0F, 0x0E, 0x02, 0x02
	.short 0x0308
	.byte 0x00, 0x1A, 0x14, 0x05, 0x03, 0x02
	.short 0x0324
	.byte 0x00, 0x11, 0x03, 0x0E, 0x02, 0x02
	.short 0x0260
	.byte 0x00, 0x11, 0x07, 0x0E, 0x02, 0x02
	.short 0x027C
	.byte 0x00, 0x11, 0x0B, 0x0E, 0x02, 0x02
	.short 0x0298
	.byte 0x00, 0x11, 0x0F, 0x0E, 0x02, 0x02
	.short 0x02B4

	.global _021016B4
_021016B4:
	.byte 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF

	.byte 0x00, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x08, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF

	.byte 0x00, 0x01, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x08, 0x09, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF

	.byte 0x00, 0x01, 0x02, 0x07, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x08, 0x09, 0x0A, 0x07, 0xFF, 0xFF, 0xFF, 0xFF

	.byte 0x00, 0x01, 0x02, 0x07, 0x03, 0xFF, 0xFF, 0xFF
	.byte 0x08, 0x09, 0x0A, 0x0B, 0x07, 0xFF, 0xFF, 0xFF

	.byte 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0xFF, 0xFF
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x08, 0xFF, 0xFF

	.byte 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0x05, 0xFF
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x08, 0xFF

	.byte 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0x05, 0x06
	.byte 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0x05, 0x06

	.global _02101734
_02101734:
// struct WindowTemplate[]
	.byte 0x01, 0x06, 0x01, 0x09, 0x02, 0x00
	.short 0x0048
	.byte 0x01, 0x00, 0x04, 0x06, 0x02, 0x00
	.short 0x005A
	.byte 0x01, 0x07, 0x04, 0x08, 0x02, 0x00
	.short 0x0066
	.byte 0x01, 0x08, 0x03, 0x06, 0x01, 0x03
	.short 0x0076
	.byte 0x01, 0x06, 0x04, 0x0A, 0x02, 0x00
	.short 0x0066
	.byte 0x01, 0x16, 0x02, 0x09, 0x02, 0x00
	.short 0x007C
	.byte 0x01, 0x10, 0x05, 0x06, 0x02, 0x00
	.short 0x008E
	.byte 0x01, 0x17, 0x05, 0x08, 0x02, 0x00
	.short 0x009A
	.byte 0x01, 0x18, 0x04, 0x06, 0x01, 0x04
	.short 0x00AA
	.byte 0x01, 0x16, 0x05, 0x0A, 0x02, 0x00
	.short 0x009A
	.byte 0x01, 0x06, 0x07, 0x09, 0x02, 0x00
	.short 0x00B0
	.byte 0x01, 0x00, 0x0A, 0x06, 0x02, 0x00
	.short 0x00C2
	.byte 0x01, 0x07, 0x0A, 0x08, 0x02, 0x00
	.short 0x00CE
	.byte 0x01, 0x08, 0x09, 0x06, 0x01, 0x05
	.short 0x00DE
	.byte 0x01, 0x06, 0x0A, 0x0A, 0x02, 0x00
	.short 0x00CE
	.byte 0x01, 0x16, 0x08, 0x09, 0x02, 0x00
	.short 0x00E4
	.byte 0x01, 0x10, 0x0B, 0x06, 0x02, 0x00
	.short 0x00F6
	.byte 0x01, 0x17, 0x0B, 0x08, 0x02, 0x00
	.short 0x0102
	.byte 0x01, 0x18, 0x0A, 0x06, 0x01, 0x06
	.short 0x0112
	.byte 0x01, 0x16, 0x0B, 0x0A, 0x02, 0x00
	.short 0x0102
	.byte 0x01, 0x06, 0x0D, 0x09, 0x02, 0x00
	.short 0x0118
	.byte 0x01, 0x00, 0x10, 0x06, 0x02, 0x00
	.short 0x012A
	.byte 0x01, 0x07, 0x10, 0x08, 0x02, 0x00
	.short 0x0136
	.byte 0x01, 0x08, 0x0F, 0x06, 0x01, 0x07
	.short 0x0146
	.byte 0x01, 0x06, 0x10, 0x0A, 0x02, 0x00
	.short 0x0136
	.byte 0x01, 0x16, 0x0E, 0x09, 0x02, 0x00
	.short 0x014C
	.byte 0x01, 0x10, 0x11, 0x06, 0x02, 0x00
	.short 0x015E
	.byte 0x01, 0x17, 0x11, 0x08, 0x02, 0x00
	.short 0x016A
	.byte 0x01, 0x18, 0x10, 0x06, 0x01, 0x08
	.short 0x017A
	.byte 0x01, 0x16, 0x11, 0x0A, 0x02, 0x00
	.short 0x016A
	.byte 0x01, 0x16, 0x01, 0x09, 0x02, 0x00
	.short 0x007C
	.byte 0x01, 0x11, 0x05, 0x05, 0x02, 0x00
	.short 0x008E
	.byte 0x01, 0x17, 0x05, 0x08, 0x02, 0x00
	.short 0x009A
	.byte 0x01, 0x18, 0x04, 0x06, 0x01, 0x04
	.short 0x00AA
	.byte 0x01, 0x18, 0x04, 0x06, 0x01, 0x04
	.short 0x00AA
	.byte 0x01, 0x16, 0x08, 0x09, 0x02, 0x00
	.short 0x00E4
	.byte 0x01, 0x11, 0x0B, 0x05, 0x02, 0x00
	.short 0x00F6
	.byte 0x01, 0x17, 0x0B, 0x08, 0x02, 0x00
	.short 0x0102
	.byte 0x01, 0x18, 0x0A, 0x06, 0x01, 0x06
	.short 0x0112
	.byte 0x01, 0x18, 0x04, 0x06, 0x01, 0x04
	.short 0x00AA
	.byte 0x01, 0x16, 0x0E, 0x09, 0x02, 0x00
	.short 0x014C
	.byte 0x01, 0x11, 0x11, 0x05, 0x02, 0x00
	.short 0x015E
	.byte 0x01, 0x17, 0x11, 0x08, 0x02, 0x00
	.short 0x016A
	.byte 0x01, 0x18, 0x10, 0x06, 0x01, 0x08
	.short 0x017A
	.byte 0x01, 0x18, 0x04, 0x06, 0x01, 0x04
	.short 0x00AA
	.byte 0x06, 0x07, 0x18, 0x0A, 0x02, 0x02
	.short 0x0001
	.byte 0x06, 0x11, 0x18, 0x06, 0x02, 0x02
	.short 0x0015
	.byte 0x06, 0x11, 0x1A, 0x0C, 0x03, 0x02
	.short 0x0021

	.data

_02110168:
	.byte 0x10, 0x30, 0x80, 0x00, 0x30, 0x50, 0x80, 0x00
	.byte 0x50, 0x70, 0x80, 0x00, 0x70, 0x90, 0x80, 0x00, 0x98, 0xC0, 0xC8, 0x00, 0xFF, 0x00, 0x00, 0x00
_02110180:
	.byte 0x18, 0x38, 0x80, 0x00, 0x38, 0x58, 0x80, 0x00, 0x58, 0x78, 0x80, 0x00, 0x10, 0x30, 0x00, 0x80
	.byte 0x30, 0x50, 0x00, 0x80, 0x50, 0x70, 0x00, 0x80, 0x70, 0x90, 0x00, 0x80, 0x98, 0xC0, 0xC8, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00

	.global _021101A4
_021101A4:
	.word  1,  1
	.word  0,  0
	.word -1, -1
	.word -1, -1
	.word -1, -1

	.word  2,  1
	.word  0,  2
	.word  1,  0
	.word -1, -1
	.word -1, -1

	.word  3,  1
	.word  0,  2
	.word  1,  3
	.word  2,  0
	.word -1, -1

	.word  4,  1
	.word  0,  2
	.word  1,  3
	.word  2,  4
	.word  3,  0

 	.global _02110244
_02110244:
	.word  1,  1, -1
	.word  0,  0, -1
	.word -1, -1, -1
	.word -1, -1, -1
	.word -1, -1, -1
	.word -1, -1, -1
	.word -1, -1, -1
	.word -1, -1, -1

	.word  2,  1, -1
	.word  0,  2, -1
	.word  1,  0, -1
	.word -1, -1, -1
	.word -1, -1, -1
	.word -1, -1, -1
	.word -1, -1, -1
	.word  2,  0, -1

	.word  3,  1, -1
	.word  0,  2, -1
	.word  1,  3, -1
	.word  2,  0, -1
	.word -1, -1, -1
	.word -1, -1, -1
	.word -1, -1, -1
	.word  2,  0, -1

	.word  3,  1,  4
	.word  0,  2,  4
	.word  1,  3,  4
	.word  2,  0, -1
	.word -1, -1,  0
	.word -1, -1, -1
	.word -1, -1, -1
	.word  2,  0, -1

	.word  3,  1,  4
	.word  0,  2,  5
	.word  1,  3,  5
	.word  2,  0, -1
	.word  5,  5,  0
	.word  4,  4,  1
	.word -1, -1, -1
	.word  2,  0, -1

	.word  3,  1,  4
	.word  0,  2,  5
	.word  1,  3,  6
	.word  2,  0, -1
	.word  6,  5,  0
	.word  4,  6,  1
	.word  5,  4,  2
	.word  2,  0, -1

	.word  3,  1,  4
	.word  0,  2,  5
	.word  1,  3,  6
	.word  2,  0, -1
	.word  7,  5,  0
	.word  4,  6,  1
	.word  5,  7,  2
	.word  6,  4,  2
