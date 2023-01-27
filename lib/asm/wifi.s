	.include "asm/macros.inc"
	.include "wifi.inc"
	.include "global.inc"

	.bss

	.public _021D4420
_021D4420:
	.space 0x4

_021D4424: ; 0x021D4424
	.space 0x4

_021D4428: ; 0x021D4428
	.space 0x4

_021D442C: ; 0x021D442C
	.space 0x4

_021D4430: ; 0x021D4430
	.space 0x30

_021D4460: ; 0x021D4460
	.space 0x4

_021D4464: ; 0x021D4464
	.space 0x20

_021D4484: ; 0x021D4484
	.space 0x8

_021D448C: ; 0x021D448C
	.space 0x4

_021D4490: ; 0x021D4490
	.space 0x4

_021D4494: ; 0x021D4494
	.space 0x18

_021D44AC: ; 0x021D44AC
	.space 0x8

_021D44B4: ; 0x021D44B4
	.space 0x20

_021D44D4: ; 0x021D44D4
	.space 0x38

_021D450C: ; 0x021D450C
	.space 0x10

_021D451C: ; 0x021D451C
	.space 0x104

_021D4620: ; 0x021D4620
	.space 0x14

_021D4634: ; 0x021D4634
	.space 0x8

_021D463C: ; 0x021D463C
	.space 0x10

_021D464C: ; 0x021D464C
	.space 0x14

_021D4660: ; 0x021D4660
	.space 0x10

	.public _021D4670
_021D4670: ; 0x021D4670
	.space 0x10

_021D4680: ; 0x021D4680
	.space 0x8

_021D4688: ; 0x021D4688
	.space 0x18

_021D46A0: ; 0x021D46A0
	.space 0xA

_021D46AA: ; 0x021D46AA
	.space 0x56

_021D4700: ; 0x021D4700
	.space 0x20

_021D4720: ; 0x021D4720
	.space 0x44

_021D4764: ; 0x021D4764
	.space 0x64

_021D47C8: ; 0x021D47C8
	.space 0xC0

_021D4888: ; 0x021D4888
	.space 0xC0

_021D4948: ; 0x021D4948
	.space 0x1C0

_021D4B08: ; 0x021D4B08
	.space 0x2A

_021D4B32: ; 0x021D4B32
	.space 0x1A

_021D4B4C: ; 0x021D4B4C
	.space 0x2A

_021D4B76: ; 0x021D4B76
	.space 0x156

_021D4CCC: ; 0x021D4CCC
	.space 0x994

_021D5660: ; 0x021D5660
	.space 0x800

_021D5E60: ; 0x021D5E60
	.space 0x8

_021D5E68: ; 0x021D5E68
	.space 0x170

_021D5FD8: ; 0x021D5FD8
	.space 0x13

_021D5FEB: ; 0x021D5FEB
	.space 0x1

_021D5FEC: ; 0x021D5FEC
	.space 0x4

_021D5FF0: ; 0x021D5FF0
	.space 0x4

_021D5FF4: ; 0x021D5FF4
	.space 0x8

_021D5FFC: ; 0x021D5FFC
	.space 0x20

_021D601C: ; 0x021D601C
	.space 0x4

_021D6020: ; 0x021D6020
	.space 0x20

	.text

	; NitroWiFi: libsoc.a

	arm_func_start SOCL_Startup
SOCL_Startup: ; 0x020A0804
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _020A0838 ; =_version_NINTENDO_WiFi
	bl OSi_ReferSymbol
	ldr r0, _020A083C ; =_02110628
	ldr r1, [r0]
	cmp r1, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	str r4, [r0]
	bl SOCLi_StartupCPS
	bl SOCLi_StartupSOCL
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A0838: .word _version_NINTENDO_WiFi
_020A083C: .word _02110628
	arm_func_end SOCL_Startup

	arm_func_start SOCLi_StartupSOCL
SOCLi_StartupSOCL: ; 0x020A0840
	stmdb sp!, {r4, lr}
	ldr r0, _020A0874 ; =_02110628
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	bl SOCLi_StartupCommandPacketQueue
	movs r4, r0
	bmi _020A086C
	ldr r0, _020A0878 ; =_02110660
	bl SOCL_CreateSocket
	ldr r1, _020A087C ; =_021D4420
	str r0, [r1, #0xc]
_020A086C:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A0874: .word _02110628
_020A0878: .word _02110660
_020A087C: .word _021D4420
	arm_func_end SOCLi_StartupSOCL

	arm_func_start SOCLi_StartupCPS
SOCLi_StartupCPS: ; 0x020A0880
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020A09B4 ; =_02110628
	ldr r4, _020A09B8 ; =_021D4430
	ldr r5, [r0]
	mov r0, r4
	mov r1, #0
	mov r2, #0x30
	bl MI_CpuFill8
	ldr r1, [r5, #0x18]
	ldr r0, _020A09BC ; =_021D4420
	ldr r2, _020A09C0 ; =SOCL_LinkIsOn
	str r1, [r0, #0x14]
	ldr r3, [r5, #0x1c]
	mov r1, #0
	str r3, [r0, #0x18]
	str r2, [r0, #0x20]
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	ldr r1, [r0]
	str r1, [r0, #0x3c]
	ldr r0, [r5, #0x24]
	cmp r0, #0
	moveq r0, #0x4000
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x28]
	cmp r0, #0
	bne _020A0900
	ldr r1, _020A09B4 ; =_02110628
	ldr r0, [r4, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #0x18]
	blx r1
_020A0900:
	str r0, [r4, #0x1c]
	ldr r1, [r5, #0x30]
	ldr lr, [r5, #0x34]
	cmp r1, #0
	moveq r1, #0x240
	sub ip, r1, #0x28
	cmp lr, #0
	moveq lr, #0x10c0
	ldr r2, _020A09C4 ; =_02110648
	add r0, lr, lr, lsr #31
	ldr r1, _020A09C8 ; =_021D4670
	mov r3, #0
	strh lr, [r2, #2]
	mov r0, r0, asr #1
	strh r0, [r2, #4]
	str ip, [r4, #0x24]
	str r3, [r1]
	ldr r0, [r5]
	mov r2, #1
	cmp r0, #0
	beq _020A0974
	ldr r1, _020A09CC ; =SOCLi_DhcpTimeout
	ldr r0, _020A09BC ; =_021D4420
	str r3, [r4]
	str r1, [r4, #0xc]
	str r2, [r0, #8]
	ldr r0, [r0, #4]
	str r0, [r4, #0x28]
	b _020A0988
_020A0974:
	ldr r0, _020A09BC ; =_021D4420
	ldr r1, _020A09D0 ; =SOCLi_SetMyIP
	str r3, [r0, #8]
	str r2, [r4]
	str r1, [r4, #0xc]
_020A0988:
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	moveq r0, #0xb
	bl CPS_SetThreadPriority
	ldr r0, _020A09D4 ; =CPSi_RecvCallbackFunc
	bl WCM_SetRecvDCFCallback
	ldr r0, _020A09D8 ; =SOCLi_TrashSocket
	bl CPS_SetScavengerCallback
	mov r0, r4
	bl CPS_Startup
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A09B4: .word _02110628
_020A09B8: .word _021D4430
_020A09BC: .word _021D4420
_020A09C0: .word SOCL_LinkIsOn
_020A09C4: .word _02110648
_020A09C8: .word _021D4670
_020A09CC: .word SOCLi_DhcpTimeout
_020A09D0: .word SOCLi_SetMyIP
_020A09D4: .word CPSi_RecvCallbackFunc
_020A09D8: .word SOCLi_TrashSocket
	arm_func_end SOCLi_StartupCPS

	arm_func_start SOCLi_SetMyIP
SOCLi_SetMyIP: ; 0x020A09DC
	ldr r0, _020A0A30 ; =_02110628
	ldr r1, _020A0A34 ; =_021D4670
	ldr ip, [r0]
	ldr r0, _020A0A38 ; =_021D463C
	ldr r3, [ip, #4]
	ldr r2, _020A0A3C ; =_021D464C
	str r3, [r1]
	ldr r3, [ip, #8]
	ldr r1, _020A0A40 ; =_021D4680
	str r3, [r0]
	ldr r3, [ip, #0xc]
	ldr r0, _020A0A44 ; =_021D4420
	str r3, [r2]
	ldr r2, [ip, #0x10]
	str r2, [r1]
	ldr r2, [ip, #0x14]
	str r2, [r1, #4]
	ldr r1, [r0, #8]
	orr r1, r1, #2
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_020A0A30: .word _02110628
_020A0A34: .word _021D4670
_020A0A38: .word _021D463C
_020A0A3C: .word _021D464C
_020A0A40: .word _021D4680
_020A0A44: .word _021D4420
	arm_func_end SOCLi_SetMyIP

	arm_func_start SOCLi_DhcpTimeout
SOCLi_DhcpTimeout: ; 0x020A0A48
	ldr r0, _020A0A5C ; =_021D4420
	ldr r1, [r0, #8]
	orr r1, r1, #2
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_020A0A5C: .word _021D4420
	arm_func_end SOCLi_DhcpTimeout

	arm_func_start SOCL_LinkIsOn
SOCL_LinkIsOn: ; 0x020A0A60
	stmdb sp!, {r3, lr}
	bl WCM_GetApMacAddress
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end SOCL_LinkIsOn

	arm_func_start SOCLi_StartupCommandPacketQueue
SOCLi_StartupCommandPacketQueue: ; 0x020A0A78
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r0, #0x2c
	mul r1, r4, r0
	ldr r0, _020A0B00 ; =_02110628
	mov r2, r4, lsl #2
	add r2, r2, #3
	ldr r0, [r0]
	add r1, r1, #3
	bic r5, r2, #3
	bic r2, r1, #3
	ldr r1, [r0, #0x18]
	add r0, r2, r5
	blx r1
	movs r6, r0
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, _020A0B04 ; =_021D4464
	mov r1, r6
	mov r2, r4
	bl OS_InitMessageQueue
	cmp r4, #0
	add r5, r6, r5
	ble _020A0AF0
_020A0AD8:
	mov r0, r5
	bl SOCLi_FreeCommandPacket
	sub r4, r4, #1
	cmp r4, #0
	add r5, r5, #0x2c
	bgt _020A0AD8
_020A0AF0:
	ldr r1, _020A0B08 ; =_021D4460
	mov r0, #0
	str r6, [r1]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A0B00: .word _02110628
_020A0B04: .word _021D4464
_020A0B08: .word _021D4460
	arm_func_end SOCLi_StartupCommandPacketQueue

	arm_func_start SOCLi_CleanupCommandPacketQueue
SOCLi_CleanupCommandPacketQueue: ; 0x020A0B0C
	stmdb sp!, {r3, lr}
	ldr r0, _020A0B4C ; =_021D4460
	ldr r2, [r0, #0x20]
	ldr r1, [r0, #0x18]
	cmp r2, r1
	mvnlt r0, #0
	ldmltia sp!, {r3, pc}
	ldr r1, _020A0B50 ; =_02110628
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r1, [r1, #0x1c]
	blx r1
	ldr r1, _020A0B4C ; =_021D4460
	mov r0, #0
	str r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A0B4C: .word _021D4460
_020A0B50: .word _02110628
	arm_func_end SOCLi_CleanupCommandPacketQueue

	arm_func_start SOCLi_AllocCommandPacket
SOCLi_AllocCommandPacket: ; 0x020A0B54
	stmdb sp!, {r3, lr}
	mov r2, r0
	ldr r0, _020A0B78 ; =_021D4464
	add r1, sp, #0
	bl OS_ReceiveMessage
	cmp r0, #0
	ldrne r0, [sp]
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A0B78: .word _021D4464
	arm_func_end SOCLi_AllocCommandPacket

	arm_func_start SOCLi_CreateCommandPacket
SOCLi_CreateCommandPacket: ; 0x020A0B7C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r2
	mov r6, r0
	mov r0, r4
	mov r5, r1
	bl SOCLi_AllocCommandPacket
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	str r6, [r0]
	str r5, [r0, #4]
	mov r1, #0
	str r1, [r0, #8]
	ldrsb r1, [r5, #0x73]
	strb r1, [r0, #0xc]
	strb r4, [r0, #0xd]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end SOCLi_CreateCommandPacket

	arm_func_start SOCLi_FreeCommandPacket
SOCLi_FreeCommandPacket: ; 0x020A0BBC
	stmdb sp!, {r3, lr}
	movs r1, r0
	ldmeqia sp!, {r3, pc}
	ldr r0, _020A0BD8 ; =_021D4464
	mov r2, #0
	bl OS_SendMessage
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A0BD8: .word _021D4464
	arm_func_end SOCLi_FreeCommandPacket

	arm_func_start SOCLi_GetCtrlPipe
SOCLi_GetCtrlPipe: ; 0x020A0BDC
	ldr r1, [r0, #0x64]
	cmp r1, #0
	ldreq r1, [r0, #0x68]
	mov r0, r1
	bx lr
	arm_func_end SOCLi_GetCtrlPipe

	arm_func_start SOCLi_SendCommandPacket
SOCLi_SendCommandPacket: ; 0x020A0BF0
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r1
	beq _020A0C08
	ldrsb r1, [r5, #0xd]
	tst r1, #1
	beq _020A0C10
_020A0C08:
	mov r2, #1
	b _020A0C14
_020A0C10:
	mov r2, #0
_020A0C14:
	mov r1, r5
	bl OS_SendMessage
	movs r4, r0
	bne _020A0C2C
	mov r0, r5
	bl SOCLi_FreeCommandPacket
_020A0C2C:
	cmp r4, #0
	movne r0, #0
	mvneq r0, #0x29
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SOCLi_SendCommandPacket

	arm_func_start SOCLi_SendCommandPacketToCtrlPipe
SOCLi_SendCommandPacketToCtrlPipe: ; 0x020A0C3C
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl SOCLi_GetCtrlPipe
	mov r1, r4
	bl SOCLi_SendCommandPacket
	ldmia sp!, {r4, pc}
	arm_func_end SOCLi_SendCommandPacketToCtrlPipe

	arm_func_start SOCLi_ExecCommandPacket
SOCLi_ExecCommandPacket: ; 0x020A0C54
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x28
	mov r4, r1
	ldrsb r2, [r4, #0xd]
	mov r5, r0
	cmp r2, #1
	bne _020A0CA8
	add r0, sp, #8
	add r1, sp, #0
	mov r2, #1
	bl OS_InitMessageQueue
	add r2, sp, #8
	mov r0, r5
	mov r1, r4
	str r2, [r4, #8]
	bl SOCLi_SendCommandPacket
	add r0, sp, #8
	add r1, sp, #4
	mov r2, #1
	bl OS_ReceiveMessage
	b _020A0CB8
_020A0CA8:
	mov r2, #0
	str r2, [r4, #8]
	bl SOCLi_SendCommandPacket
	str r0, [sp, #4]
_020A0CB8:
	ldr r0, [sp, #4]
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SOCLi_ExecCommandPacket

	arm_func_start SOCLi_ExecCommandPacketInRecvPipe
SOCLi_ExecCommandPacketInRecvPipe: ; 0x020A0CC4
	ldr ip, _020A0CD0 ; =SOCLi_ExecCommandPacket
	ldr r0, [r0, #0x64]
	bx ip
	.align 2, 0
_020A0CD0: .word SOCLi_ExecCommandPacket
	arm_func_end SOCLi_ExecCommandPacketInRecvPipe

	arm_func_start SOCLi_ExecCommandPacketInSendPipe
SOCLi_ExecCommandPacketInSendPipe: ; 0x020A0CD4
	ldr ip, _020A0CE0 ; =SOCLi_ExecCommandPacket
	ldr r0, [r0, #0x68]
	bx ip
	.align 2, 0
_020A0CE0: .word SOCLi_ExecCommandPacket
	arm_func_end SOCLi_ExecCommandPacketInSendPipe

	arm_func_start SOCLi_ExecCommandPacketInCtrlPipe
SOCLi_ExecCommandPacketInCtrlPipe: ; 0x020A0CE4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl SOCLi_GetCtrlPipe
	mov r1, r4
	bl SOCLi_ExecCommandPacket
	ldmia sp!, {r4, pc}
	arm_func_end SOCLi_ExecCommandPacketInCtrlPipe

	arm_func_start SOCLi_CommandPacketHandler
SOCLi_CommandPacketHandler: ; 0x020A0CFC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r4, #0
	mov sb, r0
	mov sl, r4
	add r6, sp, #0
	mov r5, #1
_020A0D18:
	mov r0, sb
	mov r1, r6
	mov r2, r5
	bl OS_ReadMessage
	ldr r0, [sp]
	cmp r0, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, [r0]
	blx r1
	mov r8, r0
	bl OS_DisableInterrupts
	mov r7, r0
	bl OS_DisableScheduler
	mov r0, sb
	mov r1, r4
	mov r2, r4
	bl OS_ReceiveMessage
	ldr r0, [sp]
	ldr r0, [r0, #4]
	cmp r0, #0
	strne r8, [r0, #0x6c]
	ldr r0, [sp]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _020A0D8C
	mov r1, r8
	mov r2, sl
	bl OS_SendMessage
_020A0D8C:
	ldr r0, [sp]
	bl SOCLi_FreeCommandPacket
	bl OS_EnableScheduler
	mov r0, r7
	bl OS_RestoreInterrupts
	b _020A0D18
_020A0DA4: ; 0x020A0DA4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end SOCLi_CommandPacketHandler

	arm_func_start SOCL_CreateSocket
SOCL_CreateSocket: ; 0x020A0DAC
	stmdb sp!, {r4, lr}
	bl SOCLi_StartupSocket
	movs r4, r0
	mvneq r0, #0x30
	ldmeqia sp!, {r4, pc}
	ldr r0, _020A0DE4 ; =SOCLi_CreateSocketCallBack
	mov r1, r4
	mov r2, #1
	bl SOCLi_CreateCommandPacket
	mov r1, r0
	mov r0, r4
	bl SOCLi_ExecCommandPacketInCtrlPipe
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A0DE4: .word SOCLi_CreateSocketCallBack
	arm_func_end SOCL_CreateSocket

	arm_func_start SOCLi_CreateSocketCallBack
SOCLi_CreateSocketCallBack: ; 0x020A0DE8
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #4]
	mov r0, r4
	bl CPS_SocRegister
	ldrsb r0, [r4, #0x73]
	ldr r1, [r4, #0x68]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _020A0E48
_020A0E0C: ; jump table
	b _020A0E20 ; case 0
	b _020A0E30 ; case 1
	b _020A0E44 ; case 2
	b _020A0E48 ; case 3
	b _020A0E20 ; case 4
_020A0E20:
	add r0, r1, #0x20
	bl CPS_SocDup
	bl CPS_SocUse
	b _020A0E48
_020A0E30:
	bl CPS_SocUse
	bl CPS_SocDatagramMode
	ldr r0, _020A0E58 ; =SOCLi_UdpRecvCallback
	bl CPS_SetUdpCallback
	b _020A0E48
_020A0E44:
	bl CPS_SocDatagramMode
_020A0E48:
	mov r0, #1
	strh r0, [r4, #0x70]
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A0E58: .word SOCLi_UdpRecvCallback
	arm_func_end SOCLi_CreateSocketCallBack

	arm_func_start SOCLi_StartupSocket
SOCLi_StartupSocket: ; 0x020A0E5C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	bl SOCLi_GetSizeSocket
	mov r4, r0
	bl OS_DisableInterrupts
	ldr r1, _020A0EC0 ; =_02110628
	mov r6, r0
	ldr r1, [r1]
	mov r0, r4
	ldr r1, [r1, #0x18]
	blx r1
	movs r5, r0
	beq _020A0EB0
	mov r2, r4
	mov r1, #0
	bl MI_CpuFill8
	mov r0, r5
	mov r1, r7
	bl SOCLi_InitSocket
	mov r0, r5
	bl SOCLi_SocketRegister
_020A0EB0:
	mov r0, r6
	bl OS_RestoreInterrupts
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A0EC0: .word _02110628
	arm_func_end SOCLi_StartupSocket

	arm_func_start SOCLi_GetSizeSocket
SOCLi_GetSizeSocket: ; 0x020A0EC4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrh r0, [r5, #2]
	mov r4, #0x80
	cmp r0, #0
	beq _020A0F00
	add r4, r4, #0x114
	bl SOCLi_RoundUp4
	add r4, r4, r0
	ldrh r0, [r5, #8]
	bl SOCLi_RoundUp4
	add r4, r4, r0
	add r0, r5, #0x10
	bl SOCLi_GetSizeCommandPipe
	add r4, r4, r0
_020A0F00:
	ldrh r0, [r5, #6]
	cmp r0, #0
	beq _020A0F3C
	add r4, r4, #0x110
	bl SOCLi_RoundUp4
	add r4, r4, r0
	ldrh r0, [r5, #0xa]
	bl SOCLi_RoundUp4
	add r4, r4, r0
	ldrh r0, [r5, #0xc]
	bl SOCLi_RoundUp4
	add r4, r4, r0
	add r0, r5, #0x14
	bl SOCLi_GetSizeCommandPipe
	add r4, r4, r0
_020A0F3C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SOCLi_GetSizeSocket

	arm_func_start SOCLi_GetSizeCommandPipe
SOCLi_GetSizeCommandPipe: ; 0x020A0F44
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #3]
	mov r0, r0, lsl #2
	bl SOCLi_RoundUp4
	mov r4, r0
	ldrh r0, [r5]
	bl SOCLi_RoundUp4
	add r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SOCLi_GetSizeCommandPipe

	arm_func_start SOCLi_InitSocket
SOCLi_InitSocket: ; 0x020A0F6C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	ldrsb r1, [r5]
	mov r6, r0
	add r4, r6, #0x80
	strb r1, [r6, #0x73]
	ldrsb r0, [r5, #1]
	strb r0, [r6, #0x72]
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _020A0FEC
	str r4, [r6, #0x64]
	ldrh r2, [r5, #4]
	mov r1, r4
	add r0, r4, #0x114
	strh r2, [r4, #0xfc]
	add r2, r5, #0x10
	mov r7, r4
	bl SOCLi_InitCommandPipe
	ldrh r2, [r5, #2]
	add r1, r6, #0x3c
	bl SOCLi_InitSocketBuffer
	ldrh r2, [r5, #8]
	add r1, r6, #0x50
	bl SOCLi_InitSocketBuffer
	ldrh r3, [r5, #0xe]
	add r1, r7, #0x100
	mov r2, #0
	strh r3, [r1, #0xa]
	str r2, [r7, #0x110]
	mov r4, r0
	str r2, [r7, #0x10c]
_020A0FEC:
	ldrh r0, [r5, #6]
	cmp r0, #0
	beq _020A104C
	str r4, [r6, #0x68]
	mov r1, r4
	str r6, [r4, #0x10c]
	add r0, r4, #0x110
	add r2, r5, #0x14
	mov r7, r4
	bl SOCLi_InitCommandPipe
	ldrh r2, [r5, #6]
	add r1, r6, #0x48
	bl SOCLi_InitSocketBuffer
	ldrh r2, [r5, #0xa]
	add r1, r6, #0x58
	bl SOCLi_InitSocketBuffer
	ldrh r2, [r5, #0xc]
	add r1, r4, #0xf8
	bl SOCLi_InitSocketBuffer
	mov r1, #0
	str r1, [r7, #0x108]
	mov r4, r0
	str r1, [r7, #0x104]
	b _020A105C
_020A104C:
	ldr r0, _020A1064 ; =_021D442C
	ldr r0, [r0]
	ldr r0, [r0, #0x68]
	str r0, [r6, #0x68]
_020A105C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A1064: .word _021D442C
	arm_func_end SOCLi_InitSocket

	arm_func_start SOCLi_InitSocketBuffer
SOCLi_InitSocketBuffer: ; 0x020A1068
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r2, #0
	moveq r0, #0
	str r0, [r1, #4]
	mov r0, r2
	str r2, [r1]
	bl SOCLi_RoundUp4
	add r0, r4, r0
	ldmia sp!, {r4, pc}
	arm_func_end SOCLi_InitSocketBuffer

	arm_func_start SOCLi_InitCommandPipe
SOCLi_InitCommandPipe: ; 0x020A1090
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r2
	mov r7, r0
	mov r0, r5
	mov r6, r1
	bl SOCLi_GetSizeCommandPipe
	mov r4, r0
	ldrb r2, [r5, #3]
	mov r0, r6
	mov r1, r7
	bl OS_InitMessageQueue
	add r0, r6, #0xe0
	bl OS_InitMutex
	ldrh r2, [r5]
	add r0, r6, #0x20
	ldr r1, _020A1100 ; =SOCLi_CommandPacketHandler
	str r2, [sp]
	ldrb ip, [r5, #2]
	mov r2, r6
	add r3, r7, r4
	str ip, [sp, #4]
	bl OS_CreateThread
	add r0, r6, #0x20
	bl OS_WakeupThreadDirect
	add r0, r7, r4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A1100: .word SOCLi_CommandPacketHandler
	arm_func_end SOCLi_InitCommandPipe

	arm_func_start SOCL_Listen
SOCL_Listen: ; 0x020A1104
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl SOCL_SocketIsInvalid
	cmp r0, #0
	mvnne r0, #0x1b
	ldmneia sp!, {r4, pc}
	cmp r4, #0
	mov r1, #0
	beq _020A1134
	ldrsh r0, [r4, #0x70]
	tst r0, #1
	movne r1, #1
_020A1134:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #0x70]
	tst r0, #2
	mvnne r0, #0x1b
	ldmneia sp!, {r4, pc}
	ldrsb r0, [r4, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	mvneq r0, #0x1b
	ldmeqia sp!, {r4, pc}
	ldrsb r0, [r4, #0x72]
	cmp r0, #1
	moveq r0, #0
	mvnne r0, #5
	ldmia sp!, {r4, pc}
	arm_func_end SOCL_Listen

	arm_func_start SOCL_Accept
SOCL_Accept: ; 0x020A1184
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl SOCL_SocketIsInvalid
	cmp r0, #0
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	mov r1, #0
	beq _020A11BC
	ldrsh r0, [r6, #0x70]
	tst r0, #1
	movne r1, #1
_020A11BC:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsh r0, [r6, #0x70]
	tst r0, #2
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsb r0, [r6, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	mvneq r0, #0x1b
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrsb r0, [r6, #0x72]
	cmp r0, #1
	mvnne r0, #5
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _020A1244 ; =_02110648
	bl SOCL_CreateSocket
	movs r7, r0
	ldmmiia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r1, [r6, #0x74]
	bl SOCL_Bind
	cmp r0, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	mov r1, r5
	mov r2, r4
	bl SOCL_ListenAccept
	cmp r0, #0
	movge r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A1244: .word _02110648
	arm_func_end SOCL_Accept

	arm_func_start SOCL_ListenAccept
SOCL_ListenAccept: ; 0x020A1248
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl SOCL_SocketIsInvalid
	cmp r0, #0
	mvnne r0, #0x1b
	ldmneia sp!, {r4, r5, r6, pc}
	cmp r6, #0
	mov r1, #0
	beq _020A1280
	ldrsh r0, [r6, #0x70]
	tst r0, #1
	movne r1, #1
_020A1280:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsh r0, [r6, #0x70]
	tst r0, #2
	mvnne r0, #0x1b
	ldmneia sp!, {r4, r5, r6, pc}
	ldrsb r0, [r6, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	mvneq r0, #0x1b
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsb r2, [r6, #0x72]
	cmp r2, #1
	mvnne r0, #5
	ldmneia sp!, {r4, r5, r6, pc}
	ldrh r0, [r6, #0x74]
	cmp r0, #0
	mvneq r0, #0x1b
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, _020A1314 ; =SOCLi_ListenAcceptCallBack
	mov r1, r6
	bl SOCLi_CreateCommandPacket
	mov r1, r0
	ldrh r2, [r6, #0x74]
	mov r0, r6
	strh r2, [r1, #0x10]
	str r5, [r1, #0x14]
	str r4, [r1, #0x18]
	ldrsh r2, [r6, #0x70]
	orr r2, r2, #2
	strh r2, [r6, #0x70]
	bl SOCLi_ExecCommandPacketInRecvPipe
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A1314: .word SOCLi_ListenAcceptCallBack
	arm_func_end SOCL_ListenAccept

	arm_func_start SOCLi_ListenAcceptCallBack
SOCLi_ListenAcceptCallBack: ; 0x020A1318
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r6, r0
	ldr r4, [r6, #4]
	ldr r5, [r4, #0x64]
	add r0, r5, #0xe0
	bl OS_LockMutex
	mov r1, #0
	ldrh r0, [r6, #0x10]
	mov r2, r1
	bl CPS_SocBind
	bl CPS_TcpListen
	mov r2, #0
	add r0, sp, #0
	add r1, sp, #4
	str r2, [r5, #0xf8]
	bl CPS_SocWho
	ldrh r2, [sp]
	ldr r1, [r6, #0x14]
	strh r2, [r1]
	ldr r1, [r6, #0x18]
	str r0, [r1]
	ldrsh r1, [r4, #0x70]
	add r0, r5, #0xe0
	orr r1, r1, #4
	strh r1, [r4, #0x70]
	bl OS_UnlockMutex
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end SOCLi_ListenAcceptCallBack

	arm_func_start SOCL_Bind
SOCL_Bind: ; 0x020A1390
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl SOCL_SocketIsInvalid
	cmp r0, #0
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	mov r1, #0
	beq _020A13C4
	ldrsh r0, [r5, #0x70]
	tst r0, #1
	movne r1, #1
_020A13C4:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r0, [r5, #0x70]
	tst r0, #2
	mvnne r0, #6
	ldmneia sp!, {r3, r4, r5, pc}
	strh r4, [r5, #0x74]
	ldrsb r0, [r5, #0x73]
	cmp r0, #1
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl SOCLi_ExecBindCommand
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SOCL_Bind

	arm_func_start SOCL_Connect
SOCL_Connect: ; 0x020A1400
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl SOCL_SocketIsInvalid
	cmp r0, #0
	bne _020A1428
	ldrsh r0, [r6, #0x70]
	tst r0, #8
	beq _020A1430
_020A1428:
	mvn r0, #0x1b
	ldmia sp!, {r4, r5, r6, pc}
_020A1430:
	cmp r6, #0
	mov r1, #0
	beq _020A1448
	ldrsh r0, [r6, #0x70]
	tst r0, #1
	movne r1, #1
_020A1448:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrsb r0, [r6, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A14D4
	ldrsh r0, [r6, #0x70]
	tst r0, #4
	beq _020A1490
	ldrsb r0, [r6, #0x72]
	cmp r0, #1
	mvneq r0, #0x1d
	movne r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_020A1490:
	ldrsh r0, [r6, #0x70]
	tst r0, #2
	beq _020A14B4
	ldrsh r0, [r6, #0x70]
	tst r0, #0x40
	ldrne r0, [r6, #0x6c]
	ldreq r0, _020A14E4 ; =_0211062C
	ldreq r0, [r0]
	ldmia sp!, {r4, r5, r6, pc}
_020A14B4:
	strh r5, [r6, #0x76]
	mov r0, r6
	str r4, [r6, #0x78]
	bl SOCLi_ExecBindCommand
	ldrsb r1, [r6, #0x72]
	cmp r1, #1
	mvnne r0, #0x19
	ldmia sp!, {r4, r5, r6, pc}
_020A14D4:
	strh r5, [r6, #0x76]
	str r4, [r6, #0x78]
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A14E4: .word _0211062C
	arm_func_end SOCL_Connect

	arm_func_start SOCLi_ExecBindCommand
SOCLi_ExecBindCommand: ; 0x020A14E8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrsb r2, [r4, #0x72]
	ldr r0, _020A153C ; =SOCLi_BindCallBack
	mov r1, r4
	bl SOCLi_CreateCommandPacket
	movs r1, r0
	mvneq r0, #0x20
	ldmeqia sp!, {r4, pc}
	ldrh r2, [r4, #0x74]
	mov r0, r4
	strh r2, [r1, #0x10]
	ldrh r2, [r4, #0x76]
	strh r2, [r1, #0x12]
	ldr r2, [r4, #0x78]
	str r2, [r1, #0x14]
	ldrsh r2, [r4, #0x70]
	orr r2, r2, #2
	strh r2, [r4, #0x70]
	bl SOCLi_ExecCommandPacketInRecvPipe
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A153C: .word SOCLi_BindCallBack
	arm_func_end SOCLi_ExecBindCommand

	arm_func_start SOCLi_BindCallBack
SOCLi_BindCallBack: ; 0x020A1540
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r4, [r7, #4]
	mov r6, #0
	ldr r5, [r4, #0x64]
	add r0, r5, #0xe0
	bl OS_LockMutex
	ldrh r0, [r7, #0x10]
	ldrh r1, [r7, #0x12]
	ldr r2, [r7, #0x14]
	bl CPS_SocBind
	mov r0, r6
	str r0, [r5, #0xf8]
	ldrsb r0, [r7, #0xc]
	cmp r0, #0
	cmpne r0, #4
	bne _020A158C
	bl CPS_TcpConnect
	mov r6, r0
_020A158C:
	add r0, r5, #0xe0
	bl OS_UnlockMutex
	cmp r6, #0
	beq _020A15B0
	ldrsh r1, [r4, #0x70]
	mvn r0, #0x4b
	orr r1, r1, #0x40
	strh r1, [r4, #0x70]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A15B0:
	ldrsh r1, [r4, #0x70]
	mov r0, #0
	orr r1, r1, #4
	strh r1, [r4, #0x70]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end SOCLi_BindCallBack

	arm_func_start SOCL_ReadFrom
SOCL_ReadFrom: ; 0x020A15C4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl SOCL_SocketIsInvalid
	cmp r0, #0
	addne sp, sp, #0xc
	mvnne r0, #0x1b
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [sp, #0x2c]
	tst r0, #4
	bne _020A1608
	ldrsb r0, [sb, #0x72]
	cmp r0, #0
	bne _020A1624
_020A1608:
	ldrsb r0, [sb, #0x73]
	cmp r0, #4
	addeq sp, sp, #0xc
	mvneq r0, #0x1b
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	mov r5, #0
	b _020A163C
_020A1624:
	bl OS_GetProcMode
	cmp r0, #0x12
	addeq sp, sp, #0xc
	mvneq r0, #0x1b
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	mov r5, #1
_020A163C:
	cmp sb, #0
	mov r1, #0
	beq _020A1654
	ldrsh r0, [sb, #0x70]
	tst r0, #1
	movne r1, #1
_020A1654:
	cmp r1, #0
	addeq sp, sp, #0xc
	mvneq r0, #0x26
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldrsb r0, [sb, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A16A4
	ldrsh r0, [sb, #0x70]
	tst r0, #4
	beq _020A1698
	ldrsh r0, [sb, #0x70]
	tst r0, #8
	beq _020A16A4
_020A1698:
	add sp, sp, #0xc
	mvn r0, #0x37
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_020A16A4:
	ldr r4, [sb, #0x64]
	tst r5, #1
	add r0, r4, #0xe0
	bne _020A16CC
	bl OS_TryLockMutex
	cmp r0, #0
	bne _020A16D0
	add sp, sp, #0xc
	mvn r0, #5
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_020A16CC:
	bl OS_LockMutex
_020A16D0:
	ldr r0, [sp, #0x28]
	ldr ip, [sp, #0x2c]
	str r0, [sp]
	mov r0, sb
	mov r1, r8
	mov r2, r7
	mov r3, r6
	stmib sp, {r5, ip}
	bl SOCLi_ReadAndConsumeBuffer
	mov r5, r0
	add r0, r4, #0xe0
	bl OS_UnlockMutex
	mov r0, r5
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end SOCL_ReadFrom

	arm_func_start SOCLi_ReadAndConsumeBuffer
SOCLi_ReadAndConsumeBuffer: ; 0x020A170C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r4, [sp, #0x28]
	mov r7, r0
	tst r4, #2
	ldr r4, [r7, #0x64]
	cmpne r4, #0
	movne r6, #1
	moveq r6, #0
	cmp r6, #0
	ldrnesb r5, [r4, #0xfe]
	movne r0, #1
	strneb r0, [r4, #0xfe]
	ldrsb r0, [r7, #0x73]
	cmp r0, #1
	bne _020A176C
	ldr r0, [sp, #0x20]
	ldr ip, [sp, #0x24]
	str r0, [sp]
	mov r0, r7
	str ip, [sp, #4]
	bl SOCLi_ReadUdpBuffer
	mov r8, r0
	b _020A1794
_020A176C:
	ldr r0, [sp, #0x20]
	ldr ip, [sp, #0x24]
	str r0, [sp]
	mov r0, r7
	str ip, [sp, #4]
	bl SOCLi_ReadBuffer
	movs r8, r0
	bmi _020A1794
	mov r0, r7
	bl SOCLi_ConsumeBuffer
_020A1794:
	cmp r6, #0
	strneb r5, [r4, #0xfe]
	mov r0, r8
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end SOCLi_ReadAndConsumeBuffer

	arm_func_start SOCLi_ReadBuffer
SOCLi_ReadBuffer: ; 0x020A17A8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldrsb ip, [r7, #0x73]
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp ip, #4
	bne _020A17D8
	ldr r4, [sp, #0x18]
	str r4, [sp]
	bl SOCLi_ExecReadCommand
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A17D8:
	ldr ip, [sp, #0x18]
	str ip, [sp]
	bl SOCLi_CopyCPSBuffer
	mvn r1, #5
	cmp r0, r1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [sp, #0x1c]
	tst r1, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr ip, [sp, #0x18]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	str ip, [sp]
	bl SOCLi_ExecReadCommand
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end SOCLi_ReadBuffer

	arm_func_start SOCLi_CopyCPSBuffer
SOCLi_CopyCPSBuffer: ; 0x020A181C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl OS_DisableInterrupts
	add r1, sp, #8
	mov r4, r0
	str r1, [sp]
	add r1, sp, #0xc
	mov r0, sb
	add r2, sp, #6
	add r3, sp, #4
	bl SOCLi_ReadCPSBuffer
	cmp r0, #0
	beq _020A18BC
	ldr r5, [sp, #0xc]
	cmp r5, #0
	mvneq r5, #5
	beq _020A18D8
	ldrsb r1, [sb, #0x73]
	cmp r7, r5
	mov r2, #1
	movgt r7, r5
	cmp r1, #0
	cmpne r1, #4
	movne r2, #0
	cmp r2, #0
	mov r1, r8
	mov r2, r7
	movne r5, r7
	bl MI_CpuCopy8
	ldr r1, [sb, #0x64]
	ldrsb r0, [r1, #0xfe]
	cmp r0, #0
	ldreq r0, [r1, #0xf8]
	addeq r0, r0, r5
	streq r0, [r1, #0xf8]
	b _020A18D8
_020A18BC:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ldrsh r0, [sb, #0x70]
	moveq r5, #0
	mvnne r5, #0x1b
	bic r0, r0, #6
	strh r0, [sb, #0x70]
_020A18D8:
	cmp r5, #0
	blt _020A1910
	cmp r6, #0
	ldrne r1, [sp, #0x30]
	cmpne r1, #0
	beq _020A1900
	ldrh r0, [sp, #4]
	strh r0, [r6]
	ldr r0, [sp, #8]
	str r0, [r1]
_020A1900:
	ldrh r0, [sb, #0x74]
	cmp r0, #0
	ldreqh r0, [sp, #6]
	streqh r0, [sb, #0x74]
_020A1910:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, r5
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end SOCLi_CopyCPSBuffer

	arm_func_start SOCLi_ReadCPSBuffer
SOCLi_ReadCPSBuffer: ; 0x020A1924
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, [r0, #0x64]
	ldr r4, [r0, #0xc4]
	ldr r5, [r0, #0xf8]
	ldr r0, [r4, #0x44]
	subs lr, r0, r5
	bmi _020A197C
	ldrh ip, [r4, #0xa]
	ldr r0, [sp, #0x10]
	cmp lr, #0
	strh ip, [r2]
	ldrh r2, [r4, #0x18]
	strh r2, [r3]
	ldr r2, [r4, #0x1c]
	str r2, [r0]
	str lr, [r1]
	bne _020A198C
	ldrb r0, [r4, #8]
	cmp r0, #4
	beq _020A198C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020A197C:
	mvn r0, #0
	str r0, [r1]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020A198C:
	ldr r0, [r4, #0x40]
	add r0, r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SOCLi_ReadCPSBuffer

	arm_func_start SOCLi_ExecReadCommand
SOCLi_ExecReadCommand: ; 0x020A1998
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	ldr r0, _020A19E0 ; =SOCLi_ReadCallBack
	mov r1, r7
	mov r2, #1
	mov r4, r3
	bl SOCLi_CreateCommandPacket
	mov r1, r0
	str r6, [r1, #0x10]
	str r5, [r1, #0x14]
	ldr r2, [sp, #0x18]
	str r4, [r1, #0x18]
	mov r0, r7
	str r2, [r1, #0x1c]
	bl SOCLi_ExecCommandPacketInRecvPipe
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A19E0: .word SOCLi_ReadCallBack
	arm_func_end SOCLi_ExecReadCommand

	arm_func_start SOCLi_ReadCallBack
SOCLi_ReadCallBack: ; 0x020A19E4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r7, [r0, #4]
	ldr r1, [r0, #0x10]
	ldr r8, [r7, #0x64]
	str r1, [sp, #0xc]
	ldr r1, [r0, #0x18]
	ldr sl, [r0, #0x14]
	ldr r0, [r0, #0x1c]
	ldr sb, [r8, #0xf8]
	str r1, [sp, #8]
	str r0, [sp, #4]
	mov r4, #0
	mov r5, #1
	mov fp, #0xa
	add r6, sp, #0x10
_020A1A24:
	mov r0, r6
	bl CPS_SocRead
	cmp r0, #0
	beq _020A1A78
	ldr r1, [sp, #0x10]
	sub r1, r1, sb
	cmp r1, #0
	bgt _020A1A78
	ldrsb r0, [r7, #0x73]
	mov r1, r5
	cmp r0, #0
	cmpne r0, #4
	movne r1, r4
	cmp r1, #0
	ldrneb r0, [r7, #8]
	cmpne r0, #4
	movne r0, #0
	bne _020A1A78
	mov r0, fp
	bl OS_Sleep
	b _020A1A24
_020A1A78:
	ldrsh r1, [r7, #0x70]
	tst r1, #0x80
	addne sp, sp, #0x14
	mvnne r0, #0xe
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrsb r1, [r7, #0x73]
	cmp r1, #4
	bne _020A1AD4
	cmp r0, #0
	addeq sp, sp, #0x14
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sp, #0x10]
	cmp sl, r1
	movhi sl, r1
	ldr r1, [sp, #0xc]
	mov r2, sl
	bl MI_CpuCopy8
	mov r0, sl
	bl CPS_SocConsume
	add sp, sp, #0x14
	mov r0, sl
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020A1AD4:
	cmp r0, #0
	moveq r4, #0
	beq _020A1B00
	ldr r4, [sp, #4]
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #8]
	mov r0, r7
	mov r2, sl
	str r4, [sp]
	bl SOCLi_CopyCPSBuffer
	mov r4, r0
_020A1B00:
	cmp r4, #0
	addle sp, sp, #0x14
	movle r0, r4
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrh r0, [r8, #0xfc]
	ldr r1, [r8, #0xf8]
	cmp r1, r0
	blt _020A1B28
	mov r0, r7
	bl SOCLi_ConsumeCPSBuffer
_020A1B28:
	mov r0, r4
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end SOCLi_ReadCallBack

	arm_func_start SOCLi_ConsumeBuffer
SOCLi_ConsumeBuffer: ; 0x020A1B34
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x64]
	ldrh r0, [r1, #0xfc]
	ldr r1, [r1, #0xf8]
	cmp r1, r0
	movlt r0, #0
	ldmltia sp!, {r4, pc}
	ldr r0, _020A1B7C ; =SOCLi_ConsumeCallBack
	mov r1, r4
	mov r2, #0
	bl SOCLi_CreateCommandPacket
	movs r1, r0
	mvneq r0, #0x20
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl SOCLi_ExecCommandPacketInRecvPipe
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A1B7C: .word SOCLi_ConsumeCallBack
	arm_func_end SOCLi_ConsumeBuffer

	arm_func_start SOCLi_ConsumeCallBack
SOCLi_ConsumeCallBack: ; 0x020A1B80
	ldr ip, _020A1B8C ; =SOCLi_ConsumeCPSBuffer
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_020A1B8C: .word SOCLi_ConsumeCPSBuffer
	arm_func_end SOCLi_ConsumeCallBack

	arm_func_start SOCLi_ConsumeCPSBuffer
SOCLi_ConsumeCPSBuffer: ; 0x020A1B90
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, [r0, #0x64]
	bl OS_DisableInterrupts
	ldr r6, [r4, #0xf8]
	mov r5, r0
	cmp r6, #0
	beq _020A1BBC
	mov r1, #0
	mov r0, r6
	str r1, [r4, #0xf8]
	bl CPS_SocConsume
_020A1BBC:
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, r6
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end SOCLi_ConsumeCPSBuffer

	arm_func_start SOCLi_ReadUdpBuffer
SOCLi_ReadUdpBuffer: ; 0x020A1BCC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	ldr r6, [sl, #0x64]
	str r1, [sp]
	ldr r0, [r6, #0x104]
	str r2, [sp, #4]
	mov fp, r3
	bl OS_DisableInterrupts
	ldr r7, [r6, #0x104]
	str r0, [sp, #8]
	cmp r7, #0
	bne _020A1C68
	ldr r0, [sp, #0x34]
	mov r4, #1
	and sb, r0, #1
	mov r5, #0
_020A1C10:
	cmp sb, #0
	mvneq r8, #5
	beq _020A1C68
	add r0, r6, #0x10c
	bl OS_SleepThread
	mov r0, sl
	bl SOCL_SocketIsInvalid
	cmp r0, #0
	bne _020A1C54
	mov r1, r5
	cmp sl, #0
	beq _020A1C4C
	ldrsh r0, [sl, #0x70]
	tst r0, #1
	movne r1, r4
_020A1C4C:
	cmp r1, #0
	bne _020A1C5C
_020A1C54:
	mvn r8, #0x37
	b _020A1C68
_020A1C5C:
	ldr r7, [r6, #0x104]
	cmp r7, #0
	beq _020A1C10
_020A1C68:
	cmp r7, #0
	beq _020A1CF8
	ldrh r1, [r7, #4]
	ldr r0, [sp, #4]
	cmp r0, r1
	strgt r1, [sp, #4]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, r7, #0xc
	bl MI_CpuCopy8
	cmp fp, #0
	ldrneh r0, [r7, #6]
	ldr r1, [sp, #0x30]
	strneh r0, [fp]
	cmp r1, #0
	ldrne r0, [r7, #8]
	strne r0, [r1]
	ldrsb r0, [r6, #0xfe]
	ldrh r8, [r7, #4]
	cmp r0, #0
	bne _020A1CF8
	ldr r0, [r7]
	ldr r1, _020A1D0C ; =_02110628
	str r0, [r6, #0x104]
	ldr r0, [r7]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r6, #0x100]
	ldr r1, [r1]
	mov r0, r7
	ldr r1, [r1, #0x1c]
	blx r1
	add r0, r6, #0x100
	ldrh r1, [r0, #8]
	sub r1, r1, r8
	strh r1, [r0, #8]
_020A1CF8:
	ldr r0, [sp, #8]
	bl OS_RestoreInterrupts
	mov r0, r8
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A1D0C: .word _02110628
	arm_func_end SOCLi_ReadUdpBuffer

	arm_func_start SOCLi_UdpRecvCallback
SOCLi_UdpRecvCallback: ; 0x020A1D10
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r2
	ldr r4, [r7, #0x64]
	mov sb, r0
	mov r8, r1
	bl OS_DisableInterrupts
	add r1, r4, #0x100
	ldrh r2, [r1, #8]
	ldrh r1, [r1, #0xa]
	mov r6, r0
	add r0, r2, r8
	cmp r1, r0
	blo _020A1DD4
	ldr r1, _020A1E1C ; =_02110628
	add r0, r8, #0xc
	ldr r1, [r1]
	ldr r1, [r1, #0x18]
	blx r1
	movs r5, r0
	beq _020A1DC0
	add r1, r4, #0x100
	ldrh r3, [r1, #8]
	mov r2, #0
	mov r0, sb
	add r3, r3, r8
	strh r3, [r1, #8]
	str r2, [r5]
	strh r8, [r5, #4]
	ldrh r3, [r7, #0x18]
	mov r2, r8
	add r1, r5, #0xc
	strh r3, [r5, #6]
	ldr r3, [r7, #0x1c]
	str r3, [r5, #8]
	bl MI_CpuCopy8
	ldr r0, [r4, #0x100]
	cmp r0, #0
	ldrne r0, [r4, #0x100]
	strne r5, [r0]
	str r5, [r4, #0x100]
	ldr r0, [r4, #0x104]
	cmp r0, #0
	streq r5, [r4, #0x104]
	b _020A1DE4
_020A1DC0:
	ldr r0, _020A1E20 ; =_021D4484
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	b _020A1DE4
_020A1DD4:
	ldr r0, _020A1E20 ; =_021D4484
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
_020A1DE4:
	ldrh r0, [r7, #0x74]
	cmp r0, #0
	ldreqh r0, [r7, #0xa]
	streqh r0, [r7, #0x74]
	ldrh r1, [r7, #0x1a]
	add r0, r4, #0x10c
	strh r1, [r7, #0x18]
	ldr r1, [r7, #0x20]
	str r1, [r7, #0x1c]
	bl OS_WakeupThread
	mov r0, r6
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020A1E1C: .word _02110628
_020A1E20: .word _021D4484
	arm_func_end SOCLi_UdpRecvCallback

	arm_func_start SOCL_WriteTo
SOCL_WriteTo: ; 0x020A1E24
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl SOCL_SocketIsInvalid
	cmp r0, #0
	addne sp, sp, #8
	mvnne r0, #0x1b
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	cmp r8, #0
	mov r1, #0
	beq _020A1E68
	ldrsh r0, [r8, #0x70]
	tst r0, #1
	movne r1, #1
_020A1E68:
	cmp r1, #0
	addeq sp, sp, #8
	mvneq r0, #0x26
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrsb r0, [r8, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A1EB8
	ldrsh r0, [r8, #0x70]
	tst r0, #4
	beq _020A1EAC
	ldrsh r0, [r8, #0x70]
	tst r0, #8
	beq _020A1EB8
_020A1EAC:
	add sp, sp, #8
	mvn r0, #0x37
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020A1EB8:
	ldr r0, [sp, #0x24]
	ldr r4, [r8, #0x68]
	tst r0, #4
	bne _020A1ED4
	ldrsb r0, [r8, #0x72]
	cmp r0, #0
	bne _020A1EF4
_020A1ED4:
	add r0, r4, #0xe0
	bl OS_TryLockMutex
	cmp r0, #0
	addeq sp, sp, #8
	mvneq r0, #5
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov ip, #0
	b _020A1F00
_020A1EF4:
	add r0, r4, #0xe0
	bl OS_LockMutex
	mov ip, #1
_020A1F00:
	ldr r1, [sp, #0x20]
	mov r0, r8
	str r1, [sp]
	mov r1, r7
	mov r2, r6
	mov r3, r5
	str ip, [sp, #4]
	bl SOCLi_WriteBuffer
	mov r5, r0
	add r0, r4, #0xe0
	bl OS_UnlockMutex
	mov r0, r5
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end SOCL_WriteTo

	arm_func_start SOCLi_WriteBuffer
SOCLi_WriteBuffer: ; 0x020A1F38
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	mov sl, r0
	ldr r4, [sl, #0x68]
	ldrsb r0, [sl, #0x73]
	ldr r4, [r4, #0x10c]
	mov sb, r1
	str r3, [sp, #0xc]
	cmp r0, #1
	mov r8, r2
	ldr r7, [sp, #0x40]
	ldr r6, [sp, #0x44]
	ldr r0, [r4, #0x48]
	mov r5, #0
	bne _020A1F90
	sub r0, r0, #0x2a
	cmp r8, r0
	addgt sp, sp, #0x18
	subgt r0, r5, #0x23
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	str r8, [sp, #0x10]
	b _020A1FA0
_020A1F90:
	sub r0, r0, #0x36
	str r0, [sp, #0x10]
	cmp r8, r0
	strle r8, [sp, #0x10]
_020A1FA0:
	cmp r8, #0
	ble _020A2030
	and fp, r6, #1
_020A1FAC:
	ldr r2, [sp, #0x10]
	mov r0, sl
	mov r1, r8
	add r3, sp, #0x14
	str r6, [sp]
	bl SOCLi_AllocWriteBuffer
	mov r4, r0
	cmp r4, #0
	ble _020A200C
	ldr r0, [sp, #0xc]
	mov r1, sb
	stmia sp, {r0, r7}
	str r6, [sp, #8]
	ldr r3, [sp, #0x14]
	mov r0, sl
	mov r2, r4
	bl SOCLi_ExecWriteCommand
	cmp r0, #0
	addle sp, sp, #0x18
	mvnle r0, #5
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add sb, sb, r4
	sub r8, r8, r4
	add r5, r5, r4
_020A200C:
	cmp fp, #0
	bne _020A2028
	cmp r4, #0
	bgt _020A2030
	add sp, sp, #0x18
	mvn r0, #5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020A2028:
	cmp r8, #0
	bgt _020A1FAC
_020A2030:
	mov r0, r5
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end SOCLi_WriteBuffer

	arm_func_start SOCLi_AllocWriteBuffer
SOCLi_AllocWriteBuffer: ; 0x020A203C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	cmp r8, sb
	mov r7, r3
	ldr r4, [sl, #0x68]
	movgt r8, sb
	bl OS_DisableInterrupts
	ldr r1, [sp, #0x28]
	mov fp, r0
	and r6, r1, #1
_020A206C:
	mov r0, sl
	bl SOCLi_GetWriteBufferFreeSize
	mov r5, r0
	cmp r5, r8
	blt _020A2098
	add r0, r4, #0x100
	ldrh r0, [r0]
	cmp r5, sb
	movge r5, sb
	str r0, [r7]
	b _020A20B0
_020A2098:
	cmp r6, #0
	moveq r5, #0
	beq _020A20B0
	add r0, r4, #0x104
	bl OS_SleepThread
	b _020A206C
_020A20B0:
	mov r0, fp
	bl OS_RestoreInterrupts
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end SOCLi_AllocWriteBuffer

	arm_func_start SOCLi_GetWriteBufferFreeSize
SOCLi_GetWriteBufferFreeSize: ; 0x020A20C0
	ldr r2, [r0, #0x68]
	add r0, r2, #0x100
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	ldr r2, [r2, #0xf8]
	sub r0, r0, r1
	subs r0, r0, #1
	addmi r0, r0, r2
	bx lr
	arm_func_end SOCLi_GetWriteBufferFreeSize

	arm_func_start SOCLi_ExecWriteCommand
SOCLi_ExecWriteCommand: ; 0x020A20E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r4, [sb, #0x68]
	mov r6, r1
	mov r8, r2
	ldr r1, [r4, #0x10c]
	ldr r2, [sp, #0x28]
	ldr r0, _020A2254 ; =SOCLi_WriteCallBack
	mov r7, r3
	bl SOCLi_CreateCommandPacket
	movs r5, r0
	mvneq r0, #0x20
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [sp, #0x28]
	add r1, r7, r8
	tst r0, #1
	ldrnesb r0, [sb, #0x73]
	cmpne r0, #1
	movne r0, #3
	strneb r0, [r5, #0xd]
	moveq r0, #0
	streqb r0, [r5, #0xd]
	ldr r3, [r4, #0xfc]
	ldr r2, [r4, #0xf8]
	add r0, r3, r7
	cmp r1, r2
	str r0, [r5, #0x10]
	bge _020A216C
	str r8, [r5, #0x14]
	mov r0, #0
	str r0, [r5, #0x18]
	mov r7, r1
	str r0, [r5, #0x1c]
	b _020A2198
_020A216C:
	sub r0, r2, r7
	str r0, [r5, #0x14]
	str r3, [r5, #0x18]
	ldr r0, [r5, #0x14]
	sub r7, r8, r0
	str r7, [r5, #0x1c]
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	mov r2, r7
	add r0, r6, r0
	bl MI_CpuCopy8
_020A2198:
	ldr r1, [r5, #0x10]
	ldr r2, [r5, #0x14]
	mov r0, r6
	bl MI_CpuCopy8
	add r0, r4, #0x100
	ldrh r6, [r0]
	strh r7, [r5, #0x20]
	ldrh r1, [r5, #0x20]
	strh r1, [r0]
	ldrsb r0, [sb, #0x73]
	cmp r0, #1
	bne _020A2228
	ldrh r0, [sb, #0x74]
	cmp r0, #0
	bne _020A21E4
	bl CPS_SocGetEport
	strh r0, [sb, #0x74]
	ldrh r0, [sb, #0x74]
	strh r0, [sb, #0xa]
_020A21E4:
	ldrh r0, [sb, #0x74]
	strh r0, [r5, #0x24]
	ldr r1, [sb, #0x78]
	cmp r1, #0
	beq _020A2204
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _020A2218
_020A2204:
	ldr r1, [sp, #0x24]
	ldrh r0, [sp, #0x20]
	str r1, [r5, #0x28]
	strh r0, [r5, #0x26]
	b _020A2230
_020A2218:
	str r1, [r5, #0x28]
	ldrh r0, [sb, #0x76]
	strh r0, [r5, #0x26]
	b _020A2230
_020A2228:
	mov r0, #0
	str r0, [r5, #0x28]
_020A2230:
	ldr r0, [r4, #0x10c]
	mov r1, r5
	bl SOCLi_ExecCommandPacketInSendPipe
	cmp r0, #0
	addne r0, r4, #0x100
	movne r8, #0
	strneh r6, [r0]
	mov r0, r8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020A2254: .word SOCLi_WriteCallBack
	arm_func_end SOCLi_ExecWriteCommand

	arm_func_start SOCLi_WriteCallBack
SOCLi_WriteCallBack: ; 0x020A2258
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sb, r0
	ldr r5, [sb, #4]
	mov r7, #0
	ldrsb r0, [r5, #0x73]
	mov r1, #1
	ldr r6, [r5, #0x68]
	cmp r0, #0
	cmpne r0, #4
	movne r1, r7
	cmp r1, #0
	beq _020A2294
	ldrsh r0, [r5, #0x70]
	tst r0, #4
	beq _020A2368
_020A2294:
	ldr r2, [sb, #0x28]
	cmp r2, #0
	beq _020A22AC
	ldrh r0, [sb, #0x24]
	ldrh r1, [sb, #0x26]
	bl CPS_SocBind
_020A22AC:
	ldrsb r1, [r5, #0x73]
	mov r0, #1
	ldr r4, [r5, #0x4c]
	cmp r1, #0
	cmpne r1, #4
	movne r0, #0
	cmp r0, #0
	movne r8, #0x36
	moveq r8, #0x2a
	cmp r1, #0
	cmpne r1, #4
	ldrne r0, [r5, #0x48]
	subne sl, r0, r8
	bne _020A22F4
	ldr r0, [r5, #0x48]
	sub r0, r0, r8
	bl SOCLi_GetOptimumSendBufLen
	mov sl, r0
_020A22F4:
	mov r1, sl
	mov r2, sb
	add r0, r4, r8
	bl SOCLi_MemCpy
	mov r1, r0
	cmp r1, #0
	ble _020A236C
	add r0, r4, r8
	bl CPS_SocWrite
	cmp r0, #0
	bgt _020A2360
	ldrsb r0, [r5, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A2358
	ldrsh r0, [r5, #0x70]
	bic r0, r0, #0xe
	strh r0, [r5, #0x70]
	ldrsh r0, [r5, #0x70]
	orr r0, r0, #0x80
	strh r0, [r5, #0x70]
	bl CPS_TcpClose
_020A2358:
	mvn r7, #0x4b
	b _020A236C
_020A2360:
	add r7, r7, r0
	b _020A22F4
_020A2368:
	mvn r7, #0x4b
_020A236C:
	ldrh r2, [sb, #0x20]
	add r1, r6, #0x100
	add r0, r6, #0x104
	strh r2, [r1, #2]
	bl OS_WakeupThread
	mov r0, r7
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end SOCLi_WriteCallBack

	arm_func_start SOCLi_GetOptimumSendBufLen
SOCLi_GetOptimumSendBufLen: ; 0x020A2388
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020A2424 ; =OSi_ThreadInfo
	mov r4, r0
	ldr r0, [r1, #4]
	ldr r5, [r0, #0xa4]
	bl OS_DisableInterrupts
	cmp r5, #0
	beq _020A23EC
	ldrh r3, [r5, #0x2e]
	cmp r3, #0
	ldrneh r2, [r5, #0x2c]
	cmpne r2, #0
	beq _020A23DC
	ldr r1, _020A2428 ; =_021D4430
	cmp r3, r2
	ldr r1, [r1, #0x24]
	movgt r3, r2
	cmp r3, r1
	movgt r3, r1
	mov r5, r3, lsl #1
	b _020A23F8
_020A23DC:
	ldr r1, _020A2428 ; =_021D4430
	ldr r1, [r1, #0x24]
	mov r5, r1, lsl #1
	b _020A23F8
_020A23EC:
	ldr r1, _020A2428 ; =_021D4430
	ldr r1, [r1, #0x24]
	mov r5, r1, lsl #1
_020A23F8:
	bl OS_RestoreInterrupts
	cmp r5, #0
	ble _020A241C
	mov r0, r4
	mov r1, r5
	bl _s32_div_f
	cmp r0, #0
	mulgt r0, r5, r0
	ldmgtia sp!, {r3, r4, r5, pc}
_020A241C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A2424: .word OSi_ThreadInfo
_020A2428: .word _021D4430
	arm_func_end SOCLi_GetOptimumSendBufLen

	arm_func_start SOCLi_MemCpy
SOCLi_MemCpy: ; 0x020A242C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r2
	ldr r4, [r6, #0x14]
	ldr r5, [r6, #0x1c]
	cmp r4, r1
	mov r7, r0
	movgt r4, r1
	movgt r5, #0
	bgt _020A245C
	sub r0, r1, r4
	cmp r5, r0
	movgt r5, r0
_020A245C:
	cmp r4, #0
	ble _020A248C
	ldr r0, [r6, #0x10]
	mov r1, r7
	mov r2, r4
	bl MI_CpuCopy8
	ldr r0, [r6, #0x10]
	add r0, r0, r4
	str r0, [r6, #0x10]
	ldr r0, [r6, #0x14]
	sub r0, r0, r4
	str r0, [r6, #0x14]
_020A248C:
	cmp r5, #0
	ble _020A24BC
	ldr r0, [r6, #0x18]
	mov r2, r5
	add r1, r7, r4
	bl MI_CpuCopy8
	ldr r0, [r6, #0x18]
	add r0, r0, r5
	str r0, [r6, #0x18]
	ldr r0, [r6, #0x1c]
	sub r0, r0, r5
	str r0, [r6, #0x1c]
_020A24BC:
	add r0, r4, r5
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end SOCLi_MemCpy

	arm_func_start SOCL_Shutdown
SOCL_Shutdown: ; 0x020A24C4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl SOCL_SocketIsInvalid
	cmp r0, #0
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	mov r1, #0
	beq _020A24F4
	ldrsh r0, [r4, #0x70]
	tst r0, #1
	movne r1, #1
_020A24F4:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r0, [r4, #0x70]
	tst r0, #4
	beq _020A2518
	ldrsh r0, [r4, #0x70]
	tst r0, #8
	beq _020A2520
_020A2518:
	mvn r0, #0x37
	ldmia sp!, {r3, r4, r5, pc}
_020A2520:
	ldrsh r0, [r4, #0x70]
	orr r0, r0, #8
	strh r0, [r4, #0x70]
	ldr r5, [r4, #0x68]
	cmp r5, #0
	ldrne r1, [r5, #0x10c]
	cmpne r1, #0
	beq _020A2564
	ldrsb r2, [r4, #0x72]
	ldr r0, _020A256C ; =SOCLi_ShutdownCallBack
	bl SOCLi_CreateCommandPacket
	movs r1, r0
	mvneq r0, #0x20
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x10c]
	bl SOCLi_ExecCommandPacketInSendPipe
	ldmia sp!, {r3, r4, r5, pc}
_020A2564:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A256C: .word SOCLi_ShutdownCallBack
	arm_func_end SOCL_Shutdown

	arm_func_start SOCLi_ShutdownCallBack
SOCLi_ShutdownCallBack: ; 0x020A2570
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #4]
	mov r1, #1
	ldrsb r0, [r0, #0x73]
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A2598
	bl CPS_TcpShutdown
_020A2598:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end SOCLi_ShutdownCallBack

	arm_func_start SOCL_IsClosed
SOCL_IsClosed: ; 0x020A25A0
	stmdb sp!, {r4, lr}
	movs r4, r0
	bmi _020A25CC
	bl SOCL_SocketIsInvalid
	cmp r0, #0
	beq _020A25CC
	mov r0, r4
	bl SOCL_SocketIsInTrash
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_020A25CC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end SOCL_IsClosed

	arm_func_start SOCL_Close
SOCL_Close: ; 0x020A25D4
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #0
	mvnle r0, #0x1b
	ldmleia sp!, {r4, pc}
	bl SOCL_SocketIsInTrash
	cmp r0, #0
	mvnne r0, #0x19
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl SOCL_SocketIsInvalid
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	cmp r4, #0
	mov r1, #0
	beq _020A2624
	ldrsh r0, [r4, #0x70]
	tst r0, #1
	movne r1, #1
_020A2624:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r4, pc}
	ldrsh r0, [r4, #0x70]
	tst r0, #0x10
	mvnne r0, #0x19
	ldmneia sp!, {r4, pc}
	ldrsh r0, [r4, #0x70]
	mov r1, #1
	orr r0, r0, #0x18
	strh r0, [r4, #0x70]
	ldrsb r0, [r4, #0x73]
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A2674
	ldr r0, [r4, #0x68]
	mov r1, #0
	bl SOCLi_SendCommandPacket
_020A2674:
	ldr r0, _020A26A0 ; =SOCLi_CloseCallBack
	mov r1, r4
	mov r2, #1
	bl SOCLi_CreateCommandPacket
	mov r1, r0
	mov r2, #0
	mov r0, r4
	str r2, [r1, #8]
	bl SOCLi_SendCommandPacketToCtrlPipe
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A26A0: .word SOCLi_CloseCallBack
	arm_func_end SOCL_Close

	arm_func_start SOCLi_CloseCallBack
SOCLi_CloseCallBack: ; 0x020A26A4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [r0, #4]
	mov r1, #1
	ldrsb r0, [r4, #0x73]
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A26E0
	ldr r0, [r4, #0x68]
	add r0, r0, #0x20
	bl OS_JoinThread
	bl CPS_TcpShutdown
	bl CPS_TcpClose
	bl CPS_SocRelease
_020A26E0:
	bl CPS_SocUnRegister
	ldrsh r0, [r4, #0x70]
	mov r1, #0
	bic r0, r0, #6
	strh r0, [r4, #0x70]
	ldrsb r0, [r4, #0x73]
	cmp r0, #2
	ldreq r0, [r4, #0x68]
	ldrne r0, [r4, #0x64]
	bl SOCLi_SendCommandPacket
	bl OS_DisableInterrupts
	mov r5, r0
	mov r0, r4
	bl SOCLi_SocketUnregister
	mov r0, r4
	bl SOCLi_SocketRegisterTrash
	mov r0, r5
	bl OS_RestoreInterrupts
	ldrsh r1, [r4, #0x70]
	mov r0, #0
	orr r1, r1, #0x20
	strh r1, [r4, #0x70]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SOCLi_CloseCallBack

	arm_func_start SOCLi_CleanupSocket
SOCLi_CleanupSocket: ; 0x020A273C
	stmdb sp!, {r4, r5, r6, lr}
	movs r4, r0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #0
	strh r0, [r4, #0x70]
	ldrsb r2, [r4, #0x73]
	mov r1, #1
	cmp r2, #0
	cmpne r2, #4
	movne r1, r0
	cmp r1, #0
	beq _020A2780
	ldr r0, [r4, #0x68]
	bl SOCLi_FreeCommandPipe
	ldr r0, [r4, #0x64]
	bl SOCLi_FreeCommandPipe
	b _020A2800
_020A2780:
	cmp r2, #1
	bne _020A27F0
	ldr r0, [r4, #0x64]
	ldr r0, [r0, #0x104]
	cmp r0, #0
	beq _020A27B8
	ldr r5, _020A2838 ; =_02110628
_020A279C:
	ldr r1, [r5]
	ldr r6, [r0]
	ldr r1, [r1, #0x1c]
	blx r1
	mov r0, r6
	cmp r6, #0
	bne _020A279C
_020A27B8:
	ldr r0, [r4, #0x64]
	mov r1, #0
	add r0, r0, #0x100
	strh r1, [r0, #8]
	ldr r0, [r4, #0x64]
	str r1, [r0, #0x100]
	ldr r0, [r4, #0x64]
	str r1, [r0, #0x104]
	ldr r0, [r4, #0x64]
	add r0, r0, #0x10c
	bl OS_WakeupThread
	ldr r0, [r4, #0x64]
	bl SOCLi_FreeCommandPipe
	b _020A2800
_020A27F0:
	cmp r2, #2
	bne _020A2800
	ldr r0, [r4, #0x68]
	bl SOCLi_FreeCommandPipe
_020A2800:
	bl OS_DisableInterrupts
	mov r5, r0
	mov r0, r4
	bl SOCLi_SocketUnregister
	mov r0, r4
	bl SOCLi_SocketUnregisterTrash
	ldr r1, _020A2838 ; =_02110628
	mov r0, r4
	ldr r1, [r1]
	ldr r1, [r1, #0x1c]
	blx r1
	mov r0, r5
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A2838: .word _02110628
	arm_func_end SOCLi_CleanupSocket

	arm_func_start SOCLi_FreeCommandPipe
SOCLi_FreeCommandPipe: ; 0x020A283C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs sb, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, sb, #0x20
	bl OS_JoinThread
	bl OS_DisableInterrupts
	mov r8, r0
	bl OS_DisableScheduler
	add r1, sp, #0
	mov r0, sb
	mov r2, #0
	bl OS_ReceiveMessage
	cmp r0, #0
	beq _020A28C8
	mov r6, #0
	mvn r7, #0xa
	add r5, sp, #0
	mov r4, r6
_020A2884:
	ldr r0, [sp]
	cmp r0, #0
	beq _020A28B0
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _020A28A8
	mov r1, r7
	mov r2, r6
	bl OS_SendMessage
_020A28A8:
	ldr r0, [sp]
	bl SOCLi_FreeCommandPacket
_020A28B0:
	mov r0, sb
	mov r1, r5
	mov r2, r4
	bl OS_ReceiveMessage
	cmp r0, #0
	bne _020A2884
_020A28C8:
	bl OS_EnableScheduler
	bl OS_RescheduleThread
	mov r0, r8
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end SOCLi_FreeCommandPipe

	arm_func_start SOCLi_TrashSocket
SOCLi_TrashSocket: ; 0x020A28DC
	stmdb sp!, {r3, r4, r5, lr}
	bl OS_DisableInterrupts
	ldr r4, _020A2914 ; =_021D4490
	mov r5, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _020A2908
_020A28F8:
	bl SOCLi_CleanupSocket
	ldr r0, [r4]
	cmp r0, #0
	bne _020A28F8
_020A2908:
	mov r0, r5
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A2914: .word _021D4490
	arm_func_end SOCLi_TrashSocket

	arm_func_start SOCL_Cleanup
SOCL_Cleanup: ; 0x020A2918
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020A29AC ; =_021D4424
	ldr r0, [r1]
	cmp r0, #0
	ldreq r0, _020A29B0 ; =_021D4670
	ldreq r0, [r0]
	streq r0, [r1]
	bl SOCL_CalmDown
	mvn r4, #0x19
	cmp r0, r4
	bne _020A295C
	mov r5, #0x64
_020A2948:
	mov r0, r5
	bl OS_Sleep
	bl SOCL_CalmDown
	cmp r0, r4
	beq _020A2948
_020A295C:
	bl SOCLi_CleanupCommandPacketQueue
	movs r4, r0
	bmi _020A29A4
	bl CPS_Cleanup
	mov r0, #0
	bl CPS_SetScavengerCallback
	ldr r0, _020A29B4 ; =_02110628
	ldr r1, [r0]
	ldr r0, [r1, #0x28]
	cmp r0, #0
	bne _020A2998
	ldr r0, _020A29B8 ; =_021D4430
	ldr r1, [r1, #0x1c]
	ldr r0, [r0, #0x1c]
	blx r1
_020A2998:
	ldr r0, _020A29B4 ; =_02110628
	mov r1, #0
	str r1, [r0]
_020A29A4:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A29AC: .word _021D4424
_020A29B0: .word _021D4670
_020A29B4: .word _02110628
_020A29B8: .word _021D4430
	arm_func_end SOCL_Cleanup

	arm_func_start SOCL_CloseAll
SOCL_CloseAll: ; 0x020A29BC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r4, _020A2A58 ; =_021D442C
	ldr r5, _020A2A5C ; =_021D448C
_020A29C8:
	bl OS_DisableInterrupts
	ldr r6, [r5]
	cmp r6, #0
	beq _020A29FC
	ldr r2, [r4]
_020A29DC:
	cmp r6, r2
	beq _020A29F0
	ldrsh r1, [r6, #0x70]
	tst r1, #0x10
	beq _020A29FC
_020A29F0:
	ldr r6, [r6, #0x7c]
	cmp r6, #0
	bne _020A29DC
_020A29FC:
	bl OS_RestoreInterrupts
	cmp r6, #0
	beq _020A2A14
	mov r0, r6
	bl SOCL_Close
	b _020A29C8
_020A2A14:
	ldr r0, _020A2A5C ; =_021D448C
	ldr r1, [r0]
	cmp r1, #0
	beq _020A2A3C
	ldr r0, _020A2A58 ; =_021D442C
	ldr r0, [r0]
	cmp r1, r0
	ldreq r0, [r1, #0x7c]
	cmpeq r0, #0
	bne _020A2A50
_020A2A3C:
	ldr r0, _020A2A60 ; =_021D4490
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
_020A2A50:
	mvn r0, #0x19
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A2A58: .word _021D442C
_020A2A5C: .word _021D448C
_020A2A60: .word _021D4490
	arm_func_end SOCL_CloseAll

	arm_func_start SOCL_CalmDown
SOCL_CalmDown: ; 0x020A2A64
	stmdb sp!, {r4, lr}
	ldr r0, _020A2ADC ; =_021D442C
	ldr r0, [r0]
	cmp r0, #0
	beq _020A2AB8
	bl SOCL_CloseAll
	movs r4, r0
	bne _020A2AB0
	ldr r0, _020A2ADC ; =_021D442C
	ldr r0, [r0]
	bl SOCL_Close
	ldr r0, _020A2ADC ; =_021D442C
	ldr r0, [r0]
	bl SOCL_IsClosed
	cmp r0, #0
	ldrne r0, _020A2ADC ; =_021D442C
	movne r1, #0
	strne r1, [r0]
	mvn r4, #0x19
_020A2AB0:
	bl SOCLi_TrashSocket
	b _020A2AD4
_020A2AB8:
	bl CPS_CalmDown
	cmp r0, #0
	mvneq r4, #0x19
	beq _020A2AD4
	mov r0, #0
	bl WCM_SetRecvDCFCallback
	mov r4, #0
_020A2AD4:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A2ADC: .word _021D442C
	arm_func_end SOCL_CalmDown

	arm_func_start SOCL_Resolve
SOCL_Resolve: ; 0x020A2AE0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x64
	movs r5, r0
	addeq sp, sp, #0x64
	moveq r0, #0
	ldmeqia sp!, {r4, r5, pc}
	ldr r1, _020A2B84 ; =_02110628
	mov r0, #0xfd0
	ldr r1, [r1]
	ldr r1, [r1, #0x18]
	blx r1
	movs r4, r0
	addeq sp, sp, #0x64
	moveq r0, #0
	ldmeqia sp!, {r4, r5, pc}
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x64
	bl MI_CpuFill8
	add r0, r4, #0x368
	add r2, r0, #0x800
	ldr r3, _020A2B88 ; =0x00000B68
	ldr r1, _020A2B8C ; =0x00000466
	add r0, sp, #0
	str r4, [sp, #0x40]
	str r3, [sp, #0x3c]
	str r2, [sp, #0x4c]
	str r1, [sp, #0x48]
	bl CPS_SocRegister
	mov r0, r5
	bl CPS_Resolve
	mov r5, r0
	bl CPS_SocUnRegister
	ldr r1, _020A2B84 ; =_02110628
	mov r0, r4
	ldr r1, [r1]
	ldr r1, [r1, #0x1c]
	blx r1
	mov r0, r5
	add sp, sp, #0x64
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020A2B84: .word _02110628
_020A2B88: .word 0x00000B68
_020A2B8C: .word 0x00000466
	arm_func_end SOCL_Resolve

	arm_func_start SOCL_InetAtoH
SOCL_InetAtoH: ; 0x020A2B90
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	ldr r1, _020A2BD8 ; =_021D4680
	mov r5, r0
	ldmia r1, {r6, r7}
	mov r2, #0
	str r2, [r1]
	mov r0, r4
	str r2, [r1, #4]
	bl CPS_Resolve
	ldr r1, _020A2BD8 ; =_021D4680
	mov r4, r0
	mov r0, r5
	stmia r1, {r6, r7}
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A2BD8: .word _021D4680
	arm_func_end SOCL_InetAtoH

	arm_func_start SOCL_SetResolver
SOCL_SetResolver: ; 0x020A2BDC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl SOCL_GetHostID
	cmp r0, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _020A2C0C ; =_021D4680
	mov r0, #0
	str r5, [r1]
	str r4, [r1, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A2C0C: .word _021D4680
	arm_func_end SOCL_SetResolver

	arm_func_start SOCL_GetHostID
SOCL_GetHostID: ; 0x020A2C10
	stmdb sp!, {r3, lr}
	ldr r0, _020A2C6C ; =_021D4670
	ldr r2, [r0]
	cmp r2, #0
	bne _020A2C50
	ldr r0, _020A2C70 ; =_021D4428
	ldr r0, [r0]
	and r0, r0, #3
	cmp r0, #1
	bne _020A2C60
	bl OS_GetProcMode
	cmp r0, #0x12
	beq _020A2C60
	mov r0, #0xa
	bl OS_Sleep
	b _020A2C60
_020A2C50:
	ldr r0, _020A2C74 ; =_021D4424
	ldr r1, [r0]
	cmp r1, #0
	streq r2, [r0]
_020A2C60:
	ldr r0, _020A2C6C ; =_021D4670
	ldr r0, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A2C6C: .word _021D4670
_020A2C70: .word _021D4428
_020A2C74: .word _021D4424
	arm_func_end SOCL_GetHostID

	arm_func_start SOCL_GetStatus
SOCL_GetStatus: ; 0x020A2C78
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	mov r5, r0
	bl SOCL_SocketIsInvalid
	cmp r0, #0
	orrne r4, r4, #0x80
	bne _020A2D40
	ldrsh r0, [r5, #0x70]
	tst r0, #0x40
	ldrsb r0, [r5, #0x73]
	orrne r4, r4, #0x20
	cmp r0, #1
	beq _020A2CB8
	ldrsh r0, [r5, #0x70]
	tst r0, #4
	beq _020A2CE8
_020A2CB8:
	bl OS_DisableInterrupts
	mov r6, r0
	mov r0, r5
	bl SOCLi_GetReadBufferOccpiedSize
	cmp r0, #0
	mov r0, r5
	orrgt r4, r4, #1
	bl SOCLi_GetWriteBufferFreeSize
	cmp r0, #0
	mov r0, r6
	orrgt r4, r4, #8
	bl OS_RestoreInterrupts
_020A2CE8:
	ldrsb r0, [r5, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	beq _020A2D40
	ldrsh r0, [r5, #0x70]
	tst r0, #4
	ldrneb r0, [r5, #8]
	cmpne r0, #4
	beq _020A2D28
	tst r4, #1
	ldreqsh r0, [r5, #0x70]
	biceq r0, r0, #6
	streqh r0, [r5, #0x70]
_020A2D28:
	ldrsh r0, [r5, #0x70]
	tst r0, #2
	bne _020A2D40
	ldrsh r0, [r5, #0x70]
	tst r0, #4
	orreq r4, r4, #0x40
_020A2D40:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end SOCL_GetStatus

	arm_func_start SOCLi_GetReadBufferOccpiedSize
SOCLi_GetReadBufferOccpiedSize: ; 0x020A2D48
	ldr r2, [r0, #0x64]
	mov r3, #0
	cmp r2, #0
	beq _020A2D88
	ldrsb r1, [r0, #0x73]
	cmp r1, #1
	bne _020A2D74
	ldr r0, [r2, #0x104]
	cmp r0, #0
	ldrneh r3, [r0, #4]
	b _020A2D88
_020A2D74:
	cmp r1, #0
	cmpne r1, #4
	ldreq r1, [r0, #0x44]
	ldreq r0, [r2, #0xf8]
	subeq r3, r1, r0
_020A2D88:
	mov r0, r3
	bx lr
	arm_func_end SOCLi_GetReadBufferOccpiedSize

	arm_func_start SOCLi_RoundUp4
SOCLi_RoundUp4: ; 0x020A2D90
	add r0, r0, #3
	bic r0, r0, #3
	bx lr
	arm_func_end SOCLi_RoundUp4

	arm_func_start SOCLi_SocketRegister
SOCLi_SocketRegister: ; 0x020A2D9C
	ldr ip, _020A2DAC ; =SOCLi_SocketRegisterList
	mov r1, r0
	ldr r0, _020A2DB0 ; =_021D448C
	bx ip
	.align 2, 0
_020A2DAC: .word SOCLi_SocketRegisterList
_020A2DB0: .word _021D448C
	arm_func_end SOCLi_SocketRegister

	arm_func_start SOCLi_SocketRegisterList
SOCLi_SocketRegisterList: ; 0x020A2DB4
	ldr r2, [r0]
	str r2, [r1, #0x7c]
	str r1, [r0]
	bx lr
	arm_func_end SOCLi_SocketRegisterList

	arm_func_start SOCLi_SocketRegisterTrash
SOCLi_SocketRegisterTrash: ; 0x020A2DC4
	ldr ip, _020A2DD4 ; =SOCLi_SocketRegisterList
	mov r1, r0
	ldr r0, _020A2DD8 ; =_021D4490
	bx ip
	.align 2, 0
_020A2DD4: .word SOCLi_SocketRegisterList
_020A2DD8: .word _021D4490
	arm_func_end SOCLi_SocketRegisterTrash

	arm_func_start SOCLi_SocketUnregister
SOCLi_SocketUnregister: ; 0x020A2DDC
	ldr ip, _020A2DEC ; =SOCLi_SocketUnregisterList
	mov r1, r0
	ldr r0, _020A2DF0 ; =_021D448C
	bx ip
	.align 2, 0
_020A2DEC: .word SOCLi_SocketUnregisterList
_020A2DF0: .word _021D448C
	arm_func_end SOCLi_SocketUnregister

	arm_func_start SOCLi_SocketUnregisterList
SOCLi_SocketUnregisterList: ; 0x020A2DF4
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl SOCLi_SocketGetNextPtr
	cmp r0, #0
	ldrne r1, [r4, #0x7c]
	strne r1, [r0]
	ldmia sp!, {r4, pc}
	arm_func_end SOCLi_SocketUnregisterList

	arm_func_start SOCLi_SocketGetNextPtr
SOCLi_SocketGetNextPtr: ; 0x020A2E10
	ldr r2, [r0]
	cmp r2, #0
	beq _020A2E34
_020A2E1C:
	cmp r2, r1
	bxeq lr
	add r0, r2, #0x7c
	ldr r2, [r2, #0x7c]
	cmp r2, #0
	bne _020A2E1C
_020A2E34:
	mov r0, #0
	bx lr
	arm_func_end SOCLi_SocketGetNextPtr

	arm_func_start SOCLi_SocketUnregisterTrash
SOCLi_SocketUnregisterTrash: ; 0x020A2E3C
	ldr ip, _020A2E4C ; =SOCLi_SocketUnregisterList
	mov r1, r0
	ldr r0, _020A2E50 ; =_021D4490
	bx ip
	.align 2, 0
_020A2E4C: .word SOCLi_SocketUnregisterList
_020A2E50: .word _021D4490
	arm_func_end SOCLi_SocketUnregisterTrash

	arm_func_start SOCL_SocketIsInvalid
SOCL_SocketIsInvalid: ; 0x020A2E54
	stmdb sp!, {r3, lr}
	mov r1, r0
	cmp r1, #0
	ble _020A2E74
	ldr r0, _020A2E84 ; =_021D448C
	bl SOCLi_SocketGetNextPtr
	cmp r0, #0
	bne _020A2E7C
_020A2E74:
	mov r0, #1
	ldmia sp!, {r3, pc}
_020A2E7C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A2E84: .word _021D448C
	arm_func_end SOCL_SocketIsInvalid

	arm_func_start SOCL_SocketIsInTrash
SOCL_SocketIsInTrash: ; 0x020A2E88
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldr r0, _020A2EA8 ; =_021D4490
	bl SOCLi_SocketGetNextPtr
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A2EA8: .word _021D4490
	arm_func_end SOCL_SocketIsInTrash

	arm_func_start SOC_Socket
SOC_Socket: ; 0x020A2EAC
	stmdb sp!, {r3, lr}
	cmp r1, #1
	bne _020A2EC4
	ldr r0, _020A2ED0 ; =_02110648
	bl SOCL_CreateSocket
	ldmia sp!, {r3, pc}
_020A2EC4:
	ldr r0, _020A2ED4 ; =_02110630
	bl SOCL_CreateSocket
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A2ED0: .word _02110648
_020A2ED4: .word _02110630
	arm_func_end SOC_Socket

	arm_func_start SOC_Bind
SOC_Bind: ; 0x020A2ED8
	ldrh r1, [r1, #2]
	ldr ip, _020A2F00 ; =SOCL_Bind
	mov r2, r1, asr #8
	mov r1, r1, lsl #8
	and r2, r2, #0xff
	and r1, r1, #0xff00
	orr r1, r2, r1
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bx ip
	.align 2, 0
_020A2F00: .word SOCL_Bind
	arm_func_end SOC_Bind

	arm_func_start SOC_Connect
SOC_Connect: ; 0x020A2F04
	stmdb sp!, {r4, lr}
	ldrh r2, [r1, #2]
	ldr lr, [r1, #4]
	mov r4, r2, asr #8
	mov r1, r2, lsl #8
	mov r3, lr, lsr #0x18
	mov r2, lr, lsr #8
	mov ip, lr, lsl #8
	mov lr, lr, lsl #0x18
	and r4, r4, #0xff
	and r1, r1, #0xff00
	orr r1, r4, r1
	mov r1, r1, lsl #0x10
	and r3, r3, #0xff
	and r2, r2, #0xff00
	and ip, ip, #0xff0000
	orr r2, r3, r2
	and r3, lr, #0xff000000
	orr r2, ip, r2
	mov r1, r1, lsr #0x10
	orr r2, r3, r2
	bl SOCL_Connect
	ldmia sp!, {r4, pc}
	arm_func_end SOC_Connect

	arm_func_start SOC_Recv
SOC_Recv: ; 0x020A2F60
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov ip, #0
	str ip, [sp]
	str r3, [sp, #4]
	mov r3, ip
	bl SOCL_ReadFrom
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end SOC_Recv

	arm_func_start SOC_RecvFrom
SOC_RecvFrom: ; 0x020A2F84
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	add ip, sp, #0xc
	str ip, [sp]
	str r3, [sp, #4]
	add r3, sp, #8
	bl SOCL_ReadFrom
	cmp r0, #0
	addlt sp, sp, #0x10
	ldmltia sp!, {r3, pc}
	ldr r1, [sp, #0x18]
	cmp r1, #0
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, pc}
	ldrh r2, [sp, #8]
	mov r3, r2, asr #8
	mov r2, r2, lsl #8
	and r3, r3, #0xff
	and r2, r2, #0xff00
	orr r2, r3, r2
	strh r2, [r1, #2]
	ldr lr, [sp, #0xc]
	mov r3, lr, lsr #0x18
	mov r2, lr, lsr #8
	mov ip, lr, lsl #8
	mov lr, lr, lsl #0x18
	and r3, r3, #0xff
	and r2, r2, #0xff00
	and ip, ip, #0xff0000
	orr r2, r3, r2
	and r3, lr, #0xff000000
	orr r2, ip, r2
	orr r2, r3, r2
	str r2, [r1, #4]
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end SOC_RecvFrom

	arm_func_start SOC_Send
SOC_Send: ; 0x020A3014
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov ip, #0
	str ip, [sp]
	str r3, [sp, #4]
	mov r3, ip
	bl SOCL_WriteTo
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end SOC_Send

	arm_func_start SOC_SendTo
SOC_SendTo: ; 0x020A3038
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r5, [sp, #0x20]
	cmp r5, #0
	moveq r5, #0
	moveq r4, r5
	beq _020A30A4
	ldrh r4, [r5, #2]
	ldr r6, [r5, #4]
	mov r7, r4, asr #8
	mov ip, r4, lsl #8
	mov r4, r6, lsr #0x18
	mov lr, r6, lsr #8
	mov r5, r6, lsl #8
	mov r6, r6, lsl #0x18
	and r7, r7, #0xff
	and ip, ip, #0xff00
	orr r7, r7, ip
	and r4, r4, #0xff
	and lr, lr, #0xff00
	and r5, r5, #0xff0000
	orr r4, r4, lr
	mov ip, r7, lsl #0x10
	orr r4, r5, r4
	and r6, r6, #0xff000000
	mov r5, ip, lsr #0x10
	orr r4, r6, r4
_020A30A4:
	str r4, [sp]
	str r3, [sp, #4]
	mov r3, r5
	bl SOCL_WriteTo
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end SOC_SendTo

	arm_func_start SOC_Shutdown
SOC_Shutdown: ; 0x020A30BC
	ldr ip, _020A30C4 ; =SOCL_Shutdown
	bx ip
	.align 2, 0
_020A30C4: .word SOCL_Shutdown
	arm_func_end SOC_Shutdown

	arm_func_start SOC_Close
SOC_Close: ; 0x020A30C8
	ldr ip, _020A30D0 ; =SOCL_Close
	bx ip
	.align 2, 0
_020A30D0: .word SOCL_Close
	arm_func_end SOC_Close

	arm_func_start SOC_GetHostByName
SOC_GetHostByName: ; 0x020A30D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl SOCL_Resolve
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _020A317C ; =_021D451C
	ldr r2, _020A3180 ; =0x00000101
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _020A317C ; =_021D451C
	ldr r2, _020A3180 ; =0x00000101
	mov r1, r5
	bl STD_CopyLString
	mov r3, r4, lsr #0x18
	mov r2, r4, lsr #8
	mov ip, r4, lsl #8
	mov lr, r4, lsl #0x18
	ldr r4, _020A317C ; =_021D451C
	ldr r1, _020A3184 ; =_021D4494
	mov r0, #0
	str r4, [r1, #0x20]
	str r0, [r1, #0x24]
	mov r4, #2
	strh r4, [r1, #0x28]
	mov r4, #4
	ldr r5, _020A3188 ; =_021D44AC
	strh r4, [r1, #0x2a]
	and r3, r3, #0xff
	and r2, r2, #0xff00
	ldr r4, _020A318C ; =_021D4494
	str r5, [r1, #0x2c]
	str r4, [r1, #0x18]
	and ip, ip, #0xff0000
	orr r2, r3, r2
	and r3, lr, #0xff000000
	orr r2, ip, r2
	str r0, [r1, #0x1c]
	orr r2, r3, r2
	ldr r0, _020A3190 ; =_021D44B4
	str r2, [r1]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A317C: .word _021D451C
_020A3180: .word 0x00000101
_020A3184: .word _021D4494
_020A3188: .word _021D44AC
_020A318C: .word _021D4494
_020A3190: .word _021D44B4
	arm_func_end SOC_GetHostByName

	arm_func_start SOC_GetSockName
SOC_GetSockName: ; 0x020A3194
	stmdb sp!, {r4, r5, r6, lr}
	movs r5, r0
	mov r4, r1
	mvneq r0, #0x26
	ldmeqia sp!, {r4, r5, r6, pc}
	bl SOCL_GetHostID
	cmp r5, #0
	ldrneh r1, [r5, #0x74]
	mov r2, r0, lsr #0x18
	mov r6, #8
	moveq r1, #0
	cmp r0, #0
	moveq r1, #0
	mov r1, r1, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r5, r3, asr #8
	mov lr, r3, lsl #8
	strb r6, [r4]
	mov r6, #2
	mov r1, r0, lsr #8
	mov r3, r0, lsl #8
	mov ip, r0, lsl #0x18
	and r0, r1, #0xff00
	and r2, r2, #0xff
	orr r0, r2, r0
	and r1, r3, #0xff0000
	and r5, r5, #0xff
	and lr, lr, #0xff00
	strb r6, [r4, #1]
	orr r3, r5, lr
	and r2, ip, #0xff000000
	orr r0, r1, r0
	strh r3, [r4, #2]
	orr r0, r2, r0
	str r0, [r4, #4]
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end SOC_GetSockName

	arm_func_start SOC_GetHostID
SOC_GetHostID: ; 0x020A3228
	stmdb sp!, {r3, lr}
	bl SOCL_GetHostID
	mov r2, r0, lsr #0x18
	mov r1, r0, lsr #8
	mov r3, r0, lsl #8
	mov ip, r0, lsl #0x18
	and r2, r2, #0xff
	and r0, r1, #0xff00
	and r1, r3, #0xff0000
	orr r0, r2, r0
	and r2, ip, #0xff000000
	orr r0, r1, r0
	orr r0, r2, r0
	ldmia sp!, {r3, pc}
	arm_func_end SOC_GetHostID

	arm_func_start SOC_SetResolver
SOC_SetResolver: ; 0x020A3260
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, [r1]
	ldr r0, [r0]
	mov r2, ip, lsr #0x18
	mov r4, r0, lsr #0x18
	mov lr, r0, lsr #8
	mov r1, ip, lsr #8
	mov r5, r0, lsl #8
	mov r3, ip, lsl #8
	mov r0, r0, lsl #0x18
	mov ip, ip, lsl #0x18
	and r4, r4, #0xff
	and lr, lr, #0xff00
	and r2, r2, #0xff
	and r1, r1, #0xff00
	and r5, r5, #0xff0000
	orr r4, r4, lr
	and r3, r3, #0xff0000
	orr r1, r2, r1
	and lr, r0, #0xff000000
	orr r0, r5, r4
	and r2, ip, #0xff000000
	orr r1, r3, r1
	orr r0, lr, r0
	orr r1, r2, r1
	bl SOCL_SetResolver
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SOC_SetResolver

	arm_func_start SOC_Listen
SOC_Listen: ; 0x020A32CC
	ldr ip, _020A32D4 ; =SOCL_Listen
	bx ip
	.align 2, 0
_020A32D4: .word SOCL_Listen
	arm_func_end SOC_Listen

	arm_func_start SOC_Accept
SOC_Accept: ; 0x020A32D8
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r1
	add r1, sp, #0
	add r2, sp, #4
	bl SOCL_Accept
	cmp r0, #0
	addlt sp, sp, #8
	ldmltia sp!, {r4, pc}
	ldrh r1, [sp]
	mov r2, r1, asr #8
	mov r1, r1, lsl #8
	and r2, r2, #0xff
	and r1, r1, #0xff00
	orr r1, r2, r1
	strh r1, [r4, #2]
	ldr ip, [sp, #4]
	mov r2, ip, lsr #0x18
	mov r1, ip, lsr #8
	mov r3, ip, lsl #8
	mov ip, ip, lsl #0x18
	and r2, r2, #0xff
	and r1, r1, #0xff00
	and r3, r3, #0xff0000
	orr r1, r2, r1
	and r2, ip, #0xff000000
	orr r1, r3, r1
	orr r1, r2, r1
	str r1, [r4, #4]
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	arm_func_end SOC_Accept

	arm_func_start SOC_Fcntl
SOC_Fcntl: ; 0x020A3354
	cmp r0, #0
	mvneq r0, #0
	bxeq lr
	cmp r1, #3
	beq _020A3374
	cmp r1, #4
	beq _020A3388
	b _020A339C
_020A3374:
	ldrsb r0, [r0, #0x72]
	cmp r0, #1
	moveq r0, #0
	movne r0, #4
	bx lr
_020A3388:
	tst r2, #4
	movne r1, #0
	strneb r1, [r0, #0x72]
	moveq r1, #1
	streqb r1, [r0, #0x72]
_020A339C:
	mov r0, #0
	bx lr
	arm_func_end SOC_Fcntl

	arm_func_start AllocFunc_SOCL
AllocFunc_SOCL: ; 0x020A33A4
	stmdb sp!, {r4, lr}
	ldr r1, _020A33CC ; =_021D4494
	add r4, r0, #4
	ldr r2, [r1, #0xc]
	mov r1, r4
	mov r0, #0
	blx r2
	cmp r0, #0
	strne r4, [r0], #4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A33CC: .word _021D4494
	arm_func_end AllocFunc_SOCL

	arm_func_start FreeFunc_SOCL
FreeFunc_SOCL: ; 0x020A33D0
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _020A33F8 ; =_021D4494
	ldr r2, [r0, #-4]
	ldr r3, [r1, #4]
	sub r1, r0, #4
	mov r0, #0
	blx r3
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A33F8: .word _021D4494
	arm_func_end FreeFunc_SOCL

	arm_func_start SOC_Startup
SOC_Startup: ; 0x020A33FC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, [r0, #0xc]
	ldr ip, _020A3560 ; =AllocFunc_SOCL
	cmp r1, #1
	moveq r2, #1
	ldr r1, _020A3564 ; =_021D4494
	movne r2, #0
	str r2, [r1, #0x40]
	ldr r6, [r0, #0x10]
	ldr r3, _020A3568 ; =FreeFunc_SOCL
	mov r4, r6, lsr #0x18
	mov r2, r6, lsr #8
	mov r5, r6, lsl #8
	and r4, r4, #0xff
	and r2, r2, #0xff00
	mov r6, r6, lsl #0x18
	orr r2, r4, r2
	and r5, r5, #0xff0000
	and r4, r6, #0xff000000
	orr r2, r5, r2
	orr r2, r4, r2
	str r2, [r1, #0x44]
	ldr lr, [r0, #0x14]
	mov r2, #0x40
	mov r5, lr, lsr #0x18
	mov r4, lr, lsr #8
	mov r6, lr, lsl #8
	and r5, r5, #0xff
	and r4, r4, #0xff00
	mov lr, lr, lsl #0x18
	orr r4, r5, r4
	and r6, r6, #0xff0000
	and r5, lr, #0xff000000
	orr r4, r6, r4
	orr r4, r5, r4
	str r4, [r1, #0x48]
	ldr lr, [r0, #0x18]
	mov r5, lr, lsr #0x18
	mov r4, lr, lsr #8
	mov r6, lr, lsl #8
	and r5, r5, #0xff
	and r4, r4, #0xff00
	mov lr, lr, lsl #0x18
	orr r4, r5, r4
	and r6, r6, #0xff0000
	and r5, lr, #0xff000000
	orr r4, r6, r4
	orr r4, r5, r4
	str r4, [r1, #0x4c]
	ldr lr, [r0, #0x1c]
	mov r5, lr, lsr #0x18
	mov r4, lr, lsr #8
	mov r6, lr, lsl #8
	and r5, r5, #0xff
	and r4, r4, #0xff00
	mov lr, lr, lsl #0x18
	orr r4, r5, r4
	and r6, r6, #0xff0000
	and r5, lr, #0xff000000
	orr r4, r6, r4
	orr r4, r5, r4
	str r4, [r1, #0x50]
	ldr r6, [r0, #0x20]
	mov r4, r6, lsr #0x18
	mov lr, r6, lsr #8
	mov r5, r6, lsl #8
	mov r6, r6, lsl #0x18
	and r4, r4, #0xff
	and lr, lr, #0xff00
	and r5, r5, #0xff0000
	orr r4, r4, lr
	and r6, r6, #0xff000000
	orr r4, r5, r4
	orr r4, r6, r4
	str r4, [r1, #0x54]
	str ip, [r1, #0x58]
	str r3, [r1, #0x5c]
	ldr r3, [r0, #4]
	str r3, [r1, #0xc]
	ldr r3, [r0, #8]
	str r3, [r1, #4]
	str r2, [r1, #0x60]
	ldr r2, [r0, #0x2c]
	str r2, [r1, #0x70]
	ldr r2, [r0, #0x30]
	ldr r0, _020A356C ; =_021D44D4
	str r2, [r1, #0x74]
	bl SOCL_Startup
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A3560: .word AllocFunc_SOCL
_020A3564: .word _021D4494
_020A3568: .word FreeFunc_SOCL
_020A356C: .word _021D44D4
	arm_func_end SOC_Startup

	arm_func_start SOC_Cleanup
SOC_Cleanup: ; 0x020A3570
	ldr ip, _020A3578 ; =SOCL_Cleanup
	bx ip
	.align 2, 0
_020A3578: .word SOCL_Cleanup
	arm_func_end SOC_Cleanup

	arm_func_start SOC_InetNtoA
SOC_InetNtoA: ; 0x020A357C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	ldr r2, _020A35A8 ; =_021D450C
	add r1, sp, #8
	mov r0, #2
	mov r3, #0x10
	bl SOC_InetNtoP
	ldr r0, _020A35A8 ; =_021D450C
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020A35A8: .word _021D450C
	arm_func_end SOC_InetNtoA

	arm_func_start SOC_InetAtoN
SOC_InetAtoN: ; 0x020A35AC
	stmdb sp!, {r4, lr}
	mov r4, r1
	bl SOCL_InetAtoH
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r2, r0, lsr #0x18
	mov r1, r0, lsr #8
	mov r3, r0, lsl #8
	mov ip, r0, lsl #0x18
	and r2, r2, #0xff
	and r0, r1, #0xff00
	and r1, r3, #0xff0000
	orr r0, r2, r0
	and r2, ip, #0xff000000
	orr r0, r1, r0
	orr r0, r2, r0
	str r0, [r4]
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end SOC_InetAtoN

	arm_func_start SOC_InetNtoP
SOC_InetNtoP: ; 0x020A35FC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	cmp r0, #2
	mov r4, r2
	addne sp, sp, #0x14
	movne r0, #0
	ldmneia sp!, {r3, r4, pc}
	cmp r3, #0x10
	addlo sp, sp, #0x14
	movlo r0, #0
	ldmloia sp!, {r3, r4, pc}
	mov r0, r1
	add r1, sp, #0x10
	mov r2, #4
	bl MI_CpuCopy8
	ldr r0, [sp, #0x10]
	add r1, sp, #0xc
	bl SOC_U32to4U8
	ldrb r1, [sp, #0xe]
	ldr r2, _020A367C ; =_02110678
	mov r0, r4
	str r1, [sp]
	ldrb r3, [sp, #0xd]
	mov r1, #0x10
	str r3, [sp, #4]
	ldrb r3, [sp, #0xc]
	str r3, [sp, #8]
	ldrb r3, [sp, #0xf]
	bl OS_SNPrintf
	mov r0, r4
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020A367C: .word _02110678
	arm_func_end SOC_InetNtoP

	arm_func_start SOC_U32to4U8
SOC_U32to4U8: ; 0x020A3680
	mov r2, r0, lsr #0x18
	strb r2, [r1]
	mov r2, r0, lsr #0x10
	strb r2, [r1, #1]
	mov r2, r0, lsr #8
	strb r2, [r1, #2]
	strb r0, [r1, #3]
	bx lr
	arm_func_end SOC_U32to4U8

	arm_func_start SOC_Poll
SOC_Poll: ; 0x020A36A0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r2
	mov r8, r3
	mvn r2, #0
	cmp r8, r2
	cmpeq sb, r2
	movne fp, #1
	str r0, [sp]
	mov sl, r1
	moveq fp, #0
_020A36C8:
	mov r6, #0
	ldr r4, [sp]
	mov r5, r6
	cmp sl, #0
	bls _020A3708
_020A36DC:
	ldrsh r1, [r4, #4]
	ldr r0, [r4]
	orr r7, r1, #0xe0
	bl SOCL_GetStatus
	ands r0, r7, r0
	strh r0, [r4, #6]
	add r5, r5, #1
	addne r6, r6, #1
	add r4, r4, #8
	cmp r5, sl
	blo _020A36DC
_020A3708:
	cmp r6, #0
	bgt _020A3748
	cmp fp, #0
	beq _020A372C
	mov r0, #0
	subs r0, r0, sb
	mov r0, #0
	sbcs r0, r0, r8
	bge _020A3748
_020A372C:
	mov r0, #1
	bl OS_Sleep
	ldr r0, _020A3750 ; =0x0000020B
	subs sb, sb, r0
	mov r0, #0
	sbc r8, r8, r0
	b _020A36C8
_020A3748:
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A3750: .word 0x0000020B
	arm_func_end SOC_Poll

	arm_func_start SOCL_EnableSsl
SOCL_EnableSsl: ; 0x020A3754
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl SOCL_SocketIsInvalid
	cmp r0, #0
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, pc}
	ldrsb r0, [r5, #0x73]
	mov r1, #1
	cmp r0, #0
	cmpne r0, #4
	movne r1, #0
	cmp r1, #0
	mvneq r0, #0x1b
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	mov r1, #0
	beq _020A37A8
	ldrsh r0, [r5, #0x70]
	tst r0, #1
	movne r1, #1
_020A37A8:
	cmp r1, #0
	mvneq r0, #0x26
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r0, [r5, #0x70]
	tst r0, #2
	mvnne r0, #0x1b
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl SOCLi_ExecEnableSslCommand
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SOCL_EnableSsl

	arm_func_start SOCLi_ExecEnableSslCommand
SOCLi_ExecEnableSslCommand: ; 0x020A37D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r0, _020A380C ; =SOCLi_EnableSslCallBack
	mov r1, r5
	mov r2, #1
	bl SOCLi_CreateCommandPacket
	movs r1, r0
	mvneq r0, #0x20
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	str r4, [r1, #0x10]
	bl SOCLi_ExecCommandPacketInRecvPipe
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A380C: .word SOCLi_EnableSslCallBack
	arm_func_end SOCLi_ExecEnableSslCommand

	arm_func_start SOCLi_EnableSslCallBack
SOCLi_EnableSslCallBack: ; 0x020A3810
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r4, [r7, #4]
	ldr r5, [r4, #0x64]
	add r0, r5, #0xe0
	ldr r6, [r5, #0xc4]
	bl OS_LockMutex
	ldr r1, [r7, #0x10]
	cmp r1, #0
	beq _020A3850
	mov r0, #1
	str r1, [r6, #0xc]
	bl CPS_SetSsl
	mov r0, #4
	strb r0, [r4, #0x73]
	b _020A3864
_020A3850:
	mov r0, #0
	strb r0, [r4, #0x73]
	bl CPS_SetSsl
	mov r0, #0
	str r0, [r6, #0xc]
_020A3864:
	add r0, r5, #0xe0
	bl OS_UnlockMutex
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end SOCLi_EnableSslCallBack

	; NitroWiFi: libcps.a

	arm_func_start reset_network_vars
reset_network_vars: ; 0x020A3874
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _020A3968 ; =_021D4620
	ldr r2, _020A3968 ; =_021D4620
	ldr r1, [r1, #0x50]
	str r0, [r2, #0xc]
	cmp r1, #0
	mov r1, #0
	str r1, [r2, #0x50]
	str r1, [r2, #0x1c]
	str r1, [r2, #0x2c]
	str r1, [r2, #0x60]
	movne r3, #1
	str r1, [r2, #0x64]
	moveq r3, #0
	str r1, [r2, #0x20]
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _020A396C ; =_021D46A0
	mov r2, #0x60
	bl MI_CpuFill8
	ldr r0, _020A3970 ; =OSi_ThreadInfo
	ldr r6, [r0, #8]
	cmp r6, #0
	beq _020A3924
	mov r5, #0
	mov r4, r5
_020A38DC:
	ldr r1, [r6, #0xa4]
	cmp r1, #0
	ldrne r0, [r1]
	cmpne r0, #0
	beq _020A3918
	ldrb r0, [r1, #8]
	cmp r0, #0xa
	cmpne r0, #0xb
	strneb r5, [r1, #8]
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _020A3918
	str r4, [r1, #4]
	ldr r0, [r1]
	bl OS_WakeupThreadDirect
_020A3918:
	ldr r6, [r6, #0x68]
	cmp r6, #0
	bne _020A38DC
_020A3924:
	mov r6, #0
	ldr r7, _020A3974 ; =_021D4948
	ldr r4, _020A3968 ; =_021D4620
	mov r5, r6
_020A3934:
	ldrh r0, [r7, #4]
	cmp r0, #0
	beq _020A3950
	ldr r0, [r7, #0x34]
	ldr r1, [r4, #0x40]
	blx r1
	strh r5, [r7, #4]
_020A3950:
	add r6, r6, #1
	cmp r6, #8
	add r7, r7, #0x38
	blt _020A3934
	bl CPSi_SslCleanup
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A3968: .word _021D4620
_020A396C: .word _021D46A0
_020A3970: .word OSi_ThreadInfo
_020A3974: .word _021D4948
	arm_func_end reset_network_vars

	arm_func_start OS_YieldThread__
OS_YieldThread__: ; 0x020A3978
	stmdb sp!, {r3, lr}
	ldr r0, _020A399C ; =_021D4620
	ldr r0, [r0, #0x24]
	cmp r0, #0
	bne _020A3994
	bl OS_YieldThread
	ldmia sp!, {r3, pc}
_020A3994:
	bl OS_Sleep
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A399C: .word _021D4620
	arm_func_end OS_YieldThread__

	arm_func_start empty_func
empty_func: ; 0x020A39A0
	bx lr
	arm_func_end empty_func

	arm_func_start default_link_is_on
default_link_is_on: ; 0x020A39A4
	mov r0, #1
	bx lr
	arm_func_end default_link_is_on

	arm_func_start CPS_Startup
CPS_Startup: ; 0x020A39AC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r0
	ldr r0, _020A3BA4 ; =_version_UBIQUITOUS_CPS
	bl OSi_ReferSymbol
	ldr r3, [r4, #0x18]
	ldr r5, [r4, #0x14]
	cmp r3, #0
	cmpeq r5, #0
	mov r1, #0
	beq _020A3A04
	ldr r0, _020A3BA8 ; =_021D4620
	ldr r2, _020A3BAC ; =0x6C078965
	str r5, [r0, #0x68]
	str r3, [r0, #0x6c]
	ldr r3, _020A3BB0 ; =0x5D588B65
	str r2, [r0, #0x70]
	ldr r2, _020A3BB4 ; =0x00269EC3
	str r3, [r0, #0x74]
	str r2, [r0, #0x78]
	str r1, [r0, #0x7c]
	b _020A3A34
_020A3A04:
	bl OS_GetTick
	ldr r2, _020A3BA8 ; =_021D4620
	ldr r3, _020A3BAC ; =0x6C078965
	str r0, [r2, #0x68]
	str r1, [r2, #0x6c]
	ldr r1, _020A3BB0 ; =0x5D588B65
	str r3, [r2, #0x70]
	ldr r0, _020A3BB4 ; =0x00269EC3
	str r1, [r2, #0x74]
	str r0, [r2, #0x78]
	mov r0, #0
	str r0, [r2, #0x7c]
_020A3A34:
	ldr r1, [r4, #4]
	cmp r1, #0
	ldrne r0, [r4, #8]
	cmpne r0, #0
	beq _020A3A58
	ldr r0, _020A3BA8 ; =_021D4620
	str r1, [r0, #0x14]
	ldr r1, [r4, #8]
	b _020A3A64
_020A3A58:
	ldr r1, _020A3BB8 ; =empty_func
	ldr r0, _020A3BA8 ; =_021D4620
	str r1, [r0, #0x14]
_020A3A64:
	str r1, [r0, #0x40]
	ldr r1, [r4]
	ldr r0, _020A3BA8 ; =_021D4620
	ldr r2, _020A3BA8 ; =_021D4620
	str r1, [r0, #0x10]
	ldr r1, [r4, #0x24]
	cmp r1, #0
	ldreq r1, _020A3BBC ; =0x000005B4
	strh r1, [r0, #2]
	ldr r1, [r4, #0x28]
	ldr r0, _020A3BA8 ; =_021D4620
	str r1, [r0, #0x34]
	ldr r1, [r4, #0x2c]
	str r1, [r0, #0x24]
	ldr r1, [r4, #0xc]
	cmp r1, #0
	ldreq r1, _020A3BB8 ; =empty_func
	str r1, [r0, #0x18]
	ldr r1, [r4, #0x10]
	cmp r1, #0
	ldrne r0, _020A3BA8 ; =_021D4620
	ldreq r1, _020A3BC0 ; =default_link_is_on
	ldreq r0, _020A3BA8 ; =_021D4620
	str r1, [r0, #0x48]
	ldr r1, [r4, #0x1c]
	mov r0, #0
	str r1, [r2, #0x58]
	ldr r3, [r4, #0x20]
	ldr r1, _020A3BC4 ; =0x00000F88
	str r3, [r2, #0x5c]
	str r0, [r2, #0x30]
	str r0, [r2, #0x28]
	ldr ip, [r2, #0x70]
	ldr r4, [r2, #0x68]
	ldr r3, [r2, #0x6c]
	umull r5, lr, ip, r4
	mla lr, ip, r3, lr
	ldr r3, [r2, #0x74]
	ldr ip, [r2, #0x78]
	mla lr, r3, r4, lr
	ldr r3, [r2, #0x7c]
	adds ip, ip, r5
	adc r5, r3, lr
	umull r3, r4, r5, r1
	mla r4, r5, r0, r4
	mla r4, r0, r1, r4
	str ip, [r2, #0x68]
	ldr r0, _020A3BC8 ; =_021D4B08
	str r5, [r2, #0x6c]
	add r1, r4, #0x400
	strh r1, [r2, #8]
	bl OS_GetMacAddress
	ldr r0, _020A3BA8 ; =_021D4620
	mov r2, #0
	strb r2, [r0, #1]
	mov r1, #0x800
	str r1, [sp]
	ldr r0, _020A3BCC ; =_02110684
	ldr r1, _020A3BD0 ; =tcpip
	ldr r4, [r0]
	ldr r0, _020A3BD4 ; =_021D4888
	ldr r3, _020A3BD8 ; =_021D5E60
	str r4, [sp, #4]
	bl OS_CreateThread
	mov r1, #0x800
	ldr r0, _020A3BCC ; =_02110684
	str r1, [sp]
	ldr r1, [r0]
	ldr r0, _020A3BDC ; =_021D47C8
	str r1, [sp, #4]
	ldr r1, _020A3BE0 ; =scavenger
	ldr r3, _020A3BE4 ; =_021D5660
	mov r2, #0
	bl OS_CreateThread
	ldr r0, _020A3BD4 ; =_021D4888
	bl OS_WakeupThreadDirect
	ldr r0, _020A3BDC ; =_021D47C8
	bl OS_WakeupThreadDirect
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A3BA4: .word _version_UBIQUITOUS_CPS
_020A3BA8: .word _021D4620
_020A3BAC: .word 0x6C078965
_020A3BB0: .word 0x5D588B65
_020A3BB4: .word 0x00269EC3
_020A3BB8: .word empty_func
_020A3BBC: .word 0x000005B4
_020A3BC0: .word default_link_is_on
_020A3BC4: .word 0x00000F88
_020A3BC8: .word _021D4B08
_020A3BCC: .word _02110684
_020A3BD0: .word tcpip
_020A3BD4: .word _021D4888
_020A3BD8: .word _021D5E60
_020A3BDC: .word _021D47C8
_020A3BE0: .word scavenger
_020A3BE4: .word _021D5660
	arm_func_end CPS_Startup

	arm_func_start CPS_CalmDown
CPS_CalmDown: ; 0x020A3BE8
	stmdb sp!, {r3, r4, r5, lr}
	bl OS_DisableInterrupts
	mov r4, r0
	ldr r0, _020A3C30 ; =_021D47C8
	bl OS_IsThreadTerminated
	movs r5, r0
	ldreq r1, _020A3C34 ; =_021D4620
	ldreq r0, [r1, #0x44]
	cmpeq r0, #0
	bne _020A3C20
	ldr r0, _020A3C30 ; =_021D47C8
	mov r2, #1
	str r2, [r1, #0x44]
	bl OS_WakeupThreadDirect
_020A3C20:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A3C30: .word _021D47C8
_020A3C34: .word _021D4620
	arm_func_end CPS_CalmDown

	arm_func_start CPS_SetScavengerCallback
CPS_SetScavengerCallback: ; 0x020A3C38
	ldr r1, _020A3C44 ; =_021D4620
	str r0, [r1, #0x3c]
	bx lr
	.align 2, 0
_020A3C44: .word _021D4620
	arm_func_end CPS_SetScavengerCallback

	arm_func_start CPS_Cleanup
CPS_Cleanup: ; 0x020A3C48
	stmdb sp!, {r3, lr}
	bl CPS_CalmDown
	ldr r0, _020A3C84 ; =_021D47C8
	bl OS_JoinThread
	ldr r0, _020A3C88 ; =_021D4888
	bl OS_DestroyThread
	ldr r1, _020A3C8C ; =_021D4620
	mov r0, #0
	str r0, [r1, #0x54]
	bl reset_network_vars
	ldr r0, _020A3C8C ; =_021D4620
	mov r1, #0
	str r1, [r0, #0x58]
	str r1, [r0, #0x5c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A3C84: .word _021D47C8
_020A3C88: .word _021D4888
_020A3C8C: .word _021D4620
	arm_func_end CPS_Cleanup

	arm_func_start CPS_SetThreadPriority
CPS_SetThreadPriority: ; 0x020A3C90
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r2, _020A3CBC ; =_02110684
	ldr r0, _020A3CC0 ; =_021D4888
	mov r1, r4
	str r4, [r2]
	bl OS_SetThreadPriority
	ldr r0, _020A3CC4 ; =_021D47C8
	mov r1, r4
	bl OS_SetThreadPriority
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A3CBC: .word _02110684
_020A3CC0: .word _021D4888
_020A3CC4: .word _021D47C8
	arm_func_end CPS_SetThreadPriority

	arm_func_start calc_checksum_do
calc_checksum_do: ; 0x020A3CC8
	tst r0, #1
	beq _020A3D00
	cmp r1, #1
	bls _020A3D50
_020A3CD8:
	ldrb ip, [r0]
	ldrb r3, [r0, #1]
	sub r1, r1, #2
	cmp r1, #1
	orr r3, r3, ip, lsl #8
	mov r3, r3, lsl #0x10
	add r2, r2, r3, lsr #16
	add r0, r0, #2
	bhi _020A3CD8
	b _020A3D50
_020A3D00:
	mov r2, r2, lsl #0x10
	mov r3, r2, lsr #0x10
	mov r2, r3, lsl #8
	orr r2, r2, r3, asr #8
	mov r2, r2, lsl #0x10
	cmp r1, #1
	mov r2, r2, lsr #0x10
	bls _020A3D34
_020A3D20:
	ldrh r3, [r0], #2
	sub r1, r1, #2
	cmp r1, #1
	add r2, r2, r3
	bhi _020A3D20
_020A3D34:
	ldr r3, _020A3D78 ; =0x00FF00FF
	mov ip, r3, lsl #8
	and r3, r3, r2, lsr #8
	and r2, ip, r2, lsl #8
	orr r3, r3, r2
	mov r2, r3, lsl #0x10
	orr r2, r2, r3, lsr #16
_020A3D50:
	cmp r1, #0
	ldrneb r0, [r0]
	addne r2, r2, r0, lsl #8
	mov r0, r2, lsl #0x10
	mov r1, r2, lsr #0x10
	add r0, r1, r0, lsr #16
	add r0, r0, r0, lsr #16
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_020A3D78: .word 0x00FF00FF
	arm_func_end calc_checksum_do

	arm_func_start invert_checksum
invert_checksum: ; 0x020A3D7C
	ldr r1, _020A3D94 ; =0x0000FFFF
	eor r0, r0, r1
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	moveq r0, r1
	bx lr
	.align 2, 0
_020A3D94: .word 0x0000FFFF
	arm_func_end invert_checksum

	arm_func_start calc_checksum
calc_checksum: ; 0x020A3D98
	stmdb sp!, {r3, lr}
	mov r2, #0
	bl calc_checksum_do
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl invert_checksum
	ldmia sp!, {r3, pc}
	arm_func_end calc_checksum

	arm_func_start check_tcpudpsum
check_tcpudpsum: ; 0x020A3DB4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r2
	mov r2, r3
	mov r5, r1
	bl calc_checksum_do
	mov r2, r0
	add r0, r4, #0xc
	mov r1, #8
	bl calc_checksum_do
	add r1, r0, r5
	tst r1, #0x10000
	addne r0, r1, #1
	movne r0, r0, lsl #0x10
	movne r1, r0, lsr #0x10
	ldr r0, _020A3E00 ; =0x0000FFFF
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A3E00: .word 0x0000FFFF
	arm_func_end check_tcpudpsum

	arm_func_start ip_islocal
ip_islocal: ; 0x020A3E04
	mov ip, #1
	sub r1, ip, #2
	cmp r0, r1
	subne r1, ip, #0x81000000
	cmpne r0, r1
	beq _020A3E38
	ldr r1, _020A3E40 ; =_021D4620
	ldr r3, [r1, #0x1c]
	ldr r1, [r1, #0x50]
	and r2, r0, r3
	and r0, r1, r3
	cmp r2, r0
	movne ip, #0
_020A3E38:
	mov r0, ip
	bx lr
	.align 2, 0
_020A3E40: .word _021D4620
	arm_func_end ip_islocal

	arm_func_start get_targetip
get_targetip: ; 0x020A3E44
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ip_islocal
	cmp r0, #0
	ldreq r0, _020A3E64 ; =_021D4620
	ldreq r4, [r0, #0x2c]
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A3E64: .word _021D4620
	arm_func_end get_targetip

	arm_func_start is_broadcast
is_broadcast: ; 0x020A3E68
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
	bl ip_islocal
	cmp r0, #0
	beq _020A3E98
	ldr r0, _020A3EA0 ; =_021D4620
	ldr r0, [r0, #0x1c]
	mvn r1, r0
	and r0, r1, r5
	cmp r1, r0
	moveq r4, #1
_020A3E98:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A3EA0: .word _021D4620
	arm_func_end is_broadcast

	arm_func_start is_multicast
is_multicast: ; 0x020A3EA4
	and r0, r0, #0xf0000000
	cmp r0, #0xe0000000
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end is_multicast

	arm_func_start ip_isme
ip_isme: ; 0x020A3EB8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _020A3F30 ; =_021D4620
	mov r4, #1
	ldr r1, [r1, #0x50]
	mov r6, r0
	cmp r1, #0
	mov r0, r4
	cmpne r6, r1
	movne r0, #0
	mov r5, r4
	mov r2, r4
	cmp r0, #0
	bne _020A3EF8
	ldr r0, _020A3F34 ; =0x7F000001
	cmp r6, r0
	movne r2, #0
_020A3EF8:
	cmp r2, #0
	bne _020A3F10
	mov r0, r6
	bl is_broadcast
	cmp r0, #0
	moveq r5, #0
_020A3F10:
	cmp r5, #0
	bne _020A3F28
	mov r0, r6
	bl is_multicast
	cmp r0, #0
	moveq r4, #0
_020A3F28:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A3F30: .word _021D4620
_020A3F34: .word 0x7F000001
	arm_func_end ip_isme

	arm_func_start maccmp
maccmp: ; 0x020A3F38
	mov ip, #0
_020A3F3C:
	ldrh r3, [r0], #2
	ldrh r2, [r1], #2
	cmp r3, r2
	movne r0, #1
	bxne lr
	add ip, ip, #1
	cmp ip, #3
	blt _020A3F3C
	mov r0, #0
	bx lr
	arm_func_end maccmp

	arm_func_start send_packet
send_packet: ; 0x020A3F64
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	ldr r0, _020A3FB8 ; =_02110690
	add r1, r7, #6
	mov r2, #6
	mov r4, r3
	bl MI_CpuCopy8
	mov r0, r7
	mov r3, r5
	add r1, r7, #6
	sub r2, r6, #6
	str r4, [sp]
	bl WCM_SendDCFDataEx
	cmp r0, #0
	movlt r1, #1
	ldr r0, _020A3FBC ; =_021D4620
	movge r1, #0
	strb r1, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A3FB8: .word _02110690
_020A3FBC: .word _021D4620
	arm_func_end send_packet

	arm_func_start put_in_buffer
put_in_buffer: ; 0x020A3FC0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _020A41A8 ; =_021D4620
	mov r7, r0
	ldr ip, [r4, #0x58]
	mov r6, r2
	cmp ip, #0
	ldrne r0, [r4, #0x5c]
	mov r5, r3
	cmpne r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [sp, #0x1c]
	add r0, r5, r0
	cmp r0, #8
	ldmloia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r2, _020A41AC ; =0x000005E4
	cmp r0, r2
	ldmhiia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r2, _020A41B0 ; =_02110690
	ldrb r4, [r6]
	ldrb r3, [r2]
	cmp r4, r3
	ldreqb r4, [r6, #1]
	ldreqb r3, [r2, #1]
	cmpeq r4, r3
	ldreqb r3, [r6, #2]
	ldreqb r2, [r2, #2]
	cmpeq r3, r2
	ldreqb r2, [r6, #6]
	cmpeq r2, #8
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r2, [r6, #7]
	cmp r2, #0
	cmpne r2, #6
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r2, _020A41A8 ; =_021D4620
	add r0, r0, #9
	bic r0, r0, #1
	ldr r8, [r2, #0x28]
	mov r0, r0, lsl #0x10
	ldr lr, [r2, #0x28]
	ldr r4, [r2, #0x30]
	mov r3, r0, lsr #0x10
	cmp lr, r4
	add r4, r8, r0, lsr #16
	bhs _020A4080
	ldr r0, [r2, #0x30]
	cmp r0, r4
	ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
_020A4080:
	ldr r0, _020A41A8 ; =_021D4620
	ldr r2, [r0, #0x5c]
	cmp r4, r2
	bne _020A40A4
	ldr r0, [r0, #0x30]
	mov r4, #0
	cmp r0, #0
	bne _020A40C0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020A40A4:
	ldr r2, [r0, #0x5c]
	cmp r4, r2
	bls _020A40C0
	ldr r0, [r0, #0x30]
	mov r4, r3
	cmp r0, r3
	ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
_020A40C0:
	ldr r0, _020A41A8 ; =_021D4620
	ldr lr, [r0, #0x28]
	ldr r2, [r0, #0x5c]
	add lr, lr, r3
	cmp lr, r2
	bls _020A4100
	ldr lr, [r0, #0x5c]
	ldr r2, [r0, #0x28]
	sub r2, lr, r2
	cmp r2, #2
	ldrhs r0, [r0, #0x28]
	movhs r2, #0
	strhsh r2, [ip, r0]
	ldr r0, _020A41A8 ; =_021D4620
	mov r2, #0
	str r2, [r0, #0x28]
_020A4100:
	ldr ip, _020A41A8 ; =_021D4620
	mov r0, r1
	ldr lr, [ip, #0x58]
	ldr r1, [ip, #0x28]
	mov r2, #6
	strh r3, [lr, r1]
	ldr r3, [ip, #0x58]
	ldr r1, [ip, #0x28]
	add r1, r3, r1
	add r1, r1, #2
	bl MI_CpuCopy8
	ldr r1, _020A41A8 ; =_021D4620
	mov r0, r7
	ldr r3, [r1, #0x58]
	ldr r1, [r1, #0x28]
	mov r2, #6
	add r1, r3, r1
	add r1, r1, #8
	bl MI_CpuCopy8
	ldr r1, _020A41A8 ; =_021D4620
	add r0, r6, #6
	ldr r3, [r1, #0x58]
	ldr r1, [r1, #0x28]
	sub r2, r5, #6
	add r1, r3, r1
	add r1, r1, #0xe
	bl MI_CpuCopy8
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ldrne r2, [sp, #0x1c]
	cmpne r2, #0
	beq _020A419C
	ldr r1, _020A41A8 ; =_021D4620
	ldr r3, [r1, #0x58]
	ldr r1, [r1, #0x28]
	add r1, r3, r1
	add r1, r1, #8
	add r1, r1, r5
	bl MI_CpuCopy8
_020A419C:
	ldr r0, _020A41A8 ; =_021D4620
	str r4, [r0, #0x28]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A41A8: .word _021D4620
_020A41AC: .word 0x000005E4
_020A41B0: .word _02110690
	arm_func_end put_in_buffer

	arm_func_start CPSi_RecvCallbackFunc
CPSi_RecvCallbackFunc: ; 0x020A41B4
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	mov ip, #0
	str ip, [sp]
	str ip, [sp, #4]
	bl put_in_buffer
	ldr r0, _020A4208 ; =_021D4620
	ldr r1, [r0, #0x54]
	cmp r1, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0, #0x54]
	bl OS_IsThreadTerminated
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, pc}
	ldr r0, _020A4208 ; =_021D4620
	ldr r0, [r0, #0x54]
	bl OS_WakeupThreadDirect
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A4208: .word _021D4620
	arm_func_end CPSi_RecvCallbackFunc

	arm_func_start receive_packet
receive_packet: ; 0x020A420C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	bl OS_DisableInterrupts
	ldr sb, _020A42C4 ; =_021D4620
	mov r6, r0
	ldr r1, [sb, #0x30]
	ldr r0, [sb, #0x28]
	cmp r1, r0
	bne _020A4260
	mov r5, #0
	ldr r8, _020A42C8 ; =OSi_ThreadInfo
	mov r4, r5
_020A423C:
	ldr r1, [r8, #4]
	mov r0, r5
	str r1, [sb, #0x54]
	bl OS_SleepThread
	str r4, [sb, #0x54]
	ldr r1, [sb, #0x30]
	ldr r0, [sb, #0x28]
	cmp r1, r0
	beq _020A423C
_020A4260:
	mov r0, r6
	bl OS_RestoreInterrupts
	ldr r0, _020A42C4 ; =_021D4620
	mov r3, #0
	ldr r5, [r0, #0x58]
	mov r1, r3
_020A4278:
	ldr r4, [r0, #0x5c]
	ldr r2, [r0, #0x30]
	sub r2, r4, r2
	cmp r2, #2
	strlo r3, [r0, #0x30]
	ldr r2, [r0, #0x30]
	ldrh r2, [r5, r2]
	cmp r2, #0
	streq r1, [r0, #0x30]
	cmp r2, #0
	beq _020A4278
	sub r1, r2, #2
	ldr r0, _020A42C4 ; =_021D4620
	str r1, [r7]
	ldr r1, [r0, #0x58]
	ldr r0, [r0, #0x30]
	add r0, r1, r0
	add r0, r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020A42C4: .word _021D4620
_020A42C8: .word OSi_ThreadInfo
	arm_func_end receive_packet

	arm_func_start throw_packet
throw_packet: ; 0x020A42CC
	stmdb sp!, {r3, lr}
	bl OS_DisableInterrupts
	ldr r1, _020A430C ; =_021D4620
	ldr ip, [r1, #0x30]
	ldr r3, [r1, #0x58]
	ldr r2, [r1, #0x30]
	ldrh r2, [r3, r2]
	add r2, ip, r2
	str r2, [r1, #0x30]
	ldr r3, [r1, #0x30]
	ldr r2, [r1, #0x5c]
	cmp r3, r2
	movhs r2, #0
	strhs r2, [r1, #0x30]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A430C: .word _021D4620
	arm_func_end throw_packet

	arm_func_start inq_arpcache
inq_arpcache: ; 0x020A4310
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	ldr r1, _020A43C8 ; =0x7F000001
	mov r4, r0
	cmp r5, r1
	ldrne r0, _020A43CC ; =_021D4620
	mov r7, #0
	ldrne r0, [r0, #0x50]
	cmpne r5, r0
	ldreq r7, _020A43D0 ; =_021D4B08
	beq _020A43B8
	mov r0, r5
	bl is_broadcast
	cmp r0, #0
	bne _020A4360
	mov r0, r5
	bl is_multicast
	cmp r0, #0
	beq _020A4368
_020A4360:
	ldr r7, _020A43D4 ; =_02110688
	b _020A43B8
_020A4368:
	ldr r1, _020A43D8 ; =_021D46A0
	mov r6, r7
_020A4370:
	ldr r0, [r1]
	cmp r5, r0
	bne _020A43A8
	bl OS_GetTick
	mov r2, #0xc
	mul r3, r6, r2
	ldr r2, _020A43D8 ; =_021D46A0
	mov r5, r0, lsr #0x10
	add r0, r2, r3
	ldr r2, _020A43DC ; =_021D46AA
	orr r5, r5, r1, lsl #16
	strh r5, [r2, r3]
	add r7, r0, #4
	b _020A43B8
_020A43A8:
	add r6, r6, #1
	cmp r6, #8
	add r1, r1, #0xc
	blo _020A4370
_020A43B8:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A43C8: .word 0x7F000001
_020A43CC: .word _021D4620
_020A43D0: .word _021D4B08
_020A43D4: .word _02110688
_020A43D8: .word _021D46A0
_020A43DC: .word _021D46AA
	arm_func_end inq_arpcache

	arm_func_start send_arprequest
send_arprequest: ; 0x020A43E0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x2c
	mov r4, r0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x2a
	bl MI_CpuFill8
	add r0, sp, #0
	mov r1, #0xff
	mov r2, #6
	bl MI_CpuFill8
	ldr r0, _020A44CC ; =_021D4B08
	add r1, sp, #6
	mov r2, #6
	bl MI_CpuCopy8
	mov r0, #1
	ldr r1, _020A44D0 ; =0x00000608
	strb r0, [sp, #0xf]
	strh r1, [sp, #0xc]
	strb r0, [sp, #0x15]
	mov r0, #8
	ldr r1, _020A44D4 ; =0x00000406
	strb r0, [sp, #0x10]
	strh r1, [sp, #0x12]
	ldr r0, _020A44CC ; =_021D4B08
	add r1, sp, #0x16
	mov r2, #6
	bl MI_CpuCopy8
	ldr r0, _020A44D8 ; =_021D4620
	mov r1, r4, lsr #0x10
	ldr r3, [r0, #0x50]
	mov r0, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r4, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r3, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r0, r3, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r4, lsl #8
	orr r0, r0, r4, asr #8
	strh r0, [sp, #0x1c]
	mov r0, r3, lsl #8
	orr r0, r0, r3, asr #8
	strh r0, [sp, #0x1e]
	mov r0, r2, lsl #8
	orr r0, r0, r2, asr #8
	strh r0, [sp, #0x26]
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	mov r2, #0
	strh r0, [sp, #0x28]
	add r0, sp, #0
	mov r1, #0x2a
	mov r3, r2
	bl send_packet
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020A44CC: .word _021D4B08
_020A44D0: .word 0x00000608
_020A44D4: .word 0x00000406
_020A44D8: .word _021D4620
	arm_func_end send_arprequest

	arm_func_start arprequest
arprequest: ; 0x020A44DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, #0
	ldr r4, _020A4548 ; =_021D4620
	mov sb, r0
	mov r5, #0x64
	mov r6, r7
_020A44F4:
	mov r0, sb
	bl send_arprequest
	mov r8, r6
_020A4500:
	ldr r0, [r4, #0x50]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r5
	bl OS_Sleep
	mov r0, sb
	bl inq_arpcache
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r8, r8, #1
	cmp r8, #0x14
	blo _020A4500
	add r7, r7, #1
	cmp r7, #8
	blo _020A44F4
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020A4548: .word _021D4620
	arm_func_end arprequest

	arm_func_start reg_arpcache
reg_arpcache: ; 0x020A454C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _020A4678 ; =0x7F000001
	mov r6, r1
	mov r7, r0
	cmp r6, r3
	ldrne r0, _020A467C ; =_021D4620
	mov r5, r2
	ldrne r0, [r0, #0x50]
	cmpne r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl ip_islocal
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	bl is_multicast
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	mov r0, r0, lsl #0x10
	ldr r2, _020A4680 ; =_021D46A0
	mov r4, r0, lsr #0x10
	mov r1, #0
_020A45B0:
	ldr r0, [r2]
	cmp r6, r0
	bne _020A45E8
	mov r0, #0xc
	mul r5, r1, r0
	ldr r0, _020A4680 ; =_021D46A0
	ldr r3, _020A4684 ; =_021D46AA
	add r1, r0, r5
	mov r0, r7
	add r1, r1, #4
	mov r2, #6
	strh r4, [r3, r5]
	bl MI_CpuCopy8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A45E8:
	add r1, r1, #1
	cmp r1, #8
	add r2, r2, #0xc
	blo _020A45B0
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r2, #0
	ldr r3, _020A4680 ; =_021D46A0
	mov r1, r2
	mov r5, r2
_020A4610:
	ldr r0, [r3]
	cmp r0, #0
	moveq r1, r5
	beq _020A4648
	ldrh r0, [r3, #0xa]
	add r3, r3, #0xc
	sub r0, r4, r0
	mov r0, r0, lsl #0x10
	cmp r2, r0, asr #16
	movlt r1, r5
	add r5, r5, #1
	movlt r2, r0, lsr #0x10
	cmp r5, #8
	blo _020A4610
_020A4648:
	mov r0, #0xc
	mul r5, r1, r0
	ldr r3, _020A4680 ; =_021D46A0
	mov r0, r7
	add r1, r3, r5
	add r1, r1, #4
	mov r2, #6
	str r6, [r3, r5]
	bl MI_CpuCopy8
	ldr r0, _020A4684 ; =_021D46AA
	strh r4, [r0, r5]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A4678: .word 0x7F000001
_020A467C: .word _021D4620
_020A4680: .word _021D46A0
_020A4684: .word _021D46AA
	arm_func_end reg_arpcache

	arm_func_start send_ether
send_ether: ; 0x020A4688
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldrh r5, [sp, #0x1c]
	ldr r4, [sp, #0x18]
	mov r8, r0
	mov r0, r5, lsl #8
	orr ip, r0, r5, asr #8
	mov r0, r4
	mov r7, r1
	mov r6, r2
	mov r5, r3
	strh ip, [r8, #-2]
	bl is_multicast
	cmp r0, #0
	bne _020A46FC
	mov r0, r4
	bl get_targetip
	movs r4, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	bl inq_arpcache
	cmp r0, #0
	bne _020A46E4
	mov r0, r4
	bl arprequest
_020A46E4:
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	sub r1, r8, #0xe
	mov r2, #6
	bl MI_CpuCopy8
	b _020A472C
_020A46FC:
	mov r0, #1
	strb r0, [r8, #-0xe]
	mov r1, #0
	mov r0, r4, lsr #0x10
	strb r1, [r8, #-0xd]
	mov r1, #0x5e
	strb r1, [r8, #-0xc]
	and r0, r0, #0x7f
	strb r0, [r8, #-0xb]
	mov r0, r4, lsr #8
	strb r0, [r8, #-0xa]
	strb r4, [r8, #-9]
_020A472C:
	ldr r0, _020A4754 ; =_021D4B08
	sub r1, r8, #8
	mov r2, #6
	bl MI_CpuCopy8
	mov r2, r6
	mov r3, r5
	sub r0, r8, #0xe
	add r1, r7, #0xe
	bl send_packet
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A4754: .word _021D4B08
	arm_func_end send_ether

	arm_func_start send_ip_frag
send_ip_frag: ; 0x020A4758
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r7, r1
	mov r5, r3
	add r1, r7, #0x14
	add r1, r1, r5
	mov r1, r1, lsl #0x10
	ldr r3, [sp, #0x24]
	mov r4, r1, lsr #0x10
	mov r1, r3, lsl #0x10
	mov r3, r4, lsl #8
	orr r3, r3, r4, asr #8
	mov r8, r0
	mov r1, r1, lsr #0x10
	mov r0, r1, lsl #8
	strh r3, [r8, #-0x12]
	orr r0, r0, r1, asr #8
	strh r0, [r8, #-0xe]
	mov r3, #0
	sub r0, r8, #0x14
	mov r1, #0x14
	mov r6, r2
	strh r3, [r8, #-0xa]
	ldr r4, [sp, #0x20]
	bl calc_checksum
	mov r2, r0, lsl #8
	ldr r1, _020A4870 ; =0x7F000001
	orr r0, r2, r0, asr #8
	strh r0, [r8, #-0xa]
	cmp r4, r1
	ldrne r0, _020A4874 ; =_021D4620
	ldrne r0, [r0, #0x50]
	cmpne r4, r0
	beq _020A4800
	mov r2, r6
	mov r3, r5
	str r4, [sp]
	mov ip, #0x800
	sub r0, r8, #0x14
	add r1, r7, #0x14
	str ip, [sp, #4]
	bl send_ether
_020A4800:
	ldr r0, _020A4870 ; =0x7F000001
	cmp r4, r0
	ldrne r0, _020A4874 ; =_021D4620
	ldrne r0, [r0, #0x50]
	cmpne r4, r0
	beq _020A482C
	mov r0, r4
	bl is_multicast
	cmp r0, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_020A482C:
	ldr r0, _020A4878 ; =_02110690
	sub r1, r8, #0x1c
	mov r2, #8
	bl MI_CpuCopy8
	bl OS_DisableInterrupts
	mov r4, r0
	ldr r0, _020A487C ; =_021D4B08
	str r6, [sp]
	mov r1, r0
	str r5, [sp, #4]
	sub r2, r8, #0x1c
	add r3, r7, #0x1c
	bl put_in_buffer
	mov r0, r4
	bl OS_RestoreInterrupts
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A4870: .word 0x7F000001
_020A4874: .word _021D4620
_020A4878: .word _02110690
_020A487C: .word _021D4B08
	arm_func_end send_ip_frag

	arm_func_start send_ip
send_ip: ; 0x020A4880
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov r0, #0x45
	strb r0, [sl, #-0x14]
	mov r4, #0
	ldr r7, _020A4A70 ; =_021D4620
	strb r4, [sl, #-0x13]
	ldrh r0, [r7, #6]
	ldr r6, [sp, #0x30]
	ldrb r5, [sp, #0x34]
	add r0, r0, #1
	strh r0, [r7, #6]
	ldrh fp, [r7, #6]
	mov r0, r6, lsr #0x10
	mov r8, #0x80
	mov sb, fp, lsl #8
	orr sb, sb, fp, asr #8
	strh sb, [sl, #-0x10]
	strb r8, [sl, #-0xc]
	strb r5, [sl, #-0xb]
	ldr r8, [r7, #0x50]
	mov r5, r0, lsl #0x10
	mov r0, r8, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	mov r0, r8, lsl #8
	orr r0, r0, r8, asr #8
	strh r0, [sl, #-8]
	ldr r0, [r7, #0x50]
	mov r8, r5, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	mov r5, r7, lsl #8
	mov r0, r6, lsl #0x10
	orr sb, r5, r7, asr #8
	mov r7, r8, lsl #8
	mov r5, r0, lsr #0x10
	mov r0, r5, lsl #8
	strh sb, [sl, #-6]
	orr r7, r7, r8, asr #8
	ldr fp, _020A4A74 ; =0x000005C8
	mov sb, r1
	strh r7, [sl, #-4]
	orr r0, r0, r5, asr #8
	mov r8, r2
	mov r7, r3
	strh r0, [sl, #-2]
	cmp sb, fp
	bls _020A49EC
	mov r5, sl
	bls _020A4990
_020A4950:
	mov r0, sl
	mov r1, #0
	mov r2, r5
	mov r3, fp
	str r6, [sp]
	orr ip, r4, #0x2000
	str ip, [sp, #4]
	bl send_ip_frag
	add r1, r4, #0xb9
	add r0, r5, #0x1c8
	sub sb, sb, fp
	mov r1, r1, lsl #0x10
	cmp sb, fp
	add r5, r0, #0x400
	mov r4, r1, lsr #0x10
	bhi _020A4950
_020A4990:
	cmp sb, #0
	beq _020A49EC
	cmp r7, #0
	mov r1, #0
	beq _020A49C4
	mov r2, r5
	mov r0, sl
	mov r3, sb
	str r6, [sp]
	orr r5, r4, #0x2000
	str r5, [sp, #4]
	bl send_ip_frag
	b _020A49DC
_020A49C4:
	str r6, [sp]
	mov r0, sl
	mov r2, r5
	mov r3, sb
	str r4, [sp, #4]
	bl send_ip_frag
_020A49DC:
	add r0, r4, sb, lsr #3
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	mov sb, #0
_020A49EC:
	ldr fp, _020A4A74 ; =0x000005C8
	add r0, sb, r7
	cmp r0, fp
	bls _020A4A40
_020A49FC:
	sub r5, fp, sb
	mov r1, sb
	mov r0, sl
	mov r2, r8
	mov r3, r5
	str r6, [sp]
	orr sb, r4, #0x2000
	str sb, [sp, #4]
	bl send_ip_frag
	add r0, r4, #0xb9
	sub r7, r7, r5
	mov r0, r0, lsl #0x10
	mov sb, #0
	cmp r7, fp
	add r8, r8, r5
	mov r4, r0, lsr #0x10
	bhi _020A49FC
_020A4A40:
	adds r0, sb, r7
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	str r6, [sp]
	mov r0, sl
	mov r1, sb
	mov r2, r8
	mov r3, r7
	str r4, [sp, #4]
	bl send_ip_frag
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A4A70: .word _021D4620
_020A4A74: .word 0x000005C8
	arm_func_end send_ip

	arm_func_start send_ping
send_ping: ; 0x020A4A78
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r5, r2
	ldr r4, [r5, #0x4c]
	mov r6, r1
	mov r1, #8
	ldr r3, _020A4B20 ; =_021D4620
	ldr r2, _020A4B24 ; =OSi_ThreadInfo
	strh r1, [r4, #0x22]
	ldr r2, [r2, #4]
	ldrh lr, [r3, #4]
	mov r7, r0
	strh r2, [r4, #0x26]
	mov r2, #0
	strh r2, [r4, #0x24]
	strh lr, [r5, #0xa]
	add ip, lr, #1
	add r0, r4, #0x22
	strh ip, [r3, #4]
	strh lr, [r4, #0x28]
	bl calc_checksum_do
	mov r2, r0
	mov r0, r7
	mov r1, r6
	bl calc_checksum_do
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl invert_checksum
	mov r2, r7
	mov r3, r6
	mov r1, r0, lsl #8
	orr r0, r1, r0, asr #8
	strh r0, [r4, #0x24]
	ldr r1, [r5, #0x1c]
	add r0, r4, #0x22
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r1, #8
	bl send_ip
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A4B20: .word _021D4620
_020A4B24: .word OSi_ThreadInfo
	arm_func_end send_ping

	arm_func_start send_udp
send_udp: ; 0x020A4B28
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r7, _020A4C60 ; =_021D4620
	mov r5, r2
	ldr r2, [r7, #0x50]
	mov r6, r1
	mov r1, r2, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	ldr r3, [r5, #0x4c]
	mov r1, r2, lsl #8
	add r4, r3, #0x22
	orr r1, r1, r2, asr #8
	strh r1, [r4, #-0xc]
	ldr r1, [r7, #0x50]
	add r2, r6, #8
	mov r1, r1, lsl #0x10
	mov r7, r1, lsr #0x10
	mov r1, r7, lsl #8
	orr r1, r1, r7, asr #8
	strh r1, [r4, #-0xa]
	ldr r1, [r5, #0x1c]
	mov r2, r2, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r7, r1, lsr #0x10
	mov r1, r7, lsl #8
	orr r1, r1, r7, asr #8
	strh r1, [r4, #-8]
	ldr r1, [r5, #0x1c]
	mov r2, r2, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r7, r1, lsr #0x10
	mov r1, r7, lsl #8
	orr r7, r1, r7, asr #8
	mov r1, r2, lsl #8
	strh r7, [r4, #-6]
	mov r7, #0x1100
	strh r7, [r4, #-4]
	orr r1, r1, r2, asr #8
	strh r1, [r4, #4]
	ldrh r1, [r4, #4]
	mov r7, r0
	sub r0, r4, #0xc
	strh r1, [r4, #-2]
	ldrh lr, [r5, #0x18]
	mov r2, #0
	mov r1, #0x14
	mov ip, lr, lsl #8
	orr ip, ip, lr, asr #8
	strh ip, [r4, #2]
	ldrh lr, [r5, #0xa]
	mov ip, lr, lsl #8
	orr ip, ip, lr, asr #8
	strh ip, [r3, #0x22]
	strh r2, [r4, #6]
	bl calc_checksum_do
	mov r2, r0
	mov r0, r7
	mov r1, r6
	bl calc_checksum_do
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl invert_checksum
	mov r2, r7
	mov r3, r6
	mov r1, r0, lsl #8
	orr r0, r1, r0, asr #8
	strh r0, [r4, #6]
	ldr r1, [r5, #0x1c]
	mov r0, r4
	str r1, [sp]
	mov r1, #0x11
	str r1, [sp, #4]
	mov r1, #8
	bl send_ip
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A4C60: .word _021D4620
	arm_func_end send_udp

	arm_func_start send_tcp
send_tcp: ; 0x020A4C64
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #8
	mov r7, r2
	ldrb r2, [r7, #8]
	mov sb, r0
	mov r8, r1
	cmp r2, #0
	mov r6, r3
	addeq sp, sp, #8
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, _020A4EC8 ; =OSi_ThreadInfo
	ldr r1, _020A4ECC ; =_021D4888
	ldr r0, [r0, #4]
	cmp r0, r1
	ldreq r4, _020A4ED0 ; =_021D4B32
	ldrne r0, [r7, #0x4c]
	addne r4, r0, #0x22
	ldr r0, _020A4ED4 ; =_021D4620
	ands r2, r6, #2
	movne r5, #0x18
	moveq r5, #0x14
	add r1, r5, r8
	ldr sl, [r0, #0x50]
	mov r3, r1, lsl #0x10
	mov r1, sl, lsr #0x10
	mov r1, r1, lsl #0x10
	mov sl, r1, lsr #0x10
	mov r1, sl, lsl #8
	orr r1, r1, sl, asr #8
	strh r1, [r4, #-0xc]
	mov r1, r3, lsr #0x10
	ldr sl, [r0, #0x50]
	mov lr, r1, lsl #8
	mov r3, sl, lsl #0x10
	mov sl, r3, lsr #0x10
	mov r3, sl, lsl #8
	orr r3, r3, sl, asr #8
	strh r3, [r4, #-0xa]
	ldr r3, [r7, #0x1c]
	orr r1, lr, r1, asr #8
	mov r3, r3, lsr #0x10
	mov r3, r3, lsl #0x10
	mov sl, r3, lsr #0x10
	mov r3, sl, lsl #8
	orr r3, r3, sl, asr #8
	strh r3, [r4, #-8]
	ldr r3, [r7, #0x1c]
	mov ip, r5, lsr #2
	mov r3, r3, lsl #0x10
	mov sl, r3, lsr #0x10
	mov r3, sl, lsl #8
	orr r3, r3, sl, asr #8
	strh r3, [r4, #-6]
	mov r3, #0x600
	strh r3, [r4, #-4]
	strh r1, [r4, #-2]
	ldrh lr, [r7, #0xa]
	mov r3, ip, lsl #4
	cmp r2, #0
	mov r1, lr, lsl #8
	orr r1, r1, lr, asr #8
	strh r1, [r4]
	ldrh ip, [r7, #0x18]
	mov r1, ip, lsl #8
	orr r1, r1, ip, asr #8
	strh r1, [r4, #2]
	ldr r1, [r7, #0x28]
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
	mov r1, ip, lsl #8
	orr r1, r1, ip, asr #8
	strh r1, [r4, #4]
	ldr r1, [r7, #0x28]
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
	mov r1, ip, lsl #8
	orr r1, r1, ip, asr #8
	strh r1, [r4, #6]
	ldr r1, [r7, #0x24]
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
	mov r1, ip, lsl #8
	orr r1, r1, ip, asr #8
	strh r1, [r4, #8]
	ldr r1, [r7, #0x24]
	mov r1, r1, lsl #0x10
	mov ip, r1, lsr #0x10
	mov r1, ip, lsl #8
	orr r1, r1, ip, asr #8
	strh r1, [r4, #0xa]
	strb r3, [r4, #0xc]
	strb r6, [r4, #0xd]
	ldr r3, [r7, #0x3c]
	ldr r1, [r7, #0x44]
	sub r1, r3, r1
	mov r1, r1, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	strh r1, [r4, #0xe]
	mov r1, #0
	strh r1, [r4, #0x10]
	strh r1, [r4, #0x12]
	beq _020A4E48
	ldrh r1, [r0, #2]
	add r1, r1, #0x2040000
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	mov r1, r2, lsl #8
	orr r1, r1, r2, asr #8
	strh r1, [r4, #0x14]
	ldrh r0, [r0, #2]
	add r0, r0, #0x2040000
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	strh r0, [r4, #0x16]
_020A4E48:
	sub r0, r4, #0xc
	add r1, r5, #0xc
	mov r2, #0
	bl calc_checksum_do
	mov r2, r0
	mov r0, sb
	mov r1, r8
	bl calc_checksum_do
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl invert_checksum
	mov r3, r0, lsl #8
	orr r0, r3, r0, asr #8
	strh r0, [r4, #0x10]
	mov r0, r4
	ldr r4, [r7, #0x1c]
	mov r3, #6
	str r4, [sp]
	str r3, [sp, #4]
	mov r1, r5
	mov r2, sb
	mov r3, r8
	bl send_ip
	ldr r0, [r7, #0x28]
	tst r6, #3
	add r0, r0, r8
	str r0, [r7, #0x28]
	ldrne r0, [r7, #0x28]
	addne r0, r0, #1
	strne r0, [r7, #0x28]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020A4EC8: .word OSi_ThreadInfo
_020A4ECC: .word _021D4888
_020A4ED0: .word _021D4B32
_020A4ED4: .word _021D4620
	arm_func_end send_tcp

	arm_func_start reply_arp
reply_arp: ; 0x020A4ED8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r3, #0x200
	add r0, r4, #8
	add r1, r4, #0x12
	mov r2, #0xa
	strh r3, [r4, #6]
	bl MI_CpuCopy8
	ldr r0, _020A4F78 ; =_021D4B08
	add r1, r4, #8
	mov r2, #6
	bl MI_CpuCopy8
	ldr r3, _020A4F7C ; =_021D4620
	add r0, r4, #0x12
	ldr r2, [r3, #0x50]
	sub r1, r4, #0xe
	mov r2, r2, lsr #0x10
	mov r2, r2, lsl #0x10
	mov ip, r2, lsr #0x10
	mov r2, ip, lsl #8
	orr r2, r2, ip, asr #8
	strh r2, [r4, #0xe]
	ldr r3, [r3, #0x50]
	mov r2, #6
	mov r3, r3, lsl #0x10
	mov ip, r3, lsr #0x10
	mov r3, ip, lsl #8
	orr r3, r3, ip, asr #8
	strh r3, [r4, #0x10]
	bl MI_CpuCopy8
	ldr r0, _020A4F78 ; =_021D4B08
	sub r1, r4, #8
	mov r2, #6
	bl MI_CpuCopy8
	sub r0, r4, #0xe
	mov r1, #0x2a
	mov r2, #0
	mov r3, r2
	bl send_packet
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A4F78: .word _021D4B08
_020A4F7C: .word _021D4620
	arm_func_end reply_arp

	arm_func_start dispatch_arp
dispatch_arp: ; 0x020A4F80
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	cmp r1, #0x1c
	ldmloia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _020A50B8 ; =_021D4B08
	add r0, r6, #8
	bl maccmp
	cmp r0, #0
	ldrne r0, _020A50BC ; =_021D4620
	ldrne r0, [r0, #0x50]
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r0, [r6]
	cmp r0, #0x100
	ldreqh r0, [r6, #2]
	cmpeq r0, #8
	ldreqh r1, [r6, #4]
	ldreq r0, _020A50C0 ; =0x00000406
	cmpeq r1, r0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r1, [r6, #6]
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	cmp r4, #1
	cmpne r4, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r5, [r6, #0x10]
	ldrh r3, [r6, #0xe]
	ldrh lr, [r6, #0x1a]
	mov r0, r5, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, r5, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	ldrh ip, [r6, #0x18]
	ldr r2, _020A50BC ; =_021D4620
	mov r3, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	ldr r0, [r2, #0x50]
	orr r1, r1, r3, lsl #16
	mov r3, ip, lsl #8
	cmp r1, r0
	moveq r5, #1
	mov r2, lr, lsl #8
	orr ip, r3, ip, asr #8
	orr r3, r2, lr, asr #8
	mov r2, ip, lsl #0x10
	mov r3, r3, lsl #0x10
	mov ip, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, ip, lsl #16
	movne r5, #0
	cmp r0, r2
	moveq r7, #1
	movne r7, #0
	cmp r5, #0
	bne _020A507C
	mov r2, r7
	add r0, r6, #8
	bl reg_arpcache
_020A507C:
	cmp r4, #1
	bne _020A5098
	cmp r7, #0
	beq _020A5098
	mov r0, r6
	bl reply_arp
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A5098:
	cmp r4, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r7, #0
	cmpne r5, #0
	ldrne r0, _020A50BC ; =_021D4620
	movne r1, #1
	strneb r1, [r0, #1]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A50B8: .word _021D4B08
_020A50BC: .word _021D4620
_020A50C0: .word 0x00000406
	arm_func_end dispatch_arp

	arm_func_start reply_icmp
reply_icmp: ; 0x020A50C4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r6, r0
	ldrh r4, [r6, #0xe]
	ldrh r3, [r6, #0xc]
	mov r5, r1
	mov r0, r4, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, r4, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r3, lsl #16
	mov r4, r2
	bl get_targetip
	movs r7, r0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl inq_arpcache
	cmp r0, #0
	bne _020A5130
	mov r0, r7
	bl send_arprequest
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A5130:
	mov r2, #0
	strb r2, [r5]
	mov r0, r5
	mov r1, r4
	strh r2, [r5, #2]
	bl calc_checksum
	mov r1, r0, lsl #8
	orr r0, r1, r0, asr #8
	strh r0, [r5, #2]
	ldrh ip, [r6, #0xe]
	ldrh r3, [r6, #0xc]
	mov r2, #0
	mov r0, ip, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, ip, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r6, r0, r3, lsl #16
	mov r0, r5
	mov r1, r4
	mov r3, r2
	str r6, [sp]
	mov r4, #1
	str r4, [sp, #4]
	bl send_ip
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end reply_icmp

	arm_func_start process_icmp_reply
process_icmp_reply: ; 0x020A51A8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	bl OS_DisableInterrupts
	ldr r1, _020A52A4 ; =OSi_ThreadInfo
	mov r5, r0
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _020A5298
_020A51D0:
	ldr r4, [r1, #0xa4]
	cmp r4, #0
	ldrne r3, [r4]
	cmpne r3, #0
	beq _020A528C
	ldrb r0, [r4, #8]
	cmp r0, #0xb
	ldreqh r2, [r7, #4]
	moveq r0, r3, lsl #0x10
	cmpeq r2, r0, lsr #16
	ldreqh r2, [r4, #0xa]
	ldreqh r0, [r7, #6]
	cmpeq r2, r0
	ldreq r0, [r4, #0x44]
	cmpeq r0, #0
	bne _020A528C
	ldrh lr, [r8, #0xe]
	ldrh ip, [r8, #0xc]
	ldr r0, [r4, #0x1c]
	mov r2, lr, lsl #8
	mov r3, ip, lsl #8
	orr ip, r3, ip, asr #8
	orr r3, r2, lr, asr #8
	mov r2, ip, lsl #0x10
	mov r3, r3, lsl #0x10
	mov ip, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, ip, lsl #16
	cmp r0, r2
	bne _020A528C
	ldr r1, [r4, #0x3c]
	sub r0, r6, #8
	cmp r0, r1
	strhi r1, [r4, #0x44]
	strls r0, [r4, #0x44]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	add r0, r7, #8
	bl MI_CpuCopy8
	ldr r0, [r4, #4]
	cmp r0, #3
	bne _020A5298
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r4]
	bl OS_WakeupThreadDirect
	b _020A5298
_020A528C:
	ldr r1, [r1, #0x68]
	cmp r1, #0
	bne _020A51D0
_020A5298:
	mov r0, r5
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A52A4: .word OSi_ThreadInfo
	arm_func_end process_icmp_reply

	arm_func_start valid_IP
valid_IP: ; 0x020A52A8
	cmp r0, #0
	mvnne r2, #0
	cmpne r0, r2
	cmpne r1, #0
	cmpne r1, r2
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end valid_IP

	arm_func_start dispatch_icmp
dispatch_icmp: ; 0x020A52C8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	mov r0, r5
	mov r1, r4
	bl calc_checksum
	ldr r1, _020A5394 ; =0x0000FFFF
	cmp r0, r1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldrh r0, [r6, #0x12]
	ldrh r8, [r6, #0x10]
	ldrh r7, [r6, #0xe]
	ldrh lr, [r6, #0xc]
	mov r2, r8, lsl #8
	orr r2, r2, r8, asr #8
	mov ip, lr, lsl #8
	mov r2, r2, lsl #0x10
	mov r3, r7, lsl #8
	orr lr, ip, lr, asr #8
	mov r1, r0, lsl #8
	orr ip, r3, r7, asr #8
	orr r3, r1, r0, asr #8
	mov r0, lr, lsl #0x10
	mov r1, ip, lsl #0x10
	mov ip, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	mov r3, r3, lsl #0x10
	mov r2, r2, lsr #0x10
	mov r1, r3, lsr #0x10
	orr r0, r0, ip, lsl #16
	orr r1, r1, r2, lsl #16
	bl valid_IP
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r5]
	cmp r0, #0
	beq _020A536C
	cmp r0, #8
	beq _020A5380
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020A536C:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl process_icmp_reply
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020A5380:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl reply_icmp
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A5394: .word 0x0000FFFF
	arm_func_end dispatch_icmp

	arm_func_start check_listener
check_listener: ; 0x020A5398
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020A5468 ; =OSi_ThreadInfo
	ldr ip, [r2, #8]
	cmp ip, #0
	beq _020A5460
_020A53AC:
	ldr r3, [ip, #0xa4]
	cmp r3, #0
	ldrne r2, [r3]
	cmpne r2, #0
	beq _020A5454
	ldrb r2, [r3, #8]
	cmp r2, #1
	bne _020A5454
	ldrh r5, [r1, #2]
	ldrh r4, [r3, #0xa]
	mov r2, r5, lsl #8
	orr r2, r2, r5, asr #8
	mov r2, r2, lsl #0x10
	cmp r4, r2, lsr #16
	bne _020A5454
	ldrh r5, [r3, #0x18]
	cmp r5, #0
	beq _020A540C
	ldrh r4, [r1]
	mov r2, r4, lsl #8
	orr r2, r2, r4, asr #8
	mov r2, r2, lsl #0x10
	cmp r5, r2, lsr #16
	bne _020A5454
_020A540C:
	ldr r2, [r3, #0x1c]
	cmp r2, #0
	beq _020A544C
	ldrh r6, [r0, #0xe]
	ldrh r5, [r0, #0xc]
	mov r4, r6, lsl #8
	mov lr, r5, lsl #8
	orr lr, lr, r5, asr #8
	orr r4, r4, r6, asr #8
	mov lr, lr, lsl #0x10
	mov r4, r4, lsl #0x10
	mov lr, lr, lsr #0x10
	mov r4, r4, lsr #0x10
	orr r4, r4, lr, lsl #16
	cmp r2, r4
	bne _020A5454
_020A544C:
	mov r0, r3
	ldmia sp!, {r4, r5, r6, pc}
_020A5454:
	ldr ip, [ip, #0x68]
	cmp ip, #0
	bne _020A53AC
_020A5460:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A5468: .word OSi_ThreadInfo
	arm_func_end check_listener

	arm_func_start check_socket
check_socket: ; 0x020A546C
	stmdb sp!, {r4, r5, r6, lr}
	ldrb r4, [r2, #8]
	mov r3, #0
	mov r5, r3
	cmp r4, #0xa
	cmpne r4, #0xb
	movne r5, #1
	mov ip, r3
	mov r6, r3
	cmp r5, #0
	beq _020A54B4
	ldrh lr, [r1, #2]
	ldrh r5, [r2, #0xa]
	mov r4, lr, lsl #8
	orr r4, r4, lr, asr #8
	mov lr, r4, lsl #0x10
	cmp r5, lr, lsr #16
	moveq r6, #1
_020A54B4:
	cmp r6, #0
	beq _020A54D8
	ldrh lr, [r1]
	ldrh r4, [r2, #0x18]
	mov r1, lr, lsl #8
	orr r1, r1, lr, asr #8
	mov r1, r1, lsl #0x10
	cmp r4, r1, lsr #16
	moveq ip, #1
_020A54D8:
	cmp ip, #0
	beq _020A5518
	ldrh lr, [r0, #0xc]
	ldrh r4, [r0, #0xe]
	ldr ip, [r2, #0x1c]
	mov r1, lr, lsl #8
	mov r0, r4, lsl #8
	orr r2, r1, lr, asr #8
	orr r1, r0, r4, asr #8
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	cmp ip, r0
	moveq r3, #1
_020A5518:
	mov r0, r3
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end check_socket

	arm_func_start find_socket
find_socket: ; 0x020A5520
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020A5580 ; =OSi_ThreadInfo
	mov r7, r0
	ldr r5, [r2, #8]
	mov r6, r1
	cmp r5, #0
	beq _020A5578
_020A553C:
	ldr r4, [r5, #0xa4]
	cmp r4, #0
	ldrne r0, [r4]
	cmpne r0, #0
	beq _020A556C
	mov r0, r7
	mov r1, r6
	mov r2, r4
	bl check_socket
	cmp r0, #0
	movne r0, r4
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_020A556C:
	ldr r5, [r5, #0x68]
	cmp r5, #0
	bne _020A553C
_020A5578:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A5580: .word OSi_ThreadInfo
	arm_func_end find_socket

	arm_func_start parse_mss
parse_mss: ; 0x020A5584
	mov r2, #0x218
	strh r2, [r1, #0x2e]
	ldrb r2, [r0, #0xc]
	add r3, r0, #0x14
	and r2, r2, #0xf0
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	mov r0, r0, asr #2
	subs r0, r0, #0x14
	sub ip, r0, #1
	bxeq lr
_020A55B0:
	ldrb r0, [r3], #1
	cmp r0, #0
	bxeq lr
	cmp r0, #1
	beq _020A55F8
	cmp r0, #2
	bne _020A55E8
	ldrb r2, [r3, #1]
	ldrb r0, [r3, #2]
	add r3, r3, #3
	sub ip, ip, #3
	orr r0, r0, r2, lsl #8
	strh r0, [r1, #0x2e]
	b _020A55F8
_020A55E8:
	ldrb r0, [r3]
	sub r0, r0, #1
	sub ip, ip, r0
	add r3, r3, r0
_020A55F8:
	cmp ip, #0
	sub ip, ip, #1
	bne _020A55B0
	bx lr
	arm_func_end parse_mss

	arm_func_start no_need_inq
no_need_inq: ; 0x020A5608
	stmdb sp!, {r3, lr}
	bl get_targetip
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	bl inq_arpcache
	ldmia sp!, {r3, pc}
	arm_func_end no_need_inq

	arm_func_start tcp_send_handshake
tcp_send_handshake: ; 0x020A5624
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	ldr r0, [r6, #0x1c]
	mov r5, r1
	mov r4, r2
	bl no_need_inq
	cmp r0, #0
	bne _020A565C
	ldr r0, _020A5690 ; =OSi_ThreadInfo
	ldr r1, _020A5694 ; =_021D4888
	ldr r0, [r0, #4]
	cmp r0, r1
	beq _020A567C
_020A565C:
	mov r0, #0
	mov r1, r0
	mov r2, r6
	mov r3, r5
	str r4, [sp]
	bl send_tcp
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
_020A567C:
	ldr r0, [r6, #0x1c]
	bl get_targetip
	bl send_arprequest
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020A5690: .word OSi_ThreadInfo
_020A5694: .word _021D4888
	arm_func_end tcp_send_handshake

	arm_func_start tcp_send_ack
tcp_send_ack: ; 0x020A5698
	ldr ip, _020A56A8 ; =tcp_send_handshake
	mov r2, r1
	mov r1, #0x10
	bx ip
	.align 2, 0
_020A56A8: .word tcp_send_handshake
	arm_func_end tcp_send_ack

	arm_func_start tcp_send_finack
tcp_send_finack: ; 0x020A56AC
	ldr ip, _020A56BC ; =tcp_send_handshake
	mov r2, r1
	mov r1, #0x11
	bx ip
	.align 2, 0
_020A56BC: .word tcp_send_handshake
	arm_func_end tcp_send_finack

	arm_func_start tcp_send_rst
tcp_send_rst: ; 0x020A56C0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _020A57F0 ; =_021D4764
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r0, r4
	mov r1, #0
	mov r2, #0x64
	mov r5, r3
	bl MI_CpuFill8
	ldrh r3, [r7, #2]
	ldr r0, _020A57F4 ; =_021D4720
	ldr r2, _020A57F8 ; =_021D4620
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	strh r1, [r0, #0x4e]
	ldrh r3, [r7]
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	strh r1, [r0, #0x5c]
	ldrh ip, [r8, #0xe]
	ldrh r3, [r8, #0xc]
	mov r0, ip, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, ip, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r3, lsl #16
	str r0, [r2, #0x160]
	ldrb r0, [r7, #0xd]
	tst r0, #0x10
	beq _020A5790
	ldrh r6, [r7, #0xa]
	ldrh r3, [r7, #8]
	mov r0, r4
	mov r1, r6, lsl #8
	mov r2, r3, lsl #8
	orr r3, r2, r3, asr #8
	orr r2, r1, r6, asr #8
	mov r1, r3, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	orr r3, r1, r3, lsl #16
	mov r2, r5
	mov r1, #4
	str r3, [r4, #0x28]
	bl tcp_send_handshake
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020A5790:
	mov r0, #0
	str r0, [r4, #0x28]
	ldrh r3, [r7, #6]
	ldrh r2, [r7, #4]
	mov r0, r3, lsl #8
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	orr r1, r0, r3, asr #8
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	add r1, r6, r0
	str r1, [r4, #0x24]
	ldrb r0, [r7, #0xd]
	mov r2, r5
	tst r0, #3
	addne r0, r1, #1
	strne r0, [r4, #0x24]
	mov r0, r4
	mov r1, #0x14
	bl tcp_send_handshake
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A57F0: .word _021D4764
_020A57F4: .word _021D4720
_020A57F8: .word _021D4620
	arm_func_end tcp_send_rst

	arm_func_start dt_syn_LISTEN
dt_syn_LISTEN: ; 0x020A57FC
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r2
	mov r2, #3
	mov r6, r0
	mov r5, r1
	strb r2, [r4, #8]
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [r4, #0x10]
	ldrh r2, [r6, #0x12]
	ldrh r3, [r6, #0x10]
	mov r0, r5
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	mov r1, r1, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	orr r1, r1, r3, lsl #16
	str r1, [r4, #0x14]
	ldrh r3, [r5]
	mov r1, r4
	mov r2, r3, lsl #8
	orr r2, r2, r3, asr #8
	strh r2, [r4, #0x18]
	ldrh r3, [r6, #0xe]
	ldrh r6, [r6, #0xc]
	mov r2, r3, lsl #8
	orr r3, r2, r3, asr #8
	mov r2, r6, lsl #8
	orr r2, r2, r6, asr #8
	mov r2, r2, lsl #0x10
	mov r3, r3, lsl #0x10
	mov r6, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, r6, lsl #16
	str r2, [r4, #0x1c]
	ldrh r6, [r5, #6]
	ldrh r5, [r5, #4]
	mov r2, r6, lsl #8
	mov r3, r5, lsl #8
	orr r5, r3, r5, asr #8
	orr r3, r2, r6, asr #8
	mov r2, r5, lsl #0x10
	mov r3, r3, lsl #0x10
	mov r5, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, r5, lsl #16
	add r2, r2, #1
	str r2, [r4, #0x24]
	bl parse_mss
	mov r0, r4
	mov r1, #0x12
	mov r2, #0
	bl tcp_send_handshake
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end dt_syn_LISTEN

	arm_func_start find_specific_socket
find_specific_socket: ; 0x020A58E8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl find_socket
	movs r2, r0
	beq _020A5968
	ldrb r0, [r2, #8]
	cmp r0, #1
	bne _020A5920
	mov r0, r6
	mov r1, r5
	bl dt_syn_LISTEN
	b _020A5960
_020A5920:
	add r0, r0, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _020A594C
	ldr r1, [r2, #0x28]
	mov r0, r6
	sub r3, r1, #1
	mov r1, r5
	str r3, [r2, #0x28]
	bl dt_syn_LISTEN
	b _020A5960
_020A594C:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, #0
	bl tcp_send_rst
_020A5960:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020A5968:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end find_specific_socket

	arm_func_start dt_syn
dt_syn: ; 0x020A5970
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, r0
	ldrh r0, [r4, #0x12]
	ldrh r8, [r4, #0x10]
	ldrh r7, [r4, #0xe]
	ldrh r6, [r4, #0xc]
	mov ip, r8, lsl #8
	orr ip, ip, r8, asr #8
	mov r5, r6, lsl #8
	mov ip, ip, lsl #0x10
	mov lr, r7, lsl #8
	orr r6, r5, r6, asr #8
	mov r3, r0, lsl #8
	orr r5, lr, r7, asr #8
	orr lr, r3, r0, asr #8
	mov r0, r6, lsl #0x10
	mov r3, r5, lsl #0x10
	mov r5, r0, lsr #0x10
	mov r0, r3, lsr #0x10
	mov lr, lr, lsl #0x10
	orr r0, r0, r5, lsl #16
	mov ip, ip, lsr #0x10
	mov r3, lr, lsr #0x10
	mov r6, r1
	orr r1, r3, ip, lsl #16
	mov r5, r2
	bl valid_IP
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl find_specific_socket
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	mov r1, r6
	bl check_listener
	movs r2, r0
	beq _020A5A20
	mov r0, r4
	mov r1, r6
	bl dt_syn_LISTEN
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020A5A20:
	bl OS_YieldThread
	mov r0, r4
	mov r1, r6
	bl check_listener
	movs r2, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r4
	mov r1, r6
	bl dt_syn_LISTEN
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end dt_syn

	arm_func_start dt_synack
dt_synack: ; 0x020A5A48
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r5, r1
	mov r6, r2
	bl find_socket
	movs r4, r0
	beq _020A5A70
	ldrb r0, [r4, #8]
	cmp r0, #2
	beq _020A5A88
_020A5A70:
	mov r0, r7
	mov r1, r5
	mov r2, r6
	mov r3, #0
	bl tcp_send_rst
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A5A88:
	bl OS_YieldThread
	ldrh ip, [r5, #6]
	ldrh r3, [r5, #4]
	mov r0, r5
	mov r1, ip, lsl #8
	mov r2, r3, lsl #8
	orr r3, r2, r3, asr #8
	orr r2, r1, ip, asr #8
	mov r1, r3, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	orr r1, r1, r3, lsl #16
	add r1, r1, #1
	str r1, [r4, #0x24]
	ldrh lr, [r5, #0xa]
	ldrh ip, [r5, #8]
	mov r1, r4
	mov r2, lr, lsl #8
	mov r3, ip, lsl #8
	orr ip, r3, ip, asr #8
	orr r3, r2, lr, asr #8
	mov r2, ip, lsl #0x10
	mov r3, r3, lsl #0x10
	mov ip, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, ip, lsl #16
	str r2, [r4, #0x30]
	ldrh r3, [r5, #0xe]
	mov r2, r3, lsl #8
	orr r2, r2, r3, asr #8
	strh r2, [r4, #0x2c]
	bl parse_mss
	mov r0, r4
	mov r1, #0
	bl tcp_send_ack
	mov r0, #4
	strb r0, [r4, #8]
	ldr r0, [r4, #4]
	cmp r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r4]
	bl OS_WakeupThreadDirect
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end dt_synack

	arm_func_start dt_ack
dt_ack: ; 0x020A5B40
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	mov sb, r1
	mov r8, r2
	bl find_socket
	movs r5, r0
	bne _020A5B74
	mov r0, r4
	mov r1, sb
	mov r2, r8
	mov r3, #0
	bl tcp_send_rst
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020A5B74:
	ldrh r6, [sb, #0xa]
	ldrh r3, [sb, #8]
	ldr r2, [r5, #0x30]
	mov r0, r6, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, r6, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r1, r0, r3, lsl #16
	sub r0, r1, r2
	ldrb r6, [sb, #0xd]
	cmp r0, #0
	strgt r1, [r5, #0x30]
	ldrh r7, [sb, #6]
	ldrh r3, [sb, #4]
	ldrb r2, [r5, #8]
	mov r0, r7, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, r7, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	cmp r2, #4
	orr r1, r0, r3, lsl #16
	bne _020A5C08
	ldr r0, [r5, #0x24]
	cmp r0, r1
	beq _020A5C08
	mov r0, r5
	mov r1, #0
	bl tcp_send_ack
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020A5C08:
	ldrh r1, [sb, #0xe]
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	strh r0, [r5, #0x2c]
	ldrb r0, [r5, #8]
	cmp r0, #9
	addls pc, pc, r0, lsl #2
	b _020A5E34
_020A5C28: ; jump table
	b _020A5C50 ; case 0
	b _020A5E34 ; case 1
	b _020A5C50 ; case 2
	b _020A5C68 ; case 3
	b _020A5C94 ; case 4
	b _020A5E34 ; case 5
	b _020A5E10 ; case 6
	b _020A5D9C ; case 7
	b _020A5D9C ; case 8
	b _020A5E10 ; case 9
_020A5C50:
	mov r0, r4
	mov r1, sb
	mov r2, r8
	mov r3, #0
	bl tcp_send_rst
	b _020A5E50
_020A5C68:
	mov r0, #4
	strb r0, [r5, #8]
	ldr r0, [r5, #4]
	cmp r0, #1
	bne _020A5C8C
	mov r0, #0
	str r0, [r5, #4]
	ldr r0, [r5]
	bl OS_WakeupThreadDirect
_020A5C8C:
	cmp r8, #0
	beq _020A5E50
_020A5C94:
	ldr r0, [r5, #0x34]
	add r0, r0, #1
	str r0, [r5, #0x34]
	ldr r1, [r5, #0x3c]
	ldr r0, [r5, #0x44]
	sub r0, r1, r0
	cmp r8, r0
	movhi r7, #0
	movhi r8, r0
	movls r7, #1
	cmp r8, #0
	beq _020A5D30
	bl OS_DisableInterrupts
	ldrb r1, [sb, #0xc]
	ldr ip, [r5, #0x40]
	ldr r3, [r5, #0x44]
	and r2, r1, #0xf0
	mov r1, r2, asr #1
	add r1, r2, r1, lsr #30
	mov r4, r0
	mov r2, r8
	add r0, sb, r1, asr #2
	add r1, ip, r3
	bl MI_CpuCopy8
	ldr r1, [r5, #0x44]
	mov r0, r4
	add r1, r1, r8
	str r1, [r5, #0x44]
	ldr r1, [r5, #0x24]
	add r1, r1, r8
	str r1, [r5, #0x24]
	bl OS_RestoreInterrupts
	ldr r0, [r5, #4]
	cmp r0, #2
	bne _020A5D30
	mov r0, #0
	str r0, [r5, #4]
	ldr r0, [r5]
	bl OS_WakeupThreadDirect
_020A5D30:
	cmp r7, #0
	beq _020A5D84
	tst r6, #1
	beq _020A5D84
	mov r0, #6
	strb r0, [r5, #8]
	ldr r1, [r5, #0x24]
	mov r0, r5
	add r2, r1, #1
	mov r1, #0
	str r2, [r5, #0x24]
	bl tcp_send_finack
	cmp r8, #0
	ldreq r0, [r5, #4]
	cmpeq r0, #2
	bne _020A5E50
	mov r0, #0
	str r0, [r5, #4]
	ldr r0, [r5]
	bl OS_WakeupThreadDirect
	b _020A5E50
_020A5D84:
	cmp r8, #0
	beq _020A5E50
	mov r0, r5
	mov r1, #0
	bl tcp_send_ack
	b _020A5E50
_020A5D9C:
	tst r6, #1
	beq _020A5DE4
	ldr r1, [r5, #0x24]
	add r0, r8, #1
	add r2, r1, r0
	mov r0, r5
	mov r1, #0
	str r2, [r5, #0x24]
	bl tcp_send_ack
	mov r1, #0
	strb r1, [r5, #8]
	ldr r0, [r5, #4]
	cmp r0, #2
	bne _020A5E50
	str r1, [r5, #4]
	ldr r0, [r5]
	bl OS_WakeupThreadDirect
	b _020A5E50
_020A5DE4:
	cmp r8, #0
	beq _020A5E04
	ldr r1, [r5, #0x24]
	mov r0, r5
	add r2, r1, r8
	mov r1, #0
	str r2, [r5, #0x24]
	bl tcp_send_ack
_020A5E04:
	mov r0, #8
	strb r0, [r5, #8]
	b _020A5E50
_020A5E10:
	mov r1, #0
	strb r1, [r5, #8]
	ldr r0, [r5, #4]
	cmp r0, #2
	bne _020A5E50
	str r1, [r5, #4]
	ldr r0, [r5]
	bl OS_WakeupThreadDirect
	b _020A5E50
_020A5E34:
	tst r6, #1
	ldrne r0, [r5, #0x24]
	mov r1, #0
	addne r0, r0, #1
	strne r0, [r5, #0x24]
	mov r0, r5
	bl tcp_send_ack
_020A5E50:
	bl OS_YieldThread
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end dt_ack

	arm_func_start dt_fin
dt_fin: ; 0x020A5E58
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl find_socket
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r4, #8]
	cmp r1, #4
	beq _020A5EEC
	cmp r1, #7
	beq _020A5E94
	cmp r1, #8
	beq _020A5EB4
	b _020A5F0C
_020A5E94:
	ldr r2, [r4, #0x24]
	mov r1, #0
	add r2, r2, #1
	str r2, [r4, #0x24]
	bl tcp_send_ack
	mov r0, #9
	strb r0, [r4, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A5EB4:
	ldr r2, [r4, #0x24]
	mov r1, #0
	add r2, r2, #1
	str r2, [r4, #0x24]
	bl tcp_send_ack
	mov r1, #0
	strb r1, [r4, #8]
	ldr r0, [r4, #4]
	cmp r0, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	str r1, [r4, #4]
	ldr r0, [r4]
	bl OS_WakeupThreadDirect
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A5EEC:
	ldr r2, [r4, #0x24]
	mov r1, #0
	add r2, r2, #1
	str r2, [r4, #0x24]
	bl tcp_send_finack
	mov r0, #6
	strb r0, [r4, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A5F0C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, #0
	bl tcp_send_rst
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end dt_fin

	arm_func_start dt_rst
dt_rst: ; 0x020A5F24
	stmdb sp!, {r4, lr}
	bl find_socket
	movs r4, r0
	ldmeqia sp!, {r4, pc}
	bl OS_YieldThread
	mov r1, #0
	strb r1, [r4, #8]
	ldr r0, [r4, #4]
	sub r0, r0, #1
	cmp r0, #1
	ldmhiia sp!, {r4, pc}
	str r1, [r4, #4]
	ldr r0, [r4]
	bl OS_WakeupThreadDirect
	ldmia sp!, {r4, pc}
	arm_func_end dt_rst

	arm_func_start dispatch_tcp
dispatch_tcp: ; 0x020A5F60
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r0, r5
	mov r1, r4
	mov r2, r6
	mov r3, #6
	bl check_tcpudpsum
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldrb r0, [r5, #0xc]
	ldrb r2, [r5, #0xd]
	and r1, r0, #0xf0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	and r1, r2, #0x17
	cmp r1, #0x10
	sub r4, r4, r0, asr #2
	bgt _020A5FD8
	cmp r1, #0x10
	bge _020A6030
	cmp r1, #2
	bgt _020A6058
	cmp r1, #1
	blt _020A6058
	beq _020A6044
	cmp r1, #2
	beq _020A5FF8
	b _020A6058
_020A5FD8:
	cmp r1, #0x12
	bgt _020A6058
	cmp r1, #0x11
	blt _020A6058
	beq _020A6030
	cmp r1, #0x12
	beq _020A6014
	b _020A6058
_020A5FF8:
	tst r2, #0x28
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl dt_syn
	ldmia sp!, {r4, r5, r6, pc}
_020A6014:
	tst r2, #0x28
	ldmneia sp!, {r4, r5, r6, pc}
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl dt_synack
	ldmia sp!, {r4, r5, r6, pc}
_020A6030:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl dt_ack
	ldmia sp!, {r4, r5, r6, pc}
_020A6044:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl dt_fin
	ldmia sp!, {r4, r5, r6, pc}
_020A6058:
	tst r2, #4
	mov r0, r6
	mov r1, r5
	beq _020A6070
	bl dt_rst
	ldmia sp!, {r4, r5, r6, pc}
_020A6070:
	mov r2, r4
	mov r3, #0
	bl tcp_send_rst
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end dispatch_tcp

	arm_func_start dispatch_udp
dispatch_udp: ; 0x020A6080
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r1
	ldrh r1, [r7, #6]
	mov r8, r0
	mov r6, r2
	cmp r1, #0
	beq _020A60B8
	mov r0, r7
	mov r1, r6
	mov r2, r8
	mov r3, #0x11
	bl check_tcpudpsum
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020A60B8:
	bl OS_DisableInterrupts
	ldr r1, _020A6288 ; =OSi_ThreadInfo
	mov r5, r0
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _020A627C
	mvn ip, #0
_020A60D4:
	ldr r4, [r1, #0xa4]
	cmp r4, #0
	ldrne r0, [r4]
	cmpne r0, #0
	beq _020A6270
	ldrb r0, [r4, #8]
	cmp r0, #0xa
	bne _020A6270
	ldrh r3, [r7, #2]
	ldrh r2, [r4, #0xa]
	mov r0, r3, lsl #8
	orr r0, r0, r3, asr #8
	mov r0, r0, lsl #0x10
	cmp r2, r0, lsr #16
	bne _020A6270
	ldrh r3, [r4, #0x18]
	cmp r3, #0
	beq _020A6134
	ldrh r2, [r7]
	mov r0, r2, lsl #8
	orr r0, r0, r2, asr #8
	mov r0, r0, lsl #0x10
	cmp r3, r0, lsr #16
	bne _020A6270
_020A6134:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	cmpne r0, ip
	beq _020A6178
	ldrh sb, [r8, #0xe]
	ldrh lr, [r8, #0xc]
	mov r2, sb, lsl #8
	mov r3, lr, lsl #8
	orr lr, r3, lr, asr #8
	orr r3, r2, sb, asr #8
	mov r2, lr, lsl #0x10
	mov r3, r3, lsl #0x10
	mov lr, r2, lsr #0x10
	mov r2, r3, lsr #0x10
	orr r2, r2, lr, lsl #16
	cmp r0, r2
	bne _020A6270
_020A6178:
	ldrh r3, [r8, #0x12]
	ldrh r2, [r8, #0x10]
	mov r0, r3, lsl #8
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	orr r1, r0, r3, asr #8
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _020A61F4
	ldrh r3, [r8, #0xe]
	ldrh r2, [r8, #0xc]
	mov r0, r3, lsl #8
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	orr r1, r0, r3, asr #8
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	str r0, [r4, #0x1c]
	ldrh r1, [r7]
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	strh r0, [r4, #0x18]
_020A61F4:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _020A627C
	ldr r1, [r4, #0x3c]
	sub r0, r6, #8
	cmp r0, r1
	strhi r1, [r4, #0x44]
	strls r0, [r4, #0x44]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	add r0, r7, #8
	bl MI_CpuCopy8
	ldr r0, [r4, #4]
	cmp r0, #3
	bne _020A6244
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r4]
	bl OS_WakeupThreadDirect
	b _020A627C
_020A6244:
	ldr r3, [r4, #0x38]
	cmp r3, #0
	beq _020A627C
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x44]
	mov r2, r4
	blx r3
	cmp r0, #0
	movne r0, #0
	strne r0, [r4, #0x44]
	b _020A627C
_020A6270:
	ldr r1, [r1, #0x68]
	cmp r1, #0
	bne _020A60D4
_020A627C:
	mov r0, r5
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020A6288: .word OSi_ThreadInfo
	arm_func_end dispatch_udp

	arm_func_start check_frag
check_frag: ; 0x020A628C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov r6, #0
	mov sl, r0
	str r6, [r1]
	ldrh r3, [sl, #6]
	str r1, [sp]
	ldr r2, _020A6548 ; =0x00003FFF
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	str r1, [sp, #8]
	tst r1, r2
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrh r3, [sl, #0xe]
	ldrh r2, [sl, #0xc]
	ldrb r4, [sl]
	mov r0, r3, lsl #8
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	orr r1, r0, r3, asr #8
	mov r3, r4, lsl #0x1c
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r1, r1, lsr #0x10
	ldrh r4, [sl, #4]
	ldr r7, _020A654C ; =_021D4948
	mov r0, r6
	mov r5, r3, lsr #0x1a
	orr sb, r1, r2, lsl #16
_020A6310:
	ldrh r2, [r7, #4]
	cmp r2, #0
	beq _020A6330
	ldr r1, [r7]
	cmp r1, sb
	ldreqh r1, [r7, #6]
	cmpeq r1, r4
	beq _020A634C
_020A6330:
	add r0, r0, #1
	cmp r2, #0
	cmpeq r6, #0
	moveq r6, r7
	cmp r0, #8
	add r7, r7, #0x38
	blo _020A6310
_020A634C:
	ldrh r2, [sl, #2]
	cmp r0, #8
	ldr r1, _020A6550 ; =0x00001FFF
	mov r0, r2, lsl #8
	orr r0, r0, r2, asr #8
	mov r0, r0, lsl #0x10
	rsb r0, r5, r0, lsr #16
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	and fp, r0, r1
	ldr r0, [sp, #4]
	add r8, r0, fp, lsl #3
	bne _020A6408
	cmp r6, #0
	beq _020A6390
	cmp r8, #0x1000
	bls _020A639C
_020A6390:
	add sp, sp, #0xc
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020A639C:
	ldr r1, _020A6554 ; =_021D4620
	add r0, r5, #0xe
	ldr r1, [r1, #0x14]
	add r0, r0, #0x1000
	mov r7, r6
	blx r1
	cmp r0, #0
	str r0, [r6, #0x34]
	addeq sp, sp, #0xc
	mov r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	str sb, [r6]
	strh r4, [r6, #6]
	strh r0, [r6, #8]
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [r6, #0x2c]
	ldr r1, [r6, #0x34]
	mov r0, sl
	add r1, r1, #0xe
	add r1, r1, r5
	str r1, [r6, #0x30]
	ldr r1, [r6, #0x34]
	mov r2, r5
	add r1, r1, #0xe
	bl MI_CpuCopy8
_020A6408:
	ldrh r0, [r7, #4]
	cmp r0, #8
	beq _020A641C
	cmp r8, #0x1000
	bls _020A6440
_020A641C:
	ldr r1, _020A6554 ; =_021D4620
	mov r0, #0
	strh r0, [r7, #4]
	ldr r0, [r7, #0x34]
	ldr r1, [r1, #0x40]
	blx r1
	add sp, sp, #0xc
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020A6440:
	ldr r0, [sp, #4]
	ldr r2, [sp, #4]
	add r1, r0, #7
	ldr r0, [sp, #8]
	add r3, fp, r1, lsr #3
	tst r0, #0x2000
	streqh r8, [r7, #0xa]
	streqh r3, [r7, #8]
	ldrh r1, [r7, #4]
	add r0, sl, r5
	add r1, r7, r1, lsl #1
	strh fp, [r1, #0xc]
	ldrh r1, [r7, #4]
	add r1, r7, r1, lsl #1
	strh r3, [r1, #0x1c]
	ldrh r1, [r7, #4]
	add r1, r1, #1
	strh r1, [r7, #4]
	ldr r1, [r7, #0x30]
	add r1, r1, fp, lsl #3
	bl MI_CpuCopy8
	ldrh r4, [r7, #8]
	cmp r4, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrh r3, [r7, #4]
	mov r6, #0
	mov r5, r6
	cmp r3, #0
	bls _020A64F0
	mov r0, r6
_020A64C0:
	add r2, r7, r5, lsl #1
	ldrh r1, [r2, #0xc]
	cmp r1, r6
	bhi _020A64E4
	ldrh r1, [r2, #0x1c]
	cmp r6, r1
	movlo r6, r1
	movlo r5, r0
	blo _020A64E8
_020A64E4:
	add r5, r5, #1
_020A64E8:
	cmp r5, r3
	blo _020A64C0
_020A64F0:
	cmp r6, r4
	addlo sp, sp, #0xc
	movlo r0, #0
	ldmloia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r4, [r7, #0x34]
	ldrh r3, [r7, #0xa]
	ldrb r0, [r4, #0xe]
	mov r2, #0
	mov r1, #1
	mov r0, r0, lsl #0x1c
	add r0, r3, r0, lsr #26
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r3, lsl #8
	orr r0, r0, r3, asr #8
	strh r0, [r4, #0x10]
	ldr r0, [sp]
	strh r2, [r7, #4]
	str r1, [r0]
	add r0, r4, #0xe
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A6548: .word 0x00003FFF
_020A654C: .word _021D4948
_020A6550: .word 0x00001FFF
_020A6554: .word _021D4620
	arm_func_end check_frag

	arm_func_start dispatch_ip
dispatch_ip: ; 0x020A6558
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	ldrh r7, [r4, #0xe]
	ldrh r6, [r4, #0xc]
	ldrh lr, [r4, #0x12]
	ldrh r5, [r4, #0x10]
	mov r2, r6, lsl #8
	mov r3, lr, lsl #8
	mov ip, r5, lsl #8
	mov r0, r7, lsl #8
	orr r5, ip, r5, asr #8
	orr lr, r3, lr, asr #8
	orr r3, r2, r6, asr #8
	orr ip, r0, r7, asr #8
	mov r0, r5, lsl #0x10
	mov r2, lr, lsl #0x10
	mov r3, r3, lsl #0x10
	mov ip, ip, lsl #0x10
	mov lr, r0, lsr #0x10
	mov r0, r2, lsr #0x10
	mov r3, r3, lsr #0x10
	mov r2, ip, lsr #0x10
	orr r0, r0, lr, lsl #16
	orr r2, r2, r3, lsl #16
	mov r5, r1
	cmp r0, r2
	beq _020A667C
	bl ip_isme
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r1, [r4, #2]
	mov r0, r1, lsl #8
	orr r0, r0, r1, asr #8
	mov r0, r0, lsl #0x10
	cmp r5, r0, lsr #16
	ldmloia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r4]
	mov r0, r4
	mov r1, r1, lsl #0x1c
	mov r1, r1, lsr #0x1a
	bl calc_checksum
	ldr r1, _020A6714 ; =0x0000FFFF
	cmp r0, r1
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh ip, [r4, #0x12]
	ldrh r3, [r4, #0x10]
	ldr r2, _020A6718 ; =_021D4620
	mov r0, ip, lsl #8
	mov r1, r3, lsl #8
	orr r3, r1, r3, asr #8
	orr r1, r0, ip, asr #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r3, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	ldr r1, [r2, #0x50]
	orr r0, r0, r3, lsl #16
	cmp r1, r0
	bne _020A667C
	ldrh ip, [r4, #0xe]
	ldrh r3, [r4, #0xc]
	sub r0, r4, #8
	mov r1, ip, lsl #8
	mov r2, r3, lsl #8
	orr r3, r2, r3, asr #8
	orr r2, r1, ip, asr #8
	mov r1, r3, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r2, lsr #0x10
	orr r1, r1, r3, lsl #16
	mov r2, #1
	bl reg_arpcache
_020A667C:
	add r1, sp, #0
	mov r0, r4
	bl check_frag
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r2, [r4, #2]
	ldrb r3, [r4]
	ldrb ip, [r4, #9]
	mov r1, r2, lsl #8
	orr r1, r1, r2, asr #8
	mov r1, r1, lsl #0x10
	mov r3, r3, lsl #0x1c
	mov r2, r1, lsr #0x10
	cmp ip, #0x11
	add r1, r4, r3, lsr #26
	sub r2, r2, r3, lsr #26
	bne _020A66C8
	bl dispatch_udp
	b _020A66F4
_020A66C8:
	ldr r3, _020A6718 ; =_021D4620
	ldr r3, [r3, #0x50]
	cmp r3, #0
	beq _020A66F4
	cmp ip, #1
	bne _020A66E8
	bl dispatch_icmp
	b _020A66F4
_020A66E8:
	cmp ip, #6
	bne _020A66F4
	bl dispatch_tcp
_020A66F4:
	ldr r0, [sp]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _020A6718 ; =_021D4620
	sub r0, r4, #0xe
	ldr r1, [r1, #0x40]
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A6714: .word 0x0000FFFF
_020A6718: .word _021D4620
	arm_func_end dispatch_ip

	arm_func_start tcpip
tcpip: ; 0x020A671C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r5, _020A6788 ; =0x00000806
	add r4, sp, #0
_020A6728:
	mov r0, r4
	bl receive_packet
	ldr r3, [sp]
	cmp r3, #0x22
	bls _020A6780
	ldrh r2, [r0, #0xc]
	mov r1, r2, lsl #8
	orr r1, r1, r2, asr #8
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	cmp r1, #0x800
	beq _020A6764
	cmp r1, r5
	beq _020A6774
	b _020A6780
_020A6764:
	add r0, r0, #0xe
	sub r1, r3, #0xe
	bl dispatch_ip
	b _020A6780
_020A6774:
	add r0, r0, #0xe
	sub r1, r3, #0xe
	bl dispatch_arp
_020A6780:
	bl throw_packet
	b _020A6728
	.align 2, 0
_020A6788: .word 0x00000806
	arm_func_end tcpip

	arm_func_start CPS_SocGetEport
CPS_SocGetEport: ; 0x020A678C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _020A6828 ; =OSi_ThreadInfo
	ldr r2, _020A682C ; =_021D4620
	ldr r0, [r0, #8]
	ldr r1, _020A6830 ; =0x00001388
	mov r4, #0x400
	mov r3, #1
	mov r5, #0
_020A67AC:
	ldrh ip, [r2, #8]
	mov r6, r5
	add ip, ip, #1
	strh ip, [r2, #8]
	ldrh ip, [r2, #8]
	cmp ip, #0x400
	blo _020A67D0
	cmp ip, r1
	blo _020A67D4
_020A67D0:
	strh r4, [r2, #8]
_020A67D4:
	mov r7, r0
	cmp r0, #0
	beq _020A6814
	ldrh r8, [r2, #8]
_020A67E4:
	ldr lr, [r7, #0xa4]
	cmp lr, #0
	ldrne ip, [lr]
	cmpne ip, #0
	beq _020A6808
	ldrh ip, [lr, #0xa]
	cmp ip, r8
	moveq r6, r3
	beq _020A6814
_020A6808:
	ldr r7, [r7, #0x68]
	cmp r7, #0
	bne _020A67E4
_020A6814:
	cmp r6, #0
	bne _020A67AC
	ldr r0, _020A682C ; =_021D4620
	ldrh r0, [r0, #8]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A6828: .word OSi_ThreadInfo
_020A682C: .word _021D4620
_020A6830: .word 0x00001388
	arm_func_end CPS_SocGetEport

	arm_func_start get_seqno
get_seqno: ; 0x020A6834
	stmdb sp!, {r3, lr}
	ldr r1, _020A6874 ; =_021D4620
	ldr r3, [r1, #0x70]
	ldr r2, [r1, #0x68]
	ldr r0, [r1, #0x6c]
	umull lr, ip, r3, r2
	mla ip, r3, r0, ip
	ldr r0, [r1, #0x74]
	ldr r3, [r1, #0x78]
	mla ip, r0, r2, ip
	ldr r0, [r1, #0x7c]
	adds r2, r3, lr
	str r2, [r1, #0x68]
	adc r0, r0, ip
	str r0, [r1, #0x6c]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A6874: .word _021D4620
	arm_func_end get_seqno

	arm_func_start CPS_SocRegister
CPS_SocRegister: ; 0x020A6878
	ldr r1, _020A6888 ; =OSi_ThreadInfo
	ldr r1, [r1, #4]
	str r0, [r1, #0xa4]
	bx lr
	.align 2, 0
_020A6888: .word OSi_ThreadInfo
	arm_func_end CPS_SocRegister

	arm_func_start CPS_SocUnRegister
CPS_SocUnRegister: ; 0x020A688C
	ldr r0, _020A68A0 ; =OSi_ThreadInfo
	mov r1, #0
	ldr r0, [r0, #4]
	str r1, [r0, #0xa4]
	bx lr
	.align 2, 0
_020A68A0: .word OSi_ThreadInfo
	arm_func_end CPS_SocUnRegister

	arm_func_start CPS_SocDatagramMode
CPS_SocDatagramMode: ; 0x020A68A4
	ldr r0, _020A68CC ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r1, [r0, #0xa4]
	cmp r1, #0
	bxeq lr
	mov r0, #0xa
	strb r0, [r1, #8]
	mov r0, #0
	str r0, [r1, #0x44]
	bx lr
	.align 2, 0
_020A68CC: .word OSi_ThreadInfo
	arm_func_end CPS_SocDatagramMode

	arm_func_start CPS_SocBind
CPS_SocBind: ; 0x020A68D0
	stmdb sp!, {r4, lr}
	ldr r3, _020A6924 ; =OSi_ThreadInfo
	ldr r3, [r3, #4]
	ldr r4, [r3, #0xa4]
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldr r3, _020A6928 ; =0x7F000001
	cmp r2, r3
	ldreq r2, _020A692C ; =_021D4620
	ldreq r2, [r2, #0x50]
	cmp r0, #0
	strh r1, [r4, #0x1a]
	ldrh r1, [r4, #0x1a]
	strh r1, [r4, #0x18]
	str r2, [r4, #0x20]
	str r2, [r4, #0x1c]
	strneh r0, [r4, #0xa]
	ldmneia sp!, {r4, pc}
	bl CPS_SocGetEport
	strh r0, [r4, #0xa]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A6924: .word OSi_ThreadInfo
_020A6928: .word 0x7F000001
_020A692C: .word _021D4620
	arm_func_end CPS_SocBind

	arm_func_start CPS_SocUse
CPS_SocUse: ; 0x020A6930
	ldr r0, _020A6960 ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r1, [r0, #0xa4]
	cmp r1, #0
	bxeq lr
	str r0, [r1]
	mov r0, #0
	strb r0, [r1, #8]
	str r0, [r1, #0x44]
	str r0, [r1, #0x60]
	str r0, [r1, #0x38]
	bx lr
	.align 2, 0
_020A6960: .word OSi_ThreadInfo
	arm_func_end CPS_SocUse

	arm_func_start CPS_SocRelease
CPS_SocRelease: ; 0x020A6964
	ldr r0, _020A6980 ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r1, [r0, #0xa4]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1]
	bx lr
	.align 2, 0
_020A6980: .word OSi_ThreadInfo
	arm_func_end CPS_SocRelease

	arm_func_start CPS_SocDup
CPS_SocDup: ; 0x020A6984
	ldr r1, _020A6998 ; =OSi_ThreadInfo
	ldr r1, [r1, #4]
	ldr r1, [r1, #0xa4]
	str r1, [r0, #0xa4]
	bx lr
	.align 2, 0
_020A6998: .word OSi_ThreadInfo
	arm_func_end CPS_SocDup

	arm_func_start CPSi_TcpListenRaw
CPSi_TcpListenRaw: ; 0x020A699C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl get_seqno
	str r0, [r5, #0x28]
	str r0, [r5, #0x30]
	mov r0, #1
	strb r0, [r5, #8]
	bl OS_DisableInterrupts
	mov r4, r0
	mov r1, #1
	mov r0, #0
	str r1, [r5, #4]
	bl OS_SleepThread
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CPSi_TcpListenRaw

	arm_func_start CPS_SetUdpCallback
CPS_SetUdpCallback: ; 0x020A69DC
	ldr r1, _020A69F4 ; =OSi_ThreadInfo
	ldr r1, [r1, #4]
	ldr r1, [r1, #0xa4]
	cmp r1, #0
	strne r0, [r1, #0x38]
	bx lr
	.align 2, 0
_020A69F4: .word OSi_ThreadInfo
	arm_func_end CPS_SetUdpCallback

	arm_func_start CPS_TcpListen
CPS_TcpListen: ; 0x020A69F8
	stmdb sp!, {r3, lr}
	ldr r0, _020A6A2C ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xa4]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldrb r1, [r0, #9]
	cmp r1, #0
	beq _020A6A24
	bl CPSi_SslListen
	ldmia sp!, {r3, pc}
_020A6A24:
	bl CPSi_TcpListenRaw
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A6A2C: .word OSi_ThreadInfo
	arm_func_end CPS_TcpListen

	arm_func_start CPSi_TcpConnectRaw
CPSi_TcpConnectRaw: ; 0x020A6A30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	bl get_seqno
	mov r6, #2
	ldr r4, _020A6AE0 ; =_021D4620
	mov r8, r0
	mov r7, #0
	mov r5, #1
	mov fp, r6
_020A6A54:
	str r8, [sl, #0x28]
	strb r6, [sl, #8]
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [sl, #0x10]
	mov r0, sl
	mov r1, fp
	mov r2, #0x18
	bl tcp_send_handshake
	bl OS_DisableInterrupts
	mov sb, r0
	ldrb r0, [sl, #8]
	cmp r0, #2
	bne _020A6AA8
	ldr r0, [r4, #0x50]
	cmp r0, #0
	beq _020A6AA8
	mov r0, #0
	str r5, [sl, #4]
	bl OS_SleepThread
_020A6AA8:
	mov r0, sb
	bl OS_RestoreInterrupts
	ldrb r0, [sl, #8]
	cmp r0, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r4, #0x50]
	cmp r0, #0
	beq _020A6AD8
	add r7, r7, #1
	cmp r7, #3
	blo _020A6A54
_020A6AD8:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A6AE0: .word _021D4620
	arm_func_end CPSi_TcpConnectRaw

	arm_func_start CPS_TcpConnect
CPS_TcpConnect: ; 0x020A6AE4
	stmdb sp!, {r3, lr}
	ldr r0, _020A6B20 ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xa4]
	cmp r0, #0
	beq _020A6B18
	ldrb r1, [r0, #9]
	cmp r1, #0
	beq _020A6B10
	bl CPSi_SslConnect
	ldmia sp!, {r3, pc}
_020A6B10:
	bl CPSi_TcpConnectRaw
	ldmia sp!, {r3, pc}
_020A6B18:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A6B20: .word OSi_ThreadInfo
	arm_func_end CPS_TcpConnect

	arm_func_start CPS_SocWho
CPS_SocWho: ; 0x020A6B24
	ldr r2, _020A6B70 ; =OSi_ThreadInfo
	ldr r2, [r2, #4]
	ldr r3, [r2, #0xa4]
	cmp r3, #0
	beq _020A6B68
	ldrb r2, [r3, #8]
	cmp r2, #4
	cmpne r2, #0xa
	bne _020A6B68
	cmp r0, #0
	ldrneh r2, [r3, #0x18]
	strneh r2, [r0]
	cmp r1, #0
	ldrne r0, [r3, #0x14]
	strne r0, [r1]
	ldr r0, [r3, #0x1c]
	bx lr
_020A6B68:
	mov r0, #0
	bx lr
	.align 2, 0
_020A6B70: .word OSi_ThreadInfo
	arm_func_end CPS_SocWho

	arm_func_start CPSi_TcpShutdownRaw
CPSi_TcpShutdownRaw: ; 0x020A6B74
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_YieldThread
	ldrb r1, [r4, #8]
	add r0, r1, #0xfd
	and r0, r0, #0xff
	cmp r0, #1
	bhi _020A6BAC
	mov r0, r4
	mov r1, #0x19
	bl tcp_send_finack
	mov r0, #7
	strb r0, [r4, #8]
	ldmia sp!, {r4, pc}
_020A6BAC:
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	mov r1, #0x1a
	bl tcp_send_ack
	ldmia sp!, {r4, pc}
	arm_func_end CPSi_TcpShutdownRaw

	arm_func_start CPS_TcpShutdown
CPS_TcpShutdown: ; 0x020A6BC4
	stmdb sp!, {r4, lr}
	ldr r0, _020A6BFC ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r4, [r0, #0xa4]
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _020A6BF0
	mov r0, r4
	bl CPSi_SslShutdown
_020A6BF0:
	mov r0, r4
	bl CPSi_TcpShutdownRaw
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A6BFC: .word OSi_ThreadInfo
	arm_func_end CPS_TcpShutdown

	arm_func_start CPS_TcpClose
CPS_TcpClose: ; 0x020A6C00
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _020A6C80 ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r4, [r0, #0xa4]
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _020A6C2C
	mov r0, r4
	bl CPSi_SslClose
_020A6C2C:
	bl OS_GetTick
	mov r6, r0, lsr #0x10
	orr r6, r6, r1, lsl #16
	ldr r5, _020A6C84 ; =_021D4620
	b _020A6C44
_020A6C40:
	bl OS_YieldThread__
_020A6C44:
	ldr r0, [r5, #0x48]
	blx r0
	cmp r0, #0
	ldrneb r0, [r4, #8]
	cmpne r0, #0
	beq _020A6C74
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r6
	cmp r0, #0x27
	blt _020A6C40
_020A6C74:
	mov r0, #0
	strb r0, [r4, #8]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A6C80: .word OSi_ThreadInfo
_020A6C84: .word _021D4620
	arm_func_end CPS_TcpClose

	arm_func_start udp_read_raw
udp_read_raw: ; 0x020A6C88
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r1
	mov sb, r0
	bl OS_DisableInterrupts
	ldr r6, [r8, #0x44]
	mov r7, r0
	cmp r6, #0
	bne _020A6CC8
	mov r5, #3
	mov r4, #0
_020A6CB0:
	mov r0, r4
	str r5, [r8, #4]
	bl OS_SleepThread
	ldr r6, [r8, #0x44]
	cmp r6, #0
	beq _020A6CB0
_020A6CC8:
	mov r0, r7
	bl OS_RestoreInterrupts
	str r6, [sb]
	ldr r0, [r8, #0x40]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end udp_read_raw

	arm_func_start CPSi_TcpReadRaw
CPSi_TcpReadRaw: ; 0x020A6CDC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, r1
	ldr r1, [r4, #0x44]
	mov r5, r0
	cmp r1, #0
	ldreqb r0, [r4, #8]
	cmpeq r0, #4
	bne _020A6D3C
	bl OS_DisableInterrupts
	mov r8, r0
	mov r7, #2
	mov r6, #0
	b _020A6D1C
_020A6D10:
	mov r0, r6
	str r7, [r4, #4]
	bl OS_SleepThread
_020A6D1C:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	ldreqb r0, [r4, #8]
	cmpeq r0, #4
	beq _020A6D10
	mov r0, r8
	bl OS_RestoreInterrupts
	b _020A6D40
_020A6D3C:
	bl OS_YieldThread
_020A6D40:
	ldr r0, [r4, #0x44]
	str r0, [r5]
	cmp r0, #0
	ldrne r0, [r4, #0x40]
	moveq r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end CPSi_TcpReadRaw

	arm_func_start CPS_SocRead
CPS_SocRead: ; 0x020A6D58
	stmdb sp!, {r3, lr}
	ldr r1, _020A6DB8 ; =OSi_ThreadInfo
	ldr r1, [r1, #4]
	ldr r1, [r1, #0xa4]
	cmp r1, #0
	beq _020A6DA8
	ldrb r2, [r1, #8]
	add r2, r2, #0xf6
	and r2, r2, #0xff
	cmp r2, #1
	bhi _020A6D8C
	bl udp_read_raw
	ldmia sp!, {r3, pc}
_020A6D8C:
	ldrb r2, [r1, #9]
	cmp r2, #0
	beq _020A6DA0
	bl CPSi_SslRead
	ldmia sp!, {r3, pc}
_020A6DA0:
	bl CPSi_TcpReadRaw
	ldmia sp!, {r3, pc}
_020A6DA8:
	mov r1, #0
	str r1, [r0]
	mov r0, r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A6DB8: .word OSi_ThreadInfo
	arm_func_end CPS_SocRead

	arm_func_start CPSi_SocConsumeRaw
CPSi_SocConsumeRaw: ; 0x020A6DBC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	mov r7, r0
	bl OS_DisableInterrupts
	ldr r2, [r4, #0x44]
	ldr r1, [r4, #0x3c]
	mov r5, r0
	cmp r2, r1
	mov r6, #0
	bne _020A6DEC
	cmp r7, #0
	movne r6, #1
_020A6DEC:
	cmp r7, r2
	movhs r0, #0
	strhs r0, [r4, #0x44]
	bhs _020A6E10
	ldr r0, [r4, #0x40]
	sub r2, r2, r7
	add r1, r0, r7
	str r2, [r4, #0x44]
	bl memmove
_020A6E10:
	mov r0, r5
	bl OS_RestoreInterrupts
	ldrb r0, [r4, #8]
	cmp r0, #0xa
	cmpne r0, #0xb
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _020A6E3C
	cmp r6, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_020A6E3C:
	mov r0, r4
	mov r1, #0x1b
	bl tcp_send_ack
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CPSi_SocConsumeRaw

	arm_func_start CPS_SocConsume
CPS_SocConsume: ; 0x020A6E4C
	stmdb sp!, {r3, lr}
	ldr r1, _020A6E80 ; =OSi_ThreadInfo
	ldr r1, [r1, #4]
	ldr r1, [r1, #0xa4]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldrb r2, [r1, #9]
	cmp r2, #0
	beq _020A6E78
	bl CPSi_SslConsume
	ldmia sp!, {r3, pc}
_020A6E78:
	bl CPSi_SocConsumeRaw
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A6E80: .word OSi_ThreadInfo
	arm_func_end CPS_SocConsume

	arm_func_start tcp_write_do
tcp_write_do: ; 0x020A6E84
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r8, r2
	ldr r6, [r8, #0x34]
	movs fp, r3
	mov sl, r0
	movne r5, #1
	mov r0, r6, lsl #1
	mov sb, r1
	ldreqh r5, [r8, #0x2c]
	add r7, r0, #4
	b _020A6F28
_020A6EB0:
	ldr r0, _020A6F44 ; =_021D4620
	ldrh r4, [r8, #0x2e]
	ldrh r0, [r0, #2]
	ldr r1, [r8, #0x34]
	cmp r4, r5
	movhs r4, r5
	cmp r0, r4
	movlo r4, r0
	cmp fp, #0
	biceq r4, r4, #1
	cmp sb, r4
	sub r0, r1, r6
	movlo r4, sb
	adds r0, r7, r0
	moveq r4, #0
	mov r6, r1
	sub r7, r0, #1
	cmp r4, #0
	beq _020A6F3C
	mov r2, #0
	str r2, [sp]
	mov r0, sl
	mov r1, r4
	mov r2, r8
	mov r3, #0x18
	sub r5, r5, r4
	bl send_tcp
	bl OS_YieldThread
	add sl, sl, r4
	sub sb, sb, r4
_020A6F28:
	cmp sb, #0
	beq _020A6F3C
	ldrb r0, [r8, #8]
	cmp r0, #4
	beq _020A6EB0
_020A6F3C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A6F44: .word _021D4620
	arm_func_end tcp_write_do

	arm_func_start tcp_write_do2
tcp_write_do2: ; 0x020A6F48
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r2
	mov r4, r3
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	bl tcp_write_do
	cmp r0, #0
	cmpne r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, [sp, #0x10]
	mov r0, r5
	mov r1, r4
	mov r3, #0
	bl tcp_write_do
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end tcp_write_do2

	arm_func_start CPSi_TcpWrite2Raw
CPSi_TcpWrite2Raw: ; 0x020A6F84
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov r4, #0
	mov fp, r0
	ldr r8, [sp, #0x38]
	mov r0, r4
	str r4, [sp, #0x10]
	mov sl, r1
	mov sb, r2
	str r3, [sp, #8]
	mov r6, r4
	str r0, [r8, #0x34]
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [sp, #0xc]
	b _020A713C
_020A6FC8:
	ldr r7, [r8, #0x28]
	ldr r3, [sp, #8]
	str r8, [sp]
	mov r0, fp
	mov r1, sl
	mov r2, sb
	str r6, [sp, #4]
	bl tcp_write_do2
	bl OS_GetTick
	mov r5, r0, lsr #0x10
	ldr r4, _020A7188 ; =_021D4620
	orr r5, r5, r1, lsl #16
_020A6FF8:
	bl OS_YieldThread__
	ldr r0, [r4, #0x48]
	blx r0
	cmp r0, #0
	beq _020A7050
	ldrb r0, [r8, #8]
	cmp r0, #4
	bne _020A7050
	ldr r1, [r8, #0x28]
	ldr r0, [r8, #0x30]
	cmp r1, r0
	beq _020A7050
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r5
	cmp r0, #0xf
	bge _020A7050
	cmp r6, #0
	ldrneh r0, [r8, #0x2c]
	cmpne r0, #0
	beq _020A6FF8
_020A7050:
	ldr r1, [r8, #0x30]
	ldr r0, [r8, #0x28]
	sub r5, r1, r7
	sub r0, r0, r7
	cmp r5, r0
	movhi r5, #0
	ldr r0, [sp, #0x10]
	cmp r5, #0
	add r0, r0, r5
	str r0, [sp, #0x10]
	beq _020A708C
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [sp, #0xc]
_020A708C:
	ldr r0, [r8, #0x30]
	str r0, [r8, #0x28]
	ldrb r0, [r8, #8]
	cmp r0, #4
	ldreqh r0, [r8, #0x2c]
	cmpeq r0, #0
	cmpeq r5, #0
	bne _020A7110
	cmp r6, #0
	bne _020A7114
	bl OS_GetTick
	mov r7, r0, lsr #0x10
	orr r7, r7, r1, lsl #16
	ldr r4, _020A7188 ; =_021D4620
	b _020A70D8
_020A70C8:
	bl OS_YieldThread__
	ldrh r0, [r8, #0x2c]
	cmp r0, #0
	bne _020A7100
_020A70D8:
	ldr r0, [r4, #0x48]
	blx r0
	cmp r0, #0
	beq _020A7100
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r7
	cmp r0, #0xf
	blt _020A70C8
_020A7100:
	ldrh r0, [r8, #0x2c]
	cmp r0, #0
	moveq r6, #1
	b _020A7114
_020A7110:
	mov r6, #0
_020A7114:
	cmp r5, sl
	addlo fp, fp, r5
	sublo sl, sl, r5
	blo _020A713C
	sub r1, r5, sl
	ldr r0, [sp, #8]
	add fp, sb, r1
	mov sb, #0
	sub sl, r0, r1
	str sb, [sp, #8]
_020A713C:
	ldr r0, _020A7188 ; =_021D4620
	ldr r0, [r0, #0x48]
	blx r0
	cmp r0, #0
	cmpne sl, #0
	beq _020A717C
	ldrb r0, [r8, #8]
	cmp r0, #4
	bne _020A717C
	bl OS_GetTick
	mov r2, r0, lsr #0x10
	ldr r0, [sp, #0xc]
	orr r2, r2, r1, lsl #16
	sub r0, r2, r0
	cmp r0, #0x9f
	blt _020A6FC8
_020A717C:
	ldr r0, [sp, #0x10]
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A7188: .word _021D4620
	arm_func_end CPSi_TcpWrite2Raw

	arm_func_start CPSi_SocWrite2
CPSi_SocWrite2: ; 0x020A718C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, _020A7258 ; =OSi_ThreadInfo
	mov r7, r1
	ldr ip, [ip, #4]
	mov r6, r2
	ldr r4, [ip, #0xa4]
	mov r5, r3
	cmp r4, #0
	beq _020A7250
	ldrb ip, [r4, #8]
	cmp ip, #0xa
	bne _020A71EC
	cmp r7, #0
	beq _020A71CC
	mov r2, r4
	bl send_udp
_020A71CC:
	cmp r5, #0
	beq _020A71E4
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl send_udp
_020A71E4:
	add r0, r7, r5
	b _020A7240
_020A71EC:
	cmp ip, #0xb
	bne _020A7224
	cmp r7, #0
	beq _020A7204
	mov r2, r4
	bl send_ping
_020A7204:
	cmp r5, #0
	beq _020A721C
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl send_ping
_020A721C:
	add r0, r7, r5
	b _020A7240
_020A7224:
	ldrb ip, [r4, #9]
	cmp ip, #0
	str r4, [sp]
	beq _020A723C
	bl CPSi_SslWrite2
	b _020A7240
_020A723C:
	bl CPSi_TcpWrite2Raw
_020A7240:
	ldr r1, _020A725C ; =_021D4620
	ldrb r1, [r1]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_020A7250:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A7258: .word OSi_ThreadInfo
_020A725C: .word _021D4620
	arm_func_end CPSi_SocWrite2

	arm_func_start CPS_SocWrite
CPS_SocWrite: ; 0x020A7260
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _020A72F4 ; =OSi_ThreadInfo
	mov r2, r0
	ldr r4, [r3, #4]
	mov r3, r1
	ldr r5, [r4, #0xa4]
	cmp r5, #0
	beq _020A72EC
	ldr r4, [r5, #0x60]
	cmp r4, #0
	beq _020A72DC
	ldr r0, [r5, #0x5c]
	mov r1, r4
	bl CPSi_SocWrite2
	ldr r1, [r5, #0x60]
	mov r4, r0
	cmp r4, r1
	bhs _020A72CC
	ldr r0, [r5, #0x5c]
	sub r2, r1, r4
	add r1, r0, r4
	bl memmove
	ldr r1, [r5, #0x60]
	mov r0, #0
	sub r1, r1, r4
	str r1, [r5, #0x60]
	ldmia sp!, {r3, r4, r5, pc}
_020A72CC:
	mov r0, #0
	str r0, [r5, #0x60]
	sub r0, r4, r1
	ldmia sp!, {r3, r4, r5, pc}
_020A72DC:
	mov r2, #0
	mov r3, r2
	bl CPSi_SocWrite2
	ldmia sp!, {r3, r4, r5, pc}
_020A72EC:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A72F4: .word OSi_ThreadInfo
	arm_func_end CPS_SocWrite

	arm_func_start CPS_SocGetLength
CPS_SocGetLength: ; 0x020A72F8
	stmdb sp!, {r3, lr}
	ldr r0, _020A7364 ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xa4]
	cmp r0, #0
	beq _020A735C
	ldrb r1, [r0, #9]
	cmp r1, #0
	beq _020A7324
	bl CPSi_SslGetLength
	ldmia sp!, {r3, pc}
_020A7324:
	ldr r1, [r0, #0x44]
	cmp r1, #0
	bne _020A734C
	ldrb r0, [r0, #8]
	cmp r0, #4
	beq _020A734C
	add r0, r0, #0xf6
	and r0, r0, #0xff
	cmp r0, #1
	bhi _020A7354
_020A734C:
	mov r0, r1
	ldmia sp!, {r3, pc}
_020A7354:
	mvn r0, #0
	ldmia sp!, {r3, pc}
_020A735C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A7364: .word OSi_ThreadInfo
	arm_func_end CPS_SocGetLength

	arm_func_start CPS_SocFlush
CPS_SocFlush: ; 0x020A7368
	stmdb sp!, {r4, lr}
	ldr r0, _020A73A4 ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r4, [r0, #0xa4]
	cmp r4, #0
	ldrne r1, [r4, #0x60]
	cmpne r1, #0
	ldmeqia sp!, {r4, pc}
	mov r2, #0
	ldr r0, [r4, #0x5c]
	mov r3, r2
	bl CPSi_SocWrite2
	mov r0, #0
	str r0, [r4, #0x60]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A73A4: .word OSi_ThreadInfo
	arm_func_end CPS_SocFlush

	arm_func_start set_fixed_ip
set_fixed_ip: ; 0x020A73A8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r0, _020A7444 ; =_021D4620
	ldr r0, [r0, #0x18]
	blx r0
	ldr r0, _020A7444 ; =_021D4620
	ldr r0, [r0, #0x50]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl send_arprequest
	mov r0, #0x64
	bl OS_Sleep
	ldr r0, _020A7444 ; =_021D4620
	ldr r0, [r0, #0x50]
	bl send_arprequest
	bl OS_GetTick
	mov r6, r0, lsr #0x10
	orr r6, r6, r1, lsl #16
	mov r5, #0x64
	ldr r4, _020A7444 ; =_021D4620
	b _020A7418
_020A73F8:
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _020A7410
	mov r0, #4
	bl reset_network_vars
	ldmia sp!, {r4, r5, r6, pc}
_020A7410:
	mov r0, r5
	bl OS_Sleep
_020A7418:
	ldr r0, [r4, #0x48]
	blx r0
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r6
	cmp r0, #0x17
	blt _020A73F8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020A7444: .word _021D4620
	arm_func_end set_fixed_ip

	arm_func_start scavenger
scavenger: ; 0x020A7448
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r3, _020A7798 ; =_021D4620
	mov r1, #0
	ldr r0, _020A779C ; =_021D4700
	mov r2, #0x64
	str r1, [r3, #0x44]
	bl MI_CpuFill8
	ldr r1, _020A7798 ; =_021D4620
	mov r3, #0x180
	ldr r0, _020A77A0 ; =_021D4CCC
	str r3, [r1, #0x11c]
	str r0, [r1, #0x120]
	ldr r2, _020A77A4 ; =_021D4B4C
	str r3, [r1, #0x128]
	ldr r0, _020A779C ; =_021D4700
	str r2, [r1, #0x12c]
	bl CPS_SocRegister
	mov sl, #1
	ldr r0, _020A7798 ; =_021D4620
	mov fp, sl
	str sl, [sp]
	str sl, [r0, #0xc]
	mov r4, #0
_020A74A4:
	mov r0, #0x3e8
	bl OS_Sleep
	ldr r0, _020A7798 ; =_021D4620
	ldr r1, [r0, #0x44]
	cmp r1, #0
	bne _020A7778
	bl OS_GetTick
	ldr r2, _020A7798 ; =_021D4620
	mov r5, r0, lsr #0x10
	ldr r0, [r2, #0x48]
	orr r5, r5, r1, lsl #16
	blx r0
	cmp r0, #0
	beq _020A75D0
	ldr r0, [sp]
	subs r0, r0, #1
	str r0, [sp]
	bne _020A75E4
	ldr r0, _020A7798 ; =_021D4620
	ldr r1, [r0, #0x10]
	tst r1, #1
	beq _020A7510
	cmp r4, #0
	bne _020A75E4
	bl set_fixed_ip
	mov r4, #1
	b _020A75E4
_020A7510:
	cmp r4, #3
	addls pc, pc, r4, lsl #2
	b _020A75E4
_020A751C: ; jump table
	b _020A752C ; case 0
	b _020A7570 ; case 1
	b _020A7594 ; case 2
	b _020A75E4 ; case 3
_020A752C:
	cmp fp, #0
	movne r1, #2
	strne r1, [r0, #0xc]
	movne fp, #0
	bl dhcp_discover_server
	cmp r0, #0
	beq _020A755C
	add r0, sp, #0
	mov r1, #0
	bl dhcp_request_server
	cmp r0, #0
	bne _020A7568
_020A755C:
	bl set_fixed_ip
	mov r4, #3
	b _020A75E4
_020A7568:
	mov r4, #1
	b _020A75E4
_020A7570:
	add r0, sp, #0
	mov r1, #1
	bl dhcp_request_server
	cmp r0, #0
	bne _020A75E4
	ldr r0, [sp]
	cmp r0, #0x3c
	movlo r4, #2
	b _020A75E4
_020A7594:
	add r0, sp, #0
	mov r1, #2
	bl dhcp_request_server
	cmp r0, #0
	movne r4, #1
	bne _020A75E4
	ldr r0, [sp]
	cmp r0, #0x3c
	bhs _020A75E4
	mov r0, #3
	bl reset_network_vars
	mov sl, #1
	str sl, [sp]
	mov r4, #0
	b _020A75E4
_020A75D0:
	mov r0, #1
	bl reset_network_vars
	mov sl, #1
	str sl, [sp]
	mov r4, #0
_020A75E4:
	mov r3, #0
	ldr r6, _020A77A8 ; =_021D46A0
	ldr r1, _020A77AC ; =0x000003BD
	mov r2, r3
_020A75F4:
	ldr r0, [r6]
	cmp r0, #0
	beq _020A7614
	ldrh r0, [r6, #0xa]
	sub r0, r5, r0
	mov r0, r0, lsl #0x10
	cmp r1, r0, asr #16
	strlt r2, [r6]
_020A7614:
	add r3, r3, #1
	cmp r3, #8
	add r6, r6, #0xc
	blt _020A75F4
	ldr r0, _020A7798 ; =_021D4620
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _020A7644
	subs sl, sl, #1
	bne _020A7644
	bl send_arprequest
	mov sl, #0x69
_020A7644:
	ldr r0, _020A77B0 ; =OSi_ThreadInfo
	ldr sb, [r0, #8]
	cmp sb, #0
	beq _020A770C
	mov r6, #0
	mov r7, r6
	mov r8, #1
_020A7660:
	ldr r0, [sb, #0xa4]
	cmp r0, #0
	ldrne r1, [r0]
	cmpne r1, #0
	beq _020A7700
	ldrb r1, [r0, #8]
	cmp r1, #3
	bne _020A76A8
	ldr r2, [r0, #0x10]
	sub r2, r5, r2
	cmp r2, #0x27
	ble _020A76A8
	strb r8, [r0, #8]
	ldrh r1, [r0, #0x1a]
	strh r1, [r0, #0x18]
	ldr r1, [r0, #0x20]
	str r1, [r0, #0x1c]
	b _020A7700
_020A76A8:
	cmp r1, #2
	bne _020A76E0
	ldr r2, [r0, #0x10]
	sub r2, r5, r2
	cmp r2, #0x27
	ble _020A76E0
	ldr r1, [r0, #4]
	cmp r1, #1
	bne _020A7700
	strb r7, [r0, #8]
	str r7, [r0, #4]
	ldr r0, [r0]
	bl OS_WakeupThreadDirect
	b _020A7700
_020A76E0:
	cmp r1, #4
	beq _020A7700
	ldr r1, [r0, #4]
	cmp r1, #2
	bne _020A7700
	str r6, [r0, #4]
	ldr r0, [r0]
	bl OS_WakeupThreadDirect
_020A7700:
	ldr sb, [sb, #0x68]
	cmp sb, #0
	bne _020A7660
_020A770C:
	mov sb, #0
	ldr r8, _020A77B4 ; =_021D4948
	ldr r6, _020A7798 ; =_021D4620
	mov r7, sb
_020A771C:
	ldrh r0, [r8, #4]
	cmp r0, #0
	beq _020A7748
	ldr r0, [r8, #0x2c]
	sub r0, r5, r0
	cmp r0, #0xef
	ble _020A7748
	ldr r0, [r8, #0x34]
	ldr r1, [r6, #0x40]
	blx r1
	strh r7, [r8, #4]
_020A7748:
	add sb, sb, #1
	cmp sb, #8
	add r8, r8, #0x38
	blt _020A771C
	mov r0, r5
	bl CPSi_SslPeriodical
	ldr r0, _020A7798 ; =_021D4620
	ldr r0, [r0, #0x3c]
	cmp r0, #0
	beq _020A74A4
	blx r0
	b _020A74A4
_020A7778:
	ldr r0, [r0, #0x10]
	tst r0, #1
	bne _020A7790
	cmp r4, #3
	beq _020A7790
	bl dhcp_release_server
_020A7790:
	bl CPS_SocUnRegister
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A7798: .word _021D4620
_020A779C: .word _021D4700
_020A77A0: .word _021D4CCC
_020A77A4: .word _021D4B4C
_020A77A8: .word _021D46A0
_020A77AC: .word 0x000003BD
_020A77B0: .word OSi_ThreadInfo
_020A77B4: .word _021D4948
	arm_func_end scavenger

	arm_func_start dhcp_setcommon
dhcp_setcommon: ; 0x020A77B8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	mov r4, r2
	mov r1, #0
	mov r2, #0xec
	mov r6, r0
	bl MI_CpuFill8
	ldr r0, _020A7928 ; =0x00000101
	mov r1, #6
	strh r0, [r6]
	ldr r0, _020A792C ; =_021D4620
	strb r1, [r6, #2]
	ldr r3, [r0, #0x70]
	ldr r2, [r0, #0x68]
	ldr r1, [r0, #0x6c]
	umull lr, ip, r3, r2
	mla ip, r3, r1, ip
	ldr r1, [r0, #0x74]
	ldr r7, [r0, #0x78]
	mla ip, r1, r2, ip
	ldr r3, [r0, #0x7c]
	adds r7, r7, lr
	adc r1, r3, ip
	str r7, [r0, #0x68]
	str r1, [r0, #0x6c]
	mov r0, r1, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r3, r0, lsr #0x10
	cmp r4, #0
	mov r2, r3, lsl #8
	mov r0, r1, lsl #0x10
	strne r1, [r4]
	mov r1, r0, lsr #0x10
	orr r2, r2, r3, asr #8
	mov r0, r1, lsl #8
	strh r2, [r6, #4]
	orr r0, r0, r1, asr #8
	strh r0, [r6, #6]
	ldr r2, _020A792C ; =_021D4620
	ldr r0, _020A7930 ; =_021D4B08
	ldr r1, [r2, #0x50]
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r3, r1, lsr #0x10
	mov r1, r3, lsl #8
	orr r1, r1, r3, asr #8
	strh r1, [r6, #0xc]
	ldr r2, [r2, #0x50]
	add r1, r6, #0x1c
	mov r2, r2, lsl #0x10
	mov r3, r2, lsr #0x10
	mov r2, r3, lsl #8
	orr r3, r2, r3, asr #8
	mov r2, #6
	strh r3, [r6, #0xe]
	bl MI_CpuCopy8
	ldr r0, _020A7934 ; =0x00008263
	ldr r1, _020A7938 ; =0x00006353
	strh r0, [r6, #0xec]
	strh r1, [r6, #0xee]
	ldr r0, _020A793C ; =0x00000135
	mov r1, #7
	strh r0, [r6, #0xf0]
	strb r5, [r6, #0xf2]
	mov r0, #0x3d
	strb r0, [r6, #0xf3]
	strb r1, [r6, #0xf4]
	mov r3, #1
	ldr r0, _020A7930 ; =_021D4B08
	add r1, r6, #0xf6
	mov r2, #6
	strb r3, [r6, #0xf5]
	bl MI_CpuCopy8
	mov r1, #0xc
	strb r1, [r6, #0xfc]
	mov r2, #0xa
	ldr r0, _020A7940 ; =_0211069C
	add r1, r6, #0xfe
	strb r2, [r6, #0xfd]
	bl MI_CpuCopy8
	mov r1, #0x37
	strb r1, [r6, #0x108]
	mov r2, #3
	add r0, r6, #0xd
	strb r2, [r6, #0x109]
	mov r1, #1
	strb r1, [r6, #0x10a]
	strb r2, [r6, #0x10b]
	mov r1, #6
	strb r1, [r6, #0x10c]
	add r0, r0, #0x100
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A7928: .word 0x00000101
_020A792C: .word _021D4620
_020A7930: .word _021D4B08
_020A7934: .word 0x00008263
_020A7938: .word 0x00006353
_020A793C: .word 0x00000135
_020A7940: .word _0211069C
	arm_func_end dhcp_setcommon

	arm_func_start pad_mem
pad_mem: ; 0x020A7944
	stmdb sp!, {r3, r4, r5, lr}
	mov ip, r0
	mov r5, r2
	cmp r3, r1
	bhs _020A7970
	sub r4, r1, r3
	mov r0, r5
	mov r1, ip
	mov r2, r4
	bl MI_CpuFill8
	add r5, r5, r4
_020A7970:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end pad_mem

	arm_func_start dhcp_send_discover
dhcp_send_discover: ; 0x020A7978
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r4, _020A7A34 ; =_021D4B76
	add r2, sp, #0
	mov r0, r4
	mov r1, #1
	bl dhcp_setcommon
	ldr r1, _020A7A38 ; =_021D4620
	mov ip, r0
	ldr r0, [r1, #0x34]
	cmp r0, #0
	beq _020A79FC
	mov r0, #0x32
	strb r0, [ip]
	mov r0, #4
	strb r0, [ip, #1]
	ldr r0, [r1, #0x34]
	mov r0, r0, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, asr #8
	strb r0, [ip, #2]
	ldr r0, [r1, #0x34]
	mov r0, r0, lsr #0x10
	strb r0, [ip, #3]
	ldr r0, [r1, #0x34]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, asr #8
	strb r0, [ip, #4]
	ldr r0, [r1, #0x34]
	strb r0, [ip, #5]
	add ip, ip, #6
_020A79FC:
	add r2, ip, #1
	mov lr, #0xff
	sub r3, r2, r4
	mov r0, #0
	mov r1, #0x12c
	strb lr, [ip]
	bl pad_mem
	mov r1, r0
	mov r0, r4
	sub r1, r1, r4
	bl CPS_SocWrite
	ldr r0, [sp]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020A7A34: .word _021D4B76
_020A7A38: .word _021D4620
	arm_func_end dhcp_send_discover

	arm_func_start dhcp_send_request
dhcp_send_request: ; 0x020A7A3C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _020A7B3C ; =_021D4B76
	mov r5, r0
	add r2, sp, #0
	mov r0, r4
	mov r1, #3
	bl dhcp_setcommon
	mov ip, r0
	cmp r5, #0
	bne _020A7B08
	mov r0, #0x32
	strb r0, [ip]
	mov r0, #4
	ldr r2, _020A7B40 ; =_021D4620
	strb r0, [ip, #1]
	ldr r1, [r2, #0x34]
	mov r3, #0x36
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r1, r1, asr #8
	strb r1, [ip, #2]
	ldr r1, [r2, #0x34]
	mov r1, r1, lsr #0x10
	strb r1, [ip, #3]
	ldr r1, [r2, #0x34]
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r1, r1, asr #8
	strb r1, [ip, #4]
	ldr r1, [r2, #0x34]
	strb r1, [ip, #5]
	strb r3, [ip, #6]
	strb r0, [ip, #7]
	ldr r0, [r2, #0x20]
	mov r0, r0, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, asr #8
	strb r0, [ip, #8]
	ldr r0, [r2, #0x20]
	mov r0, r0, lsr #0x10
	strb r0, [ip, #9]
	ldr r0, [r2, #0x20]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r0, r0, asr #8
	strb r0, [ip, #0xa]
	ldr r0, [r2, #0x20]
	strb r0, [ip, #0xb]
	add ip, ip, #0xc
_020A7B08:
	add r2, ip, #1
	mov lr, #0xff
	sub r3, r2, r4
	mov r0, #0
	mov r1, #0x12c
	strb lr, [ip]
	bl pad_mem
	mov r1, r0
	mov r0, r4
	sub r1, r1, r4
	bl CPS_SocWrite
	ldr r0, [sp]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A7B3C: .word _021D4B76
_020A7B40: .word _021D4620
	arm_func_end dhcp_send_request

	arm_func_start dhcp_analyze_response
dhcp_analyze_response: ; 0x020A7B44
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	add r1, r1, #1
	str r0, [sp]
	rsb fp, r1, r1, lsl #4
	bl OS_GetTick
	mov r4, r0, lsr #0x10
	orr r4, r4, r1, lsl #16
	mov r5, #0
	b _020A7E4C
_020A7B6C:
	bl CPS_SocGetLength
	cmp r0, #0
	bne _020A7B80
	bl OS_YieldThread__
	b _020A7E4C
_020A7B80:
	add r0, sp, #4
	bl CPS_SocRead
	ldr r1, [sp, #4]
	mov r6, r0
	cmp r1, #0xf0
	bls _020A7E44
	ldrb r0, [r6]
	cmp r0, #2
	bne _020A7E44
	ldrh r3, [r6, #6]
	ldrh r2, [r6, #4]
	mov r0, r3, lsl #8
	mov r1, r2, lsl #8
	orr r2, r1, r2, asr #8
	orr r1, r0, r3, asr #8
	mov r0, r2, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r1, r0, r2, lsl #16
	ldr r0, [sp]
	cmp r0, r1
	bne _020A7E44
	ldr r1, _020A7E8C ; =_021D4B08
	add r0, r6, #0x1c
	bl maccmp
	cmp r0, #0
	bne _020A7E44
	ldrb r3, [r6, #0x10]
	ldrb r2, [r6, #0x11]
	ldrb r1, [r6, #0x12]
	ldrb r0, [r6, #0x13]
	orr r3, r2, r3, lsl #8
	ldrb r2, [r6, #0xec]
	orr r1, r0, r1, lsl #8
	mov r0, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r5, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	cmp r2, #0x63
	orr r2, r0, r5, lsl #16
	ldreqb r0, [r6, #0xed]
	ldr r3, [sp, #4]
	mov r5, #3
	cmpeq r0, #0x82
	ldreqb r0, [r6, #0xee]
	add r1, r6, r3
	cmpeq r0, #0x53
	ldreqb r0, [r6, #0xef]
	addeq r3, r6, #0xf0
	cmpeq r0, #0x63
	bne _020A7E44
	mov r0, #0
	mov sb, #2
	mov sl, #1
	ldr ip, _020A7E90 ; =_021D4620
	b _020A7E30
_020A7C64:
	cmp r6, #0
	beq _020A7E30
	cmp r6, #0x33
	bgt _020A7CA0
	bge _020A7D98
	cmp r6, #6
	bgt _020A7E24
	cmp r6, #1
	blt _020A7E24
	beq _020A7CBC
	cmp r6, #3
	beq _020A7CF0
	cmp r6, #6
	beq _020A7D24
	b _020A7E24
_020A7CA0:
	cmp r6, #0x35
	bgt _020A7CB0
	beq _020A7DCC
	b _020A7E24
_020A7CB0:
	cmp r6, #0x36
	beq _020A7DF4
	b _020A7E24
_020A7CBC:
	ldrb lr, [r3, #1]
	ldrb r8, [r3, #2]
	ldrb r7, [r3, #3]
	ldrb r6, [r3, #4]
	orr r8, r8, lr, lsl #8
	mov r8, r8, lsl #0x10
	orr r6, r6, r7, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r8, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x1c]
	b _020A7E24
_020A7CF0:
	ldrb lr, [r3, #1]
	ldrb r8, [r3, #2]
	ldrb r7, [r3, #3]
	ldrb r6, [r3, #4]
	orr r8, r8, lr, lsl #8
	mov r8, r8, lsl #0x10
	orr r6, r6, r7, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r8, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x2c]
	b _020A7E24
_020A7D24:
	ldrb r6, [r3]
	cmp r6, #8
	strlo r0, [ip, #0x64]
	blo _020A7D64
	ldrb lr, [r3, #5]
	ldrb r8, [r3, #6]
	ldrb r7, [r3, #7]
	ldrb r6, [r3, #8]
	orr r8, r8, lr, lsl #8
	mov r8, r8, lsl #0x10
	orr r6, r6, r7, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r8, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x64]
_020A7D64:
	ldrb lr, [r3, #1]
	ldrb r8, [r3, #2]
	ldrb r7, [r3, #3]
	ldrb r6, [r3, #4]
	orr r8, r8, lr, lsl #8
	mov r8, r8, lsl #0x10
	orr r6, r6, r7, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r8, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x60]
	b _020A7E24
_020A7D98:
	ldrb lr, [r3, #1]
	ldrb r8, [r3, #2]
	ldrb r7, [r3, #3]
	ldrb r6, [r3, #4]
	orr r8, r8, lr, lsl #8
	mov r8, r8, lsl #0x10
	orr r6, r6, r7, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r8, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x4c]
	b _020A7E24
_020A7DCC:
	ldrb r6, [r3, #1]
	cmp r6, #2
	beq _020A7DE8
	cmp r6, #5
	moveq r5, sb
	streq r2, [ip, #0x50]
	b _020A7E24
_020A7DE8:
	mov r5, sl
	str r2, [ip, #0x34]
	b _020A7E24
_020A7DF4:
	ldrb r8, [r3, #1]
	ldrb r7, [r3, #2]
	ldrb r6, [r3, #3]
	ldrb lr, [r3, #4]
	orr r7, r7, r8, lsl #8
	mov r7, r7, lsl #0x10
	orr r6, lr, r6, lsl #8
	mov r6, r6, lsl #0x10
	mov r7, r7, lsr #0x10
	mov r6, r6, lsr #0x10
	orr r6, r6, r7, lsl #16
	str r6, [ip, #0x20]
_020A7E24:
	ldrb r6, [r3]
	add r6, r6, #1
	add r3, r3, r6
_020A7E30:
	cmp r3, r1
	bhs _020A7E44
	ldrb r6, [r3], #1
	cmp r6, #0xff
	bne _020A7C64
_020A7E44:
	ldr r0, [sp, #4]
	bl CPS_SocConsume
_020A7E4C:
	ldr r0, _020A7E90 ; =_021D4620
	ldr r0, [r0, #0x48]
	blx r0
	cmp r0, #0
	beq _020A7E80
	cmp r5, #0
	bne _020A7E80
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r4
	cmp r0, fp
	blt _020A7B6C
_020A7E80:
	mov r0, r5
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A7E8C: .word _021D4B08
_020A7E90: .word _021D4620
	arm_func_end dhcp_analyze_response

	arm_func_start dhcp_discover_server
dhcp_discover_server: ; 0x020A7E94
	stmdb sp!, {r3, r4, r5, lr}
	bl CPS_SocUse
	bl CPS_SocDatagramMode
	mov r1, #0x43
	sub r2, r1, #0x44
	mov r0, #0x44
	bl CPS_SocBind
	mov r5, #0
_020A7EB4:
	bl dhcp_send_discover
	mov r1, r5
	bl dhcp_analyze_response
	mov r4, r0
	cmp r4, #1
	beq _020A7ED8
	add r5, r5, #1
	cmp r5, #4
	blt _020A7EB4
_020A7ED8:
	bl CPS_SocRelease
	cmp r4, #1
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end dhcp_discover_server

	arm_func_start dhcp_request_server
dhcp_request_server: ; 0x020A7EEC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	mov r5, r0
	bl CPS_SocUse
	bl CPS_SocDatagramMode
	cmp r4, #1
	mov r0, #0x44
	bne _020A7F20
	ldr r1, _020A7FE4 ; =_021D4620
	ldr r2, [r1, #0x20]
	mov r1, #0x43
	bl CPS_SocBind
	b _020A7F2C
_020A7F20:
	mov r1, #0x43
	sub r2, r1, #0x44
	bl CPS_SocBind
_020A7F2C:
	mov r7, #0
_020A7F30:
	mov r0, r4
	bl dhcp_send_request
	mov r1, r7
	bl dhcp_analyze_response
	movs r6, r0
	bne _020A7F54
	add r7, r7, #1
	cmp r7, #4
	blt _020A7F30
_020A7F54:
	bl CPS_SocRelease
	cmp r6, #2
	bne _020A7F88
	ldr r1, _020A7FE4 ; =_021D4620
	mov r0, #1
	ldr r2, [r1, #0x4c]
	mov r2, r2, lsr #1
	str r2, [r5]
	ldr r2, [r1, #0x4c]
	add r2, r2, r2, lsl #1
	mov r2, r2, lsr #3
	str r2, [r1, #0x38]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A7F88:
	ldr r0, _020A7FE4 ; =_021D4620
	cmp r4, #1
	ldr r1, [r0, #0x38]
	mov r1, r1, lsr #1
	str r1, [r0, #0x38]
	str r1, [r5]
	beq _020A7FB0
	cmp r4, #2
	beq _020A7FD0
	b _020A7FDC
_020A7FB0:
	cmp r1, #0x3c
	bhs _020A7FDC
	mov r1, #1
	str r1, [r5]
	ldr r1, [r0, #0x4c]
	mov r1, r1, lsr #3
	str r1, [r0, #0x38]
	b _020A7FDC
_020A7FD0:
	cmp r1, #0x3c
	movlo r0, #1
	strlo r0, [r5]
_020A7FDC:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A7FE4: .word _021D4620
	arm_func_end dhcp_request_server

	arm_func_start dhcp_release_server
dhcp_release_server: ; 0x020A7FE8
	stmdb sp!, {r4, lr}
	bl CPS_SocUse
	bl CPS_SocDatagramMode
	ldr r1, _020A804C ; =_021D4620
	mov r0, #0x44
	ldr r2, [r1, #0x20]
	mov r1, #0x43
	bl CPS_SocBind
	ldr r4, _020A8050 ; =_021D4B76
	mov r1, #7
	mov r0, r4
	mov r2, #0
	bl dhcp_setcommon
	mov r1, #0xff
	add r2, r0, #1
	strb r1, [r0]
	mov r0, #0
	mov r1, #0x12c
	sub r3, r2, r4
	bl pad_mem
	sub r1, r0, r4
	mov r0, r4
	bl CPS_SocWrite
	bl CPS_SocRelease
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A804C: .word _021D4620
_020A8050: .word _021D4B76
	arm_func_end dhcp_release_server

	arm_func_start dns_skipname
dns_skipname: ; 0x020A8054
	ldrb r2, [r0], #1
	cmp r2, #0
	bxeq lr
_020A8060:
	and r1, r2, #0xc0
	cmp r1, #0xc0
	addeq r0, r0, #1
	bxeq lr
	add r0, r0, r2
	ldrb r2, [r0], #1
	cmp r2, #0
	bne _020A8060
	bx lr
	arm_func_end dns_skipname

	arm_func_start resolve_common
resolve_common: ; 0x020A8084
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	mov sb, r2
	mov r2, sb, lsl #8
	mov sl, r1
	orr r1, r2, sb, asr #8
	strh r1, [sp, #4]
	cmp sl, #0x20
	mov r6, #0
	movne r1, #1
	strneh r1, [sp, #6]
	ldreq r1, _020A8324 ; =0x00001001
	strh r6, [sp, #0xa]
	streqh r1, [sp, #6]
	mov r1, #0x100
	strh r1, [sp, #8]
	add r1, sp, #0x10
	strh r6, [sp, #0xc]
	strh r6, [sp, #0xe]
	str r6, [sp]
	ldrb r7, [r0], #1
	mov fp, r3
	ldr r8, [sp, #0x68]
	add r2, r1, #1
	cmp r7, #0
	beq _020A814C
	mov r4, r6
	add r5, sp, #4
	mov r3, r6
_020A80F8:
	cmp r7, #0x2e
	beq _020A8128
	sub r6, r2, r5
	cmp r6, #0x3c
	addge sp, sp, #0x40
	mvnge r0, #0
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r6, r4, #1
	mov r4, r6
	str r6, [sp]
	strb r7, [r2], #1
	b _020A8140
_020A8128:
	strb r6, [r1]
	mov r1, r2
	mov r4, r3
	mov r6, r3
	str r3, [sp]
	add r2, r2, #1
_020A8140:
	ldrb r7, [r0], #1
	cmp r7, #0
	bne _020A80F8
_020A814C:
	ldr r0, [sp]
	mov r3, #0
	strb r0, [r1]
	strb r3, [r2]
	mov r0, sl, lsr #8
	strb r0, [r2, #1]
	strb sl, [r2, #2]
	strb r3, [r2, #3]
	mov r3, #1
	add r0, sp, #4
	add r1, r2, #5
	sub r1, r1, r0
	strb r3, [r2, #4]
	bl CPS_SocWrite
	mov r4, #0
	bl OS_GetTick
	mov r5, r0, lsr #0x10
	orr r5, r5, r1, lsl #16
	b _020A82E4
_020A8198:
	bl CPS_SocGetLength
	cmp r0, #0
	bne _020A81AC
	bl OS_YieldThread__
	b _020A82E4
_020A81AC:
	add r0, sp, #0
	bl CPS_SocRead
	ldr r1, [sp]
	cmp r1, #0xc
	bls _020A82DC
	ldrh r3, [r0]
	mov r2, r3, lsl #8
	orr r2, r2, r3, asr #8
	mov r2, r2, lsl #0x10
	cmp sb, r2, lsr #16
	bne _020A82DC
	ldrb r2, [r0, #3]
	and r2, r2, #0xf
	cmp r2, #3
	mvneq r4, #0
	beq _020A82DC
	cmp r2, #0
	bne _020A82DC
	ldrb r3, [r0, #4]
	ldrb r2, [r0, #5]
	add r6, r0, r1
	add r0, r0, #0xc
	orr r1, r2, r3, lsl #8
	mov r1, r1, lsl #0x10
	movs r1, r1, lsr #0x10
	sub r7, r1, #1
	beq _020A822C
_020A8218:
	bl dns_skipname
	cmp r7, #0
	add r0, r0, #4
	sub r7, r7, #1
	bne _020A8218
_020A822C:
	cmp r0, r6
	bhs _020A82DC
_020A8234:
	bl dns_skipname
	ldrb r7, [r0, #8]
	ldrb r1, [r0, #9]
	ldrb r3, [r0]
	ldrb r2, [r0, #1]
	orr r1, r1, r7, lsl #8
	mov r1, r1, lsl #0x10
	orr r2, r2, r3, lsl #8
	mov r2, r2, lsl #0x10
	cmp sl, r2, lsr #16
	mov r2, r1, lsr #0x10
	bne _020A82CC
	cmp sl, #0xc
	beq _020A82AC
	add r4, r0, #8
	add r0, r0, #6
	add r6, r4, r2
	add r1, r0, r2
	ldrb r3, [r0, r2]
	ldrb r0, [r1, #1]
	ldrb r2, [r4, r2]
	ldrb r1, [r6, #1]
	orr r0, r0, r3, lsl #8
	mov r0, r0, lsl #0x10
	orr r1, r1, r2, lsl #8
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r0, r1, lsr #0x10
	orr r4, r0, r2, lsl #16
	b _020A82DC
_020A82AC:
	cmp r2, r8
	movhi r4, #2
	bhi _020A82DC
	mov r1, fp
	add r0, r0, #0xa
	bl MI_CpuCopy8
	mov r4, #1
	b _020A82DC
_020A82CC:
	add r1, r2, #0xa
	add r0, r0, r1
	cmp r0, r6
	blo _020A8234
_020A82DC:
	ldr r0, [sp]
	bl CPS_SocConsume
_020A82E4:
	ldr r0, _020A8328 ; =_021D4620
	ldr r0, [r0, #0x48]
	blx r0
	cmp r0, #0
	beq _020A8318
	cmp r4, #0
	bne _020A8318
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	sub r0, r0, r5
	cmp r0, #0xf
	blt _020A8198
_020A8318:
	mov r0, r4
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A8324: .word 0x00001001
_020A8328: .word _021D4620
	arm_func_end resolve_common

	arm_func_start strtol10
strtol10: ; 0x020A832C
	str r0, [r1]
	mov ip, #0
	mov r2, #0xa
_020A8338:
	ldrb r3, [r0]
	sub r3, r3, #0x30
	and r3, r3, #0xff
	cmp r3, #9
	mlals ip, r2, ip, r3
	addls r0, r0, #1
	strls r0, [r1]
	bls _020A8338
	mov r0, ip
	bx lr
	arm_func_end strtol10

	arm_func_start rawip
rawip: ; 0x020A8360
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r5, #0
	mov r8, r0
	mov r7, r1
	mov r6, r5
	add r4, sp, #0
_020A837C:
	mov r0, r8
	mov r1, r4
	bl strtol10
	ldr r2, [sp]
	cmp r8, r2
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r8, r2
	cmp r0, #0xff
	bhi _020A83D0
	cmp r6, #3
	ldrneb r1, [r2]
	addne r8, r2, #1
	cmpne r1, #0x2e
	bne _020A83D0
	cmp r6, #3
	bne _020A83DC
	ldrb r1, [r8]
	cmp r1, #0
	beq _020A83DC
_020A83D0:
	add sp, sp, #4
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020A83DC:
	add r6, r6, #1
	cmp r6, #4
	orr r5, r0, r5, lsl #8
	blt _020A837C
	str r5, [r7]
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end rawip

	arm_func_start resolve_sub
resolve_sub: ; 0x020A83FC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	movs r5, r1
	mov r6, r0
	mov r4, r2
	addeq sp, sp, #4
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	bl CPS_SocUse
	bl CPS_SocDatagramMode
	mov r2, r5
	mov r0, #0
	mov r1, #0x35
	bl CPS_SocBind
	mov r0, r6
	mov r2, r4
	mov r3, #0
	str r3, [sp]
	mov r1, #1
	bl resolve_common
	mov r4, r0
	bl CPS_SocRelease
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end resolve_sub

	arm_func_start CPS_Resolve
CPS_Resolve: ; 0x020A8460
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r2, _020A8590 ; =_021D4620
	mov r6, #0
	ldr r5, [r2, #0x70]
	ldr r3, [r2, #0x68]
	ldr r1, [r2, #0x6c]
	umull r8, r7, r5, r3
	ldr sb, [r2, #0x78]
	mla r7, r5, r1, r7
	ldr r4, [r2, #0x74]
	adds fp, sb, r8
	mla r7, r4, r3, r7
	ldr r8, [r2, #0x7c]
	umull r3, r1, r5, fp
	adc sl, r8, r7
	mla r1, r5, sl, r1
	str fp, [r2, #0x68]
	mov r7, r6, lsl #0x10
	adds r5, sb, r3
	mla r1, r4, fp, r1
	str sl, [r2, #0x6c]
	orr r7, r7, sl, lsr #16
	adc r4, r8, r1
	mov r3, r6, lsl #0x10
	str r5, [r2, #0x68]
	orr r3, r3, r4, lsr #16
	add r1, sp, #8
	mov sl, r0
	strh r7, [sp, #2]
	str r4, [r2, #0x6c]
	strh r3, [sp, #4]
	bl rawip
	cmp r0, #0
	ldrne r0, [sp, #8]
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #1
	mov fp, r6
	ldr r7, _020A8594 ; =_021D4680
	strb r0, [sp]
	strb r0, [sp, #1]
	add r6, sp, #2
	mov r5, fp
	mvn r4, #0
_020A8514:
	mov r8, #0
	add sb, sp, #0
_020A851C:
	ldrb r0, [sb]
	cmp r0, #0
	beq _020A8554
	mov r0, r8, lsl #1
	ldrh r2, [r6, r0]
	ldr r1, [r7, r8, lsl #2]
	mov r0, sl
	bl resolve_sub
	cmp r0, #0
	str r0, [sp, #8]
	cmpne r0, r4
	bne _020A8570
	cmp r0, r4
	streqb r5, [sb]
_020A8554:
	add r8, r8, #1
	cmp r8, #2
	add sb, sb, #1
	blt _020A851C
	add fp, fp, #1
	cmp fp, #3
	blt _020A8514
_020A8570:
	ldr r1, [sp, #8]
	mvn r0, #0
	cmp r1, r0
	moveq r0, #0
	streq r0, [sp, #8]
	ldr r0, [sp, #8]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A8590: .word _021D4620
_020A8594: .word _021D4680
	arm_func_end CPS_Resolve

	; NitroWiFi: libssl.a

	arm_func_start find_session_from_id
find_session_from_id: ; 0x020A8598
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	bl OS_DisableInterrupts
	mov r4, #0
	ldr r6, _020A8628 ; =_021D5E68
	mov r5, r0
	strb r4, [r7, #0x30]
	mov r8, #0x20
_020A85B8:
	ldrb r0, [r6, #0x5a]
	cmp r0, #0
	beq _020A860C
	ldr r0, [r6, #0x54]
	cmp r0, #0
	ldreqh r0, [r6, #0x58]
	cmpeq r0, #0
	bne _020A860C
	mov r0, r6
	mov r2, r8
	add r1, r7, #0x74
	bl memcmp
	cmp r0, #0
	bne _020A860C
	mov r1, r7
	add r0, r6, #0x20
	mov r2, #0x30
	bl MI_CpuCopy8
	mov r0, #1
	strb r0, [r7, #0x30]
	b _020A861C
_020A860C:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #0x5c
	blt _020A85B8
_020A861C:
	mov r0, r5
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A8628: .word _021D5E68
	arm_func_end find_session_from_id

	arm_func_start find_session_from_IP
find_session_from_IP: ; 0x020A862C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	bl OS_DisableInterrupts
	mov r1, #0
	ldr r5, _020A86C8 ; =_021D5E68
	mov r4, r0
	strb r1, [r8, #0x30]
_020A8650:
	ldrb r0, [r5, #0x5a]
	cmp r0, #0
	beq _020A86AC
	ldr r0, [r5, #0x54]
	cmp r0, r7
	ldreqh r0, [r5, #0x58]
	cmpeq r0, r6
	bne _020A86AC
	mov r0, r5
	add r1, r8, #0x74
	mov r2, #0x20
	bl MI_CpuCopy8
	mov r1, r8
	add r0, r5, #0x20
	mov r2, #0x30
	bl MI_CpuCopy8
	bl OS_GetTick
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	str r0, [r5, #0x50]
	mov r0, #1
	strb r0, [r8, #0x30]
	b _020A86BC
_020A86AC:
	add r1, r1, #1
	cmp r1, #4
	add r5, r5, #0x5c
	blt _020A8650
_020A86BC:
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A86C8: .word _021D5E68
	arm_func_end find_session_from_IP

	arm_func_start cache_session
cache_session: ; 0x020A86CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	bl OS_DisableInterrupts
	mov r4, r0
	bl OS_GetTick
	ldr sb, _020A87B4 ; =_021D5E68
	mov r5, r0, lsr #0x10
	mov r2, #0
	mov r0, r2
	mov r3, sb
	orr r5, r5, r1, lsl #16
	mvn ip, #0
_020A8704:
	ldrb lr, [r3, #0x5a]
	cmp lr, #0
	cmpne r7, #0
	beq _020A8738
	ldr r1, [r3, #0x54]
	cmp r7, r1
	bne _020A8738
	cmp r6, #0
	beq _020A8738
	ldrh r1, [r3, #0x58]
	cmp r6, r1
	moveq sb, r3
	beq _020A8774
_020A8738:
	cmp r2, ip
	beq _020A8764
	cmp lr, #0
	moveq r2, ip
	moveq sb, r3
	beq _020A8764
	ldr r1, [r3, #0x50]
	sub r1, r5, r1
	cmp r1, r2
	movhi r2, r1
	movhi sb, r3
_020A8764:
	add r0, r0, #1
	cmp r0, #4
	add r3, r3, #0x5c
	blt _020A8704
_020A8774:
	mov r1, sb
	add r0, r8, #0x74
	mov r2, #0x20
	bl MI_CpuCopy8
	mov r0, r8
	add r1, sb, #0x20
	mov r2, #0x30
	bl MI_CpuCopy8
	str r5, [sb, #0x50]
	mov r0, #1
	strb r0, [sb, #0x5a]
	str r7, [sb, #0x54]
	mov r0, r4
	strh r6, [sb, #0x58]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020A87B4: .word _021D5E68
	arm_func_end cache_session

	arm_func_start purge_session
purge_session: ; 0x020A87B8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	bl OS_DisableInterrupts
	ldr r7, _020A881C ; =_021D5E68
	mov r6, r0
	mov r5, #0
	mov r4, #0x20
_020A87D4:
	ldrb r0, [r7, #0x5a]
	cmp r0, #0
	beq _020A8800
	mov r0, r7
	mov r2, r4
	add r1, r8, #0x74
	bl memcmp
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r7, #0x5a]
	beq _020A8810
_020A8800:
	add r5, r5, #1
	cmp r5, #4
	add r7, r7, #0x5c
	blt _020A87D4
_020A8810:
	mov r0, r6
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A881C: .word _021D5E68
	arm_func_end purge_session

	arm_func_start date2sec
date2sec: ; 0x020A8820
	stmdb sp!, {lr}
	sub sp, sp, #0x1c
	add r0, sp, #0xc
	bl RTC_GetDate
	add r0, sp, #0
	bl RTC_GetTime
	add r0, sp, #0xc
	add r1, sp, #0
	bl RTC_ConvertDateTimeToSecond
	ldr r1, _020A8854 ; =0x386D4380
	add r0, r0, r1
	add sp, sp, #0x1c
	ldmia sp!, {pc}
	.align 2, 0
_020A8854: .word 0x386D4380
	arm_func_end date2sec

	arm_func_start CPS_GetSslHandshakePriority
CPS_GetSslHandshakePriority: ; 0x020A8858
	ldr r0, _020A8864 ; =_021106B0
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_020A8864: .word _021106B0
	arm_func_end CPS_GetSslHandshakePriority

	arm_func_start CPS_SetSslHandshakePriority
CPS_SetSslHandshakePriority: ; 0x020A8868
	ldr r1, _020A8874 ; =_021106B0
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_020A8874: .word _021106B0
	arm_func_end CPS_SetSslHandshakePriority

	arm_func_start enter_computebound
enter_computebound: ; 0x020A8878
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020A88BC ; =_021106B0
	ldr r0, [r0, #4]
	cmp r0, #0x20
	mvnhs r0, #0
	ldmhsia sp!, {r3, r4, r5, pc}
	ldr r0, _020A88C0 ; =OSi_ThreadInfo
	ldr r5, [r0, #4]
	mov r0, r5
	bl OS_GetThreadPriority
	ldr r1, _020A88BC ; =_021106B0
	mov r4, r0
	ldr r1, [r1, #4]
	mov r0, r5
	bl OS_SetThreadPriority
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A88BC: .word _021106B0
_020A88C0: .word OSi_ThreadInfo
	arm_func_end enter_computebound

	arm_func_start exit_computebound
exit_computebound: ; 0x020A88C4
	stmdb sp!, {r3, lr}
	mov r1, r0
	cmp r1, #0x20
	ldmhsia sp!, {r3, pc}
	ldr r0, _020A88E4 ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	bl OS_SetThreadPriority
	ldmia sp!, {r3, pc}
	.align 2, 0
_020A88E4: .word OSi_ThreadInfo
	arm_func_end exit_computebound

	arm_func_start CPS_SetRootCa
CPS_SetRootCa: ; 0x020A88E8
	ldr r2, _020A890C ; =OSi_ThreadInfo
	ldr r2, [r2, #4]
	ldr r2, [r2, #0xa4]
	cmp r2, #0
	ldrne r2, [r2, #0xc]
	cmpne r2, #0
	strne r0, [r2, #0x814]
	strne r1, [r2, #0x818]
	bx lr
	.align 2, 0
_020A890C: .word OSi_ThreadInfo
	arm_func_end CPS_SetRootCa

	arm_func_start get_rootCA
get_rootCA: ; 0x020A8910
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r6, [r0, #0x818]
	mov r8, r1
	cmp r6, #0
	mov r4, #0
	ble _020A8954
	ldr r5, [r0, #0x814]
_020A892C:
	ldr r7, [r5, r4, lsl #2]
	mov r1, r8
	ldr r0, [r7]
	bl strcmp
	cmp r0, #0
	moveq r0, r7
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r4, r4, #1
	cmp r4, r6
	blt _020A892C
_020A8954:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end get_rootCA

	arm_func_start cert_item_len
cert_item_len: ; 0x020A895C
	ldr r1, [r0]
	ldrb r2, [r1]
	add r3, r1, #1
	tst r2, #0x80
	beq _020A89A0
	ands r1, r2, #0x7f
	sub ip, r1, #1
	mov r2, #0
	beq _020A89A0
_020A8980:
	tst r2, #0xff000000
	mvnne r0, #0
	bxne lr
	ldrb r1, [r3], #1
	cmp ip, #0
	sub ip, ip, #1
	add r2, r1, r2, lsl #8
	bne _020A8980
_020A89A0:
	str r3, [r0]
	mov r0, r2
	bx lr
	arm_func_end cert_item_len

	arm_func_start make_dn
make_dn: ; 0x020A89AC
	ldrsb r3, [r0]
	mov ip, r0
	cmp r3, #0
	beq _020A89F4
_020A89BC:
	ldrsb r3, [r0, #1]!
	cmp r3, #0
	bne _020A89BC
	sub r3, r0, ip
	cmp r3, #0xff
	bxge lr
	mov r3, #0x2c
	strb r3, [r0]
	mov r3, #0x20
	strb r3, [r0, #1]
	add r0, r0, #2
	b _020A89F4
_020A89EC:
	ldrsb r3, [r1], #1
	strb r3, [r0], #1
_020A89F4:
	cmp r2, #0
	sub r2, r2, #1
	beq _020A8A0C
	sub r3, r0, ip
	cmp r3, #0xff
	blt _020A89EC
_020A8A0C:
	mov r1, #0
	strb r1, [r0]
	bx lr
	arm_func_end make_dn

	arm_func_start parse_time
parse_time: ; 0x020A8A18
	stmdb sp!, {r4, lr}
	ldrb ip, [r0, #1]
	ldrb r3, [r0], #2
	mov r2, #0xa
	cmp r1, #0x17
	mla r1, r3, r2, ip
	sub lr, r1, #0x210
	bne _020A8A4C
	cmp lr, #0x32
	addlo r4, lr, #0x7d0
	addhs r1, lr, #0x36c
	addhs r4, r1, #0x400
	b _020A8A64
_020A8A4C:
	ldrb ip, [r0, #1]
	ldrb r3, [r0], #2
	mov r1, #0x64
	mla r2, r3, r2, ip
	sub r2, r2, #0x210
	mla r4, lr, r1, r2
_020A8A64:
	ldrb ip, [r0, #1]
	ldrb r3, [r0]
	mov r1, #0xa
	ldrb r2, [r0, #3]
	ldrb r0, [r0, #2]
	mla ip, r3, r1, ip
	mla r1, r0, r1, r2
	sub r0, ip, #0x210
	mov r0, r0, lsl #8
	add r2, r0, r4, lsl #16
	sub r0, r1, #0x210
	add r0, r2, r0
	ldmia sp!, {r4, pc}
	arm_func_end parse_time

	arm_func_start cert_item
cert_item: ; 0x020A8A98
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov fp, r1
	ldr r1, [fp]
	mov sb, r0
	add r0, r1, #1
	str r0, [sp, #4]
	add r0, sp, #4
	mov r7, r2
	mov r6, r3
	ldr r8, [sp, #0x30]
	ldrb r5, [r1]
	bl cert_item_len
	movs r4, r0
	bmi _020A8ADC
	cmp r4, #0x7d0
	ble _020A8AE8
_020A8ADC:
	add sp, sp, #8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020A8AE8:
	and r1, r5, #0x1f
	cmp r1, #0x18
	addls pc, pc, r1, lsl #2
	b _020A8F0C
_020A8AF8: ; jump table
	b _020A8F0C ; case 0
	b _020A8F0C ; case 1
	b _020A8B5C ; case 2
	b _020A8C54 ; case 3
	b _020A8F0C ; case 4
	b _020A8F0C ; case 5
	b _020A8CD4 ; case 6
	b _020A8F0C ; case 7
	b _020A8F0C ; case 8
	b _020A8F0C ; case 9
	b _020A8F0C ; case 10
	b _020A8F0C ; case 11
	b _020A8D6C ; case 12
	b _020A8F0C ; case 13
	b _020A8F0C ; case 14
	b _020A8F0C ; case 15
	b _020A8E3C ; case 16
	b _020A8EBC ; case 17
	b _020A8F0C ; case 18
	b _020A8D6C ; case 19
	b _020A8D6C ; case 20
	b _020A8F0C ; case 21
	b _020A8D6C ; case 22
	b _020A8DEC ; case 23
	b _020A8DEC ; case 24
_020A8B5C:
	ldrb r0, [sb, #0x5ad]
	cmp r0, #0
	beq _020A8C44
	cmp r6, #0
	bne _020A8BDC
	ldr r0, [sp, #4]
	ldrb r1, [r0]
	cmp r1, #0
	bne _020A8B98
_020A8B80:
	add r0, r0, #1
	str r0, [sp, #4]
	ldrb r1, [r0]
	sub r4, r4, #1
	cmp r1, #0
	beq _020A8B80
_020A8B98:
	cmp r8, #0
	beq _020A8BAC
	cmp r8, #2
	beq _020A8BCC
	b _020A8C44
_020A8BAC:
	cmp r4, #0x100
	bgt _020A8C44
	add r1, sb, #0x94
	mov r2, r4
	add r1, r1, #0x400
	bl MI_CpuCopy8
	str r4, [sb, #0x594]
	b _020A8C44
_020A8BCC:
	str r4, [sb, #0x484]
	ldr r0, [sp, #4]
	str r0, [sb, #0x488]
	b _020A8C44
_020A8BDC:
	cmp r6, #1
	bne _020A8C44
	ldr r0, [sp, #4]
	ldrb r1, [r0]
	cmp r1, #0
	bne _020A8C0C
_020A8BF4:
	add r0, r0, #1
	str r0, [sp, #4]
	ldrb r1, [r0]
	sub r4, r4, #1
	cmp r1, #0
	beq _020A8BF4
_020A8C0C:
	cmp r8, #0
	beq _020A8C28
	cmp r8, #2
	streq r4, [sb, #0x48c]
	ldreq r0, [sp, #4]
	streq r0, [sb, #0x490]
	b _020A8C44
_020A8C28:
	cmp r4, #8
	bgt _020A8C44
	add r1, sb, #0x198
	mov r2, r4
	add r1, r1, #0x400
	bl MI_CpuCopy8
	str r4, [sb, #0x5a0]
_020A8C44:
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
	b _020A8F70
_020A8C54:
	cmp r7, #1
	bne _020A8C78
	cmp r8, #2
	beq _020A8C78
	ldr r1, [sp, #4]
	sub r0, r4, #1
	add r1, r1, #1
	str r1, [sb, #0x5a4]
	str r0, [sb, #0x5a8]
_020A8C78:
	ldrb r0, [sb, #0x5ad]
	cmp r0, #0
	beq _020A8CC4
	ldr r0, [sp, #4]
	add r1, sp, #4
	add r0, r0, #1
	str r0, [sp, #4]
	mov r0, sb
	mov r2, r7
	mov r3, #0
	str r8, [sp]
	bl cert_item
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	strb r0, [sb, #0x5ad]
	b _020A8F70
_020A8CC4:
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
	b _020A8F70
_020A8CD4:
	ldr r6, [sp, #4]
	ldr sl, _020A8F84 ; =_021106B8
	mov r5, #0
_020A8CE0:
	ldr r7, [sl, r5, lsl #2]
	mov r0, r7
	bl strlen
	mov r2, r0
	mov r0, r6
	mov r1, r7
	bl memcmp
	cmp r0, #0
	bne _020A8D50
	cmp r5, #5
	addls pc, pc, r5, lsl #2
	b _020A8D5C
_020A8D10: ; jump table
	b _020A8D5C ; case 0
	b _020A8D28 ; case 1
	b _020A8D28 ; case 2
	b _020A8D38 ; case 3
	b _020A8D38 ; case 4
	b _020A8D44 ; case 5
_020A8D28:
	cmp r8, #0
	streq r5, [sb, #0x45c]
	strb r5, [sb, #0x5ad]
	b _020A8D5C
_020A8D38:
	cmp r8, #2
	strne r5, [sb, #0x458]
	b _020A8D5C
_020A8D44:
	cmp r8, #2
	strneb r5, [sb, #0x5ae]
	b _020A8D5C
_020A8D50:
	add r5, r5, #1
	cmp r5, #6
	blt _020A8CE0
_020A8D5C:
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
	b _020A8F70
_020A8D6C:
	cmp r8, #2
	beq _020A8DD4
	ldrb r0, [sb, #0x5ac]
	cmp r0, #0
	beq _020A8DC4
	ldr r1, [sp, #4]
	mov r2, r4
	add r0, sb, #0x6b0
	bl make_dn
	ldrb r0, [sb, #0x5ae]
	cmp r0, #5
	bne _020A8DD4
	cmp r4, #0x4f
	bgt _020A8DD4
	ldr r0, [sp, #4]
	mov r2, r4
	add r1, sb, #0x7b0
	bl MI_CpuCopy8
	add r0, sb, r4
	mov r1, #0
	strb r1, [r0, #0x7b0]
	b _020A8DD4
_020A8DC4:
	ldr r1, [sp, #4]
	mov r2, r4
	add r0, sb, #0x5b0
	bl make_dn
_020A8DD4:
	mov r0, #0
	strb r0, [sb, #0x5ae]
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
	b _020A8F70
_020A8DEC:
	cmp r8, #2
	beq _020A8E24
	ldr r0, [sp, #4]
	bl parse_time
	cmp r6, #0
	ldr r1, [sb, #0x80c]
	bne _020A8E18
	cmp r1, r0
	movhs r0, #1
	strhsb r0, [sb, #0x5af]
	b _020A8E24
_020A8E18:
	cmp r1, r0
	movhi r0, #0
	strhib r0, [sb, #0x5af]
_020A8E24:
	ldr r1, [sp, #4]
	mov r0, #1
	add r1, r1, r4
	str r1, [sp, #4]
	strb r0, [sb, #0x5ac]
	b _020A8F70
_020A8E3C:
	cmp r7, #0
	cmpeq r6, #0
	bne _020A8E54
	cmp r8, #2
	ldrne r0, [sp, #4]
	strne r0, [sb, #0x460]
_020A8E54:
	ldr r0, [sp, #4]
	mov r5, #0
	add sl, r0, r4
	cmp r0, sl
	bhs _020A8EA4
	add r4, sp, #4
_020A8E6C:
	mov r0, sb
	mov r1, r4
	mov r3, r5
	add r2, r7, #1
	str r8, [sp]
	bl cert_item
	cmp r0, #0
	add r5, r5, #1
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #4]
	cmp r0, sl
	blo _020A8E6C
_020A8EA4:
	cmp r7, #1
	cmpeq r6, #0
	bne _020A8F70
	cmp r8, #2
	strne r0, [sb, #0x464]
	b _020A8F70
_020A8EBC:
	ldr r0, [sp, #4]
	add r6, r0, r4
	cmp r0, r6
	bhs _020A8F70
	add r5, sp, #4
	mov r4, #0
_020A8ED4:
	mov r0, sb
	mov r1, r5
	mov r3, r4
	add r2, r7, #1
	str r8, [sp]
	bl cert_item
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #4]
	cmp r0, r6
	blo _020A8ED4
	b _020A8F70
_020A8F0C:
	cmp r5, #0xa0
	bne _020A8F64
	ldr r0, [sp, #4]
	add r6, r0, r4
	cmp r0, r6
	bhs _020A8F70
	add r5, sp, #4
	mov r4, #0
_020A8F2C:
	mov r0, sb
	mov r1, r5
	mov r3, r4
	add r2, r7, #1
	str r8, [sp]
	bl cert_item
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #4]
	cmp r0, r6
	blo _020A8F2C
	b _020A8F70
_020A8F64:
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
_020A8F70:
	ldr r1, [sp, #4]
	mov r0, #0
	str r1, [fp]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A8F84: .word _021106B8
	arm_func_end cert_item

	arm_func_start validate_signature
validate_signature: ; 0x020A8F88
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r8, r0
	ldr r0, [r8, #0x5a4]
	mov r7, r1
	cmp r0, #0
	ldrne r0, [r8, #0x5a8]
	cmpne r0, #0
	ldrne r0, [r7, #0x10]
	cmpne r0, #0
	ldrne r0, [r7, #0xc]
	cmpne r0, #0
	ldrne r0, [r7, #8]
	cmpne r0, #0
	ldrne r0, [r7, #4]
	cmpne r0, #0
	addeq sp, sp, #4
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, r0, lsl #1
	ldr r1, _020A9128 ; =_021D4634
	add r0, r0, r0, lsr #31
	mov r5, r0, asr #1
	ldr r1, [r1]
	mov r0, r5, lsl #3
	blx r1
	movs r4, r0
	addeq sp, sp, #4
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	add r6, r4, r5, lsl #1
	add sb, r6, r5, lsl #1
	ldr r1, [r8, #0x5a4]
	ldr r2, [r8, #0x5a8]
	mov r0, r6
	mov r3, r5
	add sl, sb, r5, lsl #1
	bl CPSi_big_from_char
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0xc]
	mov r0, sb
	mov r3, r5
	bl CPSi_big_from_char
	ldr r1, [r7, #8]
	ldr r2, [r7, #4]
	mov r0, sl
	mov r3, r5
	bl CPSi_big_from_char
	bl enter_computebound
	mov r2, sb
	mov sb, r0
	mov r0, r4
	mov r1, r6
	mov r3, r5
	str sl, [sp]
	bl CPSi_big_power
	mov r0, sb
	bl exit_computebound
	ldr r2, [r7, #4]
	mov r0, r6
	mov r1, r4
	mov r3, r5
	bl CPSi_char_from_big
	ldrb r0, [r4, r5, lsl #1]
	mov r5, #0
	cmp r0, #0
	ldreqb r0, [r6, #1]
	cmpeq r0, #1
	movne r5, #2
	bne _020A910C
	ldr r3, [r7, #4]
	mov r2, #2
	cmp r3, #2
	ble _020A90C8
_020A90B0:
	ldrb r0, [r6, r2]
	cmp r0, #0xff
	bne _020A90C8
	add r2, r2, #1
	cmp r2, r3
	blt _020A90B0
_020A90C8:
	add r1, r2, #1
	cmp r1, r3
	bge _020A9108
	ldrb r0, [r6, r2]
	cmp r0, #0
	ldreqb r0, [r6, r1]
	cmpeq r0, #0x30
	bne _020A9108
	ldr r2, [r8, #0x47c]
	add r0, r8, #0x68
	add r1, r6, r3
	add r0, r0, #0x400
	sub r1, r1, r2
	bl memcmp
	cmp r0, #0
	beq _020A910C
_020A9108:
	mov r5, #2
_020A910C:
	ldr r1, _020A912C ; =_021D4660
	mov r0, r4
	ldr r1, [r1]
	blx r1
	mov r0, r5
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020A9128: .word _021D4634
_020A912C: .word _021D4660
	arm_func_end validate_signature

	arm_func_start auth_cert
auth_cert: ; 0x020A9130
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #0x5af]
	ldr r1, [r5, #0x45c]
	cmp r0, #0
	movne r4, #0
	moveq r4, #0x8000
	mvn r0, #0
	cmp r1, r0
	orreq r0, r4, #4
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x458]
	cmp r0, #3
	beq _020A9174
	cmp r0, #4
	beq _020A91AC
	b _020A91E4
_020A9174:
	add r0, r5, #0x3fc
	bl CPSi_md5_init
	ldr r1, [r5, #0x460]
	ldr r2, [r5, #0x464]
	add r0, r5, #0x3fc
	sub r2, r2, r1
	bl CPSi_md5_calc
	add r1, r5, #0x68
	add r0, r5, #0x3fc
	add r1, r1, #0x400
	bl CPSi_md5_result
	mov r0, #0x10
	str r0, [r5, #0x47c]
	b _020A91EC
_020A91AC:
	add r0, r5, #0x348
	bl CPSi_sha1_init
	ldr r1, [r5, #0x460]
	ldr r2, [r5, #0x464]
	add r0, r5, #0x348
	sub r2, r2, r1
	bl CPSi_sha1_calc
	add r1, r5, #0x68
	add r0, r5, #0x348
	add r1, r1, #0x400
	bl CPSi_sha1_result
	mov r0, #0x14
	str r0, [r5, #0x47c]
	b _020A91EC
_020A91E4:
	orr r0, r4, #3
	ldmia sp!, {r3, r4, r5, pc}
_020A91EC:
	mov r0, r5
	add r1, r5, #0x5b0
	bl get_rootCA
	movs r1, r0
	orreq r0, r4, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl validate_signature
	orr r0, r4, r0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end auth_cert

	arm_func_start chars_till_end
chars_till_end: ; 0x020A9214
	mov r2, r0
	b _020A9220
_020A921C:
	add r0, r0, #1
_020A9220:
	ldrsb r1, [r0]
	cmp r1, #0x2e
	cmpne r1, #0
	bne _020A921C
	sub r0, r0, r2
	bx lr
	arm_func_end chars_till_end

	arm_func_start compare_fqdn
compare_fqdn: ; 0x020A9238
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	b _020A9254
_020A9248:
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
_020A9254:
	ldrsb r0, [r5], #1
	ldrsb r1, [r6], #1
	cmp r1, r0
	beq _020A9248
	cmp r0, #0x2a
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	sub r6, r6, #1
	mov r0, r6
	bl chars_till_end
	mov r4, r0
	mov r0, r5
	bl chars_till_end
	cmp r0, r4
	movgt r0, #1
	ldmgtia sp!, {r4, r5, r6, pc}
	sub r0, r4, r0
	add r6, r6, r0
	b _020A9254
_020A92A0: ; 0x020A92A0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end compare_fqdn

	arm_func_start rcv_certificate
rcv_certificate: ; 0x020A92A4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	ldr r1, [sp, #0x44]
	mov sl, r0
	ldrb r4, [r1, #2]
	ldrb r3, [r1]
	ldrb r2, [r1, #1]
	add r0, r1, #3
	mvn r1, #0
	str r0, [sp, #0x44]
	add r2, r2, r3, lsl #8
	add r0, sp, #8
	str r1, [sl, #0x45c]
	add r8, r4, r2, lsl #8
	bl RTC_GetDate
	mov r6, #0
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	add r1, r1, #0x7d0
	mov r0, r0, lsl #8
	ldr r2, [sp, #0x10]
	add r0, r0, r1, lsl #16
	add r0, r2, r0
	str r0, [sl, #0x80c]
	strb r6, [sl, #0x6b0]
	str r6, [sl, #0x5a0]
	mov sb, r6
	str r6, [sl, #0x594]
	mov fp, #2
	mvn r5, #0
	mov r4, r6
_020A9324:
	ldr r1, [sp, #0x44]
	mov r0, sl
	ldrb r2, [r1, #2]
	ldrb ip, [r1]
	ldrb r3, [r1, #1]
	add r7, r1, #3
	add r1, sp, #0x44
	str r7, [sp, #0x44]
	str r5, [sl, #0x458]
	strb r4, [sl, #0x5ad]
	strb r4, [sl, #0x5ac]
	strb r4, [sl, #0x5af]
	strb r4, [sl, #0x6b0]
	strb r4, [sl, #0x5b0]
	strb r4, [sl, #0x7b0]
	add r3, r3, ip, lsl #8
	ldr r7, [sp, #0x44]
	add r3, r2, r3, lsl #8
	add r2, r3, #3
	str r7, [sl, #0x804]
	str r3, [sl, #0x808]
	sub r8, r8, r2
	mov r2, r4
	mov r3, r4
	str r6, [sp]
	bl cert_item
	cmp r0, #0
	bne _020A93AC
	ldr r0, [sl, #0x594]
	cmp r0, #0x33
	blo _020A93AC
	ldr r0, [sl, #0x5a0]
	cmp r0, #0
	bne _020A93C4
_020A93AC:
	mov r0, #9
	add sp, sp, #0x18
	strb r0, [sl, #0x455]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020A93C4:
	mov r0, sl
	bl auth_cert
	mov r7, r0
	cmp sb, #0
	bne _020A93F4
	ldr r0, [sl, #0x800]
	cmp r0, #0
	beq _020A93F4
	add r1, sl, #0x7b0
	bl compare_fqdn
	cmp r0, #0
	orrne r7, r7, #0x4000
_020A93F4:
	and r6, r7, #0xff
	cmp r6, #1
	bne _020A9464
	cmp r8, #0
	beq _020A9464
	ldr r1, [sp, #0x44]
	mov r2, #0
	add r1, r1, #3
	str r1, [sp, #4]
	mov r1, #0
	strb r1, [sl, #0x5ad]
	mov r0, sl
	add r1, sp, #4
	mov r3, r2
	str fp, [sp]
	bl cert_item
	cmp r0, #0
	movne r0, #9
	addne sp, sp, #0x18
	strneb r0, [sl, #0x455]
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addne sp, sp, #0x10
	bxne lr
	mov r0, sl
	add r1, sl, #0x480
	bl validate_signature
	bic r1, r7, #0xff
	orr r7, r1, r0
_020A9464:
	ldr r3, [sl, #0x810]
	cmp r3, #0
	beq _020A9484
	mov r0, r7
	mov r1, sl
	mov r2, sb
	blx r3
	mov r7, r0
_020A9484:
	cmp r6, #0
	add sb, sb, #1
	beq _020A94A4
	cmp r7, #0
	bne _020A94A4
	cmp r8, #0
	movne r6, #1
	bne _020A9324
_020A94A4:
	cmp r7, #0
	moveq r0, #3
	streqb r0, [sl, #0x455]
	movne r0, #9
	strneb r0, [sl, #0x455]
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end rcv_certificate

	arm_func_start rcv_server_hello
rcv_server_hello: ; 0x020A94C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	add r0, r5, #2
	add r1, r6, #0x54
	mov r2, #0x20
	bl MI_CpuCopy8
	ldrb r7, [r6, #0x30]
	ldrb r4, [r5, #0x22]
	add r5, r5, #0x23
	cmp r7, #0
	beq _020A9520
	cmp r4, #0x20
	bne _020A9520
	mov r1, r5
	add r0, r6, #0x74
	mov r2, #0x20
	bl memcmp
	cmp r0, #0
	moveq r0, #1
	streqb r0, [r6, #0x31]
	beq _020A955C
_020A9520:
	cmp r7, #0
	beq _020A9530
	mov r0, r6
	bl purge_session
_020A9530:
	cmp r4, #0
	moveq r0, #0
	beq _020A9550
	mov r0, r5
	add r1, r6, #0x74
	mov r2, #0x20
	bl MI_CpuCopy8
	mov r0, #1
_020A9550:
	strb r0, [r6, #0x30]
	mov r0, #0
	strb r0, [r6, #0x31]
_020A955C:
	add r0, r5, r4
	ldrb r2, [r5, r4]
	ldrb r1, [r0, #1]
	mov r0, #2
	add r1, r1, r2, lsl #8
	strh r1, [r6, #0x32]
	strb r0, [r6, #0x455]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end rcv_server_hello

	arm_func_start has_method
has_method: ; 0x020A957C
	stmdb sp!, {r4, lr}
	cmp r1, #0
	mov r4, #0
	ble _020A95C0
_020A958C:
	ldrb lr, [r0]
	ldrb ip, [r0, #1]
	cmp r2, #3
	add lr, ip, lr, lsl #8
	ldreqb ip, [r0, #2]
	addeq lr, ip, lr, lsl #8
	cmp lr, r3
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	add r4, r4, #1
	cmp r4, r1
	add r0, r0, r2
	blt _020A958C
_020A95C0:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end has_method

	arm_func_start select_method
select_method: ; 0x020A95C8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _020A9624 ; =_021106B0
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, #0
_020A95E0:
	mov r0, r5, lsl #1
	ldrh r3, [r4, r0]
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl has_method
	cmp r0, #0
	beq _020A9610
	ldr r0, _020A9624 ; =_021106B0
	mov r1, r5, lsl #1
	ldrh r0, [r0, r1]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020A9610:
	add r5, r5, #1
	cmp r5, #2
	blo _020A95E0
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020A9624: .word _021106B0
	arm_func_end select_method

	arm_func_start version_ok
version_ok: ; 0x020A9628
	cmp r0, #3
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end version_ok

	arm_func_start client_hello_v2
client_hello_v2: ; 0x020A9638
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	ldrb r0, [r6]
	ldrb r1, [r6, #1]
	bl version_ok
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r2, [r6, #2]
	ldrb r1, [r6, #3]
	ldr r3, _020A96FC ; =0x55555556
	add r0, r6, #8
	add r4, r1, r2, lsl #8
	smull r2, r1, r3, r4
	add r1, r1, r4, lsr #31
	mov r2, #3
	bl select_method
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	strh r0, [r7, #0x32]
	ldrb r5, [r6, #4]
	ldrb r3, [r6, #5]
	ldrb r2, [r6, #6]
	ldrb r0, [r6, #7]
	mov r1, #0
	add r3, r3, r5, lsl #8
	add r5, r0, r2, lsl #8
	add r0, r4, #8
	strb r1, [r7, #0x30]
	cmp r5, #0x20
	add r4, r0, r3
	blt _020A96D0
	add r0, r6, r4
	add r1, r7, #0x34
	mov r2, #0x20
	bl MI_CpuCopy8
	b _020A96F0
_020A96D0:
	add r0, r7, #0x34
	rsb r2, r5, #0x20
	bl MI_CpuFill8
	add r1, r7, #0x54
	mov r2, r5
	add r0, r6, r4
	sub r1, r1, r5
	bl MI_CpuCopy8
_020A96F0:
	mov r0, #1
	strb r0, [r7, #0x455]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020A96FC: .word 0x55555556
	arm_func_end client_hello_v2

	arm_func_start client_hello
client_hello: ; 0x020A9700
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r4, r0
	ldrb r0, [r6]
	ldrb r1, [r6, #1]
	bl version_ok
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r6, #2
	add r1, r4, #0x34
	mov r2, #0x20
	bl MI_CpuCopy8
	ldrb r5, [r6, #0x22]
	add r6, r6, #0x23
	cmp r5, #0x20
	movne r0, #0
	strneb r0, [r4, #0x30]
	bne _020A9760
	mov r0, r6
	add r1, r4, #0x74
	mov r2, #0x20
	bl MI_CpuCopy8
	mov r0, r4
	bl find_session_from_id
_020A9760:
	add r0, r6, r5
	ldrb r1, [r0, #1]
	ldrb r3, [r6, r5]
	add r0, r0, #2
	mov r2, #2
	add r1, r1, r3, lsl #8
	add r1, r1, r1, lsr #31
	mov r1, r1, asr #1
	bl select_method
	mov r0, r0, lsl #0x10
	movs r0, r0, lsr #0x10
	strh r0, [r4, #0x32]
	movne r0, #1
	strneb r0, [r4, #0x455]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end client_hello

	arm_func_start decrypt_premaster_secret
decrypt_premaster_secret: ; 0x020A979C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	movs sl, r2
	str r0, [sp, #8]
	ldrne r0, [sl]
	mov fp, r1
	cmpne r0, #0
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, r0, lsl #1
	add r0, r0, r0, lsr #31
	mov r0, r0, asr #1
	add r4, r0, #1
	mov r0, #0x14
	mul r0, r4, r0
	ldr r1, _020A99D4 ; =_021D4634
	ldr r1, [r1]
	blx r1
	movs r5, r0
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r6, r5, r4, lsl #1
	add r7, r6, r4, lsl #1
	add r1, r7, r4, lsl #1
	str r1, [sp, #0x10]
	add r1, r1, r4, lsl #1
	add r8, r1, r4, lsl #1
	str r1, [sp, #0xc]
	ldr r2, [sl]
	add sb, r8, r4, lsl #1
	mov r1, fp
	mov r3, r4
	add fp, sb, r4, lsl #1
	bl CPSi_big_from_char
	ldr r1, [sl, #0x1c]
	ldr r2, [sl, #0x18]
	mov r0, r6
	mov r3, r4
	bl CPSi_big_from_char
	ldr r1, [sl, #0xc]
	ldr r2, [sl, #8]
	mov r0, r8
	mov r3, r4
	bl CPSi_big_from_char
	bl enter_computebound
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	str r8, [sp]
	mov r1, r5
	mov r2, r6
	mov r3, r4
	bl CPSi_big_montpower
	ldr r1, [sl, #0x24]
	ldr r2, [sl, #0x20]
	mov r0, r6
	mov r3, r4
	bl CPSi_big_from_char
	ldr r1, [sl, #0x14]
	ldr r2, [sl, #0x10]
	mov r0, r8
	mov r3, r4
	bl CPSi_big_from_char
	ldr r0, [sp, #0xc]
	mov r1, r5
	mov r2, r6
	mov r3, r4
	str r8, [sp]
	bl CPSi_big_montpower
	ldr r0, [sp, #0x14]
	bl exit_computebound
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	mov r0, r5
	mov r3, r4
	bl CPSi_big_sub
	ldr r1, [sl, #0x2c]
	ldr r2, [sl, #0x28]
	mov r0, r6
	mov r3, r4
	bl CPSi_big_from_char
	mov r0, r7
	mov r1, r5
	mov r2, r6
	mov r3, r4
	bl CPSi_big_mult
	ldr r1, [sl, #0x14]
	ldr r2, [sl, #0x10]
	mov r0, r6
	mov r3, r4
	bl CPSi_big_from_char
	mov r0, r5
	mov r1, r7
	mov r2, r6
	mov r3, r4
	bl CPSi_big_mult
	ldr r2, [sp, #0xc]
	mov r0, r7
	mov r1, r5
	mov r3, r4
	bl CPSi_big_add
	ldr r1, [sl, #4]
	ldr r2, [sl]
	mov r0, r6
	mov r3, r4
	bl CPSi_big_from_char
	mov r0, r7
	mov r1, r4
	bl CPSi_big_sign
	cmp r0, #0
	bge _020A9990
	mov r0, r7
	mov r1, r4
	bl CPSi_big_negate
	mov r1, r7
	mov r2, r6
	mov r3, sb
	mov r0, #0
	stmia sp, {r4, fp}
	bl CPSi_big_div
	mov r0, sb
	mov r1, r6
	mov r2, sb
	mov r3, r4
	bl CPSi_big_sub
	b _020A99A8
_020A9990:
	mov r1, r7
	mov r2, r6
	mov r3, sb
	mov r0, #0
	stmia sp, {r4, fp}
	bl CPSi_big_div
_020A99A8:
	ldr r0, [sp, #8]
	mov r1, sb
	mov r3, r4
	mov r2, #0x30
	bl CPSi_char_from_big
	ldr r1, _020A99D8 ; =_021D4660
	mov r0, r5
	ldr r1, [r1]
	blx r1
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020A99D4: .word _021D4634
_020A99D8: .word _021D4660
	arm_func_end decrypt_premaster_secret

	arm_func_start create_ms_sub
create_ms_sub: ; 0x020A99DC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x14
	mov r4, r2
	mov r6, r0
	mov r5, r1
	add r0, r4, #0x348
	bl CPSi_sha1_init
	mov r0, r5
	bl strlen
	mov r2, r0
	mov r1, r5
	add r0, r4, #0x348
	bl CPSi_sha1_calc
	add r0, r4, #0x348
	mov r1, r4
	mov r2, #0x30
	bl CPSi_sha1_calc
	add r0, r4, #0x348
	add r1, r4, #0x34
	mov r2, #0x40
	bl CPSi_sha1_calc
	add r0, r4, #0x348
	add r1, sp, #0
	bl CPSi_sha1_result
	add r0, r4, #0x3fc
	bl CPSi_md5_init
	add r0, r4, #0x3fc
	mov r1, r4
	mov r2, #0x30
	bl CPSi_md5_calc
	add r0, r4, #0x3fc
	add r1, sp, #0
	mov r2, #0x14
	bl CPSi_md5_calc
	add r0, r4, #0x3fc
	mov r1, r6
	bl CPSi_md5_result
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end create_ms_sub

	arm_func_start create_master_secret
create_master_secret: ; 0x020A9A78
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x30
	mov r4, r0
	ldr r1, _020A9ACC ; =_021106FC
	add r0, sp, #0
	mov r2, r4
	bl create_ms_sub
	ldr r1, _020A9AD0 ; =_02110700
	add r0, sp, #0x10
	mov r2, r4
	bl create_ms_sub
	ldr r1, _020A9AD4 ; =_02110704
	add r0, sp, #0x20
	mov r2, r4
	bl create_ms_sub
	add r0, sp, #0
	mov r1, r4
	mov r2, #0x30
	bl MI_CpuCopy8
	add sp, sp, #0x30
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A9ACC: .word _021106FC
_020A9AD0: .word _02110700
_020A9AD4: .word _02110704
	arm_func_end create_master_secret

	arm_func_start create_key_block
create_key_block: ; 0x020A9AD8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov sl, r0
	ldrh r0, [sl, #0x32]
	cmp r0, #4
	beq _020A9AFC
	cmp r0, #5
	beq _020A9B10
	b _020A9B24
_020A9AFC:
	mov r0, #0x10
	str r0, [sp, #4]
	str r0, [sp]
	mov r2, #0
	b _020A9B24
_020A9B10:
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp]
	mov r2, #0
_020A9B24:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	mov r7, #0
	add r0, r1, r0
	add r0, r2, r0
	mov fp, r0, lsl #1
	cmp fp, #0
	ble _020A9C18
	add r0, sl, #0x74
	mov sb, r7
	str r0, [sp, #8]
	add r5, sp, #0xc
	mov r4, #1
_020A9B58:
	add r0, sl, #0x348
	bl CPSi_sha1_init
	add r0, r7, #0x41
	add r6, r7, #1
	strb r0, [sp, #0xc]
	mov r8, #0
	cmp r6, #0
	ble _020A9B94
_020A9B78:
	add r0, sl, #0x348
	mov r1, r5
	mov r2, r4
	bl CPSi_sha1_calc
	add r8, r8, #1
	cmp r8, r6
	blt _020A9B78
_020A9B94:
	add r0, sl, #0x348
	mov r1, sl
	mov r2, #0x30
	bl CPSi_sha1_calc
	add r0, sl, #0x348
	add r1, sl, #0x54
	mov r2, #0x20
	bl CPSi_sha1_calc
	add r0, sl, #0x348
	add r1, sl, #0x34
	mov r2, #0x20
	bl CPSi_sha1_calc
	add r0, sl, #0x348
	add r1, sp, #0xd
	bl CPSi_sha1_result
	add r0, sl, #0x3fc
	bl CPSi_md5_init
	add r0, sl, #0x3fc
	mov r1, sl
	mov r2, #0x30
	bl CPSi_md5_calc
	add r0, sl, #0x3fc
	add r1, sp, #0xd
	mov r2, #0x14
	bl CPSi_md5_calc
	ldr r1, [sp, #8]
	add r0, sl, #0x3fc
	add r1, r1, sb
	bl CPSi_md5_result
	add sb, sb, #0x10
	cmp sb, fp
	add r7, r7, #1
	blt _020A9B58
_020A9C18:
	ldrb r0, [sl, #0x454]
	add r3, sl, #0x74
	cmp r0, #0
	beq _020A9C54
	ldr r0, [sp, #4]
	str r3, [sl, #0x1d4]
	add r2, r3, r0
	add r1, r2, r0
	add r0, r3, r0, lsl #1
	str r0, [sl, #0x1d8]
	ldr r0, [sp]
	str r2, [sl, #0xbc]
	add r0, r1, r0
	str r0, [sl, #0xc0]
	b _020A9C7C
_020A9C54:
	ldr r0, [sp, #4]
	str r3, [sl, #0xbc]
	add r2, r3, r0
	add r1, r2, r0
	add r0, r3, r0, lsl #1
	str r0, [sl, #0xc0]
	ldr r0, [sp]
	str r2, [sl, #0x1d4]
	add r0, r1, r0
	str r0, [sl, #0x1d8]
_020A9C7C:
	ldr r1, [sl, #0x1d8]
	add r0, sl, #0x1e0
	mov r2, #0x10
	bl CPSi_rc4_init
	ldr r1, [sl, #0xc0]
	add r0, sl, #0xc8
	mov r2, #0x10
	bl CPSi_rc4_init
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end create_key_block

	arm_func_start rcv_client_key_exchange
rcv_client_key_exchange: ; 0x020A9CA4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r2, [r4, #0x81c]
	bl decrypt_premaster_secret
	mov r0, r4
	bl create_master_secret
	mov r1, #0
	mov r0, r4
	mov r2, r1
	bl cache_session
	mov r0, r4
	bl create_key_block
	mov r0, #5
	strb r0, [r4, #0x455]
	ldmia sp!, {r4, pc}
	arm_func_end rcv_client_key_exchange

	arm_func_start finished_md5
finished_md5: ; 0x020A9CE0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x30
	mov r5, r0
	ldrb r0, [r5, #0x454]
	mov r4, r1
	teq r0, r2
	mov r2, #4
	beq _020A9D10
	ldr r1, _020A9DB4 ; =_02110708
	add r0, r5, #0x3a4
	bl CPSi_md5_calc
	b _020A9D1C
_020A9D10:
	ldr r1, _020A9DB8 ; =_02110710
	add r0, r5, #0x3a4
	bl CPSi_md5_calc
_020A9D1C:
	mov r1, r5
	add r0, r5, #0x3a4
	mov r2, #0x30
	bl CPSi_md5_calc
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x30
	bl MI_CpuFill8
	add r1, sp, #0
	add r0, r5, #0x3a4
	mov r2, #0x30
	bl CPSi_md5_calc
	mov r1, r4
	add r0, r5, #0x3a4
	bl CPSi_md5_result
	add r0, r5, #0x3a4
	bl CPSi_md5_init
	add r0, r5, #0x3a4
	mov r1, r5
	mov r2, #0x30
	bl CPSi_md5_calc
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x30
	bl MI_CpuFill8
	add r0, r5, #0x3a4
	add r1, sp, #0
	mov r2, #0x30
	bl CPSi_md5_calc
	add r0, r5, #0x3a4
	mov r1, r4
	mov r2, #0x10
	bl CPSi_md5_calc
	add r0, r5, #0x3a4
	mov r1, r4
	bl CPSi_md5_result
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A9DB4: .word _02110708
_020A9DB8: .word _02110710
	arm_func_end finished_md5

	arm_func_start finished_sha1
finished_sha1: ; 0x020A9DBC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x28
	mov r5, r0
	ldrb r0, [r5, #0x454]
	mov r4, r1
	teq r0, r2
	mov r2, #4
	beq _020A9DEC
	ldr r1, _020A9E90 ; =_02110708
	add r0, r5, #0x2ec
	bl CPSi_sha1_calc
	b _020A9DF8
_020A9DEC:
	ldr r1, _020A9E94 ; =_02110710
	add r0, r5, #0x2ec
	bl CPSi_sha1_calc
_020A9DF8:
	mov r1, r5
	add r0, r5, #0x2ec
	mov r2, #0x30
	bl CPSi_sha1_calc
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x28
	bl MI_CpuFill8
	add r1, sp, #0
	add r0, r5, #0x2ec
	mov r2, #0x28
	bl CPSi_sha1_calc
	mov r1, r4
	add r0, r5, #0x2ec
	bl CPSi_sha1_result
	add r0, r5, #0x2ec
	bl CPSi_sha1_init
	add r0, r5, #0x2ec
	mov r1, r5
	mov r2, #0x30
	bl CPSi_sha1_calc
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x28
	bl MI_CpuFill8
	add r0, r5, #0x2ec
	add r1, sp, #0
	mov r2, #0x28
	bl CPSi_sha1_calc
	add r0, r5, #0x2ec
	mov r1, r4
	mov r2, #0x14
	bl CPSi_sha1_calc
	add r0, r5, #0x2ec
	mov r1, r4
	bl CPSi_sha1_result
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020A9E90: .word _02110708
_020A9E94: .word _02110710
	arm_func_end finished_sha1

	arm_func_start rcv_finished
rcv_finished: ; 0x020A9E98
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	mov r5, r0
	mov r4, r1
	add r0, r5, #0x3a4
	add r1, r5, #0x3fc
	mov r2, #0x58
	bl MI_CpuCopy8
	add r1, sp, #0
	mov r0, r5
	mov r2, #1
	bl finished_md5
	add r0, r5, #0x3fc
	add r1, r5, #0x3a4
	mov r2, #0x58
	bl MI_CpuCopy8
	add r1, sp, #0
	mov r0, r4
	mov r2, #0x10
	bl memcmp
	cmp r0, #0
	movne r0, #9
	addne sp, sp, #0x14
	strneb r0, [r5, #0x455]
	ldmneia sp!, {r4, r5, pc}
	add r0, r5, #0x2ec
	add r1, r5, #0x348
	mov r2, #0x5c
	bl MI_CpuCopy8
	add r1, sp, #0
	mov r0, r5
	mov r2, #1
	bl finished_sha1
	add r0, r5, #0x348
	add r1, r5, #0x2ec
	mov r2, #0x5c
	bl MI_CpuCopy8
	add r1, sp, #0
	add r0, r4, #0x10
	mov r2, #0x14
	bl memcmp
	cmp r0, #0
	movne r0, #9
	strneb r0, [r5, #0x455]
	moveq r0, #6
	streqb r0, [r5, #0x455]
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	arm_func_end rcv_finished

	arm_func_start add1_be8
add1_be8: ; 0x020A9F58
	mov r2, #8
_020A9F5C:
	ldrb r1, [r0, #-1]!
	add r1, r1, #1
	ands r1, r1, #0xff
	strb r1, [r0]
	bxne lr
	subs r2, r2, #1
	bne _020A9F5C
	bx lr
	arm_func_end add1_be8

	arm_func_start decrypt
decrypt: ; 0x020A9F7C
	stmdb sp!, {r4, lr}
	add r0, r0, #0x1e0
	mov r4, r2
	bl CPSi_rc4_crypt
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end decrypt

	arm_func_start make_plaintext
make_plaintext: ; 0x020A9F94
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x44
	mov r6, r1
	ldrb r3, [r6, #3]
	ldrb r2, [r6, #4]
	mov r7, r0
	add r1, r6, #5
	add r2, r2, r3, lsl #8
	bl decrypt
	ldrh r1, [r7, #0x32]
	mov r4, r0
	cmp r1, #4
	beq _020A9FD4
	cmp r1, #5
	beq _020AA0B4
	b _020AA190
_020A9FD4:
	sub r4, r4, #0x10
	mov r0, r4, asr #8
	strb r0, [r6, #3]
	strb r4, [r6, #4]
	add r0, r7, #0x3fc
	bl CPSi_md5_init
	ldr r1, [r7, #0x1d4]
	add r0, r7, #0x3fc
	mov r2, #0x10
	bl CPSi_md5_calc
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x30
	bl MI_CpuFill8
	add r1, sp, #0
	add r0, r7, #0x3fc
	mov r2, #0x30
	bl CPSi_md5_calc
	add r0, r7, #0x3fc
	add r1, r7, #0x2e4
	mov r2, #8
	bl CPSi_md5_calc
	add r0, r7, #0x3fc
	mov r1, r6
	mov r2, #1
	bl CPSi_md5_calc
	add r0, r7, #0x3fc
	add r1, r6, #3
	add r2, r4, #2
	bl CPSi_md5_calc
	add r0, r7, #0x3fc
	add r1, sp, #0x30
	bl CPSi_md5_result
	add r0, r7, #0x3fc
	bl CPSi_md5_init
	ldr r1, [r7, #0x1d4]
	add r0, r7, #0x3fc
	mov r2, #0x10
	bl CPSi_md5_calc
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x30
	bl MI_CpuFill8
	add r0, r7, #0x3fc
	add r1, sp, #0
	mov r2, #0x30
	bl CPSi_md5_calc
	add r0, r7, #0x3fc
	add r1, sp, #0x30
	mov r2, #0x10
	bl CPSi_md5_calc
	add r0, r7, #0x3fc
	add r1, sp, #0x30
	bl CPSi_md5_result
	mov r5, #0x10
	b _020AA190
_020AA0B4:
	sub r4, r4, #0x14
	mov r0, r4, asr #8
	strb r0, [r6, #3]
	strb r4, [r6, #4]
	add r0, r7, #0x348
	bl CPSi_sha1_init
	ldr r1, [r7, #0x1d4]
	add r0, r7, #0x348
	mov r2, #0x14
	bl CPSi_sha1_calc
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x28
	bl MI_CpuFill8
	add r1, sp, #0
	add r0, r7, #0x348
	mov r2, #0x28
	bl CPSi_sha1_calc
	add r0, r7, #0x348
	add r1, r7, #0x2e4
	mov r2, #8
	bl CPSi_sha1_calc
	add r0, r7, #0x348
	mov r1, r6
	mov r2, #1
	bl CPSi_sha1_calc
	add r0, r7, #0x348
	add r1, r6, #3
	add r2, r4, #2
	bl CPSi_sha1_calc
	add r0, r7, #0x348
	add r1, sp, #0x30
	bl CPSi_sha1_result
	add r0, r7, #0x348
	bl CPSi_sha1_init
	ldr r1, [r7, #0x1d4]
	add r0, r7, #0x348
	mov r2, #0x14
	bl CPSi_sha1_calc
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x28
	bl MI_CpuFill8
	add r0, r7, #0x348
	add r1, sp, #0
	mov r2, #0x28
	bl CPSi_sha1_calc
	add r0, r7, #0x348
	add r1, sp, #0x30
	mov r2, #0x14
	bl CPSi_sha1_calc
	add r0, r7, #0x348
	add r1, sp, #0x30
	bl CPSi_sha1_result
	mov r5, #0x14
_020AA190:
	add r0, r6, #5
	add r1, sp, #0x30
	mov r2, r5
	add r0, r0, r4
	bl memcmp
	cmp r0, #0
	movne r0, #9
	strneb r0, [r7, #0x455]
	add r0, r7, #0x2ec
	bl add1_be8
	add r0, r4, #5
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end make_plaintext

	arm_func_start make_ciphertext
make_ciphertext: ; 0x020AA1C4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r4, r1
	mov r5, r0
	ldrh r0, [r5, #0x32]
	ldrb r2, [r4, #3]
	ldrb r1, [r4, #4]
	cmp r0, #4
	add r6, r4, #5
	add r7, r1, r2, lsl #8
	beq _020AA1FC
	cmp r0, #5
	beq _020AA2CC
	b _020AA398
_020AA1FC:
	add r0, r5, #0x3fc
	bl CPSi_md5_init
	ldr r1, [r5, #0xbc]
	add r0, r5, #0x3fc
	mov r2, #0x10
	bl CPSi_md5_calc
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x30
	bl MI_CpuFill8
	add r1, sp, #0
	add r0, r5, #0x3fc
	mov r2, #0x30
	bl CPSi_md5_calc
	add r0, r5, #0x3fc
	add r1, r5, #0x1cc
	mov r2, #8
	bl CPSi_md5_calc
	add r0, r5, #0x3fc
	mov r1, r4
	mov r2, #1
	bl CPSi_md5_calc
	add r0, r5, #0x3fc
	add r1, r4, #3
	add r2, r7, #2
	bl CPSi_md5_calc
	add r0, r5, #0x3fc
	add r1, r6, r7
	bl CPSi_md5_result
	add r0, r5, #0x3fc
	bl CPSi_md5_init
	ldr r1, [r5, #0xbc]
	add r0, r5, #0x3fc
	mov r2, #0x10
	bl CPSi_md5_calc
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x30
	bl MI_CpuFill8
	add r0, r5, #0x3fc
	add r1, sp, #0
	mov r2, #0x30
	bl CPSi_md5_calc
	add r0, r5, #0x3fc
	add r1, r6, r7
	mov r2, #0x10
	bl CPSi_md5_calc
	add r1, r6, r7
	add r0, r5, #0x3fc
	bl CPSi_md5_result
	add r7, r7, #0x10
	b _020AA398
_020AA2CC:
	add r0, r5, #0x348
	bl CPSi_sha1_init
	ldr r1, [r5, #0xbc]
	add r0, r5, #0x348
	mov r2, #0x14
	bl CPSi_sha1_calc
	add r0, sp, #0
	mov r1, #0x36
	mov r2, #0x28
	bl MI_CpuFill8
	add r1, sp, #0
	add r0, r5, #0x348
	mov r2, #0x28
	bl CPSi_sha1_calc
	add r0, r5, #0x348
	add r1, r5, #0x1cc
	mov r2, #8
	bl CPSi_sha1_calc
	add r0, r5, #0x348
	mov r1, r4
	mov r2, #1
	bl CPSi_sha1_calc
	add r0, r5, #0x348
	add r1, r4, #3
	add r2, r7, #2
	bl CPSi_sha1_calc
	add r0, r5, #0x348
	add r1, r6, r7
	bl CPSi_sha1_result
	add r0, r5, #0x348
	bl CPSi_sha1_init
	ldr r1, [r5, #0xbc]
	add r0, r5, #0x348
	mov r2, #0x14
	bl CPSi_sha1_calc
	add r0, sp, #0
	mov r1, #0x5c
	mov r2, #0x28
	bl MI_CpuFill8
	add r0, r5, #0x348
	add r1, sp, #0
	mov r2, #0x28
	bl CPSi_sha1_calc
	add r0, r5, #0x348
	add r1, r6, r7
	mov r2, #0x14
	bl CPSi_sha1_calc
	add r1, r6, r7
	add r0, r5, #0x348
	bl CPSi_sha1_result
	add r7, r7, #0x14
_020AA398:
	mov r0, r7, asr #8
	strb r0, [r4, #3]
	mov r2, r7
	add r0, r5, #0xc8
	add r1, r4, #5
	strb r7, [r4, #4]
	bl CPSi_rc4_crypt
	add r0, r5, #0x1d4
	bl add1_be8
	add r0, r7, #5
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end make_ciphertext

	arm_func_start tcp_read_raw_nbytes
tcp_read_raw_nbytes: ; 0x020AA3C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	add r4, sp, #0
_020AA3DC:
	mov r0, r4
	mov r1, r5
	bl CPSi_TcpReadRaw
	ldr r1, [sp]
	cmp r1, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r1, r6
	strhi r6, [sp]
	ldr r2, [sp]
	mov r1, r7
	bl MI_CpuCopy8
	ldr r0, [sp]
	mov r1, r5
	bl CPSi_SocConsumeRaw
	ldr r0, [sp]
	sub r6, r6, r0
	cmp r6, #0
	add r7, r7, r0
	bgt _020AA3DC
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end tcp_read_raw_nbytes

	arm_func_start update_digest
update_digest: ; 0x020AA434
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	add r0, r6, #0x2ec
	bl CPSi_sha1_calc
	mov r1, r5
	mov r2, r4
	add r0, r6, #0x3a4
	bl CPSi_md5_calc
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end update_digest

	arm_func_start parse_record_in_buf
parse_record_in_buf: ; 0x020AA460
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r0
	ldrb r2, [sb, #0x455]
	mov r8, r1
	cmp r2, #9
	bne _020AA48C
	ldr r1, _020AA6DC ; =_021D4660
	mov r0, r8
	ldr r1, [r1]
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020AA48C:
	ldrb r3, [r8, #3]
	ldrb r1, [r8, #4]
	add r0, r2, #0xf9
	and r0, r0, #0xff
	add r1, r1, r3, lsl #8
	cmp r0, #1
	add r6, r1, #5
	ldrb r4, [r8]
	bhi _020AA4B8
	cmp r4, #0x15
	bne _020AA4C8
_020AA4B8:
	cmp r4, #0x15
	bne _020AA4F8
	cmp r6, #7
	bls _020AA4F8
_020AA4C8:
	mov r0, sb
	mov r1, r8
	bl make_plaintext
	ldrb r2, [sb, #0x455]
	mov r6, r0
	cmp r2, #9
	bne _020AA4F8
	ldr r1, _020AA6DC ; =_021D4660
	mov r0, r8
	ldr r1, [r1]
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020AA4F8:
	sub r0, r4, #0x14
	cmp r0, #3
	add r5, r8, #5
	sub r6, r6, #5
	addls pc, pc, r0, lsl #2
	b _020AA6C0
_020AA510: ; jump table
	b _020AA520 ; case 0
	b _020AA550 ; case 1
	b _020AA564 ; case 2
	b _020AA6A0 ; case 3
_020AA520:
	ldr r0, [sb, #0x1d4]
	cmp r0, #0
	moveq r0, #9
	streqb r0, [sb, #0x455]
	beq _020AA6C8
	add r0, sb, #0x2e4
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	mov r0, #7
	strb r0, [sb, #0x455]
	b _020AA6C8
_020AA550:
	ldrb r0, [r5]
	cmp r0, #2
	moveq r0, #9
	streqb r0, [sb, #0x455]
	b _020AA6C8
_020AA564:
	mov fp, #4
	mov sl, #1
	mov r4, #0
_020AA570:
	ldrb r7, [r5, #2]
	ldrb r0, [r5, #1]
	ldrb r3, [r5]
	ldrb r1, [r5, #3]
	mov r7, r7, lsl #8
	add r0, r7, r0, lsl #16
	cmp r3, #0xb
	add r7, r1, r0
	add r5, r5, #4
	bgt _020AA5C0
	cmp r3, #0xb
	bge _020AA634
	cmp r3, #2
	bgt _020AA668
	cmp r3, #1
	blt _020AA668
	beq _020AA5F0
	cmp r3, #2
	beq _020AA624
	b _020AA668
_020AA5C0:
	sub r0, r3, #0xd
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _020AA668
_020AA5D0: ; jump table
	b _020AA648 ; case 0
	b _020AA650 ; case 1
	b _020AA668 ; case 2
	b _020AA614 ; case 3
	b _020AA668 ; case 4
	b _020AA668 ; case 5
	b _020AA668 ; case 6
	b _020AA658 ; case 7
_020AA5F0:
	ldrb r0, [sb, #0x454]
	cmp r0, #0
	beq _020AA670
	cmp r2, #0
	bne _020AA670
	mov r0, sb
	mov r1, r5
	bl client_hello
	b _020AA670
_020AA614:
	mov r0, sb
	mov r1, r5
	bl rcv_client_key_exchange
	b _020AA670
_020AA624:
	mov r0, sb
	mov r1, r5
	bl rcv_server_hello
	b _020AA670
_020AA634:
	mov r0, sb
	mov r1, r5
	bl rcv_certificate
	strb r4, [sb, #0x5ac]
	b _020AA670
_020AA648:
	strb sl, [sb, #0x5ac]
	b _020AA670
_020AA650:
	strb fp, [sb, #0x455]
	b _020AA670
_020AA658:
	mov r0, sb
	mov r1, r5
	bl rcv_finished
	b _020AA670
_020AA668:
	mov r0, #9
	strb r0, [sb, #0x455]
_020AA670:
	mov r0, sb
	sub r1, r5, #4
	add r2, r7, #4
	bl update_digest
	add r0, r7, #4
	add r5, r5, r7
	subs r6, r6, r0
	beq _020AA6C8
	ldrb r2, [sb, #0x455]
	cmp r2, #9
	bne _020AA570
	b _020AA6C8
_020AA6A0:
	str r8, [sb, #0x824]
	mov r0, #5
	str r0, [sb, #0x82c]
	add r0, r6, #5
	str r0, [sb, #0x828]
	mov r0, #1
	strb r0, [sb, #0x456]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020AA6C0:
	mov r0, #9
	strb r0, [sb, #0x455]
_020AA6C8:
	ldr r1, _020AA6DC ; =_021D4660
	mov r0, r8
	ldr r1, [r1]
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AA6DC: .word _021D4660
	arm_func_end parse_record_in_buf

	arm_func_start parse_record
parse_record: ; 0x020AA6E0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r0
	ldr r4, [r5, #0xc]
	add r6, sp, #0
_020AA6F4:
	mov r0, r6
	mov r1, r5
	bl CPSi_TcpReadRaw
	ldr r1, [sp]
	cmp r1, #0
	moveq r0, #9
	addeq sp, sp, #4
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	cmp r1, #5
	blo _020AA6F4
	ldrb r1, [r0]
	cmp r1, #0x80
	bne _020AA7DC
	ldrb r1, [r4, #0x454]
	cmp r1, #0
	beq _020AA7D0
	ldrb r1, [r4, #0x455]
	cmp r1, #0
	bne _020AA7D0
	ldrb r2, [r0, #1]
	mov r1, r5
	mov r0, #2
	str r2, [sp]
	bl CPSi_SocConsumeRaw
	ldr r1, _020AA874 ; =_021D4634
	ldr r0, [sp]
	ldr r1, [r1]
	blx r1
	movs r6, r0
	moveq r0, #9
	addeq sp, sp, #4
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [sp]
	mov r2, r5
	bl tcp_read_raw_nbytes
	cmp r0, #0
	ldreqb r0, [r6]
	cmpeq r0, #1
	movne r0, #9
	strneb r0, [r4, #0x455]
	bne _020AA7AC
	mov r0, r4
	add r1, r6, #1
	bl client_hello_v2
_020AA7AC:
	ldr r2, [sp]
	mov r0, r4
	mov r1, r6
	bl update_digest
	ldr r1, _020AA878 ; =_021D4660
	mov r0, r6
	ldr r1, [r1]
	blx r1
	b _020AA868
_020AA7D0:
	mov r0, #9
	strb r0, [r4, #0x455]
	b _020AA868
_020AA7DC:
	ldrb r2, [r0, #3]
	ldrb r0, [r0, #4]
	ldr r1, _020AA87C ; =0x00004805
	add r0, r0, r2, lsl #8
	add r0, r0, #5
	str r0, [sp]
	cmp r0, r1
	movhi r0, #9
	addhi sp, sp, #4
	strhib r0, [r4, #0x455]
	ldmhiia sp!, {r3, r4, r5, r6, pc}
	ldr r1, _020AA874 ; =_021D4634
	ldr r1, [r1]
	blx r1
	movs r6, r0
	moveq r0, #9
	addeq sp, sp, #4
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [sp]
	mov r2, r5
	bl tcp_read_raw_nbytes
	cmp r0, #0
	beq _020AA85C
	ldr r1, _020AA878 ; =_021D4660
	mov r0, r6
	ldr r1, [r1]
	blx r1
	mov r0, #9
	add sp, sp, #4
	strb r0, [r4, #0x455]
	ldmia sp!, {r3, r4, r5, r6, pc}
_020AA85C:
	mov r0, r4
	mov r1, r6
	bl parse_record_in_buf
_020AA868:
	ldrb r0, [r4, #0x455]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020AA874: .word _021D4634
_020AA878: .word _021D4660
_020AA87C: .word 0x00004805
	arm_func_end parse_record

	arm_func_start set_random
set_random: ; 0x020AA880
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x74
	ldr r2, _020AA9A0 ; =_021D5E60
	mov sl, r0
	ldrb r0, [r2]
	mov sb, r1
	cmp r0, #0
	bne _020AA8E4
	ldr r2, _020AA9A4 ; =_021D4688
	add r0, sp, #0
	ldr r3, [r2]
	ldmib r2, {r1, r4}
	umull r6, r5, r4, r3
	mla r5, r4, r1, r5
	ldr r1, [r2, #0xc]
	ldr r4, [r2, #0x10]
	mla r5, r1, r3, r5
	ldr r1, [r2, #0x14]
	adds r4, r4, r6
	adc r3, r1, r5
	str r4, [r2]
	mov r1, #4
	str r3, [r2, #4]
	str r3, [sp]
	bl CPS_SslAddRandomSeed
_020AA8E4:
	cmp sb, #0
	mov r8, #0
	addle sp, sp, #0x74
	mov r1, #0x14
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r5, _020AA9A8 ; =_021D5FD8
	add r6, sp, #0x18
	mov fp, r1
	add r4, sp, #4
_020AA908:
	cmp r1, #0x14
	bne _020AA97C
	mov r0, r6
	bl CPSi_sha1_init
	bl OS_DisableInterrupts
	mov r7, r0
	mov r0, r6
	mov r1, r5
	mov r2, fp
	bl CPSi_sha1_calc
	mov r0, r6
	mov r1, r4
	bl CPSi_sha1_result_prng
	ldr lr, _020AA9AC ; =_021D5FEB
	mov r3, #1
	mov r2, #0x13
	add ip, sp, #0x17
_020AA94C:
	ldrb r1, [lr]
	ldrb r0, [ip], #-1
	subs r2, r2, #1
	add r0, r1, r0
	add r0, r3, r0
	strb r0, [lr], #-1
	mov r3, r0, lsr #8
	bpl _020AA94C
	str r0, [sp]
	mov r0, r7
	bl OS_RestoreInterrupts
	mov r1, #0
_020AA97C:
	ldrb r0, [r4, r1]
	add r1, r1, #1
	cmp r0, #0
	strneb r0, [sl, r8]
	addne r8, r8, #1
	cmp r8, sb
	blt _020AA908
	add sp, sp, #0x74
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AA9A0: .word _021D5E60
_020AA9A4: .word _021D4688
_020AA9A8: .word _021D5FD8
_020AA9AC: .word _021D5FEB
	arm_func_end set_random

	arm_func_start CPS_SslAddRandomSeed
CPS_SslAddRandomSeed: ; 0x020AA9B0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x5c
	mov r6, r0
	add r0, sp, #0
	mov r5, r1
	bl CPSi_sha1_init
	bl OS_DisableInterrupts
	mov r4, r0
	ldr r1, _020AAA18 ; =_021D5FD8
	add r0, sp, #0
	mov r2, #0x14
	bl CPSi_sha1_calc
	mov r1, r6
	mov r2, r5
	add r0, sp, #0
	bl CPSi_sha1_calc
	ldr r1, _020AAA18 ; =_021D5FD8
	add r0, sp, #0
	bl CPSi_sha1_result
	mov r0, r4
	bl OS_RestoreInterrupts
	ldr r0, _020AAA1C ; =_021D5E60
	mov r1, #1
	strb r1, [r0]
	add sp, sp, #0x5c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020AAA18: .word _021D5FD8
_020AAA1C: .word _021D5E60
	arm_func_end CPS_SslAddRandomSeed

	arm_func_start send_server_hello
send_server_hello: ; 0x020AAA20
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r4, [sb, #0xc]
	ldr r7, [r4, #0x820]
	cmp r7, #0
	ldrne r8, [r7]
	moveq r8, #0
	bl date2sec
	mov r1, r0, lsr #0x18
	strb r1, [r4, #0x54]
	mov r1, r0, lsr #0x10
	strb r1, [r4, #0x55]
	mov r1, r0, lsr #8
	strb r1, [r4, #0x56]
	strb r0, [r4, #0x57]
	add r0, r4, #0x58
	mov r1, #0x1c
	bl set_random
	ldr r1, _020AAC74 ; =_021D4634
	add r0, r8, #0x9d
	ldr r1, [r1]
	blx r1
	movs r5, r0
	bne _020AAA90
	mov r0, #9
	strb r0, [r4, #0x455]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020AAA90:
	mov r0, #2
	strb r0, [r5, #5]
	mov r3, #0
	strb r3, [r5, #6]
	strb r3, [r5, #7]
	mov r0, #0x46
	strb r0, [r5, #8]
	mov r0, #3
	strb r0, [r5, #9]
	add r0, r4, #0x54
	add r1, r5, #0xb
	mov r2, #0x20
	strb r3, [r5, #0xa]
	bl MI_CpuCopy8
	mov r2, #0x20
	strb r2, [r5, #0x2b]
	ldrb r0, [r4, #0x30]
	cmp r0, #0
	beq _020AAAF8
	add r0, r4, #0x74
	add r1, r5, #0x2c
	bl MI_CpuCopy8
	mov r0, #1
	strb r0, [r4, #0x31]
	add r6, r5, #0x4c
	b _020AAB54
_020AAAF8:
	add r0, r5, #0x2c
	mov r1, #0x1c
	bl set_random
	ldr r0, _020AAC78 ; =_021D5E60
	add r6, r5, #0x4c
	ldr r3, [r0, #4]
	sub r0, r6, #0x20
	mov r1, r3, lsr #0x18
	strb r1, [r5, #0x48]
	mov r1, r3, lsr #0x10
	strb r1, [r5, #0x49]
	mov r1, r3, lsr #8
	strb r1, [r5, #0x4a]
	add r1, r4, #0x74
	mov r2, #0x20
	strb r3, [r5, #0x4b]
	bl MI_CpuCopy8
	ldr r0, _020AAC78 ; =_021D5E60
	mov r1, #0
	ldr r2, [r0, #4]
	strb r1, [r4, #0x31]
	add r1, r2, #1
	str r1, [r0, #4]
_020AAB54:
	ldrh r1, [r4, #0x32]
	mov r0, #0
	mov r1, r1, asr #8
	strb r1, [r6]
	ldrh r1, [r4, #0x32]
	strb r1, [r6, #1]
	strb r0, [r6, #2]
	ldrb r0, [r4, #0x31]
	add r6, r6, #3
	cmp r0, #0
	bne _020AAC08
	cmp r8, #0
	beq _020AABEC
	add r2, r8, #6
	mov r0, #0xb
	strb r0, [r6]
	add r1, r8, #3
	mov r0, r2, asr #0x10
	strb r0, [r6, #1]
	mov r0, r2, asr #8
	strb r0, [r6, #2]
	strb r2, [r6, #3]
	mov r0, r1, asr #0x10
	strb r0, [r6, #4]
	mov r0, r1, asr #8
	strb r0, [r6, #5]
	strb r1, [r6, #6]
	mov r0, r8, asr #0x10
	strb r0, [r6, #7]
	mov r0, r8, asr #8
	strb r0, [r6, #8]
	strb r8, [r6, #9]
	add r6, r6, #0xa
	ldr r0, [r7, #4]
	mov r1, r6
	mov r2, r8
	bl MI_CpuCopy8
	add r6, r6, r8
_020AABEC:
	mov r0, #0xe
	strb r0, [r6]
	mov r0, #0
	strb r0, [r6, #1]
	strb r0, [r6, #2]
	strb r0, [r6, #3]
	add r6, r6, #4
_020AAC08:
	mov r0, #0x16
	sub r1, r6, r5
	sub r6, r1, #5
	strb r0, [r5]
	mov r0, #3
	strb r0, [r5, #1]
	mov r0, #0
	strb r0, [r5, #2]
	mov r0, r6, asr #8
	strb r0, [r5, #3]
	mov r0, r4
	mov r2, r6
	add r1, r5, #5
	strb r6, [r5, #4]
	bl update_digest
	mov r2, #0
	mov r0, r5
	mov r3, r2
	add r1, r6, #5
	str sb, [sp]
	bl CPSi_TcpWrite2Raw
	ldr r1, _020AAC7C ; =_021D4660
	mov r0, r5
	ldr r1, [r1]
	blx r1
	ldrb r0, [r4, #0x31]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020AAC74: .word _021D4634
_020AAC78: .word _021D5E60
_020AAC7C: .word _021D4660
	arm_func_end send_server_hello

	arm_func_start send_change_cipher_spec_and_finished
send_change_cipher_spec_and_finished: ; 0x020AAC80
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r1, _020AADD0 ; =_021D4634
	mov r6, r0
	ldr r1, [r1]
	mov r0, #0x83
	ldr r5, [r6, #0xc]
	blx r1
	movs r4, r0
	moveq r0, #9
	addeq sp, sp, #4
	streqb r0, [r5, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	mov r0, #0x14
	strb r0, [r4]
	mov r0, #3
	strb r0, [r4, #1]
	mov r1, #0
	strb r1, [r4, #2]
	strb r1, [r4, #3]
	mov r3, #1
	strb r3, [r4, #4]
	add r0, r5, #0x1cc
	mov r2, #8
	strb r3, [r4, #5]
	bl MI_CpuFill8
	mov r0, #0x16
	strb r0, [r4, #6]
	mov r0, #3
	strb r0, [r4, #7]
	mov r1, #0
	strb r1, [r4, #8]
	strb r1, [r4, #9]
	mov r0, #0x28
	strb r0, [r4, #0xa]
	mov r0, #0x14
	strb r0, [r4, #0xb]
	strb r1, [r4, #0xc]
	strb r1, [r4, #0xd]
	mov r3, #0x24
	add r0, r5, #0x3a4
	add r1, r5, #0x3fc
	mov r2, #0x58
	strb r3, [r4, #0xe]
	bl MI_CpuCopy8
	mov r0, r5
	add r1, r4, #0xf
	mov r2, #0
	bl finished_md5
	add r0, r5, #0x3fc
	add r1, r5, #0x3a4
	mov r2, #0x58
	bl MI_CpuCopy8
	add r0, r5, #0x2ec
	add r1, r5, #0x348
	mov r2, #0x5c
	bl MI_CpuCopy8
	mov r0, r5
	add r1, r4, #0x1f
	mov r2, #0
	bl finished_sha1
	add r0, r5, #0x348
	add r1, r5, #0x2ec
	mov r2, #0x5c
	bl MI_CpuCopy8
	mov r0, r5
	add r1, r4, #0xb
	mov r2, #0x28
	bl update_digest
	mov r0, r5
	add r1, r4, #6
	bl make_ciphertext
	mov r2, #0
	add r1, r0, #6
	mov r0, r4
	mov r3, r2
	str r6, [sp]
	bl CPSi_TcpWrite2Raw
	ldr r1, _020AADD4 ; =_021D4660
	mov r0, r4
	ldr r1, [r1]
	blx r1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020AADD0: .word _021D4634
_020AADD4: .word _021D4660
	arm_func_end send_change_cipher_spec_and_finished

	arm_func_start send_client_hello
send_client_hello: ; 0x020AADD8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _020AAF60 ; =_021D4634
	mov r7, r0
	ldr r1, [r1]
	mov r0, #0x98
	ldr r4, [r7, #0xc]
	blx r1
	movs r5, r0
	moveq r0, #9
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #3
	strb r0, [r5, #9]
	mov r0, #0
	strb r0, [r5, #0xa]
	bl date2sec
	mov r1, r0, lsr #0x18
	strb r1, [r4, #0x34]
	mov r1, r0, lsr #0x10
	strb r1, [r4, #0x35]
	mov r1, r0, lsr #8
	strb r1, [r4, #0x36]
	strb r0, [r4, #0x37]
	add r0, r4, #0x38
	mov r1, #0x1c
	bl set_random
	add r0, r4, #0x34
	add r1, r5, #0xb
	mov r2, #0x20
	bl MI_CpuCopy8
	ldrh r2, [r7, #0x18]
	ldr r1, [r7, #0x1c]
	mov r0, r4
	bl find_session_from_IP
	ldrb r0, [r4, #0x30]
	cmp r0, #0
	moveq r0, #0
	streqb r0, [r5, #0x2b]
	addeq r0, r5, #0x2c
	beq _020AAE90
	mov r2, #0x20
	add r0, r4, #0x74
	add r1, r5, #0x2c
	strb r2, [r5, #0x2b]
	bl MI_CpuCopy8
	add r0, r5, #0x4c
_020AAE90:
	mov r6, #0
	strb r6, [r0]
	mov r1, #4
	strb r1, [r0, #1]
	ldr r2, _020AAF64 ; =_021106B0
	add r0, r0, #2
_020AAEA8:
	mov r3, r6, lsl #1
	ldrh r1, [r2, r3]
	add r6, r6, #1
	cmp r6, #2
	mov r1, r1, asr #8
	strb r1, [r0]
	ldrh r1, [r2, r3]
	strb r1, [r0, #1]
	add r0, r0, #2
	blo _020AAEA8
	mov r3, #1
	mov r2, #0
	strb r3, [r0]
	add r1, r0, #2
	sub r1, r1, r5
	sub r6, r1, #5
	strb r2, [r0, #1]
	sub r1, r6, #4
	mov r0, #0x16
	strb r0, [r5]
	mov r0, #3
	strb r0, [r5, #1]
	strb r2, [r5, #2]
	mov r0, r6, asr #8
	strb r0, [r5, #3]
	strb r6, [r5, #4]
	strb r3, [r5, #5]
	mov r0, r1, asr #0x10
	strb r0, [r5, #6]
	mov r0, r1, asr #8
	strb r0, [r5, #7]
	strb r1, [r5, #8]
	mov r0, r5
	mov r3, r2
	add r1, r6, #5
	str r7, [sp]
	bl CPSi_TcpWrite2Raw
	mov r0, r4
	mov r2, r6
	add r1, r5, #5
	bl update_digest
	ldr r1, _020AAF68 ; =_021D4660
	mov r0, r5
	ldr r1, [r1]
	blx r1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020AAF60: .word _021D4634
_020AAF64: .word _021106B0
_020AAF68: .word _021D4660
	arm_func_end send_client_hello

	arm_func_start send_client_key_exchange
send_client_key_exchange: ; 0x020AAF6C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	ldr r4, [sl, #0xc]
	ldrb r0, [r4, #0x5ac]
	cmp r0, #0
	beq _020AAFA0
	mov r2, #0
	ldr r0, _020AB220 ; =_02108FB8
	mov r3, r2
	mov r1, #7
	str sl, [sp]
	bl CPSi_TcpWrite2Raw
_020AAFA0:
	mov r0, #3
	strb r0, [r4]
	mov r0, #0
	strb r0, [r4, #1]
	add r0, r4, #2
	mov r1, #0x2e
	bl set_random
	ldr sb, [r4, #0x594]
	ldr r0, _020AB224 ; =_021D4634
	mov r1, sb, lsl #1
	ldr r2, [r0]
	add r1, r1, r1, lsr #31
	mov r0, sb
	mov r7, r1, asr #1
	blx r2
	movs r8, r0
	moveq r0, #9
	addeq sp, sp, #8
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	strb r0, [r8]
	mov r2, #2
	add r0, r8, #2
	sub r1, sb, #0x33
	strb r2, [r8, #1]
	bl set_random
	add r1, r8, sb
	mov r0, r4
	sub r3, sb, #0x31
	mov r5, #0
	sub r1, r1, #0x30
	mov r2, #0x30
	strb r5, [r8, r3]
	bl MI_CpuCopy8
	ldr r1, _020AB224 ; =_021D4634
	mov r0, r7, lsl #3
	ldr r1, [r1]
	blx r1
	movs r5, r0
	bne _020AB064
	ldr r1, _020AB228 ; =_021D4660
	mov r0, r8
	ldr r1, [r1]
	blx r1
	mov r0, #9
	add sp, sp, #8
	strb r0, [r4, #0x455]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020AB064:
	add r0, r5, r7, lsl #1
	add fp, r0, r7, lsl #1
	mov r1, r8
	mov r2, sb
	mov r3, r7
	str r0, [sp, #4]
	add r6, fp, r7, lsl #1
	bl CPSi_big_from_char
	add r0, r4, #0x198
	add r1, r0, #0x400
	ldr r2, [r4, #0x5a0]
	mov r0, fp
	mov r3, r7
	bl CPSi_big_from_char
	add r1, r4, #0x94
	mov r0, r6
	add r1, r1, #0x400
	mov r2, sb
	mov r3, r7
	bl CPSi_big_from_char
	bl enter_computebound
	str r6, [sp]
	mov r6, r0
	ldr r1, [sp, #4]
	mov r2, fp
	mov r3, r7
	mov r0, r5
	bl CPSi_big_power
	mov r0, r6
	bl exit_computebound
	ldr r1, _020AB224 ; =_021D4634
	add r0, sb, #0x49
	ldr r1, [r1]
	blx r1
	movs r6, r0
	bne _020AB124
	ldr r1, _020AB228 ; =_021D4660
	mov r0, r8
	ldr r1, [r1]
	blx r1
	ldr r1, _020AB228 ; =_021D4660
	mov r0, r5
	ldr r1, [r1]
	blx r1
	mov r0, #9
	add sp, sp, #8
	strb r0, [r4, #0x455]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020AB124:
	mov r0, #0x16
	strb r0, [r6]
	mov r1, #3
	add r0, sb, #4
	strb r1, [r6, #1]
	mov r1, #0
	strb r1, [r6, #2]
	mov r1, r0, asr #8
	strb r1, [r6, #3]
	strb r0, [r6, #4]
	mov r0, #0x10
	strb r0, [r6, #5]
	mov r0, sb, asr #0x10
	strb r0, [r6, #6]
	mov r0, sb, asr #8
	strb r0, [r6, #7]
	strb sb, [r6, #8]
	tst sb, #1
	add r0, r6, #9
	beq _020AB18C
	add r0, sb, sb, lsr #31
	mov r0, r0, asr #1
	mov r0, r0, lsl #1
	ldrh r1, [r5, r0]
	add r0, r6, #0xa
	strb r1, [r6, #9]
_020AB18C:
	add r1, sb, sb, lsr #31
	mov r1, r1, asr #1
	subs r3, r1, #1
	bmi _020AB1C0
_020AB19C:
	mov r2, r3, lsl #1
	ldrh r1, [r5, r2]
	subs r3, r3, #1
	mov r1, r1, asr #8
	strb r1, [r0]
	ldrh r1, [r5, r2]
	strb r1, [r0, #1]
	add r0, r0, #2
	bpl _020AB19C
_020AB1C0:
	mov r2, #0
	mov r0, r6
	mov r3, r2
	add r1, sb, #9
	str sl, [sp]
	bl CPSi_TcpWrite2Raw
	mov r0, r4
	add r1, r6, #5
	add r2, sb, #4
	bl update_digest
	ldr r1, _020AB228 ; =_021D4660
	mov r0, r6
	ldr r1, [r1]
	blx r1
	ldr r1, _020AB228 ; =_021D4660
	mov r0, r5
	ldr r1, [r1]
	blx r1
	ldr r1, _020AB228 ; =_021D4660
	mov r0, r8
	ldr r1, [r1]
	blx r1
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AB220: .word _02108FB8
_020AB224: .word _021D4634
_020AB228: .word _021D4660
	arm_func_end send_client_key_exchange

	arm_func_start mustget_change_cipher_spec_and_finished
mustget_change_cipher_spec_and_finished: ; 0x020AB22C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl parse_record
	cmp r0, #7
	movne r0, #1
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl parse_record
	cmp r0, #6
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end mustget_change_cipher_spec_and_finished

	arm_func_start ssl_listen_try
ssl_listen_try: ; 0x020AB25C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl parse_record
	cmp r0, #1
	movne r0, #1
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl send_server_hello
	cmp r0, #0
	beq _020AB2AC
	ldr r0, [r4, #0xc]
	bl create_key_block
	mov r0, r4
	bl send_change_cipher_spec_and_finished
	mov r0, r4
	bl mustget_change_cipher_spec_and_finished
	cmp r0, #0
	beq _020AB2DC
	mov r0, #1
	ldmia sp!, {r4, pc}
_020AB2AC:
	mov r0, r4
	bl parse_record
	cmp r0, #5
	movne r0, #1
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl mustget_change_cipher_spec_and_finished
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl send_change_cipher_spec_and_finished
_020AB2DC:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end ssl_listen_try

	arm_func_start CPSi_SslListen
CPSi_SslListen: ; 0x020AB2E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r6, [r7, #0xc]
	mov r5, #0
	mov r4, #1
_020AB2F8:
	mov r0, r7
	bl CPSi_TcpListenRaw
	strb r5, [r6, #0x455]
	str r5, [r6, #0x1d4]
	add r0, r6, #0x2ec
	strb r4, [r6, #0x454]
	bl CPSi_sha1_init
	add r0, r6, #0x3a4
	bl CPSi_md5_init
	mov r0, r7
	bl ssl_listen_try
	cmp r0, #0
	moveq r0, #8
	streqb r0, [r6, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	bl CPSi_TcpShutdownRaw
	ldrh r0, [r7, #0x1a]
	strh r0, [r7, #0x18]
	ldr r0, [r7, #0x20]
	str r0, [r7, #0x1c]
	b _020AB2F8
_020AB350: ; 0x020AB350
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CPSi_SslListen

	arm_func_start ssl_connect_try
ssl_connect_try: ; 0x020AB354
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	bl send_client_hello
_020AB364:
	mov r0, r5
	bl parse_record
	cmp r0, #9
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #4
	beq _020AB38C
	ldrb r0, [r4, #0x31]
	cmp r0, #0
	beq _020AB364
_020AB38C:
	ldrb r0, [r4, #0x31]
	cmp r0, #0
	beq _020AB3C0
	mov r0, r4
	bl create_key_block
	mov r0, r5
	bl mustget_change_cipher_spec_and_finished
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl send_change_cipher_spec_and_finished
	b _020AB410
_020AB3C0:
	mov r0, r5
	bl send_client_key_exchange
	mov r0, r4
	bl create_master_secret
	ldrb r0, [r4, #0x30]
	cmp r0, #0
	beq _020AB3EC
	ldrh r2, [r5, #0x18]
	ldr r1, [r5, #0x1c]
	mov r0, r4
	bl cache_session
_020AB3EC:
	mov r0, r4
	bl create_key_block
	mov r0, r5
	bl send_change_cipher_spec_and_finished
	mov r0, r5
	bl mustget_change_cipher_spec_and_finished
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_020AB410:
	mov r0, #8
	strb r0, [r4, #0x455]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ssl_connect_try

	arm_func_start CPSi_SslConnect
CPSi_SslConnect: ; 0x020AB420
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r1, [r5, #8]
	ldr r4, [r5, #0xc]
	cmp r1, #4
	beq _020AB448
	bl CPSi_TcpConnectRaw
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
_020AB448:
	mov r1, #0
	strb r1, [r4, #0x455]
	str r1, [r4, #0x1d4]
	add r0, r4, #0x2ec
	strb r1, [r4, #0x454]
	bl CPSi_sha1_init
	add r0, r4, #0x3a4
	bl CPSi_md5_init
	mov r0, r5
	bl ssl_connect_try
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CPSi_SslConnect

	arm_func_start CPSi_SslRead
CPSi_SslRead: ; 0x020AB474
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r4, [r5, #0xc]
	mov r6, r0
	ldr ip, [r4, #0x824]
	cmp ip, #0
	beq _020AB4F8
	ldrb r0, [r4, #0x456]
	cmp r0, #0
	bne _020AB4F8
	ldr r3, [r4, #0x82c]
	ldr r1, [r4, #0x828]
	mov r2, r5
	add r0, ip, r3
	sub r1, r1, r3
	bl tcp_read_raw_nbytes
	cmp r0, #0
	beq _020AB4DC
	ldr r1, _020AB548 ; =_021D4660
	ldr r0, [r4, #0x824]
	ldr r1, [r1]
	blx r1
	mov r0, #0
	str r0, [r4, #0x824]
	str r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
_020AB4DC:
	ldr r1, [r4, #0x824]
	mov r0, r4
	bl parse_record_in_buf
	ldrb r0, [r4, #0x456]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r4, #0x824]
_020AB4F8:
	ldr r0, [r4, #0x824]
	cmp r0, #0
	bne _020AB528
_020AB504:
	mov r0, r5
	bl parse_record
	cmp r0, #9
	moveq r0, #0
	streq r0, [r6]
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [r4, #0x824]
	cmp r0, #0
	beq _020AB504
_020AB528:
	ldr r1, [r4, #0x828]
	ldr r0, [r4, #0x82c]
	sub r0, r1, r0
	str r0, [r6]
	ldr r1, [r4, #0x824]
	ldr r0, [r4, #0x82c]
	add r0, r1, r0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020AB548: .word _021D4660
	arm_func_end CPSi_SslRead

	arm_func_start CPSi_SslConsume
CPSi_SslConsume: ; 0x020AB54C
	stmdb sp!, {r4, lr}
	ldr r4, [r1, #0xc]
	ldr r2, [r4, #0x828]
	ldr r1, [r4, #0x82c]
	sub r2, r2, r1
	cmp r0, r2
	blo _020AB58C
	ldr r0, [r4, #0x824]
	cmp r0, #0
	beq _020AB580
	ldr r1, _020AB598 ; =_021D4660
	ldr r1, [r1]
	blx r1
_020AB580:
	mov r0, #0
	str r0, [r4, #0x824]
	ldmia sp!, {r4, pc}
_020AB58C:
	add r0, r1, r0
	str r0, [r4, #0x82c]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AB598: .word _021D4660
	arm_func_end CPSi_SslConsume

	arm_func_start try_fill_record
try_fill_record: ; 0x020AB59C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0x824]
	cmp r0, #0
	ldr r0, [r5, #0x44]
	bne _020AB63C
	cmp r0, #5
	addlo sp, sp, #4
	ldmloia sp!, {r3, r4, r5, r6, pc}
	add r0, sp, #0
	mov r1, r5
	bl CPSi_TcpReadRaw
	ldrb r2, [r0, #3]
	ldrb r0, [r0, #4]
	ldr r1, _020AB6D8 ; =0x00004805
	add r0, r0, r2, lsl #8
	add r0, r0, #5
	str r0, [sp]
	cmp r0, r1
	movhi r0, #9
	addhi sp, sp, #4
	strhib r0, [r4, #0x455]
	ldmhiia sp!, {r3, r4, r5, r6, pc}
	ldr r1, _020AB6DC ; =_021D4634
	ldr r1, [r1]
	blx r1
	cmp r0, #0
	str r0, [r4, #0x824]
	moveq r0, #9
	addeq sp, sp, #4
	streqb r0, [r4, #0x455]
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [sp]
	mov r0, #0
	str r1, [r4, #0x828]
	str r0, [r4, #0x82c]
	strb r0, [r4, #0x456]
	b _020AB648
_020AB63C:
	cmp r0, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, pc}
_020AB648:
	add r0, sp, #0
	mov r1, r5
	bl CPSi_TcpReadRaw
	ldr r3, [r4, #0x828]
	ldr r2, [r4, #0x82c]
	ldr r1, [sp]
	sub r2, r3, r2
	cmp r1, r2
	strhs r2, [sp]
	movhs r6, #1
	ldr r3, [r4, #0x824]
	ldr r1, [r4, #0x82c]
	ldr r2, [sp]
	add r1, r3, r1
	movlo r6, #0
	bl MI_CpuCopy8
	ldr r0, [sp]
	mov r1, r5
	bl CPSi_SocConsumeRaw
	cmp r6, #0
	beq _020AB6C0
	ldr r1, [r4, #0x824]
	mov r0, r4
	bl parse_record_in_buf
	ldrb r0, [r4, #0x456]
	add sp, sp, #4
	cmp r0, #0
	moveq r0, #0
	streq r0, [r4, #0x824]
	ldmia sp!, {r3, r4, r5, r6, pc}
_020AB6C0:
	ldr r1, [r4, #0x82c]
	ldr r0, [sp]
	add r0, r1, r0
	str r0, [r4, #0x82c]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020AB6D8: .word 0x00004805
_020AB6DC: .word _021D4634
	arm_func_end try_fill_record

	arm_func_start CPSi_SslGetLength
CPSi_SslGetLength: ; 0x020AB6E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldr r0, [r4, #0x824]
	cmp r0, #0
	ldrneb r0, [r4, #0x456]
	cmpne r0, #0
	bne _020AB708
	mov r0, r5
	bl try_fill_record
_020AB708:
	ldr r1, [r4, #0x824]
	cmp r1, #0
	ldrneb r0, [r4, #0x456]
	cmpne r0, #0
	beq _020AB72C
	ldr r1, [r4, #0x828]
	ldr r0, [r4, #0x82c]
	sub r0, r1, r0
	ldmia sp!, {r3, r4, r5, pc}
_020AB72C:
	cmp r1, #0
	bne _020AB754
	ldrb r0, [r5, #8]
	cmp r0, #4
	bne _020AB74C
	ldrb r0, [r4, #0x455]
	cmp r0, #9
	bne _020AB754
_020AB74C:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020AB754:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end CPSi_SslGetLength

	arm_func_start CPSi_SslWrite2
CPSi_SslWrite2: ; 0x020AB75C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r4, [sp, #0x30]
	mov sb, r1
	mov r1, r4
	ldr r1, [r1, #0xc]
	mov sl, r0
	mov r0, #0
	str r4, [sp, #0x30]
	str r1, [sp, #8]
	mov r8, r2
	add r5, sb, r3
	str r0, [sp, #4]
_020AB790:
	ldr r0, _020AB884 ; =0x00000B4F
	ldr r1, _020AB888 ; =_021D4634
	cmp r5, r0
	movgt r6, r0
	movle r6, r5
	ldr r1, [r1]
	add r0, r6, #0x19
	blx r1
	movs r4, r0
	beq _020AB878
	cmp sb, r6
	movhs r7, r6
	movlo r7, sb
	mov r0, sl
	add r1, r4, #5
	mov r2, r7
	sub fp, r6, r7
	bl MI_CpuCopy8
	add r1, r4, #5
	mov r0, r8
	add r1, r1, r7
	mov r2, fp
	add sl, sl, r7
	sub sb, sb, r7
	bl MI_CpuCopy8
	mov r0, #0x17
	strb r0, [r4]
	mov r0, #3
	strb r0, [r4, #1]
	mov r0, #0
	strb r0, [r4, #2]
	mov r0, r6, asr #8
	strb r0, [r4, #3]
	ldr r0, [sp, #8]
	mov r1, r4
	add r8, r8, fp
	strb r6, [r4, #4]
	bl make_ciphertext
	ldr r1, [sp, #0x30]
	mov r7, r0
	mov r2, #0
	str r1, [sp]
	mov r0, r4
	mov r1, r7
	mov r3, r2
	bl CPSi_TcpWrite2Raw
	cmp r0, r7
	ldr r1, _020AB88C ; =_021D4660
	mov r0, r4
	ldr r1, [r1]
	movlo r6, #0
	blx r1
	ldr r0, [sp, #4]
	subs r5, r5, r6
	add r0, r0, r6
	str r0, [sp, #4]
	cmpne r6, #0
	bne _020AB790
_020AB878:
	ldr r0, [sp, #4]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AB884: .word 0x00000B4F
_020AB888: .word _021D4634
_020AB88C: .word _021D4660
	arm_func_end CPSi_SslWrite2

	arm_func_start CPSi_SslShutdown
CPSi_SslShutdown: ; 0x020AB890
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x20
	mov r5, r0
	ldr r4, [r5, #0xc]
	ldrb r0, [r4, #0x455]
	cmp r0, #8
	bne _020AB900
	mov ip, #0
	mov r6, #0x15
	mov lr, #3
	mov r3, #2
	mov r2, #1
	add r1, sp, #4
	mov r0, r4
	strb r6, [sp, #4]
	strb lr, [sp, #5]
	strb ip, [sp, #6]
	strb ip, [sp, #7]
	strb r3, [sp, #8]
	strb r2, [sp, #9]
	strb ip, [sp, #0xa]
	bl make_ciphertext
	mov r2, #0
	mov r1, r0
	add r0, sp, #4
	mov r3, r2
	str r5, [sp]
	bl CPSi_TcpWrite2Raw
_020AB900:
	mov r0, #0
	strb r0, [r4, #0x455]
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end CPSi_SslShutdown

	arm_func_start CPSi_SslClose
CPSi_SslClose: ; 0x020AB910
	stmdb sp!, {r4, lr}
	ldr r4, [r0, #0xc]
	mov r0, #0
	strb r0, [r4, #0x455]
	ldr r0, [r4, #0x824]
	cmp r0, #0
	beq _020AB938
	ldr r1, _020AB944 ; =_021D4660
	ldr r1, [r1]
	blx r1
_020AB938:
	mov r0, #0
	str r0, [r4, #0x824]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AB944: .word _021D4660
	arm_func_end CPSi_SslClose

	arm_func_start CPS_SetSsl
CPS_SetSsl: ; 0x020AB948
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _020AB970 ; =_version_UBIQUITOUS_SSL
	bl OSi_ReferSymbol
	ldr r0, _020AB974 ; =OSi_ThreadInfo
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xa4]
	cmp r0, #0
	strneb r4, [r0, #9]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AB970: .word _version_UBIQUITOUS_SSL
_020AB974: .word OSi_ThreadInfo
	arm_func_end CPS_SetSsl

	arm_func_start CPSi_SslPeriodical
CPSi_SslPeriodical: ; 0x020AB978
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	mov r4, #0
	ldr r6, _020ABA4C ; =_021D5E68
	ldr r1, _020ABA50 ; =0x000003BD
	mov r2, r4
_020AB994:
	ldrb r3, [r6, #0x5a]
	cmp r3, #0
	beq _020AB9B0
	ldr r3, [r6, #0x50]
	sub r3, r5, r3
	cmp r3, r1
	strgtb r2, [r6, #0x5a]
_020AB9B0:
	add r4, r4, #1
	cmp r4, #4
	add r6, r6, #0x5c
	blt _020AB994
	bl OS_RestoreInterrupts
	ldr r0, _020ABA54 ; =OSi_ThreadInfo
	ldr r4, [r0, #8]
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r6, #0
_020AB9D8:
	ldr r1, [r4, #0xa4]
	cmp r1, #0
	ldrne r0, [r1]
	cmpne r0, #0
	ldrneb r0, [r1, #9]
	cmpne r0, #0
	beq _020ABA3C
	ldrb r0, [r1, #8]
	cmp r0, #4
	bne _020ABA3C
	ldr r0, [r1, #0xc]
	ldrb r0, [r0, #0x455]
	cmp r0, #8
	bhs _020ABA3C
	ldr r0, [r1, #0x10]
	sub r0, r5, r0
	cmp r0, #0xef
	ble _020ABA3C
	ldr r0, [r1, #4]
	cmp r0, #2
	bne _020ABA3C
	strb r6, [r1, #8]
	str r6, [r1, #4]
	ldr r0, [r1]
	bl OS_WakeupThreadDirect
_020ABA3C:
	ldr r4, [r4, #0x68]
	cmp r4, #0
	bne _020AB9D8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020ABA4C: .word _021D5E68
_020ABA50: .word 0x000003BD
_020ABA54: .word OSi_ThreadInfo
	arm_func_end CPSi_SslPeriodical

	arm_func_start CPSi_SslCleanup
CPSi_SslCleanup: ; 0x020ABA58
	ldr ip, _020ABA6C ; =MI_CpuFill8
	ldr r0, _020ABA70 ; =_021D5E68
	mov r1, #0
	mov r2, #0x170
	bx ip
	.align 2, 0
_020ABA6C: .word MI_CpuFill8
_020ABA70: .word _021D5E68
	arm_func_end CPSi_SslCleanup

	arm_func_start char_from_long
char_from_long: ; 0x020ABA74
	ldr ip, _020ABA88 ; =MI_CpuCopy8
	mov r3, r0
	mov r0, r1
	mov r1, r3
	bx ip
	.align 2, 0
_020ABA88: .word MI_CpuCopy8
	arm_func_end char_from_long

	arm_func_start long_from_char
long_from_char: ; 0x020ABA8C
	ldr ip, _020ABAA0 ; =MI_CpuCopy8
	mov r3, r0
	mov r0, r1
	mov r1, r3
	bx ip
	.align 2, 0
_020ABAA0: .word MI_CpuCopy8
	arm_func_end long_from_char

	arm_func_start CPSi_md5_block
CPSi_md5_block: ; 0x020ABAA4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x44
	str r0, [sp]
	ldr r3, [sp]
	add r0, sp, #4
	mov r2, #0x40
	ldmia r3, {r4, r5, r6, r7}
	bl long_from_char
	mov r3, #0
	ldr lr, _020ABEB8 ; =_02110718
	mov ip, r3
	add r2, sp, #4
_020ABAD4:
	ldr r1, _020ABEBC ; =_02110798
	ldrb r0, [lr]
	add sb, r1, r3, lsl #2
	eor r1, r6, r7
	and r8, r5, r1
	ldr r1, _020ABEBC ; =_02110798
	ldr r0, [r2, r0, lsl #2]
	ldr sl, [r1, r3, lsl #2]
	eor r1, r7, r8
	add r0, r1, r0
	add r0, sl, r0
	add r1, r4, r0
	mov r0, r1, lsr #0x19
	orr r0, r0, r1, lsl #7
	ldrb r1, [lr, #1]
	add r4, r5, r0
	eor r0, r5, r6
	and r0, r4, r0
	ldr sl, [r2, r1, lsl #2]
	eor r0, r6, r0
	add r0, r0, sl
	ldr r8, [sb, #4]
	ldrb sl, [lr, #2]
	add r0, r8, r0
	add r7, r7, r0
	mov r0, r7, lsr #0x14
	orr r0, r0, r7, lsl #12
	add r7, r4, r0
	eor r0, r4, r5
	and r0, r7, r0
	ldr r1, [sb, #8]
	ldrb fp, [lr, #3]
	ldr sl, [r2, sl, lsl #2]
	eor r0, r5, r0
	add r0, r0, sl
	add r0, r1, r0
	add r6, r6, r0
	mov r1, r6, lsr #0xf
	orr r1, r1, r6, lsl #17
	add ip, ip, #1
	eor r8, r7, r4
	add r6, r7, r1
	and r1, r6, r8
	ldr r0, [r2, fp, lsl #2]
	eor r1, r4, r1
	ldr sb, [sb, #0xc]
	add r0, r1, r0
	add r0, sb, r0
	add r1, r5, r0
	mov r0, r1, lsr #0xa
	orr r0, r0, r1, lsl #22
	add lr, lr, #4
	add r5, r6, r0
	add r3, r3, #4
	cmp ip, #4
	blt _020ABAD4
	ldr r0, _020ABEB8 ; =_02110718
	ldr lr, _020ABEBC ; =_02110798
	mov fp, #0
	add sl, r0, r3
	add sb, sp, #4
_020ABBC8:
	ldrb r0, [sl]
	add ip, lr, r3, lsl #2
	eor r1, r5, r6
	and r1, r7, r1
	ldr r8, [lr, r3, lsl #2]
	eor r1, r6, r1
	ldr r0, [sb, r0, lsl #2]
	ldr r2, [ip, #4]
	add r0, r1, r0
	add r0, r8, r0
	add r1, r4, r0
	mov r0, r1, lsr #0x1b
	orr r1, r0, r1, lsl #5
	ldrb r0, [sl, #1]
	add r4, r5, r1
	eor r1, r4, r5
	and r1, r6, r1
	eor r1, r5, r1
	ldr r0, [sb, r0, lsl #2]
	ldr r8, [ip, #8]
	add r0, r1, r0
	add r0, r2, r0
	add r2, r7, r0
	ldr r0, [ip, #0xc]
	mov r1, r2, lsr #0x17
	orr r1, r1, r2, lsl #9
	add r7, r4, r1
	eor r1, r7, r4
	and r1, r5, r1
	eor r2, r4, r1
	ldrb r1, [sl, #2]
	ldrb ip, [sl, #3]
	add sl, sl, #4
	ldr r1, [sb, r1, lsl #2]
	ldr ip, [sb, ip, lsl #2]
	add r1, r2, r1
	add r1, r8, r1
	add r2, r6, r1
	mov r1, r2, lsr #0x12
	orr r1, r1, r2, lsl #14
	add r6, r7, r1
	eor r1, r6, r7
	and r1, r4, r1
	eor r1, r7, r1
	add r1, r1, ip
	add r0, r0, r1
	add r1, r5, r0
	mov r0, r1, lsr #0xc
	orr r0, r0, r1, lsl #20
	add r5, r6, r0
	add r3, r3, #4
	add fp, fp, #1
	cmp fp, #4
	blt _020ABBC8
	ldr r0, _020ABEB8 ; =_02110718
	ldr r1, _020ABEBC ; =_02110798
	add r2, r0, r3
	mov r8, #0
	add r0, sp, #4
_020ABCB4:
	ldrb sb, [r2]
	add fp, r1, r3, lsl #2
	eor ip, r5, r6
	ldr sl, [r0, sb, lsl #2]
	eor ip, r7, ip
	ldr sb, [r1, r3, lsl #2]
	add sl, ip, sl
	add sb, sb, sl
	add sb, r4, sb
	mov r4, sb, lsr #0x1c
	ldrb sl, [r2, #1]
	orr r4, r4, sb, lsl #4
	add r4, r5, r4
	eor sb, r4, r5
	eor sb, r6, sb
	ldr ip, [r0, sl, lsl #2]
	ldr sl, [fp, #4]
	add sb, sb, ip
	add sb, sl, sb
	add sb, r7, sb
	mov r7, sb, lsr #0x15
	orr r7, r7, sb, lsl #11
	ldrb sb, [r2, #2]
	add r7, r4, r7
	ldr sl, [fp, #8]
	ldr ip, [r0, sb, lsl #2]
	ldr sb, [fp, #0xc]
	eor fp, r7, r4
	eor fp, r5, fp
	add fp, fp, ip
	add sl, sl, fp
	add sl, r6, sl
	mov r6, sl, lsr #0x10
	orr r6, r6, sl, lsl #16
	add r6, r7, r6
	eor sl, r6, r7
	eor fp, r4, sl
	ldrb sl, [r2, #3]
	add r2, r2, #4
	add r3, r3, #4
	ldr sl, [r0, sl, lsl #2]
	add r8, r8, #1
	add sl, fp, sl
	add sb, sb, sl
	add sb, r5, sb
	cmp r8, #4
	mov r5, sb, lsr #9
	orr r5, r5, sb, lsl #23
	add r5, r6, r5
	blt _020ABCB4
	ldr r0, _020ABEB8 ; =_02110718
	mov sb, #0
	add r8, r0, r3
	add r2, sp, #4
_020ABD8C:
	ldr r1, _020ABEBC ; =_02110798
	ldrb r0, [r8]
	add fp, r1, r3, lsl #2
	mvn r1, r7
	orr sl, r5, r1
	ldr r1, _020ABEBC ; =_02110798
	ldr r0, [r2, r0, lsl #2]
	ldr ip, [r1, r3, lsl #2]
	eor r1, r6, sl
	add r0, r1, r0
	add r0, ip, r0
	add r1, r4, r0
	mov r0, r1, lsr #0x1a
	orr r0, r0, r1, lsl #6
	ldrb r1, [r8, #1]
	add r4, r5, r0
	mvn r0, r6
	orr r0, r4, r0
	ldr ip, [r2, r1, lsl #2]
	eor r0, r5, r0
	add r0, r0, ip
	ldr sl, [fp, #4]
	ldrb ip, [r8, #2]
	add r0, sl, r0
	add r7, r7, r0
	mov r0, r7, lsr #0x16
	orr r0, r0, r7, lsl #10
	add r7, r4, r0
	mvn r0, r5
	orr r0, r7, r0
	ldr r1, [fp, #8]
	ldrb lr, [r8, #3]
	ldr ip, [r2, ip, lsl #2]
	eor r0, r4, r0
	add r0, r0, ip
	add r0, r1, r0
	add r6, r6, r0
	mov r1, r6, lsr #0x11
	orr r1, r1, r6, lsl #15
	add sb, sb, #1
	mvn sl, r4
	add r6, r7, r1
	orr r1, r6, sl
	ldr r0, [r2, lr, lsl #2]
	eor r1, r7, r1
	ldr fp, [fp, #0xc]
	add r0, r1, r0
	add r0, fp, r0
	add r1, r5, r0
	mov r0, r1, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r8, r8, #4
	add r5, r6, r0
	add r3, r3, #4
	cmp sb, #4
	blt _020ABD8C
	ldr r0, [sp]
	ldr r0, [r0]
	add r1, r0, r4
	ldr r0, [sp]
	str r1, [r0]
	ldr r0, [r0, #4]
	add r1, r0, r5
	ldr r0, [sp]
	str r1, [r0, #4]
	ldr r0, [r0, #8]
	add r1, r0, r6
	ldr r0, [sp]
	str r1, [r0, #8]
	ldr r0, [r0, #0xc]
	add r1, r0, r7
	ldr r0, [sp]
	str r1, [r0, #0xc]
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020ABEB8: .word _02110718
_020ABEBC: .word _02110798
	arm_func_end CPSi_md5_block

	arm_func_start CPSi_md5_init
CPSi_md5_init: ; 0x020ABEC0
	stmdb sp!, {r4, lr}
	mov r1, #0
	mov r2, #0x58
	mov r4, r0
	bl MI_CpuFill8
	ldr r1, _020ABEF8 ; =0x67452301
	ldr r0, _020ABEFC ; =0xEFCDAB89
	str r1, [r4]
	ldr r1, _020ABF00 ; =0x98BADCFE
	str r0, [r4, #4]
	ldr r0, _020ABF04 ; =0x10325476
	str r1, [r4, #8]
	str r0, [r4, #0xc]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020ABEF8: .word 0x67452301
_020ABEFC: .word 0xEFCDAB89
_020ABF00: .word 0x98BADCFE
_020ABF04: .word 0x10325476
	arm_func_end CPSi_md5_init

	arm_func_start CPSi_md5_calc
CPSi_md5_calc: ; 0x020ABF08
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r3, [r8, #0x10]
	mov r6, r2
	add r0, r3, r6, lsl #3
	str r0, [r8, #0x10]
	cmp r0, r6, lsl #3
	ldrlo r0, [r8, #0x14]
	mov r2, r3, lsr #3
	addlo r0, r0, #1
	strlo r0, [r8, #0x14]
	ldr r0, [r8, #0x14]
	and r4, r2, #0x3f
	rsb r5, r4, #0x40
	add r0, r0, r6, lsr #29
	mov r7, r1
	str r0, [r8, #0x14]
	cmp r6, r5
	blo _020ABFA4
	add r1, r8, #0x18
	mov r0, r7
	mov r2, r5
	add r1, r1, r4
	bl MI_CpuCopy8
	mov r0, r8
	add r1, r8, #0x18
	mov r4, #0
	bl CPSi_md5_block
	add r0, r5, #0x3f
	cmp r0, r6
	bhs _020ABFA8
_020ABF84:
	mov r0, r8
	add r1, r7, r5
	bl CPSi_md5_block
	add r5, r5, #0x40
	add r0, r5, #0x3f
	cmp r0, r6
	blo _020ABF84
	b _020ABFA8
_020ABFA4:
	mov r5, #0
_020ABFA8:
	add r1, r8, #0x18
	add r0, r7, r5
	add r1, r1, r4
	sub r2, r6, r5
	bl MI_CpuCopy8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end CPSi_md5_calc

	arm_func_start CPSi_md5_result
CPSi_md5_result: ; 0x020ABFC0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, r4
	add r1, r5, #0x10
	mov r2, #8
	bl char_from_long
	ldr r0, [r5, #0x10]
	ldr r1, _020AC024 ; =_02110758
	mov r0, r0, lsr #3
	and r0, r0, #0x3f
	cmp r0, #0x38
	rsblt r2, r0, #0x38
	rsbge r2, r0, #0x78
	mov r0, r5
	bl CPSi_md5_calc
	mov r0, r5
	mov r1, r4
	mov r2, #8
	bl CPSi_md5_calc
	mov r0, r4
	mov r1, r5
	mov r2, #0x10
	bl char_from_long
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AC024: .word _02110758
	arm_func_end CPSi_md5_result

	arm_func_start R
R: ; 0x020AC028
	add r2, r0, #0xd
	add ip, r0, #2
	and r3, r2, #0xf
	eor r2, r0, #8
	and ip, ip, #0xf
	ldr r3, [r1, r3, lsl #2]
	ldr r2, [r1, r2, lsl #2]
	ldr ip, [r1, ip, lsl #2]
	eor r2, r3, r2
	ldr r3, [r1, r0, lsl #2]
	eor r2, ip, r2
	eor r3, r3, r2
	mov r2, r3, lsr #0x1f
	orr r2, r2, r3, lsl #1
	str r2, [r1, r0, lsl #2]
	mov r0, r2
	bx lr
	arm_func_end R

	arm_func_start char_from_long__sha1
char_from_long__sha1: ; 0x020AC06C
	stmdb sp!, {r3, lr}
	movs r2, r2, lsr #2
	mov lr, #0
	ldmeqia sp!, {r3, pc}
_020AC07C:
	ldr ip, [r1], #4
	add lr, lr, #1
	mov r3, ip, lsr #0x18
	strb r3, [r0]
	mov r3, ip, lsr #0x10
	strb r3, [r0, #1]
	mov r3, ip, lsr #8
	strb r3, [r0, #2]
	strb ip, [r0, #3]
	cmp lr, r2
	add r0, r0, #4
	blo _020AC07C
	ldmia sp!, {r3, pc}
	arm_func_end char_from_long__sha1

	arm_func_start long_from_char__sha1
long_from_char__sha1: ; 0x020AC0B0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	cmp r2, #0
	ldmlsia sp!, {r3, r4, r5, pc}
_020AC0C0:
	add r4, r1, r5
	ldrb r3, [r4, #1]
	ldrb ip, [r1, r5]
	ldrb lr, [r4, #2]
	mov r3, r3, lsl #0x10
	orr r3, r3, ip, lsl #24
	ldrb ip, [r4, #3]
	orr r3, r3, lr, lsl #8
	add r5, r5, #4
	orr r3, ip, r3
	cmp r5, r2
	str r3, [r0], #4
	blo _020AC0C0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end long_from_char__sha1

	arm_func_start CPSi_sha1_block
CPSi_sha1_block: ; 0x020AC0F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x50
	str r0, [sp]
	ldr r3, [sp]
	add r0, sp, #0x10
	ldmia r3, {r4, r5, r7, r8, sb}
	mov r2, #0x40
	bl long_from_char__sha1
	mov r0, #0
	ldr r3, _020AC770 ; =0x5A827999
	mov r2, r0
	add r1, sp, #0x10
_020AC128:
	eor r6, r7, r8
	mov sl, r4, lsr #0x1b
	and r6, r5, r6
	orr fp, sl, r4, lsl #5
	eor r6, r8, r6
	mov sl, r5, lsr #2
	orr sl, sl, r5, lsl #30
	add r5, r1, r0, lsl #2
	add r6, fp, r6
	ldr ip, [r1, r0, lsl #2]
	ldr fp, [r5, #4]
	add r6, ip, r6
	add r6, r6, r3
	add sb, sb, r6
	mov r6, sb, lsr #0x1b
	orr r6, r6, sb, lsl #5
	eor ip, sl, r7
	and ip, r4, ip
	eor ip, r7, ip
	add r6, r6, ip
	add r6, fp, r6
	add r6, r6, r3
	add r8, r8, r6
	mov r6, r4, lsr #2
	orr r4, r6, r4, lsl #30
	ldr fp, [r5, #8]
	mov r6, r8, lsr #0x1b
	orr r6, r6, r8, lsl #5
	eor ip, r4, sl
	and ip, sb, ip
	eor ip, sl, ip
	add r6, r6, ip
	add r6, fp, r6
	add r6, r6, r3
	add r6, r7, r6
	mov r7, sb, lsr #2
	orr sb, r7, sb, lsl #30
	ldr r7, [r5, #0xc]
	ldr fp, [r5, #0x10]
	mov r5, r6, lsr #0x1b
	orr r5, r5, r6, lsl #5
	eor ip, sb, r4
	and ip, r8, ip
	eor ip, r4, ip
	add r5, r5, ip
	add r5, r7, r5
	add r5, r5, r3
	add r5, sl, r5
	mov r7, r8, lsr #2
	orr r8, r7, r8, lsl #30
	mov r7, r5, lsr #0x1b
	orr r7, r7, r5, lsl #5
	eor sl, r8, sb
	and sl, r6, sl
	eor sl, sb, sl
	add r7, r7, sl
	add r7, fp, r7
	add r7, r7, r3
	add r4, r4, r7
	mov r7, r6, lsr #2
	orr r7, r7, r6, lsl #30
	add r0, r0, #5
	add r2, r2, #1
	cmp r2, #3
	blt _020AC128
	eor r0, r7, r8
	mov r2, r4, lsr #0x1b
	and r0, r5, r0
	orr r3, r2, r4, lsl #5
	eor r0, r8, r0
	add r3, r3, r0
	ldr r6, [sp, #0x4c]
	ldr r0, _020AC770 ; =0x5A827999
	add r3, r6, r3
	add r3, r3, r0
	mov r2, r5, lsr #2
	orr r6, r2, r5, lsl #30
	mov r0, #0
	add sb, sb, r3
	bl R
	eor r1, r6, r7
	mov r3, sb, lsr #0x1b
	and r1, r4, r1
	mov r2, r4, lsr #2
	orr r3, r3, sb, lsl #5
	eor r1, r7, r1
	add r1, r3, r1
	add r3, r1, r0
	ldr r0, _020AC770 ; =0x5A827999
	add r1, sp, #0x10
	add r3, r3, r0
	orr r5, r2, r4, lsl #30
	mov r0, #1
	add r8, r8, r3
	bl R
	eor r1, r5, r6
	mov r2, r8, lsr #0x1b
	and r1, sb, r1
	orr r2, r2, r8, lsl #5
	eor r1, r6, r1
	add r1, r2, r1
	add r2, r1, r0
	ldr r0, _020AC770 ; =0x5A827999
	mov r1, sb, lsr #2
	add r0, r2, r0
	orr sb, r1, sb, lsl #30
	add r7, r7, r0
	add r1, sp, #0x10
	mov r0, #2
	bl R
	mov r1, r7, lsr #0x1b
	orr r2, r1, r7, lsl #5
	eor r1, sb, r5
	and r1, r8, r1
	eor r1, r5, r1
	add r1, r2, r1
	add r2, r1, r0
	ldr r0, _020AC770 ; =0x5A827999
	mov r1, r8, lsr #2
	add r0, r2, r0
	orr r8, r1, r8, lsl #30
	add r6, r6, r0
	mov r0, #3
	add r1, sp, #0x10
	bl R
	mov r1, r6, lsr #0x1b
	orr r2, r1, r6, lsl #5
	eor r1, r8, sb
	and r1, r7, r1
	eor r1, sb, r1
	add r1, r2, r1
	add r2, r1, r0
	ldr r0, _020AC770 ; =0x5A827999
	mov r1, r7, lsr #2
	add r0, r2, r0
	add r5, r5, r0
	mov r0, #0
	ldr r4, _020AC774 ; =0x6ED9EBA1
	orr r7, r1, r7, lsl #30
	mov sl, #4
	str r0, [sp, #4]
	add fp, sp, #0x10
_020AC360:
	mov r0, sl
	mov r1, fp
	bl R
	mov r2, r5, lsr #0x1b
	eor r1, r6, r7
	orr r2, r2, r5, lsl #5
	eor r1, r8, r1
	add r1, r2, r1
	add r0, r1, r0
	add r1, r0, r4
	mov r0, r6, lsr #2
	add sb, sb, r1
	orr r6, r0, r6, lsl #30
	add r0, sl, #1
	mov r1, fp
	bl R
	mov r1, sb, lsr #0x1b
	orr r2, r1, sb, lsl #5
	eor r1, r5, r6
	eor r1, r7, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r8, r8, r0
	mov r0, r5, lsr #2
	orr r5, r0, r5, lsl #30
	add r0, sl, #2
	and sl, r0, #0xf
	mov r0, sl
	mov r1, fp
	bl R
	mov r1, r8, lsr #0x1b
	orr r2, r1, r8, lsl #5
	eor r1, sb, r5
	eor r1, r6, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r7, r7, r0
	mov r0, sb, lsr #2
	orr sb, r0, sb, lsl #30
	add r0, sl, #1
	mov r1, fp
	bl R
	mov r1, r7, lsr #0x1b
	orr r2, r1, r7, lsl #5
	eor r1, r8, sb
	eor r1, r5, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r6, r6, r0
	mov r0, r8, lsr #2
	orr r8, r0, r8, lsl #30
	add r0, sl, #2
	mov r1, fp
	bl R
	mov r1, r6, lsr #0x1b
	orr r2, r1, r6, lsl #5
	eor r1, r7, r8
	eor r1, sb, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r5, r5, r0
	mov r1, r7, lsr #2
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #4
	orr r7, r1, r7, lsl #30
	add sl, sl, #3
	blt _020AC360
	mov r0, #0
	ldr r4, _020AC778 ; =0x8F1BBCDC
	str r0, [sp, #8]
	add fp, sp, #0x10
_020AC494:
	mov r0, sl
	mov r1, fp
	bl R
	orr r2, r7, r8
	mov r1, r5, lsr #0x1b
	orr r1, r1, r5, lsl #5
	and r3, r6, r2
	and r2, r7, r8
	orr r2, r3, r2
	add r1, r1, r2
	add r1, r1, r0
	mov r0, r6, lsr #2
	add r1, r1, r4
	add sb, sb, r1
	orr r6, r0, r6, lsl #30
	add r0, sl, #1
	mov r1, fp
	bl R
	mov r1, sb, lsr #0x1b
	orr r1, r1, sb, lsl #5
	orr r2, r6, r7
	and r3, r5, r2
	and r2, r6, r7
	orr r2, r3, r2
	add r1, r1, r2
	add r0, r1, r0
	add r0, r0, r4
	add r8, r8, r0
	mov r0, r5, lsr #2
	orr r5, r0, r5, lsl #30
	add r0, sl, #2
	mov r1, fp
	bl R
	mov r1, r8, lsr #0x1b
	orr r1, r1, r8, lsl #5
	orr r2, r5, r6
	and r3, sb, r2
	and r2, r5, r6
	orr r2, r3, r2
	add r1, r1, r2
	add r0, r1, r0
	add r0, r0, r4
	add r7, r7, r0
	mov r0, sb, lsr #2
	orr sb, r0, sb, lsl #30
	add r0, sl, #3
	and sl, r0, #0xf
	mov r0, sl
	mov r1, fp
	bl R
	mov r1, r7, lsr #0x1b
	orr r1, r1, r7, lsl #5
	orr r2, sb, r5
	and r3, r8, r2
	and r2, sb, r5
	orr r2, r3, r2
	add r1, r1, r2
	add r0, r1, r0
	add r0, r0, r4
	add r6, r6, r0
	mov r0, r8, lsr #2
	orr r8, r0, r8, lsl #30
	add r0, sl, #1
	mov r1, fp
	bl R
	mov r1, r6, lsr #0x1b
	orr r1, r1, r6, lsl #5
	orr r2, r8, sb
	and r3, r7, r2
	and r2, r8, sb
	orr r2, r3, r2
	add r1, r1, r2
	add r0, r1, r0
	add r0, r0, r4
	add r5, r5, r0
	mov r1, r7, lsr #2
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #4
	orr r7, r1, r7, lsl #30
	add sl, sl, #2
	blt _020AC494
	mov r0, #0
	ldr r4, _020AC77C ; =0xCA62C1D6
	str r0, [sp, #0xc]
	add fp, sp, #0x10
_020AC5F0:
	mov r0, sl
	mov r1, fp
	bl R
	mov r2, r5, lsr #0x1b
	eor r1, r6, r7
	orr r2, r2, r5, lsl #5
	eor r1, r8, r1
	add r1, r2, r1
	add r0, r1, r0
	add r1, r0, r4
	mov r0, r6, lsr #2
	add sb, sb, r1
	orr r6, r0, r6, lsl #30
	add r0, sl, #1
	mov r1, fp
	bl R
	mov r1, sb, lsr #0x1b
	orr r2, r1, sb, lsl #5
	eor r1, r5, r6
	eor r1, r7, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r8, r8, r0
	mov r0, r5, lsr #2
	orr r5, r0, r5, lsl #30
	add r0, sl, #2
	mov r1, fp
	bl R
	mov r1, r8, lsr #0x1b
	orr r2, r1, r8, lsl #5
	eor r1, sb, r5
	eor r1, r6, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r7, r7, r0
	mov r0, sb, lsr #2
	orr sb, r0, sb, lsl #30
	add r0, sl, #3
	mov r1, fp
	bl R
	mov r1, r7, lsr #0x1b
	orr r2, r1, r7, lsl #5
	eor r1, r8, sb
	eor r1, r5, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r6, r6, r0
	mov r0, r8, lsr #2
	orr r8, r0, r8, lsl #30
	add r0, sl, #4
	and sl, r0, #0xf
	mov r0, sl
	mov r1, fp
	bl R
	mov r1, r6, lsr #0x1b
	orr r2, r1, r6, lsl #5
	eor r1, r7, r8
	eor r1, sb, r1
	add r1, r2, r1
	add r0, r1, r0
	add r0, r0, r4
	add r5, r5, r0
	mov r1, r7, lsr #2
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #4
	orr r7, r1, r7, lsl #30
	add sl, sl, #1
	blt _020AC5F0
	ldr r0, [sp]
	ldr r0, [r0]
	add r1, r0, r5
	ldr r0, [sp]
	str r1, [r0]
	ldr r0, [r0, #4]
	add r1, r0, r6
	ldr r0, [sp]
	str r1, [r0, #4]
	ldr r0, [r0, #8]
	add r1, r0, r7
	ldr r0, [sp]
	str r1, [r0, #8]
	ldr r0, [r0, #0xc]
	add r1, r0, r8
	ldr r0, [sp]
	str r1, [r0, #0xc]
	ldr r0, [r0, #0x10]
	add r1, r0, sb
	ldr r0, [sp]
	str r1, [r0, #0x10]
	add sp, sp, #0x50
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AC770: .word 0x5A827999
_020AC774: .word 0x6ED9EBA1
_020AC778: .word 0x8F1BBCDC
_020AC77C: .word 0xCA62C1D6
	arm_func_end CPSi_sha1_block

	arm_func_start CPSi_sha1_init
CPSi_sha1_init: ; 0x020AC780
	stmdb sp!, {r4, lr}
	mov r1, #0
	mov r2, #0x5c
	mov r4, r0
	bl MI_CpuFill8
	ldr r0, _020AC7C0 ; =0x67452301
	ldr r1, _020AC7C4 ; =0xEFCDAB89
	str r0, [r4]
	ldr r0, _020AC7C8 ; =0x98BADCFE
	str r1, [r4, #4]
	ldr r1, _020AC7CC ; =0x10325476
	str r0, [r4, #8]
	ldr r0, _020AC7D0 ; =0xC3D2E1F0
	str r1, [r4, #0xc]
	str r0, [r4, #0x10]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AC7C0: .word 0x67452301
_020AC7C4: .word 0xEFCDAB89
_020AC7C8: .word 0x98BADCFE
_020AC7CC: .word 0x10325476
_020AC7D0: .word 0xC3D2E1F0
	arm_func_end CPSi_sha1_init

	arm_func_start CPSi_sha1_calc
CPSi_sha1_calc: ; 0x020AC7D4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	ldr r3, [r8, #0x18]
	mov r6, r2
	add r0, r3, r6, lsl #3
	str r0, [r8, #0x18]
	cmp r0, r6, lsl #3
	ldrlo r0, [r8, #0x14]
	mov r2, r3, lsr #3
	addlo r0, r0, #1
	strlo r0, [r8, #0x14]
	ldr r0, [r8, #0x14]
	and r4, r2, #0x3f
	rsb r5, r4, #0x40
	add r0, r0, r6, lsr #29
	mov r7, r1
	str r0, [r8, #0x14]
	cmp r6, r5
	blo _020AC870
	add r1, r8, #0x1c
	mov r0, r7
	mov r2, r5
	add r1, r1, r4
	bl MI_CpuCopy8
	mov r0, r8
	add r1, r8, #0x1c
	mov r4, #0
	bl CPSi_sha1_block
	add r0, r5, #0x3f
	cmp r0, r6
	bhs _020AC874
_020AC850:
	mov r0, r8
	add r1, r7, r5
	bl CPSi_sha1_block
	add r5, r5, #0x40
	add r0, r5, #0x3f
	cmp r0, r6
	blo _020AC850
	b _020AC874
_020AC870:
	mov r5, #0
_020AC874:
	add r1, r8, #0x1c
	add r0, r7, r5
	add r1, r1, r4
	sub r2, r6, r5
	bl MI_CpuCopy8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end CPSi_sha1_calc

	arm_func_start CPSi_sha1_result
CPSi_sha1_result: ; 0x020AC88C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, r4
	add r1, r5, #0x14
	mov r2, #8
	bl char_from_long__sha1
	ldr r0, [r5, #0x18]
	ldr r1, _020AC8F0 ; =_02110898
	mov r0, r0, lsr #3
	and r0, r0, #0x3f
	cmp r0, #0x38
	rsblt r2, r0, #0x38
	rsbge r2, r0, #0x78
	mov r0, r5
	bl CPSi_sha1_calc
	mov r0, r5
	mov r1, r4
	mov r2, #8
	bl CPSi_sha1_calc
	mov r0, r4
	mov r1, r5
	mov r2, #0x14
	bl char_from_long__sha1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AC8F0: .word _02110898
	arm_func_end CPSi_sha1_result

	arm_func_start CPSi_sha1_result_prng
CPSi_sha1_result_prng: ; 0x020AC8F4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr r1, _020AC920 ; =_02110899
	mov r5, r0
	mov r2, #0x2c
	bl CPSi_sha1_calc
	mov r0, r4
	mov r1, r5
	mov r2, #0x14
	bl char_from_long__sha1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AC920: .word _02110899
	arm_func_end CPSi_sha1_result_prng

	arm_func_start CPSi_rc4_init
CPSi_rc4_init: ; 0x020AC924
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r3, #0
	strb r3, [r0]
	strb r3, [r0, #1]
	add r4, r0, #2
_020AC938:
	strb r3, [r4, r3]
	add r3, r3, #1
	cmp r3, #0x100
	blt _020AC938
	mov r6, #0
	mov r5, r6
	mov r7, r6
	mov r0, r6
_020AC958:
	ldrb lr, [r4, r7]
	ldrb ip, [r1, r6]
	add r3, r6, #1
	and r6, r3, #0xff
	add r3, lr, ip
	add r3, r5, r3
	and r5, r3, #0xff
	ldrb r3, [r4, r5]
	cmp r6, r2
	movge r6, r0
	strb r3, [r4, r7]
	add r7, r7, #1
	strb lr, [r4, r5]
	cmp r7, #0x100
	blt _020AC958
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CPSi_rc4_init

	arm_func_start CPSi_rc4_crypt
CPSi_rc4_crypt: ; 0x020AC998
	stmdb sp!, {r4, r5, r6, lr}
	cmp r2, #0
	add r4, r0, #2
	ldrb ip, [r0]
	ldrb lr, [r0, #1]
	mov r3, #0
	ble _020AC9F8
_020AC9B4:
	add r5, ip, #1
	and ip, r5, #0xff
	ldrb r6, [r4, ip]
	add r5, lr, r6
	and lr, r5, #0xff
	ldrb r5, [r4, lr]
	strb r5, [r4, ip]
	add r5, r6, r5
	strb r6, [r4, lr]
	and r5, r5, #0xff
	ldrb r6, [r1, r3]
	ldrb r5, [r4, r5]
	eor r5, r6, r5
	strb r5, [r1, r3]
	add r3, r3, #1
	cmp r3, r2
	blt _020AC9B4
_020AC9F8:
	strb ip, [r0]
	strb lr, [r0, #1]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end CPSi_rc4_crypt

	arm_func_start count_digits
count_digits: ; 0x020ACA04
	b _020ACA0C
_020ACA08:
	sub r1, r1, #1
_020ACA0C:
	cmp r1, #0
	beq _020ACA24
	add r2, r0, r1, lsl #1
	ldrh r2, [r2, #-2]
	cmp r2, #0
	beq _020ACA08
_020ACA24:
	mov r0, r1
	bx lr
	arm_func_end count_digits

	arm_func_start CPSi_big_sign
CPSi_big_sign: ; 0x020ACA2C
	stmdb sp!, {r3, lr}
	sub r2, r1, #1
	mov r2, r2, lsl #1
	ldrh r2, [r0, r2]
	tst r2, #0x8000
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	bl count_digits
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end CPSi_big_sign

	arm_func_start CPSi_big_add
CPSi_big_add: ; 0x020ACA5C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r5, r3
	mov r8, r0
	mov r6, r2
	mov r0, r7
	mov r1, r5
	bl count_digits
	mov r4, r0
	mov r0, r6
	mov r1, r5
	bl count_digits
	cmp r4, r0
	movlt r4, r0
	cmp r4, r5
	addne r4, r4, #1
	mov ip, #0
	mov r3, ip
	cmp r4, #0
	ble _020ACAD4
_020ACAAC:
	mov r2, r3, lsl #1
	ldrh r1, [r7, r2]
	ldrh r0, [r6, r2]
	add r3, r3, #1
	cmp r3, r4
	add r0, r1, r0
	add r0, ip, r0
	strh r0, [r8, r2]
	mov ip, r0, lsr #0x10
	blt _020ACAAC
_020ACAD4:
	cmp r8, r7
	cmpne r8, r6
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	sub r1, r5, r3
	add r0, r8, r3, lsl #1
	mov r2, r1, lsl #1
	mov r1, #0
	bl MI_CpuFill8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end CPSi_big_add

	arm_func_start CPSi_big_add_small
CPSi_big_add_small: ; 0x020ACAF8
	stmdb sp!, {r4, lr}
	cmp r3, #0
	mov r4, #0
	ble _020ACB2C
_020ACB08:
	mov lr, r4, lsl #1
	ldrh ip, [r1, lr]
	add r2, r2, ip
	strh r2, [r0, lr]
	movs r2, r2, lsr #0x10
	beq _020ACB2C
	add r4, r4, #1
	cmp r4, r3
	blt _020ACB08
_020ACB2C:
	cmp r0, r1
	ldmeqia sp!, {r4, pc}
	add r4, r4, #1
	cmp r4, r3
	ldmgeia sp!, {r4, pc}
_020ACB40:
	mov ip, r4, lsl #1
	ldrh r2, [r1, ip]
	add r4, r4, #1
	cmp r4, r3
	strh r2, [r0, ip]
	blt _020ACB40
	ldmia sp!, {r4, pc}
	arm_func_end CPSi_big_add_small

	arm_func_start CPSi_big_negate
CPSi_big_negate: ; 0x020ACB5C
	stmdb sp!, {r3, lr}
	mov r3, r1
	cmp r3, #0
	mov ip, #0
	ble _020ACB8C
_020ACB70:
	mov r2, ip, lsl #1
	ldrh r1, [r0, r2]
	add ip, ip, #1
	cmp ip, r3
	mvn r1, r1
	strh r1, [r0, r2]
	blt _020ACB70
_020ACB8C:
	mov r1, r0
	mov r2, #1
	bl CPSi_big_add_small
	ldmia sp!, {r3, pc}
	arm_func_end CPSi_big_negate

	arm_func_start CPSi_big_sub
CPSi_big_sub: ; 0x020ACB9C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r5, r3
	mov r8, r0
	mov r6, r2
	mov r0, r7
	mov r1, r5
	bl count_digits
	mov r4, r0
	mov r0, r6
	mov r1, r5
	bl count_digits
	cmp r4, r0
	movlt r4, r0
	mov ip, #0
	cmp r4, r5
	addne r4, r4, #1
	mov r3, ip
	b _020ACC08
_020ACBE8:
	mov r2, r3, lsl #1
	ldrh r1, [r7, r2]
	ldrh r0, [r6, r2]
	add r3, r3, #1
	sub r0, r1, r0
	add r0, ip, r0
	strh r0, [r8, r2]
	mov ip, r0, asr #0x10
_020ACC08:
	cmp r3, r4
	blt _020ACBE8
	cmp r3, r5
	bge _020ACC20
	cmp ip, #0
	bne _020ACBE8
_020ACC20:
	cmp r8, r7
	cmpne r8, r6
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	sub r1, r5, r3
	add r0, r8, r3, lsl #1
	mov r2, r1, lsl #1
	mov r1, #0
	bl MI_CpuFill8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end CPSi_big_sub

	arm_func_start CPSi_big_sub_small
CPSi_big_sub_small: ; 0x020ACC44
	stmdb sp!, {r4, lr}
	cmp r3, #0
	mov r4, #0
	ble _020ACC7C
_020ACC54:
	mov lr, r4, lsl #1
	ldrh ip, [r1, lr]
	sub ip, ip, r2
	mov r2, ip, lsr #0x10
	strh ip, [r0, lr]
	ands r2, r2, #1
	beq _020ACC7C
	add r4, r4, #1
	cmp r4, r3
	blt _020ACC54
_020ACC7C:
	cmp r0, r1
	ldmeqia sp!, {r4, pc}
	add r4, r4, #1
	cmp r4, r3
	ldmgeia sp!, {r4, pc}
_020ACC90:
	mov ip, r4, lsl #1
	ldrh r2, [r1, ip]
	add r4, r4, #1
	cmp r4, r3
	strh r2, [r0, ip]
	blt _020ACC90
	ldmia sp!, {r4, pc}
	arm_func_end CPSi_big_sub_small

	arm_func_start CPSi_big_compare
CPSi_big_compare: ; 0x020ACCAC
	subs ip, r2, #1
	bmi _020ACCDC
_020ACCB4:
	mov r2, ip, lsl #1
	ldrh r3, [r1, r2]
	ldrh r2, [r0, r2]
	cmp r2, r3
	movhi r0, #1
	bxhi lr
	mvnlo r0, #0
	bxlo lr
	subs ip, ip, #1
	bpl _020ACCB4
_020ACCDC:
	mov r0, #0
	bx lr
	arm_func_end CPSi_big_compare

	arm_func_start CPSi_big_add_part
CPSi_big_add_part: ; 0x020ACCE4
	stmdb sp!, {r3, lr}
	b _020ACD04
_020ACCEC:
	mov lr, r2, lsl #1
	ldrh ip, [r0, lr]
	add r2, r2, #1
	add r1, r1, ip
	strh r1, [r0, lr]
	mov r1, r1, lsr #0x10
_020ACD04:
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	cmp r2, r3
	blt _020ACCEC
	ldmia sp!, {r3, pc}
	arm_func_end CPSi_big_add_part

	arm_func_start CPSi_big_mult
CPSi_big_mult: ; 0x020ACD18
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r8, r3
	mov sl, r1
	mov sb, r2
	mov r2, r8, lsl #1
	mov r1, #0
	str r0, [sp]
	bl MI_CpuFill8
	mov r0, sl
	mov r1, r8
	bl count_digits
	mov fp, r0
	mov r0, sb
	mov r1, r8
	bl count_digits
	str r0, [sp, #4]
	cmp r0, #0
	mov r5, #0
	addle sp, sp, #8
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020ACD6C:
	mov r6, #0
	sub r7, r8, r5
	mov r4, r5, lsl #1
	b _020ACDA0
_020ACD7C:
	mov r0, r6, lsl #1
	ldrh r3, [sl, r0]
	ldrh r1, [sb, r4]
	ldr r0, [sp]
	add r2, r5, r6
	mul r1, r3, r1
	mov r3, r8
	bl CPSi_big_add_part
	add r6, r6, #1
_020ACDA0:
	cmp r6, fp
	cmplt r6, r7
	blt _020ACD7C
	ldr r0, [sp, #4]
	add r5, r5, #1
	cmp r5, r0
	blt _020ACD6C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end CPSi_big_mult

	arm_func_start CPSi_big_mult_small
CPSi_big_mult_small: ; 0x020ACDC4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r4, r3
	mov r7, r0
	mov r0, r6
	mov r1, r4
	mov r5, r2
	bl count_digits
	mov r3, #0
	mov ip, r3
	cmp r0, #0
	ble _020ACE14
_020ACDF4:
	mov r2, ip, lsl #1
	ldrh r1, [r6, r2]
	add ip, ip, #1
	cmp ip, r0
	mla r1, r5, r1, r3
	strh r1, [r7, r2]
	mov r3, r1, lsr #0x10
	blt _020ACDF4
_020ACE14:
	cmp ip, r4
	movlt r0, ip, lsl #1
	addlt ip, ip, #1
	sub r1, r4, ip
	strlth r3, [r7, r0]
	mov r2, r1, lsl #1
	add r0, r7, ip, lsl #1
	mov r1, #0
	bl MI_CpuFill8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end CPSi_big_mult_small

	arm_func_start CPSi_big_sqr
CPSi_big_sqr: ; 0x020ACE3C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov r8, r2
	mov sl, r0
	mov r0, sb
	mov r1, r8
	bl count_digits
	mov fp, r0
	cmp r8, fp, lsl #1
	mov r0, fp, lsl #1
	ble _020ACE7C
	sub r1, r8, r0
	add r0, sl, r0, lsl #1
	mov r2, r1, lsl #1
	mov r1, #0
	bl MI_CpuFill8
_020ACE7C:
	cmp fp, #0
	mov r4, #0
	ble _020ACED0
	mov r5, r4
	sub r2, r8, #1
_020ACE90:
	cmp r5, r8
	bge _020ACED0
	mov r0, r4, lsl #1
	ldrh r3, [sb, r0]
	mov r0, r5, lsl #1
	cmp r5, r2
	mul r1, r3, r3
	strh r1, [sl, r0]
	beq _020ACED0
	add r4, r4, #1
	mov r1, r1, lsr #0x10
	add r0, sl, r0
	strh r1, [r0, #2]
	cmp r4, fp
	add r5, r5, #2
	blt _020ACE90
_020ACED0:
	mov r6, #0
	cmp fp, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020ACEDC:
	mov r0, r6, lsl #1
	add r4, r6, #1
	str r0, [sp]
	b _020ACF4C
_020ACEEC:
	mov r0, r4, lsl #1
	ldrh r1, [sb, r0]
	ldr r0, [sp]
	ldrh r0, [sb, r0]
	mul r7, r1, r0
	ldr r0, _020ACF6C ; =0x7FFF8000
	cmp r7, r0
	mov r0, sl
	bhi _020ACF24
	mov r2, r5
	mov r3, r8
	mov r1, r7, lsl #1
	bl CPSi_big_add_part
	b _020ACF48
_020ACF24:
	mov r1, r7
	mov r2, r5
	mov r3, r8
	bl CPSi_big_add_part
	mov r1, r7
	mov r2, r5
	mov r0, sl
	mov r3, r8
	bl CPSi_big_add_part
_020ACF48:
	add r4, r4, #1
_020ACF4C:
	cmp r4, fp
	addlt r5, r6, r4
	cmplt r5, r8
	blt _020ACEEC
	add r6, r6, #1
	cmp r6, fp
	blt _020ACEDC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020ACF6C: .word 0x7FFF8000
	arm_func_end CPSi_big_sqr

	arm_func_start get48bits_1
get48bits_1: ; 0x020ACF70
	ldrh r1, [r0]
	mov r0, #0
	bx lr
	arm_func_end get48bits_1

	arm_func_start get48bits_2
get48bits_2: ; 0x020ACF7C
	ldrh r1, [r0]
	ldrh r0, [r0, #-2]
	mov r0, r0, lsl #0x10
	bx lr
	arm_func_end get48bits_2

	arm_func_start get48bits_3
get48bits_3: ; 0x020ACF8C
	ldrh r1, [r0]
	ldrh r2, [r0, #-2]
	ldrh r3, [r0, #-4]
	orr r0, r3, r2, lsl #16
	bx lr
	arm_func_end get48bits_3

	arm_func_start get64bits
get64bits: ; 0x020ACFA0
	ldrh r2, [r0]
	ldrh r3, [r0, #-2]
	orr r1, r3, r2, lsl #16
	ldrh r2, [r0, #-4]
	ldrh r3, [r0, #-6]
	orr r0, r3, r2, lsl #16
	bx lr
	arm_func_end get64bits

	arm_func_start CPSi_big_div
CPSi_big_div: ; 0x020ACFBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	ldr sb, [sp, #0x48]
	ldr r8, [sp, #0x4c]
	str r1, [sp, #4]
	add r6, r8, sb, lsl #1
	str r0, [sp]
	mov sl, r2
	mov r0, r6
	mov r2, sb, lsl #2
	mov r1, #0
	str r3, [sp, #8]
	add r7, r6, sb, lsl #1
	bl MI_CpuFill8
	ldr r0, [sp, #4]
	mov r1, sb
	bl count_digits
	mov fp, r0
	mov r0, sl
	mov r1, sb
	bl count_digits
	mov r5, r0
	cmp fp, #0
	cmpgt r5, #0
	ble _020AD154
	sub r0, sb, fp
	add r0, r5, r0
	sub r4, r0, #1
	cmp r4, sb
	blt _020AD048
	ldr r0, [sp, #4]
	mov r1, r7
	mov r2, sb, lsl #1
	bl MI_CpuCopy8
	b _020AD154
_020AD048:
	ldr r0, [sp, #4]
	add r1, r6, r4, lsl #1
	mov r2, fp, lsl #1
	bl MI_CpuCopy8
	cmp r5, #2
	ble _020AD07C
	add r0, sl, r5, lsl #1
	sub r0, r0, #2
	mov fp, r5, lsl #1
	bl get48bits_3
	str r0, [sp, #0x18]
	str r1, [sp, #0x10]
	b _020AD0B0
_020AD07C:
	add r0, sl, r5, lsl #1
	cmp r5, #1
	sub r0, r0, #2
	ble _020AD0A0
	mov fp, r5, lsl #1
	bl get48bits_2
	str r0, [sp, #0x18]
	str r1, [sp, #0x10]
	b _020AD0B0
_020AD0A0:
	mov fp, r5, lsl #1
	bl get48bits_1
	str r0, [sp, #0x18]
	str r1, [sp, #0x10]
_020AD0B0:
	cmp r4, sb
	bge _020AD154
	mov r0, sb, lsl #1
	sub r0, r0, #1
	mov r0, r0, lsl #1
	str r0, [sp, #0x14]
_020AD0C8:
	ldr r2, [sp, #0x14]
	mov r1, r6
	add r0, r6, #2
	bl memmove
	add r0, r7, fp
	bl get64bits
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x10]
	bl _ll_udiv
	mov r5, r0
	ldr r0, _020AD198 ; =0x0000FFFF
	cmp r5, r0
	movhi r5, r0
_020AD0FC:
	mov r2, r5, lsl #0x10
	mov r0, r8
	mov r1, sl
	mov r2, r2, lsr #0x10
	mov r3, sb
	bl CPSi_big_mult_small
	mov r0, r7
	mov r1, r8
	mov r2, sb
	bl CPSi_big_compare
	cmp r0, #0
	sublt r5, r5, #1
	blt _020AD0FC
	mov r0, r7
	mov r1, r7
	mov r2, r8
	mov r3, sb
	bl CPSi_big_sub
	strh r5, [r6]
	add r4, r4, #1
	cmp r4, sb
	blt _020AD0C8
_020AD154:
	ldr r0, [sp]
	cmp r0, #0
	beq _020AD170
	ldr r1, [sp]
	mov r0, r6
	mov r2, sb, lsl #1
	bl MI_CpuCopy8
_020AD170:
	ldr r0, [sp, #8]
	cmp r0, #0
	addeq sp, sp, #0x20
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sp, #8]
	mov r0, r7
	mov r2, sb, lsl #1
	bl MI_CpuCopy8
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AD198: .word 0x0000FFFF
	arm_func_end CPSi_big_div

	arm_func_start CPSi_big_power
CPSi_big_power: ; 0x020AD19C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r4, _020AD328 ; =_021D4634
	mov r8, r3
	ldr r3, [r4]
	mov sl, r0
	mov r0, r8, lsl #3
	ldr r7, [sp, #0x30]
	str r1, [sp, #8]
	mov sb, r2
	blx r3
	movs r4, r0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	sub r1, r8, #1
	add r0, sl, #2
	mov r2, r1, lsl #1
	mov r1, #0
	add r5, r4, r8, lsl #1
	bl MI_CpuFill8
	mov r2, #1
	mov r0, sb
	mov r1, r8
	strh r2, [sl]
	bl count_digits
	sub r0, r8, r0
	mov r6, r0, lsl #4
	cmp r6, r8, lsl #4
	bhs _020AD250
	mov r2, #0x8000
_020AD214:
	sub r0, r8, r6, asr #4
	add r0, sb, r0, lsl #1
	ldrh r0, [r0, #-2]
	and r1, r6, #0xf
	tst r0, r2, lsr r1
	beq _020AD244
	ldr r0, [sp, #8]
	mov r1, sl
	mov r2, r8, lsl #1
	bl MI_CpuCopy8
	add r6, r6, #1
	b _020AD250
_020AD244:
	add r6, r6, #1
	cmp r6, r8, lsl #4
	blo _020AD214
_020AD250:
	cmp r6, r8, lsl #4
	bhs _020AD310
	mov fp, r8, lsl #1
_020AD25C:
	mov r0, r4
	mov r1, sl
	mov r2, r8
	bl CPSi_big_sqr
	mov r0, r4
	mov r1, sl
	mov r2, fp
	bl MI_CpuCopy8
	cmp r7, #0
	beq _020AD2A0
	str r8, [sp]
	mov r0, #0
	mov r1, sl
	mov r2, r7
	mov r3, sl
	str r5, [sp, #4]
	bl CPSi_big_div
_020AD2A0:
	sub r0, r8, r6, asr #4
	add r0, sb, r0, lsl #1
	ldrh r1, [r0, #-2]
	and r2, r6, #0xf
	mov r0, #0x8000
	tst r1, r0, lsr r2
	beq _020AD304
	ldr r2, [sp, #8]
	mov r0, r4
	mov r1, sl
	mov r3, r8
	bl CPSi_big_mult
	mov r0, r4
	mov r1, sl
	mov r2, fp
	bl MI_CpuCopy8
	cmp r7, #0
	beq _020AD304
	str r8, [sp]
	mov r0, #0
	mov r1, sl
	mov r2, r7
	mov r3, sl
	str r5, [sp, #4]
	bl CPSi_big_div
_020AD304:
	add r6, r6, #1
	cmp r6, r8, lsl #4
	blo _020AD25C
_020AD310:
	ldr r1, _020AD32C ; =_021D4660
	mov r0, r4
	ldr r1, [r1]
	blx r1
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AD328: .word _021D4634
_020AD32C: .word _021D4660
	arm_func_end CPSi_big_power

	arm_func_start CPSi_big_modinv
CPSi_big_modinv: ; 0x020AD330
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr sb, [sp, #0x38]
	mov sl, r3
	add fp, sb, sl, lsl #1
	add r4, fp, sl, lsl #1
	add r5, r4, sl, lsl #1
	add r6, r5, sl, lsl #1
	add r7, r6, sl, lsl #1
	str r0, [sp, #8]
	mov r0, r1
	add r1, r7, sl, lsl #1
	str r1, [sp, #0x10]
	mov r8, sl, lsl #1
	str r2, [sp, #0xc]
	mov r1, sb
	mov r2, r8
	bl MI_CpuCopy8
	ldr r0, [sp, #0xc]
	mov r1, r4
	mov r2, r8
	bl MI_CpuCopy8
	mov r0, #1
	strh r0, [r4, r8]
	mov r0, sb
	mov r1, sl
	bl CPSi_big_sign
	cmp r0, #0
	ble _020AD440
_020AD3A4:
	ldr r3, [sp, #0x10]
	str sl, [sp]
	str r3, [sp, #4]
	mov r0, fp
	mov r1, r4
	mov r2, sb
	mov r3, r7
	bl CPSi_big_div
	mov r0, sb
	mov r1, r4
	mov r2, r8
	bl MI_CpuCopy8
	mov r0, r7
	mov r1, sb
	mov r2, r8
	bl MI_CpuCopy8
	mov r0, r7
	mov r1, fp
	mov r2, r5
	mov r3, sl
	bl CPSi_big_mult
	mov r0, r7
	mov r1, r6
	mov r2, r7
	mov r3, sl
	bl CPSi_big_sub
	mov r0, r5
	mov r1, r6
	mov r2, r8
	bl MI_CpuCopy8
	mov r0, r7
	mov r1, r5
	mov r2, r8
	bl MI_CpuCopy8
	mov r0, sb
	mov r1, sl
	bl CPSi_big_sign
	cmp r0, #0
	bgt _020AD3A4
_020AD440:
	ldr r2, [sp, #0xc]
	mov r0, r6
	mov r1, r6
	mov r3, sl
	bl CPSi_big_add
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #8]
	ldr r4, [sp, #0x10]
	str sl, [sp]
	mov r1, r6
	mov r0, #0
	str r4, [sp, #4]
	bl CPSi_big_div
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end CPSi_big_modinv

	arm_func_start CPSi_big_montmult
CPSi_big_montmult: ; 0x020AD47C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r3
	mov r4, r6, lsl #1
	mov r8, r2
	mov r2, r4
	mov r7, r0
	mov sb, r1
	ldr r5, [sp, #0x20]
	bl MI_CpuCopy8
	cmp r8, #1
	bne _020AD4BC
	mov r0, r7
	mov r1, sb
	mov r2, r6
	bl CPSi_big_sqr
	b _020AD4D8
_020AD4BC:
	cmp r8, #0
	beq _020AD4D8
	mov r0, r7
	mov r1, sb
	mov r2, r8
	mov r3, r6
	bl CPSi_big_mult
_020AD4D8:
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x28]
	mov r1, r7
	mov r3, r5
	bl CPSi_big_mult
	sub r1, r6, r5
	ldr r0, [sp, #0x2c]
	mov r8, r1, lsl #1
	mov r2, r8
	add r0, r0, r5, lsl #1
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x24]
	mov r3, r6
	bl CPSi_big_mult
	mov r0, r7
	mov r1, r7
	ldr r2, [sp, #0x30]
	mov r3, r6
	bl CPSi_big_add
	mov r2, r8
	mov r0, r7
	add r1, r7, r5, lsl #1
	bl memmove
	add r0, r7, r6, lsl #1
	sub r0, r0, r5, lsl #1
	mov r2, r5, lsl #1
	mov r1, #0
	bl MI_CpuFill8
	mov r0, r7
	ldr r1, [sp, #0x24]
	mov r2, r6
	bl CPSi_big_compare
	cmp r0, #0
	beq _020AD578
	cmp r0, #1
	beq _020AD58C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020AD578:
	mov r0, r7
	mov r2, r4
	mov r1, #0
	bl MI_CpuFill8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020AD58C:
	ldr r2, [sp, #0x24]
	mov r0, r7
	mov r1, r7
	mov r3, r6
	bl CPSi_big_sub
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end CPSi_big_montmult

	arm_func_start CPSi_big_montpower
CPSi_big_montpower: ; 0x020AD5A4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov sl, r3
	mov r3, #0x16
	mul r4, sl, r3
	ldr r3, _020AD7A8 ; =_021D4634
	mov fp, r0
	ldr r3, [r3]
	mov r0, r4
	ldr sb, [sp, #0x50]
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	blx r3
	str r0, [sp, #0x28]
	cmp r0, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r2, r4
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, [sp, #0x28]
	mov r1, sl
	add r6, r0, sl, lsl #1
	add r0, r6, sl, lsl #1
	add r7, r0, sl, lsl #1
	add r8, r7, sl, lsl #1
	str r0, [sp, #0x24]
	add r0, r8, sl, lsl #1
	str r0, [sp, #0x20]
	add r5, r0, sl, lsl #1
	mov r0, sb
	bl count_digits
	mov r4, r0
	ldr r0, [sp, #0x28]
	mov r2, #1
	mov r1, r4, lsl #1
	strh r2, [r0, r1]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	str r0, [sp]
	mov r0, r6
	mov r2, sb
	mov r3, sl
	bl CPSi_big_modinv
	ldr r1, [sp, #0x28]
	mov r0, r7
	mov r2, r6
	mov r3, sl
	bl CPSi_big_mult
	mov r0, r6
	mov r1, r7
	mov r2, #1
	mov r3, sl
	bl CPSi_big_sub_small
	str sl, [sp]
	mov r0, r6
	mov r1, r6
	mov r2, sb
	mov r3, #0
	str r5, [sp, #4]
	bl CPSi_big_div
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x28]
	mov r3, sl
	bl CPSi_big_mult
	ldr r1, [sp, #0x24]
	str sl, [sp]
	mov r0, #0
	mov r2, sb
	mov r3, r1
	str r5, [sp, #4]
	bl CPSi_big_div
	str sl, [sp]
	ldr r1, [sp, #0x28]
	mov r0, #0
	mov r2, sb
	mov r3, fp
	str r5, [sp, #4]
	bl CPSi_big_div
	movs r0, r4, lsl #4
	mov r5, #0
	str r0, [sp, #0x1c]
	beq _020AD76C
_020AD6F4:
	stmia sp, {r4, sb}
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	ldr r1, [sp, #0x20]
	mov r0, fp
	mov r2, #1
	mov r3, sl
	str r8, [sp, #0x10]
	bl CPSi_big_montmult
	ldr r1, [sp, #0x18]
	sub r2, r4, r5, asr #4
	add r1, r1, r2, lsl #1
	ldrh r2, [r1, #-2]
	and r0, r5, #0xf
	mov r1, #0x8000
	tst r2, r1, lsr r0
	beq _020AD75C
	stmia sp, {r4, sb}
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	mov r0, fp
	mov r3, sl
	str r8, [sp, #0x10]
	bl CPSi_big_montmult
_020AD75C:
	ldr r0, [sp, #0x1c]
	add r5, r5, #1
	cmp r5, r0
	blo _020AD6F4
_020AD76C:
	stmia sp, {r4, sb}
	str r6, [sp, #8]
	str r7, [sp, #0xc]
	ldr r1, [sp, #0x20]
	mov r0, fp
	mov r3, sl
	mov r2, #0
	str r8, [sp, #0x10]
	bl CPSi_big_montmult
	ldr r1, _020AD7AC ; =_021D4660
	ldr r0, [sp, #0x28]
	ldr r1, [r1]
	blx r1
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020AD7A8: .word _021D4634
_020AD7AC: .word _021D4660
	arm_func_end CPSi_big_montpower

	arm_func_start CPSi_big_from_char
CPSi_big_from_char: ; 0x020AD7B0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	mov r2, r3, lsl #1
	mov r1, #0
	mov r4, r0
	bl MI_CpuFill8
	sub r0, r5, #1
	cmp r5, #1
	add r6, r6, r0
	ble _020AD7FC
_020AD7DC:
	ldrb r1, [r6]
	ldrb r0, [r6, #-1]
	sub r5, r5, #2
	cmp r5, #1
	add r0, r1, r0, lsl #8
	strh r0, [r4], #2
	sub r6, r6, #2
	bgt _020AD7DC
_020AD7FC:
	cmp r5, #0
	ldrgtb r0, [r6]
	strgth r0, [r4]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end CPSi_big_from_char

	arm_func_start CPSi_char_from_big
CPSi_char_from_big: ; 0x020AD80C
	sub r3, r2, #1
	cmp r2, #1
	add r0, r0, r3
	ble _020AD840
_020AD81C:
	ldrh r3, [r1]
	sub ip, r0, #1
	sub r2, r2, #2
	strb r3, [r0], #-2
	ldrh r3, [r1], #2
	cmp r2, #1
	mov r3, r3, asr #8
	strb r3, [ip]
	bgt _020AD81C
_020AD840:
	cmp r2, #0
	ldrgth r1, [r1]
	strgtb r1, [r0]
	bx lr
	arm_func_end CPSi_char_from_big

	; NitroWiFi: libwcm.a

	arm_func_start WCM_Init
WCM_Init: ; 0x020AD850
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl OS_DisableInterrupts
	ldr r2, _020AD964 ; =_021D5FEC
	mov r4, r0
	ldr r1, [r2]
	cmp r1, #0
	beq _020AD880
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020AD880:
	cmp r6, #0
	bne _020AD894
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020AD894:
	tst r6, #0x1f
	beq _020AD8A8
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020AD8A8:
	cmp r5, #0x2300
	bhs _020AD8BC
	bl OS_RestoreInterrupts
	mov r0, #6
	ldmia sp!, {r4, r5, r6, pc}
_020AD8BC:
	str r6, [r2]
	add r0, r6, #0x2000
	mov r1, #1
	str r1, [r0, #0x260]
	ldr r1, [r2]
	mov r0, #0
	add r1, r1, #0x2200
	strh r0, [r1, #0x80]
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r0, [r1, #0x68]
	ldr r1, [r2]
	add r1, r1, #0x2000
	strb r0, [r1, #0x26a]
	ldr r1, [r2]
	add r1, r1, #0x2000
	strb r0, [r1, #0x26b]
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r0, [r1, #0x82]
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r0, [r1, #0xf8]
	bl WcmInitOption
	bl WCMi_InitCpsif
	bl OS_IsTickAvailable
	cmp r0, #0
	bne _020AD930
	bl OS_InitTick
_020AD930:
	bl OS_IsAlarmAvailable
	cmp r0, #0
	bne _020AD940
	bl OS_InitAlarm
_020AD940:
	ldr r0, _020AD964 ; =_021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2cc
	add r0, r0, #0x2000
	bl OS_CreateAlarm
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020AD964: .word _021D5FEC
	arm_func_end WCM_Init

	arm_func_start WCM_Finish
WCM_Finish: ; 0x020AD968
	stmdb sp!, {r3, lr}
	bl OS_DisableInterrupts
	ldr r2, _020AD9BC ; =_021D5FEC
	ldr r1, [r2]
	cmp r1, #0
	bne _020AD98C
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, pc}
_020AD98C:
	add r1, r1, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #1
	beq _020AD9A8
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, pc}
_020AD9A8:
	mov r1, #0
	str r1, [r2]
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AD9BC: .word _021D5FEC
	arm_func_end WCM_Finish

	arm_func_start WCM_StartupAsync
WCM_StartupAsync: ; 0x020AD9C0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl OS_DisableInterrupts
	ldr r1, _020ADBB8 ; =_021D5FEC
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _020AD9F0
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020AD9F0:
	add r1, r1, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #1
	beq _020ADA14
	cmp r1, #2
	beq _020ADA24
	cmp r1, #3
	beq _020ADA30
	b _020ADA3C
_020ADA14:
	mov r0, r6
	mov r1, r5
	bl WcmConfigure
	b _020ADA48
_020ADA24:
	bl OS_RestoreInterrupts
	mov r0, #2
	ldmia sp!, {r4, r5, r6, pc}
_020ADA30:
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_020ADA3C:
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020ADA48:
	ldr r0, _020ADBB8 ; =_021D5FEC
	ldr r0, [r0]
	add r1, r0, #0x2000
	ldr r1, [r1, #0x26c]
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl WM_Init
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _020ADAB4
_020ADA70: ; jump table
	b _020ADACC ; case 0
	b _020ADAB4 ; case 1
	b _020ADAB4 ; case 2
	b _020ADA8C ; case 3
	b _020ADAA4 ; case 4
	b _020ADAB4 ; case 5
	b _020ADAB4 ; case 6
_020ADA8C:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_020ADAA4:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #5
	ldmia sp!, {r4, r5, r6, pc}
_020ADAB4:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_020ADACC:
	bl WM_GetAllowedChannel
	cmp r0, #0
	bne _020ADB0C
	bl WM_Finish
	cmp r0, #0
	beq _020ADAFC
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_020ADAFC:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #5
	ldmia sp!, {r4, r5, r6, pc}
_020ADB0C:
	ldr r0, _020ADBBC ; =WcmWmcbIndication
	bl WM_SetIndCallback
	cmp r0, #0
	beq _020ADB34
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_020ADB34:
	ldr r0, _020ADBC0 ; =WcmWmcbCommon
	bl WM_Enable
	cmp r0, #2
	beq _020ADB58
	cmp r0, #3
	beq _020ADB90
	cmp r0, #8
	beq _020ADB78
	b _020ADB90
_020ADB58:
	mov r0, #2
	bl WcmSetPhase
	ldr r0, _020ADBB8 ; =_021D5FEC
	mov r1, #1
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020ADBA8
_020ADB78:
	mov r0, #0xc
	bl WcmSetPhase
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020ADB90:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_020ADBA8:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #3
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020ADBB8: .word _021D5FEC
_020ADBBC: .word WcmWmcbIndication
_020ADBC0: .word WcmWmcbCommon
	arm_func_end WCM_StartupAsync

	arm_func_start WCM_CleanupAsync
WCM_CleanupAsync: ; 0x020ADBC4
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	ldr r1, _020ADCAC ; =_021D5FEC
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _020ADBEC
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, pc}
_020ADBEC:
	add r1, r1, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #1
	beq _020ADC18
	cmp r1, #3
	beq _020ADC30
	cmp r1, #4
	bne _020ADC24
	bl OS_RestoreInterrupts
	mov r0, #2
	ldmia sp!, {r4, pc}
_020ADC18:
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r4, pc}
_020ADC24:
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, pc}
_020ADC30:
	ldr r0, _020ADCB0 ; =WcmWmcbCommon
	bl WM_PowerOff
	cmp r0, #2
	beq _020ADC54
	cmp r0, #3
	beq _020ADC84
	cmp r0, #8
	beq _020ADC74
	b _020ADC84
_020ADC54:
	mov r0, #4
	bl WcmSetPhase
	ldr r0, _020ADCAC ; =_021D5FEC
	mov r1, #2
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020ADC9C
_020ADC74:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #4
	ldmia sp!, {r4, pc}
_020ADC84:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #7
	ldmia sp!, {r4, pc}
_020ADC9C:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #3
	ldmia sp!, {r4, pc}
	.align 2, 0
_020ADCAC: .word _021D5FEC
_020ADCB0: .word WcmWmcbCommon
	arm_func_end WCM_CleanupAsync

	arm_func_start WCM_SearchAsync
WCM_SearchAsync: ; 0x020ADCB4
	stmdb sp!, {r3, lr}
	cmp r0, #0
	cmpne r1, #0
	bne _020ADCCC
	bl WCM_EndSearchAsync
	ldmia sp!, {r3, pc}
_020ADCCC:
	bl WCM_BeginSearchAsync
	ldmia sp!, {r3, pc}
	arm_func_end WCM_SearchAsync

	arm_func_start WCM_BeginSearchAsync
WCM_BeginSearchAsync: ; 0x020ADCD4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl OS_DisableInterrupts
	ldr r1, _020ADE44 ; =_021D5FEC
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _020ADD08
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADD08:
	add r1, r1, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #3
	beq _020ADD78
	cmp r1, #5
	beq _020ADD2C
	cmp r1, #6
	beq _020ADD4C
	b _020ADD6C
_020ADD2C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl WcmEditScanExParam
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADD4C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl WcmEditScanExParam
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADD6C:
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADD78:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl WcmEditScanExParam
	ldr r0, _020ADE44 ; =_021D5FEC
	ldr r0, [r0]
	add r1, r0, #0x2200
	add r0, r0, #0x2000
	ldrh r1, [r1, #0x8c]
	ldr r0, [r0, #0x288]
	bl DC_InvalidateRange
	ldr r2, _020ADE44 ; =_021D5FEC
	ldr r0, _020ADE48 ; =WcmWmcbScanEx
	ldr r1, [r2]
	add r1, r1, #0x2000
	ldr r3, [r1, #0x284]
	add r3, r3, #1
	str r3, [r1, #0x284]
	ldr r1, [r2]
	add r1, r1, #0x288
	add r1, r1, #0x2000
	bl WM_StartScanEx
	cmp r0, #2
	beq _020ADDEC
	cmp r0, #3
	beq _020ADE1C
	cmp r0, #8
	beq _020ADE0C
	b _020ADE1C
_020ADDEC:
	mov r0, #5
	bl WcmSetPhase
	ldr r0, _020ADE44 ; =_021D5FEC
	mov r1, #3
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020ADE34
_020ADE0C:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADE1C:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADE34:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020ADE44: .word _021D5FEC
_020ADE48: .word WcmWmcbScanEx
	arm_func_end WCM_BeginSearchAsync

	arm_func_start WCM_EndSearchAsync
WCM_EndSearchAsync: ; 0x020ADE4C
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	ldr r1, _020ADEEC ; =_021D5FEC
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _020ADE74
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, pc}
_020ADE74:
	add r1, r1, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #3
	beq _020ADEC4
	cmp r1, #6
	beq _020ADE98
	cmp r1, #7
	beq _020ADEB8
	b _020ADED0
_020ADE98:
	mov r0, #7
	bl WcmSetPhase
	ldr r0, _020ADEEC ; =_021D5FEC
	mov r1, #4
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020ADEDC
_020ADEB8:
	bl OS_RestoreInterrupts
	mov r0, #2
	ldmia sp!, {r4, pc}
_020ADEC4:
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r4, pc}
_020ADED0:
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, pc}
_020ADEDC:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #3
	ldmia sp!, {r4, pc}
	.align 2, 0
_020ADEEC: .word _021D5FEC
	arm_func_end WCM_EndSearchAsync

	arm_func_start WCM_ConnectAsync
WCM_ConnectAsync: ; 0x020ADEF0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl OS_DisableInterrupts
	ldr r2, _020AE0E8 ; =_021D5FEC
	mov r4, r0
	ldr ip, [r2]
	cmp ip, #0
	bne _020ADF24
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADF24:
	add r1, ip, #0x2000
	ldr r3, [r1, #0x260]
	cmp r3, #3
	beq _020ADF48
	cmp r3, #8
	beq _020AE038
	cmp r3, #9
	beq _020AE044
	b _020AE050
_020ADF48:
	cmp r7, #0
	bne _020ADF5C
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADF5C:
	ldrh r3, [r7, #0x3c]
	cmp r3, #0
	beq _020ADF74
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADF74:
	cmp r6, #0
	beq _020ADFEC
	ldrb r3, [r6]
	cmp r3, #4
	ldrlob r0, [r6, #1]
	cmplo r0, #4
	blo _020ADFA0
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020ADFA0:
	strb r3, [r1, #0x250]
	ldr r0, [r2]
	ldrb r1, [r6, #1]
	add r0, r0, #0x2000
	strb r1, [r0, #0x251]
	ldr r1, [r2]
	mov r2, #0x50
	add r0, r1, #0x2000
	ldrb r0, [r0, #0x250]
	cmp r0, #0
	bne _020ADFDC
	add r0, r1, #0x2200
	mov r1, #0
	bl MI_CpuFill8
	b _020ADFFC
_020ADFDC:
	add r0, r6, #2
	add r1, r1, #0x2200
	bl MI_CpuCopy8
	b _020ADFFC
_020ADFEC:
	add r0, ip, #0x2200
	mov r1, #0
	mov r2, #0x52
	bl MI_CpuFill8
_020ADFFC:
	ldr r1, _020AE0E8 ; =_021D5FEC
	mov r0, r7
	ldr r1, [r1]
	mov r2, #0xc0
	add r1, r1, #0x2140
	bl MI_CpuCopy8
	ldr r1, _020AE0E8 ; =_021D5FEC
	mov r0, r5
	ldr r1, [r1]
	add r1, r1, #0x2100
	ldrh r2, [r1, #0x6e]
	orr r2, r2, #3
	strh r2, [r1, #0x70]
	bl WCM_UpdateOption
	b _020AE05C
_020AE038:
	bl OS_RestoreInterrupts
	mov r0, #2
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020AE044:
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020AE050:
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020AE05C:
	ldr r1, _020AE0EC ; =0x0000FFFF
	ldr r0, _020AE0F0 ; =WcmWmcbCommon
	mov r3, r1
	mov r2, #0x50
	str r1, [sp]
	bl WM_SetLifeTime
	cmp r0, #2
	beq _020AE090
	cmp r0, #3
	beq _020AE0C0
	cmp r0, #8
	beq _020AE0B0
	b _020AE0C0
_020AE090:
	mov r0, #8
	bl WcmSetPhase
	ldr r0, _020AE0E8 ; =_021D5FEC
	mov r1, #5
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020AE0D8
_020AE0B0:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020AE0C0:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020AE0D8:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020AE0E8: .word _021D5FEC
_020AE0EC: .word 0x0000FFFF
_020AE0F0: .word WcmWmcbCommon
	arm_func_end WCM_ConnectAsync

	arm_func_start WCM_DisconnectAsync
WCM_DisconnectAsync: ; 0x020AE0F4
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	ldr r1, _020AE208 ; =_021D5FEC
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _020AE11C
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, pc}
_020AE11C:
	add r1, r1, #0x2000
	ldr r2, [r1, #0x260]
	cmp r2, #3
	beq _020AE148
	cmp r2, #9
	beq _020AE160
	cmp r2, #0xa
	bne _020AE154
	bl OS_RestoreInterrupts
	mov r0, #2
	ldmia sp!, {r4, pc}
_020AE148:
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r4, pc}
_020AE154:
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, pc}
_020AE160:
	ldrb r0, [r1, #0x26b]
	cmp r0, #1
	bne _020AE18C
	mov r0, #0xa
	bl WcmSetPhase
	ldr r0, _020AE208 ; =_021D5FEC
	mov r1, #6
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020AE1F8
_020AE18C:
	ldr r0, _020AE20C ; =WcmWmcbEndDCF
	bl WM_EndDCF
	cmp r0, #2
	beq _020AE1B0
	cmp r0, #3
	beq _020AE1E0
	cmp r0, #8
	beq _020AE1D0
	b _020AE1E0
_020AE1B0:
	mov r0, #0xa
	bl WcmSetPhase
	ldr r0, _020AE208 ; =_021D5FEC
	mov r1, #6
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020AE1F8
_020AE1D0:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #4
	ldmia sp!, {r4, pc}
_020AE1E0:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #7
	ldmia sp!, {r4, pc}
_020AE1F8:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #3
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AE208: .word _021D5FEC
_020AE20C: .word WcmWmcbEndDCF
	arm_func_end WCM_DisconnectAsync

	arm_func_start WCM_TerminateAsync
WCM_TerminateAsync: ; 0x020AE210
	stmdb sp!, {r3, r4, r5, lr}
	bl OS_DisableInterrupts
	ldr r1, _020AE414 ; =_021D5FEC
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	bne _020AE238
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_020AE238:
	add r1, r1, #0x2000
	ldr r2, [r1, #0x260]
	cmp r2, #0xd
	addls pc, pc, r2, lsl #2
	b _020AE2C8
_020AE24C: ; jump table
	b _020AE2C8 ; case 0
	b _020AE290 ; case 1
	b _020AE2C8 ; case 2
	b _020AE2D8 ; case 3
	b _020AE2C8 ; case 4
	b _020AE2C8 ; case 5
	b _020AE29C ; case 6
	b _020AE2C8 ; case 7
	b _020AE2C8 ; case 8
	b _020AE2D8 ; case 9
	b _020AE2C8 ; case 10
	b _020AE2C8 ; case 11
	b _020AE2D8 ; case 12
	b _020AE284 ; case 13
_020AE284:
	bl OS_RestoreInterrupts
	mov r0, #2
	ldmia sp!, {r3, r4, r5, pc}
_020AE290:
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020AE29C:
	mov r0, #0xd
	bl WcmSetPhase
	ldr r1, _020AE414 ; =_021D5FEC
	mov r2, #9
	ldr r1, [r1]
	mov r0, r4
	add r1, r1, #0x2200
	strh r2, [r1, #0x80]
	bl OS_RestoreInterrupts
	mov r0, #3
	ldmia sp!, {r3, r4, r5, pc}
_020AE2C8:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_020AE2D8:
	ldrb r0, [r1, #0x26b]
	cmp r0, #1
	bne _020AE304
	mov r0, #0xd
	bl WcmSetPhase
	ldr r0, _020AE414 ; =_021D5FEC
	mov r1, #9
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020AE404
_020AE304:
	bl WMi_GetStatusAddress
	mov r5, r0
	mov r1, #2
	bl DC_InvalidateRange
	ldrh r0, [r5]
	cmp r0, #0
	beq _020AE334
	cmp r0, #1
	beq _020AE36C
	cmp r0, #2
	beq _020AE378
	b _020AE384
_020AE334:
	bl WM_Finish
	cmp r0, #0
	bne _020AE3A0
	mov r0, #1
	bl WcmSetPhase
	ldr r1, _020AE414 ; =_021D5FEC
	mov r2, #0
	ldr r1, [r1]
	mov r0, r4
	add r1, r1, #0x2200
	strh r2, [r1, #0x80]
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020AE36C:
	ldr r0, _020AE418 ; =WcmWmcbCommon
	bl WM_Disable
	b _020AE3A0
_020AE378:
	ldr r0, _020AE418 ; =WcmWmcbCommon
	bl WM_PowerOff
	b _020AE3A0
_020AE384:
	ldr r1, _020AE414 ; =_021D5FEC
	ldr r0, _020AE41C ; =WcmWmcbReset
	ldr r1, [r1]
	mov r2, #1
	add r1, r1, #0x2000
	strb r2, [r1, #0x26b]
	bl WM_Reset
_020AE3A0:
	cmp r0, #2
	beq _020AE3BC
	cmp r0, #3
	beq _020AE3EC
	cmp r0, #8
	beq _020AE3DC
	b _020AE3EC
_020AE3BC:
	mov r0, #0xd
	bl WcmSetPhase
	ldr r0, _020AE414 ; =_021D5FEC
	mov r1, #9
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
	b _020AE404
_020AE3DC:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #4
	ldmia sp!, {r3, r4, r5, pc}
_020AE3EC:
	mov r0, #0xb
	bl WcmSetPhase
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #7
	ldmia sp!, {r3, r4, r5, pc}
_020AE404:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #3
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AE414: .word _021D5FEC
_020AE418: .word WcmWmcbCommon
_020AE41C: .word WcmWmcbReset
	arm_func_end WCM_TerminateAsync

	arm_func_start WCM_GetPhase
WCM_GetPhase: ; 0x020AE420
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	ldr r1, _020AE44C ; =_021D5FEC
	mov r4, #0
	ldr r1, [r1]
	cmp r1, #0
	addne r1, r1, #0x2000
	ldrne r4, [r1, #0x260]
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AE44C: .word _021D5FEC
	arm_func_end WCM_GetPhase

	arm_func_start WCM_UpdateOption
WCM_UpdateOption: ; 0x020AE450
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	ldr r1, _020AE4E4 ; =_021D5FEC
	mov r2, #0
	ldr r3, [r1]
	add r1, r3, #0x2000
	cmp r3, #0
	ldr r4, [r1, #0x264]
	bne _020AE484
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020AE484:
	tst r5, #0x8000
	beq _020AE4A4
	ldr r1, _020AE4E8 ; =0x00003FFE
	orr r2, r2, #0xfe
	tst r5, r1
	orreq r5, r5, #0x82
	orr r2, r2, #0x3f00
	orreq r5, r5, #0xa000
_020AE4A4:
	tst r5, #0x20000
	orrne r2, r2, #0x10000
	tst r5, #0x80000
	orrne r2, r2, #0x40000
	tst r5, #0x200000
	orrne r2, r2, #0x100000
	tst r5, #0x800000
	orrne r2, r2, #0x400000
	mvn r1, r2
	and r1, r4, r1
	orr r2, r5, r1
	add r1, r3, #0x2000
	str r2, [r1, #0x264]
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AE4E4: .word _021D5FEC
_020AE4E8: .word 0x00003FFE
	arm_func_end WCM_UpdateOption

	arm_func_start WCMi_GetSystemWork
WCMi_GetSystemWork: ; 0x020AE4EC
	ldr r0, _020AE4F8 ; =_021D5FEC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020AE4F8: .word _021D5FEC
	arm_func_end WCMi_GetSystemWork

	arm_func_start WcmConfigure
WcmConfigure: ; 0x020AE4FC
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _020AE54C
	ldr r1, _020AE618 ; =_021D5FEC
	mov r3, #3
	ldr r0, [r1]
	mov r2, #0
	add r0, r0, #0x2000
	str r3, [r0, #0x26c]
	ldr r0, [r1]
	add r0, r0, #0x2000
	str r2, [r0, #0x270]
	ldr r0, [r1]
	add r0, r0, #0x2000
	str r2, [r0, #0x274]
	ldr r0, [r1]
	add r0, r0, #0x2000
	str r2, [r0, #0x278]
	b _020AE604
_020AE54C:
	ldr r1, _020AE618 ; =_021D5FEC
	ldr r2, [r5]
	ldr r0, [r1]
	and r2, r2, #3
	add r0, r0, #0x2000
	str r2, [r0, #0x26c]
	ldr r3, [r5, #4]
	ldr r0, [r5, #8]
	and r2, r3, #3
	rsb r2, r2, #4
	and r2, r2, #3
	add r2, r2, #0xc
	cmp r2, r0
	ldr r0, [r1]
	bls _020AE5A4
	mov r2, #0
	add r0, r0, #0x2000
	str r2, [r0, #0x270]
	ldr r0, [r1]
	add r0, r0, #0x2000
	str r2, [r0, #0x274]
	b _020AE5F0
_020AE5A4:
	add r2, r3, #3
	bic r2, r2, #3
	add r0, r0, #0x2000
	str r2, [r0, #0x270]
	ldr r2, [r5, #4]
	ldr r0, [r1]
	and r2, r2, #3
	rsb r2, r2, #4
	ldr r3, [r5, #8]
	and r2, r2, #3
	sub r2, r3, r2
	add r0, r0, #0x2000
	str r2, [r0, #0x274]
	ldr r0, [r1]
	mov r1, #0
	add r2, r0, #0x2000
	ldr r0, [r2, #0x270]
	ldr r2, [r2, #0x274]
	bl MI_CpuFill8
_020AE5F0:
	ldr r0, _020AE618 ; =_021D5FEC
	ldr r1, [r5, #0xc]
	ldr r0, [r0]
	add r0, r0, #0x2000
	str r1, [r0, #0x278]
_020AE604:
	ldr r0, _020AE618 ; =_021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	str r4, [r0, #0x27c]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AE618: .word _021D5FEC
	arm_func_end WcmConfigure

	arm_func_start WcmEditScanExParam
WcmEditScanExParam: ; 0x020AE61C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r2
	mov r4, r1
	bl WCM_UpdateOption
	ldr r2, _020AE7A8 ; =_021D5FEC
	mov r3, #0x400
	ldr r1, [r2]
	mov r0, #0
	add ip, r1, #0x1500
	add r1, r1, #0x2000
	str ip, [r1, #0x288]
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r3, [r1, #0x8c]
	bl WcmGetNextScanChannel
	ldr r1, _020AE7A8 ; =_021D5FEC
	mov r2, #1
	mov r2, r2, lsl r0
	ldr r0, [r1]
	mov r2, r2, asr #1
	add r0, r0, #0x2200
	strh r2, [r0, #0x8e]
	ldr r0, [r1]
	add r0, r0, #0x2200
	ldrh r0, [r0, #0x68]
	cmp r0, #0
	bne _020AE690
	bl WM_GetDispersionScanPeriod
_020AE690:
	ldr r2, _020AE7A8 ; =_021D5FEC
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r0, [r1, #0x90]
	ldr r1, [r2]
	add r0, r1, #0x2000
	ldr r0, [r0, #0x264]
	and r0, r0, #0x300000
	cmp r0, #0x300000
	movne r2, #1
	moveq r2, #0
	add r0, r1, #0x2200
	strh r2, [r0, #0x98]
	cmp r5, #0
	mov r2, #6
	bne _020AE6EC
	ldr r1, _020AE7A8 ; =_021D5FEC
	ldr r0, _020AE7AC ; =_02108FC0
	ldr r1, [r1]
	add r1, r1, #0x92
	add r1, r1, #0x2200
	bl MI_CpuCopy8
	b _020AE704
_020AE6EC:
	ldr r1, _020AE7A8 ; =_021D5FEC
	mov r0, r5
	ldr r1, [r1]
	add r1, r1, #0x92
	add r1, r1, #0x2200
	bl MI_CpuCopy8
_020AE704:
	cmp r4, #0
	ldrne r0, _020AE7B0 ; =_02108FC8
	mov r2, #0x20
	cmpne r4, r0
	bne _020AE748
	ldr r1, _020AE7A8 ; =_021D5FEC
	ldr r0, _020AE7B0 ; =_02108FC8
	ldr r1, [r1]
	add r1, r1, #0x29c
	add r1, r1, #0x2000
	bl MI_CpuCopy8
	ldr r0, _020AE7A8 ; =_021D5FEC
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x9a]
	b _020AE790
_020AE748:
	ldr r1, _020AE7A8 ; =_021D5FEC
	mov r0, r4
	ldr r1, [r1]
	add r1, r1, #0x29c
	add r1, r1, #0x2000
	bl MI_CpuCopy8
	mov r1, #0
_020AE764:
	ldrb r0, [r4]
	cmp r0, #0
	beq _020AE780
	add r1, r1, #1
	cmp r1, #0x20
	add r4, r4, #1
	blt _020AE764
_020AE780:
	ldr r0, _020AE7A8 ; =_021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0x9a]
_020AE790:
	ldr r0, _020AE7A8 ; =_021D5FEC
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, #0x2000
	str r1, [r0, #0x284]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AE7A8: .word _021D5FEC
_020AE7AC: .word _02108FC0
_020AE7B0: .word _02108FC8
	arm_func_end WcmEditScanExParam

	arm_func_start WcmInitOption
WcmInitOption: ; 0x020AE7B4
	ldr r0, _020AE7CC ; =_021D5FEC
	ldr r1, _020AE7D0 ; =0x00AAA082
	ldr r0, [r0]
	add r0, r0, #0x2000
	str r1, [r0, #0x264]
	bx lr
	.align 2, 0
_020AE7CC: .word _021D5FEC
_020AE7D0: .word 0x00AAA082
	arm_func_end WcmInitOption

	arm_func_start WcmGetNextScanChannel
WcmGetNextScanChannel: ; 0x020AE7D4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r2, _020AE85C ; =_021D5FEC
	ldr lr, _020AE860 ; =0x4EC4EC4F
	ldr r2, [r2]
	mov r1, r0
	add r2, r2, #0x2000
	ldr r7, [r2, #0x264]
	mov r6, #0
	mov r5, #1
	mov ip, #0xd
_020AE7FC:
	mov r2, r1, lsr #0x1f
	smull r3, r4, lr, r1
	add r4, r2, r4, asr #2
	smull r2, r3, ip, r4
	sub r4, r1, r2
	add r2, r4, #1
	tst r7, r5, lsl r2
	bne _020AE82C
	add r6, r6, #1
	cmp r6, #0xd
	add r1, r1, #1
	blt _020AE7FC
_020AE82C:
	add r3, r0, r6
	ldr r2, _020AE860 ; =0x4EC4EC4F
	mov r0, r3, lsr #0x1f
	smull r1, ip, r2, r3
	add ip, r0, ip, asr #2
	mov r2, #0xd
	smull r0, r1, r2, ip
	sub ip, r3, r0
	add r0, ip, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020AE85C: .word _021D5FEC
_020AE860: .word 0x4EC4EC4F
	arm_func_end WcmGetNextScanChannel

	arm_func_start WcmNotify
WcmNotify: ; 0x020AE864
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _020AE8A4 ; =_021D5FEC
	mov r5, r0
	ldr r0, [ip]
	mov r4, r1
	add r1, r0, #0x2200
	ldrsh r0, [r1, #0x80]
	mov ip, #0
	mov lr, r2
	strh ip, [r1, #0x80]
	str r3, [sp]
	mov r1, r5
	mov r2, r4
	mov r3, lr
	bl WcmNotifyEx
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AE8A4: .word _021D5FEC
	arm_func_end WcmNotify

	arm_func_start WcmNotifyEx
WcmNotifyEx: ; 0x020AE8A8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr ip, _020AE8F8 ; =_021D5FEC
	ldr ip, [ip]
	add ip, ip, #0x2000
	ldr lr, [ip, #0x27c]
	cmp lr, #0
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, pc}
	ldr lr, [sp, #0x18]
	strh r0, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	str lr, [sp, #0xc]
	strh r1, [sp, #2]
	ldr r1, [ip, #0x27c]
	add r0, sp, #0
	blx r1
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AE8F8: .word _021D5FEC
	arm_func_end WcmNotifyEx

	arm_func_start WcmSetPhase
WcmSetPhase: ; 0x020AE8FC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	ldr r1, _020AE988 ; =_021D5FEC
	mov r4, r0
	ldr r1, [r1]
	add r0, r1, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #9
	bne _020AE938
	cmp r5, #9
	beq _020AE938
	add r0, r1, #0x2cc
	add r0, r0, #0x2000
	bl OS_CancelAlarm
_020AE938:
	ldr r0, _020AE988 ; =_021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r1, [r0, #0x260]
	cmp r1, #0xb
	strne r5, [r0, #0x260]
	cmp r5, #9
	bne _020AE97C
	mov r2, #0
	ldr r0, _020AE988 ; =_021D5FEC
	str r2, [sp]
	ldr r0, [r0]
	ldr r1, _020AE98C ; =0x022F5341
	add r0, r0, #0x2cc
	ldr r3, _020AE990 ; =WcmKeepAliveAlarm
	add r0, r0, #0x2000
	bl OS_SetAlarm
_020AE97C:
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020AE988: .word _021D5FEC
_020AE98C: .word 0x022F5341
_020AE990: .word WcmKeepAliveAlarm
	arm_func_end WcmSetPhase

	arm_func_start WCMi_ResetKeepAliveAlarm
WCMi_ResetKeepAliveAlarm: ; 0x020AE994
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	bl OS_DisableInterrupts
	ldr r1, _020AE9FC ; =_021D5FEC
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x2cc
	add r0, r0, #0x2000
	bl OS_CancelAlarm
	ldr r0, _020AE9FC ; =_021D5FEC
	ldr r1, [r0]
	add r0, r1, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #9
	bne _020AE9EC
	add r0, r1, #0x2cc
	mov r2, #0
	ldr r1, _020AEA00 ; =0x022F5341
	ldr r3, _020AEA04 ; =WcmKeepAliveAlarm
	add r0, r0, #0x2000
	str r2, [sp]
	bl OS_SetAlarm
_020AE9EC:
	mov r0, r4
	bl OS_RestoreInterrupts
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020AE9FC: .word _021D5FEC
_020AEA00: .word 0x022F5341
_020AEA04: .word WcmKeepAliveAlarm
	arm_func_end WCMi_ResetKeepAliveAlarm

	arm_func_start WcmKeepAliveAlarm
WcmKeepAliveAlarm: ; 0x020AEA08
	stmdb sp!, {r3, lr}
	bl WCMi_CpsifSendNullPacket
	bl WCMi_ResetKeepAliveAlarm
	ldmia sp!, {r3, pc}
	arm_func_end WcmKeepAliveAlarm

	arm_func_start WcmCountBits
WcmCountBits: ; 0x020AEA18
	mov r1, r0
	mov r0, #0
	mov r3, #1
_020AEA24:
	clz r2, r1
	rsbs r2, r2, #0x1f
	blo _020AEA34
	b _020AEA38
_020AEA34:
	bx lr
_020AEA38:
	bic r1, r1, r3, lsl r2
	add r0, r0, #1
	b _020AEA24
	arm_func_end WcmCountBits

	arm_func_start WcmCountLeadingZero
WcmCountLeadingZero: ; 0x020AEA44
	clz r0, r0
	bx lr
	arm_func_end WcmCountLeadingZero

	arm_func_start WcmWmReset
WcmWmReset: ; 0x020AEA4C
	stmdb sp!, {r3, lr}
	ldr r0, _020AEAA0 ; =_021D5FEC
	ldr r0, [r0]
	add r1, r0, #0x2000
	ldrb r0, [r1, #0x26b]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r2, #1
	ldr r0, _020AEAA4 ; =WcmWmcbReset
	strb r2, [r1, #0x26b]
	bl WM_Reset
	cmp r0, #2
	ldmeqia sp!, {r3, pc}
	mov r0, #0xb
	bl WcmSetPhase
	mov r1, #0
	mov r2, r1
	mov r0, #7
	mov r3, #0x610
	bl WcmNotify
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AEAA0: .word _021D5FEC
_020AEAA4: .word WcmWmcbReset
	arm_func_end WcmWmReset

	arm_func_start WcmWmcbIndication
WcmWmcbIndication: ; 0x020AEAA8
	stmdb sp!, {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #8
	ldreqh r1, [r0, #4]
	cmpeq r1, #0x16
	ldreqh r0, [r0, #6]
	cmpeq r0, #0x25
	ldmneia sp!, {r3, pc}
	ldr r0, _020AEB1C ; =_021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x260]
	sub r0, r0, #8
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r3, pc}
_020AEAE8: ; jump table
	b _020AEAFC ; case 0
	b _020AEB08 ; case 1
	b _020AEB10 ; case 2
	ldmia sp!, {r3, pc} ; case 3
	b _020AEB08 ; case 4
_020AEAFC:
	mov r0, #0xc
	bl WcmSetPhase
	ldmia sp!, {r3, pc}
_020AEB08:
	bl WcmWmReset
	ldmia sp!, {r3, pc}
_020AEB10:
	mov r0, #0xc
	bl WcmSetPhase
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AEB1C: .word _021D5FEC
	arm_func_end WcmWmcbIndication

	arm_func_start WcmWmcbCommon
WcmWmcbCommon: ; 0x020AEB20
	stmdb sp!, {r3, lr}
	ldrh r1, [r0, #2]
	mov r2, #0x14
	cmp r1, #4
	addls pc, pc, r1, lsl #2
	b _020AED80
_020AEB38: ; jump table
	b _020AEB4C ; case 0
	b _020AED48 ; case 1
	b _020AED80 ; case 2
	b _020AED80 ; case 3
	b _020AED80 ; case 4
_020AEB4C:
	ldrh r0, [r0]
	cmp r0, #0x19
	bgt _020AEB84
	bge _020AEC48
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _020AECC0
_020AEB68: ; jump table
	b _020AECC0 ; case 0
	b _020AECC0 ; case 1
	b _020AECC0 ; case 2
	b _020AEBA0 ; case 3
	b _020AEBB0 ; case 4
	b _020AEC04 ; case 5
	b _020AEC24 ; case 6
_020AEB84:
	cmp r0, #0x1d
	bgt _020AEB94
	beq _020AEC34
	b _020AECC0
_020AEB94:
	cmp r0, #0x27
	beq _020AEC70
	b _020AECC0
_020AEBA0:
	ldr r0, _020AEDB8 ; =WcmWmcbCommon
	bl WM_PowerOn
	mov r2, r0
	b _020AECC0
_020AEBB0:
	bl WM_Finish
	cmp r0, #0
	beq _020AEBC4
	cmp r0, #4
	b _020AEBE4
_020AEBC4:
	mov r0, #1
	bl WcmSetPhase
	mov r0, #0
	ldr r3, _020AEDBC ; =0x00000663
	mov r1, r0
	mov r2, r0
	bl WcmNotify
	ldmia sp!, {r3, pc}
_020AEBE4:
	mov r0, #0xb
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _020AEDC0 ; =0x0000066C
	mov r2, r1
	mov r0, #7
	bl WcmNotify
	ldmia sp!, {r3, pc}
_020AEC04:
	mov r0, #3
	bl WcmSetPhase
	mov r0, #0
	ldr r3, _020AEDC4 ; =0x00000673
	mov r1, r0
	mov r2, r0
	bl WcmNotify
	ldmia sp!, {r3, pc}
_020AEC24:
	ldr r0, _020AEDB8 ; =WcmWmcbCommon
	bl WM_Disable
	mov r2, r0
	b _020AECC0
_020AEC34:
	ldr r0, _020AEDB8 ; =WcmWmcbCommon
	mov r1, #0
	bl WM_SetBeaconIndication
	mov r2, r0
	b _020AECC0
_020AEC48:
	ldr r1, _020AEDC8 ; =_021D5FEC
	ldr r0, _020AEDB8 ; =WcmWmcbCommon
	ldr r3, [r1]
	add r2, r3, #0x2000
	ldrb r1, [r2, #0x250]
	ldrb r2, [r2, #0x251]
	add r3, r3, #0x2200
	bl WM_SetWEPKeyEx
	mov r2, r0
	b _020AECC0
_020AEC70:
	ldr r0, _020AEDC8 ; =_021D5FEC
	ldr r2, [r0]
	add r0, r2, #0x2000
	ldr r1, [r0, #0x264]
	and r0, r1, #0xc0000
	cmp r0, #0xc0000
	moveq r0, #1
	movne r0, #0
	mov r0, r0, lsl #0x10
	mov ip, r0, lsr #0x10
	and r1, r1, #0x30000
	cmp r1, #0x30000
	movne r3, #1
	add r1, r2, #0x2140
	ldr r0, _020AEDCC ; =WcmWmcbConnect
	moveq r3, #0
	mov r2, #0
	str ip, [sp]
	bl WM_StartConnectEx
	mov r2, r0
_020AECC0:
	cmp r2, #2
	ldmeqia sp!, {r3, pc}
	cmp r2, #3
	beq _020AED10
	cmp r2, #8
	bne _020AED10
	mov r0, #0xc
	bl WcmSetPhase
	ldr r0, _020AEDC8 ; =_021D5FEC
	mov r2, #0
	ldr r1, [r0]
	add r0, r1, #0x2200
	ldrsh r0, [r0, #0x80]
	cmp r0, #5
	addeq r1, r1, #0x2140
	mov r0, #1
	movne r1, #0
	rsb r3, r0, #0x6b0
	bl WcmNotify
	ldmia sp!, {r3, pc}
_020AED10:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _020AEDC8 ; =_021D5FEC
	ldr r3, _020AEDD0 ; =0x000006B8
	ldr r1, [r0]
	mov r2, #0
	add r0, r1, #0x2200
	ldrsh r0, [r0, #0x80]
	cmp r0, #5
	addeq r1, r1, #0x2140
	movne r1, #0
	mov r0, #7
	bl WcmNotify
	ldmia sp!, {r3, pc}
_020AED48:
	mov r0, #0xc
	bl WcmSetPhase
	ldr r0, _020AEDC8 ; =_021D5FEC
	ldr r3, _020AEDD4 ; =0x000006DE
	ldr r1, [r0]
	mov r2, #0
	add r0, r1, #0x2200
	ldrsh r0, [r0, #0x80]
	cmp r0, #5
	addeq r1, r1, #0x2140
	movne r1, #0
	mov r0, #1
	bl WcmNotify
	ldmia sp!, {r3, pc}
_020AED80:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _020AEDC8 ; =_021D5FEC
	ldr r3, _020AEDD8 ; =0x000006E8
	ldr r1, [r0]
	mov r2, #0
	add r0, r1, #0x2200
	ldrsh r0, [r0, #0x80]
	cmp r0, #5
	addeq r1, r1, #0x2140
	movne r1, #0
	mov r0, #7
	bl WcmNotify
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AEDB8: .word WcmWmcbCommon
_020AEDBC: .word 0x00000663
_020AEDC0: .word 0x0000066C
_020AEDC4: .word 0x00000673
_020AEDC8: .word _021D5FEC
_020AEDCC: .word WcmWmcbConnect
_020AEDD0: .word 0x000006B8
_020AEDD4: .word 0x000006DE
_020AEDD8: .word 0x000006E8
	arm_func_end WcmWmcbCommon

	arm_func_start WcmWmcbScanEx
WcmWmcbScanEx: ; 0x020AEDDC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r5, r0
	ldrh r0, [r5, #2]
	mov r4, #0x14
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _020AF074
_020AEDFC: ; jump table
	b _020AEE10 ; case 0
	b _020AF068 ; case 1
	b _020AF074 ; case 2
	b _020AF074 ; case 3
	b _020AF074 ; case 4
_020AEE10:
	ldr r0, _020AF098 ; =_021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #5
	bne _020AEE44
	mov r0, #6
	bl WcmSetPhase
	mov r0, #0
	ldr r3, _020AF09C ; =0x00000704
	mov r1, r0
	mov r2, r0
	bl WcmNotify
_020AEE44:
	ldr r1, _020AF098 ; =_021D5FEC
	ldr r2, [r1]
	add r0, r2, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #6
	beq _020AEE70
	cmp r0, #7
	beq _020AEFE8
	cmp r0, #0xd
	beq _020AEFF8
	b _020AF004
_020AEE70:
	add r0, r2, #0x2200
	mov r2, #7
	strh r2, [r0, #0x80]
	ldrh r0, [r5, #8]
	cmp r0, #5
	bne _020AEEFC
	ldr r0, [r1]
	add r1, r0, #0x2200
	add r0, r0, #0x2000
	ldrh r1, [r1, #0x8c]
	ldr r0, [r0, #0x288]
	bl DC_InvalidateRange
	ldrh r0, [r5, #0xe]
	mov r4, #0
	cmp r0, #0
	ble _020AEEFC
	ldr r8, _020AF0A0 ; =0x0000071A
	mov r7, #7
	mov r6, r4
_020AEEBC:
	add r0, r5, r4, lsl #1
	add r2, r5, r4, lsl #2
	ldrh r1, [r0, #0x50]
	ldr r0, [r2, #0x10]
	bl WCMi_EntryApList
	str r8, [sp]
	add r0, r5, r4, lsl #2
	ldr r2, [r0, #0x10]
	mov r0, r7
	mov r1, r6
	mov r3, r5
	bl WcmNotifyEx
	ldrh r0, [r5, #0xe]
	add r4, r4, #1
	cmp r4, r0
	blt _020AEEBC
_020AEEFC:
	ldr r0, _020AF098 ; =_021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r1, [r0, #0x264]
	and r0, r1, #0xc00000
	cmp r0, #0xc00000
	bne _020AEF68
	ldr r0, _020AF0A4 ; =0x00003FFE
	and r0, r1, r0
	bl WcmCountBits
	movs r1, r0
	beq _020AEF68
	ldr r0, _020AF098 ; =_021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r6, [r0, #0x284]
	mov r0, r6
	bl _u32_div_f
	cmp r1, #0
	bne _020AEF68
	ldr r4, _020AF0A8 ; =0x00000728
	mov r1, #0
	mov r2, r6
	mov r3, r1
	mov r0, #8
	str r4, [sp]
	bl WcmNotifyEx
_020AEF68:
	ldrh r0, [r5, #0xa]
	bl WcmCountLeadingZero
	rsb r0, r0, #0x20
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl WcmGetNextScanChannel
	ldr r1, _020AF098 ; =_021D5FEC
	mov r2, #1
	mov r2, r2, lsl r0
	ldr r0, [r1]
	mov r2, r2, asr #1
	add r0, r0, #0x2200
	strh r2, [r0, #0x8e]
	ldr r0, [r1]
	add r1, r0, #0x2200
	add r0, r0, #0x2000
	ldrh r1, [r1, #0x8c]
	ldr r0, [r0, #0x288]
	bl DC_InvalidateRange
	ldr r2, _020AF098 ; =_021D5FEC
	ldr r0, _020AF0AC ; =WcmWmcbScanEx
	ldr r1, [r2]
	add r1, r1, #0x2000
	ldr r3, [r1, #0x284]
	add r3, r3, #1
	str r3, [r1, #0x284]
	ldr r1, [r2]
	add r1, r1, #0x288
	add r1, r1, #0x2000
	bl WM_StartScanEx
	mov r4, r0
	b _020AF004
_020AEFE8:
	ldr r0, _020AF0B0 ; =WcmWmcbEndScan
	bl WM_EndScan
	mov r4, r0
	b _020AF004
_020AEFF8:
	bl WcmWmReset
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020AF004:
	cmp r4, #2
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	cmp r4, #3
	beq _020AF044
	cmp r4, #8
	bne _020AF044
	mov r0, #0xc
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _020AF0B4 ; =0x00000753
	mov r2, r1
	mov r0, #1
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020AF044:
	mov r0, #0xb
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _020AF0B8 ; =0x0000075C
	mov r2, r1
	mov r0, #7
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020AF068:
	bl WcmWmReset
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020AF074:
	mov r0, #0xb
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _020AF0BC ; =0x0000076D
	mov r2, r1
	mov r0, #7
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020AF098: .word _021D5FEC
_020AF09C: .word 0x00000704
_020AF0A0: .word 0x0000071A
_020AF0A4: .word 0x00003FFE
_020AF0A8: .word 0x00000728
_020AF0AC: .word WcmWmcbScanEx
_020AF0B0: .word WcmWmcbEndScan
_020AF0B4: .word 0x00000753
_020AF0B8: .word 0x0000075C
_020AF0BC: .word 0x0000076D
	arm_func_end WcmWmcbScanEx

	arm_func_start WcmWmcbEndScan
WcmWmcbEndScan: ; 0x020AF0C0
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _020AF110
_020AF0D4: ; jump table
	b _020AF0E8 ; case 0
	b _020AF108 ; case 1
	b _020AF110 ; case 2
	b _020AF110 ; case 3
	b _020AF110 ; case 4
_020AF0E8:
	mov r0, #3
	bl WcmSetPhase
	mov r0, #0
	ldr r3, _020AF130 ; =0x00000783
	mov r1, r0
	mov r2, r0
	bl WcmNotify
	ldmia sp!, {r3, pc}
_020AF108:
	bl WcmWmReset
	ldmia sp!, {r3, pc}
_020AF110:
	mov r0, #0xb
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _020AF134 ; =0x00000793
	mov r2, r1
	mov r0, #7
	bl WcmNotify
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AF130: .word 0x00000783
_020AF134: .word 0x00000793
	arm_func_end WcmWmcbEndScan

	arm_func_start WcmWmcbConnect
WcmWmcbConnect: ; 0x020AF138
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #2]
	cmp r0, #0xc
	addls pc, pc, r0, lsl #2
	b _020AF358
_020AF150: ; jump table
	b _020AF184 ; case 0
	b _020AF334 ; case 1
	b _020AF358 ; case 2
	b _020AF358 ; case 3
	b _020AF358 ; case 4
	b _020AF358 ; case 5
	b _020AF348 ; case 6
	b _020AF358 ; case 7
	b _020AF358 ; case 8
	b _020AF358 ; case 9
	b _020AF358 ; case 10
	b _020AF348 ; case 11
	b _020AF348 ; case 12
_020AF184:
	ldrh r0, [r4, #8]
	cmp r0, #9
	bgt _020AF1C4
	cmp r0, #0
	addge pc, pc, r0, lsl #2
	b _020AF30C
_020AF19C: ; jump table
	b _020AF30C ; case 0
	b _020AF30C ; case 1
	b _020AF30C ; case 2
	b _020AF30C ; case 3
	b _020AF30C ; case 4
	b _020AF30C ; case 5
	ldmia sp!, {r4, pc} ; case 6
	b _020AF240 ; case 7
	b _020AF1D0 ; case 8
	b _020AF1D0 ; case 9
_020AF1C4:
	cmp r0, #0x1a
	ldmeqia sp!, {r4, pc}
	b _020AF30C
_020AF1D0:
	ldr r1, _020AF380 ; =_021D5FEC
	ldr r2, [r1]
	add r0, r2, #0x2000
	ldr r0, [r0, #0x260]
	sub r0, r0, #8
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	ldmia sp!, {r4, pc}
_020AF1F0: ; jump table
	b _020AF210 ; case 0
	b _020AF21C ; case 1
	b _020AF204 ; case 2
	ldmia sp!, {r4, pc} ; case 3
	b _020AF238 ; case 4
_020AF204:
	add r0, r2, #0x2200
	mov r1, #0
	strh r1, [r0, #0x82]
_020AF210:
	mov r0, #0xc
	bl WcmSetPhase
	ldmia sp!, {r4, pc}
_020AF21C:
	add r0, r2, #0x2200
	mov r2, #0
	strh r2, [r0, #0x82]
	ldr r0, [r1]
	mov r1, #6
	add r0, r0, #0x2200
	strh r1, [r0, #0x80]
_020AF238:
	bl WcmWmReset
	ldmia sp!, {r4, pc}
_020AF240:
	ldr r1, _020AF380 ; =_021D5FEC
	ldr r3, [r1]
	add r0, r3, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #0xc
	bne _020AF268
	mov r0, #8
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r4, pc}
_020AF268:
	ldrh r2, [r4, #0xa]
	cmp r2, #1
	blo _020AF304
	ldr r0, _020AF384 ; =0x000007D7
	cmp r2, r0
	bhi _020AF304
	add r0, r3, #0x2200
	strh r2, [r0, #0x82]
	ldr r1, [r1]
	ldr r0, _020AF388 ; =WcmWmcbStartDCF
	add r1, r1, #0x1500
	mov r2, #0x620
	bl WM_StartDCF
	cmp r0, #2
	ldmeqia sp!, {r4, pc}
	cmp r0, #3
	beq _020AF2DC
	cmp r0, #8
	bne _020AF2DC
	mov r0, #0xc
	bl WcmSetPhase
	ldr r0, _020AF380 ; =_021D5FEC
	ldr r3, _020AF38C ; =0x000007ED
	ldr r1, [r0]
	mov r0, #1
	add r1, r1, #0x2140
	mov r2, #0
	bl WcmNotify
	ldmia sp!, {r4, pc}
_020AF2DC:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _020AF380 ; =_021D5FEC
	ldr r3, _020AF390 ; =0x000007F6
	ldr r1, [r0]
	mov r0, #7
	add r1, r1, #0x2140
	mov r2, #0
	bl WcmNotify
	ldmia sp!, {r4, pc}
_020AF304:
	bl WcmWmReset
	ldmia sp!, {r4, pc}
_020AF30C:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _020AF380 ; =_021D5FEC
	ldrh r2, [r4, #8]
	ldr r0, [r0]
	ldr r3, _020AF394 ; =0x00000804
	add r1, r0, #0x2140
	mov r0, #7
	bl WcmNotify
	ldmia sp!, {r4, pc}
_020AF334:
	ldr r0, _020AF380 ; =_021D5FEC
	ldrh r1, [r4, #0xe]
	ldr r0, [r0]
	add r0, r0, #0x2200
	strh r1, [r0, #0xf8]
_020AF348:
	mov r0, #8
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r4, pc}
_020AF358:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _020AF380 ; =_021D5FEC
	ldr r3, _020AF398 ; =0x0000081B
	ldr r1, [r0]
	mov r0, #7
	add r1, r1, #0x2140
	mov r2, #0
	bl WcmNotify
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AF380: .word _021D5FEC
_020AF384: .word 0x000007D7
_020AF388: .word WcmWmcbStartDCF
_020AF38C: .word 0x000007ED
_020AF390: .word 0x000007F6
_020AF394: .word 0x00000804
_020AF398: .word 0x0000081B
	arm_func_end WcmWmcbConnect

	arm_func_start WcmWmcbDisconnect
WcmWmcbDisconnect: ; 0x020AF39C
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _020AF430
_020AF3B0: ; jump table
	b _020AF3C4 ; case 0
	b _020AF420 ; case 1
	b _020AF430 ; case 2
	b _020AF420 ; case 3
	b _020AF430 ; case 4
_020AF3C4:
	ldr r0, _020AF458 ; =_021D5FEC
	ldr r1, [r0]
	add r0, r1, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #0xc
	bne _020AF3EC
	mov r0, #0xa
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r3, pc}
_020AF3EC:
	add r1, r1, #0x2200
	mov r2, #0
	mov r0, #3
	strh r2, [r1, #0x82]
	bl WcmSetPhase
	ldr r1, _020AF458 ; =_021D5FEC
	mov r0, #0
	ldr r1, [r1]
	ldr r3, _020AF45C ; =0x0000083D
	mov r2, r0
	add r1, r1, #0x2140
	bl WcmNotify
	ldmia sp!, {r3, pc}
_020AF420:
	mov r0, #0xa
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r3, pc}
_020AF430:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _020AF458 ; =_021D5FEC
	ldr r3, _020AF460 ; =0x0000084F
	ldr r1, [r0]
	mov r0, #7
	add r1, r1, #0x2140
	mov r2, #0
	bl WcmNotify
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AF458: .word _021D5FEC
_020AF45C: .word 0x0000083D
_020AF460: .word 0x0000084F
	arm_func_end WcmWmcbDisconnect

	arm_func_start WcmWmcbStartDCF
WcmWmcbStartDCF: ; 0x020AF464
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _020AF480
	cmp r0, #4
	b _020AF53C
_020AF480:
	ldrh r0, [r4, #4]
	cmp r0, #0xe
	beq _020AF498
	cmp r0, #0xf
	beq _020AF4E8
	b _020AF514
_020AF498:
	ldr r0, _020AF564 ; =_021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #0xc
	bne _020AF4C0
	mov r0, #8
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r4, pc}
_020AF4C0:
	mov r0, #9
	bl WcmSetPhase
	ldr r1, _020AF564 ; =_021D5FEC
	mov r0, #0
	ldr r1, [r1]
	ldr r3, _020AF568 ; =0x00000872
	mov r2, r0
	add r1, r1, #0x2140
	bl WcmNotify
	ldmia sp!, {r4, pc}
_020AF4E8:
	ldr r0, [r4, #8]
	ldrh r0, [r0, #0xe]
	mov r0, r0, asr #8
	and r0, r0, #0xff
	bl WCMi_ShelterRssi
	ldr r0, [r4, #8]
	mov r1, #0x620
	bl DC_InvalidateRange
	ldr r0, [r4, #8]
	bl WCMi_CpsifRecvCallback
	ldmia sp!, {r4, pc}
_020AF514:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _020AF564 ; =_021D5FEC
	ldrh r2, [r4, #4]
	ldr r0, [r0]
	ldr r3, _020AF56C ; =0x00000881
	add r1, r0, #0x2140
	mov r0, #7
	bl WcmNotify
	ldmia sp!, {r4, pc}
_020AF53C:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _020AF564 ; =_021D5FEC
	ldr r3, _020AF570 ; =0x0000088C
	ldr r1, [r0]
	mov r0, #7
	add r1, r1, #0x2140
	mov r2, #0
	bl WcmNotify
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AF564: .word _021D5FEC
_020AF568: .word 0x00000872
_020AF56C: .word 0x00000881
_020AF570: .word 0x0000088C
	arm_func_end WcmWmcbStartDCF

	arm_func_start WcmWmcbEndDCF
WcmWmcbEndDCF: ; 0x020AF574
	stmdb sp!, {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _020AF658
_020AF588: ; jump table
	b _020AF59C ; case 0
	b _020AF648 ; case 1
	b _020AF658 ; case 2
	b _020AF648 ; case 3
	b _020AF658 ; case 4
_020AF59C:
	ldr r0, _020AF680 ; =_021D5FEC
	ldr r0, [r0]
	add r0, r0, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #0xc
	bne _020AF5C4
	mov r0, #0xa
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r3, pc}
_020AF5C4:
	ldr r0, _020AF684 ; =WcmWmcbDisconnect
	mov r1, #0
	bl WM_Disconnect
	cmp r0, #2
	ldmeqia sp!, {r3, pc}
	cmp r0, #3
	beq _020AF610
	cmp r0, #8
	bne _020AF620
	mov r0, #0xc
	bl WcmSetPhase
	ldr r0, _020AF680 ; =_021D5FEC
	ldr r3, _020AF688 ; =0x000008B4
	ldr r1, [r0]
	mov r0, #1
	add r1, r1, #0x2140
	mov r2, #0
	bl WcmNotify
	ldmia sp!, {r3, pc}
_020AF610:
	mov r0, #0xa
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r3, pc}
_020AF620:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r1, _020AF680 ; =_021D5FEC
	mov r0, #7
	ldr r1, [r1]
	mov r2, #0
	add r1, r1, #0x2140
	mov r3, #0x8c0
	bl WcmNotify
	ldmia sp!, {r3, pc}
_020AF648:
	mov r0, #0xa
	bl WcmSetPhase
	bl WcmWmReset
	ldmia sp!, {r3, pc}
_020AF658:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _020AF680 ; =_021D5FEC
	ldr r3, _020AF68C ; =0x000008D3
	ldr r1, [r0]
	mov r0, #7
	add r1, r1, #0x2140
	mov r2, #0
	bl WcmNotify
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AF680: .word _021D5FEC
_020AF684: .word WcmWmcbDisconnect
_020AF688: .word 0x000008B4
_020AF68C: .word 0x000008D3
	arm_func_end WcmWmcbEndDCF

	arm_func_start WcmWmcbReset
WcmWmcbReset: ; 0x020AF690
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _020AF968
	ldr r2, _020AF98C ; =_021D5FEC
	mov r0, #0
	ldr r1, [r2]
	add r1, r1, #0x2000
	strb r0, [r1, #0x26b]
	ldr r1, [r2]
	add r1, r1, #0x2200
	strh r0, [r1, #0x82]
	ldr r3, [r2]
	add r1, r3, #0x2000
	ldr r1, [r1, #0x260]
	cmp r1, #0xd
	addls pc, pc, r1, lsl #2
	b _020AF938
_020AF6DC: ; jump table
	b _020AF938 ; case 0
	b _020AF938 ; case 1
	b _020AF938 ; case 2
	b _020AF938 ; case 3
	b _020AF938 ; case 4
	b _020AF714 ; case 5
	b _020AF714 ; case 6
	b _020AF738 ; case 7
	b _020AF75C ; case 8
	b _020AF874 ; case 9
	b _020AF8A0 ; case 10
	b _020AF938 ; case 11
	b _020AF874 ; case 12
	b _020AF8CC ; case 13
_020AF714:
	mov r0, #3
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _020AF990 ; =0x000008F5
	mov r2, r1
	mov r0, #1
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF738:
	mov r0, #3
	bl WcmSetPhase
	mov r0, #0
	ldr r3, _020AF994 ; =0x000008FB
	mov r1, r0
	mov r2, r0
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF75C:
	add r1, r3, #0x2200
	ldrh r4, [r1, #0xf8]
	strh r0, [r1, #0xf8]
	cmp r4, #0x12
	bne _020AF848
	ldr r1, [r2]
	add r1, r1, #0x2100
	ldrh r3, [r1, #0x70]
	and ip, r3, #0x24
	cmp ip, #0x24
	beq _020AF848
	orr r3, r3, #0x24
	strh r3, [r1, #0x70]
	ldr lr, [r2]
	add r1, lr, #0x2000
	ldr r2, [r1, #0x264]
	and r1, r2, #0xc0000
	cmp r1, #0xc0000
	moveq r0, #1
	and r1, r2, #0x30000
	cmp r1, #0x30000
	mov r0, r0, lsl #0x10
	mov ip, r0, lsr #0x10
	movne r3, #1
	ldr r0, _020AF998 ; =WcmWmcbConnect
	moveq r3, #0
	add r1, lr, #0x2140
	mov r2, #0
	str ip, [sp]
	bl WM_StartConnectEx
	cmp r0, #2
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	cmp r0, #3
	beq _020AF81C
	cmp r0, #8
	bne _020AF81C
	mov r0, #0xc
	bl WcmSetPhase
	ldr r0, _020AF98C ; =_021D5FEC
	ldr r3, _020AF99C ; =0x0000091C
	ldr r0, [r0]
	mov r2, r4
	add r1, r0, #0x2140
	mov r0, #1
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF81C:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r0, _020AF98C ; =_021D5FEC
	ldr r3, _020AF9A0 ; =0x00000925
	ldr r0, [r0]
	mov r2, r4
	add r1, r0, #0x2140
	mov r0, #7
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF848:
	mov r0, #3
	bl WcmSetPhase
	ldr r0, _020AF98C ; =_021D5FEC
	ldr r3, _020AF9A4 ; =0x0000092D
	ldr r0, [r0]
	mov r2, r4
	add r1, r0, #0x2140
	mov r0, #1
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF874:
	mov r0, #3
	bl WcmSetPhase
	ldr r0, _020AF98C ; =_021D5FEC
	ldr r3, _020AF9A8 ; =0x00000935
	ldr r1, [r0]
	mov r0, #0
	add r1, r1, #0x2140
	mov r2, #1
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF8A0:
	mov r0, #3
	bl WcmSetPhase
	ldr r1, _020AF98C ; =_021D5FEC
	mov r0, #0
	ldr r1, [r1]
	ldr r3, _020AF9AC ; =0x0000093C
	mov r2, r0
	add r1, r1, #0x2140
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF8CC:
	ldr r0, _020AF9B0 ; =WcmWmcbCommon
	bl WM_PowerOff
	cmp r0, #2
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	cmp r0, #3
	beq _020AF914
	cmp r0, #8
	bne _020AF914
	mov r0, #0xc
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _020AF9B4 ; =0x0000094A
	mov r2, r1
	mov r0, #1
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF914:
	mov r0, #0xb
	bl WcmSetPhase
	mov r1, #0
	ldr r3, _020AF9B8 ; =0x00000953
	mov r2, r1
	mov r0, #7
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF938:
	mov r0, #0xb
	bl WcmSetPhase
	ldr r1, _020AF98C ; =_021D5FEC
	mov r0, #7
	ldr r1, [r1]
	rsb r3, r0, #0x960
	add r1, r1, #0x2000
	ldr r2, [r1, #0x260]
	mov r1, #0
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_020AF968:
	mov r0, #0xb
	bl WcmSetPhase
	mov r1, #0
	mov r2, r1
	mov r0, #7
	mov r3, #0x960
	bl WcmNotify
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020AF98C: .word _021D5FEC
_020AF990: .word 0x000008F5
_020AF994: .word 0x000008FB
_020AF998: .word WcmWmcbConnect
_020AF99C: .word 0x0000091C
_020AF9A0: .word 0x00000925
_020AF9A4: .word 0x0000092D
_020AF9A8: .word 0x00000935
_020AF9AC: .word 0x0000093C
_020AF9B0: .word WcmWmcbCommon
_020AF9B4: .word 0x0000094A
_020AF9B8: .word 0x00000953
	arm_func_end WcmWmcbReset

	arm_func_start WCM_ClearApList
WCM_ClearApList: ; 0x020AF9BC
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	mov r4, r0
	bl WCMi_GetSystemWork
	cmp r0, #0
	bne _020AF9E0
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
_020AF9E0:
	add r1, r0, #0x2000
	ldr r0, [r1, #0x270]
	cmp r0, #0
	beq _020AFA04
	ldr r2, [r1, #0x274]
	cmp r2, #0
	ble _020AFA04
	mov r1, #0
	bl MI_CpuFill8
_020AFA04:
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	arm_func_end WCM_ClearApList

	arm_func_start WCM_CountApList
WCM_CountApList: ; 0x020AFA10
	stmdb sp!, {r3, r4, r5, lr}
	bl OS_DisableInterrupts
	mov r4, r0
	bl WCMi_GetSystemWork
	cmp r0, #0
	mov r5, #0
	bne _020AFA3C
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
_020AFA3C:
	add r0, r0, #0x2000
	ldr r1, [r0, #0x270]
	cmp r1, #0
	beq _020AFA58
	ldr r0, [r0, #0x274]
	cmp r0, #0xc
	ldrhi r5, [r1]
_020AFA58:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WCM_CountApList

	arm_func_start WCM_LockApList
WCM_LockApList: ; 0x020AFA68
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	mov r4, r0
	bl WCMi_GetSystemWork
	cmp r0, #0
	bne _020AFA94
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020AFA94:
	add r1, r0, #0x2000
	cmp r5, #0
	ldrb r1, [r1, #0x26a]
	beq _020AFABC
	cmp r1, #0
	movne r5, #1
	moveq r5, #0
	add r0, r0, #0x2000
	mov r1, #1
	b _020AFAD0
_020AFABC:
	cmp r1, #0
	movne r5, #1
	moveq r5, #0
	add r0, r0, #0x2000
	mov r1, #0
_020AFAD0:
	strb r1, [r0, #0x26a]
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WCM_LockApList

	arm_func_start WCM_PointApList
WCM_PointApList: ; 0x020AFAE4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	mov r5, r0
	bl WCMi_GetSystemWork
	cmp r0, #0
	bne _020AFB10
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020AFB10:
	mov r0, r4
	bl WcmSearchIndexedApList
	movs r4, r0
	mov r0, r5
	bne _020AFB30
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020AFB30:
	bl OS_RestoreInterrupts
	add r0, r4, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WCM_PointApList

	arm_func_start WCMi_EntryApList
WCMi_EntryApList: ; 0x020AFB3C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	mov r4, r1
	bl WCMi_GetSystemWork
	movs r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r6, #0x2000
	ldrb r0, [r0, #0x26a]
	cmp r0, #0
	ldreqh r0, [r5, #0x3c]
	cmpeq r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r5, #4
	bl WcmSearchApList
	movs r7, r0
	bne _020AFB84
	bl WcmAllocApList
	mov r7, r0
_020AFB84:
	cmp r7, #0
	addeq r0, r6, #0x2000
	ldreq r0, [r0, #0x278]
	cmpeq r0, #1
	bne _020AFBA0
	bl WcmGetOldestApList
	mov r7, r0
_020AFBA0:
	cmp r7, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	add r1, r7, #0x10
	mov r2, #0xc0
	strh r4, [r7, #2]
	bl MIi_CpuCopyFast
	mov r0, r7
	bl WcmAppendApList
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end WCMi_EntryApList

	arm_func_start WcmAllocApList
WcmAllocApList: ; 0x020AFBC8
	stmdb sp!, {r4, lr}
	bl WCMi_GetSystemWork
	add r2, r0, #0x2000
	ldr r1, [r2, #0x270]
	mov r0, #0
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	ldr r3, [r2, #0x274]
	cmp r3, #0xc
	ldmlsia sp!, {r4, pc}
	ldr r2, _020AFC90 ; =0x4EC4EC4F
	sub r3, r3, #0xc
	umull r2, ip, r3, r2
	movs ip, ip, lsr #6
	ldmeqia sp!, {r4, pc}
	ldr r2, [r1]
	cmp ip, r2
	ldmlsia sp!, {r4, pc}
	mov lr, r0
	cmp ip, #0
	bls _020AFC44
	add r4, r1, #0xc
	mov r2, #0xd0
_020AFC24:
	mul r0, lr, r2
	ldrb r3, [r4, r0]
	add r0, r4, r0
	cmp r3, #0
	beq _020AFC44
	add lr, lr, #1
	cmp lr, ip
	blo _020AFC24
_020AFC44:
	cmp lr, ip
	ldmhsia sp!, {r4, pc}
	mov r2, #1
	strb r2, [r0]
	ldr r3, [r1]
	mov r2, #0
	str r3, [r0, #4]
	str r2, [r0, #0xc]
	ldr r2, [r1, #8]
	str r2, [r0, #8]
	str r0, [r1, #8]
	ldr r2, [r0, #8]
	cmp r2, #0
	strne r0, [r2, #0xc]
	streq r0, [r1, #4]
	ldr r2, [r1]
	add r2, r2, #1
	str r2, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AFC90: .word 0x4EC4EC4F
	arm_func_end WcmAllocApList

	arm_func_start WcmGetOldestApList
WcmGetOldestApList: ; 0x020AFC94
	stmdb sp!, {r3, lr}
	bl WCMi_GetSystemWork
	add r0, r0, #0x2000
	ldr r1, [r0, #0x270]
	cmp r1, #0
	beq _020AFCBC
	ldr r0, [r0, #0x274]
	cmp r0, #0xc
	ldrhi r0, [r1, #4]
	ldmhiia sp!, {r3, pc}
_020AFCBC:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end WcmGetOldestApList

	arm_func_start WcmSearchApList
WcmSearchApList: ; 0x020AFCC4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl WCMi_GetSystemWork
	add r0, r0, #0x2000
	mov r4, #0
	cmp r5, #0
	ldr r1, [r0, #0x270]
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r1, #0
	beq _020AFD28
	ldr r0, [r0, #0x274]
	cmp r0, #0xc
	bls _020AFD28
	ldr r4, [r1, #4]
	cmp r4, #0
	beq _020AFD28
_020AFD08:
	mov r1, r5
	add r0, r4, #0x14
	bl WCM_CompareBssID
	cmp r0, #0
	bne _020AFD28
	ldr r4, [r4, #0xc]
	cmp r4, #0
	bne _020AFD08
_020AFD28:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WcmSearchApList

	arm_func_start WcmSearchIndexedApList
WcmSearchIndexedApList: ; 0x020AFD30
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl WCMi_GetSystemWork
	add r1, r0, #0x2000
	ldr r2, [r1, #0x270]
	mov r0, #0
	cmp r2, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r1, #0x274]
	cmp r1, #0xc
	ldmlsia sp!, {r4, pc}
	ldr r0, [r2, #4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
_020AFD68:
	ldr r1, [r0, #4]
	cmp r1, r4
	ldrne r0, [r0, #0xc]
	cmpne r0, #0
	bne _020AFD68
	ldmia sp!, {r4, pc}
	arm_func_end WcmSearchIndexedApList

	arm_func_start WcmAppendApList
WcmAppendApList: ; 0x020AFD80
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl WCMi_GetSystemWork
	add r1, r0, #0x2000
	ldr r0, [r1, #0x270]
	cmp r4, #0
	cmpne r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r1, #0x274]
	cmp r1, #0xc
	ldmlsia sp!, {r4, pc}
	ldr r3, [r0, #4]
	cmp r3, #0
	beq _020AFDF8
_020AFDB8:
	cmp r3, r4
	bne _020AFDEC
	ldr r2, [r3, #8]
	ldr r1, [r3, #0xc]
	cmp r2, #0
	strne r1, [r2, #0xc]
	streq r1, [r0, #4]
	ldr r2, [r3, #0xc]
	ldr r1, [r3, #8]
	cmp r2, #0
	strne r1, [r2, #8]
	streq r1, [r0, #8]
	b _020AFDF8
_020AFDEC:
	ldr r3, [r3, #0xc]
	cmp r3, #0
	bne _020AFDB8
_020AFDF8:
	mov r1, #0
	str r1, [r4, #0xc]
	ldr r1, [r0, #8]
	str r1, [r4, #8]
	str r4, [r0, #8]
	ldr r1, [r4, #8]
	cmp r1, #0
	strne r4, [r1, #0xc]
	streq r4, [r0, #4]
	cmp r3, #0
	ldmneia sp!, {r4, pc}
	ldr r1, [r0]
	str r1, [r4, #4]
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	ldmia sp!, {r4, pc}
	arm_func_end WcmAppendApList

	arm_func_start WCMi_InitCpsif
WCMi_InitCpsif: ; 0x020AFE3C
	stmdb sp!, {r3, lr}
	ldr r1, _020AFE74 ; =_021D5FF0
	ldrb r0, [r1]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	mov r0, #1
	strb r0, [r1]
	mov r2, #0
	str r2, [r1, #0x24]
	str r2, [r1, #8]
	ldr r0, _020AFE78 ; =_021D5FFC
	str r2, [r1, #4]
	bl OS_InitMutex
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AFE74: .word _021D5FF0
_020AFE78: .word _021D5FFC
	arm_func_end WCMi_InitCpsif

	arm_func_start WCMi_CpsifRecvCallback
WCMi_CpsifRecvCallback: ; 0x020AFE7C
	stmdb sp!, {r3, lr}
	ldr r1, _020AFEAC ; =_021D5FF0
	mov r2, r0
	ldr ip, [r1, #0x28]
	cmp ip, #0
	ldmeqia sp!, {r3, pc}
	ldrh r3, [r2, #6]
	add r0, r2, #0x1e
	add r1, r2, #0x18
	add r2, r2, #0x2c
	blx ip
	ldmia sp!, {r3, pc}
	.align 2, 0
_020AFEAC: .word _021D5FF0
	arm_func_end WCMi_CpsifRecvCallback

	arm_func_start WCMi_CpsifSendNullPacket
WCMi_CpsifSendNullPacket: ; 0x020AFEB0
	stmdb sp!, {r4, lr}
	bl WCMi_GetSystemWork
	movs r4, r0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x2000
	ldr r1, [r0, #0x260]
	cmp r1, #9
	ldmneia sp!, {r4, pc}
	ldrb r0, [r0, #0x26b]
	cmp r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r0, _020AFF18 ; =_021D5FFC
	bl WcmCpsifTryLockMutexInIRQ
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r1, r4, #0x144
	ldr r0, _020AFF1C ; =WcmCpsifKACallback
	add r1, r1, #0x2000
	add r2, r4, #0xf00
	mov r3, #0
	bl WM_SetDCFData
	cmp r0, #2
	ldmeqia sp!, {r4, pc}
	ldr r0, _020AFF18 ; =_021D5FFC
	bl WcmCpsifUnlockMutexInIRQ
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AFF18: .word _021D5FFC
_020AFF1C: .word WcmCpsifKACallback
	arm_func_end WCMi_CpsifSendNullPacket

	arm_func_start WCM_GetApMacAddress
WCM_GetApMacAddress: ; 0x020AFF20
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #0
	bl WCMi_GetSystemWork
	mov r4, r0
	bl OS_DisableInterrupts
	cmp r4, #0
	beq _020AFF58
	add r1, r4, #0x2000
	ldr r2, [r1, #0x260]
	cmp r2, #9
	ldreqb r1, [r1, #0x26b]
	cmpeq r1, #0
	addeq r1, r4, #0x144
	addeq r5, r1, #0x2000
_020AFF58:
	bl OS_RestoreInterrupts
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WCM_GetApMacAddress

	arm_func_start WCM_GetApEssid
WCM_GetApEssid: ; 0x020AFF64
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	mov r5, r0
	mov r4, r7
	bl WCMi_GetSystemWork
	mov r6, r0
	bl OS_DisableInterrupts
	cmp r6, #0
	beq _020AFFB0
	add r1, r6, #0x2000
	ldr r2, [r1, #0x260]
	cmp r2, #9
	ldreqb r1, [r1, #0x26b]
	cmpeq r1, #0
	bne _020AFFB0
	add r1, r6, #0x2100
	ldrh r4, [r1, #0x4a]
	add r1, r6, #0x14c
	add r7, r1, #0x2000
_020AFFB0:
	bl OS_RestoreInterrupts
	cmp r5, #0
	strneh r4, [r5]
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end WCM_GetApEssid

	arm_func_start WCM_SetRecvDCFCallback
WCM_SetRecvDCFCallback: ; 0x020AFFC4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	ldr r1, _020AFFE0 ; =_021D5FF0
	str r4, [r1, #0x28]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.align 2, 0
_020AFFE0: .word _021D5FF0
	arm_func_end WCM_SetRecvDCFCallback

	arm_func_start WCM_SendDCFDataEx
WCM_SendDCFDataEx: ; 0x020AFFE4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	mov sb, r1
	mov r8, r2
	mov r6, r3
	bl OS_DisableInterrupts
	mov r5, r0
	bl WCMi_GetSystemWork
	cmp r0, #0
	bne _020B001C
	mov r0, r5
	bl OS_RestoreInterrupts
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020B001C:
	ldr r0, _020B015C ; =_021D5FFC
	bl OS_LockMutex
	bl WCMi_GetSystemWork
	movs r7, r0
	bne _020B0048
	ldr r0, _020B015C ; =_021D5FFC
	bl OS_UnlockMutex
	mov r0, r5
	bl OS_RestoreInterrupts
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020B0048:
	add r0, r7, #0x2000
	ldr r1, [r0, #0x260]
	cmp r1, #9
	bne _020B0064
	ldrb r0, [r0, #0x26b]
	cmp r0, #1
	bne _020B007C
_020B0064:
	ldr r0, _020B015C ; =_021D5FFC
	bl OS_UnlockMutex
	mov r0, r5
	bl OS_RestoreInterrupts
	mvn r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020B007C:
	mov r0, sb
	mov r2, r8
	add r1, r7, #0xf00
	bl MI_CpuCopy8
	ldr r2, [sp, #0x20]
	cmp r2, #0
	ble _020B00A8
	add r1, r7, #0xf00
	mov r0, r6
	add r1, r1, r8
	bl MI_CpuCopy8
_020B00A8:
	ldr r1, [sp, #0x20]
	ldr r0, _020B0160 ; =WcmCpsifWmCallback
	add r6, r8, r1
	mov r3, r6, lsl #0x10
	mov r1, r4
	add r2, r7, #0xf00
	mov r3, r3, lsr #0x10
	bl WM_SetDCFData
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020B00F8
_020B00D4: ; jump table
	b _020B00F8 ; case 0
	b _020B00F8 ; case 1
	b _020B0110 ; case 2
	b _020B00F8 ; case 3
	b _020B00F8 ; case 4
	b _020B00F8 ; case 5
	b _020B00F8 ; case 6
	b _020B00F8 ; case 7
	b _020B00F8 ; case 8
_020B00F8:
	ldr r0, _020B015C ; =_021D5FFC
	bl OS_UnlockMutex
	mov r0, r5
	bl OS_RestoreInterrupts
	mvn r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020B0110:
	ldr r0, _020B0164 ; =_021D5FF4
	bl OS_SleepThread
	ldr r0, _020B0168 ; =_021D5FF0
	ldr r0, [r0, #0x24]
	cmp r0, #0
	beq _020B0144
	cmp r0, #1
	ldr r0, _020B015C ; =_021D5FFC
	bl OS_UnlockMutex
	mov r0, r5
	bl OS_RestoreInterrupts
	mvn r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020B0144:
	ldr r0, _020B015C ; =_021D5FFC
	bl OS_UnlockMutex
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020B015C: .word _021D5FFC
_020B0160: .word WcmCpsifWmCallback
_020B0164: .word _021D5FF4
_020B0168: .word _021D5FF0
	arm_func_end WCM_SendDCFDataEx

	arm_func_start WcmCpsifWmCallback
WcmCpsifWmCallback: ; 0x020B016C
	stmdb sp!, {r3, lr}
	ldrh r1, [r0]
	cmp r1, #0x12
	ldmneia sp!, {r3, pc}
	ldrh r2, [r0, #2]
	ldr r1, _020B01A4 ; =_021D5FF0
	str r2, [r1, #0x24]
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _020B0198
	bl WCMi_ResetKeepAliveAlarm
_020B0198:
	ldr r0, _020B01A8 ; =_021D5FF4
	bl OS_WakeupThread
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B01A4: .word _021D5FF0
_020B01A8: .word _021D5FF4
	arm_func_end WcmCpsifWmCallback

	arm_func_start WcmCpsifKACallback
WcmCpsifKACallback: ; 0x020B01AC
	ldr ip, _020B01B8 ; =WcmCpsifUnlockMutexInIRQ
	ldr r0, _020B01BC ; =_021D5FFC
	bx ip
	.align 2, 0
_020B01B8: .word WcmCpsifUnlockMutexInIRQ
_020B01BC: .word _021D5FFC
	arm_func_end WcmCpsifKACallback

	arm_func_start WcmCpsifTryLockMutexInIRQ
WcmCpsifTryLockMutexInIRQ: ; 0x020B01C0
	ldr r2, [r0, #8]
	cmp r2, #0
	bne _020B01E8
	ldr r1, _020B020C ; =OS_IrqHandler
	str r1, [r0, #8]
	ldr r1, [r0, #0xc]
	add r1, r1, #1
	str r1, [r0, #0xc]
	mov r0, #1
	bx lr
_020B01E8:
	ldr r1, _020B020C ; =OS_IrqHandler
	cmp r2, r1
	movne r0, #0
	bxne lr
	ldr r1, [r0, #0xc]
	add r1, r1, #1
	str r1, [r0, #0xc]
	mov r0, #1
	bx lr
	.align 2, 0
_020B020C: .word OS_IrqHandler
	arm_func_end WcmCpsifTryLockMutexInIRQ

	arm_func_start WcmCpsifUnlockMutexInIRQ
WcmCpsifUnlockMutexInIRQ: ; 0x020B0210
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #8]
	ldr r1, _020B0244 ; =OS_IrqHandler
	cmp r2, r1
	ldmneia sp!, {r3, pc}
	ldr r1, [r0, #0xc]
	subs r1, r1, #1
	str r1, [r0, #0xc]
	ldmneia sp!, {r3, pc}
	mov r1, #0
	str r1, [r0, #8]
	bl OS_WakeupThread
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B0244: .word OS_IrqHandler
	arm_func_end WcmCpsifUnlockMutexInIRQ

	arm_func_start WCM_CompareBssID
WCM_CompareBssID: ; 0x020B0248
	mov ip, #0
_020B024C:
	ldrb r3, [r0, ip]
	ldrb r2, [r1, ip]
	cmp r3, r2
	movne r0, #0
	bxne lr
	add ip, ip, #1
	cmp ip, #6
	blt _020B024C
	mov r0, #1
	bx lr
	arm_func_end WCM_CompareBssID

	arm_func_start WCM_GetLinkLevel
WCM_GetLinkLevel: ; 0x020B0274
	stmdb sp!, {r3, r4, r5, lr}
	bl OS_DisableInterrupts
	mov r4, r0
	bl WCMi_GetSystemWork
	cmp r0, #0
	mov r5, #0
	beq _020B02A8
	add r0, r0, #0x2000
	ldr r0, [r0, #0x260]
	cmp r0, #9
	bne _020B02A8
	bl WcmGetLinkLevel
	mov r5, r0
_020B02A8:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WCM_GetLinkLevel

	arm_func_start WCMi_GetRssiAverage
WCMi_GetRssiAverage: ; 0x020B02B8
	stmdb sp!, {r3, lr}
	ldr r1, _020B0330 ; =_021D601C
	mov r0, #0
	ldrb r1, [r1]
	cmp r1, #0x10
	bls _020B02FC
	ldr r3, _020B0334 ; =_021D6020
	mov r2, r0
_020B02D8:
	ldrb r1, [r3], #1
	add r2, r2, #1
	cmp r2, #0x10
	add r0, r0, r1
	blt _020B02D8
	mov r1, r0, asr #3
	add r0, r0, r1, lsr #28
	mov r0, r0, asr #4
	b _020B0328
_020B02FC:
	cmp r1, #0
	beq _020B0328
	mov ip, r0
	ble _020B0324
	ldr r3, _020B0334 ; =_021D6020
_020B0310:
	ldrb r2, [r3], #1
	add ip, ip, #1
	cmp ip, r1
	add r0, r0, r2
	blt _020B0310
_020B0324:
	bl _s32_div_f
_020B0328:
	and r0, r0, #0xff
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B0330: .word _021D601C
_020B0334: .word _021D6020
	arm_func_end WCMi_GetRssiAverage

	arm_func_start WcmGetLinkLevel
WcmGetLinkLevel: ; 0x020B0338
	stmdb sp!, {r3, lr}
	bl WCMi_GetRssiAverage
	mov r1, #0
	cmp r0, #0x1c
	movhs r1, #3
	bhs _020B0364
	cmp r0, #0x16
	movhs r1, #2
	bhs _020B0364
	cmp r0, #0x10
	movhs r1, #1
_020B0364:
	mov r0, r1
	ldmia sp!, {r3, pc}
	arm_func_end WcmGetLinkLevel

	arm_func_start WCMi_ShelterRssi
WCMi_ShelterRssi: ; 0x020B036C
	stmdb sp!, {r3, lr}
	ldr r2, _020B03C4 ; =_021D601C
	tst r0, #2
	ldrb ip, [r2]
	mov r0, r0, asr #2
	addeq r0, r0, #0x19
	mov r1, ip, lsr #0x1f
	and lr, r0, #0xff
	rsb r0, r1, ip, lsl #28
	ldr r3, _020B03C8 ; =_021D6020
	add r0, r1, r0, ror #28
	strb lr, [r3, r0]
	add r0, ip, #1
	cmp ip, #0x10
	strlob r0, [r2]
	ldmloia sp!, {r3, pc}
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #28
	add r0, r1, r0, ror #28
	add r0, r0, #0x10
	strb r0, [r2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B03C4: .word _021D601C
_020B03C8: .word _021D6020
	arm_func_end WCMi_ShelterRssi

	; NitroWiFi: libstubsmd5.a

	arm_func_start MD5Init
MD5Init: ; 0x020B03CC
	ldr ip, _020B03D4 ; =DGT_Hash1Reset
	bx ip
	.align 2, 0
_020B03D4: .word DGT_Hash1Reset
	arm_func_end MD5Init

	arm_func_start MD5Update
MD5Update: ; 0x020B03D8
	ldr ip, _020B03E0 ; =DGT_Hash1SetSource
	bx ip
	.align 2, 0
_020B03E0: .word DGT_Hash1SetSource
	arm_func_end MD5Update

	arm_func_start MD5Final
MD5Final: ; 0x020B03E4
	ldr ip, _020B03EC ; =DGT_Hash1GetDigest_R
	bx ip
	.align 2, 0
_020B03EC: .word DGT_Hash1GetDigest_R
	arm_func_end MD5Final

	.rodata

_02108FB8:
	.byte 0x15, 0x03, 0x00, 0x00, 0x02, 0x01, 0x29, 0x00
	.public _02108FC8
_02108FC0:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.public _02108FC8
_02108FC8:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF

	.data

_02110628:
	.byte 0x00, 0x00, 0x00, 0x00
_0211062C:
	.byte 0xE6, 0xFF, 0xFF, 0xFF
_02110630:
	.byte 0x01, 0x01, 0xC0, 0x05, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08
	.byte 0x00, 0x08, 0x0C, 0x20, 0x00, 0x00, 0x00, 0x00
_02110648:
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x66, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x61, 0x08, 0x00, 0x00, 0x00, 0x08, 0x0C, 0x20, 0x00, 0x08, 0x0D, 0x20
_02110660:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEA, 0x05, 0x00, 0x00, 0x00, 0x00, 0xEB, 0x06, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x0D, 0x20
_02110678:
	.asciz "%d.%d.%d.%d"
	.balign 4, 0
_02110684:
	.byte 0x10, 0x00, 0x00, 0x00
_02110688:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00
_02110690:
	.byte 0xAA, 0xAA, 0x03, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00
_0211069C:
	.asciz "NintendoDS"
	.balign 4, 0
_021106A8:
 	.byte 0x55, 0x04, 0x03, 0x00
_021106AC:
 	.byte 0xFF, 0xFF, 0xFF, 0x00
_021106B0:
	.byte 0x04, 0x00, 0x05, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
_021106B8:
	.word _021106AC
	.word _021106D8
	.word _021106D0
	.word _021106E4
	.word _021106F0
	.word _021106A8
_021106D0:
	.byte 0x55, 0x08, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00
_021106D8:
	.byte 0x2A, 0x86, 0x48, 0x86, 0xF7, 0x0D, 0x01, 0x01
	.byte 0x01, 0x00, 0x00, 0x00
_021106E4:
	.byte 0x2A, 0x86, 0x48, 0x86, 0xF7, 0x0D, 0x01, 0x01, 0x04, 0x00, 0x00, 0x00
_021106F0:
	.byte 0x2A, 0x86, 0x48, 0x86, 0xF7, 0x0D, 0x01, 0x01, 0x05, 0x00, 0x00, 0x00
	.balign 4, 0
_021106FC:
	.asciz "A"
	.balign 4, 0
_02110700:
	.asciz "BB"
	.balign 4, 0
_02110704:
	.asciz "CCC"
	.balign 4, 0
_02110708:
	.asciz "SRVR"
	.balign 4, 0
_02110710:
	.asciz "CLNT"
	.balign 4, 0
_02110718:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
	.byte 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x01, 0x06, 0x0B, 0x00, 0x05, 0x0A, 0x0F, 0x04
	.byte 0x09, 0x0E, 0x03, 0x08, 0x0D, 0x02, 0x07, 0x0C, 0x05, 0x08, 0x0B, 0x0E, 0x01, 0x04, 0x07, 0x0A
	.byte 0x0D, 0x00, 0x03, 0x06, 0x09, 0x0C, 0x0F, 0x02, 0x00, 0x07, 0x0E, 0x05, 0x0C, 0x03, 0x0A, 0x01
	.byte 0x08, 0x0F, 0x06, 0x0D, 0x04, 0x0B, 0x02, 0x09
_02110758:
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02110798:
	.byte 0x78, 0xA4, 0x6A, 0xD7, 0x56, 0xB7, 0xC7, 0xE8
	.byte 0xDB, 0x70, 0x20, 0x24, 0xEE, 0xCE, 0xBD, 0xC1, 0xAF, 0x0F, 0x7C, 0xF5, 0x2A, 0xC6, 0x87, 0x47
	.byte 0x13, 0x46, 0x30, 0xA8, 0x01, 0x95, 0x46, 0xFD, 0xD8, 0x98, 0x80, 0x69, 0xAF, 0xF7, 0x44, 0x8B
	.byte 0xB1, 0x5B, 0xFF, 0xFF, 0xBE, 0xD7, 0x5C, 0x89, 0x22, 0x11, 0x90, 0x6B, 0x93, 0x71, 0x98, 0xFD
	.byte 0x8E, 0x43, 0x79, 0xA6, 0x21, 0x08, 0xB4, 0x49, 0x62, 0x25, 0x1E, 0xF6, 0x40, 0xB3, 0x40, 0xC0
	.byte 0x51, 0x5A, 0x5E, 0x26, 0xAA, 0xC7, 0xB6, 0xE9, 0x5D, 0x10, 0x2F, 0xD6, 0x53, 0x14, 0x44, 0x02
	.byte 0x81, 0xE6, 0xA1, 0xD8, 0xC8, 0xFB, 0xD3, 0xE7, 0xE6, 0xCD, 0xE1, 0x21, 0xD6, 0x07, 0x37, 0xC3
	.byte 0x87, 0x0D, 0xD5, 0xF4, 0xED, 0x14, 0x5A, 0x45, 0x05, 0xE9, 0xE3, 0xA9, 0xF8, 0xA3, 0xEF, 0xFC
	.byte 0xD9, 0x02, 0x6F, 0x67, 0x8A, 0x4C, 0x2A, 0x8D, 0x42, 0x39, 0xFA, 0xFF, 0x81, 0xF6, 0x71, 0x87
	.byte 0x22, 0x61, 0x9D, 0x6D, 0x0C, 0x38, 0xE5, 0xFD, 0x44, 0xEA, 0xBE, 0xA4, 0xA9, 0xCF, 0xDE, 0x4B
	.byte 0x60, 0x4B, 0xBB, 0xF6, 0x70, 0xBC, 0xBF, 0xBE, 0xC6, 0x7E, 0x9B, 0x28, 0xFA, 0x27, 0xA1, 0xEA
	.byte 0x85, 0x30, 0xEF, 0xD4, 0x05, 0x1D, 0x88, 0x04, 0x39, 0xD0, 0xD4, 0xD9, 0xE5, 0x99, 0xDB, 0xE6
	.byte 0xF8, 0x7C, 0xA2, 0x1F, 0x65, 0x56, 0xAC, 0xC4, 0x44, 0x22, 0x29, 0xF4, 0x97, 0xFF, 0x2A, 0x43
	.byte 0xA7, 0x23, 0x94, 0xAB, 0x39, 0xA0, 0x93, 0xFC, 0xC3, 0x59, 0x5B, 0x65, 0x92, 0xCC, 0x0C, 0x8F
	.byte 0x7D, 0xF4, 0xEF, 0xFF, 0xD1, 0x5D, 0x84, 0x85, 0x4F, 0x7E, 0xA8, 0x6F, 0xE0, 0xE6, 0x2C, 0xFE
	.byte 0x14, 0x43, 0x01, 0xA3, 0xA1, 0x11, 0x08, 0x4E, 0x82, 0x7E, 0x53, 0xF7, 0x35, 0xF2, 0x3A, 0xBD
	.byte 0xBB, 0xD2, 0xD7, 0x2A, 0x91, 0xD3, 0x86, 0xEB
_02110898:
	.byte 0x80
_02110899:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
