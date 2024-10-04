	.include "asm/macros.inc"
	.include "global.inc"

	.public wmspIndicateThread
	.public wmspRequestThread

    .public WL_GetThreadStruct
    .public WL_InitDriver
    .public WMSP_IndicateThread
    .public WMSP_RequestThread
    .public WMSP_WL_ParamSetAll

	.text

	arm_func_start WMSP_Init
WMSP_Init: ; 0x06000000
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r1
	ldr r1, [r4]
	ldr r3, _0600018C ; =wmspW + 0x1000
	mov r5, r0
	str r1, [r3, #0x540]
	ldr r1, [r5, #0x24]
	ldr r0, _06000190 ; =wmspW
	str r1, [r3, #0x544]
	ldr r2, [r5, #0x28]
	ldr r1, _06000194 ; =wmspW + 0x20
	str r2, [r3, #0x548]
	mov ip, #0
	str ip, [r3, #0x54c]
	mov r2, #2
	str ip, [r3, #0x550]
	bl __VENEER_OS_InitMessageQueue
	ldr r0, _06000198 ; =wmspW + 0x28
	ldr r1, _0600019C ; =wmspW + 0x48
	mov r2, #4
	bl __VENEER_OS_InitMessageQueue
	ldr r0, _060001A0 ; =wmspW + 0x58
	ldr r1, _060001A4 ; =wmspW + 0x78
	mov r2, #4
	bl __VENEER_OS_InitMessageQueue
	ldr r0, _060001A8 ; =wmspW + 0x88
	ldr r1, _060001AC ; =wmspW + 0xA8
	mov r2, #0x20
	bl __VENEER_OS_InitMessageQueue
	ldr r1, _06000190 ; =wmspW
	ldr r0, _06000198 ; =wmspW + 0x28
	str r1, [r5, #0x10]
	str r0, [r5, #0x14]
	ldr r2, [r4, #8]
	ldr r1, _0600018C ; =wmspW + 0x1000
	ldr r0, _060001B0 ; =wmspW + 0x1528
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
	bl __VENEER_OS_InitMutex
	mov r0, #0x400
	str r0, [sp]
	ldr r1, [r4, #4]
	ldr r0, _060001B4 ; =wmspIndicateThread
	str r1, [sp, #4]
	ldr r1, _060001B8 ; =WMSP_IndicateThread
	ldr r3, _060001B0 ; =wmspW + 0x1528
	mov r2, #0
	bl __VENEER_OS_CreateThread
	ldr r0, _060001B4 ; =wmspIndicateThread
	bl __VENEER_OS_WakeupThreadDirect
	mov r0, #0x1000
	str r0, [sp]
	ldr r1, [r4, #0xc]
	ldr r0, _060001BC ; =wmspRequestThread
	str r1, [sp, #4]
	ldr r1, _060001C0 ; =WMSP_RequestThread
	ldr r3, _060001C4 ; =wmspW + 0x1128
	mov r2, #0
	bl __VENEER_OS_CreateThread
	ldr r0, _060001BC ; =wmspRequestThread
	bl __VENEER_OS_WakeupThreadDirect
	mov r3, #0
	ldr r1, _06000190 ; =wmspW
	mov r2, r3
_06000128:
	add r0, r1, r3
	add r0, r0, #0x1000
	add r3, r3, #1
	strb r2, [r0, #0x554]
	cmp r3, #0x20
	blt _06000128
	ldr r0, _0600018C ; =wmspW + 0x1000
	str r2, [r0, #0x574]
	bl __VENEER_OS_IsVAlarmAvailable
	cmp r0, #0
	bne _06000158
	bl __VENEER_OS_InitVAlarm
_06000158:
	bl __VENEER_PXI_Init
	ldr r1, _060001C8 ; =WmspPxiCallback
	mov r0, #0xa
	bl __VENEER_PXI_SetFifoRecvCallback
	mov r0, #2
	str r0, [r5, #0x18]
	ldr r1, [r4, #0x14]
	mov r0, r5
	str r1, [r5, #0xc]
	bl WL_InitDriver
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0600018C: .word wmspW + 0x1000
_06000190: .word wmspW
_06000194: .word wmspW + 0x20
_06000198: .word wmspW + 0x28
_0600019C: .word wmspW + 0x48
_060001A0: .word wmspW + 0x58
_060001A4: .word wmspW + 0x78
_060001A8: .word wmspW + 0x88
_060001AC: .word wmspW + 0xA8
_060001B0: .word wmspW + 0x1528
_060001B4: .word wmspIndicateThread
_060001B8: .word WMSP_IndicateThread
_060001BC: .word wmspRequestThread
_060001C0: .word WMSP_RequestThread
_060001C4: .word wmspW + 0x1128
_060001C8: .word WmspPxiCallback
	arm_func_end WMSP_Init

	arm_func_start __VENEER_OS_InitMessageQueue
__VENEER_OS_InitMessageQueue: ; 0x060001CC
	ldr pc, _060001D0 ; =OS_InitMessageQueue
	.align 2, 0
_060001D0: .word OS_InitMessageQueue
	arm_func_end __VENEER_OS_InitMessageQueue

	arm_func_start __VENEER_OS_InitMutex
__VENEER_OS_InitMutex: ; 0x060001D4
	ldr pc, _060001D8 ; =OS_InitMutex
	.align 2, 0
_060001D8: .word OS_InitMutex
	arm_func_end __VENEER_OS_InitMutex

	arm_func_start __VENEER_OS_CreateThread
__VENEER_OS_CreateThread: ; 0x060001DC
	ldr pc, _060001E0 ; =OS_CreateThread
	.align 2, 0
_060001E0: .word OS_CreateThread
	arm_func_end __VENEER_OS_CreateThread

	arm_func_start __VENEER_OS_WakeupThreadDirect
__VENEER_OS_WakeupThreadDirect: ; 0x060001E4
	ldr pc, _060001E8 ; =OS_WakeupThreadDirect
	.align 2, 0
_060001E8: .word OS_WakeupThreadDirect
	arm_func_end __VENEER_OS_WakeupThreadDirect

	arm_func_start __VENEER_OS_IsVAlarmAvailable
__VENEER_OS_IsVAlarmAvailable: ; 0x060001EC
	ldr pc, _060001F0 ; =OS_IsVAlarmAvailable
	.align 2, 0
_060001F0: .word OS_IsVAlarmAvailable
	arm_func_end __VENEER_OS_IsVAlarmAvailable

	arm_func_start __VENEER_OS_InitVAlarm
__VENEER_OS_InitVAlarm: ; 0x060001F4
	ldr pc, _060001F8 ; =OS_InitVAlarm
	.align 2, 0
_060001F8: .word OS_InitVAlarm
	arm_func_end __VENEER_OS_InitVAlarm

	arm_func_start __VENEER_PXI_Init
__VENEER_PXI_Init: ; 0x060001FC
	ldr pc, _06000200 ; =PXI_Init
	.align 2, 0
_06000200: .word PXI_Init
	arm_func_end __VENEER_PXI_Init

	arm_func_start __VENEER_PXI_SetFifoRecvCallback
__VENEER_PXI_SetFifoRecvCallback: ; 0x06000204
	ldr pc, _06000208 ; =PXI_SetFifoRecvCallback
	.align 2, 0
_06000208: .word PXI_SetFifoRecvCallback
	arm_func_end __VENEER_PXI_SetFifoRecvCallback

	arm_func_start WMSP_WlRequest
WMSP_WlRequest: ; 0x0600020C
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldr r0, _0600027C ; =wmspW
	mov r2, #1
	bl __VENEER_OS_SendMessage
	ldr r0, _06000280 ; =wmspW + 0x58
	add r1, sp, #0
	mov r2, #1
	bl __VENEER_OS_ReceiveMessage
	ldr r1, [sp]
	ldrh r0, [r1, #0xe]
	add r0, r1, r0, lsl #1
	ldrh r0, [r0, #0x14]
	cmp r0, #0xe
	bne _06000270
	bl __VENEER_WMSP_GetBuffer4Callback2Wm9
	mov r1, #0x80
	strh r1, [r0]
	mov r1, #0x13
	strh r1, [r0, #2]
	mov r1, #0x18
	strh r1, [r0, #4]
	bl __VENEER_WMSP_ReturnResult2Wm9
	bl __VENEER_SND_BeginSleep
	bl __VENEER_OS_Terminate
_06000270:
	ldr r0, [sp]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_0600027C: .word wmspW
_06000280: .word wmspW + 0x58
	arm_func_end WMSP_WlRequest

	arm_func_start __VENEER_OS_SendMessage
__VENEER_OS_SendMessage: ; 0x06000284
	ldr pc, _06000288 ; =OS_SendMessage
	.align 2, 0
_06000288: .word OS_SendMessage
	arm_func_end __VENEER_OS_SendMessage

	arm_func_start __VENEER_OS_ReceiveMessage
__VENEER_OS_ReceiveMessage: ; 0x0600028C
	ldr pc, _06000290 ; =OS_ReceiveMessage
	.align 2, 0
_06000290: .word OS_ReceiveMessage
	arm_func_end __VENEER_OS_ReceiveMessage

	arm_func_start __VENEER_WMSP_GetBuffer4Callback2Wm9
__VENEER_WMSP_GetBuffer4Callback2Wm9: ; 0x06000294
	ldr pc, _06000298 ; =WMSP_GetBuffer4Callback2Wm9
	.align 2, 0
_06000298: .word WMSP_GetBuffer4Callback2Wm9
	arm_func_end __VENEER_WMSP_GetBuffer4Callback2Wm9

	arm_func_start __VENEER_WMSP_ReturnResult2Wm9
__VENEER_WMSP_ReturnResult2Wm9: ; 0x0600029C
	ldr pc, _060002A0 ; =WMSP_ReturnResult2Wm9
	.align 2, 0
_060002A0: .word WMSP_ReturnResult2Wm9
	arm_func_end __VENEER_WMSP_ReturnResult2Wm9

	arm_func_start __VENEER_SND_BeginSleep
__VENEER_SND_BeginSleep: ; 0x060002A4
	ldr pc, _060002A8 ; =SND_BeginSleep
	.align 2, 0
_060002A8: .word SND_BeginSleep
	arm_func_end __VENEER_SND_BeginSleep

	arm_func_start __VENEER_OS_Terminate
__VENEER_OS_Terminate: ; 0x060002AC
	ldr pc, _060002B0 ; =OS_Terminate
	.align 2, 0
_060002B0: .word OS_Terminate
	arm_func_end __VENEER_OS_Terminate

	arm_func_start WmspPxiCallback
WmspPxiCallback: ; 0x060002B4
	stmdb sp!, {r4, lr}
	mov r4, r1
	cmp r2, #0
	bne _0600030C
	ldr r0, _06000314 ; =wmspW + 0x88
	mov r2, #0
	bl __VENEER_OS_SendMessage
	cmp r0, #0
	bne _0600030C
	ldr r0, _06000318 ; =wmspW + 0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	beq _0600030C
	bl __VENEER_WMSP_GetBuffer4Callback2Wm9
	ldrh r2, [r4]
	mov r1, #8
	strh r2, [r0]
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	bl __VENEER_WMSP_ReturnResult2Wm9
_0600030C:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06000314: .word wmspW + 0x88
_06000318: .word wmspW + 0x1000
	arm_func_end WmspPxiCallback

	arm_func_start WMSP_CheckMacAddress
WMSP_CheckMacAddress: ; 0x0600031C
	ldr r1, _06000378 ; =wmspW + 0x1000
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
_06000378: .word wmspW + 0x1000
	arm_func_end WMSP_CheckMacAddress

	arm_func_start WMSP_CopyParentParam
WMSP_CopyParentParam: ; 0x0600037C
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
	bl __VENEER_MI_CpuCopy8
_06000438:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end WMSP_CopyParentParam

	arm_func_start __VENEER_MI_CpuCopy8
__VENEER_MI_CpuCopy8: ; 0x06000440
	ldr pc, _06000444 ; =MI_CpuCopy8
	.align 2, 0
_06000444: .word MI_CpuCopy8
	arm_func_end __VENEER_MI_CpuCopy8

	arm_func_start WMSP_SetAllParams
WMSP_SetAllParams: ; 0x06000448
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _06000590 ; =wmspW + 0x1000
	mov r5, r1
	ldr r4, [r2, #0x550]
	mov r6, r0
	add r0, r4, #0xe0
	add r1, r5, #0x10
	mov r2, #6
	bl __VENEER_MI_CpuCopy8
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
	bl __VENEER_MIi_CpuClear16
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
	bl __VENEER_MI_CpuCopy8
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
	bl __VENEER_MIi_CpuClear16
	b _06000540
_06000528:
	mov r2, #8
	bl __VENEER_MIi_CpuClear16
	ldr r0, _06000594 ; =0x0000FFFF
	add r1, r5, #0x84
	mov r2, #0x18
	bl __VENEER_MIi_CpuClear16
_06000540:
	add r0, r4, #0x100
	ldrh r1, [r0, #0xee]
	mov r0, r5
	strh r1, [r5, #0x9c]
	bl WMSP_WL_ParamSetAll
	ldrh r4, [r0, #4]
	cmp r4, #0
	moveq r0, #1
	beq _06000588
	bl __VENEER_WMSP_GetBuffer4Callback2Wm9
	strh r6, [r0]
	mov r1, #1
	strh r1, [r0, #2]
	mov r1, #0x200
	strh r1, [r0, #4]
	strh r4, [r0, #6]
	bl __VENEER_WMSP_ReturnResult2Wm9
	mov r0, #0
_06000588:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_06000590: .word wmspW + 0x1000
_06000594: .word 0x0000FFFF
	arm_func_end WMSP_SetAllParams

	arm_func_start __VENEER_MIi_CpuClear16
__VENEER_MIi_CpuClear16: ; 0x06000598
	ldr pc, _0600059C ; =MIi_CpuClear16
	.align 2, 0
_0600059C: .word MIi_CpuClear16
	arm_func_end __VENEER_MIi_CpuClear16

	arm_func_start WMSP_AddRssiToList
WMSP_AddRssiToList: ; 0x060005A0
	ldr r1, _060005D8 ; =wmspW + 0x1000
	ldr r3, _060005DC ; =wmspW + 0x1554
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
_060005D8: .word wmspW + 0x1000
_060005DC: .word wmspW + 0x1554
_060005E0: .word 0x027FFF98
	arm_func_end WMSP_AddRssiToList

	arm_func_start WMSP_FillRssiIntoList
WMSP_FillRssiIntoList: ; 0x060005E4
	ldr r2, _06000614 ; =wmspW
	mov r3, #0
_060005EC:
	add r1, r2, r3
	add r1, r1, #0x1000
	add r3, r3, #1
	strb r0, [r1, #0x554]
	cmp r3, #0x20
	blt _060005EC
	ldr r0, _06000618 ; =wmspW + 0x1000
	mov r1, #0
	str r1, [r0, #0x574]
	bx lr
	.align 2, 0
_06000614: .word wmspW
_06000618: .word wmspW + 0x1000
	arm_func_end WMSP_FillRssiIntoList

	arm_func_start WMSP_GetAverageLinkLevel
WMSP_GetAverageLinkLevel: ; 0x0600061C
	ldr r1, _06000650 ; =wmspW
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
	ldr ip, _06000654 ; =WMSP_GetLinkLevel
	mov r0, r3, lsr #5
	bx ip
	.align 2, 0
_06000650: .word wmspW
_06000654: .word WMSP_GetLinkLevel
	arm_func_end WMSP_GetAverageLinkLevel

	arm_func_start WMSP_GetLinkLevel
WMSP_GetLinkLevel: ; 0x06000658
	ldr r1, _060006BC ; =wmspW + 0x1000
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
_060006BC: .word wmspW + 0x1000
	arm_func_end WMSP_GetLinkLevel

	arm_func_start WMSP_SetThreadPriorityLow
WMSP_SetThreadPriorityLow: ; 0x060006C0
	stmdb sp!, {r4, lr}
	bl __VENEER_OS_DisableInterrupts
	mov r4, r0
	bl __VENEER_OS_DisableScheduler
	ldr r1, _06000714 ; =wmspW + 0x1000
	ldr r0, _06000718 ; =wmspRequestThread
	ldr r1, [r1, #0x58c]
	bl __VENEER_OS_SetThreadPriority
	bl WL_GetThreadStruct
	ldr r1, _06000714 ; =wmspW + 0x1000
	ldr r1, [r1, #0x588]
	bl __VENEER_OS_SetThreadPriority
	ldr r1, _06000714 ; =wmspW + 0x1000
	ldr r0, _0600071C ; =wmspIndicateThread
	ldr r1, [r1, #0x584]
	bl __VENEER_OS_SetThreadPriority
	bl __VENEER_OS_EnableScheduler
	mov r0, r4
	bl __VENEER_OS_RestoreInterrupts
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06000714: .word wmspW + 0x1000
_06000718: .word wmspRequestThread
_0600071C: .word wmspIndicateThread
	arm_func_end WMSP_SetThreadPriorityLow

	arm_func_start __VENEER_OS_DisableInterrupts
__VENEER_OS_DisableInterrupts: ; 0x06000720
	ldr pc, _06000724 ; =OS_DisableInterrupts
	.align 2, 0
_06000724: .word OS_DisableInterrupts
	arm_func_end __VENEER_OS_DisableInterrupts

	arm_func_start __VENEER_OS_DisableScheduler
__VENEER_OS_DisableScheduler: ; 0x06000728
	ldr pc, _0600072C ; =OS_DisableScheduler
	.align 2, 0
_0600072C: .word OS_DisableScheduler
	arm_func_end __VENEER_OS_DisableScheduler

	arm_func_start __VENEER_OS_SetThreadPriority
__VENEER_OS_SetThreadPriority: ; 0x06000730
	ldr pc, _06000734 ; =OS_SetThreadPriority
	.align 2, 0
_06000734: .word OS_SetThreadPriority
	arm_func_end __VENEER_OS_SetThreadPriority

	arm_func_start __VENEER_OS_EnableScheduler
__VENEER_OS_EnableScheduler: ; 0x06000738
	ldr pc, _0600073C ; =OS_EnableScheduler
	.align 2, 0
_0600073C: .word OS_EnableScheduler
	arm_func_end __VENEER_OS_EnableScheduler

	arm_func_start __VENEER_OS_RestoreInterrupts
__VENEER_OS_RestoreInterrupts: ; 0x06000740
	ldr pc, _06000744 ; =OS_RestoreInterrupts
	.align 2, 0
_06000744: .word OS_RestoreInterrupts
	arm_func_end __VENEER_OS_RestoreInterrupts

	arm_func_start WMSP_SetThreadPriorityHigh
WMSP_SetThreadPriorityHigh: ; 0x06000748
	stmdb sp!, {r4, lr}
	bl __VENEER_OS_DisableInterrupts
	mov r4, r0
	bl __VENEER_OS_DisableScheduler
	ldr r1, _0600079C ; =wmspW + 0x1000
	ldr r0, _060007A0 ; =wmspIndicateThread
	ldr r1, [r1, #0x578]
	bl __VENEER_OS_SetThreadPriority
	bl WL_GetThreadStruct
	ldr r1, _0600079C ; =wmspW + 0x1000
	ldr r1, [r1, #0x57c]
	bl __VENEER_OS_SetThreadPriority
	ldr r1, _0600079C ; =wmspW + 0x1000
	ldr r0, _060007A4 ; =wmspRequestThread
	ldr r1, [r1, #0x580]
	bl __VENEER_OS_SetThreadPriority
	bl __VENEER_OS_EnableScheduler
	mov r0, r4
	bl __VENEER_OS_RestoreInterrupts
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_0600079C: .word wmspW + 0x1000
_060007A0: .word wmspIndicateThread
_060007A4: .word wmspRequestThread
	arm_func_end WMSP_SetThreadPriorityHigh

	arm_func_start WMSP_GetRequestThread
WMSP_GetRequestThread: ; 0x060007A8
	ldr r0, _060007B0 ; =wmspRequestThread
	bx lr
	.align 2, 0
_060007B0: .word wmspRequestThread
	arm_func_end WMSP_GetRequestThread

	arm_func_start WMSP_GetIndicateThread
WMSP_GetIndicateThread: ; 0x060007B4
	ldr r0, _060007BC ; =wmspIndicateThread
	bx lr
	.align 2, 0
_060007BC: .word wmspIndicateThread
	arm_func_end WMSP_GetIndicateThread

	arm_func_start WMSP_GetInternalRequestBuf
WMSP_GetInternalRequestBuf: ; 0x060007C0
	stmdb sp!, {r4, lr}
	mov r4, #0
	bl __VENEER_OS_DisableInterrupts
	ldr r1, _06000828 ; =wmspW + 0x1000
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
	bl __VENEER_OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_06000828: .word wmspW + 0x1000
	arm_func_end WMSP_GetInternalRequestBuf

	arm_func_start WMSP_ResetSizeVars
WMSP_ResetSizeVars: ; 0x0600082C
	ldr r0, _0600085C ; =wmspW + 0x1000
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
_0600085C: .word wmspW + 0x1000
	arm_func_end WMSP_ResetSizeVars

	arm_func_start WMSP_SetParentMaxSize
WMSP_SetParentMaxSize: ; 0x06000860
	ldr r1, _060008AC ; =wmspW + 0x1000
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
_060008AC: .word wmspW + 0x1000
	arm_func_end WMSP_SetParentMaxSize

	arm_func_start WMSP_SetChildMaxSize
WMSP_SetChildMaxSize: ; 0x060008B0
	ldr r1, _060008FC ; =wmspW + 0x1000
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
_060008FC: .word wmspW + 0x1000
	arm_func_end WMSP_SetChildMaxSize

	arm_func_start WMSP_SetParentSize
WMSP_SetParentSize: ; 0x06000900
	ldr r1, _06000928 ; =wmspW + 0x1000
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
_06000928: .word wmspW + 0x1000
	arm_func_end WMSP_SetParentSize

	arm_func_start WMSP_SetChildSize
WMSP_SetChildSize: ; 0x0600092C
	ldr r1, _06000954 ; =wmspW + 0x1000
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
_06000954: .word wmspW + 0x1000
	arm_func_end WMSP_SetChildSize

	.bss

	.public wmspW
wmspW: ; 0x060188A4
	.space 0x1590
