	.include "asm/macros.inc"
	.include "global.inc"

	.text

	.public MI_StopDma
	.public PXI_IsCallbackReady
	.public CARD_GetRomHeader
    .public CARDi_InitCommon
    .public CARDi_CommandReadStatus
    .public CARDi_EraseBackupSectorCore
    .public CARDi_EraseBackupSubSectorCore
    .public CARDi_EraseChipCore
    .public CARDi_InitStatusRegister
    .public CARDi_ProgramBackupCore
    .public CARDi_ReadBackupCore
    .public CARDi_SetWriteProtectCore
    .public CARDi_VerifyBackupCore
    .public CARDi_WriteBackupCore
	.public CARDi_EnableFlag
	.public cardi_common
    .public cardi_thread_stack
    .public cardi_rom_base

	; CARD

	arm_func_start CARDi_SetRomOp
CARDi_SetRomOp: ; 0x03800088
	ldr r3, _038000E0 ; =0x040001A4
_0380008C:
	ldr r2, [r3]
	tst r2, #-0x80000000
	bne _0380008C
	ldr r3, _038000E4 ; =0x040001A1
	mov r2, #0xc0
	strb r2, [r3]
	mov r2, r0, lsr #0x18
	strb r2, [r3, #7]
	mov r2, r0, lsr #0x10
	strb r2, [r3, #8]
	mov r2, r0, lsr #8
	strb r2, [r3, #9]
	strb r0, [r3, #0xa]
	mov r0, r1, lsr #0x18
	strb r0, [r3, #0xb]
	mov r0, r1, lsr #0x10
	strb r0, [r3, #0xc]
	mov r0, r1, lsr #8
	strb r0, [r3, #0xd]
	strb r1, [r3, #0xe]
	bx lr
	.align 2, 0
_038000E0: .word 0x040001A4
_038000E4: .word 0x040001A1
	arm_func_end CARDi_SetRomOp

	arm_func_start CARDi_ReadEnd
CARDi_ReadEnd: ; 0x038000E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _03800158 ; =cardi_common
	mov r1, #0
	ldr r0, [r4]
	str r1, [r0]
	ldr r7, [r4, #0x3c]
	ldr r6, [r4, #0x40]
	bl OS_DisableInterrupts
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl OS_WakeupThread
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _03800134
	add r0, r4, #0x48
	bl OS_WakeupThreadDirect
_03800134:
	mov r0, r5
	bl OS_RestoreInterrupts
	cmp r7, #0
	beq _03800150
	mov r0, r6
	mov lr, pc
	bx r7
_03800150:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03800158: .word cardi_common
	arm_func_end CARDi_ReadEnd

	arm_func_start CARDi_GetRomFlag
CARDi_GetRomFlag: ; 0x0380015C
	ldr r1, _03800178 ; =cardi_rom_header_addr
	ldr r1, [r1]
	ldr r1, [r1, #0x60]
	bic r1, r1, #0x7000000
	orr r0, r1, r0
	orr r0, r0, #0xa0000000
	bx lr
	.align 2, 0
_03800178: .word cardi_rom_header_addr
	arm_func_end CARDi_GetRomFlag

	arm_func_start CARDi_ReadCard
CARDi_ReadCard: ; 0x0380017C
	bx lr
	arm_func_end CARDi_ReadCard

	arm_func_start CARDi_ReadRomIDCore
CARDi_ReadRomIDCore: ; 0x03800180
	stmdb sp!, {r3, lr}
	mov r0, #-0x48000000
	mov r1, #0
	bl CARDi_SetRomOp
	mov r0, #0x7000000
	bl CARDi_GetRomFlag
	mov r1, #0x2000
	rsb r1, r1, #0
	ldr r2, _038001C8 ; =0x040001A4
	and r0, r0, r1
	str r0, [r2]
_038001AC:
	ldr r0, [r2]
	tst r0, #0x800000
	beq _038001AC
	ldr r0, _038001CC ; =0x04100010
	ldr r0, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038001C8: .word 0x040001A4
_038001CC: .word 0x04100010
	arm_func_end CARDi_ReadRomIDCore

	arm_func_start CARDi_ReadRomID
CARDi_ReadRomID: ; 0x038001D0
	stmdb sp!, {r4, lr}
	ldr r0, _038001FC ; =cardi_common
	mov r1, #0
	mov r2, r1
	bl CARDi_WaitTask
	bl CARDi_ReadRomIDCore
	mov r4, r0
	bl CARDi_ReadEnd
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_038001FC: .word cardi_common
	arm_func_end CARDi_ReadRomID

	arm_func_start CARDi_WaitTask
CARDi_WaitTask: ; 0x03800200
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl OS_DisableInterrupts
	mov r4, r0
	b _03800224
_0380021C:
	add r0, r7, #0xf4
	bl OS_SleepThread
_03800224:
	ldr r0, [r7, #0xfc]
	tst r0, #4
	bne _0380021C
	ldr r1, [r7, #0xfc]
	mov r0, r4
	orr r1, r1, #4
	str r1, [r7, #0xfc]
	str r6, [r7, #0x3c]
	str r5, [r7, #0x40]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end CARDi_WaitTask

	arm_func_start CARD_Init
CARD_Init: ; 0x03800254
	stmdb sp!, {r3, lr}
	ldr ip, _038002B4 ; =cardi_common
	ldr r0, [ip, #0xfc]
	cmp r0, #0
	bne _038002AC
	ldr r0, _038002B8 ; =cardi_rom_base
	mov r2, #0
	sub r1, r2, #1
	mov r3, #1
	str r3, [ip, #0xfc]
	str r2, [ip, #0x28]
	str r2, [ip, #0x24]
	str r2, [ip, #0x20]
	str r1, [ip, #0x2c]
	str r2, [ip, #0x3c]
	str r2, [ip, #0x40]
	str r2, [r0]
	bl CARDi_InitCommon
	ldr r1, _038002BC ; =CARDi_ReadCard
	ldr r0, _038002C0 ; =rom_stat
	str r1, [r0]
	bl CARD_InitPulledOutCallback
_038002AC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038002B4: .word cardi_common
_038002B8: .word cardi_rom_base
_038002BC: .word CARDi_ReadCard
_038002C0: .word rom_stat
	arm_func_end CARD_Init

	arm_func_start CARDi_OnFifoRecv
CARDi_OnFifoRecv: ; 0x038002C4
	stmdb sp!, {r3, lr}
	cmp r0, #0xb
	bne _0380039C
	cmp r2, #0
	beq _0380039C
	ldr r0, _038003A4 ; =cardi_common
	ldr r2, [r0, #8]
	cmp r2, #0
	streq r1, [r0, #4]
	ldr r2, [r0, #4]
	cmp r2, #0xf
	addls pc, pc, r2, lsl #2
	b _03800368
_038002F8: ; jump table
	b _03800338 ; case 0
	b _03800368 ; case 1
	b _0380035C ; case 2
	b _0380035C ; case 3
	b _0380035C ; case 4
	b _0380035C ; case 5
	b _0380035C ; case 6
	b _0380035C ; case 7
	b _0380035C ; case 8
	b _0380035C ; case 9
	b _0380035C ; case 10
	b _0380035C ; case 11
	b _0380035C ; case 12
	b _0380035C ; case 13
	b _0380035C ; case 14
	b _0380035C ; case 15
_03800338:
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _03800368
	cmp r2, #1
	ldreq r2, [r0, #0xfc]
	streq r1, [r0]
	orreq r1, r2, #0x10
	streq r1, [r0, #0xfc]
	b _03800368
_0380035C:
	ldr r1, [r0, #0xfc]
	orr r1, r1, #0x10
	str r1, [r0, #0xfc]
_03800368:
	ldr r1, [r0, #0xfc]
	tst r1, #0x10
	ldreq r1, [r0, #8]
	addeq r1, r1, #1
	streq r1, [r0, #8]
	beq _0380039C
	ldr r1, [r0, #0xfc]
	mov r2, #0
	str r2, [r0, #8]
	tst r1, #4
	ldrne r0, [r0, #0xec]
	addeq r0, r0, #0x48
	bl OS_WakeupThreadDirect
_0380039C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038003A4: .word cardi_common
	arm_func_end CARDi_OnFifoRecv

	arm_func_start CARDi_TaskThread
CARDi_TaskThread: ; 0x038003A8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _038005D8 ; =cardi_common
_038003B0:
	mov r5, #0
	bl OS_DisableInterrupts
	mov r6, r0
	add r8, r4, #0x48
	mov r7, r5
_038003C4:
	ldr r0, [r4, #0xfc]
	tst r0, #4
	bne _038003FC
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _03800408
	ldr r0, [r4, #0xfc]
	mov r5, #1
	orr r0, r0, #4
	str r0, [r4, #0xfc]
	ldr r0, [r4, #0xfc]
	bic r0, r0, #0x10
	str r0, [r4, #0xfc]
	b _03800418
_038003FC:
	ldr r0, [r4, #0xfc]
	tst r0, #8
	bne _03800418
_03800408:
	mov r0, r7
	str r8, [r4, #0xec]
	bl OS_SleepThread
	b _038003C4
_03800418:
	mov r0, r6
	bl OS_RestoreInterrupts
	cmp r5, #0
	beq _038005C4
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0]
	ldr r3, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r3, #0x58]
	mov r0, #1
	tst r1, r0, lsl r2
	moveq r0, #3
	streq r0, [r3]
	beq _03800568
	cmp r2, #0xf
	addls pc, pc, r2, lsl #2
	b _03800560
_03800460: ; jump table
	b _03800568 ; case 0
	b _03800568 ; case 1
	b _038004A0 ; case 2
	b _038004A8 ; case 3
	b _038004B8 ; case 4
	b _03800560 ; case 5
	b _038004C4 ; case 6
	b _038004D8 ; case 7
	b _038004EC ; case 8
	b _03800500 ; case 9
	b _03800560 ; case 10
	b _03800514 ; case 11
	b _03800534 ; case 12
	b _0380053C ; case 13
	b _03800550 ; case 14
	b _03800524 ; case 15
_038004A0:
	bl CARDi_InitStatusRegister
	b _03800568
_038004A8:
	bl CARDi_ReadRomIDCore
	ldr r1, [r4]
	str r0, [r1, #8]
	b _03800568
_038004B8:
	mov r0, #3
	str r0, [r3]
	b _03800568
_038004C4:
	ldr r0, [r3, #0xc]
	ldr r1, [r3, #0x10]
	ldr r2, [r3, #0x14]
	bl CARDi_ReadBackupCore
	b _03800568
_038004D8:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl CARDi_WriteBackupCore
	b _03800568
_038004EC:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl CARDi_ProgramBackupCore
	b _03800568
_03800500:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl CARDi_VerifyBackupCore
	b _03800568
_03800514:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl CARDi_EraseBackupSectorCore
	b _03800568
_03800524:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl CARDi_EraseBackupSubSectorCore
	b _03800568
_03800534:
	bl CARDi_EraseChipCore
	b _03800568
_0380053C:
	bl CARDi_CommandReadStatus
	ldr r1, [r4]
	ldr r1, [r1, #0x10]
	strb r0, [r1]
	b _03800568
_03800550:
	ldr r0, [r3, #0xc]
	ldrb r0, [r0]
	bl CARDi_SetWriteProtectCore
	b _03800568
_03800560:
	mov r0, #3
	str r0, [r3]
_03800568:
	mov r6, #0xb
	mov r5, #1
_03800570:
	mov r0, r6
	mov r1, r5
	mov r2, r5
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _03800570
	bl OS_DisableInterrupts
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl OS_WakeupThread
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _038005B8
	add r0, r4, #0x48
	bl OS_WakeupThreadDirect
_038005B8:
	mov r0, r5
	bl OS_RestoreInterrupts
	b _038003B0
_038005C4:
	ldr r1, [r4, #0x44]
	mov r0, r4
	mov lr, pc
	bx r1
	b _038003B0
	.align 2, 0
_038005D8: .word cardi_common
	arm_func_end CARDi_TaskThread

	arm_func_start CARD_InitPulledOutCallback
CARD_InitPulledOutCallback: ; 0x038005DC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0380062C ; =skipCheck$3668
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _03800624
	mov r1, #1
	str r1, [r0, #8]
	bl PXI_Init
	mov r5, #0xe
	mov r4, #0
_03800604:
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _03800604
	ldr r1, _03800630 ; =CARDi_CallbackForPulledOut
	mov r0, #0xe
	bl PXI_SetFifoRecvCallback
_03800624:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0380062C: .word skipCheck$3668
_03800630: .word CARDi_CallbackForPulledOut
	arm_func_end CARD_InitPulledOutCallback

	arm_func_start CARDi_CallbackForPulledOut
CARDi_CallbackForPulledOut: ; 0x03800634
	stmdb sp!, {r4, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	bne _0380068C
	mov r0, #0
	bl MI_StopDma
	mov r0, #1
	bl MI_StopDma
	mov r0, #2
	bl MI_StopDma
	mov r0, #3
	bl MI_StopDma
	mov r0, #0
	bl CTRDG_VibPulseEdgeUpdate
	bl OS_DisableInterrupts
	mov r4, r0
	bl SND_BeginSleep
	bl WVR_Shutdown
	mov r0, r4
	bl OS_RestoreInterrupts
	bl OS_Terminate
	b _03800690
_0380068C:
	bl OS_Terminate
_03800690:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end CARDi_CallbackForPulledOut

	arm_func_start CARD_IsPulledOut
CARD_IsPulledOut: ; 0x03800698
	stmdb sp!, {r3, lr}
	ldr r0, _038006D8 ; =skipCheck$3668
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _038006C8
	ldr r0, _038006DC ; =0x027FFE1F
	ldrb r0, [r0]
	tst r0, #0x80
	beq _038006C4
	bl CARD_CompareCardID
	b _038006C8
_038006C4:
	bl CARD_IsCardIreqLo
_038006C8:
	ldr r0, _038006D8 ; =skipCheck$3668
	ldr r0, [r0, #0xc]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038006D8: .word skipCheck$3668
_038006DC: .word 0x027FFE1F
	arm_func_end CARD_IsPulledOut

	arm_func_start CARD_CompareCardID
CARD_CompareCardID: ; 0x038006E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #1
	bl OS_GetLockID
	mov r4, r0
	mvn r0, #2
	cmp r4, r0
	beq _03800758
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl OS_TryLockCard
	cmp r0, #0
	bne _0380074C
	ldr r1, _03800778 ; =0x027FFC10
	ldrh r0, [r1]
	cmp r0, #0
	subeq r0, r1, #0x410
	subne r0, r1, #0x10
	ldr r0, [r0]
	str r0, [sp]
	bl CARDi_ReadRomID
	ldr r1, [sp]
	cmp r0, r1
	mov r0, r4, lsl #0x10
	moveq r5, #1
	mov r0, r0, lsr #0x10
	movne r5, #0
	bl OS_UnlockCard
_0380074C:
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl OS_ReleaseLockID
_03800758:
	ldr r1, _0380077C ; =skipCheck$3668
	cmp r5, #0
	moveq r2, #1
	movne r2, #0
	str r2, [r1, #0xc]
	mov r0, r5
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03800778: .word 0x027FFC10
_0380077C: .word skipCheck$3668
	arm_func_end CARD_CompareCardID

	arm_func_start CARD_IsCardIreqLo
CARD_IsCardIreqLo: ; 0x03800780
	ldr r0, _038007A4 ; =0x04000214
	mov r2, #1
	ldr r1, [r0]
	mov r0, r2
	tst r1, #0x100000
	ldrne r1, _038007A8 ; =skipCheck$3668
	movne r0, #0
	strne r2, [r1, #0xc]
	bx lr
	.align 2, 0
_038007A4: .word 0x04000214
_038007A8: .word skipCheck$3668
	arm_func_end CARD_IsCardIreqLo

	arm_func_start CARD_CheckPullOut_Polling
CARD_CheckPullOut_Polling: ; 0x038007AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _03800898 ; =skipCheck$3668
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _03800890
	ldr r2, _0380089C ; =0x027FFC40
	ldrh r0, [r2]
	cmp r0, #2
	beq _03800890
	ldr r1, _038008A0 ; =nextCount$3668
	mvn r0, #0
	ldr r3, [r1]
	cmp r3, r0
	ldreq r0, [r2, #-4]
	addeq r0, r0, #0xa
	streq r0, [r1]
	beq _03800890
	ldr r0, [r2, #-4]!
	cmp r0, r3
	blo _03800890
	ldr r0, [r2]
	add r0, r0, #0xa
	str r0, [r1]
	bl CARD_IsPulledOut
	cmp r0, #0
	beq _03800840
	ldr r0, _03800898 ; =skipCheck$3668
	mov r1, #1
	str r1, [r0, #4]
	bl CARD_GetRomHeader
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _03800840
	ldr r0, _038008A0 ; =nextCount$3668
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _03800890
_03800840:
	ldr r0, _03800898 ; =skipCheck$3668
	ldr r1, _038008A0 ; =nextCount$3668
	ldr r0, [r0, #4]
	mov r2, #0
	str r2, [r1, #4]
	cmp r0, #0
	beq _03800890
	mov r7, #0x64
	mov r6, #0xe
	mov r5, #0x11
	mov r4, r2
	b _03800878
_03800870:
	mov r0, r7
	bl VENEER_SVC_WaitByLoop
_03800878:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	bne _03800870
_03800890:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03800898: .word skipCheck$3668
_0380089C: .word 0x027FFC40
_038008A0: .word nextCount$3668
	arm_func_end CARD_CheckPullOut_Polling

	.section .data,4,1,1

	.type cardi_rom_header_addr,@object
	.public cardi_rom_header_addr
cardi_rom_header_addr: ; 0x03806AFC
	.word 0x027FFE00
	.size cardi_rom_header_addr,.-cardi_rom_header_addr

	.type nextCount$3668,@object
	.public nextCount$3668
nextCount$3668: ; 0x03806B00
	.word 0xFFFFFFFF
	.size nextCount$3668,.-nextCount$3668

	.type isFirstCheck$3676,@object
	.public isFirstCheck$3676
isFirstCheck$3676: ; 0x03806B04
	.word 1
	.size isFirstCheck$3676,.-isFirstCheck$3676

	.bss

	.balign 32, 0
	.type rom_stat,@object
	.public rom_stat
rom_stat: ; 0x03808C00
	.space 0x220
	.size rom_stat,.-rom_stat

	.type skipCheck$3668,@object
	.public skipCheck$3668
skipCheck$3668: ; 0x03808E20
	.space 0x4
	.size skipCheck$3668,.-skipCheck$3668

	.type isCardPullOut,@object
	.public isCardPullOut
isCardPullOut: ; 0x03808E24
	.space 0x4
	.size isCardPullOut,.-isCardPullOut

	.type isInitialized$3621,@object
	.public isInitialized$3621
isInitialized$3621: ; 0x03808E28
	.space 0x4
	.size isInitialized$3621,.-isInitialized$3621

	.type detectPullOut,@object
	.public detectPullOut
detectPullOut: ; 0x03808E2C
	.space 0x4
	.size detectPullOut,.-detectPullOut
