	.include "asm/macros.inc"
	.include "global.inc"

	.public OS_InitContext
	.public OS_SaveContext
	.public OS_LoadContext
	.public OSi_UnlockAllMutex

	.bss

OSi_SystemCallbackInSwitchThread: ; 0x021E167C
	.space 0x4

OSi_RescheduleCount: ; 0x021E1680
	.space 0x4

OSi_CurrentThreadPtr: ; 0x021E1684
	.space 0x4

OSi_IsThreadInitialized: ; 0x021E1688
	.space 0x4

OSi_SystemStackBuffer: ; 0x021E168C
	.space 0x4

killThreadStatus: ; 0x021E1690
	.space 0x4

exitThreadStatus: ; 0x021E1694
	.space 0x4

OSi_StackForDestructor: ; 0x021E1698
	.space 0x4

OSi_ThreadIdCount: ; 0x021E169C
	.space 0x4

OSi_ThreadInfo: ; 0x021E16A0
	.space 0x10

OSi_IdleThread: ; 0x021E16B0
	.space 0xC0

OSi_LauncherThread: ; 0x021E1770
	.space 0xC0

OSi_IdleThreadStack: ; 0x021E1830
	.space 0xC8

	.text

	arm_func_start OSi_GetUnusedThreadId
OSi_GetUnusedThreadId: ; 0x020D16C0
	ldr r1, _020D16D4 ; =0x021E167C
	ldr r0, [r1, #0x20]
	add r0, r0, #1
	str r0, [r1, #0x20]
	bx lr
	.align 2, 0
_020D16D4: .word 0x021E167C
	arm_func_end OSi_GetUnusedThreadId

	arm_func_start OSi_InsertLinkToQueue
OSi_InsertLinkToQueue: ; 0x020D16D8
	ldr ip, [r0]
	b _020D16EC
_020D16E0:
	cmp ip, r1
	bxeq lr
	ldr ip, [ip, #0x80]
_020D16EC:
	cmp ip, #0
	beq _020D1704
	ldr r3, [ip, #0x70]
	ldr r2, [r1, #0x70]
	cmp r3, r2
	bls _020D16E0
_020D1704:
	cmp ip, #0
	bne _020D1730
	ldr r2, [r0, #4]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x80]
	str r2, [r1, #0x7c]
	mov r2, #0
	str r2, [r1, #0x80]
	str r1, [r0, #4]
	bx lr
_020D1730:
	ldr r2, [ip, #0x7c]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x80]
	str r2, [r1, #0x7c]
	str ip, [r1, #0x80]
	str r1, [ip, #0x7c]
	bx lr
	arm_func_end OSi_InsertLinkToQueue

	arm_func_start OSi_RemoveLinkFromQueue
OSi_RemoveLinkFromQueue: ; 0x020D1750
	ldr r2, [r0]
	cmp r2, #0
	beq _020D177C
	ldr r1, [r2, #0x80]
	str r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0x7c]
	moveq r1, #0
	streq r1, [r0, #4]
	streq r1, [r2, #0x78]
_020D177C:
	mov r0, r2
	bx lr
	arm_func_end OSi_RemoveLinkFromQueue

	arm_func_start OSi_RemoveSpecifiedLinkFromQueue
OSi_RemoveSpecifiedLinkFromQueue: ; 0x020D1784
	ldr ip, [r0]
	mov r2, ip
	cmp ip, #0
	beq _020D17D0
_020D1794:
	cmp r2, r1
	ldr r3, [r2, #0x80]
	bne _020D17C4
	cmp ip, r2
	ldr ip, [r2, #0x7c]
	streq r3, [r0]
	strne r3, [ip, #0x80]
	ldr r1, [r0, #4]
	cmp r1, r2
	streq ip, [r0, #4]
	strne ip, [r3, #0x7c]
	b _020D17D0
_020D17C4:
	mov r2, r3
	cmp r3, #0
	bne _020D1794
_020D17D0:
	mov r0, r2
	bx lr
	arm_func_end OSi_RemoveSpecifiedLinkFromQueue

	arm_func_start OSi_RemoveMutexLinkFromQueue
OSi_RemoveMutexLinkFromQueue: ; 0x020D17D8
	ldr r2, [r0]
	cmp r2, #0
	beq _020D1800
	ldr r1, [r2, #0x10]
	str r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0x14]
	moveq r1, #0
	streq r1, [r0, #4]
_020D1800:
	mov r0, r2
	bx lr
	arm_func_end OSi_RemoveMutexLinkFromQueue

	arm_func_start OSi_InsertThreadToList
OSi_InsertThreadToList: ; 0x020D1808
	stmdb sp!, {r3, lr}
	ldr r1, _020D1864 ; =0x021E167C
	mov ip, #0
	ldr lr, [r1, #0x2c]
	mov r3, lr
	b _020D1828
_020D1820:
	mov ip, r3
	ldr r3, [r3, #0x68]
_020D1828:
	cmp r3, #0
	beq _020D1840
	ldr r2, [r3, #0x70]
	ldr r1, [r0, #0x70]
	cmp r2, r1
	blo _020D1820
_020D1840:
	cmp ip, #0
	ldrne r1, [ip, #0x68]
	strne r1, [r0, #0x68]
	strne r0, [ip, #0x68]
	ldmneia sp!, {r3, pc}
	ldr r1, _020D1864 ; =0x021E167C
	str lr, [r0, #0x68]
	str r0, [r1, #0x2c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D1864: .word 0x021E167C
	arm_func_end OSi_InsertThreadToList

	arm_func_start OSi_RemoveThreadFromList
OSi_RemoveThreadFromList: ; 0x020D1868
	ldr r1, _020D18AC ; =0x021E167C
	mov r2, #0
	ldr r1, [r1, #0x2c]
	b _020D1880
_020D1878:
	mov r2, r1
	ldr r1, [r1, #0x68]
_020D1880:
	cmp r1, #0
	cmpne r1, r0
	bne _020D1878
	cmp r2, #0
	ldrne r0, [r0, #0x68]
	strne r0, [r2, #0x68]
	bxne lr
	ldr r1, [r0, #0x68]
	ldr r0, _020D18AC ; =0x021E167C
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0
_020D18AC: .word 0x021E167C
	arm_func_end OSi_RemoveThreadFromList

	arm_func_start OSi_RescheduleThread
OSi_RescheduleThread: ; 0x020D18B0
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _020D1970 ; =0x021E167C
	ldr r1, [r0, #4]
	cmp r1, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldrh r0, [r0, #0x26]
	ldr r4, _020D1974 ; =0x021E16A0
	cmp r0, #0
	bne _020D18E0
	bl OS_GetProcMode
	cmp r0, #0x12
	bne _020D18EC
_020D18E0:
	mov r0, #1
	strh r0, [r4]
	ldmia sp!, {r4, r5, r6, pc}
_020D18EC:
	ldr r0, _020D1970 ; =0x021E167C
	ldr r0, [r0, #8]
	ldr r6, [r0]
	bl OS_SelectThread
	mov r5, r0
	cmp r6, r5
	cmpne r5, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [r6, #0x64]
	cmp r0, #2
	beq _020D1928
	mov r0, r6
	bl OS_SaveContext
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
_020D1928:
	ldr r0, _020D1970 ; =0x021E167C
	ldr r2, [r0]
	cmp r2, #0
	beq _020D1944
	mov r0, r6
	mov r1, r5
	blx r2
_020D1944:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _020D195C
	mov r0, r6
	mov r1, r5
	blx r2
_020D195C:
	ldr r1, _020D1970 ; =0x021E167C
	mov r0, r5
	str r5, [r1, #0x28]
	bl OS_LoadContext
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D1970: .word 0x021E167C
_020D1974: .word 0x021E16A0
	arm_func_end OSi_RescheduleThread

	arm_func_start OS_InitThread
OS_InitThread: ; 0x020D1978
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _020D1A8C ; =0x021E167C
	ldr r1, [r0, #0xc]
	cmp r1, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, pc}
	mov r3, #1
	ldr r2, _020D1A90 ; =0x021E16A4
	str r3, [r0, #0xc]
	str r2, [r0, #8]
	ldr r1, _020D1A94 ; =0x021E1770
	mov r2, #0x10
	str r2, [r1, #0x70]
	mov r2, #0
	str r2, [r1, #0x6c]
	str r3, [r1, #0x64]
	str r2, [r1, #0x68]
	str r2, [r1, #0x74]
	ldr r2, _020D1A98 ; =0x00000000
	str r1, [r0, #0x2c]
	str r1, [r0, #0x28]
	cmp r2, #0
	ldrle r0, _020D1A9C ; =0x027E0080
	ble _020D19EC
	ldr r1, _020D1AA0 ; =OS_IRQTable
	ldr r0, _020D1AA4 ; =0x00000800
	add r1, r1, #0x3f80
	sub r0, r1, r0
_020D19EC:
	ldr r1, _020D1AA0 ; =OS_IRQTable
	sub ip, r0, r2
	ldr r0, _020D1AA4 ; =0x00000800
	add r1, r1, #0x3f80
	sub r3, r1, r0
	ldr r2, _020D1A94 ; =0x021E1770
	mov r0, #0
	str r3, [r2, #0x94]
	str ip, [r2, #0x90]
	ldr r1, _020D1AA8 ; =0xFDDB597D
	str r0, [r2, #0x98]
	str r1, [r3, #-4]
	ldr r3, [r2, #0x90]
	ldr ip, _020D1AAC ; =0x7BF9DD5B
	ldr r1, _020D1A8C ; =0x021E167C
	str ip, [r3]
	str r0, [r2, #0xa0]
	str r0, [r2, #0x9c]
	strh r0, [r1, #0x24]
	ldr r3, _020D1AB0 ; =0x021E16A0
	ldr r2, _020D1AB4 ; =0x027FFFA0
	strh r0, [r1, #0x26]
	str r3, [r2]
	bl OS_SetSwitchThreadCallback
	mov r2, #0xc8
	str r2, [sp]
	mov ip, #0x1f
	ldr r0, _020D1AB8 ; =0x021E16B0
	ldr r1, _020D1ABC ; =OSi_IdleThreadProc
	ldr r3, _020D1AC0 ; =0x021E18F8
	mov r2, #0
	str ip, [sp, #4]
	bl OS_CreateThread
	ldr r0, _020D1AB8 ; =0x021E16B0
	mov r1, #0x20
	str r1, [r0, #0x70]
	mov r1, #1
	str r1, [r0, #0x64]
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D1A8C: .word 0x021E167C
_020D1A90: .word 0x021E16A4
_020D1A94: .word 0x021E1770
_020D1A98: .word 0x00000000
_020D1A9C: .word 0x027E0080
_020D1AA0: .word OS_IRQTable
_020D1AA4: .word 0x00000800
_020D1AA8: .word 0xFDDB597D
_020D1AAC: .word 0x7BF9DD5B
_020D1AB0: .word 0x021E16A0
_020D1AB4: .word 0x027FFFA0
_020D1AB8: .word 0x021E16B0
_020D1ABC: .word OSi_IdleThreadProc
_020D1AC0: .word 0x021E18F8
	arm_func_end OS_InitThread

	arm_func_start OS_IsThreadAvailable
OS_IsThreadAvailable: ; 0x020D1AC4
	ldr r0, _020D1AD0 ; =0x021E1688
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020D1AD0: .word 0x021E1688
	arm_func_end OS_IsThreadAvailable

	arm_func_start OS_CreateThread
OS_CreateThread: ; 0x020D1AD4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r5, r1
	mov r7, r2
	mov r6, r3
	bl OS_DisableInterrupts
	mov r4, r0
	bl OSi_GetUnusedThreadId
	ldr r2, [sp, #0x1c]
	mov r1, #0
	str r2, [r8, #0x70]
	str r0, [r8, #0x6c]
	str r1, [r8, #0x64]
	mov r0, r8
	str r1, [r8, #0x74]
	bl OSi_InsertThreadToList
	ldr r0, [sp, #0x18]
	mov r1, r5
	str r6, [r8, #0x94]
	sub r5, r6, r0
	sub r2, r6, #4
	mov ip, #0
	str r5, [r8, #0x90]
	str ip, [r8, #0x98]
	ldr r6, _020D1BC4 ; =0xFDDB597D
	ldr r0, [r8, #0x94]
	ldr r3, _020D1BC8 ; =0x7BF9DD5B
	str r6, [r0, #-4]
	ldr r0, [r8, #0x90]
	str r3, [r0]
	str ip, [r8, #0xa0]
	mov r0, r8
	str ip, [r8, #0x9c]
	bl OS_InitContext
	ldr r2, _020D1BCC ; =OS_ExitThread
	str r7, [r8, #4]
	str r2, [r8, #0x3c]
	ldr r2, [sp, #0x18]
	add r1, r5, #4
	mov r0, #0
	sub r2, r2, #8
	bl MIi_CpuClear32
	mov r1, #0
	str r1, [r8, #0x84]
	str r1, [r8, #0x88]
	mov r0, r8
	str r1, [r8, #0x8c]
	bl OS_SetThreadDestructor
	mov r0, #0
	str r0, [r8, #0x78]
	str r0, [r8, #0x80]
	add r1, r8, #0xa4
	mov r2, #0xc
	str r0, [r8, #0x7c]
	bl MIi_CpuClear32
	mov r1, #0
	mov r0, r4
	str r1, [r8, #0xb0]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020D1BC4: .word 0xFDDB597D
_020D1BC8: .word 0x7BF9DD5B
_020D1BCC: .word OS_ExitThread
	arm_func_end OS_CreateThread

	arm_func_start OS_ExitThread
OS_ExitThread: ; 0x020D1BD0
	stmdb sp!, {r3, lr}
	bl OS_DisableInterrupts
	ldr r0, _020D1BEC ; =0x021E167C
	mov r1, #0
	ldr r0, [r0, #0x28]
	bl OSi_ExitThread_ArgSpecified
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D1BEC: .word 0x021E167C
	arm_func_end OS_ExitThread

	arm_func_start OSi_ExitThread_ArgSpecified
OSi_ExitThread_ArgSpecified: ; 0x020D1BF0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _020D1C44 ; =0x021E167C
	mov r5, r0
	ldr r2, [r2, #0x1c]
	mov r4, r1
	cmp r2, #0
	beq _020D1C38
	ldr r1, _020D1C48 ; =OSi_ExitThread
	bl OS_InitContext
	str r4, [r5, #4]
	ldr r1, [r5]
	mov r0, r5
	orr r1, r1, #0x80
	str r1, [r5]
	mov r1, #1
	str r1, [r5, #0x64]
	bl OS_LoadContext
	ldmia sp!, {r3, r4, r5, pc}
_020D1C38:
	mov r0, r4
	bl OSi_ExitThread
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020D1C44: .word 0x021E167C
_020D1C48: .word OSi_ExitThread
	arm_func_end OSi_ExitThread_ArgSpecified

	arm_func_start OSi_ExitThread
OSi_ExitThread: ; 0x020D1C4C
	stmdb sp!, {r3, lr}
	ldr r1, _020D1C80 ; =0x021E167C
	ldr r1, [r1, #8]
	ldr r3, [r1]
	ldr r2, [r3, #0xb4]
	cmp r2, #0
	beq _020D1C78
	mov r1, #0
	str r1, [r3, #0xb4]
	blx r2
	bl OS_DisableInterrupts
_020D1C78:
	bl OSi_ExitThread_Destroy
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D1C80: .word 0x021E167C
	arm_func_end OSi_ExitThread

	arm_func_start OSi_ExitThread_Destroy
OSi_ExitThread_Destroy: ; 0x020D1C84
	stmdb sp!, {r4, lr}
	ldr r0, _020D1CDC ; =0x021E167C
	ldr r0, [r0, #8]
	ldr r4, [r0]
	bl OS_DisableScheduler
	mov r0, r4
	bl OSi_UnlockAllMutex
	ldr r0, [r4, #0x78]
	cmp r0, #0
	beq _020D1CB4
	mov r1, r4
	bl OSi_RemoveSpecifiedLinkFromQueue
_020D1CB4:
	mov r0, r4
	bl OSi_RemoveThreadFromList
	mov r1, #2
	add r0, r4, #0x9c
	str r1, [r4, #0x64]
	bl OS_WakeupThread
	bl OS_EnableScheduler
	bl OS_RescheduleThread
	bl OS_Terminate
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D1CDC: .word 0x021E167C
	arm_func_end OSi_ExitThread_Destroy

	arm_func_start OS_DestroyThread
OS_DestroyThread: ; 0x020D1CE0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	ldr r1, _020D1D58 ; =0x021E167C
	mov r4, r0
	ldr r0, [r1, #0x28]
	cmp r0, r5
	bne _020D1D04
	bl OSi_ExitThread_Destroy
_020D1D04:
	bl OS_DisableScheduler
	mov r0, r5
	bl OSi_UnlockAllMutex
	mov r0, r5
	bl OSi_CancelThreadAlarmForSleep
	ldr r0, [r5, #0x78]
	cmp r0, #0
	beq _020D1D2C
	mov r1, r5
	bl OSi_RemoveSpecifiedLinkFromQueue
_020D1D2C:
	mov r0, r5
	bl OSi_RemoveThreadFromList
	mov r1, #2
	add r0, r5, #0x9c
	str r1, [r5, #0x64]
	bl OS_WakeupThread
	bl OS_EnableScheduler
	mov r0, r4
	bl OS_RestoreInterrupts
	bl OS_RescheduleThread
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020D1D58: .word 0x021E167C
	arm_func_end OS_DestroyThread

	arm_func_start OS_KillThread
OS_KillThread: ; 0x020D1D5C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl OS_GetThreadPriority
	mov r2, r0
	mov r0, r5
	mov r1, r4
	bl OS_KillThreadWithPriority
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end OS_KillThread

	arm_func_start OS_KillThreadWithPriority
OS_KillThreadWithPriority: ; 0x020D1D80
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl OS_DisableInterrupts
	ldr r1, _020D1E18 ; =0x021E167C
	mov r4, r0
	ldr r0, [r1, #0x28]
	cmp r7, r0
	bne _020D1DB4
	mov r0, r7
	mov r1, r6
	bl OSi_ExitThread_ArgSpecified
_020D1DB4:
	mov r0, r7
	bl OSi_CancelThreadAlarmForSleep
	ldr r0, _020D1E18 ; =0x021E167C
	ldr r1, _020D1E1C ; =OSi_ExitThread
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	ldreq r0, [r7, #0x94]
	subeq r2, r0, #4
	mov r0, r7
	bl OS_InitContext
	str r6, [r7, #4]
	ldr r1, [r7]
	mov r0, #1
	orr r1, r1, #0x80
	str r1, [r7]
	str r0, [r7, #0x64]
	bl OS_DisableScheduler
	mov r0, r7
	mov r1, r5
	bl OS_SetThreadPriority
	bl OS_EnableScheduler
	bl OSi_RescheduleThread
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020D1E18: .word 0x021E167C
_020D1E1C: .word OSi_ExitThread
	arm_func_end OS_KillThreadWithPriority

	arm_func_start OSi_CancelThreadAlarmForSleep
OSi_CancelThreadAlarmForSleep: ; 0x020D1E20
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #0xb0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl OS_CancelAlarm
	ldmia sp!, {r3, pc}
	arm_func_end OSi_CancelThreadAlarmForSleep

	arm_func_start OS_JoinThread
OS_JoinThread: ; 0x020D1E38
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	ldr r1, [r5, #0x64]
	mov r4, r0
	cmp r1, #2
	beq _020D1E5C
	add r0, r5, #0x9c
	bl OS_SleepThread
_020D1E5C:
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end OS_JoinThread

	arm_func_start OS_IsThreadTerminated
OS_IsThreadTerminated: ; 0x020D1E68
	ldr r0, [r0, #0x64]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end OS_IsThreadTerminated

	arm_func_start OS_SleepThread
OS_SleepThread: ; 0x020D1E7C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	bl OS_DisableInterrupts
	ldr r1, _020D1EC8 ; =0x021E167C
	mov r4, r0
	ldr r0, [r1, #8]
	cmp r6, #0
	ldr r5, [r0]
	beq _020D1EB0
	mov r0, r6
	mov r1, r5
	str r6, [r5, #0x78]
	bl OSi_InsertLinkToQueue
_020D1EB0:
	mov r0, #0
	str r0, [r5, #0x64]
	bl OSi_RescheduleThread
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D1EC8: .word 0x021E167C
	arm_func_end OS_SleepThread

	arm_func_start OS_WakeupThread
OS_WakeupThread: ; 0x020D1ECC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl OS_DisableInterrupts
	ldr r1, [r7]
	mov r6, r0
	cmp r1, #0
	beq _020D1F28
	beq _020D1F18
	mov r5, #1
	mov r4, #0
_020D1EF4:
	mov r0, r7
	bl OSi_RemoveLinkFromQueue
	str r5, [r0, #0x64]
	str r4, [r0, #0x78]
	str r4, [r0, #0x80]
	str r4, [r0, #0x7c]
	ldr r0, [r7]
	cmp r0, #0
	bne _020D1EF4
_020D1F18:
	mov r0, #0
	str r0, [r7, #4]
	str r0, [r7]
	bl OSi_RescheduleThread
_020D1F28:
	mov r0, r6
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end OS_WakeupThread

	arm_func_start OS_WakeupThreadDirect
OS_WakeupThreadDirect: ; 0x020D1F34
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	mov r1, #1
	mov r4, r0
	str r1, [r5, #0x64]
	bl OSi_RescheduleThread
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end OS_WakeupThreadDirect

	arm_func_start OS_SelectThread
OS_SelectThread: ; 0x020D1F5C
	ldr r0, _020D1F80 ; =0x021E167C
	ldr r0, [r0, #0x2c]
	b _020D1F6C
_020D1F68:
	ldr r0, [r0, #0x68]
_020D1F6C:
	cmp r0, #0
	ldrne r1, [r0, #0x64]
	cmpne r1, #1
	bne _020D1F68
	bx lr
	.align 2, 0
_020D1F80: .word 0x021E167C
	arm_func_end OS_SelectThread

	arm_func_start OS_RescheduleThread
OS_RescheduleThread: ; 0x020D1F84
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	mov r4, r0
	bl OSi_RescheduleThread
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	arm_func_end OS_RescheduleThread

	arm_func_start OS_YieldThread
OS_YieldThread: ; 0x020D1FA0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _020D2054 ; =0x021E167C
	mov r4, #0
	mov r5, r4
	mov r6, r4
	ldr r8, [r0, #0x28]
	bl OS_DisableInterrupts
	ldr r1, _020D2054 ; =0x021E167C
	mov r7, r0
	ldr r1, [r1, #0x2c]
	mov r0, r4
	cmp r1, #0
	beq _020D2000
	ldr r2, [r8, #0x70]
_020D1FD8:
	cmp r1, r8
	moveq r4, r0
	ldr r0, [r1, #0x70]
	cmp r2, r0
	moveq r5, r1
	mov r0, r1
	ldr r1, [r1, #0x68]
	addeq r6, r6, #1
	cmp r1, #0
	bne _020D1FD8
_020D2000:
	cmp r6, #1
	ble _020D2010
	cmp r5, r8
	bne _020D201C
_020D2010:
	mov r0, r7
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020D201C:
	cmp r4, #0
	ldrne r0, [r8, #0x68]
	strne r0, [r4, #0x68]
	bne _020D2038
	ldr r1, [r8, #0x68]
	ldr r0, _020D2054 ; =0x021E167C
	str r1, [r0, #0x2c]
_020D2038:
	ldr r0, [r5, #0x68]
	str r0, [r8, #0x68]
	str r8, [r5, #0x68]
	bl OSi_RescheduleThread
	mov r0, r7
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020D2054: .word 0x021E167C
	arm_func_end OS_YieldThread

	arm_func_start OS_SetThreadPriority
OS_SetThreadPriority: ; 0x020D2058
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _020D20F8 ; =0x021E167C
	mov r7, r0
	mov r6, r1
	ldr r8, [r2, #0x2c]
	mov r4, #0
	bl OS_DisableInterrupts
	mov r5, r0
	b _020D2084
_020D207C:
	mov r4, r8
	ldr r8, [r8, #0x68]
_020D2084:
	cmp r8, #0
	cmpne r8, r7
	bne _020D207C
	cmp r8, #0
	ldrne r0, _020D20FC ; =0x021E16B0
	cmpne r8, r0
	bne _020D20B0
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020D20B0:
	ldr r0, [r8, #0x70]
	cmp r0, r6
	beq _020D20E8
	cmp r4, #0
	ldrne r0, [r7, #0x68]
	strne r0, [r4, #0x68]
	bne _020D20D8
	ldr r1, [r7, #0x68]
	ldr r0, _020D20F8 ; =0x021E167C
	str r1, [r0, #0x2c]
_020D20D8:
	mov r0, r7
	str r6, [r7, #0x70]
	bl OSi_InsertThreadToList
	bl OSi_RescheduleThread
_020D20E8:
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020D20F8: .word 0x021E167C
_020D20FC: .word 0x021E16B0
	arm_func_end OS_SetThreadPriority

	arm_func_start OS_GetThreadPriority
OS_GetThreadPriority: ; 0x020D2100
	ldr r0, [r0, #0x70]
	bx lr
	arm_func_end OS_GetThreadPriority

	arm_func_start OS_Sleep
OS_Sleep: ; 0x020D2108
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x34
	mov r5, r0
	add r0, sp, #8
	bl OS_CreateAlarm
	ldr r0, _020D2198 ; =0x021E167C
	ldr r0, [r0, #8]
	ldr r0, [r0]
	str r0, [sp, #4]
	bl OS_DisableInterrupts
	ldr r1, _020D219C ; =0x000082EA
	mov r4, r0
	umull r0, ip, r5, r1
	mov r1, r0, lsr #6
	ldr r3, [sp, #4]
	add r0, sp, #8
	str r0, [r3, #0xb0]
	add r2, sp, #4
	str r2, [sp]
	ldr r3, _020D21A0 ; =OSi_SleepAlarmCallback
	mov r2, ip, lsr #6
	orr r1, r1, ip, lsl #26
	bl OS_SetAlarm
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020D2188
	mov r5, #0
_020D2174:
	mov r0, r5
	bl OS_SleepThread
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _020D2174
_020D2188:
	mov r0, r4
	bl OS_RestoreInterrupts
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020D2198: .word 0x021E167C
_020D219C: .word 0x000082EA
_020D21A0: .word OSi_SleepAlarmCallback
	arm_func_end OS_Sleep

	arm_func_start OSi_SleepAlarmCallback
OSi_SleepAlarmCallback: ; 0x020D21A4
	ldr r2, [r0]
	mov r1, #0
	str r1, [r0]
	ldr ip, _020D21C0 ; =OS_WakeupThreadDirect
	mov r0, r2
	str r1, [r2, #0xb0]
	bx ip
	.align 2, 0
_020D21C0: .word OS_WakeupThreadDirect
	arm_func_end OSi_SleepAlarmCallback

	arm_func_start OS_SetSwitchThreadCallback
OS_SetSwitchThreadCallback: ; 0x020D21C4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	ldr r1, _020D21E8 ; =0x021E167C
	ldr r4, [r1, #0x30]
	str r5, [r1, #0x30]
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020D21E8: .word 0x021E167C
	arm_func_end OS_SetSwitchThreadCallback

	arm_func_start OSi_IdleThreadProc
OSi_IdleThreadProc: ; 0x020D21EC
	stmdb sp!, {r3, lr}
	bl OS_EnableInterrupts
_020D21F4:
	bl OS_Halt
	b _020D21F4
	arm_func_end OSi_IdleThreadProc

	arm_func_start OS_DisableScheduler
OS_DisableScheduler: ; 0x020D21FC
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	ldr r2, _020D222C ; =0x021E167C
	mvn r1, #0
	ldr r3, [r2, #4]
	cmp r3, r1
	addlo r1, r3, #1
	movlo r4, r3
	strlo r1, [r2, #4]
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D222C: .word 0x021E167C
	arm_func_end OS_DisableScheduler

	arm_func_start OS_EnableScheduler
OS_EnableScheduler: ; 0x020D2230
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	ldr r1, _020D2260 ; =0x021E167C
	mov r4, #0
	ldr r3, [r1, #4]
	cmp r3, #0
	subne r2, r3, #1
	movne r4, r3
	strne r2, [r1, #4]
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D2260: .word 0x021E167C
	arm_func_end OS_EnableScheduler

	arm_func_start OS_SetThreadDestructor
OS_SetThreadDestructor: ; 0x020D2264
	str r1, [r0, #0xb4]
	bx lr
	arm_func_end OS_SetThreadDestructor
