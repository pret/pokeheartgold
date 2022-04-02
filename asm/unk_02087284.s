#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public _020FA484
	.public gNatureStatMods

	.text

	thumb_func_start sub_02087284
sub_02087284: ; 0x02087284
	push {r0, r1, r2, r3}
	push {r4, lr}
	ldr r4, [sp, #0xc]
	mov r1, #0x42
	add r0, r4, #0
	lsl r1, r1, #2
	bl AllocFromHeap
	ldr r1, [sp, #8]
	mov r3, #0
	str r1, [r0, #0x10]
	ldr r1, [sp, #0x10]
	str r4, [r0, #0x14]
	str r1, [r0, #0x18]
	ldr r1, [sp, #0x14]
	mov r2, #0xf
	str r1, [r0, #0x1c]
	ldr r1, [sp, #0x18]
	str r1, [r0, #0x20]
	ldr r1, [sp, #0x1c]
	str r1, [r0, #4]
	ldr r1, [sp, #0x20]
	str r1, [r0, #8]
	ldr r1, [sp, #0x24]
	str r1, [r0, #0xc]
	add r1, r0, #0
	add r1, #0xe4
	str r3, [r1]
	add r1, r0, #0
	add r1, #0xfc
	str r2, [r1]
	add r1, r2, #0
	add r1, #0xf1
	str r2, [r0, r1]
	add r1, r0, #0
	add r1, #0xf4
	str r3, [r1]
	add r1, r0, #0
	add r1, #0xf0
	str r3, [r1]
	pop {r4}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end sub_02087284

	thumb_func_start sub_020872DC
sub_020872DC: ; 0x020872DC
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r1, #0
	mov r1, #0
	add r4, r2, #0
	add r6, r3, #0
	str r1, [sp]
	str r1, [sp, #4]
	bl _fflt
	add r1, r4, #0
	bl _fsub
	str r0, [sp, #8]
	add r0, r5, #0
	bl _fflt
	add r1, r6, #0
	bl _fsub
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	add r1, r0, #0
	bl _fmul
	add r4, r0, #0
	ldr r0, [sp, #0xc]
	add r1, r0, #0
	bl _fmul
	add r1, r0, #0
	add r0, r4, #0
	bl _fadd
	mov r1, #0
	add r4, r0, #0
	bl _fgr
	ldr r0, _020873D0 ; =0x45800000
	bls _02087344
	add r1, r4, #0
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02087352
_02087344:
	add r1, r4, #0
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02087352:
	bl _ffix
	bl FX_Sqrt
	bl _fflt
	ldr r1, _020873D0 ; =0x45800000
	bl _fdiv
	ldr r1, [sp, #0x30]
	add r4, r0, #0
	bl _fls
	blo _0208738A
	add r1, sp, #0x18
	mov r0, #0x1c
	ldrsh r0, [r1, r0]
	bl _fflt
	add r1, r4, #0
	bl _fgr
	bhi _0208738A
	mov r0, #0
	add r1, r4, #0
	bl _feq
	bne _02087390
_0208738A:
	add sp, #0x18
	mov r0, #0
	pop {r4, r5, r6, pc}
_02087390:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x30]
	bl _fmul
	add r1, r4, #0
	bl _fdiv
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x30]
	bl _fmul
	add r1, r4, #0
	bl _fdiv
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	ldr r1, [sp]
	bl _fadd
	ldr r1, [sp, #0x28]
	str r0, [r1]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #4]
	bl _fadd
	ldr r1, [sp, #0x2c]
	str r0, [r1]
	mov r0, #1
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_020873D0: .word 0x45800000
	thumb_func_end sub_020872DC

	thumb_func_start sub_020873D4
sub_020873D4: ; 0x020873D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	add r6, r1, #0
	add r0, r6, #0
	add r0, #0xf0
	ldr r0, [r0]
	cmp r0, #0
	bne _020873E6
	b _02087632
_020873E6:
	ldr r0, [r6, #0x10]
	mov r4, #0
	str r4, [sp, #0x1c]
	cmp r0, #0
	bgt _020873F2
	b _02087632
_020873F2:
	add r0, r6, #0
	mov r7, #0x3f
	str r0, [sp, #0x30]
	add r0, #0xec
	add r5, r6, #0
	lsl r7, r7, #0x18
	str r0, [sp, #0x30]
_02087400:
	cmp r4, #0
	beq _02087410
	mov r0, #0x18
	ldrsh r0, [r5, r0]
	strh r0, [r5, #0x28]
	mov r0, #0x1a
	ldrsh r0, [r5, r0]
	strh r0, [r5, #0x2a]
_02087410:
	ldr r0, [r5, #0x24]
	ldr r3, [r6, #0x20]
	add r1, sp, #0x4c
	add r2, sp, #0x48
	bl sub_0200DF70
	ldr r0, [sp, #0x4c]
	bl _fflt
	ldr r1, _02087638 ; =0x45800000
	bl _fdiv
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x48]
	bl _fflt
	ldr r1, _02087638 ; =0x45800000
	bl _fdiv
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	sub r0, r4, r0
	bl _fflt
	add r1, r0, #0
	add r0, r7, #0
	bl _fmul
	add r1, r0, #0
	mov r0, #0x41
	lsl r0, r0, #0x18
	bl _fsub
	mov r1, #1
	lsl r1, r1, #0x1e
	bl _fdiv
	add r1, sp, #0x44
	str r1, [sp]
	add r1, sp, #0x40
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #0x28
	mov r1, #0x2a
	ldrsh r0, [r5, r0]
	ldrsh r1, [r5, r1]
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	bl sub_020872DC
	cmp r0, #0
	beq _020874EE
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	bne _020874EE
	ldr r0, [sp, #0x40]
	mov r1, #0
	bl _fgr
	ldr r0, _02087638 ; =0x45800000
	bls _020874A0
	ldr r1, [sp, #0x40]
	bl _fmul
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	str r0, [sp, #0x14]
	b _020874AE
_020874A0:
	ldr r1, [sp, #0x40]
	bl _fmul
	add r1, r7, #0
	bl _fsub
	str r0, [sp, #0x14]
_020874AE:
	ldr r0, [sp, #0x44]
	mov r1, #0
	bl _fgr
	ldr r0, _02087638 ; =0x45800000
	bls _020874CA
	ldr r1, [sp, #0x44]
	bl _fmul
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	b _020874D6
_020874CA:
	ldr r1, [sp, #0x44]
	bl _fmul
	add r1, r7, #0
	bl _fsub
_020874D6:
	bl _ffix
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x14]
	bl _ffix
	add r2, r0, #0
	ldr r0, [r5, #0x24]
	ldr r1, [sp, #0x28]
	bl sub_0200DEDC
	b _02087626
_020874EE:
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _020874FA
	cmp r0, #1
	beq _020875CA
	b _02087620
_020874FA:
	add r1, sp, #0x3c
	ldr r0, [r5, #0x24]
	ldr r3, [r6, #0x20]
	add r1, #2
	add r2, sp, #0x3c
	bl sub_0200DE94
	add r0, r6, #0
	add r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #0x18]
	cmp r0, #0xff
	bne _0208758E
	add r0, r6, #0
	add r0, #0xe8
	str r4, [r0]
	mov r0, #0x28
	add r2, sp, #0x3c
	mov r1, #2
	ldrsh r0, [r6, r0]
	ldrsh r1, [r2, r1]
	sub r0, r0, r1
	cmp r0, #0
	ble _0208753C
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	str r0, [sp, #0x10]
	b _0208754A
_0208753C:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r7, #0
	bl _fsub
	str r0, [sp, #0x10]
_0208754A:
	mov r0, #0x2a
	add r2, sp, #0x3c
	mov r1, #0
	ldrsh r0, [r6, r0]
	ldrsh r1, [r2, r1]
	sub r0, r0, r1
	cmp r0, #0
	ble _0208756A
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	add r0, r7, #0
	bl _fadd
	b _02087576
_0208756A:
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r7, #0
	bl _fsub
_02087576:
	bl _ffix
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x10]
	bl _ffix
	add r1, r0, #0
	ldr r0, [sp, #0x2c]
	bl FX_Atan2Idx
	str r0, [r5, #0x30]
	b _020875AC
_0208758E:
	mov r0, #0x2d
	ldr r1, [r6, #0x10]
	lsl r0, r0, #4
	bl _s32_div_f
	ldr r1, [sp, #0x18]
	add r2, r6, #0
	lsl r1, r1, #4
	add r2, #0xec
	add r1, r6, r1
	ldr r2, [r2]
	ldr r1, [r1, #0x30]
	mul r2, r0
	sub r0, r1, r2
	str r0, [r5, #0x30]
_020875AC:
	mov r1, #0x2d
	ldr r0, [r5, #0x30]
	lsl r1, r1, #4
	bl _s32_div_f
	ldr r0, [sp, #0x30]
	str r1, [r5, #0x30]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x30]
	str r1, [r0]
	ldr r0, [r5, #0x2c]
	add r0, r0, #1
	str r0, [r5, #0x2c]
	b _02087620
_020875CA:
	ldr r0, [r5, #0x30]
	mov r1, #0x2d
	add r0, r0, #4
	lsl r1, r1, #4
	str r0, [r5, #0x30]
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	str r1, [r5, #0x30]
	bl GF_SinDeg
	mov r1, #0x28
	ldrsh r1, [r6, r1]
	lsl r1, r1, #0xc
	str r1, [sp, #0x34]
	add r1, r6, #0
	add r1, #0xfc
	ldr r1, [r1]
	mul r0, r1
	str r0, [sp, #0x38]
	ldr r0, [r5, #0x30]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_CosDeg
	mov r1, #0x2a
	ldrsh r1, [r6, r1]
	ldr r2, [sp, #0x34]
	lsl r3, r1, #0xc
	mov r1, #1
	lsl r1, r1, #8
	ldr r1, [r6, r1]
	mul r0, r1
	ldr r1, [sp, #0x38]
	mov ip, r0
	add r1, r2, r1
	mov r2, ip
	add r2, r3, r2
	ldr r0, [r5, #0x24]
	ldr r3, [r6, #0x20]
	bl sub_0200DF44
_02087620:
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
_02087626:
	ldr r0, [r6, #0x10]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	bge _02087632
	b _02087400
_02087632:
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02087638: .word 0x45800000
	thumb_func_end sub_020873D4

	thumb_func_start sub_0208763C
sub_0208763C: ; 0x0208763C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r1, #0
	ldr r1, [r0, #4]
	ldr r5, [r0, #8]
	str r1, [sp, #0x18]
	ldr r1, _020876A4 ; =0x000056CF
	ldr r7, [r0, #0xc]
	ldr r4, [r0]
	add r0, r5, #0
	bl sub_0200D968
	ldr r1, _020876A8 ; =0x000056D0
	add r0, r5, #0
	bl sub_0200D968
	ldr r0, _020876AC ; =_02102814
	lsl r1, r6, #2
	ldr r6, [r0, r1]
	str r4, [sp]
	str r6, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _020876A4 ; =0x000056CF
	ldr r2, [sp, #0x18]
	str r0, [sp, #0x14]
	add r0, r7, #0
	mov r1, #2
	add r3, r5, #0
	bl sub_0200D68C
	str r4, [sp]
	str r6, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r0, _020876A8 ; =0x000056D0
	ldr r2, [sp, #0x18]
	str r0, [sp, #0x14]
	add r0, r7, #0
	mov r1, #3
	add r3, r5, #0
	bl sub_0200D68C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020876A4: .word 0x000056CF
_020876A8: .word 0x000056D0
_020876AC: .word _02102814
	thumb_func_end sub_0208763C

	thumb_func_start sub_020876B0
sub_020876B0: ; 0x020876B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r2, r1, #0
	ldr r3, [r0, #0x18]
	ldr r1, _020877AC ; =0x000056CE
	ldr r7, [r0, #4]
	add r5, r3, r1
	ldr r6, [r0, #8]
	ldr r1, [r0, #0xc]
	ldr r4, [r0]
	cmp r3, #1
	ldr r0, [r0, #0x1c]
	bne _02087726
	cmp r0, #0
	str r4, [sp]
	bne _020876F2
	ldr r0, _020877B0 ; =_02102814
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	add r2, r7, #0
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r1, #0
	mov r1, #2
	add r3, r6, #0
	str r5, [sp, #0x14]
	bl sub_0200D68C
	b _0208770E
_020876F2:
	mov r0, #0x60
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r1, #0
	mov r1, #2
	add r2, r7, #0
	add r3, r6, #0
	str r5, [sp, #0x14]
	bl sub_0200D68C
_0208770E:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #0x5f
	str r5, [sp, #8]
	bl sub_0200D504
	b _02087784
_02087726:
	cmp r0, #0
	str r4, [sp]
	bne _02087750
	ldr r0, _020877B0 ; =_02102814
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	add r2, r7, #0
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	add r0, r1, #0
	mov r1, #3
	add r3, r6, #0
	str r5, [sp, #0x14]
	bl sub_0200D68C
	b _0208776E
_02087750:
	mov r0, #0x60
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	add r0, r1, #0
	mov r1, #3
	add r2, r7, #0
	add r3, r6, #0
	str r5, [sp, #0x14]
	bl sub_0200D68C
_0208776E:
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #0x5f
	str r5, [sp, #8]
	bl sub_0200D504
_02087784:
	mov r0, #0
	str r0, [sp]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #0x5d
	str r5, [sp, #4]
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	add r0, r7, #0
	add r1, r6, #0
	add r2, r4, #0
	mov r3, #0x5e
	str r5, [sp, #4]
	bl sub_0200D71C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020877AC: .word 0x000056CE
_020877B0: .word _02102814
	thumb_func_end sub_020876B0

	thumb_func_start sub_020877B4
sub_020877B4: ; 0x020877B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	ldr r0, [r5, #4]
	ldr r7, [r5, #8]
	str r0, [sp]
	mov r1, #0x80
	add r0, sp, #4
	strh r1, [r0]
	mov r1, #0x60
	strh r1, [r0, #2]
	mov r6, #0
	strh r6, [r0, #4]
	strh r6, [r0, #6]
	str r6, [sp, #0xc]
	ldr r0, [r5, #0x18]
	str r0, [sp, #0x14]
	str r6, [sp, #0x30]
	str r6, [sp, #0x34]
	str r6, [sp, #0x10]
	ldr r1, [r5, #0x18]
	ldr r0, _0208782C ; =0x000056CE
	add r1, r1, r0
	str r1, [sp, #0x18]
	ldr r1, [r5, #0x18]
	add r1, r1, r0
	str r1, [sp, #0x1c]
	ldr r1, [r5, #0x18]
	add r1, r1, r0
	str r1, [sp, #0x20]
	ldr r1, [r5, #0x18]
	add r0, r1, r0
	str r0, [sp, #0x24]
	sub r0, r6, #1
	str r0, [sp, #0x28]
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	ble _02087828
	add r4, r5, #0
_02087804:
	ldr r0, [sp]
	add r1, r7, #0
	add r2, sp, #4
	bl sub_0200D734
	str r0, [r4, #0x24]
	bl sub_0200DC18
	ldr r0, [r4, #0x24]
	mov r1, #0x80
	mov r2, #0x60
	bl sub_0200DDB8
	ldr r0, [r5, #0x10]
	add r6, r6, #1
	add r4, #0x10
	cmp r6, r0
	blt _02087804
_02087828:
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0208782C: .word 0x000056CE
	thumb_func_end sub_020877B4

	thumb_func_start sub_02087830
sub_02087830: ; 0x02087830
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	mov r6, #0
	cmp r0, #0
	ble _02087872
	ldr r7, _02087874 ; =0x000056CE
	add r4, r5, #0
_02087840:
	ldr r2, [r5, #0x18]
	ldr r1, _02087874 ; =0x000056CE
	ldr r0, [r5, #8]
	add r1, r2, r1
	bl sub_0200D958
	ldr r2, [r5, #0x18]
	ldr r1, _02087874 ; =0x000056CE
	ldr r0, [r5, #8]
	add r1, r2, r1
	bl sub_0200D978
	ldr r1, [r5, #0x18]
	ldr r0, [r5, #8]
	add r1, r1, r7
	bl sub_0200D988
	ldr r0, [r4, #0x24]
	bl sub_0200D9DC
	ldr r0, [r5, #0x10]
	add r6, r6, #1
	add r4, #0x10
	cmp r6, r0
	blt _02087840
_02087872:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02087874: .word 0x000056CE
	thumb_func_end sub_02087830

	thumb_func_start sub_02087878
sub_02087878: ; 0x02087878
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #0x14]
	mov r0, #0xbf
	bl NARC_ctor
	str r0, [r5]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020876B0
	add r0, r5, #0
	bl sub_020877B4
	mov r2, #1
	ldr r0, _020878AC ; =sub_020873D4
	add r1, r5, #0
	lsl r2, r2, #0xc
	bl sub_0200E33C
	add r5, #0xf4
	str r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_020878AC: .word sub_020873D4
	thumb_func_end sub_02087878

	thumb_func_start sub_020878B0
sub_020878B0: ; 0x020878B0
	add r0, #0xf0
	str r1, [r0]
	mov r0, #1
	bx lr
	thumb_func_end sub_020878B0

	thumb_func_start sub_020878B8
sub_020878B8: ; 0x020878B8
	push {r3, r4}
	strh r1, [r0, #0x28]
	add r1, r0, #0
	strh r2, [r0, #0x2a]
	mov r2, #0xff
	add r1, #0xe8
	str r2, [r1]
	add r1, r0, #0
	mov r3, #0
	add r1, #0xec
	str r3, [r1]
	ldr r1, [r0, #0x10]
	cmp r1, #0
	ble _020878E4
	add r4, r0, #0
	add r2, r3, #0
_020878D8:
	str r2, [r4, #0x2c]
	ldr r1, [r0, #0x10]
	add r3, r3, #1
	add r4, #0x10
	cmp r3, r1
	blt _020878D8
_020878E4:
	mov r0, #1
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020878B8

	thumb_func_start sub_020878EC
sub_020878EC: ; 0x020878EC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02087930
	cmp r0, #0
	bne _02087900
	mov r0, #0
	pop {r4, r5, r6, pc}
_02087900:
	strh r4, [r5, #0x28]
	add r0, r5, #0
	strh r6, [r5, #0x2a]
	mov r1, #0xff
	add r0, #0xe8
	str r1, [r0]
	add r0, r5, #0
	mov r2, #0
	add r0, #0xec
	str r2, [r0]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	ble _0208792A
	add r3, r5, #0
	add r1, r2, #0
_0208791E:
	str r1, [r3, #0x2c]
	ldr r0, [r5, #0x10]
	add r2, r2, #1
	add r3, #0x10
	cmp r2, r0
	blt _0208791E
_0208792A:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020878EC

	thumb_func_start sub_02087930
sub_02087930: ; 0x02087930
	mov r3, #0x28
	ldrsh r3, [r0, r3]
	cmp r3, r1
	bne _02087944
	mov r1, #0x2a
	ldrsh r0, [r0, r1]
	cmp r0, r2
	bne _02087944
	mov r0, #0
	bx lr
_02087944:
	mov r0, #1
	bx lr
	thumb_func_end sub_02087930

	thumb_func_start sub_02087948
sub_02087948: ; 0x02087948
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	str r2, [sp]
	mov r1, #0xff
	add r0, #0xe8
	str r1, [r0]
	add r0, r5, #0
	mov r7, #0
	add r0, #0xec
	str r7, [r0]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	ble _02087982
	add r4, r5, #0
_02087966:
	strh r6, [r4, #0x28]
	ldr r0, [sp]
	add r1, r6, #0
	strh r0, [r4, #0x2a]
	ldr r0, [r4, #0x24]
	ldr r2, [sp]
	ldr r3, [r5, #0x20]
	bl sub_0200DDF4
	ldr r0, [r5, #0x10]
	add r7, r7, #1
	add r4, #0x10
	cmp r7, r0
	blt _02087966
_02087982:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02087948

	thumb_func_start sub_02087988
sub_02087988: ; 0x02087988
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	cmp r1, #0
	beq _0208799C
	cmp r1, #1
	beq _020879B0
	b _020879C6
_0208799C:
	mov r1, #0
	bl sub_020878B0
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	add r4, #0xe4
	add r0, r0, #1
	str r0, [r4]
	b _020879DA
_020879B0:
	add r0, #0xf4
	ldr r0, [r0]
	bl DestroySysTask
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	add r4, #0xe4
	add r0, r0, #1
	str r0, [r4]
	b _020879DA
_020879C6:
	bl sub_02087830
	ldr r0, [r4]
	bl NARC_dtor
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, pc}
_020879DA:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02087988

	thumb_func_start sub_020879E0
sub_020879E0: ; 0x020879E0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x10]
	add r7, r1, #0
	mov r4, #0
	cmp r0, #0
	ble _02087A02
	add r5, r6, #0
_020879F0:
	ldr r0, [r5, #0x24]
	add r1, r7, #0
	bl sub_0200DCE8
	ldr r0, [r6, #0x10]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	blt _020879F0
_02087A02:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020879E0

	thumb_func_start sub_02087A08
sub_02087A08: ; 0x02087A08
	cmp r1, #0
	beq _02087A1E
	cmp r2, #0
	beq _02087A1E
	add r3, r0, #0
	add r3, #0xfc
	str r1, [r3]
	mov r1, #1
	lsl r1, r1, #8
	str r2, [r0, r1]
	bx lr
_02087A1E:
	add r1, r0, #0
	mov r2, #0xf
	add r1, #0xfc
	str r2, [r1]
	add r1, r2, #0
	add r1, #0xf1
	str r2, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02087A08

	thumb_func_start sub_02087A30
sub_02087A30: ; 0x02087A30
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x10]
	mov r4, #0
	cmp r0, #0
	ble _02087A52
	add r5, r6, #0
	mov r7, #1
_02087A40:
	ldr r0, [r5, #0x24]
	add r1, r7, #0
	bl sub_0200DC4C
	ldr r0, [r6, #0x10]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	blt _02087A40
_02087A52:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02087A30

	thumb_func_start sub_02087A54
sub_02087A54: ; 0x02087A54
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x10]
	mov r4, #0
	cmp r0, #0
	ble _02087A76
	add r5, r6, #0
	add r7, r4, #0
_02087A64:
	ldr r0, [r5, #0x24]
	add r1, r7, #0
	bl sub_0200DC4C
	ldr r0, [r6, #0x10]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	blt _02087A64
_02087A76:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02087A54

	.rodata

_02102814:
	.word 0x61
	.word 0x62
	.word 0x63
	.word 0x64
	.word 0x65
	.word 0x80
	.word 0x85
