	.include "asm/macros.inc"
	.include "global.inc"

	.text

	arm_func_start OSi_InsertLinkToQueue
OSi_InsertLinkToQueue: ; 0x037F8CE8
	ldr ip, [r0]
	b _037F8CFC
_037F8CF0:
	cmp ip, r1
	bxeq lr
	ldr ip, [ip, #0x64]
_037F8CFC:
	cmp ip, #0
	beq _037F8D14
	ldr r3, [ip, #0x54]
	ldr r2, [r1, #0x54]
	cmp r3, r2
	bls _037F8CF0
_037F8D14:
	cmp ip, #0
	bne _037F8D40
	ldr r2, [r0, #4]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x64]
	str r2, [r1, #0x60]
	mov r2, #0
	str r2, [r1, #0x64]
	str r1, [r0, #4]
	bx lr
_037F8D40:
	ldr r2, [ip, #0x60]
	cmp r2, #0
	streq r1, [r0]
	strne r1, [r2, #0x64]
	str r2, [r1, #0x60]
	str ip, [r1, #0x64]
	str r1, [ip, #0x60]
	bx lr
	arm_func_end OSi_InsertLinkToQueue

	arm_func_start OSi_RemoveSpecifiedLinkFromQueue
OSi_RemoveSpecifiedLinkFromQueue: ; 0x037F8D60
	stmdb sp!, {r3, lr}
	ldr lr, [r0]
	mov r2, lr
	b _037F8DA4
_037F8D70:
	ldr r3, [r2, #0x64]
	cmp r2, r1
	bne _037F8DA0
	ldr ip, [r2, #0x60]
	cmp lr, r2
	streq r3, [r0]
	strne r3, [ip, #0x64]
	ldr r1, [r0, #4]
	cmp r1, r2
	streq ip, [r0, #4]
	strne ip, [r3, #0x60]
	b _037F8DAC
_037F8DA0:
	mov r2, r3
_037F8DA4:
	cmp r2, #0
	bne _037F8D70
_037F8DAC:
	mov r0, r2
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end OSi_RemoveSpecifiedLinkFromQueue

	arm_func_start OSi_RemoveMutexLinkFromQueue
OSi_RemoveMutexLinkFromQueue: ; 0x037F8DB8
	ldr r2, [r0]
	cmp r2, #0
	beq _037F8DE0
	ldr r1, [r2, #0x10]
	str r1, [r0]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #0x14]
	moveq r1, #0
	streq r1, [r0, #4]
_037F8DE0:
	mov r0, r2
	bx lr
	arm_func_end OSi_RemoveMutexLinkFromQueue

	arm_func_start OSi_InsertThreadToList
OSi_InsertThreadToList: ; 0x037F8DE8
	stmdb sp!, {r3, lr}
	ldr r1, _037F8E44 ; =OSi_CurrentThreadPtr
	mov ip, #0
	ldr lr, [r1, #0x2c]
	mov r3, lr
	b _037F8E08
_037F8E00:
	mov ip, r3
	ldr r3, [r3, #0x4c]
_037F8E08:
	cmp r3, #0
	beq _037F8E20
	ldr r2, [r3, #0x54]
	ldr r1, [r0, #0x54]
	cmp r2, r1
	blo _037F8E00
_037F8E20:
	cmp ip, #0
	ldreq r1, _037F8E44 ; =OSi_CurrentThreadPtr
	streq lr, [r0, #0x4c]
	streq r0, [r1, #0x2c]
	ldrne r1, [ip, #0x4c]
	strne r1, [r0, #0x4c]
	strne r0, [ip, #0x4c]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037F8E44: .word OSi_CurrentThreadPtr
	arm_func_end OSi_InsertThreadToList

	arm_func_start OSi_RemoveThreadFromList
OSi_RemoveThreadFromList: ; 0x037F8E48
	ldr r1, _037F8E88 ; =OSi_CurrentThreadPtr
	mov r2, #0
	ldr r1, [r1, #0x2c]
	b _037F8E60
_037F8E58:
	mov r2, r1
	ldr r1, [r1, #0x4c]
_037F8E60:
	cmp r1, #0
	cmpne r1, r0
	bne _037F8E58
	cmp r2, #0
	ldreq r1, [r0, #0x4c]
	ldreq r0, _037F8E88 ; =OSi_CurrentThreadPtr
	streq r1, [r0, #0x2c]
	ldrne r0, [r0, #0x4c]
	strne r0, [r2, #0x4c]
	bx lr
	.align 2, 0
_037F8E88: .word OSi_CurrentThreadPtr
	arm_func_end OSi_RemoveThreadFromList

	arm_func_start OSi_RescheduleThread
OSi_RescheduleThread: ; 0x037F8E8C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _037F8F58 ; =OSi_CurrentThreadPtr
	ldr r1, [r0, #4]
	cmp r1, #0
	bne _037F8F50
	ldrh r0, [r0, #0x26]
	ldr r4, _037F8F5C ; =OSi_ThreadInfo
	cmp r0, #0
	bne _037F8EBC
	bl OS_GetProcMode
	cmp r0, #0x12
	bne _037F8EC8
_037F8EBC:
	mov r0, #1
	strh r0, [r4]
	b _037F8F50
_037F8EC8:
	ldr r0, _037F8F58 ; =OSi_CurrentThreadPtr
	ldr r0, [r0, #8]
	ldr r6, [r0]
	bl OS_SelectThread
	mov r5, r0
	cmp r6, r5
	cmpne r5, #0
	beq _037F8F50
	ldr r0, [r6, #0x48]
	cmp r0, #2
	beq _037F8F04
	mov r0, r6
	bl OS_SaveContext
	cmp r0, #0
	bne _037F8F50
_037F8F04:
	ldr r0, _037F8F58 ; =OSi_CurrentThreadPtr
	ldr r2, [r0]
	cmp r2, #0
	beq _037F8F24
	mov r0, r6
	mov r1, r5
	mov lr, pc
	bx r2
_037F8F24:
	ldr r2, [r4, #0xc]
	cmp r2, #0
	beq _037F8F40
	mov r0, r6
	mov r1, r5
	mov lr, pc
	bx r2
_037F8F40:
	ldr r1, _037F8F58 ; =OSi_CurrentThreadPtr
	mov r0, r5
	str r5, [r1, #0x28]
	bl OS_LoadContext
_037F8F50:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037F8F58: .word OSi_CurrentThreadPtr
_037F8F5C: .word OSi_ThreadInfo
	arm_func_end OSi_RescheduleThread

	arm_func_start OS_InitThread
OS_InitThread: ; 0x037F8F60
	stmdb sp!, {r3, lr}
	ldr r0, _037F9028 ; =OSi_CurrentThreadPtr
	ldr r1, [r0, #0xc]
	cmp r1, #0
	bne _037F9020
	ldr r2, _037F902C ; =0x03806C44
	mov r3, #1
	str r3, [r0, #0xc]
	str r2, [r0, #8]
	ldr r1, _037F9030 ; =0x03806CF4
	mov r2, #0x10
	str r2, [r1, #0x54]
	mov r2, #0
	str r2, [r1, #0x50]
	str r3, [r1, #0x48]
	str r2, [r1, #0x4c]
	str r2, [r1, #0x58]
	ldr r2, _037F9034 ; =0x00000400
	str r1, [r0, #0x2c]
	str r1, [r0, #0x28]
	cmp r2, #0
	ldrle r0, _037F9038 ; =sub_037F8000
	ldrgt r1, _037F903C ; =0x00000400
	ldrgt r0, _037F9040 ; =0x0380FF80
	subgt r0, r0, r1
	sub ip, r0, r2
	ldr r1, _037F903C ; =0x00000400
	ldr r0, _037F9040 ; =0x0380FF80
	ldr r2, _037F9030 ; =0x03806CF4
	sub r3, r0, r1
	str r3, [r2, #0x78]
	str ip, [r2, #0x74]
	mov r0, #0
	ldr r1, _037F9044 ; =0xD73BFDF7
	str r0, [r2, #0x7c]
	str r1, [r3, #-4]
	ldr r3, [r2, #0x74]
	ldr ip, _037F9048 ; =0xFBDD37BB
	ldr r1, _037F9028 ; =OSi_CurrentThreadPtr
	str ip, [r3]
	str r0, [r2, #0x84]
	str r0, [r2, #0x80]
	strh r0, [r1, #0x24]
	ldr r3, _037F904C ; =OSi_ThreadInfo
	ldr r2, _037F9050 ; =0x027FFFA4
	strh r0, [r1, #0x26]
	str r3, [r2]
	bl OS_SetSwitchThreadCallback
_037F9020:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037F9028: .word OSi_CurrentThreadPtr
_037F902C: .word 0x03806C44
_037F9030: .word 0x03806CF4
_037F9034: .word 0x00000400
_037F9038: .word sub_037F8000
_037F903C: .word 0x00000400
_037F9040: .word 0x0380FF80
_037F9044: .word 0xD73BFDF7
_037F9048: .word 0xFBDD37BB
_037F904C: .word OSi_ThreadInfo
_037F9050: .word 0x027FFFA4
	arm_func_end OS_InitThread

	arm_func_start OS_CreateThread
OS_CreateThread: ; 0x037F9054
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r5, r1
	mov r7, r2
	mov r6, r3
	bl OS_DisableInterrupts
	ldr r1, _037F914C ; =OSi_CurrentThreadPtr
	ldr r2, [sp, #0x1c]
	ldr r3, [r1, #0x20]
	mov r4, r0
	add r0, r3, #1
	str r0, [r1, #0x20]
	str r2, [r8, #0x54]
	str r0, [r8, #0x50]
	mov r1, #0
	str r1, [r8, #0x48]
	mov r0, r8
	str r1, [r8, #0x58]
	bl OSi_InsertThreadToList
	ldr r0, [sp, #0x18]
	mov r1, r5
	str r6, [r8, #0x78]
	sub r5, r6, r0
	sub r2, r6, #4
	str r5, [r8, #0x74]
	mov ip, #0
	str ip, [r8, #0x7c]
	ldr r6, _037F9150 ; =0xD73BFDF7
	ldr r0, [r8, #0x78]
	ldr r3, _037F9154 ; =0xFBDD37BB
	str r6, [r0, #-4]
	ldr r0, [r8, #0x74]
	str r3, [r0]
	str ip, [r8, #0x84]
	mov r0, r8
	str ip, [r8, #0x80]
	bl OS_InitContext
	ldr r2, _037F9158 ; =OS_ExitThread
	str r7, [r8, #4]
	str r2, [r8, #0x3c]
	ldr r2, [sp, #0x18]
	add r1, r5, #4
	mov r0, #0
	sub r2, r2, #8
	bl MI_CpuClear32
	mov r0, #0
	str r0, [r8, #0x68]
	str r0, [r8, #0x6c]
	str r0, [r8, #0x70]
	str r0, [r8, #0x98]
	str r0, [r8, #0x5c]
	str r0, [r8, #0x64]
	str r0, [r8, #0x60]
	add r1, r8, #0x88
	mov r2, #0xc
	bl MI_CpuClear32
	mov r1, #0
	mov r0, r4
	str r1, [r8, #0x94]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037F914C: .word OSi_CurrentThreadPtr
_037F9150: .word 0xD73BFDF7
_037F9154: .word 0xFBDD37BB
_037F9158: .word OS_ExitThread
	arm_func_end OS_CreateThread

	arm_func_start OS_ExitThread
OS_ExitThread: ; 0x037F915C
	stmdb sp!, {r3, lr}
	bl OS_DisableInterrupts
	ldr r0, _037F917C ; =OSi_CurrentThreadPtr
	mov r1, #0
	ldr r0, [r0, #0x28]
	bl OSi_ExitThread_ArgSpecified
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037F917C: .word OSi_CurrentThreadPtr
	arm_func_end OS_ExitThread

	arm_func_start OSi_ExitThread_ArgSpecified
OSi_ExitThread_ArgSpecified: ; 0x037F9180
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _037F91D8 ; =OSi_CurrentThreadPtr
	mov r5, r0
	ldr r2, [r2, #0x1c]
	mov r4, r1
	cmp r2, #0
	beq _037F91C8
	ldr r1, _037F91DC ; =OSi_ExitThread
	bl OS_InitContext
	str r4, [r5, #4]
	ldr r1, [r5]
	mov r0, r5
	orr r1, r1, #0x80
	str r1, [r5]
	mov r1, #1
	str r1, [r5, #0x48]
	bl OS_LoadContext
	b _037F91D0
_037F91C8:
	mov r0, r4
	bl OSi_ExitThread
_037F91D0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F91D8: .word OSi_CurrentThreadPtr
_037F91DC: .word OSi_ExitThread
	arm_func_end OSi_ExitThread_ArgSpecified

	arm_func_start OSi_ExitThread
OSi_ExitThread: ; 0x037F91E0
	stmdb sp!, {r3, lr}
	ldr r1, _037F921C ; =OSi_CurrentThreadPtr
	ldr r1, [r1, #8]
	ldr r3, [r1]
	ldr r2, [r3, #0x98]
	cmp r2, #0
	beq _037F9210
	mov r1, #0
	str r1, [r3, #0x98]
	mov lr, pc
	bx r2
	arm_func_end OSi_ExitThread

; DIFFERENT!!
	arm_func_start sub_037F920C
sub_037F920C: ; 0x037F920C
	bl OS_DisableInterrupts
_037F9210:
	bl OSi_ExitThread_Destroy
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037F921C: .word OSi_CurrentThreadPtr
	arm_func_end sub_037F920C
; DIFFERENT!!

	arm_func_start OSi_ExitThread_Destroy
OSi_ExitThread_Destroy: ; 0x037F9220
	stmdb sp!, {r4, lr}
	ldr r0, _037F928C ; =OSi_CurrentThreadPtr
	ldr r0, [r0, #8]
	ldr r4, [r0]
	bl OS_DisableScheduler
	mov r0, r4
	bl OSi_UnlockAllMutex
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	beq _037F9250
	mov r1, r4
	bl OSi_RemoveSpecifiedLinkFromQueue
_037F9250:
	mov r0, r4
	bl OSi_RemoveThreadFromList
	mov r1, #2
	add r0, r4, #0x80
	str r1, [r4, #0x48]
	bl OS_WakeupThread
	bl OS_EnableScheduler
	bl OS_DisableInterrupts
	mov r4, r0
	bl OSi_RescheduleThread
	mov r0, r4
	bl OS_RestoreInterrupts
	bl OS_Terminate
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F928C: .word OSi_CurrentThreadPtr
	arm_func_end OSi_ExitThread_Destroy

	arm_func_start OS_JoinThread
OS_JoinThread: ; 0x037F9290
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	ldr r1, [r5, #0x48]
	mov r4, r0
	cmp r1, #2
	beq _037F92B4
	add r0, r5, #0x80
	bl OS_SleepThread
_037F92B4:
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end OS_JoinThread

	arm_func_start OS_IsThreadTerminated
OS_IsThreadTerminated: ; 0x037F92C4
	ldr r0, [r0, #0x48]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end OS_IsThreadTerminated

	arm_func_start OS_SleepThread
OS_SleepThread: ; 0x037F92D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	bl OS_DisableInterrupts
	ldr r1, _037F9328 ; =OSi_CurrentThreadPtr
	mov r4, r0
	ldr r0, [r1, #8]
	cmp r6, #0
	ldr r5, [r0]
	beq _037F930C
	mov r0, r6
	mov r1, r5
	str r6, [r5, #0x5c]
	bl OSi_InsertLinkToQueue
_037F930C:
	mov r0, #0
	str r0, [r5, #0x48]
	bl OSi_RescheduleThread
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037F9328: .word OSi_CurrentThreadPtr
	arm_func_end OS_SleepThread

	arm_func_start OS_WakeupThread
OS_WakeupThread: ; 0x037F932C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	ldr r1, [r5]
	mov r4, r0
	cmp r1, #0
	beq _037F93A4
	mov r2, #0
	mov r3, r2
	mov r1, #1
	mov r0, r2
	b _037F9388
_037F935C:
	beq _037F9378
	ldr ip, [lr, #0x64]
	str ip, [r5]
	cmp ip, #0
	strne r3, [ip, #0x60]
	streq r2, [r5, #4]
	streq r2, [lr, #0x5c]
_037F9378:
	str r1, [lr, #0x48]
	str r0, [lr, #0x5c]
	str r0, [lr, #0x64]
	str r0, [lr, #0x60]
_037F9388:
	ldr lr, [r5]
	cmp lr, #0
	bne _037F935C
	mov r0, #0
	str r0, [r5, #4]
	str r0, [r5]
	bl OSi_RescheduleThread
_037F93A4:
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end OS_WakeupThread

	arm_func_start OS_WakeupThreadDirect
OS_WakeupThreadDirect: ; 0x037F93B4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	mov r1, #1
	mov r4, r0
	str r1, [r5, #0x48]
	bl OSi_RescheduleThread
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end OS_WakeupThreadDirect

	arm_func_start OS_SelectThread
OS_SelectThread: ; 0x037F93E0
	ldr r0, _037F9404 ; =OSi_CurrentThreadPtr
	ldr r0, [r0, #0x2c]
	b _037F93F0
_037F93EC:
	ldr r0, [r0, #0x4c]
_037F93F0:
	cmp r0, #0
	ldrne r1, [r0, #0x48]
	cmpne r1, #1
	bne _037F93EC
	bx lr
	.align 2, 0
_037F9404: .word OSi_CurrentThreadPtr
	arm_func_end OS_SelectThread

	arm_func_start OS_SetThreadPriority
OS_SetThreadPriority: ; 0x037F9408
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, _037F94A8 ; =OSi_CurrentThreadPtr
	mov r7, r0
	ldr r8, [r2, #0x2c]
	mov r6, r1
	mov r4, #0
	bl OS_DisableInterrupts
	mov r5, r0
	b _037F9434
_037F942C:
	mov r4, r8
	ldr r8, [r8, #0x4c]
_037F9434:
	cmp r8, #0
	cmpne r8, r7
	bne _037F942C
	cmp r8, #0
	ldrne r0, _037F94AC ; =0x03806C50
	cmpne r8, r0
	bne _037F9460
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	b _037F94A0
_037F9460:
	ldr r0, [r8, #0x54]
	cmp r0, r6
	beq _037F9494
	cmp r4, #0
	ldreq r1, [r7, #0x4c]
	ldreq r0, _037F94A8 ; =OSi_CurrentThreadPtr
	streq r1, [r0, #0x2c]
	ldrne r0, [r7, #0x4c]
	strne r0, [r4, #0x4c]
	mov r0, r7
	str r6, [r7, #0x54]
	bl OSi_InsertThreadToList
	bl OSi_RescheduleThread
_037F9494:
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #1
_037F94A0:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037F94A8: .word OSi_CurrentThreadPtr
_037F94AC: .word 0x03806C50
	arm_func_end OS_SetThreadPriority

	arm_func_start OS_Sleep
OS_Sleep: ; 0x037F94B0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x34
	mov r5, r0
	add r0, sp, #8
	bl OS_CreateAlarm
	ldr r0, _037F953C ; =OSi_CurrentThreadPtr
	ldr r0, [r0, #8]
	ldr r0, [r0]
	str r0, [sp, #4]
	bl OS_DisableInterrupts
	ldr r1, _037F9540 ; =0x000082EA
	mov r4, r0
	umull r0, ip, r5, r1
	mov r1, r0, lsr #6
	ldr r3, [sp, #4]
	add r0, sp, #8
	str r0, [r3, #0x94]
	add r2, sp, #4
	str r2, [sp]
	ldr r3, _037F9544 ; =OSi_SleepAlarmCallback
	mov r2, ip, lsr #6
	orr r1, r1, ip, lsl #26
	bl OS_SetAlarm
	mov r5, #0
	b _037F951C
_037F9514:
	mov r0, r5
	bl OS_SleepThread
_037F951C:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _037F9514
	mov r0, r4
	bl OS_RestoreInterrupts
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, lr}
	bx lr
	.align 2, 0
_037F953C: .word OSi_CurrentThreadPtr
_037F9540: .word 0x000082EA
_037F9544: .word OSi_SleepAlarmCallback
	arm_func_end OS_Sleep

	arm_func_start OSi_SleepAlarmCallback
OSi_SleepAlarmCallback: ; 0x037F9548
	ldr r2, [r0]
	mov r1, #0
	str r1, [r0]
	ldr ip, _037F9564 ; =OS_WakeupThreadDirect
	mov r0, r2
	str r1, [r2, #0x94]
	bx ip
	.align 2, 0
_037F9564: .word OS_WakeupThreadDirect
	arm_func_end OSi_SleepAlarmCallback

	arm_func_start OS_SetSwitchThreadCallback
OS_SetSwitchThreadCallback: ; 0x037F9568
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	ldr r1, _037F9590 ; =OSi_CurrentThreadPtr
	ldr r4, [r1, #0x30]
	str r5, [r1, #0x30]
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F9590: .word OSi_CurrentThreadPtr
	arm_func_end OS_SetSwitchThreadCallback

	arm_func_start OS_DisableScheduler
OS_DisableScheduler: ; 0x037F9594
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	ldr r2, _037F95C8 ; =OSi_CurrentThreadPtr
	mvn r1, #0
	ldr r3, [r2, #4]
	cmp r3, r1
	addlo r1, r3, #1
	strlo r1, [r2, #4]
	movlo r4, r3
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F95C8: .word OSi_CurrentThreadPtr
	arm_func_end OS_DisableScheduler

	arm_func_start OS_EnableScheduler
OS_EnableScheduler: ; 0x037F95CC
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	ldr r1, _037F9600 ; =OSi_CurrentThreadPtr
	mov r4, #0
	ldr r3, [r1, #4]
	cmp r3, #0
	subne r2, r3, #1
	strne r2, [r1, #4]
	movne r4, r3
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F9600: .word OSi_CurrentThreadPtr
	arm_func_end OS_EnableScheduler
