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
	.include "global.inc"

	.text

	thumb_func_start ov01_021F3610
ov01_021F3610: ; 0x021F3610
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #7
	lsl r0, r0, #8
	mov r4, #0
	str r1, [r6, r0]
	add r7, r4, #0
_021F361E:
	mov r0, #0x38
	mul r0, r4
	add r5, r6, r0
	add r0, r5, #0
	bl ov01_021F3668
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	str r7, [r5, #0x10]
	cmp r4, #0x20
	blo _021F361E
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F3610

	thumb_func_start ov01_021F3638
ov01_021F3638: ; 0x021F3638
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r1, _021F365C ; =0x00000704
	bl AllocFromHeap
	add r4, r0, #0
	ldr r2, _021F365C ; =0x00000704
	mov r0, #0
	add r1, r4, #0
	bl MIi_CpuClearFast
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021F3610
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021F365C: .word 0x00000704
	thumb_func_end ov01_021F3638

	thumb_func_start ov01_021F3660
ov01_021F3660: ; 0x021F3660
	ldr r3, _021F3664 ; =FreeToHeap
	bx r3
	.balign 4, 0
_021F3664: .word FreeToHeap
	thumb_func_end ov01_021F3660

	thumb_func_start ov01_021F3668
ov01_021F3668: ; 0x021F3668
	push {r3, r4, r5}
	sub sp, #0xc
	add r3, r0, #0
	add r2, sp, #0
	mov r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	str r0, [r2, #8]
	str r0, [r3]
	str r0, [r3, #4]
	str r0, [r3, #8]
	add r4, r3, #0
	add r5, r2, #0
	str r0, [r3, #0xc]
	ldmia r5!, {r0, r1}
	add r4, #0x14
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	add r5, r2, #0
	str r0, [r4]
	add r4, r3, #0
	ldmia r5!, {r0, r1}
	add r4, #0x20
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	add r3, #0x2c
	str r0, [r4]
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	add sp, #0xc
	pop {r3, r4, r5}
	bx lr
	thumb_func_end ov01_021F3668

	thumb_func_start ov01_021F36AC
ov01_021F36AC: ; 0x021F36AC
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	add r6, r0, #0
	add r7, r4, #0
_021F36B4:
	mov r0, #0x38
	mul r0, r4
	add r5, r6, r0
	add r0, r5, #0
	bl ov01_021F3668
	mov r0, #7
	lsl r0, r0, #8
	ldr r0, [r6, r0]
	ldr r1, [r5, #0x10]
	bl ov01_0220411C
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	str r7, [r5, #0x10]
	cmp r4, #0x20
	blo _021F36B4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021F36AC

	thumb_func_start ov01_021F36DC
ov01_021F36DC: ; 0x021F36DC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0x20
	blt _021F36EC
	bl GF_AssertFail
_021F36EC:
	add r3, sp, #0
	mov r1, #0
	str r1, [r3]
	str r1, [r3, #4]
	mov r0, #0x38
	add r7, r5, #0
	mul r7, r0
	str r1, [r3, #8]
	add r2, r4, r7
	str r1, [r4, r7]
	str r1, [r2, #4]
	str r1, [r2, #8]
	add r5, r2, #0
	add r6, r3, #0
	str r1, [r2, #0xc]
	ldmia r6!, {r0, r1}
	add r5, #0x14
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r6, r3, #0
	str r0, [r5]
	add r5, r2, #0
	ldmia r6!, {r0, r1}
	add r5, #0x20
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r2, #0x2c
	str r0, [r5]
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r5, r4, #0
	str r0, [r2]
	mov r0, #0x38
	add r5, #0x10
	lsl r0, r0, #5
	ldr r0, [r4, r0]
	ldr r1, [r5, r7]
	bl ov01_0220411C
	mov r0, #0
	str r0, [r5, r7]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F36DC

	thumb_func_start ov01_021F3744
ov01_021F3744: ; 0x021F3744
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0
	add r4, r1, #0
	add r7, r2, #0
	str r0, [sp, #4]
	cmp r4, #0
	beq _021F3774
	mov r0, #4
	bl AllocFromHeapAtEnd
	str r0, [sp, #4]
	ldr r2, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl NARC_ReadFile
	add r0, r4, #0
	mov r1, #0x30
	bl _u32_div_f
	str r0, [sp]
	b _021F3776
_021F3774:
	str r0, [sp]
_021F3776:
	ldr r5, [sp, #4]
	mov r6, #0
	add r4, r7, #0
_021F377C:
	ldr r0, [sp]
	cmp r6, r0
	bhs _021F37E0
	ldr r0, [r5]
	add r2, r4, #0
	str r0, [r4]
	mov r0, #1
	str r0, [r4, #4]
	mov r0, #0
	add r3, r5, #4
	str r0, [r4, #0xc]
	ldmia r3!, {r0, r1}
	add r2, #0x14
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r3, r5, #0
	str r0, [r2]
	add r3, #0x10
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x20
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r3, r5, #0
	str r0, [r2]
	add r3, #0x1c
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x2c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #7
	lsl r0, r0, #8
	ldr r0, [r7, r0]
	ldr r1, [r4]
	bl ov01_02204154
	cmp r0, #0
	bne _021F37D0
	mov r0, #0
	str r0, [r4]
_021F37D0:
	mov r0, #7
	lsl r0, r0, #8
	ldr r0, [r7, r0]
	ldr r1, [r4]
	bl ov01_022040F8
	str r0, [r4, #0x10]
	b _021F381C
_021F37E0:
	mov r1, #0
	add r0, sp, #8
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	add r0, r1, #0
	str r0, [r4]
	str r0, [r4, #4]
	add r2, r4, #0
	add r3, sp, #8
	str r0, [r4, #0xc]
	ldmia r3!, {r0, r1}
	add r2, #0x14
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r3, sp, #8
	str r0, [r2]
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x20
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r3, sp, #8
	str r0, [r2]
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x2c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
_021F381C:
	add r6, r6, #1
	add r4, #0x38
	add r5, #0x30
	cmp r6, #0x20
	blt _021F377C
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _021F3830
	bl FreeToHeap
_021F3830:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021F3744

	thumb_func_start ov01_021F3834
ov01_021F3834: ; 0x021F3834
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r0, [sp, #0x48]
	add r4, r3, #0
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x4c]
	str r1, [sp]
	str r0, [sp, #0x4c]
	ldrb r0, [r4, #1]
	str r0, [sp, #0x10]
	cmp r0, #0x1e
	bls _021F3854
	bl GF_AssertFail
	mov r0, #0
	str r0, [sp, #0x10]
_021F3854:
	ldr r3, _021F3A34 ; =ov01_02206A84
	mov r0, #0
	str r0, [sp, #0xc]
	ldmia r3!, {r0, r1}
	add r2, sp, #0x18
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp]
	str r0, [sp, #8]
_021F3868:
	add r2, sp, #0x24
	mov r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	ldr r3, [sp, #0xc]
	ldr r1, [sp, #0x10]
	str r0, [r2, #8]
	cmp r3, r1
	blo _021F38AC
	ldr r1, [sp, #8]
	add r5, r2, #0
	str r0, [r1]
	str r0, [r1, #4]
	add r3, r1, #0
	str r0, [r1, #0xc]
	ldmia r5!, {r0, r1}
	add r3, #0x14
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r3, [sp, #8]
	ldmia r2!, {r0, r1}
	add r3, #0x20
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	ldr r2, [sp, #8]
	str r0, [r3]
	add r3, sp, #0x18
	ldmia r3!, {r0, r1}
	add r2, #0x2c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	b _021F3A1C
_021F38AC:
	ldrb r1, [r4, #2]
	ldr r2, [sp, #0x4c]
	add r0, sp, #0x14
	bl sub_02097268
	add r1, sp, #0x14
	ldrb r2, [r1]
	ldr r0, [sp, #8]
	str r2, [r0]
	ldrb r0, [r1, #1]
	ldrb r5, [r4, #4]
	lsl r1, r0, #0x1c
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1d
	str r0, [sp, #4]
	lsr r6, r1, #0x1d
	ldr r1, [sp, #4]
	mov r0, #2
	sub r1, r0, r1
	lsl r2, r1, #3
	ldrb r1, [r4, #5]
	add r0, #0xfe
	lsl r1, r1, #4
	add r1, r2, r1
	ldrb r2, [r4, #3]
	lsl r1, r1, #0x10
	asr r7, r1, #0x10
	lsl r1, r6, #3
	lsl r2, r2, #4
	add r1, r1, r2
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	sub r0, r1, r0
	cmp r0, #0
	ble _021F3904
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021F3912
_021F3904:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021F3912:
	bl _ffix
	ldr r1, [sp, #8]
	cmp r5, #0
	str r0, [r1, #0x14]
	ble _021F3930
	lsl r0, r5, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021F393E
_021F3930:
	lsl r0, r5, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021F393E:
	bl _ffix
	ldr r1, [sp, #8]
	str r0, [r1, #0x18]
	mov r0, #1
	lsl r0, r0, #8
	sub r0, r7, r0
	cmp r0, #0
	ble _021F3962
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021F3970
_021F3962:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021F3970:
	bl _ffix
	ldr r1, [sp, #8]
	add r3, sp, #0x24
	add r2, r1, #0
	str r0, [r1, #0x1c]
	ldmia r3!, {r0, r1}
	add r2, #0x20
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r3, sp, #0x18
	str r0, [r2]
	ldr r2, [sp, #8]
	ldmia r3!, {r0, r1}
	add r2, #0x2c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #1
	str r0, [r2]
	ldr r0, [sp, #8]
	str r1, [r0, #4]
	mov r1, #0
	str r1, [r0, #0xc]
	ldrb r7, [r4, #5]
	ldr r0, [sp, #4]
	sub r0, r7, r0
	cmp r7, r0
	ble _021F39EE
	lsl r0, r7, #5
	mov ip, r0
	ldr r0, _021F3A38 ; =0x00008023
	add r3, sp, #0x14
_021F39B0:
	ldrb r1, [r4, #3]
	add r2, r1, r6
	cmp r1, r2
	bge _021F39D8
	mov r2, ip
	lsl r5, r2, #1
	ldr r2, [sp, #0x48]
	add r5, r2, r5
	lsl r2, r1, #1
	add r2, r5, r2
_021F39C4:
	strh r0, [r2]
	ldrb r5, [r3, #1]
	add r1, r1, #1
	add r2, r2, #2
	lsl r5, r5, #0x1c
	lsr r6, r5, #0x1d
	ldrb r5, [r4, #3]
	add r5, r6, r5
	cmp r1, r5
	blt _021F39C4
_021F39D8:
	mov r1, ip
	ldrb r2, [r3, #1]
	sub r1, #0x20
	mov ip, r1
	lsl r2, r2, #0x19
	ldrb r1, [r4, #5]
	lsr r2, r2, #0x1d
	sub r7, r7, #1
	sub r1, r1, r2
	cmp r7, r1
	bgt _021F39B0
_021F39EE:
	mov r1, #7
	ldr r0, [sp]
	lsl r1, r1, #8
	ldr r0, [r0, r1]
	ldr r1, [sp, #8]
	ldr r1, [r1]
	bl ov01_02204154
	cmp r0, #0
	bne _021F3A08
	ldr r0, [sp, #8]
	mov r1, #0
	str r1, [r0]
_021F3A08:
	mov r1, #7
	ldr r0, [sp]
	lsl r1, r1, #8
	ldr r0, [r0, r1]
	ldr r1, [sp, #8]
	ldr r1, [r1]
	bl ov01_022040F8
	ldr r1, [sp, #8]
	str r0, [r1, #0x10]
_021F3A1C:
	ldr r0, [sp, #8]
	add r4, r4, #4
	add r0, #0x38
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x20
	bge _021F3A30
	b _021F3868
_021F3A30:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F3A34: .word ov01_02206A84
_021F3A38: .word 0x00008023
	thumb_func_end ov01_021F3834

	thumb_func_start ov01_021F3A3C
ov01_021F3A3C: ; 0x021F3A3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	ldr r4, _021F3AFC ; =ov01_02206A90
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	add r6, r0, #0
	str r1, [sp, #8]
	add r3, sp, #0x18
	mov r2, #4
_021F3A4E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021F3A4E
	ldr r0, [r4]
	ldr r5, [sp, #0x60]
	str r0, [r3]
	mov r7, #0
_021F3A5E:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021F3AEE
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _021F3AEE
	add r4, r5, #0
	add r4, #0x14
	ldmia r4!, {r0, r1}
	add r3, sp, #0x3c
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	ldr r1, [sp, #0x3c]
	ldr r0, [r6]
	add r3, r5, #0
	add r0, r1, r0
	str r0, [sp, #0x3c]
	ldr r1, [sp, #0x44]
	ldr r0, [r6, #8]
	add r3, #0x2c
	add r0, r1, r0
	str r0, [sp, #0x44]
	ldr r0, [r5, #0x10]
	add r1, r2, #0
	ldr r0, [r0, #0x54]
	add r2, sp, #0x18
	bl sub_0201F990
	cmp r0, #0
	beq _021F3AEE
	ldr r0, [sp, #8]
	bl ov01_021FB9F4
	add r4, r0, #0
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _021F3AB8
	ldr r1, [r5, #0x10]
	ldr r0, [sp, #0x10]
	ldr r1, [r1, #0x54]
	ldr r2, _021F3B00 ; =0x00000F33
	bl ov01_021EA9B0
_021F3AB8:
	ldr r0, [r5]
	add r1, r4, #0
	add r2, sp, #0x14
	bl ov01_021EA7F8
	add r0, sp, #0x14
	ldrh r0, [r0]
	add r1, sp, #0x3c
	cmp r0, #0
	bne _021F3ADA
	add r3, r5, #0
	ldr r0, [r5, #0x10]
	add r2, sp, #0x18
	add r3, #0x2c
	bl Draw3dModel
	b _021F3AEE
_021F3ADA:
	str r4, [sp]
	ldr r0, [r5]
	add r3, r5, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	add r2, sp, #0x18
	ldr r0, [r0, #0x54]
	add r3, #0x2c
	bl ov01_021F3B84
_021F3AEE:
	add r7, r7, #1
	add r5, #0x38
	cmp r7, #0x20
	blt _021F3A5E
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3AFC: .word ov01_02206A90
_021F3B00: .word 0x00000F33
	thumb_func_end ov01_021F3A3C

	thumb_func_start ov01_021F3B04
ov01_021F3B04: ; 0x021F3B04
	add r0, #0x2c
	bx lr
	thumb_func_end ov01_021F3B04

	thumb_func_start ov01_021F3B08
ov01_021F3B08: ; 0x021F3B08
	add r0, #0x20
	bx lr
	thumb_func_end ov01_021F3B08

	thumb_func_start ov01_021F3B0C
ov01_021F3B0C: ; 0x021F3B0C
	add r2, r1, #0
	add r2, #0x14
	add r3, r0, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end ov01_021F3B0C

	thumb_func_start ov01_021F3B1C
ov01_021F3B1C: ; 0x021F3B1C
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x14
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end ov01_021F3B1C

	thumb_func_start ov01_021F3B2C
ov01_021F3B2C: ; 0x021F3B2C
	str r1, [r0, #8]
	bx lr
	thumb_func_end ov01_021F3B2C

	thumb_func_start ov01_021F3B30
ov01_021F3B30: ; 0x021F3B30
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov01_021F3B30

	thumb_func_start ov01_021F3B34
ov01_021F3B34: ; 0x021F3B34
	ldr r0, [r0]
	bx lr
	thumb_func_end ov01_021F3B34

	thumb_func_start ov01_021F3B38
ov01_021F3B38: ; 0x021F3B38
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end ov01_021F3B38

	thumb_func_start ov01_021F3B3C
ov01_021F3B3C: ; 0x021F3B3C
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #0x54]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F3B3C

	thumb_func_start ov01_021F3B44
ov01_021F3B44: ; 0x021F3B44
	mov r2, #0x38
	mul r2, r1
	add r0, r0, r2
	bx lr
	thumb_func_end ov01_021F3B44

	thumb_func_start ov01_021F3B4C
ov01_021F3B4C: ; 0x021F3B4C
	mov r3, #0
_021F3B4E:
	ldr r2, [r0]
	cmp r2, r1
	beq _021F3B5E
	add r3, r3, #1
	add r0, #0x38
	cmp r3, #0x20
	blt _021F3B4E
	mov r0, #0
_021F3B5E:
	bx lr
	thumb_func_end ov01_021F3B4C

	thumb_func_start ov01_021F3B60
ov01_021F3B60: ; 0x021F3B60
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x20
	blt _021F3B6E
	bl GF_AssertFail
_021F3B6E:
	mov r0, #0x38
	mul r0, r4
	add r4, r5, r0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _021F3B7E
	bl GF_AssertFail
_021F3B7E:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021F3B60

	thumb_func_start ov01_021F3B84
ov01_021F3B84: ; 0x021F3B84
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, r1, #0
	add r4, r2, #0
	add r5, r3, #0
	bl NNS_G3dGlbSetBaseTrans
	ldr r1, _021F3C04 ; =NNS_G3dGlb + 0xBC
	add r0, r4, #0
	bl MI_Copy36B
	ldr r1, _021F3C08 ; =NNS_G3dGlb + 0x80
	mov r0, #0xa4
	ldr r2, [r1, #0x7c]
	bic r2, r0
	add r0, r5, #0
	str r2, [r1, #0x7c]
	bl NNS_G3dGlbSetBaseScale
	bl NNS_G3dGlbFlushP
	add r2, sp, #0
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	add r2, #2
	add r3, sp, #0
	bl ov01_021EA804
	add r0, sp, #0
	ldrh r0, [r0]
	ldr r1, [sp, #0x18]
	bl ov01_021EA81C
	add r6, r0, #0
	add r0, sp, #0
	ldrh r0, [r0, #2]
	mov r5, #0xff
	mov r4, #0
	cmp r0, #0
	ble _021F3C00
_021F3BD4:
	lsl r0, r4, #2
	add r2, r6, r0
	ldrh r0, [r6, r0]
	cmp r5, r0
	beq _021F3BE6
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	mov r3, #1
	b _021F3BE8
_021F3BE6:
	mov r3, #0
_021F3BE8:
	ldrh r2, [r2, #2]
	add r0, r7, #0
	add r1, r5, #0
	bl NNS_G3dDraw1Mat1Shp
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, sp, #0
	ldrh r0, [r0, #2]
	cmp r4, r0
	blt _021F3BD4
_021F3C00:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3C04: .word NNS_G3dGlb + 0xBC
_021F3C08: .word NNS_G3dGlb + 0x80
	thumb_func_end ov01_021F3B84

	thumb_func_start ov01_021F3C0C
ov01_021F3C0C: ; 0x021F3C0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r4, _021F3C98 ; =ov01_02206A78
	add r7, r2, #0
	add r6, r0, #0
	mov ip, r1
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	add r3, sp, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r4, #0
	str r0, [r3]
	mov r0, #0x38
_021F3C28:
	add r1, r4, #0
	mul r1, r0
	add r5, r6, r1
	ldr r1, [r5, #4]
	cmp r1, #0
	bne _021F3C84
	mov r0, #1
	str r0, [r5, #4]
	add r3, r5, #0
	add r3, #0x14
	ldmia r7!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r7]
	cmp r2, #0
	str r0, [r3]
	beq _021F3C5A
	mov r0, #1
	str r0, [r5, #0xc]
	add r3, r5, #0
	ldmia r2!, {r0, r1}
	add r3, #0x20
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	b _021F3C5E
_021F3C5A:
	mov r0, #0
	str r0, [r5, #0xc]
_021F3C5E:
	add r2, sp, #0
	add r3, r5, #0
	ldmia r2!, {r0, r1}
	add r3, #0x2c
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	mov r1, ip
	str r0, [r3]
	mov r0, ip
	str r0, [r5]
	mov r0, #7
	lsl r0, r0, #8
	ldr r0, [r6, r0]
	bl ov01_022040F8
	str r0, [r5, #0x10]
	add sp, #0xc
	add r0, r4, #0
	pop {r4, r5, r6, r7, pc}
_021F3C84:
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #0x20
	blo _021F3C28
	bl GF_AssertFail
	mov r0, #0x20
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F3C98: .word ov01_02206A78
	thumb_func_end ov01_021F3C0C

	thumb_func_start ov01_021F3C9C
ov01_021F3C9C: ; 0x021F3C9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	ldr r4, _021F3D34 ; =ov01_02206AB4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r3, sp, #0x14
	mov r2, #4
_021F3CAA:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021F3CAA
	ldr r0, [r4]
	mov r4, #0
	str r0, [r3]
	add r7, sp, #0x14
_021F3CBA:
	mov r0, #0x38
	add r1, r4, #0
	mul r1, r0
	ldr r0, [sp, #8]
	add r5, r0, r1
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _021F3D24
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _021F3D24
	ldr r0, [sp, #0xc]
	bl ov01_021FB9F4
	add r6, r0, #0
	ldr r0, [r5]
	add r1, r6, #0
	add r2, sp, #0x10
	bl ov01_021EA7F8
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _021F3CF2
	add r1, r5, #0
	add r0, r7, #0
	add r1, #0x20
	bl sub_02020D2C
_021F3CF2:
	add r0, sp, #0x10
	ldrh r0, [r0]
	cmp r0, #0
	bne _021F3D0C
	add r1, r5, #0
	ldr r0, [r5, #0x10]
	add r5, #0x2c
	add r1, #0x14
	add r2, r7, #0
	add r3, r5, #0
	bl Draw3dModel
	b _021F3D24
_021F3D0C:
	str r6, [sp]
	ldr r0, [r5]
	add r1, r5, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	add r5, #0x2c
	ldr r0, [r0, #0x54]
	add r1, #0x14
	add r2, r7, #0
	add r3, r5, #0
	bl ov01_021F3B84
_021F3D24:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0x20
	blo _021F3CBA
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3D34: .word ov01_02206AB4
	thumb_func_end ov01_021F3C9C

	.rodata

ov01_02206A78: ; 0x02206A78
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00

ov01_02206A84: ; 0x02206A84
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov01_02206A90: ; 0x02206A90
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00

ov01_02206AB4: ; 0x02206AB4
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
