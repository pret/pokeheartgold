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
	.include "overlay_01_021E8744.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021E8744
ov01_021E8744: ; 0x021E8744
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r6, r0, #0
	add r0, r7, #0
	add r5, r1, #0
	add r4, r3, #0
	bl ov01_02204554
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021E8760
	bl GF_AssertFail
_021E8760:
	mov r0, #0
	add r1, r6, #0
_021E8764:
	ldr r2, [r1]
	cmp r2, #0
	beq _021E877A
	ldr r2, [r1, #0xc]
	cmp r4, r2
	bne _021E877A
	ldr r2, [r1, #4]
	cmp r2, r5
	bne _021E877A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E877A:
	add r0, r0, #1
	add r1, #0x10
	cmp r0, #2
	blt _021E8764
	mov r2, #0
	add r1, r6, #0
_021E8786:
	ldr r0, [r1]
	cmp r0, #0
	bne _021E879C
	lsl r1, r2, #4
	mov r0, #1
	str r0, [r6, r1]
	add r0, r6, r1
	str r4, [r0, #0xc]
	str r7, [r0, #8]
	str r5, [r0, #4]
	b _021E87A4
_021E879C:
	add r2, r2, #1
	add r1, #0x10
	cmp r2, #2
	blt _021E8786
_021E87A4:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021E8744

	thumb_func_start ov01_021E87A8
ov01_021E87A8: ; 0x021E87A8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0
	add r6, r3, #0
	mvn r0, r0
	add r4, r1, #0
	add r7, r2, #0
	cmp r6, r0
	bne _021E87BE
	bl GF_AssertFail
_021E87BE:
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #4
	bl NARC_AllocAndReadWholeMember
	add r5, r0, #0
	bne _021E87D0
	bl GF_AssertFail
_021E87D0:
	ldr r0, [sp, #0x1c]
	ldr r3, [sp, #0x18]
	str r0, [sp]
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov01_02204470
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021E87A8

	thumb_func_start ov01_021E87E4
ov01_021E87E4: ; 0x021E87E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r1, [sp, #4]
	mov r1, #0x4f
	str r0, [sp]
	mov r0, #4
	lsl r1, r1, #2
	bl AllocFromHeap
	add r7, r0, #0
	mov r0, #0
	add r1, r7, #0
	add r6, r0, #0
_021E87FE:
	str r6, [r1, #0x14]
	str r6, [r1, #0x18]
	str r6, [r1, #0x1c]
	add r0, r0, #1
	add r1, #0x10
	cmp r0, #0x10
	blt _021E87FE
	mov r0, #0x11
	lsl r0, r0, #4
	add r2, r0, #0
	add r3, r0, #0
	add r5, r7, #0
	mov r4, #0
	add r1, r0, #4
	add r2, #8
	add r3, #0xc
_021E881E:
	str r4, [r5, r0]
	str r4, [r5, r1]
	str r4, [r5, r2]
	str r4, [r5, r3]
	add r6, r6, #1
	add r5, #0x10
	cmp r6, #2
	blt _021E881E
	mov r0, #0x6a
	mov r1, #4
	bl NARC_New
	mov r1, #0x13
	lsl r1, r1, #4
	str r0, [r7, r1]
	ldr r0, [sp]
	add r1, r1, #4
	str r0, [r7, r1]
	ldr r0, [sp, #4]
	mov r1, #4
	mov r2, #0x10
	bl ov01_022041D8
	mov r1, #0x4e
	lsl r1, r1, #2
	str r0, [r7, r1]
	add r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021E87E4

	thumb_func_start ov01_021E8858
ov01_021E8858: ; 0x021E8858
	cmp r0, #0
	bne _021E8860
	mov r0, #0
	bx lr
_021E8860:
	ldr r0, [r0]
	bx lr
	thumb_func_end ov01_021E8858

	thumb_func_start ov01_021E8864
ov01_021E8864: ; 0x021E8864
	cmp r0, #8
	bne _021E886C
	mov r0, #0
	bx lr
_021E886C:
	mov r1, #1
	and r0, r1
	cmp r0, #1
	beq _021E8876
	mov r1, #0
_021E8876:
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021E8864

	thumb_func_start ov01_021E887C
ov01_021E887C: ; 0x021E887C
	cmp r0, #8
	bne _021E8884
	mov r0, #1
	bx lr
_021E8884:
	asr r1, r0, #1
	mov r0, #1
	and r1, r0
	cmp r1, #1
	beq _021E8890
	mov r0, #0
_021E8890:
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021E887C

	thumb_func_start ov01_021E8894
ov01_021E8894: ; 0x021E8894
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r0, #0
	mov r0, #0x4d
	ldr r7, [sp, #0x54]
	lsl r0, r0, #2
	add r4, r1, #0
	str r2, [sp, #8]
	ldr r0, [r7, r0]
	add r1, r6, #0
	add r2, sp, #0x10
	add r5, r3, #0
	bl NARC_ReadWholeMember
	cmp r4, #4
	blt _021E88B8
	bl GF_AssertFail
_021E88B8:
	lsl r1, r4, #2
	add r0, sp, #0x18
	ldr r0, [r0, r1]
	mov r1, #0
	mvn r1, r1
	str r0, [sp, #0xc]
	cmp r0, r1
	bne _021E88CE
	add sp, #0x28
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E88CE:
	add r0, sp, #0x10
	ldrb r0, [r0, #1]
	bl ov01_021E8864
	ldr r1, [sp, #0x48]
	cmp r1, r0
	beq _021E88E2
	add sp, #0x28
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E88E2:
	mov r6, #0
	add r4, r7, #0
_021E88E6:
	cmp r5, #0
	beq _021E88F4
	ldr r0, [r4, #0x1c]
	cmp r5, r0
	bne _021E88F4
	bl GF_AssertFail
_021E88F4:
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #0x10
	blt _021E88E6
	mov r2, #0
	add r1, r7, #0
_021E8900:
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _021E895E
	lsl r4, r2, #4
	mov r1, #1
	add r0, r7, r4
	str r1, [r0, #0x14]
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl ov01_022042FC
	add r6, r0, #0
	bne _021E8920
	bl GF_AssertFail
_021E8920:
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x44]
	ldr r3, [sp, #0x40]
	add r0, r6, #0
	bl ov01_022044C8
	ldr r0, [sp, #0xc]
	add r1, r7, r4
	str r0, [r1, #0x18]
	str r5, [r1, #0x1c]
	ldr r0, [sp, #0x4c]
	mov r1, #0x13
	str r0, [sp]
	ldr r0, [sp, #0x50]
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r7, r1]
	add r1, #8
	ldr r1, [r7, r1]
	ldr r3, [sp, #0xc]
	add r2, r6, #0
	bl ov01_021E87A8
	add r7, #0x10
	str r6, [r7, r4]
	ldr r0, [r7, r4]
	bl ov01_022044E0
	add sp, #0x28
	add r0, r7, r4
	pop {r3, r4, r5, r6, r7, pc}
_021E895E:
	add r2, r2, #1
	add r1, #0x10
	cmp r2, #0x10
	blt _021E8900
	bl GF_AssertFail
	mov r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021E8894

	thumb_func_start ov01_021E8970
ov01_021E8970: ; 0x021E8970
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	ldr r6, [sp, #0x30]
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	str r3, [sp]
	cmp r6, #0
	bne _021E898C
	bl GF_AssertFail
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021E898C:
	add r0, r6, #0
	bl ov01_021E8B9C
	cmp r5, r0
	blt _021E899C
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021E899C:
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	add r1, r5, #0
	add r2, sp, #4
	bl NARC_ReadWholeMember
	cmp r4, #4
	blt _021E89B2
	bl GF_AssertFail
_021E89B2:
	lsl r1, r4, #2
	add r0, sp, #0xc
	ldr r5, [r0, r1]
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _021E89C6
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021E89C6:
	add r0, sp, #4
	ldrb r0, [r0, #1]
	bl ov01_021E887C
	cmp r7, r0
	beq _021E89D8
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021E89D8:
	mov r4, #0
	add r1, r6, #0
_021E89DC:
	ldr r0, [r1, #0x18]
	cmp r5, r0
	bne _021E8A1A
	add r0, sp, #4
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _021E8A02
	lsl r2, r4, #4
	mov r0, #0x11
	add r2, r6, r2
	lsl r0, r0, #4
	lsl r3, r5, #0x18
	ldr r1, [sp]
	ldr r2, [r2, #0x10]
	add r0, r6, r0
	lsr r3, r3, #0x18
	bl ov01_021E8744
	b _021E8A04
_021E8A02:
	mov r0, #1
_021E8A04:
	cmp r0, #0
	beq _021E8A14
	lsl r1, r4, #4
	add r1, r6, r1
	ldr r0, [sp]
	ldr r1, [r1, #0x10]
	bl ov01_0220450C
_021E8A14:
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E8A1A:
	add r4, r4, #1
	add r1, #0x10
	cmp r4, #0x10
	blt _021E89DC
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021E8970

	thumb_func_start ov01_021E8A28
ov01_021E8A28: ; 0x021E8A28
	push {r3, r4}
	cmp r0, #0
	beq _021E8A4C
	mov r4, #0
	add r2, r4, #0
	add r1, r4, #0
_021E8A34:
	ldr r3, [r0, #0x14]
	cmp r3, #0
	beq _021E8A44
	cmp r3, #1
	bne _021E8A40
	str r2, [r0, #0x10]
_021E8A40:
	str r1, [r0, #0x14]
	str r1, [r0, #0x1c]
_021E8A44:
	add r4, r4, #1
	add r0, #0x10
	cmp r4, #0x10
	blt _021E8A34
_021E8A4C:
	pop {r3, r4}
	bx lr
	thumb_func_end ov01_021E8A28

	thumb_func_start ov01_021E8A50
ov01_021E8A50: ; 0x021E8A50
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	beq _021E8A88
	cmp r5, #0
	bne _021E8A60
	bl GF_AssertFail
_021E8A60:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021E8A88
	cmp r0, #1
	bne _021E8A82
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5]
	bl ov01_02204500
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r5]
	bl ov01_0220431C
_021E8A82:
	mov r0, #0
	str r0, [r5, #4]
	str r0, [r5, #0xc]
_021E8A88:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8A50

	thumb_func_start ov01_021E8A8C
ov01_021E8A8C: ; 0x021E8A8C
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #0x4d
	lsl r0, r0, #2
	add r6, r1, #0
	add r1, r2, #0
	ldr r0, [r4, r0]
	add r2, sp, #0
	add r5, r3, #0
	bl NARC_ReadWholeMember
	cmp r5, #4
	blt _021E8AAC
	bl GF_AssertFail
_021E8AAC:
	lsl r1, r5, #2
	add r0, sp, #8
	ldr r5, [r0, r1]
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	bne _021E8ABE
	bl GF_AssertFail
_021E8ABE:
	mov r0, #0
_021E8AC0:
	lsl r1, r0, #4
	add r1, r4, r1
	ldr r2, [r1, #0x14]
	cmp r2, #1
	bne _021E8ADC
	ldr r2, [r1, #0x18]
	cmp r5, r2
	bne _021E8ADC
	ldr r1, [r1, #0x10]
	add r0, r6, #0
	bl ov01_02204518
	add sp, #0x18
	pop {r4, r5, r6, pc}
_021E8ADC:
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0x10
	blo _021E8AC0
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8A8C

	thumb_func_start ov01_021E8AEC
ov01_021E8AEC: ; 0x021E8AEC
	push {r4, lr}
	add r4, r0, #0
	beq _021E8B02
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl NARC_Delete
	add r0, r4, #0
	bl FreeToHeap
_021E8B02:
	pop {r4, pc}
	thumb_func_end ov01_021E8AEC

	thumb_func_start ov01_021E8B04
ov01_021E8B04: ; 0x021E8B04
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r3, r0, #0
	mov r0, #0x4d
	add r5, r2, #0
	lsl r0, r0, #2
	add r4, r1, #0
	ldr r0, [r5, r0]
	add r1, r3, #0
	add r2, sp, #0
	bl NARC_ReadWholeMember
	cmp r4, #4
	blt _021E8B24
	bl GF_AssertFail
_021E8B24:
	lsl r1, r4, #2
	add r0, sp, #8
	mov r4, #0
	ldr r1, [r0, r1]
	add r2, r4, #0
	add r3, r5, #0
_021E8B30:
	ldr r0, [r3, #0x18]
	cmp r1, r0
	bne _021E8B48
	add r5, #0x10
	lsl r0, r2, #4
	add r4, r5, r0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _021E8B50
	bl GF_AssertFail
	b _021E8B50
_021E8B48:
	add r2, r2, #1
	add r3, #0x10
	cmp r2, #0x10
	blt _021E8B30
_021E8B50:
	cmp r4, #0
	bne _021E8B58
	bl GF_AssertFail
_021E8B58:
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8B04

	thumb_func_start ov01_021E8B60
ov01_021E8B60: ; 0x021E8B60
	ldr r3, _021E8B68 ; =ov01_0220455C
	ldr r0, [r0]
	bx r3
	nop
_021E8B68: .word ov01_0220455C
	thumb_func_end ov01_021E8B60

	thumb_func_start ov01_021E8B6C
ov01_021E8B6C: ; 0x021E8B6C
	ldr r3, _021E8B74 ; =ov01_022044E0
	ldr r0, [r0]
	bx r3
	nop
_021E8B74: .word ov01_022044E0
	thumb_func_end ov01_021E8B6C

	thumb_func_start ov01_021E8B78
ov01_021E8B78: ; 0x021E8B78
	ldr r3, _021E8B80 ; =ov01_02204570
	ldr r0, [r0]
	bx r3
	nop
_021E8B80: .word ov01_02204570
	thumb_func_end ov01_021E8B78

	thumb_func_start ov01_021E8B84
ov01_021E8B84: ; 0x021E8B84
	ldr r3, _021E8B8C ; =ov01_02204590
	ldr r0, [r0]
	bx r3
	nop
_021E8B8C: .word ov01_02204590
	thumb_func_end ov01_021E8B84

	thumb_func_start ov01_021E8B90
ov01_021E8B90: ; 0x021E8B90
	ldr r3, _021E8B98 ; =ov01_02204560
	ldr r0, [r0]
	bx r3
	nop
_021E8B98: .word ov01_02204560
	thumb_func_end ov01_021E8B90

	thumb_func_start ov01_021E8B9C
ov01_021E8B9C: ; 0x021E8B9C
	mov r1, #0x4d
	lsl r1, r1, #2
	ldr r3, _021E8BA8 ; =NARC_GetFileCount
	ldr r0, [r0, r1]
	bx r3
	nop
_021E8BA8: .word NARC_GetFileCount
	thumb_func_end ov01_021E8B9C

	thumb_func_start ov01_021E8BAC
ov01_021E8BAC: ; 0x021E8BAC
	push {r3, lr}
	sub sp, #0x18
	mov r2, #0x4d
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	add r2, sp, #0
	bl NARC_ReadWholeMember
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0
	bne _021E8BCA
	add sp, #0x18
	mov r0, #0
	pop {r3, pc}
_021E8BCA:
	mov r0, #0
	add r3, sp, #0
	sub r1, r0, #1
_021E8BD0:
	lsl r2, r0, #2
	add r2, r3, r2
	ldr r2, [r2, #8]
	cmp r2, r1
	beq _021E8BE4
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #4
	blo _021E8BD0
_021E8BE4:
	add sp, #0x18
	pop {r3, pc}
	thumb_func_end ov01_021E8BAC

	thumb_func_start ov01_021E8BE8
ov01_021E8BE8: ; 0x021E8BE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bne _021E8BF4
	bl GF_AssertFail
_021E8BF4:
	mov r1, #0x10
	mov r0, #0
	mov r2, #0x38
_021E8BFA:
	cmp r1, #0x10
	bne _021E8C0E
	add r3, r0, #0
	mul r3, r2
	add r3, r5, r3
	add r3, #0x34
	ldrb r3, [r3]
	cmp r3, #0
	bne _021E8C0E
	add r1, r0, #0
_021E8C0E:
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0x10
	blo _021E8BFA
	cmp r1, #0x10
	beq _021E8C32
	add r2, r1, #0
	mov r0, #0x38
	mul r2, r0
	add r0, r5, r2
	add r0, #0x34
	strb r4, [r0]
	add r0, r5, r2
	mov r1, #0
	add r0, #0x35
	strb r1, [r0]
	b _021E8C3A
_021E8C32:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E8C3A:
	add r0, r5, r2
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8BE8

	thumb_func_start ov01_021E8C40
ov01_021E8C40: ; 0x021E8C40
	add r1, r0, #0
	mov r3, #0
	add r1, #0x34
	strb r3, [r1]
	str r3, [r0, #0x30]
	str r3, [r0, #0x2c]
	add r2, r3, #0
_021E8C4E:
	lsl r1, r3, #2
	add r1, r0, r1
	str r2, [r1, #0x14]
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #6
	blo _021E8C4E
	bx lr
	thumb_func_end ov01_021E8C40

	thumb_func_start ov01_021E8C60
ov01_021E8C60: ; 0x021E8C60
	push {r4, r5}
	mov r4, #0
	add r3, r4, #0
	add r5, r0, #0
_021E8C68:
	add r2, r5, #0
	add r2, #0x34
	ldrb r2, [r2]
	cmp r1, r2
	bne _021E8C7A
	mov r1, #0x38
	mul r1, r3
	add r4, r0, r1
	b _021E8C82
_021E8C7A:
	add r3, r3, #1
	add r5, #0x38
	cmp r3, #0x10
	blt _021E8C68
_021E8C82:
	add r0, r4, #0
	pop {r4, r5}
	bx lr
	thumb_func_end ov01_021E8C60

	thumb_func_start ov01_021E8C88
ov01_021E8C88: ; 0x021E8C88
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #4
	ble _021E8C98
	bl GF_AssertFail
_021E8C98:
	cmp r5, #0
	beq _021E8C9E
	str r5, [r6, #0x14]
_021E8C9E:
	str r4, [r6, #0x10]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8C88

	thumb_func_start ov01_021E8CA4
ov01_021E8CA4: ; 0x021E8CA4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	add r4, r1, #0
	add r6, r2, #0
	cmp r4, r0
	blt _021E8CB6
	bl GF_AssertFail
_021E8CB6:
	lsl r0, r4, #2
	str r6, [r5, r0]
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021E8CA4

	thumb_func_start ov01_021E8CBC
ov01_021E8CBC: ; 0x021E8CBC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	add r4, r1, #0
	cmp r4, r0
	blt _021E8CCE
	bl GF_AssertFail
_021E8CCE:
	lsl r0, r4, #2
	ldr r0, [r5, r0]
	str r0, [sp, #4]
	bl ov01_021E8858
	str r0, [sp]
	ldr r0, [r5, #0x2c]
	bl ov01_021E8858
	add r7, r0, #0
	mov r4, #0
_021E8CE4:
	lsl r0, r4, #2
	add r6, r5, r0
	ldr r0, [r6, #0x14]
	cmp r0, #0
	beq _021E8CFC
	add r1, r7, #0
	bl ov01_02204518
	ldr r0, [r6, #0x14]
	ldr r1, [sp]
	bl ov01_0220450C
_021E8CFC:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _021E8CE4
	ldr r0, [sp, #4]
	str r0, [r5, #0x2c]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8CBC

	thumb_func_start ov01_021E8D10
ov01_021E8D10: ; 0x021E8D10
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x40]
	str r1, [sp, #0x1c]
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x4c]
	str r2, [sp, #0x20]
	str r0, [sp, #0x4c]
	add r0, r3, #0
	mov r5, #0
	str r3, [sp, #0x24]
	ldr r6, [sp, #0x44]
	ldr r7, [sp, #0x48]
	cmp r0, #0
	ble _021E8D68
_021E8D30:
	str r6, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x40]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	add r1, r5, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	mov r3, #0
	str r7, [sp, #0x14]
	bl ov01_021E8894
	add r4, r0, #0
	bne _021E8D56
	bl GF_AssertFail
_021E8D56:
	ldr r0, [sp, #0x4c]
	add r1, r5, #0
	add r2, r4, #0
	bl ov01_021E8CA4
	ldr r0, [sp, #0x24]
	add r5, r5, #1
	cmp r5, r0
	blt _021E8D30
_021E8D68:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021E8D10

	thumb_func_start ov01_021E8D6C
ov01_021E8D6C: ; 0x021E8D6C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	str r0, [sp]
	ldr r0, [r6, #0x2c]
	bl ov01_021E8858
	add r7, r0, #0
	mov r4, #0
	add r5, r6, #0
_021E8D7E:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _021E8D8A
	add r1, r7, #0
	bl ov01_02204518
_021E8D8A:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _021E8D7E
	ldr r0, [r6, #0x10]
	mov r5, #0
	cmp r0, #0
	ble _021E8DB0
	add r4, r6, #0
	add r7, r5, #0
_021E8D9E:
	ldr r0, [r4]
	ldr r1, [sp]
	bl ov01_021E8A50
	stmia r4!, {r7}
	ldr r0, [r6, #0x10]
	add r5, r5, #1
	cmp r5, r0
	blt _021E8D9E
_021E8DB0:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8D6C

	thumb_func_start ov01_021E8DB4
ov01_021E8DB4: ; 0x021E8DB4
	push {r4, lr}
	mov r1, #0xe
	mov r0, #4
	lsl r1, r1, #6
	bl AllocFromHeap
	add r4, r0, #0
	mov r2, #0xe
	mov r0, #0
	add r1, r4, #0
	lsl r2, r2, #6
	bl MIi_CpuClearFast
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8DB4

	thumb_func_start ov01_021E8DD4
ov01_021E8DD4: ; 0x021E8DD4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E8DE6
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
_021E8DE6:
	pop {r4, pc}
	thumb_func_end ov01_021E8DD4

	thumb_func_start ov01_021E8DE8
ov01_021E8DE8: ; 0x021E8DE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	add r0, r1, #0
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	add r6, r3, #0
	bl ov01_021E8BE8
	add r5, r0, #0
	bne _021E8E06
	bl GF_AssertFail
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021E8E06:
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x34]
	add r2, r5, #0
	bl ov01_021E8C88
	add r0, sp, #0x38
	ldrb r4, [r0]
	cmp r4, #0
	bne _021E8E1C
	bl GF_AssertFail
_021E8E1C:
	cmp r4, #0
	bne _021E8E22
	mov r4, #1
_021E8E22:
	ldr r0, [sp, #0x3c]
	str r4, [sp]
	str r0, [sp, #4]
	str r7, [sp, #8]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x34]
	add r0, r6, #0
	str r5, [sp, #0xc]
	bl ov01_021E8D10
	str r6, [r5, #0x30]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8DE8

	thumb_func_start ov01_021E8E40
ov01_021E8E40: ; 0x021E8E40
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r7, r1, #0
	add r6, r3, #0
	cmp r4, #6
	blo _021E8E52
	bl GF_AssertFail
_021E8E52:
	add r0, r5, #0
	add r1, r7, #0
	bl ov01_021E8C60
	add r5, r0, #0
	add r5, #0x14
	lsl r4, r4, #2
	ldr r0, [r5, r4]
	cmp r0, #0
	beq _021E8E6A
	bl GF_AssertFail
_021E8E6A:
	str r6, [r5, r4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8E40

	thumb_func_start ov01_021E8E70
ov01_021E8E70: ; 0x021E8E70
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0
	bne _021E8E80
	bl GF_AssertFail
_021E8E80:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021E8C60
	add r1, r6, #0
	bl ov01_021E8CBC
	mov r1, #0
	bl ov01_021E8B60
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8E70

	thumb_func_start ov01_021E8E98
ov01_021E8E98: ; 0x021E8E98
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	add r4, r3, #0
	cmp r5, #0
	bne _021E8EAA
	bl GF_AssertFail
_021E8EAA:
	add r0, r6, #0
	add r1, r5, #0
	bl ov01_021E8C60
	add r1, r7, #0
	bl ov01_021E8CBC
	add r5, r0, #0
	cmp r4, #0
	beq _021E8EC6
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl PlaySE
_021E8EC6:
	add r0, r5, #0
	mov r1, #0
	bl ov01_021E8B60
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021E8E98

	thumb_func_start ov01_021E8ED0
ov01_021E8ED0: ; 0x021E8ED0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bne _021E8EDE
	bl GF_AssertFail
_021E8EDE:
	add r0, r4, #0
	add r1, r6, #0
	bl ov01_021E8C60
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021E8D6C
	add r0, r4, #0
	bl ov01_021E8C40
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021E8ED0

	thumb_func_start ov01_021E8EF8
ov01_021E8EF8: ; 0x021E8EF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bne _021E8F04
	bl GF_AssertFail
_021E8F04:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_021E8C60
	ldr r0, [r0, #0x2c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021E8EF8

	thumb_func_start ov01_021E8F10
ov01_021E8F10: ; 0x021E8F10
	push {r4, lr}
	bl ov01_021E8EF8
	add r4, r0, #0
	bne _021E8F1E
	bl GF_AssertFail
_021E8F1E:
	ldr r0, [r4]
	bl ov01_02204560
	cmp r0, #0
	beq _021E8F2C
	mov r0, #1
	pop {r4, pc}
_021E8F2C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov01_021E8F10

	thumb_func_start ov01_021E8F30
ov01_021E8F30: ; 0x021E8F30
	push {r3, lr}
	bl ov01_021E8C60
	ldr r0, [r0, #0x30]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8F30

	thumb_func_start ov01_021E8F3C
ov01_021E8F3C: ; 0x021E8F3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r4, r0, #0
	ldr r0, [sp, #0x50]
	ldr r7, [sp, #0x54]
	str r0, [sp, #0x50]
	mov r0, #0
	str r0, [sp, #0x1c]
	add r0, r7, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl ov01_021E8B9C
	cmp r4, r0
	bge _021E8F86
	ldr r0, [sp, #0x50]
	ldrb r0, [r0]
	cmp r0, #0
	beq _021E8F86
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x50]
	str r0, [sp, #0x18]
_021E8F6C:
	ldr r0, [sp, #0x18]
	mov r1, #0
	ldr r0, [r0, #8]
	mvn r1, r1
	str r0, [sp, #0x24]
	cmp r0, r1
	beq _021E8F86
	ldr r0, [sp, #0x50]
	ldrb r0, [r0, #1]
	bl ov01_021E8864
	cmp r0, #0
	beq _021E8F88
_021E8F86:
	b _021E90AC
_021E8F88:
	ldr r0, [sp, #0x50]
	ldrb r0, [r0, #1]
	bl ov01_021E887C
	cmp r0, #0
	bne _021E8F9A
	mov r0, #1
	str r0, [sp, #0x14]
	b _021E8F9E
_021E8F9A:
	mov r0, #0
	str r0, [sp, #0x14]
_021E8F9E:
	mov r4, #0
	add r1, r7, #0
_021E8FA2:
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _021E9062
	lsl r0, r4, #4
	add r5, r7, r0
	mov r0, #1
	str r0, [r5, #0x14]
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	bl ov01_022042FC
	add r6, r0, #0
	bne _021E8FC2
	bl GF_AssertFail
_021E8FC2:
	ldr r0, [sp, #0x50]
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _021E8FD8
	mov r1, #1
	add r0, r6, #0
	add r2, r1, #0
	mov r3, #0
	bl ov01_022044C8
	b _021E8FE6
_021E8FD8:
	mov r1, #0
	mov r2, #0
	add r0, r6, #0
	mvn r1, r1
	add r3, r2, #0
	bl ov01_022044C8
_021E8FE6:
	ldr r0, [sp, #0x24]
	mov r1, #0x13
	str r0, [r5, #0x18]
	mov r0, #0
	str r0, [r5, #0x1c]
	ldr r0, [sp, #8]
	lsl r1, r1, #4
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0x24]
	str r0, [sp, #4]
	ldr r0, [r7, r1]
	add r1, #8
	ldr r1, [r7, r1]
	add r2, r6, #0
	bl ov01_021E87A8
	add r0, r6, #0
	str r6, [r5, #0x10]
	bl ov01_022044E0
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _021E9044
	ldr r0, [sp, #0x50]
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _021E9034
	ldr r3, [sp, #0x24]
	mov r0, #0x11
	lsl r0, r0, #4
	lsl r3, r3, #0x18
	ldr r1, [sp, #0xc]
	ldr r2, [r5, #0x10]
	add r0, r7, r0
	lsr r3, r3, #0x18
	bl ov01_021E8744
	b _021E9036
_021E9034:
	mov r0, #1
_021E9036:
	cmp r0, #0
	beq _021E906A
	ldr r0, [sp, #0xc]
	ldr r1, [r5, #0x10]
	bl ov01_0220450C
	b _021E906A
_021E9044:
	ldr r0, [sp, #0x50]
	ldrb r0, [r0, #1]
	cmp r0, #8
	bne _021E906A
	ldr r0, [sp, #0x1c]
	add r1, r0, #0
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0x1c]
	ldr r2, [r5, #0x10]
	lsl r1, r0, #2
	add r0, sp, #0x28
	str r2, [r0, r1]
	b _021E906A
_021E9062:
	add r4, r4, #1
	add r1, #0x10
	cmp r4, #0x10
	blt _021E8FA2
_021E906A:
	cmp r4, #0x10
	bne _021E9072
	bl GF_AssertFail
_021E9072:
	ldr r0, [sp, #0x18]
	add r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #4
	bge _021E9084
	b _021E8F6C
_021E9084:
	ldr r0, [sp, #0x50]
	ldrb r0, [r0, #1]
	cmp r0, #8
	bne _021E90AC
	ldr r0, [sp, #0x58]
	bl ov01_02204834
	add r1, r0, #0
	lsl r2, r1, #2
	add r1, sp, #0x28
	ldr r0, [sp, #0xc]
	ldr r1, [r1, r2]
	bl ov01_0220450C
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #0xc]
	add r2, sp, #0x28
	mov r3, #4
	bl ov01_0220476C
_021E90AC:
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021E8F3C

	thumb_func_start ov01_021E90B0
ov01_021E90B0: ; 0x021E90B0
	push {r4, lr}
	add r4, r2, #0
	bl ov01_021E8C60
	add r0, #0x35
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021E90B0
