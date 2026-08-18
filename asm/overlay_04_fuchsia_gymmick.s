#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "overlay_04.inc"
	.include "global.inc"

	.extern ov04_02256734

	.text

	thumb_func_start ov04_0225686C
ov04_0225686C: ; 0x0225686C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	add r0, r6, #0
	str r0, [sp, #0xc]
	add r0, #0x10
	str r0, [sp, #0xc]
	add r0, r6, #0
	str r0, [sp, #0x10]
	add r0, #0xd8
	str r0, [sp, #0x10]
	mov r7, #0x14
_02256888:
	ldr r0, [sp, #8]
	lsl r1, r0, #4
	ldr r0, [sp, #0xc]
	add r0, r0, r1
	bl Field3dModel_Unload
	mov r0, #0
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	mov r0, #0x9a
	lsl r0, r0, #2
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x10]
	add r0, r0, r2
	str r0, [sp]
_022568A8:
	ldr r1, [sp, #4]
	mov r0, #0xcc
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp]
	mov r5, #0
	add r0, r0, r2
	add r4, r0, #4
_022568B8:
	add r0, r5, #0
	mul r0, r7
	add r0, r4, r0
	add r1, r6, #0
	bl Field3dModelAnimation_Unload
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _022568B8
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #3
	blo _022568A8
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	cmp r0, #0xc
	blo _02256888
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_0225686C

	thumb_func_start ov04_022568F0
ov04_022568F0: ; 0x022568F0
	push {r3, r4}
	ldr r4, _0225691C ; =ov04_0225766C
	mov r3, #0
_022568F6:
	ldr r2, [r4]
	cmp r0, r2
	bne _02256908
	ldr r2, [r4, #4]
	cmp r1, r2
	bne _02256908
	add r0, r3, #0
	pop {r3, r4}
	bx lr
_02256908:
	add r2, r3, #1
	lsl r2, r2, #0x10
	asr r3, r2, #0x10
	add r4, #0x14
	cmp r3, #0x3c
	blt _022568F6
	mov r0, #0
	mvn r0, r0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0225691C: .word ov04_0225766C
	thumb_func_end ov04_022568F0

	thumb_func_start ov04_02256920
ov04_02256920: ; 0x02256920
	push {r3, r4, r5, r6}
	mov r2, #0
	mov r3, #2
	mov r4, #0xc
_02256928:
	add r5, r2, #0
	mul r5, r4
	add r6, r0, r5
	ldrh r5, [r0, r5]
	cmp r5, #0
	beq _02256940
	ldrsh r5, [r6, r3]
	cmp r1, r5
	bne _02256940
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_02256940:
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	cmp r2, #3
	blo _02256928
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end ov04_02256920

	thumb_func_start ov04_02256950
ov04_02256950: ; 0x02256950
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r7, r2, #0
	add r2, r6, #0
	add r2, #0xd0
	str r1, [sp]
	ldr r1, _02256A38 ; =0x00001DB4
	ldr r3, [r2]
	mov r2, #0xc
	add r1, r6, r1
	mul r2, r3
	add r5, r1, r2
	ldrh r1, [r1, r2]
	cmp r1, #0
	beq _02256978
	bl GF_AssertFail
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02256978:
	add r1, r7, #0
	bl ov04_02256AC4
	mov r0, #1
	strh r0, [r5]
	mov r0, #0x14
	add r4, r7, #0
	mul r4, r0
	ldr r1, _02256A3C ; =ov04_0225766C + 8
	add r0, r6, #0
	ldrh r1, [r1, r4]
	add r0, #0xd4
	strh r7, [r5, #2]
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0x9a
	lsl r1, r1, #2
	mul r1, r2
	add r0, r0, r1
	bl ov04_02256A90
	str r0, [r5, #4]
	ldr r0, _02256A40 ; =ov04_02256734
	add r1, r5, #0
	mov r2, #0
	bl SysTask_CreateOnMainQueue
	str r0, [r5, #8]
	ldr r0, [r5, #4]
	mov r1, #1
	add r0, #0x54
	bl Field3dObject_SetActiveFlag
	add r1, sp, #4
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [sp]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #4
	bl MapObject_CopyPositionVector
	ldr r0, _02256A44 ; =ov04_0225766C
	ldr r2, _02256A48 ; =ov04_0225766C + 11
	ldr r0, [r0, r4]
	ldrsb r2, [r2, r4]
	lsl r1, r0, #4
	ldr r0, _02256A4C ; =ov04_0225766C + 10
	add r1, #8
	ldrsb r0, [r0, r4]
	lsl r2, r2, #4
	lsl r0, r0, #4
	add r0, r1, r0
	lsl r1, r0, #0xc
	ldr r0, _02256A50 ; =ov04_0225766C + 4
	str r1, [sp, #4]
	ldr r0, [r0, r4]
	lsl r0, r0, #4
	add r0, #8
	add r0, r0, r2
	lsl r3, r0, #0xc
	str r3, [sp, #0xc]
	ldr r0, [r5, #4]
	ldr r2, [sp, #8]
	add r0, #0x54
	bl Field3dObject_SetPosEx
	mov r4, #0
	mov r7, #0x14
_02256A08:
	ldr r0, [r5, #4]
	add r1, r0, #4
	add r0, r4, #0
	mul r0, r7
	add r0, r1, r0
	mov r1, #0
	bl Field3dModelAnimation_FrameSet
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02256A08
	add r0, r6, #0
	add r0, #0xd0
	ldr r0, [r0]
	mov r1, #3
	add r0, r0, #1
	bl _s32_div_f
	add r6, #0xd0
	str r1, [r6]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02256A38: .word 0x00001DB4
_02256A3C: .word ov04_0225766C + 8
_02256A40: .word ov04_02256734
_02256A44: .word ov04_0225766C
_02256A48: .word ov04_0225766C + 11
_02256A4C: .word ov04_0225766C + 10
_02256A50: .word ov04_0225766C + 4
	thumb_func_end ov04_02256950

	thumb_func_start ov04_02256A54
ov04_02256A54: ; 0x02256A54
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r6, r1, #0
	add r7, r0, #0
	add r4, r5, #0
	cmp r6, #0
	bls _02256A84
_02256A62:
	mov r0, #0x14
	mul r0, r4
	mov r1, #1
	add r0, r7, r0
	lsl r1, r1, #0xc
	bl Field3dModelAnimation_FrameAdvanceAndCheck
	cmp r0, #0
	beq _02256A7A
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_02256A7A:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blo _02256A62
_02256A84:
	cmp r5, r6
	bne _02256A8C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02256A8C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov04_02256A54

	thumb_func_start ov04_02256A90
ov04_02256A90: ; 0x02256A90
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0xcc
	mul r0, r1
	add r0, r5, r0
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02256AA6
	bl GF_AssertFail
_02256AA6:
	ldr r1, [r5]
	mov r0, #0xcc
	add r6, r1, #0
	mul r6, r0
	add r4, r5, #4
	mov r0, #1
	str r0, [r4, r6]
	ldr r0, [r5]
	mov r1, #3
	add r0, r0, #1
	bl _s32_div_f
	str r1, [r5]
	add r0, r4, r6
	pop {r4, r5, r6, pc}
	thumb_func_end ov04_02256A90

	thumb_func_start ov04_02256AC4
ov04_02256AC4: ; 0x02256AC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x14
	ldr r2, _02256B30 ; =ov04_0225766C
	mul r0, r1
	add r0, r2, r0
	str r0, [sp]
	ldr r0, _02256B34 ; =0x00001DB4
	ldr r5, _02256B34 ; =0x00001DB4
	add r0, r4, r0
	str r0, [sp, #8]
	mov r7, #0xc
_02256AE2:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	add r0, r1, r0
	mov r1, #0xc
	ldrsb r1, [r0, r1]
	cmp r1, #0
	blt _02256B2C
	mov r1, #0xc
	ldrsb r6, [r0, r1]
	mov r2, #0
_02256AF6:
	add r1, r2, #0
	mul r1, r7
	add r0, r4, r1
	ldrh r3, [r0, r5]
	cmp r3, #0
	beq _02256B14
	ldr r3, _02256B38 ; =0x00001DB6
	ldrsh r0, [r0, r3]
	cmp r0, r6
	bne _02256B14
	ldr r0, [sp, #8]
	add r0, r0, r1
	bl ov04_02256B3C
	b _02256B1E
_02256B14:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #3
	blo _02256AF6
_02256B1E:
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	cmp r0, #6
	blo _02256AE2
_02256B2C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02256B30: .word ov04_0225766C
_02256B34: .word 0x00001DB4
_02256B38: .word 0x00001DB6
	thumb_func_end ov04_02256AC4

	thumb_func_start ov04_02256B3C
ov04_02256B3C: ; 0x02256B3C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	mov r1, #0
	add r0, #0x54
	bl Field3dObject_SetActiveFlag
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0]
	strh r1, [r4]
	sub r0, r1, #1
	strh r0, [r4, #2]
	str r1, [r4, #4]
	ldr r0, [r4, #8]
	bl SysTask_Destroy
	mov r0, #0
	str r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end ov04_02256B3C

    .rodata

ov04_0225766C: ; 0x0225766C
	.word 0x00000004
	.word 0x00000004
	.short 0x0000
	.byte 0x00, 0x00
	.byte 0x01, 0x02
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000005
	.word 0x00000004
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x00, 0x02
	.byte 0x03, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000006
	.word 0x00000004
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x01, 0x03
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000007
	.word 0x00000004
	.short 0x0009
	.byte 0x00, 0x00
	.byte 0x01, 0x02
	.byte 0x05, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x0000000B
	.word 0x00000004
	.short 0x0002
	.byte 0x00, 0x00
	.byte 0x07, 0xFF
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000007
	.word 0x00000005
	.short 0x0006
	.byte 0x00, 0x00
	.byte 0x03, 0x06
	.byte 0x08, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000008
	.word 0x00000005
	.short 0x0000
	.byte 0xFF, 0x00
	.byte 0x03, 0x05
	.byte 0x08, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x0000000B
	.word 0x00000005
	.short 0x0003
	.byte 0x00, 0x00
	.byte 0x04, 0x09
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000007
	.word 0x00000006
	.short 0x0003
	.byte 0x00, 0x00
	.byte 0x03, 0x05
	.byte 0x06, 0x0D
	.byte 0x0F, 0xFF
	.balign 4, 0
	.word 0x0000000B
	.word 0x00000006
	.short 0x0003
	.byte 0x00, 0x00
	.byte 0x04, 0x07
	.byte 0x0E, 0x10
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000001
	.word 0x00000007
	.short 0x0000
	.byte 0x00, 0x00
	.byte 0x0B, 0x0C
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000002
	.word 0x00000007
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x0A, 0x0B
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000003
	.word 0x00000007
	.short 0x0000
	.byte 0xFF, 0x00
	.byte 0x0A, 0x0B
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000007
	.word 0x00000007
	.short 0x0003
	.byte 0x00, 0x00
	.byte 0x05, 0x0D
	.byte 0x0F, 0x11
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x0000000B
	.word 0x00000007
	.short 0x0003
	.byte 0x00, 0x00
	.byte 0x07, 0x10
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000007
	.word 0x00000008
	.short 0x0003
	.byte 0x00, 0x00
	.byte 0x08, 0x0D
	.byte 0x11, 0x12
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x0000000B
	.word 0x00000008
	.short 0x0002
	.byte 0x00, 0xFF
	.byte 0x09, 0x0E
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000007
	.word 0x00000009
	.short 0x000A
	.byte 0x00, 0x00
	.byte 0x0D, 0x12
	.byte 0x13, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000008
	.word 0x00000009
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x0F, 0x11
	.byte 0x13, 0x14
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000009
	.word 0x00000009
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x11, 0x12
	.byte 0x14, 0x19
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x0000000A
	.word 0x00000009
	.short 0x0009
	.byte 0x00, 0x00
	.byte 0x12, 0x13
	.byte 0x19, 0x1B
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000001
	.word 0x0000000A
	.short 0x0002
	.byte 0x00, 0x00
	.byte 0x1A, 0xFF
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000004
	.word 0x0000000A
	.short 0x0000
	.byte 0x00, 0x00
	.byte 0x17, 0x18
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000005
	.word 0x0000000A
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x16, 0x18
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000006
	.word 0x0000000A
	.short 0x0000
	.byte 0xFF, 0x00
	.byte 0x16, 0x17
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x0000000A
	.word 0x0000000A
	.short 0x0003
	.byte 0x00, 0x00
	.byte 0x13, 0x14
	.byte 0x1B, 0x1C
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000001
	.word 0x0000000B
	.short 0x0002
	.byte 0x00, 0xFF
	.byte 0x15, 0xFF
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x0000000A
	.word 0x0000000B
	.short 0x0003
	.byte 0x00, 0x00
	.byte 0x14, 0x19
	.byte 0x1C, 0x23
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x0000000A
	.word 0x0000000C
	.short 0x0003
	.byte 0x00, 0x00
	.byte 0x19, 0x1B
	.byte 0x23, 0x25
	.byte 0x22, 0xFF
	.balign 4, 0
	.word 0x00000004
	.word 0x0000000D
	.short 0x0008
	.byte 0x00, 0x00
	.byte 0x1A, 0x1E
	.byte 0x1F, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000005
	.word 0x0000000D
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x24, 0x1D
	.byte 0x1F, 0x20
	.byte 0x20, 0xFF
	.balign 4, 0
	.word 0x00000006
	.word 0x0000000D
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x1D, 0x1E
	.byte 0x20, 0x21
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000007
	.word 0x0000000D
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x1E, 0x1F
	.byte 0x21, 0x22
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000008
	.word 0x0000000D
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x1F, 0x20
	.byte 0x22, 0x23
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000009
	.word 0x0000000D
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x20, 0x21
	.byte 0x23, 0x1C
	.byte 0x25, 0xFF
	.balign 4, 0
	.word 0x0000000A
	.word 0x0000000D
	.short 0x0007
	.byte 0x00, 0x00
	.byte 0x1B, 0x1C
	.byte 0x25, 0x22
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000004
	.word 0x0000000E
	.short 0x0002
	.byte 0x00, 0xFF
	.byte 0x1D, 0x1E
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x0000000A
	.word 0x0000000E
	.short 0x0002
	.byte 0x00, 0xFF
	.byte 0x1C, 0x22
	.byte 0x23, 0x25
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x0000000B
	.word 0x0000000F
	.short 0x0002
	.byte 0x00, 0x00
	.byte 0x27, 0x2C
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x0000000B
	.word 0x00000010
	.short 0x0003
	.byte 0x00, 0x00
	.byte 0x26, 0x2C
	.byte 0x2E, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000002
	.word 0x00000011
	.short 0x0000
	.byte 0x00, 0x00
	.byte 0x29, 0x2A
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000003
	.word 0x00000011
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x28, 0x2A
	.byte 0x2B, 0x2D
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000004
	.word 0x00000011
	.short 0x0004
	.byte 0x00, 0x00
	.byte 0x28, 0x29
	.byte 0x2B, 0x2D
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000005
	.word 0x00000011
	.short 0x0000
	.byte 0xFF, 0x00
	.byte 0x29, 0x2D
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x0000000B
	.word 0x00000011
	.short 0x0003
	.byte 0x00, 0x00
	.byte 0x26, 0x27
	.byte 0x2E, 0x30
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000004
	.word 0x00000012
	.short 0x0003
	.byte 0x00, 0x00
	.byte 0x29, 0x2B
	.byte 0x2A, 0x2F
	.byte 0x34, 0xFF
	.balign 4, 0
	.word 0x0000000B
	.word 0x00000012
	.short 0x0003
	.byte 0x00, 0x00
	.byte 0x27, 0x2C
	.byte 0x30, 0x3B
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000004
	.word 0x00000013
	.short 0x0003
	.byte 0x00, 0x00
	.byte 0x2A, 0x2D
	.byte 0x33, 0x34
	.byte 0x35, 0xFF
	.balign 4, 0
	.word 0x0000000B
	.word 0x00000013
	.short 0x0003
	.byte 0x00, 0x00
	.byte 0x2C, 0x2E
	.byte 0x3B, 0x3A
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000001
	.word 0x00000014
	.short 0x0000
	.byte 0x00, 0x00
	.byte 0x32, 0x33
	.byte 0xFF, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000002
	.word 0x00000014
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x31, 0x33
	.byte 0x34, 0xFF
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000003
	.word 0x00000014
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x31, 0x32
	.byte 0x34, 0x35
	.byte 0x2F, 0xFF
	.balign 4, 0
	.word 0x00000004
	.word 0x00000014
	.short 0x0005
	.byte 0x00, 0x00
	.byte 0x32, 0x33
	.byte 0x2D, 0x2F
	.byte 0x35, 0x36
	.balign 4, 0
	.word 0x00000005
	.word 0x00000014
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x2F, 0x33
	.byte 0x34, 0x36
	.byte 0x37, 0xFF
	.balign 4, 0
	.word 0x00000006
	.word 0x00000014
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x34, 0x35
	.byte 0x37, 0x38
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000007
	.word 0x00000014
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x35, 0x36
	.byte 0x38, 0x39
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x00000008
	.word 0x00000014
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x36, 0x37
	.byte 0x39, 0x3A
	.byte 0x3B, 0xFF
	.balign 4, 0
	.word 0x00000009
	.word 0x00000014
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x37, 0x38
	.byte 0x3A, 0x3B
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x0000000A
	.word 0x00000014
	.short 0x0001
	.byte 0x00, 0x00
	.byte 0x38, 0x39
	.byte 0x3B, 0x30
	.byte 0xFF, 0xFF
	.balign 4, 0
	.word 0x0000000B
	.word 0x00000014
	.short 0x000B
	.byte 0x00, 0x00
	.byte 0x3A, 0x30
	.byte 0x39, 0x2E
	.byte 0xFF, 0xFF
	.balign 4, 0
	.size ov04_0225766C,.-ov04_0225766C
