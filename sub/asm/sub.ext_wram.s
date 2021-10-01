	.include "asm/macros.inc"
	.include "global.inc"

	.text

	arm_func_start sub_06000000
sub_06000000: ; 0x06000000
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r1
	ldr r1, [r4]
	ldr r3, _0600018C ; =0x060198A4
	mov r5, r0
	str r1, [r3, #0x540]
	ldr r1, [r5, #0x24]
	ldr r0, _06000190 ; =0x060188A4
	str r1, [r3, #0x544]
	ldr r2, [r5, #0x28]
	ldr r1, _06000194 ; =0x060188C4
	str r2, [r3, #0x548]
	mov ip, #0
	str ip, [r3, #0x54c]
	mov r2, #2
	str ip, [r3, #0x550]
	bl sub_060001CC
	ldr r0, _06000198 ; =0x060188CC
	ldr r1, _0600019C ; =0x060188EC
	mov r2, #4
	bl sub_060001CC
	ldr r0, _060001A0 ; =0x060188FC
	ldr r1, _060001A4 ; =0x0601891C
	mov r2, #4
	bl sub_060001CC
	ldr r0, _060001A8 ; =0x0601892C
	ldr r1, _060001AC ; =0x0601894C
	mov r2, #0x20
	bl sub_060001CC
	ldr r1, _06000190 ; =0x060188A4
	ldr r0, _06000198 ; =0x060188CC
	str r1, [r5, #0x10]
	str r0, [r5, #0x14]
	ldr r2, [r4, #8]
	ldr r1, _0600018C ; =0x060198A4
	ldr r0, _060001B0 ; =0x06019DCC
	str r2, [r1, #0x578]
	ldr r2, [r4, #0x18]
	str r2, [r1, #0x57c]
	ldr r2, [r4, #0x10]
	str r2, [r1, #0x580]
	ldr r2, [r4, #4]
	str r2, [r1, #0x584]
	ldr r2, [r4, #0x14]
	str r2, [r1, #0x588]
	ldr r2, [r4, #0xc]
	str r2, [r1, #0x58c]
	bl sub_060001D4
	mov r0, #0x400
	str r0, [sp]
	ldr r1, [r4, #4]
	ldr r0, _060001B4 ; =0x0380AC9C
	str r1, [sp, #4]
	ldr r1, _060001B8 ; =sub_06000958
	ldr r3, _060001B0 ; =0x06019DCC
	mov r2, #0
	bl sub_060001DC
	ldr r0, _060001B4 ; =0x0380AC9C
	bl sub_060001E4
	mov r0, #0x1000
	str r0, [sp]
	ldr r1, [r4, #0xc]
	ldr r0, _060001BC ; =0x0380ABF8
	str r1, [sp, #4]
	ldr r1, _060001C0 ; =sub_06001E10
	ldr r3, _060001C4 ; =0x060199CC
	mov r2, #0
	bl sub_060001DC
	ldr r0, _060001BC ; =0x0380ABF8
	bl sub_060001E4
	mov r3, #0
	ldr r1, _06000190 ; =0x060188A4
	mov r2, r3
_06000128:
	add r0, r1, r3
	add r0, r0, #0x1000
	add r3, r3, #1
	strb r2, [r0, #0x554]
	cmp r3, #0x20
	blt _06000128
	ldr r0, _0600018C ; =0x060198A4
	str r2, [r0, #0x574]
	bl sub_060001EC
	cmp r0, #0
	bne _06000158
	bl sub_060001F4
_06000158:
	bl sub_060001FC
	ldr r1, _060001C8 ; =sub_060002B4
	mov r0, #0xa
	bl sub_06000204
	mov r0, #2
	str r0, [r5, #0x18]
	ldr r1, [r4, #0x14]
	mov r0, r5
	str r1, [r5, #0xc]
	bl sub_06008B60
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600018C: .word 0x060198A4
_06000190: .word 0x060188A4
_06000194: .word 0x060188C4
_06000198: .word 0x060188CC
_0600019C: .word 0x060188EC
_060001A0: .word 0x060188FC
_060001A4: .word 0x0601891C
_060001A8: .word 0x0601892C
_060001AC: .word 0x0601894C
_060001B0: .word 0x06019DCC
_060001B4: .word 0x0380AC9C
_060001B8: .word sub_06000958
_060001BC: .word 0x0380ABF8
_060001C0: .word sub_06001E10
_060001C4: .word 0x060199CC
_060001C8: .word sub_060002B4
	arm_func_end sub_06000000

	arm_func_start sub_060001CC
sub_060001CC: ; 0x060001CC
	ldr pc, _060001D0 ; =OS_InitMessageQueue
	.align 2, 0
_060001D0: .word OS_InitMessageQueue
	arm_func_end sub_060001CC

	arm_func_start sub_060001D4
sub_060001D4: ; 0x060001D4
	ldr pc, _060001D8 ; =OS_InitMutex
	.align 2, 0
_060001D8: .word OS_InitMutex
	arm_func_end sub_060001D4

	arm_func_start sub_060001DC
sub_060001DC: ; 0x060001DC
	ldr pc, _060001E0 ; =OS_CreateThread
	.align 2, 0
_060001E0: .word OS_CreateThread
	arm_func_end sub_060001DC

	arm_func_start sub_060001E4
sub_060001E4: ; 0x060001E4
	ldr pc, _060001E8 ; =OS_WakeupThreadDirect
	.align 2, 0
_060001E8: .word OS_WakeupThreadDirect
	arm_func_end sub_060001E4

	arm_func_start sub_060001EC
sub_060001EC: ; 0x060001EC
	ldr pc, _060001F0 ; =OS_IsVAlarmAvailable
	.align 2, 0
_060001F0: .word OS_IsVAlarmAvailable
	arm_func_end sub_060001EC

	arm_func_start sub_060001F4
sub_060001F4: ; 0x060001F4
	ldr pc, _060001F8 ; =OS_InitVAlarm
	.align 2, 0
_060001F8: .word OS_InitVAlarm
	arm_func_end sub_060001F4

	arm_func_start sub_060001FC
sub_060001FC: ; 0x060001FC
	ldr pc, _06000200 ; =PXI_Init
	.align 2, 0
_06000200: .word PXI_Init
	arm_func_end sub_060001FC

	arm_func_start sub_06000204
sub_06000204: ; 0x06000204
	ldr pc, _06000208 ; =PXI_SetFifoRecvCallback
	.align 2, 0
_06000208: .word PXI_SetFifoRecvCallback
	arm_func_end sub_06000204

	arm_func_start sub_0600020C
sub_0600020C: ; 0x0600020C
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldr r0, _0600027C ; =0x060188A4
	mov r2, #1
	bl sub_06000284
	ldr r0, _06000280 ; =0x060188FC
	add r1, sp, #0
	mov r2, #1
	bl sub_0600028C
	ldr r1, [sp]
	ldrh r0, [r1, #0xe]
	add r0, r1, r0, lsl #1
	ldrh r0, [r0, #0x14]
	cmp r0, #0xe
	bne _06000270
	bl sub_06000294
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0x13
	strh r1, [r0, #2]
	mov r1, #0x18
	strh r1, [r0, #4]
	bl sub_0600029C
	bl sub_060002A4
	bl sub_060002AC
_06000270:
	ldr r0, [sp]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600027C: .word 0x060188A4
_06000280: .word 0x060188FC
	arm_func_end sub_0600020C

	arm_func_start sub_06000284
sub_06000284: ; 0x06000284
	ldr pc, _06000288 ; =OS_SendMessage
	.align 2, 0
_06000288: .word OS_SendMessage
	arm_func_end sub_06000284

	arm_func_start sub_0600028C
sub_0600028C: ; 0x0600028C
	ldr pc, _06000290 ; =OS_ReceiveMessage
	.align 2, 0
_06000290: .word OS_ReceiveMessage
	arm_func_end sub_0600028C

	arm_func_start sub_06000294
sub_06000294: ; 0x06000294
	ldr pc, _06000298 ; =sub_03806914
	.align 2, 0
_06000298: .word sub_03806914
	arm_func_end sub_06000294

	arm_func_start sub_0600029C
sub_0600029C: ; 0x0600029C
	ldr pc, _060002A0 ; =sub_038068C8
	.align 2, 0
_060002A0: .word sub_038068C8
	arm_func_end sub_0600029C

	arm_func_start sub_060002A4
sub_060002A4: ; 0x060002A4
	ldr pc, _060002A8 ; =SND_BeginSleep
	.align 2, 0
_060002A8: .word SND_BeginSleep
	arm_func_end sub_060002A4

	arm_func_start sub_060002AC
sub_060002AC: ; 0x060002AC
	ldr pc, _060002B0 ; =OS_Terminate
	.align 2, 0
_060002B0: .word OS_Terminate
	arm_func_end sub_060002AC

	arm_func_start sub_060002B4
sub_060002B4: ; 0x060002B4
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r2, #0
	bne _0600030C
	ldr r0, _06000314 ; =0x0601892C
	mov r2, #0
	bl sub_06000284
	cmp r0, #0
	bne _0600030C
	ldr r0, _06000318 ; =0x060198A4
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _0600030C
	bl sub_06000294
	ldrh r2, [r4]
	mov r1, #8
	strh r2, [r0]
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	bl sub_0600029C
_0600030C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06000314: .word 0x0601892C
_06000318: .word 0x060198A4
	arm_func_end sub_060002B4

	arm_func_start sub_0600031C
sub_0600031C: ; 0x0600031C
	ldr r1, _06000378 ; =0x060198A4
	ldrb r2, [r0]
	ldr r3, [r1, #0x550]
	ldrb r1, [r3, #0xe0]
	cmp r2, r1
	ldreqb r2, [r0, #1]
	ldreqb r1, [r3, #0xe1]
	cmpeq r2, r1
	ldreqb r2, [r0, #2]
	ldreqb r1, [r3, #0xe2]
	cmpeq r2, r1
	ldreqb r2, [r0, #3]
	ldreqb r1, [r3, #0xe3]
	cmpeq r2, r1
	ldreqb r2, [r0, #4]
	ldreqb r1, [r3, #0xe4]
	cmpeq r2, r1
	ldreqb r1, [r0, #5]
	ldreqb r0, [r3, #0xe5]
	cmpeq r1, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_06000378: .word 0x060198A4
	arm_func_end sub_0600031C

	arm_func_start sub_0600037C
sub_0600037C: ; 0x0600037C
	stmdb sp!, {r3, lr}
	ldr r3, [r1, #8]
	mov r2, r0
	str r3, [r2, #4]
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #8]
	ldrh r0, [r1, #0x12]
	cmp r0, #0
	movne r3, #2
	ldrh r0, [r1, #0xe]
	moveq r3, #0
	cmp r0, #0
	movne ip, #1
	ldrh r0, [r1, #0x14]
	moveq ip, #0
	cmp r0, #0
	movne lr, #4
	moveq lr, #0
	orr r0, ip, r3
	orr r0, lr, r0
	strb r0, [r2, #0xb]
	ldrh r3, [r1, #4]
	mov r0, #1
	strb r3, [r2, #0xa]
	strh r0, [r2]
	strb r0, [r2, #2]
	mov r0, #0
	strb r0, [r2, #3]
	ldrh r0, [r1, #0x34]
	strh r0, [r2, #0xc]
	ldrh r0, [r1, #0x12]
	cmp r0, #0
	beq _06000410
	ldrh r0, [r1, #0x36]
	cmp r0, #8
	movhs r0, #8
	bhs _06000414
_06000410:
	ldrh r0, [r1, #0x36]
_06000414:
	strh r0, [r2, #0xe]
	ldrb r3, [r2, #0xa]
	cmp r3, #0
	beq _06000438
	ldr r0, [r1]
	add r3, r3, #1
	add r1, r2, #0x10
	bic r2, r3, #1
	bl sub_06000440
_06000438:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_0600037C

	arm_func_start sub_06000440
sub_06000440: ; 0x06000440
	ldr pc, _06000444 ; =MI_CpuCopy8
	.align 2, 0
_06000444: .word MI_CpuCopy8
	arm_func_end sub_06000440

	arm_func_start sub_06000448
sub_06000448: ; 0x06000448
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _06000590 ; =0x060198A4
	mov r5, r1
	ldr r4, [r2, #0x550]
	mov r6, r0
	add r0, r4, #0xe0
	add r1, r5, #0x10
	mov r2, #6
	bl sub_06000440
	mov r0, #7
	strh r0, [r5, #0x16]
	add r0, r4, #0x100
	ldrh r1, [r0, #0xf4]
	strh r1, [r5, #0x18]
	ldrh r1, [r0, #0xec]
	strh r1, [r5, #0x1e]
	ldrh r1, [r4, #0xe6]
	strh r1, [r5, #0x1c]
	ldr r1, [r4, #0x198]
	cmp r1, #0
	bne _060004BC
	mov r0, #0
	strh r0, [r5, #0x20]
	add r1, r5, #0x24
	mov r2, #0x50
	strh r0, [r5, #0x22]
	bl sub_06000598
	mov r0, #0
	b _060004E0
_060004BC:
	ldrh r1, [r0, #0x96]
	add r0, r4, #0x19c
	strh r1, [r5, #0x20]
	ldrh r2, [r4, #0xc4]
	add r1, r5, #0x24
	strh r2, [r5, #0x22]
	mov r2, #0x50
	bl sub_06000440
	mov r0, #1
_060004E0:
	strh r0, [r5, #0x9e]
	mov r0, #1
	strh r0, [r5, #0x74]
	strh r0, [r5, #0x76]
	ldrh r0, [r4, #0xe6]
	add r1, r5, #0x7c
	cmp r0, #1
	moveq r0, #0
	movne r0, #0x10
	strh r0, [r5, #0x78]
	mov r0, #0xa
	strh r0, [r5, #0x7a]
	cmp r6, #0x26
	mov r0, #0
	bne _06000528
	mov r2, #0x20
	bl sub_06000598
	b _06000540
_06000528:
	mov r2, #8
	bl sub_06000598
	ldr r0, _06000594 ; =0x0000FFFF
	add r1, r5, #0x84
	mov r2, #0x18
	bl sub_06000598
_06000540:
	add r0, r4, #0x100
	ldrh r1, [r0, #0xee]
	mov r0, r5
	strh r1, [r5, #0x9c]
	bl sub_06002554
	ldrh r4, [r0, #4]
	cmp r4, #0
	moveq r0, #1
	beq _06000588
	bl sub_06000294
	strh r6, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #0x200
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_0600029C
	mov r0, #0
_06000588:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_06000590: .word 0x060198A4
_06000594: .word 0x0000FFFF
	arm_func_end sub_06000448

	arm_func_start sub_06000598
sub_06000598: ; 0x06000598
	ldr pc, _0600059C ; =MIi_CpuClear16
	.align 2, 0
_0600059C: .word MIi_CpuClear16
	arm_func_end sub_06000598

	arm_func_start sub_060005A0
sub_060005A0: ; 0x060005A0
	ldr r1, _060005D8 ; =0x060198A4
	ldr r3, _060005DC ; =0x06019DF8
	ldr ip, [r1, #0x574]
	ldr r2, _060005E0 ; =0x027FFF98
	strb r0, [r3, ip]
	ldr r3, [r1, #0x574]
	add r3, r3, #1
	and r3, r3, #0x1f
	str r3, [r1, #0x574]
	ldrh r1, [r2]
	eor r0, r0, r1, lsl #1
	eor r0, r0, r0, lsr #16
	strh r0, [r2]
	bx lr
	.align 2, 0
_060005D8: .word 0x060198A4
_060005DC: .word 0x06019DF8
_060005E0: .word 0x027FFF98
	arm_func_end sub_060005A0

	arm_func_start sub_060005E4
sub_060005E4: ; 0x060005E4
	ldr r2, _06000614 ; =0x060188A4
	mov r3, #0
_060005EC:
	add r1, r2, r3
	add r1, r1, #0x1000
	add r3, r3, #1
	strb r0, [r1, #0x554]
	cmp r3, #0x20
	blt _060005EC
	ldr r0, _06000618 ; =0x060198A4
	mov r1, #0
	str r1, [r0, #0x574]
	bx lr
	.align 2, 0
_06000614: .word 0x060188A4
_06000618: .word 0x060198A4
	arm_func_end sub_060005E4

	arm_func_start sub_0600061C
sub_0600061C: ; 0x0600061C
	ldr r1, _06000650 ; =0x060188A4
	mov r3, #0
	mov r2, r3
_06000628:
	add r0, r1, r2
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x554]
	add r2, r2, #1
	cmp r2, #0x20
	add r3, r3, r0
	blt _06000628
	ldr ip, _06000654 ; =sub_06000658
	mov r0, r3, lsr #5
	bx ip
	.align 2, 0
_06000650: .word 0x060188A4
_06000654: .word sub_06000658
	arm_func_end sub_0600061C

	arm_func_start sub_06000658
sub_06000658: ; 0x06000658
	ldr r1, _060006BC ; =0x060198A4
	ldr r1, [r1, #0x54c]
	ldrb r1, [r1, #0x53]
	cmp r1, #8
	bne _06000694
	cmp r0, #0x16
	movlo r0, #0
	bxlo lr
	cmp r0, #0x1c
	movlo r0, #1
	bxlo lr
	cmp r0, #0x22
	movlo r0, #2
	movhs r0, #3
	bx lr
_06000694:
	cmp r0, #8
	movlo r0, #0
	bxlo lr
	cmp r0, #0xe
	movlo r0, #1
	bxlo lr
	cmp r0, #0x14
	movlo r0, #2
	movhs r0, #3
	bx lr
	.align 2, 0
_060006BC: .word 0x060198A4
	arm_func_end sub_06000658

	arm_func_start sub_060006C0
sub_060006C0: ; 0x060006C0
	stmdb sp!, {r4, lr}
	bl sub_06000720
	mov r4, r0
	bl sub_06000728
	ldr r1, _06000714 ; =0x060198A4
	ldr r0, _06000718 ; =0x0380ABF8
	ldr r1, [r1, #0x58c]
	bl sub_06000730
	bl sub_06008D40
	ldr r1, _06000714 ; =0x060198A4
	ldr r1, [r1, #0x588]
	bl sub_06000730
	ldr r1, _06000714 ; =0x060198A4
	ldr r0, _0600071C ; =0x0380AC9C
	ldr r1, [r1, #0x584]
	bl sub_06000730
	bl sub_06000738
	mov r0, r4
	bl sub_06000740
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06000714: .word 0x060198A4
_06000718: .word 0x0380ABF8
_0600071C: .word 0x0380AC9C
	arm_func_end sub_060006C0

	arm_func_start sub_06000720
sub_06000720: ; 0x06000720
	ldr pc, _06000724 ; =OS_DisableInterrupts
	.align 2, 0
_06000724: .word OS_DisableInterrupts
	arm_func_end sub_06000720

	arm_func_start sub_06000728
sub_06000728: ; 0x06000728
	ldr pc, _0600072C ; =OS_DisableScheduler
	.align 2, 0
_0600072C: .word OS_DisableScheduler
	arm_func_end sub_06000728

	arm_func_start sub_06000730
sub_06000730: ; 0x06000730
	ldr pc, _06000734 ; =OS_SetThreadPriority
	.align 2, 0
_06000734: .word OS_SetThreadPriority
	arm_func_end sub_06000730

	arm_func_start sub_06000738
sub_06000738: ; 0x06000738
	ldr pc, _0600073C ; =OS_EnableScheduler
	.align 2, 0
_0600073C: .word OS_EnableScheduler
	arm_func_end sub_06000738

	arm_func_start sub_06000740
sub_06000740: ; 0x06000740
	ldr pc, _06000744 ; =OS_RestoreInterrupts
	.align 2, 0
_06000744: .word OS_RestoreInterrupts
	arm_func_end sub_06000740

	arm_func_start sub_06000748
sub_06000748: ; 0x06000748
	stmdb sp!, {r4, lr}
	bl sub_06000720
	mov r4, r0
	bl sub_06000728
	ldr r1, _0600079C ; =0x060198A4
	ldr r0, _060007A0 ; =0x0380AC9C
	ldr r1, [r1, #0x578]
	bl sub_06000730
	bl sub_06008D40
	ldr r1, _0600079C ; =0x060198A4
	ldr r1, [r1, #0x57c]
	bl sub_06000730
	ldr r1, _0600079C ; =0x060198A4
	ldr r0, _060007A4 ; =0x0380ABF8
	ldr r1, [r1, #0x580]
	bl sub_06000730
	bl sub_06000738
	mov r0, r4
	bl sub_06000740
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600079C: .word 0x060198A4
_060007A0: .word 0x0380AC9C
_060007A4: .word 0x0380ABF8
	arm_func_end sub_06000748

	arm_func_start sub_060007A8
sub_060007A8: ; 0x060007A8
	ldr r0, _060007B0 ; =0x0380ABF8
	bx lr
	.align 2, 0
_060007B0: .word 0x0380ABF8
	arm_func_end sub_060007A8

	arm_func_start sub_060007B4
sub_060007B4: ; 0x060007B4
	ldr r0, _060007BC ; =0x0380AC9C
	bx lr
	.align 2, 0
_060007BC: .word 0x0380AC9C
	arm_func_end sub_060007B4

	arm_func_start sub_060007C0
sub_060007C0: ; 0x060007C0
	stmdb sp!, {r4, lr}
	mov r4, #0
	bl sub_06000720
	ldr r1, _06000828 ; =0x060198A4
	ldr r2, [r1, #0x54c]
	cmp r2, #0
	beq _06000818
	mov r3, r4
	b _06000810
_060007E4:
	add r1, r2, r3, lsl #4
	ldr r1, [r1, #0xd0]
	tst r1, #0x8000
	beq _0600080C
	add r2, r2, #0xd0
	ldr r1, [r2, r3, lsl #4]
	add r4, r2, r3, lsl #4
	bic r1, r1, #0x8000
	str r1, [r2, r3, lsl #4]
	b _06000818
_0600080C:
	add r3, r3, #1
_06000810:
	cmp r3, #0x20
	blt _060007E4
_06000818:
	bl sub_06000740
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06000828: .word 0x060198A4
	arm_func_end sub_060007C0

	arm_func_start sub_0600082C
sub_0600082C: ; 0x0600082C
	ldr r0, _0600085C ; =0x060198A4
	mov r1, #0
	ldr r0, [r0, #0x550]
	strh r1, [r0, #0x38]
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x30]
	strh r1, [r0, #0x32]
	strh r1, [r0, #0x3c]
	strh r1, [r0, #0x3e]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x36]
	bx lr
	.align 2, 0
_0600085C: .word 0x060198A4
	arm_func_end sub_0600082C

	arm_func_start sub_06000860
sub_06000860: ; 0x06000860
	ldr r1, _060008AC ; =0x060198A4
	cmp r0, #0x200
	ldr r2, [r1, #0x550]
	movhi r0, #0x200
	strh r0, [r2, #0x30]
	strh r0, [r2, #0x34]
	add r1, r2, #0x100
	ldrh r1, [r1, #0x88]
	add r0, r0, #4
	cmp r1, #0
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	streqh r0, [r2, #0x3c]
	streqh r0, [r2, #0x38]
	movne r0, r0, lsl #0x10
	movne r0, r0, lsr #0x10
	strneh r0, [r2, #0x3e]
	strneh r0, [r2, #0x3a]
	bx lr
	.align 2, 0
_060008AC: .word 0x060198A4
	arm_func_end sub_06000860

	arm_func_start sub_060008B0
sub_060008B0: ; 0x060008B0
	ldr r1, _060008FC ; =0x060198A4
	cmp r0, #0x200
	ldr r2, [r1, #0x550]
	movhi r0, #0x200
	strh r0, [r2, #0x36]
	strh r0, [r2, #0x32]
	add r1, r2, #0x100
	ldrh r1, [r1, #0x88]
	add r0, r0, #2
	cmp r1, #0
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	streqh r0, [r2, #0x3e]
	streqh r0, [r2, #0x3a]
	movne r0, r0, lsl #0x10
	movne r0, r0, lsr #0x10
	strneh r0, [r2, #0x3c]
	strneh r0, [r2, #0x38]
	bx lr
	.align 2, 0
_060008FC: .word 0x060198A4
	arm_func_end sub_060008B0

	arm_func_start sub_06000900
sub_06000900: ; 0x06000900
	ldr r1, _06000928 ; =0x060198A4
	ldr r2, [r1, #0x550]
	strh r0, [r2, #0x30]
	add r1, r2, #0x100
	ldrh r1, [r1, #0x88]
	add r0, r0, #4
	cmp r1, #0
	streqh r0, [r2, #0x38]
	strneh r0, [r2, #0x3a]
	bx lr
	.align 2, 0
_06000928: .word 0x060198A4
	arm_func_end sub_06000900

	arm_func_start sub_0600092C
sub_0600092C: ; 0x0600092C
	ldr r1, _06000954 ; =0x060198A4
	ldr r2, [r1, #0x550]
	strh r0, [r2, #0x32]
	add r1, r2, #0x100
	ldrh r1, [r1, #0x88]
	add r0, r0, #2
	cmp r1, #0
	streqh r0, [r2, #0x3a]
	strneh r0, [r2, #0x38]
	bx lr
	.align 2, 0
_06000954: .word 0x060198A4
	arm_func_end sub_0600092C

	arm_func_start sub_06000958
sub_06000958: ; 0x06000958
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
_06000960:
	ldr r0, _060017D4 ; =0x060188A4
	add r1, sp, #0x24
	add r0, r0, #0x28
	mov r2, #1
	bl sub_0600028C
	ldr sb, [sp, #0x24]
	cmp sb, #0
	bne _06000988
	bl sub_06001AEC
	b _06001AD4
_06000988:
	ldrh r1, [sb, #0xc]
	and r0, r1, #0xff00
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	and r1, r1, #0xff
	cmpne r0, #0x100
	bne _06001ABC
	tst r1, #0x80
	beq _06001ABC
	ldr r0, _060017D8 ; =0x060198A4
	ldr r1, [r0, #0x54c]
	cmp r1, #0
	ldrne r8, [r0, #0x550]
	ldrneh r3, [r8]
	cmpne r3, #1
	beq _06000960
	ldrh r2, [sb, #0xc]
	ldr r1, _060017DC ; =0x00000182
	cmp r2, r1
	bgt _06000A24
	bge _060010DC
	cmp r2, #0x8d
	bgt _06000A18
	subs r0, r2, #0x84
	addpl pc, pc, r0, lsl #2
	b _06001AB0
_060009F0: ; jump table
	b _06000A50 ; case 0
	b _06000A74 ; case 1
	b _06000D00 ; case 2
	b _06000E64 ; case 3
	b _06000E88 ; case 4
	b _06001AB0 ; case 5
	b _06001AB0 ; case 6
	b _06000EAC ; case 7
	b _06000EDC ; case 8
	b _06000F0C ; case 9
_06000A18:
	cmp r2, #0x180
	beq _06001024
	b _06001AB0
_06000A24:
	add r0, r1, #3
	cmp r2, r0
	bgt _06000A40
	bge _06001754
	cmp r2, #0x184
	beq _060013D4
	b _06001AB0
_06000A40:
	add r0, r1, #4
	cmp r2, r0
	beq _060019B8
	b _06001AB0
_06000A50:
	bl sub_06000294
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x13
	strh r1, [r0, #4]
	bl sub_0600029C
	b _06001AB0
_06000A74:
	cmp r3, #7
	cmpne r3, #9
	bne _06000BFC
	add r1, sp, #0x1c
	add r0, sb, #0x10
	mov r2, #6
	bl sub_06000440
	mov r6, #0
	mov r5, r6
	add r4, r8, #0x100
	mov sl, #1
	b _06000B74
_06000AA4:
	bl sub_06000720
	ldrh r2, [r4, #0x82]
	add r1, r5, #1
	mov r7, r0
	tst r2, sl, lsl r1
	beq _06000B68
	mov r0, #6
	mul r2, r5, r0
	add r0, r8, r2
	ldrb fp, [sp, #0x1c]
	ldrb r3, [r0, #0x128]
	cmp fp, r3
	ldreqb fp, [sp, #0x1d]
	ldreqb r3, [r0, #0x129]
	cmpeq fp, r3
	ldreqb fp, [sp, #0x1e]
	ldreqb r3, [r0, #0x12a]
	cmpeq fp, r3
	ldreqb fp, [sp, #0x1f]
	ldreqb r3, [r0, #0x12b]
	cmpeq fp, r3
	ldreqb fp, [sp, #0x20]
	ldreqb r3, [r0, #0x12c]
	cmpeq fp, r3
	ldreqb r3, [sp, #0x21]
	ldreqb r0, [r0, #0x12d]
	cmpeq r3, r0
	bne _06000B68
	add r3, r8, #0x100
	mov r0, r1, lsl #0x10
	mov r6, r0, lsr #0x10
	ldrh r0, [r3, #0x82]
	mvn r1, sl, lsl r6
	and r0, r0, r1
	strh r0, [r3, #0x82]
	ldrh r0, [r8, #0x86]
	add r3, r8, r6, lsl #3
	and r1, r0, r1
	add r0, r8, #0x128
	strh r1, [r8, #0x86]
	mov r1, #0
	str r1, [r3, #0x738]
	add r0, r0, r2
	mov r2, #6
	str r1, [r3, #0x73c]
	bl sub_06001AF4
	mov r0, r7
	bl sub_06000740
	b _06000B7C
_06000B68:
	mov r0, r7
	bl sub_06000740
	add r5, r5, #1
_06000B74:
	cmp r5, #0xf
	blt _06000AA4
_06000B7C:
	cmp r6, #0
	beq _06001AB0
	bl sub_06000294
	mov r4, r0
	mov r0, #8
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #9
	strh r0, [r4, #8]
	ldrh r1, [sb, #0x16]
	add r0, sb, #0x10
	strh r1, [r4, #0x12]
	strh r6, [r4, #0x10]
	add r1, r4, #0xa
	mov r2, #6
	bl sub_06000440
	ldrh r1, [r8, #0x30]
	mov r0, r4
	strh r1, [r4, #0x2c]
	ldrh r1, [r8, #0x32]
	strh r1, [r4, #0x2e]
	bl sub_0600029C
	ldr r0, [r8, #0xc]
	cmp r0, #1
	bne _06001AB0
	mov r0, #1
	mov r0, r0, lsl r6
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_060079AC
	b _06001AB0
_06000BFC:
	mov r5, #0
	bl sub_06000720
	add r1, r8, #0x100
	ldrh r1, [r1, #0x82]
	mov r4, r0
	cmp r1, #0
	bne _06000C20
	bl sub_06000740
	b _06001AB0
_06000C20:
	ldr r0, [r8, #0xc]
	cmp r0, #1
	bne _06000C40
	mov r0, r5
	str r0, [r8, #0xc]
	mov r5, #1
	bl sub_06005CEC
	bl sub_060006C0
_06000C40:
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0, #0x82]
	strh r1, [r8, #0x86]
	str r1, [r8, #0x14]
	str r1, [r8, #0x10]
	str r1, [r8, #0x1c]
	str r1, [r8, #0x198]
	strh r1, [r0, #0x96]
	add r0, r8, #0x19c
	mov r2, #0x50
	bl sub_06001AF4
	bl sub_0600082C
	mov r0, #0
	strh r0, [r8, #0xc2]
	mov r1, #3
	mov r0, r4
	strh r1, [r8]
	bl sub_06000740
	bl sub_06000294
	mov r4, r0
	mov r0, #0xc
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #9
	strh r0, [r4, #8]
	ldrh r1, [sb, #0x16]
	add r0, r8, #0x100
	strh r1, [r4, #0xc]
	ldrh r1, [r0, #0x88]
	add r0, r8, #0x8a
	strh r1, [r4, #0xa]
	add r0, r0, #0x100
	add r1, r4, #0x10
	mov r2, #6
	bl sub_06000440
	ldrh r1, [r8, #0x30]
	mov r0, r4
	strh r1, [r4, #0x16]
	ldrh r1, [r8, #0x32]
	strh r1, [r4, #0x18]
	bl sub_0600029C
	cmp r5, #0
	beq _06001AB0
	mov r0, #1
	bl sub_060079AC
	b _06001AB0
_06000D00:
	ldrh r5, [sb, #0x16]
	cmp r5, #0
	beq _06001AB0
	cmp r5, #0x10
	bhs _06001AB0
	ldrh r0, [r8, #0xf6]
	cmp r0, #0
	bne _06000D8C
	bl sub_060007C0
	movs r4, r0
	moveq r0, #0
	beq _06000D58
	mov r3, #0x22
	add r0, sb, #0x10
	add r1, r4, #4
	mov r2, #6
	str r3, [r4]
	bl sub_06000440
	ldr r0, _060017E0 ; =0x0601892C
	mov r1, r4
	mov r2, #0
	bl sub_06000284
_06000D58:
	cmp r0, #0
	bne _06001AB0
	bl sub_06000294
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x22
	strh r1, [r0, #6]
	bl sub_0600029C
	b _06001AB0
_06000D8C:
	bl sub_06000720
	add r1, r8, #0x100
	mov r4, #1
	ldrh r3, [r1, #0x82]
	mvn r2, r4, lsl r5
	orr r3, r3, r4, lsl r5
	strh r3, [r1, #0x82]
	ldrh r1, [r8, #0x86]
	mov r4, r0
	and r0, r1, r2
	strh r0, [r8, #0x86]
	bl sub_06001AFC
	orr r2, r0, #1
	add r0, r8, r5, lsl #3
	add r3, r8, #0x128
	str r2, [r0, #0x738]
	orr r1, r1, #0
	str r1, [r0, #0x73c]
	sub r0, r5, #1
	mov r2, #6
	mla r1, r0, r2, r3
	add r0, sb, #0x10
	bl sub_06000440
	mov r0, r4
	bl sub_06000740
	mov r0, #1
	add r1, r8, #0x1f8
	add r1, r1, r5, lsl #4
	mov r2, #0x10
	bl sub_06000598
	bl sub_06000294
	mov r4, r0
	mov r0, #8
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #7
	strh r0, [r4, #8]
	add r0, sb, #0x10
	add r1, r4, #0xa
	mov r2, #6
	bl sub_06000440
	strh r5, [r4, #0x10]
	add r0, sb, #0x22
	add r1, r4, #0x14
	mov r2, #0x18
	bl sub_06001B04
	ldrh r1, [r8, #0x30]
	mov r0, r4
	strh r1, [r4, #0x2c]
	ldrh r1, [r8, #0x32]
	strh r1, [r4, #0x2e]
	bl sub_0600029C
	b _06001AB0
_06000E64:
	bl sub_06000294
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x12
	strh r1, [r0, #4]
	bl sub_0600029C
	b _06001AB0
_06000E88:
	bl sub_06000294
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x11
	strh r1, [r0, #4]
	bl sub_0600029C
	b _06001AB0
_06000EAC:
	ldrh r0, [r8, #0xc2]
	cmp r0, #0
	beq _06001AB0
	bl sub_06000294
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #8
	strh r1, [r0, #8]
	bl sub_0600029C
	b _06001AB0
_06000EDC:
	ldrh r0, [r8, #0xc2]
	cmp r0, #0
	beq _06001AB0
	bl sub_06000294
	mov r1, #8
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #2
	strh r1, [r0, #8]
	bl sub_0600029C
	b _06001AB0
_06000F0C:
	ldrb r0, [sb, #0x1f]
	bl sub_06001B5C
	ldr r2, _060017E4 ; =0x027FFF98
	ldrh r1, [r2]
	eor r0, r0, r1, lsl #1
	eor r0, r0, r0, lsr #16
	strh r0, [r2]
	ldrh r0, [r8]
	cmp r0, #8
	cmpne r0, #0xa
	bne _06001AB0
	ldrh r1, [r8, #0xba]
	ldrh r0, [sb, #0x44]
	cmp r1, r0
	beq _06000FB0
	bl sub_060007C0
	movs r1, r0
	moveq r0, #0
	beq _06000F7C
	mov r0, #0x25
	str r0, [r1]
	mov r0, #1
	ldr r3, _060017E8 ; =0x00008002
	str r0, [r1, #4]
	ldr r0, _060017E0 ; =0x0601892C
	mov r2, #0
	str r3, [r1, #8]
	bl sub_06000284
_06000F7C:
	cmp r0, #0
	bne _06001AB0
	bl sub_06000294
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x25
	strh r1, [r0, #6]
	bl sub_0600029C
	b _06001AB0
_06000FB0:
	ldr r0, _060017D8 ; =0x060198A4
	ldr r0, [r0, #0x550]
	ldrh r0, [r0, #0xc2]
	cmp r0, #0
	beq _06001AB0
	bl sub_06000294
	mov r4, r0
	mov r0, #0x80
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #0x10
	strh r0, [r4, #4]
	ldrh r0, [sb, #0x44]
	strh r0, [r4, #6]
	ldrh r0, [r8]
	strh r0, [r4, #8]
	ldrh r0, [sb, #0x16]
	strh r0, [r4, #0xa]
	cmp r0, #0x80
	bhi _06001018
	add r2, r0, #1
	add r0, sb, #0x3c
	add r1, r4, #0xc
	bic r2, r2, #1
	bl sub_06001B04
_06001018:
	mov r0, r4
	bl sub_0600029C
	b _06001AB0
_06001024:
	ldr r0, [r8, #0x10]
	cmp r0, #0
	beq _06001AB0
	ldrb r0, [sb, #0x1f]
	bl sub_06001B5C
	bl sub_060005A0
	bl sub_0600061C
	strh r0, [r8, #0xbc]
	add r0, sb, #0x2e
	bl sub_0600031C
	cmp r0, #1
	beq _06001AB0
	ldrh r1, [sb, #0x16]
	ldr r0, _060017EC ; =0x000005E4
	cmp r1, r0
	bhi _06001AB0
	ldrh r1, [r8, #0xae]
	add r0, sb, #0x10
	eor r1, r1, #1
	strh r1, [r8, #0xae]
	ldrh r2, [r8, #0xae]
	ldrh r1, [sb, #0x16]
	add r2, r8, r2, lsl #2
	ldr r4, [r2, #0xb0]
	add r2, r1, #0x2d
	mov r1, r4
	bic r2, r2, #1
	bl sub_06000440
	add r0, sb, #0x28
	add r1, r4, #0x18
	mov r2, #6
	bl sub_06000440
	add r0, sb, #0x2e
	add r1, r4, #0x1e
	mov r2, #6
	bl sub_06000440
	bl sub_06000294
	mov r1, #0x11
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xf
	strh r1, [r0, #4]
	str r4, [r0, #8]
	bl sub_0600029C
	b _06001AB0
_060010DC:
	ldrb r0, [sb, #0x1f]
	bl sub_06001B5C
	ldrh r1, [r8, #0xbe]
	cmp r1, r0
	strhih r0, [r8, #0xbe]
	ldr r0, [r8, #0xc]
	cmp r0, #0
	beq _06001AB0
	ldrh r0, [r8, #0x60]
	cmp r0, #1
	moveq r0, #0
	streqh r0, [r8, #0x60]
	ldrh r0, [r8, #0x70]
	ldrh sl, [r8, #0x8e]
	eor r0, r0, #1
	strh r0, [r8, #0x70]
	ldrh r0, [r8, #0x70]
	ldrh r1, [sb, #0x16]
	add r3, r8, r0, lsl #2
	ldrh r0, [r8, #0x72]
	add r2, r1, #0x30
	ldr r4, [r3, #0x74]
	cmp r0, r2
	movlo r2, r0
	mov r1, r4
	add r0, sb, #0x10
	bl sub_06000440
	bl sub_06000720
	ldrh r1, [r8, #0x84]
	mov fp, r0
	cmp r1, #1
	mov r5, #0
	bne _0600116C
	ldr r0, _060017F0 ; =0x0380AD40
	mov r5, #1
	bl sub_06001B0C
_0600116C:
	mov r7, #1
	strh r7, [r8, #0x84]
	ldrh r0, [r4, #0xa]
	ldr r2, _060017F4 ; =0x000082EA
	strh r0, [r8, #0x82]
	ldrh r6, [sb, #0x18]
	mov r0, #0
	tst r6, #0x2000
	moveq r7, #0
	strh r7, [r8, #0x90]
	str r0, [sp]
	ldrh r1, [r4, #0xa]
	ldrh r0, [r4, #0xc]
	sub r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	add r0, r0, #0x80
	mov r3, r0, lsl #4
	umull r1, r0, r3, r2
	mov r3, r3, asr #0x1f
	mla r0, r3, r2, r0
	mov r1, r1, lsr #6
	orr r1, r1, r0, lsl #26
	mov r3, r0, lsr #6
	mov r1, r1, lsr #0xa
	ldr r0, _060017F0 ; =0x0380AD40
	mov r2, r3, lsr #0xa
	orr r1, r1, r3, lsl #22
	ldr r3, _060017F8 ; =sub_06001C84
	bl sub_06001B14
	and r0, r6, #0x2800
	cmp r0, #0x2800
	moveq r1, #1
	and r0, r6, #0x6000
	movne r1, #0
	cmp r0, #0x6000
	moveq r2, #1
	movne r2, #0
	cmp r2, #0
	movne r0, #0
	strneh r0, [r8, #0x8a]
	cmp r1, #0
	movne r0, #1
	moveq r0, #0
	strh r0, [r8, #0x8e]
	cmp r2, #0
	movne r0, #1
	moveq r0, #0
	strh r0, [r8, #0x8c]
	cmp r7, #0
	beq _06001274
	ldrh r0, [r4, #0x2c]
	sub r1, r0, #0x66
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r0, r0, asr #2
	subs r1, r0, #0x20
	bmi _06001274
	ldrh r0, [r8, #0x32]
	cmp r1, #0x200
	movgt r1, #0x200
	cmp r1, r0
	beq _06001274
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0600092C
_06001274:
	mov r0, fp
	bl sub_06000740
	cmp r5, #0
	beq _060012C0
	cmp sl, #1
	bne _06001298
	mov r0, r5
	mov r1, #0
	bl sub_0600767C
_06001298:
	bl sub_06000294
	mov r1, #0xe
	strh r1, [r0]
	mov r1, #9
	strh r1, [r0, #2]
	mov r1, #0xd
	strh r1, [r0, #4]
	mov r1, #0
	str r1, [r0, #8]
	bl sub_0600029C
_060012C0:
	cmp r7, #0
	bne _060012EC
	ldrh r0, [r4, #6]
	cmp r0, #2
	blo _06001AB0
	ldrh r0, [r4, #0x30]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	strh r0, [r8, #0x5e]
	b _06001AB0
_060012EC:
	add r0, sb, #0x28
	add r1, r4, #0x18
	mov r2, #6
	bl sub_06000440
	add r0, sb, #0x2e
	add r1, r4, #0x1e
	mov r2, #6
	bl sub_06000440
	ldrh r0, [r4, #6]
	cmp r0, #2
	blo _0600137C
	sub r0, r0, #2
	strh r0, [r4, #6]
	ldrh r0, [r4, #0x30]
	tst r0, #0x8000
	movne r0, #1
	moveq r0, #0
	strh r0, [r8, #0x5e]
	bl sub_06000294
	mov r1, #0xe
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xc
	strh r1, [r0, #4]
	str r4, [r0, #8]
	bl sub_0600029C
	ldrh r3, [r4, #6]
	cmp r3, #0
	beq _060013A8
	str r4, [sp]
	ldrh r1, [r4, #0x30]
	add r2, r4, #0x32
	mov r0, #0
	bl sub_06007BA0
	b _060013A8
_0600137C:
	mov r0, #0
	strh r0, [r4, #6]
	strh r0, [r8, #0x5e]
	bl sub_06000294
	mov r1, #0xe
	strh r1, [r0]
	strh r1, [r0, #2]
	mov r1, #0xc
	strh r1, [r0, #4]
	str r4, [r0, #8]
	bl sub_0600029C
_060013A8:
	ldr r0, [r8, #0x7bc]
	ldr r1, [r8, #0x7b8]
	cmp r0, #0
	cmpeq r1, #0
	beq _06001AB0
	bl sub_06001AFC
	orr r0, r0, #1
	str r0, [r8, #0x738]
	orr r0, r1, #0
	str r0, [r8, #0x73c]
	b _06001AB0
_060013D4:
	ldr r1, [r8, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	cmp r1, #0
	beq _06001AB0
	ldrh r0, [sb, #0x12]
	cmp r0, #0
	bne _0600140C
	ldrh r1, [r8, #0x66]
	cmp r1, #1
	bne _06001414
	ldrh r0, [sb, #0x10]
	cmp r0, #0
	beq _06001414
_0600140C:
	bl sub_06001B70
	b _06001AB0
_06001414:
	cmp r1, #0
	movne r0, #0
	strneh r0, [r8, #0x66]
	ldrh r1, [sb, #0x16]
	ldrh r0, [sb, #0x14]
	ldrh r3, [r8, #0x70]
	mul r2, r1, r0
	add r1, r8, r3, lsl #2
	ldr r6, [r1, #0x74]
	ldrh r0, [r8, #0x72]
	add r2, r2, #0xa
	cmp r0, r2
	movlo r2, r0
	mov r1, r6
	add r0, sb, #0x10
	bl sub_06000440
	ldr r0, _060017D8 ; =0x060198A4
	ldrh r1, [r6]
	ldr r7, [r0, #0x550]
	cmp r1, #0
	ldrh r4, [r7, #0xbe]
	bne _060014B0
	ldrh r0, [sb, #0x14]
	cmp r0, #1
	blo _060014B0
	add sl, sb, #0x1a
	mov r5, #0
	b _060014A0
_06001484:
	ldrh r1, [sb, #0x16]
	mla r0, r1, r5, sl
	ldrb r0, [r0, #3]
	bl sub_06001B5C
	cmp r0, r4
	movlo r4, r0
	add r5, r5, #1
_060014A0:
	ldrh r0, [sb, #0x14]
	cmp r5, r0
	blt _06001484
	strh r4, [r7, #0xbe]
_060014B0:
	bl sub_06001AFC
	orr r0, r0, #1
	str r0, [sp, #8]
	ldrh fp, [r6]
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, _060017FC ; =0x00008001
	orr r1, r1, #0
	rsb r0, r0, #0x18000
	mov r4, #0
	str r1, [sp, #0xc]
	add sl, r6, #0xa
	str r0, [sp, #0x18]
	mov r5, r4
	b _0600165C
_060014EC:
	ldrh r7, [sl, #4]
	ldrh r1, [sl]
	cmp r7, #1
	blo _06001640
	cmp r7, #0xf
	bhi _06001640
	cmp r1, #2
	blo _06001568
	ldr r0, [sp, #0x18]
	cmp r1, r0
	beq _06001568
	sub r0, r1, #2
	mov r0, r0, lsl #0x10
	movs r3, r0, lsr #0x10
	strh r3, [sl]
	ldrh r2, [r8, #0x86]
	mov r1, #1
	orr r1, r2, r1, lsl r7
	strh r1, [r8, #0x86]
	ldr r1, [sp, #8]
	add r0, r8, r7, lsl #3
	str r1, [r0, #0x738]
	ldr r1, [sp, #0xc]
	str r1, [r0, #0x73c]
	beq _06001640
	mov r0, r7
	str r6, [sp]
	ldrh r1, [sl, #8]
	add r2, sl, #0xa
	bl sub_06007BA0
	b _06001640
_06001568:
	cmp r1, #0
	bne _06001640
	add r0, r8, r7, lsl #3
	ldr r2, [r0, #0x738]
	ldr r1, [r0, #0x73c]
	mov r0, #1
	mov r0, r0, lsl r7
	str r0, [sp, #4]
	mov r0, #1
	orr fp, fp, r0, lsl r7
	ldr ip, [r8, #0x7bc]
	ldr r0, [r8, #0x7b8]
	cmp ip, #0
	mov r3, #0
	cmpeq r0, r5
	beq _06001640
	cmp r1, r3
	cmpeq r2, r4
	beq _06001640
	ldr r3, [sp, #8]
	subs r3, r3, r2
	ldr r2, [sp, #0xc]
	sbc r1, r2, r1
	cmp r1, ip
	cmpeq r3, r0
	bls _06001640
	bl sub_060007C0
	movs r1, r0
	add r2, r8, r7, lsl #3
	mov r0, #0
	str r0, [r2, #0x738]
	str r0, [r2, #0x73c]
	beq _06001610
	mov r0, #0x25
	str r0, [r1]
	ldr r0, [sp, #4]
	mov r2, #0
	str r0, [r1, #4]
	ldr r0, _060017FC ; =0x00008001
	str r0, [r1, #8]
	ldr r0, _060017E0 ; =0x0601892C
	bl sub_06000284
_06001610:
	cmp r0, #0
	bne _06001640
	bl sub_06000294
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x25
	strh r1, [r0, #6]
	bl sub_0600029C
_06001640:
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [sp, #0x14]
	ldrh r0, [r6, #6]
	add sl, sl, r0
_0600165C:
	ldrh r1, [r6, #4]
	ldr r0, [sp, #0x14]
	cmp r0, r1
	blo _060014EC
	mov r0, fp, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #0
	bl sub_0600767C
	ldrh r0, [r6]
	cmp r0, #0
	movne r0, #1
	strne r0, [sp, #0x10]
	bl sub_06000294
	mov r1, #0xe
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xb
	strh r1, [r0, #4]
	str r6, [r0, #8]
	bl sub_0600029C
	ldrh r0, [r8, #0x70]
	eor r0, r0, #1
	strh r0, [r8, #0x70]
	bl sub_06000720
	ldr r1, [sp, #0x10]
	cmp r1, #0
	ldreqsh r1, [r8, #0x62]
	subeq r1, r1, #1
	streqh r1, [r8, #0x62]
	ldrsh r1, [r8, #0x64]
	cmp r1, #0
	subgt r1, r1, #1
	strgth r1, [r8, #0x64]
	ldrsh r1, [r8, #0x62]
	cmp r1, #0
	ldrgtsh r1, [r8, #0x64]
	cmpgt r1, #0
	movgt r4, #1
	movle r4, #0
	bl sub_06000740
	cmp r4, #0
	beq _06001AB0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	ldreqh r4, [sb, #0x10]
	ldrh r0, [r8, #0x44]
	ldrne r4, _06001800 ; =0x0000FFFF
	cmp r0, #0
	beq _06001748
	ldr r0, _06001804 ; =0x0380AD6C
	bl sub_06001B0C
	str r4, [sp]
	ldr r1, [r8, #0x48]
	ldr r2, [r8, #0x4c]
	ldr r0, _06001804 ; =0x0380AD6C
	ldr r3, _06001808 ; =sub_06001BF0
	bl sub_06001B14
	b _06001AB0
_06001748:
	mov r0, r4
	bl sub_06001C04
	b _06001AB0
_06001754:
	ldr r0, [r8, #0xc]
	mov r5, #0
	cmp r0, #0
	beq _06001AB0
	ldrh r0, [sb, #0xe]
	cmp r0, #0
	bne _060017B4
	ldr r1, _0600180C ; =0x048080F8
	mov r4, #1
	ldrh r0, [r1]
	ldrh r3, [r1, #2]
	ldrh r2, [r1]
	cmp r0, r2
	ldrhih r3, [r1, #2]
	mov r0, r2, asr #4
	orr r0, r0, r3, lsl #12
	ldrh r1, [r8, #0x82]
	mov r0, r0, lsl #0x10
	rsb r0, r1, r0, lsr #16
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
	cmp r0, #0
	ble _06001AB0
	b _060017B8
_060017B4:
	mov r4, r5
_060017B8:
	bl sub_06000720
	ldrh r1, [r8, #0x84]
	mov r7, r0
	cmp r1, #0
	bne _06001810
	bl sub_06000740
	b _06001AB0
	.align 2, 0
_060017D4: .word 0x060188A4
_060017D8: .word 0x060198A4
_060017DC: .word 0x00000182
_060017E0: .word 0x0601892C
_060017E4: .word 0x027FFF98
_060017E8: .word 0x00008002
_060017EC: .word 0x000005E4
_060017F0: .word 0x0380AD40
_060017F4: .word 0x000082EA
_060017F8: .word sub_06001C84
_060017FC: .word 0x00008001
_06001800: .word 0x0000FFFF
_06001804: .word 0x0380AD6C
_06001808: .word sub_06001BF0
_0600180C: .word 0x048080F8
_06001810:
	ldr r0, _060017F0 ; =0x0380AD40
	mov r1, #0
	strh r1, [r8, #0x84]
	ldrh r6, [r8, #0x90]
	bl sub_06001B0C
	mov r0, r7
	bl sub_06000740
	ldrh r3, [r8, #0x8c]
	mov r2, #1
	cmp r3, #0
	beq _0600185C
	cmp r4, #0
	bne _06001858
	add r0, r8, #0x100
	ldrh r1, [sb, #0x3e]
	ldrh r0, [r0, #0x88]
	tst r1, r2, lsl r0
	bne _0600185C
_06001858:
	mov r2, #0
_0600185C:
	cmp r3, #0
	movne r0, #0
	strneh r0, [r8, #0x8c]
	ldrh r0, [r8, #0x8e]
	cmp r0, #0
	beq _06001898
	mov r0, #0
	strh r0, [r8, #0x8e]
	cmp r2, #0
	movne r0, #1
	mov r1, r0, lsl #0x10
	mov r0, r4
	mov r1, r1, lsr #0x10
	bl sub_0600767C
	mov r5, r0
_06001898:
	cmp r6, #0
	beq _06001AB0
	bl sub_06000294
	mov r7, r0
	mov r0, #0xe
	strh r0, [r7]
	cmp r4, #0
	movne r0, #9
	strneh r0, [r7, #2]
	bne _060018E4
	add r0, r8, #0x100
	ldrh r2, [sb, #0x3e]
	ldrh r0, [r0, #0x88]
	mov r1, #1
	tst r2, r1, lsl r0
	movne r0, #0xf
	strneh r0, [r7, #2]
	moveq r0, #0
	streqh r0, [r7, #2]
_060018E4:
	mov r0, #0xd
	strh r0, [r7, #4]
	mov r0, #0
	str r0, [r7, #8]
	cmp r4, #0
	bne _06001944
	ldrh r1, [sb, #0x1c]
	add r0, sb, #0x28
	strh r1, [r7, #0xc]
	ldrh r2, [sb, #0x1e]
	add r1, r7, #0x10
	strh r2, [r7, #0xe]
	mov r2, #6
	bl sub_06000440
	add r0, sb, #0x2e
	add r1, r7, #0x16
	mov r2, #6
	bl sub_06000440
	ldrh r0, [sb, #0x3a]
	strh r0, [r7, #0x1c]
	ldrh r0, [sb, #0x3c]
	strh r0, [r7, #0x1e]
	ldrh r0, [sb, #0x3e]
	strh r0, [r7, #0x20]
_06001944:
	mov r0, r7
	bl sub_0600029C
	cmp r6, #0
	beq _06001AB0
	cmp r5, #1
	ldrneh r0, [r8, #0x5e]
	cmpne r0, #0
	bne _060019A0
	ldrh r0, [r8, #0x46]
	cmp r0, #0
	beq _06001998
	ldr r0, _06001804 ; =0x0380AD6C
	bl sub_06001B0C
	mov r0, #0
	str r0, [sp]
	ldr r1, [r8, #0x50]
	ldr r2, [r8, #0x54]
	ldr r0, _06001804 ; =0x0380AD6C
	ldr r3, _06001AE0 ; =sub_06001D24
	bl sub_06001B14
	b _06001AB0
_06001998:
	bl sub_06001D30
	b _06001AB0
_060019A0:
	mov r1, #0
	strh r1, [r8, #0x5e]
	mov r0, #1
	strh r0, [r8, #0x60]
	strh r1, [r8, #0x88]
	b _06001AB0
_060019B8:
	add r0, r8, #0x700
	ldrh r0, [r0, #0xcc]
	cmp r0, #1
	ldreqh r0, [sb, #0x10]
	cmpeq r0, #0x20
	bne _06001A2C
	bl sub_06000720
	mov r4, r0
	ldr r0, _060017F0 ; =0x0380AD40
	bl sub_06001B0C
	mov r1, #0
	mov r0, r4
	strh r1, [r8, #0x84]
	bl sub_06000740
	mov r1, #0
	strh r1, [r8, #0x8a]
	mov r0, #1
	bl sub_0600767C
	bl sub_06000294
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x17
	strh r1, [r0, #4]
	mov r1, #1
	strh r1, [r0, #6]
	bl sub_0600029C
	b _06001AB0
_06001A2C:
	bl sub_060007C0
	movs r1, r0
	moveq r0, #0
	beq _06001A80
	ldr r0, _06001AE4 ; =0x00008003
	mov r2, #0x25
	str r2, [r1]
	str r0, [r1, #8]
	ldrh r0, [r8]
	cmp r0, #9
	cmpne r0, #7
	ldreq r0, _06001AE8 ; =0x00007FFE
	streq r0, [r1, #4]
	beq _06001A74
	cmp r0, #0xa
	cmpne r0, #8
	moveq r0, #1
	streq r0, [r1, #4]
_06001A74:
	ldr r0, _060017E0 ; =0x0601892C
	mov r2, #0
	bl sub_06000284
_06001A80:
	cmp r0, #0
	bne _06001AB0
	bl sub_06000294
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x25
	strh r1, [r0, #6]
	bl sub_0600029C
_06001AB0:
	mov r0, sb
	bl sub_06001B1C
	b _06000960
_06001ABC:
	ldr r0, _060017D4 ; =0x060188A4
	mov r1, sb
	add r0, r0, #0x58
	mov r2, #1
	bl sub_06000284
	b _06000960
_06001AD4:
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06001AE0: .word sub_06001D24
_06001AE4: .word 0x00008003
_06001AE8: .word 0x00007FFE
	arm_func_end sub_06000958

	arm_func_start sub_06001AEC
sub_06001AEC: ; 0x06001AEC
	ldr pc, _06001AF0 ; =OS_ExitThread
	.align 2, 0
_06001AF0: .word OS_ExitThread
	arm_func_end sub_06001AEC

	arm_func_start sub_06001AF4
sub_06001AF4: ; 0x06001AF4
	ldr pc, _06001AF8 ; =MI_CpuFill8
	.align 2, 0
_06001AF8: .word MI_CpuFill8
	arm_func_end sub_06001AF4

	arm_func_start sub_06001AFC
sub_06001AFC: ; 0x06001AFC
	ldr pc, _06001B00 ; =OS_GetTick
	.align 2, 0
_06001B00: .word OS_GetTick
	arm_func_end sub_06001AFC

	arm_func_start sub_06001B04
sub_06001B04: ; 0x06001B04
	ldr pc, _06001B08 ; =MIi_CpuCopy16
	.align 2, 0
_06001B08: .word MIi_CpuCopy16
	arm_func_end sub_06001B04

	arm_func_start sub_06001B0C
sub_06001B0C: ; 0x06001B0C
	ldr pc, _06001B10 ; =OS_CancelAlarm
	.align 2, 0
_06001B10: .word OS_CancelAlarm
	arm_func_end sub_06001B0C

	arm_func_start sub_06001B14
sub_06001B14: ; 0x06001B14
	ldr pc, _06001B18 ; =OS_SetAlarm
	.align 2, 0
_06001B18: .word OS_SetAlarm
	arm_func_end sub_06001B14

	arm_func_start sub_06001B1C
sub_06001B1C: ; 0x06001B1C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_06000720
	ldr r1, _06001B50 ; =0x060198A4
	mov r4, r0
	ldr r0, [r1, #0x544]
	ldr r1, [r1, #0x548]
	mov r2, r5
	bl sub_06001B54
	mov r0, r4
	bl sub_06000740
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06001B50: .word 0x060198A4
	arm_func_end sub_06001B1C

	arm_func_start sub_06001B54
sub_06001B54: ; 0x06001B54
	ldr pc, _06001B58 ; =OS_FreeToHeap
	.align 2, 0
_06001B58: .word OS_FreeToHeap
	arm_func_end sub_06001B54

	arm_func_start sub_06001B5C
sub_06001B5C: ; 0x06001B5C
	tst r0, #2
	mov r0, r0, asr #2
	addeq r0, r0, #0x19
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_06001B5C

	arm_func_start sub_06001B70
sub_06001B70: ; 0x06001B70
	stmdb sp!, {r4, lr}
	ldr r0, _06001BE8 ; =0x060198A4
	ldr r4, [r0, #0x550]
	bl sub_060007C0
	movs r1, r0
	moveq r0, #0
	beq _06001BA8
	mov r0, #0x2d
	str r0, [r1]
	ldrh r3, [r4, #0x68]
	ldr r0, _06001BEC ; =0x0601892C
	mov r2, #0
	str r3, [r1, #4]
	bl sub_06000284
_06001BA8:
	cmp r0, #0
	movne r0, #1
	strneh r0, [r4, #0x66]
	bne _06001BE0
	bl sub_06000294
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x2d
	strh r1, [r0, #6]
	bl sub_0600029C
_06001BE0:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06001BE8: .word 0x060198A4
_06001BEC: .word 0x0601892C
	arm_func_end sub_06001B70

	arm_func_start sub_06001BF0
sub_06001BF0: ; 0x06001BF0
	ldr ip, _06001C00 ; =sub_06001C04
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx ip
	.align 2, 0
_06001C00: .word sub_06001C04
	arm_func_end sub_06001BF0

	arm_func_start sub_06001C04
sub_06001C04: ; 0x06001C04
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl sub_060007C0
	movs r1, r0
	ldr r4, _06001C80 ; =0x060188A4
	moveq r0, #0
	beq _06001C38
	mov r0, #0x2b
	str r0, [r1]
	add r0, r4, #0x88
	mov r2, #0
	str r5, [r1, #4]
	bl sub_06000284
_06001C38:
	cmp r0, #0
	bne _06001C78
	add r0, r4, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _06001C78
	bl sub_06000294
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x2b
	strh r1, [r0, #6]
	bl sub_0600029C
_06001C78:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06001C80: .word 0x060188A4
	arm_func_end sub_06001C04

	arm_func_start sub_06001C84
sub_06001C84: ; 0x06001C84
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _06001D0C ; =0x060198A4
	mov r2, #0x40
	ldr r0, [r1, #0x544]
	ldr r1, [r1, #0x548]
	ldr r5, _06001D10 ; =0x060188A4
	bl sub_06001D1C
	mov r4, r0
	ldr r1, _06001D14 ; =0x00000185
	ldr r0, _06001D18 ; =0x060188CC
	strh r1, [r4, #0xc]
	mov r2, #0
	mov r1, r4
	strh r2, [r4, #0xe]
	bl sub_06000284
	cmp r0, #0
	bne _06001D04
	mov r0, r4
	bl sub_06001B1C
	add r0, r5, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _06001D04
	bl sub_06000294
	mov r2, #0x80
	strh r2, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	strh r2, [r0, #6]
	bl sub_0600029C
_06001D04:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06001D0C: .word 0x060198A4
_06001D10: .word 0x060188A4
_06001D14: .word 0x00000185
_06001D18: .word 0x060188CC
	arm_func_end sub_06001C84

	arm_func_start sub_06001D1C
sub_06001D1C: ; 0x06001D1C
	ldr pc, _06001D20 ; =OS_AllocFromHeap
	.align 2, 0
_06001D20: .word OS_AllocFromHeap
	arm_func_end sub_06001D1C

	arm_func_start sub_06001D24
sub_06001D24: ; 0x06001D24
	ldr ip, _06001D2C ; =sub_06001D30
	bx ip
	.align 2, 0
_06001D2C: .word sub_06001D30
	arm_func_end sub_06001D24

	arm_func_start sub_06001D30
sub_06001D30: ; 0x06001D30
	stmdb sp!, {r4, lr}
	bl sub_060007C0
	ldr r2, _06001DB8 ; =0x060198A4
	movs r1, r0
	ldr r0, [r2, #0x550]
	mov r2, #0
	strh r2, [r0, #0x5e]
	strh r2, [r0, #0x60]
	ldr r4, _06001DBC ; =0x060188A4
	strh r2, [r0, #0x88]
	beq _06001D70
	mov r3, #0x2c
	add r0, r4, #0x88
	str r3, [r1]
	bl sub_06000284
	mov r2, r0
_06001D70:
	cmp r2, #0
	bne _06001DB0
	add r0, r4, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _06001DB0
	bl sub_06000294
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x2c
	strh r1, [r0, #6]
	bl sub_0600029C
_06001DB0:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06001DB8: .word 0x060198A4
_06001DBC: .word 0x060188A4
	arm_func_end sub_06001D30

	arm_func_start sub_06001DC0
sub_06001DC0: ; 0x06001DC0
	stmdb sp!, {r3, lr}
	ldr r0, _06001DDC ; =0x0380AD6C
	bl sub_06001DE4
	ldr r0, _06001DE0 ; =0x0380AD40
	bl sub_06001DE4
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06001DDC: .word 0x0380AD6C
_06001DE0: .word 0x0380AD40
	arm_func_end sub_06001DC0

	arm_func_start sub_06001DE4
sub_06001DE4: ; 0x06001DE4
	ldr pc, _06001DE8 ; =OS_CreateAlarm
	.align 2, 0
_06001DE8: .word OS_CreateAlarm
	arm_func_end sub_06001DE4

	arm_func_start sub_06001DEC
sub_06001DEC: ; 0x06001DEC
	stmdb sp!, {r3, lr}
	ldr r0, _06001E08 ; =0x0380AD6C
	bl sub_06001B0C
	ldr r0, _06001E0C ; =0x0380AD40
	bl sub_06001B0C
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06001E08: .word 0x0380AD6C
_06001E0C: .word 0x0380AD40
	arm_func_end sub_06001DEC

	arm_func_start sub_06001E10
sub_06001E10: ; 0x06001E10
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _06001EA8 ; =0x060198A4
	mov r6, #1
	ldr r8, _06001EAC ; =0x060188A4
	ldr sb, [r0, #0x550]
	ldr r5, _06001EB0 ; =_060181B0
	add r7, sp, #0
	mov r4, #0
	mov fp, r6
_06001E34:
	mov r1, r7
	mov r2, fp
	add r0, r8, #0x88
	bl sub_0600028C
	ldr r0, [sp]
	cmp r0, #0
	bne _06001E58
	bl sub_06001AEC
	b _06001EA0
_06001E58:
	ldrh sl, [r0]
	tst sl, #0x8000
	bicne r0, sl, #0x8000
	movne r0, r0, lsl #0x10
	movne sl, r0, lsr #0x10
	cmp sl, #0x2e
	bhs _06001E90
	str r6, [sb, #4]
	strh sl, [sb, #2]
	ldr r0, [sp]
	ldr r1, [r5, sl, lsl #2]
	mov lr, pc
	bx r1
	str r4, [sb, #4]
_06001E90:
	ldr r0, [sp]
	orr r1, sl, #0x8000
	strh r1, [r0]
	b _06001E34
_06001EA0:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06001EA8: .word 0x060198A4
_06001EAC: .word 0x060188A4
_06001EB0: .word _060181B0
	arm_func_end sub_06001E10

	arm_func_start sub_06001EB4
sub_06001EB4: ; 0x06001EB4
	bx lr
	arm_func_end sub_06001EB4

	arm_func_start sub_06001EB8
sub_06001EB8: ; 0x06001EB8
	stmdb sp!, {r4, lr}
	mov r2, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_06001EB8

	arm_func_start sub_06001F0C
sub_06001F0C: ; 0x06001F0C
	stmdb sp!, {r4, lr}
	mov r4, #0
	strh r4, [r0]
	strh r4, [r0, #2]
	strh r4, [r0, #4]
	strh r4, [r0, #6]
	strh r4, [r0, #8]
	strh r4, [r0, #0xa]
	mov ip, #1
	strh ip, [r0, #0xc]
	mov r4, #3
	strh r4, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r3, [r0, #0x14]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh ip, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_06001F0C

	arm_func_start sub_06001F6C
sub_06001F6C: ; 0x06001F6C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	mov r5, #2
	mov r7, r1
	mov r0, r2
	strh r5, [r4, #0xc]
	mov r5, #0x1f
	add r1, r4, #0x10
	mov r2, #6
	mov r6, r3
	strh r5, [r4, #0xe]
	bl sub_06001B04
	ldr r0, [sp, #0x18]
	add r1, r4, #0x18
	mov r2, #0x20
	strh r6, [r4, #0x16]
	bl sub_06001B04
	ldrh r2, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	add r1, r4, #0x3a
	strh r2, [r4, #0x38]
	mov r2, #0x10
	bl sub_06001B04
	ldrh r1, [sp, #0x24]
	mov r0, r7, lsr #1
	strh r1, [r4, #0x4a]
	mov r1, #0
	strh r1, [r4, #0x4c]
	ldrh r2, [r4, #0xe]
	ldrh r1, [r4, #0xc]
	add r5, r4, r2, lsl #1
	strh r1, [r5, #0x10]
	sub r1, r0, #0x2c
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0600020C
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_06001F6C

	arm_func_start sub_06002024
sub_06002024: ; 0x06002024
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r3, #0
	strh r3, [r4]
	strh r3, [r4, #2]
	strh r3, [r4, #4]
	strh r3, [r4, #6]
	strh r3, [r4, #8]
	strh r3, [r4, #0xa]
	mov r0, #3
	strh r0, [r4, #0xc]
	mov r0, #0x22
	strh r0, [r4, #0xe]
	strh r1, [r4, #0x10]
	mov r0, r2
	strh r3, [r4, #0x12]
	add r1, r4, #0x14
	mov r2, #0x44
	bl sub_06001B04
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #5
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0600020C
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_06002024

	arm_func_start sub_0600209C
sub_0600209C: ; 0x0600209C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	mov r0, #4
	strh r0, [r4, #0xc]
	mov r5, #5
	mov r6, r2
	mov r0, r1
	strh r5, [r4, #0xe]
	add r1, r4, #0x10
	mov r2, #6
	mov r5, r3
	bl sub_06001B04
	strh r6, [r4, #0x16]
	strh r5, [r4, #0x18]
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #6
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0600020C
	add r0, r5, #0x10
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_0600209C

	arm_func_start sub_0600211C
sub_0600211C: ; 0x0600211C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	mov r0, #5
	strh r0, [r4, #0xc]
	mov r3, #4
	mov r5, r2
	mov r0, r1
	strh r3, [r4, #0xe]
	add r1, r4, #0x10
	mov r2, #6
	bl sub_06001B04
	strh r5, [r4, #0x16]
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #4
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0600020C
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_0600211C

	arm_func_start sub_06002194
sub_06002194: ; 0x06002194
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	mov r6, r2
	strh r0, [r4, #0xa]
	mov r2, #6
	mov r0, r1
	strh r2, [r4, #0xc]
	mov r1, #5
	strh r1, [r4, #0xe]
	add r1, r4, #0x10
	mov r5, r3
	bl sub_06001B04
	strh r6, [r4, #0x16]
	strh r5, [r4, #0x18]
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #3
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0600020C
	add r0, r5, #0x10
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_06002194

	arm_func_start sub_06002210
sub_06002210: ; 0x06002210
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov ip, #0
	strh ip, [r4]
	strh ip, [r4, #2]
	strh ip, [r4, #4]
	strh ip, [r4, #6]
	ldrh r0, [sp, #0x20]
	strh ip, [r4, #8]
	add r0, r0, #1
	add r0, r0, r0, lsr #31
	mov r5, r0, asr #1
	mov r0, r2
	strh ip, [r4, #0xa]
	mov r2, #9
	strh r2, [r4, #0xc]
	add r2, r5, #0x17
	strh r2, [r4, #0xe]
	strh r1, [r4, #0x10]
	add r1, r4, #0x12
	mov r2, #0x20
	mov r5, r3
	bl sub_06001B04
	ldrh r1, [sp, #0x10]
	strh r5, [r4, #0x32]
	ldrh r0, [sp, #0x14]
	strh r1, [r4, #0x34]
	ldrh r1, [sp, #0x18]
	strh r0, [r4, #0x36]
	ldrh r0, [sp, #0x1c]
	strh r1, [r4, #0x38]
	ldrh r2, [sp, #0x20]
	strh r0, [r4, #0x3a]
	ldr r0, [sp, #0x24]
	strh r2, [r4, #0x3c]
	add r1, r4, #0x3e
	bl sub_06001B04
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #1
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0600020C
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_06002210

	arm_func_start sub_060022D0
sub_060022D0: ; 0x060022D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r5, #0
	strh r5, [r4]
	strh r5, [r4, #2]
	strh r5, [r4, #4]
	strh r5, [r4, #6]
	strh r5, [r4, #8]
	strh r5, [r4, #0xa]
	mov r0, #0xa
	strh r0, [r4, #0xc]
	mov r0, #0xc
	strh r0, [r4, #0xe]
	strh r5, [r4, #0x10]
	strh r1, [r4, #0x12]
	strh r2, [r4, #0x14]
	ldr r0, [sp, #0x10]
	strh r3, [r4, #0x16]
	add r1, r4, #0x18
	mov r2, #0x10
	bl sub_06001B04
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #0x12
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0600020C
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_060022D0

	arm_func_start sub_06002350
sub_06002350: ; 0x06002350
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	mov r5, r1
	mov r0, #0x100
	strh r0, [r4, #0xc]
	mov r1, #0x18
	mov r0, r5
	strh r1, [r4, #0xe]
	add r1, r4, #0x10
	mov r2, #0x30
	bl sub_06001B04
	mov r0, #0
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	strh r0, [r5, #8]
	strh r0, [r5, #0xa]
	strh r0, [r5, #0xc]
	strh r0, [r5, #0x10]
	strh r0, [r5, #0x12]
	strh r0, [r5, #0x14]
	strh r0, [r5, #0x16]
	strh r0, [r5, #0x24]
	strh r0, [r5, #0x26]
	strh r0, [r5, #0x28]
	strh r0, [r5, #0x2a]
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #2
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0600020C
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_06002350

	arm_func_start sub_060023FC
sub_060023FC: ; 0x060023FC
	stmdb sp!, {r4, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	strh ip, [r0, #4]
	strh ip, [r0, #6]
	strh ip, [r0, #8]
	ldr r4, _06002460 ; =0x00000101
	strh ip, [r0, #0xa]
	strh r4, [r0, #0xc]
	mov r4, #4
	strh r4, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	str r3, [r0, #0x14]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	mov r1, #1
	strh r1, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06002460: .word 0x00000101
	arm_func_end sub_060023FC

	arm_func_start sub_06002464
sub_06002464: ; 0x06002464
	stmdb sp!, {r4, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	strh ip, [r0, #4]
	strh ip, [r0, #6]
	strh ip, [r0, #8]
	ldr r4, _060024F8 ; =0x00000102
	strh ip, [r0, #0xa]
	strh r4, [r0, #0xc]
	mov r4, #0xa
	strh r4, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	ldrh r2, [sp, #8]
	strh r3, [r0, #0x14]
	ldrh r1, [sp, #0xc]
	strh r2, [r0, #0x16]
	ldrh r2, [sp, #0x10]
	strh r1, [r0, #0x18]
	ldrh r1, [sp, #0x14]
	strh r2, [r0, #0x1a]
	ldrh r2, [sp, #0x18]
	strh r1, [r0, #0x1c]
	ldr r1, [sp, #0x1c]
	strh r2, [r0, #0x1e]
	str r1, [r0, #0x20]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	mov r1, #1
	strh r1, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_060024F8: .word 0x00000102
	arm_func_end sub_06002464

	arm_func_start sub_060024FC
sub_060024FC: ; 0x060024FC
	stmdb sp!, {r4, lr}
	mov r2, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	mov r2, #0x104
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_060024FC

	arm_func_start sub_06002554
sub_06002554: ; 0x06002554
	stmdb sp!, {r4, lr}
	mov r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	mov r1, #0x200
	mov r2, #0x48
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	mov r1, #1
	strh r1, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_06002554

	arm_func_start sub_060025A8
sub_060025A8: ; 0x060025A8
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _06002600 ; =0x00000207
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06002600: .word 0x00000207
	arm_func_end sub_060025A8

	arm_func_start sub_06002604
sub_06002604: ; 0x06002604
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _0600265C ; =0x0000020B
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600265C: .word 0x0000020B
	arm_func_end sub_06002604

	arm_func_start sub_06002660
sub_06002660: ; 0x06002660
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	strh r0, [r4, #8]
	ldr r2, _060026D0 ; =0x0000020D
	strh r0, [r4, #0xa]
	mov r0, r1
	strh r2, [r4, #0xc]
	mov r1, #0x10
	strh r1, [r4, #0xe]
	add r1, r4, #0x10
	mov r2, #0x20
	bl sub_06001B04
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #1
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0600020C
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_060026D0: .word 0x0000020D
	arm_func_end sub_06002660

	arm_func_start sub_060026D4
sub_060026D4: ; 0x060026D4
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _0600272C ; =0x0000020E
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600272C: .word 0x0000020E
	arm_func_end sub_060026D4

	arm_func_start sub_06002730
sub_06002730: ; 0x06002730
	stmdb sp!, {r4, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	strh ip, [r0, #4]
	strh ip, [r0, #6]
	strh ip, [r0, #8]
	ldr r4, _06002794 ; =0x00000211
	strh ip, [r0, #0xa]
	strh r4, [r0, #0xc]
	mov r4, #3
	strh r4, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r3, [r0, #0x14]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	mov r1, #1
	strh r1, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06002794: .word 0x00000211
	arm_func_end sub_06002730

	arm_func_start sub_06002798
sub_06002798: ; 0x06002798
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _060027F0 ; =0x00000212
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_060027F0: .word 0x00000212
	arm_func_end sub_06002798

	arm_func_start sub_060027F4
sub_060027F4: ; 0x060027F4
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _0600284C ; =0x00000215
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600284C: .word 0x00000215
	arm_func_end sub_060027F4

	arm_func_start sub_06002850
sub_06002850: ; 0x06002850
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _060028A8 ; =0x00000216
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_060028A8: .word 0x00000216
	arm_func_end sub_06002850

	arm_func_start sub_060028AC
sub_060028AC: ; 0x060028AC
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	ldr r2, _06002904 ; =0x00000242
	strh r3, [r0, #0xa]
	strh r2, [r0, #0xc]
	mov r3, #1
	strh r3, [r0, #0xe]
	strh r1, [r0, #0x10]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	strh r3, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06002904: .word 0x00000242
	arm_func_end sub_060028AC

	arm_func_start sub_06002908
sub_06002908: ; 0x06002908
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	mov ip, #0
	strh ip, [r4]
	strh ip, [r4, #2]
	strh ip, [r4, #4]
	strh ip, [r4, #6]
	strh ip, [r4, #8]
	add r0, r1, #1
	add r0, r0, r0, lsr #31
	mov r3, r0, asr #1
	mov r0, r2
	ldr r5, _06002988 ; =0x00000245
	strh ip, [r4, #0xa]
	strh r5, [r4, #0xc]
	add r2, r3, #1
	strh r2, [r4, #0xe]
	strh r1, [r4, #0x10]
	mov r2, r1
	add r1, r4, #0x12
	bl sub_06001B04
	ldrh r1, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r5, r4, r1, lsl #1
	strh r0, [r5, #0x10]
	mov r1, #1
	mov r0, r4
	strh r1, [r5, #0x12]
	bl sub_0600020C
	add r0, r5, #0x10
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06002988: .word 0x00000245
	arm_func_end sub_06002908

	arm_func_start sub_0600298C
sub_0600298C: ; 0x0600298C
	ldr ip, _0600299C ; =sub_06002AF8
	ldr r1, _060029A0 ; =0x00000281
	mov r2, #4
	bx ip
	.align 2, 0
_0600299C: .word sub_06002AF8
_060029A0: .word 0x00000281
	arm_func_end sub_0600298C

	arm_func_start sub_060029A4
sub_060029A4: ; 0x060029A4
	ldr ip, _060029B4 ; =sub_06002AF8
	ldr r1, _060029B8 ; =0x00000283
	mov r2, #3
	bx ip
	.align 2, 0
_060029B4: .word sub_06002AF8
_060029B8: .word 0x00000283
	arm_func_end sub_060029A4

	arm_func_start sub_060029BC
sub_060029BC: ; 0x060029BC
	ldr ip, _060029CC ; =sub_06002AF8
	mov r1, #0x284
	mov r2, #2
	bx ip
	.align 2, 0
_060029CC: .word sub_06002AF8
	arm_func_end sub_060029BC

	arm_func_start sub_060029D0
sub_060029D0: ; 0x060029D0
	ldr ip, _060029E0 ; =sub_06002AF8
	ldr r1, _060029E4 ; =0x00000301
	mov r2, #1
	bx ip
	.align 2, 0
_060029E0: .word sub_06002AF8
_060029E4: .word 0x00000301
	arm_func_end sub_060029D0

	arm_func_start sub_060029E8
sub_060029E8: ; 0x060029E8
	ldr ip, _060029F8 ; =sub_06002AF8
	ldr r1, _060029FC ; =0x00000302
	mov r2, #1
	bx ip
	.align 2, 0
_060029F8: .word sub_06002AF8
_060029FC: .word 0x00000302
	arm_func_end sub_060029E8

	arm_func_start sub_06002A00
sub_06002A00: ; 0x06002A00
	ldr ip, _06002A10 ; =sub_06002AF8
	ldr r1, _06002A14 ; =0x00000303
	mov r2, #1
	bx ip
	.align 2, 0
_06002A10: .word sub_06002AF8
_06002A14: .word 0x00000303
	arm_func_end sub_06002A00

	arm_func_start sub_06002A18
sub_06002A18: ; 0x06002A18
	ldr ip, _06002A28 ; =sub_06002AF8
	mov r1, #0x304
	mov r2, #1
	bx ip
	.align 2, 0
_06002A28: .word sub_06002AF8
	arm_func_end sub_06002A18

	arm_func_start sub_06002A2C
sub_06002A2C: ; 0x06002A2C
	ldr ip, _06002A3C ; =sub_06002AF8
	ldr r1, _06002A40 ; =0x00000305
	mov r2, #1
	bx ip
	.align 2, 0
_06002A3C: .word sub_06002AF8
_06002A40: .word 0x00000305
	arm_func_end sub_06002A2C

	arm_func_start sub_06002A44
sub_06002A44: ; 0x06002A44
	ldr ip, _06002A54 ; =sub_06002AF8
	ldr r1, _06002A58 ; =0x00000306
	mov r2, #9
	bx ip
	.align 2, 0
_06002A54: .word sub_06002AF8
_06002A58: .word 0x00000306
	arm_func_end sub_06002A44

	arm_func_start sub_06002A5C
sub_06002A5C: ; 0x06002A5C
	ldr ip, _06002A6C ; =sub_06002AF8
	ldr r1, _06002A70 ; =0x00000307
	mov r2, #0x5c
	bx ip
	.align 2, 0
_06002A6C: .word sub_06002AF8
_06002A70: .word 0x00000307
	arm_func_end sub_06002A5C

	arm_func_start sub_06002A74
sub_06002A74: ; 0x06002A74
	ldr ip, _06002A84 ; =sub_06002AF8
	mov r1, #0x308
	mov r2, #2
	bx ip
	.align 2, 0
_06002A84: .word sub_06002AF8
	arm_func_end sub_06002A74

	arm_func_start sub_06002A88
sub_06002A88: ; 0x06002A88
	stmdb sp!, {r4, lr}
	mov ip, #0
	strh ip, [r0]
	strh ip, [r0, #2]
	strh ip, [r0, #4]
	strh ip, [r0, #6]
	strh ip, [r0, #8]
	ldr r4, _06002AF4 ; =0x00000309
	strh ip, [r0, #0xa]
	strh r4, [r0, #0xc]
	mov r4, #4
	strh r4, [r0, #0xe]
	strh r1, [r0, #0x10]
	strh r2, [r0, #0x12]
	ldrh r1, [sp, #8]
	strh r3, [r0, #0x14]
	strh r1, [r0, #0x16]
	ldrh r2, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r2, lsl #1
	strh r1, [r4, #0x10]
	mov r1, #1
	strh r1, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06002AF4: .word 0x00000309
	arm_func_end sub_06002A88

	arm_func_start sub_06002AF8
sub_06002AF8: ; 0x06002AF8
	stmdb sp!, {r4, lr}
	mov r3, #0
	strh r3, [r0]
	strh r3, [r0, #2]
	strh r3, [r0, #4]
	strh r3, [r0, #6]
	strh r3, [r0, #8]
	strh r3, [r0, #0xa]
	strh r1, [r0, #0xc]
	strh r3, [r0, #0xe]
	ldrh r1, [r0, #0xc]
	add r4, r0, r3, lsl #1
	strh r1, [r4, #0x10]
	strh r2, [r4, #0x12]
	bl sub_0600020C
	add r0, r4, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_06002AF8

	arm_func_start sub_06002B40
sub_06002B40: ; 0x06002B40
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r4, [r0, #4]
	ldr r1, _06002BDC ; =0x060198A4
	str r4, [r1, #0x54c]
	ldr r2, [r0, #8]
	str r2, [r1, #0x550]
	str r2, [r4]
	ldr r1, [r0, #0xc]
	str r1, [r4, #8]
	ldr r0, [r0, #0x10]
	bl sub_06007FD8
	add r0, sp, #2
	add r1, sp, #0
	bl sub_06008294
	cmp r0, #0
	bne _06002BB0
	bl sub_06000294
	mov r1, #0
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	ldrh r1, [sp, #2]
	strh r1, [r0, #4]
	ldrh r1, [sp]
	strh r1, [r0, #6]
	bl sub_0600029C
	b _06002BD0
_06002BB0:
	ldr r0, [r4]
	mov r1, #2
	strh r1, [r0]
	bl sub_06000294
	mov r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	bl sub_0600029C
_06002BD0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_06002BDC: .word 0x060198A4
	arm_func_end sub_06002B40

	arm_func_start sub_06002BE0
sub_06002BE0: ; 0x06002BE0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x210
	ldr r0, _06002FAC ; =0x060198A4
	mov r4, #0
	ldr r8, [r0, #0x550]
	bl sub_06000720
	ldr r1, [r8, #0xc]
	mov r5, r0
	cmp r1, #1
	bne _06002C3C
	mov r0, r4
	str r0, [r8, #0xc]
	mov r4, #1
	bl sub_06005CEC
	bl sub_060006C0
	ldrh r0, [r8]
	cmp r0, #0xa
	moveq r0, #8
	streqh r0, [r8]
	beq _06002C3C
	cmp r0, #9
	moveq r0, #7
	streqh r0, [r8]
_06002C3C:
	ldrh r1, [r8]
	add r0, r1, #0xf9
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _06002C70
	add r0, r8, #0x100
	cmp r1, #7
	moveq sl, #1
	ldrh sb, [r0, #0x82]
	movne sl, #0
	b _06002C74
_06002C70:
	mov sb, #0
_06002C74:
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0, #0x82]
	strh r1, [r8, #0x86]
	str r1, [r8, #0x14]
	str r1, [r8, #0x10]
	str r1, [r8, #0x1c]
	mov r0, r5
	strh r1, [r8, #0xc2]
	bl sub_06000740
	cmp r4, #0
	beq _06002CAC
	ldr r0, _06002FB0 ; =0x0000FFFF
	bl sub_060079AC
_06002CAC:
	cmp sl, #0
	movne r0, #0
	strneh r0, [r8, #0xf6]
	cmp sb, #0
	beq _06002D08
	mov r7, #0
	add r5, r8, #0x128
	add r4, r8, #0x8a
	mov r6, #1
	mov fp, #6
_06002CD4:
	tst sb, r6, lsl r7
	beq _06002CFC
	cmp r7, #0
	addeq r2, r4, #0x100
	subne r0, r7, #1
	mlane r2, r0, fp, r5
	mov r1, r7, lsl #0x10
	mov r0, sl
	mov r1, r1, lsr #0x10
	bl sub_06004BF0
_06002CFC:
	add r7, r7, #1
	cmp r7, #0x10
	blt _06002CD4
_06002D08:
	add r0, r8, #0x128
	mov r1, #0
	mov r2, #0x5a
	bl sub_06001AF4
	add r0, sp, #0x10
	bl sub_06002A74
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06002D38
	mov r0, #0x308
	bl sub_06002FC0
	b _06002FA0
_06002D38:
	ldrh r4, [r0, #6]
	add r0, sp, #0x10
	bl sub_060029BC
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06002D5C
	mov r0, #0x284
	bl sub_06002FC0
	b _06002FA0
_06002D5C:
	ldrh r1, [r0, #6]
	cmp r4, #0x20
	bgt _06002DA0
	bge _06002E74
	cmp r4, #0
	bgt _06002D7C
	beq _06002E98
	b _06002F78
_06002D7C:
	cmp r4, #0x12
	bgt _06002F78
	cmp r4, #0x10
	blt _06002F78
	beq _06002EB8
	cmp r4, #0x11
	cmpne r4, #0x12
	beq _06002F10
	b _06002F78
_06002DA0:
	cmp r4, #0x30
	bgt _06002DB0
	beq _06002DB8
	b _06002F78
_06002DB0:
	cmp r4, #0x40
	bne _06002F78
_06002DB8:
	add r0, r1, #0xfe
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _06002E3C
	add r0, r8, #0x8a
	add r1, sp, #0xa
	add r0, r0, #0x100
	mov r2, #6
	bl sub_06000440
	mov r6, #0
	add r5, sp, #0xa
	mov r4, #3
	b _06002E30
_06002DF4:
	add r0, sp, #0x10
	mov r1, r5
	mov r2, r4
	bl sub_0600211C
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _06002E20
	cmp r0, #7
	cmpne r0, #0xc
	beq _06002E2C
	b _06002E74
_06002E20:
	mov r0, #3
	strh r0, [r8]
	b _06002E74
_06002E2C:
	add r6, r6, #1
_06002E30:
	cmp r6, #2
	blt _06002DF4
	b _06002E74
_06002E3C:
	cmp r1, #1
	bne _06002E74
	add r0, sp, #4
	mov r1, #0xff
	mov r2, #6
	bl sub_06001AF4
	add r1, sp, #4
	add r0, sp, #0x10
	mov r2, #3
	bl sub_0600211C
	ldrh r0, [r0, #4]
	cmp r0, #0
	moveq r0, #3
	streqh r0, [r8]
_06002E74:
	add r0, sp, #0x10
	mov r1, #1
	bl sub_06001EB8
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06002E98
	mov r0, #0
	bl sub_06002FC0
	b _06002FA0
_06002E98:
	add r0, sp, #0x10
	bl sub_060029E8
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06002EB8
	ldr r0, _06002FB4 ; =0x00000302
	bl sub_06002FC0
	b _06002FA0
_06002EB8:
	add r0, r8, #0x100
	ldrh r0, [r0, #0xee]
	cmp r0, #0
	bne _06002EF8
	add r0, sp, #0x10
	mov r1, #1
	bl sub_060026D4
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06002EEC
	ldr r0, _06002FB8 ; =0x0000020E
	bl sub_06002FC0
	b _06002FA0
_06002EEC:
	add r0, r8, #0x100
	mov r1, #1
	strh r1, [r0, #0xee]
_06002EF8:
	mov r0, #2
	strh r0, [r8]
	mov r0, #0
	str r0, [r8, #0x198]
	bl sub_0600082C
	b _06002F88
_06002F10:
	cmp r1, #0
	bne _06002F4C
	mov r0, #1
	mov r1, #0
	str r0, [sp]
	add r0, sp, #0x10
	mov r2, r1
	mov r3, #0x14
	bl sub_06002A88
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06002F4C
	ldr r0, _06002FBC ; =0x00000309
	bl sub_06002FC0
	b _06002FA0
_06002F4C:
	add r0, sp, #0x10
	bl sub_060029E8
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06002F6C
	ldr r0, _06002FB4 ; =0x00000302
	bl sub_06002FC0
	b _06002FA0
_06002F6C:
	mov r0, #2
	strh r0, [r8]
	b _06002F88
_06002F78:
	mov r0, #0x308
	mov r1, #0
	bl sub_06002FC0
	b _06002FA0
_06002F88:
	bl sub_06000294
	mov r1, #1
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
_06002FA0:
	add sp, sp, #0x210
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06002FAC: .word 0x060198A4
_06002FB0: .word 0x0000FFFF
_06002FB4: .word 0x00000302
_06002FB8: .word 0x0000020E
_06002FBC: .word 0x00000309
	arm_func_end sub_06002BE0

	arm_func_start sub_06002FC0
sub_06002FC0: ; 0x06002FC0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_06000294
	mov r1, #1
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_0600029C
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_06002FC0

	arm_func_start sub_06002FF0
sub_06002FF0: ; 0x06002FF0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x200
	ldr r0, _0600309C ; =0x060198A4
	ldr r4, [r0, #0x550]
	ldrh r0, [r4]
	cmp r0, #2
	beq _06003028
	bl sub_06000294
	mov r1, #2
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_0600029C
	b _06003090
_06003028:
	add r0, sp, #0
	bl sub_060029D0
	ldrh r5, [r0, #4]
	cmp r5, #0
	beq _06003064
	bl sub_06000294
	mov r2, #2
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	add r1, r1, #0x300
	strh r1, [r0, #4]
	strh r5, [r0, #6]
	bl sub_0600029C
	b _06003090
_06003064:
	mov r0, #1
	strh r0, [r4]
	bl sub_060030A0
	mov r0, #0
	strh r0, [r4]
	bl sub_06000294
	mov r1, #2
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
_06003090:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600309C: .word 0x060198A4
	arm_func_end sub_06002FF0

	arm_func_start sub_060030A0
sub_060030A0: ; 0x060030A0
	ldr pc, _060030A4 ; =sub_038022BC
	.align 2, 0
_060030A4: .word sub_038022BC
	arm_func_end sub_060030A0

	arm_func_start sub_060030A8
sub_060030A8: ; 0x060030A8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	ldr r1, _06003160 ; =0x060198A4
	ldr r0, [r0, #4]
	ldr r4, [r1, #0x550]
	mov r2, #0x40
	add r1, r4, #0xe8
	bl sub_06000440
	add r0, r4, #0x100
	ldrh r1, [r0, #0x1a]
	ldrh r0, [r0, #0xf4]
	mov r2, #1
	tst r0, r2, lsl r1
	bne _060030FC
	bl sub_06000294
	mov r1, #7
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	bl sub_0600029C
	b _06003154
_060030FC:
	ldrh r1, [r4, #0xf8]
	add r0, sp, #0
	bl sub_06002798
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _0600313C
	bl sub_06000294
	mov r1, #7
	strh r1, [r0]
	mov r2, #1
	ldr r1, _06003164 ; =0x00000212
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_0600029C
	b _06003154
_0600313C:
	bl sub_06000294
	mov r1, #7
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
_06003154:
	add sp, sp, #0x200
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06003160: .word 0x060198A4
_06003164: .word 0x00000212
	arm_func_end sub_060030A8

	arm_func_start sub_06003168
sub_06003168: ; 0x06003168
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x2b8
	ldr r1, _060033EC ; =0x060198A4
	add r5, sp, #0xb8
	ldr r4, [r1, #0x550]
	ldrh r1, [r4]
	cmp r1, #2
	bne _06003194
	ldr r1, [r4, #0xc8]
	tst r1, #1
	beq _060031B8
_06003194:
	bl sub_06000294
	mov r1, #8
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #8]
	bl sub_0600029C
	b _060033E0
_060031B8:
	add r1, r4, #0x100
	ldrh r2, [r1, #0x1a]
	mov r3, #1
	ldrh ip, [r1, #0xf6]
	mov r2, r3, lsl r2
	ldr r6, [r0, #4]
	tst ip, r2, asr #1
	bne _060031FC
	bl sub_06000294
	mov r1, #8
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #8]
	bl sub_0600029C
	b _060033E0
_060031FC:
	strh r3, [r4, #0xe6]
	mov r0, #0
	strh r0, [r1, #0x88]
	bl sub_06000720
	add r1, r4, #0x100
	mov r2, #0
	strh r2, [r1, #0x82]
	strh r2, [r4, #0x86]
	bl sub_06000740
	mov r1, r5
	add r2, r4, #0x100
	mov r3, #1
	mov r0, #8
	strh r3, [r2, #0xee]
	bl sub_06000448
	cmp r0, #0
	beq _060033E0
	mov r0, r5
	bl sub_06002A00
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06003260
	ldr r0, _060033F0 ; =0x00000303
	bl sub_060033F4
	b _060033E0
_06003260:
	cmp r6, #0
	movne r0, #1
	moveq r0, #0
	mov r0, r0, lsl #0x10
	mov r6, r0, lsr #0x10
	mov r0, r5
	mov r1, r6
	mov r2, #0
	mov r3, #1
	bl sub_06001F0C
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _060032A0
	mov r0, #1
	bl sub_060033F4
	b _060033E0
_060032A0:
	strh r6, [r4, #0xc6]
	add r1, sp, #0x38
	mov r0, #0
	mov r2, #0x80
	add r6, r4, #0xe8
	bl sub_06000598
	add r0, sp, #0x38
	mov r1, r6
	bl sub_0600037C
	add r1, sp, #0x18
	mov r0, #0
	mov r2, #0x20
	bl sub_06000598
	ldr r1, [r6, #8]
	mov r0, r5
	strh r1, [sp, #0x18]
	ldr r2, [r6, #8]
	mov r3, #0
	mov r2, r2, lsr #0x10
	strh r2, [sp, #0x1a]
	ldrh r5, [r6, #0xc]
	mov r2, #2
	strh r5, [sp, #0x1c]
	strh r3, [sp, #0x1e]
	str r2, [sp]
	ldrh r3, [r6, #0x32]
	mov r2, #3
	str r3, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	ldrh r2, [r6, #4]
	add r3, sp, #0x38
	add r2, r2, #0x10
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	ldrh r3, [r6, #0x18]
	mov r1, #0x20
	add r2, sp, #0x18
	bl sub_06002210
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _0600335C
	mov r0, #9
	bl sub_060033F4
	b _060033E0
_0600335C:
	ldrh r0, [r6, #0x14]
	cmp r0, #0
	ldrh r0, [r6, #0x34]
	movne r1, #0x2a
	moveq r1, #0
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_06000860
	ldrh r0, [r6, #0x14]
	cmp r0, #0
	movne r1, #6
	ldrh r0, [r6, #0x36]
	moveq r1, #0
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_060008B0
	bl sub_06000294
	mov r1, #7
	strh r1, [r4]
	mov r1, #8
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	strh r1, [r0, #8]
	ldrh r1, [r4, #0x30]
	strh r1, [r0, #0x2c]
	ldrh r1, [r4, #0x32]
	strh r1, [r0, #0x2e]
	bl sub_0600029C
	mov r0, #1
	strh r0, [r4, #0xc2]
_060033E0:
	add sp, sp, #0x2b8
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_060033EC: .word 0x060198A4
_060033F0: .word 0x00000303
	arm_func_end sub_06003168

	arm_func_start sub_060033F4
sub_060033F4: ; 0x060033F4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_06000294
	mov r1, #8
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #8]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_0600029C
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_060033F4

	arm_func_start sub_06003430
sub_06003430: ; 0x06003430
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x208
	ldr r0, _060035EC ; =0x060198A4
	ldr sl, [r0, #0x550]
	ldrh r0, [sl]
	cmp r0, #7
	beq _06003468
	bl sub_06000294
	mov r1, #9
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_0600029C
	b _060035E0
_06003468:
	mov r0, #0
	strh r0, [sl, #0xf6]
	mov r8, #1
_06003474:
	add r0, sl, #0x100
	ldrh r0, [r0, #0x82]
	mov r7, #1
	tst r0, r7, lsl r8
	beq _06003544
	add r0, sl, #0x128
	sub r1, r8, #1
	mov r2, #6
	mla r0, r1, r2, r0
	add r1, sp, #0
	bl sub_06000440
	mov sb, #0
	add r6, sp, #8
	add r5, sp, #0
	mov r4, #3
	b _060034E0
_060034B4:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_0600211C
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _060034E8
	cmp r0, #7
	cmpne r0, #0xc
	bne _060034E8
	add sb, sb, #1
_060034E0:
	cmp sb, #2
	blt _060034B4
_060034E8:
	bl sub_06000720
	add r1, sl, #0x100
	ldrh r2, [r1, #0x82]
	tst r2, r7, lsl r8
	beq _06003540
	mvn r3, r7, lsl r8
	and r2, r2, r3
	strh r2, [r1, #0x82]
	ldrh r2, [sl, #0x86]
	add r1, sl, r8, lsl #3
	and r2, r2, r3
	strh r2, [sl, #0x86]
	mov r2, #0
	str r2, [r1, #0x738]
	str r2, [r1, #0x73c]
	bl sub_06000740
	mov r0, r8, lsl #0x10
	mov r1, r0, lsr #0x10
	add r2, sp, #0
	mov r0, #1
	bl sub_06004BF0
	b _06003544
_06003540:
	bl sub_06000740
_06003544:
	add r8, r8, #1
	cmp r8, #0x10
	blt _06003474
	add r0, sp, #8
	mov r1, #1
	bl sub_06001EB8
	ldrh r1, [r0, #4]
	mov r0, #0
	cmp r1, #0
	beq _06003574
	bl sub_060035F4
	b _060035E0
_06003574:
	strh r0, [sl, #0xc2]
	mov r1, #3
	strh r1, [sl]
	add r0, sp, #8
	bl sub_060029E8
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _060035A0
	ldr r0, _060035F0 ; =0x00000302
	bl sub_060035F4
	b _060035E0
_060035A0:
	mov r0, #2
	strh r0, [sl]
	mov r1, #0
	str r1, [sl, #0x198]
	add r0, sl, #0x100
	strh r1, [r0, #0x96]
	add r0, sl, #0x19c
	mov r2, #0x50
	bl sub_06001AF4
	bl sub_0600082C
	bl sub_06000294
	mov r1, #9
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
_060035E0:
	add sp, sp, #0x208
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_060035EC: .word 0x060198A4
_060035F0: .word 0x00000302
	arm_func_end sub_06003430

	arm_func_start sub_060035F4
sub_060035F4: ; 0x060035F4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_06000294
	mov r1, #9
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_0600029C
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_060035F4

	arm_func_start sub_06003628
sub_06003628: ; 0x06003628
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x248
	ldr r1, _06003978 ; =0x060198A4
	add r4, sp, #0x48
	ldr r7, [r1, #0x550]
	ldrh r1, [r7]
	cmp r1, #2
	cmpne r1, #3
	cmpne r1, #5
	beq _06003674
	bl sub_06000294
	mov r1, #0xa
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	bl sub_0600029C
	b _0600396C
_06003674:
	ldr r1, [r0, #4]
	add r2, r7, #0x100
	str r1, [r7, #0x184]
	ldrh r5, [r0, #2]
	add r1, sp, #0x10
	strh r5, [r2, #0x90]
	ldrh r6, [r0, #8]
	add r0, r0, #0xa
	mov r2, #6
	bl sub_06000440
	ldrh r1, [sp, #0x10]
	ldr r0, _0600397C ; =0x0000FFFF
	cmp r1, r0
	beq _060036B8
	tst r1, #1
	bicne r0, r1, #1
	strneh r0, [sp, #0x10]
_060036B8:
	cmp r5, #0
	bne _060036E4
	bl sub_06000294
	mov r1, #0xa
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	bl sub_0600029C
	b _0600396C
_060036E4:
	add r0, r7, #0x100
	ldrh r0, [r0, #0xf4]
	mov r1, #1
	tst r0, r1, lsl r5
	bne _0600371C
	bl sub_06000294
	mov r1, #0xa
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	bl sub_0600029C
	b _0600396C
_0600371C:
	mov r0, #2
	strh r0, [r7, #0xe6]
	mov r0, r4
	bl sub_06002A74
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06003748
	mov r0, #0x308
	mov r2, #0
	bl sub_06003ED4
	b _0600396C
_06003748:
	ldrh r0, [r0, #6]
	cmp r0, #0x10
	bne _060037C4
	mov r1, r4
	mov r0, #0xa
	bl sub_06000448
	cmp r0, #0
	beq _0600396C
	mov r0, r4
	bl sub_06002A00
	ldrh r1, [r0, #4]
	mov r2, #0
	cmp r1, #0
	beq _0600378C
	ldr r0, _06003980 ; =0x00000303
	bl sub_06003ED4
	b _0600396C
_0600378C:
	mov r0, #3
	mov r1, #1
	strh r0, [r7]
	mov r0, r4
	mov r3, r1
	bl sub_06001F0C
	ldrh r1, [r0, #4]
	mov r0, #1
	cmp r1, #0
	beq _060037C0
	mov r2, #0
	bl sub_06003ED4
	b _0600396C
_060037C0:
	strh r0, [r7, #0xc6]
_060037C4:
	ldr r0, _0600397C ; =0x0000FFFF
	mov r3, #5
	strh r3, [r7]
	add r1, sp, #0x26
	mov r2, #0x20
	bl sub_06000598
	add r0, sp, #0x17
	mov r1, #0
	mov r2, #0xf
	strb r5, [sp, #0x16]
	bl sub_06001AF4
	add r1, sp, #0x26
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	add r0, sp, #0x16
	str r0, [sp, #8]
	ldr r1, _06003984 ; =0x0000011E
	add r2, sp, #0x10
	str r6, [sp, #0xc]
	mov r0, r4
	mov r3, #0
	bl sub_06001F6C
	mov r4, r0
	ldrh r1, [r4, #4]
	cmp r1, #0
	beq _06003840
	mov r0, #2
	mov r2, #0
	bl sub_06003ED4
	b _0600396C
_06003840:
	bl sub_06000294
	ldrh r1, [r4, #8]
	mov r6, r0
	cmp r1, #0
	bne _06003878
	mov r0, #0xa
	strh r0, [r6]
	mov r1, #0
	strh r1, [r6, #2]
	mov r0, #4
	strh r0, [r6, #8]
	strh r5, [r6, #0x10]
	strh r1, [r6, #0x12]
	b _06003964
_06003878:
	ldr r1, [r7, #0x184]
	mov r0, #0
	add r1, r1, #0x40
	mov r2, #0x80
	bl sub_06000598
	ldrh r2, [r4, #0xa]
	ldr r1, [r7, #0x184]
	add r0, r4, #0xa
	mov r2, r2, lsl #1
	bl sub_06000440
	mov r0, #0xa
	strh r0, [r6]
	mov r0, #0
	strh r0, [r6, #2]
	mov r0, #5
	strh r0, [r6, #8]
	ldrh r0, [r4, #0x40]
	strh r0, [r6, #0x10]
	ldrh r0, [r4, #0xc]
	and r0, r0, #0xff
	bl sub_06003988
	mov r7, r0
	bl sub_06000658
	strh r0, [r6, #0x12]
	mov r0, r7
	bl sub_0600399C
	ldrh r1, [r4, #0x14]
	add r0, r4, #0xe
	strh r1, [r6, #0x14]
	add r1, r6, #0xa
	mov r2, #6
	bl sub_06000440
	add r0, r4, #0x16
	add r1, r6, #0x16
	mov r2, #0x20
	bl sub_06001B04
	ldrh r0, [r4, #0x46]
	strh r0, [r6, #0x36]
	cmp r0, #0x80
	bls _0600393C
	mov r0, #0xa
	strh r0, [r6]
	mov r1, #0
	strh r1, [r6, #2]
	mov r0, #4
	strh r0, [r6, #8]
	strh r5, [r6, #0x10]
	strh r1, [r6, #0x12]
	b _06003964
_0600393C:
	add r1, r6, #0x38
	mov r0, #0
	mov r2, #0x80
	bl sub_06000598
	ldrh r1, [r6, #0x36]
	add r0, r4, #0x4a
	add r2, r1, #1
	add r1, r6, #0x38
	bic r2, r2, #1
	bl sub_06001B04
_06003964:
	mov r0, r6
	bl sub_0600029C
_0600396C:
	add sp, sp, #0x248
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_06003978: .word 0x060198A4
_0600397C: .word 0x0000FFFF
_06003980: .word 0x00000303
_06003984: .word 0x0000011E
	arm_func_end sub_06003628

	arm_func_start sub_06003988
sub_06003988: ; 0x06003988
	tst r0, #2
	mov r0, r0, asr #2
	addeq r0, r0, #0x19
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_06003988

	arm_func_start sub_0600399C
sub_0600399C: ; 0x0600399C
	ldr r2, _060039B4 ; =0x027FFF98
	ldrh r1, [r2]
	eor r0, r0, r1, lsl #1
	eor r0, r0, r0, lsr #16
	strh r0, [r2]
	bx lr
	.align 2, 0
_060039B4: .word 0x027FFF98
	arm_func_end sub_0600399C

	arm_func_start sub_060039B8
sub_060039B8: ; 0x060039B8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc8
	sub sp, sp, #0x400
	ldr r1, _06003EB8 ; =0x060198A4
	mov sb, r0
	ldr r8, [r1, #0x550]
	ldrh r0, [r8]
	cmp r0, #2
	cmpne r0, #3
	cmpne r0, #5
	beq _06003A08
	bl sub_06000294
	mov r1, #0x26
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	bl sub_0600029C
	b _06003EA8
_06003A08:
	ldr r0, [sb, #4]
	add r1, sp, #0x18
	str r0, [r8, #0x184]
	ldrh sl, [sb, #2]
	add r0, r8, #0x100
	strh sl, [r0, #0x90]
	ldrh r3, [sb, #0xa]
	add r0, sb, #0xc
	str r3, [sp, #0x10]
	mov r2, #6
	bl sub_06000440
	ldrh r5, [sb, #0x12]
	ldrh fp, [sb, #0x36]
	cmp r5, #2
	beq _06003A50
	cmp r5, #3
	beq _06003A5C
	b _06003A68
_06003A50:
	mov r6, #1
	mov r5, #0
	b _06003A6C
_06003A5C:
	mov r6, #1
	mov r5, r6
	b _06003A6C
_06003A68:
	mov r6, #0
_06003A6C:
	add r1, sp, #0x4e
	add r0, sb, #0x16
	mov r2, #0x20
	ldrh r4, [sb, #0x14]
	bl sub_06000440
	ldrh r1, [sp, #0x18]
	ldr r0, _06003EBC ; =0x0000FFFF
	ldrh r7, [sb, #8]
	cmp r1, r0
	beq _06003AA0
	tst r1, #1
	bicne r0, r1, #1
	strneh r0, [sp, #0x18]
_06003AA0:
	add r0, r8, #0x100
	ldrh r1, [r0, #0xf4]
	mov r0, sl, lsl #0x11
	ands sl, r1, r0, lsr #16
	beq _06003AE4
	ldr r0, [r8, #0xc8]
	tst r0, #1
	cmpne r5, #1
	bne _06003AE4
	ldr r0, [sb, #4]
	cmp r0, #0
	beq _06003AE4
	tst r0, #3
	bne _06003AE4
	ldrh r0, [sb, #8]
	cmp r0, #0x40
	bhs _06003B08
_06003AE4:
	bl sub_06000294
	mov r1, #0x26
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	bl sub_0600029C
	b _06003EA8
_06003B08:
	mov r0, #2
	strh r0, [r8, #0xe6]
	add r0, sp, #0x70
	bl sub_06002A74
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06003B34
	mov r0, #0x308
	mov r2, #1
	bl sub_06003ED4
	b _06003EA8
_06003B34:
	ldrh r0, [r0, #6]
	cmp r0, #0x10
	bne _06003BB4
	add r1, sp, #0x70
	mov r0, #0x26
	bl sub_06000448
	cmp r0, #0
	beq _06003EA8
	add r0, sp, #0x70
	bl sub_06002A00
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06003B78
	ldr r0, _06003EC0 ; =0x00000303
	mov r2, #1
	bl sub_06003ED4
	b _06003EA8
_06003B78:
	mov r0, #3
	mov r1, #1
	strh r0, [r8]
	add r0, sp, #0x70
	mov r3, r1
	mov r2, #0
	bl sub_06001F0C
	ldrh r1, [r0, #4]
	mov r0, #1
	cmp r1, #0
	beq _06003BB0
	mov r2, r0
	bl sub_06003ED4
	b _06003EA8
_06003BB0:
	strh r0, [r8, #0xc6]
_06003BB4:
	add r0, r8, #0x100
	ldrh r0, [r0, #0xee]
	cmp r5, #0
	bne _06003C04
	cmp r0, #1
	bne _06003C40
	add r0, sp, #0x70
	mov r1, #0
	bl sub_060026D4
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06003BF4
	ldr r0, _06003EC4 ; =0x0000020E
	mov r2, #1
	bl sub_06003ED4
	b _06003EA8
_06003BF4:
	add r0, r8, #0x100
	mov r1, #0
	strh r1, [r0, #0xee]
	b _06003C40
_06003C04:
	cmp r0, #0
	bne _06003C40
	add r0, sp, #0x70
	mov r1, #1
	bl sub_060026D4
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06003C34
	ldr r0, _06003EC4 ; =0x0000020E
	mov r2, #1
	bl sub_06003ED4
	b _06003EA8
_06003C34:
	add r0, r8, #0x100
	mov r1, #1
	strh r1, [r0, #0xee]
_06003C40:
	cmp r6, #1
	bne _06003C98
	add r0, sp, #0x2e
	mov r1, #0xff
	mov r2, #0x20
	bl sub_06001AF4
	cmp fp, #0x20
	bhi _06003C70
	add r0, sp, #0x2e
	mov r2, fp
	mov r1, #0
	bl sub_06001AF4
_06003C70:
	add r1, sp, #0x2e
	add r0, sp, #0x70
	bl sub_06002660
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06003C98
	ldr r0, _06003EC8 ; =0x0000020D
	mov r2, #1
	bl sub_06003ED4
	b _06003EA8
_06003C98:
	mov r6, #0
	mov r3, #5
	add r0, sp, #0x1e
	mov r1, r6
	mov r2, #0x10
	strh r3, [r8]
	bl sub_06001AF4
	mov r3, #1
	add r1, sp, #0x1e
	mov r2, r3
_06003CC0:
	tst sl, r2, lsl r3
	addne r0, r6, #1
	movne r0, r0, lsl #0x10
	strneb r3, [r1, r6]
	movne r6, r0, lsr #0x10
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
	cmp r3, #0xf
	blo _06003CC0
	sub r0, r7, #0x40
	mov r1, #0x42
	bl sub_06003ECC
	add r2, sp, #0x4e
	stmia sp, {r2, r5}
	add r1, sp, #0x1e
	str r1, [sp, #8]
	ldr r1, [sp, #0x10]
	sub r5, r7, r0, lsl #1
	str r1, [sp, #0xc]
	add r2, sp, #0x18
	add r0, sp, #0x70
	mov r3, r4
	add r1, r5, #0x5e
	bl sub_06001F6C
	mov r5, r0
	ldrh r1, [r5, #4]
	cmp r1, #0
	beq _06003D44
	mov r0, #2
	mov r2, #1
	bl sub_06003ED4
	b _06003EA8
_06003D44:
	bl sub_06000294
	ldrh r1, [r5, #8]
	mov r6, r0
	cmp r1, #0
	bne _06003D80
	mov r0, #0x26
	strh r0, [r6]
	mov r1, #0
	strh r1, [r6, #2]
	mov r0, #4
	strh r0, [r6, #8]
	strh r1, [r6, #0xe]
	mov r0, sl, asr #1
	strh r0, [r6, #0xa]
	b _06003EA0
_06003D80:
	ldr sb, [r8, #0x184]
	mov r2, r7
	mov r1, sb
	mov r0, #0
	add r8, r5, #0xa
	bl sub_06000598
	mov r7, #0
	b _06003E6C
_06003DA0:
	ldrh r1, [r8]
	mov r0, r8
	mov r1, r1, lsl #0x11
	mov fp, r1, lsr #0x10
	mov r1, sb
	mov r2, fp
	bl sub_06000440
	cmp r4, #0
	beq _06003E28
	ldrh r2, [sb, #0xa]
	cmp r2, #0
	moveq r0, #0
	beq _06003E0C
	cmp r2, #0x20
	movhi r0, #0
	bhi _06003E0C
	mov r1, #0
	b _06003E00
_06003DE8:
	add r0, sb, r1
	ldrb r0, [r0, #0xc]
	cmp r0, #0
	movne r0, #1
	bne _06003E0C
	add r1, r1, #1
_06003E00:
	cmp r1, r2
	blt _06003DE8
	mov r0, #0
_06003E0C:
	cmp r0, #0
	bne _06003E28
	add r0, sp, #0x4e
	add r1, sb, #0xc
	mov r2, #0x20
	strh r4, [sb, #0xa]
	bl sub_06000440
_06003E28:
	add r0, r6, r7, lsl #2
	str sb, [r0, #0x10]
	ldrh r0, [r8, #2]
	and r0, r0, #0xff
	bl sub_06003988
	str r0, [sp, #0x14]
	bl sub_06000658
	add r1, r6, r7, lsl #1
	strh r0, [r1, #0x50]
	ldr r0, [sp, #0x14]
	bl sub_0600399C
	add sb, sb, fp
	tst sb, #2
	addne r0, sb, #2
	add r8, r8, fp
	bicne sb, r0, #3
	add r7, r7, #1
_06003E6C:
	ldrh r0, [r5, #8]
	cmp r7, r0
	blt _06003DA0
	mov r0, #0x26
	strh r0, [r6]
	mov r0, #0
	strh r0, [r6, #2]
	mov r0, #5
	strh r0, [r6, #8]
	ldrh r1, [r5, #8]
	mov r0, sl, asr #1
	strh r1, [r6, #0xe]
	strh r0, [r6, #0xa]
_06003EA0:
	mov r0, r6
	bl sub_0600029C
_06003EA8:
	add sp, sp, #0xc8
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06003EB8: .word 0x060198A4
_06003EBC: .word 0x0000FFFF
_06003EC0: .word 0x00000303
_06003EC4: .word 0x0000020E
_06003EC8: .word 0x0000020D
	arm_func_end sub_060039B8

	arm_func_start sub_06003ECC
sub_06003ECC: ; 0x06003ECC
	ldr pc, _06003ED0 ; =_u32_div_f
	.align 2, 0
_06003ED0: .word _u32_div_f
	arm_func_end sub_06003ECC

	arm_func_start sub_06003ED4
sub_06003ED4: ; 0x06003ED4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r2
	mov r6, r0
	mov r5, r1
	bl sub_06000294
	cmp r4, #0
	movne r1, #0x26
	moveq r1, #0xa
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #8]
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	bl sub_0600029C
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_06003ED4

	arm_func_start sub_06003F1C
sub_06003F1C: ; 0x06003F1C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x200
	ldr r0, _06003FE4 ; =0x060198A4
	add r4, sp, #0
	ldr r5, [r0, #0x550]
	ldrh r0, [r5]
	cmp r0, #5
	beq _06003F58
	bl sub_06000294
	mov r1, #0xb
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_0600029C
	b _06003FD8
_06003F58:
	mov r0, r4
	bl sub_060029E8
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06003F78
	ldr r0, _06003FE8 ; =0x00000302
	bl sub_06003FF0
	b _06003FD8
_06003F78:
	mov r0, #2
	strh r0, [r5]
	add r0, r5, #0x100
	ldrh r0, [r0, #0xee]
	cmp r0, #0
	bne _06003FC0
	mov r0, r4
	mov r1, #1
	bl sub_060026D4
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06003FB4
	ldr r0, _06003FEC ; =0x0000020E
	bl sub_06003FF0
	b _06003FD8
_06003FB4:
	add r0, r5, #0x100
	mov r1, #1
	strh r1, [r0, #0xee]
_06003FC0:
	bl sub_06000294
	mov r1, #0xb
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
_06003FD8:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06003FE4: .word 0x060198A4
_06003FE8: .word 0x00000302
_06003FEC: .word 0x0000020E
	arm_func_end sub_06003F1C

	arm_func_start sub_06003FF0
sub_06003FF0: ; 0x06003FF0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_06000294
	mov r1, #0xb
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_0600029C
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_06003FF0

	arm_func_start sub_06004024
sub_06004024: ; 0x06004024
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x250
	ldr r1, _060045B4 ; =0x060198A4
	add r4, sp, #0x50
	ldr r7, [r1, #0x550]
	ldr r5, [r1, #0x54c]
	ldrh r1, [r7]
	mov r6, r0
	cmp r1, #2
	bne _06004058
	ldr r0, [r7, #0xc8]
	tst r0, #1
	beq _0600407C
_06004058:
	bl sub_06000294
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #6
	strh r1, [r0, #8]
	bl sub_0600029C
	b _060045A8
_0600407C:
	ldr r0, [r6, #4]
	add r1, r5, #0x10
	mov r2, #0xc0
	bl sub_06000440
	ldrh r0, [r5, #0x4c]
	cmp r0, #0x10
	blo _060040C8
	ldrb r0, [r5, #0x5b]
	tst r0, #1
	bne _060040C8
	bl sub_06000294
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #0xb
	strh r1, [r0, #2]
	mov r1, #6
	strh r1, [r0, #8]
	bl sub_0600029C
	b _060045A8
_060040C8:
	ldrh r1, [r5, #0x46]
	add r0, r7, #0x100
	mov r2, #1
	ldrh r0, [r0, #0xf4]
	mov r1, r2, lsl r1
	tst r1, r0
	beq _060040F0
	rsb r0, r2, #0x2000
	tst r0, r1, asr #1
	bne _06004110
_060040F0:
	bl sub_06000294
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #6
	strh r1, [r0, #2]
	strh r1, [r0, #8]
	bl sub_0600029C
	b _060045A8
_06004110:
	bl sub_06000294
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #6
	strh r1, [r0, #8]
	bl sub_0600029C
	add r0, r7, #0x100
	ldrh r1, [r0, #0xec]
	cmp r1, #1
	ldrh r1, [r5, #0x3e]
	bne _06004158
	tst r1, #1
	movne r1, #1
	strneh r1, [r0, #0xec]
	moveq r1, #2
	b _06004168
_06004158:
	tst r1, #2
	movne r1, #2
	strneh r1, [r0, #0xec]
	moveq r1, #1
_06004168:
	streqh r1, [r0, #0xec]
	ldrh r0, [r5, #0x3c]
	tst r0, #0x20
	movne r1, #1
	add r0, r7, #0x100
	moveq r1, #0
	strh r1, [r0, #0xee]
	ldrh r0, [r5, #0x4c]
	mov r1, r4
	cmp r0, #0
	moveq r0, #3
	movne r0, #2
	strh r0, [r7, #0xe6]
	mov r0, #0xc
	bl sub_06000448
	cmp r0, #0
	beq _060045A8
	mov r0, r4
	mov r1, #0
	bl sub_06002850
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _060041D4
	ldr r0, _060045B8 ; =0x00000216
	mov r2, #0
	bl sub_060045D0
	b _060045A8
_060041D4:
	ldrh r0, [r5, #0x4c]
	cmp r0, #0x10
	bhs _06004230
	ldrh r1, [r5, #0x42]
	cmp r1, #0
	moveq r0, #1
	beq _060041FC
	ldr r0, _060045BC ; =0x00002710
	bl sub_060045C8
	add r0, r0, #1
_060041FC:
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	cmp r1, #0xff
	movhi r1, #0xff
	mov r0, r4
	bl sub_06002604
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06004230
	ldr r0, _060045C0 ; =0x0000020B
	mov r2, #0
	bl sub_060045D0
	b _060045A8
_06004230:
	mov r0, r4
	bl sub_06002A00
	ldrh r1, [r0, #4]
	mov r2, #0
	cmp r1, #0
	beq _06004254
	ldr r0, _060045C4 ; =0x00000303
	bl sub_060045D0
	b _060045A8
_06004254:
	mov r0, #3
	strh r0, [r7]
	ldr r0, [r6, #0x20]
	mov r3, #1
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	mov r0, r4
	mov r1, r8
	bl sub_06001F0C
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _060042A0
	mov r0, #1
	mov r2, #0
	bl sub_060045D0
	b _060045A8
_060042A0:
	strh r8, [r7, #0xc6]
	add r1, sp, #0xc
	add r0, r5, #0x10
	mov r2, #0x40
	bl sub_06000440
	ldrh r0, [r7, #0xe6]
	cmp r0, #2
	bne _060042FC
	mov r0, #0x20
	strh r0, [sp, #0x16]
	ldr r0, [r5, #0x54]
	add r1, sp, #0x20
	strh r0, [sp, #0x18]
	ldr r2, [r5, #0x54]
	add r0, r6, #8
	mov r2, r2, lsr #0x10
	strh r2, [sp, #0x1a]
	ldrh ip, [r5, #0x58]
	mov r3, #0
	mov r2, #0x18
	strh ip, [sp, #0x1c]
	strh r3, [sp, #0x1e]
	bl sub_06000440
_060042FC:
	add r2, sp, #0xc
	mov r0, r4
	mov r1, #0x7d0
	bl sub_06002024
	ldrh r1, [r0, #4]
	cmp r1, #0
	ldreqh r2, [r0, #6]
	cmpeq r2, #0
	beq _06004330
	ldrh r2, [r0, #6]
	mov r0, #3
	bl sub_060045D0
	b _060045A8
_06004330:
	add r1, r7, #0x8a
	add r0, r0, #8
	add r1, r1, #0x100
	mov r2, #6
	bl sub_06000440
	add r0, r7, #0x8a
	add r1, sp, #6
	add r0, r0, #0x100
	mov r2, #6
	bl sub_06000440
	ldrh r2, [r6, #0x26]
	add r1, sp, #6
	mov r0, r4
	mov r3, #0x7d0
	bl sub_0600209C
	ldrh r1, [r0, #4]
	cmp r1, #0xc
	ldreqh r2, [r0, #6]
	cmpeq r2, #0x13
	bne _060043A0
	bl sub_06000294
	mov r1, #0xc
	strh r1, [r0]
	strh r1, [r0, #2]
	mov r1, #6
	strh r1, [r0, #8]
	bl sub_0600029C
	b _060045A8
_060043A0:
	cmp r1, #0
	ldreqh r2, [r0, #6]
	cmpeq r2, #0
	beq _060043C0
	ldrh r2, [r0, #6]
	mov r0, #4
	bl sub_060045D0
	b _060045A8
_060043C0:
	add r0, r7, #0x8a
	add r1, sp, #0
	add r0, r0, #0x100
	mov r2, #6
	bl sub_06000440
	add r1, sp, #0
	mov r0, r4
	mov r2, #1
	mov r3, #0x7d0
	bl sub_06002194
	mov r4, r0
	bl sub_06000720
	ldrh r2, [r4, #4]
	mov r6, r0
	cmp r2, #0xc
	ldreqh r1, [r4, #6]
	cmpeq r1, #0x13
	bne _0600442C
	bl sub_06000740
	bl sub_06000294
	mov r1, #0xc
	strh r1, [r0]
	strh r1, [r0, #2]
	mov r1, #6
	strh r1, [r0, #8]
	bl sub_0600029C
	b _060045A8
_0600442C:
	cmp r2, #0
	ldreqh r0, [r4, #6]
	cmpeq r0, #0
	beq _06004458
	mov r0, r6
	bl sub_06000740
	ldrh r1, [r4, #4]
	ldrh r2, [r4, #6]
	mov r0, #6
	bl sub_060045D0
	b _060045A8
_06004458:
	ldrh r1, [r4, #8]
	add r0, r7, #0x100
	strh r1, [r0, #0x88]
	ldrh r0, [r5, #0x58]
	add r1, r7, #0x1f8
	strh r0, [r7, #0xba]
	mov r0, #1
	mov r2, #0x10
	bl sub_06000598
	ldrh r0, [r5, #0x12]
	and r0, r0, #0xff
	tst r0, #2
	mov r0, r0, asr #2
	addeq r0, r0, #0x19
	and r4, r0, #0xff
	mov r0, r4
	bl sub_06000658
	strh r0, [r7, #0xbc]
	mov r0, r4
	bl sub_060005E4
	bl sub_06000720
	add r1, r7, #0x100
	mov r2, #1
	strh r2, [r1, #0x82]
	strh r2, [r7, #0x86]
	ldr r1, [r7, #0x7bc]
	ldr r2, [r7, #0x7b8]
	cmp r1, #0
	mov r4, r0
	cmpeq r2, #0
	beq _060044E8
	bl sub_06001AFC
	orr r0, r0, #1
	str r0, [r7, #0x738]
	orr r0, r1, #0
	str r0, [r7, #0x73c]
_060044E8:
	mov r0, #8
	strh r0, [r7]
	ldrb r0, [r5, #0x5b]
	tst r0, #4
	movne r1, #0x2a
	ldrh r0, [r5, #0x5c]
	moveq r1, #0
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_06000860
	ldrb r0, [r5, #0x5b]
	tst r0, #4
	movne r1, #6
	ldrh r0, [r5, #0x5e]
	moveq r1, #0
	add r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_060008B0
	mov r0, r4
	bl sub_06000740
	mov r0, #1
	strh r0, [r7, #0xc2]
	bl sub_06000294
	mov r4, r0
	mov r0, #0xc
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #7
	strh r0, [r4, #8]
	add r0, r7, #0x100
	ldrh r2, [r0, #0x88]
	add r1, r7, #0x8a
	strh r2, [r4, #0xa]
	add r0, r1, #0x100
	add r1, r4, #0x10
	mov r2, #6
	bl sub_06000440
	ldrh r1, [r7, #0x30]
	mov r0, r4
	strh r1, [r4, #0x16]
	ldrh r1, [r7, #0x32]
	strh r1, [r4, #0x18]
	bl sub_0600029C
	mov r0, r6
	bl sub_06000740
_060045A8:
	add sp, sp, #0x250
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_060045B4: .word 0x060198A4
_060045B8: .word 0x00000216
_060045BC: .word 0x00002710
_060045C0: .word 0x0000020B
_060045C4: .word 0x00000303
	arm_func_end sub_06004024

	arm_func_start sub_060045C8
sub_060045C8: ; 0x060045C8
	ldr pc, _060045CC ; =_s32_div_f
	.align 2, 0
_060045CC: .word _s32_div_f
	arm_func_end sub_060045C8

	arm_func_start sub_060045D0
sub_060045D0: ; 0x060045D0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl sub_06000294
	mov r1, #0xc
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r6, [r0, #4]
	strh r5, [r0, #6]
	strh r4, [r0, #0xe]
	bl sub_0600029C
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_060045D0

	arm_func_start sub_0600460C
sub_0600460C: ; 0x0600460C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, [r0, #4]
	add r2, sp, #0
	mov r3, r1, lsl #0x10
	mov r1, #0
	mov r4, r3, lsr #0x10
	bl sub_06004664
	cmp r0, #1
	bne _06004658
	bl sub_06000294
	mov r1, #0xd
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	strh r4, [r0, #8]
	ldrh r1, [sp]
	strh r1, [r0, #0xa]
	bl sub_0600029C
_06004658:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_0600460C

	arm_func_start sub_06004664
sub_06004664: ; 0x06004664
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x220
	ldr r3, _06004BE8 ; =0x060198A4
	ldr r4, [r0, #4]
	movs sl, r1
	ldrne r0, [r0, #8]
	mov r1, r4, lsl #0x10
	moveq r0, #0
	mov r0, r0, lsl #0x10
	mov fp, #0
	ldr r7, [r3, #0x550]
	mov r8, r1, lsr #0x10
	ldrh r1, [r7]
	mov r0, r0, lsr #0x10
	cmp r1, #9
	str r2, [sp]
	mov r5, fp
	str r0, [sp, #8]
	cmpne r1, #7
	bne _060046C4
	ldr r0, [r7, #0xc]
	cmp r0, #1
	moveq r5, #1
	b _060047BC
_060046C4:
	cmp r1, #0xa
	cmpne r1, #8
	bne _06004780
	bl sub_06000720
	add r1, r7, #0x100
	ldrh r1, [r1, #0x82]
	mov r4, r0
	cmp r1, #0
	bne _06004728
	bl sub_06000740
	cmp sl, #0
	bne _06004720
	bl sub_06000294
	mov r1, #0xd
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r8, [r0, #8]
	strh r1, [r0, #0xa]
	bl sub_0600029C
_06004720:
	mov r0, #0
	b _06004BDC
_06004728:
	ldr r0, [r7, #0xc]
	cmp r0, #1
	bne _06004758
	mov r0, #0
	str r0, [r7, #0xc]
	mov r5, #1
	bl sub_06005CEC
	bl sub_060006C0
	ldrh r0, [r7]
	cmp r0, #0xa
	moveq r0, #8
	streqh r0, [r7]
_06004758:
	add r0, r7, #0x100
	mov r1, #0
	strh r1, [r0, #0x82]
	strh r1, [r7, #0x86]
	str r1, [r7, #0x14]
	str r1, [r7, #0x10]
	mov r0, r4
	str r1, [r7, #0x1c]
	bl sub_06000740
	b _060047BC
_06004780:
	cmp sl, #0
	bne _060047B4
	bl sub_06000294
	mov r1, #0xd
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, fp
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r8, [r0, #8]
	strh r1, [r0, #0xa]
	bl sub_0600029C
_060047B4:
	mov r0, #0
	b _06004BDC
_060047BC:
	ldrh r0, [r7]
	cmp r0, #0xa
	cmpne r0, #8
	bne _060049E4
	add r0, r7, #0x8a
	add r1, sp, #0x1a
	add r0, r0, #0x100
	mov r2, #6
	bl sub_06000440
	mov sb, #0
	add r6, sp, #0x1a
	mov r4, #3
	b _06004874
_060047F0:
	add r0, sp, #0x20
	mov r1, r6
	mov r2, r4
	bl sub_0600211C
	ldrh r1, [r0, #4]
	cmp r1, #7
	bgt _0600482C
	bge _06004834
	cmp r1, #1
	bgt _0600483C
	cmp r1, #0
	blt _0600483C
	cmpne r1, #1
	beq _0600487C
	b _0600483C
_0600482C:
	cmp r1, #0xc
	bne _0600483C
_06004834:
	add sb, sb, #1
	b _06004874
_0600483C:
	cmp sl, #0
	mov r2, r8
	mov r0, #5
	mov r3, #0
	beq _06004858
	bl sub_06004CF8
	b _0600485C
_06004858:
	bl sub_06004CB4
_0600485C:
	cmp r5, #0
	beq _0600486C
	mov r0, #1
	bl sub_060079AC
_0600486C:
	mov r0, #0
	b _06004BDC
_06004874:
	cmp sb, #2
	blt _060047F0
_0600487C:
	mov r0, #0
	strh r0, [r7, #0xc2]
	mov r0, #3
	mov fp, #1
	strh r0, [r7]
	add r0, sp, #0x20
	mov r1, fp
	bl sub_06001EB8
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _060048E0
	cmp sl, #0
	mov r2, r8
	mov r0, #0
	mov r3, fp
	beq _060048C4
	bl sub_06004CF8
	b _060048C8
_060048C4:
	bl sub_06004CB4
_060048C8:
	cmp r5, #0
	beq _060048D8
	mov r0, #1
	bl sub_060079AC
_060048D8:
	mov r0, #0
	b _06004BDC
_060048E0:
	add r0, sp, #0x20
	bl sub_060029E8
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06004930
	ldr r0, _06004BEC ; =0x00000302
	cmp sl, #0
	mov r2, r8
	beq _06004910
	mov r3, fp
	bl sub_06004CF8
	b _06004918
_06004910:
	mov r3, fp
	bl sub_06004CB4
_06004918:
	cmp r5, #0
	beq _06004928
	mov r0, #1
	bl sub_060079AC
_06004928:
	mov r0, #0
	b _06004BDC
_06004930:
	mov r0, #2
	strh r0, [r7]
	mov r1, #0
	str r1, [r7, #0x198]
	add r3, r7, #0x100
	add r0, r7, #0x19c
	mov r2, #0x50
	strh r1, [r3, #0x96]
	bl sub_06001AF4
	bl sub_0600082C
	cmp sl, #1
	bne _060049C0
	bl sub_06000294
	mov r4, r0
	mov r0, #0xc
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #9
	strh r0, [r4, #8]
	ldr r0, [sp, #8]
	mov r2, #6
	strh r0, [r4, #0xc]
	add r0, r7, #0x100
	ldrh r1, [r0, #0x88]
	add r0, sp, #0x1a
	strh r1, [r4, #0xa]
	add r1, r4, #0x10
	bl sub_06000440
	ldrh r1, [r7, #0x30]
	mov r0, r4
	strh r1, [r4, #0x16]
	ldrh r1, [r7, #0x32]
	strh r1, [r4, #0x18]
	bl sub_0600029C
	b _060049D0
_060049C0:
	mov r0, #0
	add r2, sp, #0x1a
	mov r1, r0
	bl sub_06004BF0
_060049D0:
	cmp r5, #0
	beq _06004BCC
	mov r0, #1
	bl sub_060079AC
	b _06004BCC
_060049E4:
	mov r6, #1
	b _06004BC4
_060049EC:
	add r0, r7, #0x100
	ldrh r0, [r0, #0x82]
	mov r1, #1
	mov sb, r1, lsl r6
	and r0, r0, r8
	tst sb, r0
	beq _06004BC0
	sub r1, r6, #1
	mov r2, #6
	mul r0, r1, r2
	str r0, [sp, #0x10]
	add r0, r7, #0x128
	str r0, [sp, #0xc]
	mov r0, r6, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [sp, #4]
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	add r1, sp, #0x14
	bl sub_06000440
	mov r4, #0
	b _06004AB0
_06004A48:
	add r0, sp, #0x20
	add r1, sp, #0x14
	mov r2, #3
	bl sub_0600211C
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06004AB8
	cmp r1, #7
	cmpne r1, #0xc
	bne _06004A78
	add r4, r4, #1
	b _06004AB0
_06004A78:
	cmp sl, #0
	mov r2, r8
	mov r0, #5
	mov r3, fp
	beq _06004A94
	bl sub_06004CF8
	b _06004A98
_06004A94:
	bl sub_06004CB4
_06004A98:
	cmp r5, #0
	beq _06004AA8
	mov r0, #1
	bl sub_060079AC
_06004AA8:
	mov r0, #0
	b _06004BDC
_06004AB0:
	cmp r4, #2
	blt _06004A48
_06004AB8:
	bl sub_06000720
	mov r4, r0
	add r1, r7, #0x100
	ldrh r3, [r1, #0x82]
	tst r3, sb
	beq _06004BBC
	ldr r2, [sp, #0xc]
	ldr r0, [sp, #0x10]
	mov ip, #1
	add r0, r2, r0
	ldr r2, [sp, #4]
	orr r2, fp, ip, lsl r2
	mov r2, r2, lsl #0x10
	mov fp, r2, lsr #0x10
	mvn r2, sb
	and r3, r3, r2
	strh r3, [r1, #0x82]
	ldrh r3, [r7, #0x86]
	mov r1, #0
	and r2, r3, r2
	strh r2, [r7, #0x86]
	ldr r2, [sp, #4]
	add r2, r7, r2, lsl #3
	str r1, [r2, #0x738]
	str r1, [r2, #0x73c]
	mov r2, #6
	bl sub_06001AF4
	mov r0, r4
	bl sub_06000740
	cmp sl, #1
	bne _06004B90
	bl sub_06000294
	mov r4, r0
	mov r0, #8
	strh r0, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	mov r0, #9
	strh r0, [r4, #8]
	ldr r0, [sp, #8]
	add r1, r4, #0xa
	strh r0, [r4, #0x12]
	ldr r0, [sp, #4]
	mov r2, #6
	strh r0, [r4, #0x10]
	add r0, sp, #0x14
	bl sub_06000440
	ldrh r1, [r7, #0x30]
	mov r0, r4
	strh r1, [r4, #0x2c]
	ldrh r1, [r7, #0x32]
	strh r1, [r4, #0x2e]
	bl sub_0600029C
	b _06004BA4
_06004B90:
	mov r0, r6, lsl #0x10
	mov r1, r0, lsr #0x10
	add r2, sp, #0x14
	mov r0, #1
	bl sub_06004BF0
_06004BA4:
	cmp r5, #0
	beq _06004BC0
	mov r0, sb, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_060079AC
	b _06004BC0
_06004BBC:
	bl sub_06000740
_06004BC0:
	add r6, r6, #1
_06004BC4:
	cmp r6, #0x10
	blt _060049EC
_06004BCC:
	ldr r0, [sp]
	cmp r0, #0
	strneh fp, [r0]
	mov r0, #1
_06004BDC:
	add sp, sp, #0x220
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06004BE8: .word 0x060198A4
_06004BEC: .word 0x00000302
	arm_func_end sub_06004664

	arm_func_start sub_06004BF0
sub_06004BF0: ; 0x06004BF0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, _06004CAC ; =0x060198A4
	mov r8, r0
	ldr r5, [r3, #0x550]
	mov r7, r1
	mov r6, r2
	bl sub_06000294
	mov r4, r0
	mov r0, #0
	strh r0, [r4, #2]
	cmp r8, #0
	mov r1, #0x1a
	mov r2, #6
	beq _06004C60
	mov r0, #8
	strh r0, [r4]
	strh r1, [r4, #8]
	ldr r0, _06004CB0 ; =0x0000F001
	add r1, r4, #0xa
	strh r0, [r4, #0x12]
	strh r7, [r4, #0x10]
	mov r0, r6
	bl sub_06000440
	ldrh r0, [r5, #0x30]
	strh r0, [r4, #0x2c]
	ldrh r0, [r5, #0x32]
	strh r0, [r4, #0x2e]
	b _06004C9C
_06004C60:
	mov r0, #0xc
	strh r0, [r4]
	ldr r0, _06004CB0 ; =0x0000F001
	strh r1, [r4, #8]
	strh r0, [r4, #0xc]
	add r0, r5, #0x100
	ldrh r1, [r0, #0x88]
	mov r0, r6
	strh r1, [r4, #0xa]
	add r1, r4, #0x10
	bl sub_06000440
	ldrh r0, [r5, #0x30]
	strh r0, [r4, #0x16]
	ldrh r0, [r5, #0x32]
	strh r0, [r4, #0x18]
_06004C9C:
	mov r0, r4
	bl sub_0600029C
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_06004CAC: .word 0x060198A4
_06004CB0: .word 0x0000F001
	arm_func_end sub_06004BF0

	arm_func_start sub_06004CB4
sub_06004CB4: ; 0x06004CB4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_06000294
	mov r1, #0xd
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r7, [r0, #4]
	strh r6, [r0, #6]
	strh r5, [r0, #8]
	strh r4, [r0, #0xa]
	bl sub_0600029C
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_06004CB4

	arm_func_start sub_06004CF8
sub_06004CF8: ; 0x06004CF8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_06000294
	mov r1, #0x25
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r7, [r0, #4]
	strh r6, [r0, #6]
	strh r5, [r0, #8]
	strh r4, [r0, #0xa]
	bl sub_0600029C
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_06004CF8

	arm_func_start sub_06004D3C
sub_06004D3C: ; 0x06004D3C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x204
	ldr r1, _060050C4 ; =0x060198A4
	mov sl, r0
	ldr r8, [r1, #0x550]
	ldr fp, [sl, #4]
	ldrh r1, [r8, #0x9c]
	ldr r4, [sl, #8]
	ldr r5, [sl, #0xc]
	ldr r6, [sl, #0x10]
	ldr r0, _060050C8 ; =0x060188A4
	cmp r1, #0
	mov r7, #0
	bne _06004DC0
	ldrh r1, [r8, #0x3c]
	add r1, r1, #0x1f
	bic r1, r1, #0x1f
	cmp r6, r1
	add r1, r8, #0x100
	ldrh r1, [r1, #0x88]
	movlo r7, #6
	cmp r1, #0
	ldrneh r1, [r8, #0x3e]
	addne r1, r1, #0x51
	bne _06004DB4
	ldrh r2, [r8, #0x3e]
	ldrh r1, [r8, #0xf8]
	add r2, r2, #0xc
	mul r1, r2, r1
	add r1, r1, #0x29
_06004DB4:
	bic r1, r1, #0x1f
	cmp r4, r1
	movlo r7, #6
_06004DC0:
	ldrh r1, [r8, #0xe6]
	cmp r1, #2
	bne _06004DF0
	add r0, r0, #0x1000
	ldr r1, [r0, #0x54c]
	add r0, r8, #0x100
	ldrh r1, [r1, #0x46]
	ldrh r3, [r0, #0xf6]
	mov r2, #1
	mov r0, r2, lsl r1
	tst r3, r0, asr #1
	moveq r7, #6
_06004DF0:
	cmp r7, #0
	beq _06004E18
	bl sub_06000294
	mov r1, #0xe
	strh r1, [r0]
	strh r7, [r0, #2]
	mov r1, #0xa
	strh r1, [r0, #4]
	bl sub_0600029C
	b _060050B8
_06004E18:
	ldr r0, [r8, #0xc]
	mov r1, #0
	cmp r0, #0
	strne r1, [r8, #0xc]
	movne r1, #1
	cmp r1, #0
	beq _06004E3C
	ldr r0, _060050CC ; =0x0000FFFF
	bl sub_060079AC
_06004E3C:
	bl sub_060064E0
	bl sub_06000720
	str r0, [sp]
	add r0, sl, #0x14
	mov r1, #0
	bl sub_060085B4
	ldr r0, _060050C4 ; =0x060198A4
	ldr r7, [sl, #0x30]
	ldr sb, [r0, #0x550]
	ldrh r0, [sb]
	cmp r0, #9
	cmpne r0, #0xa
	beq _06004F30
	bl sub_06000720
	tst r7, #4
	ldrneh r2, [sl, #0x38]
	add r1, sb, #0x700
	ldreqh r2, [sb, #0x5c]
	cmp r2, #0
	moveq r2, #0x10
	tst r7, #1
	ldrneh r3, [sl, #0x34]
	ldreqh r3, [sb, #0x58]
	cmp r3, #0
	moveq r3, #0x10
	cmp r3, r2
	movhi r3, r2
	tst r7, #2
	ldrneh ip, [sl, #0x36]
	ldreqh ip, [sb, #0x5a]
	strh r2, [r1, #0xc4]
	cmp ip, #0
	moveq ip, #0x10
	cmp ip, r2
	strh r3, [r1, #0xc0]
	movhi ip, r2
	strh ip, [r1, #0xc2]
	ldrsh r1, [sb, #0x62]
	cmp r1, r2
	strgth r2, [sb, #0x62]
	tst r7, #0x200
	ldrneh r2, [sl, #0x3a]
	add r1, sb, #0x700
	ldreqh r2, [sb, #0x98]
	tst r7, #0x400
	strh r2, [r1, #0xca]
	ldrneb r2, [sl, #0x3c]
	add r1, sb, #0x700
	ldreqh r2, [sb, #0x92]
	tst r7, #0x800
	strh r2, [r1, #0xc6]
	ldrneb r2, [sl, #0x3d]
	add r1, sb, #0x700
	ldreqh r2, [sb, #0x94]
	tst r7, #0x1000
	strh r2, [r1, #0xc8]
	ldrneb r2, [sl, #0x3e]
	add r1, sb, #0x700
	ldreqh r2, [sb, #0x9a]
	strh r2, [r1, #0xcc]
	bl sub_06000740
_06004F30:
	ldrh r0, [r8]
	add r0, r0, #0xf9
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _06005090
	mov r2, #0
	strh r2, [r8, #0x84]
	strh r2, [r8, #0x5e]
	mov r1, #1
	strh r1, [r8, #0x60]
	strh r2, [r8, #0x88]
	strh r2, [r8, #0x9e]
	mov r0, #0x3c
	strh r0, [r8, #0xa0]
	str r2, [r8, #0x734]
	strh r2, [r8, #0x8a]
	strh r2, [r8, #0x8c]
	strh r2, [r8, #0x8e]
	strh r2, [r8, #0x90]
	strh r2, [r8, #0x66]
	str fp, [r8, #0x74]
	strh r4, [r8, #0x72]
	add r0, fp, r4
	str r0, [r8, #0x78]
	strh r2, [r8, #0x70]
	str r5, [r8, #0x7c]
	strh r6, [r8, #0x80]
	strh r2, [r8, #0x62]
	strh r2, [r8, #0x64]
	strh r2, [r8, #0x68]
	strh r2, [r8, #0x6a]
	rsb r0, r1, #0x10000
	strh r0, [r8, #0xbe]
	strh r1, [r8, #0xc0]
	bl sub_06001AFC
	orr r1, r1, #0
	orr r2, r0, #1
	mov r3, #0
_06004FD0:
	add r0, r8, r3, lsl #3
	str r2, [r0, #0x738]
	add r3, r3, #1
	str r1, [r0, #0x73c]
	cmp r3, #0x10
	blt _06004FD0
	bl sub_06000748
	mov r0, #0
	strh r0, [r8, #0xce]
	bl sub_06005D00
	ldrh r0, [r8]
	cmp r0, #8
	moveq r0, #0xa
	streqh r0, [r8]
	beq _06005018
	cmp r0, #7
	moveq r0, #9
	streqh r0, [r8]
_06005018:
	bl sub_06000294
	mov r1, #0xe
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xa
	strh r1, [r0, #4]
	bl sub_0600029C
	mov r1, #1
	ldr r0, [sp]
	str r1, [r8, #0xc]
	bl sub_06000740
	add r0, sp, #4
	mov r1, #1
	bl sub_06002850
	mov r4, r0
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _060050B8
	bl sub_06000294
	mov r2, #0xe
	strh r2, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	add r1, r2, #0x208
	strh r1, [r0, #4]
	ldrh r1, [r4, #4]
	strh r1, [r0, #6]
	bl sub_0600029C
	b _060050B8
_06005090:
	ldr r0, [sp]
	bl sub_06000740
	bl sub_06000294
	mov r1, #0xe
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	mov r1, #0xa
	strh r1, [r0, #4]
	bl sub_0600029C
_060050B8:
	add sp, sp, #0x204
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_060050C4: .word 0x060198A4
_060050C8: .word 0x060188A4
_060050CC: .word 0x0000FFFF
	arm_func_end sub_06004D3C

	arm_func_start sub_060050D0
sub_060050D0: ; 0x060050D0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r1, _06005204 ; =0x060198A4
	ldr r2, [r0, #0x10]
	ldr sl, [r1, #0x550]
	ldr r5, [r0, #8]
	add r4, sl, #0x100
	ldr r3, [r0, #0x14]
	ldrh r8, [r4, #0x88]
	mov r1, r5, lsl #0x10
	ldrh sb, [r4, #0x82]
	ldr fp, [r0, #4]
	ldr r5, [r0, #0xc]
	cmp r8, #0
	ldr r6, [r0, #0x18]
	ldr r7, [r0, #0x1c]
	mov r2, r2, lsl #0x10
	mov r0, r2, lsr #0x10
	str r0, [sp, #0x10]
	ldr r0, [sl, #0xc]
	movne r5, #1
	cmp r0, #0
	mov r3, r3, lsl #0x10
	mov r4, r1, lsr #0x10
	mov r1, r3, lsr #0x10
	moveq r8, #3
	beq _06005164
	tst r5, sb
	moveq r8, #0
	beq _06005164
	str fp, [sp]
	stmib sp, {r4, r6, r7}
	ldr r2, [sp, #0x10]
	mov r0, sb
	mov r3, r5
	bl sub_06007548
	mov r8, r0
_06005164:
	cmp r8, #2
	beq _060051F8
	bl sub_06000294
	mov r1, #0x81
	strh r1, [r0]
	strh r8, [r0, #2]
	mov r1, #0x14
	strh r1, [r0, #8]
	ldr r1, [sp, #0x10]
	cmp r8, #0xa
	strh r1, [r0, #0xa]
	andeq r1, r5, sb
	strh r5, [r0, #0xc]
	movne r1, #0
	strh r1, [r0, #0xe]
	mov r1, #0
	strh r1, [r0, #0x10]
	strh r4, [r0, #0x18]
	str fp, [r0, #0x14]
	str r6, [r0, #0x1c]
	ldr r1, _06005208 ; =0x0000FFFF
	str r7, [r0, #0x20]
	strh r1, [r0, #0x1a]
	add r1, sl, #0x100
	ldrh r1, [r1, #0x88]
	ldrh r2, [sl, #0x30]
	cmp r1, #0
	ldrh r3, [sl, #0x32]
	moveq r1, r2
	movne r1, r3
	strh r1, [r0, #0x24]
	add r1, sl, #0x100
	ldrh r1, [r1, #0x88]
	cmp r1, #0
	movne r3, r2
	strh r3, [r0, #0x26]
	bl sub_0600029C
_060051F8:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06005204: .word 0x060198A4
_06005208: .word 0x0000FFFF
	arm_func_end sub_060050D0

	arm_func_start sub_0600520C
sub_0600520C: ; 0x0600520C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x200
	ldr r0, _0600531C ; =0x060198A4
	mov r4, #0
	ldr r6, [r0, #0x550]
	ldrh r0, [r6]
	cmp r0, #9
	cmpne r0, #0xa
	beq _0600524C
	bl sub_06000294
	mov r1, #0x10
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_0600029C
	b _06005310
_0600524C:
	bl sub_06000720
	ldr r1, [r6, #0xc]
	mov r5, r0
	mov r0, #0
	cmp r1, #1
	str r0, [r6, #0xc]
	moveq r4, #1
	bl sub_06005CEC
	bl sub_060006C0
	ldrh r0, [r6]
	cmp r0, #0xa
	moveq r0, #8
	streqh r0, [r6]
	beq _06005290
	cmp r0, #9
	moveq r0, #7
	streqh r0, [r6]
_06005290:
	mov r0, r5
	bl sub_06000740
	add r0, sp, #0
	mov r1, #0
	bl sub_06002850
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _060052BC
	ldr r0, _06005320 ; =0x00000216
	bl sub_06005328
	b _06005310
_060052BC:
	add r0, sp, #0
	mov r1, #7
	bl sub_060024FC
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _060052E0
	mov r0, #0x104
	bl sub_06005328
	b _06005310
_060052E0:
	mov r0, #0
	strh r0, [r6, #0x8a]
	cmp r4, #0
	beq _060052F8
	ldr r0, _06005324 ; =0x0000FFFF
	bl sub_060079AC
_060052F8:
	bl sub_06000294
	mov r1, #0x10
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
_06005310:
	add sp, sp, #0x200
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0600531C: .word 0x060198A4
_06005320: .word 0x00000216
_06005324: .word 0x0000FFFF
	arm_func_end sub_0600520C

	arm_func_start sub_06005328
sub_06005328: ; 0x06005328
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_06000294
	mov r1, #0x10
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_0600029C
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_06005328

	arm_func_start sub_0600535C
sub_0600535C: ; 0x0600535C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _060053E4 ; =0x060198A4
	ldr r2, [r0, #8]
	ldr r4, [r1, #0x550]
	mov r5, r2, lsl #0x10
	ldr r6, [r0, #4]
	mov r7, r5, lsr #0x10
	bl sub_06000720
	str r6, [r4, #0xb0]
	strh r7, [r4, #0xb8]
	add r1, r6, r5, lsr #16
	str r1, [r4, #0xb4]
	mov r1, #0
	strh r1, [r4, #0xae]
	str r1, [r4, #0xa8]
	strh r1, [r4, #0xac]
	str r1, [r4, #0x18]
	mov r1, #0xb
	strh r1, [r4]
	mov r5, r0
	bl sub_06000294
	mov r1, #0x11
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0xe
	strh r1, [r0, #4]
	bl sub_0600029C
	mov r1, #1
	mov r0, r5
	str r1, [r4, #0x10]
	bl sub_06000740
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_060053E4: .word 0x060198A4
	arm_func_end sub_0600535C

	arm_func_start sub_060053E8
sub_060053E8: ; 0x060053E8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x230
	ldr r1, _060054DC ; =0x060198A4
	mov r5, r0
	ldr r4, [r1, #0x550]
	add r0, r5, #4
	add r1, r4, #0xa2
	mov r2, #6
	bl sub_06000440
	ldr r0, [r5, #0xc]
	add r1, sp, #0
	str r0, [r4, #0xa8]
	ldr r2, [r5, #0x10]
	mov r0, #1
	strh r2, [r4, #0xac]
	str r0, [r4, #0x18]
	mov r0, #0
	mov r2, #0x30
	bl sub_06000598
	mov r0, #0
	strh r0, [sp]
	ldr r1, [r5, #0x10]
	add r0, r4, #0x100
	strh r1, [sp, #6]
	ldrh r0, [r0, #0xec]
	add r1, sp, #0x18
	cmp r0, #2
	moveq r3, #0x14
	movne r3, #0xa
	add r0, r5, #4
	mov r2, #6
	strb r3, [sp, #0xe]
	bl sub_06000440
	add r1, sp, #0x1e
	add r0, r4, #0xe0
	mov r2, #6
	bl sub_06000440
	ldr r2, [r5, #0xc]
	add r0, sp, #0x30
	add r1, sp, #0
	str r2, [sp, #0x2c]
	bl sub_06002350
	mov r4, r0
	bl sub_06000294
	mov r1, #0x12
	strh r1, [r0]
	ldrh r1, [r4, #4]
	cmp r1, #0
	moveq r1, #0
	movne r1, #1
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	cmp r1, #0
	movne r1, #0x100
	strneh r1, [r0, #4]
	ldrneh r1, [r4, #4]
	strneh r1, [r0, #6]
	bl sub_0600029C
	add sp, sp, #0x230
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_060054DC: .word 0x060198A4
	arm_func_end sub_060053E8

	arm_func_start sub_060054E0
sub_060054E0: ; 0x060054E0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	ldr r0, _06005598 ; =0x060198A4
	ldr r4, [r0, #0x550]
	bl sub_06000720
	ldrh r1, [r4]
	cmp r1, #0xb
	beq _06005520
	bl sub_06000740
	bl sub_06000294
	mov r1, #0x13
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_0600029C
	b _0600558C
_06005520:
	mov r1, #0
	str r1, [r4, #0x10]
	mov r1, #8
	strh r1, [r4]
	bl sub_06000740
	add r0, sp, #0
	mov r1, #7
	bl sub_060024FC
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _06005574
	bl sub_06000294
	mov r1, #0x13
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #0x104
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_0600029C
	b _0600558C
_06005574:
	bl sub_06000294
	mov r1, #0x13
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
_0600558C:
	add sp, sp, #0x200
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06005598: .word 0x060198A4
	arm_func_end sub_060054E0

	arm_func_start sub_0600559C
sub_0600559C: ; 0x0600559C
	stmdb sp!, {r3, lr}
	ldr r1, _06005640 ; =0x060198A4
	ldr r2, [r0, #4]
	ldr r3, [r1, #0x550]
	add r1, r3, #0x100
	strh r2, [r1, #0x96]
	ldrh r1, [r1, #0x96]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _060055EC
_060055C4: ; jump table
	b _060055D4 ; case 0
	b _060055E0 ; case 1
	b _060055E0 ; case 2
	b _060055E0 ; case 3
_060055D4:
	mov r1, #0
	str r1, [r3, #0x198]
	b _060055F4
_060055E0:
	mov r1, #1
	str r1, [r3, #0x198]
	b _060055F4
_060055EC:
	mov r1, #0
	str r1, [r3, #0x198]
_060055F4:
	ldr r1, [r3, #0x198]
	mov r2, #0x50
	cmp r1, #1
	bne _06005614
	ldr r0, [r0, #8]
	add r1, r3, #0x19c
	bl sub_06000440
	b _06005620
_06005614:
	add r0, r3, #0x19c
	mov r1, #0
	bl sub_06001AF4
_06005620:
	bl sub_06000294
	mov r1, #0x14
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06005640: .word 0x060198A4
	arm_func_end sub_0600559C

	arm_func_start sub_06005644
sub_06005644: ; 0x06005644
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x200
	ldr r1, _06005738 ; =0x060198A4
	mov r5, r0
	ldr r4, [r1, #0x550]
	ldr r1, [r5, #4]
	add r0, r4, #0x100
	strh r1, [r0, #0x96]
	ldrh r0, [r0, #0x96]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0600569C
_06005674: ; jump table
	b _06005684 ; case 0
	b _06005690 ; case 1
	b _06005690 ; case 2
	b _06005690 ; case 3
_06005684:
	mov r0, #0
	str r0, [r4, #0x198]
	b _060056A4
_06005690:
	mov r0, #1
	str r0, [r4, #0x198]
	b _060056A4
_0600569C:
	mov r0, #0
	str r0, [r4, #0x198]
_060056A4:
	ldr r0, [r4, #0x198]
	mov r2, #0x50
	cmp r0, #1
	bne _060056C4
	ldr r0, [r5, #8]
	add r1, r4, #0x19c
	bl sub_06000440
	b _060056D0
_060056C4:
	add r0, r4, #0x19c
	mov r1, #0
	bl sub_06001AF4
_060056D0:
	ldr r1, [r5, #0xc]
	add r0, sp, #0
	strh r1, [r4, #0xc4]
	ldrh r1, [r4, #0xc4]
	bl sub_060025A8
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _06005714
	bl sub_06000294
	mov r2, #0x14
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	rsb r1, r1, #0x208
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_0600029C
_06005714:
	bl sub_06000294
	mov r1, #0x27
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06005738: .word 0x060198A4
	arm_func_end sub_06005644

	arm_func_start sub_0600573C
sub_0600573C: ; 0x0600573C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x280
	ldr r1, _06005828 ; =0x060198A4
	ldr r2, [r0, #4]
	ldr r4, [r1, #0x550]
	str r2, [r4, #0xe8]
	ldr r1, [r0, #8]
	strh r1, [r4, #0xec]
	ldr r1, [r0, #0xc]
	str r1, [r4, #0xf0]
	ldr r1, [r0, #0x10]
	strh r1, [r4, #0xf4]
	ldr r0, [r0, #0x14]
	and r0, r0, #0xff
	tst r0, #1
	movne r1, #1
	moveq r1, #0
	strh r1, [r4, #0xf6]
	tst r0, #2
	movne r1, #1
	moveq r1, #0
	strh r1, [r4, #0xfa]
	tst r0, #4
	movne r1, #1
	moveq r1, #0
	tst r0, #8
	strh r1, [r4, #0xfc]
	movne r1, #1
	moveq r1, #0
	strh r1, [r4, #0xfe]
	add r0, sp, #0
	add r1, r4, #0xe8
	bl sub_0600037C
	ldrh r1, [r4, #0xec]
	add r0, sp, #0x80
	add r1, r1, #0x10
	mov r1, r1, lsl #0x10
	add r2, sp, #0
	mov r1, r1, lsr #0x10
	bl sub_06002908
	mov r4, r0
	bl sub_06000294
	mov r1, #0x18
	strh r1, [r0]
	ldrh r1, [r4, #4]
	cmp r1, #0
	moveq r1, #0
	movne r1, #1
	strh r1, [r0, #2]
	ldrh r1, [r4, #4]
	cmp r1, #0
	ldrne r1, _0600582C ; =0x00000245
	strneh r1, [r0, #4]
	ldrneh r1, [r4, #4]
	strneh r1, [r0, #6]
	bl sub_0600029C
	add sp, sp, #0x280
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06005828: .word 0x060198A4
_0600582C: .word 0x00000245
	arm_func_end sub_0600573C

	arm_func_start sub_06005830
sub_06005830: ; 0x06005830
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	ldr r1, [r0, #4]
	add r0, sp, #0
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_060027F4
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _06005880
	bl sub_06000294
	mov r2, #0x19
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	add r1, r1, #0x214
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_0600029C
	b _06005898
_06005880:
	bl sub_06000294
	mov r1, #0x19
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
_06005898:
	add sp, sp, #0x200
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_06005830

	arm_func_start sub_060058A4
sub_060058A4: ; 0x060058A4
	stmdb sp!, {r3, lr}
	bl sub_06000294
	mov r1, #0x1a
	strh r1, [r0]
	mov r1, #4
	strh r1, [r0, #2]
	bl sub_0600029C
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_060058A4

	arm_func_start sub_060058C8
sub_060058C8: ; 0x060058C8
	stmdb sp!, {r3, lr}
	bl sub_06000294
	mov r1, #0x1b
	strh r1, [r0]
	mov r1, #4
	strh r1, [r0, #2]
	bl sub_0600029C
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_060058C8

	arm_func_start sub_060058EC
sub_060058EC: ; 0x060058EC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x200
	ldmib r0, {r1, r2, r3}
	ldr r0, [r0, #0x10]
	mov r1, r1, lsl #0x10
	mov r4, r0, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r3, lsl #0x10
	ldr ip, _06005A04 ; =0x060198A4
	mov r5, r4, lsr #0x10
	add r0, sp, #0
	mov r1, r1, lsr #0x10
	mov r2, r2, lsr #0x10
	mov r3, r3, lsr #0x10
	ldr r4, [ip, #0x550]
	bl sub_06002730
	ldrh r6, [r0, #4]
	cmp r6, #0
	beq _06005960
	bl sub_06000294
	mov r2, #0x1d
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	add r1, r1, #0x210
	strh r1, [r0, #4]
	strh r6, [r0, #6]
	bl sub_0600029C
	b _060059F8
_06005960:
	ldr r0, _06005A08 ; =0x0000FFFF
	cmp r5, r0
	beq _060059AC
	cmp r5, #0
	moveq r1, #1
	moveq r0, #0
	beq _060059A0
	mov r0, #0x64
	mul r2, r5, r0
	ldr r0, _06005A0C ; =0x000082EA
	mov r1, r2, asr #0x1f
	umull ip, r3, r2, r0
	mla r3, r1, r0, r3
	mov r1, ip, lsr #6
	mov r0, r3, lsr #6
	orr r1, r1, r3, lsl #26
_060059A0:
	str r1, [r4, #0x7b8]
	str r0, [r4, #0x7bc]
	b _060059B8
_060059AC:
	mov r0, #0
	str r0, [r4, #0x7b8]
	str r0, [r4, #0x7bc]
_060059B8:
	bl sub_06001AFC
	orr r1, r1, #0
	orr r2, r0, #1
	mov r3, #0
_060059C8:
	add r0, r4, r3, lsl #3
	str r2, [r0, #0x738]
	add r3, r3, #1
	str r1, [r0, #0x73c]
	cmp r3, #0x10
	blt _060059C8
	bl sub_06000294
	mov r1, #0x1d
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
_060059F8:
	add sp, sp, #0x200
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_06005A04: .word 0x060198A4
_06005A08: .word 0x0000FFFF
_06005A0C: .word 0x000082EA
	arm_func_end sub_060058EC

	arm_func_start sub_06005A10
sub_06005A10: ; 0x06005A10
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x214
	ldr r1, _06005BAC ; =0x060198A4
	mov r7, r0
	ldr r6, [r1, #0x550]
	add r4, sp, #0x14
	ldrh r0, [r6]
	cmp r0, #2
	beq _06005A50
	bl sub_06000294
	mov r1, #0x1e
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_0600029C
	b _06005BA0
_06005A50:
	mov r0, r4
	bl sub_06002A74
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06005A70
	mov r0, #0x308
	bl sub_06005BB8
	b _06005BA0
_06005A70:
	ldrh r1, [r0, #6]
	mov r0, #2
	strh r0, [r6, #0xe6]
	cmp r1, #0x10
	bne _06005AF0
	mov r1, r4
	mov r0, #0xa
	bl sub_06000448
	cmp r0, #0
	beq _06005BA0
	mov r0, r4
	bl sub_06002A00
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06005AB8
	ldr r0, _06005BB0 ; =0x00000303
	bl sub_06005BB8
	b _06005BA0
_06005AB8:
	mov r0, #3
	mov r1, #1
	strh r0, [r6]
	mov r0, r4
	mov r3, r1
	mov r2, #0
	bl sub_06001F0C
	ldrh r1, [r0, #4]
	mov r0, #1
	cmp r1, #0
	beq _06005AEC
	bl sub_06005BB8
	b _06005BA0
_06005AEC:
	strh r0, [r6, #0xc6]
_06005AF0:
	ldrh r8, [r7, #2]
	ldrh sb, [r7, #4]
	ldrh r5, [r7, #6]
	ldrh r7, [r7, #8]
	add r0, sp, #4
	mov r1, #0
	mov r2, #0x10
	bl sub_06001AF4
	strb r5, [sp, #4]
	add r0, sp, #4
	str r0, [sp]
	mov r0, r4
	mov r1, r8
	mov r2, sb
	mov r3, r7
	bl sub_060022D0
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06005B48
	mov r0, #0xa
	bl sub_06005BB8
	b _06005BA0
_06005B48:
	ldrh r1, [r0, #8]
	mov r0, r4
	and r4, r1, #0xff
	mov r1, r1, lsl #8
	mov r5, r1, lsr #0x10
	bl sub_060029E8
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06005B78
	ldr r0, _06005BB4 ; =0x00000302
	bl sub_06005BB8
	b _06005BA0
_06005B78:
	mov r0, #2
	strh r0, [r6]
	bl sub_06000294
	mov r1, #0x1e
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	strh r4, [r0, #8]
	strh r5, [r0, #0xa]
	bl sub_0600029C
_06005BA0:
	add sp, sp, #0x214
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_06005BAC: .word 0x060198A4
_06005BB0: .word 0x00000303
_06005BB4: .word 0x00000302
	arm_func_end sub_06005A10

	arm_func_start sub_06005BB8
sub_06005BB8: ; 0x06005BB8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_06000294
	mov r1, #0x1e
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	strh r5, [r0, #4]
	strh r4, [r0, #6]
	bl sub_0600029C
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_06005BB8

	arm_func_start sub_06005BEC
sub_06005BEC: ; 0x06005BEC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	add r0, sp, #0
	bl sub_06002A2C
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _06005C30
	bl sub_06000294
	mov r2, #0x1f
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	add r1, r1, #0x304
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_0600029C
	b _06005C48
_06005C30:
	bl sub_06000294
	mov r1, #0x1f
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
_06005C48:
	add sp, sp, #0x200
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_06005BEC

	arm_func_start sub_06005C54
sub_06005C54: ; 0x06005C54
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x200
	add r0, sp, #0
	bl sub_06002A5C
	mov r5, r0
	ldrh r4, [r5, #4]
	cmp r4, #0
	beq _06005C9C
	bl sub_06000294
	mov r2, #0x20
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	rsb r1, r1, #0x308
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_0600029C
	b _06005CCC
_06005C9C:
	bl sub_06000294
	mov r4, r0
	mov r0, #0x20
	strh r0, [r4]
	mov r3, #0
	add r0, r5, #8
	add r1, r4, #8
	mov r2, #0xb4
	strh r3, [r4, #2]
	bl sub_06001B04
	mov r0, r4
	bl sub_0600029C
_06005CCC:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_06005C54

	arm_func_start sub_06005CD8
sub_06005CD8: ; 0x06005CD8
	ldr ip, _06005CE4 ; =0x037FA8A8
	ldr r0, _06005CE8 ; =0x0380AD98
	bx ip
	.align 2, 0
_06005CE4: .word 0x037FA8A8
_06005CE8: .word 0x0380AD98
	arm_func_end sub_06005CD8

	arm_func_start sub_06005CEC
sub_06005CEC: ; 0x06005CEC
	ldr ip, _06005CF8 ; =OS_CancelVAlarm
	ldr r0, _06005CFC ; =0x0380AD98
	bx ip
	.align 2, 0
_06005CF8: .word OS_CancelVAlarm
_06005CFC: .word 0x0380AD98
	arm_func_end sub_06005CEC

	arm_func_start sub_06005D00
sub_06005D00: ; 0x06005D00
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _06005DA0 ; =0x060198A4
	ldr r0, _06005DA4 ; =0x0380AD98
	ldr r4, [r1, #0x550]
	ldrh r1, [r4, #0xe6]
	cmp r1, #1
	bne _06005D50
	ldr r1, [r0]
	cmp r1, #0
	beq _06005D30
	bl sub_06005DB0
_06005D30:
	ldr r0, _06005DA4 ; =0x0380AD98
	mov r1, #0xcb
	mov ip, #3
	ldr r3, _06005DA8 ; =sub_060060FC
	add r2, r1, #0x3c
	str ip, [sp]
	bl sub_06005DB8
	b _06005D94
_06005D50:
	cmp r1, #2
	bne _06005D94
	mov r1, #0
	str r1, [r4, #0x1c]
	ldr r1, [r0]
	cmp r1, #0
	beq _06005D70
	bl sub_06005DB0
_06005D70:
	ldr r0, _06005DA4 ; =0x0380AD98
	mov r2, #1
	mov r1, #0xc8
	ldr r3, _06005DAC ; =sub_06005DC0
	str r2, [sp]
	add r2, r1, #0x3f
	bl sub_06005DB8
	mov r0, #0
	str r0, [r4, #0xd8]
_06005D94:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_06005DA0: .word 0x060198A4
_06005DA4: .word 0x0380AD98
_06005DA8: .word sub_060060FC
_06005DAC: .word sub_06005DC0
	arm_func_end sub_06005D00

	arm_func_start sub_06005DB0
sub_06005DB0: ; 0x06005DB0
	ldr pc, _06005DB4 ; =OS_CancelVAlarm
	.align 2, 0
_06005DB4: .word OS_CancelVAlarm
	arm_func_end sub_06005DB0

	arm_func_start sub_06005DB8
sub_06005DB8: ; 0x06005DB8
	ldr pc, _06005DBC ; =OS_SetVAlarm
	.align 2, 0
_06005DBC: .word OS_SetVAlarm
	arm_func_end sub_06005DB8

	arm_func_start sub_06005DC0
sub_06005DC0: ; 0x06005DC0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r1, _06005EFC ; =0x060198A4
	ldr r2, _06005F00 ; =0x0380FFF0
	ldr r0, [r1, #0x550]
	ldrh r3, [r2]
	str r3, [r0, #0xd0]
	ldr r2, [r0, #0xd4]
	cmp r2, r3
	beq _06005EA0
	str r3, [r0, #0xd4]
	ldr r1, [r1, #0x550]
	ldr r3, _06005F04 ; =0x048080F8
	ldr r2, [r1, #0xd0]
	mov r2, r2, lsl #6
	str r2, [r1, #0xd0]
	ldrh r2, [r3]
	ldrh lr, [r3, #2]
	ldrh r4, [r3]
	cmp r2, r4
	ldrhih lr, [r3, #2]
	ldr r3, _06005F08 ; =0x04000006
	ldr r2, _06005F0C ; =0x00000107
	ldrh ip, [r3]
	ldr r3, _06005F10 ; =0x003FFFC0
	sub ip, r2, ip
	orr lr, r4, lr, lsl #16
	ldr r2, [r1, #0xd0]
	and lr, lr, r3
	rsb ip, ip, ip, lsl #7
	add ip, ip, lr, lsl #1
	and lr, r3, ip, lsr #1
	cmp r2, lr
	movhi r2, #0
	strhi r2, [r1, #0xd8]
	bhi _06005EA0
	mov ip, #1
	b _06005E90
_06005E58:
	ldr r2, [r1, #0xd0]
	add r2, r2, #0x4b
	add r3, r2, #0x4100
	str r3, [r1, #0xd0]
	cmp r3, lr
	bls _06005E8C
	ldr r2, _06005F14 ; =0x0000400E
	sub r3, r3, lr
	cmp r3, r2
	str r3, [r1, #0xd8]
	movhi r2, #0
	strhi r2, [r1, #0xd8]
	b _06005EA0
_06005E8C:
	add ip, ip, #1
_06005E90:
	cmp ip, #0x1e
	blt _06005E58
	mov r2, #0
	str r2, [r1, #0xd8]
_06005EA0:
	ldr r1, [r0, #0xd8]
	cmp r1, #0x7f
	bls _06005ECC
	ldr r0, _06005F18 ; =0x0380AD98
	mov r1, #0xd0
	mov ip, #2
	ldr r3, _06005F1C ; =sub_06005F24
	add r2, r1, #0x37
	str ip, [sp]
	bl sub_06005DB8
	b _06005EF0
_06005ECC:
	mov r2, #1
	str r2, [r0, #0x1c]
	mov r1, #4
	str r1, [sp]
	ldrsh r1, [r0, #0x42]
	ldr r0, _06005F18 ; =0x0380AD98
	ldr r3, _06005F20 ; =sub_06005FE4
	rsb r2, r2, #0x108
	bl sub_06005DB8
_06005EF0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_06005EFC: .word 0x060198A4
_06005F00: .word 0x0380FFF0
_06005F04: .word 0x048080F8
_06005F08: .word 0x04000006
_06005F0C: .word 0x00000107
_06005F10: .word 0x003FFFC0
_06005F14: .word 0x0000400E
_06005F18: .word 0x0380AD98
_06005F1C: .word sub_06005F24
_06005F20: .word sub_06005FE4
	arm_func_end sub_06005DC0

	arm_func_start sub_06005F24
sub_06005F24: ; 0x06005F24
	stmdb sp!, {r3, lr}
	ldr r1, _06005FD0 ; =0x04000006
	ldr r0, _06005FD4 ; =0x060198A4
	ldrh ip, [r1]
	ldr r0, [r0, #0x550]
	cmp ip, #0xd0
	blt _06005F9C
	cmp ip, #0xd2
	bge _06005F9C
	ldr r1, [r0, #0xd8]
	cmp r1, #0x7f
	blo _06005F9C
	mov r3, #1
	b _06005F74
_06005F5C:
	ldr r2, [r0, #0xd8]
	rsb r1, r3, r3, lsl #6
	add r1, r1, #0x7f
	cmp r2, r1
	blo _06005F7C
	add r3, r3, #1
_06005F74:
	cmp r3, #7
	blt _06005F5C
_06005F7C:
	ldr r1, _06005FD0 ; =0x04000006
	rsb r2, r3, #1
	add r2, ip, r2
	strh r2, [r1]
	ldr r2, [r0, #0xd8]
	rsb r1, r3, r3, lsl #6
	sub r1, r2, r1
	str r1, [r0, #0xd8]
_06005F9C:
	ldr r1, [r0, #0xd8]
	ldr r2, _06005FD8 ; =0x00000107
	cmp r1, #0x7f
	movhs r1, #0
	strhs r1, [r0, #0x1c]
	mov r1, #4
	str r1, [sp]
	ldrsh r1, [r0, #0x42]
	ldr r0, _06005FDC ; =0x0380AD98
	ldr r3, _06005FE0 ; =sub_06005FE4
	bl sub_06005DB8
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06005FD0: .word 0x04000006
_06005FD4: .word 0x060198A4
_06005FD8: .word 0x00000107
_06005FDC: .word 0x0380AD98
_06005FE0: .word sub_06005FE4
	arm_func_end sub_06005F24

	arm_func_start sub_06005FE4
sub_06005FE4: ; 0x06005FE4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _060060E8 ; =0x060198A4
	ldr r4, [r0, #0x550]
	ldr r0, [r4, #0xc]
	cmp r0, #1
	bne _060060DC
	ldr r0, _060060EC ; =0x0380AD98
	mov r2, #1
	mov r1, #0xc8
	ldr r3, _060060F0 ; =sub_06005DC0
	str r2, [sp]
	add r2, r1, #0x3f
	bl sub_06005DB8
	ldr r0, [r4, #0x7bc]
	ldr r1, [r4, #0x7b8]
	cmp r0, #0
	cmpeq r1, #0
	beq _060060D8
	bl sub_06001AFC
	ldr r3, [r4, #0x73c]
	ldr ip, [r4, #0x738]
	cmp r3, #0
	cmpeq ip, #0
	orr lr, r1, #0
	orr r1, r0, #1
	mov r0, #0
	beq _060060D8
	ldr r2, [r4, #0x7b8]
	subs ip, r1, ip
	ldr r1, [r4, #0x7bc]
	sbc r3, lr, r3
	cmp r3, r1
	cmpeq ip, r2
	bls _060060D8
	str r0, [r4, #0x738]
	str r0, [r4, #0x73c]
	bl sub_060007C0
	movs r1, r0
	moveq r0, #0
	beq _060060A4
	mov r0, #0x25
	str r0, [r1]
	ldr r3, _060060F4 ; =0x00008001
	mov r2, #0
	ldr r0, _060060F8 ; =0x0601892C
	stmib r1, {r2, r3}
	bl sub_06000284
_060060A4:
	cmp r0, #0
	bne _060060DC
	bl sub_06000294
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x25
	strh r1, [r0, #6]
	bl sub_0600029C
	b _060060DC
_060060D8:
	bl sub_06006200
_060060DC:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_060060E8: .word 0x060198A4
_060060EC: .word 0x0380AD98
_060060F0: .word sub_06005DC0
_060060F4: .word 0x00008001
_060060F8: .word 0x0601892C
	arm_func_end sub_06005FE4

	arm_func_start sub_060060FC
sub_060060FC: ; 0x060060FC
	stmdb sp!, {r3, lr}
	ldr r0, _0600619C ; =0x060198A4
	ldr r0, [r0, #0x550]
	ldrh r1, [r0, #0xdc]
	cmp r1, #0x3c
	blo _06006138
	ldr r2, _060061A0 ; =0x04000006
	ldrh r1, [r2]
	cmp r1, #0xcb
	blt _06006140
	cmp r1, #0xd2
	strlth r1, [r2]
	movlt r1, #0
	strlth r1, [r0, #0xdc]
	b _06006140
_06006138:
	add r1, r1, #1
	strh r1, [r0, #0xdc]
_06006140:
	ldr r1, _060061A0 ; =0x04000006
	ldr r2, _060061A4 ; =0x048080F8
	ldrh lr, [r1]
	ldrh r1, [r2]
	ldrh r3, [r2, #2]
	ldrh ip, [r2]
	cmp r1, ip
	ldrhih r3, [r2, #2]
	ldr r1, _060061A8 ; =0x0380FFF0
	orr r3, ip, r3, lsl #16
	rsb r2, lr, lr, lsl #7
	rsb r2, r2, r3, lsl #1
	mov r3, r2, lsr #7
	strh r3, [r1]
	mov r2, #5
	str r2, [sp]
	ldrsh r1, [r0, #0x40]
	ldr r0, _060061AC ; =0x0380AD98
	ldr r3, _060061B0 ; =sub_060061B4
	rsb r2, r2, #0x10c
	bl sub_06005DB8
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600619C: .word 0x060198A4
_060061A0: .word 0x04000006
_060061A4: .word 0x048080F8
_060061A8: .word 0x0380FFF0
_060061AC: .word 0x0380AD98
_060061B0: .word sub_060061B4
	arm_func_end sub_060060FC

	arm_func_start sub_060061B4
sub_060061B4: ; 0x060061B4
	stmdb sp!, {r3, lr}
	ldr r0, _060061F4 ; =0x060198A4
	ldr r0, [r0, #0x550]
	ldr r0, [r0, #0xc]
	cmp r0, #1
	bne _060061EC
	ldr r0, _060061F8 ; =0x0380AD98
	mov r1, #0xcb
	mov ip, #3
	ldr r3, _060061FC ; =sub_060060FC
	add r2, r1, #0x3c
	str ip, [sp]
	bl sub_06005DB8
	bl sub_06006200
_060061EC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_060061F4: .word 0x060198A4
_060061F8: .word 0x0380AD98
_060061FC: .word sub_060060FC
	arm_func_end sub_060061B4

	arm_func_start sub_06006200
sub_06006200: ; 0x06006200
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _060062A8 ; =0x060198A4
	ldr r4, _060062AC ; =0x060188A4
	ldr r5, [r0, #0x550]
	bl sub_06000720
	ldrh r1, [r5, #0xce]
	cmp r1, #1
	bne _06006228
	bl sub_06000740
	b _060062A0
_06006228:
	mov r1, #1
	strh r1, [r5, #0xce]
	bl sub_06000740
	bl sub_060007C0
	movs r1, r0
	moveq r0, #0
	beq _06006258
	mov r3, #0x1c
	add r0, r4, #0x88
	mov r2, #0
	str r3, [r1]
	bl sub_06000284
_06006258:
	cmp r0, #0
	bne _060062A0
	mov r0, #0
	strh r0, [r5, #0xce]
	add r0, r4, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _060062A0
	bl sub_06000294
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r1, #0x16
	strh r1, [r0, #4]
	mov r1, #0x1c
	strh r1, [r0, #6]
	bl sub_0600029C
_060062A0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_060062A8: .word 0x060198A4
_060062AC: .word 0x060188A4
	arm_func_end sub_06006200

	arm_func_start sub_060062B0
sub_060062B0: ; 0x060062B0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _06006448 ; =0x060198A4
	mov r1, #0
	ldr r4, [r0, #0x550]
	mov r2, #1
	strh r1, [r4, #0xce]
	strh r2, [r4, #0x88]
	ldrh r0, [r4, #0xc0]
	sub r0, r0, #1
	strh r0, [r4, #0xc0]
	ldrh r0, [r4, #0xc0]
	cmp r0, #0
	bne _0600631C
	ldrh r1, [r4, #0xbe]
	rsb r0, r2, #0x10000
	cmp r1, r0
	moveq r0, #4
	streqh r0, [r4, #0xbe]
	ldrh r0, [r4, #0xbe]
	and r0, r0, #0xff
	bl sub_060005A0
	bl sub_0600061C
	strh r0, [r4, #0xbc]
	ldr r1, _0600644C ; =0x0000FFFF
	mov r0, #1
	strh r1, [r4, #0xbe]
	strh r0, [r4, #0xc0]
_0600631C:
	ldrh r0, [r4]
	cmp r0, #9
	bne _0600640C
	bl sub_06000720
	add r1, r4, #0x100
	ldrh r1, [r1, #0x82]
	cmp r1, #0
	bne _0600634C
	mov r1, #0
	strh r1, [r4, #0x62]
	bl sub_06000740
	b _06006440
_0600634C:
	ldrsh r2, [r4, #0x62]
	mov r3, #1
	cmp r2, #0
	ldrgtsh r1, [r4, #0x64]
	cmpgt r1, #0
	movgt r3, #0
	cmp r2, #0
	movlt r1, #0
	strlth r1, [r4, #0x62]
	add r1, r4, #0x700
	ldrsh r2, [r4, #0x62]
	ldrsh r1, [r1, #0xc2]
	add r1, r2, r1
	strh r1, [r4, #0x62]
	ldrsh r1, [r4, #0x62]
	cmp r1, #0x100
	movgt r1, #0x100
	strgth r1, [r4, #0x62]
	add r1, r4, #0x700
	ldrh r1, [r1, #0xc4]
	cmp r3, #0
	strh r1, [r4, #0x64]
	beq _060063C0
	ldrsh r1, [r4, #0x62]
	cmp r1, #0
	ldrgtsh r1, [r4, #0x64]
	cmpgt r1, #0
	movgt r5, #1
	bgt _060063C4
_060063C0:
	mov r5, #0
_060063C4:
	bl sub_06000740
	cmp r5, #0
	beq _060063D8
	ldr r0, _0600644C ; =0x0000FFFF
	bl sub_06006AA0
_060063D8:
	add r0, r4, #0x700
	ldrh r0, [r0, #0xc6]
	cmp r0, #1
	ldreqh r0, [r4, #0xa0]
	subeq r0, r0, #1
	streqh r0, [r4, #0xa0]
	ldreqh r0, [r4, #0xa0]
	cmpeq r0, #0
	moveq r0, #1
	streqh r0, [r4, #0x9e]
	moveq r0, #0x3c
	streqh r0, [r4, #0xa0]
	b _06006440
_0600640C:
	cmp r0, #0xa
	bne _06006440
	mov r5, #0
	bl sub_06000720
	ldr r1, [r4, #0x734]
	cmp r1, #1
	movne r1, r5
	movne r5, #1
	strneh r1, [r4, #0x60]
	bl sub_06000740
	cmp r5, #1
	bne _06006440
	bl sub_060065A8
_06006440:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06006448: .word 0x060198A4
_0600644C: .word 0x0000FFFF
	arm_func_end sub_060062B0

	arm_func_start sub_06006450
sub_06006450: ; 0x06006450
	stmdb sp!, {r3, lr}
	ldr r1, _06006480 ; =0x060198A4
	ldr r1, [r1, #0x550]
	ldrh r1, [r1]
	cmp r1, #9
	bne _06006478
	ldr r0, [r0, #4]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_06006AA0
_06006478:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06006480: .word 0x060198A4
	arm_func_end sub_06006450

	arm_func_start sub_06006484
sub_06006484: ; 0x06006484
	stmdb sp!, {r3, lr}
	ldr r0, _060064A8 ; =0x060198A4
	ldr r0, [r0, #0x550]
	ldrh r0, [r0]
	cmp r0, #0xa
	bne _060064A0
	bl sub_060065A8
_060064A0:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_060064A8: .word 0x060198A4
	arm_func_end sub_06006484

	arm_func_start sub_060064AC
sub_060064AC: ; 0x060064AC
	stmdb sp!, {r3, lr}
	ldr r1, _060064DC ; =0x060198A4
	ldr r1, [r1, #0x550]
	ldrh r1, [r1]
	cmp r1, #9
	bne _060064D4
	ldr r0, [r0, #4]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_06007450
_060064D4:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_060064DC: .word 0x060198A4
	arm_func_end sub_060064AC

	arm_func_start sub_060064E0
sub_060064E0: ; 0x060064E0
	stmdb sp!, {r4, lr}
	ldr r0, _06006590 ; =0x060198A4
	ldr r4, [r0, #0x550]
	add r0, r4, #0x31c
	add r0, r0, #0x400
	bl sub_06006598
	add r1, r4, #0x2f8
	mov r0, #0
	mov r2, #0x400
	bl sub_06000598
	mov r3, #0
_0600650C:
	add r0, r3, #1
	mov r0, r0, lsl #0x10
	add r1, r4, r3, lsl #5
	mov r3, r0, lsr #0x10
	add r0, r1, #0x200
	strh r3, [r0, #0xf8]
	cmp r3, #0x1f
	blo _0600650C
	ldr r2, _06006594 ; =0x0000FFFF
	add r0, r4, r3, lsl #5
	add r0, r0, #0x200
	strh r2, [r0, #0xf8]
	add r0, r4, #0x600
	mov ip, #0
	strh ip, [r0, #0xf8]
	strh r3, [r0, #0xfa]
_0600654C:
	add r1, r4, ip, lsl #2
	add r0, r1, #0x700
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xe]
	add r0, r1, #0x600
	add r1, ip, #1
	strh r2, [r0, #0xfc]
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
	strh r2, [r0, #0xfe]
	cmp ip, #4
	blo _0600654C
	add r0, r4, #0x31c
	add r0, r0, #0x400
	bl sub_060065A0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06006590: .word 0x060198A4
_06006594: .word 0x0000FFFF
	arm_func_end sub_060064E0

	arm_func_start sub_06006598
sub_06006598: ; 0x06006598
	ldr pc, _0600659C ; =OS_LockMutex
	.align 2, 0
_0600659C: .word OS_LockMutex
	arm_func_end sub_06006598

	arm_func_start sub_060065A0
sub_060065A0: ; 0x060065A0
	ldr pc, _060065A4 ; =OS_UnlockMutex
	.align 2, 0
_060065A4: .word OS_UnlockMutex
	arm_func_end sub_060065A0

	arm_func_start sub_060065A8
sub_060065A8: ; 0x060065A8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x260
	ldr r1, _06006A98 ; =0x060198A4
	ldr fp, [r1, #0x550]
	add r0, fp, #0x100
	ldrh r0, [r0, #0x82]
	cmp r0, #0
	beq _06006A8C
	mov r0, #1
	strh r0, [fp, #0x8a]
	str r0, [sp, #0x14]
	mov r0, #0
	strh r0, [sp, #0x5c]
	ldr r8, [r1, #0x550]
	add r1, sp, #0x5c
	ldrh sb, [r8, #0x38]
	str r1, [sp, #0x34]
	add r1, sb, #0x1f
	ldrh r2, [r8, #0x80]
	bic r1, r1, #0x1f
	ldr r7, [r8, #0x7c]
	cmp r2, r1
	blt _06006A38
	add r1, r8, #0x100
	ldrh r1, [r1, #0x88]
	cmp r1, #0x10
	bhs _06006A38
	ldrh r1, [r8]
	cmp r1, #9
	beq _0600662C
	cmp r1, #0xa
	streq r0, [sp, #0x14]
	bne _06006A38
_0600662C:
	ldr r0, [sp, #0x34]
	mov r6, #0
	strh r6, [r0]
	mov r0, #1
	cmp sb, #0
	strlt r0, [sp, #0x14]
	blt _06006A38
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0600666C
	add r0, r8, #0x700
	ldrh r0, [r0, #0xc6]
	cmp r0, #0
	strne r6, [sp, #0x18]
	b _06006670
_0600666C:
	str r6, [sp, #0x18]
_06006670:
	add r0, r8, #0x31c
	mov r1, #0
	str r1, [sp, #0xc]
	mov r1, #1
	add r0, r0, #0x400
	str r1, [sp, #0x10]
	bl sub_06006598
	ldr r0, [r8, #0x734]
	cmp r0, #1
	bne _060066B0
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_060065A0
	mov r0, #1
	str r0, [sp, #0x14]
	b _06006A38
_060066B0:
	mov r0, #1
	str r0, [r8, #0x734]
	add r0, r8, #0x2f8
	str r0, [sp, #0x1c]
	mov r5, #0
	b _06006A14
_060066C8:
	add r0, r8, #0x30c
	add r0, r0, #0x400
	mov r1, r5, lsl #2
	ldrh sl, [r0, r1]
	add r0, r0, r5, lsl #2
	str r0, [sp, #0x20]
	add r0, r8, #0x2fc
	add r0, r0, #0x400
	add r0, r0, r5, lsl #2
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x28]
	ldr r0, _06006A9C ; =0x0000FFFF
	str r0, [sp, #0x2c]
	str r0, [sp, #0x38]
	str r0, [sp, #0x3c]
	add r0, r8, #0x100
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x2c]
	sub r0, r0, #0x8000
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x48]
	add r0, r8, #0x700
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x50]
	str r0, [sp, #0x54]
	str r0, [sp, #0x58]
	b _060069FC
_06006740:
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0xc]
	add r4, r0, sl, lsl #5
	ldrh r0, [r4, #2]
	mov r1, #1
	str r0, [sp, #8]
	tst r2, r1, lsl r0
	bne _060069C0
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ldr r0, [sp, #8]
	orr r0, r2, r1, lsl r0
	str r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	and r1, r0, r1
	str r1, [sp, #0x30]
	beq _0600678C
	bics r1, r1, #1
	bne _060069C0
_0600678C:
	ldr r1, [sp, #8]
	tst r1, #8
	movne r1, #1
	strne r1, [sp, #4]
	moveq r1, #0
	streq r1, [sp, #4]
	ldr r1, [sp, #0x14]
	cmp r1, #0
	orrne r1, r0, #1
	ldrne r0, [sp, #0x3c]
	cmpne r1, r0
	movne r0, #1
	strne r0, [sp]
	moveq r0, #0
	streq r0, [sp]
	ldrh r0, [r4, #0xe]
	and r1, r0, #1
	cmp r1, #1
	addeq r0, r0, #1
	streqh r0, [r4, #0xe]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x10]
	cmp r0, #0
	movne r0, #2
	moveq r0, #0
	cmp r1, #0
	movne r3, #0
	ldr r1, [sp]
	moveq r3, #2
	ldrh r2, [r4, #0xe]
	cmp r1, #0
	movne r1, #2
	add r2, r2, r3
	moveq r1, #0
	add r0, r2, r0
	add r0, r1, r0
	cmp r0, sb
	bgt _060069C0
	ldr r0, [sp, #0x10]
	cmp r0, #0
	streq r7, [sp, #0x34]
	moveq r0, #0
	streqh r0, [r7], #2
	ldr r0, [sp, #0x34]
	ldrh r2, [r4, #2]
	ldrh r1, [r4, #0xe]
	mov r2, r2, lsl #8
	mov r1, r1, lsr #1
	ldrh r0, [r0]
	and r2, r2, #0xf00
	and r1, r1, #0xff
	orr r1, r2, r1
	orr r1, r0, r1
	ldr r0, [sp, #0x34]
	addeq r6, r6, #2
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	ldrh r2, [r4, #0xe]
	mov r1, r7
	subeq sb, sb, #2
	bl sub_06001B04
	ldrh r1, [r4, #0xe]
	ldr r0, [sp, #4]
	add r6, r6, r1
	cmp r0, #1
	bic r0, r1, #1
	add r7, r7, r0
	sub sb, sb, r1
	bne _060068F4
	ldrh r0, [r4, #0x10]
	tst r0, #1
	moveq r2, r0, asr #1
	beq _060068E0
	ldr r0, [sp, #0x40]
	ldrh r1, [r4, #2]
	ldrh r0, [r0, #0x88]
	mov r1, r1, lsl #0x1d
	add r0, r8, r0, lsl #4
	add r0, r0, r1, lsr #28
	add r0, r0, #0x100
	ldrh r2, [r0, #0xf8]
	add r1, r2, #1
	strh r1, [r0, #0xf8]
	mov r0, r2, lsl #1
	strh r0, [r4, #0x10]
_060068E0:
	ldr r0, [sp, #0x44]
	add r6, r6, #2
	and r0, r2, r0
	strh r0, [r7], #2
	sub sb, sb, #2
_060068F4:
	ldr r0, [sp]
	cmp r0, #1
	bne _06006924
	ldr r0, [sp, #0x34]
	add r6, r6, #2
	ldrh r0, [r0]
	sub sb, sb, #2
	orr r1, r0, #0x1000
	ldr r0, [sp, #0x34]
	strh r1, [r0]
	ldrh r0, [r4, #6]
	strh r0, [r7], #2
_06006924:
	ldr r0, [sp, #0x10]
	cmp r0, #1
	moveq r0, #0
	streq r0, [sp, #0x10]
	ldr r0, [sp, #0x20]
	ldrh r0, [r0, #2]
	cmp r0, sl
	ldreq r1, [sp, #0x2c]
	ldreq r0, [sp, #0x20]
	streqh r1, [r0, #2]
	ldrh r1, [r4]
	ldr r0, [sp, #0x28]
	strh r1, [r0]
	ldr r0, [sp, #0x38]
	strh r0, [r4]
	ldr r0, [sp, #0x24]
	ldrh r1, [r0, #2]
	ldr r0, [sp, #0x48]
	cmp r1, r0
	ldreq r0, [sp, #0x24]
	movne r1, r1, lsl #5
	streqh sl, [r0]
	ldrne r0, [sp, #0x1c]
	strneh sl, [r0, r1]
	ldr r0, [sp, #8]
	mov r1, #1
	mvn r1, r1, lsl r0
	ldr r0, [sp, #0xc]
	and r0, r0, r1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	strh sl, [r0, #2]
	ldr r0, [sp, #0x30]
	ldr sl, [sp, #0x2c]
	strh r0, [r4, #0xa]
	ldr r0, [sp, #0x4c]
	ldrh r0, [r0, #0xc8]
	cmp r0, #1
	beq _06006A24
_060069C0:
	ldr r0, [sp, #0x50]
	str sl, [sp, #0x2c]
	cmp sl, r0
	ldrne r0, [sp, #0x1c]
	addne r0, r0, sl, lsl #5
	strne r0, [sp, #0x28]
	ldreq r0, [sp, #0x20]
	streq r0, [sp, #0x28]
	ldr r0, [sp, #0x54]
	cmp sl, r0
	ldrne r0, [sp, #0x1c]
	movne r1, sl, lsl #5
	ldrneh sl, [r0, r1]
	ldreq r0, [sp, #0x20]
	ldreqh sl, [r0]
_060069FC:
	ldr r0, [sp, #0x58]
	cmp sl, r0
	beq _06006A10
	cmp sb, #2
	bgt _06006740
_06006A10:
	add r5, r5, #1
_06006A14:
	cmp r5, #4
	bhs _06006A24
	cmp sb, #2
	bgt _060066C8
_06006A24:
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_060065A0
	mov r0, #0
	str r0, [sp, #0x14]
_06006A38:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	moveq r0, #0
	streqh r0, [fp, #0x8a]
	beq _06006A8C
	ldr r0, [fp, #0x1c]
	mov r1, r6, lsl #0x10
	cmp r0, #1
	ldreqh r0, [sp, #0x5c]
	mov r1, r1, lsr #0x10
	orreq r0, r0, #0x8000
	streqh r0, [sp, #0x5c]
	ldrh r2, [sp, #0x5c]
	ldr r3, [fp, #0x7c]
	add r0, sp, #0x60
	bl sub_060023FC
	ldrh r0, [r0, #4]
	cmp r0, #0
	cmpne r0, #8
	movne r0, #0
	strneh r0, [fp, #0x8a]
_06006A8C:
	add sp, sp, #0x260
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06006A98: .word 0x060198A4
_06006A9C: .word 0x0000FFFF
	arm_func_end sub_060065A8

	arm_func_start sub_06006AA0
sub_06006AA0: ; 0x06006AA0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c8
	ldr r1, _06007438 ; =0x060198A4
	str r0, [sp, #0x18]
	ldr r7, [r1, #0x550]
	bl sub_06000720
	add r1, r7, #0x100
	ldrh r1, [r1, #0x82]
	ldrh r4, [r7, #0x86]
	str r1, [sp, #0x74]
	bl sub_06000740
	mov r1, #0
	strh r1, [sp, #0xc4]
	ldrh r0, [r7, #0x88]
	cmp r0, #1
	ldreq r0, _0600743C ; =0x0000FFFF
	streq r0, [sp, #0x18]
	streqh r1, [r7, #0x88]
	ldrh r0, [r7, #0x9e]
	cmp r0, #0
	bne _06007388
	ldr r1, _06007438 ; =0x060198A4
	ldrh r0, [r7, #0x3a]
	ldr r8, [r1, #0x550]
	str r0, [sp, #0x24]
	add r0, sp, #0xc4
	ldrh sb, [r8, #0x38]
	str r0, [sp, #0x70]
	add r0, sb, #0x1f
	ldrh r1, [r8, #0x80]
	bic r0, r0, #0x1f
	cmp r1, r0
	ldr r6, [r8, #0x7c]
	movlt r0, #1
	blt _06006FC8
	add r0, r8, #0x100
	ldrh r0, [r0, #0x88]
	cmp r0, #0x10
	movhs r0, #1
	bhs _06006FC8
	ldrh r0, [r8]
	cmp r0, #9
	moveq r0, #1
	streq r0, [sp, #0x48]
	beq _06006B6C
	cmp r0, #0xa
	moveq r0, #0
	streq r0, [sp, #0x48]
	beq _06006B6C
	mov r0, #1
	b _06006FC8
_06006B6C:
	ldr r0, [sp, #0x70]
	mov r5, #0
	mov sl, r5
	mov fp, r5
	strh r5, [r0]
	cmp sb, #0
	movlt r0, #1
	blt _06006FC8
	ldr r0, [sp, #0x48]
	str r4, [sp, #0x50]
	cmp r0, #0
	mov r0, #1
	str r0, [sp, #0x4c]
	beq _06006BC0
	add r0, r8, #0x700
	ldrh r0, [r0, #0xc6]
	cmp r0, #0
	ldrne r0, [sp, #0x74]
	strne r5, [sp, #0x4c]
	strne r0, [sp, #0x50]
	b _06006BC4
_06006BC0:
	str r5, [sp, #0x4c]
_06006BC4:
	ldr r0, [sp, #0x18]
	and r4, r4, r0
	mov r0, #0
	str r0, [sp, #0x40]
	mov r0, #1
	str r0, [sp, #0x44]
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_06006598
	ldr r0, [r8, #0x734]
	cmp r0, #1
	bne _06006C08
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_060065A0
	mov r0, #1
	b _06006FC8
_06006C08:
	mvn r0, r4
	str r0, [sp, #0x2c]
	mov r0, #1
	str r0, [r8, #0x734]
	add r0, r8, #0x2f8
	str r0, [sp, #0x54]
	mov r0, #0
	str r0, [sp, #0x58]
	b _06006FA0
_06006C2C:
	ldr r0, [sp, #0x58]
	mov r2, r0, lsl #2
	add r0, r8, #0x30c
	add r1, r0, #0x400
	ldr r0, [sp, #0x58]
	ldrh sl, [r1, r2]
	add r0, r1, r0, lsl #2
	str r0, [sp, #0x5c]
	add r0, r8, #0x2fc
	add r1, r0, #0x400
	ldr r0, [sp, #0x58]
	add r0, r1, r0, lsl #2
	str r0, [sp, #0x60]
	ldr r0, [sp, #0x5c]
	str r0, [sp, #0x64]
	ldr r0, _0600743C ; =0x0000FFFF
	str r0, [sp, #0x68]
	str r0, [sp, #0x78]
	str r0, [sp, #0x8c]
	add r0, r8, #0x100
	str r0, [sp, #0x90]
	ldr r0, [sp, #0x68]
	sub r0, r0, #0x8000
	str r0, [sp, #0x94]
	ldr r0, [sp, #0x68]
	str r0, [sp, #0x98]
	add r0, r8, #0x700
	str r0, [sp, #0x9c]
	ldr r0, [sp, #0x68]
	str r0, [sp, #0xa0]
	str r0, [sp, #0xa4]
	str r0, [sp, #0xa8]
	b _06006F80
_06006CB0:
	ldr r0, [sp, #0x54]
	ldr r2, [sp, #0x40]
	add r4, r0, sl, lsl #5
	ldrh r0, [r4, #2]
	mov r1, #1
	str r0, [sp, #0x28]
	tst r2, r1, lsl r0
	bne _06006F44
	ldr r0, [sp, #0x4c]
	cmp r0, #0
	ldr r0, [sp, #0x28]
	orr r0, r2, r1, lsl r0
	str r0, [sp, #0x40]
	ldrh r0, [r4, #6]
	ldr r1, [sp, #0x50]
	and r1, r0, r1
	str r1, [sp, #0x6c]
	beq _06006D08
	mov r2, r1
	ldr r1, [sp, #0x2c]
	tst r2, r1
	bne _06006F44
_06006D08:
	ldr r1, [sp, #0x28]
	tst r1, #8
	movne r1, #1
	strne r1, [sp, #0x20]
	moveq r1, #0
	streq r1, [sp, #0x20]
	ldr r1, [sp, #0x48]
	cmp r1, #0
	orrne r1, r0, #1
	ldrne r0, [sp, #0x8c]
	cmpne r1, r0
	movne r0, #1
	strne r0, [sp, #0x1c]
	moveq r0, #0
	streq r0, [sp, #0x1c]
	ldrh r0, [r4, #0xe]
	and r1, r0, #1
	cmp r1, #1
	addeq r0, r0, #1
	streqh r0, [r4, #0xe]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x44]
	cmp r0, #0
	movne r0, #2
	moveq r0, #0
	cmp r1, #0
	movne r3, #0
	ldr r1, [sp, #0x1c]
	moveq r3, #2
	ldrh r2, [r4, #0xe]
	cmp r1, #0
	movne r1, #2
	add r2, r2, r3
	moveq r1, #0
	add r0, r2, r0
	add r0, r1, r0
	cmp r0, sb
	bgt _06006F44
	ldr r0, [sp, #0x44]
	cmp r0, #0
	streq r6, [sp, #0x70]
	moveq r0, #0
	streqh r0, [r6], #2
	ldr r0, [sp, #0x70]
	ldrh r2, [r4, #2]
	ldrh r1, [r4, #0xe]
	mov r2, r2, lsl #8
	mov r1, r1, lsr #1
	ldrh r0, [r0]
	and r2, r2, #0xf00
	and r1, r1, #0xff
	orr r1, r2, r1
	orr r1, r0, r1
	ldr r0, [sp, #0x70]
	addeq fp, fp, #2
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	ldrh r2, [r4, #0xe]
	mov r1, r6
	subeq sb, sb, #2
	bl sub_06001B04
	ldrh r1, [r4, #0xe]
	ldr r0, [sp, #0x20]
	add fp, fp, r1
	cmp r0, #1
	bic r0, r1, #1
	add r6, r6, r0
	sub sb, sb, r1
	bne _06006E70
	ldrh r0, [r4, #0x10]
	tst r0, #1
	moveq r2, r0, asr #1
	beq _06006E5C
	ldr r0, [sp, #0x90]
	ldrh r1, [r4, #2]
	ldrh r0, [r0, #0x88]
	mov r1, r1, lsl #0x1d
	add r0, r8, r0, lsl #4
	add r0, r0, r1, lsr #28
	add r0, r0, #0x100
	ldrh r2, [r0, #0xf8]
	add r1, r2, #1
	strh r1, [r0, #0xf8]
	mov r0, r2, lsl #1
	strh r0, [r4, #0x10]
_06006E5C:
	ldr r0, [sp, #0x94]
	add fp, fp, #2
	and r0, r2, r0
	strh r0, [r6], #2
	sub sb, sb, #2
_06006E70:
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	bne _06006EA0
	ldr r0, [sp, #0x70]
	add fp, fp, #2
	ldrh r0, [r0]
	sub sb, sb, #2
	orr r1, r0, #0x1000
	ldr r0, [sp, #0x70]
	strh r1, [r0]
	ldrh r0, [r4, #6]
	strh r0, [r6], #2
_06006EA0:
	ldr r0, [sp, #0x44]
	cmp r0, #1
	moveq r0, #0
	streq r0, [sp, #0x44]
	ldr r0, [sp, #0x5c]
	ldrh r0, [r0, #2]
	cmp r0, sl
	ldreq r1, [sp, #0x68]
	ldreq r0, [sp, #0x5c]
	streqh r1, [r0, #2]
	ldrh r1, [r4]
	ldr r0, [sp, #0x64]
	strh r1, [r0]
	ldr r0, [sp, #0x78]
	strh r0, [r4]
	ldr r0, [sp, #0x60]
	ldrh r1, [r0, #2]
	ldr r0, [sp, #0x98]
	cmp r1, r0
	ldreq r0, [sp, #0x60]
	movne r1, r1, lsl #5
	streqh sl, [r0]
	ldrne r0, [sp, #0x54]
	strneh sl, [r0, r1]
	ldr r0, [sp, #0x28]
	mov r1, #1
	mvn r1, r1, lsl r0
	ldr r0, [sp, #0x40]
	and r0, r0, r1
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x60]
	strh sl, [r0, #2]
	ldr r0, [sp, #0x6c]
	ldr sl, [sp, #0x68]
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #4]
	orr r5, r5, r0
	ldr r0, [sp, #0x9c]
	ldrh r0, [r0, #0xc8]
	cmp r0, #1
	beq _06006FB4
_06006F44:
	ldr r0, [sp, #0xa0]
	str sl, [sp, #0x68]
	cmp sl, r0
	ldrne r0, [sp, #0x54]
	addne r0, r0, sl, lsl #5
	strne r0, [sp, #0x64]
	ldreq r0, [sp, #0x5c]
	streq r0, [sp, #0x64]
	ldr r0, [sp, #0xa4]
	cmp sl, r0
	ldrne r0, [sp, #0x54]
	movne r1, sl, lsl #5
	ldrneh sl, [r0, r1]
	ldreq r0, [sp, #0x5c]
	ldreqh sl, [r0]
_06006F80:
	ldr r0, [sp, #0xa8]
	cmp sl, r0
	beq _06006F94
	cmp sb, #2
	bgt _06006CB0
_06006F94:
	ldr r0, [sp, #0x58]
	add r0, r0, #1
	str r0, [sp, #0x58]
_06006FA0:
	ldr r0, [sp, #0x58]
	cmp r0, #4
	bhs _06006FB4
	cmp sb, #2
	bgt _06006C2C
_06006FB4:
	add r0, r8, #0x31c
	add r0, r0, #0x400
	mov sl, fp
	bl sub_060065A0
	mov r0, #0
_06006FC8:
	cmp r0, #1
	moveq r0, #0
	streqh r0, [r7, #0x62]
	streqh r0, [r7, #0x64]
	beq _0600742C
	add r0, r7, #0x700
	ldrh r1, [r0, #0xc6]
	ldr r0, [sp, #0x24]
	cmp r1, #1
	add r4, r0, #2
	ldrne r5, [sp, #0x18]
	ldr r0, [sp, #0x74]
	and r5, r5, r0
	mov r0, r5
	bl sub_06007448
	ldr r1, [sp, #0x24]
	add r1, r1, #0xc
	mul r0, r1, r0
	add r0, r0, #0x29
	ldrh r1, [r7, #0x72]
	bic r0, r0, #0x1f
	cmp r1, r0
	bge _06007348
	ldr r0, _06007438 ; =0x060198A4
	ldr sb, [r0, #0x550]
	ldrh r0, [sb]
	add r8, sb, #0x2f8
	cmp r0, #9
	moveq r4, #1
	beq _0600704C
	cmp r0, #0xa
	bne _06007338
	mov r4, #0
_0600704C:
	add r0, sb, #0x31c
	add r0, r0, #0x400
	bl sub_06006598
	ldr r0, [sb, #0x734]
	cmp r0, #0
	bne _06007074
	add r0, sb, #0x31c
	add r0, r0, #0x400
	bl sub_060065A0
	b _06007338
_06007074:
	cmp r4, #0
	moveq r0, #1
	streq r0, [sp, #0x3c]
	beq _06007098
	bl sub_06000720
	add r1, sb, #0x100
	ldrh r1, [r1, #0x82]
	str r1, [sp, #0x3c]
	bl sub_06000740
_06007098:
	mov r0, r5, lsl #0x10
	mvn r0, r0, lsr #16
	str r0, [sp, #0x30]
	mov sl, #0
_060070A8:
	ldr r0, _0600743C ; =0x0000FFFF
	add fp, sb, #0x600
	str r0, [sp, #0x38]
	add r0, sb, #0x2fc
	add r1, r0, #0x400
	mov r0, sl, lsl #2
	ldrh r5, [r1, r0]
	ldr r0, [sp, #0x38]
	add r6, r1, sl, lsl #2
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0x7c]
	str r0, [sp, #0x80]
	str r0, [sp, #0x84]
	str r0, [sp, #0x88]
	str r0, [sp, #0xac]
	str r0, [sp, #0xb0]
	add r0, sb, #0x100
	str r0, [sp, #0xb4]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0xb8]
	str r0, [sp, #0xbc]
	str r0, [sp, #0xc0]
	b _060072C4
_06007108:
	add r4, r8, r5, lsl #5
	ldrh r1, [r4, #0xa]
	ldr r0, [sp, #0x30]
	ldrh r2, [r4, #8]
	and r0, r1, r0
	orr r0, r2, r0
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	ldrh r1, [r4, #6]
	mvn r0, r0
	and r0, r1, r0
	strh r0, [r4, #6]
	ldrh r1, [r4, #6]
	ldr r0, [sp, #0x3c]
	and r0, r1, r0
	strh r0, [r4, #6]
	mov r0, #0
	strh r0, [r4, #0xa]
	ldrh r0, [r4, #6]
	cmp r0, #0
	beq _060071D8
	ldrh r0, [r4, #2]
	tst r0, #8
	ldreqh r0, [r4, #0x12]
	cmpeq r0, #0
	beq _060071D8
	ldrh r0, [r4, #0x12]
	cmp r0, #0
	subne r0, r0, #1
	strneh r0, [r4, #0x12]
	ldrh r1, [r4]
	ldr r0, [sp, #0xac]
	cmp r1, r0
	ldreq r0, [sp, #0x7c]
	streqh r0, [r6, #2]
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0xb0]
	cmp r1, r0
	ldrh r0, [r4]
	strh r0, [r6]
	ldr r0, [sp, #0x80]
	strh r0, [r4]
	moveq r0, r5, lsl #0x10
	moveq r0, r0, lsr #0x10
	streq r0, [sp, #0x34]
	ldrne r0, [sp, #0x38]
	movne r0, r0, lsl #5
	strneh r5, [r8, r0]
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [sp, #0x38]
	b _060072C0
_060071D8:
	bl sub_06000294
	mov r1, #0x81
	strh r1, [r0]
	ldrh r1, [r4, #6]
	ldr r3, [sp, #0xb4]
	cmp r1, #0
	moveq r1, #0
	movne r1, #0xf
	strh r1, [r0, #2]
	mov r1, #0x14
	strh r1, [r0, #8]
	ldrh r1, [r4, #2]
	strh r1, [r0, #0xa]
	ldrh r1, [r4, #4]
	strh r1, [r0, #0xc]
	ldrh r1, [r4, #6]
	strh r1, [r0, #0xe]
	ldrh r1, [r4, #8]
	strh r1, [r0, #0x10]
	ldrh r1, [r4, #0xe]
	strh r1, [r0, #0x18]
	ldr r1, [r4, #0x14]
	str r1, [r0, #0x14]
	ldr r1, [r4, #0x18]
	str r1, [r0, #0x1c]
	ldr r1, [r4, #0x1c]
	str r1, [r0, #0x20]
	ldrh r1, [r4, #0x10]
	strh r1, [r0, #0x1a]
	ldrh r3, [r3, #0x88]
	ldrh r1, [sb, #0x30]
	cmp r3, #0
	ldrh r2, [sb, #0x32]
	moveq r3, r1
	movne r3, r2
	strh r3, [r0, #0x24]
	ldr r3, [sp, #0xb4]
	ldrh r3, [r3, #0x88]
	cmp r3, #0
	movne r2, r1
	strh r2, [r0, #0x26]
	bl sub_0600029C
	ldrh r1, [r4]
	ldr r0, [sp, #0xb8]
	cmp r1, r0
	ldreq r0, [sp, #0x84]
	streqh r0, [r6, #2]
	ldrh r0, [r4]
	strh r0, [r6]
	ldr r0, [sp, #0x88]
	strh r0, [r4]
	ldrh r1, [fp, #0xfa]
	ldr r0, [sp, #0xbc]
	cmp r1, r0
	streqh r5, [fp, #0xf8]
	movne r0, r1, lsl #5
	strneh r5, [r8, r0]
	strh r5, [fp, #0xfa]
_060072C0:
	ldrh r5, [r6]
_060072C4:
	ldr r0, [sp, #0xc0]
	cmp r5, r0
	bne _06007108
	ldr r2, _0600743C ; =0x0000FFFF
	ldr r0, [sp, #0x38]
	cmp r0, r2
	beq _06007318
	add r0, sb, sl, lsl #2
	add r1, r0, #0x700
	ldr r0, [sp, #0x38]
	ldrh r3, [r1, #0xc]
	mov r0, r0, lsl #5
	strh r3, [r8, r0]
	ldrh r0, [r1, #0xe]
	cmp r0, r2
	ldreq r0, [sp, #0x38]
	streqh r0, [r1, #0xe]
	add r0, sb, sl, lsl #2
	add r1, r0, #0x700
	ldr r0, [sp, #0x34]
	strh r0, [r1, #0xc]
_06007318:
	add sl, sl, #1
	cmp sl, #4
	blt _060070A8
	add r0, sb, #0x31c
	mov r1, #0
	add r0, r0, #0x400
	str r1, [sb, #0x734]
	bl sub_060065A0
_06007338:
	mov r0, #0
	strh r0, [r7, #0x62]
	strh r0, [r7, #0x64]
	b _0600742C
_06007348:
	ldrsh r0, [r7, #0x62]
	cmp r0, #1
	ldrnesh r0, [r7, #0x64]
	cmpne r0, #1
	movne r6, #0
	bne _060073C8
	ldrh r3, [r7, #0x40]
	mov r0, sl
	mov r1, r4
	mov r2, r5
	bl sub_06007DA4
	ldrh r1, [sp, #0xc4]
	mov r6, r0
	orr r0, r1, #0x8000
	strh r0, [sp, #0xc4]
	b _060073C8
_06007388:
	mov r6, #0
	strh r6, [r7, #0x9e]
	ldrh r0, [sp, #0xc4]
	ldr r5, [sp, #0x74]
	bic r0, r0, #0x8000
	strh r0, [sp, #0xc4]
	mov sl, r6
	ldr r4, _06007440 ; =0x000080D6
	bl sub_06000720
	ldrsh r1, [r7, #0x62]
	add r1, r1, #1
	strh r1, [r7, #0x62]
	ldrsh r1, [r7, #0x64]
	add r1, r1, #1
	strh r1, [r7, #0x64]
	bl sub_06000740
_060073C8:
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [sp]
	ldr r0, _06007444 ; =0x048080F8
	str r6, [sp, #4]
	ldrh r1, [r0]
	mov r0, sl, lsl #0x10
	str r1, [sp, #8]
	mov r0, r0, lsr #0x10
	str r0, [sp, #0xc]
	ldrh r0, [sp, #0xc4]
	mov r3, r4, lsl #0x10
	str r0, [sp, #0x10]
	ldr r2, [r7, #0x7c]
	mov r1, #0
	str r2, [sp, #0x14]
	add r0, sp, #0xc8
	mov r2, r1
	mov r3, r3, lsr #0x10
	bl sub_06002464
	strh r5, [r7, #0x68]
	ldrh r0, [sp, #0xc4]
	strh r0, [r7, #0x6a]
	strh r4, [r7, #0x6c]
	strh sl, [r7, #0x6e]
_0600742C:
	add sp, sp, #0x2c8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06007438: .word 0x060198A4
_0600743C: .word 0x0000FFFF
_06007440: .word 0x000080D6
_06007444: .word 0x048080F8
	arm_func_end sub_06006AA0

	arm_func_start sub_06007448
sub_06007448: ; 0x06007448
	ldr pc, _0600744C ; =MATH_CountPopulation
	.align 2, 0
_0600744C: .word MATH_CountPopulation
	arm_func_end sub_06007448

	arm_func_start sub_06007450
sub_06007450: ; 0x06007450
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x218
	ldr r1, _06007534 ; =0x060198A4
	mov r4, r0
	ldr r7, [r1, #0x550]
	bl sub_06000720
	bl sub_06000740
	add r0, r7, #0x100
	ldrh r0, [r0, #0x82]
	ldr r1, _06007538 ; =0x048080F8
	and r4, r4, r0
	ldrh r8, [r7, #0x3a]
	mov r0, r4
	ldrh r5, [r1]
	ldrh r6, [r7, #0x6a]
	bl sub_06007448
	add r1, r8, #0xc
	mul r0, r1, r0
	add r0, r0, #0x29
	ldrh r1, [r7, #0x72]
	bic r0, r0, #0x1f
	cmp r1, r0
	bge _060074BC
	mov r0, #2
	bl sub_06007540
	bl sub_06001B70
	b _06007528
_060074BC:
	ldrsh r0, [r7, #0x62]
	cmp r0, #1
	ldrnesh r0, [r7, #0x64]
	cmpne r0, #1
	bicne r6, r6, #0x8000
	movne r0, #0
	bne _060074F0
	ldrh r0, [r7, #0x6e]
	ldrh r1, [r7, #0x6c]
	ldrh r3, [r7, #0x40]
	mov r2, r4
	bl sub_06007DA4
	orr r6, r6, #0x8000
_060074F0:
	mov r1, r4, lsl #0x10
	mov r1, r1, lsr #0x10
	str r1, [sp]
	stmib sp, {r0, r5}
	mov r2, #0
	mov r0, r6, lsl #0x10
	str r2, [sp, #0xc]
	mov r0, r0, lsr #0x10
	str r0, [sp, #0x10]
	ldr r1, _0600753C ; =0x0000800C
	add r0, sp, #0x18
	mov r3, r2
	str r2, [sp, #0x14]
	bl sub_06002464
_06007528:
	add sp, sp, #0x218
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_06007534: .word 0x060198A4
_06007538: .word 0x048080F8
_0600753C: .word 0x0000800C
	arm_func_end sub_06007450

	arm_func_start sub_06007540
sub_06007540: ; 0x06007540
	ldr pc, _06007544 ; =OS_Sleep
	.align 2, 0
_06007544: .word OS_Sleep
	arm_func_end sub_06007540

	arm_func_start sub_06007548
sub_06007548: ; 0x06007548
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _06007674 ; =0x060198A4
	ldrh r8, [sp, #0x24]
	ldr r4, [r4, #0x550]
	mov r7, r0
	add r0, r4, #0x30c
	add r0, r0, #0x400
	cmp r8, #0
	add sb, r0, r1, lsl #2
	mov r6, r2
	mov r5, r3
	add r8, r4, #0x2f8
	moveq r0, #6
	beq _0600766C
	ldrh r0, [sp, #0x24]
	tst r6, #8
	movne r1, #2
	moveq r1, #0
	add r0, r0, r1
	cmp r0, #0x204
	movgt r0, #6
	bgt _0600766C
	add r0, r4, #0x31c
	add r0, r0, #0x400
	bl sub_06006598
	add r2, r4, #0x600
	ldrh r1, [r2, #0xf8]
	ldr r3, _06007678 ; =0x0000FFFF
	cmp r1, r3
	bne _060075D4
	add r0, r4, #0x31c
	add r0, r0, #0x400
	bl sub_060065A0
	mov r0, #0xa
	b _0600766C
_060075D4:
	mov r0, r1, lsl #5
	ldrh ip, [r8, r0]
	add r0, r8, r1, lsl #5
	strh ip, [r2, #0xf8]
	ldrh ip, [r2, #0xfa]
	cmp ip, r1
	streqh r3, [r2, #0xfa]
	strh r6, [r0, #2]
	strh r5, [r0, #4]
	and r2, r5, r7
	strh r2, [r0, #6]
	mov r2, #0
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	ldr r3, [sp, #0x20]
	ldrh r2, [sp, #0x24]
	str r3, [r0, #0x14]
	strh r2, [r0, #0xe]
	ldr r3, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	str r3, [r0, #0x18]
	str r2, [r0, #0x1c]
	ldr r3, _06007678 ; =0x0000FFFF
	add r2, r4, #0x700
	strh r3, [r0]
	strh r3, [r0, #0x10]
	ldrh r2, [r2, #0xca]
	strh r2, [r0, #0x12]
	ldrh r0, [sb, #2]
	cmp r0, r3
	streqh r1, [sb]
	movne r0, r0, lsl #5
	strneh r1, [r8, r0]
	add r0, r4, #0x31c
	add r0, r0, #0x400
	strh r1, [sb, #2]
	bl sub_060065A0
	mov r0, #2
_0600766C:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_06007674: .word 0x060198A4
_06007678: .word 0x0000FFFF
	arm_func_end sub_06007548

	arm_func_start sub_0600767C
sub_0600767C: ; 0x0600767C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x3c
	ldr r2, _060079A4 ; =0x060198A4
	str r0, [sp]
	ldr r8, [r2, #0x550]
	mov r5, r1
	ldrh r1, [r8]
	mov r0, #0
	cmp r1, #9
	add r4, r8, #0x2f8
	str r0, [sp, #0xc]
	moveq r6, #1
	beq _060076BC
	cmp r1, #0xa
	moveq r6, r0
	bne _06007998
_060076BC:
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_06006598
	ldr r0, [r8, #0x734]
	cmp r0, #0
	bne _060076E8
	add r0, r8, #0x31c
	add r0, r0, #0x400
	bl sub_060065A0
	mov r0, #0
	b _06007998
_060076E8:
	cmp r6, #0
	moveq r0, #1
	streq r0, [sp, #0x10]
	beq _0600770C
	bl sub_06000720
	add r1, r8, #0x100
	ldrh r1, [r1, #0x82]
	str r1, [sp, #0x10]
	bl sub_06000740
_0600770C:
	mvn r0, r5
	str r0, [sp, #4]
	mov sl, #0
_06007718:
	add r0, r8, #0x2fc
	add r1, r0, #0x400
	ldr sb, _060079A8 ; =0x0000FFFF
	mov r0, sl, lsl #2
	ldrh r5, [r1, r0]
	add r0, r8, #0x100
	str sb, [sp, #8]
	add r6, r1, sl, lsl #2
	str sb, [sp, #0x14]
	str sb, [sp, #0x18]
	str sb, [sp, #0x1c]
	str sb, [sp, #0x20]
	str sb, [sp, #0x24]
	str sb, [sp, #0x28]
	str r0, [sp, #0x2c]
	str sb, [sp, #0x30]
	add fp, r8, #0x600
	str sb, [sp, #0x34]
	str sb, [sp, #0x38]
	b _0600792C
_06007768:
	ldr r0, [sp]
	add r7, r4, r5, lsl #5
	cmp r0, #0
	bne _060077A4
	ldrh r1, [r7, #0xa]
	ldr r0, [sp, #4]
	ldrh r2, [r7, #8]
	and r0, r1, r0
	orr r0, r2, r0
	strh r0, [r7, #8]
	ldrh r0, [r7, #8]
	ldrh r1, [r7, #6]
	mvn r0, r0
	and r0, r1, r0
	strh r0, [r7, #6]
_060077A4:
	ldrh r1, [r7, #6]
	ldr r0, [sp, #0x10]
	and r0, r1, r0
	strh r0, [r7, #6]
	mov r0, #0
	strh r0, [r7, #0xa]
	ldrh r0, [r7, #6]
	cmp r0, #0
	beq _06007840
	ldrh r0, [r7, #2]
	tst r0, #8
	ldreqh r0, [r7, #0x12]
	cmpeq r0, #0
	beq _06007840
	mov r0, #1
	str r0, [sp, #0xc]
	ldrh r0, [r7, #0x12]
	cmp r0, #0
	subne r0, r0, #1
	strneh r0, [r7, #0x12]
	ldrh r1, [r7]
	ldr r0, [sp, #0x24]
	cmp r1, r0
	ldreq r0, [sp, #0x14]
	streqh r0, [r6, #2]
	ldr r0, [sp, #0x28]
	cmp sb, r0
	ldrh r0, [r7]
	strh r0, [r6]
	ldr r0, [sp, #0x18]
	strh r0, [r7]
	moveq r0, r5, lsl #0x10
	moveq r0, r0, lsr #0x10
	streq r0, [sp, #8]
	movne r0, sb, lsl #5
	strneh r5, [r4, r0]
	mov r0, r5, lsl #0x10
	mov sb, r0, lsr #0x10
	b _06007928
_06007840:
	bl sub_06000294
	mov r1, #0x81
	strh r1, [r0]
	ldrh r1, [r7, #6]
	ldr r3, [sp, #0x2c]
	cmp r1, #0
	moveq r1, #0
	movne r1, #0xf
	strh r1, [r0, #2]
	mov r1, #0x14
	strh r1, [r0, #8]
	ldrh r1, [r7, #2]
	strh r1, [r0, #0xa]
	ldrh r1, [r7, #4]
	strh r1, [r0, #0xc]
	ldrh r1, [r7, #6]
	strh r1, [r0, #0xe]
	ldrh r1, [r7, #8]
	strh r1, [r0, #0x10]
	ldrh r1, [r7, #0xe]
	strh r1, [r0, #0x18]
	ldr r1, [r7, #0x14]
	str r1, [r0, #0x14]
	ldr r1, [r7, #0x18]
	str r1, [r0, #0x1c]
	ldr r1, [r7, #0x1c]
	str r1, [r0, #0x20]
	ldrh r1, [r7, #0x10]
	strh r1, [r0, #0x1a]
	ldrh r3, [r3, #0x88]
	ldrh r1, [r8, #0x30]
	cmp r3, #0
	ldrh r2, [r8, #0x32]
	moveq r3, r1
	movne r3, r2
	strh r3, [r0, #0x24]
	ldr r3, [sp, #0x2c]
	ldrh r3, [r3, #0x88]
	cmp r3, #0
	movne r2, r1
	strh r2, [r0, #0x26]
	bl sub_0600029C
	ldrh r1, [r7]
	ldr r0, [sp, #0x30]
	cmp r1, r0
	ldreq r0, [sp, #0x1c]
	streqh r0, [r6, #2]
	ldrh r0, [r7]
	strh r0, [r6]
	ldr r0, [sp, #0x20]
	strh r0, [r7]
	ldrh r1, [fp, #0xfa]
	ldr r0, [sp, #0x34]
	cmp r1, r0
	streqh r5, [fp, #0xf8]
	movne r0, r1, lsl #5
	strneh r5, [r4, r0]
	strh r5, [fp, #0xfa]
_06007928:
	ldrh r5, [r6]
_0600792C:
	ldr r0, [sp, #0x38]
	cmp r5, r0
	bne _06007768
	ldr r1, _060079A8 ; =0x0000FFFF
	cmp sb, r1
	beq _06007974
	add r0, r8, sl, lsl #2
	add r0, r0, #0x700
	ldrh r3, [r0, #0xc]
	mov r2, sb, lsl #5
	strh r3, [r4, r2]
	ldrh r2, [r0, #0xe]
	cmp r2, r1
	streqh sb, [r0, #0xe]
	add r0, r8, sl, lsl #2
	add r1, r0, #0x700
	ldr r0, [sp, #8]
	strh r0, [r1, #0xc]
_06007974:
	add sl, sl, #1
	cmp sl, #4
	blt _06007718
	add r0, r8, #0x31c
	mov r1, #0
	add r0, r0, #0x400
	str r1, [r8, #0x734]
	bl sub_060065A0
	ldr r0, [sp, #0xc]
_06007998:
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_060079A4: .word 0x060198A4
_060079A8: .word 0x0000FFFF
	arm_func_end sub_0600767C

	arm_func_start sub_060079AC
sub_060079AC: ; 0x060079AC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r1, _06007B98 ; =0x060198A4
	mvn r2, r0
	ldr sb, [r1, #0x550]
	add r0, sb, #0x100
	ldrh r1, [r0, #0x82]
	add r0, sb, #0x31c
	add r0, r0, #0x400
	add r5, sb, #0x2f8
	and fp, r2, r1
	bl sub_06006598
	add r0, sb, #0x30c
	add r0, r0, #0x400
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
_060079F0:
	add r0, sb, #0x100
	str r0, [sp, #0x10]
	mov r6, #0
	add r4, sb, #0x600
_06007A00:
	ldr r0, [sp, #8]
	mov r1, r6, lsl #2
	add r7, r0, r6, lsl #2
	ldrh sl, [r0, r1]
	ldr r0, _06007B9C ; =0x0000FFFF
	str r7, [sp, #4]
	str r0, [sp]
	b _06007B54
_06007A20:
	add r8, r5, sl, lsl #5
	ldrh r0, [r8, #6]
	and r0, r0, fp
	strh r0, [r8, #6]
	ldrh r0, [r8, #0xa]
	and r0, r0, fp
	strh r0, [r8, #0xa]
	ldrh r0, [r8, #6]
	cmp r0, #0
	bne _06007B28
	bl sub_06000294
	mov r1, #0x81
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x14
	strh r1, [r0, #8]
	ldrh r1, [r8, #2]
	ldr r3, [sp, #0x10]
	strh r1, [r0, #0xa]
	ldrh r1, [r8, #4]
	strh r1, [r0, #0xc]
	ldrh r1, [r8, #6]
	strh r1, [r0, #0xe]
	ldrh r1, [r8, #8]
	strh r1, [r0, #0x10]
	ldrh r1, [r8, #0xe]
	strh r1, [r0, #0x18]
	ldr r1, [r8, #0x14]
	str r1, [r0, #0x14]
	ldr r1, [r8, #0x18]
	str r1, [r0, #0x1c]
	ldr r1, [r8, #0x1c]
	str r1, [r0, #0x20]
	ldrh r1, [r8, #0x10]
	strh r1, [r0, #0x1a]
	ldrh r3, [r3, #0x88]
	ldrh r1, [sb, #0x30]
	cmp r3, #0
	ldrh r2, [sb, #0x32]
	moveq r3, r1
	movne r3, r2
	strh r3, [r0, #0x24]
	ldr r3, [sp, #0x10]
	ldrh r3, [r3, #0x88]
	cmp r3, #0
	movne r2, r1
	strh r2, [r0, #0x26]
	bl sub_0600029C
	ldrh r1, [r8]
	ldr r0, _06007B9C ; =0x0000FFFF
	cmp r1, r0
	ldreq r0, [sp]
	streqh r0, [r7, #2]
	ldrh r1, [r8]
	ldr r0, [sp, #4]
	strh r1, [r0]
	ldr r0, _06007B9C ; =0x0000FFFF
	strh r0, [r8]
	ldrh r1, [r4, #0xfa]
	cmp r1, r0
	streqh sl, [r4, #0xf8]
	movne r0, r1, lsl #5
	strneh sl, [r5, r0]
	strh sl, [r4, #0xfa]
	ldr sl, [sp]
_06007B28:
	ldr r0, _06007B9C ; =0x0000FFFF
	str sl, [sp]
	cmp sl, r0
	addne r0, r5, sl, lsl #5
	strne r0, [sp, #4]
	ldr r0, _06007B9C ; =0x0000FFFF
	streq r7, [sp, #4]
	cmp sl, r0
	movne r0, sl, lsl #5
	ldrneh sl, [r5, r0]
	ldreqh sl, [r7]
_06007B54:
	ldr r0, _06007B9C ; =0x0000FFFF
	cmp sl, r0
	bne _06007A20
	add r6, r6, #1
	cmp r6, #4
	blt _06007A00
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #2
	blt _060079F0
	add r0, sb, #0x31c
	add r0, r0, #0x400
	bl sub_060065A0
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06007B98: .word 0x060198A4
_06007B9C: .word 0x0000FFFF
	arm_func_end sub_060079AC

	arm_func_start sub_06007BA0
sub_06007BA0: ; 0x06007BA0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r4, _06007D9C ; =0x060198A4
	ldr r1, [sp, #0x40]
	ldr r5, [r4, #0x550]
	movs sb, r3
	str r1, [sp, #0x40]
	mov sl, r0
	str r2, [sp]
	beq _06007D8C
	cmp sb, #0x204
	bhi _06007D8C
	add r4, r5, #0x100
	ldrh r0, [r4, #0x88]
	cmp sl, r0
	beq _06007D8C
	cmp sl, #0x10
	bhs _06007D8C
	tst sb, #1
	bne _06007D8C
	add r0, r5, #0x1f8
	add r8, r0, sl, lsl #4
	mov r0, #1
	str r0, [sp, #8]
	b _06007D84
_06007C08:
	ldr r0, [sp, #8]
	ldr r7, _06007DA0 ; =0x0000FFFF
	cmp r0, #1
	addeq r1, sp, #0x34
	moveq r0, #0
	ldrne r1, [sp]
	streq r0, [sp, #8]
	movne r0, r1
	addne r0, r0, #2
	ldrh r1, [r1]
	strne r0, [sp]
	mov r0, r1, lsl #0x18
	subne sb, sb, #2
	movs r6, r0, lsr #0x17
	moveq r6, #0x200
	tst r1, #0x1000
	movne r2, #1
	moveq r2, #0
	tst r1, #0x800
	movne r3, #1
	moveq r3, #0
	cmp r2, #0
	movne fp, #2
	moveq fp, #0
	cmp r3, #0
	movne r0, #2
	moveq r0, #0
	add r0, r6, r0
	add r0, r0, fp
	subs sb, sb, r0
	bmi _06007D8C
	and r1, r1, #0xf00
	cmp r3, #1
	mov r1, r1, lsl #8
	ldr r3, [sp]
	mov fp, r1, lsr #0x10
	ldr r1, [sp]
	add r0, r3, r0
	str r1, [sp, #4]
	add r1, r1, r6
	str r0, [sp]
	bne _06007CEC
	mov r0, fp, lsl #0x1d
	mov r0, r0, lsr #0x1c
	ldrh r3, [r8, r0]
	ldrh r7, [r1], #2
	tst r3, #1
	movne r3, r7, lsl #1
	strneh r3, [r8, r0]
	bne _06007CEC
	mov r7, r7, lsl #1
	sub r3, r3, r7
	mov r3, r3, lsl #0x10
	mov r3, r3, lsr #0x10
	cmp r3, #0x100
	blo _06007D84
	strh r7, [r8, r0]
_06007CEC:
	cmp r2, #1
	bne _06007D08
	ldrh r2, [r1]
	ldrh r1, [r4, #0x88]
	mov r0, #1
	tst r2, r0, lsl r1
	beq _06007D84
_06007D08:
	cmp r6, #0
	ble _06007D84
	bl sub_06000294
	mov r1, #0x82
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #0x15
	strh r1, [r0, #4]
	ldr r1, [sp, #0x40]
	strh fp, [r0, #6]
	str r1, [r0, #8]
	ldr r1, [sp, #4]
	str r1, [r0, #0xc]
	strh r6, [r0, #0x10]
	strh sl, [r0, #0x12]
	ldrh r1, [r4, #0x88]
	strh r1, [r0, #0x20]
	strh r7, [r0, #0x1a]
	ldrh r1, [r4, #0x88]
	ldrh r2, [r5, #0x30]
	cmp r1, #0
	ldrh r3, [r5, #0x32]
	moveq r1, r2
	movne r1, r3
	strh r1, [r0, #0x40]
	ldrh r1, [r4, #0x88]
	cmp r1, #0
	movne r3, r2
	strh r3, [r0, #0x42]
	bl sub_0600029C
_06007D84:
	cmp sb, #0
	bgt _06007C08
_06007D8C:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_06007D9C: .word 0x060198A4
_06007DA0: .word 0x0000FFFF
	arm_func_end sub_06007BA0

	arm_func_start sub_06007DA4
sub_06007DA4: ; 0x06007DA4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r0
	tst r6, #0x8000
	ldrne r0, _06007E40 ; =0x00007FFF
	mov r4, r3
	andne r6, r6, r0
	addeq r0, r6, #0x1c
	moveq r0, r0, lsl #2
	addeq r6, r0, #0x66
	mov r0, r2
	bl sub_06007448
	mul r2, r6, r0
	ldr r1, _06007E44 ; =0x04000006
	add r0, r5, #0x22
	mov r3, r0, lsl #2
	ldrh r1, [r1]
	sub r0, r4, #2
	add r3, r3, #0x60
	add r2, r2, #0x388
	add r4, r3, r2
	subs r3, r0, r1
	bpl _06007E0C
_06007E00:
	add r0, r3, #7
	adds r3, r0, #0x100
	bmi _06007E00
_06007E0C:
	ldr r2, _06007E48 ; =0x66666667
	rsb r1, r3, r3, lsl #7
	mov r0, r1, lsr #0x1f
	smull r1, r3, r2, r1
	add r3, r0, r3, asr #3
	mov r0, #0xa
	mul r0, r3, r0
	cmp r0, r4
	movlo r3, #0
	mov r0, r3, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_06007E40: .word 0x00007FFF
_06007E44: .word 0x04000006
_06007E48: .word 0x66666667
	arm_func_end sub_06007DA4

	arm_func_start sub_06007E4C
sub_06007E4C: ; 0x06007E4C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x280
	ldr r1, _06007ED8 ; =0x060198A4
	ldr r2, [r0, #4]
	ldr r4, [r1, #0x550]
	add r0, sp, #0
	strh r2, [r4, #0xf6]
	add r1, r4, #0xe8
	bl sub_0600037C
	ldrh r1, [r4, #0xec]
	add r0, sp, #0x80
	add r1, r1, #0x10
	mov r1, r1, lsl #0x10
	add r2, sp, #0
	mov r1, r1, lsr #0x10
	bl sub_06002908
	mov r4, r0
	bl sub_06000294
	mov r1, #0x21
	strh r1, [r0]
	ldrh r1, [r4, #4]
	cmp r1, #0
	moveq r1, #0
	streqh r1, [r0, #2]
	beq _06007EC8
	mov r1, #1
	strh r1, [r0, #2]
	add r1, r1, #0x244
	strh r1, [r0, #4]
	ldrh r1, [r4, #4]
	strh r1, [r0, #6]
_06007EC8:
	bl sub_0600029C
	add sp, sp, #0x280
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06007ED8: .word 0x060198A4
	arm_func_end sub_06007E4C

	arm_func_start sub_06007EDC
sub_06007EDC: ; 0x06007EDC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x208
	add r1, sp, #0
	add r0, r0, #4
	mov r2, #6
	bl sub_06000440
	mov r8, #0
	add r7, sp, #8
	add r6, sp, #0
	mov r5, #0x13
	b _06007F38
_06007F08:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl sub_0600211C
	mov r4, r0
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _06007F40
	cmp r0, #7
	cmpne r0, #0xc
	bne _06007F40
	add r8, r8, #1
_06007F38:
	cmp r8, #2
	blt _06007F08
_06007F40:
	bl sub_06000294
	mov r1, #0x22
	strh r1, [r0]
	ldrh r1, [r4, #4]
	cmp r1, #0
	moveq r1, #0
	streqh r1, [r0, #2]
	beq _06007F78
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #5
	strh r1, [r0, #4]
	ldrh r1, [r4, #4]
	strh r1, [r0, #6]
_06007F78:
	bl sub_0600029C
	add sp, sp, #0x208
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end sub_06007EDC

	arm_func_start sub_06007F88
sub_06007F88: ; 0x06007F88
	stmdb sp!, {r3, lr}
	ldr r3, [r0, #4]
	ldr r1, _06007FD4 ; =0x060198A4
	str r3, [r1, #0x54c]
	ldr r2, [r0, #8]
	str r2, [r1, #0x550]
	str r2, [r3]
	ldr r1, [r0, #0xc]
	str r1, [r3, #8]
	ldr r0, [r0, #0x10]
	bl sub_06007FD8
	bl sub_06000294
	mov r1, #3
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06007FD4: .word 0x060198A4
	arm_func_end sub_06007F88

	arm_func_start sub_06007FD8
sub_06007FD8: ; 0x06007FD8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _06008178 ; =0x060198A4
	mov r8, r0
	ldr r7, [r1, #0x550]
	ldr r4, [r1, #0x54c]
	mov r5, #0
	bl sub_06000720
	ldr r1, [r7, #0xc]
	mov r6, r0
	cmp r1, #1
	bne _06008018
	mov r0, r5
	str r0, [r7, #0xc]
	mov r5, #1
	bl sub_06005CEC
	bl sub_060006C0
_06008018:
	add ip, r7, #0x100
	mov r1, #0
	strh r1, [ip, #0x82]
	strh r1, [r7, #0x86]
	str r1, [r7, #0x14]
	str r1, [r7, #0x10]
	str r1, [r7, #0x1c]
	strh r1, [r7, #0xce]
	strh r1, [r7, #0xc2]
	mov r0, #1
	strh r0, [r7, #0x58]
	strh r0, [r7, #0x5a]
	mov r0, #6
	strh r0, [r7, #0x5c]
	strh r1, [r7, #0x98]
	strh r1, [r7, #0x92]
	strh r1, [r7, #0x94]
	strh r1, [r7, #0x9a]
	strh r1, [r7, #0x9c]
	ldrh r0, [r7, #0x58]
	add r3, r7, #0x700
	strh r0, [r3, #0xc0]
	ldrh r2, [r7, #0x5a]
	add r0, r7, #0x19c
	strh r2, [r3, #0xc2]
	ldrh lr, [r7, #0x5c]
	mov r2, #0x50
	strh lr, [r3, #0xc4]
	ldrh lr, [r7, #0x98]
	strh lr, [r3, #0xca]
	ldrh lr, [r7, #0x92]
	strh lr, [r3, #0xc6]
	ldrh lr, [r7, #0x94]
	strh lr, [r3, #0xc8]
	ldrh lr, [r7, #0x9a]
	strh lr, [r3, #0xcc]
	str r1, [r7, #0x198]
	strh r1, [ip, #0x96]
	bl sub_06001AF4
	bl sub_0600082C
	mov r0, #0x104
	strh r0, [r7, #0x40]
	mov r0, #0xf0
	strh r0, [r7, #0x42]
	mov r0, #0x3e8
	strh r0, [r7, #0x44]
	mov r1, #0
	ldr r0, _0600817C ; =0x0000020B
	strh r1, [r7, #0x46]
	str r0, [r7, #0x48]
	str r1, [r7, #0x4c]
	str r1, [r7, #0x50]
	str r1, [r7, #0x54]
	strh r1, [r7, #0xc6]
	add r0, r7, #0x100
	mov r1, #1
	strh r1, [r0, #0xee]
	mov r0, r6
	str r8, [r7, #0xc8]
	bl sub_06000740
	cmp r5, #0
	beq _06008118
	ldr r0, _06008180 ; =0x0000FFFF
	bl sub_060079AC
_06008118:
	mov r2, #0
	mov r1, #0x8000
_06008120:
	add r0, r4, r2, lsl #4
	add r2, r2, #1
	str r1, [r0, #0xd0]
	cmp r2, #0x20
	blt _06008120
	add r1, r7, #0x1f8
	mov r0, #1
	mov r2, #0x100
	bl sub_06000598
	bl sub_06001DC0
	add r0, r7, #0x31c
	add r0, r0, #0x400
	bl sub_060001D4
	bl sub_06005CD8
	tst r8, #2
	bne _06008168
	mov r0, #0xf
	bl sub_060030A0
_06008168:
	mov r0, #1
	strh r0, [r7]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_06008178: .word 0x060198A4
_0600817C: .word 0x0000020B
_06008180: .word 0x0000FFFF
	arm_func_end sub_06007FD8

	arm_func_start sub_06008184
sub_06008184: ; 0x06008184
	stmdb sp!, {r4, lr}
	ldr r0, _060081E8 ; =0x060198A4
	ldr r4, [r0, #0x550]
	ldrh r0, [r4]
	cmp r0, #1
	beq _060081B8
	bl sub_06000294
	mov r1, #4
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_0600029C
	b _060081E0
_060081B8:
	mov r0, #1
	bl sub_060030A0
	mov r0, #0
	strh r0, [r4]
	bl sub_06000294
	mov r1, #4
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
_060081E0:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_060081E8: .word 0x060198A4
	arm_func_end sub_06008184

	arm_func_start sub_060081EC
sub_060081EC: ; 0x060081EC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _06008290 ; =0x060198A4
	ldr r4, [r0, #0x550]
	ldrh r0, [r4]
	cmp r0, #1
	beq _06008224
	bl sub_06000294
	mov r1, #5
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_0600029C
	b _06008284
_06008224:
	add r0, sp, #2
	add r1, sp, #0
	bl sub_06008294
	cmp r0, #0
	bne _06008264
	bl sub_06000294
	mov r1, #5
	strh r1, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	ldrh r1, [sp, #2]
	strh r1, [r0, #4]
	ldrh r1, [sp]
	strh r1, [r0, #6]
	bl sub_0600029C
	b _06008284
_06008264:
	mov r0, #2
	strh r0, [r4]
	bl sub_06000294
	mov r1, #5
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
_06008284:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_06008290: .word 0x060198A4
	arm_func_end sub_060081EC

	arm_func_start sub_06008294
sub_06008294: ; 0x06008294
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x200
	ldr r2, _0600847C ; =0x060198A4
	mov r7, r0
	add r0, sp, #0
	mov r6, r1
	ldr r5, [r2, #0x550]
	bl sub_06002A18
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _060082D8
	mov r1, #0x304
	strh r1, [r7]
	ldrh r1, [r0, #4]
	mov r0, #0
	strh r1, [r6]
	b _06008470
_060082D8:
	add r0, sp, #0
	bl sub_060029E8
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06008304
	ldr r1, _06008480 ; =0x00000302
	strh r1, [r7]
	ldrh r1, [r0, #4]
	mov r0, #0
	strh r1, [r6]
	b _06008470
_06008304:
	ldr r2, _06008484 ; =0x04808124
	mov r0, #0xc8
	strh r0, [r2]
	mov r0, #0x7d0
	strh r0, [r2, #4]
	ldr r1, _06008488 ; =0x00000202
	add r0, sp, #0
	strh r1, [r2, #0x2c]
	bl sub_060029A4
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _0600834C
	ldr r1, _0600848C ; =0x00000283
	strh r1, [r7]
	ldrh r1, [r0, #4]
	mov r0, #0
	strh r1, [r6]
	b _06008470
_0600834C:
	ldrh r2, [r0, #6]
	add r0, r5, #0x100
	mov r1, r2, lsl #0xf
	strh r2, [r0, #0xf4]
	mov r0, r1, lsr #0x10
	bl sub_060084A4
	add r1, r5, #0x100
	strh r0, [r1, #0xf6]
	ldr r1, _06008490 ; =0x0000FFFF
	add r0, sp, #0
	mov r2, #0x28
	mov r3, #5
	bl sub_06002730
	ldr r1, _06008494 ; =0x001FF621
	mov r0, #0
	str r1, [r5, #0x7b8]
	str r0, [r5, #0x7bc]
	add r1, r5, #0x100
	mov r2, #2
	strh r2, [r1, #0xec]
	mov r2, #1
	add r0, sp, #0
	strh r2, [r1, #0xee]
	bl sub_06002A44
	mov r4, r0
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _060083D4
	ldr r1, _06008498 ; =0x00000306
	mov r0, #0
	strh r1, [r7]
	ldrh r1, [r4, #4]
	strh r1, [r6]
	b _06008470
_060083D4:
	add r0, r4, #6
	add r1, r5, #0x20
	mov r2, #8
	bl sub_06001B04
	ldrh r1, [r4, #0xe]
	add r0, sp, #0
	strh r1, [r5, #0x28]
	ldrh r1, [r4, #0x10]
	strh r1, [r5, #0x2c]
	ldrh r1, [r4, #0x12]
	strh r1, [r5, #0x2e]
	ldrh r1, [r4, #0x14]
	strh r1, [r5, #0x2a]
	bl sub_0600298C
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06008430
	ldr r1, _0600849C ; =0x00000281
	strh r1, [r7]
	ldrh r1, [r0, #4]
	mov r0, #0
	strh r1, [r6]
	b _06008470
_06008430:
	add r0, r0, #6
	add r1, r5, #0xe0
	mov r2, #6
	bl sub_06000440
	add r0, sp, #0
	mov r1, #1
	bl sub_060027F4
	ldrh r1, [r0, #4]
	cmp r1, #0
	moveq r0, #1
	beq _06008470
	ldr r1, _060084A0 ; =0x00000215
	strh r1, [r7]
	ldrh r1, [r0, #4]
	mov r0, #0
	strh r1, [r6]
_06008470:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0600847C: .word 0x060198A4
_06008480: .word 0x00000302
_06008484: .word 0x04808124
_06008488: .word 0x00000202
_0600848C: .word 0x00000283
_06008490: .word 0x0000FFFF
_06008494: .word 0x001FF621
_06008498: .word 0x00000306
_0600849C: .word 0x00000281
_060084A0: .word 0x00000215
	arm_func_end sub_06008294

	arm_func_start sub_060084A4
sub_060084A4: ; 0x060084A4
	ldr pc, _060084A8 ; =WMSP_GetAllowedChannel
	.align 2, 0
_060084A8: .word WMSP_GetAllowedChannel
	arm_func_end sub_060084A4

	arm_func_start sub_060084AC
sub_060084AC: ; 0x060084AC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x200
	ldr r0, _06008554 ; =0x060198A4
	ldr r5, [r0, #0x550]
	ldrh r0, [r5]
	cmp r0, #2
	beq _060084E4
	bl sub_06000294
	mov r1, #6
	strh r1, [r0]
	mov r1, #3
	strh r1, [r0, #2]
	bl sub_0600029C
	b _06008548
_060084E4:
	add r0, sp, #0
	bl sub_060029D0
	mov r4, r0
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _06008528
	bl sub_06000294
	mov r2, #6
	mov r1, #1
	strh r2, [r0]
	strh r1, [r0, #2]
	add r1, r1, #0x300
	strh r1, [r0, #4]
	ldrh r1, [r4, #4]
	strh r1, [r0, #6]
	bl sub_0600029C
	b _06008548
_06008528:
	mov r0, #1
	strh r0, [r5]
	bl sub_06000294
	mov r1, #6
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
_06008548:
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06008554: .word 0x060198A4
	arm_func_end sub_060084AC

	arm_func_start sub_06008558
sub_06008558: ; 0x06008558
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x1c
	mov r6, r0
	add r1, sp, #0
	add r0, r6, #4
	bl sub_060085B4
	mov r5, r0
	bl sub_06000294
	mov r4, r0
	mov r0, #0x23
	strh r0, [r4]
	strh r5, [r4, #2]
	ldr r3, [r6, #4]
	add r0, sp, #0
	add r1, r4, #8
	mov r2, #0x1c
	str r3, [r4, #4]
	bl sub_06000440
	mov r0, r4
	bl sub_0600029C
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, lr}
	bx lr
	arm_func_end sub_06008558

	arm_func_start sub_060085B4
sub_060085B4: ; 0x060085B4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _060088AC ; =0x060198A4
	mov sb, r0
	ldr r7, [r2, #0x550]
	ldr r6, [sb]
	ldrh r0, [r7]
	mov r8, r1
	add r0, r0, #0xf7
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	mov r5, #0
	bhi _060085F8
	tst r6, #0x2c00
	bicne r6, r6, #0x2c00
	movne r5, #3
_060085F8:
	bl sub_06000720
	mov r4, r0
	cmp r8, #0
	beq _06008680
	ldr r0, _060088B0 ; =0x00003FFF
	str r0, [r8]
	ldrh r0, [r7, #0x58]
	strh r0, [r8, #4]
	ldrh r0, [r7, #0x5a]
	strh r0, [r8, #6]
	ldrh r0, [r7, #0x5c]
	strh r0, [r8, #8]
	ldrh r0, [r7, #0x30]
	strh r0, [r8, #0xa]
	ldrh r0, [r7, #0x32]
	strh r0, [r8, #0xc]
	ldrh r0, [r7, #0x44]
	strh r0, [r8, #0xe]
	ldrh r0, [r7, #0x46]
	strh r0, [r8, #0x10]
	ldrh r0, [r7, #0x40]
	strh r0, [r8, #0x12]
	ldrh r0, [r7, #0x42]
	strh r0, [r8, #0x14]
	ldrh r0, [r7, #0x98]
	strh r0, [r8, #0x16]
	ldrh r0, [r7, #0x92]
	strb r0, [r8, #0x18]
	ldrh r0, [r7, #0x94]
	strb r0, [r8, #0x19]
	ldrh r0, [r7, #0x9a]
	strb r0, [r8, #0x1a]
	ldrh r0, [r7, #0x9c]
	strb r0, [r8, #0x1b]
_06008680:
	tst r6, #1
	beq _060086A0
	ldrh r1, [sb, #4]
	add r0, r7, #0x700
	cmp r1, #0
	moveq r1, #0x10
	strh r1, [r7, #0x58]
	strh r1, [r0, #0xc0]
_060086A0:
	tst r6, #2
	beq _060086CC
	ldrh r1, [sb, #6]
	add r0, r7, #0x700
	cmp r1, #0
	moveq r1, #0x10
	strh r1, [r7, #0x5a]
	strh r1, [r0, #0xc2]
	ldrsh r0, [r7, #0x62]
	cmp r0, r1
	strgth r1, [r7, #0x62]
_060086CC:
	tst r6, #4
	beq _060086F8
	ldrh r1, [sb, #8]
	add r0, r7, #0x700
	cmp r1, #0
	moveq r1, #0x10
	strh r1, [r7, #0x5c]
	strh r1, [r0, #0xc4]
	ldrsh r0, [r7, #0x62]
	cmp r0, r1
	strgth r1, [r7, #0x62]
_060086F8:
	tst r6, #8
	beq _06008724
	ldrh r0, [sb, #0xa]
	ldrh r2, [r7, #0x34]
	add r1, r0, #1
	bic r1, r1, #1
	mov r1, r1, lsl #0x10
	cmp r2, r1, lsr #16
	movlo r5, #6
	blo _06008724
	bl sub_06000900
_06008724:
	tst r6, #0x10
	beq _06008750
	ldrh r0, [sb, #0xc]
	add r1, r0, #1
	bic r1, r1, #1
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #0x200
	movhi r5, #6
	bhi _06008750
	bl sub_0600092C
_06008750:
	tst r6, #0x20
	beq _06008798
	ldrh r2, [sb, #0xe]
	ldr r0, _060088B4 ; =0x00002710
	cmp r2, r0
	movhi r5, #6
	bhi _06008798
	ldr r0, _060088B8 ; =0x000082EA
	strh r2, [r7, #0x44]
	umull r1, r0, r2, r0
	mov r1, r1, lsr #6
	orr r1, r1, r0, lsl #26
	mov r0, r0, lsr #6
	mov r1, r1, lsr #0xa
	orr r1, r1, r0, lsl #22
	str r1, [r7, #0x48]
	mov r0, r0, lsr #0xa
	str r0, [r7, #0x4c]
_06008798:
	tst r6, #0x40
	beq _060087E0
	ldrh r2, [sb, #0x10]
	ldr r0, _060088B4 ; =0x00002710
	cmp r2, r0
	movhi r5, #6
	bhi _060087E0
	ldr r0, _060088B8 ; =0x000082EA
	strh r2, [r7, #0x46]
	umull r1, r0, r2, r0
	mov r1, r1, lsr #6
	orr r1, r1, r0, lsl #26
	mov r0, r0, lsr #6
	mov r1, r1, lsr #0xa
	orr r1, r1, r0, lsl #22
	str r1, [r7, #0x50]
	mov r0, r0, lsr #0xa
	str r0, [r7, #0x54]
_060087E0:
	tst r6, #0x80
	beq _06008814
	ldrh r1, [sb, #0x12]
	cmp r1, #0xbe
	bls _06008808
	cmp r1, #0xdc
	blo _06008810
	ldr r0, _060088BC ; =0x00000106
	cmp r1, r0
	bhi _06008810
_06008808:
	strh r1, [r7, #0x40]
	b _06008814
_06008810:
	mov r5, #6
_06008814:
	tst r6, #0x100
	beq _06008848
	ldrh r1, [sb, #0x14]
	cmp r1, #0xbe
	bls _0600883C
	cmp r1, #0xdc
	blo _06008844
	ldr r0, _060088BC ; =0x00000106
	cmp r1, r0
	bhi _06008844
_0600883C:
	strh r1, [r7, #0x42]
	b _06008848
_06008844:
	mov r5, #6
_06008848:
	tst r6, #0x200
	ldrneh r1, [sb, #0x16]
	addne r0, r7, #0x700
	strneh r1, [r7, #0x98]
	strneh r1, [r0, #0xca]
	tst r6, #0x400
	ldrneb r0, [sb, #0x18]
	strneh r0, [r7, #0x92]
	tst r6, #0x800
	ldrneb r0, [sb, #0x19]
	strneh r0, [r7, #0x94]
	tst r6, #0x1000
	ldrneb r1, [sb, #0x1a]
	addne r0, r7, #0x700
	strneh r1, [r7, #0x9a]
	ldrneh r1, [r7, #0x9a]
	strneh r1, [r0, #0xcc]
	tst r6, #0x2000
	ldrneb r0, [sb, #0x1b]
	strneh r0, [r7, #0x9c]
	mov r0, r4
	bl sub_06000740
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_060088AC: .word 0x060198A4
_060088B0: .word 0x00003FFF
_060088B4: .word 0x00002710
_060088B8: .word 0x000082EA
_060088BC: .word 0x00000106
	arm_func_end sub_060085B4

	arm_func_start sub_060088C0
sub_060088C0: ; 0x060088C0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x200
	ldr r1, [r0, #4]
	add r0, sp, #0
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_060028AC
	ldrh r4, [r0, #4]
	cmp r4, #0
	beq _06008910
	bl sub_06000294
	mov r1, #0x24
	strh r1, [r0]
	mov r2, #1
	ldr r1, _06008934 ; =0x00000242
	strh r2, [r0, #2]
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl sub_0600029C
	b _06008928
_06008910:
	bl sub_06000294
	mov r1, #0x24
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bl sub_0600029C
_06008928:
	add sp, sp, #0x200
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06008934: .word 0x00000242
	arm_func_end sub_060088C0

	arm_func_start sub_06008938
sub_06008938: ; 0x06008938
	ldr ip, _06008948 ; =sub_06004664
	mov r1, #1
	mov r2, #0
	bx ip
	.align 2, 0
_06008948: .word sub_06004664
	arm_func_end sub_06008938

	arm_func_start sub_0600894C
sub_0600894C: ; 0x0600894C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x230
	ldr r1, _06008AC8 ; =0x060198A4
	mov r7, r0
	ldr r6, [r1, #0x550]
	add r5, sp, #0x30
	bl sub_06000294
	mov r4, r0
	mov r1, #0x28
	strh r1, [r4]
	ldrh r1, [r6]
	cmp r1, #0xb
	beq _06008990
	mov r1, #3
	strh r1, [r4, #2]
	bl sub_0600029C
	b _06008ABC
_06008990:
	ldr r0, [r7, #4]
	mov r2, #0
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	mov r1, r0, lsl #0x10
	mov r0, r5
	mov r1, r1, lsr #0x10
	mov r3, #1
	bl sub_06001F0C
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _060089E4
	mov r1, #1
	strh r1, [r4, #2]
	strh r1, [r4, #4]
	ldrh r1, [r0, #4]
	mov r0, r4
	strh r1, [r4, #6]
	bl sub_0600029C
	b _06008ABC
_060089E4:
	ldr r0, _06008AC8 ; =0x060198A4
	mov r2, #6
	ldr r5, [r0, #0x550]
	add r0, r5, #0x8a
	add r0, r0, #0x100
	add r1, r5, #0xa2
	bl sub_06000440
	add r1, sp, #0x30
	str r1, [r5, #0xa8]
	mov r0, #0
	strh r0, [r5, #0xac]
	mov r2, #1
	str r2, [r5, #0x18]
	add r1, sp, #0
	mov r2, #0x30
	bl sub_06000598
	mov r0, #0
	strh r0, [sp]
	strh r0, [sp, #6]
	add r0, r5, #0x100
	ldrh r0, [r0, #0xec]
	add r1, sp, #0x18
	cmp r0, #2
	moveq r3, #0x14
	add r0, r5, #0x8a
	movne r3, #0xa
	add r0, r0, #0x100
	mov r2, #6
	strb r3, [sp, #0xe]
	bl sub_06000440
	add r1, sp, #0x1e
	add r0, r5, #0xe0
	mov r2, #6
	bl sub_06000440
	add r0, sp, #0x30
	str r0, [sp, #0x2c]
	add r1, sp, #0
	bl sub_06002350
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _06008AAC
	mov r1, #1
	strh r1, [r4, #2]
	mov r1, #0x100
	strh r1, [r4, #4]
	ldrh r1, [r0, #4]
	mov r0, r4
	strh r1, [r4, #6]
	bl sub_0600029C
	b _06008ABC
_06008AAC:
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #2]
	bl sub_0600029C
_06008ABC:
	add sp, sp, #0x230
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_06008AC8: .word 0x060198A4
	arm_func_end sub_0600894C

	arm_func_start sub_06008ACC
sub_06008ACC: ; 0x06008ACC
	stmdb sp!, {r3, lr}
	bl sub_06000294
	mov r1, #0x29
	strh r1, [r0]
	mov r1, #4
	strh r1, [r0, #2]
	bl sub_0600029C
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_06008ACC

	arm_func_start sub_06008AF0
sub_06008AF0: ; 0x06008AF0
	stmdb sp!, {r3, lr}
	bl sub_06000294
	mov r1, #0x2a
	strh r1, [r0]
	mov r1, #4
	strh r1, [r0, #2]
	bl sub_0600029C
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_06008AF0

	arm_func_start sub_06008B14
sub_06008B14: ; 0x06008B14
	stmdb sp!, {r3, lr}
	bl sub_0600B8A0
	bl sub_0600A498
	bl sub_0600B3D0
	bl sub_060094E8
	bl sub_06008DB0
	ldr r0, _06008B5C ; =0x0380FFF4
	ldr r0, [r0]
	add r1, r0, #0x300
	ldr r0, [r0, #0x31c]
	ldrh r1, [r1, #0x20]
	bl sub_06009580
	bl sub_0600F470
	bl sub_06010E3C
	bl sub_0600ED20
	bl sub_06009F54
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06008B5C: .word 0x0380FFF4
	arm_func_end sub_06008B14

	arm_func_start sub_06008B60
sub_06008B60: ; 0x06008B60
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	ldr r1, [r4]
	ldr r3, _06008D20 ; =0x0380FFF4
	ldr r2, _06008D24 ; =0x00000694
	mov r0, #0
	str r1, [r3]
	bl sub_06008D30
	bl sub_06008D38
	ldr r2, _06008D20 ; =0x0380FFF4
	ldr r1, [r2]
	str r0, [r1, #0x314]
	ldr r1, [r4, #0x18]
	ldr r0, [r2]
	str r1, [r0, #0x30c]
	ldr r1, [r4, #0x1c]
	ldr r0, [r2]
	mov r1, r1, lsr #1
	str r1, [r0, #0x310]
	ldr r1, [r2]
	ldr r0, [r1, #0x310]
	cmp r0, #0
	mvneq r0, #0
	streq r0, [r1, #0x310]
	add r0, r4, #0x20
	bl sub_06009410
	bl sub_060180C4
	ldr r3, _06008D28 ; =0x04000304
	ldr r1, _06008D20 ; =0x0380FFF4
	ldrh r2, [r3]
	mov r0, #0x30
	orr r2, r2, #2
	strh r2, [r3]
	strh r0, [r3, #-0xfe]
	ldr r0, [r1]
	mov r2, #3
	str r2, [r0, #0x68c]
	ldr r1, [r1]
	mov r0, #0x3c
	add r1, r1, #0x92
	add r2, r1, #0x600
	mov r1, #2
	bl sub_06017FFC
	ldr r1, _06008D20 ; =0x0380FFF4
	mov r0, #0x3e
	ldr r2, [r1]
	mov r1, #2
	add r2, r2, #0x690
	bl sub_06017FFC
	ldr r2, _06008D20 ; =0x0380FFF4
	ldr r3, [r4, #0x10]
	ldr r0, [r2]
	mov r1, #0x1c
	str r3, [r0, #0x308]
	ldr r0, [r2]
	ldr r2, [r4, #0x14]
	str r2, [r0, #0x304]
	ldr r0, [r4, #0x30]
	bl sub_06003ECC
	mov r1, r0
	ldr r0, [r4, #0x2c]
	bl sub_06009580
	bl sub_06008DB0
	bl sub_0600F470
	bl sub_06010E3C
	bl sub_0600ED20
	bl sub_0600B5F8
	add r0, sp, #8
	bl sub_06017F08
	cmp r0, #0
	beq _06008C9C
	ldr r0, _06008D20 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3e]
	orr r1, r1, #0x80
	strh r1, [r0, #0x3e]
	b _06008CC4
_06008C9C:
	bl sub_0600B360
	bl sub_0600BEE0
	bl sub_0600A520
	bl sub_0600B3D0
	bl sub_0600B470
	bl sub_0600C084
	bl sub_0600C210
	bl sub_0600B408
	bl sub_06009F54
	bl sub_0600A498
_06008CC4:
	ldr r1, [r4, #8]
	ldr r0, _06008D20 ; =0x0380FFF4
	str r1, [sp]
	ldr r2, [r4, #0xc]
	ldr r1, _06008D2C ; =sub_06008E3C
	str r2, [sp, #4]
	ldr r0, [r0]
	ldr r3, [r4, #4]
	add r0, r0, #0x18
	mov r2, #0
	bl sub_060001DC
	ldr r0, _06008D20 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x18
	bl sub_060001E4
	bl sub_0600D9C8
	ldr r0, _06008D20 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x3e]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_06008D20: .word 0x0380FFF4
_06008D24: .word 0x00000694
_06008D28: .word 0x04000304
_06008D2C: .word sub_06008E3C
	arm_func_end sub_06008B60

	arm_func_start sub_06008D30
sub_06008D30: ; 0x06008D30
	ldr pc, _06008D34 ; =MIi_CpuClearFast
	.align 2, 0
_06008D34: .word MIi_CpuClearFast
	arm_func_end sub_06008D30

	arm_func_start sub_06008D38
sub_06008D38: ; 0x06008D38
	ldr pc, _06008D3C ; =OS_GetLockID
	.align 2, 0
_06008D3C: .word OS_GetLockID
	arm_func_end sub_06008D38

	arm_func_start sub_06008D40
sub_06008D40: ; 0x06008D40
	ldr r0, _06008D50 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x18
	bx lr
	.align 2, 0
_06008D50: .word 0x0380FFF4
	arm_func_end sub_06008D40

	arm_func_start sub_06008D54
sub_06008D54: ; 0x06008D54
	stmdb sp!, {r4, lr}
	ldr r0, _06008D9C ; =0x0380FFF4
	ldr r4, [r0]
	add r0, r4, #0x18
	bl sub_06008DA0
	cmp r0, #1
	beq _06008D94
	mov r0, #2
	mov r1, #0x16
	bl sub_06008F04
	add r0, r4, #0x18
	bl sub_06008DA8
_06008D84:
	add r0, r4, #0x18
	bl sub_06008DA0
	cmp r0, #0
	beq _06008D84
_06008D94:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06008D9C: .word 0x0380FFF4
	arm_func_end sub_06008D54

	arm_func_start sub_06008DA0
sub_06008DA0: ; 0x06008DA0
	ldr pc, _06008DA4 ; =OS_IsThreadTerminated
	.align 2, 0
_06008DA4: .word OS_IsThreadTerminated
	arm_func_end sub_06008DA0

	arm_func_start sub_06008DA8
sub_06008DA8: ; 0x06008DA8
	ldr pc, _06008DAC ; =OS_JoinThread
	.align 2, 0
_06008DAC: .word OS_JoinThread
	arm_func_end sub_06008DA8

	arm_func_start sub_06008DB0
sub_06008DB0: ; 0x06008DB0
	stmdb sp!, {r4, lr}
	ldr r0, _06008E30 ; =0x0380FFF4
	mov r3, #0
	ldr lr, [r0]
	ldr r2, _06008E34 ; =0x0000FFFF
	strh r3, [lr, #0x10]
	strh r3, [lr, #0x12]
_06008DCC:
	add r0, lr, r3, lsl #1
	strh r2, [r0, #8]
	ldrh r0, [r0, #8]
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r0, [lr, r1]
	cmp r3, #4
	blo _06008DCC
	ldr ip, _06008E34 ; =0x0000FFFF
	mov r4, #0
	ldr r1, _06008E38 ; =0x06018268
	mov r2, r4
_06008DFC:
	add r3, lr, r4, lsl #3
	strh ip, [r3, #0xbc]
	ldr r0, [r1, r4, lsl #2]
	strh r2, [r3, #0xbe]
	add r4, r4, #1
	str r0, [r3, #0xc0]
	cmp r4, #0x18
	blo _06008DFC
	mov r0, #3
	mov r1, #0xc
	bl sub_06008F04
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06008E30: .word 0x0380FFF4
_06008E34: .word 0x0000FFFF
_06008E38: .word 0x06018268
	arm_func_end sub_06008DB0

	arm_func_start sub_06008E3C
sub_06008E3C: ; 0x06008E3C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r7, _06008EE8 ; =0x0380FFF4
	mov r0, #0
	ldr r8, [r7]
	ldr r4, _06008EEC ; =0x01000010
	strh r0, [r8, #0x10]
	ldr sb, _06008EF0 ; =0x0000FFFF
	strh r0, [r8, #0x14]
	add r6, sp, #0
	mov r5, r0
_06008E64:
	ldr r0, [r7]
	mov r1, r6
	ldr r0, [r0, #0x308]
	mov r2, r5
	bl sub_0600028C
	cmp r0, #0
	beq _06008E88
	mov r0, r6
	bl sub_06009070
_06008E88:
	mov r0, r4
	bl sub_06008EF4
	ldrh r1, [r8, #0x10]
	strh r1, [r8, #0x12]
	mov r1, r1, lsl #1
	ldrh r1, [r8, r1]
	cmp r1, sb
	bne _06008EBC
	ldrh r1, [r8, #0x10]
	add r1, r1, #1
	strh r1, [r8, #0x10]
	bl sub_06008EFC
	b _06008E64
_06008EBC:
	bl sub_06008EFC
	ldrh r0, [r8, #0x12]
	bl sub_06008FBC
	strh r0, [r8, #0x14]
	ldrh r0, [r8, #0x14]
	add r0, r8, r0, lsl #3
	ldr r0, [r0, #0xc0]
	mov lr, pc
	bx r0
	strh sb, [r8, #0x14]
	b _06008E64
	.align 2, 0
_06008EE8: .word 0x0380FFF4
_06008EEC: .word 0x01000010
_06008EF0: .word 0x0000FFFF
	arm_func_end sub_06008E3C

	arm_func_start sub_06008EF4
sub_06008EF4: ; 0x06008EF4
	ldr pc, _06008EF8 ; =OS_DisableIrqMask
	.align 2, 0
_06008EF8: .word OS_DisableIrqMask
	arm_func_end sub_06008EF4

	arm_func_start sub_06008EFC
sub_06008EFC: ; 0x06008EFC
	ldr pc, _06008F00 ; =OS_EnableIrqMask
	.align 2, 0
_06008F00: .word OS_EnableIrqMask
	arm_func_end sub_06008EFC

	arm_func_start sub_06008F04
sub_06008F04: ; 0x06008F04
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _06008FB4 ; =0x0380FFF4
	mov r7, r0
	ldr r4, [r2]
	ldr r0, _06008FB8 ; =0x01000010
	mov r6, r1
	add r5, r4, #0xbc
	bl sub_06008EF4
	add r2, r5, r6, lsl #3
	ldrh r1, [r2, #2]
	mov ip, r6, lsl #3
	cmp r1, #0
	bne _06008F7C
	mov r3, #1
	strh r3, [r2, #2]
	rsb r1, r3, #0x10000
	strh r1, [r5, ip]
	add r1, r4, r7, lsl #1
	ldrh r2, [r1, #8]
	rsb r1, r3, #0x10000
	cmp r2, r1
	mov r1, r7, lsl #1
	streqh r6, [r4, r1]
	addne r1, r4, r2, lsl #3
	strneh r6, [r1, #0xbc]
	add r1, r4, r7, lsl #1
	strh r6, [r1, #8]
	ldrh r1, [r4, #0x10]
	cmp r7, r1
	strlth r7, [r4, #0x10]
_06008F7C:
	bl sub_06008EFC
	cmp r7, #3
	beq _06008FAC
	ldrh r0, [r4, #0x12]
	cmp r0, #3
	bne _06008FAC
	ldr r0, _06008FB4 ; =0x0380FFF4
	mov r1, #0
	ldr r0, [r0]
	mov r2, r1
	ldr r0, [r0, #0x308]
	bl sub_06000284
_06008FAC:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_06008FB4: .word 0x0380FFF4
_06008FB8: .word 0x01000010
	arm_func_end sub_06008F04

	arm_func_start sub_06008FBC
sub_06008FBC: ; 0x06008FBC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _06009028 ; =0x0380FFF4
	mov r5, r0
	ldr r0, _0600902C ; =0x01000010
	ldr r4, [r1]
	bl sub_06008EF4
	mov lr, r5, lsl #1
	ldrh r5, [r4, lr]
	ldr r2, _06009030 ; =0x0000FFFF
	cmp r5, r2
	beq _06009018
	add ip, r4, #0xbc
	add r1, ip, r5, lsl #3
	mov r3, #0
	strh r3, [r1, #2]
	mov r3, r5, lsl #3
	ldrh r1, [ip, r3]
	cmp r1, r2
	streqh r2, [r4, lr]
	addeq r1, r4, lr
	streqh r2, [r1, #8]
	strneh r1, [r4, lr]
	strneh r2, [ip, r3]
_06009018:
	bl sub_06008EFC
	mov r0, r5
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06009028: .word 0x0380FFF4
_0600902C: .word 0x01000010
_06009030: .word 0x0000FFFF
	arm_func_end sub_06008FBC

	arm_func_start sub_06009034
sub_06009034: ; 0x06009034
	stmdb sp!, {r3, lr}
	ldr r0, _0600906C ; =0x0380FFF4
	add r1, sp, #0
	ldr r0, [r0]
	mov r2, #1
	ldr r0, [r0, #0x308]
	bl sub_0600028C
	add r0, sp, #0
	bl sub_06009070
	mov r0, #3
	mov r1, #0xc
	bl sub_06008F04
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600906C: .word 0x0380FFF4
	arm_func_end sub_06009034

	arm_func_start sub_06009070
sub_06009070: ; 0x06009070
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	beq _0600909C
	ldr r0, _060090A4 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x200
	bl sub_06009230
	mov r0, #2
	mov r1, #0xb
	bl sub_06008F04
_0600909C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_060090A4: .word 0x0380FFF4
	arm_func_end sub_06009070

	arm_func_start sub_060090A8
sub_060090A8: ; 0x060090A8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0600913C ; =0x0380FFF4
	movs r3, r1
	ldr r1, [r2]
	mov r5, r0
	moveq r0, #0
	beq _06009134
	ldr r0, [r1, #0x17c]
	cmp r0, #0
	beq _060090DC
	cmp r0, #1
	beq _060090F4
	b _06009108
_060090DC:
	ldr r0, [r1, #0x180]
	ldr r1, [r1, #0x184]
	add r2, r3, #0xc
	bl sub_06001D1C
	mov r4, r0
	b _06009108
_060090F4:
	ldr r1, [r1, #0x180]
	add r0, r3, #0xc
	mov lr, pc
	bx r1
	mov r4, r0
_06009108:
	cmp r4, #0
	moveq r0, #0
	beq _06009134
	ldr r1, _06009140 ; =0x0000BF1D
	mov r0, r5
	strh r1, [r4, #0xa]
	mov r2, #0
	mov r1, r4
	strh r2, [r4, #8]
	bl sub_060092A0
	mov r0, r4
_06009134:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600913C: .word 0x0380FFF4
_06009140: .word 0x0000BF1D
	arm_func_end sub_060090A8

	arm_func_start sub_06009144
sub_06009144: ; 0x06009144
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	ldr r5, _060091BC ; =0x0380FFF4
	ldrh r3, [r4, #0xa]
	ldr r2, _060091C0 ; =0x0000BF1D
	ldr r5, [r5]
	cmp r3, r2
	movne r0, #1
	bne _060091B4
	bl sub_0600932C
	movs r6, r0
	bne _060091B0
	ldr r0, [r5, #0x17c]
	cmp r0, #0
	beq _0600918C
	cmp r0, #1
	beq _060091A0
	b _060091B0
_0600918C:
	ldr r0, [r5, #0x180]
	ldr r1, [r5, #0x184]
	mov r2, r4
	bl sub_06001B54
	b _060091B0
_060091A0:
	ldr r1, [r5, #0x184]
	mov r0, r4
	mov lr, pc
	bx r1
_060091B0:
	mov r0, r6
_060091B4:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_060091BC: .word 0x0380FFF4
_060091C0: .word 0x0000BF1D
	arm_func_end sub_06009144

	arm_func_start sub_060091C4
sub_060091C4: ; 0x060091C4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r2
	ldrh r3, [r6, #0xa]
	ldr r2, _0600922C ; =0x0000BF1D
	mov r4, r0
	cmp r3, r2
	mov r7, r1
	movne r0, #1
	bne _06009224
	mov r0, #0x1000000
	bl sub_06008EF4
	mov r5, r0
	mov r0, r4
	mov r1, r6
	bl sub_0600932C
	movs r4, r0
	bne _06009218
	mov r0, r7
	mov r1, r6
	bl sub_060092A0
	mov r4, r0
_06009218:
	mov r0, r5
	bl sub_06008EFC
	mov r0, r4
_06009224:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0600922C: .word 0x0000BF1D
	arm_func_end sub_060091C4

	arm_func_start sub_06009230
sub_06009230: ; 0x06009230
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, #0x1000000
	mov r4, r1
	bl sub_06008EF4
	ldrh r1, [r5, #8]
	cmp r1, #0
	mvneq r1, #0
	streq r1, [r4]
	streq r4, [r5]
	ldrne r1, [r5, #4]
	strne r1, [r4]
	strne r4, [r1, #4]
	mvn r1, #0
	str r1, [r4, #4]
	ldrh r2, [r5, #0xa]
	ldr r1, _0600929C ; =0x0000BF1D
	strh r2, [r4, #8]
	strh r1, [r4, #0xa]
	str r4, [r5, #4]
	ldrh r1, [r5, #8]
	add r1, r1, #1
	strh r1, [r5, #8]
	bl sub_06008EFC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600929C: .word 0x0000BF1D
	arm_func_end sub_06009230

	arm_func_start sub_060092A0
sub_060092A0: ; 0x060092A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrh r2, [r4, #0xa]
	ldr r1, _06009328 ; =0x0000BF1D
	mov r5, r0
	cmp r2, r1
	movne r0, #1
	bne _06009320
	ldrh r0, [r4, #8]
	cmp r0, #0
	movne r0, #2
	bne _06009320
	mov r0, #0x1000000
	bl sub_06008EF4
	ldrh r1, [r5, #8]
	cmp r1, #0
	mvneq r1, #0
	streq r1, [r4]
	streq r4, [r5]
	ldrne r1, [r5, #4]
	strne r1, [r4]
	strne r4, [r1, #4]
	mvn r1, #0
	str r1, [r4, #4]
	ldrh r1, [r5, #0xa]
	strh r1, [r4, #8]
	str r4, [r5, #4]
	ldrh r1, [r5, #8]
	add r1, r1, #1
	strh r1, [r5, #8]
	bl sub_06008EFC
	mov r0, #0
_06009320:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06009328: .word 0x0000BF1D
	arm_func_end sub_060092A0

	arm_func_start sub_0600932C
sub_0600932C: ; 0x0600932C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrh r2, [r4, #0xa]
	ldr r1, _060093E8 ; =0x0000BF1D
	mov r5, r0
	cmp r2, r1
	movne r0, #1
	bne _060093E0
	ldrh r1, [r4, #8]
	ldrh r0, [r5, #0xa]
	cmp r1, r0
	movne r0, #2
	bne _060093E0
	mov r0, #0x1000000
	bl sub_06008EF4
	ldrh r1, [r5, #8]
	sub r1, r1, #1
	strh r1, [r5, #8]
	ldrh r1, [r5, #8]
	cmp r1, #0
	mvneq r1, #0
	streq r1, [r5]
	streq r1, [r5, #4]
	beq _060093D0
	ldr r1, [r5]
	cmp r4, r1
	ldreq r2, [r4, #4]
	mvneq r1, #0
	streq r2, [r5]
	streq r1, [r2]
	beq _060093D0
	ldr r1, [r5, #4]
	ldr r2, [r4]
	cmp r4, r1
	streq r2, [r5, #4]
	mvneq r1, #0
	streq r1, [r2, #4]
	ldrne r1, [r4, #4]
	strne r2, [r1]
	ldmneia r4, {r1, r2}
	strne r2, [r1, #4]
_060093D0:
	mov r1, #0
	strh r1, [r4, #8]
	bl sub_06008EFC
	mov r0, #0
_060093E0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_060093E8: .word 0x0000BF1D
	arm_func_end sub_0600932C

	arm_func_start sub_060093EC
sub_060093EC: ; 0x060093EC
	ldr r0, [r0, #4]
	bx lr
	arm_func_end sub_060093EC

	arm_func_start sub_060093F4
sub_060093F4: ; 0x060093F4
	mvn r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	mov r2, #0
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	arm_func_end sub_060093F4

	arm_func_start sub_06009410
sub_06009410: ; 0x06009410
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _060094E4 ; =0x0380FFF4
	ldr r2, [r0]
	ldr r4, [r1]
	mov r1, #2
	str r2, [r4, #0x17c]
	ldr r2, [r0, #4]
	add r5, r4, #0x344
	str r2, [r4, #0x180]
	ldr r2, [r0, #8]
	add r0, r4, #0x188
	str r2, [r4, #0x184]
	bl sub_060093F4
	add r0, r4, #0x194
	mov r1, #3
	bl sub_060093F4
	add r0, r4, #0x1a0
	mov r1, #4
	bl sub_060093F4
	add r0, r4, #0x1ac
	mov r1, #5
	bl sub_060093F4
	add r0, r4, #0x1b8
	mov r1, #6
	bl sub_060093F4
	add r0, r4, #0x1c4
	mov r1, #7
	bl sub_060093F4
	add r0, r4, #0x1d0
	mov r1, #8
	bl sub_060093F4
	add r0, r4, #0x1dc
	mov r1, #9
	bl sub_060093F4
	add r0, r4, #0x1e8
	mov r1, #0xa
	bl sub_060093F4
	add r0, r4, #0x1f4
	mov r1, #0xb
	bl sub_060093F4
	add r0, r4, #0x200
	mov r1, #0xc
	bl sub_060093F4
	add r0, r4, #0x188
	mov r1, #0x81
	bl sub_060090A8
	add r0, r0, #0xc
	str r0, [r5, #0x9c]
	mov r0, #0
	strh r0, [r5, #0xa0]
	strh r0, [r5, #0xa4]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_060094E4: .word 0x0380FFF4
	arm_func_end sub_06009410

	arm_func_start sub_060094E8
sub_060094E8: ; 0x060094E8
	stmdb sp!, {r4, lr}
	ldr r0, _0600953C ; =0x0380FFF4
	ldr r4, [r0]
	add r0, r4, #0x194
	bl sub_06009540
	add r0, r4, #0x1a0
	bl sub_06009540
	add r0, r4, #0x1ac
	bl sub_06009540
	add r0, r4, #0x1b8
	bl sub_06009540
	add r0, r4, #0x1c4
	bl sub_06009540
	add r0, r4, #0x1d0
	bl sub_06009540
	add r0, r4, #0x1dc
	bl sub_06009540
	add r0, r4, #0x1e8
	bl sub_06009540
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600953C: .word 0x0380FFF4
	arm_func_end sub_060094E8

	arm_func_start sub_06009540
sub_06009540: ; 0x06009540
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrh r0, [r6, #8]
	ldr r1, [r6]
	cmp r0, #0
	beq _06009578
	mvn r4, #0
	b _06009570
_06009560:
	ldr r5, [r1, #4]
	mov r0, r6
	bl sub_06009144
	mov r1, r5
_06009570:
	cmp r1, r4
	bne _06009560
_06009578:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_06009540

	arm_func_start sub_06009580
sub_06009580: ; 0x06009580
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _060095FC ; =0x0380FFF4
	mov r5, r0
	ldr r3, [r2]
	mov r6, r1
	add r1, r3, #0x31c
	mov r0, #0
	mov r2, #0x28
	ldr r4, [r3, #0x3e0]
	bl sub_06000598
	ldr r1, _060095FC ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0xc0
	add r1, r1, #0x344
	bl sub_06000598
	ldr r3, _060095FC ; =0x0380FFF4
	mov r0, r6, lsl #0x10
	ldr r2, [r3]
	mov r1, r0, lsr #0x10
	str r5, [r2, #0x31c]
	ldr r0, [r3]
	add r0, r0, #0x300
	strh r1, [r0, #0x20]
	ldr r0, [r3]
	add r0, r0, #0x300
	strh r1, [r0, #0x22]
	ldr r0, [r3]
	str r4, [r0, #0x3e0]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_060095FC: .word 0x0380FFF4
	arm_func_end sub_06009580

	arm_func_start sub_06009600
sub_06009600: ; 0x06009600
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4]
	tst r0, #1
	movne r0, #5
	bne _06009650
	ldr r0, _06009658 ; =0x0380FFF4
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x324
	bl sub_0600A928
	ldr r0, _0600965C ; =0x04808018
	mov r1, r4
	bl sub_0600A928
	ldr r1, _06009658 ; =0x0380FFF4
	mov r0, #0
	ldr r2, [r1]
	ldr r1, [r2, #0x340]
	orr r1, r1, #2
	str r1, [r2, #0x340]
_06009650:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06009658: .word 0x0380FFF4
_0600965C: .word 0x04808018
	arm_func_end sub_06009600

	arm_func_start sub_06009660
sub_06009660: ; 0x06009660
	cmp r0, #0xff
	movhi r0, #5
	bxhi lr
	ldr r1, _0600968C ; =0x0380FFF4
	ldr r2, _06009690 ; =0x0480802C
	ldr r1, [r1]
	add r1, r1, #0x300
	strh r0, [r1, #0x2a]
	strh r0, [r2]
	mov r0, #0
	bx lr
	.align 2, 0
_0600968C: .word 0x0380FFF4
_06009690: .word 0x0480802C
	arm_func_end sub_06009660

	arm_func_start sub_06009694
sub_06009694: ; 0x06009694
	ldr r1, _060096CC ; =0x00007FFE
	tst r0, r1
	moveq r0, #5
	bxeq lr
	ldr r2, _060096D0 ; =0x0380FFF4
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0x2c]
	ldr r2, [r2]
	mov r0, #0
	ldr r1, [r2, #0x340]
	orr r1, r1, #4
	str r1, [r2, #0x340]
	bx lr
	.align 2, 0
_060096CC: .word 0x00007FFE
_060096D0: .word 0x0380FFF4
	arm_func_end sub_06009694

	arm_func_start sub_060096D4
sub_060096D4: ; 0x060096D4
	stmdb sp!, {r3, lr}
	cmp r0, #3
	movhi r0, #5
	bhi _06009740
	ldr ip, _06009748 ; =0x0380FFF4
	ldr r3, _0600974C ; =0x04808006
	ldr r1, [ip]
	ldr r2, _06009750 ; =0x0000FFF8
	add r1, r1, #0x300
	strh r0, [r1, #0x2e]
	ldr r1, [ip]
	add r1, r1, #0x300
	strh r0, [r1, #0x50]
	ldrh r1, [r3]
	and r1, r1, r2
	orr r0, r1, r0
	strh r0, [r3]
	ldr r0, [ip]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x52]
	bl sub_0600A3F0
	ldr r1, _06009748 ; =0x0380FFF4
	mov r0, #0
	ldr r2, [r1]
	ldr r1, [r2, #0x340]
	orr r1, r1, #8
	str r1, [r2, #0x340]
_06009740:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06009748: .word 0x0380FFF4
_0600974C: .word 0x04808006
_06009750: .word 0x0000FFF8
	arm_func_end sub_060096D4

	arm_func_start sub_06009754
sub_06009754: ; 0x06009754
	stmdb sp!, {r3, lr}
	cmp r0, #2
	movhi r0, #5
	bhi _0600977C
	ldr r1, _06009784 ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x300
	strh r0, [r1, #0x30]
	bl sub_0600A370
	mov r0, #0
_0600977C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06009784: .word 0x0380FFF4
	arm_func_end sub_06009754

	arm_func_start sub_06009788
sub_06009788: ; 0x06009788
	ldr r1, _0600981C ; =0x0380FFF4
	cmp r0, #3
	ldr r1, [r1]
	movhi r0, #5
	add r2, r1, #0x344
	bxhi lr
	add r1, r1, #0x300
	strh r0, [r1, #0x34]
	ldrh r1, [r2, #0x7c]
	cmp r0, #0
	biceq r1, r1, #0x10
	streqh r1, [r2, #0x7c]
	ldreqh r1, [r2, #0x8a]
	ldr r3, _06009820 ; =0x04808006
	biceq r1, r1, #0x4000
	orrne r1, r1, #0x10
	strneh r1, [r2, #0x7c]
	ldrneh r1, [r2, #0x8a]
	orrne r1, r1, #0x4000
	strh r1, [r2, #0x8a]
	ldrh r1, [r2, #8]
	cmp r1, #0x40
	cmpeq r0, #1
	ldreq r1, _0600981C ; =0x0380FFF4
	ldreqh r2, [r2, #0x7c]
	ldreq r1, [r1]
	ldreq r1, [r1, #0x4ac]
	streqh r2, [r1, #0x2e]
	cmp r0, #0
	ldr r1, _06009824 ; =0x0000FFC7
	ldrh r2, [r3]
	moveq r0, #1
	and r1, r2, r1
	orr r0, r1, r0, lsl #3
	strh r0, [r3]
	mov r0, #0
	bx lr
	.align 2, 0
_0600981C: .word 0x0380FFF4
_06009820: .word 0x04808006
_06009824: .word 0x0000FFC7
	arm_func_end sub_06009788

	arm_func_start sub_06009828
sub_06009828: ; 0x06009828
	cmp r0, #3
	ldrls r1, _06009848 ; =0x0380FFF4
	movhi r0, #5
	ldrls r1, [r1]
	addls r1, r1, #0x300
	strlsh r0, [r1, #0x36]
	movls r0, #0
	bx lr
	.align 2, 0
_06009848: .word 0x0380FFF4
	arm_func_end sub_06009828

	arm_func_start sub_0600984C
sub_0600984C: ; 0x0600984C
	stmdb sp!, {r4, lr}
	ldr r1, _0600989C ; =0x04805F80
	mov r2, #0x14
	mov r4, r0
	bl sub_06001B04
	ldr r1, _060098A0 ; =0x04805FA0
	add r0, r4, #0x14
	mov r2, #0x14
	bl sub_06001B04
	ldr r1, _060098A4 ; =0x04805FC0
	add r0, r4, #0x28
	mov r2, #0x14
	bl sub_06001B04
	ldr r1, _060098A8 ; =0x04805FE0
	add r0, r4, #0x3c
	mov r2, #0x14
	bl sub_06001B04
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600989C: .word 0x04805F80
_060098A0: .word 0x04805FA0
_060098A4: .word 0x04805FC0
_060098A8: .word 0x04805FE0
	arm_func_end sub_0600984C

	arm_func_start sub_060098AC
sub_060098AC: ; 0x060098AC
	cmp r0, #1
	movhi r0, #5
	bxhi lr
	ldr r1, _060098E0 ; =0x0380FFF4
	and r2, r0, #1
	ldr r1, [r1]
	mov r0, #0
	add r1, r1, #0x300
	ldrh r3, [r1, #0x3a]
	bic r3, r3, #1
	orr r2, r3, r2
	strh r2, [r1, #0x3a]
	bx lr
	.align 2, 0
_060098E0: .word 0x0380FFF4
	arm_func_end sub_060098AC

	arm_func_start sub_060098E4
sub_060098E4: ; 0x060098E4
	cmp r0, #1
	movhi r0, #5
	bxhi lr
	ldr r1, _06009918 ; =0x0380FFF4
	mov r2, r0, lsl #0x1f
	ldr r1, [r1]
	mov r0, #0
	add r1, r1, #0x300
	ldrh r3, [r1, #0x3a]
	bic r3, r3, #2
	orr r2, r3, r2, lsr #30
	strh r2, [r1, #0x3a]
	bx lr
	.align 2, 0
_06009918: .word 0x0380FFF4
	arm_func_end sub_060098E4

	arm_func_start sub_0600991C
sub_0600991C: ; 0x0600991C
	cmp r0, #0xff
	movhi r0, #5
	bxhi lr
	ldr r2, _06009950 ; =0x0380FFF4
	mov r3, #0
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r3, [r1, #0xc4]
	ldr r1, [r2]
	add r1, r1, #0x300
	strh r0, [r1, #0xc2]
	mov r0, r3
	bx lr
	.align 2, 0
_06009950: .word 0x0380FFF4
	arm_func_end sub_0600991C

	arm_func_start sub_06009954
sub_06009954: ; 0x06009954
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	cmp r4, #0xa
	movlo r0, #5
	blo _060099F4
	ldr r0, _060099FC ; =0x0380FFF4
	cmp r1, #0
	ldr r0, [r0]
	add r0, r0, #0x300
	strh r4, [r0, #0x3c]
	ldrne r0, _06009A00 ; =0x04808134
	strneh r4, [r0]
	ldr r0, _060099FC ; =0x0380FFF4
	ldr r1, [r0]
	add r0, r1, #0x400
	ldrh r0, [r0, #0xa4]
	cmp r0, #0
	beq _060099F0
	ldr r2, [r1, #0x4ac]
	add r0, r1, #0x300
	ldrh r1, [r0, #0x52]
	ldrh r0, [r0, #0xda]
	add r2, r2, #0x24
	add r5, r2, r0
	cmp r1, #1
	add r0, r5, #6
	bne _060099DC
	and r1, r4, #0xff
	bl sub_0600B9E4
	mov r1, r4, asr #8
	add r0, r5, #7
	and r1, r1, #0xff
	bl sub_0600B9E4
	b _060099F0
_060099DC:
	mov r1, #0xff
	bl sub_0600B9E4
	add r0, r5, #7
	mov r1, #0xff
	bl sub_0600B9E4
_060099F0:
	mov r0, #0
_060099F4:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_060099FC: .word 0x0380FFF4
_06009A00: .word 0x04808134
	arm_func_end sub_06009954

	arm_func_start sub_06009A04
sub_06009A04: ; 0x06009A04
	ldr r1, _06009A30 ; =0x0380FFF4
	mov r2, #0
	ldr r1, [r1]
	add r3, r1, #0x384
_06009A14:
	ldrh r1, [r0], #2
	add r2, r2, #1
	cmp r2, #0x10
	strh r1, [r3], #2
	blo _06009A14
	mov r0, #0
	bx lr
	.align 2, 0
_06009A30: .word 0x0380FFF4
	arm_func_end sub_06009A04

	arm_func_start sub_06009A34
sub_06009A34: ; 0x06009A34
	stmdb sp!, {r3, lr}
	ldr r1, _06009AD4 ; =0x0380FFF4
	cmp r0, #1
	ldr r2, [r1]
	movhi r0, #5
	add r1, r2, #0x344
	bhi _06009ACC
	add r2, r2, #0x300
	ldrh ip, [r2, #0x3a]
	mov r3, r0, lsl #0x1f
	bic ip, ip, #4
	orr r3, ip, r3, lsr #29
	strh r3, [r2, #0x3a]
	ldrh r2, [r1, #0x7c]
	cmp r0, #0
	biceq r2, r2, #0x20
	orrne r2, r2, #0x20
	strh r2, [r1, #0x7c]
	ldrh r2, [r1, #8]
	cmp r2, #0x40
	ldreq r2, _06009AD4 ; =0x0380FFF4
	ldreq r3, [r2]
	addeq r2, r3, #0x300
	ldreqh r2, [r2, #0x2e]
	cmpeq r2, #1
	ldreqh r2, [r1, #0x7c]
	ldreq r1, [r3, #0x4ac]
	streqh r2, [r1, #0x2e]
	ldr r1, _06009AD8 ; =0x048080BC
	cmp r0, #0
	ldreqh r0, [r1]
	biceq r0, r0, #6
	streqh r0, [r1]
	ldrneh r0, [r1]
	orrne r0, r0, #6
	strneh r0, [r1]
	bl sub_0600A370
	mov r0, #0
_06009ACC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06009AD4: .word 0x0380FFF4
_06009AD8: .word 0x048080BC
	arm_func_end sub_06009A34

	arm_func_start sub_06009ADC
sub_06009ADC: ; 0x06009ADC
	cmp r0, #1
	ldrls r1, _06009AFC ; =0x0380FFF4
	movhi r0, #5
	ldrls r1, [r1]
	addls r1, r1, #0x300
	strlsh r0, [r1, #0x32]
	movls r0, #0
	bx lr
	.align 2, 0
_06009AFC: .word 0x0380FFF4
	arm_func_end sub_06009ADC

	arm_func_start sub_06009B00
sub_06009B00: ; 0x06009B00
	stmdb sp!, {r4, lr}
	cmp r0, #3
	mov r4, r1
	movhi r0, #5
	bhi _06009B3C
	cmp r4, #0x3f
	movhi r0, #5
	bhi _06009B3C
	mov r1, r0
	mov r0, #0x13
	bl sub_0600B2A0
	mov r1, r4
	mov r0, #0x35
	bl sub_0600B2A0
	mov r0, #0
_06009B3C:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_06009B00

	arm_func_start sub_06009B44
sub_06009B44: ; 0x06009B44
	cmp r0, #1
	movhi r0, #5
	bxhi lr
	ldr r3, _06009BA4 ; =0x0380FFF4
	mov r0, r0, lsl #0x10
	ldr r2, [r3]
	mov r1, r0, lsr #0x10
	add r0, r2, #0x300
	ldrh r2, [r0, #0x3a]
	mov r1, r1, lsl #0x1f
	bic r2, r2, #8
	orr r1, r2, r1, lsr #28
	strh r1, [r0, #0x3a]
	ldr r0, [r3]
	ldr r1, _06009BA8 ; =0x04808290
	add r0, r0, #0x300
	ldrh r3, [r0, #0x3a]
	mov r0, #0
	mov r2, r3, lsl #0x1c
	mov r3, r3, lsl #0x1a
	mov r2, r2, lsr #0x1f
	eor r2, r2, r3, lsr #31
	strh r2, [r1]
	bx lr
	.align 2, 0
_06009BA4: .word 0x0380FFF4
_06009BA8: .word 0x04808290
	arm_func_end sub_06009B44

	arm_func_start sub_06009BAC
sub_06009BAC: ; 0x06009BAC
	cmp r0, #1
	cmpls r1, #1
	movhi r0, #5
	bxhi lr
	cmp r0, #0
	beq _06009BD0
	cmp r0, #1
	beq _06009BFC
	b _06009C24
_06009BD0:
	ldr r2, _06009C78 ; =0x0380FFF4
	mov r1, r1, lsl #0x10
	ldr r3, [r2]
	mov r2, r1, lsr #0x10
	add r1, r3, #0x300
	ldrh r3, [r1, #0x3a]
	mov r2, r2, lsl #0x1f
	bic r3, r3, #0x20
	orr r2, r3, r2, lsr #26
	strh r2, [r1, #0x3a]
	b _06009C24
_06009BFC:
	ldr r1, _06009C78 ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r2, [r1, #0x2e]
	cmp r2, #1
	movne r0, #0xb
	bxne lr
	ldrh r2, [r1, #0x3a]
	bic r2, r2, #0x20
	strh r2, [r1, #0x3a]
_06009C24:
	ldr r3, _06009C78 ; =0x0380FFF4
	mov r0, r0, lsl #0x10
	ldr r2, [r3]
	mov r1, r0, lsr #0x10
	add r0, r2, #0x300
	ldrh r2, [r0, #0x3a]
	mov r1, r1, lsl #0x1f
	bic r2, r2, #0x10
	orr r1, r2, r1, lsr #27
	strh r1, [r0, #0x3a]
	ldr r0, [r3]
	ldr r1, _06009C7C ; =0x04808290
	add r0, r0, #0x300
	ldrh r3, [r0, #0x3a]
	mov r0, #0
	mov r2, r3, lsl #0x1c
	mov r3, r3, lsl #0x1a
	mov r2, r2, lsr #0x1f
	eor r2, r2, r3, lsr #31
	strh r2, [r1]
	bx lr
	.align 2, 0
_06009C78: .word 0x0380FFF4
_06009C7C: .word 0x04808290
	arm_func_end sub_06009BAC

	arm_func_start sub_06009C80
sub_06009C80: ; 0x06009C80
	cmp r0, #1
	movhi r0, #5
	bxhi lr
	ldr r1, _06009CBC ; =0x0380FFF4
	mov r0, r0, lsl #0x10
	ldr r2, [r1]
	mov r1, r0, lsr #0x10
	add r0, r2, #0x300
	ldrh r2, [r0, #0x3a]
	mov r1, r1, lsl #0x1f
	bic r2, r2, #0x40
	orr r1, r2, r1, lsr #25
	strh r1, [r0, #0x3a]
	mov r0, #0
	bx lr
	.align 2, 0
_06009CBC: .word 0x0380FFF4
	arm_func_end sub_06009C80

	arm_func_start sub_06009CC0
sub_06009CC0: ; 0x06009CC0
	cmp r0, #1
	movhi r0, #5
	bxhi lr
	ldr r2, _06009D08 ; =0x0380FFF4
	mov r1, r0, lsl #0x10
	ldr r3, [r2]
	mov r2, r1, lsr #0x10
	add r1, r3, #0x300
	ldrh r3, [r1, #0x3a]
	mov r2, r2, lsl #0x1f
	bic r3, r3, #0x80
	orr r2, r3, r2, lsr #24
	strh r2, [r1, #0x3a]
	ldreq r1, _06009D0C ; =0x0480802A
	ldreqh r0, [r1]
	streqh r0, [r1, #-2]
	mov r0, #0
	bx lr
	.align 2, 0
_06009D08: .word 0x0380FFF4
_06009D0C: .word 0x0480802A
	arm_func_end sub_06009CC0

	arm_func_start sub_06009D10
sub_06009D10: ; 0x06009D10
	stmdb sp!, {r4, lr}
	ldr r1, _06009D68 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	mov r1, r4
	add r0, r0, #0x3a8
	bl sub_0600A928
	ldr r0, _06009D6C ; =0x04808020
	mov r1, r4
	bl sub_0600A928
	ldrh r0, [r4]
	ldr r1, _06009D70 ; =0x048080D0
	tst r0, #1
	ldrneh r0, [r1]
	bicne r0, r0, #0x400
	strneh r0, [r1]
	ldreqh r0, [r1]
	orreq r0, r0, #0x400
	streqh r0, [r1]
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06009D68: .word 0x0380FFF4
_06009D6C: .word 0x04808020
_06009D70: .word 0x048080D0
	arm_func_end sub_06009D10

	arm_func_start sub_06009D74
sub_06009D74: ; 0x06009D74
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _06009E80 ; =0x0380FFF4
	mov r8, r0
	ldr r2, [r2]
	cmp r8, #0x20
	mov r7, r1
	add r4, r2, #0x344
	mov r6, #0
	movhi r0, #5
	bhi _06009E78
	ldrh r0, [r4, #8]
	cmp r0, #0x40
	addeq r0, r2, #0x300
	ldreqh r0, [r0, #0x2e]
	cmpeq r0, #1
	bne _06009DD0
	ldrh r0, [r4, #0x1e]
	cmp r0, r8
	movne r0, #6
	bne _06009E78
	ldrh r0, [r4, #0x92]
	cmp r0, #0
	movne r6, #1
_06009DD0:
	mov r5, #0
	add sb, r4, #0x20
	b _06009DF8
_06009DDC:
	mov r0, r7
	bl sub_0600BA10
	mov r1, r0
	add r0, sb, r5
	bl sub_0600B9E4
	add r7, r7, #1
	add r5, r5, #1
_06009DF8:
	cmp r5, r8
	blo _06009DDC
	add sb, r4, #0x20
	mov r7, #0
	b _06009E1C
_06009E0C:
	mov r1, r7
	add r0, sb, r5
	bl sub_0600B9E4
	add r5, r5, #1
_06009E1C:
	cmp r5, #0x20
	blo _06009E0C
	strh r8, [r4, #0x1e]
	cmp r6, #0
	beq _06009E74
	ldr r1, _06009E80 ; =0x0380FFF4
	ldrh r0, [r4, #0x92]
	ldr r1, [r1]
	mov r5, #0
	ldr r1, [r1, #0x4ac]
	add r4, r4, #0x20
	add r1, r1, #0x26
	add r6, r1, r0
	b _06009E6C
_06009E54:
	add r0, r4, r5
	bl sub_0600BA10
	mov r1, r0
	add r0, r6, r5
	bl sub_0600B9E4
	add r5, r5, #1
_06009E6C:
	cmp r5, r8
	blo _06009E54
_06009E74:
	mov r0, #0
_06009E78:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_06009E80: .word 0x0380FFF4
	arm_func_end sub_06009D74

	arm_func_start sub_06009E84
sub_06009E84: ; 0x06009E84
	stmdb sp!, {r3, lr}
	cmp r0, #0xa
	blo _06009E98
	cmp r0, #0x3e8
	bls _06009EA0
_06009E98:
	mov r0, #5
	b _06009ECC
_06009EA0:
	ldr r3, _06009ED4 ; =0x0380FFF4
	ldr r2, _06009ED8 ; =0x0480808C
	ldr r1, [r3]
	add r1, r1, #0x300
	strh r0, [r1, #0xb2]
	strh r0, [r2]
	ldr r0, [r3]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x38]
	bl sub_0600A5D4
	mov r0, #0
_06009ECC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06009ED4: .word 0x0380FFF4
_06009ED8: .word 0x0480808C
	arm_func_end sub_06009E84

	arm_func_start sub_06009EDC
sub_06009EDC: ; 0x06009EDC
	cmp r0, #1
	blo _06009EEC
	cmp r0, #0xff
	bls _06009EF4
_06009EEC:
	mov r0, #5
	bx lr
_06009EF4:
	ldr r1, _06009F18 ; =0x0380FFF4
	ldr r2, _06009F1C ; =0x0480808E
	ldr r1, [r1]
	add r1, r1, #0x300
	strh r0, [r1, #0xb8]
	strh r0, [r2]
	mov r0, #0
	strh r0, [r2, #-6]
	bx lr
	.align 2, 0
_06009F18: .word 0x0380FFF4
_06009F1C: .word 0x0480808E
	arm_func_end sub_06009EDC

	arm_func_start sub_06009F20
sub_06009F20: ; 0x06009F20
	cmp r0, #1
	blo _06009F30
	cmp r0, #0xff
	bls _06009F38
_06009F30:
	mov r0, #5
	bx lr
_06009F38:
	ldr r1, _06009F50 ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x300
	strh r0, [r1, #0xb4]
	mov r0, #0
	bx lr
	.align 2, 0
_06009F50: .word 0x0380FFF4
	arm_func_end sub_06009F20

	arm_func_start sub_06009F54
sub_06009F54: ; 0x06009F54
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r2, sp, #2
	mov r0, #0x36
	mov r1, #6
	bl sub_06017FFC
	add r2, sp, #0
	mov r0, #0x3c
	mov r1, #2
	bl sub_06017FFC
	add r0, sp, #2
	bl sub_06009600
	mov r0, #7
	bl sub_06009660
	ldrh r1, [sp]
	ldr r0, _0600A088 ; =0x00007FFE
	and r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_06009694
	mov r0, #2
	bl sub_060096D4
	mov r0, #0
	bl sub_06009754
	mov r0, #0
	bl sub_06009788
	mov r0, #0
	bl sub_06009828
	ldr r0, _0600A08C ; =0x0601832C
	bl sub_0600984C
	mov r0, #0x1f4
	bl sub_06009E84
	mov r0, #0
	bl sub_060098AC
	mov r0, #0
	bl sub_060098E4
	mov r0, #0x10
	bl sub_0600991C
	ldr r0, _0600A090 ; =0x0000FFFF
	mov r1, #0
	bl sub_06009954
	ldr r0, _0600A094 ; =0x060182CC
	bl sub_06009A04
	mov r0, #1
	bl sub_06009A34
	mov r0, #0
	bl sub_06009ADC
	ldr r0, _0600A098 ; =0x060182C8
	bl sub_0600A330
	mov r0, #0
	mov r1, #0x1f
	bl sub_06009B00
	mov r0, #5
	bl sub_0600A5D4
	mov r0, #0
	mov r1, r0
	bl sub_06009BAC
	mov r0, #0
	bl sub_06009B44
	mov r0, #0
	bl sub_06009C80
	mov r0, #0
	bl sub_06009CC0
	ldr r1, _0600A09C ; =0x04808044
	ldrh r2, [r1]
	ldrh r0, [r1]
	ldrh r1, [r1]
	add r0, r2, r0, lsl #8
	bl sub_0600BA2C
	ldr r0, _0600A0A0 ; =0x0380FFF4
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x300
	strh r1, [r0, #0x58]
	add sp, sp, #8
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600A088: .word 0x00007FFE
_0600A08C: .word 0x0601832C
_0600A090: .word 0x0000FFFF
_0600A094: .word 0x060182CC
_0600A098: .word 0x060182C8
_0600A09C: .word 0x04808044
_0600A0A0: .word 0x0380FFF4
	arm_func_end sub_06009F54

	arm_func_start sub_0600A0A4
sub_0600A0A4: ; 0x0600A0A4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	ldr r0, _0600A320 ; =0x0380FFF4
	cmp r1, #0
	ldr r0, [r0]
	ldrne sb, _0600A324 ; =sub_0601805C
	add r0, r0, #0x300
	ldrh r0, [r0, #0x2c]
	ldreq sb, _0600A328 ; =sub_06017FFC
	mov r2, #1
	tst r0, r2, lsl sl
	moveq r0, #5
	beq _0600A314
	ldr r1, _0600A32C ; =0x04808040
	add r0, r2, #0x8000
	ldrh r6, [r1]
	strh r0, [r1]
	sub r3, r1, #4
	add r1, r1, #0x1d4
_0600A0F4:
	ldrh r2, [r3]
	ldrh r0, [r1]
	mov r2, r2, asr #8
	cmp r2, #2
	bne _0600A0F4
	cmp r0, #0
	cmpne r0, #9
	bne _0600A0F4
	ldr r5, _0600A320 ; =0x0380FFF4
	ldr r0, [r5]
	add r0, r0, #0x300
	strh sl, [r0, #0xbe]
	ldr r0, [r5]
	add r0, r0, #0x500
	ldrh r1, [r0, #0xf8]
	cmp r1, #2
	beq _0600A148
	cmp r1, #3
	beq _0600A218
	cmp r1, #5
	bne _0600A300
_0600A148:
	sub r4, sl, #1
	mov r0, #6
	mul r5, r4, r0
	mov r0, #0
	str r0, [sp, #4]
	add r2, sp, #4
	add r0, r5, #0xf2
	mov r1, #3
	mov lr, pc
	bx sb
	ldr r0, [sp, #4]
	bl sub_0600B2D0
	add r2, sp, #4
	add r0, r5, #0xf5
	mov r1, #3
	mov lr, pc
	bx sb
	ldr r0, [sp, #4]
	bl sub_0600B2D0
	mov r1, #0
	ldr r0, _0600A320 ; =0x0380FFF4
	str r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #0x604]
	tst r0, #0x10000
	beq _0600A1F0
	tst r0, #0x8000
	bne _0600A300
	add r2, sp, #4
	add r0, r4, #0x154
	mov r1, #1
	mov lr, pc
	bx sb
	ldr r1, _0600A320 ; =0x0380FFF4
	ldr r0, [sp, #4]
	ldr r1, [r1]
	mov r0, r0, lsl #0x1b
	ldr r1, [r1, #0x604]
	orr r0, r1, r0, lsr #17
	str r0, [sp, #4]
	bl sub_0600B2D0
	b _0600A300
_0600A1F0:
	add r0, r4, #0x46
	add r2, sp, #4
	add r0, r0, #0x100
	mov r1, #1
	mov lr, pc
	bx sb
	ldr r1, [sp, #4]
	mov r0, #0x1e
	bl sub_0600B2A0
	b _0600A300
_0600A218:
	ldrh r0, [r0, #0xfc]
	mov r8, #0
	add r7, r0, #0xcf
	mov r4, r8
	mov fp, #1
	b _0600A274
_0600A230:
	mov r0, r7
	mov r1, fp
	add r2, sp, #0
	str r4, [sp, #4]
	str r4, [sp]
	mov lr, pc
	bx sb
	add r0, r7, sl
	mov r1, #1
	add r2, sp, #4
	mov lr, pc
	bx sb
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_0600B2A0
	add r7, r7, #0xf
	add r8, r8, #1
_0600A274:
	ldr r0, [r5]
	add r0, r0, #0x600
	ldrh r0, [r0]
	cmp r8, r0
	blo _0600A230
	mov r8, #0
	ldr r4, _0600A320 ; =0x0380FFF4
	mov r5, r8
	mov fp, #1
	b _0600A2EC
_0600A29C:
	str r5, [sp, #4]
	mov r0, r7
	mov r1, fp
	add r2, sp, #4
	mov lr, pc
	bx sb
	ldr r1, [sp, #4]
	add r0, r7, sl
	mov r1, r1, lsl #8
	str r1, [sp, #4]
	mov r1, #1
	add r2, sp, #4
	mov lr, pc
	bx sb
	ldr r0, [sp, #4]
	orr r0, r0, #0x50000
	str r0, [sp, #4]
	bl sub_0600B2D0
	add r7, r7, #0xf
	add r8, r8, #1
_0600A2EC:
	ldr r0, [r4]
	add r0, r0, #0x500
	ldrh r0, [r0, #0xfe]
	cmp r8, r0
	blo _0600A29C
_0600A300:
	ldr r1, _0600A32C ; =0x04808040
	mov r0, #3
	strh r6, [r1]
	strh r0, [r1, #8]
	mov r0, #0
_0600A314:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0600A320: .word 0x0380FFF4
_0600A324: .word sub_0601805C
_0600A328: .word sub_06017FFC
_0600A32C: .word 0x04808040
	arm_func_end sub_0600A0A4

	arm_func_start sub_0600A330
sub_0600A330: ; 0x0600A330
	stmdb sp!, {r3, lr}
	ldr r1, _0600A36C ; =0x0380FFF4
	ldrh r2, [r0]
	ldr r3, [r1]
	add r1, r3, #0x300
	strh r2, [r1, #0xa4]
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	add r2, r3, #0x3a4
	orr r0, r1, r0
	strh r0, [r2, #2]
	bl sub_0600A370
	mov r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600A36C: .word 0x0380FFF4
	arm_func_end sub_0600A330

	arm_func_start sub_0600A370
sub_0600A370: ; 0x0600A370
	stmdb sp!, {r3, lr}
	ldr r0, _0600A3E4 ; =0x0000E2E2
	add r2, sp, #0
	str r0, [sp]
	mov r0, #0x58
	mov r1, #2
	bl sub_06017FFC
	ldr r0, [sp]
	add r0, r0, #2
	add r0, r0, #0x200
	str r0, [sp]
	bl sub_0600ADC8
	cmp r0, #0x14
	bne _0600A3D0
	ldr r1, [sp]
	ldr r0, _0600A3E8 ; =0x048080BC
	sub r1, r1, #0x61
	sub r1, r1, #0x6100
	str r1, [sp]
	ldrh r0, [r0]
	tst r0, #2
	subne r0, r1, #0x60
	subne r0, r0, #0x6000
	strne r0, [sp]
_0600A3D0:
	ldr r1, [sp]
	ldr r0, _0600A3EC ; =0x04808140
	strh r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600A3E4: .word 0x0000E2E2
_0600A3E8: .word 0x048080BC
_0600A3EC: .word 0x04808140
	arm_func_end sub_0600A370

	arm_func_start sub_0600A3F0
sub_0600A3F0: ; 0x0600A3F0
	stmdb sp!, {r3, lr}
	ldr r1, _0600A450 ; =0x0380FFF4
	cmp r0, #0
	ldr r2, [r1]
	add r1, r2, #0x300
	add r3, r2, #0x31c
	strh r0, [r1, #0x52]
	ldrneh r0, [r3, #0x12]
	cmpne r0, #1
	ldrne r1, _0600A454 ; =0x04808006
	ldrneh r0, [r1]
	orrne r0, r0, #0x40
	strneh r0, [r1]
	bne _0600A444
	ldr r2, _0600A454 ; =0x04808006
	mov r1, #0
	ldrh r0, [r2]
	bic r0, r0, #0x40
	strh r0, [r2]
	ldrh r0, [r3, #0x20]
	bl sub_06009954
_0600A444:
	mov r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600A450: .word 0x0380FFF4
_0600A454: .word 0x04808006
	arm_func_end sub_0600A3F0

	arm_func_start sub_0600A458
sub_0600A458: ; 0x0600A458
	ldr r1, _0600A47C ; =0x0380FFF4
	ldr r2, _0600A480 ; =0x0480803C
	ldr r1, [r1]
	mov r3, r0, lsr #1
	add r1, r1, #0x300
	strh r3, [r1, #0x54]
	strh r0, [r2]
	mov r0, #0
	bx lr
	.align 2, 0
_0600A47C: .word 0x0380FFF4
_0600A480: .word 0x0480803C
	arm_func_end sub_0600A458

	arm_func_start sub_0600A484
sub_0600A484: ; 0x0600A484
	ldr r1, _0600A494 ; =0x04808040
	strh r0, [r1]
	mov r0, #0
	bx lr
	.align 2, 0
_0600A494: .word 0x04808040
	arm_func_end sub_0600A484

	arm_func_start sub_0600A498
sub_0600A498: ; 0x0600A498
	stmdb sp!, {r3, lr}
	ldr r0, _0600A500 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r0, [r0, #0xf8]
	cmp r0, #2
	bne _0600A4BC
	ldr r0, _0600A504 ; =0x0000C008
	bl sub_0600B2D0
_0600A4BC:
	ldr r1, _0600A508 ; =0x0000601E
	ldr r0, _0600A50C ; =0x04808158
	strh r1, [r0]
	bl sub_0600F048
	ldr r1, _0600A510 ; =0x0480815C
	mov r0, #0x1e
	ldrh r1, [r1]
	orr r1, r1, #0x3f
	bl sub_0600B2A0
	ldr r2, _0600A514 ; =0x0000800D
	ldr r1, _0600A518 ; =0x04808168
	ldr r0, _0600A51C ; =0x04808036
	strh r2, [r1]
	mov r1, #1
	strh r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600A500: .word 0x0380FFF4
_0600A504: .word 0x0000C008
_0600A508: .word 0x0000601E
_0600A50C: .word 0x04808158
_0600A510: .word 0x0480815C
_0600A514: .word 0x0000800D
_0600A518: .word 0x04808168
_0600A51C: .word 0x04808036
	arm_func_end sub_0600A498

	arm_func_start sub_0600A520
sub_0600A520: ; 0x0600A520
	stmdb sp!, {r4, lr}
	ldr r2, _0600A5B8 ; =0x04808036
	mov r3, #0
	ldr r1, _0600A5BC ; =sub_0600B654
	mov r0, #0x1f40
	strh r3, [r2]
	bl sub_0600EF54
	ldr r1, _0600A5C0 ; =0x04808168
	mov r2, #0
	ldr r0, _0600A5C4 ; =0x0380FFF4
	strh r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r0, [r0, #0xf8]
	cmp r0, #2
	beq _0600A56C
	cmp r0, #3
	beq _0600A5AC
	b _0600A5B0
_0600A56C:
	ldr r0, _0600A5C8 ; =0x00006001
	strh r0, [r1, #-0x10]
	bl sub_0600F048
	ldr r1, _0600A5CC ; =0x0480815C
	mov r0, #1
	ldrh r4, [r1]
	and r1, r4, #0x7f
	bl sub_0600B2A0
	mov r1, r4
	mov r0, #1
	bl sub_0600B2A0
	ldr r0, _0600A5D0 ; =0x00009C40
	ldr r1, _0600A5BC ; =sub_0600B654
	bl sub_0600EF54
	bl sub_0600B470
	b _0600A5B0
_0600A5AC:
	bl sub_0600B470
_0600A5B0:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600A5B8: .word 0x04808036
_0600A5BC: .word sub_0600B654
_0600A5C0: .word 0x04808168
_0600A5C4: .word 0x0380FFF4
_0600A5C8: .word 0x00006001
_0600A5CC: .word 0x0480815C
_0600A5D0: .word 0x00009C40
	arm_func_end sub_0600A520

	arm_func_start sub_0600A5D4
sub_0600A5D4: ; 0x0600A5D4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0600A630 ; =0x0380FFF4
	ldr r1, _0600A634 ; =0x0000FFFF
	ldr r2, [r2]
	mov r6, r0
	add r5, r2, #0x31c
	cmp r6, r1
	streqh r1, [r5, #0x1c]
	add r4, r2, #0x344
	streqh r1, [r4, #0x8c]
	beq _0600A624
	ldrh r0, [r4, #0x6e]
	mov r1, #0x64
	mul r0, r6, r0
	bl sub_06003ECC
	cmp r0, #0x10000
	movhi r0, #5
	bhi _0600A628
	strh r6, [r5, #0x1c]
	strh r0, [r4, #0x8c]
_0600A624:
	mov r0, #0
_0600A628:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0600A630: .word 0x0380FFF4
_0600A634: .word 0x0000FFFF
	arm_func_end sub_0600A5D4

	arm_func_start sub_0600A638
sub_0600A638: ; 0x0600A638
	ldr r1, _0600A67C ; =0x0380FFF4
	mov r2, #1
	ldr r0, [r1]
	add r0, r0, #0x300
	strh r2, [r0, #0xea]
	ldr r0, [r1]
	add r0, r0, #0x400
	ldrh r0, [r0, #0x68]
	cmp r0, #0
	bxne lr
	ldr r2, _0600A680 ; =0x04808038
	mov r0, #0
	ldrh r1, [r2]
	bic r1, r1, #2
	strh r1, [r2]
	strh r0, [r2, #0x10]
	bx lr
	.align 2, 0
_0600A67C: .word 0x0380FFF4
_0600A680: .word 0x04808038
	arm_func_end sub_0600A638

	arm_func_start sub_0600A684
sub_0600A684: ; 0x0600A684
	ldr r0, _0600A6AC ; =0x0380FFF4
	ldr r1, _0600A6B0 ; =0x04808038
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, #0x300
	strh r2, [r0, #0xea]
	ldrh r0, [r1]
	orr r0, r0, #2
	strh r0, [r1]
	bx lr
	.align 2, 0
_0600A6AC: .word 0x0380FFF4
_0600A6B0: .word 0x04808038
	arm_func_end sub_0600A684

	arm_func_start sub_0600A6B4
sub_0600A6B4: ; 0x0600A6B4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0600A6F4 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r2]
	cmp r5, #0x80
	add r4, r0, #0x344
	movhi r0, #4
	bhi _0600A6EC
	mov r0, r1
	ldr r1, [r4, #0x9c]
	add r2, r5, #1
	bl sub_06001B04
	strh r5, [r4, #0xa0]
	mov r0, #0
_0600A6EC:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600A6F4: .word 0x0380FFF4
	arm_func_end sub_0600A6B4

	arm_func_start sub_0600A6F8
sub_0600A6F8: ; 0x0600A6F8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _0600A7A0 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r2]
	mov r8, r1
	cmp r4, #0x80
	add r5, r0, #0x344
	movhi r0, #4
	bhi _0600A798
	cmp r4, #0
	beq _0600A788
	ldrh r0, [r5, #0xa2]
	tst r0, #1
	beq _0600A778
	ldr r6, [r5, #0x9c]
	mov r1, #0xff
	mov r0, r6
	bl sub_0600B9E4
	add r6, r6, #1
	mov r7, #0
	b _0600A76C
_0600A74C:
	mov r0, r8
	bl sub_0600BA10
	mov r1, r0
	mov r0, r6
	bl sub_0600B9E4
	add r6, r6, #1
	add r8, r8, #1
	add r7, r7, #1
_0600A76C:
	cmp r7, r4
	blo _0600A74C
	b _0600A788
_0600A778:
	ldr r1, [r5, #0x9c]
	mov r0, r8
	add r2, r4, #1
	bl sub_06001B04
_0600A788:
	strh r4, [r5, #0xa0]
	mov r0, #1
	strh r0, [r5, #0xa4]
	mov r0, #0
_0600A798:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0600A7A0: .word 0x0380FFF4
	arm_func_end sub_0600A6F8

	arm_func_start sub_0600A7A4
sub_0600A7A4: ; 0x0600A7A4
	ldr r3, _0600A7D8 ; =0x0380FFF4
	ldr r2, _0600A7DC ; =0x0480802A
	ldr r1, [r3]
	add r1, r1, #0x300
	strh r0, [r1, #0xae]
	strh r0, [r2]
	ldr r1, [r3]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x3a]
	mov r1, r1, lsl #0x18
	movs r1, r1, lsr #0x1f
	strneh r0, [r2, #-2]
	bx lr
	.align 2, 0
_0600A7D8: .word 0x0380FFF4
_0600A7DC: .word 0x0480802A
	arm_func_end sub_0600A7A4

	arm_func_start sub_0600A7E0
sub_0600A7E0: ; 0x0600A7E0
	stmdb sp!, {r4, lr}
	ldr r1, _0600A834 ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	add r4, r1, #0x344
	strh r0, [r4, #0x6a]
	bl sub_0600EFDC
	ldr r0, _0600A838 ; =0x0480802A
	mov r1, #0
	strh r1, [r0]
	ldrh r0, [r4, #0x88]
	cmp r0, #0
	beq _0600A82C
	bl sub_06013AF4
	ldrh r0, [r4, #0x88]
	mov r1, #0x20
	bl sub_0600E4F0
	mov r0, #0
	strh r0, [r4, #0x88]
_0600A82C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600A834: .word 0x0380FFF4
_0600A838: .word 0x0480802A
	arm_func_end sub_0600A7E0

	arm_func_start sub_0600A83C
sub_0600A83C: ; 0x0600A83C
	ldr r0, _0600A858 ; =0x0380FFF4
	ldr r1, _0600A85C ; =0x04808028
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0xae]
	strh r0, [r1]
	bx lr
	.align 2, 0
_0600A858: .word 0x0380FFF4
_0600A85C: .word 0x04808028
	arm_func_end sub_0600A83C

	arm_func_start sub_0600A860
sub_0600A860: ; 0x0600A860
	stmdb sp!, {r3, lr}
	ldr r0, _0600A880 ; =0x04808094
	ldrh r0, [r0]
	tst r0, #0x8000
	bne _0600A878
	bl sub_0600EFDC
_0600A878:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600A880: .word 0x04808094
	arm_func_end sub_0600A860

	arm_func_start sub_0600A884
sub_0600A884: ; 0x0600A884
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0600A91C ; =0x0380FFF4
	mov r5, r0
	ldr r1, [r1]
	add r4, r1, #0x344
	ldrh r0, [r4, #8]
	cmp r0, r5
	beq _0600A914
	cmp r0, #0x40
	bne _0600A8B8
	add r0, r1, #0x234
	add r0, r0, #0x400
	bl sub_06001B0C
_0600A8B8:
	cmp r5, #0
	beq _0600A8D4
	cmp r5, #0x10
	beq _0600A8DC
	cmp r5, #0x40
	beq _0600A8F4
	b _0600A910
_0600A8D4:
	bl sub_0600A498
	b _0600A910
_0600A8DC:
	ldr r0, _0600A920 ; =0x04808040
	mov r1, #0
	strh r1, [r0]
	bl sub_0600B1D4
	bl sub_0600A520
	b _0600A910
_0600A8F4:
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	bne _0600A904
	bl sub_0600A684
_0600A904:
	ldr r1, _0600A924 ; =sub_0600B72C
	mov r0, #0x64
	bl sub_0600B674
_0600A910:
	strh r5, [r4, #8]
_0600A914:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600A91C: .word 0x0380FFF4
_0600A920: .word 0x04808040
_0600A924: .word sub_0600B72C
	arm_func_end sub_0600A884

	arm_func_start sub_0600A928
sub_0600A928: ; 0x0600A928
	ldrh r2, [r1]
	strh r2, [r0]
	ldrh r2, [r1, #2]
	strh r2, [r0, #2]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	bx lr
	arm_func_end sub_0600A928

	arm_func_start sub_0600A944
sub_0600A944: ; 0x0600A944
	ldrh r3, [r1]
	strh r3, [r0]
	ldrh r3, [r1, #2]
	strh r3, [r0, #2]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	ldrh r1, [r2]
	strh r1, [r0, #6]
	ldrh r1, [r2, #2]
	strh r1, [r0, #8]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0xa]
	bx lr
	arm_func_end sub_0600A944

	arm_func_start sub_0600A978
sub_0600A978: ; 0x0600A978
	ldrh ip, [r1]
	strh ip, [r0]
	ldrh ip, [r1, #2]
	strh ip, [r0, #2]
	ldrh r1, [r1, #4]
	strh r1, [r0, #4]
	ldrh r1, [r2]
	strh r1, [r0, #6]
	ldrh r1, [r2, #2]
	strh r1, [r0, #8]
	ldrh r1, [r2, #4]
	strh r1, [r0, #0xa]
	ldrh r1, [r3]
	strh r1, [r0, #0xc]
	ldrh r1, [r3, #2]
	strh r1, [r0, #0xe]
	ldrh r1, [r3, #4]
	strh r1, [r0, #0x10]
	bx lr
	arm_func_end sub_0600A978

	arm_func_start sub_0600A9C4
sub_0600A9C4: ; 0x0600A9C4
	stmdb sp!, {r3, lr}
	bl sub_0600A9FC
	ldr r1, _0600A9F0 ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0xb4
	add r1, r1, #0x13c
	add r1, r1, #0x400
	bl sub_0600A9F4
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600A9F0: .word 0x0380FFF4
	arm_func_end sub_0600A9C4

	arm_func_start sub_0600A9F4
sub_0600A9F4: ; 0x0600A9F4
	ldr pc, _0600A9F8 ; =MIi_CpuClear32
	.align 2, 0
_0600A9F8: .word MIi_CpuClear32
	arm_func_end sub_0600A9F4

	arm_func_start sub_0600A9FC
sub_0600A9FC: ; 0x0600A9FC
	ldr r1, _0600ABEC ; =0x0380FFF4
	ldr r0, _0600ABF0 ; =0x048081B0
	ldr r1, [r1]
	ldrh r2, [r0]
	ldr r3, [r1, #0x58c]
	and r2, r2, #0xff
	add r2, r3, r2
	str r2, [r1, #0x58c]
	ldrh ip, [r0, #2]
	ldr r3, [r1, #0x588]
	and r2, ip, #0xff
	add r3, r3, ip, asr #8
	str r3, [r1, #0x588]
	ldr r3, [r1, #0x598]
	add r2, r3, r2
	str r2, [r1, #0x598]
	ldrh ip, [r0, #4]
	ldr r3, [r1, #0x594]
	and r2, ip, #0xff
	add r3, r3, ip, asr #8
	str r3, [r1, #0x594]
	ldr r3, [r1, #0x590]
	add r2, r3, r2
	str r2, [r1, #0x590]
	ldrh ip, [r0, #6]
	ldr r3, [r1, #0x59c]
	and r2, ip, #0xff
	add r3, r3, ip, asr #8
	str r3, [r1, #0x59c]
	ldr r3, [r1, #0x574]
	add r2, r3, r2
	str r2, [r1, #0x574]
	ldrh r2, [r0, #8]
	ldr r3, [r1, #0x584]
	and r2, r2, #0xff
	add r2, r3, r2
	str r2, [r1, #0x584]
	ldrh r2, [r0, #0xa]
	ldr r3, [r1, #0x55c]
	and r2, r2, #0xff
	add r2, r3, r2
	str r2, [r1, #0x55c]
	ldrh ip, [r0, #0xc]
	ldr r3, [r1, #0x56c]
	and r2, ip, #0xff
	add r3, r3, ip, asr #8
	str r3, [r1, #0x56c]
	ldr r3, [r1, #0x580]
	add r2, r3, r2
	str r2, [r1, #0x580]
	ldrh ip, [r0, #0xe]
	ldr r3, [r1, #0x578]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x578]
	ldr r2, [r1, #0x57c]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x57c]
	ldrh r2, [r0, #0x10]
	ldr r3, [r1, #0x548]
	and r2, r2, #0xff
	add r2, r3, r2
	str r2, [r1, #0x548]
	ldrh r3, [r0, #0x20]
	ldr r2, [r1, #0x5b4]
	add r2, r2, r3, asr #8
	str r2, [r1, #0x5b4]
	ldrh ip, [r0, #0x22]
	ldr r3, [r1, #0x5b8]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5b8]
	ldr r2, [r1, #0x5bc]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5bc]
	ldrh ip, [r0, #0x24]
	ldr r3, [r1, #0x5c0]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5c0]
	ldr r2, [r1, #0x5c4]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5c4]
	ldrh ip, [r0, #0x26]
	ldr r3, [r1, #0x5c8]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5c8]
	ldr r2, [r1, #0x5cc]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5cc]
	ldrh ip, [r0, #0x28]
	ldr r3, [r1, #0x5d0]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5d0]
	ldr r2, [r1, #0x5d4]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5d4]
	ldrh ip, [r0, #0x2a]
	ldr r3, [r1, #0x5d8]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5d8]
	ldr r2, [r1, #0x5dc]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5dc]
	ldrh ip, [r0, #0x2c]
	ldr r3, [r1, #0x5e0]
	and r2, ip, #0xff
	add r2, r3, r2
	str r2, [r1, #0x5e0]
	ldr r2, [r1, #0x5e4]
	add r2, r2, ip, asr #8
	str r2, [r1, #0x5e4]
	ldrh r3, [r0, #0x2e]
	ldr r2, [r1, #0x5e8]
	and r0, r3, #0xff
	add r0, r2, r0
	str r0, [r1, #0x5e8]
	ldr r0, [r1, #0x5ec]
	add r0, r0, r3, asr #8
	str r0, [r1, #0x5ec]
	bx lr
	.align 2, 0
_0600ABEC: .word 0x0380FFF4
_0600ABF0: .word 0x048081B0
	arm_func_end sub_0600A9FC

	arm_func_start sub_0600ABF4
sub_0600ABF4: ; 0x0600ABF4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r2, _0600ACC0 ; =0x0380FFF4
	mov sb, r0
	ldr r0, [r2]
	mov r8, r1
	cmp sb, #0x20
	add r2, r0, #0x344
	movhi r0, #0
	bhi _0600ACB8
	ldrh r1, [r2, #0x1e]
	cmp r1, #0
	moveq r0, #1
	beq _0600ACB8
	add r0, r0, #0x400
	ldrh r0, [r0, #4]
	cmp r0, #0x13
	bne _0600AC4C
	cmp sb, r1
	movlo r0, #0
	blo _0600ACB8
	mov sb, r1
	b _0600AC58
_0600AC4C:
	cmp sb, r1
	movne r0, #0
	bne _0600ACB8
_0600AC58:
	add r5, r2, #0x20
	add r6, r2, #0x40
	mov r7, #0
	b _0600ACAC
_0600AC68:
	mov r0, r6
	bl sub_0600BA10
	mov r4, r0
	mov r0, r8
	add r6, r6, #1
	bl sub_0600BA10
	mov sl, r0
	mov r0, r5
	add r8, r8, #1
	bl sub_0600BA10
	orr r1, sl, r4
	orr r0, r0, r4
	cmp r1, r0
	add r5, r5, #1
	movne r0, #0
	bne _0600ACB8
	add r7, r7, #1
_0600ACAC:
	cmp r7, sb
	blo _0600AC68
	mov r0, #1
_0600ACB8:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0600ACC0: .word 0x0380FFF4
	arm_func_end sub_0600ABF4

	arm_func_start sub_0600ACC4
sub_0600ACC4: ; 0x0600ACC4
	ldrh r3, [r0, #4]
	ldrh r2, [r1, #4]
	cmp r3, r2
	ldreqh r3, [r0, #2]
	ldreqh r2, [r1, #2]
	cmpeq r3, r2
	ldreqh r2, [r0]
	ldreqh r0, [r1]
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_0600ACC4

	arm_func_start sub_0600ACF4
sub_0600ACF4: ; 0x0600ACF4
	ldr r1, _0600AD10 ; =0x0380FFF4
	mov r2, #1
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x2c]
	and r0, r1, r2, lsl r0
	bx lr
	.align 2, 0
_0600AD10: .word 0x0380FFF4
	arm_func_end sub_0600ACF4

	arm_func_start sub_0600AD14
sub_0600AD14: ; 0x0600AD14
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r1
	mov r1, #0
	mov r4, r0
	strh r1, [sb]
	add r0, r4, #1
	strh r1, [sb, #2]
	bl sub_0600BA10
	add r6, r4, #2
	ldr r5, _0600ADC4 ; =0x060183E0
	mov r8, r0
	mov r7, #0
	mov r4, #1
	b _0600ADB4
_0600AD4C:
	add r0, r6, r7
	bl sub_0600BA10
	and r1, r0, #0x7f
	sub r1, r1, #1
	cmp r1, #0x78
	bhs _0600AD94
	mov r1, r1, lsl #1
	ldrh r2, [r5, r1]
	cmp r2, #0xff
	beq _0600AD94
	ldrh r1, [sb, #2]
	tst r0, #0x80
	orr r0, r1, r4, lsl r2
	strh r0, [sb, #2]
	ldrneh r0, [sb]
	orrne r0, r0, r4, lsl r2
	strneh r0, [sb]
	b _0600ADB0
_0600AD94:
	ldrh r1, [sb, #2]
	tst r0, #0x80
	orr r0, r1, #0x8000
	strh r0, [sb, #2]
	ldrneh r0, [sb]
	orrne r0, r0, #0x8000
	strneh r0, [sb]
_0600ADB0:
	add r7, r7, #1
_0600ADB4:
	cmp r7, r8
	blo _0600AD4C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0600ADC4: .word 0x060183E0
	arm_func_end sub_0600AD14

	arm_func_start sub_0600ADC8
sub_0600ADC8: ; 0x0600ADC8
	ldr r0, _0600AE10 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x30]
	cmp r1, #0
	beq _0600ADEC
	cmp r1, #1
	beq _0600AE00
	b _0600AE08
_0600ADEC:
	ldrh r0, [r0, #0xa4]
	tst r0, #1
	beq _0600AE08
	mov r0, #0xa
	bx lr
_0600AE00:
	mov r0, #0xa
	bx lr
_0600AE08:
	mov r0, #0x14
	bx lr
	.align 2, 0
_0600AE10: .word 0x0380FFF4
	arm_func_end sub_0600ADC8

	arm_func_start sub_0600AE14
sub_0600AE14: ; 0x0600AE14
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r0, _0600B180 ; =0x0380FFF4
	ldr r0, [r0]
	add r6, r0, #0x344
	add r4, r0, #0x31c
	bl sub_0600B1D4
	ldr r1, _0600B184 ; =0x04808044
	ldrh r2, [r1]
	ldrh r0, [r1]
	ldrh r1, [r1]
	add r0, r2, r0, lsl #8
	bl sub_0600BA2C
	mov r0, #1
	strh r0, [r6, #0x7c]
	ldrh r0, [r4, #0x1e]
	ldr r2, _0600B188 ; =0x04808032
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	ldreqh r0, [r6, #0x7c]
	ldr r1, _0600B18C ; =0x04808134
	orreq r0, r0, #0x20
	streqh r0, [r6, #0x7c]
	ldrh r0, [r4, #0x18]
	mov r4, #0
	cmp r0, #0
	ldrneh r0, [r6, #0x7c]
	mov r3, #0x8000
	orrne r0, r0, #0x10
	strneh r0, [r6, #0x7c]
	strh r4, [r6, #0x12]
	ldr r0, _0600B190 ; =0x0000FFFF
	strh r3, [r2]
	strh r0, [r1]
	strh r4, [r2, #-8]
	sub r0, r1, #0x10c
	strh r4, [r0]
	mov r0, #0xf
	strh r0, [r1, #-0xfc]
	bl sub_0600EDBC
	bl sub_06017E9C
	bl sub_06014F08
	bl sub_06017C38
	ldr r2, _0600B194 ; =0x04808030
	mov r1, #0x8000
	strh r1, [r2]
	ldr r0, _0600B190 ; =0x0000FFFF
	ldr r1, _0600B198 ; =0x048081AE
	strh r0, [r2, #-0x20]
	sub r2, r0, #0xe000
	ldr r0, _0600B180 ; =0x0380FFF4
	strh r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #8
	movne r0, #0x400
	strneh r0, [r1, #-4]
	moveq r0, r4
	streqh r0, [r1, #-4]
	ldr r2, _0600B19C ; =0x04808008
	mov r3, #0
	strh r3, [r2]
	strh r3, [r2, #2]
	ldrh r0, [r6, #0xc]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _0600B144
_0600AF28: ; jump table
	b _0600AF3C ; case 0
	b _0600AF6C ; case 1
	b _0600B050 ; case 2
	b _0600B0D0 ; case 3
	b _0600B128 ; case 4
_0600AF3C:
	ldr r0, _0600B190 ; =0x0000FFFF
	mov r1, #0x3f
	strh r1, [r2, #0xa]
	strh r0, [r2, #0xc8]
	mov r0, #8
	strh r0, [r2, #0xd8]
	strh r3, [r2]
	strh r3, [r2, #2]
	strh r3, [r2, #0xe0]
	mov r0, #1
	strh r0, [r2, #-4]
	b _0600B144
_0600AF6C:
	ldr r3, _0600B1A0 ; =0x0000703F
	ldr r0, _0600B1A4 ; =0x00001FFF
	ldr r1, _0600B198 ; =0x048081AE
	strh r3, [r2, #0xa]
	strh r0, [r1]
	rsb r0, r0, #0x2300
	strh r0, [r1, #-0xde]
	mov r0, #0xd
	strh r0, [r1, #-0xce]
	mov r0, #0xe000
	strh r0, [r2]
	mov r0, #1
	strh r0, [r2, #-4]
	ldrh r0, [r1, #-0xb6]
	add r7, sp, #0
	strh r0, [r7]
	ldrh r0, [r1, #-0xb4]
	mov r4, #0
	strh r0, [r7, #2]
	ldrh r2, [r1, #-0xb2]
	ldr r0, [sp]
	strh r2, [r7, #4]
	ldrh r1, [r1, #-0xb0]
	mov r3, r4
	strh r1, [r7, #6]
	ldrh r2, [r6, #0x6e]
	ldr r1, [sp, #4]
	mov r5, r2, lsl #0xa
	mov r2, r5
	bl sub_0600B1CC
	adds r3, r0, #1
	umull r2, r0, r3, r5
	mla r0, r3, r4, r0
	adc r1, r1, #0
	mla r0, r1, r5, r0
	str r0, [sp, #4]
	ldrh r0, [r7, #6]
	ldr r3, _0600B1A8 ; =0x048080F6
	str r2, [sp]
	strh r0, [r3]
	ldrh r0, [r7, #4]
	mov r1, #1
	strh r0, [r3, #-2]
	ldrh r2, [r7, #2]
	mov r0, #0x40
	strh r2, [r3, #-4]
	ldrh r2, [r7]
	orr r2, r2, #1
	strh r2, [r3, #-6]
	strh r1, [r3, #-0xe]
	strh r1, [r3, #-0xc]
	bl sub_0600A884
	bl sub_06013F30
	ldr r0, _0600B1AC ; =0x048080AE
	mov r1, #2
	strh r1, [r0]
	b _0600B144
_0600B050:
	ldr r1, _0600B1B0 ; =0x0000E0BF
	ldr r0, _0600B180 ; =0x0380FFF4
	strh r1, [r2, #0xa]
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #0x20
	beq _0600B08C
	ldrh r0, [r2, #0xa]
	ldr r1, _0600B1B4 ; =0x048081AA
	orr r0, r0, #0x40
	strh r0, [r2, #0xa]
	ldrh r0, [r1]
	orr r0, r0, #0x68
	strh r0, [r1]
_0600B08C:
	ldrh r0, [r6, #0x64]
	tst r0, #1
	ldr r0, _0600B1B8 ; =0x048080D0
	ldrne r1, _0600B1BC ; =0x00000581
	strneh r1, [r0]
	ldreq r1, _0600B1C0 ; =0x00000181
	streqh r1, [r0]
	ldr r2, _0600B1C4 ; =0x048080E0
	mov r0, #0xb
	strh r0, [r2]
	mov r1, #1
	strh r1, [r2, #-0xdc]
	strh r1, [r2, #8]
	mov r0, #0x20
	strh r1, [r2, #0xa]
	bl sub_0600A884
	b _0600B144
_0600B0D0:
	ldr r1, _0600B190 ; =0x0000FFFF
	strh r1, [r2, #8]
	sub r0, r1, #0x3fc0
	strh r0, [r2, #0xa]
	ldrh r0, [r6, #0x64]
	tst r0, #1
	rsbne r0, r1, #0x10400
	strneh r0, [r2, #0xc8]
	moveq r0, #1
	streqh r0, [r2, #0xc8]
	ldr r2, _0600B1C4 ; =0x048080E0
	mov r0, #0xb
	strh r0, [r2]
	mov r0, #1
	strh r0, [r2, #-0xdc]
	strh r0, [r2, #8]
	strh r0, [r2, #0xa]
	mov r1, #0
	mov r0, #0x20
	strh r1, [r2, #-0x98]
	bl sub_0600A884
	b _0600B144
_0600B128:
	ldr r0, _0600B198 ; =0x048081AE
	strh r3, [r2, #0xa]
	strh r3, [r0]
	mov r1, #1
	mov r0, #0x20
	strh r1, [r2, #-4]
	bl sub_0600A884
_0600B144:
	ldr r0, _0600B1C8 ; =0x04808048
	mov r1, #0
	strh r1, [r0]
	bl sub_0600A638
	ldr r1, _0600B1AC ; =0x048080AE
	mov r0, #2
	strh r0, [r1]
	ldrh r1, [r6, #0xe]
	cmp r1, #1
	bne _0600B170
	bl sub_0600A458
_0600B170:
	bl sub_0600EF28
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0600B180: .word 0x0380FFF4
_0600B184: .word 0x04808044
_0600B188: .word 0x04808032
_0600B18C: .word 0x04808134
_0600B190: .word 0x0000FFFF
_0600B194: .word 0x04808030
_0600B198: .word 0x048081AE
_0600B19C: .word 0x04808008
_0600B1A0: .word 0x0000703F
_0600B1A4: .word 0x00001FFF
_0600B1A8: .word 0x048080F6
_0600B1AC: .word 0x048080AE
_0600B1B0: .word 0x0000E0BF
_0600B1B4: .word 0x048081AA
_0600B1B8: .word 0x048080D0
_0600B1BC: .word 0x00000581
_0600B1C0: .word 0x00000181
_0600B1C4: .word 0x048080E0
_0600B1C8: .word 0x04808048
	arm_func_end sub_0600AE14

	arm_func_start sub_0600B1CC
sub_0600B1CC: ; 0x0600B1CC
	ldr pc, _0600B1D0 ; =_ll_udiv
	.align 2, 0
_0600B1D0: .word _ll_udiv
	arm_func_end sub_0600B1CC

	arm_func_start sub_0600B1D4
sub_0600B1D4: ; 0x0600B1D4
	stmdb sp!, {r4, lr}
	ldr r0, _0600B264 ; =0x0380FFF4
	ldr r1, [r0]
	add r0, r1, #0x208
	add r0, r0, #0x400
	add r4, r1, #0x344
	bl sub_06001B0C
	ldr r0, _0600B264 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x234
	add r0, r0, #0x400
	bl sub_06001B0C
	mov r0, #0x20
	bl sub_0600A884
	mov r1, #0
	strh r1, [r4, #0xa4]
	ldr r0, _0600B268 ; =0x04808012
	strh r1, [r4, #0x12]
	strh r1, [r0]
	strh r1, [r0, #-0xe]
	strh r1, [r0, #0xd8]
	strh r1, [r0, #0xd6]
	strh r1, [r0, #-0xa]
	strh r1, [r0, #-8]
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	bne _0600B244
	bl sub_06013F70
_0600B244:
	ldr r1, _0600B26C ; =0x0000FFFF
	ldr r0, _0600B270 ; =0x048080AC
	strh r1, [r0]
	strh r1, [r0, #8]
	bl sub_06013C9C
	bl sub_060094E8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600B264: .word 0x0380FFF4
_0600B268: .word 0x04808012
_0600B26C: .word 0x0000FFFF
_0600B270: .word 0x048080AC
	arm_func_end sub_0600B1D4

	arm_func_start sub_0600B274
sub_0600B274: ; 0x0600B274
	stmdb sp!, {r3, lr}
	ldr r1, _0600B298 ; =0x04808158
	orr r0, r0, #0x6000
	strh r0, [r1]
	bl sub_0600F048
	ldr r0, _0600B29C ; =0x0480815C
	ldrh r0, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600B298: .word 0x04808158
_0600B29C: .word 0x0480815C
	arm_func_end sub_0600B274

	arm_func_start sub_0600B2A0
sub_0600B2A0: ; 0x0600B2A0
	stmdb sp!, {r3, lr}
	ldr r2, _0600B2CC ; =0x0480815A
	orr r0, r0, #0x5000
	strh r1, [r2]
	strh r0, [r2, #-2]
	bl sub_0600F048
	cmp r0, #0
	mvnne r0, #0
	moveq r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600B2CC: .word 0x0480815A
	arm_func_end sub_0600B2A0

	arm_func_start sub_0600B2D0
sub_0600B2D0: ; 0x0600B2D0
	ldr r2, _0600B2E8 ; =0x0480817E
	ldr ip, _0600B2EC ; =sub_0600F07C
	strh r0, [r2]
	mov r1, r0, lsr #0x10
	strh r1, [r2, #-2]
	bx ip
	.align 2, 0
_0600B2E8: .word 0x0480817E
_0600B2EC: .word sub_0600F07C
	arm_func_end sub_0600B2D0

	arm_func_start sub_0600B2F0
sub_0600B2F0: ; 0x0600B2F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, #0
	str r8, [sp]
	mov r7, r8
	mov r6, #0x64
	add r4, sp, #0
	mov r5, #1
_0600B310:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_06017FFC
	cmp r7, #1
	ldreq r0, [sp]
	mov r1, r8
	andeq r0, r0, #0x80
	streq r0, [sp]
	ldr r0, [sp]
	and r0, r0, #0xff
	bl sub_0600BAA8
	add r7, r7, #1
	mov r8, r0
	cmp r7, #0x69
	add r6, r6, #1
	blo _0600B310
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, lr}
	bx lr
	arm_func_end sub_0600B2F0

	arm_func_start sub_0600B360
sub_0600B360: ; 0x0600B360
	stmdb sp!, {r4, lr}
	ldr r1, _0600B3CC ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0x10
	add r1, r1, #0x1f8
	add r4, r1, #0x400
	mov r1, r4
	bl sub_06000598
	mov r2, r4
	mov r0, #0x40
	mov r1, #1
	bl sub_06017FFC
	add r2, r4, #2
	mov r0, #0x41
	mov r1, #1
	bl sub_06017FFC
	add r2, r4, #4
	mov r0, #0x42
	mov r1, #1
	bl sub_06017FFC
	add r2, r4, #6
	mov r0, #0x43
	mov r1, #1
	bl sub_06017FFC
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600B3CC: .word 0x0380FFF4
	arm_func_end sub_0600B360

	arm_func_start sub_0600B3D0
sub_0600B3D0: ; 0x0600B3D0
	ldr r2, _0600B404 ; =0x0601837C
	mov r3, #0
_0600B3D8:
	mov r0, r3, lsl #2
	ldrh r0, [r2, r0]
	add r1, r2, r3, lsl #2
	add r0, r0, #0x4800000
	add r3, r3, #1
	ldrh r1, [r1, #2]
	add r0, r0, #0x8000
	strh r1, [r0]
	cmp r3, #0x19
	blo _0600B3D8
	bx lr
	.align 2, 0
_0600B404: .word 0x0601837C
	arm_func_end sub_0600B3D0

	arm_func_start sub_0600B408
sub_0600B408: ; 0x0600B408
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _0600B46C ; =0x04808160
	mov r1, #0x100
	strh r1, [r0]
	mov r6, #0
	str r6, [sp]
	mov r7, #0x64
	add r4, sp, #0
	mov r5, #1
_0600B42C:
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl sub_06017FFC
	ldr r1, [sp]
	mov r0, r6
	bl sub_0600B2A0
	add r6, r6, #1
	cmp r6, #0x69
	add r7, r7, #1
	blo _0600B42C
	mov r0, #0x5a
	mov r1, #2
	bl sub_0600B2A0
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0600B46C: .word 0x04808160
	arm_func_end sub_0600B408

	arm_func_start sub_0600B470
sub_0600B470: ; 0x0600B470
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r0, _0600B5EC ; =0x0380FFF4
	ldr r5, _0600B5F0 ; =0x0601830C
	ldr r0, [r0]
	mov r8, #0
	add r0, r0, #0x1f8
	str r8, [sp]
	add r4, r0, #0x400
	add r6, sp, #0
	mov r7, #2
_0600B49C:
	mov r0, r8, lsl #1
	mov r1, r7
	mov r2, r6
	add r0, r0, #0x44
	bl sub_06017FFC
	mov r0, r8, lsl #1
	ldrh r0, [r5, r0]
	add r8, r8, #1
	add r0, r0, #0x4800000
	ldr r1, [sp]
	add r0, r0, #0x8000
	strh r1, [r0]
	cmp r8, #0x10
	blo _0600B49C
	ldrh r1, [r4, #2]
	ldr r0, _0600B5F4 ; =0x04808184
	mov r2, r1, lsr #7
	mov r1, r2, lsl #8
	str r1, [sp, #4]
	ldrh r1, [r4, #2]
	mov r7, #0xce
	and r1, r1, #0x7f
	orr r1, r1, r2, lsl #8
	str r1, [sp, #4]
	strh r1, [r0]
	ldrh r0, [r4, #2]
	ldrh r1, [r4]
	and r0, r0, #0x7f
	add r2, r0, #7
	mov r0, r2, asr #2
	add r0, r2, r0, lsr #29
	ldrh r8, [r4, #4]
	cmp r1, #3
	mov r6, r0, asr #3
	bne _0600B58C
	add r0, r8, #0xce
	add r2, r4, #8
	mov r1, #1
	bl sub_06017FFC
	mov sb, #0
	add r4, sp, #4
	mov r6, sb
	mov r5, #1
	b _0600B580
_0600B54C:
	str r6, [sp, #4]
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl sub_06017FFC
	mov r0, sb, lsl #8
	ldr r1, [sp, #4]
	add r0, r0, #0x50000
	orr r0, r1, r0
	str r0, [sp, #4]
	bl sub_0600B2D0
	add sb, sb, #1
	add r7, r7, #1
_0600B580:
	cmp sb, r8
	blo _0600B54C
	b _0600B5E0
_0600B58C:
	mov r0, #0
	str r0, [sp, #4]
	add r5, sp, #4
	b _0600B5D8
_0600B59C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl sub_06017FFC
	ldr r0, [sp, #4]
	bl sub_0600B2D0
	ldrh r0, [r4]
	sub r8, r8, #1
	cmp r0, #2
	ldreq r1, [sp, #4]
	add r7, r7, r6
	moveq r0, r1, lsr #0x12
	cmpeq r0, #9
	biceq r0, r1, #0x7c00
	streq r0, [r4, #0xc]
_0600B5D8:
	cmp r8, #0
	bne _0600B59C
_0600B5E0:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0600B5EC: .word 0x0380FFF4
_0600B5F0: .word 0x0601830C
_0600B5F4: .word 0x04808184
	arm_func_end sub_0600B470

	arm_func_start sub_0600B5F8
sub_0600B5F8: ; 0x0600B5F8
	stmdb sp!, {r4, lr}
	ldr r0, _0600B648 ; =0x0380FFF4
	ldr r4, [r0]
	bl sub_0600B64C
	cmp r0, #0
	addeq r0, r4, #0x300
	ldreqh r1, [r0, #0x3e]
	orreq r1, r1, #0x40
	streqh r1, [r0, #0x3e]
	beq _0600B640
	add r0, r4, #0x208
	add r0, r0, #0x400
	bl sub_06001DE4
	add r0, r4, #0x234
	add r0, r0, #0x400
	bl sub_06001DE4
	add r0, r4, #0x660
	bl sub_06001DE4
_0600B640:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600B648: .word 0x0380FFF4
	arm_func_end sub_0600B5F8

	arm_func_start sub_0600B64C
sub_0600B64C: ; 0x0600B64C
	ldr pc, _0600B650 ; =OS_IsAlarmAvailable
	.align 2, 0
_0600B650: .word OS_IsAlarmAvailable
	arm_func_end sub_0600B64C

	arm_func_start sub_0600B654
sub_0600B654: ; 0x0600B654
	mov r1, #0
	str r1, [r0]
	bx lr
	arm_func_end sub_0600B654

	arm_func_start sub_0600B660
sub_0600B660: ; 0x0600B660
	ldr ip, _0600B66C ; =sub_0600EF54
	ldr r1, _0600B670 ; =sub_0600B654
	bx ip
	.align 2, 0
_0600B66C: .word sub_0600EF54
_0600B670: .word sub_0600B654
	arm_func_end sub_0600B660

	arm_func_start sub_0600B674
sub_0600B674: ; 0x0600B674
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	ldr r2, _0600B6FC ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	add r0, r0, #0x208
	add r0, r0, #0x400
	bl sub_06001B0C
	ldr r0, _0600B700 ; =0x000082EA
	mov r1, #0
	umull r3, r2, r5, r0
	mla r2, r5, r1, r2
	mov r5, r1
	mla r2, r5, r0, r2
	mov r6, r3, lsr #6
	orr r6, r6, r2, lsl #26
	bl sub_06001AFC
	adds r0, r6, r0
	adc r2, r1, #0
	mov r1, r0
	str r4, [sp, #4]
	mov r0, r5
	str r0, [sp, #8]
	ldr r0, _0600B6FC ; =0x0380FFF4
	str r5, [sp]
	ldr r0, [r0]
	mov r3, r6
	add r0, r0, #0x208
	add r0, r0, #0x400
	bl sub_0600B704
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0600B6FC: .word 0x0380FFF4
_0600B700: .word 0x000082EA
	arm_func_end sub_0600B674

	arm_func_start sub_0600B704
sub_0600B704: ; 0x0600B704
	ldr pc, _0600B708 ; =OS_SetPeriodicAlarm
	.align 2, 0
_0600B708: .word OS_SetPeriodicAlarm
	arm_func_end sub_0600B704

	arm_func_start sub_0600B70C
sub_0600B70C: ; 0x0600B70C
	ldr r0, _0600B724 ; =0x0380FFF4
	ldr ip, _0600B728 ; =OS_CancelAlarm
	ldr r0, [r0]
	add r0, r0, #0x208
	add r0, r0, #0x400
	bx ip
	.align 2, 0
_0600B724: .word 0x0380FFF4
_0600B728: .word OS_CancelAlarm
	arm_func_end sub_0600B70C

	arm_func_start sub_0600B72C
sub_0600B72C: ; 0x0600B72C
	stmdb sp!, {r4, lr}
	ldr r1, _0600B7A8 ; =0x0380FFF4
	mov r0, #1
	ldr r4, [r1]
	mov r1, #0xa
	ldr r2, [r4, #0x3ec]
	add r2, r2, #1
	str r2, [r4, #0x3ec]
	bl sub_06008F04
	mov r0, #2
	mov r1, #0x12
	bl sub_06008F04
	mov r0, #1
	mov r1, #0x11
	bl sub_06008F04
	add r0, r4, #0x100
	ldrh r0, [r0, #0xfc]
	cmp r0, #0
	beq _0600B784
	mov r0, #2
	mov r1, #0x13
	bl sub_06008F04
_0600B784:
	add r0, r4, #0x300
	ldrh r0, [r0, #0xf4]
	cmp r0, #0
	beq _0600B7A0
	mov r0, #2
	mov r1, #0x15
	bl sub_06008F04
_0600B7A0:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600B7A8: .word 0x0380FFF4
	arm_func_end sub_0600B72C

	arm_func_start sub_0600B7AC
sub_0600B7AC: ; 0x0600B7AC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0600B814 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	add r0, r0, #0x234
	add r0, r0, #0x400
	bl sub_06001B0C
	mov r3, #0
	ldr r0, _0600B818 ; =0x000082EA
	mov r1, r3
	umull r2, ip, r5, r0
	mla ip, r5, r3, ip
	mla ip, r1, r0, ip
	mov r1, r2, lsr #6
	str r3, [sp]
	ldr r0, _0600B814 ; =0x0380FFF4
	mov r3, r4
	ldr r0, [r0]
	mov r2, ip, lsr #6
	add r0, r0, #0x234
	add r0, r0, #0x400
	orr r1, r1, ip, lsl #26
	bl sub_06001B14
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600B814: .word 0x0380FFF4
_0600B818: .word 0x000082EA
	arm_func_end sub_0600B7AC

	arm_func_start sub_0600B81C
sub_0600B81C: ; 0x0600B81C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0600B898 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r2]
	mov r4, r1
	add r0, r0, #0x234
	add r0, r0, #0x400
	bl sub_06001B0C
	ldr r0, _0600B89C ; =0x000082EA
	mov r3, #0
	umull ip, r2, r5, r0
	mla r2, r5, r3, r2
	mov r1, r3
	mla r2, r1, r0, r2
	mov r0, ip, lsr #6
	mov r1, r2, lsr #6
	orr r0, r0, r2, lsl #26
	mov r2, #0x3e8
	bl sub_0600B1CC
	mov r2, r1
	mov r1, r0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0600B898 ; =0x0380FFF4
	mov r3, r4
	ldr r0, [r0]
	add r0, r0, #0x234
	add r0, r0, #0x400
	bl sub_06001B14
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600B898: .word 0x0380FFF4
_0600B89C: .word 0x000082EA
	arm_func_end sub_0600B81C

	arm_func_start sub_0600B8A0
sub_0600B8A0: ; 0x0600B8A0
	ldr r0, _0600B8B8 ; =0x0380FFF4
	ldr ip, _0600B8BC ; =OS_CancelAlarm
	ldr r0, [r0]
	add r0, r0, #0x234
	add r0, r0, #0x400
	bx ip
	.align 2, 0
_0600B8B8: .word 0x0380FFF4
_0600B8BC: .word OS_CancelAlarm
	arm_func_end sub_0600B8A0

	arm_func_start sub_0600B8C0
sub_0600B8C0: ; 0x0600B8C0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _0600B934 ; =0x04805F60
	add r2, r2, #1
	mov r5, r1
	bic r2, r2, #1
	add r1, r5, r2
	cmp r1, r3
	mov r6, r0
	subhi r4, r3, r5
	subhi r7, r2, r4
	movls r4, r2
	movls r7, #0
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_06001B04
	cmp r7, #0
	beq _0600B92C
	ldr r0, _0600B938 ; =0x0380FFF4
	add r3, r5, r4
	ldr r0, [r0]
	mov r2, r7
	add r0, r0, #0x300
	ldrh r0, [r0, #0xde]
	add r1, r6, r4
	sub r0, r3, r0
	bl sub_06001B04
_0600B92C:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0600B934: .word 0x04805F60
_0600B938: .word 0x0380FFF4
	arm_func_end sub_0600B8C0

	arm_func_start sub_0600B93C
sub_0600B93C: ; 0x0600B93C
	ldr ip, _0600B958 ; =MIi_CpuCopy16
	mov r3, r0
	add r2, r2, #1
	mov r0, r1
	mov r1, r3
	bic r2, r2, #1
	bx ip
	.align 2, 0
_0600B958: .word MIi_CpuCopy16
	arm_func_end sub_0600B93C

	arm_func_start sub_0600B95C
sub_0600B95C: ; 0x0600B95C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r2
	mov r0, r1
	mov r4, r3
	mov r1, r6
	mov r2, #0x24
	bl sub_06001B04
	cmp r4, #0
	beq _0600B998
	add r2, r4, #1
	mov r0, r5
	add r1, r6, #0x24
	bic r2, r2, #1
	bl sub_06001B04
_0600B998:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_0600B95C

	arm_func_start sub_0600B9A0
sub_0600B9A0: ; 0x0600B9A0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r2
	mov r0, r1
	mov r4, r3
	mov r1, r6
	mov r2, #0x24
	bl sub_06001B04
	cmp r4, #0
	beq _0600B9DC
	add r2, r4, #1
	mov r0, r5
	add r1, r6, #0x28
	bic r2, r2, #1
	bl sub_06001B04
_0600B9DC:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_0600B9A0

	arm_func_start sub_0600B9E4
sub_0600B9E4: ; 0x0600B9E4
	tst r0, #1
	ldrneh r2, [r0, #-1]
	andne r2, r2, #0xff
	orrne r1, r2, r1, lsl #8
	strneh r1, [r0, #-1]
	ldreqh r2, [r0]
	andeq r1, r1, #0xff
	andeq r2, r2, #0xff00
	orreq r1, r2, r1
	streqh r1, [r0]
	bx lr
	arm_func_end sub_0600B9E4

	arm_func_start sub_0600BA10
sub_0600BA10: ; 0x0600BA10
	tst r0, #1
	ldrneh r0, [r0, #-1]
	movne r0, r0, asr #8
	ldreqh r0, [r0]
	and r0, r0, #0xff
	and r0, r0, #0xff
	bx lr
	arm_func_end sub_0600BA10

	arm_func_start sub_0600BA2C
sub_0600BA2C: ; 0x0600BA2C
	ldr r3, _0600BA58 ; =0x0380FFF4
	ldr r2, _0600BA5C ; =0x0000FFF8
	ldr r3, [r3]
	and r0, r0, r2
	add r2, r0, #5
	add r0, r3, #0x500
	strh r2, [r0, #0xf0]
	add r2, r3, #0x5f0
	orr r0, r1, #1
	strh r0, [r2, #2]
	bx lr
	.align 2, 0
_0600BA58: .word 0x0380FFF4
_0600BA5C: .word 0x0000FFF8
	arm_func_end sub_0600BA2C

	arm_func_start sub_0600BA60
sub_0600BA60: ; 0x0600BA60
	ldr r1, _0600BA74 ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x500
	strh r0, [r1, #0xf4]
	bx lr
	.align 2, 0
_0600BA74: .word 0x0380FFF4
	arm_func_end sub_0600BA60

	arm_func_start sub_0600BA78
sub_0600BA78: ; 0x0600BA78
	ldr r0, _0600BAA4 ; =0x0380FFF4
	ldr r0, [r0]
	add r3, r0, #0x5f0
	add r0, r0, #0x500
	ldrh r2, [r3, #2]
	ldrh r1, [r3, #4]
	ldrh r0, [r0, #0xf0]
	mla r0, r1, r0, r2
	strh r0, [r3, #4]
	ldrh r0, [r3, #4]
	bx lr
	.align 2, 0
_0600BAA4: .word 0x0380FFF4
	arm_func_end sub_0600BA78

	arm_func_start sub_0600BAA8
sub_0600BAA8: ; 0x0600BAA8
	stmdb sp!, {r4, lr}
	ldr r2, _0600BB20 ; =0x060182EC
	mov r4, r1, lsl #0x1c
	ldr r3, _0600BB24 ; =0x00000FFF
	mov r4, r4, lsr #0x1b
	mov ip, r0, lsl #0x1c
	mov lr, ip, lsr #0x1b
	and r1, r3, r1, asr #4
	ldrh r4, [r2, r4]
	mov r1, r1, lsl #0x10
	mov r0, r0, asr #4
	mov r0, r0, lsl #0x1c
	mov ip, r0, lsr #0x1b
	ldrh r0, [r2, lr]
	eor r1, r4, r1, lsr #16
	eor r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r1, lsl #0x1c
	mov r0, r0, lsr #0x1b
	and r1, r3, r1, asr #4
	ldrh r3, [r2, r0]
	mov r0, r1, lsl #0x10
	ldrh r1, [r2, ip]
	eor r0, r3, r0, lsr #16
	eor r0, r0, r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600BB20: .word 0x060182EC
_0600BB24: .word 0x00000FFF
	arm_func_end sub_0600BAA8

	arm_func_start sub_0600BB28
sub_0600BB28: ; 0x0600BB28
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #8]
	ldr r1, _0600BB9C ; =0x0000B6B8
	ldrh r2, [r4, #-4]
	sub lr, r4, #4
	cmp r2, r1
	ldreqh r2, [lr, #2]
	ldreq r1, _0600BBA0 ; =0x00001D46
	cmpeq r2, r1
	moveq r0, #0
	beq _0600BB94
	ldr r3, _0600BB9C ; =0x0000B6B8
	mov ip, #1
	strh ip, [r4, #0xa]
	ldr r2, _0600BBA0 ; =0x00001D46
	strh r3, [lr]
	strh r2, [lr, #2]
	ldr r1, [r0, #8]
	ldr r0, _0600BBA4 ; =0x0380FFF4
	strh r3, [r1, #0xc]
	strh r2, [r1, #0xe]
	ldr r1, [r0]
	mov r0, ip
	add r1, r1, #0x300
	ldrh r2, [r1, #0xfa]
	add r2, r2, #1
	strh r2, [r1, #0xfa]
_0600BB94:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600BB9C: .word 0x0000B6B8
_0600BBA0: .word 0x00001D46
_0600BBA4: .word 0x0380FFF4
	arm_func_end sub_0600BB28

	arm_func_start sub_0600BBA8
sub_0600BBA8: ; 0x0600BBA8
	ldr r0, _0600BBE0 ; =0x04808004
	mov r1, #0
	strh r1, [r0]
	mov r2, #0x10
	add r1, r0, #0x210
	b _0600BBD4
_0600BBC0:
	ldrh r0, [r1]
	cmp r0, #0
	cmpne r0, #9
	bxeq lr
	sub r2, r2, #1
_0600BBD4:
	cmp r2, #0
	bne _0600BBC0
	bx lr
	.align 2, 0
_0600BBE0: .word 0x04808004
	arm_func_end sub_0600BBA8

	arm_func_start sub_0600BBE4
sub_0600BBE4: ; 0x0600BBE4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4]
	cmp r0, #0
	beq _0600BC24
	bl sub_0600BBA8
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	sub r1, r1, #0x10
	bl sub_06012EA8
	ldr r0, _0600BC2C ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0xfc]
	add r1, r1, #1
	strh r1, [r0, #0xfc]
_0600BC24:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600BC2C: .word 0x0380FFF4
	arm_func_end sub_0600BBE4

	arm_func_start sub_0600BC30
sub_0600BC30: ; 0x0600BC30
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0600BD24 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x300
	ldrh r1, [r0, #0x50]
	add r0, r2, #0x2c
	cmp r1, #1
	add r4, r2, #0x344
	add r5, r0, #0x400
	beq _0600BC68
	cmp r1, #2
	beq _0600BC9C
	cmp r1, #3
	b _0600BCD8
_0600BC68:
	add r0, r5, #0x78
	bl sub_0600BB28
	cmp r0, #0
	beq _0600BC80
	bl sub_0600BBA8
	bl sub_06013F98
_0600BC80:
	add r0, r5, #0x28
	bl sub_0600BB28
	cmp r0, #0
	beq _0600BCD8
	add r0, r5, #0x28
	bl sub_0600BBE4
	b _0600BCD8
_0600BC9C:
	add r0, r5, #0x64
	bl sub_0600BB28
	add r0, r5, #0x28
	bl sub_0600BB28
	cmp r0, #0
	beq _0600BCD8
	ldrh r0, [r5, #0x28]
	cmp r0, #0
	beq _0600BCC4
	bl sub_0600BBA8
_0600BCC4:
	ldrh r0, [r4, #0x6a]
	bl sub_06014CE4
	ldrh r0, [r4, #0xb8]
	add r0, r0, #1
	strh r0, [r4, #0xb8]
_0600BCD8:
	add r0, r5, #0x14
	bl sub_0600BB28
	cmp r0, #0
	beq _0600BCF0
	add r0, r5, #0x14
	bl sub_0600BBE4
_0600BCF0:
	mov r0, r5
	bl sub_0600BB28
	cmp r0, #0
	beq _0600BD08
	mov r0, r5
	bl sub_0600BBE4
_0600BD08:
	ldr r1, _0600BD28 ; =0x04808004
	ldrh r0, [r1]
	cmp r0, #0
	moveq r0, #1
	streqh r0, [r1]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600BD24: .word 0x0380FFF4
_0600BD28: .word 0x04808004
	arm_func_end sub_0600BC30

	arm_func_start sub_0600BD2C
sub_0600BD2C: ; 0x0600BD2C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x1000000
	bl sub_06008EF4
	ldr r1, _0600BD6C ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r2, [r1, #0xf4]
	orr r2, r2, r4
	strh r2, [r1, #0xf4]
	bl sub_06008EFC
	mov r0, #2
	mov r1, #0x15
	bl sub_06008F04
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600BD6C: .word 0x0380FFF4
	arm_func_end sub_0600BD2C

	arm_func_start sub_0600BD70
sub_0600BD70: ; 0x0600BD70
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0600BDE8 ; =0x0380FFF4
	ldr r1, [r0]
	add r4, r1, #0x344
	ldrh r0, [r4, #0xb0]
	cmp r0, #0
	beq _0600BDE0
	add r0, r1, #0x188
	mov r1, #0x12
	bl sub_060090A8
	movs r5, r0
	beq _0600BDE0
	ldr r1, _0600BDEC ; =0x00000186
	mov r0, #1
	strh r1, [r5, #0xc]
	strh r0, [r5, #0xe]
	mov r0, #0x1000000
	bl sub_06008EF4
	ldrh r2, [r4, #0xb0]
	mov r1, #0
	strh r2, [r5, #0x10]
	strh r1, [r4, #0xb0]
	bl sub_06008EFC
	ldr r0, _0600BDE8 ; =0x0380FFF4
	mov r1, r5
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_0600F388
_0600BDE0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600BDE8: .word 0x0380FFF4
_0600BDEC: .word 0x00000186
	arm_func_end sub_0600BD70

	arm_func_start sub_0600BDF0
sub_0600BDF0: ; 0x0600BDF0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0600BE88 ; =0x0380FFF4
	ldr r0, [r2]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3e]
	orr r1, r1, #0x8000
	strh r1, [r0, #0x3e]
	ldr r0, [r2]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0
	beq _0600BE5C
	bl sub_0600B1D4
	ldr r2, _0600BE88 ; =0x0380FFF4
	ldr r0, [r2]
	add r0, r0, #0x400
	ldrh r1, [r0, #4]
	cmp r1, #0
	beq _0600BE58
	mov r1, #0
	strh r1, [r0, #4]
	ldr r0, [r2]
	mov r1, #6
	ldr r0, [r0, #0x420]
	strh r1, [r0, #4]
	bl sub_060108A0
_0600BE58:
	bl sub_0600A498
_0600BE5C:
	ldr r4, _0600BE8C ; =0x0000FFFF
	mov r5, #3
_0600BE64:
	mov r0, r5
	bl sub_06008FBC
	cmp r0, r4
	bne _0600BE64
	mov r0, #3
	mov r1, #0x17
	bl sub_06008F04
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600BE88: .word 0x0380FFF4
_0600BE8C: .word 0x0000FFFF
	arm_func_end sub_0600BDF0

	arm_func_start sub_0600BE90
sub_0600BE90: ; 0x0600BE90
	stmdb sp!, {r4, lr}
	ldr r0, _0600BEDC ; =0x0380FFF4
	ldr r4, [r0]
	bl sub_0600D9F4
	ldr r1, _0600BEDC ; =0x0380FFF4
	add r0, r4, #0x188
	ldr r1, [r1]
	ldr r1, [r1, #0x318]
	sub r1, r1, #0xc
	bl sub_06009144
	ldr r1, _0600BEDC ; =0x0380FFF4
	add r0, r4, #0x188
	ldr r1, [r1]
	ldr r1, [r1, #0x3e0]
	sub r1, r1, #0xc
	bl sub_06009144
	bl sub_06001AEC
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600BEDC: .word 0x0380FFF4
	arm_func_end sub_0600BE90

	arm_func_start sub_0600BEE0
sub_0600BEE0: ; 0x0600BEE0
	stmdb sp!, {r4, r5, r6, lr}
	mov ip, #0
	ldr r0, _0600C074 ; =0x06018580
	ldr r6, _0600C078 ; =0x06018510
	mov r3, ip
	mov r1, ip
	b _0600BF54
_0600BEFC:
	mov r4, r3, lsl #1
	ldrh r5, [r6, r4]
	mov r2, r1
	b _0600BF48
_0600BF0C:
	mov lr, r2, lsl #2
	add r4, r0, r2, lsl #2
	ldrh lr, [r0, lr]
	ldrh r4, [r4, #2]
	add lr, lr, #0x4800000
	and r4, r5, r4
	add lr, lr, #0x8000
	strh r4, [lr]
	ldrh lr, [lr]
	cmp lr, r4
	beq _0600BF44
	cmp ip, #0x20
	add ip, ip, #1
	bhi _0600C04C
_0600BF44:
	add r2, r2, #1
_0600BF48:
	cmp r2, #0x1b
	blo _0600BF0C
	add r3, r3, #1
_0600BF54:
	cmp r3, #3
	blo _0600BEFC
	ldr r4, _0600C07C ; =0x00001234
	ldr r3, _0600C074 ; =0x06018580
	mov r5, #0
_0600BF68:
	mov r0, r5, lsl #2
	add r1, r3, r5, lsl #2
	ldrh r0, [r3, r0]
	ldrh r2, [r1, #2]
	add r1, r4, #0x234
	add r0, r0, #0x4800000
	add r1, r1, #0x1000
	add r5, r5, #1
	and r2, r4, r2
	add r0, r0, #0x8000
	mov r1, r1, lsl #0x10
	strh r2, [r0]
	cmp r5, #0x1b
	mov r4, r1, lsr #0x10
	blo _0600BF68
	ldr r5, _0600C07C ; =0x00001234
	ldr r3, _0600C074 ; =0x06018580
	mov r4, #0
	b _0600BFFC
_0600BFB4:
	mov r0, r4, lsl #2
	ldrh r0, [r3, r0]
	add r1, r3, r4, lsl #2
	add r0, r0, #0x4800000
	add r0, r0, #0x8000
	ldrh r1, [r1, #2]
	ldrh r2, [r0]
	and r0, r5, r1
	cmp r2, r0
	beq _0600BFE8
	cmp ip, #0x20
	add ip, ip, #1
	bhi _0600C04C
_0600BFE8:
	add r0, r5, #0x234
	add r0, r0, #0x1000
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
	add r4, r4, #1
_0600BFFC:
	cmp r4, #0x1b
	blo _0600BFB4
	mov r3, #0
	ldr r2, _0600C074 ; =0x06018580
	mov r1, r3
	b _0600C044
_0600C014:
	mov r0, r3, lsl #2
	ldrh r0, [r2, r0]
	add r0, r0, #0x4800000
	add r0, r0, #0x8000
	strh r1, [r0]
	ldrh r0, [r0]
	cmp r0, #0
	beq _0600C040
	cmp ip, #0x20
	add ip, ip, #1
	bhi _0600C04C
_0600C040:
	add r3, r3, #1
_0600C044:
	cmp r3, #0x1b
	blo _0600C014
_0600C04C:
	cmp ip, #0
	beq _0600C06C
	ldr r0, _0600C080 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3e]
	orr r1, r1, #1
	strh r1, [r0, #0x3e]
_0600C06C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0600C074: .word 0x06018580
_0600C078: .word 0x06018510
_0600C07C: .word 0x00001234
_0600C080: .word 0x0380FFF4
	arm_func_end sub_0600BEE0

	arm_func_start sub_0600C084
sub_0600C084: ; 0x0600C084
	stmdb sp!, {r3, lr}
	ldr lr, _0600C1FC ; =0x04804000
	mov r0, #0
	ldr r3, _0600C200 ; =0x0000FFFF
	mov r2, r0
_0600C098:
	sub r1, r3, #1
	mov ip, r3
	mov r1, r1, lsl #0x10
	add r2, r2, #2
	cmp r2, #0x2000
	mov r3, r1, lsr #0x10
	strh ip, [lr], #2
	blo _0600C098
	ldr r2, _0600C1FC ; =0x04804000
	ldr r3, _0600C200 ; =0x0000FFFF
	mov ip, #0
	b _0600C0F4
_0600C0C8:
	ldrh r1, [r2]
	cmp r1, r3
	beq _0600C0E0
	cmp r0, #0x20
	add r0, r0, #1
	bhi _0600C1D4
_0600C0E0:
	sub r1, r3, #1
	mov r1, r1, lsl #0x10
	add ip, ip, #2
	add r2, r2, #2
	mov r3, r1, lsr #0x10
_0600C0F4:
	cmp ip, #0x2000
	blo _0600C0C8
	ldr r2, _0600C1FC ; =0x04804000
	ldr r3, _0600C204 ; =0x00005A5A
	mov ip, #0
_0600C108:
	mvn r1, r3
	add ip, ip, #2
	mov r1, r1, lsl #0x10
	strh r3, [r2], #2
	cmp ip, #0x2000
	mov r3, r1, lsr #0x10
	blo _0600C108
	ldr r2, _0600C1FC ; =0x04804000
	ldr r3, _0600C204 ; =0x00005A5A
	mov ip, #0
	b _0600C160
_0600C134:
	ldrh r1, [r2]
	cmp r1, r3
	beq _0600C14C
	cmp r0, #0x20
	add r0, r0, #1
	bhi _0600C1D4
_0600C14C:
	mvn r1, r3
	mov r1, r1, lsl #0x10
	add ip, ip, #2
	add r2, r2, #2
	mov r3, r1, lsr #0x10
_0600C160:
	cmp ip, #0x2000
	blo _0600C134
	ldr r2, _0600C1FC ; =0x04804000
	ldr r3, _0600C208 ; =0x0000A5A5
	mov ip, #0
_0600C174:
	mvn r1, r3
	add ip, ip, #2
	mov r1, r1, lsl #0x10
	strh r3, [r2], #2
	cmp ip, #0x2000
	mov r3, r1, lsr #0x10
	blo _0600C174
	ldr r2, _0600C1FC ; =0x04804000
	ldr r3, _0600C208 ; =0x0000A5A5
	mov ip, #0
	b _0600C1CC
_0600C1A0:
	ldrh r1, [r2]
	cmp r1, r3
	beq _0600C1B8
	cmp r0, #0x20
	add r0, r0, #1
	bhi _0600C1D4
_0600C1B8:
	mvn r1, r3
	mov r1, r1, lsl #0x10
	add ip, ip, #2
	add r2, r2, #2
	mov r3, r1, lsr #0x10
_0600C1CC:
	cmp ip, #0x2000
	blo _0600C1A0
_0600C1D4:
	cmp r0, #0
	beq _0600C1F4
	ldr r0, _0600C20C ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3e]
	orr r1, r1, #2
	strh r1, [r0, #0x3e]
_0600C1F4:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600C1FC: .word 0x04804000
_0600C200: .word 0x0000FFFF
_0600C204: .word 0x00005A5A
_0600C208: .word 0x0000A5A5
_0600C20C: .word 0x0380FFF4
	arm_func_end sub_0600C084

	arm_func_start sub_0600C210
sub_0600C210: ; 0x0600C210
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _0600C4E4 ; =0x0380FFF4
	mov r7, #0
	ldr r0, [r0]
	mov r6, #0
	add r0, r0, #0x500
	ldrh r0, [r0, #0xf8]
	mov r5, #0xff
	cmp r0, #5
	ldreq sl, _0600C4E8 ; =0x06018516
	mvn r4, #0
	ldrne sl, _0600C4EC ; =0x06018548
	b _0600C260
_0600C244:
	mov r0, r6
	mov r1, r5
	bl sub_0600B2A0
	cmp r0, r4
	moveq r7, #1
	beq _0600C4BC
	add r6, r6, #1
_0600C260:
	cmp r6, #0x69
	blo _0600C244
	mov r5, #0
	mov r4, r5
	b _0600C2B0
_0600C274:
	mov r0, r4, lsl #1
	ldrh r0, [sl, r0]
	cmp r5, r0
	addeq r4, r4, #1
	beq _0600C2AC
	mov r0, r5
	bl sub_0600B274
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #0xff
	beq _0600C2AC
	cmp r7, #0x20
	add r7, r7, #1
	bhi _0600C4BC
_0600C2AC:
	add r5, r5, #1
_0600C2B0:
	cmp r5, #0x69
	blo _0600C274
	mov r5, #0
	mov r4, r5
_0600C2C0:
	mov r0, r5
	mov r1, r4
	bl sub_0600B2A0
	add r5, r5, #1
	cmp r5, #0x69
	blo _0600C2C0
	mov r4, #0
	mov r5, r4
	b _0600C31C
_0600C2E4:
	mov r0, r5, lsl #1
	ldrh r0, [sl, r0]
	cmp r4, r0
	addeq r5, r5, #1
	beq _0600C318
	mov r0, r4
	bl sub_0600B274
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	beq _0600C318
	cmp r7, #0x20
	add r7, r7, #1
	bhi _0600C4BC
_0600C318:
	add r4, r4, #1
_0600C31C:
	cmp r4, #0x69
	blo _0600C2E4
	mov r4, #0x55
	mov r5, #0
_0600C32C:
	mov r0, r5
	mov r1, r4
	bl sub_0600B2A0
	mvn r0, r4
	add r5, r5, #1
	mov r0, r0, lsl #0x10
	cmp r5, #0x69
	mov r4, r0, lsr #0x10
	blo _0600C32C
	mov r4, #0
	mov r6, r4
	mov r5, #0x55
	b _0600C3A4
_0600C360:
	mov r0, r6, lsl #1
	ldrh r0, [sl, r0]
	cmp r4, r0
	addeq r6, r6, #1
	beq _0600C398
	mov r0, r4
	bl sub_0600B274
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, r5
	beq _0600C398
	cmp r7, #0x20
	add r7, r7, #1
	bhi _0600C4BC
_0600C398:
	mvn r0, r5
	and r5, r0, #0xff
	add r4, r4, #1
_0600C3A4:
	cmp r4, #0x69
	blo _0600C360
	mov r5, #0xff
	mov r4, #0
_0600C3B4:
	mov r0, r4
	mov r1, r5
	bl sub_0600B2A0
	sub r0, r5, #1
	add r4, r4, #1
	mov r0, r0, lsl #0x10
	cmp r4, #0x69
	mov r5, r0, lsr #0x10
	blo _0600C3B4
	mov r4, #0
	mov r6, r4
	mov r5, #0xff
	b _0600C430
_0600C3E8:
	mov r0, r6, lsl #1
	ldrh r0, [sl, r0]
	cmp r4, r0
	addeq r6, r6, #1
	beq _0600C420
	mov r0, r4
	bl sub_0600B274
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, r5
	beq _0600C420
	cmp r7, #0x20
	add r7, r7, #1
	bhi _0600C4BC
_0600C420:
	sub r0, r5, #1
	mov r0, r0, lsl #0x10
	add r4, r4, #1
	mov r5, r0, lsr #0x10
_0600C430:
	cmp r4, #0x69
	blo _0600C3E8
	mov r8, #0
	mov sb, r8
	mov r4, #1
	mov fp, r8
	b _0600C4B4
_0600C44C:
	mov r0, sb, lsl #1
	ldrh r0, [sl, r0]
	cmp r8, r0
	addeq sb, sb, #1
	beq _0600C4B0
	mov r6, r4
	mov r5, fp
	b _0600C4A8
_0600C46C:
	mov r0, r8
	mov r1, r6
	bl sub_0600B2A0
	mov r0, r8
	bl sub_0600B274
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, r6
	beq _0600C49C
	cmp r7, #0x20
	add r7, r7, #1
	bhi _0600C4BC
_0600C49C:
	mov r0, r6, lsl #1
	and r6, r0, #0xff
	add r5, r5, #1
_0600C4A8:
	cmp r5, #9
	blo _0600C46C
_0600C4B0:
	add r8, r8, #1
_0600C4B4:
	cmp r8, #0x69
	blo _0600C44C
_0600C4BC:
	cmp r7, #0
	beq _0600C4DC
	ldr r0, _0600C4E4 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3e]
	orr r1, r1, #8
	strh r1, [r0, #0x3e]
_0600C4DC:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0600C4E4: .word 0x0380FFF4
_0600C4E8: .word 0x06018516
_0600C4EC: .word 0x06018548
	arm_func_end sub_0600C210

	arm_func_start sub_0600C4F0
sub_0600C4F0: ; 0x0600C4F0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _0600C5BC ; =0x04808010
	mov r4, #1
_0600C4FC:
	ldrh r1, [r5]
	ldrh r0, [r5, #2]
	ands r6, r1, r0
	beq _0600C5A4
	tst r6, #0x80
	beq _0600C518
	bl sub_0600D444
_0600C518:
	tst r6, #0x40
	beq _0600C524
	bl sub_0600D550
_0600C524:
	tst r6, #0x8000
	beq _0600C530
	bl sub_0600C5C4
_0600C530:
	tst r6, #0x4000
	beq _0600C53C
	bl sub_0600C650
_0600C53C:
	tst r6, #0x2000
	beq _0600C548
	bl sub_0600C8F4
_0600C548:
	tst r6, #0x800
	beq _0600C554
	bl sub_0600C960
_0600C554:
	tst r6, #8
	beq _0600C560
	bl sub_0600C9A4
_0600C560:
	tst r6, #4
	beq _0600C56C
	bl sub_0600CAB4
_0600C56C:
	tst r6, #1
	beq _0600C578
	bl sub_0600CE98
_0600C578:
	tst r6, #0x30
	beq _0600C584
	bl sub_0600C974
_0600C584:
	tst r6, #2
	beq _0600C590
	bl sub_0600CC30
_0600C590:
	tst r6, #0x1000
	beq _0600C4FC
	mov r0, r4
	bl sub_0600D354
	b _0600C4FC
_0600C5A4:
	ldr r1, _0600C5C0 ; =0x0380FFF8
	ldr r0, [r1]
	orr r0, r0, #0x1000000
	str r0, [r1]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0600C5BC: .word 0x04808010
_0600C5C0: .word 0x0380FFF8
	arm_func_end sub_0600C4F0

	arm_func_start sub_0600C5C4
sub_0600C5C4: ; 0x0600C5C4
	stmdb sp!, {r4, lr}
	ldr r1, _0600C648 ; =0x0380FFF4
	ldr r0, _0600C64C ; =0x04808010
	ldr r2, [r1]
	mov r1, #0x8000
	strh r1, [r0]
	add r4, r2, #0x344
	ldrh r0, [r4, #8]
	cmp r0, #0x40
	bne _0600C638
	ldrh r0, [r4, #0x7e]
	cmp r0, #0
	beq _0600C638
	ldrh r1, [r4, #0x72]
	ldrh r0, [r4, #0x70]
	cmp r1, r0
	bne _0600C638
	ldrh r0, [r4, #0x80]
	add r0, r0, #1
	strh r0, [r4, #0x80]
	ldrh r1, [r4, #0x80]
	ldrh r0, [r4, #0x7e]
	cmp r1, r0
	bls _0600C638
	mov r2, #0
	mov r0, #1
	mov r1, #0xd
	strh r2, [r4, #0x80]
	bl sub_06008F04
_0600C638:
	mov r0, #1
	strh r0, [r4, #0x10]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600C648: .word 0x0380FFF4
_0600C64C: .word 0x04808010
	arm_func_end sub_0600C5C4

	arm_func_start sub_0600C650
sub_0600C650: ; 0x0600C650
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r6, _0600C8D4 ; =0x0380FFF4
	ldr r2, _0600C8D8 ; =0x04808010
	ldr r3, [r6]
	mov r0, #0x4000
	strh r0, [r2]
	add r4, r3, #0x344
	ldrh r1, [r4, #0xc]
	add r0, r3, #0x2c
	cmp r1, #1
	add r5, r3, #0x31c
	add r7, r0, #0x400
	beq _0600C698
	cmp r1, #2
	beq _0600C74C
	cmp r1, #3
	beq _0600C790
	b _0600C8CC
_0600C698:
	ldr r1, [r7, #0x80]
	ldrh r6, [r6, #-4]
	ldrh r0, [r4, #0x96]
	add r1, r1, #0x24
	add r8, r1, r0
	add r0, r8, #8
	and r1, r6, #0xff
	bl sub_0600B9E4
	mov r1, r6, lsr #8
	add r0, r8, #9
	and r1, r1, #0xff
	bl sub_0600B9E4
	ldrh r0, [r4, #0xe]
	cmp r0, #1
	bne _0600C6EC
	ldr r1, _0600C8DC ; =0x04808134
	ldrh r2, [r5, #0x20]
	ldrh r0, [r1]
	add r0, r2, r0
	add r0, r0, #1
	strh r0, [r1]
_0600C6EC:
	ldr r0, _0600C8D4 ; =0x0380FFF4
	ldr r1, _0600C8E0 ; =0x048080B6
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r3, [r0, #0x2e]
	ldrh r2, [r0, #0x32]
	mvn r3, r3
	orr r2, r3, r2
	strh r2, [r0, #0x30]
	ldrh r0, [r1]
	tst r0, #0x18
	bne _0600C728
	and r0, r0, #6
	cmp r0, #2
	bne _0600C73C
_0600C728:
	ldr r0, [r7, #0x8c]
	bic r0, r0, #2
	str r0, [r7, #0x8c]
	bl sub_0600D7C0
	b _0600C8CC
_0600C73C:
	ldr r0, [r7, #0x8c]
	orr r0, r0, #2
	str r0, [r7, #0x8c]
	b _0600C8CC
_0600C74C:
	ldrh r0, [r4, #0x12]
	cmp r0, #0
	ldreq r1, _0600C8E4 ; =0x0000FFFF
	addeq r0, r2, #0x124
	streqh r1, [r0]
	beq _0600C77C
	add r1, r2, #0x124
	ldrh r2, [r5, #0x20]
	ldrh r0, [r1]
	add r0, r2, r0
	add r0, r0, #1
	strh r0, [r1]
_0600C77C:
	ldrh r0, [r4, #0x1a]
	cmp r0, #2
	bne _0600C790
	mov r0, #2
	bl sub_0600A458
_0600C790:
	ldrh r0, [r4, #8]
	cmp r0, #0x40
	movne r1, #1
	bne _0600C7DC
	ldrh r0, [r4, #0x72]
	mov r1, #0
	cmp r0, #1
	ldrh r0, [r4, #0x14]
	moveq r1, #1
	cmp r0, #0
	beq _0600C7DC
	ldrh r0, [r4, #0x76]
	cmp r0, #1
	beq _0600C7D8
	cmp r0, #0
	ldreqh r0, [r4, #0x74]
	cmpeq r0, #1
	bne _0600C7DC
_0600C7D8:
	mov r1, #1
_0600C7DC:
	cmp r1, #0
	ldr r1, _0600C8E8 ; =0x04808038
	ldrneh r0, [r1]
	orrne r0, r0, #1
	strneh r0, [r1]
	ldreqh r0, [r1]
	biceq r0, r0, #1
	streqh r0, [r1]
	ldr r1, _0600C8EC ; =0x04808118
	mov r8, #0
	ldrh r0, [r1]
	mov r6, #2
	cmp r0, #0xa
	movhi r0, #0
	strhih r0, [r1, #-0xd0]
	ldrh r0, [r4, #0x72]
	mov r5, r8
	sub r0, r0, #1
	strh r0, [r4, #0x72]
	ldrh r0, [r4, #0x72]
	mov sl, #0x14
	cmp r0, #0
	ldreqh r0, [r4, #0x70]
	streqh r0, [r4, #0x72]
	ldrh r1, [r4, #0x76]
	sub r0, r1, #1
	strh r0, [r4, #0x76]
	cmp r1, #0
	ldreqh r0, [r4, #0x74]
	subeq r0, r0, #1
	streqh r0, [r4, #0x76]
	mov r4, #0xe
_0600C85C:
	mul r1, r8, sl
	ldrh r0, [r7, r1]
	add sb, r7, r1
	cmp r0, #0
	beq _0600C8B4
	ldr r0, [sb, #0xc]
	ldrh r1, [r0, #8]
	cmp r1, #0
	bne _0600C8B4
	bl sub_06013010
	cmp r0, #0
	beq _0600C8B4
	mov r0, r8
	bl sub_06013A68
	ldr r1, [sb, #8]
	mov r0, r5
	strh r6, [r1]
	mov r1, r4
	bl sub_06008F04
	ldrh r0, [r7, #0xae]
	add r0, r0, #1
	strh r0, [r7, #0xae]
_0600C8B4:
	add r8, r8, #1
	cmp r8, #2
	blo _0600C85C
	ldr r0, _0600C8F0 ; =0x048080AE
	mov r1, #0xd
	strh r1, [r0]
_0600C8CC:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0600C8D4: .word 0x0380FFF4
_0600C8D8: .word 0x04808010
_0600C8DC: .word 0x04808134
_0600C8E0: .word 0x048080B6
_0600C8E4: .word 0x0000FFFF
_0600C8E8: .word 0x04808038
_0600C8EC: .word 0x04808118
_0600C8F0: .word 0x048080AE
	arm_func_end sub_0600C650

	arm_func_start sub_0600C8F4
sub_0600C8F4: ; 0x0600C8F4
	ldr r0, _0600C958 ; =0x0380FFF4
	ldr r1, _0600C95C ; =0x04808010
	ldr r2, [r0]
	mov r0, #0x2000
	strh r0, [r1]
	mov r0, #0xd
	add r2, r2, #0x344
	strh r0, [r1, #0x9c]
	ldrh r0, [r2, #0x1a]
	cmp r0, #1
	moveq r0, #2
	streqh r0, [r2, #0x1a]
	bxeq lr
	cmp r0, #2
	moveq r0, #0
	streqh r0, [r2, #0x1a]
	bxeq lr
	ldrh r0, [r2, #0xc]
	cmp r0, #2
	bxne lr
	ldrh r0, [r2, #8]
	cmp r0, #0x40
	movne r0, #0
	strneh r0, [r1, #0x38]
	bx lr
	.align 2, 0
_0600C958: .word 0x0380FFF4
_0600C95C: .word 0x04808010
	arm_func_end sub_0600C8F4

	arm_func_start sub_0600C960
sub_0600C960: ; 0x0600C960
	ldr r0, _0600C970 ; =0x04808010
	mov r1, #0x800
	strh r1, [r0]
	bx lr
	.align 2, 0
_0600C970: .word 0x04808010
	arm_func_end sub_0600C960

	arm_func_start sub_0600C974
sub_0600C974: ; 0x0600C974
	stmdb sp!, {r3, lr}
	bl sub_0600A9FC
	ldr r1, _0600C99C ; =0x048081AC
	ldr r2, _0600C9A0 ; =0x0000FFFF
	sub r0, r1, #0x19c
	strh r2, [r1]
	mov r1, #0x30
	strh r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600C99C: .word 0x048081AC
_0600C9A0: .word 0x0000FFFF
	arm_func_end sub_0600C974

	arm_func_start sub_0600C9A4
sub_0600C9A4: ; 0x0600C9A4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _0600CAA8 ; =0x04808010
	mov r2, #8
	ldr r0, _0600CAAC ; =0x0380FFF4
	strh r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x3a]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _0600C9EC
	add r0, r1, #0x18c
	ldrh r0, [r0]
	tst r0, #1
	addeq r1, r1, #0x280
	ldreqh r0, [r1]
	eoreq r0, r0, #1
	streqh r0, [r1]
_0600C9EC:
	ldr r0, _0600CAAC ; =0x0380FFF4
	ldr r1, [r0]
	add r0, r1, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #8
	beq _0600CAA0
	ldr r4, _0600CAB0 ; =0x04808032
	add r0, r1, #0x2c
	mov r2, #0
	add r1, r1, #0x344
	add r3, r0, #0x400
	mov r5, r2
	mov lr, #0x8000
	mov ip, #0x14
_0600CA24:
	mul r6, r2, ip
	ldrh r0, [r3, r6]
	add r6, r3, r6
	cmp r0, #0
	beq _0600CA94
	ldr r0, [r6, #8]
	ldrh r6, [r0, #0xc]
	tst r6, #0x4000
	beq _0600CA94
	ldrh r6, [r0, #4]
	tst r6, #0xff
	beq _0600CA94
	ldrh r6, [r0, #0xa]
	add r7, r0, #0xc
	add r6, r7, r6
	sub r6, r6, #7
	bic r7, r6, #1
	ldrh r6, [r7]
	cmp r6, #0
	ldreqh r6, [r7, #2]
	cmpeq r6, #0
	bne _0600CA94
	strh r5, [r0, #4]
	strh r5, [r4]
	strh lr, [r4]
	ldrh r0, [r1, #0xba]
	add r0, r0, #1
	strh r0, [r1, #0xba]
_0600CA94:
	add r2, r2, #1
	cmp r2, #3
	blo _0600CA24
_0600CAA0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0600CAA8: .word 0x04808010
_0600CAAC: .word 0x0380FFF4
_0600CAB0: .word 0x04808032
	arm_func_end sub_0600C9A4

	arm_func_start sub_0600CAB4
sub_0600CAB4: ; 0x0600CAB4
	stmdb sp!, {r3, lr}
	ldr r1, _0600CC14 ; =0x0380FFF4
	ldr ip, _0600CC18 ; =0x04808010
	ldr r2, [r1]
	mov r0, #4
	strh r0, [ip]
	ldr r0, [r1]
	add r1, ip, #0x198
	add r0, r0, #0x600
	ldrh r3, [r0, #0x90]
	add r0, r2, #0xdc
	add r2, r2, #0x2c
	ldrh r1, [r1]
	tst r3, #8
	add r0, r0, #0x400
	add r3, r2, #0x400
	beq _0600CBA4
	tst r1, #0x400
	beq _0600CBA4
	ldrh ip, [ip, #0xa0]
	tst ip, #1
	ldrneh r2, [r3]
	cmpne r2, #0
	bne _0600CB60
	tst ip, #4
	ldrneh r2, [r3, #0x14]
	cmpne r2, #0
	bne _0600CB60
	tst ip, #8
	ldrneh r2, [r3, #0x28]
	cmpne r2, #0
	bne _0600CB60
	ldr r2, _0600CC1C ; =0x0480819C
	ldrh r2, [r2]
	tst r2, #1
	bne _0600CB60
	ldr r3, _0600CC20 ; =0x04808032
	mov ip, #0
	strh ip, [r3]
	mov r2, #0x8000
	strh r2, [r3]
	strh ip, [r0, #2]
	b _0600CBA4
_0600CB60:
	ldrh r3, [r0, #2]
	add r2, r3, #1
	strh r2, [r0, #2]
	cmp r3, #0xc
	bls _0600CBA4
	ldr r3, _0600CC20 ; =0x04808032
	mov r2, #0
	strh r2, [r0, #2]
	strh r2, [r3]
	mov r2, #0x8000
	ldr r0, _0600CC14 ; =0x0380FFF4
	strh r2, [r3]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r2, [r0, #0xfe]
	add r2, r2, #1
	strh r2, [r0, #0xfe]
_0600CBA4:
	ldr r0, _0600CC14 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #1
	beq _0600CC0C
	tst r1, #0x60
	beq _0600CC0C
	ldr r2, _0600CC24 ; =0x04808054
	ldrh r1, [r2]
	ldrh r0, [r2, #-2]
	sub r0, r0, #0x4000
	add r0, r0, r0, lsr #31
	cmp r1, r0, asr #1
	bge _0600CBF4
	ldrh r0, [r2, #-4]
	sub r0, r0, #0x4000
	add r0, r0, r0, lsr #31
	cmp r1, r0, asr #1
	bge _0600CC08
_0600CBF4:
	ldr r2, _0600CC28 ; =0x0480805A
	ldr r0, _0600CC2C ; =0x00008001
	ldrh r1, [r2]
	strh r1, [r2, #-4]
	strh r0, [r2, #-0x2a]
_0600CC08:
	bl sub_0600BC30
_0600CC0C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600CC14: .word 0x0380FFF4
_0600CC18: .word 0x04808010
_0600CC1C: .word 0x0480819C
_0600CC20: .word 0x04808032
_0600CC24: .word 0x04808054
_0600CC28: .word 0x0480805A
_0600CC2C: .word 0x00008001
	arm_func_end sub_0600CAB4

	arm_func_start sub_0600CC30
sub_0600CC30: ; 0x0600CC30
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _0600CE78 ; =0x0380FFF4
	ldr r0, _0600CE7C ; =0x04808010
	ldr r2, [r3]
	mov r1, #2
	strh r1, [r0]
	ldr r3, [r3]
	add r2, r2, #0x2c
	add r3, r3, #0x300
	ldrh r3, [r3, #0x4c]
	add r4, r2, #0x400
	cmp r3, #0x12
	bne _0600CC6C
	bl sub_06012254
	b _0600CE70
_0600CC6C:
	ldrh r2, [r0, #0xa8]
	and r5, r2, #0xf00
	cmp r5, #0x300
	beq _0600CC90
	cmp r5, #0x800
	beq _0600CCC4
	cmp r5, #0xb00
	beq _0600CD00
	b _0600CDFC
_0600CC90:
	ldr r0, [r4, #0x8c]
	tst r0, #2
	beq _0600CCA0
	bl sub_0600D7C0
_0600CCA0:
	ldr r1, _0600CE78 ; =0x0380FFF4
	mov r0, #0
	ldr r3, [r1]
	mov r1, #8
	ldr r2, [r3, #0x558]
	add r2, r2, #1
	str r2, [r3, #0x558]
	bl sub_06008F04
	b _0600CDFC
_0600CCC4:
	ldr r2, [r4, #0x44]
	ldrh r3, [r4, #0x9e]
	ldrh r2, [r2, #4]
	and r2, r2, #0xff
	mov r2, r2, lsl #0x10
	cmp r3, r2, lsr #16
	strlsh r1, [r0, #0x9c]
	ldrlsh r0, [r4, #0xa8]
	addls r0, r0, #1
	strlsh r0, [r4, #0xa8]
	ldr r1, [r4, #0x90]
	ldrh r0, [r1, #0x18]
	add r0, r0, #1
	strh r0, [r1, #0x18]
	b _0600CDFC
_0600CD00:
	ldr r3, _0600CE80 ; =0x0000FFFF
	ldr r2, _0600CE84 ; =0x04805F70
	ldr r1, _0600CE88 ; =0x0480824E
	strh r3, [r2]
	strh r3, [r2, #2]
	add r0, r0, #0x23c
	strh r3, [r0]
	strh r3, [r1]
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _0600CD58
	ldr r1, [r4, #0x44]
	ldrh r0, [r1, #0x22]
	cmp r0, r3
	bne _0600CD58
	ldrh r0, [r1, #4]
	cmp r0, #0
	movne r0, #0
	strneh r0, [r1, #4]
	ldrneh r1, [r4, #0x98]
	ldrne r0, [r4, #0x44]
	strneh r1, [r0, #2]
_0600CD58:
	ldr r0, [r4, #0x44]
	ldr r2, [r4, #0x90]
	ldrh r1, [r0, #2]
	ldrh r0, [r4, #0x98]
	cmp r1, #1
	add r2, r2, #0x1a
	bls _0600CDA8
	ldr r3, _0600CE78 ; =0x0380FFF4
	ldr r3, [r3]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x3a]
	mov r3, r3, lsl #0x1b
	movs r3, r3, lsr #0x1f
	beq _0600CDA8
	ldr ip, _0600CE8C ; =0x0480819C
	ldrh r3, [ip]
	tst r3, #1
	ldreqh r3, [ip, #0xf4]
	eoreq r3, r3, #1
	streqh r3, [ip, #0xf4]
_0600CDA8:
	ldr r3, _0600CE78 ; =0x0380FFF4
	ldr r3, [r3]
	add r3, r3, #0x600
	ldrh r3, [r3, #0x90]
	tst r3, #0x40
	beq _0600CDFC
	b _0600CDF4
_0600CDC4:
	mov r1, r1, lsl #0xf
	mov r1, r1, lsr #0x10
	tst r1, #1
	ldrneh r3, [r2, #6]
	mov r0, r0, lsl #0xf
	addne r3, r3, #1
	mov r0, r0, lsr #0x10
	strneh r3, [r2, #6]
	tst r0, #1
	ldrne r3, [r4, #0x90]
	ldrneh r3, [r3, #0x16]
	addne r2, r2, r3
_0600CDF4:
	cmp r1, #1
	bhi _0600CDC4
_0600CDFC:
	cmp r5, #0x800
	beq _0600CE64
	ldr r2, _0600CE90 ; =0x048080B0
	ldrh r0, [r2]
	tst r0, #2
	bne _0600CE64
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _0600CE58
	mov r0, #2
	strh r0, [r2, #4]
	mov r1, #0
	strh r1, [r2, #-0x68]
	ldrh r1, [r2, #-0xa0]
	tst r1, #0x1000
	ldrneh r0, [r4, #0xac]
	addne r0, r0, #1
	strneh r0, [r4, #0xac]
	bne _0600CE4C
	bl sub_0600D354
_0600CE4C:
	ldrh r0, [r4, #0xaa]
	add r0, r0, #1
	strh r0, [r4, #0xaa]
_0600CE58:
	ldr r0, _0600CE94 ; =0x048080AE
	mov r1, #2
	strh r1, [r0]
_0600CE64:
	mov r0, #0
	mov r1, #0xe
	bl sub_06008F04
_0600CE70:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600CE78: .word 0x0380FFF4
_0600CE7C: .word 0x04808010
_0600CE80: .word 0x0000FFFF
_0600CE84: .word 0x04805F70
_0600CE88: .word 0x0480824E
_0600CE8C: .word 0x0480819C
_0600CE90: .word 0x048080B0
_0600CE94: .word 0x048080AE
	arm_func_end sub_0600CC30

	arm_func_start sub_0600CE98
sub_0600CE98: ; 0x0600CE98
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x38
	ldr r0, _0600D328 ; =0x0380FFF4
	ldr r2, _0600D32C ; =0x04808010
	ldr r3, [r0]
	mov r1, #1
	add r0, r3, #0x600
	ldrh r4, [r0, #0x90]
	add r6, r3, #0x344
	strh r1, [r2]
	ldrh r1, [r6, #0xc]
	add r0, r3, #0xdc
	cmp r1, #0
	add r7, r0, #0x400
	ldreqh r0, [r2, #0x44]
	and r4, r4, #1
	streqh r0, [r2, #0x4a]
	ldr r0, _0600D330 ; =0x04808098
	sub fp, r0, #0x70
	add r0, r0, #0x1b4
	str r0, [sp, #0x24]
	ldr r0, _0600D334 ; =0x0480824E
	sub r0, r0, #0x154
	str r0, [sp, #0x14]
	ldr r0, _0600D330 ; =0x04808098
	sub r0, r0, #0x44
	str r0, [sp, #0x10]
	ldr r0, _0600D338 ; =0x000008EF
	sub r0, r0, #0x29
	str r0, [sp, #0x28]
	ldr r0, _0600D338 ; =0x000008EF
	add r0, r0, #0x3d
	str r0, [sp, #0x2c]
	ldr r0, _0600D33C ; =0x04805F7E
	sub r0, r0, #0x24
	str r0, [sp, #0x30]
	ldr r0, _0600D338 ; =0x000008EF
	add r0, r0, #0x710
	str r0, [sp, #0x34]
_0600CF34:
	ldr r0, [sp, #0x10]
	ldrh sb, [r7, #4]
	ldrh sl, [r0]
	cmp sb, sl
	beq _0600D2A8
	ldr r0, _0600D330 ; =0x04808098
	ldr r1, [sp, #0x14]
	ldrh r0, [r0, #0x60]
	ldrh r3, [r1]
	ldr r1, _0600D330 ; =0x04808098
	ldrh r2, [r1, #0x60]
	ldr r1, [sp, #0x14]
	cmp r0, r2
	ldrh r1, [r1]
	movhi r0, r1, lsl #0xc
	orrhi r0, r0, r2, lsr #4
	strhi r0, [sp, #4]
	movls r1, r3, lsl #0xc
	orrls r0, r1, r0, lsr #4
	strls r0, [sp, #4]
	ldr r0, [sp, #0x28]
	cmp sb, r0
	blo _0600CFA0
	ldr r0, _0600D338 ; =0x000008EF
	cmp sb, r0
	bhi _0600CFA0
	bl sub_0600A9FC
_0600CFA0:
	mov r0, sb, lsl #1
	str r0, [sp, #0x18]
	add r0, r0, #0x4000
	add r8, r0, #0x4800000
	add r0, r8, #2
	bl sub_0600D8F0
	mov r5, r0
	add r0, r5, #2
	bl sub_0600D8F0
	str r0, [sp, #0x1c]
	add r0, r0, #4
	bl sub_0600D8F0
	str r0, [sp, #0x20]
	add r0, r8, #0xe
	bl sub_0600D8F0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	ldrh r1, [r5]
	add r0, r0, #0x4800000
	add r0, r0, #0x4000
	mov r1, r1, lsl #1
	ldrh r2, [r0]
	and r1, r1, #0x400
	orr r1, r2, r1
	strh r1, [r0]
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x1c]
	strh r1, [r0]
	ldr r0, [sp, #0x20]
	ldrh r1, [r0]
	add r0, r1, sb, lsl #1
	add r0, r0, #0xf
	mov r0, r0, lsr #2
	mov sb, r0, lsl #1
	cmp sb, #0xfb0
	ldrhsh r0, [r6, #0x9a]
	subhs sb, sb, r0, lsr #1
	ldr r0, [sp, #0x2c]
	cmp r1, r0
	bls _0600D05C
	ldr r0, _0600D340 ; =0x0000FFFF
	mov sb, sl
	strh r0, [r8]
	ldrh r0, [r6, #0xb4]
	add r0, r0, #1
	strh r0, [r6, #0xb4]
	b _0600D0E4
_0600D05C:
	cmp r4, #0
	cmpne sb, sl
	beq _0600D0E4
	ldr r3, [sp, #0x30]
	mov r2, sb, lsl #1
	add r0, r2, #0x4000
	add r0, r0, #0x4800000
	cmp r0, r3
	ldrloh r0, [r0, #6]
	add r2, r2, #0x4800000
	add r2, r2, #0x4000
	ldrhsh r3, [r6, #0x9a]
	andlo r0, r0, #0xff
	subhs r0, r0, r3
	ldrh r2, [r2]
	ldrhsh r0, [r0, #6]
	tst r2, #0x7c00
	bne _0600D0BC
	cmp r0, #0xa
	cmpne r0, #0x14
	bne _0600D0BC
	ldr r0, [sp, #0x34]
	cmp r1, r0
	bls _0600D0E4
_0600D0BC:
	ldrh r0, [r6, #0xb4]
	ldr r1, _0600D340 ; =0x0000FFFF
	add r0, r0, #1
	strh r0, [r6, #0xb4]
	mov r0, sl, lsl #0x10
	strh r1, [r8]
	mov r0, r0, lsr #0x10
	strh r0, [r7, #4]
	strh r0, [r5]
	b _0600D2A8
_0600D0E4:
	ldrh r0, [r8]
	and r0, r0, #0xf
	cmp r0, #0xc
	bne _0600D244
	add r0, r8, #0xc
	bl sub_0600D8F0
	ldrh r0, [r0]
	str r0, [sp, #8]
	add r0, r8, #0x22
	bl sub_0600D8F0
	ldrh sl, [r0]
	ldrh r0, [r7]
	cmp r0, sl
	bne _0600D148
	ldr r0, [sp, #8]
	tst r0, #0x800
	beq _0600D148
	ldr r0, _0600D328 ; =0x0380FFF4
	ldr r1, [r0]
	ldr r0, [r1, #0x57c]
	add r0, r0, #1
	str r0, [r1, #0x57c]
	ldr r0, _0600D340 ; =0x0000FFFF
	strh r0, [r8]
	b _0600D21C
_0600D148:
	ldr r0, _0600D328 ; =0x0380FFF4
	ldr r0, [r0]
	add r1, r0, #0x300
	ldrh r2, [r1, #0x3a]
	mov r2, r2, lsl #0x18
	movs r2, r2, lsr #0x1f
	ldreqh r1, [r1, #0x4c]
	cmpeq r1, #0x40
	bne _0600D21C
	ldrh r1, [fp]
	cmp r1, #0
	beq _0600D1F4
	ldr r1, _0600D330 ; =0x04808098
	ldrh r1, [r1]
	tst r1, #0x8000
	beq _0600D1F4
	add r0, r0, #0x660
	bl sub_06001B0C
	ldr r0, [sp, #0xc]
	mov r3, #0
	ldrh r1, [r0]
	ldr r0, _0600D344 ; =0x000082EA
	mov r2, #0x3e8
	umull ip, r8, r1, r0
	mov r0, r3
	mla r8, r1, r0, r8
	mov r0, ip, lsr #6
	ldr r1, _0600D344 ; =0x000082EA
	mov ip, r3
	mla r8, ip, r1, r8
	mov r1, r8, lsr #6
	orr r0, r0, r8, lsl #26
	bl sub_0600B1CC
	mov r2, #0
	str r2, [sp]
	mov r2, r1
	mov r1, r0
	ldr r0, _0600D328 ; =0x0380FFF4
	ldr r3, _0600D348 ; =sub_0600A860
	ldr r0, [r0]
	add r0, r0, #0x660
	bl sub_06001B14
	b _0600D21C
_0600D1F4:
	ldr r1, _0600D340 ; =0x0000FFFF
	ldr r0, _0600D33C ; =0x04805F7E
	mov sl, r1
	strh r1, [r0]
	ldr r0, [sp, #0x24]
	strh r1, [r0]
	ldr r0, _0600D334 ; =0x0480824E
	strh r1, [r0]
	mov r0, r1
	strh r0, [r8]
_0600D21C:
	strh sl, [r7]
	bl sub_0600D918
	tst r0, #1
	beq _0600D294
	ldr r0, _0600D328 ; =0x0380FFF4
	ldr r1, [r0]
	ldr r0, [r1, #0x5a8]
	add r0, r0, #1
	str r0, [r1, #0x5a8]
	b _0600D294
_0600D244:
	cmp r0, #0xd
	bne _0600D294
	ldr r0, _0600D328 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x3a]
	mov r1, r1, lsl #0x18
	movs r1, r1, lsr #0x1f
	ldreqh r0, [r0, #0x4c]
	cmpeq r0, #0x40
	bne _0600D294
	ldrh r0, [fp]
	cmp r0, #0
	beq _0600D28C
	ldr r0, _0600D330 ; =0x04808098
	ldrh r0, [r0]
	tst r0, #0x8000
	bne _0600D294
_0600D28C:
	ldr r0, _0600D340 ; =0x0000FFFF
	strh r0, [r8]
_0600D294:
	mov r0, sb, lsl #0x10
	mov r0, r0, lsr #0x10
	strh r0, [r7, #4]
	strh r0, [r5]
	b _0600CF34
_0600D2A8:
	cmp r4, #0
	beq _0600D2FC
	ldr r0, _0600D34C ; =0x04808054
	ldrh r4, [r0]
	bl sub_0600D918
	mov r0, r0, lsl #0x10
	movs r1, r0, lsr #0x10
	beq _0600D2FC
	ldr r0, _0600D34C ; =0x04808054
	ldrh r0, [r0]
	cmp r4, r0
	bne _0600D2FC
	tst r1, #2
	beq _0600D2EC
	mov r0, #0x80
	bl sub_0600BD2C
	b _0600D2FC
_0600D2EC:
	tst r1, #1
	beq _0600D2FC
	mov r0, #0x100
	bl sub_0600BD2C
_0600D2FC:
	ldr r0, _0600D350 ; =0x0480805A
	ldrh r1, [r0]
	ldrh r0, [r0, #-6]
	cmp r1, r0
	beq _0600D31C
	mov r0, #0
	mov r1, #0xf
	bl sub_06008F04
_0600D31C:
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0600D328: .word 0x0380FFF4
_0600D32C: .word 0x04808010
_0600D330: .word 0x04808098
_0600D334: .word 0x0480824E
_0600D338: .word 0x000008EF
_0600D33C: .word 0x04805F7E
_0600D340: .word 0x0000FFFF
_0600D344: .word 0x000082EA
_0600D348: .word sub_0600A860
_0600D34C: .word 0x04808054
_0600D350: .word 0x0480805A
	arm_func_end sub_0600CE98

	arm_func_start sub_0600D354
sub_0600D354: ; 0x0600D354
	stmdb sp!, {r3, lr}
	ldr ip, _0600D438 ; =0x0380FFF4
	ldr r2, _0600D43C ; =0x04808010
	ldr r1, [ip]
	mov r3, #0x1000
	add r1, r1, #0x2c
	strh r3, [r2]
	add r3, r1, #0x400
	ldrh r1, [r3, #0x3c]
	cmp r1, #0
	beq _0600D430
	ldr r1, [ip]
	add r1, r1, #0x600
	ldrh r1, [r1, #0x90]
	tst r1, #0x10
	cmpne r0, #0
	beq _0600D424
	add r0, r2, #0x204
	ldrh r1, [r2, #0xa6]
	ldrh r0, [r0]
	cmp r0, #3
	cmpne r0, #5
	bne _0600D424
	cmp r1, #0
	bne _0600D424
	ldr r3, [r3, #0x44]
	mov r2, #0
	ldrh r0, [r3, #2]
	b _0600D3D8
_0600D3C8:
	and r1, r0, #1
	mov r0, r0, lsl #0xf
	add r2, r2, r1
	mov r0, r0, lsr #0x10
_0600D3D8:
	cmp r0, #0
	bne _0600D3C8
	ldrh r0, [r3, #0x24]
	ldrh r1, [r3, #0xa]
	add r0, r0, #0xa
	mul r0, r2, r0
	add r0, r0, #0xc0
	add r0, r0, r1, lsl #2
	mov r0, r0, lsl #0x10
	ldr r1, _0600D440 ; =sub_0600D888
	mov r0, r0, lsr #0x10
	bl sub_0600B81C
	ldr r0, _0600D438 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x400
	ldrh r1, [r0]
	add r1, r1, #1
	strh r1, [r0]
	b _0600D430
_0600D424:
	mov r0, #0
	mov r1, #0x10
	bl sub_06008F04
_0600D430:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600D438: .word 0x0380FFF4
_0600D43C: .word 0x04808010
_0600D440: .word sub_0600D888
	arm_func_end sub_0600D354

	arm_func_start sub_0600D444
sub_0600D444: ; 0x0600D444
	stmdb sp!, {r3, lr}
	ldr r3, _0600D540 ; =0x0380FFF4
	ldr r0, _0600D544 ; =0x04808010
	ldr r2, [r3]
	mov r1, #0x80
	strh r1, [r0]
	ldr r1, [r3]
	add r2, r2, #0x2c
	add r1, r1, #0x600
	ldrh r1, [r1, #0x90]
	tst r1, #0x20
	beq _0600D4D8
	add r1, r0, #0x204
	ldrh r3, [r1]
	add r1, r0, #0x258
	and r3, r3, #0xff
	ldrh ip, [r1]
	cmp r3, #3
	blo _0600D4D8
	cmp r3, #5
	bhi _0600D4D8
	ldr r3, [r2, #0x458]
	ldr r1, _0600D548 ; =0x00000FFF
	and r3, r1, r3, lsr #1
	cmp ip, r3
	blo _0600D4D8
	ldr r2, [r2, #0x430]
	and r1, r1, r2, lsr #1
	cmp ip, r1
	bhi _0600D4D8
	add r1, r0, #0x234
	ldrh r0, [r1]
	orr r0, r0, #0x80
	strh r0, [r1]
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
_0600D4D8:
	ldr r1, _0600D54C ; =0x04808000
	ldrh r0, [r1]
	cmp r0, #0x1440
	beq _0600D538
	add r0, r1, #0x19c
	ldrh r0, [r0]
	and r0, r0, #0x42
	cmp r0, #0x42
	bne _0600D538
	add r1, r1, #0x2b8
	ldrh r2, [r1]
	cmp r2, #0
	beq _0600D538
	mov r3, #0
	b _0600D52C
_0600D514:
	cmp r3, #0x3e8
	add r3, r3, #1
	bls _0600D52C
	mov r0, #0x40
	bl sub_0600BD2C
	b _0600D538
_0600D52C:
	ldrh r0, [r1]
	cmp r2, r0
	beq _0600D514
_0600D538:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600D540: .word 0x0380FFF4
_0600D544: .word 0x04808010
_0600D548: .word 0x00000FFF
_0600D54C: .word 0x04808000
	arm_func_end sub_0600D444

	arm_func_start sub_0600D550
sub_0600D550: ; 0x0600D550
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _0600D7A4 ; =0x0380FFF4
	ldr r0, _0600D7A8 ; =0x04808010
	ldr r3, [r2]
	mov r1, #0x40
	strh r1, [r0]
	ldr r2, [r2]
	add r1, r3, #0x2c
	add r2, r2, #0x600
	ldrh r2, [r2, #0x90]
	add r4, r3, #0x344
	tst r2, #0x20
	add r5, r1, #0x400
	beq _0600D79C
	ldrh r2, [r5, #0xa4]
	ldr r1, _0600D7AC ; =0x0000FFFF
	cmp r2, r1
	addeq r2, r0, #0x18c
	ldreqh r2, [r2]
	andeq r2, r2, #3
	cmpeq r2, #3
	bne _0600D79C
	add r2, r0, #0x258
	ldrh r3, [r2]
	ldrh r2, [r0, #0x40]
	sub r1, r1, #0xf000
	and r1, r1, r2, lsr #1
	cmp r3, r1
	blt _0600D79C
	ldrh r7, [r0, #0x44]
	mov r0, r7, lsl #1
	add r0, r0, #0x4000
	add r0, r0, #0x4800000
	add r0, r0, #8
	bl sub_0600D8F0
	add r0, r0, #4
	bl sub_0600D8F0
	ldrh r2, [r0]
	ldr r1, _0600D7B0 ; =0x0000E7FF
	and r1, r2, r1
	cmp r1, #0x228
	bne _0600D79C
	add r0, r0, #2
	bl sub_0600D8F0
	ldr r2, _0600D7B4 ; =0x048080F8
	ldrh r1, [r2]
	sub r6, r1, #0x10000
	add r1, r2, #0x170
_0600D610:
	ldrh r3, [r1]
	sub r3, r3, r7
	mov r3, r3, lsl #0x10
	mov r8, r3, lsr #0x10
	tst r8, #0x8000
	ldrneh r3, [r4, #0x9a]
	addne r3, r8, r3, lsr #1
	movne r3, r3, lsl #0x10
	movne r8, r3, lsr #0x10
	cmp r8, #0xe
	bhi _0600D658
	ldrh r3, [r2]
	sub r3, r3, r6
	mov r3, r3, lsl #0x10
	mov r3, r3, lsr #0x10
	cmp r3, #0x40
	bhi _0600D79C
	b _0600D610
_0600D658:
	add r0, r0, #8
	mov r8, #0
	b _0600D680
_0600D664:
	bl sub_0600D8F0
	add r1, r4, r8, lsl #1
	ldrh r2, [r0], #2
	ldrh r1, [r1, #0x64]
	cmp r2, r1
	bne _0600D79C
	add r8, r8, #1
_0600D680:
	cmp r8, #3
	blo _0600D664
	add r0, r0, #0xa
	bl sub_0600D8F0
	ldr r3, _0600D7B4 ; =0x048080F8
	add r1, r3, #0x170
_0600D698:
	ldrh r2, [r1]
	sub r2, r2, r7
	mov r2, r2, lsl #0x10
	mov r8, r2, lsr #0x10
	tst r8, #0x8000
	ldrneh r2, [r4, #0x9a]
	addne r2, r8, r2, lsr #1
	movne r2, r2, lsl #0x10
	movne r8, r2, lsr #0x10
	cmp r8, #0x14
	bhi _0600D6E0
	ldrh r2, [r3]
	sub r2, r2, r6
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	cmp r2, #0x70
	bhi _0600D79C
	b _0600D698
_0600D6E0:
	ldr r2, _0600D7B8 ; =0x04808028
	ldrh r3, [r0]
	ldrh r0, [r2]
	mov r1, #1
	tst r3, r1, lsl r0
	bne _0600D79C
	ldrh r1, [r2, #0x70]
	mov r0, #0x40
	strh r1, [r5, #0xa4]
	strh r0, [r2, #0x8c]
	ldrh r0, [r4, #0xbe]
	add r1, r2, #0x174
	add r0, r0, #1
	strh r0, [r4, #0xbe]
_0600D718:
	ldrh r0, [r1]
	and r0, r0, #3
	cmp r0, #3
	beq _0600D718
	ldr r0, _0600D7BC ; =0x04808244
	mov r2, #8
	ldrh r1, [r0]
	sub r3, r0, #0x1c
	orr r1, r1, #0x40
	strh r1, [r0]
	ldrh r4, [r0]
	ldr r1, _0600D7A4 ; =0x0380FFF4
	bic r4, r4, #0x40
	strh r4, [r0]
	strh r2, [r3]
	mov r2, #0
	strh r2, [r3]
	ldr r1, [r1]
	ldr r2, _0600D7AC ; =0x0000FFFF
	add r1, r1, #0x2c
	add r6, r1, #0x400
	ldrh r5, [r6, #0xa4]
	cmp r5, r2
	beq _0600D79C
	sub r4, r0, #0x1b0
	ldrh r3, [r4]
	sub r1, r0, #0x214
	strh r5, [r4]
	ldrh r0, [r1]
	orr r0, r0, #0x80
	strh r0, [r1]
	strh r3, [r4]
	strh r2, [r6, #0xa4]
_0600D79C:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0600D7A4: .word 0x0380FFF4
_0600D7A8: .word 0x04808010
_0600D7AC: .word 0x0000FFFF
_0600D7B0: .word 0x0000E7FF
_0600D7B4: .word 0x048080F8
_0600D7B8: .word 0x04808028
_0600D7BC: .word 0x04808244
	arm_func_end sub_0600D550

	arm_func_start sub_0600D7C0
sub_0600D7C0: ; 0x0600D7C0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0600D884 ; =0x0380FFF4
	mov r0, #2
	ldr r1, [r1]
	mov r5, #0
	add r1, r1, #0x2c
	add r4, r1, #0x400
	bl sub_06013A68
	mov r0, #1
	bl sub_06013A68
	mov r0, r5
	bl sub_06013A68
	ldrh r0, [r4, #0x28]
	cmp r0, #0
	beq _0600D814
	ldr r0, [r4, #0x30]
	ldrh r0, [r0]
	cmp r0, #0
	movne r5, #1
	moveq r0, r5
	streqh r0, [r4, #0x28]
_0600D814:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _0600D838
	ldr r0, [r4, #0x1c]
	ldrh r0, [r0]
	cmp r0, #0
	moveq r0, #0
	streqh r0, [r4, #0x14]
	movne r5, #1
_0600D838:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0600D85C
	ldr r0, [r4, #8]
	ldrh r0, [r0]
	cmp r0, #0
	moveq r0, #0
	streqh r0, [r4]
	movne r5, #1
_0600D85C:
	cmp r5, #0
	beq _0600D870
	mov r0, #0
	mov r1, #0xe
	bl sub_06008F04
_0600D870:
	mov r0, #0
	mov r1, #0x14
	bl sub_06008F04
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600D884: .word 0x0380FFF4
	arm_func_end sub_0600D7C0

	arm_func_start sub_0600D888
sub_0600D888: ; 0x0600D888
	stmdb sp!, {r4, lr}
	mov r0, #0x1000000
	bl sub_06008EF4
	ldr r2, _0600D8E8 ; =0x04808210
	mov r1, #0x1000
	ldrh r3, [r2]
	mov r4, r0
	strh r1, [r2, #0x34]
	mov r1, #0x64
	b _0600D8C0
_0600D8B0:
	ldrh r0, [r2]
	cmp r3, r0
	bne _0600D8C8
	sub r1, r1, #1
_0600D8C0:
	cmp r1, #0
	bne _0600D8B0
_0600D8C8:
	ldr r1, _0600D8EC ; =0x04808244
	mov r0, #0
	strh r0, [r1]
	bl sub_0600D354
	mov r0, r4
	bl sub_06008EFC
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600D8E8: .word 0x04808210
_0600D8EC: .word 0x04808244
	arm_func_end sub_0600D888

	arm_func_start sub_0600D8F0
sub_0600D8F0: ; 0x0600D8F0
	ldr r1, _0600D910 ; =0x04805F60
	cmp r0, r1
	ldrhs r1, _0600D914 ; =0x0380FFF4
	ldrhs r1, [r1]
	addhs r1, r1, #0x300
	ldrhsh r1, [r1, #0xde]
	subhs r0, r0, r1
	bx lr
	.align 2, 0
_0600D910: .word 0x04805F60
_0600D914: .word 0x0380FFF4
	arm_func_end sub_0600D8F0

	arm_func_start sub_0600D918
sub_0600D918: ; 0x0600D918
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0600D94C ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x2c
	add r5, r0, #0x400
	add r0, r5, #0x50
	bl sub_0600D950
	mov r4, r0
	add r0, r5, #0x64
	bl sub_0600D950
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600D94C: .word 0x0380FFF4
	arm_func_end sub_0600D918

	arm_func_start sub_0600D950
sub_0600D950: ; 0x0600D950
	stmdb sp!, {r4, lr}
	ldrh r1, [r0]
	mov r4, #0
	cmp r1, #2
	bne _0600D990
	ldr r2, _0600D9C0 ; =0x04808094
	ldr r3, [r0, #8]
	ldr r1, _0600D9C4 ; =0x00003FFF
	ldrh r2, [r2]
	and r1, r3, r1
	mov r1, r1, lsr #1
	orr r1, r1, #0x8000
	cmp r1, r2
	movne r1, #1
	strneh r1, [r0]
	orrne r4, r4, #1
_0600D990:
	ldrh r1, [r0]
	cmp r1, #1
	bne _0600D9B4
	ldr r1, [r0, #8]
	ldrh r1, [r1]
	tst r1, #1
	beq _0600D9B4
	bl sub_0601384C
	orr r4, r4, #2
_0600D9B4:
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600D9C0: .word 0x04808094
_0600D9C4: .word 0x00003FFF
	arm_func_end sub_0600D950

	arm_func_start sub_0600D9C8
sub_0600D9C8: ; 0x0600D9C8
	stmdb sp!, {r3, lr}
	ldr r1, _0600D9E8 ; =sub_0600C4F0
	mov r0, #0x1000000
	bl sub_0600D9EC
	mov r0, #0x1000000
	bl sub_06008EFC
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600D9E8: .word sub_0600C4F0
	arm_func_end sub_0600D9C8

	arm_func_start sub_0600D9EC
sub_0600D9EC: ; 0x0600D9EC
	ldr pc, _0600D9F0 ; =OS_SetIrqFunction
	.align 2, 0
_0600D9F0: .word OS_SetIrqFunction
	arm_func_end sub_0600D9EC

	arm_func_start sub_0600D9F4
sub_0600D9F4: ; 0x0600D9F4
	stmdb sp!, {r3, lr}
	mov r0, #0x1000000
	bl sub_06008EF4
	mov r0, #0x1000000
	mov r1, #0
	bl sub_0600D9EC
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_0600D9F4

	arm_func_start sub_0600DA14
sub_0600DA14: ; 0x0600DA14
	stmdb sp!, {r3, lr}
	ldr r0, _0600DA5C ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0xe8]
	cmp r0, #0
	beq _0600DA34
	bl sub_0601430C
_0600DA34:
	ldr r0, _0600DA5C ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x3a]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	beq _0600DA54
	bl sub_06010CC0
_0600DA54:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600DA5C: .word 0x0380FFF4
	arm_func_end sub_0600DA14

	arm_func_start sub_0600DA60
sub_0600DA60: ; 0x0600DA60
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r7, _0600DC2C ; =0x0380FFF4
	mov sl, #2
	ldr r1, [r7]
	mov fp, #0
	add r0, r1, #0x2c
	add r8, r0, #0x400
	ldr r0, _0600DC30 ; =0x04808032
	add r6, r1, #0x344
	add r4, r0, #0x6e
_0600DA88:
	mov r0, #0x14
	mov r5, sl, lsl #2
	mla sb, sl, r0, r8
	add r0, r5, #0x4800000
	add r0, r0, #0x8000
	ldrh r0, [r0, #0xa0]
	tst r0, #0x8000
	bne _0600DC1C
	ldrh r0, [sb]
	cmp r0, #0
	beq _0600DC1C
	ldr r1, [sb, #0xc]
	cmp r1, #0
	beq _0600DBFC
	ldr r0, [sb, #8]
	ldrh r0, [r0]
	strh r0, [r1, #8]
	ldr r1, [sb, #8]
	ldr r0, [sb, #0xc]
	ldrh r1, [r1, #0xc]
	strh r1, [r0, #0x14]
	ldr r0, [sb, #8]
	ldrh r1, [r0, #0xc]
	tst r1, #0x4000
	beq _0600DBC8
	ldr r1, [r7]
	add r1, r1, #0x600
	ldrh r1, [r1, #0x90]
	tst r1, #8
	beq _0600DBAC
	ldrh r1, [r0, #0xa]
	add r2, r0, #0xc
	add r1, r2, r1
	sub r1, r1, #7
	bic r2, r1, #1
	ldrh r1, [r2]
	cmp r1, #0
	ldreqh r1, [r2, #2]
	cmpeq r1, #0
	bne _0600DBAC
	ldr r0, _0600DC30 ; =0x04808032
	mov r1, #0x8000
	strh fp, [r0]
	strh r1, [r0]
	ldrh r0, [r6, #0xba]
	add r0, r0, #1
	strh r0, [r6, #0xba]
	ldr r0, [sb, #0xc]
	bl sub_06013010
	cmp r0, #0
	beq _0600DB90
	ldr r2, [sb, #0xc]
	mov r0, #2
	strh r0, [r2, #8]
	ldrh r0, [sb, #4]
	mov r1, #1
	add r0, r0, #1
	strh r0, [sb, #4]
	ldrh r0, [r8, #0xae]
	add r0, r0, #1
	strh r0, [r8, #0xae]
	ldr r0, [sb, #0xc]
	ldr r2, [sb, #0x10]
	mov lr, pc
	bx r2
	b _0600DC1C
_0600DB90:
	ldr r1, [sb, #0xc]
	mov r0, #0
	strh r0, [r1, #0xc]
	ldrh r0, [r5, r4]
	orr r0, r0, #0x8000
	strh r0, [r5, r4]
	b _0600DC1C
_0600DBAC:
	ldrh r0, [r0, #4]
	ldr r2, [sb, #0xc]
	and r0, r0, #0xff
	ldrh r1, [r2, #0xc]
	add r0, r1, r0
	strh r0, [r2, #0xc]
	b _0600DBD8
_0600DBC8:
	ldrh r1, [r0, #4]
	ldr r0, [sb, #0xc]
	and r1, r1, #0xff
	strh r1, [r0, #0xc]
_0600DBD8:
	ldrh r0, [sb, #4]
	mov r1, #2
	add r0, r0, #1
	strh r0, [sb, #4]
	ldr r0, [sb, #0xc]
	ldr r2, [sb, #0x10]
	mov lr, pc
	bx r2
	b _0600DC1C
_0600DBFC:
	ldrh r0, [sb, #4]
	mov r1, #3
	add r0, r0, #1
	strh r0, [sb, #4]
	ldr r0, [sb, #8]
	ldr r2, [sb, #0x10]
	mov lr, pc
	bx r2
_0600DC1C:
	subs sl, sl, #1
	bpl _0600DA88
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0600DC2C: .word 0x0380FFF4
_0600DC30: .word 0x04808032
	arm_func_end sub_0600DA60

	arm_func_start sub_0600DC34
sub_0600DC34: ; 0x0600DC34
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _0600DF84 ; =0x0380FFF4
	ldr r4, [r0]
	add r0, r4, #0xdc
	add r5, r0, #0x400
_0600DC48:
	ldr r1, _0600DF88 ; =0x0480805A
	ldrh r0, [r5, #4]
	ldrh r6, [r1]
	cmp r6, r0
	beq _0600DF7C
	ldr r0, _0600DF8C ; =0x000008C6
	cmp r6, r0
	blo _0600DC6C
	bl sub_0600A9FC
_0600DC6C:
	mov r6, r6, lsl #1
	add r0, r6, #0x4000
	add r7, r0, #0x4800000
	add r0, r7, #2
	bl sub_0600D8F0
	add r1, r6, #0x4800000
	add r1, r1, #0x4000
	ldrh r2, [r1]
	ldr r1, _0600DF90 ; =0x0000FFFF
	ldrh r6, [r0]
	cmp r2, r1
	ldreq r0, _0600DF88 ; =0x0480805A
	streqh r6, [r0]
	beq _0600DC48
	add r0, r7, #8
	bl sub_0600D8F0
	ldrh r1, [r0]
	mov r0, r7
	bl sub_0600E13C
	ldr r1, _0600DF88 ; =0x0480805A
	movs r8, r0
	strh r6, [r1]
	bne _0600DCF0
	ldrh r0, [r7]
	and r0, r0, #0xf
	cmp r0, #0xc
	bne _0600DCE4
	mov r0, #0x10
	bl sub_0600BD2C
	b _0600DC48
_0600DCE4:
	mov r0, #8
	bl sub_0600BD2C
	b _0600DC48
_0600DCF0:
	ldr r0, _0600DF84 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #8
	beq _0600DD18
	ldrh r0, [r8, #0x14]
	tst r0, #0x4000
	movne r0, #0
	strneh r0, [r5, #2]
_0600DD18:
	ldrh r0, [r8, #8]
	mov r6, #1
	tst r0, #0x200
	beq _0600DD70
	ldrh r0, [r8, #0x14]
	mov r0, r0, lsl #0x15
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	beq _0600DD4C
	ldrh r0, [r8, #0x2a]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1c
	beq _0600DF1C
_0600DD4C:
	add r0, r4, #0x188
	add r1, r4, #0x1e8
	sub r2, r8, #0x10
	mov r6, #0
	bl sub_060091C4
	mov r0, #2
	mov r1, #9
	bl sub_06008F04
	b _0600DF1C
_0600DD70:
	and r0, r0, #0xf
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _0600DF1C
_0600DD80: ; jump table
	b _0600DE0C ; case 0
	b _0600DDF4 ; case 1
	b _0600DF1C ; case 2
	b _0600DF1C ; case 3
	b _0600DF1C ; case 4
	b _0600DE3C ; case 5
	b _0600DF1C ; case 6
	b _0600DF1C ; case 7
	b _0600DDC0 ; case 8
	b _0600DF1C ; case 9
	b _0600DF1C ; case 10
	b _0600DF1C ; case 11
	b _0600DE94 ; case 12
	b _0600DEE8 ; case 13
	b _0600DE74 ; case 14
	b _0600DE74 ; case 15
_0600DDC0:
	ldrh r0, [r8, #0x14]
	and r0, r0, #0xf
	cmp r0, #8
	bne _0600DF1C
	add r0, r4, #0x188
	add r1, r4, #0x1c4
	sub r2, r8, #0x10
	mov r6, #0
	bl sub_060091C4
	mov r0, #2
	mov r1, #6
	bl sub_06008F04
	b _0600DF1C
_0600DDF4:
	ldrh r0, [r8, #0x14]
	cmp r0, #0x80
	bne _0600DF1C
	mov r0, r8
	bl sub_060158F4
	b _0600DF1C
_0600DE0C:
	ldrh r0, [r8, #0x14]
	tst r0, #0xf
	bne _0600DF1C
	add r0, r4, #0x188
	add r1, r4, #0x1dc
	sub r2, r8, #0x10
	mov r6, #0
	bl sub_060091C4
	mov r0, #1
	mov r1, #7
	bl sub_06008F04
	b _0600DF1C
_0600DE3C:
	ldrh r1, [r8, #0x14]
	rsb r0, r6, #0xe800
	and r0, r1, r0
	cmp r0, #0xa4
	bne _0600DF1C
	add r0, r4, #0x188
	add r1, r4, #0x1dc
	sub r2, r8, #0x10
	mov r6, #0
	bl sub_060091C4
	mov r0, #1
	mov r1, #7
	bl sub_06008F04
	b _0600DF1C
_0600DE74:
	ldrh r1, [r8, #0x14]
	ldr r0, _0600DF94 ; =0x0000E7BF
	and r0, r1, r0
	cmp r0, #0x118
	bne _0600DF1C
	mov r0, r8
	bl sub_06015674
	b _0600DF1C
_0600DE94:
	ldrh r1, [r8, #0x14]
	rsb r0, r6, #0xe800
	and r0, r1, r0
	cmp r0, #0x228
	bne _0600DF1C
	ldr r0, _0600DF84 ; =0x0380FFF4
	ldr r1, _0600DF84 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x54]
	cmp r0, #0
	ldreq r0, _0600DF98 ; =0x0480803C
	streqh r6, [r0]
	ldr r2, [r1]
	mov r0, r8
	ldr r1, [r2, #0x5ac]
	add r1, r1, #1
	str r1, [r2, #0x5ac]
	bl sub_060154F8
	mov r6, r0
	b _0600DF1C
_0600DEE8:
	ldrh r1, [r8, #0x14]
	rsb r0, r6, #0xe800
	and r0, r1, r0
	cmp r0, #0x218
	bne _0600DF1C
	ldr r1, _0600DF84 ; =0x0380FFF4
	mov r0, r8
	ldr r2, [r1]
	ldr r1, [r2, #0x5b0]
	add r1, r1, #1
	str r1, [r2, #0x5b0]
	bl sub_06015820
	mov r6, r0
_0600DF1C:
	cmp r6, #0
	beq _0600DF30
	add r0, r4, #0x188
	sub r1, r8, #0x10
	bl sub_06009144
_0600DF30:
	ldr r3, _0600DF84 ; =0x0380FFF4
	ldr r0, [r3]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #1
	beq _0600DC48
	ldr r2, _0600DF90 ; =0x0000FFFF
	ldr r1, _0600DF9C ; =0x04805F60
	mov r6, #0
_0600DF54:
	cmp r7, r1
	ldrhs r0, [r3]
	add r6, r6, #1
	addhs r0, r0, #0x300
	ldrhsh r0, [r0, #0xde]
	subhs r7, r7, r0
	cmp r6, #7
	strh r2, [r7], #2
	blo _0600DF54
	b _0600DC48
_0600DF7C:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0600DF84: .word 0x0380FFF4
_0600DF88: .word 0x0480805A
_0600DF8C: .word 0x000008C6
_0600DF90: .word 0x0000FFFF
_0600DF94: .word 0x0000E7BF
_0600DF98: .word 0x0480803C
_0600DF9C: .word 0x04805F60
	arm_func_end sub_0600DC34

	arm_func_start sub_0600DFA0
sub_0600DFA0: ; 0x0600DFA0
	stmdb sp!, {r4, lr}
	ldr r0, _0600E078 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x2c
	add r4, r0, #0x400
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _0600E070
	ldr r1, [r4, #0x90]
	ldr r0, [r4, #0x44]
	ldrh r1, [r1, #0x10]
	ldrh r0, [r0, #2]
	cmp r1, r0
	beq _0600DFDC
	bl sub_0600DC34
_0600DFDC:
	ldr r0, [r4, #0x44]
	ldrh r0, [r0, #4]
	ands r2, r0, #0xff
	ldr r0, _0600E078 ; =0x0380FFF4
	ldrne r1, [r0]
	ldrne r0, [r1, #0x5a0]
	addne r0, r0, r2
	ldreq r1, [r0]
	ldreq r0, [r1, #0x5a0]
	addeq r0, r0, #1
	str r0, [r1, #0x5a0]
	ldrh r1, [r4, #0x40]
	ldr r0, _0600E078 ; =0x0380FFF4
	add r1, r1, #1
	strh r1, [r4, #0x40]
	ldr ip, [r4, #0x90]
	ldr r1, [r4, #0x44]
	ldrh r3, [ip, #0x10]
	ldrh r2, [r1, #2]
	mov r1, #0
	eor r2, r3, r2
	strh r2, [ip, #0x12]
	ldr r2, [r4, #0x90]
	ldrh r2, [r2, #0x10]
	strh r2, [r4, #0xa0]
	strh r1, [r4, #0x3c]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0xea]
	cmp r0, #0
	beq _0600E05C
	bl sub_0600A638
_0600E05C:
	ldr r0, _0600E078 ; =0x0380FFF4
	ldr r1, [r4, #0x90]
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_0600F388
_0600E070:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600E078: .word 0x0380FFF4
	arm_func_end sub_0600DFA0

	arm_func_start sub_0600E07C
sub_0600E07C: ; 0x0600E07C
	stmdb sp!, {r4, lr}
	ldr r0, _0600E130 ; =0x0380FFF4
	ldr r2, _0600E134 ; =0x04808088
	ldr r1, [r0]
	ldrh r0, [r2]
	add r4, r1, #0x17c
	cmp r0, #0
	bne _0600E0BC
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0600E0BC
	mov r1, #8
	mov r0, #2
	strh r1, [r2, #0x26]
	bl sub_06012C88
	b _0600E128
_0600E0BC:
	add r0, r1, #0x500
	ldrh r1, [r0, #0x32]
	ldrh r2, [r0, #0x2e]
	mvn r0, r1
	tst r2, r0
	bne _0600E0F4
	ldr r0, _0600E138 ; =0x048080AE
	mov r1, #8
	strh r1, [r0]
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _0600E0F4
	mov r0, #2
	bl sub_06012C88
_0600E0F4:
	ldr r0, _0600E138 ; =0x048080AE
	mov r1, #5
	strh r1, [r0]
	ldrh r0, [r4, #0x2c]
	cmp r0, #0
	beq _0600E114
	mov r0, #1
	bl sub_06012C88
_0600E114:
	ldrh r0, [r4, #0x20]
	cmp r0, #0
	beq _0600E128
	mov r0, #0
	bl sub_06012C88
_0600E128:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600E130: .word 0x0380FFF4
_0600E134: .word 0x04808088
_0600E138: .word 0x048080AE
	arm_func_end sub_0600E07C

	arm_func_start sub_0600E13C
sub_0600E13C: ; 0x0600E13C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0600E1A8 ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r0, r1, #0x188
	add r1, r5, #0x22
	bl sub_060090A8
	movs r4, r0
	moveq r0, #0
	beq _0600E1A0
	mov r1, r6
	add r0, r4, #0x18
	add r2, r5, #0xc
	bl sub_0600B8C0
	sub r0, r5, #0x18
	strh r0, [r4, #0x16]
	ldrh r0, [r4, #0x22]
	ldrh r1, [r4, #0x1e]
	and r0, r0, #0xff
	and r1, r1, #0xff
	mov r0, r0, lsl #0x10
	orr r0, r1, r0, lsr #8
	strh r0, [r4, #0x1e]
	add r0, r4, #0x10
_0600E1A0:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0600E1A8: .word 0x0380FFF4
	arm_func_end sub_0600E13C

	arm_func_start sub_0600E1AC
sub_0600E1AC: ; 0x0600E1AC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldrh r0, [r8]
	tst r0, #1
	movne r0, #0
	bne _0600E248
	ldr r4, _0600E250 ; =0x0380FFF4
	ldr r0, [r4]
	add r1, r0, #0x500
	ldrh r1, [r1, #0x2c]
	cmp r1, #1
	bls _0600E244
	ldr r1, [r0, #0x31c]
	mov r7, #0
	add r5, r1, #0x1c
	mov r6, #1
	b _0600E234
_0600E1F0:
	ldrh r1, [r5]
	cmp r1, #0
	beq _0600E22C
	mov r1, r8
	add r0, r5, #4
	bl sub_0600ACC4
	cmp r0, #0
	movne r0, r6
	bne _0600E248
	ldr r0, [r4]
	add r7, r7, #1
	add r1, r0, #0x500
	ldrh r1, [r1, #0x2c]
	cmp r7, r1
	bhs _0600E244
_0600E22C:
	add r6, r6, #1
	add r5, r5, #0x1c
_0600E234:
	add r1, r0, #0x300
	ldrh r1, [r1, #0x22]
	cmp r6, r1
	blo _0600E1F0
_0600E244:
	mov r0, #0xff
_0600E248:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0600E250: .word 0x0380FFF4
	arm_func_end sub_0600E1AC

	arm_func_start sub_0600E254
sub_0600E254: ; 0x0600E254
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r5, _0600E390 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r5]
	ldrh r1, [r4]
	add r6, r0, #0x31c
	tst r1, #1
	movne r0, #0
	bne _0600E388
	add r1, r0, #0x500
	ldrh r1, [r1, #0x2c]
	mov r8, #1
	cmp r1, #1
	bls _0600E304
	ldr r1, [r6]
	mov sl, #0
	mov sb, sl
	add r7, r1, #0x1c
	b _0600E2F0
_0600E2A0:
	ldrh r1, [r7]
	cmp r1, #0
	beq _0600E2E0
	mov r1, r4
	add r0, r7, #4
	bl sub_0600ACC4
	cmp r0, #0
	movne r0, r8
	bne _0600E388
	ldr r0, [r5]
	add sb, sb, #1
	add r1, r0, #0x500
	ldrh r1, [r1, #0x2c]
	cmp sb, r1
	bhs _0600E2FC
	b _0600E2E8
_0600E2E0:
	cmp sl, #0
	moveq sl, r8
_0600E2E8:
	add r8, r8, #1
	add r7, r7, #0x1c
_0600E2F0:
	ldrh r1, [r6, #6]
	cmp r8, r1
	blo _0600E2A0
_0600E2FC:
	cmp sl, #0
	movne r8, sl
_0600E304:
	add r0, r0, #0x300
	ldrh r0, [r0, #0x22]
	cmp r8, r0
	blo _0600E378
	ldr r7, [r6]
	ldrh r5, [r6, #6]
	mov r3, #0x10000
	mov r6, #1
	mov r8, #0
	mov r0, #0x1c
	b _0600E364
_0600E330:
	mul r2, r6, r0
	ldrh r1, [r7, r2]
	add r2, r7, r2
	cmp r1, #0x30
	bhs _0600E360
	ldrh r1, [r2, #0x16]
	cmp r1, #0
	bne _0600E360
	ldrh r1, [r2, #0x18]
	cmp r3, r1
	movhi r3, r1
	movhi r8, r6
_0600E360:
	add r6, r6, #1
_0600E364:
	cmp r6, r5
	blo _0600E330
	cmp r8, #0
	moveq r0, #0xff
	beq _0600E388
_0600E378:
	mov r0, r8
	mov r1, r4
	bl sub_0600EE44
	mov r0, r8
_0600E388:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0600E390: .word 0x0380FFF4
	arm_func_end sub_0600E254

	arm_func_start sub_0600E394
sub_0600E394: ; 0x0600E394
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _0600E3EC ; =0x0380FFF4
	mov r7, r0
	ldr r2, [r2]
	mov r0, #0x1000000
	add r4, r2, #0x1ac
	mov r6, r1
	bl sub_06008EF4
	ldrh r1, [r4, #8]
	mov r5, r0
	cmp r1, #0
	bne _0600E3CC
	mov r0, #0
	bl sub_0600E9B8
_0600E3CC:
	mov r0, r7
	mov r1, r4
	mov r2, r6
	bl sub_060091C4
	mov r0, r5
	bl sub_06008EFC
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0600E3EC: .word 0x0380FFF4
	arm_func_end sub_0600E394

	arm_func_start sub_0600E3F0
sub_0600E3F0: ; 0x0600E3F0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0600E47C ; =0x0380FFF4
	ldrh r5, [r0, #2]
	ldr r0, [r1]
	mov r1, #0x1c
	ldr r2, [r0, #0x31c]
	mov r0, #0x1000000
	mla r6, r5, r1, r2
	bl sub_06008EF4
	ldr r1, _0600E47C ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	ldreqh r0, [r6, #0x16]
	cmpeq r0, #0
	bne _0600E440
	mov r0, r5
	bl sub_0600E9B8
_0600E440:
	ldrh r1, [r6, #0x16]
	mov r0, r4
	add r1, r1, #1
	strh r1, [r6, #0x16]
	bl sub_06008EFC
	ldr r0, _0600E47C ; =0x0380FFF4
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r0, [r0, #0x34]
	tst r0, r1, lsl r5
	ldreqh r0, [r6, #0x1a]
	streqh r0, [r6, #0x18]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0600E47C: .word 0x0380FFF4
	arm_func_end sub_0600E3F0

	arm_func_start sub_0600E480
sub_0600E480: ; 0x0600E480
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _0600E4EC ; =0x0380FFF4
	ldrh r5, [r0, #2]
	ldr r0, [r1]
	mov r1, #0x1c
	ldr r2, [r0, #0x31c]
	mov r0, #0x1000000
	mla r6, r5, r1, r2
	bl sub_06008EF4
	ldr r1, _0600E4EC ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	ldreqh r0, [r6, #0x16]
	cmpeq r0, #1
	bne _0600E4D0
	mov r0, r5
	bl sub_0600EA74
_0600E4D0:
	ldrh r1, [r6, #0x16]
	mov r0, r4
	sub r1, r1, #1
	strh r1, [r6, #0x16]
	bl sub_06008EFC
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0600E4EC: .word 0x0380FFF4
	arm_func_end sub_0600E480

	arm_func_start sub_0600E4F0
sub_0600E4F0: ; 0x0600E4F0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r0, #0x1000000
	mov r5, r1
	bl sub_06008EF4
	ldr r3, _0600E5D4 ; =0x0380FFF4
	mov r4, r0
	cmp r5, #0x40
	bhs _0600E570
	ldr r0, [r3]
	mov r2, #1
	add r0, r0, #0x500
	ldrh r1, [r0, #0x30]
	orr r1, r1, r2, lsl r6
	strh r1, [r0, #0x30]
	ldr r0, [r3]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x32]
	orr r1, r1, r2, lsl r6
	strh r1, [r0, #0x32]
	ldr r0, [r3]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	bne _0600E5AC
	mov r0, r6
	bl sub_0600E978
	cmp r0, #0
	beq _0600E5AC
	mov r0, r6
	bl sub_0600E80C
	b _0600E5AC
_0600E570:
	ldr r2, [r3]
	mov r0, #1
	mvn r1, r0, lsl r6
	add r0, r2, #0x500
	ldrh r2, [r0, #0x32]
	and r1, r2, r1
	strh r1, [r0, #0x32]
	ldr r0, [r3]
	add r0, r0, #0x500
	ldrh r0, [r0, #0x2e]
	mov r0, r0, asr r6
	tst r0, #1
	beq _0600E5AC
	mov r0, r6
	bl sub_0600E654
_0600E5AC:
	ldr r1, _0600E5D4 ; =0x0380FFF4
	mov r0, #0x1c
	ldr r2, [r1]
	mul r1, r6, r0
	ldr r2, [r2, #0x31c]
	mov r0, r4
	strh r5, [r2, r1]
	bl sub_06008EFC
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0600E5D4: .word 0x0380FFF4
	arm_func_end sub_0600E4F0

	arm_func_start sub_0600E5D8
sub_0600E5D8: ; 0x0600E5D8
	ldr r3, _0600E5F4 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r3]
	ldr r3, [r3, #0x31c]
	mla r2, r0, r2, r3
	strh r1, [r2, #0xa]
	bx lr
	.align 2, 0
_0600E5F4: .word 0x0380FFF4
	arm_func_end sub_0600E5D8

	arm_func_start sub_0600E5F8
sub_0600E5F8: ; 0x0600E5F8
	ldr r3, _0600E648 ; =0x0380FFF4
	mov r2, #1
	ldr ip, [r3]
	mvn r3, r2, lsl r0
	add r2, ip, #0x12c
	add ip, r2, #0x400
	ldrh r2, [ip, #2]
	and r2, r2, r3
	orr r0, r2, r1, lsl r0
	strh r0, [ip, #2]
	ldrh r0, [ip, #6]
	ldrh r1, [ip, #2]
	mvn r0, r0
	tst r1, r0
	ldrne r0, _0600E64C ; =0x048080AC
	mov r1, #8
	strneh r1, [r0]
	ldreq r0, _0600E650 ; =0x048080AE
	streqh r1, [r0]
	bx lr
	.align 2, 0
_0600E648: .word 0x0380FFF4
_0600E64C: .word 0x048080AC
_0600E650: .word 0x048080AE
	arm_func_end sub_0600E5F8

	arm_func_start sub_0600E654
sub_0600E654: ; 0x0600E654
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0600E88C
	cmp r0, #0x40
	bne _0600E688
	ldr r1, _0600E690 ; =0x0380FFF4
	mov r0, #1
	ldr r2, [r1]
	mvn r1, r0, lsl r4
	add r0, r2, #0x500
	ldrh r2, [r0, #0x30]
	and r1, r2, r1
	strh r1, [r0, #0x30]
_0600E688:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600E690: .word 0x0380FFF4
	arm_func_end sub_0600E654

	arm_func_start sub_0600E694
sub_0600E694: ; 0x0600E694
	ldr r1, _0600E6B4 ; =0x0380FFF4
	mov r2, #1
	ldr r1, [r1]
	add r1, r1, #0x500
	ldrh r3, [r1, #0x30]
	orr r0, r3, r2, lsl r0
	strh r0, [r1, #0x30]
	bx lr
	.align 2, 0
_0600E6B4: .word 0x0380FFF4
	arm_func_end sub_0600E694

	arm_func_start sub_0600E6B8
sub_0600E6B8: ; 0x0600E6B8
	ldr r3, _0600E6D4 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r3]
	ldr r3, [r3, #0x31c]
	mla r2, r0, r2, r3
	strh r1, [r2, #0xc]
	bx lr
	.align 2, 0
_0600E6D4: .word 0x0380FFF4
	arm_func_end sub_0600E6B8

	arm_func_start sub_0600E6D8
sub_0600E6D8: ; 0x0600E6D8
	ldr r3, _0600E6F4 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r3]
	ldr r3, [r3, #0x31c]
	mla r2, r0, r2, r3
	strh r1, [r2, #0x10]
	bx lr
	.align 2, 0
_0600E6F4: .word 0x0380FFF4
	arm_func_end sub_0600E6D8

	arm_func_start sub_0600E6F8
sub_0600E6F8: ; 0x0600E6F8
	ldr r3, _0600E714 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r3]
	ldr r3, [r3, #0x31c]
	mla r2, r0, r2, r3
	strh r1, [r2, #0x14]
	bx lr
	.align 2, 0
_0600E714: .word 0x0380FFF4
	arm_func_end sub_0600E6F8

	arm_func_start sub_0600E718
sub_0600E718: ; 0x0600E718
	ldr r3, _0600E734 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r3]
	ldr r3, [r3, #0x31c]
	mla r2, r0, r2, r3
	strh r1, [r2, #0xe]
	bx lr
	.align 2, 0
_0600E734: .word 0x0380FFF4
	arm_func_end sub_0600E718

	arm_func_start sub_0600E738
sub_0600E738: ; 0x0600E738
	ldr r2, _0600E758 ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0x1a]
	strh r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0600E758: .word 0x0380FFF4
	arm_func_end sub_0600E738

	arm_func_start sub_0600E75C
sub_0600E75C: ; 0x0600E75C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _0600E808 ; =0x0380FFF4
	mov r7, r0
	ldr r1, [r1]
	mov r0, #0x1000000
	add r1, r1, #0x12c
	add r4, r1, #0x400
	bl sub_06008EF4
	mov r6, r0
	mov r5, #1
	mov r1, #2
	b _0600E7EC
_0600E78C:
	ldrh r0, [r4, #0xe]
	tst r0, r1
	bne _0600E7E4
	orr r0, r0, r1
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	bne _0600E7BC
	bl sub_0600A684
_0600E7BC:
	ldr r0, _0600E808 ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r0]
	mov r0, r6
	ldr r2, [r2, #0x31c]
	mla r1, r7, r1, r2
	strh r5, [r1, #2]
	bl sub_06008EFC
	mov r0, r5
	b _0600E800
_0600E7E4:
	add r5, r5, #1
	mov r1, r1, lsl #1
_0600E7EC:
	cmp r5, #0x10
	blo _0600E78C
	mov r0, r6
	bl sub_06008EFC
	mov r0, #0
_0600E800:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0600E808: .word 0x0380FFF4
	arm_func_end sub_0600E75C

	arm_func_start sub_0600E80C
sub_0600E80C: ; 0x0600E80C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0600E888 ; =0x0380FFF4
	mov r5, r0
	ldr r4, [r1]
	bl sub_0600EA74
	mov r0, r5
	bl sub_0600E978
	cmp r0, #0
	beq _0600E880
	ldr r1, _0600E888 ; =0x0380FFF4
	mov r2, #1
	ldr r3, [r1]
	mov r1, #0x1c
	ldr r3, [r3, #0x31c]
	mov ip, #0
	mla r1, r5, r1, r3
	strh ip, [r1, #2]
	add r1, r4, #0x500
	ldrh r3, [r1, #0x3a]
	mvn r0, r2, lsl r0
	and r0, r3, r0
	strh r0, [r1, #0x3a]
	ldrh r0, [r1, #0x38]
	sub r0, r0, #1
	strh r0, [r1, #0x38]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	bne _0600E880
	bl sub_0600A638
_0600E880:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600E888: .word 0x0380FFF4
	arm_func_end sub_0600E80C

	arm_func_start sub_0600E88C
sub_0600E88C: ; 0x0600E88C
	ldr r2, _0600E8A8 ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	mul r1, r0, r1
	ldr r0, [r2, #0x31c]
	ldrh r0, [r0, r1]
	bx lr
	.align 2, 0
_0600E8A8: .word 0x0380FFF4
	arm_func_end sub_0600E88C

	arm_func_start sub_0600E8AC
sub_0600E8AC: ; 0x0600E8AC
	ldr r1, _0600E8C8 ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x500
	ldrh r1, [r1, #0x30]
	mov r0, r1, asr r0
	and r0, r0, #1
	bx lr
	.align 2, 0
_0600E8C8: .word 0x0380FFF4
	arm_func_end sub_0600E8AC

	arm_func_start sub_0600E8CC
sub_0600E8CC: ; 0x0600E8CC
	ldr r1, _0600E8E8 ; =0x0380FFF4
	ldr r1, [r1]
	add r1, r1, #0x500
	ldrh r1, [r1, #0x2e]
	mov r0, r1, asr r0
	and r0, r0, #1
	bx lr
	.align 2, 0
_0600E8E8: .word 0x0380FFF4
	arm_func_end sub_0600E8CC

	arm_func_start sub_0600E8EC
sub_0600E8EC: ; 0x0600E8EC
	ldr r2, _0600E908 ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	add r0, r1, #4
	bx lr
	.align 2, 0
_0600E908: .word 0x0380FFF4
	arm_func_end sub_0600E8EC

	arm_func_start sub_0600E90C
sub_0600E90C: ; 0x0600E90C
	ldr r2, _0600E928 ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0xe]
	bx lr
	.align 2, 0
_0600E928: .word 0x0380FFF4
	arm_func_end sub_0600E90C

	arm_func_start sub_0600E92C
sub_0600E92C: ; 0x0600E92C
	ldr r2, _0600E948 ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0x14]
	bx lr
	.align 2, 0
_0600E948: .word 0x0380FFF4
	arm_func_end sub_0600E92C

	arm_func_start sub_0600E94C
sub_0600E94C: ; 0x0600E94C
	ldr r2, _0600E974 ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0x10]
	tst r0, #2
	movne r0, #0x14
	moveq r0, #0xa
	bx lr
	.align 2, 0
_0600E974: .word 0x0380FFF4
	arm_func_end sub_0600E94C

	arm_func_start sub_0600E978
sub_0600E978: ; 0x0600E978
	ldr r2, _0600E994 ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #2]
	bx lr
	.align 2, 0
_0600E994: .word 0x0380FFF4
	arm_func_end sub_0600E978

	arm_func_start sub_0600E998
sub_0600E998: ; 0x0600E998
	ldr r2, _0600E9B4 ; =0x0380FFF4
	mov r1, #0x1c
	ldr r2, [r2]
	ldr r2, [r2, #0x31c]
	mla r1, r0, r1, r2
	ldrh r0, [r1, #0x16]
	bx lr
	.align 2, 0
_0600E9B4: .word 0x0380FFF4
	arm_func_end sub_0600E998

	arm_func_start sub_0600E9B8
sub_0600E9B8: ; 0x0600E9B8
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl sub_0600E88C
	cmp r0, #0x40
	bne _0600EA64
	ldr r0, _0600EA6C ; =0x0380FFF4
	mov r1, #1
	ldr r2, [r0]
	add r0, r2, #0x500
	ldrh r0, [r0, #0x34]
	tst r0, r1, lsl r5
	bne _0600EA64
	add r0, r2, #0x300
	ldrh r2, [r0, #0xd8]
	ldr r1, _0600EA70 ; =0x0480425C
	mov r0, #0x1000000
	add r6, r2, r1
	bl sub_06008EF4
	mov r4, r0
	cmp r5, #0
	bne _0600EA28
	add r0, r6, #4
	bl sub_0600BA10
	orr r1, r0, #1
	add r0, r6, #4
	and r1, r1, #0xff
	bl sub_0600B9E4
	b _0600EA5C
_0600EA28:
	mov r0, r5
	bl sub_0600E978
	mov r5, r0
	add r0, r6, #5
	add r6, r0, r5, lsr #3
	mov r0, r6
	bl sub_0600BA10
	and r1, r5, #7
	mov r2, #1
	orr r1, r0, r2, lsl r1
	mov r0, r6
	and r1, r1, #0xff
	bl sub_0600B9E4
_0600EA5C:
	mov r0, r4
	bl sub_06008EFC
_0600EA64:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0600EA6C: .word 0x0380FFF4
_0600EA70: .word 0x0480425C
	arm_func_end sub_0600E9B8

	arm_func_start sub_0600EA74
sub_0600EA74: ; 0x0600EA74
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl sub_0600E88C
	cmp r0, #0x40
	bne _0600EB10
	ldr r0, _0600EB18 ; =0x0380FFF4
	ldr r2, _0600EB1C ; =0x0480425C
	ldr r1, [r0]
	mov r0, #0x1000000
	add r1, r1, #0x300
	ldrh r1, [r1, #0xd8]
	add r6, r1, r2
	bl sub_06008EF4
	mov r4, r0
	cmp r5, #0
	bne _0600EAD0
	add r0, r6, #4
	bl sub_0600BA10
	and r1, r0, #0xfe
	add r0, r6, #4
	and r1, r1, #0xff
	bl sub_0600B9E4
	b _0600EB08
_0600EAD0:
	mov r0, r5
	bl sub_0600E978
	mov r5, r0
	add r0, r6, #5
	add r6, r0, r5, lsr #3
	mov r0, r6
	bl sub_0600BA10
	and r1, r5, #7
	mov r2, #1
	mvn r1, r2, lsl r1
	and r1, r1, r0
	mov r0, r6
	and r1, r1, #0xff
	bl sub_0600B9E4
_0600EB08:
	mov r0, r4
	bl sub_06008EFC
_0600EB10:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0600EB18: .word 0x0380FFF4
_0600EB1C: .word 0x0480425C
	arm_func_end sub_0600EA74

	arm_func_start sub_0600EB20
sub_0600EB20: ; 0x0600EB20
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr fp, _0600ECD0 ; =0x0380FFF4
	mov sb, #0
	ldr r2, [fp]
	mov r8, #1
	ldr r1, [r2, #0x31c]
	add r0, r2, #0x500
	ldrh sl, [r0, #0x2c]
	add r0, r2, #0x12c
	add r7, r1, #0x1c
	add r5, r0, #0x400
	add r4, r2, #0x300
	b _0600ECBC
_0600EB54:
	ldrh r0, [r7]
	cmp r0, #0
	beq _0600ECAC
	ldrh r1, [r7, #0x18]
	cmp r1, #0
	ldrne r0, _0600ECD4 ; =0x0000FFFF
	cmpne r1, r0
	beq _0600ECA8
	sub r0, r1, #1
	strh r0, [r7, #0x18]
	ldrh r0, [r7, #0x18]
	cmp r0, #0
	bne _0600ECA8
	ldrh r0, [r7]
	cmp r0, #0x20
	blo _0600EC94
	mov r0, r8
	bl sub_0600E88C
	mov r6, r0
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_0600E4F0
	mov r0, r8
	bl sub_06013AF4
	ldrh r0, [r4, #0x50]
	cmp r0, #1
	bne _0600EC44
	cmp r6, #0x20
	bls _0600EC94
	ldr r1, [fp]
	mov r0, r8, lsl #0x10
	add r3, r1, #0x500
	ldrh r6, [r3, #0x34]
	mov r2, #1
	orr r2, r6, r2, lsl r8
	strh r2, [r3, #0x34]
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl sub_0600E5F8
	ldr r1, [fp]
	add r0, r7, #4
	add r3, r1, #0x500
	mov r1, #1
	ldrh r6, [r3, #0x30]
	mov r2, r1
	orr r2, r6, r2, lsl r8
	strh r2, [r3, #0x30]
	mov r2, #0
	bl sub_06014C50
	cmp r0, #0
	mov r1, #1
	beq _0600EC38
	strh r1, [r0]
	bl sub_06013E10
	add sb, sb, #1
	b _0600ECB4
_0600EC38:
	add r0, r7, #4
	bl sub_06010970
	b _0600EC94
_0600EC44:
	ldrh r0, [r4, #0xcc]
	cmp r8, r0
	bne _0600EC94
	add r0, r7, #4
	mov r1, #1
	mov r2, #0
	bl sub_06014C50
	cmp r0, #0
	beq _0600EC7C
	mov r1, #1
	strh r1, [r0]
	bl sub_06013E10
	add sb, sb, #1
	b _0600ECB4
_0600EC7C:
	mov r0, #0x20
	bl sub_0600A884
	bl sub_0600A7E0
	add r0, r7, #4
	mov r1, #1
	bl sub_06010970
_0600EC94:
	mov r0, #0
	strh r0, [r7]
	ldrh r0, [r5]
	sub r0, r0, #1
	strh r0, [r5]
_0600ECA8:
	add sb, sb, #1
_0600ECAC:
	cmp sb, sl
	bhs _0600ECC8
_0600ECB4:
	add r8, r8, #1
	add r7, r7, #0x1c
_0600ECBC:
	ldrh r0, [r4, #0x22]
	cmp r8, r0
	blo _0600EB54
_0600ECC8:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0600ECD0: .word 0x0380FFF4
_0600ECD4: .word 0x0000FFFF
	arm_func_end sub_0600EB20

	arm_func_start sub_0600ECD8
sub_0600ECD8: ; 0x0600ECD8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_06013AF4
	ldr r2, _0600ED1C ; =0x0380FFF4
	mov r0, #0x1c
	ldr r1, [r2]
	mul r0, r4, r0
	ldr r1, [r1, #0x31c]
	mov r3, #0
	strh r3, [r1, r0]
	ldr r0, [r2]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x2c]
	sub r1, r1, #1
	strh r1, [r0, #0x2c]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600ED1C: .word 0x0380FFF4
	arm_func_end sub_0600ECD8

	arm_func_start sub_0600ED20
sub_0600ED20: ; 0x0600ED20
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0600EDB0 ; =0x0380FFF4
	mov r2, #0x1c
	ldr r3, [r0]
	mov r0, #0
	add r1, r3, #0x300
	ldrh r5, [r1, #0x22]
	ldr r4, [r3, #0x31c]
	mul r2, r5, r2
	mov r1, r4
	bl sub_06000598
	ldr r1, _0600EDB0 ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0x10
	add r1, r1, #0x12c
	add r1, r1, #0x400
	bl sub_06000598
	ldr r2, _0600EDB4 ; =0x0000FFFF
	mov r3, #1
	strh r2, [r4, #0x1a]
	mov r0, #0x1c
	b _0600ED88
_0600ED7C:
	mla r1, r3, r0, r4
	strh r2, [r1, #0x1a]
	add r3, r3, #1
_0600ED88:
	cmp r3, r5
	blo _0600ED7C
	ldr r1, _0600EDB8 ; =0x060184D0
	mov r0, #0
	bl sub_0600EE44
	mov r0, #0
	mov r1, #0x40
	bl sub_0600E4F0
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600EDB0: .word 0x0380FFF4
_0600EDB4: .word 0x0000FFFF
_0600EDB8: .word 0x060184D0
	arm_func_end sub_0600ED20

	arm_func_start sub_0600EDBC
sub_0600EDBC: ; 0x0600EDBC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _0600EE3C ; =0x0380FFF4
	mov r6, #1
	ldr r2, [r0]
	mov sl, #0
	add r1, r2, #0x300
	add r0, r2, #0x12c
	ldr r4, [r2, #0x31c]
	ldrh r7, [r1, #0x22]
	add r5, r0, #0x400
	mov sb, #0x1a
	mov r8, #0x1c
	b _0600EE04
_0600EDF0:
	mla r1, r6, r8, r4
	mov r0, sl
	mov r2, sb
	bl sub_06000598
	add r6, r6, #1
_0600EE04:
	cmp r6, r7
	blo _0600EDF0
	mov r2, #1
	strh r2, [r5]
	mov r1, #0
	strh r1, [r5, #2]
	ldr r0, _0600EE40 ; =0x0000FFFE
	strh r2, [r5, #4]
	strh r0, [r5, #6]
	strh r1, [r5, #0xc]
	strh r1, [r5, #8]
	strh r2, [r5, #0xe]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_0600EE3C: .word 0x0380FFF4
_0600EE40: .word 0x0000FFFE
	arm_func_end sub_0600EDBC

	arm_func_start sub_0600EE44
sub_0600EE44: ; 0x0600EE44
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _0600EF20 ; =0x0380FFF4
	mov r7, r0
	ldr r4, [r2]
	mov r0, #0x1c
	mul r2, r7, r0
	ldr r3, [r4, #0x31c]
	mov r6, r1
	ldrh r0, [r3, r2]
	add r5, r3, r2
	cmp r0, #0
	addeq r0, r4, #0x500
	ldreqh r1, [r0, #0x2c]
	mov r2, #0x1a
	addeq r1, r1, #1
	streqh r1, [r0, #0x2c]
	mov r1, r5
	mov r0, #0
	bl sub_06000598
	ldr r0, _0600EF20 ; =0x0380FFF4
	mov r4, #1
	ldr r1, [r0]
	mov r0, r7, lsl #0x10
	add r2, r1, #0x500
	ldrh r3, [r2, #0x34]
	mvn r1, r4, lsl r7
	and r3, r3, r1
	mov r0, r0, lsr #0x10
	mov r1, #0
	strh r3, [r2, #0x34]
	bl sub_0600E5F8
	ldr r0, _0600EF20 ; =0x0380FFF4
	mov r1, r6
	ldr r2, [r0]
	add r0, r5, #4
	add r2, r2, #0x500
	ldrh r3, [r2, #0x30]
	orr r3, r3, r4, lsl r7
	strh r3, [r2, #0x30]
	bl sub_0600A928
	ldr r2, _0600EF24 ; =0x0000FFFF
	mov r0, r7, lsl #0x10
	ldr r1, _0600EF20 ; =0x0380FFF4
	strh r2, [r5, #0x14]
	ldr r1, [r1]
	mov r0, r0, lsr #0x10
	add r1, r1, #0x300
	ldrh r2, [r1, #0xa6]
	mov r1, #0x20
	strh r2, [r5, #0x10]
	ldrh r2, [r5, #0x1a]
	strh r2, [r5, #0x18]
	bl sub_0600E4F0
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0600EF20: .word 0x0380FFF4
_0600EF24: .word 0x0000FFFF
	arm_func_end sub_0600EE44

	arm_func_start sub_0600EF28
sub_0600EF28: ; 0x0600EF28
	ldr r1, _0600EF50 ; =0x0480819C
	mov r2, #0xfa0
	b _0600EF44
_0600EF34:
	ldrh r0, [r1]
	tst r0, #0x80
	bxne lr
	sub r2, r2, #1
_0600EF44:
	cmp r2, #0
	bne _0600EF34
	bx lr
	.align 2, 0
_0600EF50: .word 0x0480819C
	arm_func_end sub_0600EF28

	arm_func_start sub_0600EF54
sub_0600EF54: ; 0x0600EF54
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r2, _0600EFD4 ; =0x000082EA
	mov r3, #0
	umull lr, ip, r0, r2
	mla ip, r0, r3, ip
	mov r0, r3
	mla ip, r0, r2, ip
	mov r0, lr, lsr #6
	mov r4, #1
	mov r5, r1
	mov r1, ip, lsr #6
	orr r0, r0, ip, lsl #26
	mov r2, #0x3e8
	str r4, [sp, #4]
	bl sub_0600B1CC
	add r3, sp, #4
	str r3, [sp]
	ldr r2, _0600EFD8 ; =0x0380FFF4
	mov r3, r5
	ldr r2, [r2]
	add ip, r2, #0x234
	mov r2, r1
	mov r1, r0
	add r0, ip, #0x400
	bl sub_06001B14
_0600EFBC:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0600EFBC
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600EFD4: .word 0x000082EA
_0600EFD8: .word 0x0380FFF4
	arm_func_end sub_0600EF54

	arm_func_start sub_0600EFDC
sub_0600EFDC: ; 0x0600EFDC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0600F040 ; =0x04808028
	ldr lr, _0600F044 ; =0x04000208
	mov r5, #1
	add r2, r1, #0x1ec
	add r3, r1, #0x174
	mov ip, #0
	b _0600F030
_0600EFFC:
	ldrh r4, [lr]
	strh ip, [lr]
	ldrh r0, [r3]
	and r0, r0, #3
	cmp r0, #3
	ldrneh r0, [r2]
	cmpne r0, #5
	cmpne r0, #7
	cmpne r0, #8
	strneh ip, [r1]
	ldrh r0, [lr]
	movne r5, ip
	strh r4, [lr]
_0600F030:
	cmp r5, #0
	bne _0600EFFC
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600F040: .word 0x04808028
_0600F044: .word 0x04000208
	arm_func_end sub_0600EFDC

	arm_func_start sub_0600F048
sub_0600F048: ; 0x0600F048
	ldr r1, _0600F078 ; =0x0480815E
	mov r2, #0
	b _0600F068
_0600F054:
	ldrh r0, [r1]
	tst r0, #1
	moveq r0, #0
	bxeq lr
	add r2, r2, #1
_0600F068:
	cmp r2, #0x2800
	blo _0600F054
	mov r0, #1
	bx lr
	.align 2, 0
_0600F078: .word 0x0480815E
	arm_func_end sub_0600F048

	arm_func_start sub_0600F07C
sub_0600F07C: ; 0x0600F07C
	ldr r1, _0600F0AC ; =0x04808180
	mov r2, #0
	b _0600F09C
_0600F088:
	ldrh r0, [r1]
	tst r0, #1
	moveq r0, #0
	bxeq lr
	add r2, r2, #1
_0600F09C:
	cmp r2, #0x2800
	blo _0600F088
	mov r0, #1
	bx lr
	.align 2, 0
_0600F0AC: .word 0x04808180
	arm_func_end sub_0600F07C

	arm_func_start sub_0600F0B0
sub_0600F0B0: ; 0x0600F0B0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _0600F360 ; =0x0380FFF4
	mov r3, #0
	ldr r2, [r4]
	mov r6, r3
	add r0, r2, #0x24
	add r5, r0, #0x400
	ldrh r0, [r5, #4]
	cmp r0, #0
	bne _0600F358
	ldr r0, [r2, #0x200]
	sub r2, r3, #1
	str r0, [r5]
	cmp r0, r2
	beq _0600F358
	ldr r2, [r4]
	ldrh r4, [r0, #0xe]
	add ip, r2, #0x300
	ldrh r2, [ip, #0x3e]
	add r4, r0, r4, lsl #1
	cmp r2, #0
	movne r0, #1
	strneh r0, [r4, #0x12]
	movne r0, #6
	strneh r0, [r4, #0x14]
	bne _0600F310
	ldrh r7, [r0, #0xc]
	ldrh r2, [r4, #0x10]
	cmp r7, r2
	movne r0, #0xd
	strneh r0, [r4, #0x14]
	bne _0600F310
	and r2, r7, #0xff00
	cmp r2, #0x100
	bgt _0600F14C
	bge _0600F198
	cmp r2, #0
	beq _0600F168
	b _0600F278
_0600F14C:
	cmp r2, #0x200
	bgt _0600F15C
	beq _0600F1B8
	b _0600F278
_0600F15C:
	cmp r2, #0x300
	beq _0600F264
	b _0600F278
_0600F168:
	ldrh r6, [r5, #4]
	ldr r1, _0600F364 ; =0x06018674
	tst r6, #1
	and r2, r7, #0xff
	mov r6, #1
	mov lr, #0xb
	movne r3, #2
	bne _0600F280
	ldrh r7, [ip, #0x4c]
	cmp r7, #0x20
	movlo r3, r6
	b _0600F280
_0600F198:
	ldrh r6, [ip, #0x4c]
	ldr r1, _0600F368 ; =0x060185EC
	cmp r6, #0x40
	and r2, r7, #0xff
	mov r6, #2
	mov lr, #5
	movne r3, #1
	b _0600F280
_0600F1B8:
	and r2, r7, #0xff
	cmp r2, #0x40
	bhs _0600F1E0
	ldrh r1, [ip, #0x4c]
	mov r6, #4
	cmp r1, #0x10
	ldr r1, _0600F36C ; =0x060187DC
	movlo r3, #1
	mov lr, #0x17
	b _0600F280
_0600F1E0:
	cmp r2, #0x80
	bhs _0600F210
	ldrh r1, [ip, #0x4c]
	mov r6, #8
	cmp r1, #0x40
	sub r1, r2, #0x40
	mov r2, r1, lsl #0x10
	ldr r1, _0600F370 ; =0x06018644
	movne r3, #1
	mov r2, r2, lsr #0x10
	mov lr, #6
	b _0600F280
_0600F210:
	ldrh r1, [ip, #0x4c]
	cmp r2, #0xc0
	bhs _0600F240
	cmp r1, #0x10
	sub r1, r2, #0x80
	mov r2, r1, lsl #0x10
	ldr r1, _0600F374 ; =0x06018724
	movlo r3, #1
	mov r2, r2, lsr #0x10
	mov r6, #0x10
	mov lr, #0x17
	b _0600F280
_0600F240:
	cmp r1, #0x10
	sub r1, r2, #0xc0
	mov r2, r1, lsl #0x10
	ldr r1, _0600F378 ; =0x06018614
	movlo r3, #1
	mov r2, r2, lsr #0x10
	mov r6, #0x20
	mov lr, #6
	b _0600F280
_0600F264:
	ldr r1, _0600F37C ; =0x060186CC
	and r2, r7, #0xff
	mov r6, #0x40
	mov lr, #0xb
	b _0600F280
_0600F278:
	mov r2, #1
	mov lr, #0
_0600F280:
	cmp r2, lr
	movhi r3, #3
	bhi _0600F2B0
	mov lr, r2, lsl #3
	ldrh r7, [r0, #0xe]
	ldrh ip, [r1, lr]
	cmp r7, ip
	addhs ip, r1, lr
	ldrhsh lr, [r4, #0x12]
	ldrhsh ip, [ip, #2]
	cmphs lr, ip
	movlo r3, #4
_0600F2B0:
	cmp r3, #0
	movne r0, #1
	strneh r0, [r4, #0x12]
	strneh r3, [r4, #0x14]
	bne _0600F310
	ldrh r3, [r5, #4]
	add r1, r1, r2, lsl #3
	orr r2, r3, r6
	strh r2, [r5, #4]
	ldr r2, [r1, #4]
	add r1, r4, #0x10
	mov lr, pc
	bx r2
	strh r0, [r4, #0x14]
	ldrh r0, [r4, #0x14]
	cmp r0, #0x80
	beq _0600F358
	cmp r0, #0x81
	bne _0600F310
	ldrh r1, [r5, #4]
	mvn r0, r6
	and r0, r1, r0
	strh r0, [r5, #4]
	b _0600F334
_0600F310:
	ldrh r1, [r5, #4]
	mvn r0, r6
	and r0, r1, r0
	strh r0, [r5, #4]
	ldr r0, _0600F360 ; =0x0380FFF4
	ldr r1, [r5]
	ldr r0, [r0]
	add r0, r0, #0x200
	bl sub_0600F388
_0600F334:
	ldr r0, _0600F360 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x200
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _0600F358
	mov r0, #2
	mov r1, #0xb
	bl sub_06008F04
_0600F358:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0600F360: .word 0x0380FFF4
_0600F364: .word 0x06018674
_0600F368: .word 0x060185EC
_0600F36C: .word 0x060187DC
_0600F370: .word 0x06018644
_0600F374: .word 0x06018724
_0600F378: .word 0x06018614
_0600F37C: .word 0x060186CC
	arm_func_end sub_0600F0B0

	arm_func_start sub_0600F380
sub_0600F380: ; 0x0600F380
	mov r0, #3
	bx lr
	arm_func_end sub_0600F380

	arm_func_start sub_0600F388
sub_0600F388: ; 0x0600F388
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0600F40C ; =0x0380FFF4
	mov r5, r0
	ldr r3, [r2]
	mov r4, r1
	add r2, r3, #0x100
	ldrh r2, [r2, #0xfc]
	cmp r2, #0
	beq _0600F3C8
	mov r2, r4
	add r1, r3, #0x1f4
	bl sub_060091C4
	mov r0, #2
	mov r1, #0x13
	bl sub_06008F04
	b _0600F404
_0600F3C8:
	ldr r0, [r3, #0x304]
	mov r2, #0
	bl sub_06000284
	cmp r0, #0
	beq _0600F3EC
	mov r0, r5
	mov r1, r4
	bl sub_0600932C
	b _0600F404
_0600F3EC:
	ldr r1, _0600F40C ; =0x0380FFF4
	mov r0, r5
	ldr r1, [r1]
	mov r2, r4
	add r1, r1, #0x1f4
	bl sub_060091C4
_0600F404:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600F40C: .word 0x0380FFF4
	arm_func_end sub_0600F388

	arm_func_start sub_0600F410
sub_0600F410: ; 0x0600F410
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r6, _0600F46C ; =0x0380FFF4
	mov r5, #0
	ldr r0, [r6]
	mvn r4, #0
	ldr r7, [r0, #0x1f4]
	b _0600F45C
_0600F42C:
	ldr r0, [r0, #0x304]
	mov r1, r7
	mov r2, r5
	bl sub_06000284
	cmp r0, #0
	beq _0600F464
	ldr r0, [r6]
	mov r1, r7
	add r0, r0, #0x1f4
	bl sub_0600932C
	ldr r0, [r6]
	ldr r7, [r0, #0x1f4]
_0600F45C:
	cmp r7, r4
	bne _0600F42C
_0600F464:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0600F46C: .word 0x0380FFF4
	arm_func_end sub_0600F410

	arm_func_start sub_0600F470
sub_0600F470: ; 0x0600F470
	ldr r0, _0600F488 ; =0x0380FFF4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x400
	strh r1, [r0, #0x28]
	bx lr
	.align 2, 0
_0600F488: .word 0x0380FFF4
	arm_func_end sub_0600F470

	arm_func_start sub_0600F48C
sub_0600F48C: ; 0x0600F48C
	stmdb sp!, {r4, lr}
	mov r2, #1
	strh r2, [r1, #2]
	mov r4, r0
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	movhi r0, #5
	bhi _0600F4C4
	bl sub_0600B1D4
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	bne _0600F4C0
	bl sub_0600A9C4
_0600F4C0:
	mov r0, #0
_0600F4C4:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_0600F48C

	arm_func_start sub_0600F4CC
sub_0600F4CC: ; 0x0600F4CC
	stmdb sp!, {r4, lr}
	mov r2, #9
	strh r2, [r1, #2]
	mov r4, r0
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	movhi r0, #5
	bhi _0600F568
	ldrh r1, [r4, #0x12]
	cmp r1, #1
	movhi r0, #5
	bhi _0600F568
	ldrh r1, [r4, #0x14]
	cmp r1, #1
	movhi r0, #5
	bhi _0600F568
	bl sub_0600A3F0
	ldrh r0, [r4, #0x10]
	cmp r0, #1
	bne _0600F554
	ldrh r0, [r4, #0x12]
	cmp r0, #1
	bne _0600F534
	ldr r0, _0600F570 ; =0x00008001
	bl sub_0600A484
	b _0600F53C
_0600F534:
	mov r0, #0
	bl sub_0600A484
_0600F53C:
	ldr r0, _0600F574 ; =0x0380FFF4
	ldrh r1, [r4, #0x14]
	ldr r0, [r0]
	add r0, r0, #0x300
	strh r1, [r0, #0x58]
	b _0600F564
_0600F554:
	mov r0, #0x8000
	bl sub_0600A484
	mov r0, #2
	bl sub_0600A458
_0600F564:
	mov r0, #0
_0600F568:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600F570: .word 0x00008001
_0600F574: .word 0x0380FFF4
	arm_func_end sub_0600F4CC

	arm_func_start sub_0600F578
sub_0600F578: ; 0x0600F578
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _0600F6B4 ; =0x0380FFF4
	mov r5, r1
	ldr r3, [r2]
	ldrh r2, [r5, #2]
	add r1, r3, #4
	add r4, r1, #0x400
	sub r1, r2, #3
	strh r1, [r4, #4]
	mov r1, #3
	strh r1, [r5, #2]
	add r1, r3, #0x300
	ldrh r1, [r1, #0x2e]
	mov r6, r0
	cmp r1, #1
	cmpne r1, #3
	cmpne r1, #2
	movne r0, #0xb
	bne _0600F6AC
	ldr r0, _0600F6B4 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0x20
	movlo r0, #1
	blo _0600F6AC
	ldrh r0, [r6, #0x16]
	cmp r0, #0x20
	movhi r0, #5
	bhi _0600F6AC
	ldrh r0, [r6, #0x38]
	cmp r0, #1
	movhi r0, #5
	bhi _0600F6AC
	add r0, r6, #0x3a
	bl sub_0600BA10
	cmp r0, #0
	moveq r0, #5
	beq _0600F6AC
	ldrh r0, [r6, #0x4a]
	cmp r0, #0x3e8
	movhi r0, #5
	bhi _0600F6AC
	cmp r0, #0xa
	movlo r0, #5
	blo _0600F6AC
	ldrh r0, [r6, #0x4c]
	cmp r0, #0x10
	movhi r0, #5
	bhi _0600F6AC
	mov r8, #0
	add r7, r6, #0x3a
	b _0600F670
_0600F64C:
	add r0, r7, r8
	bl sub_0600BA10
	cmp r0, #0
	beq _0600F678
	bl sub_0600ACF4
	cmp r0, #0
	moveq r0, #5
	beq _0600F6AC
	add r8, r8, #1
_0600F670:
	cmp r8, #0x10
	blo _0600F64C
_0600F678:
	add r0, r6, #0x10
	bl sub_06009D10
	ldrh r0, [r6, #0x16]
	add r1, r6, #0x18
	bl sub_06009D74
	str r6, [r4, #0x18]
	str r5, [r4, #0x1c]
	mov r2, #0x10
	mov r0, #2
	mov r1, #0
	strh r2, [r4]
	bl sub_06008F04
	mov r0, #0x80
_0600F6AC:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0600F6B4: .word 0x0380FFF4
	arm_func_end sub_0600F578

	arm_func_start sub_0600F6B8
sub_0600F6B8: ; 0x0600F6B8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0600F868 ; =0x0380FFF4
	mov r5, r1
	ldr r3, [r2]
	mov r1, #5
	strh r1, [r5, #2]
	add r1, r3, #0x300
	ldrh r2, [r1, #0x2e]
	add r1, r3, #4
	mov r6, r0
	cmp r2, #3
	add r0, r3, #0x344
	cmpne r2, #2
	add r4, r1, #0x400
	movne r0, #0xb
	bne _0600F860
	ldrh r0, [r0, #8]
	cmp r0, #0x20
	movlo r0, #1
	blo _0600F860
	mov r0, #0x20
	bl sub_0600A884
	ldrh r0, [r6, #0x18]
	tst r0, #1
	movne r0, #5
	bne _0600F860
	ldrh r0, [r6, #0x1e]
	cmp r0, #0
	moveq r0, #5
	beq _0600F860
	cmp r0, #0x20
	movhi r0, #5
	bhi _0600F860
	ldrh r0, [r6, #0x46]
	cmp r0, #0xa
	movlo r0, #5
	blo _0600F860
	cmp r0, #0x3e8
	movhi r0, #5
	bhi _0600F860
	ldrh r0, [r6, #0x48]
	cmp r0, #0xff
	movhi r0, #5
	bhi _0600F860
	ldrh r0, [r6, #0x4a]
	ldr r1, _0600F86C ; =0x0000FFF0
	tst r0, r1
	movne r0, #5
	bne _0600F860
	bl sub_0600ACF4
	cmp r0, #0
	moveq r0, #5
	beq _0600F860
	ldrh r2, [r6, #0x42]
	mov r0, #0x1000
	rsb r0, r0, #0
	tst r2, r0
	movne r0, #5
	bne _0600F860
	ldrh r1, [r6, #0x44]
	tst r1, r0
	movne r0, #5
	bne _0600F860
	cmp r2, #0
	moveq r0, #5
	beq _0600F860
	orrs r0, r1, r2
	moveq r0, #5
	beq _0600F860
	ldrh r0, [r6, #0x10]
	cmp r0, #0x7d0
	movhi r0, #5
	bhi _0600F860
	mov r0, #0
	bl sub_06017F08
	cmp r0, #0
	movne r0, #0xe
	bne _0600F860
	ldrh r0, [r6, #0x40]
	tst r0, #0x20
	beq _0600F808
	mov r0, #1
	bl sub_06009A34
	b _0600F810
_0600F808:
	mov r0, #0
	bl sub_06009A34
_0600F810:
	add r0, r6, #0x18
	bl sub_06009D10
	ldrh r0, [r6, #0x1e]
	add r1, r6, #0x20
	bl sub_06009D74
	ldrh r0, [r6, #0x46]
	bl sub_06009E84
	ldrh r0, [r6, #0x4a]
	mov r1, #0
	bl sub_0600A0A4
	add r0, r6, #0x42
	bl sub_0600A330
	str r6, [r4, #0x18]
	str r5, [r4, #0x1c]
	mov r2, #0x20
	mov r0, #2
	mov r1, #1
	strh r2, [r4]
	bl sub_06008F04
	mov r0, #0x80
_0600F860:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0600F868: .word 0x0380FFF4
_0600F86C: .word 0x0000FFF0
	arm_func_end sub_0600F6B8

	arm_func_start sub_0600F870
sub_0600F870: ; 0x0600F870
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0600F940 ; =0x0380FFF4
	mov r5, r1
	ldr r3, [r2]
	mov r1, #6
	strh r1, [r5, #2]
	add r1, r3, #0x300
	ldrh r2, [r1, #0x2e]
	add r1, r3, #4
	mov r6, r0
	cmp r2, #3
	add r0, r3, #0x344
	cmpne r2, #2
	add r4, r1, #0x400
	movne r0, #0xb
	bne _0600F938
	ldrh r0, [r0, #8]
	cmp r0, #0x20
	movlo r0, #1
	blo _0600F938
	ldrh r0, [r6, #0x10]
	tst r0, #1
	movne r0, #5
	bne _0600F938
	ldrh r0, [r6, #0x16]
	cmp r0, #1
	movhi r0, #5
	bhi _0600F938
	ldrh r0, [r6, #0x18]
	cmp r0, #0x7d0
	movhi r0, #5
	bhi _0600F938
	cmp r0, #0xa
	movlo r0, #5
	blo _0600F938
	mov r0, #0x20
	bl sub_0600A884
	str r6, [r4, #0x18]
	str r5, [r4, #0x1c]
	mov r0, #0x30
	strh r0, [r4]
	ldr r1, [r4, #0x18]
	add r0, r5, #8
	ldrh r1, [r1, #0x16]
	strh r1, [r5, #0xe]
	ldr r1, [r4, #0x18]
	add r1, r1, #0x10
	bl sub_0600A928
	bl sub_060102D0
	mov r0, #0x80
_0600F938:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0600F940: .word 0x0380FFF4
	arm_func_end sub_0600F870

	arm_func_start sub_0600F944
sub_0600F944: ; 0x0600F944
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _0600FA74 ; =0x0380FFF4
	mov r6, r1
	ldr r2, [r3]
	mov r1, #4
	strh r1, [r6, #2]
	ldr r3, [r3]
	add r1, r2, #4
	add r2, r3, #0x300
	ldrh r2, [r2, #0x2e]
	mov r7, r0
	cmp r2, #3
	cmpne r2, #2
	cmpne r2, #1
	add r5, r1, #0x400
	movne r0, #0xb
	bne _0600FA6C
	add r0, r3, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0x30
	movlo r0, #1
	blo _0600FA6C
	add r0, r2, #0xfe
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _0600F9C4
	ldrh r0, [r7, #0x10]
	tst r0, #1
	movne r0, #5
	bne _0600FA6C
_0600F9C4:
	add r0, r6, #6
	add r1, r7, #0x10
	bl sub_0600A928
	ldrh r1, [r7, #0x16]
	add r0, r6, #6
	mov r2, #0
	bl sub_06014C50
	movs r4, r0
	moveq r0, #8
	beq _0600FA6C
	str r7, [r5, #0x18]
	str r6, [r5, #0x1c]
	str r4, [r5, #4]
	mov r0, #0x41
	strh r0, [r5]
	ldrh r0, [r7, #0x10]
	tst r0, #1
	beq _0600FA58
	ldr r2, _0600FA74 ; =0x0380FFF4
	sub r1, r4, #0x10
	ldr r0, [r2]
	ldr r0, [r0, #0x3ec]
	strh r0, [r4, #4]
	ldr r0, [r2]
	add r0, r0, #0x188
	bl sub_0600E394
	ldr r0, _0600FA74 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x32]
	ldrh r2, [r0, #0x2e]
	mvn r0, r1
	tst r2, r0
	bne _0600FA68
	mov r0, #2
	bl sub_06012C88
	b _0600FA68
_0600FA58:
	add r0, r7, #0x10
	bl sub_06013BEC
	mov r0, r4
	bl sub_06013E10
_0600FA68:
	mov r0, #0x80
_0600FA6C:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0600FA74: .word 0x0380FFF4
	arm_func_end sub_0600F944

	arm_func_start sub_0600FA78
sub_0600FA78: ; 0x0600FA78
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _0600FB4C ; =0x0380FFF4
	mov r6, r1
	ldr r3, [r2]
	mov r1, #3
	strh r1, [r6, #2]
	add r1, r3, #0x300
	ldrh r2, [r1, #0x2e]
	add r1, r3, #4
	cmp r2, #3
	mov r7, r0
	cmpne r2, #2
	add r4, r3, #0x344
	add r5, r1, #0x400
	movne r0, #0xb
	bne _0600FB44
	ldrh r0, [r4, #8]
	cmp r0, #0x30
	movlo r0, #1
	blo _0600FB44
	ldrh r0, [r7, #0x10]
	tst r0, #1
	movne r0, #5
	bne _0600FB44
	ldrh r0, [r7, #0x16]
	cmp r0, #0
	moveq r0, #5
	beq _0600FB44
	cmp r0, #0xff
	movhi r0, #5
	bhi _0600FB44
	ldrh r0, [r7, #0x18]
	cmp r0, #0x7d0
	movhi r0, #5
	bhi _0600FB44
	cmp r0, #0xa
	movlo r0, #5
	blo _0600FB44
	mov r0, #0x30
	bl sub_0600A884
	bl sub_0600A7E0
	ldrh r1, [r7, #0x16]
	mov r0, #0x50
	strh r1, [r4, #0x70]
	ldrh r1, [r7, #0x16]
	strh r1, [r4, #0x72]
	str r7, [r5, #0x18]
	str r6, [r5, #0x1c]
	strh r0, [r5]
	bl sub_060103F4
	mov r0, #0x80
_0600FB44:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0600FB4C: .word 0x0380FFF4
	arm_func_end sub_0600FA78

	arm_func_start sub_0600FB50
sub_0600FB50: ; 0x0600FB50
	stmdb sp!, {r3, lr}
	ldr r3, _0600FC0C ; =0x0380FFF4
	mov r2, #3
	ldr ip, [r3]
	strh r2, [r1, #2]
	add r2, ip, #0x300
	ldrh r3, [r2, #0x2e]
	add r2, ip, #4
	cmp r3, #3
	cmpne r3, #2
	add ip, ip, #0x344
	add lr, r2, #0x400
	movne r0, #0xb
	bne _0600FC04
	ldrh r2, [ip, #8]
	cmp r2, #0x30
	movlo r0, #1
	blo _0600FC04
	ldrh r2, [r0, #0x10]
	tst r2, #1
	movne r0, #5
	bne _0600FC04
	ldrh r3, [r0, #0x16]
	cmp r3, #1
	movlo r0, #5
	blo _0600FC04
	cmp r3, #0xff
	movhi r0, #5
	bhi _0600FC04
	ldrh r2, [r0, #0x18]
	cmp r2, #0x7d0
	movhi r0, #5
	bhi _0600FC04
	cmp r2, #0xa
	movlo r0, #5
	blo _0600FC04
	strh r3, [ip, #0x70]
	ldrh r3, [r0, #0x16]
	mov r2, #0x60
	strh r3, [ip, #0x72]
	str r0, [lr, #0x18]
	str r1, [lr, #0x1c]
	strh r2, [lr]
	bl sub_060104F0
	mov r0, #0x80
_0600FC04:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600FC0C: .word 0x0380FFF4
	arm_func_end sub_0600FB50

	arm_func_start sub_0600FC10
sub_0600FC10: ; 0x0600FC10
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _0600FD18 ; =0x0380FFF4
	mov r6, r1
	ldr r2, [r3]
	mov r1, #1
	strh r1, [r6, #2]
	ldr r3, [r3]
	add r1, r2, #4
	add r2, r3, #0x300
	ldrh r2, [r2, #0x2e]
	mov r7, r0
	cmp r2, #0
	add r5, r1, #0x400
	moveq r0, #0xb
	beq _0600FD10
	cmp r2, #1
	beq _0600FC64
	ldrh r0, [r7, #0x10]
	tst r0, #1
	movne r0, #5
	bne _0600FD10
_0600FC64:
	add r0, r3, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0x40
	movne r0, #1
	bne _0600FD10
	ldrh r1, [r7, #0x16]
	add r0, r7, #0x10
	bl sub_06014438
	movs r4, r0
	moveq r0, #8
	beq _0600FD10
	str r7, [r5, #0x18]
	str r6, [r5, #0x1c]
	str r4, [r5, #4]
	mov r0, #0x71
	strh r0, [r5]
	ldrh r0, [r7, #0x10]
	tst r0, #1
	beq _0600FCFC
	ldr r2, _0600FD18 ; =0x0380FFF4
	sub r1, r4, #0x10
	ldr r0, [r2]
	ldr r0, [r0, #0x3ec]
	strh r0, [r4, #4]
	ldr r0, [r2]
	add r0, r0, #0x188
	bl sub_0600E394
	ldr r0, _0600FD18 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x32]
	ldrh r2, [r0, #0x2e]
	mvn r0, r1
	tst r2, r0
	bne _0600FD0C
	mov r0, #2
	bl sub_06012C88
	b _0600FD0C
_0600FCFC:
	add r0, r7, #0x10
	bl sub_06013BEC
	mov r0, r4
	bl sub_06013E10
_0600FD0C:
	mov r0, #0x80
_0600FD10:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0600FD18: .word 0x0380FFF4
	arm_func_end sub_0600FC10

	arm_func_start sub_0600FD1C
sub_0600FD1C: ; 0x0600FD1C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _0600FEB0 ; =0x0380FFF4
	mov r2, #1
	ldr r3, [r3]
	mov r6, r0
	strh r2, [r1, #2]
	add r5, r3, #0x31c
	ldrh r0, [r5, #0x12]
	add r4, r3, #0x344
	cmp r0, #1
	cmpne r0, #0
	movne r0, #0xb
	bne _0600FEA8
	ldrh r0, [r4, #8]
	cmp r0, #0x20
	movne r0, #1
	bne _0600FEA8
	ldrh r0, [r6, #0x10]
	cmp r0, #0x20
	movhi r0, #5
	bhi _0600FEA8
	cmp r0, #0
	moveq r0, #5
	beq _0600FEA8
	ldrh r0, [r6, #0x32]
	cmp r0, #0xa
	movlo r0, #5
	blo _0600FEA8
	cmp r0, #0x3e8
	movhi r0, #5
	bhi _0600FEA8
	ldrh r0, [r6, #0x34]
	cmp r0, #0
	moveq r0, #5
	beq _0600FEA8
	cmp r0, #0xff
	movhi r0, #5
	bhi _0600FEA8
	ldrh r0, [r6, #0x36]
	ldr r1, _0600FEB4 ; =0x0000FFF0
	tst r0, r1
	movne r0, #5
	bne _0600FEA8
	bl sub_0600ACF4
	cmp r0, #0
	moveq r0, #5
	beq _0600FEA8
	ldrh r1, [r6, #0x38]
	cmp r1, #0
	moveq r0, #5
	beq _0600FEA8
	mov r0, #0x1000
	rsb r0, r0, #0
	tst r1, r0
	movne r0, #5
	bne _0600FEA8
	ldrh r1, [r6, #0x3a]
	cmp r1, #0
	moveq r0, #5
	beq _0600FEA8
	tst r1, r0
	movne r0, #5
	bne _0600FEA8
	ldrh r0, [r6, #0x3c]
	cmp r0, #0x80
	movhi r0, #5
	bhi _0600FEA8
	mov r0, #0
	bl sub_06017F08
	cmp r0, #0
	movne r0, #0xe
	bne _0600FEA8
	ldrh r0, [r5, #0x12]
	cmp r0, #0
	bne _0600FE54
	ldr r0, _0600FEB8 ; =0x060184D0
	bl sub_06009D10
	b _0600FE5C
_0600FE54:
	add r0, r5, #8
	bl sub_06009D10
_0600FE5C:
	ldrh r0, [r6, #0x10]
	add r1, r6, #0x12
	bl sub_06009D74
	ldrh r0, [r6, #0x32]
	bl sub_06009E84
	ldrh r0, [r6, #0x34]
	bl sub_06009EDC
	ldrh r0, [r6, #0x36]
	mov r1, #0
	bl sub_0600A0A4
	add r0, r6, #0x38
	bl sub_0600A330
	ldrh r0, [r6, #0x3c]
	add r1, r6, #0x3e
	bl sub_0600A6B4
	mov r0, #0
	strh r0, [r4, #0xa4]
	bl sub_0600AE14
	mov r0, #0
_0600FEA8:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0600FEB0: .word 0x0380FFF4
_0600FEB4: .word 0x0000FFF0
_0600FEB8: .word 0x060184D0
	arm_func_end sub_0600FD1C

	arm_func_start sub_0600FEBC
sub_0600FEBC: ; 0x0600FEBC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _0600FF9C ; =0x0380FFF4
	mov r5, r1
	ldr r3, [r2]
	mov r1, #0x12
	strh r1, [r5, #2]
	ldr r2, [r2]
	add r1, r3, #4
	add r2, r2, #0x300
	ldrh r2, [r2, #0x4c]
	mov r6, r0
	cmp r2, #0x20
	add r4, r1, #0x400
	movne r0, #1
	bne _0600FF94
	ldrh r0, [r6, #0x12]
	cmp r0, #3
	movhi r0, #5
	bhi _0600FF94
	ldrh r0, [r6, #0x14]
	cmp r0, #0x3f
	movhi r0, #5
	bhi _0600FF94
	ldrh r0, [r6, #0x16]
	cmp r0, #0
	moveq r0, #5
	beq _0600FF94
	cmp r0, #0x3e8
	movhi r0, #5
	bhi _0600FF94
	mov r8, #0
	add r7, r6, #0x18
	b _0600FF64
_0600FF40:
	add r0, r7, r8
	bl sub_0600BA10
	cmp r0, #0
	beq _0600FF6C
	bl sub_0600ACF4
	cmp r0, #0
	moveq r0, #5
	beq _0600FF94
	add r8, r8, #1
_0600FF64:
	cmp r8, #0x10
	blo _0600FF40
_0600FF6C:
	cmp r8, #0
	moveq r0, #5
	beq _0600FF94
	str r6, [r4, #0x18]
	str r5, [r4, #0x1c]
	mov r0, #0x80
	strh r0, [r4]
	strh r0, [r5, #4]
	bl sub_060105E4
	mov r0, #0x80
_0600FF94:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_0600FF9C: .word 0x0380FFF4
	arm_func_end sub_0600FEBC

	arm_func_start sub_0600FFA0
sub_0600FFA0: ; 0x0600FFA0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _06010188 ; =0x0380FFF4
	mov r6, #0
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	sub r1, r1, #0x10
	cmp r1, #5
	add r4, r0, #0x400
	add r5, r2, #0x344
	addls pc, pc, r1, lsl #2
	b _0601016C
_0600FFD4: ; jump table
	b _0600FFEC ; case 0
	b _06010064 ; case 1
	b _060100F4 ; case 2
	b _060100F4 ; case 3
	b _0601016C ; case 4
	b _0601014C ; case 5
_0600FFEC:
	mov r0, #0x20
	bl sub_0600A884
	mov r0, #2
	strh r0, [r5, #0xc]
	ldr r0, [r4, #0x1c]
	mov r1, r6
	strh r1, [r0, #8]
	ldr r0, [r4, #0x1c]
	strh r1, [r0, #6]
	strh r1, [r4, #6]
	strh r1, [r4, #8]
	ldr r1, [r4, #0x18]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	ldrh r0, [r1, #0x4a]
	bne _06010054
	add r1, r0, #3
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r0, r0, asr #2
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #0xc]
	cmp r0, #0xa
	movlo r0, #0xa
	strloh r0, [r4, #0xc]
	b _06010058
_06010054:
	strh r0, [r4, #0xc]
_06010058:
	ldr r0, [r4, #0x1c]
	mov r1, #0
	strh r1, [r0, #4]
_06010064:
	ldr r1, [r4, #0x18]
	ldrh r0, [r4, #6]
	add r1, r1, #0x3a
	add r0, r1, r0
	bl sub_0600BA10
	movs r5, r0
	moveq r0, #0x15
	streqh r0, [r4]
	moveq r6, #1
	beq _0601016C
	ldrh r1, [r4, #6]
	mov r0, #0
	add r1, r1, #1
	strh r1, [r4, #6]
	strh r0, [r4, #0xa]
	bl sub_06017F08
	cmp r0, #0
	beq _060100C8
	ldr r0, [r4, #0x1c]
	mov r1, #0xe
	strh r1, [r0, #4]
	mov r0, #0x15
	strh r0, [r4]
	mov r6, #1
	b _0601016C
_060100C8:
	ldrh r0, [r4]
	mov r1, #0
	cmp r0, #0x10
	mov r0, r5
	bne _060100E8
	bl sub_0600A0A4
	bl sub_0600AE14
	b _060100EC
_060100E8:
	bl sub_0600A0A4
_060100EC:
	mov r0, #0x12
	strh r0, [r4]
_060100F4:
	mov r0, #0x13
	strh r0, [r4]
	ldr r1, [r4, #0x18]
	ldrh r0, [r1, #0x38]
	cmp r0, #0
	bne _0601013C
	add r0, r1, #0x10
	bl sub_060148E4
	cmp r0, #0
	bne _06010138
	ldr r0, [r4, #0x1c]
	mov r1, #8
	strh r1, [r0, #4]
	mov r0, #0x15
	strh r0, [r4]
	mov r6, #1
	b _0601016C
_06010138:
	bl sub_06013E10
_0601013C:
	ldrh r0, [r4, #0xc]
	ldr r1, _0601018C ; =sub_06010190
	bl sub_0600B7AC
	b _0601016C
_0601014C:
	strh r6, [r4]
	bl sub_0600B1D4
	ldr r0, _06010188 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x2e]
	strh r0, [r5, #0xc]
	bl sub_060108A0
_0601016C:
	cmp r6, #0
	beq _06010180
	mov r0, #2
	mov r1, #0
	bl sub_06008F04
_06010180:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_06010188: .word 0x0380FFF4
_0601018C: .word sub_06010190
	arm_func_end sub_0600FFA0

	arm_func_start sub_06010190
sub_06010190: ; 0x06010190
	ldr r0, _060101EC ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #4
	add r2, r0, #0x400
	ldrh r1, [r2, #0xa]
	ldrh r0, [r2, #0xc]
	add r0, r1, r0
	strh r0, [r2, #0xa]
	ldr r0, [r2, #0x18]
	ldrh r1, [r2, #0xa]
	ldrh r0, [r0, #0x4a]
	cmp r1, r0
	blo _060101DC
	ldrh r0, [r2, #6]
	cmp r0, #0x10
	movlo r0, #0x11
	strloh r0, [r2]
	movhs r0, #0x15
	strhsh r0, [r2]
_060101DC:
	ldr ip, _060101F0 ; =sub_06008F04
	mov r0, #2
	mov r1, #0
	bx ip
	.align 2, 0
_060101EC: .word 0x0380FFF4
_060101F0: .word sub_06008F04
	arm_func_end sub_06010190

	arm_func_start sub_060101F4
sub_060101F4: ; 0x060101F4
	stmdb sp!, {r4, lr}
	ldr r0, _0601028C ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	cmp r1, #0x20
	add r4, r0, #0x400
	beq _06010224
	cmp r1, #0x25
	beq _06010250
	b _06010284
_06010224:
	bl sub_0600AE14
	mov r0, #0
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	mov r0, #0x21
	strh r0, [r4]
	ldr r0, [r4, #0x18]
	ldr r1, _06010290 ; =sub_06010294
	ldrh r0, [r0, #0x10]
	bl sub_0600B7AC
	b _06010284
_06010250:
	ldrh r1, [r4, #4]
	ldr r0, [r4, #0x1c]
	strh r1, [r0, #4]
	ldrh r1, [r4, #6]
	ldr r0, [r4, #0x1c]
	strh r1, [r0, #6]
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _06010278
	bl sub_0600B1D4
_06010278:
	mov r0, #0
	strh r0, [r4]
	bl sub_060108A0
_06010284:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0601028C: .word 0x0380FFF4
_06010290: .word sub_06010294
	arm_func_end sub_060101F4

	arm_func_start sub_06010294
sub_06010294: ; 0x06010294
	ldr r0, _060102C8 ; =0x0380FFF4
	ldr ip, _060102CC ; =sub_06008F04
	ldr r2, [r0]
	mov r1, #7
	add r0, r2, #4
	add r0, r0, #0x400
	strh r1, [r0, #4]
	mov r3, #0x25
	add r2, r2, #0x400
	mov r0, #2
	mov r1, #1
	strh r3, [r2, #4]
	bx ip
	.align 2, 0
_060102C8: .word 0x0380FFF4
_060102CC: .word sub_06008F04
	arm_func_end sub_06010294

	arm_func_start sub_060102D0
sub_060102D0: ; 0x060102D0
	stmdb sp!, {r4, lr}
	ldr r0, _060103AC ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	cmp r1, #0x30
	add r4, r0, #0x400
	beq _06010300
	cmp r1, #0x35
	beq _0601037C
	b _060103A4
_06010300:
	ldr r0, [r4, #0x18]
	mov r1, #0
	mov r2, r1
	add r0, r0, #0x10
	bl sub_06014B90
	cmp r0, #0
	bne _06010340
	ldr r1, [r4, #0x1c]
	mov r2, #8
	mov r0, #2
	strh r2, [r1, #4]
	mov r2, #0x35
	mov r1, r0
	strh r2, [r4]
	bl sub_06008F04
	b _060103A4
_06010340:
	ldr r1, [r4, #0x18]
	mov r2, #1
	ldrh r3, [r1, #0x16]
	mov r1, #0
	strh r3, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	strh r1, [r0, #0x30]
	mov r1, #0x31
	strh r1, [r4]
	bl sub_06013E10
	ldr r0, [r4, #0x18]
	ldr r1, _060103B0 ; =sub_060103B4
	ldrh r0, [r0, #0x18]
	bl sub_0600B7AC
	b _060103A4
_0601037C:
	mov r0, #1
	bl sub_06013A68
	mov r0, #1
	bl sub_06013A04
	mov r0, #1
	mov r1, #0
	bl sub_06013D84
	mov r0, #0
	strh r0, [r4]
	bl sub_060108A0
_060103A4:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_060103AC: .word 0x0380FFF4
_060103B0: .word sub_060103B4
	arm_func_end sub_060102D0

	arm_func_start sub_060103B4
sub_060103B4: ; 0x060103B4
	stmdb sp!, {r3, lr}
	ldr r1, _060103F0 ; =0x0380FFF4
	mov r0, #2
	ldr ip, [r1]
	mov r3, #7
	add r1, ip, #4
	ldr r2, [r1, #0x41c]
	mov r1, r0
	strh r3, [r2, #4]
	add r2, ip, #0x400
	mov r3, #0x35
	strh r3, [r2, #4]
	bl sub_06008F04
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_060103F0: .word 0x0380FFF4
	arm_func_end sub_060103B4

	arm_func_start sub_060103F4
sub_060103F4: ; 0x060103F4
	stmdb sp!, {r4, lr}
	ldr r0, _060104AC ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	cmp r1, #0x50
	add r4, r0, #0x400
	beq _06010424
	cmp r1, #0x53
	beq _0601047C
	b _060104A4
_06010424:
	ldr r0, [r4, #0x18]
	add r0, r0, #0x10
	bl sub_060144B4
	cmp r0, #0
	bne _0601045C
	ldr r0, [r4, #0x1c]
	mov r1, #8
	strh r1, [r0, #4]
	mov r2, #0x53
	mov r0, #2
	mov r1, #3
	strh r2, [r4]
	bl sub_06008F04
	b _060104A4
_0601045C:
	mov r1, #0x51
	strh r1, [r4]
	bl sub_06013E10
	ldr r0, [r4, #0x18]
	ldr r1, _060104B0 ; =sub_060104B4
	ldrh r0, [r0, #0x18]
	bl sub_0600B7AC
	b _060104A4
_0601047C:
	mov r0, #1
	bl sub_06013A68
	mov r0, #1
	bl sub_06013A04
	mov r0, #1
	mov r1, #0
	bl sub_06013D84
	mov r0, #0
	strh r0, [r4]
	bl sub_060108A0
_060104A4:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_060104AC: .word 0x0380FFF4
_060104B0: .word sub_060104B4
	arm_func_end sub_060103F4

	arm_func_start sub_060104B4
sub_060104B4: ; 0x060104B4
	ldr r0, _060104E8 ; =0x0380FFF4
	ldr ip, _060104EC ; =sub_06008F04
	ldr r2, [r0]
	mov r1, #7
	add r0, r2, #4
	ldr r0, [r0, #0x41c]
	mov r3, #0x53
	strh r1, [r0, #4]
	add r2, r2, #0x400
	mov r0, #2
	mov r1, #3
	strh r3, [r2, #4]
	bx ip
	.align 2, 0
_060104E8: .word 0x0380FFF4
_060104EC: .word sub_06008F04
	arm_func_end sub_060104B4

	arm_func_start sub_060104F0
sub_060104F0: ; 0x060104F0
	stmdb sp!, {r4, lr}
	ldr r0, _060105A0 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	cmp r1, #0x60
	add r4, r0, #0x400
	beq _06010520
	cmp r1, #0x63
	beq _06010578
	b _06010598
_06010520:
	ldr r0, [r4, #0x18]
	add r0, r0, #0x10
	bl sub_0601455C
	cmp r0, #0
	bne _06010558
	ldr r0, [r4, #0x1c]
	mov r1, #8
	strh r1, [r0, #4]
	mov r2, #0x63
	mov r0, #2
	mov r1, #4
	strh r2, [r4]
	bl sub_06008F04
	b _06010598
_06010558:
	mov r1, #0x61
	strh r1, [r4]
	bl sub_06013E10
	ldr r0, [r4, #0x18]
	ldr r1, _060105A4 ; =sub_060105A8
	ldrh r0, [r0, #0x18]
	bl sub_0600B7AC
	b _06010598
_06010578:
	mov r0, #1
	bl sub_06013A04
	mov r0, #1
	mov r1, #0
	bl sub_06013D84
	mov r0, #0
	strh r0, [r4]
	bl sub_060108A0
_06010598:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_060105A0: .word 0x0380FFF4
_060105A4: .word sub_060105A8
	arm_func_end sub_060104F0

	arm_func_start sub_060105A8
sub_060105A8: ; 0x060105A8
	ldr r0, _060105DC ; =0x0380FFF4
	ldr ip, _060105E0 ; =sub_06008F04
	ldr r2, [r0]
	mov r1, #7
	add r0, r2, #4
	ldr r0, [r0, #0x41c]
	mov r3, #0x63
	strh r1, [r0, #4]
	add r2, r2, #0x400
	mov r0, #2
	mov r1, #4
	strh r3, [r2, #4]
	bx ip
	.align 2, 0
_060105DC: .word 0x0380FFF4
_060105E0: .word sub_06008F04
	arm_func_end sub_060105A8

	arm_func_start sub_060105E4
sub_060105E4: ; 0x060105E4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _06010844 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	sub r1, r1, #0x80
	cmp r1, #4
	add r4, r2, #0x344
	add r5, r0, #0x400
	addls pc, pc, r1, lsl #2
	b _06010824
_06010614: ; jump table
	b _06010628 ; case 0
	b _06010668 ; case 1
	b _0601071C ; case 2
	b _06010744 ; case 3
	b _060107B0 ; case 4
_06010628:
	mov r0, #0
	strh r0, [r5, #0x14]
	mov r0, #0x13
	bl sub_0600B274
	strh r0, [r5, #0xe]
	mov r0, #0x35
	bl sub_0600B274
	strh r0, [r5, #0x10]
	ldr r1, [r5, #0x18]
	ldrh r0, [r1, #0x12]
	ldrh r1, [r1, #0x14]
	bl sub_06009B00
	mov r0, #4
	strh r0, [r4, #0xc]
	mov r0, #0
	strh r0, [r5, #0x16]
_06010668:
	mov r0, #0
	str r0, [r5, #4]
	str r0, [r5, #8]
	ldr r1, [r5, #0x18]
	ldrh r0, [r5, #0x14]
	add r1, r1, #0x18
	add r0, r1, r0
	bl sub_0600BA10
	movs r4, r0
	beq _0601069C
	ldrh r0, [r5, #0x14]
	cmp r0, #0x10
	blo _060106A8
_0601069C:
	mov r0, #0x84
	strh r0, [r5]
	b _06010824
_060106A8:
	mov r0, #0
	bl sub_06017F08
	cmp r0, #0
	movne r0, #0xe
	strneh r0, [r5, #0x16]
	movne r0, #0x84
	strneh r0, [r5]
	bne _06010824
	ldrh r0, [r5]
	mov r1, #0
	cmp r0, #0x80
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bne _06010700
	bl sub_0600A0A4
	bl sub_0600AE14
	ldr r1, _06010848 ; =0x04808040
	mov r0, #0x8000
	ldrh r1, [r1]
	strh r1, [r5, #0xc]
	bl sub_0600A484
	b _06010704
_06010700:
	bl sub_0600A0A4
_06010704:
	mov r0, #0x82
	strh r0, [r5]
	ldr r0, [r5, #0x18]
	ldr r1, _0601084C ; =sub_06010854
	ldrh r0, [r0, #0x16]
	bl sub_0600B7AC
_0601071C:
	ldr r1, [r5, #4]
	ldr r0, _06010850 ; =0x0480819C
	add r1, r1, #1
	str r1, [r5, #4]
	ldrh r0, [r0]
	tst r0, #1
	ldrne r0, [r5, #8]
	addne r0, r0, #0x64
	strne r0, [r5, #8]
	b _06010824
_06010744:
	ldr r1, [r5, #0x18]
	ldrh r0, [r5, #0x14]
	add r1, r1, #0x18
	add r0, r1, r0
	bl sub_0600BA10
	ldr r1, [r5, #4]
	mov r4, r0
	cmp r1, #0
	ldrne r0, [r5, #8]
	mov r2, #0
	cmpne r0, #0
	beq _06010784
	bl sub_06003ECC
	add r2, r0, #1
	cmp r2, #0x64
	movhi r2, #0x64
_06010784:
	ldr r1, [r5, #0x1c]
	ldrh r0, [r5, #0x14]
	orr r2, r4, r2, lsl #8
	add r0, r1, r0, lsl #1
	strh r2, [r0, #8]
	ldrh r1, [r5, #0x14]
	mov r0, #0x81
	add r1, r1, #1
	strh r1, [r5, #0x14]
	strh r0, [r5]
	b _06010824
_060107B0:
	bl sub_0600B1D4
	ldr r1, _06010844 ; =0x0380FFF4
	mov r0, #0x13
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x2e]
	strh r1, [r4, #0xc]
	ldrh r1, [r5, #0xe]
	bl sub_0600B2A0
	ldrh r1, [r5, #0x10]
	mov r0, #0x35
	bl sub_0600B2A0
	ldrh r0, [r5, #0xc]
	bl sub_0600A484
	ldrh r2, [r5, #0x16]
	ldr r1, [r5, #0x1c]
	mov r0, #0
	strh r2, [r1, #4]
	strh r0, [r5]
	ldrh r2, [r5, #0x14]
	mov r1, r0
	b _06010818
_06010808:
	ldr r0, [r5, #0x1c]
	add r0, r0, r2, lsl #1
	strh r1, [r0, #8]
	add r2, r2, #1
_06010818:
	cmp r2, #0x10
	blo _06010808
	bl sub_060108A0
_06010824:
	ldrh r0, [r5]
	cmp r0, #0
	beq _0601083C
	mov r0, #2
	mov r1, #5
	bl sub_06008F04
_0601083C:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06010844: .word 0x0380FFF4
_06010848: .word 0x04808040
_0601084C: .word sub_06010854
_06010850: .word 0x0480819C
	arm_func_end sub_060105E4

	arm_func_start sub_06010854
sub_06010854: ; 0x06010854
	ldr r0, _06010878 ; =0x0380FFF4
	ldr ip, _0601087C ; =sub_06008F04
	ldr r1, [r0]
	mov r3, #0x83
	add r2, r1, #0x400
	mov r0, #2
	mov r1, #5
	strh r3, [r2, #4]
	bx ip
	.align 2, 0
_06010878: .word 0x0380FFF4
_0601087C: .word sub_06008F04
	arm_func_end sub_06010854

	arm_func_start sub_06010880
sub_06010880: ; 0x06010880
	ldr r0, _06010898 ; =0x0380FFF4
	ldr ip, _0601089C ; =sub_06010C4C
	ldr r0, [r0]
	add r0, r0, #0xc6
	add r0, r0, #0x300
	bx ip
	.align 2, 0
_06010898: .word 0x0380FFF4
_0601089C: .word sub_06010C4C
	arm_func_end sub_06010880

	arm_func_start sub_060108A0
sub_060108A0: ; 0x060108A0
	stmdb sp!, {r4, lr}
	ldr r0, _060108F0 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x24
	add r1, r0, #0x400
	ldrh r0, [r1, #4]
	add r4, r2, #0x17c
	bic r0, r0, #1
	strh r0, [r1, #4]
	ldr r1, [r2, #0x424]
	add r0, r4, #0x84
	bl sub_0600F388
	ldrh r0, [r4, #0x8c]
	cmp r0, #0
	beq _060108E8
	mov r0, #2
	mov r1, #0xb
	bl sub_06008F04
_060108E8:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_060108F0: .word 0x0380FFF4
	arm_func_end sub_060108A0

	arm_func_start sub_060108F4
sub_060108F4: ; 0x060108F4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _0601096C ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r0, r1, #0x188
	mov r1, #0x18
	bl sub_060090A8
	movs r4, r0
	bne _0601092C
	mov r0, #1
	bl sub_0600BD2C
	mov r0, #0
	b _06010964
_0601092C:
	mov r0, #0x84
	strh r0, [r4, #0xc]
	mov r2, #4
	mov r1, r6
	add r0, r4, #0x10
	strh r2, [r4, #0xe]
	bl sub_0600A928
	ldr r0, _0601096C ; =0x0380FFF4
	strh r5, [r4, #0x16]
	ldr r0, [r0]
	mov r1, r4
	add r0, r0, #0x188
	bl sub_0600F388
	mov r0, #1
_06010964:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_0601096C: .word 0x0380FFF4
	arm_func_end sub_060108F4

	arm_func_start sub_06010970
sub_06010970: ; 0x06010970
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _060109E8 ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r0, r1, #0x188
	mov r1, #0x18
	bl sub_060090A8
	movs r4, r0
	bne _060109A8
	mov r0, #1
	bl sub_0600BD2C
	mov r0, #0
	b _060109E0
_060109A8:
	mov r0, #0x85
	strh r0, [r4, #0xc]
	mov r2, #4
	mov r1, r6
	add r0, r4, #0x10
	strh r2, [r4, #0xe]
	bl sub_0600A928
	ldr r0, _060109E8 ; =0x0380FFF4
	strh r5, [r4, #0x16]
	ldr r0, [r0]
	mov r1, r4
	add r0, r0, #0x188
	bl sub_0600F388
	mov r0, #1
_060109E0:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_060109E8: .word 0x0380FFF4
	arm_func_end sub_06010970

	arm_func_start sub_060109EC
sub_060109EC: ; 0x060109EC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _06010ADC ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r3]
	mov r7, r0
	add r0, r1, #0x188
	mov r1, #0x3a
	mov r6, r2
	bl sub_060090A8
	movs r4, r0
	bne _06010A28
	mov r0, #1
	bl sub_0600BD2C
	mov r0, #0
	b _06010AD4
_06010A28:
	mov r0, #0x86
	strh r0, [r4, #0xc]
	mov r2, #0x15
	mov r1, r7
	add r0, r4, #0x10
	strh r2, [r4, #0xe]
	bl sub_0600A928
	ldr r1, _06010AE0 ; =0x00000FFF
	add r0, r6, #1
	and r1, r5, r1
	strh r1, [r4, #0x16]
	bl sub_0600BA10
	add r7, r6, #2
	strh r0, [r4, #0x18]
	mov r5, #0
	add r6, r4, #0x1a
	b _06010A8C
_06010A6C:
	cmp r5, #0x20
	bhs _06010A98
	add r0, r7, r5
	bl sub_0600BA10
	mov r1, r0
	add r0, r6, r5
	bl sub_0600B9E4
	add r5, r5, #1
_06010A8C:
	ldrh r0, [r4, #0x18]
	cmp r5, r0
	blo _06010A6C
_06010A98:
	add r7, r4, #0x1a
	mov r6, #0
	b _06010AB4
_06010AA4:
	mov r1, r6
	add r0, r7, r5
	bl sub_0600B9E4
	add r5, r5, #1
_06010AB4:
	cmp r5, #0x20
	blo _06010AA4
	ldr r0, _06010ADC ; =0x0380FFF4
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_0600F388
	mov r0, #1
_06010AD4:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_06010ADC: .word 0x0380FFF4
_06010AE0: .word 0x00000FFF
	arm_func_end sub_060109EC

	arm_func_start sub_06010AE4
sub_06010AE4: ; 0x06010AE4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _06010BCC ; =0x0380FFF4
	mov r6, r1
	ldr r1, [r3]
	mov r7, r0
	add r0, r1, #0x188
	mov r1, #0x3a
	mov r5, r2
	bl sub_060090A8
	movs r4, r0
	bne _06010B20
	mov r0, #1
	bl sub_0600BD2C
	mov r0, #0
	b _06010BC4
_06010B20:
	mov r0, #0x87
	strh r0, [r4, #0xc]
	mov r0, #0x15
	strh r0, [r4, #0xe]
	mov r1, r7
	add r0, r4, #0x10
	bl sub_0600A928
	strh r6, [r4, #0x16]
	add r0, r5, #1
	bl sub_0600BA10
	add r6, r5, #2
	strh r0, [r4, #0x18]
	mov r7, #0
	add r5, r4, #0x1a
	b _06010B7C
_06010B5C:
	cmp r7, #0x20
	bhs _06010B88
	add r0, r6, r7
	bl sub_0600BA10
	mov r1, r0
	add r0, r5, r7
	bl sub_0600B9E4
	add r7, r7, #1
_06010B7C:
	ldrh r0, [r4, #0x18]
	cmp r7, r0
	blo _06010B5C
_06010B88:
	add r6, r4, #0x1a
	mov r5, #0
	b _06010BA4
_06010B94:
	mov r1, r5
	add r0, r6, r7
	bl sub_0600B9E4
	add r7, r7, #1
_06010BA4:
	cmp r7, #0x20
	blo _06010B94
	ldr r0, _06010BCC ; =0x0380FFF4
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_0600F388
	mov r0, #1
_06010BC4:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_06010BCC: .word 0x0380FFF4
	arm_func_end sub_06010AE4

	arm_func_start sub_06010BD0
sub_06010BD0: ; 0x06010BD0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _06010C48 ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r0, r1, #0x188
	mov r1, #0x18
	bl sub_060090A8
	movs r4, r0
	bne _06010C08
	mov r0, #1
	bl sub_0600BD2C
	mov r0, #0
	b _06010C40
_06010C08:
	mov r0, #0x88
	strh r0, [r4, #0xc]
	mov r2, #4
	mov r1, r6
	add r0, r4, #0x10
	strh r2, [r4, #0xe]
	bl sub_0600A928
	ldr r0, _06010C48 ; =0x0380FFF4
	strh r5, [r4, #0x16]
	ldr r0, [r0]
	mov r1, r4
	add r0, r0, #0x188
	bl sub_0600F388
	mov r0, #1
_06010C40:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_06010C48: .word 0x0380FFF4
	arm_func_end sub_06010BD0

	arm_func_start sub_06010C4C
sub_06010C4C: ; 0x06010C4C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _06010CBC ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r1]
	mov r1, #0x16
	add r0, r0, #0x188
	bl sub_060090A8
	movs r4, r0
	bne _06010C80
	mov r0, #1
	bl sub_0600BD2C
	mov r0, #0
	b _06010CB4
_06010C80:
	mov r0, #0x8b
	strh r0, [r4, #0xc]
	mov r2, #3
	mov r1, r5
	add r0, r4, #0x10
	strh r2, [r4, #0xe]
	bl sub_0600A928
	ldr r0, _06010CBC ; =0x0380FFF4
	mov r1, r4
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_0600F388
	mov r0, #1
_06010CB4:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06010CBC: .word 0x0380FFF4
	arm_func_end sub_06010C4C

	arm_func_start sub_06010CC0
sub_06010CC0: ; 0x06010CC0
	stmdb sp!, {r3, lr}
	ldr r0, _06010D1C ; =0x0380FFF4
	mov r1, #0x10
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_060090A8
	movs r1, r0
	bne _06010CF0
	mov r0, #1
	bl sub_0600BD2C
	mov r0, #0
	b _06010D14
_06010CF0:
	mov r0, #0x8c
	strh r0, [r1, #0xc]
	mov r2, #0
	ldr r0, _06010D1C ; =0x0380FFF4
	strh r2, [r1, #0xe]
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_0600F388
	mov r0, #1
_06010D14:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06010D1C: .word 0x0380FFF4
	arm_func_end sub_06010CC0

	arm_func_start sub_06010D20
sub_06010D20: ; 0x06010D20
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _06010E38 ; =0x0380FFF4
	mov r6, r0
	ldr r2, [r1]
	add r0, r2, #0x300
	ldrh r1, [r0, #0xe4]
	add r0, r2, #0x188
	add r1, r1, #0x3e
	add r4, r2, #0x344
	bl sub_060090A8
	movs r5, r0
	bne _06010D60
	mov r0, #1
	bl sub_0600BD2C
	mov r0, #0
	b _06010E30
_06010D60:
	mov r0, #0x8d
	strh r0, [r5, #0xc]
	ldrh r1, [r4, #0xa0]
	add r0, r5, #0x1f
	add r1, r1, #1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	add r1, r1, #0x16
	strh r1, [r5, #0xe]
	ldrh r1, [r6, #0x12]
	and r1, r1, #0xff
	bl sub_0600B9E4
	ldrh r1, [r6, #0xe]
	add r0, r5, #0x1e
	and r1, r1, #0xff
	bl sub_0600B9E4
	add r0, r5, #0x2e
	add r1, r6, #0x1e
	bl sub_0600A928
	ldrh r2, [r4, #0xa0]
	strh r2, [r5, #0x16]
	cmp r2, #0
	beq _06010E18
	ldrh r0, [r4, #0xa2]
	tst r0, #1
	ldr r0, [r4, #0x9c]
	beq _06010E0C
	add r7, r5, #0x3c
	add r6, r0, #1
	mov r4, #0
	b _06010DFC
_06010DDC:
	mov r0, r6
	bl sub_0600BA10
	mov r1, r0
	mov r0, r7
	bl sub_0600B9E4
	add r6, r6, #1
	add r7, r7, #1
	add r4, r4, #1
_06010DFC:
	ldrh r0, [r5, #0x16]
	cmp r4, r0
	blo _06010DDC
	b _06010E18
_06010E0C:
	add r1, r5, #0x3c
	add r2, r2, #1
	bl sub_06001B04
_06010E18:
	ldr r0, _06010E38 ; =0x0380FFF4
	mov r1, r5
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_0600F388
	mov r0, #1
_06010E30:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_06010E38: .word 0x0380FFF4
	arm_func_end sub_06010D20

	arm_func_start sub_06010E3C
sub_06010E3C: ; 0x06010E3C
	ldr r1, _06010E5C ; =0x0380FFF4
	ldr ip, _06010E60 ; =MIi_CpuClear16
	ldr r1, [r1]
	mov r0, #0
	add r1, r1, #4
	mov r2, #0x20
	add r1, r1, #0x400
	bx ip
	.align 2, 0
_06010E5C: .word 0x0380FFF4
_06010E60: .word MIi_CpuClear16
	arm_func_end sub_06010E3C

	arm_func_start sub_06010E64
sub_06010E64: ; 0x06010E64
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _06010F4C ; =0x0380FFF4
	mov r5, r0
	mov r0, #1
	strh r0, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	bne _06010F44
	add r0, r5, #0x10
	bl sub_06009600
	mov r4, r0
	ldrh r0, [r5, #0x16]
	bl sub_06009660
	orr r4, r4, r0
	ldrh r0, [r5, #0x18]
	bl sub_06009694
	orr r4, r4, r0
	ldrh r0, [r5, #0x1c]
	bl sub_060096D4
	orr r4, r4, r0
	ldrh r0, [r5, #0x1e]
	bl sub_06009754
	orr r4, r4, r0
	ldrh r0, [r5, #0x20]
	bl sub_06009788
	orr r4, r4, r0
	ldrh r0, [r5, #0x22]
	bl sub_06009828
	orr r4, r4, r0
	add r0, r5, #0x24
	bl sub_0600984C
	orr r4, r4, r0
	ldrh r0, [r5, #0x74]
	bl sub_060098AC
	orr r4, r4, r0
	ldrh r0, [r5, #0x76]
	bl sub_060098E4
	orr r4, r4, r0
	ldrh r0, [r5, #0x78]
	bl sub_0600991C
	orr r4, r4, r0
	ldrh r0, [r5, #0x7a]
	mov r1, #0
	bl sub_06009954
	orr r4, r4, r0
	add r0, r5, #0x7c
	bl sub_06009A04
	orr r4, r4, r0
	ldrh r0, [r5, #0x9c]
	bl sub_06009A34
	orr r4, r4, r0
	ldrh r0, [r5, #0x9e]
	bl sub_06009ADC
	orr r0, r4, r0
_06010F44:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06010F4C: .word 0x0380FFF4
	arm_func_end sub_06010E64

	arm_func_start sub_06010F50
sub_06010F50: ; 0x06010F50
	stmdb sp!, {r3, lr}
	ldr r2, _06010F8C ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	bne _06010F80
	add r0, r0, #0x10
	bl sub_06009600
	mov r3, r0
_06010F80:
	mov r0, r3
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06010F8C: .word 0x0380FFF4
	arm_func_end sub_06010F50

	arm_func_start sub_06010F90
sub_06010F90: ; 0x06010F90
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _06010FA4 ; =sub_06009660
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_06010FA4: .word sub_06009660
	arm_func_end sub_06010F90

	arm_func_start sub_06010FA8
sub_06010FA8: ; 0x06010FA8
	stmdb sp!, {r3, lr}
	ldr r2, _06010FE4 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	bne _06010FD8
	ldrh r0, [r0, #0x10]
	bl sub_06009694
	mov r3, r0
_06010FD8:
	mov r0, r3
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06010FE4: .word 0x0380FFF4
	arm_func_end sub_06010FA8

	arm_func_start sub_06010FE8
sub_06010FE8: ; 0x06010FE8
	stmdb sp!, {r3, lr}
	ldr r2, _06011034 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r2, [r1, #0x4c]
	cmp r2, #0x20
	movhi r0, r3
	bhi _0601102C
	bne _06011024
	ldrh r1, [r1, #0x56]
	cmp r1, #0
	movne r0, r3
	bne _0601102C
_06011024:
	ldrh r0, [r0, #0x10]
	bl sub_060096D4
_0601102C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06011034: .word 0x0380FFF4
	arm_func_end sub_06010FE8

	arm_func_start sub_06011038
sub_06011038: ; 0x06011038
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _0601104C ; =sub_06009754
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_0601104C: .word sub_06009754
	arm_func_end sub_06011038

	arm_func_start sub_06011050
sub_06011050: ; 0x06011050
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _06011064 ; =sub_06009788
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_06011064: .word sub_06009788
	arm_func_end sub_06011050

	arm_func_start sub_06011068
sub_06011068: ; 0x06011068
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _0601107C ; =sub_06009828
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_0601107C: .word sub_06009828
	arm_func_end sub_06011068

	arm_func_start sub_06011080
sub_06011080: ; 0x06011080
	ldr ip, _06011094 ; =sub_0600984C
	mov r2, #1
	add r0, r0, #0x10
	strh r2, [r1, #2]
	bx ip
	.align 2, 0
_06011094: .word sub_0600984C
	arm_func_end sub_06011080

	arm_func_start sub_06011098
sub_06011098: ; 0x06011098
	stmdb sp!, {r3, lr}
	ldr r2, _060110D4 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x20
	bhi _060110C8
	ldrh r0, [r0, #0x10]
	bl sub_060098AC
	mov r3, r0
_060110C8:
	mov r0, r3
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_060110D4: .word 0x0380FFF4
	arm_func_end sub_06011098

	arm_func_start sub_060110D8
sub_060110D8: ; 0x060110D8
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _060110EC ; =sub_060098E4
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_060110EC: .word sub_060098E4
	arm_func_end sub_060110D8

	arm_func_start sub_060110F0
sub_060110F0: ; 0x060110F0
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _06011104 ; =sub_0600991C
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_06011104: .word sub_0600991C
	arm_func_end sub_060110F0

	arm_func_start sub_06011108
sub_06011108: ; 0x06011108
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _06011120 ; =sub_06009954
	ldrh r0, [r0, #0x10]
	mov r1, #0
	bx ip
	.align 2, 0
_06011120: .word sub_06009954
	arm_func_end sub_06011108

	arm_func_start sub_06011124
sub_06011124: ; 0x06011124
	ldr ip, _06011138 ; =sub_06009A04
	mov r2, #1
	add r0, r0, #0x10
	strh r2, [r1, #2]
	bx ip
	.align 2, 0
_06011138: .word sub_06009A04
	arm_func_end sub_06011124

	arm_func_start sub_0601113C
sub_0601113C: ; 0x0601113C
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _06011150 ; =sub_06009A34
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_06011150: .word sub_06009A34
	arm_func_end sub_0601113C

	arm_func_start sub_06011154
sub_06011154: ; 0x06011154
	mov r2, #1
	strh r2, [r1, #2]
	ldr ip, _06011168 ; =sub_06009ADC
	ldrh r0, [r0, #0x10]
	bx ip
	.align 2, 0
_06011168: .word sub_06009ADC
	arm_func_end sub_06011154

	arm_func_start sub_0601116C
sub_0601116C: ; 0x0601116C
	stmdb sp!, {r3, r4, r5, lr}
	mov r2, #1
	strh r2, [r1, #2]
	mov r5, r0
	ldrh r0, [r5, #0x14]
	cmp r0, #0x3f
	movhi r0, #5
	bhi _060111B0
	ldrh r0, [r5, #0x10]
	ldrh r1, [r5, #0x12]
	bl sub_06009B00
	movs r4, r0
	bne _060111AC
	ldrh r1, [r5, #0x14]
	mov r0, #0x2e
	bl sub_0600B2A0
_060111AC:
	mov r0, r4
_060111B0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_0601116C

	arm_func_start sub_060111B8
sub_060111B8: ; 0x060111B8
	stmdb sp!, {r4, lr}
	ldr ip, _060112B8 ; =0x0380FFF4
	mov r3, #1
	ldr r2, [ip]
	ldr r2, [r2, #0x31c]
	strh r3, [r1, #2]
	ldr r1, [ip]
	ldrh r4, [r0, #0x10]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x22]
	cmp r4, r1
	blo _060111F8
	rsb r1, r3, #0x10000
	cmp r4, r1
	movne r0, #5
	bne _060112B0
_060111F8:
	ldrh r3, [r0, #0x14]
	cmp r3, #0x3f
	bls _06011214
	ldr r1, _060112BC ; =0x0000FFFF
	cmp r3, r1
	movne r0, #5
	bne _060112B0
_06011214:
	ldr r1, _060112BC ; =0x0000FFFF
	cmp r4, r1
	bne _06011268
	ldr ip, _060112B8 ; =0x0380FFF4
	mov r4, #1
	mov r3, #0x1c
	b _06011250
_06011230:
	mla lr, r4, r3, r2
	ldrh r1, [r0, #0x12]
	add r4, r4, #1
	strh r1, [lr, #0x1a]
	ldrh r1, [lr, #0x18]
	cmp r1, #0
	ldrneh r1, [r0, #0x12]
	strneh r1, [lr, #0x18]
_06011250:
	ldr r1, [ip]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x22]
	cmp r4, r1
	blo _06011230
	b _0601129C
_06011268:
	cmp r4, #0
	beq _0601129C
	mov r1, #0x1c
	mla r3, r4, r1, r2
	ldrh lr, [r0, #0x12]
	add ip, r2, #0x18
	strh lr, [r3, #0x1a]
	ldrh r2, [r0, #0x10]
	mul r3, r2, r1
	ldrh r1, [ip, r3]
	cmp r1, #0
	ldrneh r1, [r0, #0x12]
	strneh r1, [ip, r3]
_0601129C:
	ldrh r0, [r0, #0x14]
	cmp r0, #0
	beq _060112AC
	bl sub_0600A5D4
_060112AC:
	mov r0, #0
_060112B0:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_060112B8: .word 0x0380FFF4
_060112BC: .word 0x0000FFFF
	arm_func_end sub_060111B8

	arm_func_start sub_060112C0
sub_060112C0: ; 0x060112C0
	ldr r2, _06011314 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x20
	movhi r0, r3
	bxhi lr
	ldrh r1, [r0, #0x10]
	add r1, r1, #1
	strh r1, [r0, #0x10]
	ldr r1, [r2]
	ldrh r2, [r0, #0x10]
	add r0, r1, #0x300
	ldrh r1, [r0, #0x20]
	cmp r2, r1
	movhi r0, #5
	strlsh r2, [r0, #0x22]
	movls r0, #0
	bx lr
	.align 2, 0
_06011314: .word 0x0380FFF4
	arm_func_end sub_060112C0

	arm_func_start sub_06011318
sub_06011318: ; 0x06011318
	stmdb sp!, {r3, lr}
	ldr r2, _06011354 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	blo _06011348
	ldrh r0, [r0, #0x10]
	bl sub_06009B44
	mov r3, r0
_06011348:
	mov r0, r3
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06011354: .word 0x0380FFF4
	arm_func_end sub_06011318

	arm_func_start sub_06011358
sub_06011358: ; 0x06011358
	stmdb sp!, {r3, lr}
	ldr r2, _06011394 ; =0x0380FFF4
	mov r3, r0
	mov r0, #1
	strh r0, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	blo _0601138C
	ldrh r0, [r3, #0x10]
	ldrh r1, [r3, #0x12]
	bl sub_06009BAC
_0601138C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06011394: .word 0x0380FFF4
	arm_func_end sub_06011358

	arm_func_start sub_06011398
sub_06011398: ; 0x06011398
	stmdb sp!, {r3, lr}
	ldr r2, _060113D4 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	blo _060113C8
	ldrh r0, [r0, #0x10]
	bl sub_06009C80
	mov r3, r0
_060113C8:
	mov r0, r3
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_060113D4: .word 0x0380FFF4
	arm_func_end sub_06011398

	arm_func_start sub_060113D8
sub_060113D8: ; 0x060113D8
	stmdb sp!, {r3, lr}
	ldr r2, _06011414 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0x10
	blo _06011408
	ldrh r0, [r0, #0x10]
	bl sub_06009CC0
	mov r3, r0
_06011408:
	mov r0, r3
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06011414: .word 0x0380FFF4
	arm_func_end sub_060113D8

	arm_func_start sub_06011418
sub_06011418: ; 0x06011418
	ldr ip, _0601142C ; =sub_06009D10
	mov r2, #1
	add r0, r0, #0x10
	strh r2, [r1, #2]
	bx ip
	.align 2, 0
_0601142C: .word sub_06009D10
	arm_func_end sub_06011418

	arm_func_start sub_06011430
sub_06011430: ; 0x06011430
	mov r2, #1
	strh r2, [r1, #2]
	mov r1, r0
	ldrh r0, [r1, #0x10]
	ldr ip, _0601144C ; =sub_06009D74
	add r1, r1, #0x12
	bx ip
	.align 2, 0
_0601144C: .word sub_06009D74
	arm_func_end sub_06011430

	arm_func_start sub_06011450
sub_06011450: ; 0x06011450
	stmdb sp!, {r3, lr}
	ldr r2, _06011488 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x2e]
	cmp r1, #1
	movne r0, #0xb
	bne _06011480
	ldrh r0, [r0, #0x10]
	bl sub_06009E84
_06011480:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06011488: .word 0x0380FFF4
	arm_func_end sub_06011450

	arm_func_start sub_0601148C
sub_0601148C: ; 0x0601148C
	stmdb sp!, {r3, lr}
	ldr r2, _060114C4 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x2e]
	cmp r1, #1
	movne r0, #0xb
	bne _060114BC
	ldrh r0, [r0, #0x10]
	bl sub_06009EDC
_060114BC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_060114C4: .word 0x0380FFF4
	arm_func_end sub_0601148C

	arm_func_start sub_060114C8
sub_060114C8: ; 0x060114C8
	stmdb sp!, {r3, lr}
	ldr r2, _06011504 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x2e]
	cmp r1, #2
	cmpne r1, #3
	movne r0, #0xb
	bne _060114FC
	ldrh r0, [r0, #0x10]
	bl sub_06009F20
_060114FC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06011504: .word 0x0380FFF4
	arm_func_end sub_060114C8

	arm_func_start sub_06011508
sub_06011508: ; 0x06011508
	stmdb sp!, {r3, lr}
	ldr r2, _06011568 ; =0x0380FFF4
	mov r3, #1
	strh r3, [r1, #2]
	ldr r1, [r2]
	mov r3, r0
	add r0, r1, #0x300
	ldrh r0, [r0, #0x2e]
	cmp r0, #1
	movne r0, #0xb
	bne _06011560
	ldrh r0, [r3, #0x10]
	ldrh r2, [r3, #0xe]
	add r1, r0, #1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	add r1, r1, #1
	cmp r2, r1
	movlt r0, #4
	blt _06011560
	add r1, r3, #0x12
	bl sub_0600A6F8
_06011560:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06011568: .word 0x0380FFF4
	arm_func_end sub_06011508

	arm_func_start sub_0601156C
sub_0601156C: ; 0x0601156C
	stmdb sp!, {r4, lr}
	ldr r0, _060116A0 ; =0x0380FFF4
	mov r4, r1
	mov r1, #0x21
	strh r1, [r4, #2]
	ldr r1, [r0]
	add r0, r4, #6
	add r1, r1, #0x324
	bl sub_0600A928
	ldr r0, _060116A0 ; =0x0380FFF4
	add r1, r4, #0x22
	ldr r3, [r0]
	mov r2, #0x20
	add r3, r3, #0x300
	ldrh r3, [r3, #0x2a]
	strh r3, [r4, #0xc]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x2c]
	strh r3, [r4, #0xe]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0xbe]
	strh r3, [r4, #0x10]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x2e]
	strh r3, [r4, #0x12]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x30]
	strh r3, [r4, #0x14]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x34]
	strh r3, [r4, #0x16]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x36]
	strh r3, [r4, #0x18]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x3a]
	mov r3, r3, lsl #0x1f
	mov r3, r3, lsr #0x1f
	strh r3, [r4, #0x1a]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x3a]
	mov r3, r3, lsl #0x1e
	mov r3, r3, lsr #0x1f
	strh r3, [r4, #0x1c]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0xc2]
	strh r3, [r4, #0x1e]
	ldr r3, [r0]
	add r3, r3, #0x300
	ldrh r3, [r3, #0x3c]
	strh r3, [r4, #0x20]
	ldr r0, [r0]
	add r0, r0, #0x384
	bl sub_06001B04
	ldr r2, _060116A0 ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x3a]
	mov r1, r1, lsl #0x1d
	mov r1, r1, lsr #0x1f
	strh r1, [r4, #0x42]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x32]
	strh r1, [r4, #0x44]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_060116A0: .word 0x0380FFF4
	arm_func_end sub_0601156C

	arm_func_start sub_060116A4
sub_060116A4: ; 0x060116A4
	stmdb sp!, {r3, lr}
	ldr r0, _060116D0 ; =0x0380FFF4
	mov r2, #4
	strh r2, [r1, #2]
	ldr r2, [r0]
	add r0, r1, #6
	add r1, r2, #0x324
	bl sub_0600A928
	mov r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_060116D0: .word 0x0380FFF4
	arm_func_end sub_060116A4

	arm_func_start sub_060116D4
sub_060116D4: ; 0x060116D4
	ldr r0, _060116F8 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x2a]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_060116F8: .word 0x0380FFF4
	arm_func_end sub_060116D4

	arm_func_start sub_060116FC
sub_060116FC: ; 0x060116FC
	ldr r3, _06011730 ; =0x0380FFF4
	mov r0, #3
	strh r0, [r1, #2]
	ldr r2, [r3]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x2c]
	strh r2, [r1, #6]
	ldr r2, [r3]
	add r2, r2, #0x300
	ldrh r2, [r2, #0xbe]
	strh r2, [r1, #8]
	bx lr
	.align 2, 0
_06011730: .word 0x0380FFF4
	arm_func_end sub_060116FC

	arm_func_start sub_06011734
sub_06011734: ; 0x06011734
	ldr r0, _06011758 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x2e]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_06011758: .word 0x0380FFF4
	arm_func_end sub_06011734

	arm_func_start sub_0601175C
sub_0601175C: ; 0x0601175C
	ldr r0, _06011780 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x30]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_06011780: .word 0x0380FFF4
	arm_func_end sub_0601175C

	arm_func_start sub_06011784
sub_06011784: ; 0x06011784
	ldr r0, _060117A8 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x34]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_060117A8: .word 0x0380FFF4
	arm_func_end sub_06011784

	arm_func_start sub_060117AC
sub_060117AC: ; 0x060117AC
	ldr r0, _060117D0 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x36]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_060117D0: .word 0x0380FFF4
	arm_func_end sub_060117AC

	arm_func_start sub_060117D4
sub_060117D4: ; 0x060117D4
	ldr r0, _06011800 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x3a]
	mov r2, r2, lsl #0x1f
	mov r2, r2, lsr #0x1f
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_06011800: .word 0x0380FFF4
	arm_func_end sub_060117D4

	arm_func_start sub_06011804
sub_06011804: ; 0x06011804
	ldr r0, _06011830 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x3a]
	mov r2, r2, lsl #0x1e
	mov r2, r2, lsr #0x1f
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_06011830: .word 0x0380FFF4
	arm_func_end sub_06011804

	arm_func_start sub_06011834
sub_06011834: ; 0x06011834
	ldr r0, _06011858 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0xc2]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_06011858: .word 0x0380FFF4
	arm_func_end sub_06011834

	arm_func_start sub_0601185C
sub_0601185C: ; 0x0601185C
	ldr r0, _06011880 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x3c]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_06011880: .word 0x0380FFF4
	arm_func_end sub_0601185C

	arm_func_start sub_06011884
sub_06011884: ; 0x06011884
	ldr r0, _060118BC ; =0x0380FFF4
	mov r2, #0x11
	strh r2, [r1, #2]
	ldr r0, [r0]
	add r3, r1, #6
	add r2, r0, #0x384
	mov r1, #0
_060118A0:
	ldrh r0, [r2], #2
	add r1, r1, #1
	cmp r1, #0x10
	strh r0, [r3], #2
	blo _060118A0
	mov r0, #0
	bx lr
	.align 2, 0
_060118BC: .word 0x0380FFF4
	arm_func_end sub_06011884

	arm_func_start sub_060118C0
sub_060118C0: ; 0x060118C0
	ldr r0, _060118EC ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x3a]
	mov r2, r2, lsl #0x1d
	mov r2, r2, lsr #0x1f
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_060118EC: .word 0x0380FFF4
	arm_func_end sub_060118C0

	arm_func_start sub_060118F0
sub_060118F0: ; 0x060118F0
	ldr r0, _06011914 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x32]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_06011914: .word 0x0380FFF4
	arm_func_end sub_060118F0

	arm_func_start sub_06011918
sub_06011918: ; 0x06011918
	stmdb sp!, {r4, lr}
	mov r4, r1
	mov r0, #4
	strh r0, [r4, #2]
	mov r0, #0x13
	bl sub_0600B274
	strh r0, [r4, #6]
	mov r0, #0x35
	bl sub_0600B274
	strh r0, [r4, #8]
	mov r0, #0x2e
	bl sub_0600B274
	strh r0, [r4, #0xa]
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_06011918

	arm_func_start sub_06011958
sub_06011958: ; 0x06011958
	ldr r0, _06011980 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x22]
	sub r2, r2, #1
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_06011980: .word 0x0380FFF4
	arm_func_end sub_06011958

	arm_func_start sub_06011984
sub_06011984: ; 0x06011984
	ldr r0, _060119BC ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r2, [r0, #0x4c]
	cmp r2, #0x10
	movlo r0, #1
	ldrhsh r2, [r0, #0x3a]
	movhs r0, #0
	movhs r2, r2, lsl #0x1c
	movhs r2, r2, lsr #0x1f
	strhsh r2, [r1, #6]
	bx lr
	.align 2, 0
_060119BC: .word 0x0380FFF4
	arm_func_end sub_06011984

	arm_func_start sub_060119C0
sub_060119C0: ; 0x060119C0
	ldr r3, _06011A1C ; =0x0380FFF4
	mov r0, #3
	strh r0, [r1, #2]
	ldr r0, [r3]
	add r0, r0, #0x300
	ldrh r2, [r0, #0x4c]
	cmp r2, #0x10
	movlo r0, #1
	bxlo lr
	ldrh r2, [r0, #0x3a]
	mov r0, #0
	mov r2, r2, lsl #0x1b
	mov r2, r2, lsr #0x1f
	strh r2, [r1, #6]
	ldr r2, [r3]
	add r2, r2, #0x300
	ldrh r3, [r2, #0x3a]
	mov r2, r3, lsl #0x1c
	mov r3, r3, lsl #0x1a
	mov r2, r2, lsr #0x1f
	eor r2, r2, r3, lsr #31
	strh r2, [r1, #8]
	bx lr
	.align 2, 0
_06011A1C: .word 0x0380FFF4
	arm_func_end sub_060119C0

	arm_func_start sub_06011A20
sub_06011A20: ; 0x06011A20
	ldr r0, _06011A58 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r2, [r0, #0x4c]
	cmp r2, #0x10
	movlo r0, #1
	ldrhsh r2, [r0, #0x3a]
	movhs r0, #0
	movhs r2, r2, lsl #0x19
	movhs r2, r2, lsr #0x1f
	strhsh r2, [r1, #6]
	bx lr
	.align 2, 0
_06011A58: .word 0x0380FFF4
	arm_func_end sub_06011A20

	arm_func_start sub_06011A5C
sub_06011A5C: ; 0x06011A5C
	ldr r0, _06011A94 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r2, [r0, #0x4c]
	cmp r2, #0x10
	movlo r0, #1
	ldrhsh r2, [r0, #0x3a]
	movhs r0, #0
	movhs r2, r2, lsl #0x18
	movhs r2, r2, lsr #0x1f
	strhsh r2, [r1, #6]
	bx lr
	.align 2, 0
_06011A94: .word 0x0380FFF4
	arm_func_end sub_06011A5C

	arm_func_start sub_06011A98
sub_06011A98: ; 0x06011A98
	stmdb sp!, {r3, lr}
	ldr r0, _06011AC4 ; =0x0380FFF4
	mov r2, #4
	strh r2, [r1, #2]
	ldr r2, [r0]
	add r0, r1, #6
	add r1, r2, #0x3a8
	bl sub_0600A928
	mov r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06011AC4: .word 0x0380FFF4
	arm_func_end sub_06011A98

	arm_func_start sub_06011AC8
sub_06011AC8: ; 0x06011AC8
	ldr r2, _06011B10 ; =0x0380FFF4
	mov r0, #0x12
	strh r0, [r1, #2]
	ldr r0, [r2]
	add ip, r1, #8
	add r0, r0, #0x300
	ldrh r0, [r0, #0x62]
	mov r3, #0
	strh r0, [r1, #6]
	ldr r0, [r2]
	add r1, r0, #0x364
_06011AF4:
	ldrh r0, [r1], #2
	add r3, r3, #2
	cmp r3, #0x20
	strh r0, [ip], #2
	blo _06011AF4
	mov r0, #0
	bx lr
	.align 2, 0
_06011B10: .word 0x0380FFF4
	arm_func_end sub_06011AC8

	arm_func_start sub_06011B14
sub_06011B14: ; 0x06011B14
	ldr r0, _06011B38 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0xb2]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_06011B38: .word 0x0380FFF4
	arm_func_end sub_06011B14

	arm_func_start sub_06011B3C
sub_06011B3C: ; 0x06011B3C
	ldr r0, _06011B60 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0xb8]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_06011B60: .word 0x0380FFF4
	arm_func_end sub_06011B3C

	arm_func_start sub_06011B64
sub_06011B64: ; 0x06011B64
	ldr r0, _06011B88 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0xb4]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_06011B88: .word 0x0380FFF4
	arm_func_end sub_06011B64

	arm_func_start sub_06011B8C
sub_06011B8C: ; 0x06011B8C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	ldrh r0, [r4, #2]
	ldr r1, _06011C60 ; =0x0380FFF4
	cmp r0, #1
	ldrhi r0, _06011C60 ; =0x0380FFF4
	ldrhi r0, [r0]
	addhi r0, r0, #0x300
	ldrhih r0, [r0, #0xe4]
	strhih r0, [r4, #6]
	ldrh r0, [r4, #2]
	ldr r3, [r1]
	sub r1, r0, #2
	add r0, r3, #0x300
	ldrh r2, [r0, #0xe4]
	cmp r2, r1, lsl #1
	movgt r0, #4
	bgt _06011C58
	ldrh r2, [r4, #6]
	cmp r2, #0
	beq _06011C3C
	ldrh r0, [r0, #0xe6]
	tst r0, #1
	ldr r0, [r3, #0x3e0]
	beq _06011C30
	add r6, r4, #8
	add r5, r0, #1
	mov r7, #0
	b _06011C20
_06011C00:
	mov r0, r5
	bl sub_0600BA10
	mov r1, r0
	mov r0, r6
	bl sub_0600B9E4
	add r6, r6, #1
	add r5, r5, #1
	add r7, r7, #1
_06011C20:
	ldrh r0, [r4, #6]
	cmp r7, r0
	blo _06011C00
	b _06011C3C
_06011C30:
	add r1, r4, #8
	add r2, r2, #1
	bl sub_06001B04
_06011C3C:
	ldrh r1, [r4, #6]
	mov r0, #0
	add r1, r1, #1
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	add r1, r1, #2
	strh r1, [r4, #2]
_06011C58:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_06011C60: .word 0x0380FFF4
	arm_func_end sub_06011B8C

	arm_func_start sub_06011C64
sub_06011C64: ; 0x06011C64
	stmdb sp!, {r3, lr}
	ldr r2, _06011CA0 ; =0x0380FFF4
	mov r0, #1
	strh r0, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r1, [r1, #0x4c]
	cmp r1, #0
	cmpne r1, #0x10
	bne _06011C98
	mov r0, #0
	bl sub_0600A884
	mov r0, #0
_06011C98:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06011CA0: .word 0x0380FFF4
	arm_func_end sub_06011C64

	arm_func_start sub_06011CA4
sub_06011CA4: ; 0x06011CA4
	stmdb sp!, {r3, lr}
	ldr r2, _06011CFC ; =0x0380FFF4
	mov r0, #1
	strh r0, [r1, #2]
	ldr r1, [r2]
	add r1, r1, #0x300
	ldrh r2, [r1, #0x4c]
	cmp r2, #0x20
	bhi _06011CF4
	ldrh r1, [r1, #0x56]
	cmp r1, #0
	bne _06011CF4
	mov r0, #0
	bl sub_06017F08
	cmp r0, #0
	movne r0, #0xe
	bne _06011CF4
	mov r0, #0x10
	bl sub_0600A884
	mov r0, #0
_06011CF4:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06011CFC: .word 0x0380FFF4
	arm_func_end sub_06011CA4

	arm_func_start sub_06011D00
sub_06011D00: ; 0x06011D00
	stmdb sp!, {r3, lr}
	ldr r0, _06011D50 ; =0x0380FFF4
	mov r2, #1
	strh r2, [r1, #2]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r1, [r0, #0x4c]
	cmp r1, #0x10
	beq _06011D34
	cmp r1, #0x20
	ldreqh r0, [r0, #0x56]
	cmpeq r0, #0
	bne _06011D44
_06011D34:
	mov r0, #0x20
	bl sub_0600A884
	mov r0, #0
	b _06011D48
_06011D44:
	mov r0, #1
_06011D48:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06011D50: .word 0x0380FFF4
	arm_func_end sub_06011D00

	arm_func_start sub_06011D54
sub_06011D54: ; 0x06011D54
	stmdb sp!, {r3, lr}
	ldr r0, _06011D8C ; =0x0380FFF4
	mov r2, #1
	strh r2, [r1, #2]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0x20
	blo _06011D7C
	bl sub_0600B1D4
_06011D7C:
	bl sub_06008B14
	mov r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06011D8C: .word 0x0380FFF4
	arm_func_end sub_06011D54

	arm_func_start sub_06011D90
sub_06011D90: ; 0x06011D90
	stmdb sp!, {r3, lr}
	ldr r0, _06011DC4 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0
	mov r0, #1
	beq _06011DBC
	strh r0, [r1, #2]
	bl sub_0600A9C4
	mov r0, #0
_06011DBC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06011DC4: .word 0x0380FFF4
	arm_func_end sub_06011D90

	arm_func_start sub_06011DC8
sub_06011DC8: ; 0x06011DC8
	stmdb sp!, {r4, lr}
	ldr r0, _06011E5C ; =0x06018894
	mov r4, r1
	mov r3, #9
	add r1, r4, #6
	mov r2, #8
	strh r3, [r4, #2]
	bl sub_06001B04
	ldr r1, _06011E60 ; =0x04808000
	ldr r0, _06011E64 ; =0x0380FFF4
	ldrh r1, [r1]
	strh r1, [r4, #0xe]
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #0x8000
	moveq r1, #0x6d
	ldreq r0, _06011E68 ; =0x0000933D
	streqh r1, [r4, #0x10]
	beq _06011E28
	mov r0, #0
	bl sub_0600B274
	strh r0, [r4, #0x10]
	bl sub_0600B2F0
_06011E28:
	strh r0, [r4, #0x12]
	ldr r0, _06011E64 ; =0x0380FFF4
	ldr r1, [r0]
	add r0, r1, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #0x4000
	addne r0, r1, #0x500
	ldrneh r0, [r0, #0xf8]
	moveq r0, #2
	strh r0, [r4, #0x14]
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06011E5C: .word 0x06018894
_06011E60: .word 0x04808000
_06011E64: .word 0x0380FFF4
_06011E68: .word 0x0000933D
	arm_func_end sub_06011DC8

	arm_func_start sub_06011E6C
sub_06011E6C: ; 0x06011E6C
	stmdb sp!, {r4, lr}
	ldr r0, _06011EC4 ; =0x0380FFF4
	mov r4, r1
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0
	moveq r0, #1
	beq _06011EBC
	mov r0, #0x5c
	strh r0, [r4, #2]
	bl sub_0600A9FC
	ldr r0, _06011EC4 ; =0x0380FFF4
	add r1, r4, #8
	ldr r0, [r0]
	mov r2, #0xb4
	add r0, r0, #0x13c
	add r0, r0, #0x400
	bl sub_06011EC8
	mov r0, #0
_06011EBC:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06011EC4: .word 0x0380FFF4
	arm_func_end sub_06011E6C

	arm_func_start sub_06011EC8
sub_06011EC8: ; 0x06011EC8
	ldr pc, _06011ECC ; =MIi_CpuCopy32
	.align 2, 0
_06011ECC: .word MIi_CpuCopy32
	arm_func_end sub_06011EC8

	arm_func_start sub_06011ED0
sub_06011ED0: ; 0x06011ED0
	ldr r0, _06011EF4 ; =0x0380FFF4
	mov r2, #2
	strh r2, [r1, #2]
	ldr r2, [r0]
	mov r0, #0
	add r2, r2, #0x300
	ldrh r2, [r2, #0x4c]
	strh r2, [r1, #6]
	bx lr
	.align 2, 0
_06011EF4: .word 0x0380FFF4
	arm_func_end sub_06011ED0

	arm_func_start sub_06011EF8
sub_06011EF8: ; 0x06011EF8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r2, _06012220 ; =0x0380FFF4
	mov r5, r0
	ldr r2, [r2]
	mov r0, #1
	strh r0, [r1, #2]
	add r4, r2, #0x344
	ldrh r1, [r4, #8]
	and r1, r1, #0xf0
	cmp r1, #0x10
	bne _06012214
	ldrh r0, [r5, #0x10]
	cmp r0, #1
	movhi r0, #5
	bhi _06012214
	ldrh r0, [r5, #0x14]
	cmp r0, #0xa
	cmpne r0, #0x14
	movne r0, #5
	bne _06012214
	ldrh r0, [r5, #0x12]
	cmp r0, #4
	movhi r0, #5
	bhi _06012214
	mov r0, #0
	bl sub_06017F08
	cmp r0, #0
	movne r0, #0xe
	bne _06012214
	ldrh r0, [r5, #0x10]
	cmp r0, #0
	beq _06012188
	cmp r0, #1
	bne _06012210
	ldrh r0, [r4, #8]
	cmp r0, #0x10
	movne r0, #1
	bne _06012214
	mov r0, #0
	str r0, [sp]
	add r2, sp, #0
	mov r0, #0x65
	mov r1, #1
	bl sub_0601805C
	ldr r6, [sp]
	mov r0, #1
	bl sub_0600B274
	cmp r6, r0
	beq _06011FD4
	mov r1, r6
	mov r0, #1
	bl sub_0600B2A0
	ldr r0, _06012224 ; =0x00001388
	bl sub_0600B660
_06011FD4:
	ldrh r0, [r5, #0x12]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _06012210
_06011FE4: ; jump table
	b _06011FF8 ; case 0
	b _06011FF8 ; case 1
	b _06011FF8 ; case 2
	b _06012090 ; case 3
	b _06012090 ; case 4
_06011FF8:
	mov r0, #0x11
	strh r0, [r4, #8]
	ldrh r0, [r5, #0x16]
	mov r1, #1
	bl sub_0600A0A4
	ldr r1, _06012228 ; =0x04808040
	mov r2, #0x8000
	ldr r0, _0601222C ; =0x000005DC
	strh r2, [r1]
	bl sub_0600B660
	ldrh r1, [r5, #0x14]
	mov r0, #2
	strh r1, [r4, #0x16]
	bl sub_0600B274
	str r0, [sp]
	ldrh r1, [r5, #0x12]
	ldr r2, _06012230 ; =0x048081A4
	cmp r1, #1
	orrls r0, r0, #0x10
	strls r0, [sp]
	ldrh r0, [r5, #0x14]
	strh r0, [r2]
	ldrh r0, [r5, #0x12]
	cmp r0, #1
	strneh r0, [r2, #-2]
	bne _06012074
	ldr r1, [sp]
	mov r0, #3
	orr r1, r1, #0x20
	str r1, [sp]
	strh r0, [r2, #-2]
_06012074:
	ldr r1, [sp]
	mov r0, #2
	bl sub_0600B2A0
	ldr r1, _06012234 ; =0x00000823
	ldr r0, _06012238 ; =0x048081A0
	strh r1, [r0]
	b _06012210
_06012090:
	ldr r0, _06012220 ; =0x0380FFF4
	ldr r0, [r0]
	add r4, r0, #0x344
	bl sub_0600AE14
	bl sub_0600B1D4
	mov r0, #6
	bl sub_0600B274
	strh r0, [r4, #0xac]
	ldrh r0, [r5, #0x12]
	cmp r0, #4
	bne _060120C8
	mov r0, #6
	mov r1, #0
	bl sub_0600B2A0
_060120C8:
	ldr r1, _0601223C ; =0x04804000
	mov r0, #0
	mov r2, #0xc
	bl sub_06000598
	ldr r1, _0601223C ; =0x04804000
	mov r0, #0x14
	strh r0, [r1, #8]
	mov r0, #0x7d0
	strh r0, [r1, #0xa]
	add r3, r1, #0xc
	ldr r1, _06012240 ; =0x00005555
	ldr r0, _06012244 ; =0x000007EC
	mov r2, #0
_060120FC:
	add r2, r2, #2
	cmp r2, r0
	strh r1, [r3], #2
	blo _060120FC
	ldr r1, _0601223C ; =0x04804000
	mov r2, #8
	ldr r0, _06012248 ; =0x04808194
	strh r2, [r1, #0xc]
	mov r1, #6
	strh r1, [r0]
	mov r0, #0x12
	strh r0, [r4, #8]
	mov r1, #1
	strh r1, [r4, #0x18]
	ldrh r0, [r5, #0x16]
	bl sub_0600A0A4
	ldr r1, _06012228 ; =0x04808040
	mov r2, #0x8000
	ldr r0, _0601222C ; =0x000005DC
	strh r2, [r1]
	bl sub_0600B660
	mov r2, #1
	ldr r3, _0601224C ; =0x04808012
	mov r0, #2
	strh r0, [r3]
	strh r2, [r3, #-0xe]
	ldr r1, _0601223C ; =0x04804000
	rsb r0, r2, #0x4000
	and r0, r1, r0
	mov r0, r0, lsl #0xf
	mov r0, r0, lsr #0x10
	strh r2, [r3, #0x9c]
	orr r0, r0, #0x8000
	strh r0, [r3, #0x8e]
	b _06012210
_06012188:
	ldrh r0, [r4, #8]
	cmp r0, #0x11
	bne _060121D0
	bl sub_0600B70C
	ldr r1, _06012238 ; =0x048081A0
	mov r2, #0
	strh r2, [r1]
	mov r0, #1
	strh r0, [r1, #2]
	sub r0, r1, #0x160
	strh r2, [r0]
	mov r0, #2
	bl sub_0600B274
	bic r1, r0, #0x30
	mov r0, #2
	str r1, [sp]
	bl sub_0600B2A0
	b _06012208
_060121D0:
	cmp r0, #0x12
	bne _06012200
	ldr r1, _06012250 ; =0x04808004
	mov r0, #0
	strh r0, [r4, #0x18]
_060121E4:
	ldrh r0, [r1]
	cmp r0, #0
	bne _060121E4
	ldrh r1, [r4, #0xac]
	mov r0, #6
	bl sub_0600B2A0
	b _06012208
_06012200:
	mov r0, #1
	b _06012214
_06012208:
	mov r0, #0x10
	strh r0, [r4, #8]
_06012210:
	mov r0, #0
_06012214:
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, lr}
	bx lr
	.align 2, 0
_06012220: .word 0x0380FFF4
_06012224: .word 0x00001388
_06012228: .word 0x04808040
_0601222C: .word 0x000005DC
_06012230: .word 0x048081A4
_06012234: .word 0x00000823
_06012238: .word 0x048081A0
_0601223C: .word 0x04804000
_06012240: .word 0x00005555
_06012244: .word 0x000007EC
_06012248: .word 0x04808194
_0601224C: .word 0x04808012
_06012250: .word 0x04808004
	arm_func_end sub_06011EF8

	arm_func_start sub_06012254
sub_06012254: ; 0x06012254
	ldr r0, _060122C0 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x5c]
	cmp r0, #0
	beq _06012290
	ldr r0, _060122C4 ; =0x04804000
	mov r2, #0
	strh r2, [r0]
	ldr r1, _060122C8 ; =0x048080A0
	strh r2, [r0, #4]
	ldrh r0, [r1]
	orr r0, r0, #0x8000
	strh r0, [r1]
	bx lr
_06012290:
	ldr r2, _060122CC ; =0x048080AC
	mov r3, #1
	strh r3, [r2]
	mov r1, #0
	strh r1, [r2, #-0xa8]
	mov r0, #2
	strh r0, [r2, #-0x9a]
	rsb r0, r3, #0x10000
	strh r0, [r2, #-0x9c]
	strh r1, [r2, #0xe8]
	strh r1, [r2, #-0x6c]
	bx lr
	.align 2, 0
_060122C0: .word 0x0380FFF4
_060122C4: .word 0x04804000
_060122C8: .word 0x048080A0
_060122CC: .word 0x048080AC
	arm_func_end sub_06012254

	arm_func_start sub_060122D0
sub_060122D0: ; 0x060122D0
	stmdb sp!, {r4, lr}
	ldr r2, _0601237C ; =0x0380FFF4
	mov r3, #1
	ldr r2, [r2]
	strh r3, [r1, #2]
	add r4, r2, #0x344
	ldrh r2, [r4, #8]
	and r1, r2, #0xf0
	cmp r1, #0x10
	movne r0, r3
	bne _06012374
	ldrh r1, [r0, #0x10]
	cmp r1, #0
	beq _06012348
	cmp r1, #1
	bne _06012370
	cmp r2, #0x10
	movne r0, r3
	bne _06012374
	ldrh r0, [r0, #0x12]
	mov r1, r3
	bl sub_0600A0A4
	mov r0, #0
	strh r0, [r4, #0xc]
	bl sub_0600AE14
	mov r0, #0x8000
	bl sub_0600A484
	mov r0, #0x11
	strh r0, [r4, #8]
	b _06012370
_06012348:
	cmp r2, #0x11
	bne _06012360
	mov r0, #0
	bl sub_0600A484
	bl sub_0600B1D4
	b _06012368
_06012360:
	mov r0, r3
	b _06012374
_06012368:
	mov r0, #0x10
	strh r0, [r4, #8]
_06012370:
	mov r0, #0
_06012374:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0601237C: .word 0x0380FFF4
	arm_func_end sub_060122D0

	arm_func_start sub_06012380
sub_06012380: ; 0x06012380
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _06012544 ; =0x0380FFF4
	mov r8, r0
	ldr r4, [r1]
	ldrh r1, [r8, #0x16]
	ldr r0, _06012548 ; =0x000005E4
	add r5, r4, #0x344
	cmp r1, r0
	add r6, r4, #0x31c
	movhi r0, #5
	bhi _0601253C
	ldrh r0, [r6, #0x12]
	cmp r0, #1
	bne _060123E0
	add r0, r8, #0x28
	bl sub_0600E1AC
	mov r7, r0
	cmp r7, #0xff
	beq _060123D8
	bl sub_0600E88C
	cmp r0, #0x40
	beq _060123E4
_060123D8:
	mov r0, #0xa
	b _0601253C
_060123E0:
	ldrh r7, [r5, #0x88]
_060123E4:
	ldr r0, _06012544 ; =0x0380FFF4
	strh r7, [r8, #0x12]
	ldr r0, [r0]
	ldr r0, [r0, #0x3ec]
	strh r0, [r8, #0x14]
	ldrh r0, [r8, #0x1e]
	tst r0, #0xff
	strneh r0, [r8, #0x20]
	movne r0, #0
	strneh r0, [r8, #0x1e]
	bne _0601241C
	mov r0, r7
	bl sub_0600E94C
	strh r0, [r8, #0x20]
_0601241C:
	ldrh r0, [r8, #0x16]
	cmp r0, #0
	bne _06012444
	ldrh r1, [r5, #0x8a]
	mov r0, #0x1c
	orr r1, r1, #0x40
	bic r1, r1, #0x4000
	strh r1, [r8, #0x24]
	strh r0, [r8, #0x22]
	b _06012468
_06012444:
	ldrh r0, [r5, #0x8a]
	strh r0, [r8, #0x24]
	ldrh r0, [r6, #0x18]
	cmp r0, #0
	ldrh r0, [r8, #0x16]
	addeq r0, r0, #0x1c
	streqh r0, [r8, #0x22]
	addne r0, r0, #0x24
	strneh r0, [r8, #0x22]
_06012468:
	ldrh r0, [r6, #0x12]
	cmp r0, #1
	beq _06012484
	cmp r0, #2
	cmpne r0, #3
	beq _06012500
	b _06012538
_06012484:
	add r0, r8, #0x34
	add r1, r8, #0x2e
	bl sub_0600A928
	add r0, r8, #0x2e
	add r1, r5, #0x64
	bl sub_0600A928
	cmp r7, #0
	bne _060124DC
	mov r1, r8
	add r0, r4, #0x200
	bl sub_0600E394
	ldr r0, _06012544 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x32]
	ldrh r2, [r0, #0x2e]
	mvn r0, r1
	tst r2, r0
	bne _06012538
	mov r0, #2
	bl sub_06012C88
	b _06012538
_060124DC:
	add r0, r8, #0x10
	bl sub_0600E3F0
	mov r2, r8
	add r0, r4, #0x200
	add r1, r4, #0x194
	bl sub_060091C4
	mov r0, #0
	bl sub_06012C88
	b _06012538
_06012500:
	add r0, r8, #0x34
	add r1, r8, #0x28
	bl sub_0600A928
	add r0, r8, #0x28
	add r1, r5, #0x64
	bl sub_0600A928
	add r0, r8, #0x10
	bl sub_0600E3F0
	mov r2, r8
	add r0, r4, #0x200
	add r1, r4, #0x194
	bl sub_060091C4
	mov r0, #0
	bl sub_06012C88
_06012538:
	mov r0, #0x81
_0601253C:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_06012544: .word 0x0380FFF4
_06012548: .word 0x000005E4
	arm_func_end sub_06012380

	arm_func_start sub_0601254C
sub_0601254C: ; 0x0601254C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _060126D8 ; =0x0380FFF4
	mov sl, r0
	ldr r2, [r2]
	mov sb, #1
	add r0, r2, #0x600
	ldrh r6, [r0, #0x90]
	add r4, r2, #0x31c
	strh sb, [r1, #2]
	ldrh r1, [r4, #0x12]
	add r0, r2, #0x2c
	add r5, r0, #0x400
	cmp r1, #2
	movne r0, #0xb
	bne _060126D0
	ldrh r0, [sl, #0x10]
	cmp r0, #0x204
	movhi r0, #5
	bhi _060126D0
	ldrh r0, [r5, #0x50]
	add fp, r5, #0x50
	cmp r0, #0
	moveq sb, #0
	mov r0, #0x14
	mul r8, sb, r0
	ldrh r1, [fp, r8]
	cmp r1, #0
	movne r0, #8
	bne _060126D0
	ldr r1, _060126DC ; =0x04808094
	ldrh r1, [r1]
	tst r1, #0x8000
	movne r0, #8
	bne _060126D0
	add r1, r5, r8
	ldr r7, [r1, #0x58]
	mov r1, #0
	strh r1, [r7]
	strh r1, [r7, #4]
	strh r0, [r7, #8]
	ldrh r0, [sl, #0x10]
	ldr r3, _060126E0 ; =0x060184D8
	add r0, r0, #0x1e
	strh r0, [r7, #0xa]
	mov r0, #0x118
	strh r0, [r7, #0xc]
	add r0, r7, #0x10
	add r1, r2, #0x3a8
	add r2, r4, #8
	bl sub_0600A978
	ldrh r0, [sl, #0x12]
	strh r0, [r7, #0x24]
	ldrh r0, [sl, #0x10]
	cmp r0, #0
	beq _06012644
	cmp sb, #0
	bne _06012634
	bl sub_0600A9FC
_06012634:
	ldr r1, [sl, #0x14]
	ldrh r2, [sl, #0x10]
	add r0, r7, #0x26
	bl sub_0600B93C
_06012644:
	tst r6, #4
	beq _06012674
	ldrh r0, [sl, #0x10]
	add r1, r7, #0x24
	add r0, r0, #2
	add r0, r1, r0
	add r0, r0, #3
	ldr r1, _060126E4 ; =0x0000B6B8
	bic r2, r0, #3
	ldr r0, _060126E8 ; =0x00001D46
	strh r1, [r2]
	strh r0, [r2, #2]
_06012674:
	mov r0, #0x1000000
	bl sub_06008EF4
	mov r2, #2
	ldr r1, _060126EC ; =0x00003FFF
	strh r2, [fp, r8]
	add r5, r5, #0x52
	ldrh r2, [r5, r8]
	and r1, r7, r1
	add r3, r2, #1
	mov r2, r1, lsr #1
	ldr r1, _060126DC ; =0x04808094
	strh r3, [r5, r8]
	orr r2, r2, #0x8000
	strh r2, [r1]
	ldrh r1, [r4, #0x1e]
	mov r4, r0
	mov r0, r1, lsl #0x18
	movs r0, r0, lsr #0x1f
	bne _060126C4
	bl sub_0600A83C
_060126C4:
	mov r0, r4
	bl sub_06008EFC
	mov r0, #0
_060126D0:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_060126D8: .word 0x0380FFF4
_060126DC: .word 0x04808094
_060126E0: .word 0x060184D8
_060126E4: .word 0x0000B6B8
_060126E8: .word 0x00001D46
_060126EC: .word 0x00003FFF
	arm_func_end sub_0601254C

	arm_func_start sub_060126F0
sub_060126F0: ; 0x060126F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r2, _06012B7C ; =0x0380FFF4
	mov sl, r0
	ldr r4, [r2]
	mov sb, #1
	add r0, r4, #0x600
	ldrh r0, [r0, #0x90]
	add r7, r4, #0x31c
	strh sb, [r1, #2]
	ldrh r1, [r7, #0x12]
	str r0, [sp, #4]
	add r0, r4, #0x2c
	add r6, r0, #0x400
	cmp r1, #1
	movne r0, #0xb
	bne _06012B70
	ldrh r0, [r6, #0x3c]
	cmp r0, #0
	movne r0, #8
	bne _06012B70
	ldrh r0, [sl, #0x10]
	ldr r5, [r6, #0x44]
	tst r0, #0x8000
	beq _06012794
	tst r0, #2
	ldreqh r0, [r6, #0x94]
	streqh r0, [sl, #0x14]
	ldrh r0, [sl, #0x10]
	tst r0, #4
	ldreqh r0, [r6, #0xa0]
	streqh r0, [sl, #0x16]
	ldrh r0, [sl, #0x10]
	tst r0, #8
	ldreqh r0, [r6, #0x96]
	streqh r0, [sl, #0x18]
	ldrh r0, [sl, #0x10]
	tst r0, #0x10
	ldreqh r0, [r6, #0x9c]
	moveq sb, #0
	streqh r0, [sl, #0x1c]
_06012794:
	ldrh r0, [sl, #0x1c]
	cmp r0, #0x204
	movhi r0, #5
	bhi _06012B70
	mov r1, #2
	mov r8, #0
	b _060127C4
_060127B0:
	ldrh r0, [sl, #0x16]
	tst r0, r1
	mov r0, r1, lsl #0x11
	addne r8, r8, #1
	mov r1, r0, lsr #0x10
_060127C4:
	cmp r1, #0
	bne _060127B0
	ldrh r0, [sl, #0x14]
	strh r0, [r6, #0x94]
	ldrh r0, [sl, #0x14]
	tst r0, #0x8000
	beq _06012810
	ldr r1, _06012B80 ; =0x00007FFF
	mov r2, #0xea
	and r0, r0, r1
	strh r0, [sl, #0x14]
	ldrh r0, [sl, #0x14]
	sub r0, r0, #0xd0
	mov r0, r0, lsr #2
	strh r2, [r5, #0xe]
	cmp r0, #0x10000
	bls _06012860
	mov r0, #5
	b _06012B70
_06012810:
	ldr r1, [sp, #4]
	tst r1, #2
	movne fp, #1
	moveq fp, #0
	add r3, fp, #6
	movne r1, #2
	movne r2, #6
	add r0, r0, fp
	add r3, r3, #0x200
	moveq r1, fp
	moveq r2, fp
	cmp r0, r3
	movhi r0, #5
	bhi _06012B70
	mov r3, r0, lsl #2
	add r3, r3, #0xd0
	add r1, r1, r3
	strh r1, [sl, #0x14]
	add r1, r2, #0xea
	strh r1, [r5, #0xe]
_06012860:
	add r0, r0, #9
	bic fp, r0, #1
	mul r0, fp, r8
	str r0, [sp]
	ldr r1, [sp]
	add r0, r4, #0x188
	add r1, r1, #0x1a
	bl sub_060090A8
	str r0, [r6, #0x90]
	cmp r0, #0
	moveq r0, #8
	beq _06012B70
	mov r0, #1
	strh r0, [r6, #0x3c]
	ldrh r0, [r6, #0x3e]
	mov r2, #0
	add r0, r0, #1
	strh r0, [r6, #0x3e]
	ldrh r0, [sl, #0x18]
	add r3, r7, #8
	strh r0, [r6, #0x96]
	ldrh r0, [sl, #0x16]
	mov ip, #0x14
	strh r0, [r6, #0x98]
	strh r2, [r6, #0x9a]
	ldrh r0, [sl, #0x1c]
	mov lr, #0x228
	strh r0, [r6, #0x9c]
	ldrh r1, [sl, #0x12]
	add r0, r5, #0x10
	strh r1, [r6, #0x9e]
	strh r2, [r5]
	ldrh r7, [sl, #0x16]
	ldr r1, _06012B84 ; =0x060184E8
	strh r7, [r5, #2]
	strh r2, [r5, #4]
	strh ip, [r5, #8]
	ldrh r7, [sl, #0x1c]
	add r2, r4, #0x3a8
	add r7, r7, #0x22
	strh r7, [r5, #0xa]
	strh lr, [r5, #0xc]
	ldrh ip, [sl, #0x14]
	ldrh r7, [r5, #0xe]
	add ip, ip, #0xa
	mla r7, ip, r8, r7
	strh r7, [r5, #0xe]
	bl sub_0600A978
	ldrh r0, [sl, #0x10]
	tst r0, #0x8000
	ldrneh r1, [r5, #0x22]
	ldrne r0, _06012B88 ; =0x0000FFFF
	cmpne r1, r0
	ldreq r0, _06012B88 ; =0x0000FFFF
	movne r7, #0x4000
	streqh r0, [r5, #0x22]
	ldrh r0, [sl, #0x14]
	moveq r7, #0
	strh r0, [r5, #0x24]
	ldrh r0, [sl, #0x16]
	cmp sb, #0
	strh r0, [r5, #0x26]
	ldrh r0, [sl, #0x1e]
	strh r0, [r5, #0x28]
	ldrneh r0, [sl, #0x1c]
	cmpne r0, #0
	beq _06012980
	bl sub_0600A9FC
	ldr r1, [sl, #0x20]
	ldrh r2, [sl, #0x1c]
	add r0, r5, #0x2a
	bl sub_0600B93C
_06012980:
	ldr r0, [sp, #4]
	tst r0, #4
	beq _060129B4
	ldrh r0, [sl, #0x1c]
	add r1, r5, #0x28
	add r0, r0, #2
	add r0, r1, r0
	add r0, r0, #3
	ldr r1, _06012B8C ; =0x0000B6B8
	bic r2, r0, #3
	ldr r0, _06012B90 ; =0x00001D46
	strh r1, [r2]
	strh r0, [r2, #2]
_060129B4:
	ldr r0, [r6, #0x90]
	mov r1, #0x184
	strh r1, [r0, #0xc]
	ldr r0, [sp]
	ldr r1, [r6, #0x90]
	add r0, r0, #0xb
	mov r0, r0, lsr #1
	strh r0, [r1, #0xe]
	ldrh r1, [sl, #0x16]
	ldr r0, [r6, #0x90]
	mov r3, #0
	strh r1, [r0, #0x10]
	ldr r0, [r6, #0x90]
	ldr sb, _06012B88 ; =0x0000FFFF
	strh r8, [r0, #0x14]
	ldr r0, [r6, #0x90]
	mov r1, #1
	strh fp, [r0, #0x16]
	ldr r0, [r6, #0x90]
	mov r2, #2
	strh r3, [r0, #0x18]
	ldr r0, [r6, #0x90]
	add r0, r0, #0x1a
	b _06012A3C
_06012A14:
	ldrh ip, [sl, #0x16]
	tst ip, r2
	strneh sb, [r0]
	strneh r3, [r0, #2]
	strneh r3, [r0, #6]
	strneh r1, [r0, #4]
	mov r2, r2, lsl #0x11
	addne r0, r0, fp
	mov r2, r2, lsr #0x10
	add r1, r1, #1
_06012A3C:
	cmp r2, #0
	bne _06012A14
	ldrh r0, [sl, #0x14]
	ldr r2, _06012B94 ; =0x048080C4
	strh r0, [r2]
	ldrh r0, [r5, #0xe]
	strh r0, [r2, #-4]
	ldrh r1, [sl, #0x1a]
	ldrh r0, [sl, #0x18]
	rsb sb, r1, #0x10000
	cmp r0, #0
	bne _06012AD4
	ldrh r0, [r2, #-0xc4]
	ldrh r1, [sl, #0x1c]
	cmp r0, #0x1440
	ldrh r0, [sl, #0x14]
	add r1, r1, #0x22
	mul r2, r0, r8
	mov r1, r1, lsl #2
	add r3, r1, #0x60
	addne r3, r3, #0x3e8
	add r0, r2, #0x388
	add r0, r3, r0
	mov r1, #0xa
	add r0, r0, #0x32
	bl sub_06003ECC
	mov r4, r0
	bl sub_06000720
	ldr r1, _06012B98 ; =0x00003FFF
	ldr r2, _06012B9C ; =0x04808118
	and r1, r5, r1
	mov r1, r1, lsr #1
	orr r1, r1, #0x8000
	strh r4, [r2]
	orr r1, r1, r7
	strh r1, [r2, #-0x88]
	bl sub_06000740
	b _06012B6C
_06012AD4:
	bl sub_06000720
	ldr r1, _06012BA0 ; =0x048080F8
	mov r8, r0
	ldrh r0, [r1]
	mov r1, #0xa
	add r0, sb, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_06003ECC
	ldrh r3, [sl, #0x18]
	add r1, r0, #3
	cmp r1, r3
	bhs _06012B3C
	ldr r1, _06012B98 ; =0x00003FFF
	ldr r2, _06012B9C ; =0x04808118
	sub r3, r3, r0
	and r0, r5, r1
	sub r1, r3, #1
	mov r0, r0, lsr #1
	orr r0, r0, #0x8000
	strh r1, [r2]
	orr r1, r0, r7
	mov r0, r8
	strh r1, [r2, #-0x88]
	bl sub_06000740
	b _06012B6C
_06012B3C:
	mov r0, r8
	bl sub_06000740
	ldr r1, [r6, #0x90]
	add r0, r4, #0x188
	bl sub_06009144
	mov r0, #0
	strh r0, [r6, #0x3c]
	ldrh r1, [r6, #0x3e]
	mov r0, #5
	sub r1, r1, #1
	strh r1, [r6, #0x3e]
	b _06012B70
_06012B6C:
	mov r0, #0
_06012B70:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06012B7C: .word 0x0380FFF4
_06012B80: .word 0x00007FFF
_06012B84: .word 0x060184E8
_06012B88: .word 0x0000FFFF
_06012B8C: .word 0x0000B6B8
_06012B90: .word 0x00001D46
_06012B94: .word 0x048080C4
_06012B98: .word 0x00003FFF
_06012B9C: .word 0x04808118
_06012BA0: .word 0x048080F8
	arm_func_end sub_060126F0

	arm_func_start sub_06012BA4
sub_06012BA4: ; 0x06012BA4
	stmdb sp!, {r4, lr}
	mov r2, #1
	strh r2, [r1, #2]
	mov r4, r0
	rsb r0, r2, #0x10000
	strh r0, [r4, #0xc]
	mov r0, #0
	strh r0, [r4, #0x12]
	ldrh r1, [r4, #0x16]
	add r0, r4, #0x10
	strh r1, [r4, #0x22]
	bl sub_0600E3F0
	ldr r0, _06012C00 ; =0x0380FFF4
	mov r2, r4
	ldr r1, [r0]
	add r0, r1, #0x200
	add r1, r1, #0x194
	bl sub_060091C4
	mov r0, #0
	bl sub_06012C88
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06012C00: .word 0x0380FFF4
	arm_func_end sub_06012BA4

	arm_func_start sub_06012C04
sub_06012C04: ; 0x06012C04
	stmdb sp!, {r4, lr}
	mov r2, #1
	strh r2, [r1, #2]
	mov r4, r0
	ldrh r0, [r4, #0x10]
	tst r0, #1
	beq _06012C24
	bl sub_06013894
_06012C24:
	ldrh r0, [r4, #0x10]
	tst r0, #2
	beq _06012C34
	bl sub_06013908
_06012C34:
	ldrh r0, [r4, #0x10]
	tst r0, #4
	beq _06012C44
	bl sub_0601395C
_06012C44:
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_06012C04

	arm_func_start sub_06012C50
sub_06012C50: ; 0x06012C50
	stmdb sp!, {r3, lr}
	ldrh r2, [r1, #0xe]
	mov r3, #2
	add lr, r1, r2, lsl #1
	ldrh ip, [lr, #0x10]
	mov r2, #0
	strh ip, [r1, #0xc]
	strh r3, [lr, #0x12]
	strh r2, [lr, #0x14]
	ldrh r2, [r1, #0x18]
	strh r2, [lr, #0x16]
	bl sub_0600F388
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_06012C50

	arm_func_start sub_06012C88
sub_06012C88: ; 0x06012C88
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r1, _06012E9C ; =0x0380FFF4
	mov sl, r0
	ldr r2, [r1]
	mov r0, #0xc
	add r1, r2, #0x194
	mla fp, sl, r0, r1
	add r0, r2, #0x2c
	ldrh r1, [fp, #8]
	add r5, r0, #0x400
	mov r0, #0x14
	mla r6, sl, r0, r5
	cmp r1, #0
	add r4, r2, #0x344
	beq _06012E90
	mov r0, #0x1000000
	bl sub_06008EF4
	ldrh r1, [r6]
	str r0, [sp]
	cmp r1, #0
	beq _06012CE8
	bl sub_06008EFC
	b _06012E90
_06012CE8:
	ldr r7, [fp]
	mvn r0, #0
	str r0, [sp, #8]
_06012CF4:
	ldr r0, [sp, #8]
	cmp r7, r0
	bne _06012D0C
	ldr r0, [sp]
	bl sub_06008EFC
	b _06012E90
_06012D0C:
	mov r0, r7
	str r7, [sp, #4]
	bl sub_060093EC
	mov r1, r7
	add r8, r1, #0x10
	mov r7, r0
	ldrh sb, [r8, #2]
	mov r0, r8
	bl sub_06013010
	cmp r0, #0
	beq _06012D70
	ldrh r1, [r5, #0xae]
	mov r0, r8
	add r1, r1, #1
	strh r1, [r5, #0xae]
	mov r1, #2
	strh r1, [r8, #8]
	ldrh r2, [r6, #4]
	mov r1, #0
	add r2, r2, #1
	strh r2, [r6, #4]
	ldr r2, [r6, #0x10]
	mov lr, pc
	bx r2
	b _06012CF4
_06012D70:
	cmp sl, #0
	beq _06012D90
	cmp sl, #1
	bne _06012DD0
	mov r0, sb
	bl sub_0600E88C
	cmp r0, #0x40
	bne _06012DD0
_06012D90:
	mov r0, sb
	bl sub_0600E8AC
	cmp r0, #0
	beq _06012CF4
	mov r0, sb
	bl sub_0600E88C
	cmp r0, #0x40
	beq _06012DD0
	mov r2, #2
	mov r0, fp
	sub r1, r8, #0x10
	strh r2, [r8, #8]
	bl sub_06012C50
	mov r0, r8
	bl sub_0600E480
	b _06012CF4
_06012DD0:
	mov r0, #1
	strh r0, [r6]
	ldrh r0, [r6, #2]
	add r0, r0, #1
	strh r0, [r6, #2]
	str r8, [r6, #0xc]
	ldrh r0, [r4, #0x10]
	ldr r5, [r6, #8]
	cmp r0, #0
	bne _06012E00
	mov r0, #2
	bl sub_0600A458
_06012E00:
	ldr r1, [sp, #4]
	mov r0, r5
	bl sub_06012EA8
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	bne _06012E30
	mov r0, sb
	bl sub_0600E998
	cmp r0, #1
	ldrhih r0, [r5, #0xc]
	orrhi r0, r0, #0x2000
	strhih r0, [r5, #0xc]
_06012E30:
	ldr r1, _06012EA0 ; =0x00003FFF
	ldr r0, _06012EA4 ; =0x048080A0
	ldrh r4, [r8, #0x14]
	and r2, r5, r1
	and r1, r4, #0xc
	cmp r1, #4
	mov r1, r2, lsr #1
	add r3, r0, sl, lsl #2
	moveq r0, r1, lsl #0x10
	moveq r0, r0, lsr #0x10
	orreq r0, r0, #0xa000
	streqh r0, [r3]
	beq _06012E88
	and r0, r4, #0xfc
	cmp r0, #0x50
	mov r0, r1, lsl #0x10
	moveq r0, r0, lsr #0x10
	orreq r0, r0, #0x9000
	streqh r0, [r3]
	movne r0, r0, lsr #0x10
	orrne r0, r0, #0x8000
	strneh r0, [r3]
_06012E88:
	ldr r0, [sp]
	bl sub_06008EFC
_06012E90:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06012E9C: .word 0x0380FFF4
_06012EA0: .word 0x00003FFF
_06012EA4: .word 0x048080A0
	arm_func_end sub_06012C88

	arm_func_start sub_06012EA8
sub_06012EA8: ; 0x06012EA8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldrh r1, [r4, #0x24]
	mov r5, r0
	tst r1, #0x4000
	beq _06012F84
	ldr r0, _06012FFC ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #3
	bne _06012EDC
	bl sub_0600A9FC
_06012EDC:
	ldrh r1, [r4, #0xc]
	ldr r0, _06013000 ; =0x0000FFFF
	cmp r1, r0
	bne _06012F04
	ldrh r3, [r4, #0x16]
	mov r0, r5
	add r1, r4, #0x18
	add r2, r4, #0x3c
	bl sub_0600B9A0
	b _06012F18
_06012F04:
	ldr r2, [r4, #0x3c]
	ldrh r3, [r4, #0x16]
	mov r0, r5
	add r1, r4, #0x18
	bl sub_0600B9A0
_06012F18:
	ldr r3, _06013004 ; =0x04808044
	ldr r1, _06012FFC ; =0x0380FFF4
	ldrh r2, [r3]
	ldrh r0, [r3]
	add r0, r2, r0, lsl #8
	strh r0, [r5, #0x24]
	ldr r0, [r1]
	ldrh r2, [r3]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x36]
	and r2, r2, #0xff
	orr r0, r2, r0, lsl #14
	strh r0, [r5, #0x26]
	ldr r0, [r1]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #8
	beq _06012FB8
	ldrh r0, [r4, #0x22]
	add r1, r5, #0xc
	add r0, r1, r0
	sub r0, r0, #7
	bic r1, r0, #1
	mov r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	b _06012FB8
_06012F84:
	ldrh r2, [r4, #0xc]
	ldr r1, _06013000 ; =0x0000FFFF
	cmp r2, r1
	bne _06012FA8
	ldrh r2, [r4, #0x16]
	add r1, r4, #0x18
	add r2, r2, #0x24
	bl sub_0600B93C
	b _06012FB8
_06012FA8:
	ldr r2, [r4, #0x3c]
	ldrh r3, [r4, #0x16]
	add r1, r4, #0x18
	bl sub_0600B95C
_06012FB8:
	ldr r0, _06012FFC ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #4
	beq _06012FF4
	ldrh r0, [r4, #0x22]
	add r1, r5, #0xc
	add r0, r1, r0
	sub r0, r0, #1
	ldr r1, _06013008 ; =0x0000B6B8
	bic r2, r0, #3
	ldr r0, _0601300C ; =0x00001D46
	strh r1, [r2]
	strh r0, [r2, #2]
_06012FF4:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06012FFC: .word 0x0380FFF4
_06013000: .word 0x0000FFFF
_06013004: .word 0x04808044
_06013008: .word 0x0000B6B8
_0601300C: .word 0x00001D46
	arm_func_end sub_06012EA8

	arm_func_start sub_06013010
sub_06013010: ; 0x06013010
	ldr r1, _0601308C ; =0x0380FFF4
	ldrh r2, [r0, #0x14]
	ldr r3, [r1]
	mov r1, r2, lsl #0x1c
	add ip, r3, #0x344
	ldrh r3, [ip, #0x8c]
	movs r1, r1, lsr #0x1e
	mov r1, r3, lsl #0x13
	mov r3, r1, lsr #0x10
	bne _06013064
	ldrh r1, [ip, #0xc]
	cmp r1, #1
	bne _0601306C
	mov r1, r2, lsl #0x18
	mov r1, r1, lsr #0x1c
	cmp r1, #1
	cmpne r1, #3
	cmpne r1, #0xb
	moveq r1, r3, lsl #0xd
	moveq r3, r1, lsr #0x10
	b _0601306C
_06013064:
	mov r1, r3, lsl #0xd
	mov r3, r1, lsr #0x10
_0601306C:
	ldr r1, [ip, #0xa8]
	ldrh r0, [r0, #4]
	sub r0, r1, r0
	mov r0, r0, lsl #0x10
	cmp r3, r0, lsr #16
	movlo r0, #1
	movhs r0, #0
	bx lr
	.align 2, 0
_0601308C: .word 0x0380FFF4
	arm_func_end sub_06013010

	arm_func_start sub_06013090
sub_06013090: ; 0x06013090
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _06013208 ; =0x0380FFF4
	mov sb, r0
	ldr r4, [r2]
	mov r8, r1
	add r5, r4, #0x194
	add r6, r4, #0x344
	sub r7, sb, #0x10
	bl sub_0600E480
	ldrh r0, [sb, #8]
	tst r0, #2
	bne _06013124
	ldr r0, [r4, #0x53c]
	add r0, r0, #1
	str r0, [r4, #0x53c]
	ldrh r0, [sb, #0x14]
	mov r0, r0, lsl #0x17
	movs r0, r0, lsr #0x1f
	beq _06013100
	ldrh r0, [sb, #0x24]
	tst r0, #1
	ldrne r0, [r4, #0x550]
	addne r0, r0, #1
	strne r0, [r4, #0x550]
	ldreq r0, [r4, #0x54c]
	addeq r0, r0, #1
	streq r0, [r4, #0x54c]
	b _06013130
_06013100:
	ldrh r0, [sb, #0x18]
	tst r0, #1
	ldrne r0, [r4, #0x550]
	addne r0, r0, #1
	strne r0, [r4, #0x550]
	ldreq r0, [r4, #0x54c]
	addeq r0, r0, #1
	streq r0, [r4, #0x54c]
	b _06013130
_06013124:
	ldr r0, [r4, #0x540]
	add r0, r0, #1
	str r0, [r4, #0x540]
_06013130:
	ldrh r0, [sb, #0x14]
	mov r1, r7
	mov r0, r0, lsl #0x11
	movs r0, r0, lsr #0x1f
	ldrne r0, [r4, #0x554]
	addne r0, r0, #1
	strne r0, [r4, #0x554]
	mov r0, r5
	bl sub_06012C50
	ldr r0, _06013208 ; =0x0380FFF4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x400
	strh r1, [r0, #0x2c]
	ldrh r0, [sb, #2]
	bl sub_0600E8CC
	cmp r0, #0
	beq _0601318C
	ldrh r0, [sb, #0x14]
	tst r0, #0x2000
	bne _0601318C
	ldrh r0, [sb, #2]
	bl sub_0600E654
_0601318C:
	cmp r8, #0
	beq _06013200
	ldrh r0, [r5, #8]
	cmp r0, #0
	beq _060131AC
	mov r0, #0
	bl sub_06012C88
	b _06013200
_060131AC:
	ldrh r0, [r6, #0xc]
	add r0, r0, #0xfe
	add r0, r0, #0xff00
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #1
	bhi _06013200
	ldrh r0, [r6, #8]
	cmp r0, #0x40
	bne _06013200
	ldrh r0, [r6, #0xe]
	cmp r0, #0
	beq _06013200
	ldrh r0, [r6, #0x88]
	bl sub_0600E998
	cmp r0, #0
	ldreqh r0, [r6, #0x8e]
	cmpeq r0, #0
	bne _06013200
	mov r0, #1
	bl sub_0600A458
_06013200:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_06013208: .word 0x0380FFF4
	arm_func_end sub_06013090

	arm_func_start sub_0601320C
sub_0601320C: ; 0x0601320C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r2, _060136D4 ; =0x0380FFF4
	mov sl, r0
	ldr r4, [r2]
	ldrh r2, [sl, #8]
	add r0, r4, #4
	ldrh r7, [sl, #2]
	mov sb, r1
	tst r2, #2
	add r8, r4, #0x344
	add r5, r0, #0x400
	add r6, r4, #0x1a0
	bne _06013294
	ldr r0, [r4, #0x53c]
	add r0, r0, #1
	str r0, [r4, #0x53c]
	ldrh r0, [sl, #0x18]
	tst r0, #1
	ldrne r0, [r4, #0x550]
	addne r0, r0, #1
	strne r0, [r4, #0x550]
	ldreq r0, [r4, #0x54c]
	addeq r0, r0, #1
	streq r0, [r4, #0x54c]
	mov r0, r7
	bl sub_0600E8CC
	cmp r0, #0
	beq _060132A0
	ldrh r0, [sl, #0x14]
	tst r0, #0x2000
	bne _060132A0
	mov r0, r7
	bl sub_0600E654
	b _060132A0
_06013294:
	ldr r0, [r4, #0x540]
	add r0, r0, #1
	str r0, [r4, #0x540]
_060132A0:
	ldrh r0, [sl, #0x14]
	mov r0, r0, lsl #0x11
	movs r0, r0, lsr #0x1f
	ldrne r0, [r4, #0x554]
	addne r0, r0, #1
	strne r0, [r4, #0x554]
	ldrh r0, [sl, #0xc]
	ldr r1, [r4, #0x544]
	and r0, r0, #0xff
	add r0, r1, r0
	str r0, [r4, #0x544]
	ldrh r0, [sl, #0x14]
	and r4, r0, #0xfc
	cmp r4, #0xa0
	bhi _060132FC
	bhs _06013464
	cmp r4, #0x10
	bhi _060132F0
	beq _060133A0
	b _0601368C
_060132F0:
	cmp r4, #0x30
	beq _060133A0
	b _0601368C
_060132FC:
	cmp r4, #0xb0
	bhi _0601330C
	beq _06013318
	b _0601368C
_0601330C:
	cmp r4, #0xc0
	beq _06013548
	b _0601368C
_06013318:
	cmp r7, #0
	beq _0601368C
	ldrh r0, [sl, #8]
	tst r0, #2
	bne _0601368C
	ldrh r1, [sl, #0x2c]
	cmp r1, #0
	ldreqh r0, [sl, #0x2e]
	cmpeq r0, #2
	ldreqh r0, [sl, #0x30]
	cmpeq r0, #0
	bne _06013368
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x30
	bl sub_0600E4F0
	ldrh r1, [sl, #0x2c]
	add r0, sl, #0x18
	bl sub_060108F4
	b _0601368C
_06013368:
	cmp r1, #1
	ldreqh r0, [sl, #0x2e]
	cmpeq r0, #4
	ldreqh r0, [sl, #0x30]
	cmpeq r0, #0
	bne _0601368C
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x30
	bl sub_0600E4F0
	ldrh r1, [sl, #0x2c]
	add r0, sl, #0x18
	bl sub_060108F4
	b _0601368C
_060133A0:
	cmp r7, #0
	beq _0601368C
	ldrh r0, [sl, #8]
	tst r0, #2
	bne _06013418
	ldrh r0, [sl, #0x2e]
	cmp r0, #0
	bne _0601368C
	mov r0, r7
	bl sub_0600E88C
	cmp r0, #0x30
	bne _0601368C
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x40
	bl sub_0600E4F0
	ldrh r2, [sl, #0x12]
	cmp r4, #0x10
	add r3, sl, #0x14
	bne _06013404
	ldrh r1, [sl, #0x30]
	add r0, sl, #0x18
	add r2, r3, r2
	bl sub_060109EC
	b _0601368C
_06013404:
	ldrh r1, [sl, #0x30]
	add r0, sl, #0x18
	add r2, r3, r2
	bl sub_06010AE4
	b _0601368C
_06013418:
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0600E80C
	add r0, sl, #0x18
	mov r1, #1
	mov r2, #0
	bl sub_06014C50
	cmp r0, #0
	beq _0601368C
	mov r1, #2
	strh r1, [r0]
	cmp sb, #0
	beq _0601345C
	bl sub_06013E28
	mov r0, #1
	bl sub_06012C88
	b _0601368C
_0601345C:
	bl sub_06013E28
	b _0601368C
_06013464:
	ldrh r0, [r8, #0xc]
	cmp r0, #1
	bne _060134F4
	cmp r7, #0
	beq _0601349C
	mov r0, r7
	bl sub_0600E88C
	cmp r0, #0x30
	bls _0601350C
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x30
	bl sub_0600E4F0
	b _0601350C
_0601349C:
	ldrh r0, [sl, #0x18]
	tst r0, #1
	beq _0601350C
	ldr r4, _060136D4 ; =0x0380FFF4
	mov r8, #1
	mov r7, #0x30
	b _060134DC
_060134B8:
	mov r0, r8
	bl sub_0600E88C
	cmp r0, #0x30
	bls _060134D8
	mov r0, r8, lsl #0x10
	mov r1, r7
	mov r0, r0, lsr #0x10
	bl sub_0600E4F0
_060134D8:
	add r8, r8, #1
_060134DC:
	ldr r0, [r4]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x22]
	cmp r8, r0
	blo _060134B8
	b _0601350C
_060134F4:
	ldrh r0, [r8, #8]
	cmp r0, #0x30
	bls _0601350C
	mov r0, #0x30
	bl sub_0600A884
	bl sub_0600A7E0
_0601350C:
	ldrh r0, [r5]
	cmp r0, #0x71
	ldreq r0, [r5, #4]
	cmpeq sl, r0
	bne _0601368C
	ldrh r0, [sl, #8]
	tst r0, #2
	ldr r0, [r5, #0x1c]
	moveq r1, #0
	movne r1, #0xc
	strh r1, [r0, #4]
	mov r0, #0
	strh r0, [r5]
	bl sub_060108A0
	b _0601368C
_06013548:
	ldrh r0, [r8, #0xc]
	cmp r0, #1
	bne _060135D8
	cmp r7, #0
	beq _06013580
	mov r0, r7
	bl sub_0600E88C
	cmp r0, #0x20
	bls _060135F0
	mov r0, r7, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_0600E4F0
	b _060135F0
_06013580:
	ldrh r0, [sl, #0x18]
	tst r0, #1
	beq _060135F0
	ldr r4, _060136D4 ; =0x0380FFF4
	mov r8, #1
	mov fp, #0x20
	b _060135C0
_0601359C:
	mov r0, r8
	bl sub_0600E88C
	cmp r0, #0x20
	bls _060135BC
	mov r0, r8, lsl #0x10
	mov r1, fp
	mov r0, r0, lsr #0x10
	bl sub_0600E4F0
_060135BC:
	add r8, r8, #1
_060135C0:
	ldr r0, [r4]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x22]
	cmp r8, r0
	blo _0601359C
	b _060135F0
_060135D8:
	ldrh r0, [r8, #8]
	cmp r0, #0x20
	bls _060135F0
	mov r0, #0x20
	bl sub_0600A884
	bl sub_0600A7E0
_060135F0:
	ldrh r0, [r5]
	cmp r0, #0x41
	ldreq r0, [r5, #4]
	cmpeq sl, r0
	bne _06013628
	ldrh r0, [sl, #8]
	tst r0, #2
	ldr r0, [r5, #0x1c]
	moveq r1, #0
	movne r1, #0xc
	strh r1, [r0, #4]
	mov r0, #0
	strh r0, [r5]
	bl sub_060108A0
_06013628:
	ldrh r0, [sl]
	cmp r0, #1
	bne _06013678
	cmp r7, #0
	beq _06013668
	ldr r0, _060136D4 ; =0x0380FFF4
	mov r2, #1
	ldr r1, [r0]
	mov r0, r7, lsl #0x10
	add r1, r1, #0x500
	ldrh r3, [r1, #0x34]
	mvn r2, r2, lsl r7
	and r2, r3, r2
	mov r0, r0, lsr #0x10
	strh r2, [r1, #0x34]
	bl sub_0600ECD8
_06013668:
	add r0, sl, #0x18
	mov r1, #1
	bl sub_06010970
	b _0601368C
_06013678:
	cmp r0, #2
	bne _0601368C
	ldrh r1, [sl, #0x2c]
	add r0, sl, #0x18
	bl sub_06010970
_0601368C:
	mov r0, sl
	bl sub_0600E480
	mov r0, r6
	sub r1, sl, #0x10
	bl sub_06009144
	ldr r0, _060136D4 ; =0x0380FFF4
	mov r1, #0
	ldr r0, [r0]
	cmp sb, #0
	add r0, r0, #0x400
	strh r1, [r0, #0x40]
	ldrneh r0, [r6, #8]
	cmpne r0, #0
	beq _060136CC
	mov r0, #1
	bl sub_06012C88
_060136CC:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_060136D4: .word 0x0380FFF4
	arm_func_end sub_0601320C

	arm_func_start sub_060136D8
sub_060136D8: ; 0x060136D8
	ldr r2, _0601373C ; =0x0380FFF4
	ldrh r1, [r0, #4]
	ldr r3, [r2]
	and r1, r1, #0xff
	ldr r2, [r3, #0x544]
	add r1, r2, r1
	str r1, [r3, #0x544]
	ldrh r0, [r0]
	tst r0, #2
	ldrne r0, [r3, #0x540]
	addne r0, r0, #1
	strne r0, [r3, #0x540]
	bne _06013724
	ldr r0, [r3, #0x53c]
	add r0, r0, #1
	str r0, [r3, #0x53c]
	ldr r0, [r3, #0x54c]
	add r0, r0, #1
	str r0, [r3, #0x54c]
_06013724:
	ldr r0, _0601373C ; =0x0380FFF4
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x400
	strh r1, [r0, #0x54]
	bx lr
	.align 2, 0
_0601373C: .word 0x0380FFF4
	arm_func_end sub_060136D8

	arm_func_start sub_06013740
sub_06013740: ; 0x06013740
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _06013844 ; =0x0380FFF4
	mov r6, r0
	ldr r2, [r2]
	mov r5, r1
	ldr r1, [r2, #0x550]
	add r4, r2, #0x17c
	add r1, r1, #1
	str r1, [r2, #0x550]
	ldrh r1, [r6, #0x14]
	mov r1, r1, lsl #0x1c
	movs r1, r1, lsr #0x1e
	bne _06013798
	bl sub_0600E3F0
	add r0, r4, #0x30
	add r1, r4, #0x24
	sub r2, r6, #0x10
	bl sub_060091C4
	mov r0, r6
	mov r1, #0
	bl sub_0601320C
	b _060137A4
_06013798:
	add r0, r4, #0x30
	sub r1, r6, #0x10
	bl sub_06012C50
_060137A4:
	ldr r1, _06013844 ; =0x0380FFF4
	mov r2, #0
	ldr r0, [r1]
	add r0, r0, #0x400
	strh r2, [r0, #0x54]
	ldr r0, [r1]
	ldr r0, [r0, #0x45c]
	ldrh r0, [r0, #0xc]
	mov r0, r0, lsl #0x12
	movs r0, r0, lsr #0x1f
	bne _06013814
	ldr r1, _06013848 ; =0x048080AC
	mov r0, #8
	strh r0, [r1]
	mov r0, #5
	strh r0, [r1, #2]
	cmp r5, #0
	beq _06013814
	ldrh r0, [r4, #0x2c]
	cmp r0, #0
	beq _06013800
	mov r0, #1
	bl sub_06012C88
_06013800:
	ldrh r0, [r4, #0x20]
	cmp r0, #0
	beq _06013814
	mov r0, #0
	bl sub_06012C88
_06013814:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _06013834
	cmp r5, #0
	beq _0601383C
	mov r0, #2
	bl sub_06012C88
	b _0601383C
_06013834:
	mov r0, #0
	bl sub_0600EA74
_0601383C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_06013844: .word 0x0380FFF4
_06013848: .word 0x048080AC
	arm_func_end sub_06013740

	arm_func_start sub_0601384C
sub_0601384C: ; 0x0601384C
	ldr r2, [r0, #8]
	ldr r1, _06013890 ; =0x0380FFF4
	ldrh r3, [r2, #4]
	ldr r2, [r1]
	ands r3, r3, #0xff
	ldreq r1, [r2, #0x5a8]
	addeq r1, r1, #1
	streq r1, [r2, #0x5a8]
	ldrne r1, [r2, #0x5a4]
	addne r1, r1, r3
	strne r1, [r2, #0x5a4]
	ldrh r2, [r0, #4]
	mov r1, #0
	add r2, r2, #1
	strh r2, [r0, #4]
	strh r1, [r0]
	bx lr
	.align 2, 0
_06013890: .word 0x0380FFF4
	arm_func_end sub_0601384C

	arm_func_start sub_06013894
sub_06013894: ; 0x06013894
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _06013900 ; =0x0380FFF4
	mov r0, #0x1000000
	ldr r1, [r1]
	add r1, r1, #0x2c
	add r4, r1, #0x400
	bl sub_06008EF4
	ldr r1, _06013900 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r1]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x3a]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1f
	bne _060138D8
	mov r0, #0
	bl sub_0600A860
_060138D8:
	ldr r0, _06013904 ; =0x048080B4
	mov r1, #0xc0
	strh r1, [r0]
	mov r1, #0
	strh r1, [r4, #0x50]
	mov r0, r5
	strh r1, [r4, #0x64]
	bl sub_06008EFC
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06013900: .word 0x0380FFF4
_06013904: .word 0x048080B4
	arm_func_end sub_06013894

	arm_func_start sub_06013908
sub_06013908: ; 0x06013908
	stmdb sp!, {r4, lr}
	ldr r1, _06013954 ; =0x0380FFF4
	mov r0, #0x1000000
	ldr r1, [r1]
	add r1, r1, #0x2c
	add r4, r1, #0x400
	bl sub_06008EF4
	ldr r1, _06013958 ; =0x048080B4
	mov r2, #2
	strh r2, [r1]
	ldrh r1, [r4, #0x3c]
	mov r4, r0
	cmp r1, #0
	beq _06013944
	bl sub_0600DFA0
_06013944:
	mov r0, r4
	bl sub_06008EFC
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06013954: .word 0x0380FFF4
_06013958: .word 0x048080B4
	arm_func_end sub_06013908

	arm_func_start sub_0601395C
sub_0601395C: ; 0x0601395C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _060139FC ; =0x0380FFF4
	mov r0, #0x1000000
	ldr r1, [r1]
	add r1, r1, #0x2c
	add r4, r1, #0x400
	bl sub_06008EF4
	ldr r1, _060139FC ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r1]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	ldr r0, _06013A00 ; =0x048080B4
	bne _060139C4
	mov r1, #9
	strh r1, [r0]
	ldrh r0, [r4, #0x28]
	cmp r0, #0
	beq _060139B4
	mov r0, #2
	bl sub_06013A04
_060139B4:
	mov r0, #2
	mov r1, #1
	bl sub_06013D84
	b _060139CC
_060139C4:
	mov r1, #1
	strh r1, [r0]
_060139CC:
	ldrh r0, [r4]
	cmp r0, #0
	beq _060139E0
	mov r0, #0
	bl sub_06013A04
_060139E0:
	mov r0, #0
	mov r1, #1
	bl sub_06013D84
	mov r0, r5
	bl sub_06008EFC
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_060139FC: .word 0x0380FFF4
_06013A00: .word 0x048080B4
	arm_func_end sub_0601395C

	arm_func_start sub_06013A04
sub_06013A04: ; 0x06013A04
	stmdb sp!, {r3, lr}
	ldr r2, _06013A64 ; =0x0380FFF4
	mov r1, #0x14
	ldr r2, [r2]
	mul r1, r0, r1
	add r0, r2, #0x2c
	add r2, r0, #0x400
	ldrh r0, [r2, r1]
	add r2, r2, r1
	cmp r0, #0
	beq _06013A5C
	ldr r0, [r2, #8]
	ldrh r1, [r0]
	ldr r0, [r2, #0xc]
	cmp r1, #0
	moveq r1, #2
	strh r1, [r0, #8]
	ldr r0, [r2, #0xc]
	ldr r2, [r2, #0x10]
	mov r1, #0
	mov lr, pc
	bx r2
_06013A5C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06013A64: .word 0x0380FFF4
	arm_func_end sub_06013A04

	arm_func_start sub_06013A68
sub_06013A68: ; 0x06013A68
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _06013AE8 ; =0x0380FFF4
	mov r7, r0
	mov r0, #0x14
	ldr r1, [r1]
	mul r4, r7, r0
	add r0, r1, #0x2c
	add r5, r0, #0x400
	mov r0, #0x1000000
	add r6, r5, r4
	bl sub_06008EF4
	ldr r1, _06013AEC ; =0x0601889C
	mov r2, r7, lsl #1
	ldrh r2, [r1, r2]
	ldr r1, _06013AF0 ; =0x048080B4
	strh r2, [r1]
	ldrh r1, [r5, r4]
	cmp r1, #0
	beq _06013ADC
	ldr r2, [r6, #0xc]
	ldrh r1, [r2, #0x14]
	tst r1, #0x4000
	ldreq r1, [r6, #8]
	ldreqh r1, [r1, #4]
	streqh r1, [r2, #0xc]
	ldr r2, [r6, #8]
	ldr r1, [r6, #0xc]
	ldrh r2, [r2, #0x22]
	strh r2, [r1, #0x2a]
_06013ADC:
	bl sub_06008EFC
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_06013AE8: .word 0x0380FFF4
_06013AEC: .word 0x0601889C
_06013AF0: .word 0x048080B4
	arm_func_end sub_06013A68

	arm_func_start sub_06013AF4
sub_06013AF4: ; 0x06013AF4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	mov r7, #0
	bl sub_0600E998
	cmp r0, #0
	beq _06013BE0
	mov r8, r7
_06013B10:
	ldr r0, _06013BE8 ; =0x0380FFF4
	mov r1, #0xc
	ldr r2, [r0]
	mul sl, r8, r1
	sub r0, r1, #0xd
	add r1, r2, sl
	ldr r5, [r1, #0x194]
	cmp r5, r0
	beq _06013BD4
	mov r0, #0x14
	mul sb, r8, r0
	mvn r4, #0
_06013B40:
	mov r0, r5
	bl sub_060093EC
	add r6, r5, #0x10
	ldrh r1, [r6, #2]
	str r0, [sp]
	cmp r1, fp
	bne _06013BC4
	cmp r8, #1
	ldrne r0, _06013BE8 ; =0x0380FFF4
	ldrne r0, [r0]
	addne r0, sb, r0
	ldrne r0, [r0, #0x438]
	cmpne r6, r0
	bne _06013B94
	mov r0, r6
	bl sub_0600E480
	mov r1, #0
	mov r0, r6
	strh r1, [r6, #2]
	bl sub_0600E3F0
	b _06013BC4
_06013B94:
	mov r0, #2
	strh r0, [r6, #8]
	mov r0, r6
	bl sub_0600E480
	ldr r0, _06013BE8 ; =0x0380FFF4
	mov r1, r5
	ldr r0, [r0]
	add r0, r0, #0x194
	add r0, r0, sl
	bl sub_06012C50
	cmp r7, #0
	moveq r7, #1
_06013BC4:
	ldr r5, [sp]
	mov r0, r5
	cmp r0, r4
	bne _06013B40
_06013BD4:
	add r8, r8, #1
	cmp r8, #3
	blo _06013B10
_06013BE0:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06013BE8: .word 0x0380FFF4
	arm_func_end sub_06013AF4

	arm_func_start sub_06013BEC
sub_06013BEC: ; 0x06013BEC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _06013C98 ; =0x0380FFF4
	ldrh r1, [r0]
	ldr r2, [r4]
	tst r1, #1
	beq _06013C40
	add r0, r2, #0x300
	ldrh r0, [r0, #0x22]
	mov r5, #1
	cmp r0, #1
	bls _06013C90
	b _06013C28
_06013C1C:
	mov r0, r5
	bl sub_06013AF4
	add r5, r5, #1
_06013C28:
	ldr r0, [r4]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x22]
	cmp r5, r0
	blo _06013C1C
	b _06013C90
_06013C40:
	bl sub_0600E1AC
	mov r4, r0
	cmp r4, #0xff
	beq _06013C54
	bl sub_06013AF4
_06013C54:
	ldr r0, _06013C98 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x2e]
	cmp r0, #1
	bne _06013C90
	mov r0, r4
	bl sub_0600E88C
	cmp r0, #0x40
	bne _06013C90
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_0600E4F0
	bl sub_06013894
_06013C90:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06013C98: .word 0x0380FFF4
	arm_func_end sub_06013BEC

	arm_func_start sub_06013C9C
sub_06013C9C: ; 0x06013C9C
	stmdb sp!, {r4, lr}
	ldr r0, _06013D80 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x300
	ldrh r1, [r0, #0x50]
	add r0, r2, #0x2c
	cmp r1, #1
	add r4, r0, #0x400
	beq _06013CD0
	cmp r1, #2
	cmpne r1, #3
	beq _06013D2C
	b _06013D54
_06013CD0:
	mov r0, #0
	mov r1, #1
	bl sub_06013D84
	mov r0, #1
	mov r1, #0
	bl sub_06013D84
	mov r0, #2
	mov r1, #1
	bl sub_06013D84
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _06013D78
	mov r0, #0
	strh r0, [r4, #0x3c]
	ldrh r1, [r4, #0x3e]
	ldr r0, _06013D80 ; =0x0380FFF4
	sub r1, r1, #1
	strh r1, [r4, #0x3e]
	ldr r0, [r0]
	ldr r1, [r4, #0x90]
	add r0, r0, #0x188
	bl sub_06009144
	b _06013D78
_06013D2C:
	mov r0, #0
	mov r1, #1
	bl sub_06013D84
	mov r0, #1
	mov r1, #0
	bl sub_06013D84
	mov r0, #2
	mov r1, #0
	bl sub_06013D84
	b _06013D78
_06013D54:
	mov r0, #0
	mov r1, r0
	bl sub_06013D84
	mov r0, #1
	mov r1, #0
	bl sub_06013D84
	mov r0, #2
	mov r1, #0
	bl sub_06013D84
_06013D78:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06013D80: .word 0x0380FFF4
	arm_func_end sub_06013C9C

	arm_func_start sub_06013D84
sub_06013D84: ; 0x06013D84
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r5, _06013E0C ; =0x0380FFF4
	mov r2, #0xc
	mov sl, r0
	mul r8, sl, r2
	ldr r3, [r5]
	sub r0, r2, #0xd
	add r2, r3, r8
	ldr r6, [r2, #0x194]
	mov sb, r1
	cmp r6, r0
	beq _06013E04
	mov fp, #2
	mvn r4, #0
_06013DBC:
	mov r0, r6
	bl sub_060093EC
	mov r7, r0
	cmp sl, #2
	beq _06013DD8
	add r0, r6, #0x10
	bl sub_0600E480
_06013DD8:
	strh fp, [r6, #0x18]
	cmp sb, #0
	beq _06013DF8
	ldr r0, [r5]
	mov r1, r6
	add r0, r0, #0x194
	add r0, r0, r8
	bl sub_06012C50
_06013DF8:
	mov r6, r7
	cmp r7, r4
	bne _06013DBC
_06013E04:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06013E0C: .word 0x0380FFF4
	arm_func_end sub_06013D84

	arm_func_start sub_06013E10
sub_06013E10: ; 0x06013E10
	stmdb sp!, {r3, lr}
	bl sub_06013E28
	mov r0, #1
	bl sub_06012C88
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_06013E10

	arm_func_start sub_06013E28
sub_06013E28: ; 0x06013E28
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x18
	bl sub_0600E1AC
	strh r0, [r4, #2]
	ldrh r0, [r4, #2]
	cmp r0, #0xff
	moveq r0, #0
	streqh r0, [r4, #2]
	ldr r0, _06013E98 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x3ec]
	strh r0, [r4, #4]
	ldrh r0, [r4, #0x14]
	tst r0, #0x4000
	ldrneh r0, [r4, #0x12]
	addne r0, r0, #8
	strneh r0, [r4, #0x12]
	mov r0, r4
	bl sub_0600E3F0
	ldr r0, _06013E98 ; =0x0380FFF4
	sub r2, r4, #0x10
	ldr r1, [r0]
	add r0, r1, #0x188
	add r1, r1, #0x1a0
	bl sub_060091C4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06013E98: .word 0x0380FFF4
	arm_func_end sub_06013E28

	arm_func_start sub_06013E9C
sub_06013E9C: ; 0x06013E9C
	stmdb sp!, {r4, lr}
	ldr r0, _06013F24 ; =0x0380FFF4
	ldr r2, [r0]
	add r0, r2, #0x54
	add r4, r0, #0x400
	ldrh r1, [r4, #2]
	add r0, r2, #0x400
	add r1, r1, #1
	strh r1, [r4, #2]
	ldrh r0, [r0, #0x54]
	mov r1, #0
	cmp r0, #0
	ldrne r0, [r4, #8]
	strneh r1, [r0, #4]
	bne _06013F1C
	mov r0, #1
	strh r0, [r4]
	ldr r0, [r4, #8]
	strh r1, [r0]
	ldr r0, [r4, #8]
	strh r1, [r0, #4]
	bl sub_0600ADC8
	ldr r2, [r4, #8]
	ldr r1, _06013F28 ; =0x00003FFF
	strh r0, [r2, #8]
	ldr r0, [r4, #8]
	ldr r2, _06013F2C ; =0x048080A8
	and r0, r0, r1
	mov r0, r0, lsl #0xf
	mov r0, r0, lsr #0x10
	orr r0, r0, #0x8000
	strh r0, [r2]
_06013F1C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06013F24: .word 0x0380FFF4
_06013F28: .word 0x00003FFF
_06013F2C: .word 0x048080A8
	arm_func_end sub_06013E9C

	arm_func_start sub_06013F30
sub_06013F30: ; 0x06013F30
	ldr r0, _06013F68 ; =0x0380FFF4
	mov r2, #1
	ldr r3, [r0]
	rsb r1, r2, #0x4000
	add r0, r3, #0x400
	strh r2, [r0, #0xa4]
	add r0, r3, #0xa4
	ldr r2, [r0, #0x408]
	ldr r0, _06013F6C ; =0x04808080
	and r1, r2, r1
	mov r1, r1, lsr #1
	orr r1, r1, #0x8000
	strh r1, [r0]
	bx lr
	.align 2, 0
_06013F68: .word 0x0380FFF4
_06013F6C: .word 0x04808080
	arm_func_end sub_06013F30

	arm_func_start sub_06013F70
sub_06013F70: ; 0x06013F70
	ldr r1, _06013F90 ; =0x0380FFF4
	ldr r0, _06013F94 ; =0x04808080
	ldr r2, [r1]
	mov r1, #0
	strh r1, [r0]
	add r0, r2, #0x400
	strh r1, [r0, #0xa4]
	bx lr
	.align 2, 0
_06013F90: .word 0x0380FFF4
_06013F94: .word 0x04808080
	arm_func_end sub_06013F70

	arm_func_start sub_06013F98
sub_06013F98: ; 0x06013F98
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _060142F4 ; =0x0380FFF4
	mov r0, #0
	ldr r1, [r1]
	ldr r8, [r1, #0x4ac]
	add r5, r1, #0x31c
	strh r0, [r8]
	strh r0, [r8, #2]
	strh r0, [r8, #4]
	strh r0, [r8, #6]
	add r6, r1, #0x344
	bl sub_0600ADC8
	strh r0, [r8, #8]
	mov r0, #0x80
	strh r0, [r8, #0xc]
	mov r0, #0
	add r2, r5, #8
	strh r0, [r8, #0xe]
	ldr r1, _060142F8 ; =0x060184D0
	add r0, r8, #0x10
	mov r3, r2
	bl sub_0600A978
	mov r1, #0
	strh r1, [r8, #0x22]
	add sl, r8, #0x24
	str r1, [r8, #0x24]
	str r1, [sl, #4]
	ldrh r0, [r6, #0x6e]
	add sb, sl, #0xc
	strh r0, [sl, #8]
	ldrh r0, [r6, #0x7c]
	strh r0, [sl, #0xa]
	ldrh r0, [r5, #0x1e]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	bne _06014098
	sub r0, sb, sl
	strh r0, [r6, #0x92]
	mov r0, sb
	bl sub_0600B9E4
	ldrh r1, [r6, #0x1e]
	add r0, sb, #1
	and r1, r1, #0xff
	add sb, sb, #2
	bl sub_0600B9E4
	mov r7, #0
	add r4, r6, #0x20
	b _06014074
_06014058:
	add r0, r4, r7
	bl sub_0600BA10
	mov r1, r0
	mov r0, sb
	bl sub_0600B9E4
	add sb, sb, #1
	add r7, r7, #1
_06014074:
	ldrh r0, [r6, #0x1e]
	cmp r7, r0
	blo _06014058
	mvn r0, #0
	sub r0, r0, r7
	add r0, sb, r0
	and r1, r7, #0xff
	bl sub_0600B9E4
	b _0601409C
_06014098:
	strh r1, [r6, #0x92]
_0601409C:
	mov r0, sb
	bl sub_06014E64
	add sb, sb, r0
	mov r0, sb
	mov r1, #3
	bl sub_0600B9E4
	add r0, sb, #1
	mov r1, #1
	bl sub_0600B9E4
	ldrh r1, [r6, #0x7a]
	add r0, sb, #2
	and r1, r1, #0xff
	bl sub_0600B9E4
	add r0, sb, #3
	sub r1, r0, sl
	strh r1, [r6, #0x94]
	ldrh r2, [r6, #0x94]
	ldr r1, _060142FC ; =0x04808084
	add r2, r2, #2
	strh r2, [r1]
	mov r1, #5
	bl sub_0600B9E4
	add r0, sb, #4
	mov r1, #5
	bl sub_0600B9E4
	add r0, sb, #5
	mov r1, #0
	bl sub_0600B9E4
	add r0, sb, #6
	ldrh r1, [r6, #0x74]
	and r1, r1, #0xff
	bl sub_0600B9E4
	add r0, sb, #7
	mov r1, #0
	bl sub_0600B9E4
	add r0, sb, #8
	mov r1, #0
	bl sub_0600B9E4
	add r0, sb, #9
	mov r1, #0
	bl sub_0600B9E4
	add r0, sb, #0xa
	sub r1, r0, sl
	strh r1, [r6, #0x96]
	ldrh r2, [r6, #0x96]
	mov r1, #0xdd
	and r2, r2, #1
	strh r2, [r6, #0xa2]
	bl sub_0600B9E4
	add r0, sb, #0xb
	ldrh r1, [r6, #0xa0]
	add r1, r1, #8
	and r1, r1, #0xff
	bl sub_0600B9E4
	add r0, sb, #0xc
	mov r1, #0
	bl sub_0600B9E4
	add r0, sb, #0xd
	mov r1, #9
	bl sub_0600B9E4
	add r0, sb, #0xe
	mov r1, #0xbf
	bl sub_0600B9E4
	add r0, sb, #0xf
	mov r1, #0
	bl sub_0600B9E4
	ldrh r0, [r6, #0xe]
	cmp r0, #1
	bne _060141DC
	ldrh r1, [r5, #0x20]
	add r0, sb, #0x10
	and r1, r1, #0xff
	bl sub_0600B9E4
	ldrh r1, [r5, #0x20]
	add r0, sb, #0x11
	mov r1, r1, asr #8
	and r1, r1, #0xff
	add sb, sb, #0x12
	bl sub_0600B9E4
	b _060141F8
_060141DC:
	add r0, sb, #0x10
	mov r1, #0xff
	bl sub_0600B9E4
	add r0, sb, #0x11
	mov r1, #0xff
	add sb, sb, #0x12
	bl sub_0600B9E4
_060141F8:
	ldr r1, _06014300 ; =0x0380FFF0
	mov r0, sb
	ldrh r4, [r1]
	and r1, r4, #0xff
	bl sub_0600B9E4
	mov r1, r4, lsr #8
	add r0, sb, #1
	and r1, r1, #0xff
	add sb, sb, #2
	bl sub_0600B9E4
	ldr r4, [r6, #0x9c]
	mov r5, #0
	b _0601424C
_0601422C:
	mov r0, r4
	bl sub_0600BA10
	mov r1, r0
	mov r0, sb
	bl sub_0600B9E4
	add sb, sb, #1
	add r4, r4, #1
	add r5, r5, #1
_0601424C:
	ldrh r1, [r6, #0xa0]
	cmp r5, r1
	blo _0601422C
	ldrh r0, [r6, #0xa2]
	cmp r0, #0
	beq _060142A8
	ldr r0, [r6, #0x9c]
	cmp r1, #0
	add r0, r0, r1
	sub r5, r0, #1
	mov r4, #0
	bls _060142A8
	b _0601429C
_06014280:
	mov r0, r5
	bl sub_0600BA10
	mov r1, r0
	add r0, r5, #1
	bl sub_0600B9E4
	add r4, r4, #1
	sub r5, r5, #1
_0601429C:
	ldrh r0, [r6, #0xa0]
	cmp r4, r0
	blo _06014280
_060142A8:
	ldr r0, _060142F4 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #4
	beq _060142D8
	ldr r1, _06014304 ; =0x0000B6B8
	add r0, sb, #3
	bic r2, r0, #3
	ldr r0, _06014308 ; =0x00001D46
	strh r1, [r2]
	strh r0, [r2, #2]
_060142D8:
	mov r1, #0
	add r0, sb, #0x1c
	strh r1, [r6, #0xa4]
	sub r0, r0, sl
	strh r0, [r8, #0xa]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_060142F4: .word 0x0380FFF4
_060142F8: .word 0x060184D0
_060142FC: .word 0x04808084
_06014300: .word 0x0380FFF0
_06014304: .word 0x0000B6B8
_06014308: .word 0x00001D46
	arm_func_end sub_06013F98

	arm_func_start sub_0601430C
sub_0601430C: ; 0x0601430C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _060143F8 ; =0x0380FFF4
	ldr r0, [r0]
	add r4, r0, #0x344
	ldr r1, [r0, #0x4ac]
	ldrh r2, [r4, #0xa0]
	ldrh r0, [r4, #0x96]
	add r1, r1, #0x24
	cmp r2, #0
	add r5, r1, r0
	beq _0601437C
	ldrh r0, [r4, #0xa2]
	ldr r1, [r4, #0x9c]
	tst r0, #1
	add r0, r5, #0xa
	beq _06014374
	sub r0, r0, #1
	add r2, r2, #2
	bl sub_0600B93C
	ldr r1, _060143FC ; =0x0380FFF0
	add r0, r5, #9
	ldrh r1, [r1]
	mov r1, r1, asr #8
	and r1, r1, #0xff
	bl sub_0600B9E4
	b _0601437C
_06014374:
	add r2, r2, #1
	bl sub_0600B93C
_0601437C:
	ldr r0, _060143F8 ; =0x0380FFF4
	ldrh r2, [r4, #0x96]
	ldr r0, [r0]
	ldrh r1, [r4, #0xa0]
	add r2, r2, #0x26
	ldr r0, [r0, #0x4ac]
	add r1, r2, r1
	strh r1, [r0, #0xa]
	ldrh r1, [r4, #0xa0]
	add r0, r5, #1
	add r1, r1, #8
	and r1, r1, #0xff
	bl sub_0600B9E4
	ldr r0, _060143F8 ; =0x0380FFF4
	ldr r0, [r0]
	add r0, r0, #0x600
	ldrh r0, [r0, #0x90]
	tst r0, #4
	beq _060143E8
	ldrh r0, [r4, #0xa0]
	add r1, r5, #0xd
	add r0, r1, r0
	ldr r1, _06014400 ; =0x0000B6B8
	bic r2, r0, #3
	ldr r0, _06014404 ; =0x00001D46
	strh r1, [r2]
	strh r0, [r2, #2]
_060143E8:
	mov r0, #0
	strh r0, [r4, #0xa4]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_060143F8: .word 0x0380FFF4
_060143FC: .word 0x0380FFF0
_06014400: .word 0x0000B6B8
_06014404: .word 0x00001D46
	arm_func_end sub_0601430C

	arm_func_start sub_06014408
sub_06014408: ; 0x06014408
	ldr r0, _06014434 ; =0x0380FFF4
	ldr r0, [r0]
	add r1, r0, #0x500
	add r0, r0, #0x100
	ldrh r1, [r1, #0x38]
	ldrh r2, [r0, #0xa8]
	rsb r0, r1, #0x18
	cmp r2, r0
	movlt r0, #1
	movge r0, #0
	bx lr
	.align 2, 0
_06014434: .word 0x0380FFF4
	arm_func_end sub_06014408

	arm_func_start sub_06014438
sub_06014438: ; 0x06014438
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _060144AC ; =0x0380FFF4
	mov r5, r1
	ldr r1, [r2]
	mov r6, r0
	add r0, r1, #0x188
	mov r1, #0x36
	bl sub_060090A8
	movs r4, r0
	bne _06014470
	mov r0, #2
	bl sub_0600BD2C
	mov r0, r4
	b _060144A4
_06014470:
	ldr r0, _060144B0 ; =0x0000FFFF
	mov r1, r6
	strh r0, [r4, #0xc]
	add r0, r4, #0x10
	bl sub_06014D3C
	strh r5, [r4, #0x3c]
	mov r0, #2
	strh r0, [r4, #0x16]
	add r0, r0, #0x1c
	strh r0, [r4, #0x22]
	mov r0, #0xa0
	strh r0, [r4, #0x24]
	add r0, r4, #0x10
_060144A4:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_060144AC: .word 0x0380FFF4
_060144B0: .word 0x0000FFFF
	arm_func_end sub_06014438

	arm_func_start sub_060144B4
sub_060144B4: ; 0x060144B4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _06014554 ; =0x0380FFF4
	mov r6, r0
	ldr r2, [r1]
	mov r1, #0x5e
	add r0, r2, #0x188
	add r5, r2, #0x344
	bl sub_060090A8
	movs r4, r0
	bne _060144EC
	mov r0, #2
	bl sub_0600BD2C
	mov r0, r4
	b _0601454C
_060144EC:
	ldr r0, _06014558 ; =0x0000FFFF
	mov r1, r6
	strh r0, [r4, #0xc]
	add r0, r4, #0x10
	bl sub_06014D3C
	ldrh r1, [r5, #0x7c]
	add r0, r4, #0x40
	strh r1, [r4, #0x3c]
	ldrh r1, [r5, #0x70]
	strh r1, [r4, #0x3e]
	bl sub_06014DF0
	mov r5, r0
	add r0, r4, #0x40
	add r0, r0, r5
	bl sub_06014E64
	add r0, r5, r0
	add r0, r0, #4
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x16]
	mov r0, #0
	add r1, r1, #0x1c
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	add r0, r4, #0x10
_0601454C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_06014554: .word 0x0380FFF4
_06014558: .word 0x0000FFFF
	arm_func_end sub_060144B4

	arm_func_start sub_0601455C
sub_0601455C: ; 0x0601455C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _06014608 ; =0x0380FFF4
	mov r6, r0
	ldr r2, [r1]
	mov r1, #0x64
	add r0, r2, #0x188
	add r5, r2, #0x344
	bl sub_060090A8
	movs r4, r0
	bne _06014594
	mov r0, #2
	bl sub_0600BD2C
	mov r0, r4
	b _06014600
_06014594:
	ldr r0, _0601460C ; =0x0000FFFF
	mov r1, r6
	strh r0, [r4, #0xc]
	add r0, r4, #0x10
	bl sub_06014D3C
	ldrh r1, [r5, #0x7c]
	add r0, r4, #0x40
	strh r1, [r4, #0x3c]
	ldrh r2, [r5, #0x70]
	add r1, r5, #0x82
	strh r2, [r4, #0x3e]
	bl sub_0600A928
	add r0, r4, #0x46
	bl sub_06014DF0
	mov r5, r0
	add r0, r4, #0x46
	add r0, r0, r5
	bl sub_06014E64
	add r0, r5, r0
	add r0, r0, #0xa
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x16]
	mov r0, #0x20
	add r1, r1, #0x1c
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	add r0, r4, #0x10
_06014600:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_06014608: .word 0x0380FFF4
_0601460C: .word 0x0000FFFF
	arm_func_end sub_0601455C

	arm_func_start sub_06014610
sub_06014610: ; 0x06014610
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r3, _0601477C ; =0x0380FFF4
	mov r7, r1
	ldr r1, [r3]
	mov r8, r0
	add r0, r1, #0x188
	mov r1, #0x60
	mov r6, r2
	bl sub_060090A8
	movs r4, r0
	bne _0601464C
	mov r0, #2
	bl sub_0600BD2C
	mov r0, r4
	b _06014774
_0601464C:
	ldr r0, _06014780 ; =0x0000FFFF
	cmp r7, #0
	strh r0, [r4, #0xc]
	bne _06014670
	mov r0, r8
	bl sub_0600E75C
	movs r5, r0
	moveq r7, #0x13
	b _06014674
_06014670:
	mov r5, #0
_06014674:
	mov r0, r8
	bl sub_0600E8EC
	mov r1, r0
	add r0, r4, #0x10
	bl sub_06014D3C
	ldr r0, _0601477C ; =0x0380FFF4
	cmp r5, #0
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0xc0]
	strh r0, [r4, #0x3c]
	strh r7, [r4, #0x3e]
	strh r5, [r4, #0x40]
	ldrneh r0, [r4, #0x40]
	orrne r0, r0, #0xc000
	strneh r0, [r4, #0x40]
	add r0, r4, #0x42
	bl sub_06014E64
	add r0, r0, #6
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x16]
	mov r0, #0x10
	add r1, r1, #0x1c
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x22]
	add r1, r4, #0x24
	cmp r6, #0
	add r8, r1, r0
	beq _06014758
	add r0, r6, #1
	bl sub_0600BA10
	mov sb, r0
	mov r0, r6
	bl sub_0600BA10
	mov r1, r0
	mov r0, r8
	bl sub_0600B9E4
	add r0, r8, #1
	and r1, sb, #0xff
	add r8, r8, #2
	bl sub_0600B9E4
	cmp sb, #0
	mov r7, #0
	bls _06014770
	add r5, r6, #2
	b _0601474C
_06014730:
	add r0, r5, r7
	bl sub_0600BA10
	mov r1, r0
	mov r0, r8
	bl sub_0600B9E4
	add r7, r7, #1
	add r8, r8, #1
_0601474C:
	cmp r7, sb
	blo _06014730
	b _06014770
_06014758:
	mov r0, r8
	mov r1, #0
	bl sub_0600B9E4
	add r0, r8, #1
	mov r1, #0
	bl sub_0600B9E4
_06014770:
	add r0, r4, #0x10
_06014774:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_0601477C: .word 0x0380FFF4
_06014780: .word 0x0000FFFF
	arm_func_end sub_06014610

	arm_func_start sub_06014784
sub_06014784: ; 0x06014784
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, _060148DC ; =0x0380FFF4
	mov r6, r1
	ldr r1, [r3]
	mov r8, r0
	add r0, r1, #0x188
	mov r1, #0x60
	mov r5, r2
	bl sub_060090A8
	movs r4, r0
	bne _060147C0
	mov r0, #2
	bl sub_0600BD2C
	mov r0, r4
	b _060148D4
_060147C0:
	ldr r0, _060148E0 ; =0x0000FFFF
	cmp r6, #0
	strh r0, [r4, #0xc]
	bne _060147E4
	mov r0, r8
	bl sub_0600E75C
	movs r7, r0
	moveq r6, #0x13
	b _060147E8
_060147E4:
	mov r7, #0
_060147E8:
	mov r0, r8
	bl sub_0600E8EC
	mov r1, r0
	add r0, r4, #0x10
	bl sub_06014D3C
	ldr r0, _060148DC ; =0x0380FFF4
	orr r2, r7, #0xc000
	ldr r1, [r0]
	add r0, r4, #0x42
	add r1, r1, #0x300
	ldrh r1, [r1, #0xc0]
	strh r1, [r4, #0x3c]
	strh r6, [r4, #0x3e]
	strh r2, [r4, #0x40]
	bl sub_06014E64
	add r0, r0, #6
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x16]
	mov r0, #0x30
	add r1, r1, #0x1c
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	ldrh r0, [r4, #0x22]
	add r1, r4, #0x24
	cmp r5, #0
	add r7, r1, r0
	beq _060148B8
	add r0, r5, #1
	bl sub_0600BA10
	mov r8, r0
	mov r0, r5
	bl sub_0600BA10
	mov r1, r0
	mov r0, r7
	bl sub_0600B9E4
	add r0, r7, #1
	and r1, r8, #0xff
	bl sub_0600B9E4
	add r7, r7, #2
	mov r6, #0
	add r5, r5, #2
	b _060148AC
_06014890:
	add r0, r5, r6
	bl sub_0600BA10
	mov r1, r0
	mov r0, r7
	bl sub_0600B9E4
	add r7, r7, #1
	add r6, r6, #1
_060148AC:
	cmp r6, r8
	blo _06014890
	b _060148D0
_060148B8:
	mov r0, r7
	mov r1, #0
	bl sub_0600B9E4
	add r0, r7, #1
	mov r1, #0
	bl sub_0600B9E4
_060148D0:
	add r0, r4, #0x10
_060148D4:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_060148DC: .word 0x0380FFF4
_060148E0: .word 0x0000FFFF
	arm_func_end sub_06014784

	arm_func_start sub_060148E4
sub_060148E4: ; 0x060148E4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _06014968 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	mov r1, #0x5a
	add r0, r0, #0x188
	bl sub_060090A8
	movs r5, r0
	bne _06014918
	mov r0, #2
	bl sub_0600BD2C
	mov r0, r5
	b _06014960
_06014918:
	ldr r2, _0601496C ; =0x0000FFFF
	mov r1, r4
	add r0, r5, #0x10
	strh r2, [r5, #0xc]
	bl sub_06014D3C
	add r0, r5, #0x3c
	bl sub_06014DF0
	mov r4, r0
	add r0, r5, #0x3c
	add r0, r0, r4
	bl sub_06014E64
	add r0, r4, r0
	strh r0, [r5, #0x16]
	add r0, r0, #0x1c
	strh r0, [r5, #0x22]
	mov r0, #0x40
	strh r0, [r5, #0x24]
	add r0, r5, #0x10
_06014960:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06014968: .word 0x0380FFF4
_0601496C: .word 0x0000FFFF
	arm_func_end sub_060148E4

	arm_func_start sub_06014970
sub_06014970: ; 0x06014970
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _06014B84 ; =0x0380FFF4
	mov r5, r0
	ldr r0, [r1]
	add r4, r0, #0x344
	bl sub_06014408
	cmp r0, #0
	moveq r0, #0
	beq _06014B7C
	ldr r1, _06014B84 ; =0x0380FFF4
	ldrh r0, [r4, #0xa0]
	ldr r2, [r1]
	add r1, r0, #0x78
	add r0, r2, #0x188
	bl sub_060090A8
	movs r6, r0
	bne _060149C4
	mov r0, #2
	bl sub_0600BD2C
	mov r0, r6
	b _06014B7C
_060149C4:
	ldr r0, _06014B88 ; =0x0000FFFF
	mov r1, r5
	strh r0, [r6, #0xc]
	add r0, r6, #0x10
	bl sub_06014D3C
	ldrh r1, [r4, #0x6e]
	add r0, r6, #0x48
	strh r1, [r6, #0x44]
	ldrh r1, [r4, #0x7c]
	strh r1, [r6, #0x46]
	bl sub_06014DF0
	mov r4, r0
	add r0, r6, #0x48
	add r0, r0, r4
	bl sub_06014E64
	add r7, r4, r0
	add r0, r6, #0x48
	add r4, r0, r7
	mov r0, r4
	mov r1, #3
	bl sub_0600B9E4
	add r0, r4, #1
	mov r1, #1
	bl sub_0600B9E4
	ldr r1, _06014B84 ; =0x0380FFF4
	add r0, r4, #2
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r1, [r1, #0xbe]
	and r1, r1, #0xff
	bl sub_0600B9E4
	ldr r0, _06014B84 ; =0x0380FFF4
	add r7, r7, #3
	ldr r1, [r0]
	add r0, r6, #0x48
	add r5, r0, r7
	add r4, r1, #0x344
	add r8, r1, #0x31c
	mov r0, r5
	mov r1, #0xdd
	mov sl, #0
	bl sub_0600B9E4
	ldr r1, _06014B84 ; =0x0380FFF4
	add r0, r5, #1
	ldr r1, [r1]
	add r1, r1, #0x300
	ldrh r1, [r1, #0xe4]
	add r1, r1, #8
	and r1, r1, #0xff
	bl sub_0600B9E4
	add r0, r5, #2
	mov r1, sl
	bl sub_0600B9E4
	add r0, r5, #3
	mov r1, #9
	bl sub_0600B9E4
	add r0, r5, #4
	mov r1, #0xbf
	bl sub_0600B9E4
	add r0, r5, #5
	mov r1, sl
	bl sub_0600B9E4
	ldrh r1, [r8, #0x20]
	add r0, r5, #6
	and r1, r1, #0xff
	bl sub_0600B9E4
	ldrh r1, [r8, #0x20]
	add r0, r5, #7
	mov r1, r1, asr #8
	and r1, r1, #0xff
	bl sub_0600B9E4
	ldr r1, _06014B8C ; =0x0380FFF0
	add r0, r5, #8
	ldrh r8, [r1]
	and r1, r8, #0xff
	bl sub_0600B9E4
	mov r1, r8, lsr #8
	add r0, r5, #9
	and r1, r1, #0xff
	bl sub_0600B9E4
	ldrh r0, [r4, #0xa0]
	add sl, sl, #0xa
	cmp r0, #0
	beq _06014B58
	ldrh r0, [r4, #0xa2]
	ldr r8, [r4, #0x9c]
	tst r0, #1
	addne r8, r8, #1
	mov sb, #0
	b _06014B4C
_06014B2C:
	mov r0, r8
	bl sub_0600BA10
	mov r1, r0
	add r0, r5, sl
	bl sub_0600B9E4
	add sl, sl, #1
	add r8, r8, #1
	add sb, sb, #1
_06014B4C:
	ldrh r0, [r4, #0xa0]
	cmp sb, r0
	blo _06014B2C
_06014B58:
	add r0, r7, sl
	add r0, r0, #0xc
	strh r0, [r6, #0x16]
	ldrh r1, [r6, #0x16]
	mov r0, #0x50
	add r1, r1, #0x1c
	strh r1, [r6, #0x22]
	strh r0, [r6, #0x24]
	add r0, r6, #0x10
_06014B7C:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_06014B84: .word 0x0380FFF4
_06014B88: .word 0x0000FFFF
_06014B8C: .word 0x0380FFF0
	arm_func_end sub_06014970

	arm_func_start sub_06014B90
sub_06014B90: ; 0x06014B90
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	cmp r2, #0
	beq _06014BB4
	bl sub_06014408
	cmp r0, #0
	moveq r0, #0
	beq _06014C40
_06014BB4:
	ldr r0, _06014C48 ; =0x0380FFF4
	add r1, r5, #0x3d
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_060090A8
	movs r4, r0
	bne _06014BE0
	mov r0, #2
	bl sub_0600BD2C
	mov r0, r4
	b _06014C40
_06014BE0:
	ldr r2, _06014C4C ; =0x0000FFFF
	mov r1, r6
	add r0, r4, #0x10
	strh r2, [r4, #0xc]
	bl sub_06014D3C
	cmp r5, #0
	beq _06014C20
	add r0, r4, #0x42
	mov r1, #0x10
	bl sub_0600B9E4
	add r0, r4, #0x43
	and r1, r5, #0xff
	bl sub_0600B9E4
	add r0, r5, #2
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
_06014C20:
	add r0, r5, #6
	strh r0, [r4, #0x16]
	ldrh r1, [r4, #0x16]
	mov r0, #0xb0
	add r1, r1, #0x1c
	strh r1, [r4, #0x22]
	strh r0, [r4, #0x24]
	add r0, r4, #0x10
_06014C40:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_06014C48: .word 0x0380FFF4
_06014C4C: .word 0x0000FFFF
	arm_func_end sub_06014B90

	arm_func_start sub_06014C50
sub_06014C50: ; 0x06014C50
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	cmp r2, #0
	beq _06014C74
	bl sub_06014408
	cmp r0, #0
	moveq r0, #0
	beq _06014CD4
_06014C74:
	ldr r0, _06014CDC ; =0x0380FFF4
	mov r1, #0x36
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_060090A8
	movs r4, r0
	bne _06014CA0
	mov r0, #2
	bl sub_0600BD2C
	mov r0, r4
	b _06014CD4
_06014CA0:
	ldr r0, _06014CE0 ; =0x0000FFFF
	mov r1, r6
	strh r0, [r4, #0xc]
	add r0, r4, #0x10
	bl sub_06014D3C
	strh r5, [r4, #0x3c]
	mov r0, #2
	strh r0, [r4, #0x16]
	add r0, r0, #0x1c
	strh r0, [r4, #0x22]
	mov r0, #0xc0
	strh r0, [r4, #0x24]
	add r0, r4, #0x10
_06014CD4:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_06014CDC: .word 0x0380FFF4
_06014CE0: .word 0x0000FFFF
	arm_func_end sub_06014C50

	arm_func_start sub_06014CE4
sub_06014CE4: ; 0x06014CE4
	stmdb sp!, {r3, lr}
	ldr ip, _06014D38 ; =0x0380FFF4
	mov r2, #0
	ldr r3, [ip]
	mov r1, #0x14
	ldr r3, [r3, #0x45c]
	orr r0, r0, #0xc000
	strh r2, [r3]
	strh r2, [r3, #2]
	strh r2, [r3, #4]
	strh r1, [r3, #0xa]
	mov r1, #0xa4
	strh r1, [r3, #0xc]
	strh r0, [r3, #0xe]
	ldr r2, [ip]
	add r0, r3, #0x10
	add r1, r2, #0x3a8
	add r2, r2, #0x324
	bl sub_0600A944
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_06014D38: .word 0x0380FFF4
	arm_func_end sub_06014CE4

	arm_func_start sub_06014D3C
sub_06014D3C: ; 0x06014D3C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r1, r5
	mov r0, #0
	mov r2, #0x2c
	bl sub_06000598
	bl sub_0600ADC8
	strh r0, [r5, #0x10]
	ldr r0, _06014D84 ; =0x0380FFF4
	mov r1, r4
	ldr r3, [r0]
	add r0, r5, #0x18
	add r2, r3, #0x324
	add r3, r3, #0x3a8
	bl sub_0600A978
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06014D84: .word 0x0380FFF4
	arm_func_end sub_06014D3C

	arm_func_start sub_06014D88
sub_06014D88: ; 0x06014D88
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _06014DEC ; =0x0380FFF4
	mov r7, r0
	ldr r0, [r2]
	mov r6, r1
	ldr r5, [r0, #0x1a0]
	mvn r4, #0
	b _06014DD8
_06014DA8:
	ldrh r0, [r5, #0x24]
	cmp r0, r6
	bne _06014DCC
	mov r1, r7
	add r0, r5, #0x28
	bl sub_0600ACC4
	cmp r0, #0
	movne r0, #1
	bne _06014DE4
_06014DCC:
	mov r0, r5
	bl sub_060093EC
	mov r5, r0
_06014DD8:
	cmp r5, r4
	bne _06014DA8
	mov r0, #0
_06014DE4:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_06014DEC: .word 0x0380FFF4
	arm_func_end sub_06014D88

	arm_func_start sub_06014DF0
sub_06014DF0: ; 0x06014DF0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _06014E60 ; =0x0380FFF4
	mov r5, #0
	ldr r1, [r1]
	mov r8, r0
	add r4, r1, #0x344
	ldrh r6, [r4, #0x1e]
	mov r1, r5
	bl sub_0600B9E4
	add r0, r8, #1
	and r1, r6, #0xff
	bl sub_0600B9E4
	add r5, r5, #2
	mov r7, #0
	add r4, r4, #0x20
	b _06014E4C
_06014E30:
	add r0, r4, r7
	bl sub_0600BA10
	mov r1, r0
	add r0, r8, r5
	bl sub_0600B9E4
	add r5, r5, #1
	add r7, r7, #1
_06014E4C:
	cmp r7, r6
	blo _06014E30
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_06014E60: .word 0x0380FFF4
	arm_func_end sub_06014DF0

	arm_func_start sub_06014E64
sub_06014E64: ; 0x06014E64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _06014F00 ; =0x0380FFF4
	mov r1, #1
	ldr r2, [r2]
	mov sb, r0
	add r6, r2, #0x344
	mov r7, #0
	bl sub_0600B9E4
	ldr r4, _06014F04 ; =0x060184F0
	add r7, r7, #2
	mov r8, #0
	mov r5, #1
_06014E94:
	ldrh r0, [r6, #0x62]
	tst r0, r5, lsl r8
	beq _06014ED8
	ldrh r0, [r6, #0x60]
	tst r0, r5, lsl r8
	mov r0, r8, lsl #1
	ldrh r1, [r4, r0]
	beq _06014EC8
	orr r1, r1, #0x80
	add r0, sb, r7
	and r1, r1, #0xff
	bl sub_0600B9E4
	b _06014ED4
_06014EC8:
	add r0, sb, r7
	and r1, r1, #0xff
	bl sub_0600B9E4
_06014ED4:
	add r7, r7, #1
_06014ED8:
	add r8, r8, #1
	cmp r8, #0x10
	blo _06014E94
	sub r1, r7, #2
	add r0, sb, #1
	and r1, r1, #0xff
	bl sub_0600B9E4
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_06014F00: .word 0x0380FFF4
_06014F04: .word 0x060184F0
	arm_func_end sub_06014E64

	arm_func_start sub_06014F08
sub_06014F08: ; 0x06014F08
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _060151D8 ; =0x0380FFF4
	mov r0, #0
	ldr r7, [r1]
	mov r2, #0xb0
	add r1, r7, #0x2c
	add r4, r1, #0x400
	mov r1, r4
	add r5, r7, #0x344
	add r6, r7, #0x31c
	bl sub_0600A9F4
	add r0, r7, #0x400
	mov r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r4, #0xc]
	strh r1, [r4, #0x14]
	str r1, [r4, #0x20]
	strh r1, [r4, #0x28]
	ldr r0, _060151DC ; =0x0000FFFF
	str r1, [r4, #0x34]
	strh r0, [r4, #0xa2]
	strh r0, [r4, #0xa4]
	ldrh r0, [r5, #0xc]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _060151BC
_06014F70: ; jump table
	b _06014F80 ; case 0
	b _06014FFC ; case 1
	b _06015098 ; case 2
	b _06015144 ; case 3
_06014F80:
	ldr r7, _060151E0 ; =0x04804170
	ldr r0, _060151E4 ; =0x04804026
	str r7, [r4, #8]
	sub r1, r7, #0x148
	str r1, [r4, #0x1c]
	sub r2, r7, #0x170
	ldr r1, _060151E8 ; =sub_06013090
	str r2, [r4, #0x30]
	ldr r2, _060151EC ; =sub_0601320C
	str r1, [r4, #0x10]
	ldr r1, _060151F0 ; =sub_060136D8
	str r2, [r4, #0x24]
	ldr r3, _060151F4 ; =0x0000B6B8
	str r1, [r4, #0x38]
	sub r1, r7, #0x14c
	ldr r2, _060151F8 ; =0x00001D46
	strh r3, [r1]
	strh r2, [r0]
	strh r3, [r7, #-4]
	add r0, r0, #0x148
	strh r2, [r0]
	add r1, r7, #0x620
	ldr r0, _060151FC ; =0x04804792
	strh r3, [r1]
	strh r2, [r0]
	mov r1, #8
	ldr r0, _06015200 ; =0x048080AE
	strh r1, [r5, #0x8a]
	mov r1, #1
	strh r1, [r0]
	b _060151BC
_06014FFC:
	ldr r3, _06015204 ; =0x04804AA0
	ldr r2, _06015208 ; =0x04804334
	str r3, [r4, #8]
	sub r0, r3, #0x148
	str r0, [r4, #0x1c]
	ldr r0, _060151E8 ; =sub_06013090
	str r2, [r4, #0x30]
	ldr r1, _060151EC ; =sub_0601320C
	str r0, [r4, #0x10]
	ldr r0, _0601520C ; =sub_06013740
	str r1, [r4, #0x24]
	ldr ip, _06015210 ; =0x04804956
	str r0, [r4, #0x38]
	sub r1, r2, #0xfc
	str r1, [r4, #0x80]
	sub r7, r2, #0x334
	ldr r0, _060151F4 ; =0x0000B6B8
	str r7, [r4, #0x44]
	sub r7, r2, #0x100
	ldr lr, _060151F8 ; =0x00001D46
	strh r0, [r7]
	strh lr, [r2, #-0xfe]
	strh r0, [r2, #-4]
	strh lr, [r2, #-2]
	add r2, r2, #0x620
	strh r0, [r2]
	strh lr, [ip]
	strh r0, [r3, #-4]
	add r2, ip, #0x148
	strh lr, [r2]
	add r3, r3, #0x620
	ldr r2, _06015214 ; =0x048050C2
	strh r0, [r3]
	strh lr, [r2]
	mov r0, #0x208
	strh r0, [r5, #0x8a]
	str r1, [r4, #0x80]
	bl sub_06013F98
	b _060151BC
_06015098:
	ldr r1, _06015218 ; =0x048045D8
	ldr r3, _0601521C ; =0x04804232
	str r1, [r4, #8]
	sub r0, r1, #0x148
	str r0, [r4, #0x1c]
	sub r2, r1, #0x170
	ldr ip, _06015220 ; =0x04804000
	ldr r0, _060151E8 ; =sub_06013090
	str r2, [r4, #0x30]
	ldr r2, _060151EC ; =sub_0601320C
	str r0, [r4, #0x10]
	ldr r0, _060151F0 ; =sub_060136D8
	str r2, [r4, #0x24]
	str r0, [r4, #0x38]
	str ip, [r4, #0x58]
	add r2, ip, #0x234
	ldr r0, _060151F4 ; =0x0000B6B8
	str r2, [r4, #0x6c]
	add r2, ip, #0x230
	ldr r4, _060151F8 ; =0x00001D46
	strh r0, [r2]
	strh r4, [r3]
	sub r2, r1, #0x174
	strh r0, [r2]
	add r2, r3, #0x234
	strh r4, [r2]
	sub r2, r1, #0x14c
	strh r0, [r2]
	add r2, r3, #0x25c
	strh r4, [r2]
	strh r0, [r1, #-4]
	add r2, r3, #0x3a4
	strh r4, [r2]
	add r2, r1, #0x620
	ldr r1, _06015224 ; =0x04804BFA
	strh r0, [r2]
	strh r4, [r1]
	mov r1, #0x108
	ldr r0, _06015200 ; =0x048080AE
	strh r1, [r5, #0x8a]
	mov r1, #0xd
	strh r1, [r0]
	b _060151BC
_06015144:
	ldr ip, _060151E0 ; =0x04804170
	ldr r0, _060151E4 ; =0x04804026
	str ip, [r4, #8]
	sub r1, ip, #0x148
	str r1, [r4, #0x1c]
	sub r2, ip, #0x170
	ldr r1, _060151E8 ; =sub_06013090
	str r2, [r4, #0x30]
	ldr r2, _060151EC ; =sub_0601320C
	str r1, [r4, #0x10]
	ldr r1, _060151F0 ; =sub_060136D8
	str r2, [r4, #0x24]
	ldr r3, _060151F4 ; =0x0000B6B8
	str r1, [r4, #0x38]
	sub r1, ip, #0x14c
	ldr r2, _060151F8 ; =0x00001D46
	strh r3, [r1]
	strh r2, [r0]
	strh r3, [ip, #-4]
	add r0, r0, #0x148
	strh r2, [r0]
	add r1, ip, #0x620
	ldr r0, _060151FC ; =0x04804792
	strh r3, [r1]
	strh r2, [r0]
	mov r1, #0x108
	ldr r0, _06015200 ; =0x048080AE
	strh r1, [r5, #0x8a]
	mov r1, #0xd
	strh r1, [r0]
_060151BC:
	ldrh r0, [r6, #0x18]
	cmp r0, #0
	ldrneh r0, [r5, #0x8a]
	orrne r0, r0, #0x4000
	strneh r0, [r5, #0x8a]
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_060151D8: .word 0x0380FFF4
_060151DC: .word 0x0000FFFF
_060151E0: .word 0x04804170
_060151E4: .word 0x04804026
_060151E8: .word sub_06013090
_060151EC: .word sub_0601320C
_060151F0: .word sub_060136D8
_060151F4: .word 0x0000B6B8
_060151F8: .word 0x00001D46
_060151FC: .word 0x04804792
_06015200: .word 0x048080AE
_06015204: .word 0x04804AA0
_06015208: .word 0x04804334
_0601520C: .word sub_06013740
_06015210: .word 0x04804956
_06015214: .word 0x048050C2
_06015218: .word 0x048045D8
_0601521C: .word 0x04804232
_06015220: .word 0x04804000
_06015224: .word 0x04804BFA
	arm_func_end sub_06014F08

	arm_func_start sub_06015228
sub_06015228: ; 0x06015228
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, _060154F4 ; =0x0380FFF4
	mvn r0, #0
	ldr r4, [r1]
	add r7, r4, #0x17c
	ldr r5, [r7, #0x48]
	add r6, r4, #0x344
	cmp r5, r0
	beq _060154EC
	ldrh r0, [r6, #8]
	cmp r0, #0x40
	beq _06015268
	mov r1, r5
	add r0, r7, #0x48
	bl sub_06009144
	b _060154EC
_06015268:
	ldrh r0, [r5, #0x24]
	mov r0, r0, lsl #0x17
	movs r0, r0, lsr #0x1f
	beq _06015280
	ldrh r0, [r5, #0x34]
	b _06015284
_06015280:
	ldrh r0, [r5, #0x28]
_06015284:
	tst r0, #1
	ldrne r0, [r4, #0x568]
	mov sb, #1
	addne r0, r0, #1
	strne r0, [r4, #0x568]
	ldreq r0, [r4, #0x564]
	addeq r0, r0, #1
	streq r0, [r4, #0x564]
	ldrh r0, [r5, #0x18]
	ldr r2, [r4, #0x560]
	and r1, r0, #0xf0
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	mov r0, r0, asr #4
	sub r0, r0, #1
	add r0, r2, r0
	str r0, [r4, #0x560]
	ldrh r2, [r6, #0xc]
	cmp r2, #1
	beq _060152E4
	cmp r2, #2
	cmpne r2, #3
	beq _060153C0
	b _06015460
_060152E4:
	ldrh r0, [r5, #0x24]
	tst r0, #1
	bne _06015460
	add r0, r5, #0x2e
	bl sub_0600E1AC
	mov r8, r0
	cmp r8, #0xff
	beq _06015310
	bl sub_0600E88C
	cmp r0, #0x40
	beq _06015374
_06015310:
	mov r0, r8
	bl sub_0600E88C
	cmp r0, #0x30
	add r0, r5, #0x2e
	bne _06015344
	mov r1, #0xa0
	bl sub_06014D88
	cmp r0, #0
	bne _06015460
	add r0, r5, #0x2e
	mov r1, #7
	bl sub_06014438
	b _06015364
_06015344:
	mov r1, #0xc0
	bl sub_06014D88
	cmp r0, #0
	bne _06015460
	add r0, r5, #0x2e
	mov r1, #7
	mov r2, #1
	bl sub_06014C50
_06015364:
	cmp r0, #0
	beq _06015460
	bl sub_06013E10
	b _06015460
_06015374:
	ldrh r1, [r5, #0x24]
	mov r0, r8, lsl #0x10
	mov r1, r1, lsl #0x13
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x1f
	bl sub_0600E5F8
	mov r0, r8
	bl sub_0600E92C
	ldrh r1, [r5, #0x3a]
	cmp r1, r0
	ldreq r0, [r4, #0x578]
	addeq r0, r0, #1
	streq r0, [r4, #0x578]
	beq _06015460
	add r0, r5, #0x28
	add r1, r5, #0x34
	bl sub_0600A928
	mov sb, #0
	b _06015460
_060153C0:
	ldrh r1, [r5, #0x24]
	tst r1, #1
	bne _06015460
	ldrh r0, [r6, #0xe]
	cmp r0, #0
	beq _0601542C
	tst r1, #0x2000
	bne _0601542C
	ldrh r0, [r5, #0x28]
	tst r0, #1
	ldrneh r0, [r6, #0x8e]
	bicne r0, r0, #1
	strneh r0, [r6, #0x8e]
	bne _06015408
	cmp r2, #3
	ldrneh r0, [r6, #0x8e]
	bicne r0, r0, #2
	strneh r0, [r6, #0x8e]
_06015408:
	ldrh r0, [r6, #0x8e]
	cmp r0, #0
	ldreqh r0, [r7, #0x20]
	cmpeq r0, #0
	ldreqh r0, [r7, #0x2c]
	cmpeq r0, #0
	bne _0601542C
	mov r0, #1
	bl sub_0600A458
_0601542C:
	ldrh r8, [r6, #0x88]
	mov r0, r8
	bl sub_0600E92C
	ldrh r1, [r5, #0x3a]
	cmp r1, r0
	ldreq r0, [r4, #0x578]
	addeq r0, r0, #1
	streq r0, [r4, #0x578]
	beq _06015460
	add r0, r5, #0x2e
	add r1, r5, #0x34
	bl sub_0600A928
	mov sb, #0
_06015460:
	cmp sb, #0
	bne _060154C8
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	strh r0, [r5, #0x12]
	ldrh r1, [r5, #0x22]
	and r1, r1, #0xff
	bl sub_0600E5D8
	ldrh r1, [r5, #0x3a]
	mov r0, r8
	bl sub_0600E6F8
	mov r0, r8
	bl sub_0600E738
	ldrh r1, [r5, #0x20]
	mov r0, #0x180
	sub r1, r1, #0x18
	strh r1, [r5, #0x16]
	strh r0, [r5, #0xc]
	ldrh r0, [r5, #0x16]
	mov r1, r5
	add r0, r0, #0x2d
	mov r2, r0, lsr #1
	add r0, r7, #0x48
	strh r2, [r5, #0xe]
	bl sub_0600F388
	b _060154D4
_060154C8:
	mov r1, r5
	add r0, r7, #0x48
	bl sub_06009144
_060154D4:
	ldrh r0, [r7, #0x50]
	cmp r0, #0
	beq _060154EC
	mov r0, #2
	mov r1, #6
	bl sub_06008F04
_060154EC:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_060154F4: .word 0x0380FFF4
	arm_func_end sub_06015228

	arm_func_start sub_060154F8
sub_060154F8: ; 0x060154F8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _06015664 ; =0x0380FFF4
	mov r6, r0
	ldr r0, [r1]
	add r4, r0, #0x344
	ldrh r1, [r4, #8]
	add r0, r0, #0xdc
	cmp r1, #0x40
	add r5, r0, #0x400
	movne r0, #1
	bne _0601565C
	add r0, r6, #0x1e
	add r1, r4, #0x64
	bl sub_0600ACC4
	cmp r0, #0
	beq _0601554C
	add r0, r6, #0x24
	add r1, r4, #0x82
	bl sub_0600ACC4
	cmp r0, #0
	bne _06015554
_0601554C:
	mov r0, #1
	b _0601565C
_06015554:
	ldrh r0, [r4, #0x6a]
	mov r1, #1
	mov r0, r1, lsl r0
	ldrh r1, [r6, #0x2e]
	mov r0, r0, lsl #0x10
	tst r1, r0, lsr #16
	moveq r0, #0
	movne r0, #0x2000
	strh r0, [r5, #6]
	ldr r0, _06015668 ; =0x04808098
	ldrh r0, [r0]
	tst r0, #0x8000
	beq _060155AC
	mov r0, r0, lsl #0x11
	mov r0, r0, lsr #0x10
	add r0, r0, #0x4800000
	add r0, r0, #0x4000
	ldrh r0, [r0, #4]
	cmp r0, #0
	ldrneh r0, [r5, #6]
	orrne r0, r0, #0x4000
	strneh r0, [r5, #6]
_060155AC:
	ldrh r0, [r4, #0x88]
	bl sub_0600E738
	ldrh r1, [r6, #0x10]
	ldr r0, _0601566C ; =0x00000182
	sub r1, r1, #0x1c
	strh r1, [r6, #6]
	sub r1, r6, #0x10
	strh r0, [r1, #0xc]
	ldrh r2, [r6, #6]
	mov r0, #0
	add r2, r2, #0x31
	mov r2, r2, lsr #1
	strh r2, [r1, #0xe]
	ldrh r2, [r1, #0x3e]
	b _060155F8
_060155E8:
	tst r2, #1
	mov r2, r2, lsl #0xf
	addne r0, r0, #1
	mov r2, r2, lsr #0x10
_060155F8:
	cmp r2, #0
	bne _060155E8
	ldr r2, _06015670 ; =0x04808094
	ldrh r3, [r5, #6]
	ldrh r4, [r2]
	ldrh r2, [r2, #4]
	ldrh r5, [r1, #0x18]
	and r2, r2, #0x8000
	and r4, r4, #0x8000
	orr r2, r3, r2, asr #4
	orr r2, r2, r4, asr #3
	orr r2, r5, r2
	strh r2, [r1, #0x18]
	ldrh r2, [r1, #0x3c]
	ldrh r3, [r1, #0x1c]
	add r2, r2, #0xa
	mul r2, r0, r2
	add r0, r2, #0xfc
	add r2, r3, r0, lsr #4
	ldr r0, _06015664 ; =0x0380FFF4
	strh r2, [r1, #0x1a]
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_0600F388
	mov r0, #0
_0601565C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_06015664: .word 0x0380FFF4
_06015668: .word 0x04808098
_0601566C: .word 0x00000182
_06015670: .word 0x04808094
	arm_func_end sub_060154F8

	arm_func_start sub_06015674
sub_06015674: ; 0x06015674
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _0601581C ; =0x0380FFF4
	mov r7, r0
	ldr r1, [r1]
	add r0, r1, #0x2c
	add r5, r0, #0x400
	ldrh r0, [r5, #0x3c]
	ldr r4, [r5, #0x90]
	cmp r0, #0
	beq _06015814
	add r0, r7, #0x18
	add r1, r1, #0x3a8
	bl sub_0600ACC4
	cmp r0, #0
	beq _06015814
	ldrh r1, [r7, #0x10]
	ldrh r0, [r4, #0x16]
	sub r1, r1, #0x18
	sub r0, r0, #8
	cmp r1, r0
	bgt _06015814
	add r0, r7, #0x1e
	bl sub_0600E1AC
	mov r6, r0
	cmp r6, #0xff
	beq _060156F0
	cmp r6, #0
	beq _0601572C
	bl sub_0600E88C
	cmp r0, #0x40
	beq _0601572C
_060156F0:
	add r0, r7, #0x1e
	mov r1, #0xc0
	bl sub_06014D88
	cmp r0, #0
	bne _06015814
	add r0, r7, #0x1e
	mov r1, #7
	mov r2, #0
	bl sub_06014C50
	cmp r0, #0
	beq _06015814
	mov r1, #2
	strh r1, [r0]
	bl sub_06013E10
	b _06015814
_0601572C:
	cmp r6, #0
	beq _06015814
	ldrh r1, [r7, #0x14]
	mov r0, r6, lsl #0x10
	mov r1, r1, lsl #0x13
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x1f
	bl sub_0600E5F8
	mov r0, r6
	bl sub_0600E738
	mov r0, r6
	bl sub_0600E978
	mov r1, #1
	mov r0, r1, lsl r0
	mov r0, r0, lsl #0x10
	ldrh r1, [r5, #0x9a]
	mov r2, r0, lsr #0x10
	tst r2, r1
	bne _06015814
	ldrh r0, [r5, #0x98]
	tst r2, r0
	beq _06015814
	orr r0, r1, r2
	strh r0, [r5, #0x9a]
	ldrh r1, [r4, #0x10]
	mvn r0, r2
	and r1, r1, r0
	mov r0, r2, lsl #0xf
	strh r1, [r4, #0x10]
	add r6, r4, #0x1a
	mov r1, r0, lsr #0x10
	b _060157C4
_060157AC:
	ldrh r0, [r5, #0x98]
	tst r1, r0
	ldrneh r0, [r4, #0x16]
	addne r6, r6, r0
	mov r0, r1, lsl #0xf
	mov r1, r0, lsr #0x10
_060157C4:
	cmp r1, #1
	bne _060157AC
	ldrh r1, [r7, #0x10]
	add r0, r6, #3
	sub r1, r1, #0x18
	strh r1, [r6]
	ldrh r1, [r7, #0x12]
	and r1, r1, #0xff
	bl sub_0600B9E4
	ldrh r1, [r7, #0xe]
	add r0, r6, #2
	and r1, r1, #0xff
	bl sub_0600B9E4
	ldrh r2, [r6]
	cmp r2, #0
	beq _06015814
	add r0, r7, #0x2c
	add r1, r6, #8
	add r2, r2, #1
	bl sub_06001B04
_06015814:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_0601581C: .word 0x0380FFF4
	arm_func_end sub_06015674

	arm_func_start sub_06015820
sub_06015820: ; 0x06015820
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _060158E8 ; =0x0380FFF4
	mov r4, r0
	ldr r1, [r1]
	add r0, r1, #0x300
	ldrh r0, [r0, #0x4c]
	add r5, r1, #0x344
	cmp r0, #0x40
	movne r0, #1
	bne _060158E0
	add r0, r4, #0x1e
	add r1, r5, #0x64
	bl sub_0600ACC4
	cmp r0, #0
	beq _06015870
	add r0, r4, #0x24
	add r1, r5, #0x82
	bl sub_0600ACC4
	cmp r0, #0
	bne _06015878
_06015870:
	mov r0, #1
	b _060158E0
_06015878:
	ldrh r1, [r4, #0x10]
	ldr r0, _060158EC ; =0x00000185
	sub r1, r1, #0x1c
	strh r1, [r4, #6]
	sub r1, r4, #0x10
	strh r0, [r1, #0xc]
	mov r0, #0x18
	strh r0, [r1, #0xe]
	ldr r4, _060158E8 ; =0x0380FFF4
	ldr r2, _060158F0 ; =0x04808094
	ldr r0, [r4]
	ldrh ip, [r2]
	add r0, r0, #0x400
	ldrh r2, [r2, #4]
	ldrh r3, [r0, #0xe2]
	and r0, r2, #0x8000
	ldrh lr, [r1, #0x18]
	and r2, ip, #0x8000
	orr r0, r3, r0, asr #4
	orr r0, r0, r2, asr #3
	orr r0, lr, r0
	strh r0, [r1, #0x18]
	ldr r0, [r4]
	add r0, r0, #0x188
	bl sub_0600F388
	mov r0, #0
_060158E0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_060158E8: .word 0x0380FFF4
_060158EC: .word 0x00000185
_060158F0: .word 0x04808094
	arm_func_end sub_06015820

	arm_func_start sub_060158F4
sub_060158F4: ; 0x060158F4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	ldr r1, _06015F1C ; =0x0380FFF4
	mov sl, r0
	ldr r3, [r1]
	add r0, sl, #0x1e
	ldr r2, [r3, #0x570]
	add r1, r3, #4
	add r2, r2, #1
	str r2, [r3, #0x570]
	add r4, r3, #0x344
	add r5, r1, #0x400
	add r6, r3, #0x31c
	add r7, r3, #0x17c
	bl sub_0600E254
	mov r8, r0
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	strh r0, [sl, #2]
	cmp r8, #0xff
	beq _06015F10
	ldrh r1, [sl, #0x12]
	bl sub_0600E5D8
	ldrh sb, [sl, #6]
	cmp sb, #0xc
	bls _06015F10
	add r1, sp, #0x18
	mov r0, #0
	mov r2, #0x2c
	bl sub_0600A9F4
	add r2, sl, #0x38
	sub r1, sb, #0xc
	mov r0, #2
	str r2, [sp, #0x18]
	strh r1, [sp, #0x20]
	strh r0, [sp, #0x22]
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	ldreqh r0, [sp, #0x22]
	orreq r0, r0, #1
	streqh r0, [sp, #0x22]
	mov r0, #0x38
	strh r0, [sp, #0x24]
	ldrh r1, [sl, #8]
	add r0, sp, #0x18
	strh r1, [sp, #0x1c]
	ldrh r1, [sl, #0x36]
	strh r1, [sp, #0x1e]
	bl sub_06016CC4
	ldr sb, [sp, #0x38]
	cmp sb, #0
	beq _060159F0
	ldrh r0, [sl, #0x16]
	tst r0, #0x8000
	beq _060159F0
	add r0, sb, #6
	bl sub_0600BA10
	mov fp, r0
	add r0, sb, #7
	bl sub_0600BA10
	ldr r1, _06015F20 ; =0x0480810C
	add r0, fp, r0, lsl #8
	strh r0, [r1]
_060159F0:
	ldrh r1, [r5]
	cmp r1, #0x13
	ldreq r0, [r5, #0x18]
	ldreqh r0, [r0, #0x38]
	cmpeq r0, #1
	bne _06015A28
	ldrh r0, [sp, #0x22]
	and r0, r0, #9
	cmp r0, #9
	bne _06015EF8
	add r1, sp, #0x18
	mov r0, sl
	bl sub_060162A4
	b _06015EF8
_06015A28:
	ldrh r0, [sp, #0x22]
	tst r0, #8
	beq _06015EF8
	cmp r1, #0x21
	bne _06015BB0
	bl sub_0600B8A0
	ldrh r0, [sp, #0x22]
	and r0, r0, #0x30
	cmp r0, #0x30
	movne r0, #0xc
	strneh r0, [r5, #4]
	movne r0, #0xa
	strneh r0, [r5, #6]
	bne _06015B8C
	ldrh r0, [sl, #0x34]
	cmp r0, #0x3e8
	movhi r0, #0xc
	strhih r0, [r5, #4]
	movhi r0, #1
	strhih r0, [r5, #6]
	bhi _06015B8C
	mov r1, #0
	strh r1, [r5, #4]
	ldrh r0, [sp, #0x24]
	tst r0, #2
	beq _06015AA4
	ldrh r0, [sp, #0x22]
	tst r0, #2
	bne _06015AA4
	ldrh r0, [sp, #0x2a]
	bl sub_0600A0A4
_06015AA4:
	ldrh r1, [sp, #0x2e]
	mov r0, r8
	bl sub_0600E6D8
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	bne _06015B34
	ldr sb, [sp, #0x40]
	cmp sb, #0
	beq _06015B1C
	add r0, sb, #6
	bl sub_0600BA10
	mov fp, r0
	add r0, sb, #7
	bl sub_0600BA10
	add r0, fp, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #1
	bl sub_06009954
	ldr r0, [sp, #0x40]
	add r0, r0, #8
	bl sub_0600BA10
	ldr r1, [sp, #0x40]
	mov sb, r0
	add r0, r1, #9
	bl sub_0600BA10
	add r1, sb, r0, lsl #8
	ldr r0, _06015F24 ; =0x0380FFF0
	strh r1, [r0]
	b _06015B34
_06015B1C:
	ldr r0, _06015F28 ; =0x0000FFFF
	mov r1, #1
	bl sub_06009954
	ldr r0, _06015F24 ; =0x0380FFF0
	mov r1, #0
	strh r1, [r0]
_06015B34:
	ldr r0, [sp, #0x3c]
	add r0, r0, #3
	bl sub_0600BA10
	bl sub_06009EDC
	ldr r0, [sp, #0x3c]
	add r0, r0, #2
	bl sub_0600BA10
	strh r0, [r4, #0x76]
	ldrh r0, [sl, #0x34]
	bl sub_06009E84
	mov r0, #1
	strh r0, [r4, #0x12]
	strh r0, [r4, #0x1a]
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	ldreq r0, _06015F2C ; =0x04808048
	moveq r1, #3
	streqh r1, [r0]
	ldr r1, _06015F30 ; =0x04808038
	ldrh r0, [r1]
	orr r0, r0, #1
	strh r0, [r1]
_06015B8C:
	ldr r0, [r5, #0x1c]
	add r1, sl, #0x1e
	add r0, r0, #8
	bl sub_0600A928
	mov r2, #0x25
	mov r0, #2
	mov r1, #1
	strh r2, [r5]
	bl sub_06008F04
_06015BB0:
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	beq _06015BC8
	cmp r0, #3
	beq _06015C80
	b _06015EE0
_06015BC8:
	ldr sb, [sp, #0x40]
	cmp sb, #0
	beq _06015C80
	add r0, sb, #6
	bl sub_0600BA10
	mov r5, r0
	add r0, sb, #7
	bl sub_0600BA10
	add r0, r5, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl sub_06009954
	ldr r0, [sp, #0x40]
	add r0, r0, #8
	bl sub_0600BA10
	ldr r1, [sp, #0x40]
	mov r5, r0
	add r0, r1, #9
	bl sub_0600BA10
	ldr r1, _06015F24 ; =0x0380FFF0
	add r0, r5, r0, lsl #8
	strh r0, [r1]
	ldr r0, [sp, #0x40]
	add r0, r0, #1
	bl sub_0600BA10
	sub r0, r0, #8
	strh r0, [r4, #0xa0]
	ldrh r2, [r4, #0xa0]
	cmp r2, #0
	beq _06015C80
	ldr r0, [sp, #0x40]
	ldr r1, [r4, #0x9c]
	tst r0, #1
	beq _06015C6C
	add r0, r0, #9
	add r2, r2, #2
	bl sub_06001B04
	mov r0, #1
	strh r0, [r4, #0xa2]
	b _06015C80
_06015C6C:
	add r0, r0, #0xa
	add r2, r2, #1
	bl sub_06001B04
	mov r0, #0
	strh r0, [r4, #0xa2]
_06015C80:
	mov r1, #0
	mov r0, r8
	strh r1, [r4, #0x80]
	bl sub_0600E738
	add r1, sl, #0x2c
	add r0, sp, #0x10
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	ldrh r0, [r4, #0x6e]
	mov r5, #0
	mov r8, r0, lsl #0xa
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r2, r8
	mov r3, r5
	bl sub_0600B1CC
	adds fp, r0, #1
	umull r3, r0, fp, r8
	adc sb, r1, #0
	mla r0, fp, r5, r0
	mla r0, sb, r8, r0
	add r2, sp, #0x10
	str r0, [sp, #0x14]
	ldr r1, _06015F34 ; =0x048080F6
	ldrh r0, [r2, #6]
	str r3, [sp, #0x10]
	strh r0, [r1]
	ldrh r0, [r2, #4]
	strh r0, [r1, #-2]
	ldrh r0, [r2, #2]
	strh r0, [r1, #-4]
	ldrh r0, [r2]
	orr r0, r0, #1
	strh r0, [r1, #-6]
	ldrh r0, [r4, #0xc]
	cmp r0, #2
	bne _06015DE8
	ldrh r0, [r4, #0x1a]
	cmp r0, #0
	beq _06015DE8
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	subs r1, r1, r8
	sbc r0, r0, r5
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	bl sub_06000720
	ldr r1, _06015F38 ; =0x048080F8
	ldrh ip, [r1]
	ldrh fp, [r1, #2]
	ldrh sb, [r1, #4]
	ldrh r8, [r1, #6]
	ldrh r5, [r1]
	ldrh r3, [r1, #2]
	ldrh r2, [r1, #4]
	ldrh r1, [r1, #6]
	strh ip, [sp, #8]
	strh r5, [sp]
	strh fp, [sp, #0xa]
	strh sb, [sp, #0xc]
	strh r8, [sp, #0xe]
	strh r3, [sp, #2]
	strh r2, [sp, #4]
	strh r1, [sp, #6]
	bl sub_06000740
	ldrh r1, [sp, #8]
	ldrh r0, [sp]
	cmp r1, r0
	bhs _06015DAC
	ldr r2, [sp, #8]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	subs r2, r2, r0
	ldr r0, [sp, #0x14]
	b _06015DC0
_06015DAC:
	ldr r2, [sp]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #4]
	subs r2, r2, r0
	ldr r0, [sp, #0x14]
_06015DC0:
	sbc r0, r1, r0
	mov r2, r2, lsr #0xa
	orr r2, r2, r0, lsl #22
	ldrh r1, [r6, #0x20]
	ldr r0, _06015F3C ; =0x04808134
	cmp r2, r1
	sublo r1, r1, r2
	strloh r1, [r0]
	movhs r1, #0
	strhsh r1, [r0]
_06015DE8:
	ldrh r0, [r4, #8]
	cmp r0, #0x40
	bne _06015EE0
	ldr r1, [sp, #0x3c]
	cmp r1, #0
	beq _06015EE0
	ldrh r0, [r4, #0xe]
	cmp r0, #1
	bne _06015EE0
	add r0, r1, #2
	bl sub_0600BA10
	ldrh r1, [r4, #0x76]
	cmp r1, r0
	strneh r0, [r4, #0x76]
	mov r1, #0
	strh r1, [r4, #0x8e]
	cmp r0, #0
	bne _06015E4C
	ldr r0, [sp, #0x3c]
	add r0, r0, #4
	bl sub_0600BA10
	tst r0, #1
	ldrneh r0, [r4, #0x8e]
	orrne r0, r0, #1
	strneh r0, [r4, #0x8e]
_06015E4C:
	ldr r0, [sp, #0x3c]
	add r0, r0, #4
	bl sub_0600BA10
	ldr r1, [sp, #0x3c]
	and r8, r0, #0xfe
	add r0, r1, #1
	mov r5, r8, lsl #3
	bl sub_0600BA10
	ldrh r1, [r4, #0x6a]
	add r0, r8, r0
	cmp r1, r8, lsl #3
	sub r0, r0, #3
	blo _06015EBC
	cmp r1, r0, lsl #3
	bhi _06015EBC
	ldr r0, [sp, #0x3c]
	sub r5, r1, r5
	add r0, r0, #5
	add r0, r0, r5, lsr #3
	bl sub_0600BA10
	and r1, r5, #7
	mov r2, #1
	tst r0, r2, lsl r1
	beq _06015EBC
	ldrh r0, [r4, #0x8e]
	orr r0, r0, #2
	strh r0, [r4, #0x8e]
	bl sub_06013E9C
_06015EBC:
	ldrh r0, [r7, #0x20]
	cmp r0, #0
	ldreqh r0, [r7, #0x2c]
	cmpeq r0, #0
	ldreqh r0, [r4, #0x8e]
	cmpeq r0, #0
	bne _06015EE0
	mov r0, #1
	bl sub_0600A458
_06015EE0:
	ldrh r0, [r6, #0x1e]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	beq _06015EF8
	mov r0, sl
	bl sub_06010D20
_06015EF8:
	ldr r2, [sp, #0x34]
	cmp r2, #0
	beq _06015F10
	ldrh r0, [sp, #0x2a]
	mov r1, sl
	bl sub_06017D58
_06015F10:
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06015F1C: .word 0x0380FFF4
_06015F20: .word 0x0480810C
_06015F24: .word 0x0380FFF0
_06015F28: .word 0x0000FFFF
_06015F2C: .word 0x04808048
_06015F30: .word 0x04808038
_06015F34: .word 0x048080F6
_06015F38: .word 0x048080F8
_06015F3C: .word 0x04808134
	arm_func_end sub_060158F4

	arm_func_start sub_06015F40
sub_06015F40: ; 0x06015F40
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _0601601C ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	ldrh r5, [r4, #2]
	add r1, r0, #0x344
	ldrh r0, [r1, #0xc]
	cmp r0, #1
	beq _06015F74
	cmp r0, #2
	cmpne r0, #3
	beq _06015FDC
	b _06016014
_06015F74:
	mov r0, r5
	bl sub_0600E88C
	cmp r0, #0x40
	bne _06015FAC
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x30
	bl sub_0600E4F0
	ldrh r1, [r4, #0x2c]
	add r0, r4, #0x1e
	bl sub_06010BD0
	mov r0, r5
	bl sub_06013AF4
	b _06016014
_06015FAC:
	cmp r0, #0x30
	add r0, r4, #0x1e
	mov r1, #7
	bne _06015FC4
	bl sub_06014438
	b _06015FCC
_06015FC4:
	mov r2, #1
	bl sub_06014C50
_06015FCC:
	cmp r0, #0
	beq _06016014
	bl sub_06013E10
	b _06016014
_06015FDC:
	ldrh r0, [r1, #8]
	cmp r0, #0x40
	bne _06016014
	add r0, r4, #0x1e
	add r1, r1, #0x82
	bl sub_0600ACC4
	cmp r0, #0
	beq _06016014
	mov r0, #0x30
	bl sub_0600A884
	bl sub_0600A7E0
	ldrh r1, [r4, #0x2c]
	add r0, r4, #0x1e
	bl sub_06010BD0
_06016014:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0601601C: .word 0x0380FFF4
	arm_func_end sub_06015F40

	arm_func_start sub_06016020
sub_06016020: ; 0x06016020
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x2c
	ldr r1, _060161E8 ; =0x0380FFF4
	mov r7, r0
	ldr r0, [r1]
	ldrh r5, [r7, #6]
	add r4, r0, #0x31c
	cmp r5, #4
	bls _060161DC
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	bne _060161DC
	add r0, r7, #0x1e
	mov r1, #0x10
	bl sub_06014D88
	cmp r0, #0
	bne _060161DC
	ldrh r6, [r7, #2]
	cmp r6, #0
	beq _06016084
	mov r0, r6
	bl sub_0600E88C
	cmp r0, #0x30
	bhs _060160B8
_06016084:
	add r0, r7, #0x1e
	mov r1, #0xc0
	bl sub_06014D88
	cmp r0, #0
	bne _060161DC
	add r0, r7, #0x1e
	mov r1, #6
	mov r2, #1
	bl sub_06014C50
	cmp r0, #0
	beq _060161DC
	bl sub_06013E10
	b _060161DC
_060160B8:
	mov r0, r6
	bl sub_0600E88C
	cmp r0, #0x40
	mov r0, r6
	bne _060160E4
	mov r1, #0x30
	bl sub_0600E4F0
	add r0, r7, #0x1e
	mov r1, #1
	bl sub_06010BD0
	b _060160F0
_060160E4:
	bl sub_0600E978
	cmp r0, #0
	bne _060161DC
_060160F0:
	add r1, sp, #0
	mov r0, #0
	mov r2, #0x2c
	bl sub_0600A9F4
	add r2, r7, #0x30
	sub r1, r5, #4
	str r2, [sp]
	strh r1, [sp, #8]
	add r0, sp, #0
	bl sub_06016CC4
	ldrh r1, [r7, #0x2c]
	ldr r0, _060161EC ; =0x0000FFC2
	tst r1, r0
	bne _06016188
	mov r0, r1, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _06016188
	ldrh r2, [r4, #0x18]
	cmp r2, #0
	moveq r0, r1, lsl #0x1b
	moveq r0, r0, lsr #0x1f
	cmpeq r0, #1
	beq _06016188
	cmp r2, #0
	beq _06016164
	ldrh r0, [r7, #0x2c]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _06016188
_06016164:
	ldrh r0, [r4, #0x1e]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	bne _06016190
	ldrh r0, [r7, #0x2c]
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	bne _06016190
_06016188:
	mov r1, #0xa
	b _060161C4
_06016190:
	mov r0, r6
	bl sub_0600E6B8
	ldrh r0, [sp, #0xa]
	tst r0, #1
	moveq r1, #1
	beq _060161C4
	tst r0, #4
	moveq r1, #0x12
	beq _060161C4
	ldrh r1, [sp, #0x16]
	mov r0, r6
	bl sub_0600E6D8
	mov r1, #0
_060161C4:
	ldr r2, [sp, #0x1c]
	mov r0, r6
	bl sub_06014610
	cmp r0, #0
	beq _060161DC
	bl sub_06013E10
_060161DC:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_060161E8: .word 0x0380FFF4
_060161EC: .word 0x0000FFC2
	arm_func_end sub_06016020

	arm_func_start sub_060161F0
sub_060161F0: ; 0x060161F0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x2c
	mov r4, r0
	add r0, r4, #0x1e
	mov r1, #0x50
	bl sub_06014D88
	cmp r0, #0
	bne _06016294
	ldrh r0, [r4, #0x24]
	tst r0, #1
	bne _06016228
	ldrh r0, [r4, #8]
	tst r0, #0x8000
	beq _06016294
_06016228:
	add r1, sp, #0
	mov r0, #0
	mov r2, #0x2c
	bl sub_0600A9F4
	add r0, r4, #0x2c
	str r0, [sp]
	ldrh r1, [r4, #6]
	ldr r0, _060162A0 ; =0x0380FFF4
	strh r1, [sp, #8]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x3a]
	mov r0, r0, lsl #0x1e
	movs r0, r0, lsr #0x1f
	moveq r0, #0x800
	streqh r0, [sp, #0xc]
	add r0, sp, #0
	bl sub_06016CC4
	ldrh r0, [sp, #0xa]
	and r0, r0, #1
	cmp r0, #1
	bne _06016294
	add r0, r4, #0x1e
	bl sub_06014970
	cmp r0, #0
	beq _06016294
	bl sub_06013E10
_06016294:
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_060162A0: .word 0x0380FFF4
	arm_func_end sub_060161F0

	arm_func_start sub_060162A4
sub_060162A4: ; 0x060162A4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	ldr r2, _0601666C ; =0x0380FFF4
	mov r7, r0
	ldr r2, [r2]
	mov sl, r1
	add r0, r2, #0x400
	ldrh r1, [r0, #4]
	add r0, r2, #4
	cmp r1, #0x13
	add r4, r0, #0x400
	bne _06016660
	ldr r0, [r4, #0x18]
	ldr r5, [r4, #0x1c]
	add r8, r0, #0x4e
	mov r6, #0
	b _06016314
_060162E8:
	mov r0, r8
	add r1, r7, #0x24
	bl sub_0600ACC4
	cmp r0, #0
	ldrneh r1, [r5, #6]
	movne r0, #1
	orrne r0, r1, r0, lsl r6
	strneh r0, [r5, #6]
	bne _06016660
	add r8, r8, #6
	add r6, r6, #1
_06016314:
	ldr r0, [r4, #0x18]
	ldrh r0, [r0, #0x4c]
	cmp r6, r0
	blo _060162E8
	add r6, r5, #0xa
	mov r8, #0
	b _06016350
_06016330:
	add r0, r7, #0x24
	add r1, r6, #4
	bl sub_0600ACC4
	cmp r0, #0
	bne _06016660
	ldrh r0, [r6]
	add r8, r8, #1
	add r6, r6, r0, lsl #1
_06016350:
	ldrh r0, [r5, #8]
	cmp r8, r0
	blo _06016330
	mov r1, r6
	mov r0, #0
	mov r2, #0x40
	bl sub_06000598
	ldrh r8, [r7, #6]
	cmp r8, #0xc
	bls _06016660
	cmp sl, #0
	bne _060163CC
	add r1, sp, #4
	mov r0, #0
	mov r2, #0x2c
	bl sub_0600A9F4
	add r3, r7, #0x38
	sub r2, r8, #0xc
	mov r0, #0x38
	strh r0, [sp, #0x10]
	mov r1, #3
	str r3, [sp, #4]
	strh r2, [sp, #0xc]
	strh r1, [sp, #0xe]
	ldrh r1, [r7, #8]
	add r0, sp, #4
	strh r1, [sp, #8]
	ldrh r1, [r7, #0x36]
	strh r1, [sp, #0xa]
	bl sub_06016CC4
	add sl, sp, #4
_060163CC:
	ldr r0, [sl, #0x28]
	cmp r0, #0
	ldreqh r0, [sl, #0x1a]
	beq _060163F0
	add r0, r0, #1
	bl sub_0600BA10
	sub r0, r0, #8
	strh r0, [r6, #0x3c]
	ldrh r0, [r6, #0x3c]
_060163F0:
	add r0, r0, #0x41
	mov r0, r0, lsr #1
	strh r0, [r6]
	ldrh r0, [sl, #0xa]
	and r0, r0, #1
	cmp r0, #1
	bne _06016654
	ldr r0, _0601666C ; =0x0380FFF4
	ldrh r1, [r6]
	ldr r0, [r0]
	add r0, r0, #0x400
	ldrh r0, [r0, #8]
	cmp r0, r1
	blo _06016654
	ldrh r1, [r7, #0x36]
	add r0, r6, #4
	strh r1, [r6, #0x2c]
	add r1, r7, #0x24
	bl sub_0600A928
	ldrh r0, [r7, #0x34]
	strh r0, [r6, #0x32]
	ldrh r0, [r7, #0x12]
	and r0, r0, #0xff
	strh r0, [r6, #2]
	ldr r0, [sl, #0x28]
	cmp r0, #0
	beq _06016498
	mov r7, #0
	add r8, r6, #0x40
	b _06016488
_06016468:
	ldr r0, [sl, #0x28]
	add r0, r0, #0xa
	add r0, r0, r7
	bl sub_0600BA10
	mov r1, r0
	add r0, r8, r7
	bl sub_0600B9E4
	add r7, r7, #1
_06016488:
	ldrh r0, [r6, #0x3c]
	cmp r7, r0
	blo _06016468
	b _0601653C
_06016498:
	ldrh r0, [sl, #0x18]
	strh r0, [r6, #0x3e]
	ldrh r0, [sl, #0x18]
	cmp r0, #0
	beq _0601653C
	add r7, r7, #0x38
	add fp, r6, #0x40
	mov r8, #0
	b _06016530
_060164BC:
	mov r0, r7
	bl sub_0600BA10
	mov sb, r0
	add r0, r7, #1
	bl sub_0600BA10
	cmp sb, #6
	bls _06016528
	ldr r1, [sl, #0x28]
	cmp r7, r1
	beq _06016528
	add r0, r0, #2
	mov sb, #0
	str r0, [sp]
	b _06016514
_060164F4:
	mov r0, r7
	bl sub_0600BA10
	mov r1, r0
	mov r0, fp
	bl sub_0600B9E4
	add fp, fp, #1
	add r7, r7, #1
	add sb, sb, #1
_06016514:
	ldr r0, [sp]
	cmp sb, r0
	blo _060164F4
	add r8, r8, #1
	b _06016530
_06016528:
	add r0, r0, #2
	add r7, r7, r0
_06016530:
	ldrh r0, [sl, #0x18]
	cmp r8, r0
	blo _060164BC
_0601653C:
	ldr r0, [sl, #0x1c]
	cmp r0, #0
	beq _06016590
	add r0, r0, #1
	bl sub_0600BA10
	strh r0, [r6, #0xa]
	mov r7, #0
	add r8, r6, #0xc
	b _06016580
_06016560:
	ldr r0, [sl, #0x1c]
	add r0, r0, #2
	add r0, r0, r7
	bl sub_0600BA10
	mov r1, r0
	add r0, r8, r7
	bl sub_0600B9E4
	add r7, r7, #1
_06016580:
	ldrh r0, [r6, #0xa]
	cmp r7, r0
	blo _06016560
	b _060165B8
_06016590:
	mov sb, #0
	strh sb, [r6, #0xa]
	add r8, r6, #0xc
	mov r7, sb
_060165A0:
	mov r1, r7
	add r0, r8, sb
	bl sub_0600B9E4
	add sb, sb, #1
	cmp sb, #0x20
	blo _060165A0
_060165B8:
	ldrh r0, [sl, #0x14]
	strh r0, [r6, #0x2e]
	ldrh r0, [sl, #0x16]
	strh r0, [r6, #0x30]
	ldrh r0, [sl, #0x12]
	strh r0, [r6, #0x36]
	ldr r0, [sl, #0x20]
	cmp r0, #0
	beq _060165E8
	add r0, r0, #3
	bl sub_0600BA10
	strh r0, [r6, #0x38]
_060165E8:
	ldr r0, [sl, #0x24]
	cmp r0, #0
	beq _06016600
	add r0, r0, #3
	bl sub_0600BA10
	strh r0, [r6, #0x34]
_06016600:
	ldrh r1, [r5, #2]
	ldrh r0, [r6]
	add r0, r1, r0
	strh r0, [r5, #2]
	ldrh r0, [r5, #8]
	add r0, r0, #1
	strh r0, [r5, #8]
	ldrh r1, [r4, #4]
	ldrh r0, [r6]
	sub r0, r1, r0
	strh r0, [r4, #4]
	ldrh r0, [r4, #4]
	cmp r0, #0x20
	bhs _06016660
	bl sub_0600B8A0
	mov r2, #0x15
	mov r0, #2
	mov r1, #0
	strh r2, [r4]
	bl sub_06008F04
	b _06016660
_06016654:
	ldr r1, _06016670 ; =0x060184E0
	add r0, r6, #4
	bl sub_0600A928
_06016660:
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0601666C: .word 0x0380FFF4
_06016670: .word 0x060184E0
	arm_func_end sub_060162A4

	arm_func_start sub_06016674
sub_06016674: ; 0x06016674
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r1, _06016C00 ; =0x0380FFF4
	mov sl, r0
	ldr r2, [r1]
	add r0, r2, #0x600
	ldrh r1, [r0, #0x90]
	add r0, r2, #4
	tst r1, #8
	add r4, r2, #0x344
	add sb, r0, #0x400
	beq _06016714
	ldr r1, _06016C04 ; =0x048080B0
	add r0, r2, #0x2c
	ldrh r2, [r1]
	add r1, r0, #0x400
	tst r2, #1
	ldrneh r0, [r1]
	cmpne r0, #0
	bne _06016714
	tst r2, #4
	ldrneh r0, [r1, #0x14]
	cmpne r0, #0
	bne _06016714
	tst r2, #8
	ldrneh r0, [r1, #0x28]
	cmpne r0, #0
	bne _06016714
	ldr r0, _06016C08 ; =0x0480819C
	ldrh r0, [r0]
	tst r0, #1
	bne _06016714
	ldr r2, _06016C0C ; =0x04808032
	mov r3, #0
	strh r3, [r2]
	mov r1, #0x8000
	ldr r0, _06016C00 ; =0x0380FFF4
	strh r1, [r2]
	ldr r0, [r0]
	add r0, r0, #0x400
	strh r3, [r0, #0xde]
_06016714:
	add r0, sl, #0x1e
	mov r1, #0xb0
	bl sub_06014D88
	cmp r0, #0
	bne _06016BF8
	ldrh r0, [sl, #0x2e]
	ldrh r8, [sl, #2]
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	cmp r8, #0
	mov r5, #0
	mov r6, r0, lsr #0x10
	moveq r7, #0x13
	moveq r5, #1
	beq _06016BBC
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	bne _060167C4
	mov r0, r8
	bl sub_0600E88C
	cmp r0, #0x20
	bls _06016788
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_0600E4F0
	add r0, sl, #0x1e
	mov r1, #1
	bl sub_06010970
_06016788:
	ldrh r0, [sl, #8]
	tst r0, #0x400
	beq _060167C4
	mov r0, r8
	bl sub_0600E90C
	cmp r0, #0
	beq _060167C4
	mov r5, #1
	mov r0, r8
	mov r1, #0
	strh r5, [sl, #0x2c]
	mov r7, #0xf
	mov r6, #4
	bl sub_0600E718
	b _06016BBC
_060167C4:
	ldrh r0, [sl, #0x2c]
	cmp r0, #0
	beq _060167DC
	cmp r0, #1
	beq _060168B8
	b _06016BAC
_060167DC:
	ldrh r1, [r4, #0xc]
	cmp r1, #1
	ldreq r0, _06016C00 ; =0x0380FFF4
	ldreq r0, [r0]
	addeq r0, r0, #0x300
	ldreqh r0, [r0, #0x32]
	cmpeq r0, #1
	moveq r7, #0xd
	moveq r5, #1
	beq _06016BBC
	cmp r1, #1
	bne _06016828
	ldrh r0, [sl, #0x2e]
	mov r5, #1
	cmp r0, #1
	moveq r7, #0
	movne r7, #0xe
	movne r6, #2
	b _06016BBC
_06016828:
	beq _06016BBC
	ldrh r0, [sl, #0x2e]
	cmp r0, #2
	ldreq r1, [sb, #0x18]
	ldreqh r0, [r1, #0x16]
	cmpeq r0, #0
	bne _06016BBC
	add r0, r1, #0x10
	add r1, sl, #0x1e
	bl sub_0600ACC4
	cmp r0, #0
	beq _06016BBC
	ldrh r0, [sb]
	cmp r0, #0x31
	bne _06016BBC
	bl sub_0600B8A0
	ldrh r0, [sl, #0x30]
	cmp r0, #0
	ldrne r0, [sb, #0x1c]
	movne r1, #0xc
	strneh r1, [r0, #4]
	ldrneh r1, [sl, #0x30]
	bne _06016898
	mov r0, #0x30
	bl sub_0600A884
	ldr r0, [sb, #0x1c]
	mov r1, #0
	strh r1, [r0, #4]
_06016898:
	ldr r0, [sb, #0x1c]
	mov r2, #0x35
	strh r1, [r0, #6]
	mov r0, #2
	mov r1, r0
	strh r2, [sb]
	bl sub_06008F04
	b _06016BBC
_060168B8:
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	bne _06016A58
	mov r0, r8, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_0600E4F0
	ldrh r0, [sl, #0x2e]
	cmp r0, #1
	bne _06016974
	add r0, sl, #0x1e
	mov r1, #0x80
	mov r2, #1
	bl sub_06014B90
	movs r4, r0
	beq _06016BBC
	ldrh r1, [sl, #0x2c]
	ldr r0, _06016C10 ; =0x04808044
	strh r1, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	mov r1, #0
	strh r1, [r4, #0x30]
	ldrh r1, [r0]
	ldrh r0, [r0]
	add r0, r1, r0, lsl #8
	mov r0, r0, lsl #0x10
	movs sb, r0, lsr #0x10
	moveq sb, #1
	mov r0, sb
	bl sub_0600BA60
	mov r0, r8
	mov r1, sb
	bl sub_0600E718
	add r0, r4, #0x33
	add sb, r4, #0x34
	bl sub_0600BA10
	mov fp, r0
	mov r8, #0
	b _06016960
_06016954:
	bl sub_0600BA78
	strh r0, [sb], #2
	add r8, r8, #2
_06016960:
	cmp r8, fp
	blo _06016954
	mov r0, r4
	bl sub_06013E10
	b _06016BBC
_06016974:
	cmp r0, #3
	mov r0, r8
	bne _06016A40
	bl sub_0600E88C
	cmp r0, #0x20
	bne _0601699C
	mov r0, r8
	bl sub_0600E90C
	cmp r0, #0
	bne _060169A8
_0601699C:
	mov r7, #1
	mov r5, r7
	b _06016BBC
_060169A8:
	ldrh r0, [sl, #2]
	bl sub_0600E90C
	bl sub_0600BA60
	add r0, sl, #0x33
	add r7, sl, #0x34
	bl sub_0600BA10
	mov r4, r0
	mov r5, #0
	b _060169E4
_060169CC:
	bl sub_0600BA78
	ldrh r1, [r7], #2
	cmp r1, r0
	movne r0, #0
	bne _06016A14
	add r5, r5, #1
_060169E4:
	cmp r5, r4, lsr #1
	blo _060169CC
	tst r4, #1
	beq _06016A10
	bl sub_0600BA78
	ldrh r1, [r7]
	and r0, r0, #0xff
	and r1, r1, #0xff
	cmp r1, r0
	movne r0, #0
	bne _06016A14
_06016A10:
	mov r0, #1
_06016A14:
	cmp r0, #0
	mov r0, r8
	mov r1, #0
	mov r5, #1
	bne _06016A34
	mov r7, #0xf
	bl sub_0600E718
	b _06016BBC
_06016A34:
	bl sub_0600E718
	mov r7, #0
	b _06016BBC
_06016A40:
	mov r1, #0
	bl sub_0600E718
	mov r7, #0xe
	mov r6, #2
	mov r5, #1
	b _06016BBC
_06016A58:
	ldr r1, [sb, #0x18]
	ldrh r0, [r1, #0x16]
	cmp r0, #1
	bne _06016BBC
	add r0, r1, #0x10
	add r1, sl, #0x1e
	bl sub_0600ACC4
	cmp r0, #0
	beq _06016BBC
	ldrh r0, [sl, #0x2e]
	cmp r0, #2
	bne _06016B48
	ldrh r0, [sb]
	cmp r0, #0x31
	bne _06016BBC
	ldrh r0, [sl, #0x30]
	cmp r0, #0
	beq _06016ADC
	bl sub_0600B8A0
	mov r0, #0x35
	strh r0, [sb]
	ldr r0, [sb, #0x1c]
	mov r1, #0xc
	strh r1, [r0, #4]
	mov r0, #2
	ldrh r3, [sl, #0x30]
	ldr r2, [sb, #0x1c]
	mov r1, r0
	strh r3, [r2, #6]
	bl sub_06008F04
	mov r0, #0x20
	bl sub_0600A884
	b _06016BBC
_06016ADC:
	mov r1, #0x33
	add r0, sl, #0x33
	strh r1, [sb]
	bl sub_0600BA10
	mov r1, r0
	add r0, sl, #0x1e
	mov r2, #1
	bl sub_06014B90
	movs r4, r0
	beq _06016BBC
	ldrh r1, [r4, #0x14]
	add r0, sl, #0x2c
	orr r1, r1, #0x4000
	strh r1, [r4, #0x14]
	ldrh r2, [sl, #6]
	add r1, r4, #0x2c
	add r2, r2, #1
	bl sub_06001B04
	ldrh r1, [sl, #0x2c]
	mov r0, #3
	strh r1, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	mov r1, #0
	mov r0, r4
	strh r1, [r4, #0x30]
	bl sub_06013E10
	b _06016BBC
_06016B48:
	cmp r0, #4
	ldreqh r0, [sb]
	cmpeq r0, #0x33
	bne _06016BBC
	bl sub_0600B8A0
	ldrh r0, [sl, #0x30]
	cmp r0, #0
	ldrne r0, [sb, #0x1c]
	movne r1, #0xc
	strneh r1, [r0, #4]
	ldrneh r1, [sl, #0x30]
	bne _06016B8C
	mov r0, #0x30
	bl sub_0600A884
	ldr r0, [sb, #0x1c]
	mov r1, #0
	strh r1, [r0, #4]
_06016B8C:
	ldr r0, [sb, #0x1c]
	mov r2, #0x35
	strh r1, [r0, #6]
	mov r0, #2
	mov r1, r0
	strh r2, [sb]
	bl sub_06008F04
	b _06016BBC
_06016BAC:
	ldrh r0, [r4, #0xc]
	cmp r0, #1
	moveq r7, #0xd
	moveq r5, #1
_06016BBC:
	cmp r5, #0
	beq _06016BF8
	cmp r7, #0
	movne r2, #1
	moveq r2, #0
	add r0, sl, #0x1e
	mov r1, #0
	bl sub_06014B90
	cmp r0, #0
	beq _06016BF8
	ldrh r1, [sl, #0x2c]
	strh r1, [r0, #0x2c]
	strh r6, [r0, #0x2e]
	strh r7, [r0, #0x30]
	bl sub_06013E10
_06016BF8:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06016C00: .word 0x0380FFF4
_06016C04: .word 0x048080B0
_06016C08: .word 0x0480819C
_06016C0C: .word 0x04808032
_06016C10: .word 0x04808044
	arm_func_end sub_06016674

	arm_func_start sub_06016C14
sub_06016C14: ; 0x06016C14
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _06016CC0 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	ldrh r5, [r4, #2]
	add r1, r0, #0x344
	ldrh r0, [r1, #0xc]
	cmp r0, #1
	beq _06016C48
	cmp r0, #2
	cmpne r0, #3
	beq _06016C80
	b _06016CB8
_06016C48:
	mov r0, r5
	bl sub_0600E88C
	cmp r0, #0x20
	bls _06016CB8
	mov r0, r5, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0x20
	bl sub_0600E4F0
	ldrh r1, [r4, #0x2c]
	add r0, r4, #0x1e
	bl sub_06010970
	mov r0, r5
	bl sub_06013AF4
	b _06016CB8
_06016C80:
	ldrh r0, [r1, #8]
	cmp r0, #0x20
	bls _06016CB8
	add r0, r4, #0x1e
	add r1, r1, #0x82
	bl sub_0600ACC4
	cmp r0, #0
	beq _06016CB8
	mov r0, #0x20
	bl sub_0600A884
	bl sub_0600A7E0
	ldrh r1, [r4, #0x2c]
	add r0, r4, #0x1e
	bl sub_06010970
_06016CB8:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_06016CC0: .word 0x0380FFF4
	arm_func_end sub_06016C14

	arm_func_start sub_06016CC4
sub_06016CC4: ; 0x06016CC4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r1, _06016FE4 ; =0x0380FFF4
	mov sb, r0
	ldr r0, [r1]
	ldr r5, [sb]
	add r4, r0, #0x344
	ldrh r0, [r4, #0x7a]
	ldr sl, _06016FE4 ; =0x0380FFF4
	strh r0, [sb, #0x12]
	ldrh r0, [sb, #0xc]
	tst r0, #0x800
	ldrneh r0, [sb, #0xa]
	orrne r0, r0, #1
	strneh r0, [sb, #0xa]
	ldrh r6, [sb, #8]
	b _06016F58
_06016D04:
	mov r0, r5
	bl sub_0600BA10
	mov r8, r0
	add r0, r5, #1
	add r5, r5, #2
	bl sub_0600BA10
	mov r7, r0
	cmp r8, #6
	addls pc, pc, r8, lsl #2
	b _06016D48
_06016D2C: ; jump table
	b _06016D54 ; case 0
	b _06016DC0 ; case 1
	b _06016F4C ; case 2
	b _06016E24 ; case 3
	b _06016E90 ; case 4
	b _06016E70 ; case 5
	b _06016F4C ; case 6
_06016D48:
	cmp r8, #0xdd
	beq _06016EB0
	b _06016F30
_06016D54:
	cmp r7, #0x20
	bhi _06016F4C
	ldrh r1, [sb, #0xc]
	sub r0, r5, #2
	orr r1, r1, #1
	strh r1, [sb, #0xc]
	str r0, [sb, #0x1c]
	cmp r7, #0
	bne _06016D90
	ldrh r0, [sb, #0xc]
	tst r0, #0x800
	ldrneh r0, [sb, #0xa]
	orrne r0, r0, #1
	strneh r0, [sb, #0xa]
	bne _06016F4C
_06016D90:
	ldrh r1, [sb, #0xa]
	mov r0, r7, lsl #0x10
	bic r2, r1, #1
	strh r2, [sb, #0xa]
	mov r1, r5
	mov r0, r0, lsr #0x10
	bl sub_0600ABF4
	cmp r0, #0
	ldrneh r0, [sb, #0xa]
	orrne r0, r0, #1
	strneh r0, [sb, #0xa]
	b _06016F4C
_06016DC0:
	cmp r7, #1
	blo _06016F4C
	ldrh r1, [sb, #0xc]
	sub r0, r5, #2
	orr r1, r1, #4
	strh r1, [sb, #0xc]
	add r1, sb, #0x14
	bl sub_0600AD14
	ldrh r0, [r4, #0x60]
	ldrh r1, [r4, #0x62]
	ldrh r2, [sb, #0x14]
	orr r1, r0, r1
	mvn r1, r1
	tst r2, r1
	ldreqh r1, [sb, #0x16]
	orreq r1, r2, r1
	andeq r1, r0, r1
	cmpeq r0, r1
	ldreqh r0, [sb, #0xa]
	orreq r0, r0, #4
	streqh r0, [sb, #0xa]
	ldrneh r0, [sb, #0xa]
	bicne r0, r0, #4
	strneh r0, [sb, #0xa]
	b _06016F4C
_06016E24:
	cmp r7, #1
	blo _06016F4C
	ldrh r1, [sb, #0xc]
	mov r0, r5
	orr r1, r1, #2
	strh r1, [sb, #0xc]
	bl sub_0600BA10
	strh r0, [sb, #0x12]
	ldr r0, [sl]
	ldrh r1, [sb, #0x12]
	ldr r0, [r0, #0x41c]
	ldrh r0, [r0, #0x4a]
	cmp r1, r0
	ldrh r0, [sb, #0xa]
	orreq r0, r0, #2
	streqh r0, [sb, #0xa]
	bicne r0, r0, #2
	strneh r0, [sb, #0xa]
	b _06016F4C
_06016E70:
	cmp r7, #3
	blo _06016F4C
	ldrh r1, [sb, #0xc]
	sub r0, r5, #2
	orr r1, r1, #0x100
	strh r1, [sb, #0xc]
	str r0, [sb, #0x24]
	b _06016F4C
_06016E90:
	cmp r7, #6
	blo _06016F4C
	ldrh r1, [sb, #0xc]
	sub r0, r5, #2
	orr r1, r1, #0x200
	strh r1, [sb, #0xc]
	str r0, [sb, #0x20]
	b _06016F4C
_06016EB0:
	cmp r7, #8
	blo _06016EF8
	mov r0, r5
	bl sub_0600BA10
	cmp r0, #0
	bne _06016EF8
	add r0, r5, #1
	bl sub_0600BA10
	cmp r0, #9
	bne _06016EF8
	add r0, r5, #2
	bl sub_0600BA10
	cmp r0, #0xbf
	bne _06016EF8
	add r0, r5, #3
	bl sub_0600BA10
	cmp r0, #0
	beq _06016F18
_06016EF8:
	ldrh r1, [sb, #0x18]
	add r0, r7, #2
	add r1, r1, #1
	strh r1, [sb, #0x18]
	ldrh r1, [sb, #0x1a]
	add r0, r1, r0
	strh r0, [sb, #0x1a]
	b _06016F4C
_06016F18:
	ldrh r1, [sb, #0xc]
	sub r0, r5, #2
	orr r1, r1, #0x400
	strh r1, [sb, #0xc]
	str r0, [sb, #0x28]
	b _06016F4C
_06016F30:
	ldrh r1, [sb, #0x18]
	add r0, r7, #2
	add r1, r1, #1
	strh r1, [sb, #0x18]
	ldrh r1, [sb, #0x1a]
	add r0, r1, r0
	strh r0, [sb, #0x1a]
_06016F4C:
	add r0, r7, #2
	add r5, r5, r7
	sub r6, r6, r0
_06016F58:
	cmp r6, #0
	bgt _06016D04
	ldrh r0, [sb, #0xc]
	tst r0, #8
	beq _06016F90
	ldrh r0, [r4, #0x64]
	tst r0, #1
	bne _06016F84
	ldrh r0, [sb, #4]
	tst r0, #0x8000
	beq _06016F90
_06016F84:
	ldrh r0, [sb, #0xa]
	orr r0, r0, #8
	strh r0, [sb, #0xa]
_06016F90:
	ldrh r0, [sb, #0xc]
	tst r0, #0x30
	beq _06016FDC
	ldrh r1, [sb, #6]
	ldrh r0, [r4, #0x7c]
	and r1, r1, #3
	and r0, r0, #3
	cmp r1, r0
	ldreqh r0, [sb, #0xa]
	orreq r0, r0, #0x10
	streqh r0, [sb, #0xa]
	ldrh r1, [sb, #6]
	ldrh r0, [r4, #0x7c]
	and r1, r1, #0x10
	and r0, r0, #0x10
	cmp r1, r0
	ldreqh r0, [sb, #0xa]
	orreq r0, r0, #0x20
	streqh r0, [sb, #0xa]
_06016FDC:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_06016FE4: .word 0x0380FFF4
	arm_func_end sub_06016CC4

	arm_func_start sub_06016FE8
sub_06016FE8: ; 0x06016FE8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	ldr r0, _06017690 ; =0x0380FFF4
	mvn r1, #0
	ldr r4, [r0]
	add sl, r4, #0x17c
	ldr r6, [sl, #0x60]
	add r0, r4, #0x300
	ldrh r5, [r0, #0x50]
	cmp r6, r1
	beq _06017684
	ldrh r0, [r6, #0x28]
	tst r0, #1
	ldrne r0, [r4, #0x568]
	addne r0, r0, #1
	strne r0, [r4, #0x568]
	ldreq r0, [r4, #0x564]
	addeq r0, r0, #1
	streq r0, [r4, #0x564]
	ldrh r0, [r6, #0x18]
	ldr r2, [r4, #0x560]
	and r1, r0, #0xf0
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	mov r0, r0, asr #4
	sub r0, r0, #1
	add r0, r2, r0
	str r0, [r4, #0x560]
	ldrh r1, [r6, #0x24]
	add r0, r6, #0x2e
	mov r2, r1, lsl #0x1c
	mov r1, r1, lsl #0x18
	mov r8, r2, lsr #0x1e
	mov sb, r1, lsr #0x1c
	bl sub_0600E254
	mov r7, r0
	strh r7, [r6, #0x12]
	cmp r7, #0xff
	bne _060170D8
	mov r0, #0
	strh r0, [r6, #0x12]
	cmp r5, #1
	bne _06017660
	cmp r8, #0
	bne _06017660
	cmp sb, #0
	beq _060170CC
	cmp sb, #4
	beq _060170C0
	cmp sb, #0xb
	bne _06017660
	add r0, r6, #0x10
	bl sub_06016674
	b _06017660
_060170C0:
	add r0, r6, #0x10
	bl sub_060161F0
	b _06017660
_060170CC:
	add r0, r6, #0x10
	bl sub_06016020
	b _06017660
_060170D8:
	bl sub_0600E738
	ldrh r1, [r6, #0x22]
	mov r0, r7, lsl #0x10
	and r1, r1, #0xff
	mov r0, r0, lsr #0x10
	bl sub_0600E5D8
	cmp r8, #0
	bne _06017124
	ldrh fp, [r6, #0x3a]
	mov r0, r7
	bl sub_0600E92C
	cmp fp, r0
	ldreq r0, [r4, #0x578]
	addeq r0, r0, #1
	streq r0, [r4, #0x578]
	beq _06017660
	mov r0, r7
	mov r1, fp
	bl sub_0600E6F8
_06017124:
	cmp r5, #1
	beq _0601713C
	cmp r5, #2
	cmpne r5, #3
	beq _060173DC
	b _06017660
_0601713C:
	ldrh r1, [r6, #0x24]
	mov r0, r7, lsl #0x10
	mov r1, r1, lsl #0x13
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x1f
	bl sub_0600E5F8
	cmp r8, #0
	bne _06017378
	cmp sb, #0xc
	addls pc, pc, sb, lsl #2
	b _06017660
_06017168: ; jump table
	b _060171A8 ; case 0
	b _06017660 ; case 1
	b _060171B4 ; case 2
	b _06017660 ; case 3
	b _06017338 ; case 4
	b _06017344 ; case 5
	b _06017660 ; case 6
	b _06017660 ; case 7
	b _0601719C ; case 8
	b _06017660 ; case 9
	b _06017354 ; case 10
	b _06017360 ; case 11
	b _0601736C ; case 12
_0601719C:
	add r0, r6, #0x10
	bl sub_060158F4
	b _06017660
_060171A8:
	add r0, r6, #0x10
	bl sub_06016020
	b _06017660
_060171B4:
	ldr r0, _06017690 ; =0x0380FFF4
	ldrh r4, [r6, #0x16]
	ldr r5, [r0]
	cmp r4, #0xa
	bls _06017660
	add r0, r5, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #1
	bne _06017660
	add r0, r6, #0x2e
	mov r1, #0x30
	bl sub_06014D88
	cmp r0, #0
	bne _06017660
	ldrh r7, [r6, #0x12]
	mov r0, r7
	bl sub_0600E88C
	cmp r0, #0x30
	bhs _06017234
	add r0, r6, #0x2e
	mov r1, #0xc0
	bl sub_06014D88
	cmp r0, #0
	bne _06017660
	add r0, r6, #0x2e
	mov r1, #6
	mov r2, #1
	bl sub_06014C50
	cmp r0, #0
	beq _06017660
	bl sub_06013E10
	b _06017660
_06017234:
	mov r0, r7
	bl sub_0600E88C
	cmp r0, #0x40
	mov r0, r7
	bne _06017260
	mov r1, #0x30
	bl sub_0600E4F0
	add r0, r6, #0x2e
	mov r1, #1
	bl sub_06010BD0
	b _0601726C
_06017260:
	bl sub_0600E978
	cmp r0, #0
	bne _06017660
_0601726C:
	add r1, sp, #0
	mov r0, #0
	mov r2, #0x2c
	bl sub_0600A9F4
	add r3, r6, #0x46
	sub r2, r4, #0xa
	mov r1, #0x800
	str r3, [sp]
	strh r2, [sp, #8]
	strh r1, [sp, #0xc]
	add r0, sp, #0
	bl sub_06016CC4
	ldrh r1, [r6, #0x3c]
	ldr r0, _06017694 ; =0x0000FFC2
	tst r1, r0
	bne _060172E0
	add r0, r5, #0x300
	ldrh r2, [r0, #0x34]
	cmp r2, #0
	moveq r0, r1, lsl #0x1b
	moveq r0, r0, lsr #0x1f
	cmpeq r0, #1
	beq _060172E0
	cmp r2, #0
	beq _060172E8
	ldrh r0, [r6, #0x3c]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	bne _060172E8
_060172E0:
	mov r1, #0xa
	b _0601731C
_060172E8:
	mov r0, r7
	bl sub_0600E6B8
	ldrh r0, [sp, #0xa]
	tst r0, #1
	moveq r1, #1
	beq _0601731C
	tst r0, #4
	moveq r1, #0x12
	beq _0601731C
	ldrh r1, [sp, #0x16]
	mov r0, r7
	bl sub_0600E6D8
	mov r1, #0
_0601731C:
	ldr r2, [sp, #0x1c]
	mov r0, r7
	bl sub_06014784
	cmp r0, #0
	beq _06017660
	bl sub_06013E10
	b _06017660
_06017338:
	add r0, r6, #0x10
	bl sub_060161F0
	b _06017660
_06017344:
	add r0, r6, #0x10
	mov r1, #0
	bl sub_060162A4
	b _06017660
_06017354:
	add r0, r6, #0x10
	bl sub_06015F40
	b _06017660
_06017360:
	add r0, r6, #0x10
	bl sub_06016674
	b _06017660
_0601736C:
	add r0, r6, #0x10
	bl sub_06016C14
	b _06017660
_06017378:
	cmp r8, #1
	bne _06017660
	cmp sb, #0xa
	bne _06017660
	ldr r0, _06017690 ; =0x0380FFF4
	ldrh r4, [r6, #0x12]
	ldr r1, [r0]
	mov r0, r4
	add r5, r1, #0x17c
	bl sub_0600E88C
	cmp r0, #0x40
	bne _06017660
	mov r0, r4
	bl sub_0600E694
	ldrh r0, [r5, #0x2c]
	cmp r0, #0
	beq _060173C4
	mov r0, #1
	bl sub_06012C88
_060173C4:
	ldrh r0, [r5, #0x20]
	cmp r0, #0
	beq _06017660
	mov r0, #0
	bl sub_06012C88
	b _06017660
_060173DC:
	cmp r8, #0
	bne _06017660
	cmp sb, #0xc
	addls pc, pc, sb, lsl #2
	b _06017660
_060173F0: ; jump table
	b _06017660 ; case 0
	b _06017430 ; case 1
	b _06017660 ; case 2
	b _0601752C ; case 3
	b _06017660 ; case 4
	b _06017630 ; case 5
	b _06017660 ; case 6
	b _06017660 ; case 7
	b _06017424 ; case 8
	b _06017660 ; case 9
	b _06017640 ; case 10
	b _0601764C ; case 11
	b _06017658 ; case 12
_06017424:
	add r0, r6, #0x10
	bl sub_060158F4
	b _06017660
_06017430:
	ldr r0, _06017690 ; =0x0380FFF4
	ldr r0, [r0]
	add r5, r0, #0x344
	ldrh r1, [r5, #0xc]
	add r0, r0, #4
	cmp r1, #2
	add r4, r0, #0x400
	cmpne r1, #3
	bne _06017660
	ldrh r0, [r4]
	cmp r0, #0x51
	bne _06017660
	ldr r0, [r4, #0x18]
	add r1, r6, #0x2e
	add r0, r0, #0x10
	bl sub_0600ACC4
	cmp r0, #0
	beq _06017660
	bl sub_0600B8A0
	ldrh r0, [r6, #0x3e]
	cmp r0, #0
	bne _060174CC
	ldrh r1, [r6, #0x40]
	ldr r0, _06017698 ; =0x00000FFF
	and r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0600A7A4
	ldrh r0, [r5, #0x6a]
	bl sub_06014CE4
	add r0, r5, #0x82
	add r1, r6, #0x2e
	bl sub_0600A928
	add r0, r6, #0x2e
	bl sub_0600E1AC
	strh r0, [r5, #0x88]
	ldrh r0, [r5, #0x88]
	mov r1, #0x40
	bl sub_0600E4F0
_060174CC:
	ldrh r0, [r6, #0x3e]
	cmp r0, #0
	ldr r0, [r4, #0x1c]
	movne r1, #0xc
	strneh r1, [r0, #4]
	ldrneh r1, [r6, #0x3e]
	ldrne r0, [r4, #0x1c]
	strneh r1, [r0, #6]
	bne _06017508
	mov r2, #0
	strh r2, [r0, #4]
	ldr r1, [r4, #0x1c]
	mov r0, #0x40
	strh r2, [r1, #6]
	bl sub_0600A884
_06017508:
	ldrh r1, [r5, #0x6a]
	ldr r0, [r4, #0x1c]
	mov r2, #0x53
	strh r1, [r0, #8]
	mov r0, #2
	mov r1, #3
	strh r2, [r4]
	bl sub_06008F04
	b _06017660
_0601752C:
	ldr r0, _06017690 ; =0x0380FFF4
	ldr r0, [r0]
	add r5, r0, #0x344
	ldrh r1, [r5, #0xc]
	add r0, r0, #4
	cmp r1, #2
	add r4, r0, #0x400
	cmpne r1, #3
	bne _06017660
	ldrh r0, [r4]
	cmp r0, #0x61
	bne _06017660
	ldr r0, [r4, #0x18]
	add r1, r6, #0x2e
	add r0, r0, #0x10
	bl sub_0600ACC4
	cmp r0, #0
	beq _06017660
	bl sub_0600B8A0
	ldrh r0, [r6, #0x3e]
	cmp r0, #0
	bne _060175D0
	ldrh r1, [r6, #0x40]
	ldr r0, _06017698 ; =0x00000FFF
	and r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_0600A7A4
	ldrh r0, [r5, #0x6a]
	bl sub_06014CE4
	add r0, r5, #0x82
	add r1, r6, #0x2e
	bl sub_0600A928
	add r0, r6, #0x2e
	bl sub_0600E1AC
	strh r0, [r5, #0x88]
	ldrh r0, [r5, #0x88]
	mov r1, #0x40
	bl sub_0600E4F0
	mov r0, #0x40
	bl sub_0600A884
_060175D0:
	ldrh r0, [r6, #0x3e]
	cmp r0, #0
	ldr r0, [r4, #0x1c]
	movne r1, #0xc
	strneh r1, [r0, #4]
	ldrneh r1, [r6, #0x3e]
	ldrne r0, [r4, #0x1c]
	strneh r1, [r0, #6]
	bne _0601760C
	mov r2, #0
	strh r2, [r0, #4]
	ldr r1, [r4, #0x1c]
	mov r0, #0x40
	strh r2, [r1, #6]
	bl sub_0600A884
_0601760C:
	ldrh r1, [r5, #0x6a]
	ldr r0, [r4, #0x1c]
	mov r2, #0x63
	strh r1, [r0, #8]
	mov r0, #2
	mov r1, #4
	strh r2, [r4]
	bl sub_06008F04
	b _06017660
_06017630:
	add r0, r6, #0x10
	mov r1, #0
	bl sub_060162A4
	b _06017660
_06017640:
	add r0, r6, #0x10
	bl sub_06015F40
	b _06017660
_0601764C:
	add r0, r6, #0x10
	bl sub_06016674
	b _06017660
_06017658:
	add r0, r6, #0x10
	bl sub_06016C14
_06017660:
	mov r1, r6
	add r0, sl, #0x60
	bl sub_06009144
	ldrh r0, [sl, #0x68]
	cmp r0, #0
	beq _06017684
	mov r0, #1
	mov r1, #7
	bl sub_06008F04
_06017684:
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06017690: .word 0x0380FFF4
_06017694: .word 0x0000FFC2
_06017698: .word 0x00000FFF
	arm_func_end sub_06016FE8

	arm_func_start sub_0601769C
sub_0601769C: ; 0x0601769C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r0, _06017BB4 ; =0x0380FFF4
	mvn r1, #0
	ldr r2, [r0]
	add r0, r2, #0x17c
	ldr r5, [r0, #0x6c]
	str r0, [sp, #4]
	cmp r5, r1
	beq _06017BA8
	add r0, r2, #0x300
	ldrh r0, [r0, #0x4c]
	cmp r0, #0x40
	bne _06017B7C
	ldrh r1, [r5, #0x20]
	ldr r0, _06017BB8 ; =0x000005FC
	cmp r1, r0
	bhi _06017B7C
	ldrh r4, [r5, #0x24]
	add r0, sp, #8
	tst r4, #0x100
	beq _06017714
	add r1, r5, #0x34
	bl sub_0600A928
	tst r4, #0x200
	bne _06017B7C
	add r0, sp, #0xe
	add r1, r5, #0x2e
	bl sub_0600A928
	b _0601773C
_06017714:
	add r1, r5, #0x28
	bl sub_0600A928
	tst r4, #0x200
	add r0, sp, #0xe
	beq _06017734
	add r1, r5, #0x34
	bl sub_0600A928
	b _0601773C
_06017734:
	add r1, r5, #0x2e
	bl sub_0600A928
_0601773C:
	ldrh r0, [r5, #0x3a]
	tst r4, #0x400
	strh r0, [sp, #0x14]
	beq _06017974
	ldrh r0, [r5, #0x3a]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1c
	bne _06017974
	ldr r0, _06017BB4 ; =0x0380FFF4
	mvn r6, #0
	ldr r0, [r0]
	mov r7, #0
	add r0, r0, #0xe4
	add r8, r0, #0x400
	add fp, sp, #8
	mov r4, #0x18
	b _06017884
_06017780:
	mul sb, r7, r4
	ldrh r0, [r8, sb]
	add sl, r8, sb
	cmp r0, #0
	beq _0601787C
	mov r1, fp
	add r0, sl, #4
	bl sub_0600ACC4
	cmp r0, #0
	beq _06017880
	add r1, sp, #0xe
	add r0, sl, #0xa
	bl sub_0600ACC4
	cmp r0, #0
	beq _06017880
	ldrh r0, [sp, #0x14]
	ldrh r1, [sl, #0x10]
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x14
	mov r0, r1, lsl #0x10
	cmp r2, r0, lsr #20
	bne _06017880
	ldrh r0, [r5, #0x18]
	mov r1, r1, lsl #0x1c
	and r2, r0, #0xf0
	mov r0, r2, asr #3
	add r0, r2, r0, lsr #28
	mov r7, r0, asr #4
	subs r0, r7, r1, lsr #28
	beq _06017B7C
	tst r0, #-0x80000000
	bne _06017B7C
	mov r0, sl
	ldr r4, [r0, #0x14]
	ldrh r0, [r5, #0x20]
	ldrh r3, [r4, #0x20]
	sub r0, r0, r3
	subs r6, r0, #0x18
	beq _06017B7C
	tst r6, #-0x80000000
	bne _06017B7C
	add r0, r5, #0x3c
	add r1, r4, #0x3c
	mov r2, r6
	add r0, r0, r3
	add r1, r1, r3
	bl sub_06001B04
	ldrh r1, [r4, #0x20]
	mov r0, r7, lsl #0x10
	add r1, r1, r6
	strh r1, [r4, #0x20]
	ldrh r1, [sl, #0x10]
	mov r0, r0, lsr #0x10
	bic r1, r1, #0xf
	and r0, r0, #0xf
	orr r1, r1, r0
	ldr r0, _06017BB4 ; =0x0380FFF4
	strh r1, [sl, #0x10]
	ldr r1, [r0]
	ldr r0, [r1, #0x560]
	add r0, r0, r7
	str r0, [r1, #0x560]
	b _06017B7C
_0601787C:
	mov r6, r7
_06017880:
	add r7, r7, #1
_06017884:
	cmp r7, #3
	blo _06017780
	mvn r0, #0
	cmp r6, r0
	beq _06017B7C
	ldr r0, _06017BB4 ; =0x0380FFF4
	ldr r1, _06017BBC ; =0x00000622
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_060090A8
	movs r4, r0
	beq _06017968
	mov r0, #0x18
	mul r7, r6, r0
	add r6, r8, r7
	add r0, sp, #8
	add r1, r6, #4
	mov r2, #0x10
	bl sub_06001B04
	mov r0, #5
	strh r0, [r8, r7]
	mov r0, r6
	str r4, [r0, #0x14]
	ldrh r2, [r5, #0x20]
	add r0, r5, #0x18
	add r1, r4, #0x18
	add r2, r2, #0xc
	bl sub_06001B04
	ldr r0, _06017BB4 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x30c]
	bl sub_06017BC4
	ldrh r1, [r4, #0x18]
	ldrh r0, [r6, #0x10]
	and r1, r1, #0xf0
	bic r3, r0, #0xf
	mov r0, r1, asr #3
	add r0, r1, r0, lsr #28
	mov r1, r0, asr #4
	mov r2, r1, lsl #0x10
	mov r2, r2, lsr #0x10
	and r2, r2, #0xf
	orr r2, r3, r2
	strh r2, [r6, #0x10]
	ldr r2, _06017BB4 ; =0x0380FFF4
	ldr r3, [r2]
	ldr r2, [r3, #0x560]
	add r0, r2, r0, asr #4
	str r0, [r3, #0x560]
	ldrh r0, [r5, #0x20]
	sub r0, r0, #0x18
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x20]
	bl sub_06003ECC
	mov r1, r6
	strh r0, [r1, #2]
	b _06017B7C
_06017968:
	mov r0, #4
	bl sub_0600BD2C
	b _06017B7C
_06017974:
	ldr r1, _06017BB4 ; =0x0380FFF4
	ldrh r0, [r5, #0x20]
	ldr r4, [r1]
	sub r1, r0, #0x18
	add r0, r4, #0xe4
	strh r1, [r5, #0x20]
	add r8, r0, #0x400
	mov r7, #0
	b _06017A30
_06017998:
	mov r0, #0x18
	mul sb, r7, r0
	ldrh r0, [r8, sb]
	add sl, r8, sb
	cmp r0, #0
	beq _06017A2C
	add r1, sp, #8
	add r0, sl, #4
	bl sub_0600ACC4
	cmp r0, #0
	beq _06017A2C
	add r1, sp, #0xe
	add r0, sl, #0xa
	bl sub_0600ACC4
	cmp r0, #0
	beq _06017A2C
	ldrh r2, [sp, #0x14]
	ldrh r0, [sl, #0x10]
	mov r1, r2, lsl #0x10
	mov r1, r1, lsr #0x14
	mov r0, r0, lsl #0x10
	cmp r1, r0, lsr #20
	bne _06017A2C
	mov r1, sl
	ldrh r0, [r1, #0x10]
	sub fp, r0, r2
	tst fp, #-0x80000000
	bne _06017B7C
	ldrh r0, [r1, #2]
	ldrh r1, [r5, #0x20]
	mul r0, fp, r0
	str r0, [sp]
	subs r6, r1, r0
	beq _06017B7C
	tst r6, #-0x80000000
	beq _06017A38
	b _06017B7C
_06017A2C:
	add r7, r7, #1
_06017A30:
	cmp r7, #3
	blo _06017998
_06017A38:
	cmp r7, #3
	beq _06017B7C
	mov r0, #0x18
	mul sb, r7, r0
	add r0, r8, sb
	ldr r1, [r0, #0x14]
	ldr r0, _06017BC0 ; =0x000005E4
	add r7, r1, #0x10
	ldrh r1, [r7, #0x10]
	add sl, r1, r6
	cmp sl, r0
	bls _06017A80
	add r0, r4, #0x188
	sub r1, r7, #0x10
	bl sub_06009144
	mov r0, #0
	strh r0, [r8, sb]
	b _06017B7C
_06017A80:
	ldr r0, [sp]
	add r3, r5, #0x3c
	add r2, r7, #0x2c
	add r1, r2, r1
	add r0, r3, r0
	add r2, r6, #1
	bl sub_06001B04
	strh sl, [r7, #0x10]
	ldrh r1, [r5, #0x18]
	add r0, r8, sb
	ldrh r6, [r0, #0x10]
	and r2, r1, #0xf0
	mov r1, r2, asr #3
	add r1, r2, r1, lsr #28
	mov r3, r6, lsl #0x1c
	rsb r2, fp, r1, asr #4
	add r2, r2, r3, lsr #28
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	bic r3, r6, #0xf
	and r2, r2, #0xf
	orr r3, r3, r2
	ldr r2, _06017BB4 ; =0x0380FFF4
	strh r3, [r0, #0x10]
	ldr r3, [r2]
	ldr r2, [r3, #0x560]
	add r1, r2, r1, asr #4
	str r1, [r3, #0x560]
	ldrh r1, [r5, #0x18]
	tst r1, #0x100
	bne _06017B7C
	mov r1, #0
	strh r1, [r0]
	ldrh r0, [r7, #8]
	bic r0, r0, #0xf0
	add r0, r0, #0x10
	strh r0, [r7, #8]
	ldrh r0, [r7, #0x10]
	add r0, r0, #0x18
	strh r0, [r7, #0x10]
	ldrh r0, [r7, #8]
	ands r0, r0, #0xf
	beq _06017B54
	cmp r0, #8
	add r0, r4, #0x188
	bne _06017B74
	add r1, r4, #0x1c4
	sub r2, r7, #0x10
	bl sub_060091C4
	mov r0, #2
	mov r1, #6
	bl sub_06008F04
	b _06017B7C
_06017B54:
	add r0, r4, #0x188
	add r1, r4, #0x1dc
	sub r2, r7, #0x10
	bl sub_060091C4
	mov r0, #1
	mov r1, #7
	bl sub_06008F04
	b _06017B7C
_06017B74:
	sub r1, r7, #0x10
	bl sub_06009144
_06017B7C:
	ldr r0, [sp, #4]
	mov r1, r5
	add r0, r0, #0x6c
	bl sub_06009144
	ldr r0, [sp, #4]
	ldrh r0, [r0, #0x74]
	cmp r0, #0
	beq _06017BA8
	mov r0, #2
	mov r1, #9
	bl sub_06008F04
_06017BA8:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06017BB4: .word 0x0380FFF4
_06017BB8: .word 0x000005FC
_06017BBC: .word 0x00000622
_06017BC0: .word 0x000005E4
	arm_func_end sub_0601769C

	arm_func_start sub_06017BC4
sub_06017BC4: ; 0x06017BC4
	ldr pc, _06017BC8 ; =MI_WaitDma
	.align 2, 0
_06017BC8: .word MI_WaitDma
	arm_func_end sub_06017BC4

	arm_func_start sub_06017BCC
sub_06017BCC: ; 0x06017BCC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _06017C34 ; =0x0380FFF4
	mov r6, #0
	ldr r0, [r4]
	mov r7, #0x18
	add r0, r0, #0xe4
	add r5, r0, #0x400
_06017BE8:
	mul r1, r6, r7
	ldrh r0, [r5, r1]
	add r1, r5, r1
	cmp r0, #0
	beq _06017C20
	sub r0, r0, #1
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r0, #0
	bne _06017C20
	ldr r0, [r4]
	ldr r1, [r1, #0x14]
	add r0, r0, #0x188
	bl sub_06009144
_06017C20:
	add r6, r6, #1
	cmp r6, #3
	blo _06017BE8
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_06017C34: .word 0x0380FFF4
	arm_func_end sub_06017BCC

	arm_func_start sub_06017C38
sub_06017C38: ; 0x06017C38
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _06017D30 ; =0x0380FFF4
	mov r0, #0
	ldr r3, [r1]
	mov r2, #0x50
	add r1, r3, #0xdc
	add r5, r1, #0x400
	mov r1, r5
	add r4, r3, #0x344
	bl sub_0600A9F4
	ldr r1, _06017D34 ; =0x04808030
	mov r2, #0x8000
	ldr r0, _06017D30 ; =0x0380FFF4
	strh r2, [r1]
	ldr r0, [r0]
	add r0, r0, #0x300
	ldrh r0, [r0, #0x50]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _06017CB4
_06017C88: ; jump table
	b _06017C98 ; case 0
	b _06017CA0 ; case 1
	b _06017CA8 ; case 2
	b _06017CB0 ; case 3
_06017C98:
	ldr r6, _06017D38 ; =0x00000794
	b _06017CB4
_06017CA0:
	ldr r6, _06017D3C ; =0x000010C4
	b _06017CB4
_06017CA8:
	ldr r6, _06017D40 ; =0x00000BFC
	b _06017CB4
_06017CB0:
	ldr r6, _06017D38 ; =0x00000794
_06017CB4:
	ldr r3, _06017D44 ; =0x04808050
	add r0, r6, #0x4000
	ldr r1, _06017D48 ; =0x00005F60
	add r2, r0, #0x4800000
	mov r0, r6, lsl #0xf
	strh r2, [r3]
	mov r0, r0, lsr #0x10
	strh r0, [r3, #6]
	strh r1, [r3, #2]
	strh r0, [r3, #0xa]
	ldr r2, _06017D4C ; =0x0000FFFF
	strh r0, [r5, #4]
	sub r0, r1, #0x4000
	strh r2, [r5]
	sub r0, r0, r6
	strh r0, [r4, #0x9a]
	sub r0, r1, #2
	strh r0, [r3, #0x12]
	rsb r0, r2, #0x18000
	strh r0, [r3, #-0x20]
	add r0, r3, #0x1fc
	ldr r1, _06017D50 ; =0x0480824E
	strh r2, [r0]
	ldr r0, _06017D54 ; =0x04805F70
	strh r2, [r1]
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #0xe]
	strh r2, [r0, #6]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_06017D30: .word 0x0380FFF4
_06017D34: .word 0x04808030
_06017D38: .word 0x00000794
_06017D3C: .word 0x000010C4
_06017D40: .word 0x00000BFC
_06017D44: .word 0x04808050
_06017D48: .word 0x00005F60
_06017D4C: .word 0x0000FFFF
_06017D50: .word 0x0480824E
_06017D54: .word 0x04805F70
	arm_func_end sub_06017C38

	arm_func_start sub_06017D58
sub_06017D58: ; 0x06017D58
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r3, _06017E98 ; =0x0380FFF4
	mov sb, r2
	ldr r2, [r3]
	mov fp, r0
	add r0, sb, #1
	mov sl, r1
	add r4, r2, #0x23c
	bl sub_0600BA10
	cmp r0, #0x20
	bhi _06017E90
	mov r6, #4
	mov r7, r6
	mov r8, #0x400
	mov r5, #0
	b _06017DD8
_06017D98:
	ldrh r0, [r4]
	cmp r0, #0
	beq _06017DCC
	add r0, r4, #6
	add r1, sl, #0x24
	bl sub_0600ACC4
	cmp r0, #0
	bne _06017DF8
	ldrh r0, [r4, #0x30]
	cmp r0, r8
	movlo r8, r0
	movlo r7, r5
	b _06017DD0
_06017DCC:
	mov r6, r5
_06017DD0:
	add r5, r5, #1
	add r4, r4, #0x32
_06017DD8:
	cmp r5, #4
	blo _06017D98
	cmp r6, #4
	movne r5, r6
	bne _06017DF8
	cmp r7, #4
	movne r5, r7
	beq _06017E90
_06017DF8:
	ldr r0, _06017E98 ; =0x0380FFF4
	mov r2, #0x32
	mul r4, r5, r2
	ldr r0, [r0]
	add r5, r0, #0x23c
	add r6, r5, r4
	mov r1, r6
	mov r0, #0
	bl sub_06000598
	mov r0, #0x400
	strh r0, [r6, #0x30]
	ldrh r1, [sl, #0x12]
	add r0, r6, #6
	and r1, r1, #0xff
	strh r1, [r5, r4]
	strh fp, [r6, #2]
	add r1, sl, #0x24
	bl sub_0600A928
	add r0, sb, #1
	bl sub_0600BA10
	strh r0, [r6, #0xc]
	mov r7, #0
	add r5, sb, #2
	add r4, r6, #0xe
	b _06017E74
_06017E5C:
	add r0, r5, r7
	bl sub_0600BA10
	mov r1, r0
	add r0, r4, r7
	bl sub_0600B9E4
	add r7, r7, #1
_06017E74:
	ldrh r0, [r6, #0xc]
	cmp r7, r0
	blo _06017E5C
	ldrh r0, [sl, #0x34]
	strh r0, [r6, #0x2e]
	ldrh r0, [sl, #0x36]
	strh r0, [r6, #4]
_06017E90:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_06017E98: .word 0x0380FFF4
	arm_func_end sub_06017D58

	arm_func_start sub_06017E9C
sub_06017E9C: ; 0x06017E9C
	ldr r1, _06017EB8 ; =0x0380FFF4
	ldr ip, _06017EBC ; =MIi_CpuClear16
	ldr r1, [r1]
	mov r0, #0
	mov r2, #0xc8
	add r1, r1, #0x23c
	bx ip
	.align 2, 0
_06017EB8: .word 0x0380FFF4
_06017EBC: .word MIi_CpuClear16
	arm_func_end sub_06017E9C

	arm_func_start sub_06017EC0
sub_06017EC0: ; 0x06017EC0
	ldr r0, _06017F04 ; =0x0380FFF4
	mov r3, #0
	ldr r0, [r0]
	add r2, r0, #0x23c
	mov r0, r3
_06017ED4:
	ldrh r1, [r2, #0x30]
	cmp r1, #0
	beq _06017EF4
	sub r1, r1, #1
	strh r1, [r2, #0x30]
	ldrh r1, [r2, #0x30]
	cmp r1, #0
	streqh r0, [r2]
_06017EF4:
	add r3, r3, #1
	cmp r3, #4
	blo _06017ED4
	bx lr
	.align 2, 0
_06017F04: .word 0x0380FFF4
	arm_func_end sub_06017EC0

	arm_func_start sub_06017F08
sub_06017F08: ; 0x06017F08
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _06017FA4 ; =0x0380FFF4
	mov r4, r0
	ldr r0, [r1]
	ldr r1, [r0, #0x318]
	ldrh r6, [r1, #2]
	cmp r6, #0xa4
	blo _06017F34
	ldr r0, _06017FA8 ; =0x000001D6
	cmp r6, r0
	bls _06017F3C
_06017F34:
	mov r0, #2
	b _06017F9C
_06017F3C:
	add r7, r1, #2
	mov r5, #0
	b _06017F6C
_06017F48:
	mov r0, r7
	bl sub_0600BA10
	mov r1, r5, lsl #0x10
	and r0, r0, #0xff
	mov r1, r1, lsr #0x10
	add r7, r7, #1
	bl sub_0600BAA8
	mov r5, r0
	sub r6, r6, #1
_06017F6C:
	cmp r6, #0
	bne _06017F48
	ldr r0, _06017FA4 ; =0x0380FFF4
	cmp r4, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x318]
	ldrh r1, [r0]
	orrne r0, r1, r5, lsl #16
	strne r0, [r4]
	cmp r5, r1
	movne r0, #1
	moveq r0, #0
_06017F9C:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_06017FA4: .word 0x0380FFF4
_06017FA8: .word 0x000001D6
	arm_func_end sub_06017F08

	arm_func_start sub_06017FAC
sub_06017FAC: ; 0x06017FAC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	add r4, sp, #0
_06017FB8:
	mov r0, r4
	bl sub_06017FEC
	ldr r0, [sp]
	tst r0, #0x20
	beq _06017FD4
	bl sub_06017FF4
	b _06017FB8
_06017FD4:
	ldr r0, [sp]
	tst r0, #1
	bne _06017FB8
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_06017FAC

	arm_func_start sub_06017FEC
sub_06017FEC: ; 0x06017FEC
	ldr pc, _06017FF0 ; =NVRAM_ReadStatusRegister
	.align 2, 0
_06017FF0: .word NVRAM_ReadStatusRegister
	arm_func_end sub_06017FEC

	arm_func_start sub_06017FF4
sub_06017FF4: ; 0x06017FF4
	ldr pc, _06017FF8 ; =sub_03804538
	.align 2, 0
_06017FF8: .word sub_03804538
	arm_func_end sub_06017FF4

	arm_func_start sub_06017FFC
sub_06017FFC: ; 0x06017FFC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _06018058 ; =0x0380FFF4
	mov r6, r1
	ldr r1, [r3]
	mov r5, r2
	ldr r1, [r1, #0x318]
	cmp r1, #0
	beq _06018050
	add r0, r1, r0
	sub r4, r0, #0x2a
	b _06018048
_06018028:
	mov r0, r4
	bl sub_0600BA10
	mov r1, r0
	mov r0, r5
	add r4, r4, #1
	bl sub_0600B9E4
	add r5, r5, #1
	sub r6, r6, #1
_06018048:
	cmp r6, #0
	bne _06018028
_06018050:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_06018058: .word 0x0380FFF4
	arm_func_end sub_06017FFC

	arm_func_start sub_0601805C
sub_0601805C: ; 0x0601805C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _060180A8 ; =0x0380FFF4
	mov r6, r0
	ldr r0, [r3]
	mov r5, r1
	ldr r0, [r0, #0x314]
	mov r4, r2
	bl sub_060180AC
	bl sub_06017FAC
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_060180B4
	ldr r0, _060180A8 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x314]
	bl sub_060180BC
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_060180A8: .word 0x0380FFF4
	arm_func_end sub_0601805C

	arm_func_start sub_060180AC
sub_060180AC: ; 0x060180AC
	ldr pc, _060180B0 ; =sub_03800A40
	.align 2, 0
_060180B0: .word sub_03800A40
	arm_func_end sub_060180AC

	arm_func_start sub_060180B4
sub_060180B4: ; 0x060180B4
	ldr pc, _060180B8 ; =NVRAM_ReadDataBytes
	.align 2, 0
_060180B8: .word NVRAM_ReadDataBytes
	arm_func_end sub_060180B4

	arm_func_start sub_060180BC
sub_060180BC: ; 0x060180BC
	ldr pc, _060180C0 ; =sub_03800A9C
	.align 2, 0
_060180C0: .word sub_03800A9C
	arm_func_end sub_060180BC

	arm_func_start sub_060180C4
sub_060180C4: ; 0x060180C4
	stmdb sp!, {r3, lr}
	ldr r0, _060181A8 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x314]
	bl sub_060180AC
	bl sub_06017FAC
	mov r3, #0
	add r2, sp, #0
	mov r0, #0x2c
	mov r1, #2
	str r3, [sp]
	bl sub_060180B4
	ldr r0, _060181A8 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x314]
	bl sub_060180BC
	ldr r1, [sp]
	cmp r1, #0xa4
	blo _0601811C
	ldr r0, _060181AC ; =0x000001D6
	cmp r1, r0
	bls _06018124
_0601811C:
	mov r0, #0
	b _060181A0
_06018124:
	ldr r0, _060181A8 ; =0x0380FFF4
	add r1, r1, #2
	str r1, [sp]
	ldr r0, [r0]
	add r0, r0, #0x188
	bl sub_060090A8
	ldr r2, _060181A8 ; =0x0380FFF4
	ldr r1, [r2]
	str r0, [r1, #0x318]
	ldr r1, [r2]
	ldr r0, [r1, #0x318]
	cmp r0, #0
	moveq r0, #0
	beq _060181A0
	add r0, r0, #0xc
	str r0, [r1, #0x318]
	ldr r0, [r2]
	ldr r0, [r0, #0x314]
	bl sub_060180AC
	bl sub_06017FAC
	ldr r0, _060181A8 ; =0x0380FFF4
	ldr r1, [sp]
	ldr r2, [r0]
	mov r0, #0x2a
	ldr r2, [r2, #0x318]
	bl sub_060180B4
	ldr r0, _060181A8 ; =0x0380FFF4
	ldr r0, [r0]
	ldr r0, [r0, #0x314]
	bl sub_060180BC
	mov r0, #1
_060181A0:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_060181A8: .word 0x0380FFF4
_060181AC: .word 0x000001D6
	arm_func_end sub_060180C4

	.rodata

_060181B0:
	.byte 0x40, 0x2B, 0x00, 0x06, 0xE0, 0x2B, 0x00, 0x06, 0xF0, 0x2F, 0x00, 0x06, 0x88, 0x7F, 0x00, 0x06
	.byte 0x84, 0x81, 0x00, 0x06, 0xEC, 0x81, 0x00, 0x06, 0xAC, 0x84, 0x00, 0x06, 0xA8, 0x30, 0x00, 0x06
	.byte 0x68, 0x31, 0x00, 0x06, 0x30, 0x34, 0x00, 0x06, 0x28, 0x36, 0x00, 0x06, 0x1C, 0x3F, 0x00, 0x06
	.byte 0x24, 0x40, 0x00, 0x06, 0x0C, 0x46, 0x00, 0x06, 0x3C, 0x4D, 0x00, 0x06, 0xD0, 0x50, 0x00, 0x06
	.byte 0x0C, 0x52, 0x00, 0x06, 0x5C, 0x53, 0x00, 0x06, 0xE8, 0x53, 0x00, 0x06, 0xE0, 0x54, 0x00, 0x06
	.byte 0x9C, 0x55, 0x00, 0x06, 0xB4, 0x1E, 0x00, 0x06, 0xB4, 0x1E, 0x00, 0x06, 0xB4, 0x1E, 0x00, 0x06
	.byte 0x3C, 0x57, 0x00, 0x06, 0x30, 0x58, 0x00, 0x06, 0xA4, 0x58, 0x00, 0x06, 0xC8, 0x58, 0x00, 0x06
	.byte 0xB0, 0x62, 0x00, 0x06, 0xEC, 0x58, 0x00, 0x06, 0x10, 0x5A, 0x00, 0x06, 0xEC, 0x5B, 0x00, 0x06
	.byte 0x54, 0x5C, 0x00, 0x06, 0x4C, 0x7E, 0x00, 0x06, 0xDC, 0x7E, 0x00, 0x06, 0x58, 0x85, 0x00, 0x06
	.byte 0xC0, 0x88, 0x00, 0x06, 0x38, 0x89, 0x00, 0x06, 0xB8, 0x39, 0x00, 0x06, 0x44, 0x56, 0x00, 0x06
	.byte 0x4C, 0x89, 0x00, 0x06, 0xCC, 0x8A, 0x00, 0x06, 0xF0, 0x8A, 0x00, 0x06, 0x50, 0x64, 0x00, 0x06
	.byte 0x84, 0x64, 0x00, 0x06, 0xAC, 0x64, 0x00, 0x06, 0xA0, 0xFF, 0x00, 0x06, 0xF4, 0x01, 0x01, 0x06
	.byte 0xD0, 0x02, 0x01, 0x06, 0xF4, 0x03, 0x01, 0x06, 0xF0, 0x04, 0x01, 0x06, 0xE4, 0x05, 0x01, 0x06
	.byte 0x28, 0x52, 0x01, 0x06, 0xE8, 0x6F, 0x01, 0x06, 0x14, 0xDA, 0x00, 0x06, 0x9C, 0x76, 0x01, 0x06
	.byte 0x20, 0xEB, 0x00, 0x06, 0xB0, 0xF0, 0x00, 0x06, 0x34, 0x90, 0x00, 0x06, 0x80, 0x08, 0x01, 0x06
	.byte 0x60, 0xDA, 0x00, 0x06, 0x34, 0xDC, 0x00, 0x06, 0xA0, 0xDF, 0x00, 0x06, 0xCC, 0x7B, 0x01, 0x06
	.byte 0xC0, 0x7E, 0x01, 0x06, 0x10, 0xF4, 0x00, 0x06, 0x7C, 0xE0, 0x00, 0x06, 0x70, 0xBD, 0x00, 0x06
	.byte 0xF0, 0xBD, 0x00, 0x06, 0x90, 0xBE, 0x00, 0x06, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0xCC
	.byte 0x01, 0xD8, 0x00, 0x14, 0x01, 0xF0, 0x00, 0x3C, 0x00, 0x28, 0x01, 0xE4, 0x01, 0xA0, 0x00, 0x6C
	.byte 0x00, 0x78, 0x01, 0xB4, 0x00, 0x50, 0x01, 0x9C, 0x01, 0x88, 0x00, 0x44, 0x46, 0x01, 0x48, 0x01
	.byte 0x4A, 0x01, 0x4C, 0x01, 0x20, 0x01, 0x22, 0x01, 0x54, 0x01, 0x44, 0x01, 0x32, 0x01, 0x32, 0x01
	.byte 0x40, 0x01, 0x42, 0x01, 0x38, 0x00, 0x24, 0x01, 0x28, 0x01, 0x50, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x10, 0x00, 0xFF, 0xFF
	.byte 0x54, 0x02, 0x00, 0x00, 0xB4, 0x00, 0xFF, 0xFF, 0x80, 0x00, 0x00, 0x00, 0x8E, 0x00, 0x01, 0x00
	.byte 0x88, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0xE8, 0x00, 0x00, 0x00
	.byte 0xEA, 0x00, 0x00, 0x00, 0xEE, 0x00, 0x01, 0x00, 0xEC, 0x00, 0x03, 0x3F, 0xA2, 0x01, 0x01, 0x00
	.byte 0xA0, 0x01, 0x00, 0x00, 0x10, 0x01, 0x00, 0x08, 0xBC, 0x00, 0x01, 0x00, 0xD4, 0x00, 0x03, 0x00
	.byte 0xD8, 0x00, 0x04, 0x00, 0xDA, 0x00, 0x02, 0x06, 0x76, 0x00, 0x00, 0x00, 0x30, 0x01, 0x46, 0x01
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x01, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0x02, 0x00, 0x03, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0x04, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x05, 0x00, 0xFF, 0x00, 0x06, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x07, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x08, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x09, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x0A, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x0B, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x03, 0x09, 0xBF, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x09, 0xBF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x12, 0x00, 0x16, 0x00, 0x18, 0x00, 0x24, 0x00
	.byte 0x30, 0x00, 0x48, 0x00, 0x60, 0x00, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0x5A, 0x5A, 0xA5, 0xA5, 0x02, 0x00, 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x07, 0x00
	.byte 0x1C, 0x00, 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x20, 0x00, 0x21, 0x00, 0x26, 0x00, 0x29, 0x00
	.byte 0x2C, 0x00, 0x2D, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x33, 0x00, 0x34, 0x00, 0x35, 0x00
	.byte 0x36, 0x00, 0x37, 0x00, 0x65, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0C, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x11, 0x00, 0x12, 0x00, 0x14, 0x00
	.byte 0x15, 0x00, 0x16, 0x00, 0x17, 0x00, 0x18, 0x00, 0x19, 0x00, 0x1A, 0x00, 0x27, 0x00, 0x4D, 0x00
	.byte 0x5D, 0x00, 0x5E, 0x00, 0x5F, 0x00, 0x60, 0x00, 0x61, 0x00, 0x64, 0x00, 0x66, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x3F, 0x00, 0x18, 0x00, 0xFF, 0xFF, 0x1A, 0x00, 0xFF, 0xFF, 0x1C, 0x00, 0xFF, 0xFF
	.byte 0x20, 0x00, 0xFF, 0xFF, 0x22, 0x00, 0xFF, 0xFF, 0x24, 0x00, 0xFF, 0xFF, 0x2A, 0x00, 0xFF, 0x07
	.byte 0x50, 0x00, 0xFF, 0xFF, 0x52, 0x00, 0xFF, 0xFF, 0x56, 0x00, 0xFE, 0x0F, 0x58, 0x00, 0xFE, 0x1F
	.byte 0x5A, 0x00, 0xFE, 0x0F, 0x5C, 0x00, 0xFF, 0x0F, 0x62, 0x00, 0xFE, 0x1F, 0x64, 0x00, 0xFF, 0x0F
	.byte 0x68, 0x00, 0xFE, 0x1F, 0x6C, 0x00, 0xFF, 0x0F, 0x74, 0x00, 0xFE, 0x1F, 0x22, 0x01, 0xFF, 0xFF
	.byte 0x24, 0x01, 0xFF, 0xFF, 0x28, 0x01, 0xFF, 0xFF, 0x30, 0x01, 0xFF, 0x0F, 0x32, 0x01, 0xFF, 0x8F
	.byte 0x34, 0x01, 0xFF, 0xFF, 0x40, 0x01, 0xFF, 0xFF, 0x42, 0x01, 0xFF, 0xFF, 0x18, 0x00, 0x02, 0x00
	.byte 0x80, 0x23, 0x01, 0x06, 0x04, 0x00, 0x01, 0x00, 0x4C, 0x25, 0x01, 0x06, 0x0A, 0x00, 0x01, 0x00
	.byte 0xF0, 0x26, 0x01, 0x06, 0x0C, 0x00, 0x01, 0x00, 0xA4, 0x2B, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00
	.byte 0x04, 0x2C, 0x01, 0x06, 0x00, 0x00, 0x04, 0x00, 0x98, 0x1A, 0x01, 0x06, 0x00, 0x00, 0x12, 0x00
	.byte 0xC8, 0x1A, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00, 0x14, 0x1B, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00
	.byte 0x3C, 0x1B, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00, 0x64, 0x1B, 0x01, 0x06, 0x00, 0x00, 0x01, 0x00
	.byte 0x8C, 0x1B, 0x01, 0x06, 0x03, 0x00, 0x01, 0x00, 0x18, 0x14, 0x01, 0x06, 0x11, 0x00, 0x01, 0x00
	.byte 0x30, 0x14, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00, 0x50, 0x14, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00
	.byte 0x8C, 0x14, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00, 0xC8, 0x14, 0x01, 0x06, 0x00, 0x00, 0x01, 0x00
	.byte 0x08, 0x15, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00, 0x8C, 0xF4, 0x00, 0x06, 0x03, 0x00, 0x01, 0x00
	.byte 0xCC, 0xF4, 0x00, 0x06, 0x1F, 0x00, 0x23, 0x00, 0x78, 0xF5, 0x00, 0x06, 0x22, 0x00, 0x05, 0x00
	.byte 0xB8, 0xF6, 0x00, 0x06, 0x05, 0x00, 0x06, 0x00, 0x70, 0xF8, 0x00, 0x06, 0x04, 0x00, 0x04, 0x00
	.byte 0x44, 0xF9, 0x00, 0x06, 0x05, 0x00, 0x03, 0x00, 0x78, 0xFA, 0x00, 0x06, 0x05, 0x00, 0x03, 0x00
	.byte 0x50, 0xFB, 0x00, 0x06, 0x04, 0x00, 0x01, 0x00, 0x10, 0xFC, 0x00, 0x06, 0x17, 0x00, 0x01, 0x00
	.byte 0x1C, 0xFD, 0x00, 0x06, 0x0C, 0x00, 0x12, 0x00, 0xBC, 0xFE, 0x00, 0x06, 0x00, 0x00, 0x01, 0x00
	.byte 0x80, 0xF3, 0x00, 0x06, 0x00, 0x00, 0x01, 0x00, 0x64, 0x1C, 0x01, 0x06, 0x00, 0x00, 0x01, 0x00
	.byte 0xA4, 0x1C, 0x01, 0x06, 0x00, 0x00, 0x01, 0x00, 0x00, 0x1D, 0x01, 0x06, 0x00, 0x00, 0x01, 0x00
	.byte 0x54, 0x1D, 0x01, 0x06, 0x00, 0x00, 0x01, 0x00, 0x90, 0x1D, 0x01, 0x06, 0x00, 0x00, 0x09, 0x00
	.byte 0xC8, 0x1D, 0x01, 0x06, 0x00, 0x00, 0x5C, 0x00, 0x6C, 0x1E, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00
	.byte 0xD0, 0x1E, 0x01, 0x06, 0x04, 0x00, 0x01, 0x00, 0xF8, 0x1E, 0x01, 0x06, 0x02, 0x00, 0x01, 0x00
	.byte 0xD0, 0x22, 0x01, 0x06, 0x00, 0x00, 0x21, 0x00, 0x6C, 0x15, 0x01, 0x06, 0x00, 0x00, 0x04, 0x00
	.byte 0xA4, 0x16, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00, 0xD4, 0x16, 0x01, 0x06, 0x00, 0x00, 0x03, 0x00
	.byte 0xFC, 0x16, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00, 0x34, 0x17, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00
	.byte 0x5C, 0x17, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00, 0x84, 0x17, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00
	.byte 0xAC, 0x17, 0x01, 0x06, 0x00, 0x00, 0x01, 0x00, 0x80, 0xF3, 0x00, 0x06, 0x00, 0x00, 0x02, 0x00
	.byte 0xD4, 0x17, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00, 0x04, 0x18, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00
	.byte 0x34, 0x18, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00, 0x5C, 0x18, 0x01, 0x06, 0x00, 0x00, 0x11, 0x00
	.byte 0x84, 0x18, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00, 0xC0, 0x18, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00
	.byte 0xF0, 0x18, 0x01, 0x06, 0x00, 0x00, 0x04, 0x00, 0x18, 0x19, 0x01, 0x06, 0x00, 0x00, 0x01, 0x00
	.byte 0x80, 0xF3, 0x00, 0x06, 0x00, 0x00, 0x02, 0x00, 0x58, 0x19, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00
	.byte 0x84, 0x19, 0x01, 0x06, 0x00, 0x00, 0x03, 0x00, 0xC0, 0x19, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00
	.byte 0x20, 0x1A, 0x01, 0x06, 0x00, 0x00, 0x02, 0x00, 0x5C, 0x1A, 0x01, 0x06, 0x48, 0x00, 0x01, 0x00
	.byte 0x64, 0x0E, 0x01, 0x06, 0x03, 0x00, 0x01, 0x00, 0x50, 0x0F, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00
	.byte 0x90, 0x0F, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00, 0xA8, 0x0F, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00
	.byte 0xE8, 0x0F, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00, 0x38, 0x10, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00
	.byte 0x50, 0x10, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00, 0x68, 0x10, 0x01, 0x06, 0x28, 0x00, 0x01, 0x00
	.byte 0x80, 0x10, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00, 0x98, 0x10, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00
	.byte 0xD8, 0x10, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00, 0xF0, 0x10, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00
	.byte 0x08, 0x11, 0x01, 0x06, 0x10, 0x00, 0x01, 0x00, 0x24, 0x11, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00
	.byte 0x3C, 0x11, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00, 0x54, 0x11, 0x01, 0x06, 0x03, 0x00, 0x01, 0x00
	.byte 0x6C, 0x11, 0x01, 0x06, 0x03, 0x00, 0x01, 0x00, 0xB8, 0x11, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00
	.byte 0xC0, 0x12, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00, 0x18, 0x13, 0x01, 0x06, 0x02, 0x00, 0x01, 0x00
	.byte 0x58, 0x13, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00, 0x98, 0x13, 0x01, 0x06, 0x01, 0x00, 0x01, 0x00
	.byte 0xD8, 0x13, 0x01, 0x06, 0x32, 0x2E, 0x38, 0x33, 0x2E, 0x30, 0x30, 0x00, 0x01, 0x00, 0x04, 0x00
	.byte 0x08, 0x00, 0x00, 0x00

	.bss

	.space 0x1590
