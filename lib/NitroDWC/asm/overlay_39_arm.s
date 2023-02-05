	.include "asm/macros.inc"
	.include "overlay_39_arm.inc"
	.include "global.inc"

	.text

	arm_func_start ov39_02229310
ov39_02229310: ; 0x02229310
	stmdb sp!, {r3, lr}
	bl ov39_02229408
	mov r0, #0
	ldr lr, _0222936C ; =_0222AB84
	mov r1, r0
	mov r2, r0
	mov r3, r0
	mov ip, #9
_02229330:
	stmia lr!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02229330
	stmia lr!, {r0, r1, r2, r3}
	stmia lr, {r0, r1}
	ldr r1, _0222936C ; =_0222AB84
	mov r2, #0
	str r2, [r1, #0x138]
	ldr r0, _02229370 ; =ov39_0222AD84
	strb r2, [r1, #0x140]
	strh r2, [r0, #0x40]
	bl ov39_0222993C
	bl ov39_02229970
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222936C: .word _0222AB84
_02229370: .word ov39_0222AD84
	arm_func_end ov39_02229310

	arm_func_start ov39_02229374
ov39_02229374: ; 0x02229374
	stmdb sp!, {r4, r5, r6, lr}
	movs r5, r2
	mov r6, r0
	mov r4, r1
	beq _022293B4
	ldr lr, _022293FC ; =_0222AB84
	mov ip, #0x13
_02229390:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02229390
	ldmia r5, {r0, r1}
	stmia lr, {r0, r1}
	ldr r0, _022293FC ; =_0222AB84
	mov r1, #0
	str r1, [r0, #0x138]
_022293B4:
	bl ov39_02229944
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl ov39_02229924
	ldr r0, _02229400 ; =ov39_0222ACC4
	mov r1, r6
	bl strcpy
	ldr r1, _02229404 ; =ov39_0222AD84
	mov r2, #0
	ldr r0, _022293FC ; =_0222AB84
	strh r4, [r1, #0x40]
	str r2, [r0, #0x258]
	sub r1, r2, #1
	str r1, [r0, #0x26c]
	bl ov39_02229408
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_022293FC: .word _0222AB84
_02229400: .word ov39_0222ACC4
_02229404: .word ov39_0222AD84
	arm_func_end ov39_02229374

	arm_func_start ov39_02229408
ov39_02229408: ; 0x02229408
	stmdb sp!, {r3, lr}
	bl ov39_02229BA4
	ldr r0, _02229470 ; =_0222AB84
	ldr r0, [r0, #0x258]
	cmp r0, #0
	beq _02229430
	bl ov39_022298E0
	ldr r0, _02229470 ; =_0222AB84
	mov r1, #0
	str r1, [r0, #0x258]
_02229430:
	ldr r0, _02229470 ; =_0222AB84
	mov r1, #0xf
	str r1, [r0, #0x244]
	mov r1, #0x1e
	str r1, [r0, #0x248]
	str r1, [r0, #0x24c]
	mov r2, #0
	str r2, [r0, #0x254]
	str r2, [r0, #0x25c]
	str r2, [r0, #0x260]
	str r2, [r0, #0x264]
	str r2, [r0, #0x268]
	mov r1, #1
	str r1, [r0, #0x13c]
	str r2, [r0, #0x250]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02229470: .word _0222AB84
	arm_func_end ov39_02229408

	arm_func_start ov39_02229474
ov39_02229474: ; 0x02229474
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r5, #0
	ldr r4, _0222962C ; =_0222AB84
	mov fp, #9
	mov sl, #7
	mov r6, #1
	mov r7, r5
_02229490:
	ldr r0, [r4, #0x13c]
	mov r8, r7
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _022295E8
_022294A4: ; jump table
	b _022294CC ; case 0
	b _022294CC ; case 1
	b _022294D4 ; case 2
	b _02229508 ; case 3
	b _0222953C ; case 4
	b _02229570 ; case 5
	b _022295B8 ; case 6
	b _022294CC ; case 7
	b _022294CC ; case 8
	b _022294CC ; case 9
_022294CC:
	mov r8, r6
	b _022295E8
_022294D4:
	bl ov39_02229FCC
	cmp r0, #0
	bne _022294F8
	ldr r0, [r4, #0x250]
	mov r8, #1
	cmp r0, #0xd
	moveq sb, sl
	movne sb, fp
	b _022294FC
_022294F8:
	mov sb, #3
_022294FC:
	bl ov39_022298FC
	str sb, [r4, #0x13c]
	b _022295E8
_02229508:
	bl ov39_02229AD4
	cmp r0, #0
	bne _0222952C
	ldr r0, [r4, #0x250]
	mov r8, #1
	cmp r0, #0xd
	moveq sb, #7
	movne sb, #9
	b _02229530
_0222952C:
	mov sb, #4
_02229530:
	bl ov39_022298FC
	str sb, [r4, #0x13c]
	b _022295E8
_0222953C:
	bl ov39_02229BE4
	cmp r0, #0
	bne _02229560
	ldr r0, [r4, #0x250]
	mov r8, #1
	cmp r0, #0xd
	moveq sb, #7
	movne sb, #9
	b _02229564
_02229560:
	mov sb, #5
_02229564:
	bl ov39_022298FC
	str sb, [r4, #0x13c]
	b _022295E8
_02229570:
	bl ov39_02229D2C
	cmp r0, #0
	bne _02229594
	ldr r0, [r4, #0x250]
	mov r8, #1
	cmp r0, #0xd
	moveq sb, #7
	movne sb, #9
	b _02229598
_02229594:
	mov sb, #6
_02229598:
	ldr r0, [r4, #0x258]
	cmp r0, #0
	beq _022295AC
	bl ov39_022298E0
	str r5, [r4, #0x258]
_022295AC:
	bl ov39_022298FC
	str sb, [r4, #0x13c]
	b _022295E8
_022295B8:
	bl ov39_02229E40
	cmp r0, #0
	bne _022295D8
	ldr r0, [r4, #0x250]
	cmp r0, #0xd
	moveq sb, #7
	movne sb, #9
	b _022295DC
_022295D8:
	mov sb, #8
_022295DC:
	mov r8, #1
	bl ov39_022298FC
	str sb, [r4, #0x13c]
_022295E8:
	cmp r8, #0
	bne _02229624
	ldr r0, [r4, #0x268]
	cmp r0, #1
	bne _02229614
	ldr r0, _0222962C ; =_0222AB84
	mov r1, #7
	str r1, [r0, #0x13c]
	mov r1, #0xd
	str r1, [r0, #0x250]
	b _02229624
_02229614:
	bl ov39_02229910
	mov r0, #1
	bl ov39_02229FC0
	b _02229490
_02229624:
	bl ov39_02229910
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0222962C: .word _0222AB84
	arm_func_end ov39_02229474

	arm_func_start ov39_02229630
ov39_02229630: ; 0x02229630
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov39_022298FC
	ldr r0, _02229818 ; =_0222AB84
	ldr r0, [r0, #0x13c]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _022296A8
_0222965C: ; jump table
	b _02229684 ; case 0
	b _022296A8 ; case 1
	b _02229684 ; case 2
	b _02229684 ; case 3
	b _02229684 ; case 4
	b _02229684 ; case 5
	b _02229684 ; case 6
	b _022296A4 ; case 7
	b _022296A4 ; case 8
	b _022296A4 ; case 9
_02229684:
	bl ov39_02229910
	ldr r0, _02229818 ; =_0222AB84
	mov r1, #9
	str r1, [r0, #0x13c]
	mov r1, #1
	str r1, [r0, #0x250]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022296A4:
	bl ov39_02229408
_022296A8:
	bl ov39_02229910
	mov r0, r7
	bl ov39_0222A6DC
	ldr r2, _02229818 ; =_0222AB84
	mvn r1, #0
	str r0, [r2, #0x25c]
	cmp r0, r1
	bne _022296E0
	mov r0, #9
	str r0, [r2, #0x13c]
	mov r0, #2
	str r0, [r2, #0x250]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022296E0:
	cmp r4, r1
	str r5, [r2, #0x260]
	addne r0, r4, #0x140
	strne r0, [sp]
	bne _02229728
	mov r0, r7
	bl ov39_0222A59C
	mvn r1, #0
	str r0, [sp]
	cmp r0, r1
	bne _02229728
	ldr r0, _02229818 ; =_0222AB84
	mov r1, #9
	str r1, [r0, #0x13c]
	mov r1, #2
	str r1, [r0, #0x250]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02229728:
	ldr r0, [sp]
	bl ov39_022298CC
	ldr ip, _02229818 ; =_0222AB84
	cmp r0, #0
	str r0, [ip, #0x258]
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [sp]
	add r3, sp, #0
	str r1, [ip, #0x254]
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	mov r4, #0x13
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldr lr, [ip, #0x258]
	strh r7, [lr, #4]
	add r5, lr, #8
_02229780:
	ldmia ip!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	subs r4, r4, #1
	bne _02229780
	ldmia ip, {r0, r1}
	stmia r5, {r0, r1}
	mov r0, #0
	strh r0, [lr, #6]
	ldr r2, [sp]
	mov r1, r6
	add r0, lr, #0x140
	sub r2, r2, #0x140
	bl memcpy
	ldr r0, _02229818 ; =_0222AB84
	ldr r2, [r0, #0x258]
	ldr r1, [r0, #0x254]
	add r0, r2, #4
	sub r1, r1, #4
	add r2, r2, #4
	bl ov39_0222A4EC
	ldr r0, _02229818 ; =_0222AB84
	mov r1, #2
	str r1, [r0, #0x13c]
	bl ov39_022298FC
	bl ov39_02229980
	cmp r0, #0
	bne _0222980C
	ldr r0, _02229818 ; =_0222AB84
	mov r1, #9
	str r1, [r0, #0x13c]
	mov r1, #6
	str r1, [r0, #0x250]
	bl ov39_02229910
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0222980C:
	bl ov39_02229910
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02229818: .word _0222AB84
	arm_func_end ov39_02229630

	arm_func_start ov39_0222981C
ov39_0222981C: ; 0x0222981C
	ldr r0, _02229828 ; =_0222AB84
	ldr r0, [r0, #0x13c]
	bx lr
	.balign 4, 0
_02229828: .word _0222AB84
	arm_func_end ov39_0222981C

	arm_func_start ov39_0222982C
ov39_0222982C: ; 0x0222982C
	stmdb sp!, {r3, lr}
	bl ov39_022298FC
	bl ov39_0222981C
	cmp r0, #8
	beq _0222984C
	bl ov39_02229910
	mov r0, #0
	ldmia sp!, {r3, pc}
_0222984C:
	bl ov39_02229910
	ldr r0, _02229860 ; =_0222AB84
	ldr r0, [r0, #0x260]
	add r0, r0, #4
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02229860: .word _0222AB84
	arm_func_end ov39_0222982C

	arm_func_start ov39_02229864
ov39_02229864: ; 0x02229864
	stmdb sp!, {r3, lr}
	bl ov39_022298FC
	bl ov39_0222981C
	cmp r0, #8
	beq _02229884
	bl ov39_02229910
	mvn r0, #0
	ldmia sp!, {r3, pc}
_02229884:
	bl ov39_02229910
	ldr r0, _02229894 ; =_0222AB84
	ldr r0, [r0, #0x25c]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02229894: .word _0222AB84
	arm_func_end ov39_02229864

	arm_func_start ov39_02229898
ov39_02229898: ; 0x02229898
	stmdb sp!, {r3, lr}
	bl ov39_022298FC
	bl ov39_0222981C
	cmp r0, #9
	beq _022298B8
	bl ov39_02229910
	mov r0, #0
	ldmia sp!, {r3, pc}
_022298B8:
	bl ov39_02229910
	ldr r0, _022298C8 ; =_0222AB84
	ldr r0, [r0, #0x250]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022298C8: .word _0222AB84
	arm_func_end ov39_02229898

	arm_func_start ov39_022298CC
ov39_022298CC: ; 0x022298CC
	ldr ip, _022298DC ; =ov00_021EC2A8
	mov r1, r0
	mov r0, #0
	bx ip
	.balign 4, 0
_022298DC: .word ov00_021EC2A8
	arm_func_end ov39_022298CC

	arm_func_start ov39_022298E0
ov39_022298E0: ; 0x022298E0
	stmdb sp!, {r3, lr}
	movs r1, r0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	mov r2, r0
	bl ov00_021EC2EC
	ldmia sp!, {r3, pc}
	arm_func_end ov39_022298E0

	arm_func_start ov39_022298FC
ov39_022298FC: ; 0x022298FC
	ldr ip, _02229908 ; =OS_LockMutex
	ldr r0, _0222990C ; =ov39_0222AEB8
	bx ip
	.balign 4, 0
_02229908: .word OS_LockMutex
_0222990C: .word ov39_0222AEB8
	arm_func_end ov39_022298FC

	arm_func_start ov39_02229910
ov39_02229910: ; 0x02229910
	ldr ip, _0222991C ; =OS_UnlockMutex
	ldr r0, _02229920 ; =ov39_0222AEB8
	bx ip
	.balign 4, 0
_0222991C: .word OS_UnlockMutex
_02229920: .word ov39_0222AEB8
	arm_func_end ov39_02229910

	arm_func_start ov39_02229924
ov39_02229924: ; 0x02229924
	stmdb sp!, {r3, lr}
	ldr r0, _02229938 ; =ov39_0222AEB8
	bl OS_InitMutex
	mov r0, #1
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02229938: .word ov39_0222AEB8
	arm_func_end ov39_02229924

	arm_func_start ov39_0222993C
ov39_0222993C: ; 0x0222993C
	mov r0, #1
	bx lr
	arm_func_end ov39_0222993C

	arm_func_start ov39_02229944
ov39_02229944: ; 0x02229944
	stmdb sp!, {r3, lr}
	bl OS_IsTickAvailable
	cmp r0, #0
	bne _02229958
	bl OS_InitTick
_02229958:
	ldr r0, _0222996C ; =_0222AB84
	mov r1, #0x10
	str r1, [r0, #0x270]
	mov r0, #1
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222996C: .word _0222AB84
	arm_func_end ov39_02229944

	arm_func_start ov39_02229970
ov39_02229970: ; 0x02229970
	bx lr
	arm_func_end ov39_02229970

	arm_func_start ov39_02229974
ov39_02229974: ; 0x02229974
	ldr ip, _0222997C ; =ov39_02229474
	bx ip
	.balign 4, 0
_0222997C: .word ov39_02229474
	arm_func_end ov39_02229974

	arm_func_start ov39_02229980
ov39_02229980: ; 0x02229980
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov r1, #0x800
	ldr r0, _022299C4 ; =_0222AB84
	str r1, [sp]
	ldr ip, [r0, #0x270]
	ldr r0, _022299C8 ; =ov39_0222ADF8
	ldr r1, _022299CC ; =ov39_02229974
	ldr r3, _022299D0 ; =ov39_0222B6D0
	mov r2, #0
	str ip, [sp, #4]
	bl OS_CreateThread
	ldr r0, _022299C8 ; =ov39_0222ADF8
	bl OS_WakeupThreadDirect
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022299C4: .word _0222AB84
_022299C8: .word ov39_0222ADF8
_022299CC: .word ov39_02229974
_022299D0: .word ov39_0222B6D0
	arm_func_end ov39_02229980

	arm_func_start ov39_022299D4
ov39_022299D4: ; 0x022299D4
	ldrsb ip, [r0]
	mov r2, #0
	mov r3, r2
	cmp ip, #0
	beq _02229A50
	mov r1, r2
_022299EC:
	cmp ip, #0x30
	blt _02229A10
	cmp ip, #0x39
	bgt _02229A10
	add r2, r2, #1
	cmp r2, #4
	blt _02229A44
	mov r0, #0
	bx lr
_02229A10:
	cmp ip, #0x2e
	bne _02229A3C
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	add r3, r3, #1
	mov r2, r1
	cmp r3, #4
	blt _02229A44
	mov r0, r1
	bx lr
_02229A3C:
	mov r0, #0
	bx lr
_02229A44:
	ldrsb ip, [r0, #1]!
	cmp ip, #0
	bne _022299EC
_02229A50:
	cmp r3, #3
	bne _02229A64
	cmp r2, #0
	movne r0, #1
	bxne lr
_02229A64:
	mov r0, #0
	bx lr
	arm_func_end ov39_022299D4

	arm_func_start ov39_02229A6C
ov39_02229A6C: ; 0x02229A6C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl ov39_022299D4
	cmp r0, #0
	bne _02229AC0
	mov r0, r5
	bl SOC_GetHostByName
	cmp r0, #0
	beq _02229AB8
	ldr r0, [r0, #0xc]
	ldr r0, [r0]
	ldr r0, [r0]
	str r0, [sp]
	bl SOC_InetNtoA
	mov r1, r0
	mov r0, r4
	bl strcpy
	b _02229ACC
_02229AB8:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02229AC0:
	mov r0, r4
	mov r1, r5
	bl strcpy
_02229ACC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov39_02229A6C

	arm_func_start ov39_02229AD4
ov39_02229AD4: ; 0x02229AD4
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	mov r0, #2
	mov r1, #1
	mov r2, #0
	bl SOC_Socket
	ldr r2, _02229B9C ; =_0222AB84
	mvn r1, #0
	str r0, [r2, #0x26c]
	cmp r0, r1
	bne _02229B14
	mov r0, #3
	str r0, [r2, #0x250]
	add sp, sp, #0x10
	mov r0, #0
	ldmia sp!, {r3, pc}
_02229B14:
	mov r1, #3
	mov r2, #0
	bl SOC_Fcntl
	ldr r1, _02229B9C ; =_0222AB84
	orr r2, r0, #4
	ldr r0, [r1, #0x26c]
	mov r1, #4
	bl SOC_Fcntl
	cmp r0, #0
	bge _02229B54
	ldr r0, _02229B9C ; =_0222AB84
	mov r1, #4
	str r1, [r0, #0x250]
	add sp, sp, #0x10
	mov r0, #0
	ldmia sp!, {r3, pc}
_02229B54:
	ldr r0, _02229BA0 ; =ov39_0222ACC4
	add r1, sp, #0
	bl ov39_02229A6C
	cmp r0, #0
	bne _02229B80
	ldr r0, _02229B9C ; =_0222AB84
	mov r1, #5
	str r1, [r0, #0x250]
	add sp, sp, #0x10
	mov r0, #0
	ldmia sp!, {r3, pc}
_02229B80:
	add r0, sp, #0
	bl ov00_021FFA44
	ldr r1, _02229B9C ; =_0222AB84
	str r0, [r1, #0x264]
	mov r0, #1
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02229B9C: .word _0222AB84
_02229BA0: .word ov39_0222ACC4
	arm_func_end ov39_02229AD4

	arm_func_start ov39_02229BA4
ov39_02229BA4: ; 0x02229BA4
	stmdb sp!, {r3, lr}
	ldr r0, _02229BE0 ; =_0222AB84
	mvn r1, #0
	ldr r0, [r0, #0x26c]
	cmp r0, r1
	ldmeqia sp!, {r3, pc}
	mov r1, #2
	bl SOC_Shutdown
	ldr r0, _02229BE0 ; =_0222AB84
	ldr r0, [r0, #0x26c]
	bl SOC_Close
	ldr r0, _02229BE0 ; =_0222AB84
	mvn r1, #0
	str r1, [r0, #0x26c]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02229BE0: .word _0222AB84
	arm_func_end ov39_02229BA4

	arm_func_start ov39_02229BE4
ov39_02229BE4: ; 0x02229BE4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	mov r2, #8
	mov r1, #2
	ldr r0, _02229D20 ; =ov39_0222AD84
	strb r2, [sp]
	strb r1, [sp, #1]
	ldrh r1, [r0, #0x40]
	ldr r0, _02229D24 ; =_0222AB84
	mov r2, r1, asr #8
	mov r1, r1, lsl #8
	and r2, r2, #0xff
	and r1, r1, #0xff00
	orr r1, r2, r1
	strh r1, [sp, #2]
	ldr r0, [r0, #0x264]
	str r0, [sp, #4]
	bl OS_GetTick
	ldr r2, _02229D28 ; =0x0007FD88
	mov r3, #0
	bl _ll_udiv
	ldr r5, _02229D28 ; =0x0007FD88
	ldr sb, _02229D24 ; =_0222AB84
	mov r7, r0
	mov r4, #0
	mov sl, #1
	add r6, sp, #0
	mvn r8, #0x19
_02229C54:
	ldr r0, [sb, #0x26c]
	mov r1, r6
	bl SOC_Connect
	cmp r0, #0
	bge _02229D14
	cmp r0, r8
	bne _02229CB4
	ldr r0, [sb, #0x244]
	cmp r0, #0
	beq _02229CD8
	bl OS_GetTick
	mov r2, r5
	mov r3, r4
	bl _ll_udiv
	ldr r1, [sb, #0x244]
	subs r0, r0, r7
	cmp r0, r1
	blt _02229CD8
	ldr r0, _02229D24 ; =_0222AB84
	mov r1, #0xa
	str r1, [r0, #0x250]
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02229CB4:
	mvn r1, #0x1d
	cmp r0, r1
	beq _02229D14
	ldr r0, _02229D24 ; =_0222AB84
	mov r1, #7
	str r1, [r0, #0x250]
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02229CD8:
	bl ov39_022298FC
	ldr r0, [sb, #0x268]
	cmp r0, #1
	bne _02229D04
	ldr r0, _02229D24 ; =_0222AB84
	mov r1, #0xd
	str r1, [r0, #0x250]
	bl ov39_02229910
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02229D04:
	bl ov39_02229910
	mov r0, sl
	bl ov39_02229FC0
	b _02229C54
_02229D14:
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_02229D20: .word ov39_0222AD84
_02229D24: .word _0222AB84
_02229D28: .word 0x0007FD88
	arm_func_end ov39_02229BE4

	arm_func_start ov39_02229D2C
ov39_02229D2C: ; 0x02229D2C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	bl OS_GetTick
	ldr r2, _02229E38 ; =0x0007FD88
	mov r3, sb
	bl _ll_udiv
	ldr r7, _02229E38 ; =0x0007FD88
	ldr r5, _02229E3C ; =_0222AB84
	mov sl, r0
	mov r8, sb
	mov r6, sb
	mov fp, #1
	mvn r4, #5
_02229D60:
	ldr r0, [r5, #0x254]
	ldr r1, [r5, #0x258]
	sub r2, r0, sb
	cmp r2, r0
	movgt r2, r0
	ldr r0, [r5, #0x26c]
	mov r3, r8
	add r1, r1, sb
	bl SOC_Send
	cmp r0, r4
	beq _02229DB8
	cmp r0, #0
	bge _02229DA8
	ldr r0, _02229E3C ; =_0222AB84
	mov r1, #0xb
	str r1, [r0, #0x250]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02229DA8:
	ldr r1, [r5, #0x254]
	add sb, sb, r0
	cmp sb, r1
	beq _02229E30
_02229DB8:
	ldr r0, [r5, #0x248]
	cmp r0, #0
	beq _02229DF8
	bl OS_GetTick
	mov r2, r7
	mov r3, r6
	bl _ll_udiv
	ldr r1, [r5, #0x248]
	subs r0, r0, sl
	cmp r0, r1
	blt _02229DF8
	ldr r0, _02229E3C ; =_0222AB84
	mov r1, #0xb
	str r1, [r0, #0x250]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02229DF8:
	bl ov39_022298FC
	ldr r0, [r5, #0x268]
	cmp r0, #1
	bne _02229E20
	ldr r0, _02229E3C ; =_0222AB84
	mov r1, #0xd
	str r1, [r0, #0x250]
	bl ov39_02229910
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02229E20:
	bl ov39_02229910
	mov r0, fp
	bl ov39_02229FC0
	b _02229D60
_02229E30:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02229E38: .word 0x0007FD88
_02229E3C: .word _0222AB84
	arm_func_end ov39_02229D2C

	arm_func_start ov39_02229E40
ov39_02229E40: ; 0x02229E40
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, #0
	sub r0, sl, #1
	str r0, [sp]
	bl OS_GetTick
	ldr r2, _02229FB8 ; =0x0007FD88
	mov r3, sl
	bl _ll_udiv
	mvn r4, #0
	ldr fp, _02229FB8 ; =0x0007FD88
	ldr r6, _02229FBC ; =_0222AB84
	mov sb, r0
	sub r5, r4, #5
	add r7, sp, #0
	mov r8, sl
_02229E7C:
	ldr r1, [r6, #0x260]
	ldr r2, [r6, #0x25c]
	ldr r0, [r6, #0x26c]
	mov r3, r8
	add r1, r1, sl
	sub r2, r2, sl
	bl SOC_Recv
	cmp r0, r5
	beq _02229F38
	cmp r0, #0
	bgt _02229EBC
	ldr r0, _02229FBC ; =_0222AB84
	mov r1, #9
	str r1, [r0, #0x250]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02229EBC:
	add sl, sl, r0
	cmp sl, #4
	blo _02229EF8
	ldr r0, [sp]
	cmp r0, r4
	bne _02229EF8
	ldr r2, [r6, #0x260]
	ldrb r1, [r2]
	ldrb r0, [r2, #1]
	strb r1, [r7]
	strb r0, [r7, #1]
	ldrb r1, [r2, #2]
	ldrb r0, [r2, #3]
	strb r1, [r7, #2]
	strb r0, [r7, #3]
_02229EF8:
	ldr r0, [sp]
	cmp sl, r0
	bne _02229F38
	cmp r0, r4
	beq _02229F38
	ldr r0, _02229FBC ; =_0222AB84
	sub r1, sl, #4
	ldr r2, [r0, #0x260]
	add r0, r2, #4
	add r2, r2, #4
	bl ov39_0222A544
	ldr r1, [sp]
	ldr r0, _02229FBC ; =_0222AB84
	sub r1, r1, #4
	str r1, [r0, #0x25c]
	b _02229FB0
_02229F38:
	ldr r0, [r6, #0x24c]
	cmp r0, #0
	beq _02229F78
	bl OS_GetTick
	mov r2, fp
	mov r3, #0
	bl _ll_udiv
	ldr r1, [r6, #0x24c]
	subs r0, r0, sb
	cmp r0, r1
	blt _02229F78
	ldr r0, _02229FBC ; =_0222AB84
	mov r1, #0xc
	str r1, [r0, #0x250]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02229F78:
	bl ov39_022298FC
	ldr r0, [r6, #0x268]
	cmp r0, #1
	bne _02229FA0
	ldr r0, _02229FBC ; =_0222AB84
	mov r1, #0xd
	str r1, [r0, #0x250]
	bl ov39_02229910
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02229FA0:
	bl ov39_02229910
	mov r0, #1
	bl ov39_02229FC0
	b _02229E7C
_02229FB0:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02229FB8: .word 0x0007FD88
_02229FBC: .word _0222AB84
	arm_func_end ov39_02229E40

	arm_func_start ov39_02229FC0
ov39_02229FC0: ; 0x02229FC0
	ldr ip, _02229FC8 ; =OS_Sleep
	bx ip
	.balign 4, 0
_02229FC8: .word OS_Sleep
	arm_func_end ov39_02229FC0

	arm_func_start ov39_02229FCC
ov39_02229FCC: ; 0x02229FCC
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x17c
	ldr r0, _0222A104 ; =_0222AB84
	ldr r0, [r0, #0x138]
	cmp r0, #1
	addeq sp, sp, #0x17c
	moveq r0, #1
	ldmeqia sp!, {r4, r5, pc}
	ldr r0, _0222A108 ; =_0222AA58
	add r1, sp, #8
	bl ov00_021ECC6C
	cmp r0, #0
	bne _0222A018
	ldr r0, _0222A104 ; =_0222AB84
	mov r1, #0xe
	str r1, [r0, #0x250]
	add sp, sp, #0x17c
	mov r0, #0
	ldmia sp!, {r4, r5, pc}
_0222A018:
	ldr r4, _0222A104 ; =_0222AB84
	mov r5, #1
_0222A020:
	bl ov00_021ECCE0
	cmp r0, #3
	bne _0222A074
	ldr r4, _0222A10C ; =ov39_0222AB8A
	add r3, sp, #0x4d
	mov r2, #0x96
_0222A038:
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	add r3, r3, #2
	strb r1, [r4]
	strb r0, [r4, #1]
	add r4, r4, #2
	subs r2, r2, #1
	bne _0222A038
	ldrb r2, [r3]
	ldr r1, _0222A104 ; =_0222AB84
	mov r0, #1
	strb r2, [r4]
	str r0, [r1, #0x138]
	add sp, sp, #0x17c
	ldmia sp!, {r4, r5, pc}
_0222A074:
	cmp r0, #4
	bne _0222A0A0
	add r0, sp, #0
	add r1, sp, #4
	bl ov00_021EC11C
	ldr r0, _0222A104 ; =_0222AB84
	mov r1, #0xe
	str r1, [r0, #0x250]
	add sp, sp, #0x17c
	mov r0, #0
	ldmia sp!, {r4, r5, pc}
_0222A0A0:
	cmp r0, #5
	bne _0222A0C0
	ldr r0, _0222A104 ; =_0222AB84
	mov r1, #0xe
	str r1, [r0, #0x250]
	add sp, sp, #0x17c
	mov r0, #0
	ldmia sp!, {r4, r5, pc}
_0222A0C0:
	bl ov39_022298FC
	ldr r0, [r4, #0x268]
	cmp r0, #1
	bne _0222A0EC
	ldr r0, _0222A104 ; =_0222AB84
	mov r1, #0xd
	str r1, [r0, #0x250]
	bl ov39_02229910
	add sp, sp, #0x17c
	mov r0, #0
	ldmia sp!, {r4, r5, pc}
_0222A0EC:
	bl ov39_02229910
	mov r0, r5
	bl ov39_02229FC0
	b _0222A020
	arm_func_end ov39_02229FCC

	arm_func_start ov39_0222A0FC
ov39_0222A0FC: ; 0x0222A0FC
	add sp, sp, #0x17c
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_0222A104: .word _0222AB84
_0222A108: .word _0222AA58
_0222A10C: .word ov39_0222AB8A
	arm_func_end ov39_0222A0FC

	arm_func_start ov39_0222A110
ov39_0222A110: ; 0x0222A110
	ldr ip, _0222A124 ; =ov39_02229374
	mov r2, r0
	ldr r0, _0222A128 ; =ov39_0222AA5C
	ldr r1, _0222A12C ; =0x00003070
	bx ip
	.balign 4, 0
_0222A124: .word ov39_02229374
_0222A128: .word ov39_0222AA5C
_0222A12C: .word 0x00003070
	arm_func_end ov39_0222A110

	arm_func_start ov39_0222A130
ov39_0222A130: ; 0x0222A130
	ldr ip, _0222A138 ; =ov39_02229310
	bx ip
	.balign 4, 0
_0222A138: .word ov39_02229310
	arm_func_end ov39_0222A130

	arm_func_start ov39_0222A13C
ov39_0222A13C: ; 0x0222A13C
	stmdb sp!, {r4, lr}
	bl ov39_022298FC
	bl ov39_0222981C
	mov r4, r0
	bl ov39_02229910
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov39_0222A13C

	arm_func_start ov39_0222A158
ov39_0222A158: ; 0x0222A158
	ldr ip, _0222A160 ; =ov39_02229898
	bx ip
	.balign 4, 0
_0222A160: .word ov39_02229898
	arm_func_end ov39_0222A158

	arm_func_start ov39_0222A164
ov39_0222A164: ; 0x0222A164
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0xe0
	mov r6, r0
	add lr, sp, #0
	mov r5, r1
	mov r4, r6
	mov ip, #0xe
_0222A180:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0222A180
	ldr r1, _0222A1B8 ; =ov39_0222AA78
	mov r0, r6
	bl ov39_0222A8AC
	ldr r0, _0222A1BC ; =0x00004E20
	add r1, sp, #0
	mov r2, r5
	mvn r3, #0
	bl ov39_02229630
	add sp, sp, #0xe0
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0222A1B8: .word ov39_0222AA78
_0222A1BC: .word 0x00004E20
	arm_func_end ov39_0222A164

	arm_func_start ov39_0222A1C0
ov39_0222A1C0: ; 0x0222A1C0
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	mov lr, #0
	mov ip, r0, asr #0x1f
	str r0, [sp, #4]
	mov r2, r1
	ldr r0, _0222A1FC ; =0x00004E21
	add r1, sp, #0
	sub r3, lr, #1
	strh lr, [sp]
	strh lr, [sp, #2]
	str ip, [sp, #8]
	bl ov39_02229630
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.balign 4, 0
_0222A1FC: .word 0x00004E21
	arm_func_end ov39_0222A1C0

	arm_func_start ov39_0222A200
ov39_0222A200: ; 0x0222A200
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x220
	mov r6, r1
	add lr, sp, #4
	mov r5, r2
	mov r4, r6
	str r0, [sp]
	mov ip, #0x21
_0222A220:
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0222A220
	ldmia r4, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	ldr r1, _0222A260 ; =ov39_0222AA78
	mov r0, r6
	bl ov39_0222A8AC
	ldr r0, _0222A264 ; =0x00005208
	add r1, sp, #0
	mov r2, r5
	mvn r3, #0
	bl ov39_02229630
	add sp, sp, #0x220
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0222A260: .word ov39_0222AA78
_0222A264: .word 0x00005208
	arm_func_end ov39_0222A200

	arm_func_start ov39_0222A268
ov39_0222A268: ; 0x0222A268
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	mov lr, #0
	mov ip, r0, asr #0x1f
	str r0, [sp, #4]
	mov r2, r1
	ldr r0, _0222A2A4 ; =0x00005209
	add r1, sp, #0
	sub r3, lr, #1
	strh lr, [sp]
	strh lr, [sp, #2]
	str ip, [sp, #8]
	bl ov39_02229630
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.balign 4, 0
_0222A2A4: .word 0x00005209
	arm_func_end ov39_0222A268

	arm_func_start ov39_0222A2A8
ov39_0222A2A8: ; 0x0222A2A8
	ldr ip, _0222A2B0 ; =ov39_02229864
	bx ip
	.balign 4, 0
_0222A2B0: .word ov39_02229864
	arm_func_end ov39_0222A2A8

	arm_func_start ov39_0222A2B4
ov39_0222A2B4: ; 0x0222A2B4
	ldr ip, _0222A2BC ; =ov39_0222982C
	bx ip
	.balign 4, 0
_0222A2BC: .word ov39_0222982C
	arm_func_end ov39_0222A2B4

	arm_func_start ov39_0222A2C0
ov39_0222A2C0: ; 0x0222A2C0
	ldr ip, _0222A2C8 ; =ov39_0222A6DC
	bx ip
	.balign 4, 0
_0222A2C8: .word ov39_0222A6DC
	arm_func_end ov39_0222A2C0

	arm_func_start ov39_0222A2CC
ov39_0222A2CC: ; 0x0222A2CC
	ldr ip, _0222A2E4 ; =ov39_02229630
	mov r1, #0
	mov r2, r0
	ldr r0, _0222A2E8 ; =0x000055F0
	sub r3, r1, #1
	bx ip
	.balign 4, 0
_0222A2E4: .word ov39_02229630
_0222A2E8: .word 0x000055F0
	arm_func_end ov39_0222A2CC

	arm_func_start ov39_0222A2EC
ov39_0222A2EC: ; 0x0222A2EC
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x24
	mov r5, r0
	mov r4, r1
	add lr, sp, #0
	ldmia r5!, {r0, r1, r2, r3}
	mov ip, lr
	stmia lr!, {r0, r1, r2, r3}
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldr r0, [r5]
	mov r1, ip
	str r0, [lr]
	ldr r0, _0222A338 ; =0x000055F1
	mov r2, r4
	mvn r3, #0
	bl ov39_02229630
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_0222A338: .word 0x000055F1
	arm_func_end ov39_0222A2EC

	arm_func_start ov39_0222A33C
ov39_0222A33C: ; 0x0222A33C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14c
	sub sp, sp, #0x1c00
	add lr, sp, #0
	mov r5, r0
	mov r4, r1
	mov ip, #0x1d4
_0222A358:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _0222A358
	ldmia r5, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	ldr r0, _0222A390 ; =0x000059D8
	add r1, sp, #0
	mov r2, r4
	mvn r3, #0
	bl ov39_02229630
	add sp, sp, #0x14c
	add sp, sp, #0x1c00
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_0222A390: .word 0x000059D8
	arm_func_end ov39_0222A33C

	arm_func_start ov39_0222A394
ov39_0222A394: ; 0x0222A394
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x1c
	mov lr, #0
	add ip, sp, #4
	strh lr, [sp]
	mov r4, r1
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r0, _0222A3D8 ; =0x000059D9
	add r1, sp, #0
	mov r2, r4
	sub r3, lr, #1
	strh lr, [sp]
	strh lr, [sp, #2]
	bl ov39_02229630
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0222A3D8: .word 0x000059D9
	arm_func_end ov39_0222A394

	arm_func_start ov39_0222A3DC
ov39_0222A3DC: ; 0x0222A3DC
	stmdb sp!, {lr}
	sub sp, sp, #0x1c
	mov r2, r1
	add r1, sp, #0
	mov ip, #0
	mov r3, #1
	str ip, [r1]
	strh r3, [sp]
	str ip, [r1, #4]
	str ip, [r1, #8]
	str ip, [r1, #0xc]
	str ip, [r1, #0x10]
	str ip, [r1, #0x14]
	str ip, [r1, #0x18]
	ldr ip, [r0]
	ldr r0, _0222A430 ; =0x000059D9
	sub r3, r3, #2
	str ip, [sp, #0xc]
	bl ov39_02229630
	add sp, sp, #0x1c
	ldmia sp!, {pc}
	.balign 4, 0
_0222A430: .word 0x000059D9
	arm_func_end ov39_0222A3DC

	arm_func_start ov39_0222A434
ov39_0222A434: ; 0x0222A434
	stmdb sp!, {lr}
	sub sp, sp, #0x1c
	mov r2, r1
	add r1, sp, #0
	mov ip, #0
	mov r3, #2
	str ip, [r1]
	strh r3, [sp]
	str ip, [r1, #4]
	str ip, [r1, #8]
	str ip, [r1, #0xc]
	str ip, [r1, #0x10]
	str ip, [r1, #0x14]
	str ip, [r1, #0x18]
	ldr ip, [r0]
	ldr r0, _0222A488 ; =0x000059D9
	sub r3, r3, #3
	str ip, [sp, #0xc]
	bl ov39_02229630
	add sp, sp, #0x1c
	ldmia sp!, {pc}
	.balign 4, 0
_0222A488: .word 0x000059D9
	arm_func_end ov39_0222A434

	arm_func_start ov39_0222A48C
ov39_0222A48C: ; 0x0222A48C
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r2, r3
	ldr r0, _0222A4BC ; =0x000059DA
	add r1, sp, #0
	mvn r3, #0
	bl ov39_02229630
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.balign 4, 0
_0222A4BC: .word 0x000059DA
	arm_func_end ov39_0222A48C

	arm_func_start ov39_0222A4C0
ov39_0222A4C0: ; 0x0222A4C0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _0222A4E8 ; =0x000059DB
	add r1, sp, #0
	mvn r3, #0
	bl ov39_02229630
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0222A4E8: .word 0x000059DB
	arm_func_end ov39_0222A4C0

	arm_func_start ov39_0222A4EC
ov39_0222A4EC: ; 0x0222A4EC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	cmp r1, #0
	ldmleia sp!, {r3, r4, r5, pc}
	ldr lr, _0222A540 ; =ov39_0222AA7C
	mov ip, r5
_0222A504:
	cmp r5, #0
	moveq r4, ip
	beq _0222A524
	ldrb r4, [r0]
	add r3, r5, r1
	add r3, r4, r3
	and r3, r3, #0xff
	ldrb r4, [lr, r3]
_0222A524:
	ldrb r3, [r0, r5]
	add r5, r5, #1
	cmp r5, r1
	eor r3, r4, r3
	strb r3, [r2], #1
	blt _0222A504
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0222A540: .word ov39_0222AA7C
	arm_func_end ov39_0222A4EC

	arm_func_start ov39_0222A544
ov39_0222A544: ; 0x0222A544
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	cmp r1, #0
	ldmleia sp!, {r3, r4, r5, pc}
	ldr lr, _0222A598 ; =ov39_0222AA7C
	mov ip, r5
_0222A55C:
	cmp r5, #0
	moveq r4, ip
	beq _0222A57C
	ldrb r4, [r0]
	add r3, r5, r1
	add r3, r4, r3
	and r3, r3, #0xff
	ldrb r4, [lr, r3]
_0222A57C:
	ldrb r3, [r2, r5]
	eor r3, r3, r4
	strb r3, [r2, r5]
	add r5, r5, #1
	cmp r5, r1
	blt _0222A55C
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0222A598: .word ov39_0222AA7C
	arm_func_end ov39_0222A544

	arm_func_start ov39_0222A59C
ov39_0222A59C: ; 0x0222A59C
	ldr r2, _0222A6C8 ; =0x00005209
	cmp r0, r2
	bgt _0222A5F4
	bge _0222A680
	sub r1, r2, #0x3e8
	cmp r0, r1
	bgt _0222A5E4
	ldr r1, _0222A6CC ; =0x00004E20
	cmp r0, r1
	blt _0222A5D8
	beq _0222A668
	add r1, r1, #1
	cmp r0, r1
	beq _0222A670
	b _0222A6B8
_0222A5D8:
	cmp r0, #0
	beq _0222A660
	b _0222A6B8
_0222A5E4:
	sub r1, r2, #1
	cmp r0, r1
	beq _0222A678
	b _0222A6B8
_0222A5F4:
	add r1, r2, #0x3e8
	cmp r0, r1
	bgt _0222A614
	bge _0222A690
	ldr r1, _0222A6D0 ; =0x000055F0
	cmp r0, r1
	beq _0222A688
	b _0222A6B8
_0222A614:
	ldr r2, _0222A6D4 ; =0x000059D8
	cmp r0, r2
	bgt _0222A628
	beq _0222A698
	b _0222A6B8
_0222A628:
	add r1, r2, #3
	cmp r0, r1
	bgt _0222A6B8
	add r1, r2, #1
	cmp r0, r1
	blt _0222A6B8
	beq _0222A6A0
	add r1, r2, #2
	cmp r0, r1
	beq _0222A6A8
	add r1, r2, #3
	cmp r0, r1
	beq _0222A6B0
	b _0222A6B8
_0222A660:
	mov r0, #0x400
	b _0222A6C0
_0222A668:
	mov r0, #0xe0
	b _0222A6C0
_0222A670:
	mov r0, #0xc
	b _0222A6C0
_0222A678:
	mov r0, #0x220
	b _0222A6C0
_0222A680:
	mov r0, #0xc
	b _0222A6C0
_0222A688:
	mov r0, #0
	b _0222A6C0
_0222A690:
	mov r0, #0x24
	b _0222A6C0
_0222A698:
	ldr r0, _0222A6D8 ; =0x00001D4C
	b _0222A6C0
_0222A6A0:
	mov r0, #0x1c
	b _0222A6C0
_0222A6A8:
	mov r0, #0xc
	b _0222A6C0
_0222A6B0:
	mov r0, #8
	b _0222A6C0
_0222A6B8:
	mvn r0, #0
	bx lr
_0222A6C0:
	add r0, r0, #0x140
	bx lr
	.balign 4, 0
_0222A6C8: .word 0x00005209
_0222A6CC: .word 0x00004E20
_0222A6D0: .word 0x000055F0
_0222A6D4: .word 0x000059D8
_0222A6D8: .word 0x00001D4C
	arm_func_end ov39_0222A59C

	arm_func_start ov39_0222A6DC
ov39_0222A6DC: ; 0x0222A6DC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	ldr r6, _0222A88C ; =_0222A9AC
	add lr, sp, #0
	mov ip, r0
	mov r5, lr
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r6!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldr r4, _0222A890 ; =0x00005209
	ldmia r6, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	cmp ip, r4
	bgt _0222A774
	bge _0222A83C
	ldr r1, _0222A894 ; =0x00004E20
	cmp ip, r1
	bgt _0222A750
	bge _0222A824
	cmp ip, #0
	bgt _0222A874
	mvn r6, #0
	cmp ip, r6
	blt _0222A874
	beq _0222A7E0
	cmp ip, #0
	beq _0222A81C
	b _0222A874
_0222A750:
	add r0, r1, #1
	cmp ip, r0
	bgt _0222A764
	beq _0222A82C
	b _0222A874
_0222A764:
	add r0, r1, #0x3e8
	cmp ip, r0
	beq _0222A834
	b _0222A874
_0222A774:
	add r0, r4, #0x3e8
	cmp ip, r0
	bgt _0222A794
	bge _0222A84C
	ldr r0, _0222A898 ; =0x000055F0
	cmp ip, r0
	beq _0222A844
	b _0222A874
_0222A794:
	ldr r1, _0222A89C ; =0x000059D8
	cmp ip, r1
	bgt _0222A7A8
	beq _0222A854
	b _0222A874
_0222A7A8:
	add r0, r1, #3
	cmp ip, r0
	bgt _0222A874
	add r0, r1, #1
	cmp ip, r0
	blt _0222A874
	beq _0222A85C
	add r0, r1, #2
	cmp ip, r0
	beq _0222A864
	add r0, r1, #3
	cmp ip, r0
	beq _0222A86C
	b _0222A874
_0222A7E0:
	mov r7, #0
	mov r4, r6
_0222A7E8:
	ldr r0, [r5, r7, lsl #2]
	cmp r0, r4
	beq _0222A808
	bl ov39_0222A6DC
	cmp r0, r6
	movgt r6, r0
	add r7, r7, #1
	b _0222A7E8
_0222A808:
	mvn r0, #0
	cmp r6, r0
	bne _0222A880
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0222A81C:
	mov r6, #0x400
	b _0222A880
_0222A824:
	mov r6, #8
	b _0222A880
_0222A82C:
	ldr r6, _0222A8A0 ; =0x0000093C
	b _0222A880
_0222A834:
	mov r6, #8
	b _0222A880
_0222A83C:
	ldr r6, _0222A8A4 ; =0x00002B74
	b _0222A880
_0222A844:
	mov r6, #4
	b _0222A880
_0222A84C:
	mov r6, #0x630
	b _0222A880
_0222A854:
	mov r6, #8
	b _0222A880
_0222A85C:
	ldr r6, _0222A8A8 ; =0x00001C24
	b _0222A880
_0222A864:
	sub r6, r1, #0x3c80
	b _0222A880
_0222A86C:
	mov r6, #0
	b _0222A880
_0222A874:
	add sp, sp, #0x30
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0222A880:
	add r0, r6, #8
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A88C: .word _0222A9AC
_0222A890: .word 0x00005209
_0222A894: .word 0x00004E20
_0222A898: .word 0x000055F0
_0222A89C: .word 0x000059D8
_0222A8A0: .word 0x0000093C
_0222A8A4: .word 0x00002B74
_0222A8A8: .word 0x00001C24
	arm_func_end ov39_0222A6DC

	arm_func_start ov39_0222A8AC
ov39_0222A8AC: ; 0x0222A8AC
	bx lr
	arm_func_end ov39_0222A8AC

	.rodata

_0222A9AC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x4E, 0x00, 0x00, 0x21, 0x4E, 0x00, 0x00, 0x08, 0x52, 0x00, 0x00, 0x09, 0x52, 0x00, 0x00
	.byte 0xF0, 0x55, 0x00, 0x00, 0xF1, 0x55, 0x00, 0x00, 0xD8, 0x59, 0x00, 0x00, 0xD9, 0x59, 0x00, 0x00
	.byte 0xDA, 0x59, 0x00, 0x00, 0xDB, 0x59, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

	.data

_0222AA58:
	.byte 0x00, 0x00, 0x00, 0x00

ov39_0222AA5C: ; 0x0222AA5C
	.byte 0x70, 0x6B, 0x67, 0x64
	.byte 0x73, 0x70, 0x72, 0x6F, 0x64, 0x2E, 0x6E, 0x69, 0x6E, 0x74, 0x65, 0x6E, 0x64, 0x6F, 0x2E, 0x63
	.byte 0x6F, 0x2E, 0x6A, 0x70, 0x00, 0x00, 0x00, 0x00

ov39_0222AA78: ; 0x0222AA78
	.byte 0x2D, 0x2D, 0x00, 0x00

ov39_0222AA7C: ; 0x0222AA7C
	.byte 0x93, 0x18, 0x33, 0x28
	.byte 0x0B, 0x07, 0x03, 0x82, 0x02, 0x43, 0x8A, 0x86, 0xDB, 0x38, 0x34, 0x19, 0xD6, 0xF9, 0x59, 0xB2
	.byte 0xAD, 0x6A, 0x7D, 0xBC, 0xEE, 0xE0, 0x3A, 0x3F, 0xCA, 0x4C, 0x25, 0x68, 0xF4, 0xA9, 0x5B, 0xF7
	.byte 0x22, 0x60, 0x5A, 0x6F, 0xFA, 0x1B, 0x79, 0xE9, 0x17, 0xB1, 0x00, 0x9C, 0xAA, 0x5E, 0x9D, 0xFF
	.byte 0xEA, 0xA0, 0x0D, 0x4B, 0x75, 0xF6, 0x61, 0x85, 0x5D, 0xBB, 0xDC, 0xFB, 0x64, 0x2E, 0x7A, 0xAB
	.byte 0xF1, 0xE8, 0x44, 0x0C, 0xB8, 0x8F, 0xA8, 0x0A, 0x8E, 0xBD, 0xE1, 0x3B, 0xFC, 0x3C, 0x9F, 0x1A
	.byte 0x56, 0xC5, 0xE2, 0xF5, 0x47, 0xD9, 0xD7, 0x8C, 0xCD, 0x97, 0xF0, 0x7B, 0x8B, 0xC3, 0x4F, 0x45
	.byte 0x04, 0x90, 0x81, 0x1E, 0x6B, 0xC9, 0xD3, 0x73, 0xC6, 0xE7, 0x24, 0xBA, 0x32, 0xF3, 0xC0, 0xEC
	.byte 0x57, 0xCC, 0xC4, 0xB6, 0xC1, 0xAE, 0xAF, 0x88, 0xF2, 0x84, 0xCE, 0x4A, 0x0F, 0x94, 0x41, 0xB4
	.byte 0x74, 0x2A, 0xD1, 0x70, 0x1C, 0xD4, 0xB0, 0xC2, 0x09, 0x08, 0x16, 0x9B, 0xB5, 0x8D, 0x2B, 0xD2
	.byte 0x89, 0xB7, 0x99, 0xA1, 0x30, 0x65, 0x54, 0x40, 0x96, 0x71, 0xFE, 0xBF, 0x31, 0x06, 0xE5, 0x14
	.byte 0xE6, 0xDA, 0x48, 0x26, 0xAC, 0x87, 0x9A, 0xD8, 0xA6, 0xEB, 0x92, 0xCF, 0xFD, 0x77, 0x1D, 0x21
	.byte 0x9E, 0x36, 0x35, 0x53, 0x3E, 0xD0, 0xD5, 0x62, 0x58, 0x5F, 0x63, 0x7C, 0x7E, 0x52, 0x29, 0x12
	.byte 0x2C, 0x78, 0x05, 0x91, 0x55, 0xE3, 0xA2, 0xB9, 0xF8, 0x50, 0x95, 0x13, 0x80, 0x7F, 0x11, 0x27
	.byte 0xCB, 0x37, 0x4E, 0x51, 0x15, 0xEF, 0xA7, 0x72, 0x4D, 0x83, 0x49, 0xA4, 0x69, 0xDE, 0x20, 0xA3
	.byte 0x67, 0xDF, 0x10, 0x42, 0x39, 0x6C, 0x2D, 0xC7, 0x23, 0xE4, 0xDD, 0xED, 0xBE, 0x66, 0xB3, 0x2F
	.byte 0x01, 0x6E, 0x6D, 0xC8, 0x1F, 0x98, 0xA5, 0x46, 0x76, 0x5C, 0x3D, 0x0E, 0x00, 0x00, 0x00, 0x00

	.bss

_0222AB84:
	.space 0x6

ov39_0222AB8A: ; 0x0222AB8A
	.space 0x13A

ov39_0222ACC4: ; 0x0222ACC4
	.space 0xC0

ov39_0222AD84: ; 0x0222AD84
	.space 0x74

ov39_0222ADF8: ; 0x0222ADF8
	.space 0xC0

ov39_0222AEB8: ; 0x0222AEB8
	.space 0x818

ov39_0222B6D0: ; 0x0222B6D0
	.space 0x10
