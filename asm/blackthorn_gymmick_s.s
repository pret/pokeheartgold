#include "fielddata/script/scr_seq/event_T27GYM0101.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public ov04_02257614
    .public ov04_02257618
    .public ov04_02257620
    .public ov04_0225762C
    .public ov04_02257638
    .public ov04_02257648

	.text

	thumb_func_start DeleteBlackthornPuzzleGimmick
DeleteBlackthornPuzzleGimmick: ; 0x0225507C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x24]
	bl FreeToHeap
	ldr r0, [r4, #4]
	mov r1, #0
	str r1, [r0, #0x24]
	pop {r4, pc}
	thumb_func_end DeleteBlackthornPuzzleGimmick

	thumb_func_start ov04_02255090
ov04_02255090: ; 0x02255090
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	bl SavGymmick_GetType
	cmp r0, #6
	beq _022550A8
	mov r0, #0
	pop {r4, r5, r6, pc}
_022550A8:
	ldr r0, [r5, #4]
	ldr r4, [r0, #0x24]
	cmp r4, #0
	bne _022550B4
	mov r0, #0
	pop {r4, r5, r6, pc}
_022550B4:
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r2, r0, #0
	lsl r1, r6, #0x10
	lsl r2, r2, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl ov04_02255708
	pop {r4, r5, r6, pc}
	thumb_func_end ov04_02255090

	thumb_func_start ov04_022550D4
ov04_022550D4: ; 0x022550D4
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [sp, #0x18]
	mov r6, #0x79
	str r0, [sp, #0x18]
	mov r0, #0
	mov ip, r0
	ldr r0, [sp]
	lsl r6, r6, #2
	ldr r0, [r0, #4]
	add r3, r1, #0
	ldr r0, [r0, #0x24]
	sub r4, r6, #4
	add r7, r0, #4
_022550F0:
	mov r0, #0
	add r1, r7, #0
_022550F4:
	ldr r5, [r1, r4]
	cmp r3, r5
	bne _0225510A
	ldr r5, [r1, r6]
	cmp r2, r5
	bne _0225510A
	ldr r0, [sp, #0x18]
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225510A:
	add r0, r0, #1
	add r1, #8
	cmp r0, #0x12
	blt _022550F4
	mov r0, #0x27
	lsl r0, r0, #4
	add r7, r7, r0
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	cmp r0, #3
	blt _022550F0
	ldr r0, [sp]
	add r1, r3, #0
	bl GetMetatileBehaviorAt
	bl sub_0205BAC4
	cmp r0, #0
	beq _0225513A
	ldr r1, [sp, #0x18]
	mov r0, #1
	str r0, [r1]
	pop {r3, r4, r5, r6, r7, pc}
_0225513A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_022550D4

	thumb_func_start ov04_02255140
ov04_02255140: ; 0x02255140
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	ldr r1, [sp, #0x38]
	ldr r2, [sp, #4]
	str r1, [sp, #0x38]
	str r2, [r1, #8]
	ldr r2, [sp, #8]
	str r2, [r1, #0xc]
	ldr r1, [sp, #4]
	add r2, r1, #1
	ldr r1, [sp, #0x38]
	str r2, [r1, #0x10]
	ldr r2, [sp, #8]
	str r2, [r1, #0x14]
	ldr r1, [sp, #4]
	sub r7, r1, #1
	ldr r1, [sp, #0x38]
	cmp r0, #1
	str r7, [r1, #0x18]
	ldr r2, [sp, #8]
	str r2, [r1, #0x1c]
	ldr r2, [sp, #4]
	str r2, [r1, #0x20]
	ldr r2, [sp, #8]
	str r2, [r1, #0x24]
	bne _0225517C
	b _022552D6
_0225517C:
	mov r0, #0
	str r0, [r1]
	mov r2, #5
	strb r2, [r1, #4]
	mov r2, #7
	strb r2, [r1, #5]
	ldr r1, [sp, #4]
	ldr r4, [sp, #0x38]
	str r1, [sp, #0x1c]
	ldr r1, [sp, #8]
	str r1, [sp, #0x20]
	ldr r1, [sp, #4]
	add r3, r1, #3
	ldr r1, [sp, #8]
	str r3, [sp, #0x1c]
	sub r2, r1, #2
	str r2, [sp, #0x20]
_0225519E:
	add r1, r2, r0
	str r3, [r4, #0x28]
	str r1, [r4, #0x2c]
	add r0, r0, #1
	add r4, #8
	cmp r0, #7
	blt _0225519E
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	mov r4, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	sub r2, r0, #3
	ldr r0, [sp, #8]
	str r2, [sp, #0x1c]
	sub r1, r0, #2
	str r1, [sp, #0x20]
_022551C4:
	add r0, r1, r4
	str r2, [r3, #0x68]
	str r0, [r3, #0x6c]
	add r4, r4, #1
	add r3, #8
	cmp r4, #7
	blt _022551C4
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	mov r3, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	sub r1, r0, #2
	ldr r0, [sp, #8]
	str r1, [sp, #0x1c]
	add r0, r0, #5
	str r0, [sp, #0x20]
_022551EA:
	add r4, r2, #0
	add r4, #0xa8
	str r1, [r4]
	add r4, r2, #0
	add r4, #0xac
	str r0, [r4]
	add r4, r2, #0
	add r4, #0xa8
	ldr r4, [r4]
	add r5, r4, r3
	add r4, r2, #0
	add r4, #0xa8
	add r3, r3, #1
	add r2, #8
	str r5, [r4]
	cmp r3, #5
	blt _022551EA
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	mov r3, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	sub r1, r0, #2
	ldr r0, [sp, #8]
	str r1, [sp, #0x1c]
	sub r0, r0, #3
	str r0, [sp, #0x20]
_02255224:
	add r4, r2, #0
	add r4, #0xd0
	str r1, [r4]
	add r4, r2, #0
	add r4, #0xd4
	str r0, [r4]
	add r4, r2, #0
	add r4, #0xd0
	ldr r4, [r4]
	add r5, r4, r3
	add r4, r2, #0
	add r4, #0xd0
	add r3, r3, #1
	add r2, #8
	str r5, [r4]
	cmp r3, #5
	blt _02255224
	ldr r0, [sp, #4]
	mov r6, #0
	sub r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	str r6, [sp, #0x10]
	add r4, r0, #4
_02255254:
	ldr r0, [sp, #0xc]
	str r4, [sp, #0x20]
	str r0, [sp, #0x1c]
	sub r2, r0, r6
	ldr r0, [sp, #0x10]
	str r2, [sp, #0x1c]
	lsl r1, r0, #3
	ldr r0, [sp, #0x38]
	mov r3, #0
	add r5, r0, r1
_02255268:
	add r0, r5, #0
	add r0, #0xf8
	str r2, [r0]
	add r0, r5, #0
	add r0, #0xfc
	str r4, [r0]
	add r0, r5, #0
	add r0, #0xfc
	ldr r0, [r0]
	sub r1, r0, r3
	add r0, r5, #0
	add r0, #0xfc
	add r3, r3, #1
	add r5, #8
	str r1, [r0]
	cmp r3, #7
	blt _02255268
	ldr r0, [sp, #0x10]
	add r6, r6, #1
	add r0, r0, #7
	str r0, [sp, #0x10]
	cmp r6, #2
	blt _02255254
	ldr r0, [sp, #0x38]
	mov r4, #0
	ldrb r3, [r0, #4]
	cmp r3, #0
	ble _022552D4
	ldr r0, [sp, #4]
	add r2, r0, #3
	ldr r0, [sp, #8]
	str r2, [sp, #0x1c]
	sub r1, r0, #2
	str r1, [sp, #0x20]
	cmp r3, #0
	ble _022552D4
	mov r6, #0x6f
	lsl r6, r6, #2
	ldr r3, [sp, #0x38]
	add r0, r6, #0
_022552B8:
	mov r5, #0x6e
	lsl r5, r5, #2
	str r2, [r3, r5]
	add r5, r5, #4
	str r1, [r3, r5]
	ldr r5, [r3, r6]
	add r5, r5, r4
	str r5, [r3, r0]
	ldr r5, [sp, #0x38]
	add r4, r4, #1
	ldrb r5, [r5, #4]
	add r3, #8
	cmp r4, r5
	blt _022552B8
_022552D4:
	b _02255432
_022552D6:
	ldr r0, [sp, #0x38]
	mov r1, #1
	str r1, [r0]
	mov r1, #4
	strb r1, [r0, #4]
	mov r1, #8
	strb r1, [r0, #5]
	ldr r0, [sp, #4]
	ldr r4, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	mov r3, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	add r2, r0, #2
	ldr r0, [sp, #8]
	str r2, [sp, #0x1c]
	sub r1, r0, #2
	str r1, [sp, #0x20]
_022552FC:
	add r0, r1, r3
	str r2, [r4, #0x28]
	str r0, [r4, #0x2c]
	add r3, r3, #1
	add r4, #8
	cmp r3, #8
	blt _022552FC
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	mov r4, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	sub r2, r0, #3
	ldr r0, [sp, #8]
	str r2, [sp, #0x1c]
	sub r1, r0, #2
	str r1, [sp, #0x20]
_02255322:
	add r0, r1, r4
	str r2, [r3, #0x68]
	str r0, [r3, #0x6c]
	add r4, r4, #1
	add r3, #8
	cmp r4, #8
	blt _02255322
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	mov r3, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	sub r1, r0, #2
	ldr r0, [sp, #8]
	str r1, [sp, #0x1c]
	add r0, r0, #6
	str r0, [sp, #0x20]
_02255348:
	add r4, r2, #0
	add r4, #0xa8
	str r1, [r4]
	add r4, r2, #0
	add r4, #0xac
	str r0, [r4]
	add r4, r2, #0
	add r4, #0xa8
	ldr r4, [r4]
	add r5, r4, r3
	add r4, r2, #0
	add r4, #0xa8
	add r3, r3, #1
	add r2, #8
	str r5, [r4]
	cmp r3, #4
	blt _02255348
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	mov r3, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #4]
	sub r1, r0, #2
	ldr r0, [sp, #8]
	str r1, [sp, #0x1c]
	sub r0, r0, #3
	str r0, [sp, #0x20]
_02255382:
	add r4, r2, #0
	add r4, #0xd0
	str r1, [r4]
	add r4, r2, #0
	add r4, #0xd4
	str r0, [r4]
	add r4, r2, #0
	add r4, #0xd0
	ldr r4, [r4]
	add r5, r4, r3
	add r4, r2, #0
	add r4, #0xd0
	add r3, r3, #1
	add r2, #8
	str r5, [r4]
	cmp r3, #4
	blt _02255382
	ldr r0, [sp, #4]
	mov r6, #0
	sub r0, r0, #4
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	str r6, [sp, #0x18]
	add r4, r0, #5
_022553B2:
	ldr r0, [sp, #0x14]
	str r4, [sp, #0x20]
	str r0, [sp, #0x1c]
	sub r2, r0, r6
	ldr r0, [sp, #0x18]
	str r2, [sp, #0x1c]
	lsl r1, r0, #3
	ldr r0, [sp, #0x38]
	mov r3, #0
	add r5, r0, r1
_022553C6:
	add r0, r5, #0
	add r0, #0xf8
	str r2, [r0]
	add r0, r5, #0
	add r0, #0xfc
	str r4, [r0]
	add r0, r5, #0
	add r0, #0xfc
	ldr r0, [r0]
	sub r1, r0, r3
	add r0, r5, #0
	add r0, #0xfc
	add r3, r3, #1
	add r5, #8
	str r1, [r0]
	cmp r3, #8
	blt _022553C6
	ldr r0, [sp, #0x18]
	add r6, r6, #1
	add r0, #8
	str r0, [sp, #0x18]
	cmp r6, #3
	blt _022553B2
	ldr r0, [sp, #0x38]
	mov r4, #0
	ldrb r3, [r0, #4]
	cmp r3, #0
	ble _02255432
	ldr r0, [sp, #4]
	add r2, r0, #3
	ldr r0, [sp, #8]
	str r2, [sp, #0x1c]
	sub r1, r0, #2
	str r1, [sp, #0x20]
	cmp r3, #0
	ble _02255432
	mov r6, #0x6f
	lsl r6, r6, #2
	ldr r3, [sp, #0x38]
	add r0, r6, #0
_02255416:
	mov r5, #0x6e
	lsl r5, r5, #2
	str r2, [r3, r5]
	add r5, r5, #4
	str r1, [r3, r5]
	ldr r5, [r3, r6]
	add r5, r5, r4
	str r5, [r3, r0]
	ldr r5, [sp, #0x38]
	add r4, r4, #1
	ldrb r5, [r5, #4]
	add r3, #8
	cmp r4, r5
	blt _02255416
_02255432:
	ldr r0, [sp, #8]
	mov r6, #0x1e
	sub r2, r0, #1
	mov r1, #0
	lsl r6, r6, #4
	str r7, [sp, #0x1c]
	str r2, [sp, #0x20]
	mov ip, r1
	add r4, r6, #4
_02255444:
	ldr r3, [sp, #0x38]
	lsl r5, r1, #3
	mov r0, #0
	add r5, r3, r5
_0225544C:
	add r3, r7, r0
	str r3, [r5, r6]
	str r2, [r5, r4]
	add r0, r0, #1
	add r5, #8
	cmp r0, #3
	blt _0225544C
	mov r0, ip
	add r0, r0, #1
	add r1, r1, #3
	add r2, r2, #1
	mov ip, r0
	cmp r0, #6
	blt _02255444
	ldr r1, [sp]
	ldr r0, [sp, #0x38]
	ldr r3, [sp, #0x38]
	strb r1, [r0, #6]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl ov04_022554FC
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02255140

	thumb_func_start ov04_02255480
ov04_02255480: ; 0x02255480
	push {r4, r5}
	ldr r4, [r3]
	ldr r3, [r3, #4]
	ldr r5, [sp, #8]
	sub r4, r4, r1
	sub r3, r3, r2
	cmp r0, #1
	beq _0225549C
	cmp r0, #2
	beq _022554A4
	cmp r0, #3
	beq _022554AE
	pop {r4, r5}
	bx lr
_0225549C:
	neg r0, r3
	str r0, [r5]
	str r4, [r5, #4]
	b _022554B4
_022554A4:
	neg r0, r4
	str r0, [r5]
	neg r0, r3
	str r0, [r5, #4]
	b _022554B4
_022554AE:
	str r3, [r5]
	neg r0, r4
	str r0, [r5, #4]
_022554B4:
	ldr r0, [r5]
	add r0, r0, r1
	str r0, [r5]
	ldr r0, [r5, #4]
	add r0, r0, r2
	str r0, [r5, #4]
	pop {r4, r5}
	bx lr
	thumb_func_end ov04_02255480

	thumb_func_start ov04_022554C4
ov04_022554C4: ; 0x022554C4
	push {r3, r4}
	mov r4, #0
	cmp r1, #0
	ble _022554DA
_022554CC:
	ldr r3, [r2]
	add r4, r4, #1
	add r3, r3, r0
	str r3, [r2]
	add r2, #8
	cmp r4, r1
	blt _022554CC
_022554DA:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov04_022554C4

	thumb_func_start ov04_022554E0
ov04_022554E0: ; 0x022554E0
	push {r3, r4}
	mov r4, #0
	cmp r1, #0
	ble _022554F6
_022554E8:
	ldr r3, [r2, #4]
	add r4, r4, #1
	add r3, r3, r0
	str r3, [r2, #4]
	add r2, #8
	cmp r4, r1
	blt _022554E8
_022554F6:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov04_022554E0

	thumb_func_start ov04_022554FC
ov04_022554FC: ; 0x022554FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r5, r0, #0
	ldr r0, [r3]
	add r4, r1, #0
	add r6, r2, #0
	str r3, [sp, #4]
	cmp r0, #0
	bne _0225551C
	mov r0, #0xe
	str r0, [sp, #0x44]
	mov r0, #5
	str r0, [sp, #0x20]
	mov r0, #7
	str r0, [sp, #0x24]
	b _02255528
_0225551C:
	mov r0, #0x18
	str r0, [sp, #0x44]
	mov r0, #4
	str r0, [sp, #0x20]
	mov r0, #8
	str r0, [sp, #0x24]
_02255528:
	ldr r3, [sp, #4]
	add r0, r5, #0
	add r3, #0x10
	add r1, r4, #0
	add r2, r6, #0
	str r3, [sp]
	bl ov04_02255480
	ldr r3, [sp, #4]
	add r0, r5, #0
	add r3, #0x18
	add r1, r4, #0
	add r2, r6, #0
	str r3, [sp]
	bl ov04_02255480
	mov r0, #0
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	ble _0225557A
	ldr r7, [sp, #4]
	add r7, #0x28
	str r7, [sp, #0x28]
_02255558:
	ldr r3, [sp, #0x28]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x28]
	add r7, #8
	add r0, #8
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x48]
	add r1, r0, #1
	ldr r0, [sp, #0x24]
	str r1, [sp, #0x48]
	cmp r1, r0
	blt _02255558
_0225557A:
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	ble _022555AC
	ldr r7, [sp, #4]
	add r7, #0x68
	str r7, [sp, #0x2c]
_0225558A:
	ldr r3, [sp, #0x2c]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x2c]
	add r7, #8
	add r0, #8
	str r0, [sp, #0x2c]
	ldr r0, [sp, #8]
	add r1, r0, #1
	ldr r0, [sp, #0x24]
	str r1, [sp, #8]
	cmp r1, r0
	blt _0225558A
_022555AC:
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	ble _022555DE
	ldr r7, [sp, #4]
	add r7, #0xa8
	str r7, [sp, #0x30]
_022555BC:
	ldr r3, [sp, #0x30]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x30]
	add r7, #8
	add r0, #8
	str r0, [sp, #0x30]
	ldr r0, [sp, #0xc]
	add r1, r0, #1
	ldr r0, [sp, #0x20]
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _022555BC
_022555DE:
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	ble _02255610
	ldr r7, [sp, #4]
	add r7, #0xd0
	str r7, [sp, #0x34]
_022555EE:
	ldr r3, [sp, #0x34]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x34]
	add r7, #8
	add r0, #8
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x10]
	add r1, r0, #1
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _022555EE
_02255610:
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x44]
	cmp r0, #0
	ble _02255642
	ldr r7, [sp, #4]
	add r7, #0xf8
	str r7, [sp, #0x38]
_02255620:
	ldr r3, [sp, #0x38]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x38]
	add r7, #8
	add r0, #8
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x14]
	add r1, r0, #1
	ldr r0, [sp, #0x44]
	str r1, [sp, #0x14]
	cmp r1, r0
	blt _02255620
_02255642:
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	ble _02255678
	mov r1, #0x6e
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	add r7, r0, r1
	str r7, [sp, #0x3c]
_02255656:
	ldr r3, [sp, #0x3c]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x3c]
	add r7, #8
	add r0, #8
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x18]
	add r1, r0, #1
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x18]
	cmp r1, r0
	blt _02255656
_02255678:
	mov r0, #0
	str r0, [sp, #0x1c]
	mov r1, #0x1e
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	add r7, r0, r1
	str r7, [sp, #0x40]
_02255686:
	ldr r3, [sp, #0x40]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	str r7, [sp]
	bl ov04_02255480
	ldr r0, [sp, #0x40]
	add r7, #8
	add r0, #8
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #0x12
	blt _02255686
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_022554FC

	thumb_func_start ov04_022556AC
ov04_022556AC: ; 0x022556AC
	push {r4, r5, r6, r7}
	mov r6, #0x27
	mov r4, #0
	lsl r6, r6, #4
_022556B4:
	add r5, r4, #0
	mul r5, r6
	add r5, r0, r5
	ldr r7, [r5, #0xc]
	cmp r1, r7
	bne _022556CE
	ldr r7, [r5, #0x10]
	cmp r2, r7
	bne _022556CE
	strb r4, [r3]
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_022556CE:
	ldr r7, [r5, #0x14]
	cmp r1, r7
	bne _022556E2
	ldr r7, [r5, #0x18]
	cmp r2, r7
	bne _022556E2
	strb r4, [r3]
	mov r0, #2
	pop {r4, r5, r6, r7}
	bx lr
_022556E2:
	ldr r7, [r5, #0x1c]
	cmp r1, r7
	bne _022556F6
	ldr r5, [r5, #0x20]
	cmp r2, r5
	bne _022556F6
	strb r4, [r3]
	mov r0, #3
	pop {r4, r5, r6, r7}
	bx lr
_022556F6:
	add r4, r4, #1
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
	cmp r4, #3
	blo _022556B4
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end ov04_022556AC

	thumb_func_start ov04_02255708
ov04_02255708: ; 0x02255708
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r3, sp, #0
	add r5, r0, #0
	bl ov04_022556AC
	add r6, r0, #0
	bne _0225571E
	add sp, #4
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_0225571E:
	mov r0, #0xb
	mov r1, #0x74
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	ldr r0, [r5]
	add r2, r4, #0
	str r0, [r4, #0x70]
	mov r1, #0
	add r2, #0x4c
	str r1, [r4]
	add r0, sp, #0
	ldrb r3, [r0]
	cmp r6, #1
	strb r3, [r2]
	str r6, [r4, #0x50]
	beq _0225574A
	cmp r6, #2
	beq _02255762
	cmp r6, #3
	beq _022557AA
	b _022557F2
_0225574A:
	mov r0, #8
	str r0, [r4]
	ldr r0, _022557F8 ; =SEQ_SE_GS_GONDORA_IDOU
	bl PlaySE
	ldr r0, [r5]
	ldr r1, _022557FC ; =ov04_02255AC4
	add r2, r4, #0
	bl FieldSys_CreateTask
	mov r1, #1
	b _022557F2
_02255762:
	add r2, r4, #0
	str r1, [r4]
	add r2, #0x4d
	strb r1, [r2]
	ldrb r2, [r0]
	mov r3, #0x27
	lsl r3, r3, #4
	add r6, r2, #0
	mul r6, r3
	add r2, r5, r6
	ldrb r6, [r2, #8]
	add r2, r4, #0
	add r2, #0x4e
	strb r6, [r2]
	ldrb r0, [r0]
	add r2, r0, #0
	mul r2, r3
	add r0, r5, r2
	ldrb r0, [r0, #0xa]
	bl ov04_022558B4
	add r1, r4, #0
	add r1, #0x58
	str r0, [r4, #0x54]
	bl ov04_022558D0
	ldr r0, _022557F8 ; =SEQ_SE_GS_GONDORA_IDOU
	bl PlaySE
	ldr r0, [r5]
	ldr r1, _02255800 ; =ov04_022559C8
	add r2, r4, #0
	bl FieldSys_CreateTask
	mov r1, #1
	b _022557F2
_022557AA:
	add r2, r4, #0
	str r1, [r4]
	add r2, #0x4d
	strb r1, [r2]
	ldrb r1, [r0]
	mov r2, #0x27
	lsl r2, r2, #4
	add r3, r1, #0
	mul r3, r2
	add r1, r5, r3
	ldrb r3, [r1, #8]
	add r1, r4, #0
	add r1, #0x4e
	strb r3, [r1]
	ldrb r0, [r0]
	add r1, r0, #0
	mul r1, r2
	add r0, r5, r1
	ldrb r0, [r0, #0xa]
	mov r1, #1
	bl ov04_022558B4
	add r1, r4, #0
	add r1, #0x58
	str r0, [r4, #0x54]
	bl ov04_022558D0
	ldr r0, _022557F8 ; =SEQ_SE_GS_GONDORA_IDOU
	bl PlaySE
	ldr r0, [r5]
	ldr r1, _02255800 ; =ov04_022559C8
	add r2, r4, #0
	bl FieldSys_CreateTask
	mov r1, #1
_022557F2:
	add r0, r1, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_022557F8: .word SEQ_SE_GS_GONDORA_IDOU
_022557FC: .word ov04_02255AC4
_02255800: .word ov04_022559C8
	thumb_func_end ov04_02255708

	thumb_func_start ov04_02255804
ov04_02255804: ; 0x02255804
	push {r4, r5}
	ldr r2, [r1, #0x50]
	cmp r2, #2
	beq _02255814
	cmp r2, #3
	beq _02255836
	pop {r4, r5}
	bx lr
_02255814:
	ldrb r2, [r0, #5]
	mov r4, #0
	cmp r2, #0
	ble _02255854
	add r5, r0, #0
_0225581E:
	ldr r3, [r5, #0x28]
	ldr r2, [r5, #0x2c]
	add r4, r4, #1
	str r3, [r1, #4]
	str r2, [r1, #8]
	ldrb r2, [r0, #5]
	add r5, #8
	add r1, #8
	cmp r4, r2
	blt _0225581E
	pop {r4, r5}
	bx lr
_02255836:
	ldrb r2, [r0, #5]
	mov r5, #0
	cmp r2, #0
	ble _02255854
	add r4, r0, #0
_02255840:
	ldr r3, [r4, #0x68]
	ldr r2, [r4, #0x6c]
	add r5, r5, #1
	str r3, [r1, #4]
	str r2, [r1, #8]
	ldrb r2, [r0, #5]
	add r4, #8
	add r1, #8
	cmp r5, r2
	blt _02255840
_02255854:
	pop {r4, r5}
	bx lr
	thumb_func_end ov04_02255804

	thumb_func_start ov04_02255858
ov04_02255858: ; 0x02255858
	push {r3, lr}
	add r2, r1, #0
	add r3, r0, #0
	ldr r0, [r2, #0x54]
	cmp r0, #3
	bhi _022558B2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02255870: ; jump table
	.short _02255878 - _02255870 - 2 ; case 0
	.short _02255886 - _02255870 - 2 ; case 1
	.short _02255894 - _02255870 - 2 ; case 2
	.short _022558A4 - _02255870 - 2 ; case 3
_02255878:
	lsl r1, r3, #0x18
	mov r0, #1
	lsr r1, r1, #0x18
	add r2, r2, #4
	bl ov04_022554C4
	pop {r3, pc}
_02255886:
	lsl r1, r3, #0x18
	mov r0, #1
	lsr r1, r1, #0x18
	add r2, r2, #4
	bl ov04_022554E0
	pop {r3, pc}
_02255894:
	mov r0, #0
	lsl r1, r3, #0x18
	mvn r0, r0
	lsr r1, r1, #0x18
	add r2, r2, #4
	bl ov04_022554C4
	pop {r3, pc}
_022558A4:
	mov r0, #0
	lsl r1, r3, #0x18
	mvn r0, r0
	lsr r1, r1, #0x18
	add r2, r2, #4
	bl ov04_022554E0
_022558B2:
	pop {r3, pc}
	thumb_func_end ov04_02255858

	thumb_func_start ov04_022558B4
ov04_022558B4: ; 0x022558B4
	cmp r1, #0
	bne _022558BC
	mov r1, #0
	b _022558BE
_022558BC:
	mov r1, #2
_022558BE:
	add r0, r1, r0
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	bx lr
	.balign 4, 0
	thumb_func_end ov04_022558B4

	thumb_func_start ov04_022558D0
ov04_022558D0: ; 0x022558D0
	mov r2, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	cmp r0, #3
	bhi _0225590A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022558E8: ; jump table
	.short _022558F0 - _022558E8 - 2 ; case 0
	.short _022558F8 - _022558E8 - 2 ; case 1
	.short _02255900 - _022558E8 - 2 ; case 2
	.short _02255906 - _022558E8 - 2 ; case 3
_022558F0:
	mov r0, #2
	lsl r0, r0, #0xe
	str r0, [r1]
	bx lr
_022558F8:
	mov r0, #2
	lsl r0, r0, #0xe
	str r0, [r1, #8]
	bx lr
_02255900:
	ldr r0, _0225590C ; =0xFFFF8000
	str r0, [r1]
	bx lr
_02255906:
	ldr r0, _0225590C ; =0xFFFF8000
	str r0, [r1, #8]
_0225590A:
	bx lr
	.balign 4, 0
_0225590C: .word 0xFFFF8000
	thumb_func_end ov04_022558D0

	thumb_func_start ov04_02255910
ov04_02255910: ; 0x02255910
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xff
	add r7, r1, #0
	add r4, r2, #0
	mov r6, #0
	str r0, [sp]
	cmp r7, #0
	ble _0225595A
_02255922:
	ldr r1, [r4]
	ldr r2, [r4, #4]
	add r0, r5, #0
	bl sub_020548C0
	cmp r0, #0
	beq _02255938
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	b _0225595A
_02255938:
	ldr r1, [r4]
	ldr r2, [r4, #4]
	add r0, r5, #0
	bl GetMetatileBehaviorAt
	bl sub_0205BAC4
	cmp r0, #0
	bne _02255952
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	b _0225595A
_02255952:
	add r6, r6, #1
	add r4, #8
	cmp r6, r7
	blt _02255922
_0225595A:
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02255910

	thumb_func_start ov04_02255960
ov04_02255960: ; 0x02255960
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	mov r0, #1
	lsl r0, r0, #0xe
	add r7, r1, #0
	add r5, r2, #0
	mov r4, #0
	str r3, [sp]
	str r0, [sp, #4]
	cmp r7, #0
	ble _022559C0
_02255978:
	ldr r1, [r5]
	ldr r2, [r5, #4]
	add r0, r6, #0
	bl sub_020548C0
	cmp r0, #0
	bne _0225599E
	ldr r1, [r5]
	ldr r2, [r5, #4]
	add r0, r6, #0
	bl GetMetatileBehaviorAt
	bl sub_0205BAC4
	cmp r0, #0
	bne _0225599C
	mov r0, #1
	b _0225599E
_0225599C:
	mov r0, #0
_0225599E:
	cmp r0, #0
	beq _022559B8
	ldr r0, [sp]
	ldrb r0, [r0, r4]
	lsl r1, r0, #8
	mov r0, #1
	lsl r0, r0, #0xe
	cmp r1, r0
	bge _022559B8
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	b _022559C0
_022559B8:
	add r4, r4, #1
	add r5, #8
	cmp r4, r7
	blt _02255978
_022559C0:
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02255960

	thumb_func_start ov04_022559C8
ov04_022559C8: ; 0x022559C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r6, #4]
	ldr r5, [r0, #0x24]
	ldr r0, [r4]
	cmp r0, #0
	beq _022559F0
	cmp r0, #3
	beq _02255A16
	cmp r0, #7
	beq _02255AA2
	b _02255AB6
_022559F0:
	add r0, r4, #0
	add r0, #0x4c
	ldrb r1, [r0]
	mov r0, #0x27
	lsl r0, r0, #4
	mul r0, r1
	add r2, r5, #4
	add r0, r2, r0
	add r1, r4, #0
	bl ov04_02255804
	ldr r0, _02255ABC ; =ov04_02255D88
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	mov r0, #1
	str r0, [r4]
	b _02255AB6
_02255A16:
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r0, r6, #0
	add r1, r5, r1
	add r0, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r0]
	bl BgModelList_GetEventByIndex
	add r1, r0, #0
	add r0, sp, #8
	bl BgModel_GetPosition
	ldr r1, [sp, #8]
	asr r0, r1, #0xf
	lsr r0, r0, #0x10
	add r0, r1, r0
	asr r0, r0, #0x10
	ldr r1, [sp, #0x10]
	str r0, [sp, #4]
	asr r0, r1, #0xf
	lsr r0, r0, #0x10
	add r0, r1, r0
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	asr r7, r0, #0x10
	add r0, r5, #4
	mul r1, r2
	add r5, r0, r1
	add r0, r6, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #6
	bl SavGymmick_AssertMagic_GetData
	ldr r1, [sp, #4]
	lsl r1, r1, #0x10
	lsr r2, r1, #0x10
	add r1, r4, #0
	add r1, #0x4c
	ldrb r1, [r1]
	lsl r1, r1, #1
	strh r2, [r0, r1]
	lsl r1, r7, #0x10
	lsr r3, r1, #0x10
	add r1, r4, #0
	add r1, #0x4c
	ldrb r1, [r1]
	lsl r1, r1, #1
	add r0, r0, r1
	strh r3, [r0, #6]
	add r0, r4, #0
	str r5, [sp]
	add r0, #0x4c
	ldrb r0, [r0]
	ldrb r1, [r5, #6]
	bl ov04_02255140
	mov r0, #7
	str r0, [r4]
	b _02255AB6
_02255AA2:
	ldr r0, _02255AC0 ; =SEQ_SE_GS_GONDORA_IDOU
	mov r1, #0
	bl StopSE
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02255AB6:
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02255ABC: .word ov04_02255D88
_02255AC0: .word SEQ_SE_GS_GONDORA_IDOU
	thumb_func_end ov04_022559C8

	thumb_func_start ov04_02255AC4
ov04_02255AC4: ; 0x02255AC4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r5, #4]
	ldr r6, [r0, #0x24]
	ldr r0, [r4]
	sub r0, #8
	cmp r0, #4
	bhi _02255BA4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02255AEE: ; jump table
	.short _02255AF8 - _02255AEE - 2 ; case 0
	.short _02255B64 - _02255AEE - 2 ; case 1
	.short _02255C26 - _02255AEE - 2 ; case 2
	.short _02255C64 - _02255AEE - 2 ; case 3
	.short _02255C9E - _02255AEE - 2 ; case 4
_02255AF8:
	add r0, r4, #0
	add r0, #0x4c
	ldrb r3, [r0]
	mov r0, #0x27
	lsl r0, r0, #4
	add r1, r3, #0
	mul r1, r0
	add r0, r4, #0
	add r2, r6, #4
	add r1, r2, r1
	mov r3, #0
	add r0, #0x4f
	strb r3, [r0]
	add r0, r5, #0
	add r2, sp, #0
	bl ov04_02255CBC
	cmp r0, #2
	bne _02255B24
	mov r0, #9
	str r0, [r4]
	b _02255CB0
_02255B24:
	cmp r0, #1
	bne _02255B5E
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r1, r6, r1
	add r5, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r5]
	bl BgModelList_GetEventByIndex
	bl ov01_021F3B08
	add r1, sp, #0
	ldrh r1, [r1]
	str r1, [r4, #0x68]
	ldr r0, [r0, #4]
	str r0, [r4, #0x6c]
	mov r0, #0
	str r0, [r4, #0x64]
	mov r0, #0xa
	str r0, [r4]
	ldr r0, _02255CB4 ; =SEQ_SE_GS_GONDORA_KABEHIT
	bl PlaySE
	b _02255CB0
_02255B5E:
	mov r0, #0xc
	str r0, [r4]
	b _02255CB0
_02255B64:
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r0, r5, #0
	add r1, r6, r1
	add r0, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r0]
	bl BgModelList_GetEventByIndex
	bl ov01_021F3B08
	mov r1, #1
	ldr r2, [r0, #4]
	lsl r1, r1, #0xa
	sub r1, r2, r1
	str r1, [r0, #4]
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #0x10
	bhs _02255BA6
_02255BA4:
	b _02255CB0
_02255BA6:
	add r0, r4, #0
	add r0, #0x4c
	ldrb r1, [r0]
	mov r0, #0x27
	lsl r0, r0, #4
	mul r0, r1
	add r2, r6, #4
	add r7, r2, r0
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_GetGymmickPtr
	mov r1, #6
	bl SavGymmick_AssertMagic_GetData
	add r3, r0, #0
	mov ip, r0
	add r0, r4, #0
	add r0, #0x4c
	ldrb r2, [r0]
	add r3, #0xc
	ldrb r0, [r3, r2]
	add r0, r0, #1
	lsr r1, r0, #0x1f
	lsl r6, r0, #0x1e
	sub r6, r6, r1
	mov r0, #0x1e
	ror r6, r0
	add r0, r1, r6
	strb r0, [r3, r2]
	add r0, r4, #0
	add r0, #0x4c
	ldrb r1, [r0]
	mov r0, ip
	add r0, r0, r1
	ldrb r0, [r0, #0xc]
	strb r0, [r7, #6]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	bl MapObject_GetCurrentX
	add r5, r0, #0
	add r0, r6, #0
	bl MapObject_GetCurrentY
	add r2, r0, #0
	lsl r1, r5, #0x10
	lsl r2, r2, #0x10
	mov r0, #1
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	add r3, r7, #0
	bl ov04_022554FC
	mov r0, #0xc
	str r0, [r4]
	b _02255CB0
_02255C26:
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r1, r6, r1
	add r5, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r5]
	bl BgModelList_GetEventByIndex
	bl ov01_021F3B08
	mov r1, #1
	ldr r2, [r0, #4]
	lsl r1, r1, #0xa
	sub r2, r2, r1
	str r2, [r0, #4]
	ldr r2, [r4, #0x64]
	add r1, r2, r1
	str r1, [r4, #0x64]
	ldr r2, [r4, #0x68]
	cmp r1, r2
	blt _02255CB0
	ldr r1, [r4, #0x6c]
	sub r1, r1, r2
	str r1, [r0, #4]
	mov r0, #0xb
	str r0, [r4]
	b _02255CB0
_02255C64:
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r1, r6, r1
	add r5, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r5]
	bl BgModelList_GetEventByIndex
	bl ov01_021F3B08
	mov r1, #1
	ldr r2, [r0, #4]
	lsl r1, r1, #0xa
	add r2, r2, r1
	str r2, [r0, #4]
	ldr r2, [r4, #0x64]
	sub r1, r2, r1
	str r1, [r4, #0x64]
	cmp r1, #0
	bgt _02255CB0
	ldr r1, [r4, #0x6c]
	str r1, [r0, #4]
	mov r0, #0xc
	str r0, [r4]
	b _02255CB0
_02255C9E:
	ldr r0, _02255CB8 ; =SEQ_SE_GS_GONDORA_IDOU
	mov r1, #0
	bl StopSE
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02255CB0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02255CB4: .word SEQ_SE_GS_GONDORA_KABEHIT
_02255CB8: .word SEQ_SE_GS_GONDORA_IDOU
	thumb_func_end ov04_02255AC4

	thumb_func_start ov04_02255CBC
ov04_02255CBC: ; 0x02255CBC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldrb r1, [r4, #4]
	add r6, r2, #0
	add r5, r0, #0
	sub r2, r1, #1
	lsl r2, r2, #0x18
	lsr r7, r2, #0x18
	add r2, r4, #0
	add r2, #0xa8
	bl ov04_02255910
	cmp r0, #0xff
	beq _02255CDC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02255CDC:
	ldrb r1, [r4, #4]
	add r2, r4, #0
	add r0, r5, #0
	add r2, #0xd0
	bl ov04_02255910
	cmp r0, #0xff
	beq _02255CF0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02255CF0:
	ldrb r1, [r4, #5]
	add r2, r4, #0
	add r0, r5, #0
	add r2, #0x68
	bl ov04_02255910
	cmp r0, #0xff
	beq _02255D04
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02255D04:
	add r2, r4, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, #0x28
	bl ov04_02255910
	cmp r0, #0xff
	beq _02255D18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02255D18:
	add r0, r5, #0
	add r1, r4, #0
	bl ov04_02255D34
	mov r1, #1
	lsl r1, r1, #0xe
	cmp r0, r1
	bhs _02255D2E
	strh r0, [r6]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02255D2E:
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov04_02255CBC

	thumb_func_start ov04_02255D34
ov04_02255D34: ; 0x02255D34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	bne _02255D48
	mov r1, #0xe
	ldr r3, _02255D78 ; =ov04_02257638
	ldr r4, _02255D7C ; =ov04_02257618
	b _02255D4E
_02255D48:
	ldr r3, _02255D80 ; =ov04_02257648
	ldr r4, _02255D84 ; =ov04_02257614
	mov r1, #0x18
_02255D4E:
	ldrb r0, [r5, #4]
	add r2, r5, #0
	add r2, #0xf8
	str r0, [sp]
	add r0, r7, #0
	bl ov04_02255960
	mov r2, #0x6e
	lsl r2, r2, #2
	add r6, r0, #0
	ldr r1, [sp]
	add r0, r7, #0
	add r2, r5, r2
	add r3, r4, #0
	bl ov04_02255960
	cmp r6, r0
	bhi _02255D74
	add r0, r6, #0
_02255D74:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02255D78: .word ov04_02257638
_02255D7C: .word ov04_02257618
_02255D80: .word ov04_02257648
_02255D84: .word ov04_02257614
	thumb_func_end ov04_02255D34

	thumb_func_start ov04_02255D88
ov04_02255D88: ; 0x02255D88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r4, r1, #0
	ldr r6, [r4, #0x70]
	add r7, r0, #0
	ldr r1, [r6, #4]
	ldr r5, [r1, #0x24]
	ldr r1, [r4]
	cmp r1, #6
	bhi _02255E5C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02255DA8: ; jump table
	.short _02255FB8 - _02255DA8 - 2 ; case 0
	.short _02255DB6 - _02255DA8 - 2 ; case 1
	.short _02255DEA - _02255DA8 - 2 ; case 2
	.short _02255FB8 - _02255DA8 - 2 ; case 3
	.short _02255EDE - _02255DA8 - 2 ; case 4
	.short _02255EEC - _02255DA8 - 2 ; case 5
	.short _02255F1C - _02255DA8 - 2 ; case 6
_02255DB6:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4f
	strb r1, [r0]
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r1, r5, r1
	ldrb r1, [r1, #9]
	add r0, r6, #0
	add r2, r4, #4
	bl ov04_02255910
	cmp r0, #0xff
	bne _02255DE2
	mov r0, #2
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255DE2:
	mov r0, #4
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255DEA:
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r0, r6, #0
	add r1, r5, r1
	add r0, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r0]
	bl BgModelList_GetEventByIndex
	str r0, [sp]
	ldr r1, [sp]
	add r0, sp, #0x34
	bl BgModel_GetPosition
	add r0, sp, #0x34
	add r1, r4, #0
	add r1, #0x58
	add r2, r0, #0
	bl VEC_Add
	ldr r0, [sp]
	add r1, sp, #0x34
	bl BgModel_SetPosition
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #0x28
	add r6, r0, #0
	bl MapObject_GetPositionVec
	add r0, sp, #0x28
	add r1, r4, #0
	add r1, #0x58
	add r2, r0, #0
	bl VEC_Add
	add r0, r6, #0
	add r1, sp, #0x28
	bl MapObject_SetPositionVec
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #2
	bhs _02255E5E
_02255E5C:
	b _02255FB8
_02255E5E:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4c
	ldrb r1, [r0]
	mov r0, #0x27
	lsl r0, r0, #4
	mul r0, r1
	add r0, r5, r0
	ldrb r0, [r0, #9]
	add r1, r4, #0
	bl ov04_02255858
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r1, r0
	blo _02255ED6
	add r0, r6, #0
	add r1, sp, #0x1c
	bl MapObject_GetPositionVec
	ldr r2, [sp, #0x1c]
	add r0, r6, #0
	asr r1, r2, #0xf
	lsr r1, r1, #0x10
	add r1, r2, r1
	asr r1, r1, #0x10
	bl MapObject_SetCurrentX
	ldr r2, [sp, #0x24]
	add r0, r6, #0
	asr r1, r2, #0xf
	lsr r1, r1, #0x10
	add r1, r2, r1
	asr r1, r1, #0x10
	bl MapObject_SetCurrentY
	add r0, r6, #0
	bl sub_02060F78
	add r0, r7, #0
	bl DestroySysTask
	mov r0, #3
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255ED6:
	mov r0, #1
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255EDE:
	ldr r0, _02255FBC ; =SEQ_SE_GS_GONDORA_KABEHIT
	bl PlaySE
	mov r0, #5
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255EEC:
	add r1, r4, #0
	add r1, #0x4d
	ldrb r1, [r1]
	cmp r1, #0
	bne _02255F02
	bl DestroySysTask
	mov r0, #7
	add sp, #0x40
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255F02:
	ldr r1, [r4, #0x58]
	mov r0, #0
	mvn r0, r0
	add r2, r1, #0
	mul r2, r0
	str r2, [r4, #0x58]
	ldr r1, [r4, #0x60]
	add sp, #0x40
	mul r0, r1
	str r0, [r4, #0x60]
	mov r0, #6
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02255F1C:
	add r1, r4, #0
	add r1, #0x4c
	ldrb r2, [r1]
	mov r1, #0x27
	lsl r1, r1, #4
	mul r1, r2
	add r0, r6, #0
	add r1, r5, r1
	add r0, #0x9c
	ldrb r1, [r1, #0xb]
	ldr r0, [r0]
	bl BgModelList_GetEventByIndex
	add r5, r0, #0
	add r0, sp, #0x10
	add r1, r5, #0
	bl BgModel_GetPosition
	add r0, sp, #0x10
	add r1, r4, #0
	add r1, #0x58
	add r2, r0, #0
	bl VEC_Add
	add r0, r5, #0
	add r1, sp, #0x10
	bl BgModel_SetPosition
	ldr r0, [r6, #0x40]
	bl PlayerAvatar_GetMapObject
	add r1, sp, #4
	add r5, r0, #0
	bl MapObject_GetPositionVec
	add r0, sp, #4
	add r1, r4, #0
	add r1, #0x58
	add r2, r0, #0
	bl VEC_Add
	add r0, r5, #0
	add r1, sp, #4
	bl MapObject_SetPositionVec
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #2
	blo _02255FB8
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	bne _02255FB8
	add r0, r7, #0
	bl DestroySysTask
	mov r0, #7
	str r0, [r4]
_02255FB8:
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02255FBC: .word SEQ_SE_GS_GONDORA_KABEHIT
	thumb_func_end ov04_02255D88
