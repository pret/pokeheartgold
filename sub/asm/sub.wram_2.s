	.include "asm/macros.inc"
	.include "global.inc"

	.public WMSP_CancelVAlarm
	.public WMSP_CancelAllAlarms
	.public WMSP_GetRequestThread
	.public WL_Terminate
	.public WMSP_GetIndicateThread
	.public WMSP_Init
	.public OS_IRQTable
	.public wmspW

	.text

	arm_func_start SPI_Init
SPI_Init: ; 0x03800920
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r1, _03800A20 ; =spiInitialized
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _03800A14
	ldr r0, _03800A24 ; =spiWork
	mov r2, #0
	str r2, [r0]
	mov r3, #1
	mov r2, #5
	strh r3, [r1]
	str r2, [r0, #4]
	bl TP_Init
	bl NVRAM_Init
	bl MIC_Init
	bl PM_Init
	bl PXI_Init
	ldr r1, _03800A28 ; =SpiPxiCallback
	mov r0, #6
	bl PXI_SetFifoRecvCallback
	ldr r1, _03800A28 ; =SpiPxiCallback
	mov r0, #9
	bl PXI_SetFifoRecvCallback
	ldr r1, _03800A28 ; =SpiPxiCallback
	mov r0, #8
	bl PXI_SetFifoRecvCallback
	ldr r1, _03800A28 ; =SpiPxiCallback
	mov r0, #4
	bl PXI_SetFifoRecvCallback
	ldr r0, _03800A2C ; =spiWork + 0x2AC
	ldr r1, _03800A30 ; =spiWork + 0x2CC
	mov r2, #0x10
	bl OS_InitMessageQueue
	mov sb, #0
	mov r6, #0x18
	ldr r8, _03800A34 ; =spiWork + 0x30C
	mov r7, sb
	mov r5, r6
_038009C0:
	mla r0, sb, r5, r8
	mov r1, r7
	mov r2, r6
	bl MI_CpuFill8
	add sb, sb, #1
	cmp sb, #0x10
	blt _038009C0
	ldr r0, _03800A24 ; =spiWork
	mov r2, #0
	str r2, [r0, #0x48c]
	str r2, [r0, #0x494]
	str r2, [r0, #0x490]
	mov r0, #0x200
	str r0, [sp]
	ldr r0, _03800A38 ; =spiWork + 0x8
	ldr r1, _03800A3C ; =SpiCommonThread
	ldr r3, _03800A2C ; =spiWork + 0x2AC
	str r4, [sp, #4]
	bl OS_CreateThread
	ldr r0, _03800A38 ; =spiWork + 0x8
	bl OS_WakeupThreadDirect
_03800A14:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_03800A20: .word spiInitialized
_03800A24: .word spiWork
_03800A28: .word SpiPxiCallback
_03800A2C: .word spiWork + 0x2AC
_03800A30: .word spiWork + 0x2CC
_03800A34: .word spiWork + 0x30C
_03800A38: .word spiWork + 0x8
_03800A3C: .word SpiCommonThread
	arm_func_end SPI_Init

	arm_func_start SPI_Lock
SPI_Lock: ; 0x03800A40
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _03800A94 ; =spiWork + 0x490
	ldr r4, _03800A98 ; =spiWork
	mov r6, r0
_03800A50:
	bl OS_DisableInterrupts
	ldr r1, [r4]
	cmp r1, #0
	beq _03800A70
	bl OS_RestoreInterrupts
	mov r0, r5
	bl OS_SleepThread
	b _03800A50
_03800A70:
	ldr r1, _03800A98 ; =spiWork
	mov r2, #1
	str r2, [r1]
	mov r2, #4
	str r2, [r1, #4]
	str r6, [r1, #0x498]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_03800A94: .word spiWork + 0x490
_03800A98: .word spiWork
	arm_func_end SPI_Lock

	arm_func_start SPI_Unlock
SPI_Unlock: ; 0x03800A9C
	stmdb sp!, {r3, lr}
	ldr r1, _03800AF4 ; =spiWork
	ldr r2, [r1]
	cmp r2, #0
	beq _03800AEC
	ldr r2, [r1, #4]
	cmp r2, #4
	ldreq r1, [r1, #0x498]
	cmpeq r1, r0
	bne _03800AEC
	bl OS_DisableInterrupts
	ldr r1, _03800AF4 ; =spiWork
	mov r2, #5
	str r2, [r1, #4]
	mov r2, #0
	str r2, [r1]
	str r2, [r1, #0x498]
	bl OS_RestoreInterrupts
	ldr r0, _03800AF8 ; =spiWork + 0x490
	bl OS_WakeupThread
_03800AEC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03800AF4: .word spiWork
_03800AF8: .word spiWork + 0x490
	arm_func_end SPI_Unlock

	arm_func_start SPIi_ReturnResult
SPIi_ReturnResult: ; 0x03800AFC
	stmdb sp!, {r4, r5, r6, lr}
	and r2, r0, #0x70
	cmp r2, #0x30
	bgt _03800B34
	bge _03800B80
	cmp r2, #0x10
	bgt _03800B28
	bge _03800B68
	cmp r2, #0
	beq _03800B68
	b _03800B84
_03800B28:
	cmp r2, #0x20
	beq _03800B80
	b _03800B84
_03800B34:
	cmp r2, #0x50
	bgt _03800B4C
	bge _03800B70
	cmp r2, #0x40
	beq _03800B70
	b _03800B84
_03800B4C:
	cmp r2, #0x60
	bgt _03800B5C
	beq _03800B78
	b _03800B84
_03800B5C:
	cmp r2, #0x70
	beq _03800B78
	b _03800B84
_03800B68:
	mov r4, #6
	b _03800B84
_03800B70:
	mov r4, #9
	b _03800B84
_03800B78:
	mov r4, #8
	b _03800B84
_03800B80:
	mov r4, #4
_03800B84:
	and r0, r0, #0xff
	orr r0, r0, #0x80
	mov r0, r0, lsl #8
	orr r2, r0, #0x3000000
	and r0, r1, #0xff
	orr r6, r2, r0
	mov r5, #0
_03800BA0:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _03800BA0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end SPIi_ReturnResult

	arm_func_start SPIi_CheckException
SPIi_CheckException: ; 0x03800BC0
	ldr r0, _03800BD8 ; =spiWork
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_03800BD8: .word spiWork
	arm_func_end SPIi_CheckException

	arm_func_start SPIi_GetException
SPIi_GetException: ; 0x03800BDC
	ldr r1, _03800BF0 ; =spiWork
	mov r2, #1
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_03800BF0: .word spiWork
	arm_func_end SPIi_GetException

	arm_func_start SPIi_ReleaseException
SPIi_ReleaseException: ; 0x03800BF4
	stmdb sp!, {r3, lr}
	ldr r1, _03800C28 ; =spiWork
	ldr r2, [r1, #4]
	cmp r2, r0
	bne _03800C20
	ldr r0, _03800C2C ; =spiWork + 0x490
	mov r2, #5
	str r2, [r1, #4]
	mov r2, #0
	str r2, [r1]
	bl OS_WakeupThread
_03800C20:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03800C28: .word spiWork
_03800C2C: .word spiWork + 0x490
	arm_func_end SPIi_ReleaseException

	arm_func_start SPIi_SetEntry
SPIi_SetEntry: ; 0x03800C30
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	ldrh r2, [sp, #0x18]
	mov r5, r0
	cmp r2, #4
	mov r4, r1
	movhi r0, #0
	bhi _03800CEC
	bl OS_DisableInterrupts
	ldr ip, _03800CF8 ; =spiWork
	add r2, sp, #0x18
	ldr r3, [ip, #0x48c]
	mov r1, #0x18
	mul r6, r3, r1
	ldr lr, _03800CFC ; =spiWork + 0x30C
	ldr r3, _03800D00 ; =spiWork + 0x310
	str r5, [lr, r6]
	ldr r5, [ip, #0x48c]
	bic r2, r2, #3
	mul lr, r5, r1
	add r5, r2, #4
	ldrh r1, [sp, #0x18]
	str r4, [r3, lr]
	mov r6, #0
	mov r2, #0x18
	b _03800CB4
_03800C98:
	ldr r4, [ip, #0x48c]
	add r5, r5, #4
	mla r3, r4, r2, ip
	add r3, r3, r6, lsl #2
	ldr r4, [r5, #-4]
	add r6, r6, #1
	str r4, [r3, #0x314]
_03800CB4:
	cmp r6, r1
	blt _03800C98
	ldr r1, _03800CF8 ; =spiWork
	ldr r4, [r1, #0x48c]
	add r2, r4, #1
	and r2, r2, #0xf
	str r2, [r1, #0x48c]
	bl OS_RestoreInterrupts
	ldr r1, _03800CFC ; =spiWork + 0x30C
	mov r0, #0x18
	mla r1, r4, r0, r1
	ldr r0, _03800D04 ; =spiWork + 0x2AC
	mov r2, #0
	bl OS_SendMessage
_03800CEC:
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_03800CF8: .word spiWork
_03800CFC: .word spiWork + 0x30C
_03800D00: .word spiWork + 0x310
_03800D04: .word spiWork + 0x2AC
	arm_func_end SPIi_SetEntry

	arm_func_start SPIi_CheckEntry
SPIi_CheckEntry: ; 0x03800D08
	stmdb sp!, {r3, lr}
	ldr r0, _03800D24 ; =spiWork + 0x2AC
	add r1, sp, #0
	mov r2, #0
	bl OS_ReadMessage
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03800D24: .word spiWork + 0x2AC
	arm_func_end SPIi_CheckEntry

	arm_func_start SpiCommonThread
SpiCommonThread: ; 0x03800D28
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r6, _03800D90 ; =spiWork + 0x2AC
	add r5, sp, #0
	mov r4, #1
_03800D3C:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl OS_ReceiveMessage
	ldr r0, [sp]
	ldr r1, [r0]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _03800D3C
_03800D60: ; jump table
	b _03800D70 ; case 0
	b _03800D88 ; case 1
	b _03800D78 ; case 2
	b _03800D80 ; case 3
_03800D70:
	bl TP_ExecuteProcess
	b _03800D3C
_03800D78:
	bl MIC_ExecuteProcess
	b _03800D3C
_03800D80:
	bl PM_ExecuteProcess
	b _03800D3C
_03800D88:
	bl NVRAM_ExecuteProcess
	b _03800D3C
	.align 2, 0
_03800D90: .word spiWork + 0x2AC
	arm_func_end SpiCommonThread

	arm_func_start SpiPxiCallback
SpiPxiCallback: ; 0x03800D94
	stmdb sp!, {r3, lr}
	cmp r2, #0
	bne _03800DF4
	sub r0, r0, #4
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _03800DF4
_03800DB0: ; jump table
	b _03800DEC ; case 0
	b _03800DF4 ; case 1
	b _03800DC8 ; case 2
	b _03800DF4 ; case 3
	b _03800DE0 ; case 4
	b _03800DD4 ; case 5
_03800DC8:
	mov r0, r1
	bl TP_AnalyzeCommand
	b _03800DF4
_03800DD4:
	mov r0, r1
	bl MIC_AnalyzeCommand
	b _03800DF4
_03800DE0:
	mov r0, r1
	bl PM_AnalyzeCommand
	b _03800DF4
_03800DEC:
	mov r0, r1
	bl NVRAM_AnalyzeCommand
_03800DF4:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end SpiPxiCallback

	arm_func_start TP_Init
TP_Init: ; 0x03800DFC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _03800EC4 ; =tpw
	mov r3, #0
	str r3, [r0, #0x20]
	mov r1, #0x14
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	mov r2, r3
_03800E1C:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _03800E1C
	bl OS_IsVAlarmAvailable
	cmp r0, #0
	bne _03800E40
	bl OS_InitVAlarm
_03800E40:
	ldr r7, _03800EC8 ; =tpw + 0x2C
	ldr r5, _03800ECC ; =0x54505641
	mov r8, #0
	mov r4, #0x28
_03800E50:
	mul r6, r8, r4
	add r0, r7, r6
	bl OS_CreateVAlarm
	mov r1, r5
	add r0, r7, r6
	bl OS_SetVAlarmTag
	add r8, r8, #1
	cmp r8, #4
	blt _03800E50
	ldr r2, _03800ED0 ; =0x040001C0
_03800E78:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03800E78
	ldr r1, _03800ED4 ; =0x00008A01
	ldr r0, _03800ED8 ; =0x040001C2
	strh r1, [r2]
	mov r1, #0x84
	strh r1, [r0]
	sub r1, r0, #2
_03800E9C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03800E9C
	bl SPI_DummyWait_03800EE0
	ldr r1, _03800EDC ; =0x00008201
	ldr r0, _03800ED0 ; =0x040001C0
	strh r1, [r0]
	bl SPI_DummyWait_03800EE0
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_03800EC4: .word tpw
_03800EC8: .word tpw + 0x2C
_03800ECC: .word 0x54505641
_03800ED0: .word 0x040001C0
_03800ED4: .word 0x00008A01
_03800ED8: .word 0x040001C2
_03800EDC: .word 0x00008201
	arm_func_end TP_Init

	arm_func_start SPI_DummyWait_03800EE0
SPI_DummyWait_03800EE0: ; 0x03800EE0
	ldr r0, _03800F00 ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_03800EF0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03800EF0
	bx lr
	.align 2, 0
_03800F00: .word 0x040001C2
	arm_func_end SPI_DummyWait_03800EE0

	arm_func_start TP_AnalyzeCommand
TP_AnalyzeCommand: ; 0x03800F04
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	tst r0, #0x2000000
	beq _03800F34
	ldr r1, _038010DC ; =tpw
	mov r4, #0
	mov r3, r4
_03800F20:
	mov r2, r4, lsl #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _03800F20
_03800F34:
	ldr r2, _038010DC ; =tpw
	and r1, r0, #0xf0000
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #1
	strh r0, [r2, r1]
	tst r0, #0x1000000
	beq _038010D0
	ldrh r1, [r2]
	and r0, r1, #0xff00
	mov r0, r0, lsl #8
	mov r4, r0, lsr #0x10
	cmp r4, #3
	addls pc, pc, r4, lsl #2
	b _038010C4
_03800F6C: ; jump table
	b _03800FB0 ; case 0
	b _03800FD8 ; case 1
	b _03801074 ; case 2
	b _03800F7C ; case 3
_03800F7C:
	and r0, r1, #0xff
	mov r0, r0, lsl #0x10
	movs r3, r0, lsr #0x10
	mov r0, #3
	bne _03800F9C
	mov r1, #2
	bl SPIi_ReturnResult
	b _038010D0
_03800F9C:
	str r3, [r2, #0x24]
	mov r1, #0
	str r3, [r2, #0x28]
	bl SPIi_ReturnResult
	b _038010D0
_03800FB0:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SPIi_SetEntry
	cmp r0, #0
	bne _038010D0
	mov r0, r4
	mov r1, #4
	bl SPIi_ReturnResult
	b _038010D0
_03800FD8:
	ldr r0, [r2, #0x20]
	cmp r0, #0
	beq _03800FF4
	mov r0, r4
	mov r1, #3
	bl SPIi_ReturnResult
	b _038010D0
_03800FF4:
	and r0, r1, #0xff
	mov r0, r0, lsl #0x10
	movs r3, r0, lsr #0x10
	beq _0380100C
	cmp r3, #4
	bls _0380101C
_0380100C:
	mov r0, r4
	mov r1, #2
	bl SPIi_ReturnResult
	b _038010D0
_0380101C:
	ldrh ip, [r2, #2]
	ldr r0, _038010E0 ; =0x00000107
	cmp ip, r0
	blo _0380103C
	mov r0, r4
	mov r1, #2
	bl SPIi_ReturnResult
	b _038010D0
_0380103C:
	mov r1, r4
	mov r0, #0
	mov r2, #2
	str ip, [sp]
	bl SPIi_SetEntry
	cmp r0, #0
	ldrne r0, _038010DC ; =tpw
	movne r1, #1
	strne r1, [r0, #0x20]
	bne _038010D0
	mov r0, r4
	mov r1, #4
	bl SPIi_ReturnResult
	b _038010D0
_03801074:
	ldr r0, [r2, #0x20]
	cmp r0, #2
	beq _03801090
	mov r0, r4
	mov r1, #3
	bl SPIi_ReturnResult
	b _038010D0
_03801090:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl SPIi_SetEntry
	cmp r0, #0
	ldrne r0, _038010DC ; =tpw
	movne r1, #3
	strne r1, [r0, #0x20]
	bne _038010D0
	mov r0, r4
	mov r1, #4
	bl SPIi_ReturnResult
	b _038010D0
_038010C4:
	mov r0, r4
	mov r1, #1
	bl SPIi_ReturnResult
_038010D0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_038010DC: .word tpw
_038010E0: .word 0x00000107
	arm_func_end TP_AnalyzeCommand

	arm_func_start TP_ExecuteProcess
TP_ExecuteProcess: ; 0x038010E4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	ldr r1, [sl, #4]
	cmp r1, #2
	bhi _03801118
	cmp r1, #0
	beq _03801130
	cmp r1, #1
	beq _038012A4
	cmp r1, #2
	beq _03801368
	b _038013B4
_03801118:
	cmp r1, #0x10
	bne _038013B4
	ldr r0, _038013C0 ; =tpw
	ldr r0, [r0, #0x20]
	cmp r0, #2
	bne _038013B4
_03801130:
	bl OS_DisableInterrupts
	mov r4, r0
	mov r0, #0
	bl SPIi_CheckException
	cmp r0, #0
	bne _03801168
	mov r0, r4
	bl OS_RestoreInterrupts
	ldr r0, [sl, #4]
	mov r1, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	b _038013B4
_03801168:
	mov r0, #0
	bl SPIi_GetException
	mov r0, r4
	bl OS_RestoreInterrupts
	ldr r1, _038013C0 ; =tpw
	add r0, sp, #8
	ldr r1, [r1, #0x24]
	add r2, sp, #4
	bl TP_ExecSampling
	ldr r0, [sp, #8]
	ldrh r2, [sp, #4]
	mov r1, r0, lsl #7
	movs r1, r1, lsr #0x1f
	ldreq r0, _038013C4 ; =valid_cnt$3731
	moveq r1, #0
	streqb r1, [r0, #1]
	streqb r1, [r0]
	beq _03801250
	mov r0, r0, lsl #5
	movs r0, r0, lsr #0x1e
	beq _038011FC
	ldr r1, _038013C4 ; =valid_cnt$3731
	mov r3, #0
	strb r3, [r1]
	ldrb r0, [r1, #1]
	add r2, r0, #1
	and r0, r2, #0xff
	strb r2, [r1, #1]
	cmp r0, #4
	blo _03801250
	ldr r0, _038013C0 ; =tpw
	strb r3, [r1, #1]
	ldr r1, [r0, #0x24]
	cmp r1, #0x23
	addlt r1, r1, #1
	strlt r1, [r0, #0x24]
	b _03801250
_038011FC:
	ldr r0, _038013C0 ; =tpw
	ldr r1, _038013C4 ; =valid_cnt$3731
	ldr r4, [r0, #0x24]
	mov r5, #0
	strb r5, [r1, #1]
	cmp r2, r4, asr #1
	strgeb r5, [r1]
	bge _03801250
	ldrb r2, [r1]
	add r3, r2, #1
	and r2, r3, #0xff
	strb r3, [r1]
	cmp r2, #4
	blo _03801250
	strb r5, [r1]
	ldr r2, [r0, #0x28]
	cmp r4, r2
	subgt r3, r4, #1
	movgt r2, #3
	strgt r3, [r0, #0x24]
	strgtb r2, [r1, #1]
_03801250:
	ldrh r0, [sp, #8]
	ldr r1, _038013C8 ; =0x027FFFAA
	strh r0, [r1]
	ldrh r0, [sp, #0xa]
	strh r0, [r1, #2]
	ldr r0, [sl, #4]
	cmp r0, #0
	bne _03801284
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl SPIi_ReturnResult
	b _03801298
_03801284:
	ldr r1, [sl, #8]
	mov r0, r0, lsl #0x10
	and r1, r1, #0xff
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
_03801298:
	mov r0, #0
	bl SPIi_ReleaseException
	b _038013B4
_038012A4:
	ldr r6, _038013C0 ; =tpw
	ldr r0, [r6, #0x20]
	cmp r0, #1
	bne _03801354
	ldr r8, _038013CC ; =0x00000107
	ldr r5, _038013D0 ; =tpw + 0x2C
	mov sb, #0
	mov r7, #0xd7
	mov fp, #0xa
	mov r4, #0x28
	b _03801324
_038012D0:
	mul r0, sb, r8
	bl _u32_div_f
	ldr r2, [sl, #0xc]
	mov r1, r8
	add r0, r2, r0
	bl _u32_div_f
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #0xc8
	blo _03801300
	cmp r0, #0xd7
	movlo r0, r7
_03801300:
	add r1, r6, sb, lsl #1
	strh r0, [r1, #0xcc]
	str sb, [sp]
	mla r0, sb, r4, r5
	ldrsh r1, [r1, #0xcc]
	ldr r3, _038013D4 ; =TpVAlarmHandler
	mov r2, fp
	bl OS_SetPeriodicVAlarm
	add sb, sb, #1
_03801324:
	ldr r1, [sl, #8]
	cmp sb, r1
	blo _038012D0
	ldr r0, [sl, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	ldr r0, _038013C0 ; =tpw
	mov r1, #2
	str r1, [r0, #0x20]
	b _038013B4
_03801354:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #3
	bl SPIi_ReturnResult
	b _038013B4
_03801368:
	ldr r0, _038013C0 ; =tpw
	ldr r0, [r0, #0x20]
	cmp r0, #3
	bne _038013A4
	ldr r0, _038013D8 ; =0x54505641
	bl OS_CancelVAlarms
	ldr r0, [sl, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	ldr r0, _038013C0 ; =tpw
	mov r1, #0
	str r1, [r0, #0x20]
	b _038013B4
_038013A4:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #3
	bl SPIi_ReturnResult
_038013B4:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_038013C0: .word tpw
_038013C4: .word valid_cnt$3731
_038013C8: .word 0x027FFFAA
_038013CC: .word 0x00000107
_038013D0: .word tpw + 0x2C
_038013D4: .word TpVAlarmHandler
_038013D8: .word 0x54505641
	arm_func_end TP_ExecuteProcess

	arm_func_start TpVAlarmHandler
TpVAlarmHandler: ; 0x038013DC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r3, r4
	mov r0, #0
	mov r1, #0x10
	mov r2, #1
	bl SPIi_SetEntry
	cmp r0, #0
	bne _03801434
	ldr r0, [sp]
	ldr r3, _03801440 ; =0x027FFFAA
	bic r0, r0, #0x6000000
	orr r0, r0, #0x6000000
	str r0, [sp]
	ldrh r0, [sp]
	ldrh r2, [sp, #2]
	strh r0, [r3]
	and r1, r4, #0xff
	mov r0, #0x10
	strh r2, [r3, #2]
	bl SPIi_ReturnResult
_03801434:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_03801440: .word 0x027FFFAA
	arm_func_end TpVAlarmHandler

	arm_func_start TPi_DetectTouch
TPi_DetectTouch: ; 0x03801444
	stmdb sp!, {r3, lr}
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	ldr r2, _03801520 ; =0x040001C0
_03801454:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03801454
	ldr r1, _03801524 ; =0x00008A01
	ldr r0, _03801528 ; =0x040001C2
	strh r1, [r2]
	mov r1, #0x84
	strh r1, [r0]
	sub r1, r0, #2
_03801478:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03801478
	bl SPI_DummyWait_03801538
	ldr r1, _0380152C ; =0x00008201
	ldr r0, _03801520 ; =0x040001C0
	strh r1, [r0]
	bl SPI_DummyWait_03801538
	ldr r0, _03801530 ; =last_touch_flg
	ldrh r0, [r0]
	cmp r0, #0
	bne _038014C0
	ldr r0, _03801534 ; =0x04000136
	ldrh r0, [r0]
	tst r0, #0x40
	moveq r0, #1
	movne r0, #0
	b _03801518
_038014C0:
	ldr r2, _03801534 ; =0x04000136
	ldrh r0, [r2]
	tst r0, #0x40
	moveq r0, #1
	beq _03801518
	ldr r1, _03801524 ; =0x00008A01
	mov r0, #0x84
	strh r1, [r2, #0x8a]
	strh r0, [r2, #0x8c]
_038014E4:
	ldrh r0, [r2, #0x8a]
	tst r0, #0x80
	bne _038014E4
	bl SPI_DummyWait_03801538
	ldr r1, _0380152C ; =0x00008201
	ldr r0, _03801520 ; =0x040001C0
	strh r1, [r0]
	bl SPI_DummyWait_03801538
	ldr r0, _03801534 ; =0x04000136
	ldrh r0, [r0]
	tst r0, #0x40
	movne r0, #0
	moveq r0, #2
_03801518:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03801520: .word 0x040001C0
_03801524: .word 0x00008A01
_03801528: .word 0x040001C2
_0380152C: .word 0x00008201
_03801530: .word last_touch_flg
_03801534: .word 0x04000136
	arm_func_end TPi_DetectTouch

	arm_func_start SPI_DummyWait_03801538
SPI_DummyWait_03801538: ; 0x03801538
	ldr r0, _03801558 ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_03801548:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03801548
	bx lr
	.align 2, 0
_03801558: .word 0x040001C2
	arm_func_end SPI_DummyWait_03801538

	arm_func_start TPi_DetectPos
TPi_DetectPos: ; 0x0380155C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	cmp r2, #0
	ldr r2, _03801738 ; =0x040001C0
	mov r5, r3
	moveq r3, #0xd1
	moveq r4, #1
	mov r7, r0
	mov r6, r1
	movne r3, #0x91
	movne r4, #2
_03801588:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03801588
	ldr r1, _0380173C ; =0x00008A01
	ldr r0, _03801740 ; =0x040001C2
	strh r1, [r2]
	and r2, r3, #0xff
	strh r2, [r0]
	sub r1, r0, #2
_038015AC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _038015AC
	mov r0, r2, lsl #0x10
	ldr r2, _03801738 ; =0x040001C0
	mov ip, #0
	ldr r8, _03801744 ; =0x00007FF8
	add r1, sp, #0
	mov r0, r0, lsr #0x10
	mov r3, ip
_038015D4:
	strh r3, [r2, #2]
_038015D8:
	ldrh sb, [r2]
	tst sb, #0x80
	bne _038015D8
	ldrh sb, [r2, #2]
	and sb, sb, #0xff
	mov lr, sb, lsl #0x10
	mov sb, lr, lsr #8
	str sb, [r1, ip, lsl #2]
	strh r0, [r2, #2]
_038015FC:
	ldrh sb, [r2]
	tst sb, #0x80
	bne _038015FC
	ldrh lr, [r2, #2]
	ldr sb, [r1, ip, lsl #2]
	and lr, lr, #0xff
	mov lr, lr, lsl #0x10
	orr sb, sb, lr, lsr #16
	and lr, sb, r8
	mov lr, lr, asr #3
	str lr, [r1, ip, lsl #2]
	add ip, ip, #1
	cmp ip, #5
	blt _038015D4
	ldr r0, _03801748 ; =0x00008201
	strh r0, [r2]
	bl SPI_DummyWait_03801538
	mov r8, #0
	mov sb, r8
	add r2, sp, #0
_0380164C:
	ldr r1, [r2, sb, lsl #2]
	add r3, sb, #1
	b _03801670
_03801658:
	ldr r0, [r2, r3, lsl #2]
	add r3, r3, #1
	subs r0, r1, r0
	rsbmi r0, r0, #0
	cmp r0, r8
	movgt r8, r0
_03801670:
	cmp r3, #5
	blt _03801658
	add sb, sb, #1
	cmp sb, #4
	blt _0380164C
	strh r8, [r5]
	mov r8, #0
	add r0, sp, #0
	b _03801708
_03801694:
	ldr r3, [r0, r8, lsl #2]
	add sb, r8, #1
	b _038016FC
_038016A0:
	ldr r2, [r0, sb, lsl #2]
	subs r1, r3, r2
	rsbmi r1, r1, #0
	cmp r1, r6
	bgt _038016F8
	add r1, sb, #1
	b _038016F0
_038016BC:
	ldr r5, [r0, r1, lsl #2]
	subs ip, r3, r5
	rsbmi ip, ip, #0
	cmp ip, r6
	bgt _038016EC
	add r0, r2, r3, lsl #1
	add r0, r5, r0
	mov r0, r0, asr #2
	bic r0, r0, #7
	strh r0, [r7]
	mov r0, #0
	b _0380172C
_038016EC:
	add r1, r1, #1
_038016F0:
	cmp r1, #5
	blt _038016BC
_038016F8:
	add sb, sb, #1
_038016FC:
	cmp sb, #4
	blt _038016A0
	add r8, r8, #1
_03801708:
	cmp r8, #3
	blt _03801694
	ldr r2, [sp]
	ldr r1, [sp, #0x10]
	mov r0, r4
	add r1, r2, r1
	mov r1, r1, asr #1
	bic r1, r1, #7
	strh r1, [r7]
_0380172C:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_03801738: .word 0x040001C0
_0380173C: .word 0x00008A01
_03801740: .word 0x040001C2
_03801744: .word 0x00007FF8
_03801748: .word 0x00008201
	arm_func_end TPi_DetectPos

	arm_func_start TP_ExecSampling
TP_ExecSampling: ; 0x0380174C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	movs r6, r1
	mov r5, r2
	mov r1, #0
	mov r7, r0
	strh r1, [r5]
	rsbmi r6, r6, #0
	bl TPi_DetectTouch
	movs r4, r0
	bne _038017B4
	ldr r1, [r7]
	mov r0, #0x1000
	rsb r0, r0, #0
	and r1, r1, r0
	ldr r0, _03801930 ; =0xFF000FFF
	and r0, r1, r0
	bic r1, r0, #0x1000000
	bic r0, r1, #0x6000000
	str r1, [r7]
	orr r1, r0, #0x6000000
	str r1, [r7]
	ldr r0, _03801934 ; =last_touch_flg
	mov r1, #0
	strh r1, [r0]
	b _03801924
_038017B4:
	add r0, sp, #4
	add r3, sp, #2
	mov r1, r6
	mov r2, #0
	bl TPi_DetectPos
	ldr r1, [r7]
	mov r0, r0, lsl #0x1e
	bic r1, r1, #0x6000000
	orr ip, r1, r0, lsr #5
	str ip, [r7]
	mov r1, #0x1000
	rsb r1, r1, #0
	ldrh r2, [sp, #4]
	and ip, ip, r1
	and r1, r2, r1, lsr #20
	orr ip, ip, r1
	add r0, sp, #4
	add r3, sp, #0
	mov r1, r6
	mov r2, #1
	str ip, [r7]
	bl TPi_DetectPos
	cmp r0, #2
	bne _03801834
	ldr r1, [r7]
	mov r0, r1, lsl #5
	mov r0, r0, lsr #0x1e
	orr r0, r0, #2
	bic r1, r1, #0x6000000
	mov r0, r0, lsl #0x1e
	orr r0, r1, r0, lsr #5
	str r0, [r7]
_03801834:
	ldrh r1, [sp, #4]
	ldr r2, [r7]
	ldr r0, _03801930 ; =0xFF000FFF
	mov r1, r1, lsl #0x14
	and r0, r2, r0
	orr r2, r0, r1, lsr #8
	ldr r1, _03801938 ; =0x00008A01
	ldr r0, _0380193C ; =0x040001C0
	str r2, [r7]
	strh r1, [r0]
	mov r6, #0
_03801860:
	bl SPI_DummyWait_03801538
	add r6, r6, #1
	cmp r6, #0xc
	blt _03801860
	ldr r1, _03801940 ; =0x00008201
	ldr r0, _0380193C ; =0x040001C0
	strh r1, [r0]
	bl SPI_DummyWait_03801538
	cmp r4, #2
	ldreq r0, [r7]
	biceq r0, r0, #0x6000000
	orreq r0, r0, #0x6000000
	streq r0, [r7]
	bl TPi_DetectTouch
	cmp r0, #0
	beq _03801904
	cmp r0, #1
	beq _038018D4
	cmp r0, #2
	bne _03801920
	ldr r1, [r7]
	ldr r0, _03801934 ; =last_touch_flg
	orr r2, r1, #0x1000000
	bic r1, r2, #0x6000000
	orr r1, r1, #0x6000000
	str r1, [r7]
	mov r1, #0
	strh r1, [r0]
	b _03801924
_038018D4:
	ldr r1, [r7]
	ldr r0, _03801934 ; =last_touch_flg
	orr r1, r1, #0x1000000
	str r1, [r7]
	mov r2, #1
	ldrh r1, [sp]
	ldrh r3, [sp, #2]
	strh r2, [r0]
	cmp r3, r1
	movlo r3, r1
	strh r3, [r5]
	b _03801924
_03801904:
	ldr r1, [r7]
	ldr r0, _03801934 ; =last_touch_flg
	bic r1, r1, #0x1000000
	str r1, [r7]
	mov r1, #0
	strh r1, [r0]
	b _03801924
_03801920:
	bl OS_Terminate
_03801924:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03801930: .word 0xFF000FFF
_03801934: .word last_touch_flg
_03801938: .word 0x00008A01
_0380193C: .word 0x040001C0
_03801940: .word 0x00008201
	arm_func_end TP_ExecSampling

	arm_func_start PM_Init
PM_Init: ; 0x03801944
	ldr r0, _03801978 ; =PMi_KeyPattern
	mov r1, #1
	str r1, [r0, #4]
	mov r3, #0
	str r3, [r0, #0x28]
	ldr r0, _0380197C ; =PMi_Work
	mov r2, r3
_03801960:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _03801960
	bx lr
	.align 2, 0
_03801978: .word PMi_KeyPattern
_0380197C: .word PMi_Work
	arm_func_end PM_Init

	arm_func_start PM_AnalyzeCommand
PM_AnalyzeCommand: ; 0x03801980
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	tst r0, #0x2000000
	beq _038019B0
	ldr r1, _03801B34 ; =PMi_Work
	mov r4, #0
	mov r3, r4
_0380199C:
	mov r2, r4, lsl #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _0380199C
_038019B0:
	ldr r1, _03801B34 ; =PMi_Work
	and r2, r0, #0xf0000
	mov r2, r2, lsr #0x10
	mov r2, r2, lsl #1
	strh r0, [r1, r2]
	tst r0, #0x1000000
	beq _03801B28
	ldr r1, _03801B38 ; =PMi_KeyPattern
	ldrh r2, [r1, #8]
	and r0, r2, #0xff00
	mov r0, r0, lsl #8
	mov r4, r0, lsr #0x10
	sub r0, r4, #0x60
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _03801B1C
_038019F0: ; jump table
	b _03801A10 ; case 0
	b _03801A20 ; case 1
	b _03801B1C ; case 2
	b _03801AB8 ; case 3
	b _03801A54 ; case 4
	b _03801A88 ; case 5
	b _03801AEC ; case 6
	b _03801B04 ; case 7
_03801A10:
	mov r0, #0x60
	mov r1, #0
	bl SPIi_ReturnResult
	b _03801B28
_03801A20:
	ldrh ip, [r1, #0xa]
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #3
	mov r2, #2
	str ip, [sp]
	bl SPIi_SetEntry
	cmp r0, #0
	bne _03801B28
	mov r0, r4
	mov r1, #4
	bl SPIi_ReturnResult
	b _03801B28
_03801A54:
	ldrh ip, [r1, #0xa]
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #3
	mov r2, #2
	str ip, [sp]
	bl SPIi_SetEntry
	cmp r0, #0
	bne _03801B28
	mov r0, r4
	mov r1, #4
	bl SPIi_ReturnResult
	b _03801B28
_03801A88:
	mov r0, r2, lsl #0x10
	mov r1, r4
	mov r3, r0, lsr #0x10
	mov r0, #3
	mov r2, #1
	bl SPIi_SetEntry
	cmp r0, #0
	bne _03801B28
	mov r0, r4
	mov r1, #4
	bl SPIi_ReturnResult
	b _03801B28
_03801AB8:
	ldrh r0, [r1, #0xa]
	mov r2, r2, lsl #0x18
	mov r1, r4
	orr r3, r0, r2, lsr #8
	mov r0, #3
	mov r2, #1
	bl SPIi_SetEntry
	cmp r0, #0
	bne _03801B28
	mov r0, r4
	mov r1, #4
	bl SPIi_ReturnResult
	b _03801B28
_03801AEC:
	and r0, r2, #0xff
	bl PM_SetLEDPattern
	mov r0, #0x66
	mov r1, #0
	bl SPIi_ReturnResult
	b _03801B28
_03801B04:
	bl PM_GetLEDPattern
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #0x67
	bl SPIi_ReturnResult
	b _03801B28
_03801B1C:
	mov r0, r4
	mov r1, #1
	bl SPIi_ReturnResult
_03801B28:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_03801B34: .word PMi_Work
_03801B38: .word PMi_KeyPattern
	arm_func_end PM_AnalyzeCommand

	arm_func_start PM_ExecuteProcess
PM_ExecuteProcess: ; 0x03801B3C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	mov r5, r0
	mov r0, #3
	bl SPIi_CheckException
	cmp r0, #0
	bne _03801B7C
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r0, [r4, #4]
	mov r1, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	b _03801CA0
_03801B7C:
	mov r0, #3
	bl SPIi_GetException
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r1, [r4, #4]
	sub r0, r1, #0x61
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _03801C88
_03801BA0: ; jump table
	b _03801BB8 ; case 0
	b _03801C88 ; case 1
	b _03801C54 ; case 2
	b _03801BDC ; case 3
	b _03801C18 ; case 4
	b _03801C7C ; case 5
_03801BB8:
	ldr r0, _03801CA8 ; =PMi_KeyPattern
	mov r1, #1
	str r1, [r0, #0x28]
	ldr r1, [r4, #8]
	strh r1, [r0, #2]
	ldr r1, [r4, #0xc]
	strh r1, [r0]
	bl PMi_DoSleep
	b _03801C98
_03801BDC:
	ldr r2, _03801CA8 ; =PMi_KeyPattern
	mov r0, #4
	str r0, [r2, #0x28]
	ldr r0, [r4, #8]
	str r0, [r2, #0x30]
	ldr r3, [r4, #0xc]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	and r1, r3, #0xff
	str r3, [r2, #0x2c]
	bl PMi_SetRegister
	mov r0, #0x64
	mov r1, #0
	bl SPIi_ReturnResult
	b _03801C98
_03801C18:
	ldr r1, _03801CA8 ; =PMi_KeyPattern
	mov r0, #3
	str r0, [r1, #0x28]
	ldr r2, [r4, #8]
	mov r0, r2, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r0, r4
	str r2, [r1, #0x30]
	bl PMi_GetRegister
	add r1, r4, #0x70
	mov r2, r1, lsl #0x10
	mov r1, r0
	mov r0, r2, lsr #0x10
	bl SPIi_ReturnResult
	b _03801C98
_03801C54:
	ldr r1, _03801CA8 ; =PMi_KeyPattern
	mov r0, #2
	str r0, [r1, #0x28]
	ldr r0, [r4, #8]
	str r0, [r1, #0x2c]
	bl PMi_SwitchUtilityProc
	mov r0, #0x63
	mov r1, #0
	bl SPIi_ReturnResult
	b _03801C98
_03801C7C:
	ldr r0, [r4, #8]
	bl PMi_SetLED
	b _03801C98
_03801C88:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #1
	bl SPIi_ReturnResult
_03801C98:
	mov r0, #3
	bl SPIi_ReleaseException
_03801CA0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03801CA8: .word PMi_KeyPattern
	arm_func_end PM_ExecuteProcess

	arm_func_start PMi_SendPxiCommand
PMi_SendPxiCommand: ; 0x03801CAC
	stmdb sp!, {r4, r5, r6, lr}
	and r1, r1, #0x3f0000
	and r3, r0, #0x3c00000
	mov r1, r1, lsl #0x10
	mov r0, r2, lsl #0x10
	orr r1, r1, r3, lsl #22
	orr r6, r1, r0, lsr #16
	mov r5, #8
	mov r4, #0
_03801CD0:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	bne _03801CD0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end PMi_SendPxiCommand

	arm_func_start PMi_SetRegister
PMi_SetRegister: ; 0x03801CF0
	stmdb sp!, {r4, lr}
	ldr r2, _03801D3C ; =0x040001C0
	mov r4, r1
_03801CFC:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03801CFC
	ldr r1, _03801D40 ; =0x00008202
	and r0, r0, #0xff
	strh r1, [r2]
	add r1, r1, #0x600
	strh r1, [r2]
	bl SPI_SendWait_03801D48
	ldr r2, _03801D44 ; =0x00008002
	ldr r1, _03801D3C ; =0x040001C0
	and r0, r4, #0xff
	strh r2, [r1]
	strh r0, [r1, #2]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03801D3C: .word 0x040001C0
_03801D40: .word 0x00008202
_03801D44: .word 0x00008002
	arm_func_end PMi_SetRegister

	arm_func_start SPI_SendWait_03801D48
SPI_SendWait_03801D48: ; 0x03801D48
	ldr r1, _03801D68 ; =0x040001C2
	and r0, r0, #0xff
	strh r0, [r1]
	sub r1, r1, #2
_03801D58:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03801D58
	bx lr
	.align 2, 0
_03801D68: .word 0x040001C2
	arm_func_end SPI_SendWait_03801D48

	arm_func_start PMi_GetRegister
PMi_GetRegister: ; 0x03801D6C
	stmdb sp!, {r3, lr}
	ldr r2, _03801DD0 ; =0x040001C0
_03801D74:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03801D74
	ldr r1, _03801DD4 ; =0x00008202
	orr r0, r0, #0x80
	strh r1, [r2]
	add r1, r1, #0x600
	and r0, r0, #0xff
	strh r1, [r2]
	bl SPI_SendWait_03801D48
	ldr r2, _03801DD8 ; =0x00008002
	ldr r1, _03801DD0 ; =0x040001C0
	mov r0, #0
	strh r2, [r1]
	strh r0, [r1, #2]
_03801DB0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03801DB0
	ldr r0, _03801DDC ; =0x040001C2
	ldrh r0, [r0]
	and r0, r0, #0xff
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03801DD0: .word 0x040001C0
_03801DD4: .word 0x00008202
_03801DD8: .word 0x00008002
_03801DDC: .word 0x040001C2
	arm_func_end PMi_GetRegister

	arm_func_start PMi_SetControl
PMi_SetControl: ; 0x03801DE0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	bl PMi_GetRegister
	orr r1, r0, r4
	mov r0, #0
	bl PMi_SetRegister
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end PMi_SetControl

	arm_func_start PMi_ResetControl
PMi_ResetControl: ; 0x03801E04
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	bl PMi_GetRegister
	mvn r1, r4
	and r0, r0, r1
	and r1, r0, #0xff
	mov r0, #0
	bl PMi_SetRegister
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end PMi_ResetControl

	arm_func_start PMi_SwitchUtilityProc
PMi_SwitchUtilityProc: ; 0x03801E30
	stmdb sp!, {r3, lr}
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _03801F4C
_03801E40: ; jump table
	b _03801F4C ; case 0
	b _03801E80 ; case 1
	b _03801E94 ; case 2
	b _03801EA8 ; case 3
	b _03801EBC ; case 4
	b _03801EC8 ; case 5
	b _03801ED4 ; case 6
	b _03801EE0 ; case 7
	b _03801EEC ; case 8
	b _03801EF8 ; case 9
	b _03801F04 ; case 10
	b _03801F10 ; case 11
	b _03801F1C ; case 12
	b _03801F28 ; case 13
	b _03801F40 ; case 14
	b _03801F34 ; case 15
_03801E80:
	mov r0, #1
	bl PM_SetLEDPattern
	mov r0, #1
	bl PMi_SetLED
	b _03801F4C
_03801E94:
	mov r0, #3
	bl PM_SetLEDPattern
	mov r0, #3
	bl PMi_SetLED
	b _03801F4C
_03801EA8:
	mov r0, #2
	bl PM_SetLEDPattern
	mov r0, #2
	bl PMi_SetLED
	b _03801F4C
_03801EBC:
	mov r0, #4
	bl PMi_SetControl
	b _03801F4C
_03801EC8:
	mov r0, #4
	bl PMi_ResetControl
	b _03801F4C
_03801ED4:
	mov r0, #8
	bl PMi_SetControl
	b _03801F4C
_03801EE0:
	mov r0, #8
	bl PMi_ResetControl
	b _03801F4C
_03801EEC:
	mov r0, #0xc
	bl PMi_SetControl
	b _03801F4C
_03801EF8:
	mov r0, #0xc
	bl PMi_ResetControl
	b _03801F4C
_03801F04:
	mov r0, #1
	bl PMi_SetControl
	b _03801F4C
_03801F10:
	mov r0, #1
	bl PMi_ResetControl
	b _03801F4C
_03801F1C:
	mov r0, #2
	bl PMi_ResetControl
	b _03801F4C
_03801F28:
	mov r0, #2
	bl PMi_SetControl
	b _03801F4C
_03801F34:
	mov r0, #0x40
	bl PMi_ResetControl
	b _03801F4C
_03801F40:
	bl SND_BeginSleep
	mov r0, #0x40
	bl PMi_SetControl
_03801F4C:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end PMi_SwitchUtilityProc

	arm_func_start PMi_SetLED
PMi_SetLED: ; 0x03801F54
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #1
	beq _03801F78
	cmp r4, #2
	beq _03801F90
	cmp r4, #3
	beq _03801F84
	b _03801FA4
_03801F78:
	mov r0, #0x10
	bl PMi_ResetControl
	b _03801FA8
_03801F84:
	mov r0, #0x30
	bl PMi_SetControl
	b _03801FA8
_03801F90:
	mov r0, #0x20
	bl PMi_ResetControl
	mov r0, #0x10
	bl PMi_SetControl
	b _03801FA8
_03801FA4:
	bl OS_Terminate
_03801FA8:
	ldr r0, _03801FB8 ; =PMi_LEDStatus
	str r4, [r0]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03801FB8: .word PMi_LEDStatus
	arm_func_end PMi_SetLED

	arm_func_start PMi_DoSleep
PMi_DoSleep: ; 0x03801FBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _03802178 ; =0x04000208
	mov r8, #0
	ldrh sb, [r0]
	strh r8, [r0]
	bl OS_DisableInterrupts
	mov r4, r0
	mvn r0, #0xfe000000
	bl OS_DisableIrqMask
	mov r5, r0
	mov r0, r8
	bl PMi_GetRegister
	mov r6, r0
	mov r0, #2
	bl PM_SetLEDPattern
	mov r0, #2
	bl PMi_SetLED
	mov r0, #2
	bl PMi_SetLED
	bl SND_BeginSleep
	mov r0, #1
	bl PMi_ResetControl
	ldr r0, _0380217C ; =PMi_TriggerBL
	ldrh r0, [r0]
	tst r0, #1
	beq _03802040
	ldr r0, _03802180 ; =PMi_KeyPattern
	ldr r1, _03802184 ; =0x04000132
	ldrh r2, [r0]
	mov r0, #0x1000
	orr r2, r2, #0x4000
	strh r2, [r1]
	bl OS_EnableIrqMask
_03802040:
	ldr r0, _0380217C ; =PMi_TriggerBL
	ldrh r0, [r0]
	tst r0, #4
	beq _03802058
	mov r0, #0x400000
	bl OS_EnableIrqMask
_03802058:
	ldr r0, _0380217C ; =PMi_TriggerBL
	ldrh r0, [r0]
	tst r0, #2
	beq _0380209C
	ldr r1, _03802188 ; =0x04000134
	mov r0, #0x8000
	ldrh r7, [r1]
	mov r8, #1
	bl EXIi_SelectRcnt
	mov r0, #0x40
	mov r1, #0
	bl EXIi_SetBitRcnt0L
	mov r0, #0x100
	mov r1, r0
	bl EXIi_SetBitRcnt0L
	mov r0, #0x80
	bl OS_EnableIrqMask
_0380209C:
	ldr r0, _0380217C ; =PMi_TriggerBL
	ldrh r0, [r0]
	tst r0, #8
	beq _038020B4
	mov r0, #0x100000
	bl OS_EnableIrqMask
_038020B4:
	ldr r0, _0380217C ; =PMi_TriggerBL
	ldrh r0, [r0]
	tst r0, #0x10
	beq _038020CC
	mov r0, #0x2000
	bl OS_EnableIrqMask
_038020CC:
	mov r0, r4
	bl OS_RestoreInterrupts
	ldr r2, _03802178 ; =0x04000208
	mov r0, #1
	ldrh r1, [r2]
	strh r0, [r2]
	bl __VENEER_SVC_Sleep
	mov r1, r6
	mov r0, #0
	bl PMi_SetRegister
	ldr r0, _0380217C ; =PMi_TriggerBL
	ldrh r1, [r0]
	tst r1, #0x20
	movne r0, #6
	moveq r0, #7
	tst r1, #0x40
	movne r6, #4
	moveq r6, #5
	bl PMi_SwitchUtilityProc
	mov r0, r6
	bl PMi_SwitchUtilityProc
	cmp r8, #0
	ldrne r0, _03802188 ; =0x04000134
	strneh r7, [r0]
	mov r0, #1
	bl PMi_SetControl
	bl SND_EndSleep
	mov r1, #0
	ldr r3, _0380218C ; =PMi_Work
	mov r2, r1
	mov r0, #0x62
	str r1, [r3, #0x20]
	bl PMi_SendPxiCommand
	bl OS_DisableInterrupts
	mov r0, r5
	bl OS_SetIrqMask
	mov r0, r4
	bl OS_RestoreInterrupts
	ldr r1, _03802178 ; =0x04000208
	ldrh r0, [r1]
	strh sb, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_03802178: .word 0x04000208
_0380217C: .word PMi_TriggerBL
_03802180: .word PMi_KeyPattern
_03802184: .word 0x04000132
_03802188: .word 0x04000134
_0380218C: .word PMi_Work
	arm_func_end PMi_DoSleep

	arm_func_start __VENEER_SVC_Sleep
__VENEER_SVC_Sleep: ; 0x03802190
	ldr ip, _03802198 ; =SVC_Sleep
	bx ip
	.align 2, 0
_03802198: .word SVC_Sleep
	arm_func_end __VENEER_SVC_Sleep

	arm_func_start PM_SelfBlinkProc
PM_SelfBlinkProc: ; 0x0380219C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _038022B0 ; =PMi_BlinkCounter
	ldr r3, [r1, #4]
	cmp r3, #0
	bne _038021D8
	mov r2, #1
	mov r3, r2
	mov r0, #3
	mov r1, #0x66
	bl SPIi_SetEntry
	cmp r0, #0
	beq _038022A8
	mov r0, #1
	bl PM_SetLEDPattern
	b _038022A8
_038021D8:
	cmp r3, #4
	bge _03802204
	ldr r0, _038022B4 ; =PMi_LEDStatus
	ldr r0, [r0]
	cmp r3, r0
	beq _038022A8
	mov r0, #3
	mov r1, #0x66
	mov r2, #1
	bl SPIi_SetEntry
	b _038022A8
_03802204:
	sub r2, r3, #4
	mov r0, #0xc
	mul r4, r2, r0
	ldr r5, _038022B8 ; =PMi_BlinkPatternData
	ldr r0, [r1]
	add r6, r5, r4
	ldrh r1, [r6, #0xa]
	bl _u32_div_f
	mov r1, #0
	mov r3, r1, lsr r0
	ldr ip, [r6, #4]
	mov r2, #-0x80000000
	rsb r1, r0, #0x20
	orr r3, r3, r2, lsl r1
	sub r1, r0, #0x20
	and ip, ip, r2, lsr r0
	orr r3, r3, r2, lsr r1
	ldr r0, [r5, r4]
	cmp ip, #0
	and r0, r0, r3
	cmpeq r0, #0
	movne r3, #1
	ldrh r2, [r6, #8]
	ldrh r1, [r6, #0xa]
	ldr r0, _038022B0 ; =PMi_BlinkCounter
	mul r1, r2, r1
	ldr r2, [r0]
	moveq r3, #2
	add r2, r2, #1
	cmp r2, r1
	str r2, [r0]
	movhs r1, #0
	strhs r1, [r0]
	ldr r0, _038022B4 ; =PMi_LEDStatus
	ldr r0, [r0]
	cmp r3, r0
	beq _038022A8
	mov r0, #3
	mov r1, #0x66
	mov r2, #1
	bl SPIi_SetEntry
_038022A8:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_038022B0: .word PMi_BlinkCounter
_038022B4: .word PMi_LEDStatus
_038022B8: .word PMi_BlinkPatternData
	arm_func_end PM_SelfBlinkProc

	arm_func_start PM_SetLEDPattern
PM_SetLEDPattern: ; 0x038022BC
	cmp r0, #0xf
	ldrle r1, _038022D4 ; =PMi_BlinkCounter
	movle r2, #0
	strle r0, [r1, #4]
	strle r2, [r1]
	bx lr
	.align 2, 0
_038022D4: .word PMi_BlinkCounter
	arm_func_end PM_SetLEDPattern

	arm_func_start PM_GetLEDPattern
PM_GetLEDPattern: ; 0x038022D8
	ldr r0, _038022E4 ; =PMi_BlinkCounter
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_038022E4: .word PMi_BlinkCounter
	arm_func_end PM_GetLEDPattern

	arm_func_start MIC_Init
MIC_Init: ; 0x038022E8
	ldr r0, _03802324 ; =micw
	mov r3, #0
	str r3, [r0, #0x20]
	ldr r0, _03802328 ; =micw
	mov r2, r3
_038022FC:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _038022FC
	ldr r1, _0380232C ; =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	bx lr
	.align 2, 0
_03802324: .word micw
_03802328: .word micw
_0380232C: .word 0x0400010E
	arm_func_end MIC_Init

	arm_func_start MIC_AnalyzeCommand
MIC_AnalyzeCommand: ; 0x03802330
	stmdb sp!, {r4, lr}
	tst r0, #0x2000000
	beq _0380235C
	ldr r1, _038025E8 ; =micw
	mov r4, #0
	mov r3, r4
_03802348:
	mov r2, r4, lsl #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _03802348
_0380235C:
	ldr r1, _038025E8 ; =micw
	and r2, r0, #0xf0000
	mov r2, r2, lsr #0x10
	mov r2, r2, lsl #1
	strh r0, [r1, r2]
	tst r0, #0x1000000
	beq _038025E0
	ldr r1, _038025EC ; =micw
	ldrh r2, [r1]
	and r0, r2, #0xff00
	mov r0, r0, lsl #8
	mov r4, r0, lsr #0x10
	sub r0, r4, #0x40
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _038025D4
_0380239C: ; jump table
	b _038023AC ; case 0
	b _038023E8 ; case 1
	b _038024EC ; case 2
	b _03802550 ; case 3
_038023AC:
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #2
	mov r2, #1
	bl SPIi_SetEntry
	cmp r0, #0
	bne _038023D4
	mov r0, r4
	mov r1, #4
	bl SPIi_ReturnResult
_038023D4:
	ldr r0, _038025F0 ; =0x027FFF94
	mov r1, #0
	strh r1, [r0]
	str r1, [r0, #-4]
	b _038025E0
_038023E8:
	ldr r0, [r1, #0x20]
	cmp r0, #0
	beq _03802404
	mov r0, r4
	mov r1, #3
	bl SPIi_ReturnResult
	b _038025E0
_03802404:
	and r0, r2, #0xff
	strh r0, [r1, #0x24]
	ldrh r2, [r1, #2]
	ldrh r0, [r1, #4]
	orr r3, r0, r2, lsl #16
	cmp r3, #0x2000000
	blo _03802428
	cmp r3, #0x2400000
	blo _03802438
_03802428:
	mov r0, r4
	mov r1, #2
	bl SPIi_ReturnResult
	b _038025E0
_03802438:
	str r3, [r1, #0x28]
	ldrh r2, [r1, #6]
	ldrh r0, [r1, #8]
	orr r2, r0, r2, lsl #16
	add r0, r3, r2
	cmp r0, #0x2400000
	bls _03802464
	mov r0, r4
	mov r1, #2
	bl SPIi_ReturnResult
	b _038025E0
_03802464:
	str r2, [r1, #0x30]
	ldrh r2, [r1, #0xa]
	ldrh r0, [r1, #0xc]
	orr r0, r0, r2, lsl #16
	bl MicSetTimerValue
	cmp r0, #0
	bne _03802490
	mov r0, r4
	mov r1, #2
	bl SPIi_ReturnResult
	b _038025E0
_03802490:
	ldr r3, _038025EC ; =micw
	mov r2, #0
	str r2, [r3, #0x2c]
	ldrh r0, [r3, #0x24]
	mov r1, r4
	and ip, r0, #7
	mov r0, #2
	strh ip, [r3, #0x26]
	bl SPIi_SetEntry
	cmp r0, #0
	bne _038024CC
	mov r0, r4
	mov r1, #4
	bl SPIi_ReturnResult
	b _038025E0
_038024CC:
	ldr r1, _038025F0 ; =0x027FFF94
	mov r2, #0
	strh r2, [r1]
	ldr r0, _038025EC ; =micw
	str r2, [r1, #-4]
	mov r1, #1
	str r1, [r0, #0x20]
	b _038025E0
_038024EC:
	ldr r0, [r1, #0x20]
	cmp r0, #2
	beq _03802508
	mov r0, r4
	mov r1, #3
	bl SPIi_ReturnResult
	b _038025E0
_03802508:
	mov r1, r4
	mov r0, #2
	mov r2, #0
	bl SPIi_SetEntry
	cmp r0, #0
	bne _03802530
	mov r0, r4
	mov r1, #4
	bl SPIi_ReturnResult
	b _038025E0
_03802530:
	ldr r0, _038025EC ; =micw
	mov r2, #3
	ldr r1, _038025F4 ; =0x0400010E
	str r2, [r0, #0x20]
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	b _038025E0
_03802550:
	ldr r0, [r1, #0x20]
	cmp r0, #2
	beq _0380256C
	mov r0, r4
	mov r1, #3
	bl SPIi_ReturnResult
	b _038025E0
_0380256C:
	ldrh r2, [r1, #2]
	ldrh r0, [r1, #4]
	orr r0, r0, r2, lsl #16
	bl MicSetTimerValue
	cmp r0, #0
	bne _03802594
	mov r0, r4
	mov r1, #2
	bl SPIi_ReturnResult
	b _038025E0
_03802594:
	bl OS_DisableInterrupts
	ldr r3, _038025F4 ; =0x0400010E
	ldr r1, _038025EC ; =micw
	ldrh r2, [r3]
	bic r2, r2, #0x80
	strh r2, [r3]
	ldrh r2, [r1, #0x34]
	strh r2, [r3, #-2]
	ldrh r1, [r1, #0x36]
	orr r1, r1, #0xc0
	strh r1, [r3]
	bl OS_RestoreInterrupts
	mov r0, r4
	mov r1, #0
	bl SPIi_ReturnResult
	b _038025E0
_038025D4:
	mov r0, r4
	mov r1, #1
	bl SPIi_ReturnResult
_038025E0:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_038025E8: .word micw
_038025EC: .word micw
_038025F0: .word 0x027FFF94
_038025F4: .word 0x0400010E
	arm_func_end MIC_AnalyzeCommand

	arm_func_start MicSetTimerValue
MicSetTimerValue: ; 0x038025F8
	cmp r0, #0x10000
	bhs _0380261C
	ldr r1, _03802698 ; =micw
	mov r2, #0
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
_0380261C:
	cmp r0, #0x400000
	bhs _03802644
	ldr r1, _03802698 ; =micw
	mov r3, #1
	mov r0, r0, lsr #6
	rsb r2, r0, #0x10000
	strh r3, [r1, #0x36]
	mov r0, r3
	strh r2, [r1, #0x34]
	bx lr
_03802644:
	cmp r0, #0x1000000
	bhs _0380266C
	ldr r1, _03802698 ; =micw
	mov r2, #2
	mov r0, r0, lsr #8
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
_0380266C:
	cmp r0, #0x4000000
	movhs r0, #0
	bxhs lr
	ldr r1, _03802698 ; =micw
	mov r2, #3
	mov r0, r0, lsr #0xa
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
	.align 2, 0
_03802698: .word micw
	arm_func_end MicSetTimerValue

	arm_func_start MIC_ExecuteProcess
MIC_ExecuteProcess: ; 0x0380269C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r2, [r4, #4]
	cmp r2, #0x40
	beq _038026C4
	cmp r2, #0x41
	beq _03802774
	cmp r2, #0x42
	beq _0380280C
	b _038028A8
_038026C4:
	bl OS_DisableInterrupts
	mov r5, r0
	mov r0, #2
	bl SPIi_CheckException
	cmp r0, #0
	bne _038026FC
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r0, [r4, #4]
	mov r1, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	b _038028A8
_038026FC:
	mov r0, #2
	bl SPIi_GetException
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r0, [r4, #8]
	and r0, r0, #1
	cmp r0, #1
	bne _03802730
	bl MIC_ExecSampling12
	ldr r1, [r4, #8]
	tst r1, #2
	eorne r0, r0, #0x8000
	b _03802740
_03802730:
	bl MIC_ExecSampling8
	ldr r1, [r4, #8]
	tst r1, #2
	eorne r0, r0, #0x80
_03802740:
	ldr r1, _038028B0 ; =0x027FFF94
	movne r0, r0, lsl #0x10
	movne r0, r0, lsr #0x10
	strh r0, [r1]
	str r1, [r1, #-4]
	ldr r0, [r4, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	mov r0, #2
	bl SPIi_ReleaseException
	b _038028A8
_03802774:
	ldr r0, _038028B4 ; =micw
	ldr r1, [r0, #0x20]
	cmp r1, #1
	bne _038027F8
	mov r1, #0
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x38]
	bl OS_DisableInterrupts
	mov r5, r0
	mov r0, #0x40
	bl OS_EnableIrqMask
	ldr r1, _038028B8 ; =MIC_TimerHandler
	mov r0, #0x40
	bl MIC_SetIrqFunction
	bl MIC_EnableMultipleInterrupt
	ldr r1, _038028B4 ; =micw
	ldr r2, _038028BC ; =0x0400010C
	ldrh r3, [r1, #0x34]
	mov r0, r5
	strh r3, [r2]
	ldrh r1, [r1, #0x36]
	orr r1, r1, #0xc0
	strh r1, [r2, #2]
	bl OS_RestoreInterrupts
	ldr r0, [r4, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	ldr r0, _038028B4 ; =micw
	mov r1, #2
	str r1, [r0, #0x20]
	b _038028A8
_038027F8:
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #3
	bl SPIi_ReturnResult
	b _038028A8
_0380280C:
	ldr r0, _038028B4 ; =micw
	ldr r1, [r0, #0x20]
	sub r0, r1, #3
	cmp r0, #1
	bhi _03802888
	ldr r1, _038028C0 ; =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	bl OS_DisableInterrupts
	mov r4, r0
	mov r0, #0x40
	mov r1, #0
	bl MIC_SetIrqFunction
	bl MIC_DisableMultipleInterrupt
	mov r0, r4
	bl OS_RestoreInterrupts
	ldr r0, _038028B4 ; =micw
	mov r1, #0
	ldr r0, [r0, #0x20]
	cmp r0, #3
	bne _03802870
	mov r0, #0x42
	bl SPIi_ReturnResult
	b _03802878
_03802870:
	mov r0, #0x51
	bl SPIi_ReturnResult
_03802878:
	ldr r0, _038028B4 ; =micw
	mov r1, #0
	str r1, [r0, #0x20]
	b _038028A8
_03802888:
	cmp r1, #3
	mov r1, #3
	bne _038028A0
	mov r0, #0x42
	bl SPIi_ReturnResult
	b _038028A8
_038028A0:
	mov r0, #0x51
	bl SPIi_ReturnResult
_038028A8:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_038028B0: .word 0x027FFF94
_038028B4: .word micw
_038028B8: .word MIC_TimerHandler
_038028BC: .word 0x0400010C
_038028C0: .word 0x0400010E
	arm_func_end MIC_ExecuteProcess

	arm_func_start MIC_TimerHandler
MIC_TimerHandler: ; 0x038028C4
	stmdb sp!, {r3, lr}
	bl MicTimerHandler
	ldr r3, _038028F0 ; =0x0380FFF8
	ldr r0, _038028F4 ; =0x04000214
	ldr r2, [r3]
	mov r1, #0x40
	orr r2, r2, #0x40
	str r2, [r3]
	str r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038028F0: .word 0x0380FFF8
_038028F4: .word 0x04000214
	arm_func_end MIC_TimerHandler

	arm_func_start MicTimerHandler
MicTimerHandler: ; 0x038028F8
	stmdb sp!, {r4, r5, r6, r7, lr}
	ldr r4, _03802A50 ; =micw
	ldrh r5, [r4, #0x26]
	and r0, r5, #4
	cmp r0, #4
	ldrh r6, [r4, #0x38]
	ldrneh r7, [r4, #0x3a]
	ldreq r7, _03802A54 ; =0x0000FFFF
	bl SPIi_CheckEntry
	cmp r0, #0
	bne _03802964
	mov r0, #2
	bl SPIi_CheckException
	cmp r0, #0
	beq _03802964
	and r0, r5, #1
	cmp r0, #1
	bne _03802954
	bl MIC_ExecSampling12
	tst r5, #2
	moveq r7, r0
	eorne r7, r0, #0x8000
	b _03802964
_03802954:
	bl MIC_ExecSampling8
	tst r5, #2
	moveq r7, r0
	eorne r7, r0, #0x80
_03802964:
	and r0, r5, #1
	ldr r3, _03802A58 ; =0x027FFC00
	ldr r1, [r4, #0x2c]
	cmp r0, #1
	bne _03802994
	ldr r2, [r4, #0x28]
	strh r7, [r2, r1]!
	str r2, [r3, #0x390]
	add r3, r3, #0x394
	strh r7, [r3]
	add r1, r1, #2
	b _038029CC
_03802994:
	and r7, r7, #0xff
	tst r1, #1
	bne _038029AC
	mov r6, r7
	add r1, r1, #1
	b _038029CC
_038029AC:
	orr r0, r6, r7, lsl #8
	ldr r2, [r4, #0x28]
	sub r1, r1, #1
	strh r0, [r2, r1]!
	str r2, [r3, #0x390]
	add r3, r3, #0x394
	strh r0, [r3]
	add r1, r1, #2
_038029CC:
	strh r6, [r4, #0x38]
	strh r7, [r4, #0x3a]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	movhs r1, #0
	str r1, [r4, #0x2c]
	blo _03802A48
	ldrh r0, [r4, #0x24]
	and r0, r0, #0x10
	cmp r0, #0x10
	bne _03802A08
	mov r0, #0x51
	mov r1, #0
	bl SPIi_ReturnResult
	b _03802A48
_03802A08:
	mov r0, #2
	mov r1, #0x42
	mov r2, #0
	bl SPIi_SetEntry
	cmp r0, #0
	bne _03802A30
	mov r0, #0x51
	mov r1, #4
	bl SPIi_ReturnResult
	b _03802A48
_03802A30:
	mov r0, #4
	str r0, [r4, #0x20]
	ldr r1, _03802A5C ; =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
_03802A48:
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03802A50: .word micw
_03802A54: .word 0x0000FFFF
_03802A58: .word 0x027FFC00
_03802A5C: .word 0x0400010E
	arm_func_end MicTimerHandler

	arm_func_start MIC_ExecSampling8
MIC_ExecSampling8: ; 0x03802A60
	stmdb sp!, {r4, lr}
	ldr r2, _03802B6C ; =0x040001C0
_03802A68:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03802A68
	ldr r1, _03802B70 ; =0x00008A01
	ldr r0, _03802B74 ; =0x040001C2
	strh r1, [r2]
	mov r1, #0xec
	strh r1, [r0]
	sub r1, r0, #2
_03802A8C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03802A8C
	bl SPI_DummyWaitReceive
	ldr r2, _03802B78 ; =0x00008201
	ldr r1, _03802B6C ; =0x040001C0
	mov r4, r0, lsl #0x18
	strh r2, [r1]
	bl SPI_DummyWaitReceive
	ldr r2, _03802B7C ; =micw + 0x3C
	ldr r1, _03802B80 ; =0x00007F80
	orr r0, r0, r4, lsr #16
	and r1, r0, r1
	ldr r0, [r2, #0x10]
	mov r1, r1, lsl #9
	add r3, r0, r1, lsr #16
	str r3, [r2, #0x10]
	ldr r0, [r2, #0xc]
	add r0, r0, #1
	str r0, [r2, #0xc]
	cmp r0, #0x1000
	blo _03802B3C
	ldrsb r4, [r2]
	mov r0, r3, lsr #0xc
	sub r0, r0, #0x80
	mov r0, r0, lsl #0x18
	cmp r4, r0, asr #24
	mov r0, r0, asr #0x18
	cmplt r4, #0xc
	addlt r0, r4, #1
	strltb r0, [r2]
	blt _03802B2C
	cmp r0, r4
	bge _03802B2C
	mvn r0, #0xb
	cmp r4, r0
	ldrgt r0, _03802B7C ; =micw + 0x3C
	ldrgtsb r2, [r0]
	subgt r2, r2, #1
	strgtb r2, [r0]
_03802B2C:
	ldr r0, _03802B7C ; =micw + 0x3C
	mov r2, #0
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
_03802B3C:
	ldr r0, _03802B7C ; =micw + 0x3C
	ldrsb r0, [r0]
	rsb r0, r0, r1, lsr #16
	cmp r0, #0xff
	movgt r0, #0xff
	bgt _03802B5C
	cmp r0, #0
	movlt r0, #0
_03802B5C:
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03802B6C: .word 0x040001C0
_03802B70: .word 0x00008A01
_03802B74: .word 0x040001C2
_03802B78: .word 0x00008201
_03802B7C: .word micw + 0x3C
_03802B80: .word 0x00007F80
	arm_func_end MIC_ExecSampling8

	arm_func_start SPI_DummyWaitReceive
SPI_DummyWaitReceive: ; 0x03802B84
	ldr r0, _03802BB0 ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_03802B94:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03802B94
	ldr r0, _03802BB0 ; =0x040001C2
	ldrh r0, [r0]
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_03802BB0: .word 0x040001C2
	arm_func_end SPI_DummyWaitReceive

	arm_func_start MIC_ExecSampling12
MIC_ExecSampling12: ; 0x03802BB4
	stmdb sp!, {r4, lr}
	ldr r2, _03802CCC ; =0x040001C0
_03802BBC:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03802BBC
	ldr r1, _03802CD0 ; =0x00008A01
	ldr r0, _03802CD4 ; =0x040001C2
	strh r1, [r2]
	mov r1, #0xe4
	strh r1, [r0]
	sub r1, r0, #2
_03802BE0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03802BE0
	bl SPI_DummyWaitReceive
	ldr r2, _03802CD8 ; =0x00008201
	ldr r1, _03802CCC ; =0x040001C0
	mov r4, r0, lsl #0x18
	strh r2, [r1]
	bl SPI_DummyWaitReceive
	ldr r3, _03802CDC ; =micw + 0x3C
	ldr r1, _03802CE0 ; =0x00007FF8
	orr r0, r0, r4, lsr #16
	and r2, r0, r1
	ldr r0, [r3, #4]
	mov r2, r2, lsl #0x11
	add r4, r0, r2, lsr #16
	str r4, [r3, #4]
	ldr r0, [r3, #8]
	add r0, r0, #1
	str r0, [r3, #8]
	cmp r0, #0x100
	blo _03802C98
	mov r0, r1, lsl #1
	and r0, r0, r4, lsr #8
	ldrsh r4, [r3, #2]
	sub r0, r0, #0x8000
	mov r0, r0, lsl #0x10
	cmp r4, r0, asr #16
	mov r1, r0, asr #0x10
	cmplt r4, #0xc00
	addlt r0, r4, #0x10
	strlth r0, [r3, #2]
	blt _03802C88
	cmp r1, r4
	bge _03802C88
	mov r0, #0xc00
	rsb r0, r0, #0
	cmp r4, r0
	ldrgt r0, _03802CDC ; =micw + 0x3C
	ldrgtsh r1, [r0, #2]
	subgt r1, r1, #0x10
	strgth r1, [r0, #2]
_03802C88:
	ldr r0, _03802CDC ; =micw + 0x3C
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
_03802C98:
	ldr r1, _03802CDC ; =micw + 0x3C
	ldr r0, _03802CE4 ; =0x0000FFF0
	ldrsh r1, [r1, #2]
	rsb r1, r1, r2, lsr #16
	cmp r1, r0
	movgt r1, r0
	bgt _03802CBC
	cmp r1, #0
	movlt r1, #0
_03802CBC:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03802CCC: .word 0x040001C0
_03802CD0: .word 0x00008A01
_03802CD4: .word 0x040001C2
_03802CD8: .word 0x00008201
_03802CDC: .word micw + 0x3C
_03802CE0: .word 0x00007FF8
_03802CE4: .word 0x0000FFF0
	arm_func_end MIC_ExecSampling12

	arm_func_start MIC_SetIrqFunction
MIC_SetIrqFunction: ; 0x03802CE8
	ldr r2, _03802D0C ; =OS_IRQTable
	mov r3, #0
_03802CF0:
	tst r0, #1
	strne r1, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #0x19
	mov r0, r0, lsr #1
	blt _03802CF0
	bx lr
	.align 2, 0
_03802D0C: .word OS_IRQTable
	arm_func_end MIC_SetIrqFunction

	arm_func_start MIC_EnableMultipleInterrupt
MIC_EnableMultipleInterrupt: ; 0x03802D10
	stmdb sp!, {r3, lr}
	ldr r3, _03802D64 ; =0x0380FFFC
	ldr r0, _03802D68 ; =MIC_IrqHandler
	ldr r2, [r3]
	cmp r2, r0
	beq _03802D5C
	ldr r0, _03802D6C ; =micIntrInfo
	mov r1, #0
	str r1, [r0]
	sub r1, r3, #0x17c
	str r1, [r0, #4]
	mov r1, #0x40
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bl OS_DisableInterrupts
	ldr r2, _03802D68 ; =MIC_IrqHandler
	ldr r1, _03802D64 ; =0x0380FFFC
	str r2, [r1]
	bl OS_RestoreInterrupts
_03802D5C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03802D64: .word 0x0380FFFC
_03802D68: .word MIC_IrqHandler
_03802D6C: .word micIntrInfo
	arm_func_end MIC_EnableMultipleInterrupt

	arm_func_start MIC_DisableMultipleInterrupt
MIC_DisableMultipleInterrupt: ; 0x03802D70
	stmdb sp!, {r3, lr}
	ldr r1, _03802DA8 ; =0x0380FFFC
	ldr r0, _03802DAC ; =MIC_IrqHandler
	ldr r1, [r1]
	cmp r1, r0
	bne _03802DA0
	bl OS_DisableInterrupts
	ldr r1, _03802DB0 ; =micIntrInfo
	ldr r2, _03802DA8 ; =0x0380FFFC
	ldr r1, [r1, #0xc]
	str r1, [r2]
	bl OS_RestoreInterrupts
_03802DA0:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03802DA8: .word 0x0380FFFC
_03802DAC: .word MIC_IrqHandler
_03802DB0: .word micIntrInfo
	arm_func_end MIC_DisableMultipleInterrupt

	arm_func_start MIC_IrqHandler
MIC_IrqHandler: ; 0x03802DB4
	mov ip, #0x4000000
	add r1, ip, #0x208
	ldrh r0, [r1]
	tst r0, r0
	bxeq lr
	ldr r3, [ip, #0x210]
	ldr r1, [ip, #0x214]
	ands r2, r1, r3
	bxeq lr
	ldr r0, _03802F20 ; =0x01DF3FFF
	tst r2, r0
	streq r2, [ip, #0x214]
	bxeq lr
	stmdb sp!, {lr}
	mrs r0, spsr
	stmdb sp!, {r0}
	stmdb sp, {sp, lr} ^
	sub sp, sp, #8
	mov r0, #0x9f
	msr cpsr_c, r0
	ldr r1, _03802F24 ; =OSi_ThreadInfo
	ldrh r0, [r1, #2]
	add r0, r0, #1
	strh r0, [r1, #2]
	ldr r1, _03802F28 ; =micIntrInfo
	cmp r0, #1
	moveq r0, sp
	ldreq sp, [r1, #4]
	streq r0, [r1, #4]
	stmdb sp!, {r3}
	ldr r1, _03802F2C ; =micIntrPrio
	ldr r0, [r1]
	tst r0, r2
	strne r0, [ip, #0x214]
	ldrne r0, [r1, #4]
	ldrne r3, _03802F30 ; =OS_IRQTable
	ldrne r0, [r3, r0, lsl #2]
	bne _03802E90
	mov r3, #1
_03802E50:
	ldr r0, [r1, r3, lsl #3]
	tst r0, r2
	addeq r3, r3, #1
	beq _03802E50
	str r0, [ip, #0x214]
	add r0, r1, r3, lsl #3
	ldr r2, [r0, #4]
	ldr r3, _03802F30 ; =OS_IRQTable
	ldr r0, [r3, r2, lsl #2]
	ldr r2, _03802F24 ; =OSi_ThreadInfo
	ldrh r3, [r2, #2]
	cmp r3, #1
	ldreq r2, [r1]
	streq r2, [ip, #0x210]
	moveq r2, #0x1f
	msreq cpsr_c, r2
_03802E90:
	ldr r1, [ip, #0x210]
	stmdb sp!, {r1}
	add lr, pc, #0x0 ; =sub_03802EA0
	bx r0
	mov r0, #0x9f
	msr cpsr_c, r0
	mov ip, #0x4000000
	ldmia sp!, {r0}
	ldr r1, [ip, #0x210]
	eor r2, r0, r1
	and r1, r2, r1
	and r0, r2, r0
	ldmia sp!, {r3}
	orr r3, r3, r1
	bic r3, r3, r0
	str r3, [ip, #0x210]
	ldr r2, _03802F24 ; =OSi_ThreadInfo
	ldr r3, _03802F28 ; =micIntrInfo
	ldrh r0, [r2, #2]
	subs r1, r0, #1
	strh r1, [r2, #2]
	moveq r0, sp
	ldreq sp, [r3, #4]
	streq r0, [r3, #4]
	mov r0, #0x92
	msr cpsr_c, r0
	ldmia sp, {sp, lr} ^
	mov r0, r0
	add sp, sp, #8
	ldmia sp!, {r0}
	msr spsr_fc, r0
	tst r1, r1
	ldreq r0, _03802F34 ; =OS_IrqHandler_ThreadSwitch
	addeq lr, pc, #0x0 ; =_03802F1C
	bxeq r0
_03802F1C:
	ldmia sp!, {pc}
	.align 2, 0
_03802F20: .word 0x01DF3FFF
_03802F24: .word OSi_ThreadInfo
_03802F28: .word micIntrInfo
_03802F2C: .word micIntrPrio
_03802F30: .word OS_IRQTable
_03802F34: .word OS_IrqHandler_ThreadSwitch
	arm_func_end MIC_IrqHandler

	arm_func_start CTRDGi_InitCommon
CTRDGi_InitCommon: ; 0x03802F38
	stmdb sp!, {r3, lr}
	ldr r1, _03802F68 ; =CTRDGi_Work
	mov r3, #0
	ldr r2, _03802F6C ; =0x05000001
	add r0, sp, #0
	str r3, [sp]
	bl __VENEER_SVC_CpuSet
	bl OS_GetLockID
	ldr r1, _03802F70 ; =CTRDGi_EnableFlag
	strh r0, [r1, #6]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03802F68: .word CTRDGi_Work
_03802F6C: .word 0x05000001
_03802F70: .word CTRDGi_EnableFlag
	arm_func_end CTRDGi_InitCommon

	arm_func_start __VENEER_SVC_CpuSet
__VENEER_SVC_CpuSet: ; 0x03802F74
	ldr ip, _03802F7C ; =SVC_CpuSet
	bx ip
	.align 2, 0
_03802F7C: .word SVC_CpuSet
	arm_func_end __VENEER_SVC_CpuSet

	arm_func_start CTRDG_IsPulledOut
CTRDG_IsPulledOut: ; 0x03802F80
	stmdb sp!, {r3, lr}
	ldr r2, _03802FC8 ; =0x027FFC30
	ldr r0, _03802FCC ; =0x0000FFFF
	ldrh r1, [r2]
	cmp r1, r0
	moveq r0, #0
	beq _03802FC0
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1e
	movs r0, r0, lsr #0x1f
	bne _03802FB0
	bl CTRDG_IsExisting
_03802FB0:
	ldr r0, _03802FC8 ; =0x027FFC30
	ldrb r0, [r0, #5]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1f
_03802FC0:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03802FC8: .word 0x027FFC30
_03802FCC: .word 0x0000FFFF
	arm_func_end CTRDG_IsPulledOut

	arm_func_start CTRDG_IsExisting
CTRDG_IsExisting: ; 0x03802FD0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r2, _038030E8 ; =0x027FFC30
	mov r4, #1
	ldrh r1, [r2]
	rsb r0, r4, #0x10000
	cmp r1, r0
	moveq r0, #0
	beq _038030DC
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	moveq r0, #0
	beq _038030DC
	ldr r0, _038030EC ; =CTRDGi_EnableFlag
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl CTRDGi_LockByProcessor
	cmp r0, #0
	bne _03803034
	ldr r0, [sp, #0xc]
	bl OS_RestoreInterrupts
	mov r0, r4
	b _038030DC
_03803034:
	add r0, sp, #0
	bl CTRDGi_ChangeLatestAccessCycle
	mov r0, #0x8000000
	ldrb r2, [r0, #0xb2]
	cmp r2, #0x96
	bne _03803060
	ldr r1, _038030E8 ; =0x027FFC30
	ldrh r0, [r0, #0xbe]
	ldrh r1, [r1]
	cmp r1, r0
	bne _038030A4
_03803060:
	cmp r2, #0x96
	ldrne r1, _038030E8 ; =0x027FFC30
	ldrne r0, _038030F0 ; =0x0801FFFE
	ldrneh r1, [r1]
	ldrneh r0, [r0]
	cmpne r1, r0
	bne _038030A4
	ldr r2, _038030E8 ; =0x027FFC30
	mov r0, #0x8000000
	ldr r1, [r2, #8]
	ldr r0, [r0, #0xac]
	cmp r1, r0
	beq _038030B8
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _038030B8
_038030A4:
	ldr r1, _038030E8 ; =0x027FFC30
	mov r4, #0
	ldrb r0, [r1, #5]
	orr r0, r0, #2
	strb r0, [r1, #5]
_038030B8:
	ldr r0, [sp]
	bl MI_SetCartridgeRomCycle1st
	ldr r0, [sp, #4]
	bl MI_SetCartridgeRomCycle2nd
	ldr r0, _038030EC ; =CTRDGi_EnableFlag
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl CTRDGi_UnlockByProcessor
	mov r0, r4
_038030DC:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_038030E8: .word 0x027FFC30
_038030EC: .word CTRDGi_EnableFlag
_038030F0: .word 0x0801FFFE
	arm_func_end CTRDG_IsExisting

	arm_func_start CTRDGi_ChangeLatestAccessCycle
CTRDGi_ChangeLatestAccessCycle: ; 0x038030F4
	stmdb sp!, {r3, lr}
	ldr r2, _03803134 ; =0x04000204
	ldrh r1, [r2]
	and r1, r1, #0xc
	mov r1, r1, asr #2
	str r1, [r0]
	ldrh r1, [r2]
	and r1, r1, #0x10
	mov r1, r1, asr #4
	str r1, [r0, #4]
	mov r0, #3
	bl MI_SetCartridgeRomCycle1st
	mov r0, #0
	bl MI_SetCartridgeRomCycle2nd
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03803134: .word 0x04000204
	arm_func_end CTRDGi_ChangeLatestAccessCycle

	arm_func_start MI_SetCartridgeRomCycle1st
MI_SetCartridgeRomCycle1st: ; 0x03803138
	ldr r2, _03803150 ; =0x04000204
	ldrh r1, [r2]
	bic r1, r1, #0xc
	orr r0, r1, r0, lsl #2
	strh r0, [r2]
	bx lr
	.align 2, 0
_03803150: .word 0x04000204
	arm_func_end MI_SetCartridgeRomCycle1st

	arm_func_start MI_SetCartridgeRomCycle2nd
MI_SetCartridgeRomCycle2nd: ; 0x03803154
	ldr r2, _0380316C ; =0x04000204
	ldrh r1, [r2]
	bic r1, r1, #0x10
	orr r0, r1, r0, lsl #4
	strh r0, [r2]
	bx lr
	.align 2, 0
_0380316C: .word 0x04000204
	arm_func_end MI_SetCartridgeRomCycle2nd

	arm_func_start CTRDGi_LockByProcessor
CTRDGi_LockByProcessor: ; 0x03803170
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	bl OS_DisableInterrupts
	str r0, [r4, #4]
	ldr r0, _038031BC ; =0x027FFFE8
	bl OS_ReadOwnerOfLockWord
	ands r0, r0, #0x80
	str r0, [r4]
	bne _038031A8
	mov r0, r5
	bl OS_TryLockCartridge
	cmp r0, #0
	bne _038031B0
_038031A8:
	mov r0, #1
	b _038031B4
_038031B0:
	mov r0, #0
_038031B4:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_038031BC: .word 0x027FFFE8
	arm_func_end CTRDGi_LockByProcessor

	arm_func_start CTRDGi_UnlockByProcessor
CTRDGi_UnlockByProcessor: ; 0x038031C0
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldr r1, [r4]
	cmp r1, #0
	bne _038031D8
	bl OS_UnLockCartridge
_038031D8:
	ldr r0, [r4, #4]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end CTRDGi_UnlockByProcessor

	arm_func_start CTRDGi_SendtoPxi
CTRDGi_SendtoPxi: ; 0x038031E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, #1
	mov r5, #0xd
	mov r4, #0
	b _03803208
_03803200:
	mov r0, r6
	bl VENEER_SVC_WaitByLoop
_03803208:
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	bne _03803200
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end CTRDGi_SendtoPxi

	arm_func_start CTRDG_Init
CTRDG_Init: ; 0x03803228
	stmdb sp!, {r3, lr}
	bl OS_InitTick
	bl OS_InitAlarm
	ldr r0, _038032B0 ; =pulse_edge_alarm
	bl OS_CreateAlarm
	ldr r0, _038032B4 ; =lock_id
	ldr r1, [r0, #0x14]
	cmp r1, #0
	bne _038032A8
	mov r1, #1
	str r1, [r0, #0x14]
	bl CTRDGi_InitCommon
	bl OS_GetLockID
	mvn r1, #2
	cmp r0, r1
	beq _038032A8
	ldr r1, _038032B4 ; =lock_id
	strh r0, [r1]
	bl PXI_Init
	ldr r1, _038032B8 ; =CTRDGi_CallbackForInitModuleInfo
	mov r0, #0xd
	bl PXI_SetFifoRecvCallback
	bl CTRDGi_InitModuleInfo
	ldr r1, _038032BC ; =CTRDGi_CallbackForPulledOut
	mov r0, #0xd
	bl PXI_SetFifoRecvCallback
	ldr r1, _038032C0 ; =CTRDGi_CallbackForCTREx
	mov r0, #0x10
	bl PXI_SetFifoRecvCallback
	ldr r1, _038032C4 ; =CTRDGi_CallbackForSetPhi
	mov r0, #0x11
	bl PXI_SetFifoRecvCallback
_038032A8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038032B0: .word pulse_edge_alarm
_038032B4: .word lock_id
_038032B8: .word CTRDGi_CallbackForInitModuleInfo
_038032BC: .word CTRDGi_CallbackForPulledOut
_038032C0: .word CTRDGi_CallbackForCTREx
_038032C4: .word CTRDGi_CallbackForSetPhi
	arm_func_end CTRDG_Init

	arm_func_start CTRDGi_InitModuleInfo
CTRDGi_InitModuleInfo: ; 0x038032C8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _03803424 ; =lock_id
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _0380341C
	ldr r1, _03803428 ; =0x04000300
	mov r2, #1
	ldrh r1, [r1]
	str r2, [r0, #8]
	tst r1, #1
	beq _0380341C
	mov r0, #0x40000
	bl OS_SetIrqMask
	ldr r2, _0380342C ; =0x04000208
	mov r1, #1
	ldrh sb, [r2]
	ldr r5, _03803424 ; =lock_id
	mov r4, r0
	strh r1, [r2]
	mov r6, #0x100
	b _03803324
_0380331C:
	mov r0, r6
	bl VENEER_SVC_WaitByLoop
_03803324:
	ldr r0, [r5, #0x28]
	cmp r0, #1
	bne _0380331C
	ldr r0, _03803424 ; =lock_id
	mov r1, #0x8000000
	ldr r2, [r0, #0x18]
	ldr r0, _03803430 ; =0x01FFFFC0
	add r8, r1, #4
	and r0, r2, r0
	mov r0, r0, lsr #6
	mov r0, r0, lsl #5
	add r5, r0, #0x2000000
	mov r6, #1
	bl OS_GetLockID
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	mov r0, r7
	bl OS_LockCartridge
	ldr ip, _03803434 ; =0x0000FFFF
	mov sl, #0
	eor r0, ip, #3
	eor r1, ip, #0x84
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r3, r1, lsr #0x10
	b _038033CC
_03803390:
	mov lr, ip
	cmp sl, #0x4c
	moveq lr, r3
	beq _038033A8
	cmp sl, #0x4d
	moveq lr, r2
_038033A8:
	add r0, r5, sl, lsl #1
	mov r1, sl, lsl #1
	ldrh r0, [r0, #4]
	ldrh r1, [r8, r1]
	and r0, lr, r0
	cmp r0, r1
	movne r6, #0
	bne _038033D4
	add sl, sl, #1
_038033CC:
	cmp sl, #0x4e
	blt _03803390
_038033D4:
	mov r0, r7
	bl OS_UnLockCartridge
	mov r0, r7
	bl OS_ReleaseLockID
	ldr r2, _03803438 ; =0x027FFC30
	and r0, r6, #0xff
	ldrb r1, [r2, #5]
	and r0, r0, #1
	bic r1, r1, #1
	orr r1, r1, r0
	mov r0, #1
	strb r1, [r2, #5]
	bl CTRDGi_SendtoPxi
	ldr r2, _0380342C ; =0x04000208
	mov r0, r4
	ldrh r1, [r2]
	strh sb, [r2]
	bl OS_SetIrqMask
_0380341C:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_03803424: .word lock_id
_03803428: .word 0x04000300
_0380342C: .word 0x04000208
_03803430: .word 0x01FFFFC0
_03803434: .word 0x0000FFFF
_03803438: .word 0x027FFC30
	arm_func_end CTRDGi_InitModuleInfo

	arm_func_start CTRDGi_CallbackForInitModuleInfo
CTRDGi_CallbackForInitModuleInfo: ; 0x0380343C
	stmdb sp!, {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	ldreq r0, _03803468 ; =lock_id
	moveq r2, #1
	streq r1, [r0, #0x18]
	streq r2, [r0, #0x28]
	beq _03803460
	bl OS_Terminate
_03803460:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03803468: .word lock_id
	arm_func_end CTRDGi_CallbackForInitModuleInfo

	arm_func_start CTRDGi_CallbackForPulledOut
CTRDGi_CallbackForPulledOut: ; 0x0380346C
	stmdb sp!, {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #2
	bne _03803494
	mov r0, #0
	bl CTRDG_VibPulseEdgeUpdate
	bl SND_BeginSleep
	bl WVR_Shutdown
	bl OS_Terminate
	b _03803498
_03803494:
	bl OS_Terminate
_03803498:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end CTRDGi_CallbackForPulledOut

	arm_func_start CTRDGi_CallbackForCTREx
CTRDGi_CallbackForCTREx: ; 0x038034A0
	ldr ip, _038034AC ; =CTRDG_VibPulseEdgeUpdate
	mov r0, r1
	bx ip
	.align 2, 0
_038034AC: .word CTRDG_VibPulseEdgeUpdate
	arm_func_end CTRDGi_CallbackForCTREx

	arm_func_start CTRDG_VibPulseEdgeUpdate
CTRDG_VibPulseEdgeUpdate: ; 0x038034B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs r5, r0
	beq _038034EC
	ldr r0, [r5]
	cmp r0, #0
	bne _038034EC
	ldr r0, [r5, #0x44]
	add r0, r0, #1
	str r0, [r5, #0x44]
	ldr r1, [r5, #0x40]
	cmp r1, #0
	beq _038034EC
	ldr r0, [r5, #0x44]
	cmp r0, r1
	movhi r5, #0
_038034EC:
	cmp r5, #0
	ldrne r0, [r5, #0x3c]
	cmpne r0, #0
	bne _03803590
	bl OS_DisableInterrupts
	ldr r4, _038036CC ; =lock_id
	mov sb, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _0380357C
	mov sl, #0
	ldr r7, _038036D0 ; =0x027FFFE8
	ldr r5, _038036D4 ; =0x08001000
	mov r6, sl
	mov fp, #1
	b _03803574
_0380352C:
	mov r0, r7
	bl OS_ReadOwnerOfLockWord
	ands r8, r0, #0x80
	bne _0380354C
	ldrh r0, [r4]
	bl OS_TryLockCartridge
	cmp r0, #0
	bne _0380356C
_0380354C:
	str r6, [r4, #4]
	mov sl, fp
	strh r6, [r5]
	cmp r8, #0
	bne _03803574
	ldrh r0, [r4]
	bl OS_UnlockCartridge
	b _03803574
_0380356C:
	ldr r0, _038036D8 ; =0x000080E8
	bl OS_SpinWait
_03803574:
	cmp sl, #0
	beq _0380352C
_0380357C:
	ldr r0, _038036DC ; =pulse_edge_alarm
	bl OS_CancelAlarm
	mov r0, sb
	bl OS_RestoreInterrupts
	b _038036C4
_03803590:
	cmp r5, #0
	beq _038036C4
	ldr r0, _038036D0 ; =0x027FFFE8
	bl OS_ReadOwnerOfLockWord
	ands r4, r0, #0x80
	bne _038035BC
	ldr r0, _038036CC ; =lock_id
	ldrh r0, [r0]
	bl OS_TryLockCartridge
	cmp r0, #0
	bne _038036AC
_038035BC:
	ldr r1, [r5]
	ldr r0, [r5, #4]
	cmp r1, r0
	bne _03803604
	ldr r0, _038036CC ; =lock_id
	mov r2, #0
	ldr r1, _038036D4 ; =0x08001000
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5, #8]
	ldr r0, _038036DC ; =pulse_edge_alarm
	ldr r3, _038036E0 ; =CTRDG_VibPulseEdgeUpdate
	mov r2, #0
	bl OS_SetAlarm
	mov r0, #0
	str r0, [r5]
	b _03803694
_03803604:
	tst r1, #1
	ldr r1, _038036D4 ; =0x08001000
	beq _03803654
	ldr r0, _038036CC ; =lock_id
	mov r2, #0
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5]
	ldr r0, _038036DC ; =pulse_edge_alarm
	mov r1, r1, lsr #1
	add r1, r5, r1, lsl #2
	ldr r1, [r1, #0x24]
	ldr r3, _038036E0 ; =CTRDG_VibPulseEdgeUpdate
	mov r2, #0
	bl OS_SetAlarm
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _03803694
_03803654:
	ldr r0, _038036CC ; =lock_id
	mov r2, #2
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5]
	ldr r0, _038036DC ; =pulse_edge_alarm
	mov r1, r1, lsr #1
	add r1, r5, r1, lsl #2
	ldr r1, [r1, #0xc]
	ldr r3, _038036E0 ; =CTRDG_VibPulseEdgeUpdate
	mov r2, #0
	bl OS_SetAlarm
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_03803694:
	cmp r4, #0
	bne _038036C4
	ldr r0, _038036CC ; =lock_id
	ldrh r0, [r0]
	bl OS_UnlockCartridge
	b _038036C4
_038036AC:
	ldr r0, _038036DC ; =pulse_edge_alarm
	ldr r1, _038036E4 ; =0x0000020B
	ldr r3, _038036E0 ; =CTRDG_VibPulseEdgeUpdate
	mov r2, #0
	str r5, [sp]
	bl OS_SetAlarm
_038036C4:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_038036CC: .word lock_id
_038036D0: .word 0x027FFFE8
_038036D4: .word 0x08001000
_038036D8: .word 0x000080E8
_038036DC: .word pulse_edge_alarm
_038036E0: .word CTRDG_VibPulseEdgeUpdate
_038036E4: .word 0x0000020B
	arm_func_end CTRDG_VibPulseEdgeUpdate

	arm_func_start CTRDG_CheckPullOut_Polling
CTRDG_CheckPullOut_Polling: ; 0x038036E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _038037D8 ; =isFirstCheck$3769
	mvn r0, #0
	ldr r3, [r1, #4]
	cmp r3, r0
	ldreq r0, _038037DC ; =0x027FFC3C
	ldreq r0, [r0]
	addeq r0, r0, #0xa
	streq r0, [r1, #4]
	beq _038037D0
	ldr r0, _038037E0 ; =lock_id
	ldr r2, [r0, #0x10]
	cmp r2, #0
	ldreq r0, [r0, #0xc]
	cmpeq r0, #0
	bne _038037D0
	ldr r2, _038037DC ; =0x027FFC3C
	ldr r0, [r2]
	cmp r0, r3
	blo _038037D0
	ldr r0, [r2]
	add r0, r0, #0xa
	str r0, [r1, #4]
	bl CTRDG_IsPulledOut
	ldr r1, _038037E0 ; =lock_id
	str r0, [r1, #0xc]
	bl CTRDG_IsExisting
	cmp r0, #0
	bne _03803780
	ldr r0, _038037D8 ; =isFirstCheck$3769
	mov r1, #1
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, _038037E0 ; =lock_id
	strne r1, [r0, #0x10]
	bne _038037D0
	ldr r0, _038037E0 ; =lock_id
	str r1, [r0, #0xc]
_03803780:
	ldr r0, _038037E0 ; =lock_id
	ldr r1, _038037D8 ; =isFirstCheck$3769
	ldr r0, [r0, #0xc]
	mov r2, #0
	str r2, [r1]
	cmp r0, #0
	beq _038037D0
	mov r7, #0x64
	mov r6, #0xd
	mov r5, #0x11
	mov r4, r2
	b _038037B8
_038037B0:
	mov r0, r7
	bl OS_Sleep
_038037B8:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	bne _038037B0
_038037D0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_038037D8: .word isFirstCheck$3769
_038037DC: .word 0x027FFC3C
_038037E0: .word lock_id
	arm_func_end CTRDG_CheckPullOut_Polling

	arm_func_start CTRDGi_CallbackForSetPhi
CTRDGi_CallbackForSetPhi: ; 0x038037E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	and r0, r1, #0x3f
	cmp r0, #3
	bne _0380384C
	ldr r3, _03803858 ; =0x04000204
	ldr r0, _0380385C ; =0x01FFFFC0
	ldrh r2, [r3]
	and r0, r1, r0
	mov r1, r0, lsr #6
	bic r0, r2, #0x60
	orr r0, r0, r1, lsl #5
	strh r0, [r3]
	mov r7, #1
	mov r6, #0x11
	mov r5, #0x12
	mov r4, #0
	b _03803830
_03803828:
	mov r0, r7
	bl VENEER_SVC_WaitByLoop
_03803830:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	bne _03803828
	b _03803850
_0380384C:
	bl OS_Terminate
_03803850:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03803858: .word 0x04000204
_0380385C: .word 0x01FFFFC0
	arm_func_end CTRDGi_CallbackForSetPhi

	arm_func_start NVRAM_Init
NVRAM_Init: ; 0x03803860
	ldr r0, _03803884 ; =nvramw
	mov r3, #0
	mov r2, r3
_0380386C:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _0380386C
	bx lr
	.align 2, 0
_03803884: .word nvramw
	arm_func_end NVRAM_Init

	arm_func_start NVRAM_AnalyzeCommand
NVRAM_AnalyzeCommand: ; 0x03803888
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	tst r0, #0x2000000
	beq _038038B8
	ldr r2, _03803A28 ; =nvramw
	mov r5, #0
	mov lr, r5
_038038A4:
	mov r4, r5, lsl #1
	add r5, r5, #1
	strh lr, [r2, r4]
	cmp r5, #0x10
	blt _038038A4
_038038B8:
	ldr r2, _03803A28 ; =nvramw
	and r4, r0, #0xf0000
	mov r4, r4, lsr #0x10
	mov r4, r4, lsl #1
	strh r0, [r2, r4]
	tst r0, #0x1000000
	beq _03803A1C
	ldr lr, _03803A2C ; =nvramw
	ldrh r0, [lr]
	and r2, r0, #0xff00
	mov r2, r2, lsl #8
	mov r4, r2, lsr #0x10
	sub r2, r4, #0x22
	cmp r2, #0xa
	addls pc, pc, r2, lsl #2
	b _038039F0
_038038F8: ; jump table
	b _03803924 ; case 0
	b _0380395C ; case 1
	b _0380395C ; case 2
	b _038039A4 ; case 3
	b _038039A4 ; case 4
	b _038039E4 ; case 5
	b _038039E4 ; case 6
	b _038039F0 ; case 7
	b _038039F0 ; case 8
	b _038039F0 ; case 9
	b _03803924 ; case 10
_03803924:
	ldrh ip, [lr, #4]
	ldrh r2, [lr, #2]
	mov r0, r0, lsl #0x18
	and ip, ip, #0xff00
	orr r0, r0, r2, lsl #8
	orr ip, r0, ip, lsr #8
	cmp ip, #0x2000000
	blo _0380394C
	cmp ip, #0x2800000
	blo _038039F0
_0380394C:
	mov r0, r4
	mov r1, #2
	bl SPIi_ReturnResult
	b _03803A1C
_0380395C:
	ldrh r2, [lr, #8]
	ldrh r1, [lr, #0xa]
	orr ip, r1, r2, lsl #16
	cmp ip, #0x2000000
	blo _03803978
	cmp ip, #0x2800000
	blo _03803988
_03803978:
	mov r0, r4
	mov r1, #2
	bl SPIi_ReturnResult
	b _03803A1C
_03803988:
	ldrh r2, [lr, #2]
	mov r3, r0, lsl #0x18
	ldrh r1, [lr, #4]
	ldrh r0, [lr, #6]
	orr r3, r2, r3, lsr #8
	orr r1, r0, r1, lsl #16
	b _038039F0
_038039A4:
	ldrh r2, [lr, #6]
	ldrh r1, [lr, #8]
	orr ip, r1, r2, lsl #16
	cmp ip, #0x2000000
	blo _038039C0
	cmp ip, #0x2800000
	blo _038039D0
_038039C0:
	mov r0, r4
	mov r1, #2
	bl SPIi_ReturnResult
	b _03803A1C
_038039D0:
	ldrh r2, [lr, #2]
	mov r0, r0, lsl #0x18
	ldrh r1, [lr, #4]
	orr r3, r2, r0, lsr #8
	b _038039F0
_038039E4:
	ldrh r2, [lr, #2]
	mov r0, r0, lsl #0x18
	orr r3, r2, r0, lsr #8
_038039F0:
	str r1, [sp]
	mov r1, r4
	mov r0, #1
	mov r2, #3
	str ip, [sp, #4]
	bl SPIi_SetEntry
	cmp r0, #0
	bne _03803A1C
	mov r0, r4
	mov r1, #4
	bl SPIi_ReturnResult
_03803A1C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03803A28: .word nvramw
_03803A2C: .word nvramw
	arm_func_end NVRAM_AnalyzeCommand

	arm_func_start NVRAM_ExecuteProcess
NVRAM_ExecuteProcess: ; 0x03803A30
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	mov r5, r0
	mov r0, #1
	bl SPIi_CheckException
	cmp r0, #0
	bne _03803A70
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r0, [r4, #4]
	mov r1, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	b _03803CFC
_03803A70:
	mov r0, #1
	bl SPIi_GetException
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r0, [r4, #4]
	sub r0, r0, #0x20
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _03803CC0
_03803A94: ; jump table
	b _03803ACC ; case 0
	b _03803AD4 ; case 1
	b _03803ADC ; case 2
	b _03803AE8 ; case 3
	b _03803B28 ; case 4
	b _03803B68 ; case 5
	b _03803BB0 ; case 6
	b _03803BF8 ; case 7
	b _03803C30 ; case 8
	b _03803C68 ; case 9
	b _03803C70 ; case 10
	b _03803C78 ; case 11
	b _03803CAC ; case 12
	b _03803CB8 ; case 13
_03803ACC:
	bl NVRAM_WriteEnable
	b _03803CE0
_03803AD4:
	bl NVRAM_WriteDisable
	b _03803CE0
_03803ADC:
	ldr r0, [r4, #0x10]
	bl NVRAM_ReadStatusRegister
	b _03803CE0
_03803AE8:
	bl NvramCheckReadyToRead
	cmp r0, #0
	bne _03803B14
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	mov r0, #1
	bl SPIi_ReleaseException
	b _03803CFC
_03803B14:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	bl NVRAM_ReadDataBytes
	b _03803CE0
_03803B28:
	bl NvramCheckReadyToRead
	cmp r0, #0
	bne _03803B54
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	mov r0, #1
	bl SPIi_ReleaseException
	b _03803CFC
_03803B54:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	bl NVRAM_ReadDataBytesAtHigherSpeed
	b _03803CE0
_03803B68:
	bl NvramCheckReadyToWrite
	cmp r0, #0
	bne _03803B94
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	mov r0, #1
	bl SPIi_ReleaseException
	b _03803CFC
_03803B94:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	mov r1, r1, lsl #0x10
	ldr r2, [r4, #0x10]
	mov r1, r1, lsr #0x10
	bl NVRAM_PageWrite
	b _03803CE0
_03803BB0:
	bl NvramCheckReadyToWrite
	cmp r0, #0
	bne _03803BDC
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	mov r0, #1
	bl SPIi_ReleaseException
	b _03803CFC
_03803BDC:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	mov r1, r1, lsl #0x10
	ldr r2, [r4, #0x10]
	mov r1, r1, lsr #0x10
	bl NVRAM_PageProgram
	b _03803CE0
_03803BF8:
	bl NvramCheckReadyToWrite
	cmp r0, #0
	bne _03803C24
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	mov r0, #1
	bl SPIi_ReleaseException
	b _03803CFC
_03803C24:
	ldr r0, [r4, #8]
	bl NVRAM_PageErase
	b _03803CE0
_03803C30:
	bl NvramCheckReadyToWrite
	cmp r0, #0
	bne _03803C5C
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	mov r0, #1
	bl SPIi_ReleaseException
	b _03803CFC
_03803C5C:
	ldr r0, [r4, #8]
	bl NVRAM_SectorErase
	b _03803CE0
_03803C68:
	bl NVRAM_DeepPowerDown
	b _03803CE0
_03803C70:
	bl NVRAM_ReleaseFromDeepPowerDown
	b _03803CE0
_03803C78:
	bl NvramCheckReadyToWrite
	cmp r0, #0
	bne _03803CA4
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	mov r0, #1
	bl SPIi_ReleaseException
	b _03803CFC
_03803CA4:
	bl NVRAM_ChipErase
	b _03803CE0
_03803CAC:
	ldr r0, [r4, #0x10]
	bl NVRAM_ReadSiliconId
	b _03803CE0
_03803CB8:
	bl NVRAM_SoftwareReset
	b _03803CE0
_03803CC0:
	mov r0, #1
	bl SPIi_ReleaseException
	ldr r0, [r4, #4]
	mov r1, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	b _03803CFC
_03803CE0:
	ldr r0, [r4, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl SPIi_ReturnResult
	mov r0, #1
	bl SPIi_ReleaseException
_03803CFC:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end NVRAM_ExecuteProcess

	arm_func_start NvramCheckReadyToRead
NvramCheckReadyToRead: ; 0x03803D04
	stmdb sp!, {r3, lr}
	add r0, sp, #0
	bl NVRAM_ReadStatusRegister
	ldrh r0, [sp]
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end NvramCheckReadyToRead

	arm_func_start NvramCheckReadyToWrite
NvramCheckReadyToWrite: ; 0x03803D28
	stmdb sp!, {r3, lr}
	add r0, sp, #0
	bl NVRAM_ReadStatusRegister
	ldrh r0, [sp]
	tst r0, #1
	movne r0, #0
	bne _03803D50
	tst r0, #2
	movne r0, #1
	moveq r0, #0
_03803D50:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end NvramCheckReadyToWrite

	arm_func_start NVRAM_WriteEnable
NVRAM_WriteEnable: ; 0x03803D58
	ldr r2, _03803D90 ; =0x040001C0
_03803D5C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803D5C
	ldr r0, _03803D94 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #6
	strh r1, [r0]
	sub r1, r0, #2
_03803D80:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03803D80
	bx lr
	.align 2, 0
_03803D90: .word 0x040001C0
_03803D94: .word 0x040001C2
	arm_func_end NVRAM_WriteEnable

	arm_func_start SPI_SendWait_03803D98
SPI_SendWait_03803D98: ; 0x03803D98
	ldr r1, _03803DB8 ; =0x040001C2
	and r0, r0, #0xff
	strh r0, [r1]
	sub r1, r1, #2
_03803DA8:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03803DA8
	bx lr
	.align 2, 0
_03803DB8: .word 0x040001C2
	arm_func_end SPI_SendWait_03803D98

	arm_func_start NVRAM_WriteDisable
NVRAM_WriteDisable: ; 0x03803DBC
	ldr r2, _03803DF4 ; =0x040001C0
_03803DC0:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803DC0
	ldr r0, _03803DF8 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #4
	strh r1, [r0]
	sub r1, r0, #2
_03803DE4:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03803DE4
	bx lr
	.align 2, 0
_03803DF4: .word 0x040001C0
_03803DF8: .word 0x040001C2
	arm_func_end NVRAM_WriteDisable

	arm_func_start NVRAM_ReadStatusRegister
NVRAM_ReadStatusRegister: ; 0x03803DFC
	ldr r3, _03803E64 ; =0x040001C0
_03803E00:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _03803E00
	ldr r1, _03803E68 ; =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #5
	strh r2, [r1]
	sub r3, r1, #2
_03803E24:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _03803E24
	ldr r1, _03803E68 ; =0x040001C2
	mov r2, #0x8100
	strh r2, [r3]
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_03803E48:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03803E48
	ldr r1, _03803E68 ; =0x040001C2
	ldrh r1, [r1]
	strb r1, [r0]
	bx lr
	.align 2, 0
_03803E64: .word 0x040001C0
_03803E68: .word 0x040001C2
	arm_func_end NVRAM_ReadStatusRegister

	arm_func_start NVRAM_ReadDataBytes
NVRAM_ReadDataBytes: ; 0x03803E6C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r2
	cmp r1, #1
	blo _03803F5C
	and r2, r0, #0xff00
	mov r2, r2, lsr #8
	and r3, r0, #0xff0000
	strh r2, [sp, #2]
	mov r3, r3, lsr #0x10
	and r0, r0, #0xff
	ldr r2, _03803F68 ; =0x040001C0
	strh r3, [sp]
	strh r0, [sp, #4]
_03803EA4:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803EA4
	ldr r4, _03803F6C ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r2]
	mov r0, #3
	strh r0, [r4]
	mov ip, #0
	add r2, sp, #0
	sub r3, r4, #2
_03803ED0:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _03803ED0
	mov r0, ip, lsl #1
	ldrh r0, [r2, r0]
	add ip, ip, #1
	and r0, r0, #0xff
	strh r0, [r4]
	cmp ip, #3
	blt _03803ED0
	ldr r2, _03803F68 ; =0x040001C0
_03803EFC:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803EFC
	mov r4, #0
	ldr r2, _03803F68 ; =0x040001C0
	sub r0, r1, #1
	mov r3, r4
	b _03803F38
_03803F1C:
	strh r3, [r2, #2]
_03803F20:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03803F20
	ldrh r1, [r2, #2]
	strb r1, [r5, r4]
	add r4, r4, #1
_03803F38:
	cmp r4, r0
	blo _03803F1C
	ldr r0, _03803F68 ; =0x040001C0
	mov r1, #0x8100
	strh r1, [r0]
	bl SPI_DummyWait_03803F70
	ldr r0, _03803F6C ; =0x040001C2
	ldrh r0, [r0]
	strb r0, [r5, r4]
_03803F5C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03803F68: .word 0x040001C0
_03803F6C: .word 0x040001C2
	arm_func_end NVRAM_ReadDataBytes

	arm_func_start SPI_DummyWait_03803F70
SPI_DummyWait_03803F70: ; 0x03803F70
	ldr r0, _03803F90 ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_03803F80:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03803F80
	bx lr
	.align 2, 0
_03803F90: .word 0x040001C2
	arm_func_end SPI_DummyWait_03803F70

	arm_func_start NVRAM_ReadDataBytesAtHigherSpeed
NVRAM_ReadDataBytesAtHigherSpeed: ; 0x03803F94
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r2
	cmp r1, #1
	blo _038040A0
	and r2, r0, #0xff00
	mov r2, r2, lsr #8
	and r3, r0, #0xff0000
	strh r2, [sp, #2]
	mov r3, r3, lsr #0x10
	and r0, r0, #0xff
	ldr r2, _038040AC ; =0x040001C0
	strh r3, [sp]
	strh r0, [sp, #4]
_03803FCC:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803FCC
	ldr r4, _038040B0 ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r2]
	mov r0, #0xb
	strh r0, [r4]
	mov ip, #0
	add r2, sp, #0
	sub r3, r4, #2
_03803FF8:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _03803FF8
	mov r0, ip, lsl #1
	ldrh r0, [r2, r0]
	add ip, ip, #1
	and r0, r0, #0xff
	strh r0, [r4]
	cmp ip, #3
	blt _03803FF8
	ldr r2, _038040AC ; =0x040001C0
_03804024:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03804024
	ldr r0, _038040B0 ; =0x040001C2
	mov r2, #0
	strh r2, [r0]
	sub r2, r0, #2
_03804040:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03804040
	mov r4, #0
	ldr r2, _038040AC ; =0x040001C0
	sub r0, r1, #1
	mov r3, r4
	b _0380407C
_03804060:
	strh r3, [r2, #2]
_03804064:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03804064
	ldrh r1, [r2, #2]
	strb r1, [r5, r4]
	add r4, r4, #1
_0380407C:
	cmp r4, r0
	blo _03804060
	ldr r0, _038040AC ; =0x040001C0
	mov r1, #0x8100
	strh r1, [r0]
	bl SPI_DummyWait_03803F70
	ldr r0, _038040B0 ; =0x040001C2
	ldrh r0, [r0]
	strb r0, [r5, r4]
_038040A0:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_038040AC: .word 0x040001C0
_038040B0: .word 0x040001C2
	arm_func_end NVRAM_ReadDataBytesAtHigherSpeed

	arm_func_start NVRAM_PageWrite
NVRAM_PageWrite: ; 0x038040B4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	cmp r1, #1
	blo _038041AC
	add r3, r0, r1
	sub r3, r3, #1
	mov r3, r3, lsr #8
	cmp r3, r0, lsr #8
	and r3, r0, #0xff00
	mov r3, r3, lsr #8
	andhi r1, r0, #0xff
	and ip, r0, #0xff0000
	strh r3, [sp, #2]
	rsbhi r1, r1, #0x100
	mov ip, ip, lsr #0x10
	and r0, r0, #0xff
	movhi r1, r1, lsl #0x10
	ldr r3, _038041B8 ; =0x040001C0
	strh ip, [sp]
	strh r0, [sp, #4]
	movhi r1, r1, lsr #0x10
_03804108:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _03804108
	ldr lr, _038041BC ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r3]
	mov r0, #0xa
	strh r0, [lr]
	mov r4, #0
	add r3, sp, #0
	sub ip, lr, #2
_03804134:
	ldrh r0, [ip]
	tst r0, #0x80
	bne _03804134
	mov r0, r4, lsl #1
	ldrh r0, [r3, r0]
	add r4, r4, #1
	and r0, r0, #0xff
	strh r0, [lr]
	cmp r4, #3
	blt _03804134
	sub r3, r1, #1
	ldr r1, _038041B8 ; =0x040001C0
	mov r4, #0
	b _03804184
_0380416C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0380416C
	ldrb r0, [r2, r4]
	add r4, r4, #1
	strh r0, [r1, #2]
_03804184:
	cmp r4, r3
	blt _0380416C
	ldr r1, _038041B8 ; =0x040001C0
_03804190:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804190
	mov r0, #0x8100
	strh r0, [r1]
	ldrb r0, [r2, r4]
	bl SPI_SendWait_03803D98
_038041AC:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_038041B8: .word 0x040001C0
_038041BC: .word 0x040001C2
	arm_func_end NVRAM_PageWrite

	arm_func_start NVRAM_PageProgram
NVRAM_PageProgram: ; 0x038041C0
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	cmp r1, #1
	blo _038042B8
	add r3, r0, r1
	sub r3, r3, #1
	mov r3, r3, lsr #8
	cmp r3, r0, lsr #8
	and r3, r0, #0xff00
	mov r3, r3, lsr #8
	andhi r1, r0, #0xff
	and ip, r0, #0xff0000
	strh r3, [sp, #2]
	rsbhi r1, r1, #0x100
	mov ip, ip, lsr #0x10
	and r0, r0, #0xff
	movhi r1, r1, lsl #0x10
	ldr r3, _038042C4 ; =0x040001C0
	strh ip, [sp]
	strh r0, [sp, #4]
	movhi r1, r1, lsr #0x10
_03804214:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _03804214
	ldr lr, _038042C8 ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r3]
	mov r0, #2
	strh r0, [lr]
	mov r4, #0
	add r3, sp, #0
	sub ip, lr, #2
_03804240:
	ldrh r0, [ip]
	tst r0, #0x80
	bne _03804240
	mov r0, r4, lsl #1
	ldrh r0, [r3, r0]
	add r4, r4, #1
	and r0, r0, #0xff
	strh r0, [lr]
	cmp r4, #3
	blt _03804240
	sub r3, r1, #1
	ldr r1, _038042C4 ; =0x040001C0
	mov r4, #0
	b _03804290
_03804278:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804278
	ldrb r0, [r2, r4]
	add r4, r4, #1
	strh r0, [r1, #2]
_03804290:
	cmp r4, r3
	blt _03804278
	ldr r1, _038042C4 ; =0x040001C0
_0380429C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0380429C
	mov r0, #0x8100
	strh r0, [r1]
	ldrb r0, [r2, r4]
	bl SPI_SendWait_03803D98
_038042B8:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_038042C4: .word 0x040001C0
_038042C8: .word 0x040001C2
	arm_func_end NVRAM_PageProgram

	arm_func_start NVRAM_PageErase
NVRAM_PageErase: ; 0x038042CC
	stmdb sp!, {r3, r4, r5, lr}
	and r1, r0, #0xff0000
	mov r1, r1, lsr #0x10
	and r2, r0, #0xff00
	mov r2, r2, lsl #8
	ldr r3, _0380434C ; =0x040001C0
	mov r1, r1, lsl #0x10
	and r5, r0, #0xff
	mov r0, r1, lsr #0x10
	mov r4, r2, lsr #0x10
_038042F4:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _038042F4
	ldr r1, _03804350 ; =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0xdb
	strh r2, [r1]
	sub r2, r1, #2
_03804318:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03804318
	bl SPI_SendWait_03803D98
	mov r0, r4
	bl SPI_SendWait_03803D98
	ldr r1, _0380434C ; =0x040001C0
	mov r2, #0x8100
	mov r0, r5
	strh r2, [r1]
	bl SPI_SendWait_03803D98
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0380434C: .word 0x040001C0
_03804350: .word 0x040001C2
	arm_func_end NVRAM_PageErase

	arm_func_start NVRAM_SectorErase
NVRAM_SectorErase: ; 0x03804354
	stmdb sp!, {r3, r4, r5, lr}
	and r1, r0, #0xff0000
	mov r1, r1, lsr #0x10
	and r2, r0, #0xff00
	mov r2, r2, lsl #8
	ldr r3, _038043D4 ; =0x040001C0
	mov r1, r1, lsl #0x10
	and r5, r0, #0xff
	mov r0, r1, lsr #0x10
	mov r4, r2, lsr #0x10
_0380437C:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _0380437C
	ldr r1, _038043D8 ; =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0xd8
	strh r2, [r1]
	sub r2, r1, #2
_038043A0:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _038043A0
	bl SPI_SendWait_03803D98
	mov r0, r4
	bl SPI_SendWait_03803D98
	ldr r1, _038043D4 ; =0x040001C0
	mov r2, #0x8100
	mov r0, r5
	strh r2, [r1]
	bl SPI_SendWait_03803D98
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_038043D4: .word 0x040001C0
_038043D8: .word 0x040001C2
	arm_func_end NVRAM_SectorErase

	arm_func_start NVRAM_DeepPowerDown
NVRAM_DeepPowerDown: ; 0x038043DC
	ldr r2, _03804414 ; =0x040001C0
_038043E0:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _038043E0
	ldr r0, _03804418 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xb9
	strh r1, [r0]
	sub r1, r0, #2
_03804404:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804404
	bx lr
	.align 2, 0
_03804414: .word 0x040001C0
_03804418: .word 0x040001C2
	arm_func_end NVRAM_DeepPowerDown

	arm_func_start NVRAM_ReleaseFromDeepPowerDown
NVRAM_ReleaseFromDeepPowerDown: ; 0x0380441C
	ldr r2, _03804454 ; =0x040001C0
_03804420:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03804420
	ldr r0, _03804458 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xab
	strh r1, [r0]
	sub r1, r0, #2
_03804444:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804444
	bx lr
	.align 2, 0
_03804454: .word 0x040001C0
_03804458: .word 0x040001C2
	arm_func_end NVRAM_ReleaseFromDeepPowerDown

	arm_func_start NVRAM_ChipErase
NVRAM_ChipErase: ; 0x0380445C
	ldr r2, _03804494 ; =0x040001C0
_03804460:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03804460
	ldr r0, _03804498 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xc7
	strh r1, [r0]
	sub r1, r0, #2
_03804484:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804484
	bx lr
	.align 2, 0
_03804494: .word 0x040001C0
_03804498: .word 0x040001C2
	arm_func_end NVRAM_ChipErase

	arm_func_start NVRAM_ReadSiliconId
NVRAM_ReadSiliconId: ; 0x0380449C
	stmdb sp!, {r3, lr}
	ldr r3, _03804530 ; =0x040001C0
_038044A4:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _038044A4
	ldr r1, _03804534 ; =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0x9f
	strh r2, [r1]
	sub r2, r1, #2
_038044C8:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _038044C8
	ldr r1, _03804534 ; =0x040001C2
	mov r2, #0
	strh r2, [r1]
	sub lr, r1, #2
_038044E4:
	ldrh r1, [lr]
	tst r1, #0x80
	bne _038044E4
	ldr ip, _03804534 ; =0x040001C2
	mov r2, #0x8100
	ldrh r3, [ip]
	mov r1, #0
	strb r3, [r0]
	strh r2, [lr]
	strh r1, [ip]
	sub r2, ip, #2
_03804510:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03804510
	ldr r1, _03804534 ; =0x040001C2
	ldrh r1, [r1]
	strb r1, [r0, #1]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03804530: .word 0x040001C0
_03804534: .word 0x040001C2
	arm_func_end NVRAM_ReadSiliconId

	arm_func_start NVRAM_SoftwareReset
NVRAM_SoftwareReset: ; 0x03804538
	ldr r2, _03804570 ; =0x040001C0
_0380453C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0380453C
	ldr r0, _03804574 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xff
	strh r1, [r0]
	sub r1, r0, #2
_03804560:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804560
	bx lr
	.align 2, 0
_03804570: .word 0x040001C0
_03804574: .word 0x040001C2
	arm_func_end NVRAM_SoftwareReset

	arm_func_start RTC_Init
RTC_Init: ; 0x03804578
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	ldr r2, _038047B8 ; =rtcInitialized
	mov r8, r0
	ldrh r0, [r2]
	cmp r0, #0
	bne _038047AC
	ldr r1, _038047BC ; =rtcWork
	mov r3, #1
	add r0, sp, #8
	strh r3, [r2]
	str r3, [r1, #0x1d4]
	bl RTC_ReadStatus1
	add r0, sp, #0xa
	bl RTC_ReadStatus2
	ldrh r0, [sp, #8]
	mov r1, r0, lsl #0x18
	movs r1, r1, lsr #0x1f
	bne _038045E0
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	bne _038045E0
	ldrh r0, [sp, #0xa]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1f
	beq _038045F8
_038045E0:
	ldrh r1, [sp, #8]
	add r0, sp, #8
	bic r1, r1, #1
	orr r1, r1, #1
	strh r1, [sp, #8]
	bl RTC_WriteStatus1
_038045F8:
	ldrh r0, [sp, #8]
	mov r1, r0, lsl #0x1b
	movs r1, r1, lsr #0x1f
	bne _03804614
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	beq _03804634
_03804614:
	ldrh r1, [sp, #0xa]
	add r0, sp, #0xa
	bic r1, r1, #0xf
	strh r1, [sp, #0xa]
	ldrh r1, [sp, #0xa]
	bic r1, r1, #0x40
	strh r1, [sp, #0xa]
	bl RTC_WriteStatus2
_03804634:
	ldr r0, _038047C0 ; =0x027FFDE8
	bl RTC_ReadDateTime
	ldr r0, _038047C0 ; =0x027FFDE8
	ldr r0, [r0]
	mov r0, r0, lsl #0xa
	mov r0, r0, lsr #0x1a
	bl RtcBCD2HEX
	ldr r1, _038047C0 ; =0x027FFDE8
	mov r5, r0
	ldr r0, [r1]
	mov r0, r0, lsl #0x13
	mov r0, r0, lsr #0x1b
	bl RtcBCD2HEX
	ldr r1, _038047C0 ; =0x027FFDE8
	mov r6, r0
	ldr r0, [r1]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x18
	bl RtcBCD2HEX
	sub r1, r6, #1
	cmp r1, #1
	add r7, r0, #0x7d0
	subls r7, r7, #1
	mov r0, r7
	mov r1, #0x190
	addls r6, r6, #0xc
	bl _u32_div_f
	mov r4, r0
	mov r0, r7
	mov r1, #0x64
	bl _u32_div_f
	mov r1, #0xd
	mul r1, r6, r1
	mov r6, r0
	add r0, r1, #8
	mov r1, #5
	bl _u32_div_f
	add r1, r7, r7, lsr #2
	sub r1, r1, r6
	add r1, r4, r1
	add r0, r1, r0
	add r0, r5, r0
	mov r1, #7
	bl _u32_div_f
	ldr r0, _038047C0 ; =0x027FFDE8
	ldr r2, [r0]
	mov r3, r2, lsl #5
	mov r3, r3, lsr #0x1d
	cmp r3, r1
	beq _03804710
	bic r2, r2, #0x7000000
	mov r1, r1, lsl #0x1d
	orr r1, r2, r1, lsr #5
	str r1, [r0]
	bl RTC_WriteDateTime
_03804710:
	mov r0, #1
	bl RTC_SetHourFormat
	ldr r0, _038047BC ; =rtcWork
	mov r1, #0
	str r1, [r0, #0x1d4]
	bl PXI_Init
	ldr r1, _038047C4 ; =RtcPxiCallback
	mov r0, #5
	bl PXI_SetFifoRecvCallback
	ldr r0, _038047BC ; =rtcWork
	ldr r1, _038047C8 ; =rtcWork + 0x20
	mov r2, #4
	bl OS_InitMessageQueue
	mov r0, #0x100
	stmia sp, {r0, r8}
	ldr r0, _038047CC ; =rtcWork + 0x30
	ldr r1, _038047D0 ; =RtcThread
	ldr r3, _038047D4 ; =rtcWork + 0x1D4
	mov r2, #0
	bl OS_CreateThread
	ldr r0, _038047CC ; =rtcWork + 0x30
	bl OS_WakeupThreadDirect
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	mov r0, #0x40
	mov r1, #0
	bl EXIi_SetBitRcnt0L
	mov r0, #0x100
	mov r1, r0
	bl EXIi_SetBitRcnt0L
	bl OS_DisableInterrupts
	mov r4, r0
	ldr r1, _038047D8 ; =RtcAlarmIntr
	mov r0, #0x80
	bl OS_SetIrqFunction
	mov r0, #0x80
	bl OS_EnableIrqMask
	mov r0, r4
	bl OS_RestoreInterrupts
_038047AC:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_038047B8: .word rtcInitialized
_038047BC: .word rtcWork
_038047C0: .word 0x027FFDE8
_038047C4: .word RtcPxiCallback
_038047C8: .word rtcWork + 0x20
_038047CC: .word rtcWork + 0x30
_038047D0: .word RtcThread
_038047D4: .word rtcWork + 0x1D4
_038047D8: .word RtcAlarmIntr
	arm_func_end RTC_Init

	arm_func_start RtcPxiCallback
RtcPxiCallback: ; 0x038047DC
	stmdb sp!, {r4, lr}
	cmp r2, #0
	bne _03804908
	and r0, r1, #0x7f00
	mov r0, r0, lsl #8
	mov r4, r0, lsr #0x10
	cmp r4, #0x29
	addls pc, pc, r4, lsl #2
	b _038048FC
_03804800: ; jump table
	b _038048A8 ; case 0
	b _038048A8 ; case 1
	b _038048FC ; case 2
	b _038048FC ; case 3
	b _038048FC ; case 4
	b _038048FC ; case 5
	b _038048FC ; case 6
	b _038048FC ; case 7
	b _038048FC ; case 8
	b _038048FC ; case 9
	b _038048FC ; case 10
	b _038048FC ; case 11
	b _038048FC ; case 12
	b _038048FC ; case 13
	b _038048FC ; case 14
	b _038048FC ; case 15
	b _038048A8 ; case 16
	b _038048A8 ; case 17
	b _038048A8 ; case 18
	b _038048A8 ; case 19
	b _038048A8 ; case 20
	b _038048A8 ; case 21
	b _038048A8 ; case 22
	b _038048A8 ; case 23
	b _038048A8 ; case 24
	b _038048A8 ; case 25
	b _038048FC ; case 26
	b _038048FC ; case 27
	b _038048FC ; case 28
	b _038048FC ; case 29
	b _038048FC ; case 30
	b _038048FC ; case 31
	b _038048FC ; case 32
	b _038048FC ; case 33
	b _038048FC ; case 34
	b _038048A8 ; case 35
	b _038048A8 ; case 36
	b _038048A8 ; case 37
	b _038048A8 ; case 38
	b _038048A8 ; case 39
	b _038048A8 ; case 40
	b _038048A8 ; case 41
_038048A8:
	ldr r0, _03804910 ; =rtcWork
	ldr r1, [r0, #0x1d4]
	cmp r1, #0
	beq _038048C8
	mov r0, r4
	mov r1, #3
	bl RtcReturnResult
	b _03804908
_038048C8:
	ldr r3, _03804914 ; =rtcWork + 0x100
	mov r1, #1
	str r1, [r0, #0x1d4]
	mov r1, #0
	mov r2, r1
	strh r4, [r3, #0xd8]
	bl OS_SendMessage
	cmp r0, #0
	bne _03804908
	mov r0, r4
	mov r1, #4
	bl RtcReturnResult
	b _03804908
_038048FC:
	mov r0, r4
	mov r1, #1
	bl RtcReturnResult
_03804908:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03804910: .word rtcWork
_03804914: .word rtcWork + 0x100
	arm_func_end RtcPxiCallback

	arm_func_start RtcReturnResult
RtcReturnResult: ; 0x03804918
	stmdb sp!, {r4, r5, r6, lr}
	mov r0, r0, lsl #8
	and r0, r0, #0x7f00
	orr r2, r0, #0x8000
	and r0, r1, #0xff
	orr r6, r2, r0
	mov r5, #5
	mov r4, #0
_03804938:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _03804938
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end RtcReturnResult

	arm_func_start RtcThread
RtcThread: ; 0x03804958
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r8, _03804DCC ; =0x027FFDE8
	mov r7, #0
	ldr sb, _03804DD0 ; =rtcWork
	mov r6, r7
	mov r5, r7
	mov r4, r7
	mov sl, r7
	mov fp, r7
_0380497C:
	mov r0, sb
	add r1, sp, #0
	mov r2, #1
	bl OS_ReceiveMessage
	ldr r0, _03804DD4 ; =rtcWork + 0x100
	ldrh r0, [r0, #0xd8]
	cmp r0, #0x29
	addls pc, pc, r0, lsl #2
	b _03804DB8
_038049A0: ; jump table
	b _03804A48 ; case 0
	b _03804A60 ; case 1
	b _03804DB8 ; case 2
	b _03804DB8 ; case 3
	b _03804DB8 ; case 4
	b _03804DB8 ; case 5
	b _03804DB8 ; case 6
	b _03804DB8 ; case 7
	b _03804DB8 ; case 8
	b _03804DB8 ; case 9
	b _03804DB8 ; case 10
	b _03804DB8 ; case 11
	b _03804DB8 ; case 12
	b _03804DB8 ; case 13
	b _03804DB8 ; case 14
	b _03804DB8 ; case 15
	b _03804A88 ; case 16
	b _03804AA8 ; case 17
	b _03804AC8 ; case 18
	b _03804AE8 ; case 19
	b _03804B24 ; case 20
	b _03804B60 ; case 21
	b _03804B9C ; case 22
	b _03804BBC ; case 23
	b _03804BDC ; case 24
	b _03804BFC ; case 25
	b _03804DB8 ; case 26
	b _03804DB8 ; case 27
	b _03804DB8 ; case 28
	b _03804DB8 ; case 29
	b _03804DB8 ; case 30
	b _03804DB8 ; case 31
	b _03804C1C ; case 32
	b _03804C3C ; case 33
	b _03804C64 ; case 34
	b _03804C84 ; case 35
	b _03804CC0 ; case 36
	b _03804CFC ; case 37
	b _03804D38 ; case 38
	b _03804D58 ; case 39
	b _03804D78 ; case 40
	b _03804D98 ; case 41
_03804A48:
	bl RTC_Reset
	mov r0, #0
	mov r1, r0
	str r0, [sb, #0x1d4]
	bl RtcReturnResult
	b _0380497C
_03804A60:
	ldrh r0, [r8]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1f
	bl RTC_SetHourFormat
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #1
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804A88:
	mov r0, r8
	bl RTC_ReadDateTime
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x10
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804AA8:
	mov r0, r8
	bl RTC_ReadDate
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x11
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804AC8:
	add r0, r8, #4
	bl RTC_ReadTime
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x12
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804AE8:
	add r0, r8, #4
	bl RTC_ReadPulse
	cmp r0, #0
	bne _03804B0C
	mov r0, #0x13
	mov r1, #2
	str r7, [sb, #0x1d4]
	bl RtcReturnResult
	b _0380497C
_03804B0C:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x13
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804B24:
	add r0, r8, #4
	bl RTC_ReadAlarm1
	cmp r0, #0
	bne _03804B48
	mov r0, #0x14
	mov r1, #2
	str r6, [sb, #0x1d4]
	bl RtcReturnResult
	b _0380497C
_03804B48:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x14
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804B60:
	add r0, r8, #4
	bl RTC_ReadAlarm2
	cmp r0, #0
	bne _03804B84
	mov r0, #0x15
	mov r1, #2
	str r5, [sb, #0x1d4]
	bl RtcReturnResult
	b _0380497C
_03804B84:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x15
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804B9C:
	mov r0, r8
	bl RTC_ReadStatus1
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x16
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804BBC:
	add r0, r8, #2
	bl RTC_ReadStatus2
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x17
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804BDC:
	add r0, r8, #4
	bl RTC_ReadAdjust
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x18
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804BFC:
	add r0, r8, #4
	bl RTC_ReadFree
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x19
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804C1C:
	mov r0, r8
	bl RTC_WriteDateTime
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x20
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804C3C:
	add r0, r8, #4
	bl RTC_ReadTime
	mov r0, r8
	bl RTC_WriteDateTime
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x21
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804C64:
	add r0, r8, #4
	bl RTC_WriteTime
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x22
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804C84:
	add r0, r8, #4
	bl RTC_WritePulse
	cmp r0, #0
	bne _03804CA8
	mov r0, #0x23
	mov r1, #2
	str r4, [sb, #0x1d4]
	bl RtcReturnResult
	b _0380497C
_03804CA8:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x23
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804CC0:
	add r0, r8, #4
	bl RTC_WriteAlarm1
	cmp r0, #0
	bne _03804CE4
	mov r0, #0x24
	mov r1, #2
	str sl, [sb, #0x1d4]
	bl RtcReturnResult
	b _0380497C
_03804CE4:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x24
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804CFC:
	add r0, r8, #4
	bl RTC_WriteAlarm2
	cmp r0, #0
	bne _03804D20
	mov r0, #0x25
	mov r1, #2
	str fp, [sb, #0x1d4]
	bl RtcReturnResult
	b _0380497C
_03804D20:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x25
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804D38:
	mov r0, r8
	bl RTC_WriteStatus1
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x26
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804D58:
	add r0, r8, #2
	bl RTC_WriteStatus2
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x27
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804D78:
	add r0, r8, #4
	bl RTC_WriteAdjust
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x28
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804D98:
	add r0, r8, #4
	bl RTC_WriteFree
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x29
	mov r1, #0
	bl RtcReturnResult
	b _0380497C
_03804DB8:
	mov r1, #0
	str r1, [sb, #0x1d4]
	mov r1, #1
	bl RtcReturnResult
	b _0380497C
	.align 2, 0
_03804DCC: .word 0x027FFDE8
_03804DD0: .word rtcWork
_03804DD4: .word rtcWork + 0x100
	arm_func_end RtcThread

	arm_func_start RtcAlarmIntr
RtcAlarmIntr: ; 0x03804DD8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	add r0, sp, #2
	bl RTC_ReadStatus1
	ldrh r0, [sp, #2]
	mov r1, r0, lsl #0x1b
	movs r1, r1, lsr #0x1f
	bne _03804E04
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	beq _03804E5C
_03804E04:
	add r0, sp, #0
	bl RTC_ReadStatus2
	ldrh r0, [sp, #2]
	mov r4, #0
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	ldrneh r0, [sp]
	orrne r4, r4, #1
	bicne r0, r0, #0xf
	strneh r0, [sp]
	ldrh r0, [sp, #2]
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	ldrneh r0, [sp]
	orrne r4, r4, #2
	bicne r0, r0, #0x40
	strneh r0, [sp]
	add r0, sp, #0
	bl RTC_WriteStatus2
	mov r1, r4
	mov r0, #0x30
	bl RtcReturnResult
_03804E5C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end RtcAlarmIntr

	arm_func_start RtcBCD2HEX
RtcBCD2HEX: ; 0x03804E68
	stmdb sp!, {r4, lr}
	mov ip, #0
	mov r2, ip
	b _03804E94
_03804E78:
	mov r1, r2, lsl #2
	mov r1, r0, lsr r1
	and r1, r1, #0xf
	cmp r1, #0xa
	movhs r0, #0
	bhs _03804ED0
	add r2, r2, #1
_03804E94:
	cmp r2, #8
	blt _03804E78
	mov r4, #0
	mov lr, #1
	mov r2, #0xa
_03804EA8:
	mov r1, r4, lsl #2
	mov r1, r0, lsr r1
	and r3, r1, #0xf
	mul r1, lr, r2
	mla ip, lr, r3, ip
	add r4, r4, #1
	mov lr, r1
	cmp r4, #8
	blt _03804EA8
	mov r0, ip
_03804ED0:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end RtcBCD2HEX

	arm_func_start RTC_Reset
RTC_Reset: ; 0x03804ED8
	stmdb sp!, {r3, lr}
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	ldrh r0, [sp]
	bic r0, r0, #1
	orr r0, r0, #1
	strh r0, [sp]
	bl RTCi_GpioStart
	mov r0, #6
	mov r1, #0
	bl RTCi_GpioSendCommand
	add r0, sp, #0
	mov r1, #1
	bl RTCi_GpioSendData
	bl RTCi_GpioEnd
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end RTC_Reset

	arm_func_start RTC_SetHourFormat
RTC_SetHourFormat: ; 0x03804F1C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	and r4, r4, #1
	cmp r4, #1
	bne _03805034
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0
	mov r3, #1
	bl RtcGpioTransfer
	ldrh r0, [sp]
	mov r1, r0, lsl #0x1e
	mov r1, r1, lsr #0x1f
	cmp r1, r4
	beq _03805034
	bic r1, r0, #2
	mov r0, r4, lsl #0x1f
	orr r1, r1, r0, lsr #30
	mov r0, #0x8000
	strh r1, [sp]
	bl EXIi_SelectRcnt
	bl RTCi_GpioStart
	mov r0, #6
	mov r1, #0
	bl RTCi_GpioSendCommand
	add r0, sp, #0
	mov r1, #1
	bl RTCi_GpioSendData
	bl RTCi_GpioEnd
	mov r0, #0x86
	mov r1, #0x10
	add r2, sp, #4
	mov r3, #3
	bl RtcGpioTransfer
	cmp r4, #0
	add r0, sp, #4
	bne _03804FC4
	bl RtcChangeAlarmFormat24to12
	b _03804FC8
_03804FC4:
	bl RtcChangeAlarmFormat12to24
_03804FC8:
	bl RTCi_GpioStart
	mov r0, #6
	mov r1, #0x10
	bl RTCi_GpioSendCommand
	add r0, sp, #4
	mov r1, #3
	bl RTCi_GpioSendData
	bl RTCi_GpioEnd
	mov r0, #0x86
	mov r1, #0x50
	add r2, sp, #4
	mov r3, #3
	bl RtcGpioTransfer
	cmp r4, #0
	add r0, sp, #4
	bne _03805010
	bl RtcChangeAlarmFormat24to12
	b _03805014
_03805010:
	bl RtcChangeAlarmFormat12to24
_03805014:
	bl RTCi_GpioStart
	mov r0, #6
	mov r1, #0x50
	bl RTCi_GpioSendCommand
	add r0, sp, #4
	mov r1, #3
	bl RTCi_GpioSendData
	bl RTCi_GpioEnd
_03805034:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end RTC_SetHourFormat

	arm_func_start RTC_ReadDateTime
RTC_ReadDateTime: ; 0x03805040
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x20
	mov r3, #7
	bl RtcGpioTransfer
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end RTC_ReadDateTime

	arm_func_start RTC_WriteDateTime
RTC_WriteDateTime: ; 0x0380506C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	bl RTCi_GpioStart
	mov r0, #6
	mov r1, #0x20
	bl RTCi_GpioSendCommand
	mov r0, r4
	mov r1, #7
	bl RTCi_GpioSendData
	bl RTCi_GpioEnd
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end RTC_WriteDateTime

	arm_func_start RTC_ReadDate
RTC_ReadDate: ; 0x038050A4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x20
	mov r3, #4
	bl RtcGpioTransfer
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end RTC_ReadDate

	arm_func_start RTC_ReadTime
RTC_ReadTime: ; 0x038050D0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x60
	mov r3, #3
	bl RtcGpioTransfer
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end RTC_ReadTime

	arm_func_start RTC_WriteTime
RTC_WriteTime: ; 0x038050FC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	bl RTCi_GpioStart
	mov r0, #6
	mov r1, #0x60
	bl RTCi_GpioSendCommand
	mov r0, r4
	mov r1, #3
	bl RTCi_GpioSendData
	bl RTCi_GpioEnd
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end RTC_WriteTime

	arm_func_start RTC_ReadPulse
RTC_ReadPulse: ; 0x03805134
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl RtcGpioTransfer
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	and r0, r0, #0xb
	cmp r0, #1
	movne r0, #0
	bne _03805190
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x10
	mov r3, #1
	bl RtcGpioTransfer
	mov r0, #1
_03805190:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end RTC_ReadPulse

	arm_func_start RTC_WritePulse
RTC_WritePulse: ; 0x0380519C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl RtcGpioTransfer
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	and r0, r0, #0xb
	cmp r0, #1
	movne r0, #0
	bne _03805204
	bl RTCi_GpioStart
	mov r0, #6
	mov r1, #0x10
	bl RTCi_GpioSendCommand
	mov r0, r4
	mov r1, #1
	bl RTCi_GpioSendData
	bl RTCi_GpioEnd
	mov r0, #1
_03805204:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end RTC_WritePulse

	arm_func_start RTC_ReadAlarm1
RTC_ReadAlarm1: ; 0x03805210
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl RtcGpioTransfer
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #4
	movne r0, #0
	bne _03805268
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x10
	mov r3, #3
	bl RtcGpioTransfer
	mov r0, #1
_03805268:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end RTC_ReadAlarm1

	arm_func_start RTC_WriteAlarm1
RTC_WriteAlarm1: ; 0x03805274
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl RtcGpioTransfer
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #4
	movne r0, #0
	bne _038052D8
	bl RTCi_GpioStart
	mov r0, #6
	mov r1, #0x10
	bl RTCi_GpioSendCommand
	mov r0, r4
	mov r1, #3
	bl RTCi_GpioSendData
	bl RTCi_GpioEnd
	mov r0, #1
_038052D8:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end RTC_WriteAlarm1

	arm_func_start RTC_ReadAlarm2
RTC_ReadAlarm2: ; 0x038052E4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl RtcGpioTransfer
	ldrh r0, [sp]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	moveq r0, #0
	beq _03805338
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x50
	mov r3, #3
	bl RtcGpioTransfer
	mov r0, #1
_03805338:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end RTC_ReadAlarm2

	arm_func_start RTC_WriteAlarm2
RTC_WriteAlarm2: ; 0x03805344
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl RtcGpioTransfer
	ldrh r0, [sp]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	moveq r0, #0
	beq _038053A4
	bl RTCi_GpioStart
	mov r0, #6
	mov r1, #0x50
	bl RTCi_GpioSendCommand
	mov r0, r4
	mov r1, #3
	bl RTCi_GpioSendData
	bl RTCi_GpioEnd
	mov r0, #1
_038053A4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end RTC_WriteAlarm2

	arm_func_start RTC_ReadStatus1
RTC_ReadStatus1: ; 0x038053B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	mov r2, r4
	mov r0, #0x86
	mov r1, #0
	mov r3, #1
	bl RtcGpioTransfer
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end RTC_ReadStatus1

	arm_func_start RTC_WriteStatus1
RTC_WriteStatus1: ; 0x038053DC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	bl RTCi_GpioStart
	mov r0, #6
	mov r1, #0
	bl RTCi_GpioSendCommand
	mov r0, r4
	mov r1, #1
	bl RTCi_GpioSendData
	bl RTCi_GpioEnd
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end RTC_WriteStatus1

	arm_func_start RTC_ReadStatus2
RTC_ReadStatus2: ; 0x03805414
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl RtcGpioTransfer
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end RTC_ReadStatus2

	arm_func_start RTC_WriteStatus2
RTC_WriteStatus2: ; 0x03805440
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	bl RTCi_GpioStart
	mov r0, #6
	mov r1, #0x40
	bl RTCi_GpioSendCommand
	mov r0, r4
	mov r1, #1
	bl RTCi_GpioSendData
	bl RTCi_GpioEnd
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end RTC_WriteStatus2

	arm_func_start RTC_ReadAdjust
RTC_ReadAdjust: ; 0x03805478
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x30
	mov r3, #1
	bl RtcGpioTransfer
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end RTC_ReadAdjust

	arm_func_start RTC_WriteAdjust
RTC_WriteAdjust: ; 0x038054A4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	bl RTCi_GpioStart
	mov r0, #6
	mov r1, #0x30
	bl RTCi_GpioSendCommand
	mov r0, r4
	mov r1, #1
	bl RTCi_GpioSendData
	bl RTCi_GpioEnd
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end RTC_WriteAdjust

	arm_func_start RTC_ReadFree
RTC_ReadFree: ; 0x038054DC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x70
	mov r3, #1
	bl RtcGpioTransfer
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end RTC_ReadFree

	arm_func_start RTC_WriteFree
RTC_WriteFree: ; 0x03805508
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl EXIi_SelectRcnt
	bl RTCi_GpioStart
	mov r0, #6
	mov r1, #0x70
	bl RTCi_GpioSendCommand
	mov r0, r4
	mov r1, #1
	bl RTCi_GpioSendData
	bl RTCi_GpioEnd
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end RTC_WriteFree

	arm_func_start RtcChangeAlarmFormat24to12
RtcChangeAlarmFormat24to12: ; 0x03805540
	ldr r1, [r0]
	mov r2, r1, lsl #0x12
	mov r2, r2, lsr #0x1a
	cmp r2, #0x23
	addls pc, pc, r2, lsl #2
	b _0380563C
_03805558: ; jump table
	b _038055E8 ; case 0
	b _038055E8 ; case 1
	b _038055E8 ; case 2
	b _038055E8 ; case 3
	b _038055E8 ; case 4
	b _038055E8 ; case 5
	b _038055E8 ; case 6
	b _038055E8 ; case 7
	b _038055E8 ; case 8
	b _038055E8 ; case 9
	b _0380563C ; case 10
	b _0380563C ; case 11
	b _0380563C ; case 12
	b _0380563C ; case 13
	b _0380563C ; case 14
	b _0380563C ; case 15
	b _038055E8 ; case 16
	b _038055E8 ; case 17
	b _038055F4 ; case 18
	b _038055F4 ; case 19
	b _038055F4 ; case 20
	b _038055F4 ; case 21
	b _038055F4 ; case 22
	b _038055F4 ; case 23
	b _038055F4 ; case 24
	b _038055F4 ; case 25
	b _0380563C ; case 26
	b _0380563C ; case 27
	b _0380563C ; case 28
	b _0380563C ; case 29
	b _0380563C ; case 30
	b _0380563C ; case 31
	b _03805618 ; case 32
	b _03805618 ; case 33
	b _038055F4 ; case 34
	b _038055F4 ; case 35
_038055E8:
	bic r1, r1, #0x4000
	str r1, [r0]
	bx lr
_038055F4:
	orr r2, r1, #0x4000
	mov r1, r2, lsl #0x12
	mov r1, r1, lsr #0x1a
	sub r1, r1, #0x12
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_03805618:
	orr r2, r1, #0x4000
	mov r1, r2, lsl #0x12
	mov r1, r1, lsr #0x1a
	sub r1, r1, #0x18
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_0380563C:
	ldr r1, [r0]
	bic r1, r1, #0x4000
	bic r1, r1, #0x3f00
	str r1, [r0]
	bx lr
	arm_func_end RtcChangeAlarmFormat24to12

	arm_func_start RtcChangeAlarmFormat12to24
RtcChangeAlarmFormat12to24: ; 0x03805650
	ldr r2, [r0]
	mov r1, r2, lsl #0x12
	mov r3, r1, lsr #0x1a
	cmp r3, #0x23
	addls pc, pc, r3, lsl #2
	b _0380574C
_03805668: ; jump table
	b _038056F8 ; case 0
	b _038056F8 ; case 1
	b _038056F8 ; case 2
	b _038056F8 ; case 3
	b _038056F8 ; case 4
	b _038056F8 ; case 5
	b _038056F8 ; case 6
	b _038056F8 ; case 7
	b _0380571C ; case 8
	b _0380571C ; case 9
	b _0380574C ; case 10
	b _0380574C ; case 11
	b _0380574C ; case 12
	b _0380574C ; case 13
	b _0380574C ; case 14
	b _0380574C ; case 15
	b _038056F8 ; case 16
	b _038056F8 ; case 17
	b _03805740 ; case 18
	b _03805740 ; case 19
	b _03805740 ; case 20
	b _03805740 ; case 21
	b _03805740 ; case 22
	b _03805740 ; case 23
	b _03805740 ; case 24
	b _03805740 ; case 25
	b _0380574C ; case 26
	b _0380574C ; case 27
	b _0380574C ; case 28
	b _0380574C ; case 29
	b _0380574C ; case 30
	b _0380574C ; case 31
	b _03805740 ; case 32
	b _03805740 ; case 33
	b _03805740 ; case 34
	b _03805740 ; case 35
_038056F8:
	mov r1, r2, lsl #0x11
	movs r1, r1, lsr #0x1f
	bxeq lr
	add r1, r3, #0x12
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_0380571C:
	mov r1, r2, lsl #0x11
	movs r1, r1, lsr #0x1f
	bxeq lr
	add r1, r3, #0x18
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_03805740:
	orr r1, r2, #0x4000
	str r1, [r0]
	bx lr
_0380574C:
	ldr r1, [r0]
	bic r1, r1, #0x4000
	bic r1, r1, #0x3f00
	str r1, [r0]
	bx lr
	arm_func_end RtcChangeAlarmFormat12to24

	arm_func_start RtcGpioTransfer
RtcGpioTransfer: ; 0x03805760
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl RTCi_GpioStart
	mov r0, r7
	mov r1, r6
	bl RTCi_GpioSendCommand
	cmp r7, #6
	beq _038057A4
	cmp r7, #0x86
	bne _038057B0
	mov r0, r5
	mov r1, r4
	bl RTCi_GpioReceiveData
	b _038057B0
_038057A4:
	mov r0, r5
	mov r1, r4
	bl RTCi_GpioSendData
_038057B0:
	bl RTCi_GpioEnd
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end RtcGpioTransfer

	arm_func_start RTCi_GpioStart
RTCi_GpioStart: ; 0x038057BC
	mov ip, #0x4000000
	add ip, ip, #0x138
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x72
	strh r0, [ip]
	mov r3, #2
_038057D8:
	subs r3, r3, #1
	bne _038057D8
	bic r0, r0, #4
	orr r0, r0, #4
	strh r0, [ip]
	mov r3, #2
_038057F0:
	subs r3, r3, #1
	bne _038057F0
	bx lr
	arm_func_end RTCi_GpioStart

	arm_func_start RTCi_GpioEnd
RTCi_GpioEnd: ; 0x038057FC
	mov ip, #0x4000000
	add ip, ip, #0x138
	mov r3, #2
_03805808:
	subs r3, r3, #1
	bne _03805808
	ldrh r0, [ip]
	bic r0, r0, #4
	orr r0, r0, #0
	strh r0, [ip]
	mov r3, #2
_03805824:
	subs r3, r3, #1
	bne _03805824
	bx lr
	arm_func_end RTCi_GpioEnd

	arm_func_start RTCi_GpioSendCommand
RTCi_GpioSendCommand: ; 0x03805830
	mov ip, #0x4000000
	add ip, ip, #0x138
	orr r1, r0, r1
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x74
	mov r2, #0
_0380584C:
	bic r0, r0, #3
	orr r0, r0, #0
	mov r3, #1
	tst r3, r1, lsr r2
	movne r3, #1
	moveq r3, #0
	orr r0, r0, r3
	strh r0, [ip]
	mov r3, #9
_03805870:
	subs r3, r3, #1
	bne _03805870
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_03805888:
	subs r3, r3, #1
	bne _03805888
	add r2, r2, #1
	cmp r2, #8
	bne _0380584C
	bx lr
	arm_func_end RTCi_GpioSendCommand

	arm_func_start RTCi_GpioSendData
RTCi_GpioSendData: ; 0x038058A0
	mov ip, #0x4000000
	add ip, ip, #0x138
_038058A8:
	stmdb sp!, {r0, r1}
	tst r0, #1
	ldreqh r1, [r0]
	ldrneh r1, [r0, #-1]
	movne r1, r1, lsr #8
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x74
	mov r2, #0
_038058CC:
	bic r0, r0, #3
	orr r0, r0, #0
	mov r3, #1
	tst r3, r1, lsr r2
	movne r3, #1
	moveq r3, #0
	orr r0, r0, r3
	strh r0, [ip]
	mov r3, #9
_038058F0:
	subs r3, r3, #1
	bne _038058F0
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_03805908:
	subs r3, r3, #1
	bne _03805908
	add r2, r2, #1
	cmp r2, #8
	bne _038058CC
	ldmia sp!, {r0, r1}
	add r0, r0, #1
	subs r1, r1, #1
	bne _038058A8
	bx lr
	arm_func_end RTCi_GpioSendData

	arm_func_start RTCi_GpioReceiveData
RTCi_GpioReceiveData: ; 0x03805930
	mov ip, #0x4000000
	add ip, ip, #0x138
_03805938:
	stmdb sp!, {r0, r1}
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x64
	mov r2, #0
	mov r1, #0
_03805950:
	bic r0, r0, #3
	orr r0, r0, #0
	strh r0, [ip]
	mov r3, #9
_03805960:
	subs r3, r3, #1
	bne _03805960
	ldrh r0, [ip]
	and r3, r0, #1
	cmp r3, #1
	moveq r3, #0x80
	movne r3, #0
	orr r2, r3, r2, lsr #1
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_03805990:
	subs r3, r3, #1
	bne _03805990
	add r1, r1, #1
	cmp r1, #8
	bne _03805950
	ldmia sp!, {r0, r1}
	tst r0, #1
	beq _038059C8
	ldrh r3, [r0, #-1]
	bic r3, r3, #0xff00
	mov r2, r2, lsl #8
	orr r3, r2, r3
	strh r3, [r0, #-1]
	b _038059D8
_038059C8:
	ldrh r3, [r0]
	bic r3, r3, #0xff
	orr r3, r3, r2
	strh r3, [r0]
_038059D8:
	add r0, r0, #1
	subs r1, r1, #1
	bne _03805938
	bx lr
	arm_func_end RTCi_GpioReceiveData

	; wvr.s(.wram)

	arm_func_start WVR_Init
WVR_Init: ; 0x038059E8
	stmdb sp!, {r3, lr}
	ldr r3, _03805A2C ; =wvrStatus
	mov ip, #1
	str r0, [r3, #8]
	ldr r0, _03805A30 ; =wvrThread
	mov r1, #0
	mov r2, #0xa4
	strb ip, [r3]
	bl MI_CpuFill8
	ldr r1, _03805A34 ; =WvrPxiReceiveCallback
	mov r0, #0xf
	bl PXI_SetFifoRecvCallback
	ldr r1, _03805A38 ; =WvrPxiWmSubstituteCallback
	mov r0, #0xa
	bl PXI_SetFifoRecvCallback
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03805A2C: .word wvrStatus
_03805A30: .word wvrThread
_03805A34: .word WvrPxiReceiveCallback
_03805A38: .word WvrPxiWmSubstituteCallback
	arm_func_end WVR_Init

	arm_func_start WVR_Shutdown
WVR_Shutdown: ; 0x03805A3C
	stmdb sp!, {r3, lr}
	ldr r2, _03805A68 ; =0x04000304
	mov r0, #1
	ldrh r1, [r2]
	bic r1, r1, #2
	strh r1, [r2]
	bl PM_SetLEDPattern
	mov r0, #1
	bl PMi_SetLED
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03805A68: .word 0x04000304
	arm_func_end WVR_Shutdown

	arm_func_start WvrBegin
WvrBegin: ; 0x03805A6C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x50
	str r0, [sp, #0x44]
	ldr r0, _03805B04 ; =wvrWlWork
	mov sb, #4
	mov r7, #8
	mov r4, #3
	ldr r1, _03805B08 ; =wvrWlWork
	ldr r6, _03805B0C ; =wvrWlStaElement
	mov sl, #0x600
	mov r8, #0
	mov r5, #0x1c0
	mov lr, #0x40
	mov ip, #5
	mov r3, #7
	mov r2, #9
	str r0, [sp, #0x1c]
	str r1, [sp, #0x20]
	add r0, sp, #0x1c
	add r1, sp, #0
	str sl, [sp, #0x24]
	str sb, [sp, #0x28]
	str r8, [sp, #0x3c]
	str r7, [sp, #0x40]
	str r6, [sp, #0x48]
	str r5, [sp, #0x4c]
	str r4, [sp]
	str lr, [sp, #0x38]
	str r4, [sp, #8]
	str sb, [sp, #0x18]
	str ip, [sp, #0x10]
	str r3, [sp, #4]
	str r7, [sp, #0x14]
	str r2, [sp, #0xc]
	bl __VENEER_WMSP_Init
	add sp, sp, #0x50
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_03805B04: .word wvrWlWork
_03805B08: .word wvrWlWork
_03805B0C: .word wvrWlStaElement
	arm_func_end WvrBegin

	arm_func_start __VENEER_WMSP_Init
__VENEER_WMSP_Init: ; 0x03805B10
	ldr pc, _03805B14 ; =WMSP_Init
	.align 2, 0
_03805B14: .word WMSP_Init
	arm_func_end __VENEER_WMSP_Init

	arm_func_start WvrPxiWmSubstituteCallback
WvrPxiWmSubstituteCallback: ; 0x03805B18
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r1
	ldrh r4, [r6]
	beq _03805B60
	mov r0, #0
	mov r2, #0x100
	bl MIi_CpuClear32
	strh r4, [r6]
	mov r0, #4
	strh r0, [r6, #2]
	mov r5, #0xa
	mov r4, #0
_03805B48:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _03805B48
_03805B60:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end WvrPxiWmSubstituteCallback

	arm_func_start WvrCheckThreadRunning
WvrCheckThreadRunning: ; 0x03805B68
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r1, _03805BC4 ; =OSi_ThreadInfo
	ldr r1, [r1, #8]
	b _03805BB4
_03805B80:
	cmp r1, r0
	bne _03805BB0
	ldr r0, [r0, #0x48]
	cmp r0, #0
	cmpne r0, #1
	beq _03805BA0
	cmp r0, #2
	b _03805BA8
_03805BA0:
	mov r0, #1
	bx lr
_03805BA8:
	mov r0, #0
	bx lr
_03805BB0:
	ldr r1, [r1, #0x4c]
_03805BB4:
	cmp r1, #0
	bne _03805B80
	mov r0, #0
	bx lr
	.align 2, 0
_03805BC4: .word OSi_ThreadInfo
	arm_func_end WvrCheckThreadRunning

	arm_func_start WvrPxiReceiveCallback
WvrPxiReceiveCallback: ; 0x03805BC8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r1
	cmp r4, #0x10000
	beq _03805BE8
	cmp r4, #0x20000
	beq _03805C80
	b _03805D24
_03805BE8:
	bl OS_DisableInterrupts
	mov r5, r0
	ldr r0, _03805D54 ; =wvrThread
	bl WvrCheckThreadRunning
	cmp r0, #0
	beq _03805C10
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	b _03805C70
_03805C10:
	ldr r1, _03805D58 ; =wvrStatus
	ldrb r0, [r1]
	cmp r0, #1
	beq _03805C30
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	b _03805C70
_03805C30:
	mov r2, #2
	mov r0, r5
	strb r2, [r1]
	bl OS_RestoreInterrupts
	mov r2, #0x400
	ldr r0, _03805D54 ; =wvrThread
	ldr r1, _03805D5C ; =WvrStartUpThread
	ldr r3, _03805D60 ; =wvrWlStack
	str r2, [sp]
	mov r5, #0xa
	mov r2, #0
	str r5, [sp, #4]
	bl OS_CreateThread
	ldr r0, _03805D54 ; =wvrThread
	bl OS_WakeupThreadDirect
	mov r0, #1
_03805C70:
	cmp r0, #0
	bne _03805D48
	orr r6, r4, #5
	b _03805D28
_03805C80:
	bl OS_DisableInterrupts
	mov r5, r0
	ldr r0, _03805D54 ; =wvrThread
	bl WvrCheckThreadRunning
	cmp r0, #0
	beq _03805CA8
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	b _03805D14
_03805CA8:
	ldr r1, _03805D58 ; =wvrStatus
	ldrb r0, [r1]
	cmp r0, #3
	beq _03805CC8
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	b _03805D14
_03805CC8:
	mov r2, #4
	mov r0, r5
	strb r2, [r1]
	bl OS_RestoreInterrupts
	ldr r1, _03805D64 ; =WvrPxiWmSubstituteCallback
	mov r0, #0xa
	bl PXI_SetFifoRecvCallback
	mov r2, #0x400
	ldr r0, _03805D54 ; =wvrThread
	ldr r1, _03805D68 ; =WvrTerminateThread
	ldr r3, _03805D60 ; =wvrWlStack
	str r2, [sp]
	mov r5, #2
	mov r2, #0
	str r5, [sp, #4]
	bl OS_CreateThread
	ldr r0, _03805D54 ; =wvrThread
	bl OS_WakeupThreadDirect
	mov r0, #1
_03805D14:
	cmp r0, #0
	bne _03805D48
	orr r6, r4, #5
	b _03805D28
_03805D24:
	orr r6, r4, #7
_03805D28:
	mov r5, #0xf
	mov r4, #0
_03805D30:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _03805D30
_03805D48:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_03805D54: .word wvrThread
_03805D58: .word wvrStatus
_03805D5C: .word WvrStartUpThread
_03805D60: .word wvrWlStack
_03805D64: .word WvrPxiWmSubstituteCallback
_03805D68: .word WvrTerminateThread
	arm_func_end WvrPxiReceiveCallback

	arm_func_start WvrStartUpThread
WvrStartUpThread: ; 0x03805D6C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _03805DD8 ; =wvrStatus
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _03805D8C
	ldr r2, [r1, #0xc]
	mov r1, #0x6000000
	bl MIi_CpuCopyFast
_03805D8C:
	ldr r0, _03805DD8 ; =wvrStatus
	ldr r0, [r0, #8]
	bl WvrBegin
	mov r6, #0xf
	mov r5, #0x10000
	mov r4, #0
_03805DA4:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _03805DA4
	bl OS_DisableInterrupts
	ldr r0, _03805DD8 ; =wvrStatus
	mov r1, #3
	strb r1, [r0]
	bl OS_ExitThread
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_03805DD8: .word wvrStatus
	arm_func_end WvrStartUpThread

	arm_func_start WvrTerminateThread
WvrTerminateThread: ; 0x03805DDC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _03805FDC ; =wmspW + 0x1000
	ldr sl, _03805FE0 ; =wmspW
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	addne r0, sl, #0x1000
	ldrne r0, [r0, #0x54c]
	ldrne r0, [r0]
	ldrneh r0, [r0]
	cmpne r0, #0
	beq _03805E10
	bl __VENEER_WMSP_CancelVAlarm
	bl __VENEER_WMSP_CancelAllAlarms
_03805E10:
	mov r6, #0
	add sb, sp, #0
	add r4, sl, #0x1000
	mov fp, #0x100
	mov r5, #4
	mov r8, r6
_03805E28:
	mov r1, sb
	mov r2, r8
	add r0, sl, #0x88
	bl OS_ReceiveMessage
	cmp r0, #0
	beq _03805E90
	ldr r0, [r4, #0x54c]
	cmp r0, #0
	beq _03805E28
	bl WMSP_GetBuffer4Callback2Wm9
	mov r7, r0
	mov r0, r6
	mov r1, r7
	mov r2, fp
	bl MIi_CpuClear32
	ldr r1, [sp]
	mov r0, r7
	ldrh r1, [r1]
	strh r1, [r7]
	strh r5, [r7, #2]
	bl WMSP_ReturnResult2Wm9
	ldr r1, [sp]
	ldrh r0, [r1]
	orr r0, r0, #0x8000
	strh r0, [r1]
	b _03805E28
_03805E90:
	bl __VENEER_WMSP_GetRequestThread
	bl WvrCheckThreadRunning
	cmp r0, #0
	beq _03805EB8
	add r0, sl, #0x88
	mov r1, #0
	mov r2, #1
	bl OS_SendMessage
	bl __VENEER_WMSP_GetRequestThread
	bl OS_JoinThread
_03805EB8:
	add r1, sp, #0
	add r0, sl, #0x88
	mov r2, #0
	bl OS_ReceiveMessage
	mov r5, r0
	add r1, sp, #0
	add r0, sl, #0x58
	mov r2, #0
	bl OS_ReceiveMessage
	mov r4, r0
	add r1, sp, #0
	mov r0, sl
	mov r2, #0
	bl OS_ReceiveMessage
	orr r1, r5, r4
	orrs r0, r0, r1
	beq _03805F00
	bl OS_Terminate
_03805F00:
	bl __VENEER_WL_Terminate
	add r5, sp, #0
	mov r4, #0
_03805F0C:
	mov r1, r5
	mov r2, r4
	add r0, sl, #0x28
	bl OS_ReceiveMessage
	cmp r0, #0
	bne _03805F0C
	bl __VENEER_WMSP_GetIndicateThread
	bl WvrCheckThreadRunning
	cmp r0, #0
	beq _03805F4C
	add r0, sl, #0x28
	mov r1, #0
	mov r2, #1
	bl OS_SendMessage
	bl __VENEER_WMSP_GetIndicateThread
	bl OS_JoinThread
_03805F4C:
	mov r0, #1
	bl PM_SetLEDPattern
	mov r0, #1
	bl PMi_SetLED
	add r0, sl, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	ldrne r1, [r0]
	ldrneh r0, [r1]
	cmpne r0, #0
	movne r0, #0
	strneh r0, [r1]
	ldr r0, _03805FE4 ; =wvrStatus
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _03805F9C
	ldr r2, [r0, #0xc]
	mov r0, #0
	mov r1, #0x6000000
	bl MIi_CpuClearFast
_03805F9C:
	mov r6, #0xf
	mov r5, #0x20000
	mov r4, #0
_03805FA8:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _03805FA8
	bl OS_DisableInterrupts
	ldr r0, _03805FE4 ; =wvrStatus
	mov r1, #1
	strb r1, [r0]
	bl OS_ExitThread
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_03805FDC: .word wmspW + 0x1000
_03805FE0: .word wmspW
_03805FE4: .word wvrStatus
	arm_func_end WvrTerminateThread

	; veneers into wvram

	arm_func_start __VENEER_WMSP_CancelVAlarm
__VENEER_WMSP_CancelVAlarm: ; 0x03805FE8
	ldr pc, _03805FEC ; =WMSP_CancelVAlarm
	.align 2, 0
_03805FEC: .word WMSP_CancelVAlarm
	arm_func_end __VENEER_WMSP_CancelVAlarm

	arm_func_start __VENEER_WMSP_CancelAllAlarms
__VENEER_WMSP_CancelAllAlarms: ; 0x03805FF0
	ldr pc, _03805FF4 ; =WMSP_CancelAllAlarms
	.align 2, 0
_03805FF4: .word WMSP_CancelAllAlarms
	arm_func_end __VENEER_WMSP_CancelAllAlarms

	arm_func_start __VENEER_WMSP_GetRequestThread
__VENEER_WMSP_GetRequestThread: ; 0x03805FF8
	ldr pc, _03805FFC ; =WMSP_GetRequestThread
	.align 2, 0
_03805FFC: .word WMSP_GetRequestThread
	arm_func_end __VENEER_WMSP_GetRequestThread

	arm_func_start __VENEER_WL_Terminate
__VENEER_WL_Terminate: ; 0x03806000
	ldr pc, _03806004 ; =WL_Terminate
	.align 2, 0
_03806004: .word WL_Terminate
	arm_func_end __VENEER_WL_Terminate

	arm_func_start __VENEER_WMSP_GetIndicateThread
__VENEER_WMSP_GetIndicateThread: ; 0x03806008
	ldr pc, _0380600C ; =WMSP_GetIndicateThread
	.align 2, 0
_0380600C: .word WMSP_GetIndicateThread
	arm_func_end __VENEER_WMSP_GetIndicateThread

	; math

	arm_func_start MATH_CountPopulation
MATH_CountPopulation: ; 0x03806010
	ldr r1, _03806048 ; =0x55555555
	ldr r2, _0380604C ; =0x33333333
	and r1, r1, r0, lsr #1
	sub r1, r0, r1
	ldr r0, _03806050 ; =0x0F0F0F0F
	and r3, r1, r2
	and r1, r2, r1, lsr #2
	add r1, r3, r1
	add r1, r1, r1, lsr #4
	and r0, r1, r0
	add r0, r0, r0, lsr #8
	add r0, r0, r0, lsr #16
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_03806048: .word 0x55555555
_0380604C: .word 0x33333333
_03806050: .word 0x0F0F0F0F
	arm_func_end MATH_CountPopulation

	; msl

	.public _ll_mod
_ll_mod: ; 0x03806054
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, r1
	orr r4, r4, #1
	b _03806074

	.public _ll_div
	.public _ll_sdiv
_ll_div: ; 0x03806064
_ll_sdiv: ; 0x03806064
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	eor r4, r1, r3
	mov r4, r4, asr #1
	mov r4, r4, lsl #1
_03806074:
	orrs r5, r3, r2
	bne _03806084
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_03806084:
	mov r5, r0, lsr #0x1f
	add r5, r5, r1
	mov r6, r2, lsr #0x1f
	add r6, r6, r3
	orrs r6, r5, r6
	bne _038060B8
	mov r1, r2
	bl _s32_div_f
	ands r4, r4, #1
	movne r0, r1
	mov r1, r0, asr #0x1f
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_038060B8:
	cmp r1, #0
	bge _038060C8
	rsbs r0, r0, #0
	rsc r1, r1, #0
_038060C8:
	cmp r3, #0
	bge _038060D8
	rsbs r2, r2, #0
	rsc r3, r3, #0
_038060D8:
	orrs r5, r1, r0
	beq _038061FC
	mov r5, #0
	mov r6, #1
	cmp r3, #0
	bmi _03806104
_038060F0:
	add r5, r5, #1
	adds r2, r2, r2
	adcs r3, r3, r3
	bpl _038060F0
	add r6, r6, r5
_03806104:
	cmp r1, #0
	blt _03806124
_0380610C:
	cmp r6, #1
	beq _03806124
	sub r6, r6, #1
	adds r0, r0, r0
	adcs r1, r1, r1
	bpl _0380610C
_03806124:
	mov r7, #0
	mov ip, #0
	mov fp, #0
	b _0380614C
_03806134:
	orr ip, ip, #1
	subs r6, r6, #1
	beq _038061A4
	adds r0, r0, r0
	adcs r1, r1, r1
	adcs r7, r7, r7
_0380614C:
	subs r0, r0, r2
	sbcs r1, r1, r3
	sbcs r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _03806134
_03806168:
	subs r6, r6, #1
	beq _0380619C
	adds r0, r0, r0
	adcs r1, r1, r1
	adc r7, r7, r7
	adds r0, r0, r2
	adcs r1, r1, r3
	adc r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _03806134
	b _03806168
_0380619C:
	adds r0, r0, r2
	adc r1, r1, r3
_038061A4:
	ands r7, r4, #1
	moveq r0, ip
	moveq r1, fp
	beq _038061DC
	subs r7, r5, #0x20
	movge r0, r1, lsr r7
	bge _03806200
	rsb r7, r5, #0x20
	mov r0, r0, lsr r5
	orr r0, r0, r1, lsl r7
	mov r1, r1, lsr r5
	b _038061DC
_038061D4: ; 0x038061D4
	mov r0, r1, lsr r7
	mov r1, #0
_038061DC:
	cmp r4, #0
	blt _038061EC
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_038061EC:
	rsbs r0, r0, #0
	rsc r1, r1, #0
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_038061FC:
	mov r0, #0
_03806200:
	mov r1, #0
	cmp r4, #0
	blt _038061EC
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr

	arm_func_start _ll_udiv
	arm_func_start _ull_div
_ll_udiv: ; 0x03806214
_ull_div: ; 0x03806214
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #0
	b _03806228

	.public _ull_mod
_ull_mod: ; 0x03806220
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #1
_03806228:
	orrs r5, r3, r2
	bne _03806238
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_03806238:
	orrs r5, r1, r3
	bne _038060D8
	mov r1, r2
	bl _u32_div_not_0_f
	cmp r4, #0
	movne r0, r1
	mov r1, #0
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr

	.public _s32_div_f
_s32_div_f: ; 0x0380625C
	eor ip, r0, r1
	and ip, ip, #0x80000000
	cmp r0, #0
	rsblt r0, r0, #0
	addlt ip, ip, #1
	cmp r1, #0
	rsblt r1, r1, #0
	beq _03806454
	cmp r0, r1
	movlo r1, r0
	movlo r0, #0
	blo _03806454
	mov r2, #0x1c
	mov r3, r0, lsr #4
	cmp r1, r3, lsr #12
	suble r2, r2, #0x10
	movle r3, r3, lsr #0x10
	cmp r1, r3, lsr #4
	suble r2, r2, #8
	movle r3, r3, lsr #8
	cmp r1, r3
	suble r2, r2, #4
	movle r3, r3, lsr #4
	mov r0, r0, lsl r2
	rsb r1, r1, #0
	adds r0, r0, r0
	add r2, r2, r2, lsl #1
	add pc, pc, r2, lsl #2
	mov r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	mov r1, r3
_03806454:
	ands r3, ip, #0x80000000
	rsbne r0, r0, #0
	ands r3, ip, #1
	rsbne r1, r1, #0
	bx lr

	.public _u32_div_f
_u32_div_f: ; 0x03806468
	cmp r1, #0
	bxeq lr

	.public _u32_div_not_0_f
_u32_div_not_0_f: ; 0x03806470
	cmp r0, r1
	movlo r1, r0
	movlo r0, #0
	bxlo lr
	mov r2, #0x1c
	mov r3, r0, lsr #4
	cmp r1, r3, lsr #12
	suble r2, r2, #0x10
	movle r3, r3, lsr #0x10
	cmp r1, r3, lsr #4
	suble r2, r2, #8
	movle r3, r3, lsr #8
	cmp r1, r3
	suble r2, r2, #4
	movle r3, r3, lsr #4
	mov r0, r0, lsl r2
	rsb r1, r1, #0
	adds r0, r0, r0
	add r2, r2, r2, lsl #1
	add pc, pc, r2, lsl #2
	mov r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	mov r1, r3
	bx lr

	.rodata

	.balign 4, 0
micIntrPrio: ; 0x038067A4
	.byte 0x40, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01
	.byte 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x12, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x16, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00
	.byte 0x17, 0x00, 0x00, 0x00

	.section .wram,4,1,5

	arm_func_start WMSP_ReturnResult2Wm9
WMSP_ReturnResult2Wm9: ; 0x038068C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, #0x100
	mov r5, #0xa
	mov r4, #0
	b _038068E8
_038068E0:
	mov r0, r6
	bl VENEER_SVC_WaitByLoop
_038068E8:
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _038068E0
	ldr r0, _03806910 ; =wmspW + 0x1528
	bl OS_UnlockMutex
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03806910: .word wmspW + 0x1528
	arm_func_end WMSP_ReturnResult2Wm9

	arm_func_start WMSP_GetBuffer4Callback2Wm9
WMSP_GetBuffer4Callback2Wm9: ; 0x03806914
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0380695C ; =wmspW + 0x1528
	bl OS_LockMutex
	ldr r4, _03806960 ; =0x027FFF96
	mov r5, #0x100
	b _03806934
_0380692C:
	mov r0, r5
	bl VENEER_SVC_WaitByLoop
_03806934:
	ldrh r1, [r4]
	tst r1, #1
	bne _0380692C
	ldr r0, _03806964 ; =wmspW + 0x1000
	orr r1, r1, #1
	strh r1, [r4]
	ldr r0, [r0, #0x54c]
	ldr r0, [r0, #8]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0380695C: .word wmspW + 0x1528
_03806960: .word 0x027FFF96
_03806964: .word wmspW + 0x1000
	arm_func_end WMSP_GetBuffer4Callback2Wm9

	arm_func_start WMSP_GetAllowedChannel
WMSP_GetAllowedChannel: ; 0x03806968
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _03806A70 ; =0x00001FFF
	and r0, r0, r1
	mov r0, r0, lsl #0x10
	movs r2, r0, lsr #0x10
	moveq r0, #0
	beq _03806A68
	mov r1, #0
	mov r0, #1
	b _0380699C
_03806990:
	tst r2, r0, lsl r1
	bne _038069A4
	add r1, r1, #1
_0380699C:
	cmp r1, #0x10
	blt _03806990
_038069A4:
	mov r0, #0xf
	mov r3, #1
	b _038069BC
_038069B0:
	tst r2, r3, lsl r0
	bne _038069C4
	sub r0, r0, #1
_038069BC:
	cmp r0, #0
	bne _038069B0
_038069C4:
	sub r6, r0, r1
	cmp r6, #5
	movlt r0, #1
	movlt r0, r0, lsl r1
	movlt r0, r0, lsl #0x10
	movlt r0, r0, lsr #0x10
	blt _03806A68
	add r3, r0, r1
	add r3, r3, r3, lsr #31
	mov r4, r3, asr #1
	mov r5, #0
	mov lr, #1
	b _03806A1C
_038069F8:
	mov ip, r5, lsr #0x1f
	rsb r3, ip, r5, lsl #31
	add r3, ip, r3, ror #31
	mov r3, r3, lsl #1
	sub r3, r3, #1
	mla r4, r5, r3, r4
	tst r2, lr, lsl r4
	bne _03806A24
	add r5, r5, #1
_03806A1C:
	cmp r5, r6
	blt _038069F8
_03806A24:
	sub r2, r0, r4
	cmp r2, #5
	subge r2, r4, r1
	cmpge r2, #5
	bge _03806A50
	mov r2, #1
	mov r0, r2, lsl r0
	orr r0, r0, r2, lsl r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	b _03806A68
_03806A50:
	mov r3, #1
	mov r2, r3, lsl r4
	orr r0, r2, r3, lsl r0
	orr r0, r0, r3, lsl r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
_03806A68:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_03806A70: .word 0x00001FFF
	arm_func_end WMSP_GetAllowedChannel

	.data

PMi_LEDStatus: ; 0x03806B08
	.word 1

PMi_BlinkPatternData: ; 0x03806B0C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0xAA, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCC
	.byte 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xE3, 0x0C, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xF0, 0x10, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x3E, 0xF8, 0x14, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFC
	.byte 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x10, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xFF, 0x14, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0xFF, 0x20, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF
	.byte 0x20, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0x20, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC3, 0x28, 0x00, 0x02, 0x00

isFirstCheck$3769: ; 0x03806B9C
	.word 1

nextCount$3767: ; 0x03806BA0
	.word 0xFFFFFFFF

	.bss

spiInitialized: ; 0x03808E30
	.space 0x2

	.balign 4, 0
spiWork: ; 0x03808E34
	.space 0x49C

valid_cnt$3731: ; 0x038092D0
	.space 1

invalid_cnt$3730: ; 0x038092D1
	.space 1

	.balign 4, 0
tpw: ; 0x038092D4
	.space 0xD4

last_touch_flg: ; 0x038093A8
	.space 0x2

	.balign 4, 0
PMi_KeyPattern: ; 0x038093AC
	.space 0x2

PMi_TriggerBL: ; 0x038093AE
	.space 0x2

	.public PMi_Initialized
PMi_Initialized: ; 0x038093B0
	.space 0x4

PMi_Work: ; 0x038093B4
	.space 0x2C

PMi_BlinkCounter: ; 0x038093E0
	.space 0x4

PMi_BlinkPatternNo: ; 0x038093E4
	.space 0x4

micw: ; 0x038093E8
	.space 0x50

micIntrInfo: ; 0x03809438
	.space 0x10

CTRDGi_EnableFlag: ; 0x03809448
	.space 0x4

CTRDGi_Work: ; 0x0380944C
	.space 0x4

lock_id: ; 0x03809450
	.space 0x2

	.balign 4, 0
current_vib: ; 0x03809454
	.space 0x4

isInitialized$3644: ; 0x03809458
	.space 0x4

isCartridgePullOut$3768: ; 0x0380945C
	.space 0x4

skipCheck$3770: ; 0x03809460
	.space 0x4

isInitialized$3633: ; 0x03809464
	.space 0x4

ctw_sp: ; 0x03809468
	.space 0x18

pulse_edge_alarm: ; 0x03809480
	.space 0x2C

nvramw: ; 0x038094AC
	.space 0x20

rtcInitialized: ; 0x038094CC
	.space 0x2

	.balign 4, 0
rtcWork: ; 0x038094D0
	.space 0x3B4

	.public WVR_BSS_START
WVR_BSS_START:
wvrStatus: ; 0x03809884
	.space 0x1

	.balign 4, 0
wvrVramImageBuf: ; 0x03809888
	.space 0x4

wvrHeapHandle: ; 0x0380988C
	.space 0x4

wvrVramImageBufSize: ; 0x03809890
	.space 0x4

wvrThread: ; 0x03809894
	.space 0xA4

wvrWlStaElement: ; 0x03809938
	.space 0x1C0

wvrThreadStack: ; 0x03809AF8
	.space 0x400

wvrWlStack: ; 0x03809EF8
	.space 0x600

wvrWlWork: ; 0x0380A4F8
	.space 0x700

	.public wmspRequestThread
wmspRequestThread: ; 0x0380ABF8
	.space 0xA4

	.public wmspIndicateThread
wmspIndicateThread: ; 0x0380AC9C
	.space 0xA4

	.public wmspMPAckAlarm
wmspMPAckAlarm: ; 0x0380AD40
	.space 0x2C

	.public wmspMPIntervalAlarm
wmspMPIntervalAlarm: ; 0x0380AD6C
	.space 0x2C

	.public wmspVAlarm
wmspVAlarm: ; 0x0380AD98
	.space 0x28

; 0x0380ADC0
