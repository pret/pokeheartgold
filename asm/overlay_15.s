#include "constants/sndseq.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0010.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov15_BagApp_init
ov15_BagApp_init: ; 0x021F9380
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _021F95EC ; =0xFFFFE0FF
	ldr r3, _021F95F0 ; =0x04001000
	and r2, r1
	str r2, [r0]
	ldr r2, [r3]
	add r0, #0x50
	and r1, r2
	str r1, [r3]
	mov r1, #0
	strh r1, [r0]
	add r3, #0x50
	mov r2, #0x42
	strh r1, [r3]
	mov r0, #3
	mov r1, #6
	lsl r2, r2, #0xc
	bl CreateHeap
	ldr r1, _021F95F4 ; =0x0000094C
	add r0, r5, #0
	mov r2, #6
	bl OverlayManager_CreateAndGetData
	ldr r2, _021F95F4 ; =0x0000094C
	mov r1, #0
	add r4, r0, #0
	bl memset
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	mov r1, #0x8d
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	bl BagApp_GetSaveStructPtrs
	mov r0, #6
	bl BgConfig_Alloc
	str r0, [r4]
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl PlayerProfile_GetTrainerGender
	ldr r1, _021F95F8 ; =0x00000615
	mov r3, #0
	strb r0, [r4, r1]
	mov r1, #6
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r1, #3
	mov r0, #2
	add r2, r1, #0
	bl BeginNormalPaletteFade
	mov r0, #3
	mov r1, #8
	bl SetKeyRepeatTimers
	add r0, r4, #0
	bl ov15_021F9DB4
	add r0, r4, #0
	bl ov15_021F9CBC
	add r0, r4, #0
	bl ov15_021FA008
	add r0, r4, #0
	bl ov15_021F9D28
	add r0, r4, #0
	bl ov15_021FA620
	bl ov15_021F9984
	ldr r0, [r4]
	bl ov15_021F99A4
	add r0, r4, #0
	bl ov15_021F9AE4
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	add r0, r4, #0
	bl ov15_021FE020
	mov r0, #1
	bl sub_02002B8C
	add r0, r4, #0
	bl ov15_021FE4C8
	add r0, r4, #0
	bl ov15_021FE528
	add r0, r4, #0
	bl ov15_021FEA5C
	add r0, r4, #0
	bl ov15_021FE874
	add r0, r4, #0
	bl ov15_021F9F08
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FF29C
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r3, [r4, r0]
	add r0, r3, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	add r0, r3, #0
	add r1, r3, #0
	add r0, #0xa
	add r1, #8
	add r0, r0, r2
	add r1, r1, r2
	add r2, r3, r2
	ldrb r2, [r2, #0xd]
	bl ov15_021FA044
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r3, [r4, r0]
	add r0, r3, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	add r0, r3, #0
	add r1, r3, #0
	add r0, #0xa
	add r1, #8
	add r0, r0, r2
	add r1, r1, r2
	add r2, r3, r2
	ldrb r2, [r2, #0xd]
	mov r3, #6
	bl ov15_021FA070
	add r0, r4, #0
	bl ov15_021FF850
	add r0, r4, #0
	bl ov15_021FA074
	mov r1, #0
	add r2, r0, #0
	add r0, r4, #0
	add r3, r1, #0
	bl ov15_021FD574
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r3, [r4, r0]
	add r0, r4, #0
	add r1, r3, #0
	add r1, #0x64
	ldrb r2, [r1]
	mov r1, #0xc
	mul r1, r2
	add r1, r3, r1
	mov r2, #0xa
	ldrsh r1, [r1, r2]
	sub r2, #0xb
	mov r3, #0
	bl ov15_021FF364
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	add r1, #0x64
	ldrb r1, [r1]
	bl ov15_02200030
	mov r2, #0x8d
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	add r0, r4, #0
	add r2, #0x64
	ldrb r2, [r2]
	mov r1, #1
	bl ov15_021FD404
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r3, [r4, r0]
	add r0, r3, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	add r3, r3, r2
	mov r2, #0xa
	ldrb r1, [r3, #0xd]
	ldrsh r2, [r3, r2]
	add r0, r4, #0
	mov r3, #0
	bl ov15_021FF6BC
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r5, [r4, r0]
	add r0, r4, #0
	bl ov15_021FA074
	add r1, r5, #4
	add r5, #0x64
	add r2, r0, #0
	ldrb r5, [r5]
	mov r3, #0xc
	add r0, r4, #0
	mul r3, r5
	add r1, r1, r3
	mov r3, #1
	bl ov15_02200140
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	add r0, r2, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r0, r2, r0
	ldrh r0, [r0, #8]
	ldr r1, _021F95FC ; =0x00000644
	add r0, #8
	str r0, [r4, r1]
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov15_021FFECC
	add r0, r4, #0
	bl ov15_021FA170
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x65
	ldrb r0, [r0]
	add r0, #0xfc
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _021F95B6
	add r0, r4, #0
	bl ov15_021FF1E0
_021F95B6:
	add r0, r4, #0
	bl ov15_021FD93C
	ldr r0, _021F9600 ; =ov15_021F995C
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r1, #0
	mov r0, #0x33
	add r2, r1, #0
	bl sub_02004EC4
	bl sub_0203A964
	ldr r2, _021F9604 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	mov r0, #4
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021F95EC: .word 0xFFFFE0FF
_021F95F0: .word 0x04001000
_021F95F4: .word 0x0000094C
_021F95F8: .word 0x00000615
_021F95FC: .word 0x00000644
_021F9600: .word ov15_021F995C
_021F9604: .word 0x04000304
	thumb_func_end ov15_BagApp_init

	thumb_func_start ov15_BagApp_exec
ov15_BagApp_exec: ; 0x021F9608
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #0x25
	bhi _021F96B8
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F9624: ; jump table
	.short _021F9670 - _021F9624 - 2 ; case 0
	.short _021F96A8 - _021F9624 - 2 ; case 1
	.short _021F96B0 - _021F9624 - 2 ; case 2
	.short _021F96E8 - _021F9624 - 2 ; case 3
	.short _021F96F0 - _021F9624 - 2 ; case 4
	.short _021F96F8 - _021F9624 - 2 ; case 5
	.short _021F9700 - _021F9624 - 2 ; case 6
	.short _021F9708 - _021F9624 - 2 ; case 7
	.short _021F9710 - _021F9624 - 2 ; case 8
	.short _021F9718 - _021F9624 - 2 ; case 9
	.short _021F9720 - _021F9624 - 2 ; case 10
	.short _021F9728 - _021F9624 - 2 ; case 11
	.short _021F9730 - _021F9624 - 2 ; case 12
	.short _021F9738 - _021F9624 - 2 ; case 13
	.short _021F9740 - _021F9624 - 2 ; case 14
	.short _021F9748 - _021F9624 - 2 ; case 15
	.short _021F9750 - _021F9624 - 2 ; case 16
	.short _021F9758 - _021F9624 - 2 ; case 17
	.short _021F9760 - _021F9624 - 2 ; case 18
	.short _021F9768 - _021F9624 - 2 ; case 19
	.short _021F9770 - _021F9624 - 2 ; case 20
	.short _021F9778 - _021F9624 - 2 ; case 21
	.short _021F9780 - _021F9624 - 2 ; case 22
	.short _021F9788 - _021F9624 - 2 ; case 23
	.short _021F9790 - _021F9624 - 2 ; case 24
	.short _021F97A0 - _021F9624 - 2 ; case 25
	.short _021F9798 - _021F9624 - 2 ; case 26
	.short _021F97A8 - _021F9624 - 2 ; case 27
	.short _021F97B0 - _021F9624 - 2 ; case 28
	.short _021F97B8 - _021F9624 - 2 ; case 29
	.short _021F97C0 - _021F9624 - 2 ; case 30
	.short _021F97CA - _021F9624 - 2 ; case 31
	.short _021F97D6 - _021F9624 - 2 ; case 32
	.short _021F97DE - _021F9624 - 2 ; case 33
	.short _021F97E6 - _021F9624 - 2 ; case 34
	.short _021F97EE - _021F9624 - 2 ; case 35
	.short _021F97F6 - _021F9624 - 2 ; case 36
	.short _021F9804 - _021F9624 - 2 ; case 37
_021F9670:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021F96B8
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x65
	ldrb r0, [r0]
	cmp r0, #1
	beq _021F9696
	cmp r0, #2
	beq _021F9690
	cmp r0, #3
	beq _021F969C
	b _021F96A2
_021F9690:
	mov r0, #0x10
	str r0, [r4]
	b _021F9810
_021F9696:
	mov r0, #0xe
	str r0, [r4]
	b _021F9810
_021F969C:
	mov r0, #0x1a
	str r0, [r4]
	b _021F9810
_021F96A2:
	mov r0, #1
	str r0, [r4]
	b _021F9810
_021F96A8:
	bl ov15_021FA1BC
	str r0, [r4]
	b _021F9810
_021F96B0:
	bl ov15_021FA93C
	cmp r0, #1
	beq _021F96BA
_021F96B8:
	b _021F9810
_021F96BA:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x65
	ldrb r0, [r0]
	cmp r0, #2
	bne _021F96CE
	mov r0, #0x10
	str r0, [r4]
	b _021F9810
_021F96CE:
	cmp r0, #1
	bne _021F96D8
	mov r0, #0xe
	str r0, [r4]
	b _021F9810
_021F96D8:
	cmp r0, #3
	bne _021F96E2
	mov r0, #0x1a
	str r0, [r4]
	b _021F9810
_021F96E2:
	mov r0, #1
	str r0, [r4]
	b _021F9810
_021F96E8:
	bl ov15_021FAE48
	str r0, [r4]
	b _021F9810
_021F96F0:
	bl ov15_021FB5AC
	str r0, [r4]
	b _021F9810
_021F96F8:
	bl ov15_021FBD50
	str r0, [r4]
	b _021F9810
_021F9700:
	bl ov15_021FBF98
	str r0, [r4]
	b _021F9810
_021F9708:
	bl ov15_021FBFC0
	str r0, [r4]
	b _021F9810
_021F9710:
	bl ov15_021FBFF8
	str r0, [r4]
	b _021F9810
_021F9718:
	bl ov15_021FC01C
	str r0, [r4]
	b _021F9810
_021F9720:
	bl ov15_021FC140
	str r0, [r4]
	b _021F9810
_021F9728:
	bl ov15_021FC164
	str r0, [r4]
	b _021F9810
_021F9730:
	bl ov15_021FB700
	str r0, [r4]
	b _021F9810
_021F9738:
	bl ov15_021FB820
	str r0, [r4]
	b _021F9810
_021F9740:
	bl ov15_021FC41C
	str r0, [r4]
	b _021F9810
_021F9748:
	bl ov15_021FC784
	str r0, [r4]
	b _021F9810
_021F9750:
	bl ov15_021FC7EC
	str r0, [r4]
	b _021F9810
_021F9758:
	bl ov15_021FCD80
	str r0, [r4]
	b _021F9810
_021F9760:
	bl ov15_021FCDE4
	str r0, [r4]
	b _021F9810
_021F9768:
	bl ov15_021FCFC8
	str r0, [r4]
	b _021F9810
_021F9770:
	bl ov15_021FD058
	str r0, [r4]
	b _021F9810
_021F9778:
	bl ov15_021FD0E8
	str r0, [r4]
	b _021F9810
_021F9780:
	bl ov15_021FD10C
	str r0, [r4]
	b _021F9810
_021F9788:
	bl ov15_021FD24C
	str r0, [r4]
	b _021F9810
_021F9790:
	bl ov15_021FD2FC
	str r0, [r4]
	b _021F9810
_021F9798:
	bl ov15_021FD3AC
	str r0, [r4]
	b _021F9810
_021F97A0:
	bl ov15_021FC2E0
	str r0, [r4]
	b _021F9810
_021F97A8:
	bl ov15_021FA4F8
	str r0, [r4]
	b _021F9810
_021F97B0:
	bl ov15_021FB604
	str r0, [r4]
	b _021F9810
_021F97B8:
	bl ov15_021FB654
	str r0, [r4]
	b _021F9810
_021F97C0:
	mov r1, #1
	bl ov15_021FA578
	str r0, [r4]
	b _021F9810
_021F97CA:
	mov r1, #0
	mvn r1, r1
	bl ov15_021FA578
	str r0, [r4]
	b _021F9810
_021F97D6:
	bl ov15_021FB060
	str r0, [r4]
	b _021F9810
_021F97DE:
	bl ov15_021FAFFC
	str r0, [r4]
	b _021F9810
_021F97E6:
	bl ov15_021FCB64
	str r0, [r4]
	b _021F9810
_021F97EE:
	bl ov15_021FD850
	str r0, [r4]
	b _021F9810
_021F97F6:
	mov r0, #1
	mov r1, #6
	bl sub_020880CC
	mov r0, #0x25
	str r0, [r4]
	b _021F9810
_021F9804:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _021F9810
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F9810:
	add r0, r5, #0
	bl ov15_021FF8D4
	mov r0, #0x93
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200D020
	add r0, r5, #0
	bl ov15_021FDC88
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov15_BagApp_exec

	thumb_func_start ov15_BagApp_exit
ov15_BagApp_exit: ; 0x021F982C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov15_021FDC6C
	add r0, r4, #0
	bl ov15_021FF894
	ldr r0, _021F98EC ; =0x0000068C
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x69
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r4, #0
	bl ov15_021FA0D8
	add r0, r4, #0
	bl ov15_021F9EA8
	add r0, r4, #0
	bl ov15_021FE154
	ldr r0, [r4]
	bl ov15_021F9A8C
	bl sub_02021238
	bl GF_DestroyVramTransferManager
	add r0, r4, #0
	bl ov15_021FEB64
	add r0, r4, #0
	bl ov15_021FE504
	add r0, r4, #0
	bl ov15_021FE8A4
	add r0, r4, #0
	bl ov15_021FA028
	ldr r0, _021F98F0 ; =0x000005E4
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0xbf
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0xbe
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl DestroyMsgData
	mov r0, #0xbb
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl MessagePrinter_delete
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl NARC_dtor
	add r0, r5, #0
	bl OverlayManager_FreeData
	bl sub_02004B10
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #6
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021F98EC: .word 0x0000068C
_021F98F0: .word 0x000005E4
	thumb_func_end ov15_BagApp_exit

	thumb_func_start BagApp_GetSaveStructPtrs
BagApp_GetSaveStructPtrs: ; 0x021F98F4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl Sav2_Bag_get
	mov r1, #0x8e
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r0, r1, #4
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0x8f
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #8
	ldr r0, [r4, r1]
	ldr r0, [r0]
	bl Sav2_PlayerData_GetOptionsAddr
	mov r1, #9
	lsl r1, r1, #6
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end BagApp_GetSaveStructPtrs

	thumb_func_start BagApp_GetSaveRoamers
BagApp_GetSaveRoamers: ; 0x021F992C
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	ldr r3, _021F9938 ; =Save_Roamers_get
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_021F9938: .word Save_Roamers_get
	thumb_func_end BagApp_GetSaveRoamers

	thumb_func_start BagApp_GetRepelStepCountAddr
BagApp_GetRepelStepCountAddr: ; 0x021F993C
	push {r4, lr}
	add r4, r1, #0
	bl BagApp_GetSaveRoamers
	bl RoamerSave_GetRepelAddr
	strb r4, [r0]
	pop {r4, pc}
	thumb_func_end BagApp_GetRepelStepCountAddr

	thumb_func_start BagApp_SetFlute
BagApp_SetFlute: ; 0x021F994C
	push {r4, lr}
	add r4, r1, #0
	bl BagApp_GetSaveRoamers
	add r1, r4, #0
	bl RoamerSave_SetFlute
	pop {r4, pc}
	thumb_func_end BagApp_SetFlute

	thumb_func_start ov15_021F995C
ov15_021F995C: ; 0x021F995C
	push {r3, lr}
	ldr r0, [r0]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl GF_RunVramTransferTasks
	bl sub_0200D034
	ldr r3, _021F997C ; =0x027E0000
	ldr r1, _021F9980 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r3, pc}
	nop
_021F997C: .word 0x027E0000
_021F9980: .word 0x00003FF8
	thumb_func_end ov15_021F995C

	thumb_func_start ov15_021F9984
ov15_021F9984: ; 0x021F9984
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021F99A0 ; =ov15_02200618
	add r3, sp, #0
	mov r2, #5
_021F998E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021F998E
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021F99A0: .word ov15_02200618
	thumb_func_end ov15_021F9984

	thumb_func_start ov15_021F99A4
ov15_021F99A4: ; 0x021F99A4
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r5, _021F9A68 ; =ov15_02200518
	add r3, sp, #4
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r2, _021F9A6C ; =ov15_022006CC
	add r0, r4, #0
	mov r1, #1
	mov r3, #0
	bl InitBgFromTemplate
	ldr r2, _021F9A70 ; =ov15_022006E8
	add r0, r4, #0
	mov r1, #2
	mov r3, #0
	bl InitBgFromTemplate
	ldr r2, _021F9A74 ; =ov15_02200704
	add r0, r4, #0
	mov r1, #3
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #6
	bl BG_ClearCharDataRange
	ldr r2, _021F9A78 ; =ov15_02200720
	add r0, r4, #0
	mov r1, #4
	mov r3, #0
	bl InitBgFromTemplate
	ldr r2, _021F9A7C ; =ov15_0220073C
	add r0, r4, #0
	mov r1, #5
	mov r3, #0
	bl InitBgFromTemplate
	ldr r2, _021F9A80 ; =ov15_02200758
	add r0, r4, #0
	mov r1, #6
	mov r3, #0
	bl InitBgFromTemplate
	ldr r2, _021F9A84 ; =ov15_02200774
	add r0, r4, #0
	mov r1, #7
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #6
	bl BG_ClearCharDataRange
	mov r0, #7
	mov r1, #0x20
	mov r2, #0
	mov r3, #6
	bl BG_ClearCharDataRange
	mov r1, #0
	ldr r0, _021F9A88 ; =0x04000050
	mov r2, #8
	add r3, r1, #0
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_021F9A68: .word ov15_02200518
_021F9A6C: .word ov15_022006CC
_021F9A70: .word ov15_022006E8
_021F9A74: .word ov15_02200704
_021F9A78: .word ov15_02200720
_021F9A7C: .word ov15_0220073C
_021F9A80: .word ov15_02200758
_021F9A84: .word ov15_02200774
_021F9A88: .word 0x04000050
	thumb_func_end ov15_021F99A4

	thumb_func_start ov15_021F9A8C
ov15_021F9A8C: ; 0x021F9A8C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1f
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0x1b
	mov r1, #0
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	mov r1, #7
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #6
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #5
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	mov r1, #1
	bl FreeBgTilemapBuffer
	mov r0, #6
	add r1, r4, #0
	bl FreeToHeapExplicit
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov15_021F9A8C

	thumb_func_start ov15_021F9AE4
ov15_021F9AE4: ; 0x021F9AE4
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0xf
	mov r1, #6
	bl NARC_ctor
	mov r1, #0x91
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #6
	str r0, [sp, #0xc]
	ldr r2, [r4]
	mov r0, #0xf
	mov r1, #7
	mov r3, #2
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #6
	str r0, [sp, #0xc]
	ldr r2, [r4]
	mov r0, #0xf
	mov r1, #0x36
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	ldr r0, _021F9C60 ; =0x00000615
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _021F9B4A
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #6
	str r0, [sp, #0xc]
	ldr r2, [r4]
	mov r0, #0xf
	mov r1, #0x5e
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	b _021F9B62
_021F9B4A:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #6
	str r0, [sp, #0xc]
	ldr r2, [r4]
	mov r0, #0xf
	mov r1, #0x5d
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
_021F9B62:
	mov r2, #0
	str r2, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0xf
	mov r1, #8
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0x20
	str r0, [sp]
	mov r0, #6
	mov r3, #0x1a
	str r0, [sp, #4]
	mov r0, #0xf
	mov r1, #0x11
	mov r2, #0
	lsl r3, r3, #4
	bl GfGfxLoader_GXLoadPal
	mov r1, #0x16
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #6
	bl LoadFontPal1
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _021F9C64 ; =0x000003F7
	mov r1, #1
	mov r3, #0xe
	bl LoadUserFrameGfx1
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _021F9C68 ; =0x000003D9
	mov r1, #1
	mov r3, #0xc
	bl LoadUserFrameGfx2
	mov r3, #0
	str r3, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0xf
	mov r1, #0x26
	mov r2, #4
	bl GfGfxLoader_GXLoadPal
	mov r1, #0x16
	mov r0, #4
	lsl r1, r1, #4
	mov r2, #6
	bl LoadFontPal1
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r3, #6
	str r3, [sp, #0xc]
	ldr r2, [r4]
	mov r0, #0xf
	mov r1, #0x2e
	bl GfGfxLoader_LoadCharData
	ldr r2, _021F9C6C ; =0x00000694
	mov r0, #0xf
	mov r1, #0x28
	add r2, r4, r2
	mov r3, #6
	bl GfGfxLoader_GetPlttData
	ldr r2, _021F9C70 ; =0x0000068C
	mov r1, #0x29
	str r0, [r4, r2]
	add r2, #0xc
	mov r0, #0xf
	add r2, r4, r2
	mov r3, #6
	bl GfGfxLoader_GetPlttData
	mov r1, #0x69
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #0x80
	mov r2, #4
	str r0, [sp]
	mov r0, #6
	add r3, r2, #0
	str r0, [sp, #4]
	mov r0, #0xf
	mov r1, #8
	add r3, #0xfc
	bl GfGfxLoader_GXLoadPal
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _021F9C74 ; =0x000003E2
	mov r1, #4
	mov r3, #0xc
	bl LoadUserFrameGfx2
	add sp, #0x10
	pop {r4, pc}
	nop
_021F9C60: .word 0x00000615
_021F9C64: .word 0x000003F7
_021F9C68: .word 0x000003D9
_021F9C6C: .word 0x00000694
_021F9C70: .word 0x0000068C
_021F9C74: .word 0x000003E2
	thumb_func_end ov15_021F9AE4

	thumb_func_start ov15_021F9C78
ov15_021F9C78: ; 0x021F9C78
	push {r3, lr}
	sub sp, #0x10
	add r2, r0, #0
	cmp r1, #1
	bne _021F9C9E
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #6
	str r0, [sp, #0xc]
	ldr r2, [r2]
	mov r0, #0xf
	mov r1, #0x36
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	add sp, #0x10
	pop {r3, pc}
_021F9C9E:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #6
	str r0, [sp, #0xc]
	ldr r2, [r2]
	mov r0, #0xf
	mov r1, #9
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	add sp, #0x10
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov15_021F9C78

	thumb_func_start ov15_021F9CBC
ov15_021F9CBC: ; 0x021F9CBC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xa
	mov r3, #6
	bl NewMsgDataFromNarc
	mov r1, #0x2f
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #1
	mov r1, #2
	mov r2, #0
	mov r3, #6
	bl MessagePrinter_new
	mov r1, #0xbb
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #6
	bl ScrStrBufs_new
	mov r1, #0xbd
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xde
	mov r3, #6
	bl NewMsgDataFromNarc
	mov r2, #0xbe
	lsl r2, r2, #2
	str r0, [r4, r2]
	mov r0, #0
	mov r1, #0x1b
	sub r2, #0xa
	mov r3, #6
	bl NewMsgDataFromNarc
	mov r1, #0xbf
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #6
	bl String_ctor
	ldr r1, _021F9D24 ; =0x000005E4
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_021F9D24: .word 0x000005E4
	thumb_func_end ov15_021F9CBC

	thumb_func_start ov15_021F9D28
ov15_021F9D28: ; 0x021F9D28
	push {r3, r4, r5, r6}
	ldr r2, _021F9D5C ; =0x00000614
	mov r1, #0
	strb r1, [r0, r2]
	add r4, r2, #0
	mov r2, #0x8d
	lsl r2, r2, #2
	mov r3, #0xc
_021F9D38:
	add r5, r1, #0
	ldr r6, [r0, r2]
	mul r5, r3
	add r5, r6, r5
	ldr r5, [r5, #4]
	cmp r5, #0
	beq _021F9D4C
	ldrb r5, [r0, r4]
	add r5, r5, #1
	strb r5, [r0, r4]
_021F9D4C:
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #8
	blo _021F9D38
	pop {r3, r4, r5, r6}
	bx lr
	nop
_021F9D5C: .word 0x00000614
	thumb_func_end ov15_021F9D28

	thumb_func_start ov15_021F9D60
ov15_021F9D60: ; 0x021F9D60
	push {r3, r4}
	mov r3, #0x8d
	lsl r3, r3, #2
	ldr r0, [r0, r3]
	add r4, r0, #4
	add r0, #0x64
	ldrb r3, [r0]
	mov r0, #0xc
	mul r0, r3
	cmp r2, #0
	ldr r2, [r4, r0]
	bne _021F9D80
	lsl r0, r1, #2
	ldrh r0, [r2, r0]
	pop {r3, r4}
	bx lr
_021F9D80:
	lsl r0, r1, #2
	add r0, r2, r0
	ldrh r0, [r0, #2]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov15_021F9D60

	thumb_func_start ov15_021F9D8C
ov15_021F9D8C: ; 0x021F9D8C
	add r3, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, _021F9D98 ; =ReadMsgDataIntoString
	bx r3
	nop
_021F9D98: .word ReadMsgDataIntoString
	thumb_func_end ov15_021F9D8C

	thumb_func_start ov15_021F9D9C
ov15_021F9D9C: ; 0x021F9D9C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	bl TMHMGetMove
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl ReadMsgDataIntoString
	pop {r3, r4, r5, pc}
	thumb_func_end ov15_021F9D9C

	thumb_func_start ov15_021F9DB4
ov15_021F9DB4: ; 0x021F9DB4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r1, [r7, r0]
	mov r5, #0
	add r1, #0x64
	strb r5, [r1]
	ldr r0, [r7, r0]
	add r4, r0, #4
	ldr r0, [r0, #0x6c]
	cmp r0, #0
	bne _021F9E12
	add r2, r5, #0
	mov r1, #0xc
_021F9DD2:
	add r0, r5, #0
	mul r0, r1
	add r3, r4, r0
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021F9DE2
	strh r2, [r3, #4]
	strh r2, [r3, #6]
_021F9DE2:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #8
	blo _021F9DD2
	mov r2, #0
	mov r1, #0xc
_021F9DF0:
	add r0, r2, #0
	mul r0, r1
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021F9E06
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	add r0, #0x64
	strb r2, [r0]
	pop {r3, r4, r5, r6, r7, pc}
_021F9E06:
	add r0, r2, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	cmp r2, #8
	blo _021F9DF0
	pop {r3, r4, r5, r6, r7, pc}
_021F9E12:
	mov r0, #0xc
	mul r0, r5
	add r6, r4, r0
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021F9E3E
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	ldrb r1, [r6, #8]
	add r2, sp, #0
	ldr r0, [r0, #0x6c]
	add r2, #1
	add r3, sp, #0
	bl BagCursor_Field_PocketGetPosition
	add r0, sp, #0
	ldrb r0, [r0, #1]
	strh r0, [r6, #4]
	add r0, sp, #0
	ldrb r0, [r0]
	strh r0, [r6, #6]
_021F9E3E:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #8
	blo _021F9E12
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	ldr r0, [r0, #0x6c]
	bl BagCursor_Field_GetPocket
	mov r1, #0xc
	mul r1, r0
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _021F9E7A
	mov r3, #0
	mov r2, #0xc
_021F9E62:
	add r1, r3, #0
	mul r1, r2
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _021F9E70
	add r0, r3, #0
	b _021F9E7A
_021F9E70:
	add r1, r3, #1
	lsl r1, r1, #0x10
	lsr r3, r1, #0x10
	cmp r3, #8
	blo _021F9E62
_021F9E7A:
	mov r1, #0
	mov r2, #0xc
_021F9E7E:
	add r3, r1, #0
	mul r3, r2
	add r5, r4, r3
	ldr r3, [r4, r3]
	cmp r3, #0
	beq _021F9E9C
	ldrb r3, [r5, #8]
	cmp r0, r3
	bne _021F9E9C
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	add r0, #0x64
	strb r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
_021F9E9C:
	add r1, r1, #1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	cmp r1, #8
	blo _021F9E7E
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_021F9DB4

	thumb_func_start ov15_021F9EA8
ov15_021F9EA8: ; 0x021F9EA8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	ldr r0, [r1, #0x6c]
	cmp r0, #0
	beq _021F9F06
	add r0, r1, #4
	str r0, [sp]
	mov r4, #0
	add r5, r0, #0
	mov r7, #6
_021F9EC2:
	ldr r0, [r5]
	cmp r0, #0
	beq _021F9EE2
	mov r0, #0x8d
	lsl r0, r0, #2
	ldrh r2, [r5, #4]
	ldrsh r3, [r5, r7]
	ldr r0, [r6, r0]
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldrb r1, [r5, #8]
	ldr r0, [r0, #0x6c]
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl BagCursor_Field_PocketSetPosition
_021F9EE2:
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #8
	blo _021F9EC2
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	ldr r0, [r1, #0x6c]
	add r1, #0x64
	ldrb r2, [r1]
	mov r1, #0xc
	add r3, r2, #0
	mul r3, r1
	ldr r1, [sp]
	add r1, r1, r3
	ldrb r1, [r1, #8]
	bl BagCursor_Field_SetPocket
_021F9F06:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_021F9EA8

	thumb_func_start ov15_021F9F08
ov15_021F9F08: ; 0x021F9F08
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r1, #0x8d
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [r0, r1]
	add r2, r0, #4
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r4, r2, r0
	ldrb r1, [r4, #8]
	cmp r1, #3
	bne _021F9F82
	ldr r0, _021FA000 ; =ov15_022008B0
	mov r6, #0
	ldrb r0, [r0, r1]
	cmp r0, #0
	bls _021F9F7E
	ldr r0, [sp]
	add r5, r6, #0
	str r0, [sp, #4]
	add r7, r0, #0
_021F9F38:
	ldr r0, [r4]
	ldrh r3, [r0, r5]
	add r1, r0, r5
	cmp r3, #0
	beq _021F9F7E
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _021F9F7E
	mov r0, #0xbf
	ldr r1, [sp]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0x35
	ldr r2, [sp, #4]
	lsl r1, r1, #4
	ldr r1, [r2, r1]
	add r2, r3, #0
	mov r3, #6
	bl ov15_021F9D9C
	ldr r0, [r4]
	add r6, r6, #1
	ldrh r1, [r0, r5]
	ldr r0, _021FA004 ; =0x000006A4
	add r5, r5, #4
	strh r1, [r7, r0]
	ldr r0, [sp, #4]
	ldrb r1, [r4, #8]
	add r0, r0, #4
	str r0, [sp, #4]
	ldr r0, _021FA000 ; =ov15_022008B0
	add r7, r7, #2
	ldrb r0, [r0, r1]
	cmp r6, r0
	blo _021F9F38
_021F9F7E:
	strb r6, [r4, #9]
	b _021F9FDC
_021F9F82:
	ldr r0, _021FA000 ; =ov15_022008B0
	mov r6, #0
	ldrb r0, [r0, r1]
	cmp r0, #0
	bls _021F9FDA
	ldr r0, [sp]
	add r5, r6, #0
	str r0, [sp, #8]
	add r7, r0, #0
_021F9F94:
	ldr r0, [r4]
	ldrh r3, [r0, r5]
	add r1, r0, r5
	cmp r3, #0
	beq _021F9FDA
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _021F9FDA
	mov r0, #0xbe
	ldr r1, [sp]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0x35
	ldr r2, [sp, #8]
	lsl r1, r1, #4
	ldr r1, [r2, r1]
	add r2, r3, #0
	mov r3, #6
	bl ov15_021F9D8C
	ldr r0, [r4]
	add r6, r6, #1
	ldrh r1, [r0, r5]
	ldr r0, _021FA004 ; =0x000006A4
	add r5, r5, #4
	strh r1, [r7, r0]
	ldr r0, [sp, #8]
	ldrb r1, [r4, #8]
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, _021FA000 ; =ov15_022008B0
	add r7, r7, #2
	ldrb r0, [r0, r1]
	cmp r6, r0
	blo _021F9F94
_021F9FDA:
	strb r6, [r4, #9]
_021F9FDC:
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _021F9FE6
	mov r1, #0
	b _021F9FF2
_021F9FE6:
	sub r0, r0, #1
	mov r1, #6
	bl _s32_div_f
	mov r1, #6
	mul r1, r0
_021F9FF2:
	mov r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, r1
	ble _021F9FFC
	strh r1, [r4, #6]
_021F9FFC:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FA000: .word ov15_022008B0
_021FA004: .word 0x000006A4
	thumb_func_end ov15_021F9F08

	thumb_func_start ov15_021FA008
ov15_021FA008: ; 0x021FA008
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0x35
	add r5, r0, #0
	mov r4, #0
	mov r7, #0x12
	lsl r6, r6, #4
_021FA014:
	add r0, r7, #0
	mov r1, #6
	bl String_ctor
	str r0, [r5, r6]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xa5
	blo _021FA014
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_021FA008

	thumb_func_start ov15_021FA028
ov15_021FA028: ; 0x021FA028
	push {r4, r5, r6, lr}
	mov r6, #0x35
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #4
_021FA032:
	ldr r0, [r5, r6]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xa5
	blo _021FA032
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov15_021FA028

	thumb_func_start ov15_021FA044
ov15_021FA044: ; 0x021FA044
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	ldrsh r3, [r4, r0]
	ldrh r0, [r1]
	add r0, r3, r0
	cmp r0, r2
	ble _021FA062
	sub r0, r2, #1
	mov r1, #6
	bl _s32_div_f
	mov r1, #6
	mul r1, r0
	strh r1, [r4]
_021FA062:
	mov r0, #0
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _021FA06C
	strh r0, [r4]
_021FA06C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov15_021FA044

	thumb_func_start ov15_021FA070
ov15_021FA070: ; 0x021FA070
	bx lr
	.balign 4, 0
	thumb_func_end ov15_021FA070

	thumb_func_start ov15_021FA074
ov15_021FA074: ; 0x021FA074
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	add r0, r2, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r2, r2, r0
	mov r0, #0xa
	ldrb r1, [r2, #0xd]
	ldrsh r0, [r2, r0]
	sub r0, r1, r0
	cmp r0, #6
	ble _021FA094
	mov r0, #6
_021FA094:
	bx lr
	.balign 4, 0
	thumb_func_end ov15_021FA074

	thumb_func_start ov15_021FA098
ov15_021FA098: ; 0x021FA098
	push {r3, r4, r5, lr}
	ldr r1, _021FA0D4 ; =0x00000672
	ldrb r4, [r0, r1]
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r5, [r0, r1]
	add r0, r4, #0
	mov r1, #6
	bl _s32_div_f
	add r1, r5, #0
	add r1, #0x64
	ldrb r2, [r1]
	mov r1, #0xc
	mul r1, r2
	add r2, r5, r1
	mov r1, #0xa
	ldrsh r3, [r2, r1]
	mov r1, #6
	add r2, r0, #0
	mul r2, r1
	cmp r3, r2
	bne _021FA0CE
	add r0, r4, #0
	bl _s32_div_f
	b _021FA0D0
_021FA0CE:
	sub r1, r1, #7
_021FA0D0:
	add r0, r1, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FA0D4: .word 0x00000672
	thumb_func_end ov15_021FA098

	thumb_func_start ov15_021FA0D8
ov15_021FA0D8: ; 0x021FA0D8
	mov r1, #0xd2
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov15_021FA0D8

	thumb_func_start ov15_021FA0E4
ov15_021FA0E4: ; 0x021FA0E4
	cmp r1, #8
	blt _021FA102
	cmp r1, #0xe
	bge _021FA102
	mov r2, #0x8d
	lsl r2, r2, #2
	ldr r3, [r0, r2]
	sub r1, #8
	add r0, r3, #0
	add r0, #0x64
	ldrb r2, [r0]
	mov r0, #0xc
	mul r0, r2
	add r0, r3, r0
	strh r1, [r0, #8]
_021FA102:
	bx lr
	thumb_func_end ov15_021FA0E4

	thumb_func_start ov15_021FA104
ov15_021FA104: ; 0x021FA104
	add r2, r1, #0
	sub r2, #0xe
	cmp r2, #1
	bhi _021FA110
	mov r0, #0
	bx lr
_021FA110:
	cmp r1, #7
	bgt _021FA124
	ldr r1, _021FA128 ; =0x00000644
	ldr r0, [r0, r1]
	cmp r0, #8
	blt _021FA124
	cmp r0, #0xd
	bgt _021FA124
	mov r0, #0
	bx lr
_021FA124:
	mov r0, #1
	bx lr
	.balign 4, 0
_021FA128: .word 0x00000644
	thumb_func_end ov15_021FA104

	thumb_func_start ov15_021FA12C
ov15_021FA12C: ; 0x021FA12C
	push {r3, r4}
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r3, [r0, r1]
	add r1, r3, #0
	add r1, #0x64
	ldrb r2, [r1]
	mov r1, #0xc
	add r3, r3, #4
	mul r1, r2
	add r1, r3, r1
	mov r3, #6
	ldrsh r4, [r1, r3]
	ldr r3, _021FA168 ; =0x00000644
	ldr r0, [r0, r3]
	add r3, r4, r0
	ldr r0, _021FA16C ; =ov15_022008B0
	sub r3, #8
	ldrb r0, [r0, r2]
	cmp r0, r3
	bhi _021FA15C
	mov r0, #0
	pop {r3, r4}
	bx lr
_021FA15C:
	ldr r1, [r1]
	lsl r0, r3, #2
	ldrh r0, [r1, r0]
	pop {r3, r4}
	bx lr
	nop
_021FA168: .word 0x00000644
_021FA16C: .word ov15_022008B0
	thumb_func_end ov15_021FA12C

	thumb_func_start ov15_021FA170
ov15_021FA170: ; 0x021FA170
	push {r4, lr}
	ldr r1, _021FA1B8 ; =0x00000644
	add r4, r0, #0
	ldr r2, [r4, r1]
	cmp r2, #8
	blt _021FA19C
	cmp r2, #0xd
	bgt _021FA19C
	bl ov15_021FA12C
	add r2, r0, #0
	beq _021FA192
	add r0, r4, #0
	add r1, r4, #4
	bl ov15_021FECA0
	pop {r4, pc}
_021FA192:
	add r0, r4, #0
	add r1, r4, #4
	bl ov15_021FECC4
	pop {r4, pc}
_021FA19C:
	cmp r2, #0
	blt _021FA1AE
	cmp r2, #7
	bgt _021FA1AE
	add r0, r4, #0
	add r1, r4, #4
	bl ov15_021FECD8
	pop {r4, pc}
_021FA1AE:
	add r0, r4, #0
	add r1, r4, #4
	bl ov15_021FECC4
	pop {r4, pc}
	.balign 4, 0
_021FA1B8: .word 0x00000644
	thumb_func_end ov15_021FA170

	thumb_func_start ov15_021FA1BC
ov15_021FA1BC: ; 0x021FA1BC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _021FA4A4 ; =gSystem
	mov r2, #0x40
	ldr r3, [r1, #0x4c]
	add r5, r0, #0
	mov r4, #0
	tst r2, r3
	beq _021FA1DE
	ldr r0, _021FA4A8 ; =0x00000644
	add r4, r4, #1
	ldr r1, [r5, r0]
	lsl r2, r1, #2
	ldr r1, _021FA4AC ; =ov15_02200640
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	b _021FA38C
_021FA1DE:
	mov r2, #0x80
	tst r2, r3
	beq _021FA1F4
	ldr r0, _021FA4A8 ; =0x00000644
	add r4, r4, #1
	ldr r1, [r5, r0]
	lsl r2, r1, #2
	ldr r1, _021FA4B0 ; =ov15_02200641
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	b _021FA38C
_021FA1F4:
	mov r2, #0x20
	add r6, r3, #0
	tst r6, r2
	beq _021FA246
	ldr r1, _021FA4A8 ; =0x00000644
	ldr r3, _021FA4B4 ; =ov15_02200642
	ldr r1, [r5, r1]
	lsl r6, r1, #2
	ldrb r3, [r3, r6]
	cmp r3, #0xe
	bne _021FA21E
	mov r1, #2
	str r1, [sp]
	mov r1, #0xe
	add r2, sp, #0xc
	mov r3, #1
	str r4, [sp, #4]
	bl ov15_021FA73C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA21E:
	cmp r1, #0x10
	beq _021FA274
	cmp r1, #0
	blt _021FA23E
	cmp r1, #8
	bge _021FA23E
	sub r2, #0x21
	bl ov15_021FA6C0
	ldr r1, _021FA4A8 ; =0x00000644
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021FA274
	str r0, [r5, r1]
	add r4, r4, #1
	b _021FA38C
_021FA23E:
	ldr r0, _021FA4A8 ; =0x00000644
	add r4, r4, #1
	str r3, [r5, r0]
	b _021FA38C
_021FA246:
	mov r2, #0x10
	tst r3, r2
	beq _021FA29A
	ldr r1, _021FA4A8 ; =0x00000644
	ldr r2, _021FA4B8 ; =ov15_02200643
	ldr r1, [r5, r1]
	lsl r3, r1, #2
	ldrb r2, [r2, r3]
	cmp r2, #0xf
	bne _021FA270
	mov r1, #2
	str r1, [sp]
	add r2, sp, #8
	mov r1, #0xf
	add r2, #3
	mov r3, #1
	str r4, [sp, #4]
	bl ov15_021FA73C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA270:
	cmp r1, #0x10
	bne _021FA276
_021FA274:
	b _021FA38C
_021FA276:
	cmp r1, #0
	blt _021FA292
	cmp r1, #8
	bge _021FA292
	mov r2, #1
	bl ov15_021FA6C0
	ldr r1, _021FA4A8 ; =0x00000644
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021FA38C
	str r0, [r5, r1]
	add r4, r4, #1
	b _021FA38C
_021FA292:
	ldr r0, _021FA4A8 ; =0x00000644
	add r4, r4, #1
	str r2, [r5, r0]
	b _021FA38C
_021FA29A:
	ldr r3, [r1, #0x48]
	lsl r1, r2, #5
	tst r1, r3
	beq _021FA314
	ldr r1, _021FA4A8 ; =0x00000644
	ldr r1, [r5, r1]
	cmp r1, #0
	blt _021FA2E6
	cmp r1, #8
	bge _021FA2E6
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	sub r2, #0x11
	add r1, #0x64
	ldrb r1, [r1]
	bl ov15_021FA6C0
	ldr r1, _021FA4A8 ; =0x00000644
	str r0, [r5, r1]
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov15_021FFECC
	mov r0, #2
	str r0, [sp]
	add r0, r4, #0
	str r0, [sp, #4]
	ldr r1, _021FA4A8 ; =0x00000644
	add r2, sp, #8
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r2, #2
	mov r3, #1
	bl ov15_021FA73C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA2E6:
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r2, #0
	add r1, #0x64
	ldrb r1, [r1]
	add r0, r5, #0
	mvn r2, r2
	bl ov15_021FA6C0
	add r1, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	add r2, sp, #8
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, #2
	mov r3, #1
	bl ov15_021FA73C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA314:
	add r2, #0xf0
	add r1, r3, #0
	tst r1, r2
	beq _021FA38C
	ldr r1, _021FA4A8 ; =0x00000644
	ldr r1, [r5, r1]
	cmp r1, #0
	blt _021FA360
	cmp r1, #8
	bge _021FA360
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r2, #1
	add r1, #0x64
	ldrb r1, [r1]
	bl ov15_021FA6C0
	ldr r1, _021FA4A8 ; =0x00000644
	str r0, [r5, r1]
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov15_021FFECC
	mov r0, #2
	str r0, [sp]
	add r0, r4, #0
	str r0, [sp, #4]
	ldr r1, _021FA4A8 ; =0x00000644
	add r2, sp, #8
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r2, #1
	mov r3, #1
	bl ov15_021FA73C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA360:
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r1, #0x64
	ldrb r1, [r1]
	mov r2, #1
	bl ov15_021FA6C0
	add r1, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	add r2, sp, #8
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, #1
	mov r3, #1
	bl ov15_021FA73C
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA38C:
	ldr r1, _021FA4A8 ; =0x00000644
	ldr r0, [r5, r1]
	cmp r0, #0x11
	bne _021FA3A0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x64
	ldrb r0, [r0]
	str r0, [r5, r1]
_021FA3A0:
	cmp r4, #0
	beq _021FA3C4
	ldr r0, _021FA4BC ; =0x000005DC
	bl PlaySE
	ldr r1, _021FA4A8 ; =0x00000644
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r1, _021FA4A8 ; =0x00000644
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FA0E4
	add r0, r5, #0
	bl ov15_021FA170
_021FA3C4:
	mov r1, #0
	add r0, sp, #8
	strb r1, [r0]
	add r0, r5, #0
	bl ov15_021FAC2C
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021FA440
	add r0, r5, #0
	add r1, r4, #0
	bl ov15_021FA104
	cmp r0, #0
	beq _021FA426
	cmp r4, #8
	bhs _021FA408
	add r0, r5, #0
	add r1, r4, #0
	bl ov15_021FA68C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021FA426
	ldr r1, _021FA4A8 ; =0x00000644
	add r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	b _021FA426
_021FA408:
	ldr r1, _021FA4A8 ; =0x00000644
	add r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r0, _021FA4A8 ; =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FA426
	cmp r1, #0xd
	bgt _021FA426
	add r0, r5, #0
	bl ov15_021FA0E4
_021FA426:
	mov r0, #2
	str r0, [sp]
	mov r3, #1
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #8
	str r3, [sp, #4]
	bl ov15_021FA73C
	cmp r0, #1
	beq _021FA4DA
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA440:
	ldr r0, _021FA4A4 ; =gSystem
	mov r3, #1
	ldr r1, [r0, #0x48]
	add r0, r1, #0
	tst r0, r3
	beq _021FA47E
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r1, _021FA4A8 ; =0x00000644
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r2, sp, #8
	bl ov15_021FA73C
	add r4, r0, #0
	ldr r0, _021FA4A8 ; =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FA474
	cmp r1, #0xd
	bgt _021FA474
	add r0, r5, #0
	bl ov15_021FA0E4
_021FA474:
	cmp r4, #1
	beq _021FA4DA
	add sp, #0x10
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_021FA47E:
	mov r0, #2
	tst r1, r0
	beq _021FA4DA
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #0x10
	add r2, sp, #8
	bl ov15_021FA73C
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov15_021FD774
	ldr r0, _021FA4A8 ; =0x00000644
	b _021FA4C0
	nop
_021FA4A4: .word gSystem
_021FA4A8: .word 0x00000644
_021FA4AC: .word ov15_02200640
_021FA4B0: .word ov15_02200641
_021FA4B4: .word ov15_02200642
_021FA4B8: .word ov15_02200643
_021FA4BC: .word 0x000005DC
_021FA4C0:
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FA4D0
	cmp r1, #0xd
	bgt _021FA4D0
	add r0, r5, #0
	bl ov15_021FA0E4
_021FA4D0:
	cmp r4, #1
	beq _021FA4DA
	add sp, #0x10
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_021FA4DA:
	add r0, sp, #8
	ldrb r0, [r0]
	cmp r0, #1
	bne _021FA4F2
	add r0, r5, #0
	mov r1, #0x14
	mov r2, #0x29
	mov r3, #0x1b
	bl ov15_021FD810
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FA4F2:
	mov r0, #1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov15_021FA1BC

	thumb_func_start ov15_021FA4F8
ov15_021FA4F8: ; 0x021FA4F8
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x8d
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r6, r1, #4
	add r1, #0x64
	ldrb r2, [r1]
	mov r1, #0xc
	add r7, r2, #0
	mul r7, r1
	mov r2, #0
	mov r1, #2
	add r3, r2, #0
	add r4, r6, r7
	bl ov15_021FD574
	ldr r2, _021FA574 ; =0x00000644
	mov r1, #6
	ldr r2, [r5, r2]
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	sub r2, #8
	bl ov15_021FF4EC
	ldr r1, _021FA574 ; =0x00000644
	add r0, r5, #0
	ldr r1, [r5, r1]
	sub r1, #8
	bl ov15_022002B4
	add r0, r5, #0
	bl ov15_021FB14C
	mov r0, #6
	ldrsh r3, [r4, r0]
	ldr r0, _021FA574 ; =0x00000644
	ldr r1, [r6, r7]
	ldr r2, [r5, r0]
	add r2, r3, r2
	sub r2, #8
	lsl r2, r2, #2
	ldrh r2, [r1, r2]
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r1, #0x66
	strh r2, [r1]
	mov r2, #6
	ldrsh r3, [r4, r2]
	ldr r2, [r5, r0]
	ldr r1, [r6, r7]
	add r2, r3, r2
	sub r2, #8
	lsl r2, r2, #2
	add r1, r1, r2
	ldrh r1, [r1, #2]
	add r0, #0x3e
	strh r1, [r5, r0]
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FA574: .word 0x00000644
	thumb_func_end ov15_021FA4F8

	thumb_func_start ov15_021FA578
ov15_021FA578: ; 0x021FA578
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r3, r0, #4
	add r0, #0x64
	ldrb r2, [r0]
	mov r0, #0xc
	mul r0, r2
	add r4, r3, r0
	cmp r1, #0
	ble _021FA5A8
	mov r0, #6
	ldrsh r0, [r4, r0]
	add r1, r0, #6
	ldrb r0, [r4, #9]
	cmp r1, r0
	bge _021FA5A2
	strh r1, [r4, #6]
	b _021FA5C2
_021FA5A2:
	mov r0, #0
	strh r0, [r4, #6]
	b _021FA5C2
_021FA5A8:
	mov r1, #6
	ldrsh r0, [r4, r1]
	sub r0, r0, #6
	bmi _021FA5B4
	strh r0, [r4, #6]
	b _021FA5C2
_021FA5B4:
	ldrb r0, [r4, #9]
	sub r0, r0, #1
	bl _s32_div_f
	mov r1, #6
	mul r1, r0
	strh r1, [r4, #6]
_021FA5C2:
	ldr r0, _021FA618 ; =0x00000671
	ldrb r0, [r5, r0]
	cmp r0, #1
	bne _021FA5E0
	add r0, r5, #0
	add r1, r4, #0
	bl ov15_021FAD80
	ldr r1, _021FA61C ; =0x0000066C
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFF34
	mov r0, #3
	pop {r3, r4, r5, pc}
_021FA5E0:
	add r0, r5, #0
	add r1, r4, #0
	bl ov15_021FA6F4
	add r0, r5, #0
	bl ov15_021FA170
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x65
	ldrb r0, [r0]
	cmp r0, #1
	beq _021FA60A
	cmp r0, #2
	beq _021FA606
	cmp r0, #3
	beq _021FA60E
	b _021FA612
_021FA606:
	mov r0, #0x10
	pop {r3, r4, r5, pc}
_021FA60A:
	mov r0, #0xe
	pop {r3, r4, r5, pc}
_021FA60E:
	mov r0, #0x1a
	pop {r3, r4, r5, pc}
_021FA612:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021FA618: .word 0x00000671
_021FA61C: .word 0x0000066C
	thumb_func_end ov15_021FA578

	thumb_func_start ov15_021FA620
ov15_021FA620: ; 0x021FA620
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021FA648 ; =0x00000614
	ldrb r2, [r4, r0]
	mov r0, #0xa
	add r1, r2, #0
	mul r1, r0
	mov r0, #0x5a
	sub r0, r0, r1
	add r1, r2, #1
	bl _s32_div_f
	add r1, r0, #6
	ldr r0, _021FA64C ; =0x00000617
	strb r1, [r4, r0]
	ldrb r1, [r4, r0]
	add r0, r0, #1
	add r1, r1, #4
	strb r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_021FA648: .word 0x00000614
_021FA64C: .word 0x00000617
	thumb_func_end ov15_021FA620

	thumb_func_start ov15_021FA650
ov15_021FA650: ; 0x021FA650
	push {r4, lr}
	ldr r1, _021FA680 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #2
	lsl r1, r1, #0xc
	tst r1, r2
	beq _021FA67C
	ldr r3, _021FA684 ; =_02201480
	ldr r1, [r3]
	add r4, r1, #1
	ldr r1, _021FA688 ; =_02201300
	str r4, [r3]
	ldr r2, [r1]
	cmp r4, r2
	blt _021FA672
	mov r1, #0
	str r1, [r3]
_021FA672:
	ldr r3, _021FA684 ; =_02201480
	mov r1, #1
	ldr r3, [r3]
	bl ov15_021FD574
_021FA67C:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021FA680: .word gSystem
_021FA684: .word _02201480
_021FA688: .word _02201300
	thumb_func_end ov15_021FA650

	thumb_func_start ov15_021FA68C
ov15_021FA68C: ; 0x021FA68C
	push {r4, r5}
	mov r2, #0x8d
	lsl r2, r2, #2
	ldr r5, [r0, r2]
	mov r3, #0
	add r2, r5, #0
	add r4, r3, #0
_021FA69A:
	ldrb r0, [r2, #0xc]
	cmp r1, r0
	bne _021FA6AE
	add r0, r5, r4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _021FA6AE
	add r0, r3, #0
	pop {r4, r5}
	bx lr
_021FA6AE:
	add r3, r3, #1
	add r2, #0xc
	add r4, #0xc
	cmp r3, #8
	blt _021FA69A
	mov r0, #0
	mvn r0, r0
	pop {r4, r5}
	bx lr
	thumb_func_end ov15_021FA68C

	thumb_func_start ov15_021FA6C0
ov15_021FA6C0: ; 0x021FA6C0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	mov r4, #0
_021FA6CA:
	add r5, r5, r6
	bpl _021FA6D2
	mov r5, #7
	b _021FA6D8
_021FA6D2:
	cmp r5, #8
	bne _021FA6D8
	mov r5, #0
_021FA6D8:
	add r0, r7, #0
	add r1, r5, #0
	bl ov15_021FA68C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021FA6EE
	add r4, r4, #1
	cmp r4, #8
	blt _021FA6CA
_021FA6EE:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov15_021FA6C0

	thumb_func_start ov15_021FA6F4
ov15_021FA6F4: ; 0x021FA6F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov15_021FA074
	mov r1, #0
	add r2, r0, #0
	add r0, r5, #0
	add r3, r1, #0
	bl ov15_021FD574
	mov r2, #6
	ldrsh r1, [r4, r2]
	add r0, r5, #0
	sub r2, r2, #7
	mov r3, #0
	bl ov15_021FF364
	mov r2, #6
	ldrb r1, [r4, #9]
	ldrsh r2, [r4, r2]
	add r0, r5, #0
	mov r3, #0
	bl ov15_021FF6BC
	add r0, r5, #0
	bl ov15_021FA074
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #1
	bl ov15_02200140
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov15_021FA6F4

	thumb_func_start ov15_021FA73C
ov15_021FA73C: ; 0x021FA73C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r7, r2, #0
	mov r6, #1
	cmp r1, #0x10
	bls _021FA74A
	b _021FA92A
_021FA74A:
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021FA756: ; jump table
	.short _021FA778 - _021FA756 - 2 ; case 0
	.short _021FA778 - _021FA756 - 2 ; case 1
	.short _021FA778 - _021FA756 - 2 ; case 2
	.short _021FA778 - _021FA756 - 2 ; case 3
	.short _021FA778 - _021FA756 - 2 ; case 4
	.short _021FA778 - _021FA756 - 2 ; case 5
	.short _021FA778 - _021FA756 - 2 ; case 6
	.short _021FA778 - _021FA756 - 2 ; case 7
	.short _021FA856 - _021FA756 - 2 ; case 8
	.short _021FA856 - _021FA756 - 2 ; case 9
	.short _021FA856 - _021FA756 - 2 ; case 10
	.short _021FA856 - _021FA756 - 2 ; case 11
	.short _021FA856 - _021FA756 - 2 ; case 12
	.short _021FA856 - _021FA756 - 2 ; case 13
	.short _021FA8C4 - _021FA756 - 2 ; case 14
	.short _021FA892 - _021FA756 - 2 ; case 15
	.short _021FA8F6 - _021FA756 - 2 ; case 16
_021FA778:
	bl ov15_021FA68C
	sub r1, r6, #2
	cmp r0, r1
	bne _021FA786
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_021FA786:
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	add r1, r2, #0
	add r1, #0x64
	ldrb r1, [r1]
	cmp r0, r1
	bne _021FA7A0
	ldr r1, [sp, #0x1c]
	cmp r1, #0
	bne _021FA7A0
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_021FA7A0:
	add r2, #0x64
	strb r0, [r2]
	add r0, r4, #0
	bl ov15_021F9F08
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r2, r0, #4
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r5, r2, r0
	add r0, r4, #0
	bl ov15_021FA074
	mov r1, #0
	add r2, r0, #0
	add r0, r4, #0
	add r3, r1, #0
	bl ov15_021FD574
	mov r2, #6
	ldrsh r1, [r5, r2]
	add r0, r4, #0
	sub r2, r2, #7
	mov r3, #0
	bl ov15_021FF364
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	add r1, #0x64
	ldrb r1, [r1]
	bl ov15_02200030
	mov r2, #6
	ldrb r1, [r5, #9]
	ldrsh r2, [r5, r2]
	add r0, r4, #0
	mov r3, #0
	bl ov15_021FF6BC
	add r0, r4, #0
	bl ov15_021FA074
	add r2, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r3, #1
	bl ov15_02200140
	mov r2, #0x8d
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	add r0, r4, #0
	add r2, #0x64
	ldrb r2, [r2]
	mov r1, #1
	bl ov15_021FD404
	ldr r0, _021FA930 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov15_021FA170
	ldr r0, _021FA934 ; =0x00000644
	ldr r1, [r4, r0]
	cmp r1, #8
	blt _021FA838
	add r0, r4, #0
	bl ov15_021FA0E4
_021FA838:
	add r0, r4, #0
	bl ov15_021FDF88
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	ldr r0, _021FA938 ; =0x00000808
	add r1, #0x64
	ldrb r1, [r1]
	add r0, r4, r0
	mov r2, #7
	add r1, r1, #1
	bl ov15_021FDAF4
	b _021FA92A
_021FA856:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	sub r1, #8
	add r3, r2, #0
	add r3, #0x64
	ldrb r5, [r3]
	mov r3, #0xc
	add r0, r2, #4
	mul r3, r5
	add r3, r0, r3
	mov r0, #6
	ldrsh r0, [r3, r0]
	add r0, r0, r1
	ldrb r1, [r3, #9]
	cmp r0, r1
	bge _021FA88A
	ldr r1, [r3]
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	add r2, #0x66
	strh r0, [r2]
	ldr r0, _021FA930 ; =0x000005DC
	strb r6, [r7]
	bl PlaySE
_021FA88A:
	add r0, r4, #0
	bl ov15_021FA170
	b _021FA92A
_021FA892:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	add r0, r2, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r0, r2, r0
	ldrb r0, [r0, #0xd]
	cmp r0, #6
	bls _021FA92A
	ldr r0, _021FA930 ; =0x000005DC
	bl PlaySE
	mov r0, #0x1e
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #9
	mov r3, #8
	bl ov15_021FD7D0
	add r6, r0, #0
	b _021FA92A
_021FA8C4:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	add r0, r2, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r0, r2, r0
	ldrb r0, [r0, #0xd]
	cmp r0, #6
	bls _021FA92A
	ldr r0, _021FA930 ; =0x000005DC
	bl PlaySE
	mov r0, #0x1f
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x11
	mov r2, #9
	mov r3, #8
	bl ov15_021FD7D0
	add r6, r0, #0
	b _021FA92A
_021FA8F6:
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	mov r3, #0
	add r2, #0x66
	strh r3, [r2]
	ldr r1, [r4, r1]
	mov r2, #5
	add r1, #0x68
	strh r2, [r1]
	ldr r1, [sp, #0x1c]
	bl ov15_021FD774
	mov r0, #SEQ_SE_GS_GEARCANCEL>>6
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0x24
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #9
	mov r3, #8
	bl ov15_021FD7D0
	add r6, r0, #0
_021FA92A:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FA930: .word 0x000005DC
_021FA934: .word 0x00000644
_021FA938: .word 0x00000808
	thumb_func_end ov15_021FA73C

	thumb_func_start ov15_021FA93C
ov15_021FA93C: ; 0x021FA93C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021FAA10 ; =0x00000619
	add r4, r5, r0
	bl System_GetTouchHeld
	cmp r0, #0
	bne _021FA958
	ldrb r1, [r4, #7]
	mov r0, #0x70
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strb r0, [r4, #7]
_021FA958:
	add r0, r5, #0
	bl ov15_021FAC40
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021FA96E
	ldrb r0, [r4]
	cmp r6, r0
	beq _021FA97A
_021FA96E:
	ldrb r1, [r4, #7]
	mov r0, #0xf
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r4, #7]
_021FA97A:
	add r0, r5, #0
	bl ov15_021FAA18
	cmp r0, #0
	bne _021FA9FE
	ldrb r0, [r4, #7]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1d
	cmp r0, #1
	bne _021FA9FE
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021FA9FE
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r1, [r4]
	add r0, #0x64
	strb r1, [r0]
	lsl r0, r6, #0x18
	ldrb r1, [r4]
	lsr r0, r0, #0x18
	cmp r1, r0
	bls _021FA9B4
	mov r0, #0
	strb r0, [r4, #1]
	strb r0, [r4, #2]
	b _021FA9C6
_021FA9B4:
	cmp r1, r0
	bhs _021FA9C2
	mov r0, #1
	strb r0, [r4, #1]
	mov r0, #0
	strb r0, [r4, #2]
	b _021FA9C6
_021FA9C2:
	mov r0, #2
	strb r0, [r4, #1]
_021FA9C6:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	strb r0, [r4]
	ldrb r2, [r4, #7]
	mov r1, #0xf
	bic r2, r1
	strb r2, [r4, #7]
	ldrb r2, [r4, #7]
	mov r1, #0x70
	bic r2, r1
	strb r2, [r4, #7]
	mov r1, #0
	strb r1, [r4, #4]
	mov r1, #0x67
	lsl r1, r1, #4
	strb r0, [r5, r1]
	add r0, r5, #0
	bl ov15_021FF950
	mov r1, #0x67
	lsl r1, r1, #4
	ldrb r1, [r5, r1]
	ldr r0, _021FAA14 ; =0x00000808
	mov r2, #7
	add r0, r5, r0
	add r1, r1, #1
	bl ov15_021FDAF4
_021FA9FE:
	add r0, r5, #0
	bl ov15_021FAB34
	add r0, r5, #0
	bl ov15_021FF964
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_021FAA10: .word 0x00000619
_021FAA14: .word 0x00000808
	thumb_func_end ov15_021FA93C

	thumb_func_start ov15_021FAA18
ov15_021FAA18: ; 0x021FAA18
	push {r3, r4, r5, lr}
	ldr r1, _021FAB28 ; =gSystem
	add r5, r0, #0
	ldr r0, _021FAB2C ; =0x00000619
	ldr r2, [r1, #0x48]
	mov r1, #0x20
	add r4, r5, r0
	tst r1, r2
	beq _021FAAA6
	sub r1, r0, #5
	ldrb r1, [r5, r1]
	cmp r1, #1
	bne _021FAA36
	mov r0, #1
	pop {r3, r4, r5, pc}
_021FAA36:
	sub r0, #0x3d
	bl PlaySE
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r1, [r4]
	add r0, #0x64
	strb r1, [r0]
	ldrb r0, [r4]
	cmp r0, #0
	beq _021FAA5C
	sub r0, r0, #1
	strb r0, [r4]
	mov r0, #0x67
	lsl r0, r0, #4
	ldrb r1, [r5, r0]
	sub r1, r1, #1
	b _021FAA6A
_021FAA5C:
	ldr r0, _021FAB30 ; =0x00000614
	ldrb r1, [r5, r0]
	sub r1, r1, #1
	strb r1, [r4]
	ldrb r1, [r5, r0]
	add r0, #0x5c
	sub r1, r1, #1
_021FAA6A:
	strb r1, [r5, r0]
	mov r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #1]
	ldrb r1, [r4, #7]
	mov r0, #0x70
	bic r1, r0
	mov r0, #0x10
	orr r0, r1
	strb r0, [r4, #7]
	ldrb r1, [r4, #7]
	mov r0, #0xf
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r4, #7]
	ldrb r1, [r4, #7]
	mov r0, #0x80
	bic r1, r0
	strb r1, [r4, #7]
	ldrb r0, [r4, #4]
	cmp r0, #3
	beq _021FAA9C
	mov r0, #4
	strb r0, [r4, #4]
_021FAA9C:
	add r0, r5, #0
	bl ov15_021FF950
	mov r0, #1
	pop {r3, r4, r5, pc}
_021FAAA6:
	mov r1, #0x10
	tst r1, r2
	beq _021FAB24
	sub r1, r0, #5
	ldrb r1, [r5, r1]
	cmp r1, #1
	bne _021FAAB8
	mov r0, #1
	pop {r3, r4, r5, pc}
_021FAAB8:
	sub r0, #0x3d
	bl PlaySE
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r1, [r4]
	add r0, #0x64
	strb r1, [r0]
	ldrb r0, [r4]
	ldr r1, _021FAB30 ; =0x00000614
	add r2, r0, #1
	ldrb r0, [r5, r1]
	cmp r2, r0
	bge _021FAAE2
	add r0, r1, #0
	strb r2, [r4]
	add r0, #0x5c
	ldrb r0, [r5, r0]
	add r0, r0, #1
	b _021FAAE6
_021FAAE2:
	mov r0, #0
	strb r0, [r4]
_021FAAE6:
	add r1, #0x5c
	strb r0, [r5, r1]
	mov r0, #0
	strb r0, [r4, #2]
	mov r0, #1
	strb r0, [r4, #1]
	ldrb r2, [r4, #7]
	mov r1, #0x70
	bic r2, r1
	mov r1, #0x10
	orr r1, r2
	strb r1, [r4, #7]
	ldrb r2, [r4, #7]
	mov r1, #0xf
	bic r2, r1
	orr r0, r2
	strb r0, [r4, #7]
	ldrb r1, [r4, #7]
	mov r0, #0x80
	bic r1, r0
	strb r1, [r4, #7]
	ldrb r0, [r4, #4]
	cmp r0, #3
	beq _021FAB1A
	mov r0, #4
	strb r0, [r4, #4]
_021FAB1A:
	add r0, r5, #0
	bl ov15_021FF950
	mov r0, #1
	pop {r3, r4, r5, pc}
_021FAB24:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FAB28: .word gSystem
_021FAB2C: .word 0x00000619
_021FAB30: .word 0x00000614
	thumb_func_end ov15_021FAA18

	thumb_func_start ov15_021FAB34
ov15_021FAB34: ; 0x021FAB34
	push {r3, r4, r5, lr}
	ldr r1, _021FAC28 ; =0x00000619
	add r5, r0, #0
	add r4, r5, r1
	ldrb r1, [r4, #2]
	cmp r1, #0
	beq _021FAB4C
	cmp r1, #1
	beq _021FAB58
	cmp r1, #2
	beq _021FAC20
	b _021FAC24
_021FAB4C:
	mov r0, #0
	strb r0, [r4, #3]
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	b _021FAC24
_021FAB58:
	ldrb r1, [r4, #3]
	cmp r1, #8
	bhs _021FAB64
	add r0, r1, #1
	strb r0, [r4, #3]
	b _021FAC24
_021FAB64:
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldrb r2, [r4]
	add r1, #0x64
	strb r2, [r1]
	bl ov15_021F9F08
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	add r0, r5, #0
	add r2, r1, #0
	add r2, #0x64
	ldrb r3, [r2]
	mov r2, #0xc
	mul r2, r3
	add r1, r1, r2
	mov r2, #0xa
	ldrsh r1, [r1, r2]
	sub r2, #0xb
	mov r3, #0
	bl ov15_021FF364
	add r0, r5, #0
	bl ov15_021FA074
	mov r1, #0
	add r2, r0, #0
	add r0, r5, #0
	add r3, r1, #0
	bl ov15_021FD574
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r1, #0x64
	ldrb r1, [r1]
	bl ov15_02200030
	mov r2, #0x8d
	lsl r2, r2, #2
	ldr r2, [r5, r2]
	add r0, r5, #0
	add r2, #0x64
	ldrb r2, [r2]
	mov r1, #1
	bl ov15_021FD404
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r3, [r5, r0]
	add r0, r3, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	add r0, r3, #0
	add r1, r3, #0
	add r0, #0xa
	add r1, #8
	add r0, r0, r2
	add r1, r1, r2
	add r2, r3, r2
	ldrb r2, [r2, #0xd]
	bl ov15_021FA044
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r3, [r5, r0]
	add r0, r3, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	add r0, r3, #0
	add r1, r3, #0
	add r0, #0xa
	add r1, #8
	add r0, r0, r2
	add r1, r1, r2
	add r2, r3, r2
	ldrb r2, [r2, #0xd]
	mov r3, #6
	bl ov15_021FA070
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021FAC20:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021FAC24:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FAC28: .word 0x00000619
	thumb_func_end ov15_021FAB34

	thumb_func_start ov15_021FAC2C
ov15_021FAC2C: ; 0x021FAC2C
	ldr r0, _021FAC38 ; =ov15_02201314
	lsl r1, r1, #2
	ldr r3, _021FAC3C ; =sub_02025224
	ldr r0, [r0, r1]
	bx r3
	nop
_021FAC38: .word ov15_02201314
_021FAC3C: .word sub_02025224
	thumb_func_end ov15_021FAC2C

	thumb_func_start ov15_021FAC40
ov15_021FAC40: ; 0x021FAC40
	mov r0, #0
	mvn r0, r0
	bx lr
	.balign 4, 0
	thumb_func_end ov15_021FAC40

	thumb_func_start ov15_021FAC48
ov15_021FAC48: ; 0x021FAC48
	push {r3, r4, r5, lr}
	mov r1, #0x8d
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r3, r1, #4
	add r1, #0x64
	ldrb r2, [r1]
	mov r1, #0xc
	mul r1, r2
	add r3, r3, r1
	ldr r1, _021FAD20 ; =0x00000671
	mov r2, #1
	strb r2, [r5, r1]
	mov r2, #6
	ldrsh r3, [r3, r2]
	add r2, r1, #0
	sub r2, #0x2d
	ldr r2, [r5, r2]
	add r1, r1, #1
	add r2, r3, r2
	sub r2, #8
	strb r2, [r5, r1]
	bl ov15_021FED60
	add r0, r5, #0
	bl ov15_021FB114
	add r0, r5, #0
	bl ov15_02200294
	add r0, r5, #0
	bl ov15_021FF560
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov15_021FF7AC
	add r0, r5, #0
	bl ov15_021FED58
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r0, #4
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r4, r2, r0
	add r0, r5, #0
	bl ov15_021FA074
	ldr r3, _021FAD24 ; =0x00000644
	add r2, r0, #0
	ldr r3, [r5, r3]
	add r0, r5, #0
	mov r1, #1
	sub r3, #8
	bl ov15_021FD574
	ldr r2, _021FAD24 ; =0x00000644
	mov r1, #6
	ldr r2, [r5, r2]
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	sub r2, #8
	mov r3, #1
	bl ov15_021FF364
	mov r2, #6
	ldrb r1, [r4, #9]
	ldrsh r2, [r4, r2]
	add r0, r5, #0
	mov r3, #0
	bl ov15_021FF6BC
	add r0, r5, #0
	bl ov15_021FA074
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl ov15_02200140
	mov r2, #6
	ldrsh r3, [r4, r2]
	ldr r2, _021FAD24 ; =0x00000644
	add r0, r5, #0
	ldr r2, [r5, r2]
	add r1, r4, #0
	add r2, r3, r2
	sub r2, #8
	bl ov15_022001C4
	ldr r1, _021FAD24 ; =0x00000644
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r0, _021FAD24 ; =0x00000644
	ldr r1, [r5, r0]
	add r0, #0x28
	sub r1, #8
	str r1, [r5, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FAD20: .word 0x00000671
_021FAD24: .word 0x00000644
	thumb_func_end ov15_021FAC48

	thumb_func_start ov15_021FAD28
ov15_021FAD28: ; 0x021FAD28
	ldr r1, _021FAD6C ; =gSystem
	mov r2, #0x40
	ldr r1, [r1, #0x48]
	tst r2, r1
	beq _021FAD3C
	lsl r1, r0, #2
	ldr r0, _021FAD70 ; =ov15_02200584
	ldrb r0, [r0, r1]
	sub r0, #8
	bx lr
_021FAD3C:
	mov r2, #0x80
	tst r2, r1
	beq _021FAD4C
	lsl r1, r0, #2
	ldr r0, _021FAD74 ; =ov15_02200585
	ldrb r0, [r0, r1]
	sub r0, #8
	bx lr
_021FAD4C:
	mov r2, #0x20
	tst r2, r1
	beq _021FAD5C
	lsl r1, r0, #2
	ldr r0, _021FAD78 ; =ov15_02200586
	ldrb r0, [r0, r1]
	sub r0, #8
	bx lr
_021FAD5C:
	mov r2, #0x10
	tst r1, r2
	beq _021FAD6A
	lsl r1, r0, #2
	ldr r0, _021FAD7C ; =ov15_02200587
	ldrb r0, [r0, r1]
	sub r0, #8
_021FAD6A:
	bx lr
	.balign 4, 0
_021FAD6C: .word gSystem
_021FAD70: .word ov15_02200584
_021FAD74: .word ov15_02200585
_021FAD78: .word ov15_02200586
_021FAD7C: .word ov15_02200587
	thumb_func_end ov15_021FAD28

	thumb_func_start ov15_021FAD80
ov15_021FAD80: ; 0x021FAD80
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov15_021FA074
	add r6, r0, #0
	add r0, r5, #0
	bl ov15_021FA098
	add r3, r0, #0
	add r0, r5, #0
	mov r1, #1
	add r2, r6, #0
	bl ov15_021FD574
	add r0, r5, #0
	bl ov15_021FA098
	mov r1, #6
	add r2, r0, #0
	ldrsh r1, [r4, r1]
	add r0, r5, #0
	mov r3, #1
	bl ov15_021FF364
	ldr r2, _021FADE4 ; =0x00000672
	add r0, r5, #0
	ldrb r2, [r5, r2]
	add r1, r4, #0
	bl ov15_022001C4
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r3, [r5, r0]
	add r0, r3, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	add r3, r3, r2
	mov r2, #0xa
	ldrb r1, [r3, #0xd]
	ldrsh r2, [r3, r2]
	add r0, r5, #0
	mov r3, #0
	bl ov15_021FF6BC
	pop {r4, r5, r6, pc}
	nop
_021FADE4: .word 0x00000672
	thumb_func_end ov15_021FAD80

	thumb_func_start ov15_021FADE8
ov15_021FADE8: ; 0x021FADE8
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r1, #0
	add r6, r0, #0
	mvn r4, r4
	cmp r5, #8
	bhi _021FAE3A
	add r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021FAE02: ; jump table
	.short _021FAE14 - _021FAE02 - 2 ; case 0
	.short _021FAE14 - _021FAE02 - 2 ; case 1
	.short _021FAE14 - _021FAE02 - 2 ; case 2
	.short _021FAE14 - _021FAE02 - 2 ; case 3
	.short _021FAE14 - _021FAE02 - 2 ; case 4
	.short _021FAE14 - _021FAE02 - 2 ; case 5
	.short _021FAE30 - _021FAE02 - 2 ; case 6
	.short _021FAE34 - _021FAE02 - 2 ; case 7
	.short _021FAE38 - _021FAE02 - 2 ; case 8
_021FAE14:
	bl ov15_021FA074
	cmp r0, r5
	ble _021FAE28
	ldr r0, _021FAE40 ; =0x0000066C
	ldr r4, [r6, r0]
	sub r0, #0x90
	bl PlaySE
	b _021FAE3A
_021FAE28:
	ldr r0, _021FAE44 ; =0x000005F3
	bl PlaySE
	b _021FAE3A
_021FAE30:
	mov r4, #0xe
	b _021FAE3A
_021FAE34:
	mov r4, #0xf
	b _021FAE3A
_021FAE38:
	sub r4, r4, #1
_021FAE3A:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_021FAE40: .word 0x0000066C
_021FAE44: .word 0x000005F3
	thumb_func_end ov15_021FADE8

	thumb_func_start ov15_021FAE48
ov15_021FAE48: ; 0x021FAE48
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r4, #0
	add r2, r0, #4
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mvn r4, r4
	mul r0, r1
	add r7, r2, r0
	ldr r0, _021FAFE4 ; =0x0000066C
	ldr r0, [r5, r0]
	bl ov15_021FAD28
	lsl r0, r0, #0x10
	ldr r2, _021FAFE4 ; =0x0000066C
	lsr r1, r0, #0x10
	ldr r0, [r5, r2]
	cmp r0, r1
	beq _021FAE9C
	ldr r0, _021FAFE8 ; =0x0000FFFA
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bhi _021FAE8C
	add r0, r5, #0
	bl ov15_021FADE8
	add r4, r0, #0
	b _021FAE9C
_021FAE8C:
	str r1, [r5, r2]
	ldr r1, [r5, r2]
	add r0, r5, #0
	bl ov15_021FFF34
	ldr r0, _021FAFEC ; =0x000005DC
	bl PlaySE
_021FAE9C:
	add r0, r5, #0
	mov r1, #2
	bl ov15_021FAC2C
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021FAF04
	cmp r6, #8
	bne _021FAEC6
	add r0, r5, #0
	add r1, r6, #0
	bl ov15_021FADE8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov15_021FFF34
	b _021FAF24
_021FAEC6:
	sub r0, r6, #6
	cmp r0, #1
	bhi _021FAED8
	add r0, r5, #0
	add r1, r6, #0
	bl ov15_021FADE8
	add r4, r0, #0
	b _021FAF24
_021FAED8:
	ldr r0, _021FAFE4 ; =0x0000066C
	str r6, [r5, r0]
	add r0, r5, #0
	bl ov15_021FA074
	cmp r0, r6
	bls _021FAEF2
	add r0, r5, #0
	add r1, r6, #0
	bl ov15_021FADE8
	add r4, r0, #0
	b _021FAEF8
_021FAEF2:
	ldr r0, _021FAFF0 ; =0x000005F3
	bl PlaySE
_021FAEF8:
	ldr r1, _021FAFE4 ; =0x0000066C
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFF34
	b _021FAF24
_021FAF04:
	ldr r0, _021FAFF4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _021FAF1C
	ldr r1, _021FAFE4 ; =0x0000066C
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FADE8
	add r4, r0, #0
	b _021FAF24
_021FAF1C:
	mov r0, #2
	tst r1, r0
	beq _021FAF24
	sub r4, r0, #4
_021FAF24:
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	bhi _021FAF3E
	bhs _021FAF46
	cmp r4, #0xf
	bhi _021FAFAC
	cmp r4, #0xe
	blo _021FAFAC
	beq _021FAF70
	cmp r4, #0xf
	beq _021FAF8E
	b _021FAFAC
_021FAF3E:
	add r0, r0, #1
	cmp r4, r0
	beq _021FAFE0
	b _021FAFAC
_021FAF46:
	mov r0, #SEQ_SE_GS_GEARCANCEL>>6
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _021FAFF8 ; =0x00000672
	mov r1, #6
	ldrb r0, [r5, r0]
	bl _s32_div_f
	mov r1, #6
	mul r1, r0
	strh r1, [r7, #6]
	mov r0, #0x20
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #9
	mov r3, #8
	bl ov15_021FD7D0
	pop {r3, r4, r5, r6, r7, pc}
_021FAF70:
	ldrb r0, [r7, #9]
	cmp r0, #6
	bls _021FAFE0
	ldr r0, _021FAFEC ; =0x000005DC
	bl PlaySE
	mov r0, #0x1f
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x11
	mov r2, #9
	mov r3, #8
	bl ov15_021FD7D0
	pop {r3, r4, r5, r6, r7, pc}
_021FAF8E:
	ldrb r0, [r7, #9]
	cmp r0, #6
	bls _021FAFE0
	ldr r0, _021FAFEC ; =0x000005DC
	bl PlaySE
	mov r0, #0x1e
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #9
	mov r3, #8
	bl ov15_021FD7D0
	pop {r3, r4, r5, r6, r7, pc}
_021FAFAC:
	ldr r0, _021FAFEC ; =0x000005DC
	bl PlaySE
	ldr r1, _021FAFF8 ; =0x00000672
	mov r2, #6
	ldrb r0, [r5, r1]
	sub r1, r1, #6
	ldrsh r2, [r7, r2]
	ldr r1, [r5, r1]
	add r1, r2, r1
	cmp r0, r1
	bne _021FAFD2
	add r0, r5, #0
	mov r1, #0x14
	mov r2, #0x29
	mov r3, #0x21
	bl ov15_021FD810
	pop {r3, r4, r5, r6, r7, pc}
_021FAFD2:
	add r0, r5, #0
	mov r1, #0x14
	mov r2, #0x2a
	mov r3, #0x21
	bl ov15_021FD810
	pop {r3, r4, r5, r6, r7, pc}
_021FAFE0:
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FAFE4: .word 0x0000066C
_021FAFE8: .word 0x0000FFFA
_021FAFEC: .word 0x000005DC
_021FAFF0: .word 0x000005F3
_021FAFF4: .word gSystem
_021FAFF8: .word 0x00000672
	thumb_func_end ov15_021FAE48

	thumb_func_start ov15_021FAFFC
ov15_021FAFFC: ; 0x021FAFFC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x64
	ldrb r3, [r0]
	mov r0, #0xc
	add r1, r1, #4
	mul r0, r3
	add r5, r1, r0
	mov r0, #6
	ldr r1, _021FB05C ; =0x0000066C
	ldrsh r6, [r5, r0]
	ldr r2, [r4, r1]
	add r1, r1, #6
	add r2, r6, r2
	lsl r2, r2, #0x10
	ldrb r1, [r4, r1]
	lsr r2, r2, #0x10
	cmp r1, r2
	beq _021FB050
	str r0, [sp]
	ldr r0, [r5]
	bl MoveItemSlotInList
	add r0, r4, #0
	bl ov15_021F9F08
	ldr r1, _021FB05C ; =0x0000066C
	ldr r2, [r4, r1]
	add r0, r1, #0
	add r2, #8
	sub r0, #0x28
	str r2, [r4, r0]
	sub r1, #0x28
	ldr r1, [r4, r1]
	add r0, r4, #0
	bl ov15_021FA0E4
_021FB050:
	add r0, r4, #0
	bl ov15_021FB060
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021FB05C: .word 0x0000066C
	thumb_func_end ov15_021FAFFC

	thumb_func_start ov15_021FB060
ov15_021FB060: ; 0x021FB060
	push {r3, r4, r5, lr}
	mov r1, #0xd2
	add r5, r0, #0
	mov r3, #0
	lsl r1, r1, #2
	str r3, [r5, r1]
	ldr r1, _021FB10C ; =0x00000671
	strb r3, [r5, r1]
	add r2, r1, #1
	strb r3, [r5, r2]
	add r1, r1, #3
	str r3, [r5, r1]
	bl ov15_021FB114
	add r0, r5, #0
	bl ov15_021F9F08
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r0, #4
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r4, r2, r0
	add r0, r5, #0
	bl ov15_021FA074
	mov r1, #0
	add r2, r0, #0
	add r0, r5, #0
	add r3, r1, #0
	bl ov15_021FD574
	mov r2, #6
	ldrsh r1, [r4, r2]
	add r0, r5, #0
	sub r2, r2, #7
	mov r3, #0
	bl ov15_021FF364
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r1, #0x64
	ldrb r1, [r1]
	bl ov15_02200030
	mov r2, #0x8d
	lsl r2, r2, #2
	ldr r2, [r5, r2]
	add r0, r5, #0
	add r2, #0x64
	ldrb r2, [r2]
	mov r1, #1
	bl ov15_021FD404
	mov r2, #6
	ldrb r1, [r4, #9]
	ldrsh r2, [r4, r2]
	add r0, r5, #0
	mov r3, #0
	bl ov15_021FF6BC
	add r0, r5, #0
	bl ov15_021FA074
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #1
	bl ov15_02200140
	add r0, r5, #0
	bl ov15_021FED24
	ldr r1, _021FB110 ; =0x00000644
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021FB10C: .word 0x00000671
_021FB110: .word 0x00000644
	thumb_func_end ov15_021FB060

	thumb_func_start ov15_021FB114
ov15_021FB114: ; 0x021FB114
	push {r4, lr}
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	add r4, r2, #4
	add r2, #0x64
	ldrb r3, [r2]
	mov r2, #0xc
	mul r2, r3
	add r3, r4, r2
	ldr r2, _021FB148 ; =0x00000671
	ldrb r2, [r0, r2]
	cmp r2, #0
	beq _021FB146
	ldrh r2, [r3, #4]
	add r1, #0x1c
	ldr r0, [r0, r1]
	sub r2, r2, #1
	lsl r2, r2, #4
	add r2, #0x10
	lsl r2, r2, #0x10
	mov r1, #0xb1
	asr r2, r2, #0x10
	bl sub_0200DDB8
_021FB146:
	pop {r4, pc}
	.balign 4, 0
_021FB148: .word 0x00000671
	thumb_func_end ov15_021FB114

	thumb_func_start ov15_021FB14C
ov15_021FB14C: ; 0x021FB14C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _021FB370 ; =_022004EC
	add r4, r0, #0
	ldrb r2, [r1]
	add r0, sp, #0
	strb r2, [r0]
	ldrb r2, [r1, #1]
	strb r2, [r0, #1]
	ldrb r2, [r1, #2]
	strb r2, [r0, #2]
	ldrb r2, [r1, #3]
	ldrb r1, [r1, #4]
	strb r2, [r0, #3]
	strb r1, [r0, #4]
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x66
	ldrh r0, [r0]
	mov r2, #6
	bl LoadItemDataOrGfx
	add r7, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	add r3, r4, #0
	add r0, r2, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r0, r2, r0
	ldrb r5, [r0, #0xc]
	mov r2, #0
	mov r0, #0x7f
	add r1, r2, #0
	lsl r0, r0, #4
_021FB19C:
	add r2, r2, #1
	str r1, [r3, r0]
	add r3, r3, #4
	cmp r2, #5
	blt _021FB19C
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x65
	ldrb r0, [r0]
	cmp r0, #0
	beq _021FB1B8
	b _021FB2F8
_021FB1B8:
	add r0, r1, #0
	add r0, #0x76
	ldrh r0, [r0]
	lsl r0, r0, #0x10
	lsr r2, r0, #0x11
	ldr r0, _021FB374 ; =0x0000FFFE
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bhi _021FB1E8
	add r0, r1, #0
	add r0, #0x64
	ldrb r2, [r0]
	mov r0, #0xc
	mul r0, r2
	add r0, r1, r0
	ldrb r0, [r0, #0xc]
	cmp r0, #5
	bne _021FB280
	mov r1, #2
	add r0, sp, #0
	strb r1, [r0]
	b _021FB280
_021FB1E8:
	add r0, r7, #0
	mov r1, #6
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _021FB280
	mov r2, #0x8d
	lsl r2, r2, #2
	ldr r1, [r4, r2]
	sub r2, #0x72
	add r0, r1, #0
	add r0, #0x66
	ldrh r0, [r0]
	cmp r0, r2
	bne _021FB21C
	add r2, r1, #0
	add r2, #0x76
	ldrh r2, [r2]
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1f
	cmp r2, #1
	bne _021FB21C
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0]
	b _021FB280
_021FB21C:
	add r2, r1, #0
	add r2, #0x64
	ldrb r3, [r2]
	mov r2, #0xc
	mul r2, r3
	add r2, r1, r2
	ldrb r3, [r2, #0xc]
	cmp r3, #5
	bne _021FB236
	mov r1, #2
	add r0, sp, #0
	strb r1, [r0]
	b _021FB280
_021FB236:
	ldr r2, _021FB378 ; =0x000001C1
	cmp r0, r2
	bne _021FB244
	mov r1, #4
	add r0, sp, #0
	strb r1, [r0]
	b _021FB280
_021FB244:
	cmp r3, #4
	bne _021FB25A
	ldr r0, [r1, #0x70]
	bl Leftover_CanPlantBerry
	cmp r0, #1
	bne _021FB25A
	mov r1, #3
	add r0, sp, #0
	strb r1, [r0]
	b _021FB280
_021FB25A:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r0, #0x3e
	add r1, #0x66
	ldrh r1, [r1]
	cmp r1, r0
	bne _021FB27A
	bl SoundSys_GetGBSoundsState
	cmp r0, #1
	bne _021FB27A
	mov r1, #0xf
	add r0, sp, #0
	strb r1, [r0]
	b _021FB280
_021FB27A:
	mov r1, #0
	add r0, sp, #0
	strb r1, [r0]
_021FB280:
	add r0, r7, #0
	mov r1, #3
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _021FB2AE
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x66
	ldrh r0, [r0]
	bl ItemIdIsNotJohtoBall
	cmp r0, #1
	bne _021FB2A4
	mov r1, #8
	add r0, sp, #0
	strb r1, [r0, #2]
_021FB2A4:
	cmp r5, #3
	beq _021FB2AE
	mov r1, #5
	add r0, sp, #0
	strb r1, [r0, #1]
_021FB2AE:
	add r0, r7, #0
	mov r1, #4
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _021FB310
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Bag_GetRegisteredItemSlot1
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	add r2, #0x66
	ldrh r2, [r2]
	cmp r2, r0
	beq _021FB2E8
	add r0, r1, #4
	ldr r0, [r4, r0]
	bl Bag_GetRegisteredItemSlot2
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r1, #0x66
	ldrh r1, [r1]
	cmp r1, r0
	bne _021FB2F0
_021FB2E8:
	mov r1, #7
	add r0, sp, #0
	strb r1, [r0, #1]
	b _021FB310
_021FB2F0:
	mov r1, #6
	add r0, sp, #0
	strb r1, [r0, #1]
	b _021FB310
_021FB2F8:
	cmp r0, #6
	bne _021FB310
	add r1, #0x66
	ldrh r1, [r1]
	add r0, r5, #0
	bl ov15_021FD3F0
	cmp r0, #1
	bne _021FB310
	mov r1, #0xe
	add r0, sp, #0
	strb r1, [r0]
_021FB310:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x65
	ldrb r0, [r0]
	cmp r0, #6
	beq _021FB32C
	cmp r5, #3
	beq _021FB32C
	cmp r5, #4
	beq _021FB32C
	mov r1, #0xc
	add r0, sp, #0
	strb r1, [r0, #3]
_021FB32C:
	mov r3, #0x7f
	mov r1, #0xb
	add r0, sp, #0
	strb r1, [r0, #4]
	ldr r6, _021FB37C ; =ov15_02201368
	mov r2, #0
	add r0, sp, #0
	add r1, r4, #0
	lsl r3, r3, #4
_021FB33E:
	ldrb r5, [r0]
	cmp r5, #0xff
	beq _021FB34A
	lsl r5, r5, #2
	ldr r5, [r6, r5]
	str r5, [r1, r3]
_021FB34A:
	add r2, r2, #1
	add r0, r0, #1
	add r1, r1, #4
	cmp r2, #5
	blt _021FB33E
	add r0, r4, #0
	add r1, sp, #0
	mov r2, #5
	bl ov15_021FEB84
	add r0, r4, #0
	add r1, sp, #0
	bl ov15_021FB380
	add r0, r7, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FB370: .word _022004EC
_021FB374: .word 0x0000FFFE
_021FB378: .word 0x000001C1
_021FB37C: .word ov15_02201368
	thumb_func_end ov15_021FB14C

	thumb_func_start ov15_021FB380
ov15_021FB380: ; 0x021FB380
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _021FB3E8 ; =0x0000066C
	add r5, r0, #0
	mov r2, #0
	str r2, [r5, r1]
	ldr r2, [r5, r1]
	ldr r1, _021FB3EC ; =ov15_02201468
	ldrb r1, [r1, r2]
	bl ov15_021FFECC
	add r0, r5, #0
	add r1, r4, #0
	bl ov15_0220023C
	mov r0, #0x61
	mov r1, #3
	lsl r0, r0, #2
	lsl r1, r1, #8
	ldrb r2, [r4]
	add r0, r5, r0
	add r1, r5, r1
	bl ov15_021FF758
	mov r0, #0x65
	mov r1, #3
	lsl r0, r0, #2
	lsl r1, r1, #8
	ldrb r2, [r4, #1]
	add r0, r5, r0
	add r1, r5, r1
	bl ov15_021FF758
	mov r0, #0x69
	mov r1, #3
	lsl r0, r0, #2
	lsl r1, r1, #8
	ldrb r2, [r4, #2]
	add r0, r5, r0
	add r1, r5, r1
	bl ov15_021FF758
	mov r0, #0x6d
	mov r1, #3
	lsl r0, r0, #2
	lsl r1, r1, #8
	ldrb r2, [r4, #3]
	add r0, r5, r0
	add r1, r5, r1
	bl ov15_021FF758
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FB3E8: .word 0x0000066C
_021FB3EC: .word ov15_02201468
	thumb_func_end ov15_021FB380

	thumb_func_start ov15_021FB3F0
ov15_021FB3F0: ; 0x021FB3F0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _021FB4F8 ; =0x0000066C
	mov r2, #0x40
	ldr r1, [r5, r0]
	ldr r0, _021FB4FC ; =gSystem
	add r4, r1, #0
	ldr r0, [r0, #0x48]
	tst r2, r0
	beq _021FB40C
	ldr r0, _021FB500 ; =ov15_02200528
	lsl r2, r1, #2
	ldrb r4, [r0, r2]
	b _021FB434
_021FB40C:
	mov r2, #0x80
	tst r2, r0
	beq _021FB41A
	ldr r0, _021FB504 ; =ov15_02200529
	lsl r2, r1, #2
	ldrb r4, [r0, r2]
	b _021FB434
_021FB41A:
	mov r2, #0x20
	tst r2, r0
	beq _021FB428
	ldr r0, _021FB508 ; =ov15_0220052A
	lsl r2, r1, #2
	ldrb r4, [r0, r2]
	b _021FB434
_021FB428:
	mov r2, #0x10
	tst r0, r2
	beq _021FB434
	ldr r0, _021FB50C ; =ov15_0220052B
	lsl r2, r1, #2
	ldrb r4, [r0, r2]
_021FB434:
	cmp r4, r1
	beq _021FB452
	ldr r0, _021FB4F8 ; =0x0000066C
	ldr r1, _021FB510 ; =ov15_02201468
	str r4, [r5, r0]
	ldrb r1, [r1, r4]
	add r0, r5, #0
	bl ov15_021FFECC
	ldr r0, _021FB514 ; =0x000005DC
	bl PlaySE
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021FB452:
	add r0, r5, #0
	mov r1, #1
	bl ov15_021FAC2C
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _021FB4A4
	add r0, r5, #0
	mov r1, #1
	bl ov15_021FD774
	ldr r0, _021FB4F8 ; =0x0000066C
	ldr r1, _021FB510 ; =ov15_02201468
	str r6, [r5, r0]
	ldrb r1, [r1, r6]
	add r0, r5, #0
	bl ov15_021FFECC
	cmp r6, #4
	bne _021FB48C
	mov r0, #SEQ_SE_GS_GEARCANCEL>>6
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #1
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021FB48C:
	lsl r0, r6, #2
	add r1, r5, r0
	mov r0, #0x7f
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _021FB4F2
	ldr r0, _021FB514 ; =0x000005DC
	bl PlaySE
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_021FB4A4:
	ldr r0, _021FB4FC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _021FB4DE
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x7f
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _021FB4CE
	ldr r0, _021FB514 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	mov r1, #0
	bl ov15_021FD774
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_021FB4CE:
	cmp r4, #4
	bne _021FB4F2
	ldr r0, _021FB514 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021FB4DE:
	mov r0, #2
	tst r0, r1
	beq _021FB4F2
	mov r0, #SEQ_SE_GS_GEARCANCEL>>6
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #1
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021FB4F2:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021FB4F8: .word 0x0000066C
_021FB4FC: .word gSystem
_021FB500: .word ov15_02200528
_021FB504: .word ov15_02200529
_021FB508: .word ov15_0220052A
_021FB50C: .word ov15_0220052B
_021FB510: .word ov15_02201468
_021FB514: .word 0x000005DC
	thumb_func_end ov15_021FB3F0

	thumb_func_start ov15_021FB518
ov15_021FB518: ; 0x021FB518
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov15_021F9F08
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r0, #4
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r4, r2, r0
	add r0, r5, #0
	bl ov15_021FA074
	mov r1, #0
	add r2, r0, #0
	add r0, r5, #0
	add r3, r1, #0
	bl ov15_021FD574
	mov r2, #6
	ldrsh r1, [r4, r2]
	add r0, r5, #0
	sub r2, r2, #7
	mov r3, #0
	bl ov15_021FF364
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r1, #0x64
	ldrb r1, [r1]
	bl ov15_02200030
	mov r2, #0x8d
	lsl r2, r2, #2
	ldr r2, [r5, r2]
	add r0, r5, #0
	add r2, #0x64
	ldrb r2, [r2]
	mov r1, #1
	bl ov15_021FD404
	mov r2, #6
	ldrb r1, [r4, #9]
	ldrsh r2, [r4, r2]
	add r0, r5, #0
	mov r3, #0
	bl ov15_021FF6BC
	add r0, r5, #0
	bl ov15_021FA074
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl ov15_02200140
	ldr r1, _021FB5A8 ; =0x00000644
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	add r0, r5, #0
	mov r1, #1
	bl ov15_021F9C78
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FB5A8: .word 0x00000644
	thumb_func_end ov15_021FB518

	thumb_func_start ov15_021FB5AC
ov15_021FB5AC: ; 0x021FB5AC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ov15_021FB3F0
	add r1, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r1, r0
	beq _021FB5C8
	add r0, r0, #1
	cmp r1, r0
	beq _021FB5F8
	b _021FB5DC
_021FB5C8:
	mov r0, #0x1c
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #9
	mov r3, #8
	bl ov15_021FD7D0
	add sp, #4
	pop {r3, r4, pc}
_021FB5DC:
	ldr r0, _021FB600 ; =0x00000948
	mov r2, #9
	str r1, [r4, r0]
	add r1, #0x1c
	mov r0, #0x1d
	lsl r1, r1, #0x18
	str r0, [sp]
	add r0, r4, #0
	lsr r1, r1, #0x18
	mov r3, #8
	bl ov15_021FD7D0
	add sp, #4
	pop {r3, r4, pc}
_021FB5F8:
	mov r0, #4
	add sp, #4
	pop {r3, r4, pc}
	nop
_021FB600: .word 0x00000948
	thumb_func_end ov15_021FB5AC

	thumb_func_start ov15_021FB604
ov15_021FB604: ; 0x021FB604
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov15_02200294
	add r0, r5, #0
	bl ov15_021FF560
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov15_021FF7AC
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r0, r5, #0
	bl ov15_021FA074
	add r1, r4, #4
	add r4, #0x64
	add r2, r0, #0
	ldrb r4, [r4]
	mov r3, #0xc
	add r0, r5, #0
	mul r3, r4
	add r1, r1, r3
	mov r3, #0
	bl ov15_02200140
	add r0, r5, #0
	bl ov15_021FE868
	add r0, r5, #0
	bl ov15_021FED3C
	add r0, r5, #0
	bl ov15_021FB518
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov15_021FB604

	thumb_func_start ov15_021FB654
ov15_021FB654: ; 0x021FB654
	push {r4, lr}
	add r4, r0, #0
	bl ov15_02200294
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov15_021FF7AC
	ldr r1, _021FB67C ; =0x00000948
	add r0, r4, #0
	ldr r1, [r4, r1]
	lsl r1, r1, #2
	add r2, r4, r1
	mov r1, #0x7f
	lsl r1, r1, #4
	ldr r1, [r2, r1]
	blx r1
	pop {r4, pc}
	nop
_021FB67C: .word 0x00000948
	thumb_func_end ov15_021FB654

	thumb_func_start ov15_021FB680
ov15_021FB680: ; 0x021FB680
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r1, #0
	bl ov15_021FD788
	add r0, r4, #0
	bl ov15_021FFF24
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #6
	add r0, #0x66
	ldrh r0, [r0]
	add r2, r1, #0
	bl GetItemAttr
	add r1, r0, #0
	lsl r1, r1, #0x10
	mov r0, #2
	lsr r1, r1, #0x10
	bl GetItemFieldUseFunc
	add r1, r0, #0
	beq _021FB6EE
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x70]
	blx r1
	add r3, r0, #0
	beq _021FB6EE
	mov r2, #0x8f
	mov r0, #6
	lsl r2, r2, #2
	str r0, [sp]
	ldr r0, [r4, r2]
	sub r2, #8
	ldr r2, [r4, r2]
	ldr r1, _021FB6F8 ; =0x000005E4
	add r2, #0x66
	ldrh r2, [r2]
	ldr r1, [r4, r1]
	bl GetItemUseErrorMessage
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FEF48
	ldr r1, _021FB6FC ; =0x00000616
	add sp, #4
	strb r0, [r4, r1]
	mov r0, #0xc
	pop {r3, r4, pc}
_021FB6EE:
	add r0, r4, #0
	bl ov15_021FB784
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021FB6F8: .word 0x000005E4
_021FB6FC: .word 0x00000616
	thumb_func_end ov15_021FB680

	thumb_func_start ov15_021FB700
ov15_021FB700: ; 0x021FB700
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021FB778 ; =0x00000616
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021FB772
	ldr r0, _021FB77C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _021FB722
	ldr r0, _021FB780 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021FB772
_021FB722:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x65
	ldrb r0, [r0]
	cmp r0, #3
	beq _021FB736
	add r0, r4, #0
	bl ov15_021FED3C
_021FB736:
	add r0, r4, #0
	add r0, #0x34
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r0, #0x34
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #4
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	mov r1, #1
	bl ov15_021FD788
	add r0, r4, #0
	bl ov15_021FB518
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x65
	ldrb r0, [r0]
	cmp r0, #3
	bne _021FB76E
	mov r0, #0x1a
	pop {r4, pc}
_021FB76E:
	mov r0, #1
	pop {r4, pc}
_021FB772:
	mov r0, #0xc
	pop {r4, pc}
	nop
_021FB778: .word 0x00000616
_021FB77C: .word gSystem
_021FB780: .word gSystem + 0x40
	thumb_func_end ov15_021FB700

	thumb_func_start ov15_021FB784
ov15_021FB784: ; 0x021FB784
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r3, r1, #4
	add r1, #0x64
	ldrb r2, [r1]
	mov r1, #0xc
	mul r1, r2
	add r3, r3, r1
	ldr r1, _021FB80C ; =0x0000067B
	mov r2, #0
	strb r2, [r4, r1]
	ldrb r2, [r3, #8]
	cmp r2, #3
	bne _021FB7B0
	ldr r2, _021FB810 ; =ov15_021FB830
	add r0, r1, #1
	str r2, [r4, r0]
	mov r0, #0xd
	pop {r4, pc}
_021FB7B0:
	ldr r2, [r4, r0]
	sub r1, #0x97
	ldr r0, [r2]
	add r2, #0x66
	ldrh r2, [r2]
	ldr r1, [r4, r1]
	mov r3, #6
	bl TryFormatRegisteredKeyItemUseMessage
	cmp r0, #1
	bne _021FB7D6
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FEF48
	ldr r1, _021FB814 ; =0x00000616
	strb r0, [r4, r1]
	mov r0, #0xc
	pop {r4, pc}
_021FB7D6:
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r0, r4, #0
	add r1, #0x66
	ldrh r1, [r1]
	bl BagApp_TryUseItemInPlace
	cmp r0, #1
	bne _021FB7F4
	ldr r1, _021FB818 ; =ov15_021FBBB0
	ldr r0, _021FB81C ; =0x0000067C
	str r1, [r4, r0]
	mov r0, #0xd
	pop {r4, pc}
_021FB7F4:
	mov r0, #1
	mov r1, #6
	bl sub_020880CC
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x68
	strh r1, [r0]
	mov r0, #0x25
	pop {r4, pc}
	.balign 4, 0
_021FB80C: .word 0x0000067B
_021FB810: .word ov15_021FB830
_021FB814: .word 0x00000616
_021FB818: .word ov15_021FBBB0
_021FB81C: .word 0x0000067C
	thumb_func_end ov15_021FB784

	thumb_func_start ov15_021FB820
ov15_021FB820: ; 0x021FB820
	push {r3, lr}
	ldr r1, _021FB82C ; =0x0000067C
	ldr r1, [r0, r1]
	blx r1
	pop {r3, pc}
	nop
_021FB82C: .word 0x0000067C
	thumb_func_end ov15_021FB820

	thumb_func_start ov15_021FB830
ov15_021FB830: ; 0x021FB830
	push {r3, r4, r5, lr}
	ldr r1, _021FB9C0 ; =0x0000067B
	add r4, r0, #0
	ldrb r0, [r4, r1]
	cmp r0, #3
	bhi _021FB936
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FB848: ; jump table
	.short _021FB850 - _021FB848 - 2 ; case 0
	.short _021FB8AC - _021FB848 - 2 ; case 1
	.short _021FB90C - _021FB848 - 2 ; case 2
	.short _021FB926 - _021FB848 - 2 ; case 3
_021FB850:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, #0x66
	ldrh r0, [r0]
	bl TMHMGetMove
	add r5, r0, #0
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r2, r5, #0
	bl BufferMoveName
	add r0, r5, #0
	bl MoveIsHM
	cmp r0, #1
	ldr r2, _021FB9C4 ; =0x000005E4
	bne _021FB88A
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	mov r1, #0x3c
	bl ReadMsgDataIntoString
	b _021FB898
_021FB88A:
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	mov r1, #0x3b
	bl ReadMsgDataIntoString
_021FB898:
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FEF48
	ldr r1, _021FB9C8 ; =0x00000616
	strb r0, [r4, r1]
	mov r0, #1
	add r1, #0x65
	strb r0, [r4, r1]
	b _021FB9BA
_021FB8AC:
	sub r1, #0x65
	ldrb r0, [r4, r1]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021FB936
	ldr r0, _021FB9CC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _021FB8CA
	ldr r0, _021FB9D0 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021FB9BA
_021FB8CA:
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x3d
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x34
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0xbd
	ldr r1, _021FB9C4 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FEF48
	ldr r1, _021FB9C8 ; =0x00000616
	strb r0, [r4, r1]
	mov r0, #2
	add r1, #0x65
	strb r0, [r4, r1]
	b _021FB9BA
_021FB90C:
	sub r1, #0x65
	ldrb r0, [r4, r1]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021FB9BA
	add r0, r4, #0
	bl ov15_021FF004
	ldr r0, _021FB9C0 ; =0x0000067B
	mov r1, #3
	strb r1, [r4, r0]
	b _021FB9BA
_021FB926:
	ldr r0, _021FB9D4 ; =0x00000804
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _021FB938
	cmp r0, #2
	beq _021FB956
_021FB936:
	b _021FB9BA
_021FB938:
	add r0, r4, #0
	bl ov15_021FF058
	mov r0, #1
	mov r1, #6
	bl sub_020880CC
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x68
	strh r1, [r0]
	mov r0, #0x25
	pop {r3, r4, r5, pc}
_021FB956:
	add r0, r4, #0
	bl ov15_021FF058
	add r0, r4, #0
	bl ov15_021FED3C
	add r0, r4, #0
	add r0, #0x34
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r0, #0x34
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #4
	bl ScheduleWindowCopyToVram
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r5, [r4, r0]
	add r0, r4, #0
	bl ov15_021FA074
	add r1, r5, #4
	add r5, #0x64
	add r2, r0, #0
	ldrb r5, [r5]
	mov r3, #0xc
	add r0, r4, #0
	mul r3, r5
	add r1, r1, r3
	mov r3, #0
	bl ov15_02200140
	add r0, r4, #0
	bl ov15_021FE868
	add r0, r4, #0
	bl ov15_02200294
	add r0, r4, #0
	bl ov15_021FB518
	add r0, r4, #0
	mov r1, #1
	bl ov15_021FD788
	mov r0, #1
	pop {r3, r4, r5, pc}
_021FB9BA:
	mov r0, #0xd
	pop {r3, r4, r5, pc}
	nop
_021FB9C0: .word 0x0000067B
_021FB9C4: .word 0x000005E4
_021FB9C8: .word 0x00000616
_021FB9CC: .word gSystem
_021FB9D0: .word gSystem + 0x40
_021FB9D4: .word 0x00000804
	thumb_func_end ov15_021FB830

	thumb_func_start BagApp_TryUseItemInPlace
BagApp_TryUseItemInPlace: ; 0x021FB9D8
	push {r3, r4, r5, lr}
	mov r2, #0xbd
	add r4, r0, #0
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	sub r2, #0xb8
	add r5, r1, #0
	ldr r2, [r4, r2]
	mov r1, #0
	bl BufferPlayersName
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	add r2, r5, #0
	bl BufferItemName
	cmp r5, #ITEM_BLACK_FLUTE
	bne _021FBA20
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #msg_0010_00065
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl BagApp_SetFlute
	mov r0, #0x1a
	mov r1, #0
	lsl r0, r0, #6
	strh r1, [r4, r0]
	b _021FBA7A
_021FBA20:
	cmp r5, #ITEM_WHITE_FLUTE
	bne _021FBA44
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #msg_0010_00064
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #2
	bl BagApp_SetFlute
	mov r0, #0x1a
	mov r1, #0
	lsl r0, r0, #6
	strh r1, [r4, r0]
	b _021FBA7A
_021FBA44:
	cmp r5, #ITEM_MAX_REPEL
	beq _021FBA50
	cmp r5, #ITEM_SUPER_REPEL
	beq _021FBA50
	cmp r5, #ITEM_REPEL
	bne _021FBA5C
_021FBA50:
	add r0, r4, #0
	add r1, r5, #0
	bl BagApp_TryUseRepel
	add r5, r0, #0
	b _021FBA7A
_021FBA5C:
	ldr r0, _021FBA94 ; =ITEM_GB_SOUNDS
	cmp r5, r0
	bne _021FBA76
	add r0, r4, #0
	add r1, r5, #0
	bl BagApp_ToggleGBSounds
	add r5, r0, #0
	mov r0, #0x1a
	mov r1, #0
	lsl r0, r0, #6
	strh r1, [r4, r0]
	b _021FBA7A
_021FBA76:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021FBA7A:
	mov r0, #0xbd
	ldr r1, _021FBA98 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FBA94: .word ITEM_GB_SOUNDS
_021FBA98: .word 0x000005E4
	thumb_func_end BagApp_TryUseItemInPlace

	thumb_func_start BagApp_TryUseRepel
BagApp_TryUseRepel: ; 0x021FBA9C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl BagApp_GetSaveRoamers
	bl RoamerSave_RepelNotInUse
	cmp r0, #0
	bne _021FBAC4
	mov r0, #0x1a
	mov r1, #0
	lsl r0, r0, #6
	strh r1, [r4, r0]
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #msg_0010_00063
	bl NewString_ReadMsgData
	pop {r3, r4, r5, pc}
_021FBAC4:
	add r0, r5, #0
	mov r1, #2
	mov r2, #6
	bl GetItemAttr
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl BagApp_GetRepelStepCountAddr
	mov r0, #0x680>>6
	mov r1, #1
	lsl r0, r0, #6
	strh r1, [r4, r0]
	sub r0, #0x680-SEQ_SE_DP_CARD2
	bl PlaySE
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #msg_0010_00062
	bl NewString_ReadMsgData
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BagApp_TryUseRepel

	thumb_func_start BagApp_ToggleGBSounds
BagApp_ToggleGBSounds: ; 0x021FBAF8
	push {r4, lr}
	add r4, r0, #0
	bl SoundSys_GetGBSoundsState
	cmp r0, #1
	bne _021FBB16
	bl SoundSys_ToggleGBSounds
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #msg_0010_00105
	bl NewString_ReadMsgData
	pop {r4, pc}
_021FBB16:
	bl SoundSys_ToggleGBSounds
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #msg_0010_00104
	bl NewString_ReadMsgData
	pop {r4, pc}
	thumb_func_end BagApp_ToggleGBSounds

	thumb_func_start ov15_021FBB28
ov15_021FBB28: ; 0x021FBB28
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	add r0, r2, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	add r3, r1, #0
	mul r3, r0
	add r1, r2, r3
	mov r0, #6
	mov r3, #0x1a
	str r0, [sp]
	add r2, #0x66
	lsl r3, r3, #6
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0xd]
	ldrh r2, [r2]
	ldrh r3, [r4, r3]
	bl Pocket_TakeItem
	add r0, r4, #0
	bl ov15_021F9F08
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r3, [r4, r0]
	add r0, r3, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	add r0, r3, #0
	add r1, r3, #0
	add r0, #0xa
	add r1, #8
	add r0, r0, r2
	add r1, r1, r2
	add r2, r3, r2
	ldrb r2, [r2, #0xd]
	bl ov15_021FA044
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	add r0, r2, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	add r3, r1, #0
	mul r3, r0
	add r0, r2, #0
	add r1, r2, #0
	add r2, r2, r3
	add r0, #0xa
	add r1, #8
	ldrb r2, [r2, #0xd]
	add r0, r0, r3
	add r1, r1, r3
	mov r3, #6
	bl ov15_021FA070
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov15_021FBB28

	thumb_func_start ov15_021FBBB0
ov15_021FBBB0: ; 0x021FBBB0
	push {r3, r4, r5, lr}
	ldr r1, _021FBC5C ; =0x0000067B
	add r5, r0, #0
	ldrb r2, [r5, r1]
	cmp r2, #0
	beq _021FBBC2
	cmp r2, #1
	beq _021FBBD4
	b _021FBC56
_021FBBC2:
	mov r1, #0
	bl ov15_021FEF48
	ldr r1, _021FBC60 ; =0x00000616
	strb r0, [r5, r1]
	mov r0, #1
	add r1, #0x65
	strb r0, [r5, r1]
	b _021FBC56
_021FBBD4:
	sub r1, #0x65
	ldrb r0, [r5, r1]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021FBC56
	ldr r0, _021FBC64 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _021FBBF2
	ldr r0, _021FBC68 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021FBC56
_021FBBF2:
	add r0, r5, #0
	bl ov15_021FED3C
	add r0, r5, #0
	add r0, #0x34
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r0, #0x34
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	bl ov15_021FBB28
	add r0, r5, #0
	bl ov15_021FB518
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r0, r5, #0
	bl ov15_021FA074
	add r1, r4, #4
	add r4, #0x64
	add r2, r0, #0
	ldrb r4, [r4]
	mov r3, #0xc
	add r0, r5, #0
	mul r3, r4
	add r1, r1, r3
	mov r3, #1
	bl ov15_02200140
	add r0, r5, #0
	bl ov15_021FA170
	add r0, r5, #4
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	mov r1, #1
	bl ov15_021FD788
	ldr r0, _021FBC5C ; =0x0000067B
	mov r1, #0
	strb r1, [r5, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021FBC56:
	mov r0, #0xd
	pop {r3, r4, r5, pc}
	nop
_021FBC5C: .word 0x0000067B
_021FBC60: .word 0x00000616
_021FBC64: .word gSystem
_021FBC68: .word gSystem + 0x40
	thumb_func_end ov15_021FBBB0

	thumb_func_start ov15_021FBC6C
ov15_021FBC6C: ; 0x021FBC6C
	push {r4, lr}
	add r4, r0, #0
	bl ov15_021FED3C
	mov r0, #1
	mov r1, #6
	bl sub_020880CC
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	add r0, #0x68
	strh r1, [r0]
	mov r0, #0x25
	pop {r4, pc}
	thumb_func_end ov15_021FBC6C

	thumb_func_start ov15_021FBC8C
ov15_021FBC8C: ; 0x021FBC8C
	push {r4, lr}
	add r4, r0, #0
	bl ov15_021FED3C
	mov r0, #1
	mov r1, #6
	bl sub_020880CC
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	add r0, #0x68
	strh r1, [r0]
	mov r0, #0x25
	pop {r4, pc}
	thumb_func_end ov15_021FBC8C

	thumb_func_start ov15_021FBCAC
ov15_021FBCAC: ; 0x021FBCAC
	push {r4, lr}
	mov r1, #0x1a
	add r4, r0, #0
	mov r2, #1
	lsl r1, r1, #6
	strh r2, [r4, r1]
	bl ov15_021FFF24
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	mov r3, #6
	add r0, r2, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r1, r2, r0
	add r2, #0x66
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0xd]
	ldrh r2, [r2]
	bl Pocket_GetQuantity
	cmp r0, #1
	bne _021FBCF2
	add r0, r4, #0
	bl ov15_021FEEA4
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FD788
	mov r0, #8
	pop {r4, pc}
_021FBCF2:
	mov r2, #0
	add r0, r4, #0
	mov r1, #3
	add r3, r2, #0
	bl ov15_021FD574
	ldr r2, _021FBD24 ; =0x00000682
	add r0, r4, #0
	ldrh r2, [r4, r2]
	mov r1, #3
	bl ov15_02200300
	add r0, r4, #0
	mov r1, #3
	bl ov15_021FEDEC
	add r0, r4, #0
	bl ov15_021FF7C4
	add r0, r4, #0
	mov r1, #1
	bl ov15_021FF29C
	mov r0, #5
	pop {r4, pc}
	.balign 4, 0
_021FBD24: .word 0x00000682
	thumb_func_end ov15_021FBCAC

	thumb_func_start ov15_021FBD28
ov15_021FBD28: ; 0x021FBD28
	cmp r2, #0
	ble _021FBD3E
	cmp r0, r1
	bne _021FBD34
	mov r0, #1
	bx lr
_021FBD34:
	add r0, r0, r2
	cmp r0, r1
	ble _021FBD4E
	add r0, r1, #0
	bx lr
_021FBD3E:
	cmp r0, #1
	bne _021FBD46
	add r0, r1, #0
	bx lr
_021FBD46:
	add r0, r0, r2
	cmp r0, #0
	bgt _021FBD4E
	mov r0, #1
_021FBD4E:
	bx lr
	thumb_func_end ov15_021FBD28

	thumb_func_start ov15_021FBD50
ov15_021FBD50: ; 0x021FBD50
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r6, #0
	mov r1, #3
	add r4, r0, #0
	bl ov15_021FAC2C
	add r5, r0, #0
	sub r0, r6, #1
	cmp r5, r0
	bne _021FBD68
	b _021FBEF6
_021FBD68:
	ldr r0, _021FBF88 ; =0x00000682
	ldrh r0, [r4, r0]
	bl ov15_022002EC
	cmp r0, #1
	beq _021FBD7A
	cmp r0, #2
	beq _021FBD88
	b _021FBD9A
_021FBD7A:
	cmp r5, #0
	beq _021FBD82
	cmp r5, #3
	bne _021FBD9A
_021FBD82:
	mov r5, #0
	mvn r5, r5
	b _021FBD9A
_021FBD88:
	cmp r5, #0
	beq _021FBD96
	cmp r5, #1
	beq _021FBD96
	sub r0, r5, #3
	cmp r0, #1
	bhi _021FBD9A
_021FBD96:
	mov r5, #0
	mvn r5, r5
_021FBD9A:
	cmp r5, #7
	bls _021FBDA0
	b _021FBF1E
_021FBDA0:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FBDAC: ; jump table
	.short _021FBDBC - _021FBDAC - 2 ; case 0
	.short _021FBDEE - _021FBDAC - 2 ; case 1
	.short _021FBE20 - _021FBDAC - 2 ; case 2
	.short _021FBE52 - _021FBDAC - 2 ; case 3
	.short _021FBE86 - _021FBDAC - 2 ; case 4
	.short _021FBEBA - _021FBDAC - 2 ; case 5
	.short _021FBEEE - _021FBDAC - 2 ; case 6
	.short _021FBEF2 - _021FBDAC - 2 ; case 7
_021FBDBC:
	mov r1, #0x1a
	lsl r1, r1, #6
	ldrsh r0, [r4, r1]
	add r1, r1, #2
	ldrh r1, [r4, r1]
	mov r2, #0x64
	bl ov15_021FBD28
	mov r1, #0x1a
	lsl r1, r1, #6
	strh r0, [r4, r1]
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x1a
	bl sub_0200DC4C
	mov r6, #1
	b _021FBF1E
_021FBDEE:
	mov r1, #0x1a
	lsl r1, r1, #6
	ldrsh r0, [r4, r1]
	add r1, r1, #2
	ldrh r1, [r4, r1]
	mov r2, #0xa
	bl ov15_021FBD28
	mov r1, #0x1a
	lsl r1, r1, #6
	strh r0, [r4, r1]
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x1a
	bl sub_0200DC4C
	mov r6, #1
	b _021FBF1E
_021FBE20:
	mov r1, #0x1a
	lsl r1, r1, #6
	ldrsh r0, [r4, r1]
	add r1, r1, #2
	ldrh r1, [r4, r1]
	mov r2, #1
	bl ov15_021FBD28
	mov r1, #0x1a
	lsl r1, r1, #6
	strh r0, [r4, r1]
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x1a
	bl sub_0200DC4C
	mov r6, #1
	b _021FBF1E
_021FBE52:
	mov r1, #0x1a
	lsl r1, r1, #6
	ldrsh r0, [r4, r1]
	add r1, r1, #2
	mov r2, #0x63
	ldrh r1, [r4, r1]
	mvn r2, r2
	bl ov15_021FBD28
	mov r1, #0x1a
	lsl r1, r1, #6
	strh r0, [r4, r1]
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x1c
	bl sub_0200DC4C
	mov r6, #2
	b _021FBF1E
_021FBE86:
	mov r1, #0x1a
	lsl r1, r1, #6
	ldrsh r0, [r4, r1]
	add r1, r1, #2
	mov r2, #9
	ldrh r1, [r4, r1]
	mvn r2, r2
	bl ov15_021FBD28
	mov r1, #0x1a
	lsl r1, r1, #6
	strh r0, [r4, r1]
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x1c
	bl sub_0200DC4C
	mov r6, #2
	b _021FBF1E
_021FBEBA:
	mov r1, #0x1a
	lsl r1, r1, #6
	ldrsh r0, [r4, r1]
	add r1, r1, #2
	mov r2, #0
	ldrh r1, [r4, r1]
	mvn r2, r2
	bl ov15_021FBD28
	mov r1, #0x1a
	lsl r1, r1, #6
	strh r0, [r4, r1]
	mov r0, #0xb9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0xb9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x1c
	bl sub_0200DC4C
	mov r6, #2
	b _021FBF1E
_021FBEEE:
	mov r6, #3
	b _021FBF1E
_021FBEF2:
	mov r6, #4
	b _021FBF1E
_021FBEF6:
	mov r1, #0x1a
	lsl r1, r1, #6
	add r0, r4, r1
	add r1, r1, #2
	ldrh r1, [r4, r1]
	bl sub_020881C0
	add r6, r0, #0
	bne _021FBF1E
	ldr r0, _021FBF8C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _021FBF16
	mov r6, #3
	b _021FBF1E
_021FBF16:
	mov r0, #2
	tst r0, r1
	beq _021FBF1E
	mov r6, #4
_021FBF1E:
	cmp r6, #4
	bhi _021FBF82
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FBF2E: ; jump table
	.short _021FBF82 - _021FBF2E - 2 ; case 0
	.short _021FBF38 - _021FBF2E - 2 ; case 1
	.short _021FBF38 - _021FBF2E - 2 ; case 2
	.short _021FBF4C - _021FBF2E - 2 ; case 3
	.short _021FBF66 - _021FBF2E - 2 ; case 4
_021FBF38:
	add r0, r4, #0
	mov r1, #3
	bl ov15_021FEDEC
	ldr r0, _021FBF90 ; =0x00000637
	bl PlaySE
	add sp, #4
	mov r0, #5
	pop {r3, r4, r5, r6, pc}
_021FBF4C:
	ldr r0, _021FBF94 ; =0x000005DC
	bl PlaySE
	mov r0, #6
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x26
	mov r2, #9
	mov r3, #8
	bl ov15_021FD7D0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021FBF66:
	mov r0, #SEQ_SE_GS_GEARCANCEL>>6
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #7
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #9
	mov r3, #8
	bl ov15_021FD7D0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021FBF82:
	mov r0, #5
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021FBF88: .word 0x00000682
_021FBF8C: .word gSystem
_021FBF90: .word 0x00000637
_021FBF94: .word 0x000005DC
	thumb_func_end ov15_021FBD50

	thumb_func_start ov15_021FBF98
ov15_021FBF98: ; 0x021FBF98
	push {r4, lr}
	add r4, r0, #0
	bl ov15_021FEEA4
	add r0, r4, #0
	bl ov15_02200428
	add r0, r4, #0
	bl ov15_021FFF24
	add r0, r4, #0
	bl ov15_021FF834
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FD788
	mov r0, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov15_021FBF98

	thumb_func_start ov15_021FBFC0
ov15_021FBFC0: ; 0x021FBFC0
	push {r4, lr}
	add r4, r0, #0
	bl ov15_021FED3C
	add r0, r4, #0
	bl ov15_021FB518
	add r0, r4, #0
	bl ov15_02200428
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FF29C
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x10
	bl sub_0200DC4C
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov15_021FBFC0

	thumb_func_start ov15_021FBFF8
ov15_021FBFF8: ; 0x021FBFF8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021FC018 ; =0x00000616
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021FC012
	add r0, r4, #0
	bl ov15_021FF004
	mov r0, #9
	pop {r4, pc}
_021FC012:
	mov r0, #8
	pop {r4, pc}
	nop
_021FC018: .word 0x00000616
	thumb_func_end ov15_021FBFF8

	thumb_func_start ov15_021FC01C
ov15_021FC01C: ; 0x021FC01C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _021FC134 ; =0x00000804
	ldr r0, [r5, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _021FC03A
	cmp r0, #2
	beq _021FC0CE
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	b _021FC12E
_021FC03A:
	add r0, r5, #0
	bl ov15_021FF058
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x36
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #0x1a
	lsl r0, r0, #6
	ldrsh r0, [r5, r0]
	cmp r0, #1
	bne _021FC06E
	mov r2, #0xbd
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	sub r2, #0xc0
	ldr r2, [r5, r2]
	mov r1, #0
	add r2, #0x66
	ldrh r2, [r2]
	bl BufferItemName
	b _021FC082
_021FC06E:
	mov r2, #0xbd
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	sub r2, #0xc0
	ldr r2, [r5, r2]
	mov r1, #0
	add r2, #0x66
	ldrh r2, [r2]
	bl BufferItemNamePlural
_021FC082:
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	mov r2, #0x1a
	mov r0, #0xbd
	str r1, [sp, #4]
	lsl r2, r2, #6
	lsl r0, r0, #2
	ldrsh r2, [r5, r2]
	ldr r0, [r5, r0]
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FC138 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	add r0, #0x34
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	mov r1, #0
	bl ov15_021FEF48
	ldr r1, _021FC13C ; =0x00000616
	add sp, #8
	strb r0, [r5, r1]
	mov r0, #0xa
	pop {r3, r4, r5, pc}
_021FC0CE:
	add r0, r5, #0
	bl ov15_021FF058
	add r0, r5, #0
	add r0, #0x34
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r0, #0x34
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #4
	bl ScheduleWindowCopyToVram
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r0, r5, #0
	bl ov15_021FA074
	add r1, r4, #4
	add r4, #0x64
	add r2, r0, #0
	ldrb r4, [r4]
	mov r3, #0xc
	add r0, r5, #0
	mul r3, r4
	add r1, r1, r3
	mov r3, #0
	bl ov15_02200140
	add r0, r5, #0
	bl ov15_021FE868
	add r0, r5, #0
	bl ov15_021FED3C
	add r0, r5, #0
	mov r1, #1
	bl ov15_021FD788
	add r0, r5, #0
	bl ov15_021FB518
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, pc}
_021FC12E:
	mov r0, #9
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FC134: .word 0x00000804
_021FC138: .word 0x000005E4
_021FC13C: .word 0x00000616
	thumb_func_end ov15_021FC01C

	thumb_func_start ov15_021FC140
ov15_021FC140: ; 0x021FC140
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021FC160 ; =0x00000616
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _021FC154
	mov r0, #0xa
	pop {r4, pc}
_021FC154:
	add r4, #0x34
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	mov r0, #0xb
	pop {r4, pc}
	.balign 4, 0
_021FC160: .word 0x00000616
	thumb_func_end ov15_021FC140

	thumb_func_start ov15_021FC164
ov15_021FC164: ; 0x021FC164
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021FC218 ; =0x00000616
	ldrb r0, [r5, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021FC214
	ldr r0, _021FC21C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _021FC186
	ldr r0, _021FC220 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021FC214
_021FC186:
	add r0, r5, #0
	add r0, #0x34
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r0, #0x34
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #4
	bl ScheduleWindowCopyToVram
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	add r0, r2, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	add r3, r1, #0
	mul r3, r0
	add r1, r2, r3
	mov r0, #6
	mov r3, #0x1a
	str r0, [sp]
	add r2, #0x66
	lsl r3, r3, #6
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0xd]
	ldrh r2, [r2]
	ldrh r3, [r5, r3]
	bl Pocket_TakeItem
	add r0, r5, #0
	bl ov15_021F9F08
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r0, r5, #0
	bl ov15_021FA074
	add r1, r4, #4
	add r4, #0x64
	add r2, r0, #0
	ldrb r4, [r4]
	mov r3, #0xc
	add r0, r5, #0
	mul r3, r4
	add r1, r1, r3
	mov r3, #1
	bl ov15_02200140
	add r0, r5, #0
	bl ov15_021FE868
	add r0, r5, #0
	bl ov15_021FED3C
	add r0, r5, #0
	bl ov15_021FB518
	add r0, r5, #0
	bl ov15_021FA170
	add r0, r5, #0
	mov r1, #1
	bl ov15_021FD788
	mov r0, #1
	pop {r3, r4, r5, pc}
_021FC214:
	mov r0, #0xb
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FC218: .word 0x00000616
_021FC21C: .word gSystem
_021FC220: .word gSystem + 0x40
	thumb_func_end ov15_021FC164

	thumb_func_start ov15_021FC224
ov15_021FC224: ; 0x021FC224
	push {r3, r4, r5, lr}
	mov r1, #0x8e
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, r1, #4
	ldr r1, [r5, r1]
	add r1, #0x66
	ldrh r1, [r1]
	bl Bag_TryRegisterItem
	cmp r0, #0
	bne _021FC28C
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x67
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x34
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0xbd
	ldr r1, _021FC2DC ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	mov r1, #0
	bl ov15_021FEF48
	add r0, r5, #0
	bl ov15_02200294
	add r0, r5, #0
	bl ov15_021FFF24
	add r0, r5, #0
	mov r1, #0
	bl ov15_021FD788
	mov r0, #0x19
	pop {r3, r4, r5, pc}
_021FC28C:
	add r0, r5, #0
	bl ov15_02200294
	add r0, r5, #0
	bl ov15_021FF560
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov15_021FF7AC
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r0, r5, #0
	bl ov15_021FA074
	add r1, r4, #4
	add r4, #0x64
	add r2, r0, #0
	ldrb r4, [r4]
	mov r3, #0xc
	add r0, r5, #0
	mul r3, r4
	add r1, r1, r3
	mov r3, #0
	bl ov15_02200140
	add r0, r5, #0
	bl ov15_021FE868
	add r0, r5, #0
	bl ov15_021FED3C
	add r0, r5, #0
	bl ov15_021FB518
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021FC2DC: .word 0x000005E4
	thumb_func_end ov15_021FC224

	thumb_func_start ov15_021FC2E0
ov15_021FC2E0: ; 0x021FC2E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021FC370 ; =0x00000616
	ldrb r0, [r5, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021FC36A
	ldr r0, _021FC374 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _021FC302
	ldr r0, _021FC378 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021FC36A
_021FC302:
	add r0, r5, #0
	add r0, #0x34
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r0, #0x34
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #0
	bl ov15_02200294
	add r0, r5, #0
	bl ov15_021FF560
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov15_021FF7AC
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r0, r5, #0
	bl ov15_021FA074
	add r1, r4, #4
	add r4, #0x64
	add r2, r0, #0
	ldrb r4, [r4]
	mov r3, #0xc
	add r0, r5, #0
	mul r3, r4
	add r1, r1, r3
	mov r3, #0
	bl ov15_02200140
	add r0, r5, #0
	bl ov15_021FE868
	add r0, r5, #0
	bl ov15_021FED3C
	add r0, r5, #0
	bl ov15_021FB518
	add r0, r5, #0
	mov r1, #1
	bl ov15_021FD788
	mov r0, #1
	pop {r3, r4, r5, pc}
_021FC36A:
	mov r0, #0x19
	pop {r3, r4, r5, pc}
	nop
_021FC370: .word 0x00000616
_021FC374: .word gSystem
_021FC378: .word gSystem + 0x40
	thumb_func_end ov15_021FC2E0

	thumb_func_start ov15_021FC37C
ov15_021FC37C: ; 0x021FC37C
	push {r3, r4, r5, lr}
	mov r1, #0x8e
	add r5, r0, #0
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, r1, #4
	ldr r1, [r5, r1]
	add r1, #0x66
	ldrh r1, [r1]
	bl Bag_UnregisterItem
	add r0, r5, #0
	bl ov15_02200294
	add r0, r5, #0
	bl ov15_021FF560
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov15_021FF7AC
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r0, r5, #0
	bl ov15_021FA074
	add r1, r4, #4
	add r4, #0x64
	add r2, r0, #0
	ldrb r4, [r4]
	mov r3, #0xc
	add r0, r5, #0
	mul r3, r4
	add r1, r1, r3
	mov r3, #0
	bl ov15_02200140
	add r0, r5, #0
	bl ov15_021FE868
	add r0, r5, #0
	bl ov15_021FED3C
	add r0, r5, #0
	bl ov15_021FB518
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov15_021FC37C

	thumb_func_start ov15_021FC3E0
ov15_021FC3E0: ; 0x021FC3E0
	push {r3, lr}
	bl ov15_021FAC48
	mov r0, #3
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov15_021FC3E0

	thumb_func_start ov15_021FC3EC
ov15_021FC3EC: ; 0x021FC3EC
	push {r4, lr}
	add r4, r0, #0
	bl ov15_021FED3C
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FD788
	add r0, r4, #0
	bl ov15_021FFF24
	mov r0, #1
	mov r1, #6
	bl sub_020880CC
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	add r0, #0x68
	strh r1, [r0]
	mov r0, #0x25
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov15_021FC3EC

	thumb_func_start ov15_021FC41C
ov15_021FC41C: ; 0x021FC41C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _021FC70C ; =gSystem
	mov r2, #0x40
	ldr r3, [r1, #0x4c]
	add r5, r0, #0
	mov r4, #0
	tst r2, r3
	beq _021FC43E
	ldr r0, _021FC710 ; =0x00000644
	add r4, r4, #1
	ldr r1, [r5, r0]
	lsl r2, r1, #2
	ldr r1, _021FC714 ; =ov15_02200640
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	b _021FC56E
_021FC43E:
	mov r2, #0x80
	tst r2, r3
	beq _021FC454
	ldr r0, _021FC710 ; =0x00000644
	add r4, r4, #1
	ldr r1, [r5, r0]
	lsl r2, r1, #2
	ldr r1, _021FC718 ; =ov15_02200641
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	b _021FC56E
_021FC454:
	mov r2, #0x20
	add r6, r3, #0
	tst r6, r2
	beq _021FC4AC
	ldr r1, _021FC710 ; =0x00000644
	ldr r3, _021FC71C ; =ov15_02200642
	ldr r1, [r5, r1]
	lsl r6, r1, #2
	ldrb r3, [r3, r6]
	cmp r3, #0xe
	bne _021FC484
	mov r1, #2
	str r1, [sp]
	mov r1, #0xe
	add r2, sp, #0xc
	add r3, r4, #0
	str r4, [sp, #4]
	bl ov15_021FA73C
	cmp r0, #1
	bne _021FC4D6
	add sp, #0x10
	mov r0, #0xe
	pop {r4, r5, r6, pc}
_021FC484:
	cmp r1, #0x10
	beq _021FC56E
	cmp r1, #0
	blt _021FC4A4
	cmp r1, #8
	bge _021FC4A4
	sub r2, #0x21
	bl ov15_021FA6C0
	ldr r1, _021FC710 ; =0x00000644
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021FC56E
	str r0, [r5, r1]
	add r4, r4, #1
	b _021FC56E
_021FC4A4:
	ldr r0, _021FC710 ; =0x00000644
	add r4, r4, #1
	str r3, [r5, r0]
	b _021FC56E
_021FC4AC:
	mov r2, #0x10
	tst r3, r2
	beq _021FC506
	ldr r1, _021FC710 ; =0x00000644
	ldr r2, _021FC720 ; =ov15_02200643
	ldr r1, [r5, r1]
	lsl r3, r1, #2
	ldrb r2, [r2, r3]
	cmp r2, #0xf
	bne _021FC4DE
	mov r1, #2
	str r1, [sp]
	add r2, sp, #8
	mov r1, #0xf
	add r2, #3
	add r3, r4, #0
	str r4, [sp, #4]
	bl ov15_021FA73C
	cmp r0, #1
	beq _021FC4D8
_021FC4D6:
	b _021FC77A
_021FC4D8:
	add sp, #0x10
	mov r0, #0xe
	pop {r4, r5, r6, pc}
_021FC4DE:
	cmp r1, #0x10
	beq _021FC56E
	cmp r1, #0
	blt _021FC4FE
	cmp r1, #8
	bge _021FC4FE
	mov r2, #1
	bl ov15_021FA6C0
	ldr r1, _021FC710 ; =0x00000644
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021FC56E
	str r0, [r5, r1]
	add r4, r4, #1
	b _021FC56E
_021FC4FE:
	ldr r0, _021FC710 ; =0x00000644
	add r4, r4, #1
	str r2, [r5, r0]
	b _021FC56E
_021FC506:
	ldr r3, [r1, #0x48]
	lsl r1, r2, #5
	tst r1, r3
	beq _021FC53A
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	sub r2, #0x11
	add r1, #0x64
	ldrb r1, [r1]
	bl ov15_021FA6C0
	add r1, r0, #0
	mov r0, #2
	str r0, [sp]
	add r0, r4, #0
	add r2, sp, #8
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, #2
	mov r3, #1
	bl ov15_021FA73C
	add sp, #0x10
	mov r0, #0xe
	pop {r4, r5, r6, pc}
_021FC53A:
	add r2, #0xf0
	add r1, r3, #0
	tst r1, r2
	beq _021FC56E
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r2, #1
	add r1, #0x64
	ldrb r1, [r1]
	bl ov15_021FA6C0
	add r1, r0, #0
	mov r0, #2
	str r0, [sp]
	add r0, r4, #0
	add r2, sp, #8
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, #1
	mov r3, #1
	bl ov15_021FA73C
	add sp, #0x10
	mov r0, #0xe
	pop {r4, r5, r6, pc}
_021FC56E:
	ldr r1, _021FC710 ; =0x00000644
	ldr r0, [r5, r1]
	cmp r0, #0x11
	bne _021FC582
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x64
	ldrb r0, [r0]
	str r0, [r5, r1]
_021FC582:
	cmp r4, #0
	beq _021FC5A6
	ldr r0, _021FC724 ; =0x000005DC
	bl PlaySE
	ldr r1, _021FC710 ; =0x00000644
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r1, _021FC710 ; =0x00000644
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FA0E4
	add r0, r5, #0
	bl ov15_021FA170
_021FC5A6:
	mov r1, #0
	add r0, sp, #8
	strb r1, [r0]
	add r0, r5, #0
	bl ov15_021FAC2C
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021FC630
	add r0, r5, #0
	add r1, r4, #0
	bl ov15_021FA104
	cmp r0, #0
	beq _021FC608
	cmp r4, #8
	bhs _021FC5EA
	add r0, r5, #0
	add r1, r4, #0
	bl ov15_021FA68C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021FC608
	ldr r1, _021FC710 ; =0x00000644
	add r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	b _021FC608
_021FC5EA:
	ldr r1, _021FC710 ; =0x00000644
	add r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r0, _021FC710 ; =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FC608
	cmp r1, #0xd
	bgt _021FC608
	add r0, r5, #0
	bl ov15_021FA0E4
_021FC608:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #8
	mov r3, #0
	bl ov15_021FA73C
	cmp r0, #1
	beq _021FC6B4
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r2, #4
	add r1, #0x68
	strh r2, [r1]
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FC630:
	ldr r0, _021FC70C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _021FC678
	mov r0, #2
	str r0, [sp]
	mov r3, #0
	ldr r1, _021FC710 ; =0x00000644
	str r3, [sp, #4]
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r2, sp, #8
	bl ov15_021FA73C
	add r4, r0, #0
	ldr r0, _021FC710 ; =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FC662
	cmp r1, #0xd
	bgt _021FC662
	add r0, r5, #0
	bl ov15_021FA0E4
_021FC662:
	cmp r4, #1
	beq _021FC6B4
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #4
	add r0, #0x68
	strh r1, [r0]
	add sp, #0x10
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_021FC678:
	mov r0, #2
	tst r1, r0
	beq _021FC6B4
	str r0, [sp]
	mov r3, #0
	add r0, r5, #0
	mov r1, #0x10
	add r2, sp, #8
	str r3, [sp, #4]
	bl ov15_021FA73C
	add r4, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #4
	add r0, #0x68
	strh r1, [r0]
	ldr r0, _021FC710 ; =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FC6AE
	cmp r1, #0xd
	bgt _021FC6AE
	add r0, r5, #0
	bl ov15_021FA0E4
_021FC6AE:
	add sp, #0x10
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_021FC6B4:
	add r0, sp, #8
	ldrb r0, [r0]
	cmp r0, #1
	bne _021FC778
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	add r0, #0x66
	ldrh r0, [r0]
	mov r2, #6
	bl GetItemAttr
	cmp r0, #0
	bne _021FC6E4
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x66
	ldrh r0, [r0]
	bl ItemIdIsNotJohtoBall
	cmp r0, #0
	bne _021FC75C
_021FC6E4:
	mov r2, #0xbd
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	sub r2, #0xc0
	ldr r2, [r5, r2]
	mov r1, #0
	add r2, #0x66
	ldrh r2, [r2]
	bl BufferItemName
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x2f
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #0xbd
	ldr r1, _021FC728 ; =0x000005E4
	b _021FC72C
	.balign 4, 0
_021FC70C: .word gSystem
_021FC710: .word 0x00000644
_021FC714: .word ov15_02200640
_021FC718: .word ov15_02200641
_021FC71C: .word ov15_02200642
_021FC720: .word ov15_02200643
_021FC724: .word 0x000005DC
_021FC728: .word 0x000005E4
_021FC72C:
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	mov r1, #0
	bl ov15_021FEF48
	ldr r1, _021FC780 ; =0x00000616
	add sp, #0x10
	strb r0, [r5, r1]
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #5
	add r0, #0x68
	strh r1, [r0]
	mov r0, #0xf
	pop {r4, r5, r6, pc}
_021FC75C:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #4
	add r0, #0x68
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #0x14
	mov r2, #0x29
	mov r3, #0x24
	bl ov15_021FD810
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FC778:
	mov r0, #0xe
_021FC77A:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021FC780: .word 0x00000616
	thumb_func_end ov15_021FC41C

	thumb_func_start ov15_021FC784
ov15_021FC784: ; 0x021FC784
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021FC7E0 ; =0x00000616
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021FC7DC
	ldr r0, _021FC7E4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _021FC7A6
	ldr r0, _021FC7E8 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021FC7DC
_021FC7A6:
	add r0, r4, #0
	add r0, #0x34
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r0, #0x34
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r3, [r4, r0]
	add r0, r4, #0
	add r1, r3, #0
	add r1, #0x64
	ldrb r2, [r1]
	mov r1, #0xc
	mul r1, r2
	add r1, r3, r1
	mov r2, #0xa
	ldrsh r1, [r1, r2]
	sub r2, #0xb
	mov r3, #0
	bl ov15_021FF364
	mov r0, #0xe
	pop {r4, pc}
_021FC7DC:
	mov r0, #0xf
	pop {r4, pc}
	.balign 4, 0
_021FC7E0: .word 0x00000616
_021FC7E4: .word gSystem
_021FC7E8: .word gSystem + 0x40
	thumb_func_end ov15_021FC784

	thumb_func_start ov15_021FC7EC
ov15_021FC7EC: ; 0x021FC7EC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _021FCAB0 ; =gSystem
	mov r2, #0x40
	ldr r3, [r1, #0x4c]
	add r5, r0, #0
	mov r4, #0
	tst r2, r3
	beq _021FC80E
	ldr r0, _021FCAB4 ; =0x00000644
	add r4, r4, #1
	ldr r1, [r5, r0]
	lsl r2, r1, #2
	ldr r1, _021FCAB8 ; =ov15_02200640
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	b _021FC9CA
_021FC80E:
	mov r2, #0x80
	tst r2, r3
	beq _021FC824
	ldr r0, _021FCAB4 ; =0x00000644
	add r4, r4, #1
	ldr r1, [r5, r0]
	lsl r2, r1, #2
	ldr r1, _021FCABC ; =ov15_02200641
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	b _021FC9CA
_021FC824:
	mov r2, #0x20
	add r6, r3, #0
	tst r6, r2
	beq _021FC87C
	ldr r1, _021FCAB4 ; =0x00000644
	ldr r3, _021FCAC0 ; =ov15_02200642
	ldr r1, [r5, r1]
	lsl r6, r1, #2
	ldrb r3, [r3, r6]
	cmp r3, #0xe
	bne _021FC854
	mov r1, #4
	str r1, [sp]
	mov r1, #0xe
	add r2, sp, #0xc
	mov r3, #1
	str r4, [sp, #4]
	bl ov15_021FA73C
	cmp r0, #1
	bne _021FC8A6
	add sp, #0x10
	mov r0, #0x10
	pop {r4, r5, r6, pc}
_021FC854:
	cmp r1, #0x10
	beq _021FC8B2
	cmp r1, #0
	blt _021FC874
	cmp r1, #8
	bge _021FC874
	sub r2, #0x21
	bl ov15_021FA6C0
	ldr r1, _021FCAB4 ; =0x00000644
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021FC8B2
	str r0, [r5, r1]
	add r4, r4, #1
	b _021FC9CA
_021FC874:
	ldr r0, _021FCAB4 ; =0x00000644
	add r4, r4, #1
	str r3, [r5, r0]
	b _021FC9CA
_021FC87C:
	mov r2, #0x10
	tst r3, r2
	beq _021FC8D8
	ldr r1, _021FCAB4 ; =0x00000644
	ldr r2, _021FCAC4 ; =ov15_02200643
	ldr r1, [r5, r1]
	lsl r3, r1, #2
	ldrb r2, [r2, r3]
	cmp r2, #0xf
	bne _021FC8AE
	mov r1, #4
	str r1, [sp]
	add r2, sp, #8
	mov r1, #0xf
	add r2, #3
	mov r3, #1
	str r4, [sp, #4]
	bl ov15_021FA73C
	cmp r0, #1
	beq _021FC8A8
_021FC8A6:
	b _021FCB5A
_021FC8A8:
	add sp, #0x10
	mov r0, #0x10
	pop {r4, r5, r6, pc}
_021FC8AE:
	cmp r1, #0x10
	bne _021FC8B4
_021FC8B2:
	b _021FC9CA
_021FC8B4:
	cmp r1, #0
	blt _021FC8D0
	cmp r1, #8
	bge _021FC8D0
	mov r2, #1
	bl ov15_021FA6C0
	ldr r1, _021FCAB4 ; =0x00000644
	ldr r2, [r5, r1]
	cmp r2, r0
	beq _021FC9CA
	str r0, [r5, r1]
	add r4, r4, #1
	b _021FC9CA
_021FC8D0:
	ldr r0, _021FCAB4 ; =0x00000644
	add r4, r4, #1
	str r2, [r5, r0]
	b _021FC9CA
_021FC8D8:
	ldr r3, [r1, #0x48]
	lsl r1, r2, #5
	tst r1, r3
	beq _021FC952
	ldr r1, _021FCAB4 ; =0x00000644
	ldr r1, [r5, r1]
	cmp r1, #0
	blt _021FC922
	cmp r1, #8
	bge _021FC922
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	sub r2, #0x11
	add r1, #0x64
	ldrb r1, [r1]
	bl ov15_021FA6C0
	ldr r1, _021FCAB4 ; =0x00000644
	str r0, [r5, r1]
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov15_021FFECC
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	str r0, [sp, #4]
	ldr r1, _021FCAB4 ; =0x00000644
	add r2, sp, #8
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r2, #2
	mov r3, #1
	bl ov15_021FA73C
	b _021FC94C
_021FC922:
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r2, #0
	add r1, #0x64
	ldrb r1, [r1]
	add r0, r5, #0
	mvn r2, r2
	bl ov15_021FA6C0
	add r1, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r0, #0
	add r2, sp, #8
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, #2
	mov r3, #1
	bl ov15_021FA73C
_021FC94C:
	add sp, #0x10
	mov r0, #0x10
	pop {r4, r5, r6, pc}
_021FC952:
	add r2, #0xf0
	add r1, r3, #0
	tst r1, r2
	beq _021FC9CA
	ldr r1, _021FCAB4 ; =0x00000644
	ldr r1, [r5, r1]
	cmp r1, #0
	blt _021FC99C
	cmp r1, #8
	bge _021FC99C
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r2, #1
	add r1, #0x64
	ldrb r1, [r1]
	bl ov15_021FA6C0
	ldr r1, _021FCAB4 ; =0x00000644
	str r0, [r5, r1]
	ldr r1, [r5, r1]
	add r0, r5, #0
	bl ov15_021FFECC
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	str r0, [sp, #4]
	ldr r1, _021FCAB4 ; =0x00000644
	add r2, sp, #8
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r2, #1
	mov r3, #1
	bl ov15_021FA73C
	b _021FC9C4
_021FC99C:
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r1, #0x64
	ldrb r1, [r1]
	mov r2, #1
	bl ov15_021FA6C0
	add r1, r0, #0
	mov r0, #4
	str r0, [sp]
	mov r0, #0
	add r2, sp, #8
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, #1
	mov r3, #1
	bl ov15_021FA73C
_021FC9C4:
	add sp, #0x10
	mov r0, #0x10
	pop {r4, r5, r6, pc}
_021FC9CA:
	ldr r1, _021FCAB4 ; =0x00000644
	ldr r0, [r5, r1]
	cmp r0, #0x11
	bne _021FC9DE
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x64
	ldrb r0, [r0]
	str r0, [r5, r1]
_021FC9DE:
	cmp r4, #0
	beq _021FCA02
	ldr r0, _021FCAC8 ; =0x000005DC
	bl PlaySE
	ldr r1, _021FCAB4 ; =0x00000644
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r1, _021FCAB4 ; =0x00000644
	add r0, r5, #0
	ldr r1, [r5, r1]
	bl ov15_021FA0E4
	add r0, r5, #0
	bl ov15_021FA170
_021FCA02:
	mov r1, #0
	add r0, sp, #8
	strb r1, [r0]
	add r0, r5, #0
	bl ov15_021FAC2C
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021FCA8A
	add r0, r5, #0
	add r1, r4, #0
	bl ov15_021FA104
	cmp r0, #0
	beq _021FCA64
	cmp r4, #8
	bhs _021FCA46
	add r0, r5, #0
	add r1, r4, #0
	bl ov15_021FA68C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021FCA64
	ldr r1, _021FCAB4 ; =0x00000644
	add r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	b _021FCA64
_021FCA46:
	ldr r1, _021FCAB4 ; =0x00000644
	add r0, r5, #0
	str r4, [r5, r1]
	ldr r1, [r5, r1]
	bl ov15_021FFECC
	ldr r0, _021FCAB4 ; =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FCA64
	cmp r1, #0xd
	bgt _021FCA64
	add r0, r5, #0
	bl ov15_021FA0E4
_021FCA64:
	mov r0, #4
	str r0, [sp]
	mov r3, #1
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #8
	str r3, [sp, #4]
	bl ov15_021FA73C
	cmp r0, #1
	beq _021FCB40
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r2, #5
	add r1, #0x68
	strh r2, [r1]
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FCA8A:
	ldr r0, _021FCAB0 ; =gSystem
	mov r3, #1
	ldr r1, [r0, #0x48]
	add r0, r1, #0
	tst r0, r3
	beq _021FCAF2
	mov r0, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r1, _021FCAB4 ; =0x00000644
	add r0, r5, #0
	ldr r1, [r5, r1]
	add r2, sp, #8
	bl ov15_021FA73C
	add r4, r0, #0
	ldr r0, _021FCAB4 ; =0x00000644
	b _021FCACC
	.balign 4, 0
_021FCAB0: .word gSystem
_021FCAB4: .word 0x00000644
_021FCAB8: .word ov15_02200640
_021FCABC: .word ov15_02200641
_021FCAC0: .word ov15_02200642
_021FCAC4: .word ov15_02200643
_021FCAC8: .word 0x000005DC
_021FCACC:
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FCADC
	cmp r1, #0xd
	bgt _021FCADC
	add r0, r5, #0
	bl ov15_021FA0E4
_021FCADC:
	cmp r4, #1
	beq _021FCB40
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #5
	add r0, #0x68
	strh r1, [r0]
	add sp, #0x10
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_021FCAF2:
	mov r0, #2
	tst r0, r1
	beq _021FCB40
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	mov r1, #0
	add r2, #0x66
	strh r1, [r2]
	ldr r0, [r5, r0]
	mov r2, #5
	add r0, #0x68
	strh r2, [r0]
	add r0, r5, #0
	bl ov15_021FD774
	mov r0, #SEQ_SE_GS_GEARCANCEL>>6
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _021FCB60 ; =0x00000644
	ldr r1, [r5, r0]
	cmp r1, #8
	blt _021FCB2C
	cmp r1, #0xd
	bgt _021FCB2C
	add r0, r5, #0
	bl ov15_021FA0E4
_021FCB2C:
	mov r0, #0x24
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x13
	mov r2, #9
	mov r3, #8
	bl ov15_021FD7D0
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FCB40:
	add r0, sp, #8
	ldrb r0, [r0]
	cmp r0, #1
	bne _021FCB58
	add r0, r5, #0
	mov r1, #0x14
	mov r2, #0x29
	mov r3, #0x22
	bl ov15_021FD810
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021FCB58:
	mov r0, #0x10
_021FCB5A:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021FCB60: .word 0x00000644
	thumb_func_end ov15_021FC7EC

	thumb_func_start ov15_021FCB64
ov15_021FCB64: ; 0x021FCB64
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #0x8d
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	add r3, r1, #4
	add r1, #0x64
	ldrb r2, [r1]
	mov r1, #0xc
	mul r1, r2
	add r5, r3, r1
	mov r2, #0
	mov r1, #4
	add r3, r2, #0
	bl ov15_021FD574
	mov r0, #0x1a
	mov r1, #1
	lsl r0, r0, #6
	strh r1, [r4, r0]
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r0, #0x66
	ldrh r0, [r0]
	mov r2, #6
	bl GetItemAttr
	asr r1, r0, #1
	ldr r0, _021FCD70 ; =0x00000684
	mov r2, #0
	str r1, [r4, r0]
	ldr r0, [r4]
	mov r1, #5
	bl ov15_021FD43C
	ldr r0, [r4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0xa5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
	add r0, r4, #0
	mov r1, #0
	bl ov15_02200458
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FD788
	ldr r2, _021FCD74 ; =0x00000644
	mov r1, #6
	ldr r2, [r4, r2]
	ldrsh r1, [r5, r1]
	add r0, r4, #0
	sub r2, #8
	bl ov15_021FF4EC
	ldr r1, _021FCD74 ; =0x00000644
	add r0, r4, #0
	ldr r1, [r4, r1]
	sub r1, #8
	bl ov15_022002B4
	mov r2, #0x8d
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	add r0, r4, #0
	add r2, #0x66
	ldrh r2, [r2]
	add r1, r4, #4
	bl ov15_021FECA0
	add r0, r4, #0
	bl ov15_021FFF24
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	add r0, #0x66
	ldrh r0, [r0]
	mov r2, #6
	bl GetItemAttr
	cmp r0, #0
	bne _021FCC32
	ldr r0, _021FCD70 ; =0x00000684
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021FCC7C
_021FCC32:
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x4c
	bl NewString_ReadMsgData
	mov r2, #0xbd
	lsl r2, r2, #2
	add r5, r0, #0
	ldr r0, [r4, r2]
	sub r2, #0xc0
	ldr r2, [r4, r2]
	mov r1, #0
	add r2, #0x66
	ldrh r2, [r2]
	bl BufferItemName
	mov r0, #0xbd
	ldr r1, _021FCD78 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FEF48
	ldr r1, _021FCD7C ; =0x00000616
	add sp, #8
	strb r0, [r4, r1]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_021FCC7C:
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FF0FC
	add r0, r4, #0
	bl ov15_021FF068
	add r0, r4, #0
	mov r1, #2
	bl ov15_021FEDEC
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	mov r3, #6
	add r0, r2, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r1, r2, r0
	add r2, #0x66
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0xd]
	ldrh r2, [r2]
	bl Pocket_GetQuantity
	cmp r0, #1
	bne _021FCD0C
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x4e
	bl NewString_ReadMsgData
	mov r1, #0
	add r5, r0, #0
	mov r2, #0x1a
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	lsl r2, r2, #6
	mov r0, #0xbd
	ldrsh r3, [r4, r2]
	add r2, r2, #4
	lsl r0, r0, #2
	ldr r2, [r4, r2]
	ldr r0, [r4, r0]
	mul r2, r3
	mov r3, #6
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FCD78 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	add r0, r4, #0
	mov r1, #1
	bl ov15_021FEF48
	ldr r1, _021FCD7C ; =0x00000616
	add sp, #8
	strb r0, [r4, r1]
	mov r0, #0x15
	pop {r3, r4, r5, pc}
_021FCD0C:
	mov r1, #6
	ldrsh r3, [r5, r1]
	ldr r1, _021FCD74 ; =0x00000644
	ldr r0, [r5]
	ldr r2, [r4, r1]
	add r1, #0x3e
	add r2, r3, r2
	sub r2, #8
	lsl r2, r2, #2
	add r0, r0, r2
	ldrh r0, [r0, #2]
	strh r0, [r4, r1]
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x4d
	bl NewString_ReadMsgData
	mov r2, #0xbd
	lsl r2, r2, #2
	add r5, r0, #0
	ldr r0, [r4, r2]
	sub r2, #0xc0
	ldr r2, [r4, r2]
	mov r1, #0
	add r2, #0x66
	ldrh r2, [r2]
	bl BufferItemName
	mov r0, #0xbd
	ldr r1, _021FCD78 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	add r0, r4, #0
	mov r1, #1
	bl ov15_021FEF48
	ldr r1, _021FCD7C ; =0x00000616
	strb r0, [r4, r1]
	mov r0, #0x11
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021FCD70: .word 0x00000684
_021FCD74: .word 0x00000644
_021FCD78: .word 0x000005E4
_021FCD7C: .word 0x00000616
	thumb_func_end ov15_021FCB64

	thumb_func_start ov15_021FCD80
ov15_021FCD80: ; 0x021FCD80
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021FCDDC ; =0x00000616
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021FCDD6
	ldr r0, _021FCDE0 ; =0x00000682
	ldrh r1, [r4, r0]
	cmp r1, #0x63
	bls _021FCD9C
	mov r1, #0x63
	strh r1, [r4, r0]
_021FCD9C:
	mov r2, #0
	add r0, r4, #0
	mov r1, #4
	add r3, r2, #0
	bl ov15_021FD574
	ldr r2, _021FCDE0 ; =0x00000682
	add r0, r4, #0
	ldrh r2, [r4, r2]
	mov r1, #2
	bl ov15_02200300
	add r0, r4, #0
	bl ov15_021FF7FC
	add r0, r4, #0
	mov r1, #1
	bl ov15_021FF29C
	add r0, r4, #0
	mov r1, #1
	bl ov15_022004DC
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FFFDC
	mov r0, #0x12
	pop {r4, pc}
_021FCDD6:
	mov r0, #0x11
	pop {r4, pc}
	nop
_021FCDDC: .word 0x00000616
_021FCDE0: .word 0x00000682
	thumb_func_end ov15_021FCD80

	thumb_func_start ov15_021FCDE4
ov15_021FCDE4: ; 0x021FCDE4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r5, #0
	mov r1, #4
	add r4, r0, #0
	bl ov15_021FAC2C
	add r6, r0, #0
	sub r0, r5, #1
	cmp r6, r0
	bne _021FCDFC
	b _021FCF06
_021FCDFC:
	ldr r0, _021FCFB8 ; =0x00000682
	ldrh r0, [r4, r0]
	bl ov15_022002EC
	cmp r0, #2
	bne _021FCE14
	cmp r6, #0
	beq _021FCE10
	cmp r6, #2
	bne _021FCE14
_021FCE10:
	mov r6, #0
	mvn r6, r6
_021FCE14:
	cmp r6, #5
	bls _021FCE1A
	b _021FCF2E
_021FCE1A:
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FCE26: ; jump table
	.short _021FCE32 - _021FCE26 - 2 ; case 0
	.short _021FCE64 - _021FCE26 - 2 ; case 1
	.short _021FCE96 - _021FCE26 - 2 ; case 2
	.short _021FCECA - _021FCE26 - 2 ; case 3
	.short _021FCEFE - _021FCE26 - 2 ; case 4
	.short _021FCF02 - _021FCE26 - 2 ; case 5
_021FCE32:
	mov r1, #0x1a
	lsl r1, r1, #6
	ldrsh r0, [r4, r1]
	add r1, r1, #2
	ldrh r1, [r4, r1]
	mov r2, #0xa
	bl ov15_021FBD28
	mov r1, #0x1a
	lsl r1, r1, #6
	strh r0, [r4, r1]
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x1a
	bl sub_0200DC4C
	mov r5, #1
	b _021FCF2E
_021FCE64:
	mov r1, #0x1a
	lsl r1, r1, #6
	ldrsh r0, [r4, r1]
	add r1, r1, #2
	ldrh r1, [r4, r1]
	mov r2, #1
	bl ov15_021FBD28
	mov r1, #0x1a
	lsl r1, r1, #6
	strh r0, [r4, r1]
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x1a
	bl sub_0200DC4C
	mov r5, #1
	b _021FCF2E
_021FCE96:
	mov r1, #0x1a
	lsl r1, r1, #6
	ldrsh r0, [r4, r1]
	add r1, r1, #2
	mov r2, #9
	ldrh r1, [r4, r1]
	mvn r2, r2
	bl ov15_021FBD28
	mov r1, #0x1a
	lsl r1, r1, #6
	strh r0, [r4, r1]
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x1c
	bl sub_0200DC4C
	mov r5, #2
	b _021FCF2E
_021FCECA:
	mov r1, #0x1a
	lsl r1, r1, #6
	ldrsh r0, [r4, r1]
	add r1, r1, #2
	mov r2, #0
	ldrh r1, [r4, r1]
	mvn r2, r2
	bl ov15_021FBD28
	mov r1, #0x1a
	lsl r1, r1, #6
	strh r0, [r4, r1]
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0x2e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x1c
	bl sub_0200DC4C
	mov r5, #2
	b _021FCF2E
_021FCEFE:
	mov r5, #3
	b _021FCF2E
_021FCF02:
	mov r5, #4
	b _021FCF2E
_021FCF06:
	mov r1, #0x1a
	lsl r1, r1, #6
	add r0, r4, r1
	add r1, r1, #2
	ldrh r1, [r4, r1]
	bl sub_020881C0
	add r5, r0, #0
	bne _021FCF2E
	ldr r0, _021FCFBC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _021FCF26
	mov r5, #3
	b _021FCF2E
_021FCF26:
	mov r0, #2
	tst r0, r1
	beq _021FCF2E
	mov r5, #4
_021FCF2E:
	cmp r5, #4
	bhi _021FCFB2
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FCF3E: ; jump table
	.short _021FCFB2 - _021FCF3E - 2 ; case 0
	.short _021FCF48 - _021FCF3E - 2 ; case 1
	.short _021FCF62 - _021FCF3E - 2 ; case 2
	.short _021FCF7C - _021FCF3E - 2 ; case 3
	.short _021FCF96 - _021FCF3E - 2 ; case 4
_021FCF48:
	add r0, r4, #0
	bl ov15_021FF068
	add r0, r4, #0
	mov r1, #2
	bl ov15_021FEDEC
	ldr r0, _021FCFC0 ; =0x00000637
	bl PlaySE
	add sp, #4
	mov r0, #0x12
	pop {r3, r4, r5, r6, pc}
_021FCF62:
	add r0, r4, #0
	bl ov15_021FF068
	add r0, r4, #0
	mov r1, #2
	bl ov15_021FEDEC
	ldr r0, _021FCFC0 ; =0x00000637
	bl PlaySE
	add sp, #4
	mov r0, #0x12
	pop {r3, r4, r5, r6, pc}
_021FCF7C:
	ldr r0, _021FCFC4 ; =0x000005DC
	bl PlaySE
	mov r0, #0x13
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x26
	mov r2, #9
	mov r3, #8
	bl ov15_021FD7D0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021FCF96:
	mov r0, #SEQ_SE_GS_GEARCANCEL>>6
	lsl r0, r0, #6
	bl PlaySE
	mov r0, #0x14
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x13
	mov r2, #9
	mov r3, #8
	bl ov15_021FD7D0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_021FCFB2:
	mov r0, #0x12
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021FCFB8: .word 0x00000682
_021FCFBC: .word gSystem
_021FCFC0: .word 0x00000637
_021FCFC4: .word 0x000005DC
	thumb_func_end ov15_021FCDE4

	thumb_func_start ov15_021FCFC8
ov15_021FCFC8: ; 0x021FCFC8
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x44
	mov r1, #1
	bl sub_0200E5D4
	add r0, r5, #0
	bl ov15_021FF834
	add r0, r5, #0
	add r0, #0x34
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x4e
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	mov r2, #0x1a
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	lsl r2, r2, #6
	mov r0, #0xbd
	ldrsh r3, [r5, r2]
	add r2, r2, #4
	lsl r0, r0, #2
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	mul r2, r3
	mov r3, #6
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FD050 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	mov r1, #1
	bl ov15_021FEF48
	ldr r1, _021FD054 ; =0x00000616
	strb r0, [r5, r1]
	add r0, r5, #0
	bl ov15_02200428
	add r0, r5, #0
	bl ov15_021FFF24
	add r0, r5, #0
	mov r1, #0
	bl ov15_021FD788
	mov r0, #0x15
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FD050: .word 0x000005E4
_021FD054: .word 0x00000616
	thumb_func_end ov15_021FCFC8

	thumb_func_start ov15_021FD058
ov15_021FD058: ; 0x021FD058
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021FD0E4 ; =0x00000684
	mov r1, #0
	str r1, [r5, r0]
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl sub_0200E5D4
	add r0, r5, #0
	add r0, #0x44
	mov r1, #1
	bl sub_0200E5D4
	add r0, r5, #0
	add r0, #0x34
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r0, #0x34
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #4
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl ov15_02200428
	add r0, r5, #0
	bl ov15_021FFF24
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r0, r5, #0
	bl ov15_021FA074
	add r1, r4, #4
	add r4, #0x64
	add r2, r0, #0
	ldrb r4, [r4]
	mov r3, #0xc
	add r0, r5, #0
	mul r3, r4
	add r1, r1, r3
	mov r3, #0
	bl ov15_02200140
	add r0, r5, #0
	bl ov15_021FE868
	add r0, r5, #0
	bl ov15_021FED3C
	add r0, r5, #0
	bl ov15_021FB518
	add r0, r5, #0
	mov r1, #1
	bl ov15_02200458
	add r0, r5, #0
	mov r1, #1
	bl ov15_021FD788
	mov r0, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FD0E4: .word 0x00000684
	thumb_func_end ov15_021FD058

	thumb_func_start ov15_021FD0E8
ov15_021FD0E8: ; 0x021FD0E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021FD108 ; =0x00000616
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021FD102
	add r0, r4, #0
	bl ov15_021FF004
	mov r0, #0x16
	pop {r4, pc}
_021FD102:
	mov r0, #0x15
	pop {r4, pc}
	nop
_021FD108: .word 0x00000616
	thumb_func_end ov15_021FD0E8

	thumb_func_start ov15_021FD10C
ov15_021FD10C: ; 0x021FD10C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _021FD23C ; =0x00000804
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _021FD12A
	cmp r0, #2
	beq _021FD1BA
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	b _021FD234
_021FD12A:
	add r0, r4, #0
	bl ov15_021FF058
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x4f
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r0, #0x1a
	lsl r0, r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, #1
	ble _021FD15E
	mov r2, #0xbd
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	sub r2, #0xc0
	ldr r2, [r4, r2]
	mov r1, #0
	add r2, #0x66
	ldrh r2, [r2]
	bl BufferItemNamePlural
	b _021FD172
_021FD15E:
	mov r2, #0xbd
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	sub r2, #0xc0
	ldr r2, [r4, r2]
	mov r1, #0
	add r2, #0x66
	ldrh r2, [r2]
	bl BufferItemName
_021FD172:
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	mov r2, #0x1a
	mov r0, #0xbd
	str r1, [sp, #4]
	lsl r2, r2, #6
	ldrsh r3, [r4, r2]
	add r2, r2, #4
	lsl r0, r0, #2
	ldr r2, [r4, r2]
	ldr r0, [r4, r0]
	mul r2, r3
	mov r3, #6
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FD240 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FEF48
	ldr r1, _021FD244 ; =0x00000616
	add sp, #8
	strb r0, [r4, r1]
	mov r0, #0x17
	pop {r3, r4, r5, pc}
_021FD1BA:
	add r0, r4, #0
	bl ov15_021FF058
	ldr r0, _021FD248 ; =0x00000684
	mov r1, #0
	str r1, [r4, r0]
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl sub_0200E5D4
	add r0, r4, #0
	add r0, #0x34
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r0, #0x34
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #4
	bl ScheduleWindowCopyToVram
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r5, [r4, r0]
	add r0, r4, #0
	bl ov15_021FA074
	add r1, r5, #4
	add r5, #0x64
	add r2, r0, #0
	ldrb r5, [r5]
	mov r3, #0xc
	add r0, r4, #0
	mul r3, r5
	add r1, r1, r3
	mov r3, #0
	bl ov15_02200140
	add r0, r4, #0
	bl ov15_021FE868
	add r0, r4, #0
	bl ov15_021FED3C
	add r0, r4, #0
	bl ov15_021FB518
	add r0, r4, #0
	mov r1, #1
	bl ov15_02200458
	add r0, r4, #0
	mov r1, #1
	bl ov15_021FD788
	add sp, #8
	mov r0, #0x10
	pop {r3, r4, r5, pc}
_021FD234:
	mov r0, #0x16
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021FD23C: .word 0x00000804
_021FD240: .word 0x000005E4
_021FD244: .word 0x00000616
_021FD248: .word 0x00000684
	thumb_func_end ov15_021FD10C

	thumb_func_start ov15_021FD24C
ov15_021FD24C: ; 0x021FD24C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, _021FD2F4 ; =0x00000616
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _021FD264
	add sp, #4
	mov r0, #0x17
	pop {r3, r4, pc}
_021FD264:
	ldr r0, _021FD2F8 ; =0x00000643
	bl PlaySE
	mov r1, #0x1a
	lsl r1, r1, #6
	mov r0, #0x8f
	ldrsh r2, [r4, r1]
	add r1, r1, #4
	lsl r0, r0, #2
	ldr r1, [r4, r1]
	ldr r0, [r4, r0]
	mul r1, r2
	bl PlayerProfile_AddMoney
	mov r0, #0x1a
	lsl r0, r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, #1
	bne _021FD2A8
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x75
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _021FD2B4
	add r0, r1, #0
	add r0, #0x75
	ldrb r0, [r0]
	add r1, #0x75
	add r0, r0, #1
	strb r0, [r1]
	b _021FD2B4
_021FD2A8:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	add r0, #0x75
	strb r1, [r0]
_021FD2B4:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	add r0, r2, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	add r3, r1, #0
	mul r3, r0
	add r1, r2, r3
	mov r0, #6
	mov r3, #0x1a
	str r0, [sp]
	add r2, #0x66
	lsl r3, r3, #6
	ldr r0, [r1, #4]
	ldrb r1, [r1, #0xd]
	ldrh r2, [r2]
	ldrh r3, [r4, r3]
	bl Pocket_TakeItem
	add r0, r4, #0
	bl ov15_021F9F08
	add r4, #0x34
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	mov r0, #0x18
	add sp, #4
	pop {r3, r4, pc}
	nop
_021FD2F4: .word 0x00000616
_021FD2F8: .word 0x00000643
	thumb_func_end ov15_021FD24C

	thumb_func_start ov15_021FD2FC
ov15_021FD2FC: ; 0x021FD2FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021FD39C ; =0x00000616
	ldrb r0, [r5, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021FD396
	ldr r0, _021FD3A0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _021FD31E
	ldr r0, _021FD3A4 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _021FD396
_021FD31E:
	ldr r0, _021FD3A8 ; =0x00000684
	mov r1, #0
	str r1, [r5, r0]
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl sub_0200E5D4
	add r0, r5, #0
	add r0, #0x34
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r0, #0x34
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r5, #4
	bl ScheduleWindowCopyToVram
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	add r0, r5, #0
	bl ov15_021FA074
	add r1, r4, #4
	add r4, #0x64
	add r2, r0, #0
	ldrb r4, [r4]
	mov r3, #0xc
	add r0, r5, #0
	mul r3, r4
	add r1, r1, r3
	mov r3, #1
	bl ov15_02200140
	add r0, r5, #0
	bl ov15_021FE868
	add r0, r5, #0
	bl ov15_021FED3C
	add r0, r5, #0
	bl ov15_021FB518
	add r0, r5, #0
	bl ov15_021FA170
	add r0, r5, #0
	mov r1, #1
	bl ov15_02200458
	add r0, r5, #0
	mov r1, #1
	bl ov15_021FD788
	mov r0, #0x10
	pop {r3, r4, r5, pc}
_021FD396:
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_021FD39C: .word 0x00000616
_021FD3A0: .word gSystem
_021FD3A4: .word gSystem + 0x40
_021FD3A8: .word 0x00000684
	thumb_func_end ov15_021FD2FC

	thumb_func_start ov15_021FD3AC
ov15_021FD3AC: ; 0x021FD3AC
	push {r3, lr}
	bl ov15_021FA650
	cmp r0, #1
	bne _021FD3BA
	mov r0, #2
	pop {r3, pc}
_021FD3BA:
	mov r0, #0x1a
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov15_021FD3AC

	thumb_func_start ov15_021FD3C0
ov15_021FD3C0: ; 0x021FD3C0
	push {r4, lr}
	add r4, r0, #0
	bl ov15_021FED3C
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FD788
	add r0, r4, #0
	bl ov15_021FFF24
	mov r0, #1
	mov r1, #6
	bl sub_020880CC
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #4
	add r0, #0x68
	strh r1, [r0]
	mov r0, #0x25
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov15_021FD3C0

	thumb_func_start ov15_021FD3F0
ov15_021FD3F0: ; 0x021FD3F0
	cmp r0, #4
	beq _021FD3FC
	cmp r1, #0x5f
	blo _021FD400
	cmp r1, #0x63
	bhs _021FD400
_021FD3FC:
	mov r0, #1
	bx lr
_021FD400:
	mov r0, #0
	bx lr
	thumb_func_end ov15_021FD3F0

	thumb_func_start ov15_021FD404
ov15_021FD404: ; 0x021FD404
	push {r3, r4, r5, lr}
	lsl r1, r1, #2
	add r1, r0, r1
	ldr r0, _021FD438 ; =0x00000694
	cmp r2, #7
	ldr r0, [r1, r0]
	ldr r5, [r0, #0xc]
	bgt _021FD434
	lsl r4, r2, #5
	add r0, r5, r4
	mov r1, #0
	mov r2, #0x20
	bl GXS_LoadBGPltt
	add r0, r5, r4
	mov r1, #0x20
	mov r2, #0x40
	bl GXS_LoadBGPltt
	add r0, r5, r4
	mov r1, #0x60
	mov r2, #0x20
	bl GXS_LoadBGPltt
_021FD434:
	pop {r3, r4, r5, pc}
	nop
_021FD438: .word 0x00000694
	thumb_func_end ov15_021FD404

	thumb_func_start ov15_021FD43C
ov15_021FD43C: ; 0x021FD43C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r6, r0, #0
	add r4, r2, #0
	bl GetBgTilemapBuffer
	str r0, [sp, #0x14]
	cmp r4, #6
	beq _021FD4B6
	ldr r1, _021FD4BC ; =ov15_022013A8
	lsl r0, r4, #5
	add r5, r1, r0
	ldr r0, [sp, #0x10]
	mov r7, #0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_021FD462:
	ldrb r0, [r5]
	cmp r0, #1
	bne _021FD48E
	ldrb r0, [r5, #4]
	add r1, r4, #0
	str r0, [sp]
	ldrb r0, [r5, #5]
	str r0, [sp, #4]
	ldrb r0, [r5, #6]
	str r0, [sp, #8]
	ldrb r3, [r5, #2]
	ldrb r2, [r5, #1]
	add r0, r6, #0
	lsl r3, r3, #5
	add r2, r2, r3
	lsl r3, r2, #1
	ldr r2, [sp, #0x14]
	add r2, r2, r3
	ldrb r3, [r5, #3]
	bl LoadRectToBgTilemapRect
	b _021FD4AE
_021FD48E:
	cmp r0, #2
	bne _021FD4AE
	ldrb r0, [r5, #4]
	add r1, r4, #0
	mov r2, #0
	str r0, [sp]
	ldrb r0, [r5, #5]
	str r0, [sp, #4]
	ldrb r0, [r5, #6]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r5, #3]
	add r0, r6, #0
	bl FillBgTilemapRect
_021FD4AE:
	add r7, r7, #1
	add r5, #8
	cmp r7, #4
	blt _021FD462
_021FD4B6:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FD4BC: .word ov15_022013A8
	thumb_func_end ov15_021FD43C

	thumb_func_start ov15_021FD4C0
ov15_021FD4C0: ; 0x021FD4C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r1, [sp, #0x10]
	lsl r1, r1, #0x18
	add r5, r2, #0
	lsr r1, r1, #0x18
	add r6, r0, #0
	str r3, [sp, #0x14]
	bl GetBgTilemapBuffer
	str r0, [sp, #0x18]
	sub r0, r5, #1
	ldr r1, _021FD56C ; =ov15_02201340
	lsl r0, r0, #3
	add r5, r1, r0
	ldr r0, [sp, #0x10]
	mov r4, #0
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
_021FD4E6:
	ldrb r0, [r5, #1]
	add r1, r7, #0
	mov r2, #0
	str r0, [sp]
	ldrb r0, [r5, #2]
	str r0, [sp, #4]
	ldrb r0, [r5, #3]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r5]
	add r0, r6, #0
	bl FillBgTilemapRect
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _021FD4E6
	mov r1, #0
	ldr r0, [sp, #0x14]
	mvn r1, r1
	cmp r0, r1
	beq _021FD566
	ldr r1, _021FD570 ; =ov15_02201328
	lsl r0, r0, #2
	add r3, r1, r0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	ldrb r0, [r3, #1]
	bhi _021FD546
	str r0, [sp]
	ldrb r0, [r3, #2]
	ldr r1, [sp, #0x10]
	mov r4, #6
	str r0, [sp, #4]
	ldrb r0, [r3, #3]
	lsl r1, r1, #0x18
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	lsl r4, r4, #8
	ldrb r3, [r3]
	add r0, r6, #0
	lsr r1, r1, #0x18
	add r2, r2, r4
	bl LoadRectToBgTilemapRect
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_021FD546:
	str r0, [sp]
	ldrb r0, [r3, #2]
	ldr r1, [sp, #0x10]
	mov r4, #0x1b
	str r0, [sp, #4]
	ldrb r0, [r3, #3]
	lsl r1, r1, #0x18
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	lsl r4, r4, #6
	ldrb r3, [r3]
	add r0, r6, #0
	lsr r1, r1, #0x18
	add r2, r2, r4
	bl LoadRectToBgTilemapRect
_021FD566:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021FD56C: .word ov15_02201340
_021FD570: .word ov15_02201328
	thumb_func_end ov15_021FD4C0

	thumb_func_start ov15_021FD574
ov15_021FD574: ; 0x021FD574
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r5, #4
	bls _021FD588
	bl GF_AssertFail
_021FD588:
	cmp r5, #4
	bls _021FD58E
	b _021FD770
_021FD58E:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FD59A: ; jump table
	.short _021FD5A4 - _021FD59A - 2 ; case 0
	.short _021FD62E - _021FD59A - 2 ; case 1
	.short _021FD6C6 - _021FD59A - 2 ; case 2
	.short _021FD70C - _021FD59A - 2 ; case 3
	.short _021FD740 - _021FD59A - 2 ; case 4
_021FD5A4:
	mov r0, #6
	str r0, [sp]
	mov r0, #0xf
	mov r1, #0x2b
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	mov r1, #5
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4]
	mov r1, #5
	bl GetBgTilemapBuffer
	ldr r1, [sp, #4]
	ldr r1, [r1, #8]
	bl DC_FlushRange
	ldr r0, [r4]
	mov r1, #5
	add r2, r6, #0
	bl ov15_021FD43C
	ldr r0, [r4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #6
	str r0, [sp]
	mov r0, #0xf
	mov r1, #0x27
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl FreeToHeap
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov15_0220005C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021FD62E:
	mov r0, #6
	str r0, [sp]
	mov r0, #0xf
	mov r1, #0x2c
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	mov r1, #5
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4]
	mov r1, #5
	bl GetBgTilemapBuffer
	ldr r1, [sp, #4]
	ldr r1, [r1, #8]
	bl DC_FlushRange
	ldr r0, [r4]
	mov r1, #5
	add r2, r6, #0
	add r3, r7, #0
	bl ov15_021FD4C0
	ldr r0, [r4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #6
	str r0, [sp]
	mov r0, #0xf
	mov r1, #0x2a
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	bl ov15_02200294
	add r0, r4, #0
	bl ov15_021FA098
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0
	bl ov15_0220005C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021FD6C6:
	mov r0, #6
	str r0, [sp]
	mov r0, #0xf
	mov r1, #0x2d
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [r4]
	mov r1, #5
	add r2, r6, #0
	bl ov15_021FD43C
	ldr r0, [r4]
	mov r1, #5
	bl ScheduleBgTilemapBufferTransfer
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021FD70C:
	mov r0, #6
	str r0, [sp]
	mov r0, #0xf
	mov r1, #0x34
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021FD740:
	mov r0, #6
	str r0, [sp]
	mov r0, #0xf
	mov r1, #0x35
	mov r2, #0
	add r3, sp, #4
	bl GfGfxLoader_GetScrnData
	ldr r3, [sp, #4]
	add r5, r0, #0
	add r2, r3, #0
	ldr r0, [r4]
	ldr r3, [r3, #8]
	mov r1, #6
	add r2, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4]
	mov r1, #6
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	bl FreeToHeap
_021FD770:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_021FD574

	thumb_func_start ov15_021FD774
ov15_021FD774: ; 0x021FD774
	push {r3, lr}
	mov r2, #0x8d
	lsl r2, r2, #2
	ldr r0, [r0, r2]
	ldr r0, [r0, #0x78]
	cmp r0, #0
	beq _021FD786
	bl sub_02018410
_021FD786:
	pop {r3, pc}
	thumb_func_end ov15_021FD774

	thumb_func_start ov15_021FD788
ov15_021FD788: ; 0x021FD788
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #1
	bne _021FD7C0
	mov r1, #1
	bl ov15_022004DC
	add r0, r4, #0
	mov r1, #0
	bl ov15_021FF29C
	add r0, r4, #0
	add r0, #0x74
	bl ScheduleWindowCopyToVram
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x10
	bl sub_0200DC4C
	pop {r4, pc}
_021FD7C0:
	mov r1, #0
	bl ov15_022004DC
	add r0, r4, #0
	bl ov15_021FF844
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov15_021FD788

	thumb_func_start ov15_021FD7D0
ov15_021FD7D0: ; 0x021FD7D0
	push {r4, r5}
	mov r4, #0x25
	lsl r4, r4, #6
	add r0, r0, r4
	mov r4, #0
	strb r4, [r0, #2]
	strb r1, [r0]
	ldrb r5, [r0, #1]
	mov r4, #0xf
	mov r1, #0xf
	and r1, r2
	bic r5, r4
	orr r1, r5
	strb r1, [r0, #1]
	lsl r2, r3, #0x1c
	ldrb r5, [r0, #1]
	mov r1, #0xf0
	lsr r2, r2, #0x18
	bic r5, r1
	orr r2, r5
	strb r2, [r0, #1]
	ldr r2, [sp, #8]
	str r2, [r0, #4]
	ldrb r2, [r0, #3]
	bic r2, r4
	strb r2, [r0, #3]
	ldrb r2, [r0, #3]
	bic r2, r1
	strb r2, [r0, #3]
	mov r0, #0x23
	pop {r4, r5}
	bx lr
	thumb_func_end ov15_021FD7D0

	thumb_func_start ov15_021FD810
ov15_021FD810: ; 0x021FD810
	push {r4, r5, r6, lr}
	add r6, r2, #0
	mov r2, #0x25
	add r4, r0, #0
	lsl r2, r2, #6
	add r0, r4, r2
	mov r5, #1
	strb r5, [r0, #2]
	strb r1, [r0]
	str r3, [r0, #4]
	ldrb r5, [r0, #3]
	mov r3, #0xf
	bic r5, r3
	strb r5, [r0, #3]
	ldrb r5, [r0, #3]
	mov r3, #0xf0
	bic r5, r3
	strb r5, [r0, #3]
	lsr r0, r2, #2
	add r5, r4, r0
	lsl r4, r1, #2
	ldr r0, [r5, r4]
	mov r1, #0
	bl sub_0200DCC0
	ldr r0, [r5, r4]
	add r1, r6, #0
	bl sub_0200DC4C
	mov r0, #0x23
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov15_021FD810

	thumb_func_start ov15_021FD850
ov15_021FD850: ; 0x021FD850
	push {r3, r4, r5, lr}
	mov r5, #0x25
	lsl r5, r5, #6
	add r4, r0, r5
	ldrb r1, [r4, #2]
	cmp r1, #1
	bne _021FD874
	ldrb r1, [r4]
	lsl r1, r1, #2
	add r1, r0, r1
	lsr r0, r5, #2
	ldr r0, [r1, r0]
	bl sub_0200DCA0
	cmp r0, #0
	bne _021FD936
	ldr r0, [r4, #4]
	pop {r3, r4, r5, pc}
_021FD874:
	ldrb r2, [r4, #3]
	lsl r1, r2, #0x1c
	lsr r1, r1, #0x1c
	beq _021FD886
	cmp r1, #1
	beq _021FD8B6
	cmp r1, #2
	beq _021FD910
	b _021FD936
_021FD886:
	ldrb r1, [r4]
	lsl r1, r1, #2
	add r1, r0, r1
	lsr r0, r5, #2
	ldr r0, [r1, r0]
	ldrb r1, [r4, #1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bl sub_0200DD10
	ldrb r2, [r4, #3]
	mov r1, #0xf
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1c
	lsr r1, r1, #0x1c
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0xf
	and r1, r2
	orr r0, r1
	strb r0, [r4, #3]
	b _021FD936
_021FD8B6:
	add r1, r2, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1c
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #0xf0
	lsl r2, r2, #0x1c
	bic r1, r3
	lsr r2, r2, #0x18
	orr r1, r2
	strb r1, [r4, #3]
	ldrb r1, [r4, #3]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	cmp r1, #4
	bne _021FD936
	ldrb r1, [r4]
	lsl r1, r1, #2
	add r1, r0, r1
	lsr r0, r5, #2
	ldr r0, [r1, r0]
	ldrb r1, [r4, #1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	bl sub_0200DD10
	ldrb r1, [r4, #3]
	mov r0, #0xf0
	bic r1, r0
	strb r1, [r4, #3]
	ldrb r2, [r4, #3]
	mov r1, #0xf
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x1c
	lsr r1, r1, #0x1c
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0xf
	and r1, r2
	orr r0, r1
	strb r0, [r4, #3]
	b _021FD936
_021FD910:
	mov r1, #0xf0
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x1c
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #2
	bne _021FD936
	ldr r0, [r4, #4]
	pop {r3, r4, r5, pc}
_021FD936:
	mov r0, #0x23
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov15_021FD850

	thumb_func_start ov15_021FD93C
ov15_021FD93C: ; 0x021FD93C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #6
	bl sub_0201F590
	ldr r2, _021FDA94 ; =0x04000060
	ldr r0, _021FDA98 ; =0xFFFFCFFF
	ldrh r1, [r2]
	and r1, r0
	mov r0, #0x10
	orr r0, r1
	strh r0, [r2]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _021FDA9C ; =0x00007FFF
	add r1, r0, #0
	add r3, r0, #0
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r0, _021FDAA0 ; =0x00003DEF
	ldr r1, _021FDAA4 ; =0x0000294A
	mov r2, #0
	bl NNS_G3dGlbMaterialColorDiffAmb
	ldr r0, _021FDAA0 ; =0x00003DEF
	mov r2, #0
	add r1, r0, #0
	bl NNS_G3dGlbMaterialColorSpecEmi
	mov r0, #0x1f
	mov r1, #0
	str r0, [sp]
	mov r0, #0xf
	mov r2, #3
	add r3, r1, #0
	str r1, [sp, #4]
	bl NNS_G3dGlbPolygonAttr
	ldr r2, _021FDA94 ; =0x04000060
	ldr r0, _021FDA98 ; =0xFFFFCFFF
	ldrh r1, [r2]
	and r1, r0
	mov r0, #0x20
	orr r0, r1
	strh r0, [r2]
	ldr r0, _021FDAA8 ; =ov15_02201304
	bl G3X_SetEdgeColorTable
	mov r0, #0
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #6
	bl GF_Camera_Create
	ldr r2, _021FDAAC ; =0x00000818
	ldr r4, _021FDAB0 ; =ov15_02200500
	str r0, [r5, r2]
	add r0, r2, #0
	add r0, #0xec
	add r3, r5, r0
	ldmia r4!, {r0, r1}
	add r6, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	ldr r4, _021FDAB4 ; =ov15_0220053C
	str r0, [r3]
	add r0, r2, #0
	add r0, #0xf8
	add r3, r5, r0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	ldr r3, _021FDAB8 ; =0x0000091C
	ldrb r0, [r5, r3]
	add r1, r3, #0
	sub r1, #0xc
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	add r2, r3, #0
	str r0, [sp, #8]
	add r3, r3, #2
	sub r2, #8
	ldrh r3, [r5, r3]
	ldr r1, [r5, r1]
	add r0, r6, #0
	add r2, r5, r2
	bl GF_Camera_InitFromTargetDistanceAndAngle
	ldr r0, _021FDABC ; =0x00000934
	ldr r3, _021FDAC0 ; =ov15_0220050C
	add r2, r5, r0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, _021FDAC4 ; =0x00000808
	add r0, r5, r0
	bl ov15_021FDAD0
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	ldr r0, _021FDAC4 ; =0x00000808
	add r1, #0x64
	ldrb r1, [r1]
	add r0, r5, r0
	mov r2, #7
	add r1, r1, #1
	bl ov15_021FDAF4
	ldr r2, _021FDAAC ; =0x00000818
	mov r0, #0x7b
	ldr r1, _021FDAC8 ; =0x006A4000
	ldr r2, [r5, r2]
	lsl r0, r0, #0xc
	bl GF_Camera_SetClipBounds
	ldr r0, _021FDAAC ; =0x00000818
	ldr r0, [r5, r0]
	bl GF_Camera_RegisterToStaticPtr
	mov r6, #1
	ldr r7, _021FDA9C ; =0x00007FFF
	mov r4, #0
	lsl r6, r6, #0xc
_021FDA58:
	mov r2, #0
	add r0, r4, #0
	add r1, r6, #0
	add r3, r2, #0
	bl NNS_G3dGlbLightVector
	add r0, r4, #0
	add r1, r7, #0
	bl NNS_G3dGlbLightColor
	add r4, r4, #1
	cmp r4, #4
	blo _021FDA58
	add r0, r5, #0
	bl ov15_021FDD70
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r1, _021FDACC ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #2
	orr r0, r2
	strh r0, [r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021FDA94: .word 0x04000060
_021FDA98: .word 0xFFFFCFFF
_021FDA9C: .word 0x00007FFF
_021FDAA0: .word 0x00003DEF
_021FDAA4: .word 0x0000294A
_021FDAA8: .word ov15_02201304
_021FDAAC: .word 0x00000818
_021FDAB0: .word ov15_02200500
_021FDAB4: .word ov15_0220053C
_021FDAB8: .word 0x0000091C
_021FDABC: .word 0x00000934
_021FDAC0: .word ov15_0220050C
_021FDAC4: .word 0x00000808
_021FDAC8: .word 0x006A4000
_021FDACC: .word 0x04000008
	thumb_func_end ov15_021FD93C

	thumb_func_start ov15_021FDAD0
ov15_021FDAD0: ; 0x021FDAD0
	mov r2, #0x47
	lsl r2, r2, #2
	mov r3, #0
	str r3, [r0, r2]
	add r1, r2, #4
	str r3, [r0, r1]
	add r1, r2, #0
	sub r3, r3, #1
	add r1, #8
	str r3, [r0, r1]
	add r1, r2, #0
	mov r3, #7
	add r1, #0xc
	strh r3, [r0, r1]
	add r2, #0xe
	strh r3, [r0, r2]
	bx lr
	.balign 4, 0
	thumb_func_end ov15_021FDAD0

	thumb_func_start ov15_021FDAF4
ov15_021FDAF4: ; 0x021FDAF4
	push {r4, r5}
	mov r4, #0x4a
	lsl r4, r4, #2
	add r3, r4, #2
	ldrh r5, [r0, r4]
	ldrh r3, [r0, r3]
	cmp r5, r3
	bne _021FDB22
	add r3, r4, #0
	sub r3, #8
	ldr r5, [r0, r3]
	add r3, r4, #0
	sub r3, #0xc
	str r5, [r0, r3]
	add r3, r4, #0
	sub r3, #8
	str r1, [r0, r3]
	mov r1, #0
	strh r1, [r0, r4]
	add r1, r4, #2
	strh r2, [r0, r1]
	pop {r4, r5}
	bx lr
_021FDB22:
	sub r2, r4, #4
	str r1, [r0, r2]
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov15_021FDAF4

	thumb_func_start ov15_021FDB2C
ov15_021FDB2C: ; 0x021FDB2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #0x90
	add r2, r1, #0
	add r1, r0, #0
	ldr r3, _021FDC64 ; =ov15_02200790
	mul r2, r0
	add r1, #0x98
	add r4, r3, r2
	ldrh r2, [r5, r1]
	add r1, r0, #0
	add r1, #0x9a
	ldrh r1, [r5, r1]
	cmp r2, r1
	beq _021FDC28
	add r1, r0, #0
	add r1, #0x98
	ldrh r1, [r5, r1]
	add r2, r1, #1
	add r1, r0, #0
	add r1, #0x98
	strh r2, [r5, r1]
	add r1, r0, #0
	add r1, #0x8c
	add r0, #0x90
	ldr r1, [r5, r1]
	ldr r0, [r5, r0]
	lsl r1, r1, #4
	lsl r0, r0, #4
	str r1, [sp, #8]
	ldrh r7, [r4, r1]
	ldrh r1, [r4, r0]
	str r0, [sp, #4]
	sub r0, r1, r7
	bpl _021FDB76
	neg r0, r0
_021FDB76:
	cmp r1, r7
	bhs _021FDB80
	mov r1, #0
	mvn r1, r1
	b _021FDB82
_021FDB80:
	mov r1, #1
_021FDB82:
	mov r2, #2
	lsl r2, r2, #0xe
	cmp r0, r2
	ble _021FDB94
	lsl r2, r2, #1
	sub r0, r2, r0
	mov r2, #0
	mvn r2, r2
	mul r1, r2
_021FDB94:
	cmp r1, #0
	ldr r2, _021FDC68 ; =0x0000012A
	ble _021FDBB0
	ldrh r1, [r5, r2]
	str r1, [sp]
	sub r1, r2, #2
	ldrh r6, [r5, r1]
	ldr r1, [sp]
	bl _s32_div_f
	mul r0, r6
	add r0, r7, r0
	str r0, [sp, #0x14]
	b _021FDBC4
_021FDBB0:
	ldrh r1, [r5, r2]
	str r1, [sp]
	sub r1, r2, #2
	ldrh r6, [r5, r1]
	ldr r1, [sp]
	bl _s32_div_f
	mul r0, r6
	sub r0, r7, r0
	str r0, [sp, #0x14]
_021FDBC4:
	ldr r0, [sp, #8]
	ldr r1, [sp]
	add r0, r4, r0
	ldrh r7, [r0, #2]
	ldr r0, [sp, #4]
	add r0, r4, r0
	ldrh r0, [r0, #2]
	sub r0, r0, r7
	bl _s32_div_f
	mul r0, r6
	add r0, r7, r0
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	ldr r1, [sp]
	add r0, r4, r0
	ldr r7, [r0, #8]
	ldr r0, [sp, #4]
	add r0, r4, r0
	ldr r0, [r0, #8]
	sub r0, r0, r7
	bl _s32_div_f
	mul r0, r6
	add r0, r7, r0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	ldr r1, [sp]
	add r0, r4, r0
	ldr r7, [r0, #0xc]
	ldr r0, [sp, #4]
	add r0, r4, r0
	ldr r0, [r0, #0xc]
	sub r0, r0, r7
	bl _s32_div_f
	mul r0, r6
	add r1, r7, r0
	mov r0, #0x43
	lsl r0, r0, #2
	ldr r2, [sp, #0x14]
	add r3, r0, #2
	strh r2, [r5, r0]
	ldr r2, [sp, #0x10]
	strh r2, [r5, r3]
	sub r3, r0, #4
	ldr r2, [sp, #0xc]
	add r0, #0x24
	str r2, [r5, r3]
	str r1, [r5, r0]
_021FDC28:
	mov r1, #0x4a
	lsl r1, r1, #2
	add r0, r1, #2
	ldrh r2, [r5, r1]
	ldrh r0, [r5, r0]
	cmp r2, r0
	bne _021FDC60
	sub r0, r1, #4
	mov r2, #0
	ldr r0, [r5, r0]
	mvn r2, r2
	cmp r0, r2
	beq _021FDC60
	add r0, r1, #0
	sub r0, #8
	ldr r3, [r5, r0]
	add r0, r1, #0
	sub r0, #0xc
	str r3, [r5, r0]
	sub r0, r1, #4
	ldr r3, [r5, r0]
	add r0, r1, #0
	sub r0, #8
	str r3, [r5, r0]
	sub r0, r1, #4
	str r2, [r5, r0]
	mov r0, #0
	strh r0, [r5, r1]
_021FDC60:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FDC64: .word ov15_02200790
_021FDC68: .word 0x0000012A
	thumb_func_end ov15_021FDB2C

	thumb_func_start ov15_021FDC6C
ov15_021FDC6C: ; 0x021FDC6C
	push {r4, lr}
	add r4, r0, #0
	bl ov15_021FDF20
	ldr r0, _021FDC84 ; =0x00000818
	ldr r0, [r4, r0]
	bl sub_02023120
	bl sub_0201F63C
	pop {r4, pc}
	nop
_021FDC84: .word 0x00000818
	thumb_func_end ov15_021FDC6C

	thumb_func_start ov15_021FDC88
ov15_021FDC88: ; 0x021FDC88
	push {r4, r5, lr}
	sub sp, #0x3c
	ldr r4, _021FDD34 ; =ov15_022005CC
	add r5, r0, #0
	add r3, sp, #0x18
	mov r2, #4
_021FDC94:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021FDC94
	ldr r0, [r4]
	add r2, sp, #0xc
	str r0, [r3]
	ldr r3, _021FDD38 ; =ov15_022004F4
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r1, _021FDD3C ; =0x00000615
	str r0, [r2]
	ldr r0, _021FDD40 ; =0x00000808
	ldrb r1, [r5, r1]
	add r0, r5, r0
	bl ov15_021FDB2C
	ldr r3, _021FDD44 ; =0x0000091C
	ldr r2, _021FDD48 ; =0x00000818
	ldrb r0, [r5, r3]
	add r1, r2, #0
	add r3, r3, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	add r1, #0xf8
	str r0, [sp, #8]
	add r0, r2, #0
	add r0, #0xec
	add r2, #0xfc
	ldrh r3, [r5, r3]
	ldr r1, [r5, r1]
	add r0, r5, r0
	add r2, r5, r2
	bl GF_Camera_InitFromTargetDistanceAndAngle
	bl sub_02026E48
	bl sub_02023154
	ldr r0, _021FDD4C ; =0x0000081C
	add r4, r5, r0
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	lsl r0, r0, #2
	add r0, r4, r0
	add r0, #0xa0
	ldr r0, [r0]
	bl ov15_021FDD54
	add r0, r4, #0
	add r0, #0xe4
	ldr r0, [r0]
	lsl r0, r0, #2
	add r0, r4, r0
	add r0, #0xc0
	ldr r0, [r0]
	bl ov15_021FDD54
	add r0, r4, #0
	add r0, #0xe0
	ldr r0, [r0]
	bl ov15_021FDD54
	ldr r1, _021FDD50 ; =0x00000934
	add r0, r4, #0
	add r1, r5, r1
	add r2, sp, #0x18
	add r3, sp, #0xc
	bl Draw3dModel
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
	add sp, #0x3c
	pop {r4, r5, pc}
	.balign 4, 0
_021FDD34: .word ov15_022005CC
_021FDD38: .word ov15_022004F4
_021FDD3C: .word 0x00000615
_021FDD40: .word 0x00000808
_021FDD44: .word 0x0000091C
_021FDD48: .word 0x00000818
_021FDD4C: .word 0x0000081C
_021FDD50: .word 0x00000934
	thumb_func_end ov15_021FDC88

	thumb_func_start ov15_021FDD54
ov15_021FDD54: ; 0x021FDD54
	mov r1, #1
	ldr r2, [r0]
	lsl r1, r1, #0xc
	add r2, r2, r1
	ldr r1, [r0, #8]
	ldrh r1, [r1, #4]
	lsl r1, r1, #0xc
	cmp r2, r1
	bge _021FDD6A
	str r2, [r0]
	bx lr
_021FDD6A:
	mov r1, #0
	str r1, [r0]
	bx lr
	thumb_func_end ov15_021FDD54

	thumb_func_start ov15_021FDD70
ov15_021FDD70: ; 0x021FDD70
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r0, #0
	mov r0, #0xf
	mov r1, #6
	bl NARC_ctor
	str r0, [sp, #0x10]
	ldr r0, _021FDF14 ; =0x00000808
	mov r1, #6
	add r0, r7, r0
	mov r2, #4
	bl GF_ExpHeap_FndInitAllocator
	ldr r0, _021FDF18 ; =0x0000081C
	add r4, r7, r0
	ldr r0, _021FDF1C ; =0x00000615
	ldrb r0, [r7, r0]
	cmp r0, #0
	bne _021FDDA8
	mov r0, #0x39
	str r0, [sp, #8]
	mov r0, #0x41
	str r0, [sp, #4]
	mov r0, #0x49
	mov r1, #0x37
	str r0, [sp]
	b _021FDDB6
_021FDDA8:
	mov r0, #0x4c
	str r0, [sp, #8]
	mov r0, #0x54
	str r0, [sp, #4]
	mov r0, #0x5c
	mov r1, #0x4a
	str r0, [sp]
_021FDDB6:
	ldr r0, [sp, #0x10]
	mov r2, #6
	bl NARC_AllocAndReadWholeMember
	add r1, r4, #0
	add r2, r4, #0
	str r0, [r4, #0x58]
	add r0, r4, #0
	add r1, #0x54
	add r2, #0x58
	bl sub_0201F51C
	ldr r0, [r4, #0x58]
	bl NNS_G3dGetTex
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x54]
	mov r1, #1
	mov r2, #0x40
	bl NNSi_G3dModifyMatFlag
	ldr r0, [r4, #0x54]
	mov r1, #1
	mov r2, #0x80
	bl NNSi_G3dModifyMatFlag
	mov r1, #1
	ldr r0, [r4, #0x54]
	lsl r2, r1, #9
	bl NNSi_G3dModifyMatFlag
	mov r1, #1
	ldr r0, [r4, #0x54]
	lsl r2, r1, #0xa
	bl NNSi_G3dModifyMatFlag
	mov r2, #0x3f
	ldr r0, [r4, #0x54]
	mov r1, #1
	lsl r2, r2, #0x18
	bl NNSi_G3dModifyPolygonAttrMask
	mov r6, #0
	add r5, r4, #0
_021FDE0E:
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x10]
	add r1, r1, r6
	mov r2, #6
	bl NARC_AllocAndReadWholeMember
	mov r1, #0
	str r0, [r5, #0x5c]
	bl NNS_G3dGetAnmByIdx
	str r0, [sp, #0x14]
	ldr r0, _021FDF14 ; =0x00000808
	ldr r1, [sp, #0x14]
	ldr r2, [r4, #0x54]
	add r0, r7, r0
	bl NNS_G3dAllocAnmObj
	add r1, r5, #0
	add r1, #0xa0
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, [sp, #0x14]
	ldr r2, [r4, #0x54]
	ldr r3, [sp, #0xc]
	bl NNS_G3dAnmObjInit
	ldr r1, [sp, #4]
	ldr r0, [sp, #0x10]
	add r1, r1, r6
	mov r2, #6
	bl NARC_AllocAndReadWholeMember
	mov r1, #0
	str r0, [r5, #0x7c]
	bl NNS_G3dGetAnmByIdx
	str r0, [sp, #0x18]
	ldr r0, _021FDF14 ; =0x00000808
	ldr r1, [sp, #0x18]
	ldr r2, [r4, #0x54]
	add r0, r7, r0
	bl NNS_G3dAllocAnmObj
	add r1, r5, #0
	add r1, #0xc0
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	ldr r1, [sp, #0x18]
	ldr r2, [r4, #0x54]
	ldr r3, [sp, #0xc]
	bl NNS_G3dAnmObjInit
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #8
	blo _021FDE0E
	ldr r0, [sp, #0x10]
	ldr r1, [sp]
	mov r2, #6
	bl NARC_AllocAndReadWholeMember
	add r1, r4, #0
	add r1, #0x9c
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	mov r1, #0
	bl NNS_G3dGetAnmByIdx
	add r5, r0, #0
	ldr r0, _021FDF14 ; =0x00000808
	ldr r2, [r4, #0x54]
	add r0, r7, r0
	add r1, r5, #0
	bl NNS_G3dAllocAnmObj
	add r1, r4, #0
	add r1, #0xe0
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xe0
	ldr r0, [r0]
	ldr r2, [r4, #0x54]
	ldr r3, [sp, #0xc]
	add r1, r5, #0
	bl NNS_G3dAnmObjInit
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	add r0, #0x64
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0xe4
	str r1, [r0]
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	add r0, r4, #0
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xa0
	ldr r1, [r1]
	bl NNS_G3dRenderObjAddAnmObj
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	add r0, r4, #0
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xc0
	ldr r1, [r1]
	bl NNS_G3dRenderObjAddAnmObj
	add r0, r4, #0
	add r4, #0xe0
	ldr r1, [r4]
	bl NNS_G3dRenderObjAddAnmObj
	ldr r0, [sp, #0x10]
	bl NARC_dtor
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021FDF14: .word 0x00000808
_021FDF18: .word 0x0000081C
_021FDF1C: .word 0x00000615
	thumb_func_end ov15_021FDD70

	thumb_func_start ov15_021FDF20
ov15_021FDF20: ; 0x021FDF20
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _021FDF80 ; =0x0000081C
	ldr r7, _021FDF84 ; =0x00000808
	add r0, r5, r0
	str r0, [sp]
	mov r6, #0
	add r4, r0, #0
_021FDF30:
	add r1, r4, #0
	add r1, #0xa0
	ldr r1, [r1]
	add r0, r5, r7
	bl NNS_G3dFreeAnmObj
	add r1, r4, #0
	add r1, #0xc0
	ldr r1, [r1]
	add r0, r5, r7
	bl NNS_G3dFreeAnmObj
	ldr r0, [r4, #0x5c]
	bl FreeToHeap
	ldr r0, [r4, #0x7c]
	bl FreeToHeap
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #8
	blo _021FDF30
	ldr r1, [sp]
	ldr r0, _021FDF84 ; =0x00000808
	add r1, #0xe0
	ldr r1, [r1]
	add r0, r5, r0
	bl NNS_G3dFreeAnmObj
	ldr r0, [sp]
	add r0, #0x9c
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, [sp]
	ldr r0, [r0, #0x58]
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FDF80: .word 0x0000081C
_021FDF84: .word 0x00000808
	thumb_func_end ov15_021FDF20

	thumb_func_start ov15_021FDF88
ov15_021FDF88: ; 0x021FDF88
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021FE01C ; =0x0000081C
	add r4, r5, r0
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	add r0, r4, #0
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xc0
	ldr r1, [r1]
	bl NNS_G3dRenderObjRemoveAnmObj
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	add r0, r4, #0
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xa0
	ldr r1, [r1]
	bl NNS_G3dRenderObjRemoveAnmObj
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x64
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0xe4
	str r1, [r0]
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	mov r0, #0
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xa0
	ldr r1, [r1]
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xc0
	ldr r1, [r1]
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xe0
	ldr r1, [r1]
	str r0, [r1]
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	add r0, r4, #0
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xa0
	ldr r1, [r1]
	bl NNS_G3dRenderObjAddAnmObj
	add r1, r4, #0
	add r1, #0xe4
	ldr r1, [r1]
	add r0, r4, #0
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, #0xc0
	ldr r1, [r1]
	bl NNS_G3dRenderObjAddAnmObj
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FE01C: .word 0x0000081C
	thumb_func_end ov15_021FDF88

	thumb_func_start ov15_021FE020
ov15_021FE020: ; 0x021FE020
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0x12
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	mov r2, #1
	str r2, [sp, #0x10]
	ldr r0, [r4]
	add r1, r4, #4
	mov r3, #0
	bl AddWindowParameterized
	mov r0, #0xd
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #0xc1
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x14
	mov r2, #1
	mov r3, #0
	bl AddWindowParameterized
	mov r1, #1
	str r1, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r3, #2
	str r3, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x24
	mov r2, #4
	bl AddWindowParameterized
	mov r0, #1
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r2, #4
	add r1, r4, #0
	str r2, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0x53
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, #0x34
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0xd
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #0xdb
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x44
	mov r2, #1
	mov r3, #0x13
	bl AddWindowParameterized
	mov r0, #0xc
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _021FE150 ; =0x0000012B
	add r1, r4, #0
	str r0, [sp, #0x10]
	mov r2, #1
	ldr r0, [r4]
	add r1, #0x54
	add r3, r2, #0
	bl AddWindowParameterized
	mov r0, #0x15
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0x37
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x64
	mov r2, #4
	mov r3, #0xa
	bl AddWindowParameterized
	add r0, r4, #0
	add r0, #0x64
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x15
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	mov r0, #0x45
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x74
	mov r2, #4
	mov r3, #0x18
	bl AddWindowParameterized
	add r0, r4, #0
	add r0, #0x74
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r2, #0
	add r1, r2, #0
_021FE13E:
	add r0, r4, #0
	add r0, #0xb4
	add r2, r2, #1
	add r4, #0x10
	str r1, [r0]
	cmp r2, #0x18
	blt _021FE13E
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_021FE150: .word 0x0000012B
	thumb_func_end ov15_021FE020

	thumb_func_start ov15_021FE154
ov15_021FE154: ; 0x021FE154
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r5, #0
	add r4, r6, #4
_021FE15C:
	lsl r0, r5, #4
	add r0, r4, r0
	bl RemoveWindow
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #8
	blo _021FE15C
	add r0, r6, #0
	bl ov15_021FE3E0
	add r0, r6, #0
	bl ov15_021FE1D0
	pop {r4, r5, r6, pc}
	thumb_func_end ov15_021FE154

	thumb_func_start ov15_021FE17C
ov15_021FE17C: ; 0x021FE17C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	bne _021FE1C8
	add r5, r7, #0
	ldr r4, _021FE1CC ; =ov15_02200908
	mov r6, #0
	add r5, #0xb4
_021FE192:
	ldr r0, [r4, #4]
	add r1, r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	mov r2, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r3, [r4]
	ldr r0, [r7]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	add r6, r6, #1
	add r4, #0xc
	add r5, #0x10
	cmp r6, #0xc
	blt _021FE192
_021FE1C8:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FE1CC: .word ov15_02200908
	thumb_func_end ov15_021FE17C

	thumb_func_start ov15_021FE1D0
ov15_021FE1D0: ; 0x021FE1D0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0xb4
	ldr r0, [r0]
	cmp r0, #0
	beq _021FE200
	mov r6, #0
	add r4, r5, #0
	add r4, #0xb4
	add r7, r6, #0
_021FE1E4:
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r4, #0
	bl RemoveWindow
	add r0, r5, #0
	add r0, #0xb4
	add r6, r6, #1
	str r7, [r0]
	add r4, #0x10
	add r5, #0x10
	cmp r6, #0xc
	blt _021FE1E4
_021FE200:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov15_021FE1D0

	thumb_func_start ov15_021FE204
ov15_021FE204: ; 0x021FE204
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	mov r3, #0x5d
	lsl r3, r3, #2
	str r0, [sp, #0x14]
	ldr r0, [r0, r3]
	cmp r0, #0
	beq _021FE216
	b _021FE3BC
_021FE216:
	mov r0, #7
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r2, #4
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, _021FE3C0 ; =0x000002CF
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	add r1, r1, r3
	ldr r0, [r0]
	mov r3, #0xc
	bl AddWindowParameterized
	mov r1, #0x5d
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x14]
	ldr r4, _021FE3C4 ; =0x0000031B
	str r0, [sp, #0x18]
	add r0, #0xb4
	ldr r5, _021FE3C8 ; =ov15_022008E8
	mov r6, #0
	str r0, [sp, #0x18]
_021FE252:
	add r0, r6, #0
	add r0, #0xd
	lsl r7, r0, #4
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x18]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, [r5]
	ldr r0, [r0]
	lsl r3, r3, #0x18
	add r1, r1, r7
	mov r2, #4
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r0, [sp, #0x18]
	mov r1, #0
	add r0, r0, r7
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #0x14
	add r5, #8
	cmp r6, #4
	blt _021FE252
	ldr r0, [sp, #0x14]
	ldr r4, _021FE3CC ; =0x000002FB
	str r0, [sp, #0x1c]
	add r0, #0xb4
	ldr r5, _021FE3D0 ; =ov15_022008D0
	mov r6, #0
	str r0, [sp, #0x1c]
_021FE2A8:
	add r0, r6, #0
	add r0, #0x11
	lsl r7, r0, #4
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r3, [r5]
	ldr r0, [r0]
	lsl r3, r3, #0x18
	add r1, r1, r7
	mov r2, #4
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r0, [sp, #0x1c]
	mov r1, #0
	add r0, r0, r7
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, r4, #6
	add r5, #8
	cmp r6, #3
	blt _021FE2A8
	mov r0, #0x15
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, _021FE3D4 ; =0x0000030D
	mov r2, #0x7d
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	lsl r2, r2, #2
	add r1, r1, r2
	ldr r0, [r0]
	mov r2, #4
	mov r3, #0xe
	bl AddWindowParameterized
	mov r1, #0x7d
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #1
	str r0, [sp]
	mov r0, #0x12
	str r0, [sp, #4]
	mov r2, #4
	mov r4, #0x81
	str r2, [sp, #8]
	mov r3, #0xb
	ldr r0, _021FE3C4 ; =0x0000031B
	str r3, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	lsl r4, r4, #2
	ldr r0, [r0]
	add r1, r1, r4
	bl AddWindowParameterized
	ldr r0, [sp, #0x14]
	add r1, r4, #0
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #9
	str r0, [sp, #4]
	mov r2, #4
	str r2, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, _021FE3D8 ; =0x00000363
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	add r4, #0x10
	ldr r0, [r0]
	add r1, r1, r4
	bl AddWindowParameterized
	mov r1, #0x85
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0xe
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, _021FE3DC ; =0x00000387
	mov r2, #0x89
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x14]
	lsl r2, r2, #2
	add r1, r1, r2
	ldr r0, [r0]
	mov r2, #4
	mov r3, #0x18
	bl AddWindowParameterized
	mov r1, #0x89
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
_021FE3BC:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FE3C0: .word 0x000002CF
_021FE3C4: .word 0x0000031B
_021FE3C8: .word ov15_022008E8
_021FE3CC: .word 0x000002FB
_021FE3D0: .word ov15_022008D0
_021FE3D4: .word 0x0000030D
_021FE3D8: .word 0x00000363
_021FE3DC: .word 0x00000387
	thumb_func_end ov15_021FE204

	thumb_func_start ov15_021FE3E0
ov15_021FE3E0: ; 0x021FE3E0
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _021FE4C6
	ldr r5, [sp]
	mov r4, #0
	add r6, r5, #0
	add r6, #0xb4
_021FE3F6:
	add r0, r4, #0
	add r0, #0x11
	lsl r7, r0, #4
	add r0, r6, r7
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r6, r7
	bl RemoveWindow
	mov r0, #0x71
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r5, r0]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _021FE3F6
	add r1, r0, #0
	ldr r0, [sp]
	add r1, #0x60
	add r0, r0, r1
	bl ClearWindowTilemapAndScheduleTransfer
	mov r1, #0x89
	ldr r0, [sp]
	lsl r1, r1, #2
	add r0, r0, r1
	bl RemoveWindow
	mov r1, #0x89
	ldr r0, [sp]
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r0, r1]
	sub r1, #0x10
	add r0, r0, r1
	bl RemoveWindow
	mov r1, #0x85
	ldr r0, [sp]
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r0, r1]
	sub r1, #0x10
	add r0, r0, r1
	bl RemoveWindow
	mov r1, #0x81
	ldr r0, [sp]
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r0, r1]
	sub r1, #0x10
	add r0, r0, r1
	bl ClearWindowTilemapAndScheduleTransfer
	mov r1, #0x7d
	ldr r0, [sp]
	lsl r1, r1, #2
	add r0, r0, r1
	bl RemoveWindow
	ldr r0, [sp]
	mov r1, #0x7d
	add r6, r0, #0
	mov r5, #0
	lsl r1, r1, #2
	str r5, [r0, r1]
	add r4, r0, #0
	add r6, #0xb4
_021FE482:
	add r0, r5, #0
	add r0, #0xd
	lsl r7, r0, #4
	add r0, r6, r7
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r6, r7
	bl RemoveWindow
	mov r0, #0x61
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #4
	blt _021FE482
	add r1, r0, #0
	ldr r0, [sp]
	sub r1, #0x10
	add r0, r0, r1
	bl ClearWindowTilemapAndScheduleTransfer
	mov r1, #0x5d
	ldr r0, [sp]
	lsl r1, r1, #2
	add r0, r0, r1
	bl RemoveWindow
	mov r1, #0x5d
	ldr r0, [sp]
	mov r2, #0
	lsl r1, r1, #2
	str r2, [r0, r1]
_021FE4C6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_021FE3E0

	thumb_func_start ov15_021FE4C8
ov15_021FE4C8: ; 0x021FE4C8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xe1
	mov r3, #6
	bl NewMsgDataFromNarc
	ldr r7, _021FE500 ; =0x000005F4
	add r6, r0, #0
	mov r4, #0
_021FE4DE:
	add r0, r6, #0
	add r1, r4, #0
	bl NewString_ReadMsgData
	lsl r1, r4, #2
	add r1, r5, r1
	str r0, [r1, r7]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #8
	blo _021FE4DE
	add r0, r6, #0
	bl DestroyMsgData
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FE500: .word 0x000005F4
	thumb_func_end ov15_021FE4C8

	thumb_func_start ov15_021FE504
ov15_021FE504: ; 0x021FE504
	push {r4, r5, r6, lr}
	ldr r6, _021FE524 ; =0x000005F4
	add r5, r0, #0
	mov r4, #0
_021FE50C:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, r6]
	bl String_dtor
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #8
	blo _021FE50C
	pop {r4, r5, r6, pc}
	nop
_021FE524: .word 0x000005F4
	thumb_func_end ov15_021FE504

	thumb_func_start ov15_021FE528
ov15_021FE528: ; 0x021FE528
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r4, #0
	mov r6, #0xd
	mov r7, #1
_021FE534:
	str r6, [sp]
	str r7, [sp, #4]
	add r2, r4, #0
	add r2, #0xcd
	lsl r2, r2, #0x10
	lsl r3, r4, #0x18
	str r7, [sp, #8]
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r0, [r5]
	mov r1, #3
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	mov r0, #0xe
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r2, r4, #0
	str r0, [sp, #8]
	mov r0, #4
	add r2, #0xf1
	str r0, [sp, #0xc]
	lsl r2, r2, #0x10
	lsl r3, r4, #0x18
	ldr r0, [r5]
	mov r1, #3
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0xc
	blo _021FE534
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov15_021FE528

	thumb_func_start ov15_021FE584
ov15_021FE584: ; 0x021FE584
	push {r3, r4, r5, lr}
	lsl r1, r1, #0x10
	add r4, r2, #0
	lsr r1, r1, #0x10
	mov r2, #0
	add r5, r0, #0
	bl ov15_021F9D60
	add r2, r0, #0
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl BufferItemName
	pop {r3, r4, r5, pc}
	thumb_func_end ov15_021FE584

	thumb_func_start ov15_021FE5A4
ov15_021FE5A4: ; 0x021FE5A4
	push {r3, r4, r5, lr}
	lsl r1, r1, #0x10
	add r4, r2, #0
	lsr r1, r1, #0x10
	mov r2, #0
	add r5, r0, #0
	bl ov15_021F9D60
	add r2, r0, #0
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl BufferItemNamePlural
	pop {r3, r4, r5, pc}
	thumb_func_end ov15_021FE5A4

	thumb_func_start ov15_021FE5C4
ov15_021FE5C4: ; 0x021FE5C4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _021FE618 ; =0x0000FFFF
	add r6, r1, #0
	cmp r6, r0
	beq _021FE5E6
	mov r0, #0x82
	mov r1, #6
	bl String_ctor
	add r1, r6, #0
	mov r2, #6
	add r4, r0, #0
	bl GetItemDescIntoString
	b _021FE5F4
_021FE5E6:
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x61
	bl NewString_ReadMsgData
	add r4, r0, #0
_021FE5F4:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE61C ; =0x000F0E00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #4
	mov r3, #0x14
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021FE618: .word 0x0000FFFF
_021FE61C: .word 0x000F0E00
	thumb_func_end ov15_021FE5C4

	thumb_func_start ov15_021FE620
ov15_021FE620: ; 0x021FE620
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r5, #0
	add r0, r1, #0
	add r4, #0x14
	bl TMHMGetMove
	str r0, [sp, #0x10]
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x65
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x59
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	mov r1, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r2, r6, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x5c
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r3, #0x48
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x5a
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r3, #0xa8
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x5b
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	mov r1, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0xa8
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl WazaGetMaxPp
	add r7, r0, #0
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x5d
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	add r2, r7, #0
	mov r3, #2
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FE864 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	mov r1, #0
	str r0, [sp, #8]
	ldr r2, _021FE864 ; =0x000005E4
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r3, #0x30
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	mov r1, #2
	bl GetWazaAttr
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	cmp r7, #1
	bhi _021FE790
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x19
	bl NewString_ReadMsgData
	b _021FE79C
_021FE790:
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x5e
	bl NewString_ReadMsgData
_021FE79C:
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r7, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FE864 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	ldr r2, _021FE864 ; =0x000005E4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r3, #0xe8
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	mov r1, #4
	bl GetWazaAttr
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	bne _021FE800
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x19
	bl NewString_ReadMsgData
	b _021FE80C
_021FE800:
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x5e
	bl NewString_ReadMsgData
_021FE80C:
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r7, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FE864 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FE860 ; =0x000F0E00
	mov r1, #0
	str r0, [sp, #8]
	ldr r2, _021FE864 ; =0x000005E4
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r3, #0xe8
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FE860: .word 0x000F0E00
_021FE864: .word 0x000005E4
	thumb_func_end ov15_021FE620

	thumb_func_start ov15_021FE868
ov15_021FE868: ; 0x021FE868
	ldr r3, _021FE870 ; =ClearWindowTilemapAndScheduleTransfer
	add r0, #0x14
	bx r3
	nop
_021FE870: .word ClearWindowTilemapAndScheduleTransfer
	thumb_func_end ov15_021FE868

	thumb_func_start ov15_021FE874
ov15_021FE874: ; 0x021FE874
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x27
	bl NewString_ReadMsgData
	ldr r1, _021FE89C ; =0x000005E8
	str r0, [r4, r1]
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x26
	bl NewString_ReadMsgData
	ldr r1, _021FE8A0 ; =0x000005EC
	str r0, [r4, r1]
	pop {r4, pc}
	nop
_021FE89C: .word 0x000005E8
_021FE8A0: .word 0x000005EC
	thumb_func_end ov15_021FE874

	thumb_func_start ov15_021FE8A4
ov15_021FE8A4: ; 0x021FE8A4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021FE8BC ; =0x000005E8
	ldr r0, [r4, r0]
	bl String_dtor
	ldr r0, _021FE8C0 ; =0x000005EC
	ldr r0, [r4, r0]
	bl String_dtor
	pop {r4, pc}
	nop
_021FE8BC: .word 0x000005E8
_021FE8C0: .word 0x000005EC
	thumb_func_end ov15_021FE8A4

	thumb_func_start ov15_021FE8C4
ov15_021FE8C4: ; 0x021FE8C4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xa
	mov r1, #6
	bl String_ctor
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r6, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r2, _021FE910 ; =0x000005EC
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	add r1, r4, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021FE910: .word 0x000005EC
	thumb_func_end ov15_021FE8C4

	thumb_func_start ov15_021FE914
ov15_021FE914: ; 0x021FE914
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r2, #0
	add r6, r1, #0
	add r5, r0, #0
	mov r0, #0x69
	ldrh r1, [r7]
	lsl r0, r0, #2
	add r4, r3, #0
	cmp r1, r0
	bhs _021FE95E
	sub r0, #0x5d
	sub r0, r1, r0
	mov r1, #2
	lsl r0, r0, #0x10
	str r1, [sp]
	lsr r2, r0, #0x10
	str r6, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r4, #5
	str r0, [sp, #0xc]
	mov r0, #0xbb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r3, r1, #0
	bl sub_0200CE7C
	lsl r2, r4, #0x10
	ldrh r1, [r7, #2]
	ldr r3, _021FE98C ; =0x00010200
	add r0, r5, #0
	lsr r2, r2, #0x10
	bl ov15_021FE8C4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021FE95E:
	sub r0, r0, #1
	sub r0, r1, r0
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	str r6, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	add r0, r4, #5
	str r0, [sp, #8]
	mov r0, #0xbb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #2
	mov r3, #1
	bl sub_0200CDF0
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x10
	bl ov15_021FE9B0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FE98C: .word 0x00010200
	thumb_func_end ov15_021FE914

	thumb_func_start ov15_021FE990
ov15_021FE990: ; 0x021FE990
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x91
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0x25
	mov r2, #6
	bl NARC_AllocAndReadWholeMember
	add r1, r4, #0
	add r5, r0, #0
	bl NNS_G2dGetUnpackedBGCharacterData
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov15_021FE990

	thumb_func_start ov15_021FE9B0
ov15_021FE9B0: ; 0x021FE9B0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r5, r1, #0
	add r1, sp, #0x18
	add r4, r2, #0
	bl ov15_021FE990
	add r6, r0, #0
	mov r0, #0x68
	str r0, [sp]
	mov r0, #0x10
	mov r2, #0
	str r0, [sp, #4]
	lsl r1, r4, #0x10
	str r2, [sp, #8]
	lsr r1, r1, #0x10
	str r1, [sp, #0xc]
	mov r1, #0x18
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	ldr r1, [r1, #0x14]
	add r3, r2, #0
	bl BlitBitmapRectToWindow
	mov r0, #6
	add r1, r6, #0
	bl FreeToHeapExplicit
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov15_021FE9B0

	thumb_func_start ov15_021FE9F0
ov15_021FE9F0: ; 0x021FE9F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r1, #0
	add r1, sp, #0x18
	add r4, r2, #0
	add r6, r3, #0
	bl ov15_021FE990
	add r7, r0, #0
	cmp r6, #0
	bne _021FEA2C
	mov r0, #0x68
	str r0, [sp]
	mov r0, #0x10
	lsl r1, r4, #0x10
	str r0, [sp, #4]
	mov r3, #0
	str r3, [sp, #8]
	lsr r1, r1, #0x10
	str r1, [sp, #0xc]
	mov r1, #0x28
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	ldr r1, [r1, #0x14]
	mov r2, #0x18
	bl BlitBitmapRectToWindow
	b _021FEA50
_021FEA2C:
	mov r0, #0x68
	str r0, [sp]
	mov r0, #0x10
	lsl r1, r4, #0x10
	str r0, [sp, #4]
	mov r3, #0
	str r3, [sp, #8]
	lsr r1, r1, #0x10
	str r1, [sp, #0xc]
	mov r1, #0x28
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	ldr r1, [r1, #0x14]
	mov r2, #0x40
	bl BlitBitmapRectToWindow
_021FEA50:
	mov r0, #6
	add r1, r7, #0
	bl FreeToHeapExplicit
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov15_021FE9F0

	thumb_func_start ov15_021FEA5C
ov15_021FEA5C: ; 0x021FEA5C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl NewString_ReadMsgData
	mov r1, #3
	lsl r1, r1, #8
	str r0, [r4, r1]
	sub r1, #0x10
	ldr r0, [r4, r1]
	mov r1, #6
	bl NewString_ReadMsgData
	mov r1, #0xc1
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x14
	ldr r0, [r4, r1]
	mov r1, #0x10
	bl NewString_ReadMsgData
	mov r1, #0xc2
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x18
	ldr r0, [r4, r1]
	mov r1, #0x62
	bl NewString_ReadMsgData
	mov r1, #0xc3
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x1c
	ldr r0, [r4, r1]
	mov r1, #0x63
	bl NewString_ReadMsgData
	mov r1, #0x31
	lsl r1, r1, #4
	str r0, [r4, r1]
	sub r1, #0x20
	ldr r0, [r4, r1]
	mov r1, #1
	bl NewString_ReadMsgData
	mov r1, #0xc5
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x24
	ldr r0, [r4, r1]
	mov r1, #2
	bl NewString_ReadMsgData
	mov r1, #0xc6
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x28
	ldr r0, [r4, r1]
	mov r1, #0x12
	bl NewString_ReadMsgData
	mov r1, #0xc7
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x2c
	ldr r0, [r4, r1]
	mov r1, #3
	bl NewString_ReadMsgData
	mov r1, #0x32
	lsl r1, r1, #4
	str r0, [r4, r1]
	sub r1, #0x30
	ldr r0, [r4, r1]
	mov r1, #4
	bl NewString_ReadMsgData
	mov r1, #0xc9
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x34
	ldr r0, [r4, r1]
	mov r1, #5
	bl NewString_ReadMsgData
	mov r1, #0xca
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x38
	ldr r0, [r4, r1]
	mov r1, #8
	bl NewString_ReadMsgData
	mov r1, #0xcb
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x3c
	ldr r0, [r4, r1]
	mov r1, #0x4b
	bl NewString_ReadMsgData
	mov r1, #0x33
	lsl r1, r1, #4
	str r0, [r4, r1]
	sub r1, #0x40
	ldr r0, [r4, r1]
	mov r1, #0x56
	bl NewString_ReadMsgData
	mov r1, #0xcd
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x44
	ldr r0, [r4, r1]
	mov r1, #0
	bl NewString_ReadMsgData
	mov r1, #0xce
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r1, #0x48
	ldr r0, [r4, r1]
	mov r1, #0x80
	bl NewString_ReadMsgData
	mov r1, #0xcf
	lsl r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
	thumb_func_end ov15_021FEA5C

	thumb_func_start ov15_021FEB64
ov15_021FEB64: ; 0x021FEB64
	push {r4, r5, r6, lr}
	mov r6, #3
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #8
_021FEB6E:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, r6]
	bl String_dtor
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x10
	blo _021FEB6E
	pop {r4, r5, r6, pc}
	thumb_func_end ov15_021FEB64

	thumb_func_start ov15_021FEB84
ov15_021FEB84: ; 0x021FEB84
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r2, [r5, r0]
	add r0, r2, #0
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r0, r2, r0
	ldrb r0, [r0, #0xc]
	cmp r0, #3
	bne _021FEBDC
	add r0, r5, #0
	add r0, #0x14
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r1, #0x66
	ldrh r1, [r1]
	bl ov15_021FE620
	add r0, r5, #4
	bl ScheduleWindowCopyToVram
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r1, #0x66
	ldrh r1, [r1]
	mov r2, #1
	bl ov15_021FF97C
	add r0, r5, #0
	mov r1, #0
	bl ov15_021F9C78
_021FEBDC:
	add r0, r5, #0
	ldr r2, _021FEC98 ; =0x000003E2
	add r0, #0x24
	mov r1, #1
	mov r3, #0xc
	bl DrawFrameAndWindow2
	add r0, r5, #0
	add r0, #0x24
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	add r0, r1, #0
	add r0, #0x64
	ldrb r2, [r0]
	mov r0, #0xc
	add r3, r1, #4
	mul r0, r2
	add r4, r3, r0
	add r0, r1, #0
	add r0, #0x65
	ldrb r0, [r0]
	cmp r0, #6
	bne _021FEC30
	add r1, #0x66
	ldrb r0, [r4, #8]
	ldrh r1, [r1]
	bl ov15_021FD3F0
	cmp r0, #0
	bne _021FEC30
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x6a
	bl NewString_ReadMsgData
	add r7, r0, #0
	b _021FEC3E
_021FEC30:
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x2b
	bl NewString_ReadMsgData
	add r7, r0, #0
_021FEC3E:
	mov r0, #0x6c
	mov r1, #6
	bl String_ctor
	mov r1, #6
	ldrsh r2, [r4, r1]
	ldr r1, _021FEC9C ; =0x00000644
	add r6, r0, #0
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r1, r2, r1
	sub r1, #8
	mov r2, #0
	bl ov15_021FE584
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x24
	mov r1, #1
	add r2, r6, #0
	str r3, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	add r5, #0x24
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FEC98: .word 0x000003E2
_021FEC9C: .word 0x00000644
	thumb_func_end ov15_021FEB84

	thumb_func_start ov15_021FECA0
ov15_021FECA0: ; 0x021FECA0
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r4, r2, #0
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	lsl r1, r4, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl ov15_021FE5C4
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov15_021FECA0

	thumb_func_start ov15_021FECC4
ov15_021FECC4: ; 0x021FECC4
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	pop {r4, pc}
	thumb_func_end ov15_021FECC4

	thumb_func_start ov15_021FECD8
ov15_021FECD8: ; 0x021FECD8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r1, #0
	mov r1, #0x2f
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	add r2, #0x78
	add r1, r2, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FED20 ; =0x000F0E00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r3, #0x14
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021FED20: .word 0x000F0E00
	thumb_func_end ov15_021FECD8

	thumb_func_start ov15_021FED24
ov15_021FED24: ; 0x021FED24
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x24
	mov r1, #1
	bl ClearFrameAndWindow2
	add r4, #0x24
	add r0, r4, #0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov15_021FED24

	thumb_func_start ov15_021FED3C
ov15_021FED3C: ; 0x021FED3C
	push {r4, lr}
	add r4, r0, #0
	bl ov15_021FED24
	add r0, r4, #0
	bl ov15_021FE3E0
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov15_021FF97C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov15_021FED3C

	thumb_func_start ov15_021FED58
ov15_021FED58: ; 0x021FED58
	ldr r3, _021FED5C ; =ov15_021FE3E0
	bx r3
	.balign 4, 0
_021FED5C: .word ov15_021FE3E0
	thumb_func_end ov15_021FED58

	thumb_func_start ov15_021FED60
ov15_021FED60: ; 0x021FED60
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x24
	mov r1, #0xff
	bl FillWindowPixelBuffer
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x2e
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #0x82
	mov r1, #6
	bl String_ctor
	ldr r1, _021FEDE0 ; =0x00000672
	add r4, r0, #0
	ldrb r1, [r5, r1]
	add r0, r5, #0
	mov r2, #0
	bl ov15_021FE584
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	ldr r2, _021FEDE4 ; =0x000003E2
	add r0, #0x24
	mov r1, #1
	mov r3, #0xc
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FEDE8 ; =0x00010200
	mov r1, #1
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x24
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r5, #0x24
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021FEDE0: .word 0x00000672
_021FEDE4: .word 0x000003E2
_021FEDE8: .word 0x00010200
	thumb_func_end ov15_021FED60

	thumb_func_start ov15_021FEDEC
ov15_021FEDEC: ; 0x021FEDEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	mov r0, #0x1a
	lsl r0, r0, #6
	str r1, [sp, #0x10]
	ldrsh r1, [r5, r0]
	mov r0, #0xfa
	lsl r0, r0, #2
	cmp r1, r0
	blt _021FEE06
	bl GF_AssertFail
_021FEE06:
	mov r0, #2
	mov r1, #6
	bl String_ctor
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	cmp r0, #2
	bne _021FEE1A
	mov r4, #0xa
	b _021FEE1C
_021FEE1A:
	mov r4, #0x64
_021FEE1C:
	mov r0, #0x1a
	lsl r0, r0, #6
	ldrsh r7, [r5, r0]
	ldr r0, [sp, #0x10]
	mov r6, #0
	cmp r0, #0
	bls _021FEE96
	add r5, #0xb4
_021FEE2C:
	add r0, r7, #0
	add r1, r4, #0
	bl _u32_div_f
	str r0, [sp, #0x18]
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	mov r2, #1
	mov r3, #0
	bl String16_FormatInteger
	ldr r0, [sp, #0x18]
	add r1, r0, #0
	mul r1, r4
	sub r7, r7, r1
	add r0, r4, #0
	mov r1, #0xa
	bl _u32_div_f
	add r4, r0, #0
	add r0, r6, #0
	add r0, #0x11
	lsl r0, r0, #4
	str r0, [sp, #0x1c]
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FEEA0 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x14]
	add r0, r5, r0
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x1c]
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x10]
	add r6, r6, #1
	cmp r6, r0
	blo _021FEE2C
_021FEE96:
	ldr r0, [sp, #0x14]
	bl String_dtor
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FEEA0: .word 0x00010200
	thumb_func_end ov15_021FEDEC

	thumb_func_start ov15_021FEEA4
ov15_021FEEA4: ; 0x021FEEA4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x37
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r3, #0x1a
	add r2, r0, #4
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	lsl r3, r3, #6
	mul r0, r1
	add r1, r2, r0
	ldrsh r0, [r5, r3]
	cmp r0, #1
	ble _021FEEEA
	mov r2, #6
	ldrsh r2, [r1, r2]
	sub r3, #0x3c
	ldr r1, [r5, r3]
	add r0, r5, #0
	add r1, r2, r1
	sub r1, #8
	mov r2, #0
	bl ov15_021FE5A4
	b _021FEEFE
_021FEEEA:
	mov r2, #6
	ldrsh r2, [r1, r2]
	sub r3, #0x3c
	ldr r1, [r5, r3]
	add r0, r5, #0
	add r1, r2, r1
	sub r1, #8
	mov r2, #0
	bl ov15_021FE584
_021FEEFE:
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	mov r2, #0x1a
	mov r0, #0xbd
	str r1, [sp, #4]
	lsl r2, r2, #6
	lsl r0, r0, #2
	ldrsh r2, [r5, r2]
	ldr r0, [r5, r0]
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FEF40 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	mov r1, #0
	bl ov15_021FEF48
	ldr r1, _021FEF44 ; =0x00000616
	strb r0, [r5, r1]
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021FEF40: .word 0x000005E4
_021FEF44: .word 0x00000616
	thumb_func_end ov15_021FEEA4

	thumb_func_start ov15_021FEF48
ov15_021FEF48: ; 0x021FEF48
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	cmp r1, #0
	bne _021FEF58
	add r4, r5, #0
	add r4, #0x34
	b _021FEF6C
_021FEF58:
	mov r0, #0x81
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _021FEF66
	bl GF_AssertFail
_021FEF66:
	mov r0, #0x81
	lsl r0, r0, #2
	add r4, r5, r0
_021FEF6C:
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r2, _021FEFB8 ; =0x000003E2
	add r0, r4, #0
	mov r1, #1
	mov r3, #0xc
	bl DrawFrameAndWindow2
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl Options_GetTextFrameDelay
	mov r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _021FEFBC ; =ov15_021FEFC4
	ldr r2, _021FEFC0 ; =0x000005E4
	str r0, [sp, #8]
	ldr r2, [r5, r2]
	add r0, r4, #0
	mov r1, #1
	bl AddTextPrinterParameterized
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021FEFB8: .word 0x000003E2
_021FEFBC: .word ov15_021FEFC4
_021FEFC0: .word 0x000005E4
	thumb_func_end ov15_021FEF48

	thumb_func_start ov15_021FEFC4
ov15_021FEFC4: ; 0x021FEFC4
	push {r3, lr}
	cmp r1, #4
	bhi _021FEFFC
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FEFD6: ; jump table
	.short _021FEFFC - _021FEFD6 - 2 ; case 0
	.short _021FEFE0 - _021FEFD6 - 2 ; case 1
	.short _021FEFE6 - _021FEFD6 - 2 ; case 2
	.short _021FEFEC - _021FEFD6 - 2 ; case 3
	.short _021FEFF4 - _021FEFD6 - 2 ; case 4
_021FEFE0:
	bl GF_IsAnySEPlaying
	pop {r3, pc}
_021FEFE6:
	bl IsFanfarePlaying
	pop {r3, pc}
_021FEFEC:
	ldr r0, _021FF000 ; =SEQ_SE_DP_PC_LOGIN
	bl PlaySE
	b _021FEFFC
_021FEFF4:
	ldr r0, _021FF000 ; =SEQ_SE_DP_PC_LOGIN
	bl IsSEPlaying
	pop {r3, pc}
_021FEFFC:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_021FF000: .word SEQ_SE_DP_PC_LOGIN
	thumb_func_end ov15_021FEFC4

	thumb_func_start ov15_021FF004
ov15_021FF004: ; 0x021FF004
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4]
	add r2, sp, #0
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #0x81
	str r0, [sp, #8]
	mov r0, #9
	str r0, [sp, #0xc]
	mov r0, #0x19
	strb r0, [r2, #0x10]
	mov r0, #6
	strb r0, [r2, #0x11]
	ldrb r3, [r2, #0x12]
	mov r1, #0xf
	bic r3, r1
	strb r3, [r2, #0x12]
	ldrb r3, [r2, #0x12]
	mov r1, #0xf0
	bic r3, r1
	strb r3, [r2, #0x12]
	ldrb r3, [r2, #0x12]
	bic r3, r1
	strb r3, [r2, #0x12]
	mov r1, #0
	strb r1, [r2, #0x13]
	bl sub_0201660C
	ldr r1, _021FF054 ; =0x00000804
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, sp, #0
	bl sub_020166FC
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_021FF054: .word 0x00000804
	thumb_func_end ov15_021FF004

	thumb_func_start ov15_021FF058
ov15_021FF058: ; 0x021FF058
	ldr r1, _021FF060 ; =0x00000804
	ldr r3, _021FF064 ; =sub_02016624
	ldr r0, [r0, r1]
	bx r3
	.balign 4, 0
_021FF060: .word 0x00000804
_021FF064: .word sub_02016624
	thumb_func_end ov15_021FF058

	thumb_func_start ov15_021FF068
ov15_021FF068: ; 0x021FF068
	push {r4, r5, r6, lr}
	sub sp, #0x10
	mov r6, #0x89
	add r5, r0, #0
	lsl r6, r6, #2
	add r0, r5, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #0
	add r0, #0xcc
	ldr r0, [r5, r0]
	mov r1, #0x53
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, _021FF0F0 ; =0x00000684
	add r0, r6, #0
	ldr r3, [r5, r2]
	sub r2, r2, #4
	ldrsh r2, [r5, r2]
	add r0, #0xd0
	ldr r0, [r5, r0]
	mul r2, r3
	mov r1, #0
	mov r3, #6
	bl BufferIntegerAsString
	add r0, r6, #0
	ldr r1, _021FF0F4 ; =0x000005E4
	add r0, #0xd0
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl StringExpandPlaceholders
	ldr r1, _021FF0F4 ; =0x000005E4
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r0, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF0F8 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	ldr r2, _021FF0F4 ; =0x000005E4
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	add r0, r5, r6
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	add r0, r5, r6
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021FF0F0: .word 0x00000684
_021FF0F4: .word 0x000005E4
_021FF0F8: .word 0x00010200
	thumb_func_end ov15_021FF068

	thumb_func_start ov15_021FF0FC
ov15_021FF0FC: ; 0x021FF0FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #1
	add r7, r1, #0
	lsl r0, r0, #8
	mov r1, #6
	bl String_ctor
	mov r6, #0x85
	add r4, r0, #0
	lsl r6, r6, #2
	cmp r7, #0
	bne _021FF14E
	add r0, r5, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r6, #0
	add r0, #0xdc
	ldr r0, [r5, r0]
	mov r1, #0x50
	bl NewString_ReadMsgData
	add r7, r0, #0
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF1DC ; =0x00010200
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, r5, r6
	mov r3, #4
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	b _021FF160
_021FF14E:
	mov r0, #0x48
	mov r1, #0
	str r0, [sp]
	mov r3, #0x10
	add r0, r5, r6
	add r2, r1, #0
	str r3, [sp, #4]
	bl FillWindowPixelRect
_021FF160:
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x51
	bl NewString_ReadMsgData
	str r0, [sp, #0x10]
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl PlayerProfile_GetMoney
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	mov r3, #6
	bl BufferIntegerAsString
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x10]
	add r1, r4, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r7, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF1DC ; =0x00010200
	add r7, #8
	mov r3, #0x44
	str r0, [sp, #8]
	mov r1, #0
	add r0, r5, r6
	add r2, r4, #0
	sub r3, r3, r7
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, r6
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r4, #0
	bl String_dtor
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FF1DC: .word 0x00010200
	thumb_func_end ov15_021FF0FC

	thumb_func_start ov15_021FF1E0
ov15_021FF1E0: ; 0x021FF1E0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x54
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r2, _021FF294 ; =0x000003F7
	add r0, r4, #0
	mov r1, #1
	mov r3, #0xe
	bl DrawFrameAndWindow1
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x73
	bl NewString_ReadMsgData
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r6, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r6, #0
	bl String_dtor
	mov r0, #0x2f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0x74
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #2
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0xbd
	ldr r1, _021FF298 ; =0x000005E4
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	ldr r1, _021FF298 ; =0x000005E4
	mov r0, #0
	ldr r1, [r5, r1]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r1, #0
	ldr r2, _021FF298 ; =0x000005E4
	str r1, [sp, #8]
	ldr r2, [r5, r2]
	mov r5, #0x58
	add r0, r4, #0
	sub r3, r5, r3
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_021FF294: .word 0x000003F7
_021FF298: .word 0x000005E4
	thumb_func_end ov15_021FF1E0

	thumb_func_start ov15_021FF29C
ov15_021FF29C: ; 0x021FF29C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x2f
	lsl r0, r0, #4
	add r6, r1, #0
	ldr r0, [r5, r0]
	mov r1, #8
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x74
	mov r1, #0
	bl FillWindowPixelBuffer
	cmp r6, #0
	bne _021FF2EE
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0
	add r3, r0, #0
	mov r6, #0x30
	sub r3, r6, r3
	lsr r3, r3, #1
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF31C ; =0x000F0E00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x74
	add r3, #8
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	b _021FF308
_021FF2EE:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF31C ; =0x000F0E00
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x74
	mov r3, #5
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_021FF308:
	add r5, #0x74
	add r0, r5, #0
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021FF31C: .word 0x000F0E00
	thumb_func_end ov15_021FF29C

	thumb_func_start ov15_021FF320
ov15_021FF320: ; 0x021FF320
	push {r4, r5, r6, r7}
	add r3, r1, #0
	add r1, r2, #0
	ldr r2, _021FF360 ; =ov15_022008C8
	mov r5, #0
	ldrb r6, [r2, r3]
	add r4, r5, #0
	cmp r6, #0
	ble _021FF35A
	ldr r7, [r0]
	ldrb r2, [r2, r3]
	add r0, r7, #0
	add r6, r5, #0
	add r1, r1, #1
_021FF33C:
	ldrh r3, [r0]
	cmp r3, #0
	beq _021FF350
	add r3, r7, r6
	ldrh r3, [r3, #2]
	cmp r3, #0
	beq _021FF350
	add r5, r5, #1
	cmp r5, r1
	beq _021FF35A
_021FF350:
	add r4, r4, #1
	add r0, r0, #4
	add r6, r6, #4
	cmp r4, r2
	blt _021FF33C
_021FF35A:
	add r0, r4, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_021FF360: .word ov15_022008C8
	thumb_func_end ov15_021FF320

	thumb_func_start ov15_021FF364
ov15_021FF364: ; 0x021FF364
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	str r1, [sp, #0x10]
	add r2, r0, #4
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	str r3, [sp, #0x14]
	mul r0, r1
	add r0, r2, r0
	mov r1, #6
	str r0, [sp, #0x24]
	ldrb r2, [r0, #9]
	ldrsh r0, [r0, r1]
	sub r0, r2, r0
	str r0, [sp, #0x20]
	cmp r0, #6
	ble _021FF392
	str r1, [sp, #0x20]
_021FF392:
	ldr r0, _021FF4DC ; =0x0000068A
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _021FF3A2
	mov r0, #0
	str r0, [sp, #0x18]
	mov r4, #6
	b _021FF3A8
_021FF3A2:
	mov r0, #6
	str r0, [sp, #0x18]
	mov r4, #0
_021FF3A8:
	ldr r1, _021FF4DC ; =0x0000068A
	mov r0, #1
	ldrb r2, [r5, r1]
	eor r0, r2
	strb r0, [r5, r1]
	add r0, r5, #0
	bl ov15_021FE17C
	mov r0, #0
	add r7, r5, #0
	ldr r6, [sp, #0x18]
	str r0, [sp, #0x2c]
	add r7, #0xb4
_021FF3C2:
	lsl r0, r6, #4
	add r0, r7, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	lsl r0, r4, #4
	add r0, r7, r0
	bl ClearWindowTilemapAndScheduleTransfer
	ldr r0, [sp, #0x2c]
	add r6, r6, #1
	add r0, r0, #1
	add r4, r4, #1
	str r0, [sp, #0x2c]
	cmp r0, #6
	blt _021FF3C2
	mov r1, #0x8d
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	mov r0, #0
	add r1, #0x64
	ldrb r1, [r1]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x10]
	bl ov15_021FF320
	add r4, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, #0x64
	ldrb r1, [r0]
	ldr r0, _021FF4E0 ; =ov15_022008C8
	ldrb r0, [r0, r1]
	cmp r4, r0
	bge _021FF4BE
	lsl r0, r4, #2
	str r0, [sp, #0x1c]
	add r7, r5, r0
	add r0, r5, #0
	str r0, [sp, #0x30]
	add r0, #0xb4
	ldr r6, [sp, #0x18]
	str r0, [sp, #0x30]
_021FF41C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x1c]
	ldr r0, [r0]
	ldr r2, [sp, #0x1c]
	add r1, r0, r1
	ldrh r0, [r0, r2]
	cmp r0, #0
	beq _021FF4A2
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _021FF4A2
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _021FF450
	ldr r1, [sp, #0x30]
	lsl r2, r6, #4
	add r1, r1, r2
	mov r2, #0x35
	str r4, [sp]
	lsl r2, r2, #4
	ldr r2, [r7, r2]
	ldr r3, [sp, #0x24]
	add r0, r5, #0
	bl ov15_021FF570
	b _021FF494
_021FF450:
	ldr r0, _021FF4E4 ; =0x00000672
	ldrb r0, [r5, r0]
	cmp r4, r0
	bne _021FF470
	ldr r1, [sp, #0x30]
	lsl r2, r6, #4
	add r1, r1, r2
	mov r2, #0x35
	str r4, [sp]
	lsl r2, r2, #4
	ldr r2, [r7, r2]
	ldr r3, [sp, #0x24]
	add r0, r5, #0
	bl ov15_021FF570
	b _021FF494
_021FF470:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF4E8 ; =0x00010200
	mov r2, #0x35
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	lsl r2, r2, #4
	ldr r0, [sp, #0x30]
	lsl r1, r6, #4
	add r0, r0, r1
	mov r1, #0
	ldr r2, [r7, r2]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
_021FF494:
	ldr r0, [sp, #0x28]
	add r6, r6, #1
	add r1, r0, #1
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x28]
	cmp r1, r0
	bge _021FF4BE
_021FF4A2:
	ldr r0, [sp, #0x1c]
	add r4, r4, #1
	add r0, r0, #4
	str r0, [sp, #0x1c]
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r7, r7, #4
	add r0, #0x64
	ldrb r1, [r0]
	ldr r0, _021FF4E0 ; =ov15_022008C8
	ldrb r0, [r0, r1]
	cmp r4, r0
	blt _021FF41C
_021FF4BE:
	mov r4, #0
	add r5, #0xb4
_021FF4C2:
	ldr r0, [sp, #0x18]
	lsl r0, r0, #4
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	ldr r0, [sp, #0x18]
	add r4, r4, #1
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r4, #6
	blt _021FF4C2
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FF4DC: .word 0x0000068A
_021FF4E0: .word ov15_022008C8
_021FF4E4: .word 0x00000672
_021FF4E8: .word 0x00010200
	thumb_func_end ov15_021FF364

	thumb_func_start ov15_021FF4EC
ov15_021FF4EC: ; 0x021FF4EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	mov r0, #0x8d
	add r7, r2, #0
	lsl r0, r0, #2
	ldr r2, [r6, r0]
	add r5, r6, #0
	add r0, r2, #4
	add r2, #0x64
	str r0, [sp, #4]
	ldrb r2, [r2]
	mov r0, #0xc
	add r7, r7, r1
	mul r0, r2
	str r0, [sp, #8]
	mov r4, #0
	add r5, #0xb4
_021FF510:
	add r0, r5, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #6
	blt _021FF510
	add r0, r6, #0
	bl ov15_021FE1D0
	add r0, r6, #0
	add r0, #0x64
	bl ClearWindowTilemapAndScheduleTransfer
	add r0, r6, #0
	bl ov15_021FE204
	lsl r2, r7, #2
	add r3, r6, r2
	mov r2, #0x35
	mov r1, #0x5d
	lsl r1, r1, #2
	str r7, [sp]
	lsl r2, r2, #4
	ldr r2, [r3, r2]
	ldr r4, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r6, #0
	add r1, r6, r1
	add r3, r4, r3
	bl ov15_021FF570
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r6, r0
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov15_021FF4EC

	thumb_func_start ov15_021FF560
ov15_021FF560: ; 0x021FF560
	mov r1, #0x5d
	lsl r1, r1, #2
	ldr r3, _021FF56C ; =ClearWindowTilemapAndScheduleTransfer
	add r0, r0, r1
	bx r3
	nop
_021FF56C: .word ClearWindowTilemapAndScheduleTransfer
	thumb_func_end ov15_021FF560

	thumb_func_start ov15_021FF570
ov15_021FF570: ; 0x021FF570
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r3, #0
	add r5, r0, #0
	ldrb r0, [r4, #8]
	add r6, r1, #0
	cmp r0, #3
	beq _021FF586
	cmp r0, #7
	beq _021FF5D8
	b _021FF632
_021FF586:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF668 ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	add r0, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x28]
	ldr r2, [r4]
	lsl r7, r0, #2
	add r0, r5, #0
	add r1, r6, #0
	add r2, r2, r7
	mov r3, #0x10
	bl ov15_021FE914
	ldr r3, [r4]
	mov r0, #0x52
	ldrh r1, [r3, r7]
	lsl r0, r0, #2
	cmp r1, r0
	blo _021FF662
	add r0, #0x5b
	cmp r1, r0
	bhi _021FF662
	mov r1, #0xbd
	lsl r1, r1, #2
	add r3, r3, r7
	ldr r0, [r5, r1]
	sub r1, r1, #4
	ldrh r3, [r3, #2]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ov15_021FF66C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021FF5D8:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF668 ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	add r0, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x28]
	lsl r7, r0, #2
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Bag_GetRegisteredItemSlot1
	ldr r1, [r4]
	ldrh r1, [r1, r7]
	cmp r1, r0
	bne _021FF610
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x10
	mov r3, #0
	bl ov15_021FE9F0
_021FF610:
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Bag_GetRegisteredItemSlot2
	ldr r1, [r4]
	ldrh r1, [r1, r7]
	cmp r1, r0
	bne _021FF662
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x10
	mov r3, #1
	bl ov15_021FE9F0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021FF632:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF668 ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	add r0, r6, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r3, [sp, #0x28]
	mov r1, #0xbd
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, r1, #4
	ldr r4, [r4]
	lsl r3, r3, #2
	add r3, r4, r3
	ldrh r3, [r3, #2]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ov15_021FF66C
_021FF662:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FF668: .word 0x00010200
	thumb_func_end ov15_021FF570

	thumb_func_start ov15_021FF66C
ov15_021FF66C: ; 0x021FF66C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r1, #0
	mov r1, #0
	add r6, r2, #0
	str r1, [sp]
	mov r2, #1
	str r2, [sp, #4]
	add r2, r3, #0
	add r5, r0, #0
	mov r3, #3
	bl BufferIntegerAsString
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x57
	mov r3, #6
	bl ReadMsgData_ExpandPlaceholders
	add r4, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF6B8 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r4, #0
	mov r3, #0x30
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021FF6B8: .word 0x00010200
	thumb_func_end ov15_021FF66C

	thumb_func_start ov15_021FF6BC
ov15_021FF6BC: ; 0x021FF6BC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r5, r1, #0
	add r0, r2, r3
	mov r1, #6
	bl _s32_div_f
	add r6, r0, #0
	cmp r5, #0
	bne _021FF6D6
	mov r5, #1
	b _021FF6E0
_021FF6D6:
	add r0, r5, #5
	mov r1, #6
	bl _s32_div_f
	add r5, r0, #0
_021FF6E0:
	add r0, r4, #0
	add r0, #0x64
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xbd
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	add r2, r6, #1
	mov r3, #3
	bl BufferIntegerAsString
	mov r1, #1
	str r1, [sp]
	mov r0, #0xbd
	str r1, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r2, r5, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r1, #0xbd
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	sub r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x16
	mov r3, #6
	bl ReadMsgData_ExpandPlaceholders
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF754 ; =0x000F0100
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x64
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r4, #0x64
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021FF754: .word 0x000F0100
	thumb_func_end ov15_021FF6BC

	thumb_func_start ov15_021FF758
ov15_021FF758: ; 0x021FF758
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	mov r1, #0
	add r6, r0, #0
	add r5, r2, #0
	bl FillWindowPixelBuffer
	cmp r5, #0xff
	beq _021FF79E
	lsl r5, r5, #2
	add r0, r6, #0
	bl GetWindowWidth
	add r7, r0, #0
	mov r0, #0
	ldr r1, [r4, r5]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021FF7A8 ; =0x000F0E00
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r4, r5]
	lsl r4, r7, #3
	sub r3, r4, r3
	add r0, r6, #0
	lsr r3, r3, #1
	bl AddTextPrinterParameterized2
_021FF79E:
	add r0, r6, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FF7A8: .word 0x000F0E00
	thumb_func_end ov15_021FF758

	thumb_func_start ov15_021FF7AC
ov15_021FF7AC: ; 0x021FF7AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_021FF7B2:
	add r0, r5, #0
	bl ClearWindowTilemapAndScheduleTransfer
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #4
	blt _021FF7B2
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov15_021FF7AC

	thumb_func_start ov15_021FF7C4
ov15_021FF7C4: ; 0x021FF7C4
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021FF7F8 ; =0x000F0E00
	add r2, #0xf5
	str r0, [sp, #8]
	add r0, r4, r2
	mov r2, #0xc5
	str r1, [sp, #0xc]
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	mov r3, #5
	bl AddTextPrinterParameterized2
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	nop
_021FF7F8: .word 0x000F0E00
	thumb_func_end ov15_021FF7C4

	thumb_func_start ov15_021FF7FC
ov15_021FF7FC: ; 0x021FF7FC
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _021FF830 ; =0x000F0E00
	add r2, #0xf5
	str r0, [sp, #8]
	add r0, r4, r2
	mov r2, #0xcd
	str r1, [sp, #0xc]
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	mov r3, #5
	bl AddTextPrinterParameterized2
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r4, pc}
	nop
_021FF830: .word 0x000F0E00
	thumb_func_end ov15_021FF7FC

	thumb_func_start ov15_021FF834
ov15_021FF834: ; 0x021FF834
	mov r1, #0x7d
	lsl r1, r1, #2
	ldr r3, _021FF840 ; =ClearWindowTilemapAndScheduleTransfer
	add r0, r0, r1
	bx r3
	nop
_021FF840: .word ClearWindowTilemapAndScheduleTransfer
	thumb_func_end ov15_021FF834

	thumb_func_start ov15_021FF844
ov15_021FF844: ; 0x021FF844
	ldr r3, _021FF84C ; =ClearWindowTilemapAndScheduleTransfer
	add r0, #0x74
	bx r3
	nop
_021FF84C: .word ClearWindowTilemapAndScheduleTransfer
	thumb_func_end ov15_021FF844

	thumb_func_start ov15_021FF850
ov15_021FF850: ; 0x021FF850
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0x20
	mov r1, #6
	bl GF_CreateVramTransferManager
	add r0, r4, #0
	bl ov15_021FFA40
	add r0, r4, #0
	bl ov15_021FFAD0
	add r0, r4, #0
	bl ov15_021FFDD8
	mov r0, #0x92
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200CF6C
	mov r2, #1
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	pop {r4, pc}
	thumb_func_end ov15_021FF850

	thumb_func_start ov15_021FF894
ov15_021FF894: ; 0x021FF894
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r7, #0x25
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #4
_021FF8A0:
	ldr r0, [r5, r7]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x27
	blo _021FF8A0
	mov r1, #0x92
	lsl r1, r1, #2
	ldr r0, [r6, r1]
	add r1, r1, #4
	ldr r1, [r6, r1]
	bl sub_0200D998
	mov r0, #0x92
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200D108
	ldr r0, _021FF8D0 ; =0x0000069C
	ldr r0, [r6, r0]
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FF8D0: .word 0x0000069C
	thumb_func_end ov15_021FF894

	thumb_func_start ov15_021FF8D4
ov15_021FF8D4: ; 0x021FF8D4
	push {r4, r5, r6, lr}
	mov r6, #0x25
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #4
_021FF8DE:
	ldr r0, [r5, r6]
	bl sub_0200DC18
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x27
	blo _021FF8DE
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov15_021FF8D4

	thumb_func_start ov15_021FF8F0
ov15_021FF8F0: ; 0x021FF8F0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	add r0, r6, #0
	mov r1, #1
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FF948 ; =0x0000C0FC
	mov r1, #0x92
	add r0, r4, r0
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x12
	bl sub_0200E248
	add r0, r6, #0
	mov r1, #2
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FF94C ; =0x0000C0FB
	mov r1, #0x92
	add r0, r4, r0
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x12
	bl sub_0200E27C
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021FF948: .word 0x0000C0FC
_021FF94C: .word 0x0000C0FB
	thumb_func_end ov15_021FF8F0

	thumb_func_start ov15_021FF950
ov15_021FF950: ; 0x021FF950
	ldr r1, _021FF960 ; =0x0000064B
	mov r2, #0
	strb r2, [r0, r1]
	mov r2, #1
	sub r1, r1, #3
	strb r2, [r0, r1]
	bx lr
	nop
_021FF960: .word 0x0000064B
	thumb_func_end ov15_021FF950

	thumb_func_start ov15_021FF964
ov15_021FF964: ; 0x021FF964
	push {r3, lr}
	ldr r1, _021FF978 ; =0x00000648
	ldrb r1, [r0, r1]
	cmp r1, #0
	beq _021FF976
	cmp r1, #1
	bne _021FF976
	bl ov15_021FFEC0
_021FF976:
	pop {r3, pc}
	.balign 4, 0
_021FF978: .word 0x00000648
	thumb_func_end ov15_021FF964

	thumb_func_start ov15_021FF97C
ov15_021FF97C: ; 0x021FF97C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x9b
	lsl r0, r0, #2
	add r4, r2, #0
	add r6, r1, #0
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_0200DCE8
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_0200DCE8
	cmp r4, #0
	beq _021FFA34
	add r0, r6, #0
	bl TMHMGetMove
	mov r1, #3
	add r4, r0, #0
	bl GetWazaAttr
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r4, #0
	mov r1, #1
	bl GetWazaAttr
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	bl sub_020776B4
	add r7, r0, #0
	add r0, r6, #0
	bl sub_02077678
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, _021FFA38 ; =0x0000C103
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r7, #0
	bl sub_0200E248
	add r0, r6, #0
	bl sub_0207769C
	add r1, r0, #0
	mov r0, #0x9b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r1, #4
	bl sub_0200DD10
	bl sub_02077830
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02077800
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, _021FFA3C ; =0x0000C104
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl sub_0200E248
	add r0, r4, #0
	bl sub_02077818
	add r1, r0, #0
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r1, #4
	bl sub_0200DD10
_021FFA34:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FFA38: .word 0x0000C103
_021FFA3C: .word 0x0000C104
	thumb_func_end ov15_021FF97C

	thumb_func_start ov15_021FFA40
ov15_021FFA40: ; 0x021FFA40
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	ldr r3, _021FFAC4 ; =ov15_022009BC
	add r2, sp, #0x34
	add r4, r0, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #6
	bl sub_0200CF18
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl sub_0200CF38
	mov r7, #0x93
	lsl r7, r7, #2
	add r2, sp, #0x14
	ldr r3, _021FFAC8 ; =ov15_022009F4
	str r0, [r4, r7]
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	ldr r5, _021FFACC ; =ov15_022009A8
	stmia r2!, {r0, r1}
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [r3]
	sub r0, r7, #4
	ldr r0, [r4, r0]
	mov r3, #0x20
	bl sub_0200CF70
	sub r1, r7, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x27
	bl sub_0200CFF4
	sub r1, r7, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0x34
	bl sub_0200D3F8
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	nop
_021FFAC4: .word ov15_022009BC
_021FFAC8: .word ov15_022009F4
_021FFACC: .word ov15_022009A8
	thumb_func_end ov15_021FFA40

	thumb_func_start ov15_021FFAD0
ov15_021FFAD0: ; 0x021FFAD0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _021FFDAC ; =0x0000C0F9
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x1a
	bl sub_0200D4A4
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _021FFDB0 ; =0x0000C0FA
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #6
	bl sub_0200D4A4
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021FFDB4 ; =0x0000C0FB
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x33
	bl sub_0200D4A4
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _021FFDB8 ; =0x0000C102
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x3c
	mov r3, #4
	bl sub_0200D4A4
	mov r4, #0
	add r6, r4, #0
	mov r7, #2
_021FFB54:
	mov r0, #0
	mov r1, #1
	bl GetItemIndexMapping
	add r3, r0, #0
	ldr r0, _021FFDBC ; =0x0000C0FC
	str r6, [sp]
	mov r1, #0x93
	str r7, [sp, #4]
	add r0, r4, r0
	str r0, [sp, #8]
	mov r0, #0x92
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	mov r2, #0x12
	bl sub_0200D4A4
	add r4, r4, #1
	cmp r4, #6
	blt _021FFB54
	ldr r0, _021FFDC0 ; =0x0000C103
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #1
	mov r3, #0
	bl sub_020776B8
	ldr r0, _021FFDC4 ; =0x0000C104
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #1
	mov r3, #0
	bl sub_02077834
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _021FFDAC ; =0x0000C0F9
	mov r1, #0x92
	mov r2, #0xf
	lsl r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r3, r2, #0
	bl sub_0200D564
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _021FFDC8 ; =0x0000C101
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x3c
	mov r3, #0xa
	bl sub_0200D564
	mov r1, #0x92
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r3, _021FFDB8 ; =0x0000C102
	mov r2, #1
	bl sub_020776EC
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, _021FFDB0 ; =0x0000C0FA
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x2f
	bl sub_0200D564
	mov r4, #0
	add r6, r4, #0
	mov r7, #1
_021FFC2A:
	mov r0, #0
	mov r1, #2
	bl GetItemIndexMapping
	str r6, [sp]
	add r3, r0, #0
	mov r1, #0x93
	str r7, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, _021FFDB4 ; =0x0000C0FB
	lsl r1, r1, #2
	add r0, r4, r0
	str r0, [sp, #0xc]
	mov r0, #0x92
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	mov r2, #0x12
	bl sub_0200D564
	add r4, r4, #1
	cmp r4, #6
	blt _021FFC2A
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDAC ; =0x0000C0F9
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x19
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDB0 ; =0x0000C0FA
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #5
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDB4 ; =0x0000C0FB
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x31
	bl sub_0200D6D4
	bl GetItemIconCell
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDBC ; =0x0000C0FC
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x12
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDCC ; =0x0000C0FD
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x3c
	mov r3, #5
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDAC ; =0x0000C0F9
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x15
	bl sub_0200D704
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDB0 ; =0x0000C0FA
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x18
	bl sub_0200D704
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDB4 ; =0x0000C0FB
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #4
	bl sub_0200D704
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDBC ; =0x0000C0FC
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0xf
	mov r3, #0x32
	bl sub_0200D704
	bl GetItemIconAnim
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDCC ; =0x0000C0FD
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x12
	bl sub_0200D704
	mov r0, #0
	str r0, [sp]
	ldr r0, _021FFDD0 ; =0x0000C0FE
	mov r1, #0x92
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x3c
	mov r3, #6
	bl sub_0200D704
	mov r1, #0x92
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r2, _021FFDD0 ; =0x0000C0FE
	ldr r1, [r5, r1]
	add r3, r2, #1
	bl sub_0207775C
	mov r2, #0x6a
	lsl r2, r2, #4
	mov r0, #0xf
	mov r1, #0x30
	add r2, r5, r2
	mov r3, #6
	bl GfGfxLoader_GetPlttData
	ldr r1, _021FFDD4 ; =0x0000069C
	str r0, [r5, r1]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FFDAC: .word 0x0000C0F9
_021FFDB0: .word 0x0000C0FA
_021FFDB4: .word 0x0000C0FB
_021FFDB8: .word 0x0000C102
_021FFDBC: .word 0x0000C0FC
_021FFDC0: .word 0x0000C103
_021FFDC4: .word 0x0000C104
_021FFDC8: .word 0x0000C101
_021FFDCC: .word 0x0000C0FD
_021FFDD0: .word 0x0000C0FE
_021FFDD4: .word 0x0000069C
	thumb_func_end ov15_021FFAD0

	thumb_func_start ov15_021FFDD8
ov15_021FFDD8: ; 0x021FFDD8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r4, _021FFEBC ; =ov15_02200B0C
	mov r7, #0
	add r5, r6, #0
_021FFDE2:
	mov r0, #0x92
	mov r1, #0x93
	lsl r0, r0, #2
	lsl r1, r1, #2
	mov r3, #1
	ldr r0, [r6, r0]
	ldr r1, [r6, r1]
	add r2, r4, #0
	lsl r3, r3, #0x14
	bl sub_0200D740
	mov r1, #0x25
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r7, r7, #1
	add r4, #0x34
	add r5, r5, #4
	cmp r7, #0x27
	blo _021FFDE2
	add r0, r1, #0
	add r0, #0x4c
	ldr r0, [r6, r0]
	mov r1, #1
	bl sub_0200DD54
	mov r7, #0xb
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #6
_021FFE1C:
	ldr r0, [r4, r7]
	mov r1, #1
	bl sub_0200DD54
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #4
	blo _021FFE1C
	mov r7, #0x9d
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_021FFE34:
	ldr r0, [r4, r7]
	mov r1, #1
	bl sub_0200DD54
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #8
	blo _021FFE34
	add r0, r6, #0
	mov r1, #1
	bl ov15_02200458
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x9b
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r7, #0xb
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #6
_021FFE78:
	ldr r0, [r4, r7]
	mov r1, #0
	bl sub_0200DCE8
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #4
	blo _021FFE78
	mov r7, #0x2d
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #4
_021FFE90:
	ldr r0, [r4, r7]
	mov r1, #0
	bl sub_0200DCE8
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #6
	blo _021FFE90
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #1
	bl sub_0200DD54
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FFEBC: .word ov15_02200B0C
	thumb_func_end ov15_021FFDD8

	thumb_func_start ov15_021FFEC0
ov15_021FFEC0: ; 0x021FFEC0
	ldr r1, _021FFEC8 ; =0x00000648
	mov r2, #0
	strb r2, [r0, r1]
	bx lr
	.balign 4, 0
_021FFEC8: .word 0x00000648
	thumb_func_end ov15_021FFEC0

	thumb_func_start ov15_021FFECC
ov15_021FFECC: ; 0x021FFECC
	push {r3, r4, r5, lr}
	lsl r4, r1, #2
	ldr r1, _021FFF14 ; =ov15_02200AB8
	ldr r2, _021FFF18 ; =ov15_02200AB9
	add r5, r0, #0
	mov r0, #0x2a
	lsl r0, r0, #4
	mov r3, #1
	ldrb r1, [r1, r4]
	ldrb r2, [r2, r4]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x14
	bl sub_0200DDF4
	ldr r1, _021FFF1C ; =ov15_02200ABA
	mov r0, #0x2a
	lsl r0, r0, #4
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl sub_0200DC4C
	ldr r1, _021FFF20 ; =ov15_02200ABB
	mov r0, #0x2a
	lsl r0, r0, #4
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl sub_0200DD10
	mov r0, #0x2a
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200DCE8
	pop {r3, r4, r5, pc}
	nop
_021FFF14: .word ov15_02200AB8
_021FFF18: .word ov15_02200AB9
_021FFF1C: .word ov15_02200ABA
_021FFF20: .word ov15_02200ABB
	thumb_func_end ov15_021FFECC

	thumb_func_start ov15_021FFF24
ov15_021FFF24: ; 0x021FFF24
	mov r1, #0x2a
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	ldr r3, _021FFF30 ; =sub_0200DCE8
	mov r1, #0
	bx r3
	.balign 4, 0
_021FFF30: .word sub_0200DCE8
	thumb_func_end ov15_021FFF24

	thumb_func_start ov15_021FFF34
ov15_021FFF34: ; 0x021FFF34
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #9
	blt _021FFF42
	bl GF_AssertFail
_021FFF42:
	cmp r4, #8
	bne _021FFF58
	ldr r1, _021FFFC8 ; =ov15_02200A36
	mov r0, #0x2a
	lsl r2, r4, #2
	lsl r0, r0, #4
	ldrb r1, [r1, r2]
	ldr r0, [r5, r0]
	bl sub_0200DC4C
	b _021FFFA0
_021FFF58:
	mov r2, #0x8d
	lsl r2, r2, #2
	ldr r0, [r5, r2]
	add r3, r0, #4
	add r0, #0x64
	ldrb r1, [r0]
	mov r0, #0xc
	mul r0, r1
	add r1, r3, r0
	mov r0, #6
	ldr r3, _021FFFCC ; =0x00000672
	ldrsh r0, [r1, r0]
	ldrb r3, [r5, r3]
	add r0, r0, r4
	cmp r0, r3
	bne _021FFF84
	add r2, #0x6c
	ldr r0, [r5, r2]
	mov r1, #0xa
	bl sub_0200DC4C
	b _021FFFA0
_021FFF84:
	ldrb r1, [r1, #9]
	cmp r0, r1
	blt _021FFF96
	add r2, #0x6c
	ldr r0, [r5, r2]
	mov r1, #0x28
	bl sub_0200DC4C
	b _021FFFA0
_021FFF96:
	add r2, #0x6c
	ldr r0, [r5, r2]
	mov r1, #0x14
	bl sub_0200DC4C
_021FFFA0:
	ldr r1, _021FFFD0 ; =ov15_02200A34
	lsl r4, r4, #2
	ldr r2, _021FFFD4 ; =ov15_02200A35
	mov r0, #0x2a
	lsl r0, r0, #4
	mov r3, #1
	ldrb r1, [r1, r4]
	ldrb r2, [r2, r4]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x14
	bl sub_0200DDF4
	ldr r1, _021FFFD8 ; =ov15_02200A37
	mov r0, #0x2a
	lsl r0, r0, #4
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl sub_0200DD10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021FFFC8: .word ov15_02200A36
_021FFFCC: .word 0x00000672
_021FFFD0: .word ov15_02200A34
_021FFFD4: .word ov15_02200A35
_021FFFD8: .word ov15_02200A37
	thumb_func_end ov15_021FFF34

	thumb_func_start ov15_021FFFDC
ov15_021FFFDC: ; 0x021FFFDC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #8
	blt _021FFFEA
	bl GF_AssertFail
_021FFFEA:
	ldr r1, _02200020 ; =ov15_022009D4
	lsl r4, r4, #2
	ldr r2, _02200024 ; =ov15_022009D5
	mov r0, #0x2a
	lsl r0, r0, #4
	mov r3, #1
	ldrb r1, [r1, r4]
	ldrb r2, [r2, r4]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x14
	bl sub_0200DDF4
	ldr r1, _02200028 ; =ov15_022009D6
	mov r0, #0x2a
	lsl r0, r0, #4
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl sub_0200DC4C
	ldr r1, _0220002C ; =ov15_022009D7
	mov r0, #0x2a
	lsl r0, r0, #4
	ldrb r1, [r1, r4]
	ldr r0, [r5, r0]
	bl sub_0200DD10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02200020: .word ov15_022009D4
_02200024: .word ov15_022009D5
_02200028: .word ov15_022009D6
_0220002C: .word ov15_022009D7
	thumb_func_end ov15_021FFFDC

	thumb_func_start ov15_02200030
ov15_02200030: ; 0x02200030
	push {r3, r4, r5, lr}
	add r5, r1, #0
	cmp r5, #7
	bgt _02200058
	mov r1, #0x6a
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r2, #1
	ldr r4, [r0, #0xc]
	lsl r2, r2, #8
	add r0, r4, r2
	mov r1, #0
	bl GXS_LoadOBJPltt
	lsl r0, r5, #5
	add r0, r4, r0
	lsl r1, r5, #5
	mov r2, #0x20
	bl GXS_LoadOBJPltt
_02200058:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov15_02200030

	thumb_func_start ov15_0220005C
ov15_0220005C: ; 0x0220005C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r6, r1, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	bne _02200096
	mov r4, #0
	mov r6, #0xa9
	add r5, r0, #0
	add r7, r4, #0
	lsl r6, r6, #2
_02200074:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl sub_0200DCE8
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _02200074
	mov r1, #0xaf
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0
	bl sub_0200DCE8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02200096:
	mov r7, #0xa9
	mov r5, #0
	add r4, r0, #0
	lsl r7, r7, #2
_0220009E:
	cmp r5, r6
	bge _022000AC
	ldr r0, [r4, r7]
	mov r1, #1
	bl sub_0200DCE8
	b _022000B8
_022000AC:
	mov r0, #0xa9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
_022000B8:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #6
	blt _0220009E
	ldr r0, [sp, #4]
	cmp r0, #0
	blt _022000DC
	add r0, #0x15
	str r0, [sp, #4]
	lsl r1, r0, #2
	ldr r0, [sp]
	add r1, r0, r1
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
_022000DC:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _022000F0
	mov r1, #0xaf
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0
	bl sub_0200DCE8
_022000F0:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov15_0220005C

	thumb_func_start ov15_022000F4
ov15_022000F4: ; 0x022000F4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r3, [r4, r0]
	add r1, r3, #0
	add r1, #0x64
	ldrb r2, [r1]
	mov r1, #0xc
	mul r1, r2
	add r1, r3, r1
	ldrb r1, [r1, #0xd]
	cmp r1, #6
	bhi _02200128
	add r0, #0x60
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
	pop {r4, pc}
_02200128:
	add r0, #0x60
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	pop {r4, pc}
	thumb_func_end ov15_022000F4

	thumb_func_start ov15_02200140
ov15_02200140: ; 0x02200140
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	ldr r6, _022001BC ; =ov15_02200B0C
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r4, #0
	add r5, r7, #0
_02200152:
	mov r0, #0x95
	mov r1, #0x34
	mov r2, #0x36
	lsl r0, r0, #2
	mov r3, #1
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x14
	bl sub_0200DDF4
	ldr r0, [sp, #4]
	cmp r4, r0
	bge _0220019A
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0220018C
	ldr r3, [sp]
	mov r2, #6
	ldrsh r2, [r3, r2]
	add r0, r7, #0
	add r1, r4, #0
	add r2, r2, r4
	lsl r2, r2, #1
	add r3, r7, r2
	ldr r2, _022001C0 ; =0x000006A4
	ldrh r2, [r3, r2]
	bl ov15_021FF8F0
_0220018C:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200DCE8
	b _022001A6
_0220019A:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
_022001A6:
	add r4, r4, #1
	add r6, #0x34
	add r5, r5, #4
	cmp r4, #6
	blt _02200152
	add r0, r7, #0
	bl ov15_022000F4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022001BC: .word ov15_02200B0C
_022001C0: .word 0x000006A4
	thumb_func_end ov15_02200140

	thumb_func_start ov15_022001C4
ov15_022001C4: ; 0x022001C4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	str r0, [sp]
	add r4, r1, #0
	mov r7, #0
	add r0, r5, #0
	mov r1, #6
	mvn r7, r7
	bl _s32_div_f
	mov r1, #6
	add r2, r0, #0
	ldrsh r3, [r4, r1]
	mul r2, r1
	cmp r3, r2
	bne _022001EC
	add r0, r5, #0
	bl _s32_div_f
	add r7, r1, #0
_022001EC:
	ldr r4, _02200238 ; =ov15_02200B0C
	ldr r5, [sp]
	mov r6, #0
_022001F2:
	mov r0, #0x95
	mov r1, #0x34
	mov r2, #0x36
	lsl r0, r0, #2
	mov r3, #1
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, r0]
	lsl r3, r3, #0x14
	bl sub_0200DDF4
	cmp r6, r7
	bne _0220021A
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200DCE8
	b _02200226
_0220021A:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
_02200226:
	add r6, r6, #1
	add r4, #0x34
	add r5, r5, #4
	cmp r6, #6
	blt _022001F2
	ldr r0, [sp]
	bl ov15_022000F4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02200238: .word ov15_02200B0C
	thumb_func_end ov15_022001C4

	thumb_func_start ov15_0220023C
ov15_0220023C: ; 0x0220023C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x2a
	lsl r0, r0, #4
	add r6, r1, #0
	ldr r0, [r7, r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r4, #0
	add r5, r7, #0
_02200252:
	ldrb r0, [r6, r4]
	cmp r0, #0xff
	beq _02200266
	mov r0, #0xb
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200DCE8
	b _02200272
_02200266:
	mov r0, #0xb
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
_02200272:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02200252
	mov r0, #0xa5
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r1, #0
	bl sub_0200DCE8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_0220023C

	thumb_func_start ov15_02200294
ov15_02200294: ; 0x02200294
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r6, #0xb
	add r5, r0, #0
	add r7, r4, #0
	lsl r6, r6, #6
_022002A0:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl sub_0200DCE8
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _022002A0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov15_02200294

	thumb_func_start ov15_022002B4
ov15_022002B4: ; 0x022002B4
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0x95
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	lsl r7, r7, #2
_022002C0:
	cmp r6, r4
	beq _022002CE
	ldr r0, [r5, r7]
	mov r1, #0
	bl sub_0200DCE8
	b _022002E0
_022002CE:
	mov r0, #0x95
	lsl r0, r0, #2
	mov r3, #1
	ldr r0, [r5, r0]
	mov r1, #0x56
	mov r2, #0x4c
	lsl r3, r3, #0x14
	bl sub_0200DDF4
_022002E0:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _022002C0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov15_022002B4

	thumb_func_start ov15_022002EC
ov15_022002EC: ; 0x022002EC
	mov r1, #0
	cmp r0, #0x64
	bge _022002F4
	mov r1, #1
_022002F4:
	cmp r0, #0xa
	bge _022002FA
	mov r1, #2
_022002FA:
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov15_022002EC

	thumb_func_start ov15_02200300
ov15_02200300: ; 0x02200300
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r1, #0
	str r1, [sp]
	str r2, [sp, #4]
	cmp r0, #2
	bne _0220031A
	add r0, r2, #0
	cmp r0, #0x63
	ble _0220031A
	mov r0, #0x63
	str r0, [sp, #4]
_0220031A:
	ldr r0, [sp]
	ldr r2, _02200414 ; =ov15_02200998
	sub r0, r0, #2
	lsl r1, r0, #2
	str r1, [sp, #8]
	ldr r1, [r2, r1]
	mov r7, #0
	cmp r1, #0
	ble _0220036C
	mov r1, #0x18
	mul r1, r0
	ldr r0, _02200418 ; =ov15_02200A58
	add r4, r0, r1
	ldr r0, _0220041C ; =ov15_02200A88
	add r6, r0, r1
_02200338:
	ldr r0, [r4]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, [r4]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	ldr r1, [r6]
	bl sub_0200DC4C
	ldr r1, _02200414 ; =ov15_02200998
	ldr r0, [sp, #8]
	add r7, r7, #1
	ldr r0, [r1, r0]
	add r4, r4, #4
	add r6, r6, #4
	cmp r7, r0
	blt _02200338
_0220036C:
	ldr r0, [sp, #4]
	bl ov15_022002EC
	cmp r0, #0
	beq _022003D4
	ldr r1, [sp]
	sub r1, r1, #2
	bne _0220039A
	cmp r0, #2
	bne _0220039A
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0xb7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	b _022003D4
_0220039A:
	ldr r1, [sp]
	sub r1, r1, #2
	cmp r1, #1
	bne _022003D4
	sub r2, r0, #1
	ldr r0, _02200420 ; =ov15_022009A0
	lsl r7, r2, #2
	ldr r0, [r0, r7]
	mov r4, #0
	cmp r0, #0
	ble _022003D4
	ldr r1, _02200424 ; =ov15_02200A14
	lsl r0, r2, #4
	add r6, r1, r0
_022003B6:
	ldr r0, [r6]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x2d
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, _02200420 ; =ov15_022009A0
	add r4, r4, #1
	ldr r0, [r0, r7]
	add r6, r6, #4
	cmp r4, r0
	blt _022003B6
_022003D4:
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x25
	bl sub_0200DC4C
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCC0
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x27
	bl sub_0200DC4C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02200414: .word ov15_02200998
_02200418: .word ov15_02200A58
_0220041C: .word ov15_02200A88
_02200420: .word ov15_022009A0
_02200424: .word ov15_02200A14
	thumb_func_end ov15_02200300

	thumb_func_start ov15_02200428
ov15_02200428: ; 0x02200428
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r6, #0x2d
	str r0, [sp]
	add r5, r0, #0
	add r7, r4, #0
	lsl r6, r6, #4
_02200436:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl sub_0200DCE8
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _02200436
	mov r1, #0xba
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0
	bl sub_0200DCE8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov15_02200428

	thumb_func_start ov15_02200458
ov15_02200458: ; 0x02200458
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	add r5, r0, #0
	cmp r7, #1
	beq _0220046C
	cmp r7, #0
	beq _0220046C
	bl GF_AssertFail
_0220046C:
	add r0, sp, #0
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	mov r6, #0
	add r4, r6, #0
_0220047A:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r0, r0, r4
	ldrb r0, [r0, #0xc]
	cmp r0, #8
	blo _0220048C
	bl GF_AssertFail
_0220048C:
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r0, r4
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _022004A2
	ldrb r2, [r1, #0xc]
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, r2]
_022004A2:
	add r6, r6, #1
	add r4, #0xc
	cmp r6, #8
	blt _0220047A
	mov r6, #0
	add r4, sp, #0
_022004AE:
	ldrb r0, [r4]
	cmp r0, #0
	beq _022004C2
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r7, #0
	bl sub_0200DCE8
	b _022004CE
_022004C2:
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
_022004CE:
	add r6, r6, #1
	add r4, r4, #1
	add r5, r5, #4
	cmp r6, #8
	blt _022004AE
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov15_02200458

	thumb_func_start ov15_022004DC
ov15_022004DC: ; 0x022004DC
	mov r2, #0xa7
	lsl r2, r2, #2
	ldr r3, _022004E8 ; =sub_0200DCE8
	ldr r0, [r0, r2]
	bx r3
	nop
_022004E8: .word sub_0200DCE8
	thumb_func_end ov15_022004DC

	.rodata

_022004EC:
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00

ov15_022004F4: ; 0x022004F4
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov15_02200500: ; 0x02200500
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov15_0220050C: ; 0x0220050C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x30, 0xFD, 0xFF, 0x00, 0x00, 0x00, 0x00

ov15_02200518: ; 0x02200518
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov15_02200528: ; 0x02200528
	.byte 0x02

ov15_02200529: ; 0x02200529
	.byte 0x02

ov15_0220052A: ; 0x0220052A
	.byte 0x01

ov15_0220052B: ; 0x0220052B
	.byte 0x01, 0x03, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x03, 0x01, 0x01, 0x02, 0x04, 0x04, 0x04, 0x03, 0x02

ov15_0220053C: ; 0x0220053C
	.byte 0x51, 0x3B, 0x15, 0x00
	.byte 0x82, 0xE9, 0x20, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x0A, 0x00, 0x00, 0x00, 0x00

ov15_02200550:
	.byte 0x80, 0x9F, 0x00, 0x5D, 0x80, 0x9F, 0x60, 0xBF, 0xA0, 0xBF, 0x00, 0x5D, 0xA0, 0xBF, 0x60, 0xBF
	.byte 0xA8, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov15_02200568:
	.byte 0x58, 0x6F, 0x78, 0x97, 0x58, 0x6F, 0x98, 0xB7
	.byte 0x88, 0x9F, 0x78, 0x97, 0x88, 0x9F, 0x98, 0xB7, 0xA8, 0xBF, 0x60, 0xAD, 0xA8, 0xBF, 0xB2, 0xFF
	.byte 0xFF, 0x00, 0x00, 0x00

ov15_02200584: ; 0x02200584
	.byte 0x0C

ov15_02200585: ; 0x02200585
	.byte 0x0A

ov15_02200586: ; 0x02200586
	.byte 0x0E

ov15_02200587: ; 0x02200587
	.byte 0x09, 0x10, 0x0B, 0x08, 0x0F, 0x08, 0x0C, 0x0E, 0x0B
	.byte 0x09, 0x0D, 0x0A, 0x0F, 0x0A, 0x08, 0x0E, 0x0D, 0x0B, 0x10, 0x0C, 0x0F, 0x0C, 0x08, 0x10, 0x10
	.byte 0x0C, 0x08, 0x10, 0x10, 0x0D, 0x09, 0x10, 0x10

ov15_022005A8:
	.byte 0x58, 0x6F, 0x78, 0x97, 0x58, 0x6F, 0x98, 0xB7
	.byte 0x58, 0x6F, 0xB8, 0xD7, 0x88, 0x9F, 0x78, 0x97, 0x88, 0x9F, 0x98, 0xB7, 0x88, 0x9F, 0xB8, 0xD7
	.byte 0xA8, 0xBF, 0x60, 0xAD, 0xA8, 0xBF, 0xB2, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov15_022005CC: ; 0x022005CC
	.byte 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov15_022005F0:
	.byte 0x20, 0x49, 0x00, 0x7F, 0x20, 0x49, 0x80, 0xFF, 0x4A, 0x75, 0x00, 0x7F, 0x4A, 0x75, 0x80, 0xFF
	.byte 0x76, 0x99, 0x00, 0x7F, 0x76, 0x99, 0x80, 0xFF, 0xA8, 0xBF, 0x00, 0x27, 0xA8, 0xBF, 0x28, 0x4F
	.byte 0xA8, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov15_02200618: ; 0x02200618
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov15_02200640: ; 0x02200640
	.byte 0x0C

ov15_02200641: ; 0x02200641
	.byte 0x08

ov15_02200642: ; 0x02200642
	.byte 0x07

ov15_02200643: ; 0x02200643
	.byte 0x01, 0x0C, 0x08, 0x00, 0x02, 0x0C, 0x08, 0x01, 0x03, 0x0C, 0x08, 0x02, 0x04
	.byte 0x10, 0x09, 0x03, 0x05, 0x10, 0x09, 0x04, 0x06, 0x10, 0x09, 0x05, 0x07, 0x10, 0x09, 0x06, 0x00
	.byte 0x11, 0x0A, 0x0E, 0x09, 0x11, 0x0B, 0x08, 0x0F, 0x08, 0x0C, 0x0E, 0x0B, 0x09, 0x0D, 0x0A, 0x0F
	.byte 0x0A, 0x11, 0x0E, 0x0D, 0x0B, 0x10, 0x0C, 0x0F, 0x0C, 0x11, 0x10, 0x10, 0x0C, 0x11, 0x10, 0x10
	.byte 0x0D, 0x11, 0x10, 0x10

ov15_02200684:
	.byte 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x1F, 0x20, 0x3F, 0x00, 0x1F, 0x40, 0x5F
	.byte 0x00, 0x1F, 0x60, 0x7F, 0x00, 0x1F, 0x80, 0x9F, 0x00, 0x1F, 0xA0, 0xBF, 0x00, 0x1F, 0xC0, 0xDF
	.byte 0x00, 0x1F, 0xE0, 0xFF, 0x20, 0x49, 0x00, 0x7F, 0x20, 0x49, 0x80, 0xFF, 0x4A, 0x75, 0x00, 0x7F
	.byte 0x4A, 0x75, 0x80, 0xFF, 0x76, 0x99, 0x00, 0x7F, 0x76, 0x99, 0x80, 0xFF, 0xA8, 0xBF, 0x00, 0x27
	.byte 0xA8, 0xBF, 0x28, 0x4F, 0xA8, 0xBF, 0xC0, 0xFF, 0xFF, 0x00, 0x00, 0x00

ov15_022006CC: ; 0x022006CC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov15_022006E8: ; 0x022006E8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov15_02200704: ; 0x02200704
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov15_02200720: ; 0x02200720
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov15_0220073C: ; 0x0220073C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov15_02200758: ; 0x02200758
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov15_02200774: ; 0x02200774
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov15_02200790: ; 0x02200790
	.byte 0x82, 0xE9, 0x20, 0x14, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x15, 0x00, 0x00, 0x80, 0xFD, 0xFF
	.byte 0x82, 0xEE, 0x19, 0x67, 0x00, 0x00, 0x00, 0x00, 0x55, 0x3B, 0x15, 0x00, 0x00, 0xB0, 0xFD, 0xFF
	.byte 0x87, 0xE0, 0x28, 0x48, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x0E, 0x00, 0x00, 0x20, 0xFD, 0xFF
	.byte 0x7F, 0xF0, 0x16, 0x78, 0x00, 0x00, 0x00, 0x00, 0x53, 0xEB, 0x14, 0x00, 0x02, 0x00, 0xFD, 0xFF
	.byte 0x75, 0x03, 0x22, 0x56, 0x00, 0x00, 0x00, 0x00, 0x4E, 0x5B, 0x0B, 0x00, 0x01, 0xB0, 0xFB, 0xFF
	.byte 0x81, 0xE7, 0x27, 0x75, 0x00, 0x00, 0x00, 0x00, 0x58, 0xAB, 0x0C, 0x00, 0x06, 0x40, 0xFC, 0xFF
	.byte 0x7E, 0xE8, 0x1A, 0x74, 0x00, 0x00, 0x00, 0x00, 0x4F, 0x8B, 0x12, 0x00, 0xFE, 0x9F, 0xFC, 0xFF
	.byte 0x80, 0xEB, 0x1B, 0x92, 0x00, 0x00, 0x00, 0x00, 0x52, 0x1B, 0x0D, 0x00, 0x00, 0xA0, 0xFB, 0xFF
	.byte 0x87, 0x05, 0x1F, 0x8C, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x15, 0x00, 0xFF, 0xFF, 0xFD, 0xFF
	.byte 0x82, 0xE9, 0x20, 0x14, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x15, 0x00, 0x00, 0x80, 0xFD, 0xFF
	.byte 0x82, 0xEC, 0x20, 0x38, 0x00, 0x00, 0x00, 0x00, 0x53, 0x5B, 0x12, 0x00, 0x00, 0x30, 0xFD, 0xFF
	.byte 0x82, 0xE9, 0x20, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x51, 0xBB, 0x10, 0x00, 0x00, 0x80, 0xFD, 0xFF
	.byte 0x82, 0xE9, 0x18, 0x5E, 0x00, 0x00, 0x00, 0x00, 0x53, 0x3B, 0x0D, 0x00, 0x01, 0x00, 0xFD, 0xFF
	.byte 0x7C, 0xF1, 0x1E, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x15, 0x00, 0x00, 0x80, 0xFD, 0xFF
	.byte 0x80, 0x01, 0x22, 0x32, 0x00, 0x00, 0x00, 0x00, 0x51, 0x5B, 0x0C, 0x00, 0x00, 0xD0, 0xFC, 0xFF
	.byte 0x7B, 0xEC, 0x16, 0x81, 0x00, 0x00, 0x00, 0x00, 0x49, 0x7B, 0x0C, 0x00, 0x01, 0x30, 0xFC, 0xFF
	.byte 0x7D, 0xF1, 0x1F, 0x72, 0x00, 0x00, 0x00, 0x00, 0x51, 0x5B, 0x0D, 0x00, 0x00, 0x60, 0xFD, 0xFF
	.byte 0x87, 0x05, 0x1D, 0x50, 0x00, 0x00, 0x00, 0x00, 0x51, 0x3B, 0x15, 0x00, 0x00, 0x00, 0xFE, 0xFF

ov15_022008B0: ; 0x022008B0
	.byte 0xA5, 0x28, 0x18, 0x65, 0x40, 0x0C, 0x1E, 0x32

	.public ov15_022008B8
ov15_022008B8:
	.word ov15_BagApp_init, ov15_BagApp_exec, ov15_BagApp_exit, 0xFFFFFFFF

ov15_022008C8: ; 0x022008C8
	.byte 0xA5, 0x28, 0x18, 0x65, 0x40, 0x0C, 0x1E, 0x32

ov15_022008D0: ; 0x022008D0
	.byte 0x10, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00

ov15_022008E8: ; 0x022008E8
	.byte 0x01, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00

ov15_02200908: ; 0x02200908
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0xBF, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0xEB, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x17, 0x01, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x43, 0x01, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x6F, 0x01, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x9B, 0x01, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0xC7, 0x01, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0xF3, 0x01, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x1F, 0x02, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x4B, 0x02, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x77, 0x02, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0xA3, 0x02, 0x00, 0x00

ov15_02200998: ; 0x02200998
	.byte 0x04, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00

ov15_022009A0: ; 0x022009A0
	.byte 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

ov15_022009A8: ; 0x022009A8
	.byte 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov15_022009BC: ; 0x022009BC
	.byte 0x0C, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov15_022009D4: ; 0x022009D4
	.byte 0x88

ov15_022009D5: ; 0x022009D5
	.byte 0x68

ov15_022009D6: ; 0x022009D6
	.byte 0x1D

ov15_022009D7: ; 0x022009D7
	.byte 0x09, 0xA8, 0x68, 0x1D, 0x09, 0xC8, 0x68, 0x1D, 0x09
	.byte 0x88, 0xA0, 0x1D, 0x09, 0xA8, 0xA0, 0x1D, 0x09, 0xC8, 0xA0, 0x1D, 0x09, 0xA0, 0xB0, 0x11, 0x09
	.byte 0xE0, 0xB0, 0x11, 0x09

ov15_022009F4: ; 0x022009F4
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00

ov15_02200A14: ; 0x02200A14
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00

ov15_02200A34: ; 0x02200A34
	.byte 0x30

ov15_02200A35: ; 0x02200A35
	.byte 0x38

ov15_02200A36: ; 0x02200A36
	.byte 0x14

ov15_02200A37: ; 0x02200A37
	.byte 0x09, 0xB0, 0x38, 0x14, 0x09, 0x30, 0x60, 0x14, 0x09
	.byte 0xB0, 0x60, 0x14, 0x09, 0x30, 0x88, 0x14, 0x09, 0xB0, 0x88, 0x14, 0x09, 0x18, 0xB0, 0x0E, 0x09
	.byte 0x40, 0xB0, 0x0E, 0x09, 0xE0, 0xB0, 0x11, 0x09

ov15_02200A58: ; 0x02200A58
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00

ov15_02200A88: ; 0x02200A88
	.byte 0x19, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x19, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00

ov15_02200AB8: ; 0x02200AB8
	.byte 0x10

ov15_02200AB9: ; 0x02200AB9
	.byte 0x10

ov15_02200ABA: ; 0x02200ABA
	.byte 0x08

ov15_02200ABB: ; 0x02200ABB
	.byte 0x09, 0x30, 0x10, 0x08, 0x09
	.byte 0x50, 0x10, 0x08, 0x09, 0x70, 0x10, 0x08, 0x09, 0x90, 0x10, 0x08, 0x09, 0xB0, 0x10, 0x08, 0x09
	.byte 0xD0, 0x10, 0x08, 0x09, 0xF0, 0x10, 0x08, 0x09, 0x30, 0x38, 0x0A, 0x09, 0xB0, 0x38, 0x0A, 0x09
	.byte 0x30, 0x60, 0x0A, 0x09, 0xB0, 0x60, 0x0A, 0x09, 0x30, 0x88, 0x0A, 0x09, 0xB0, 0x88, 0x0A, 0x09
	.byte 0x18, 0xB0, 0x0E, 0x09, 0x40, 0xB0, 0x0E, 0x09, 0xE0, 0xB0, 0x11, 0x09, 0x30, 0x90, 0x17, 0x09
	.byte 0x90, 0x90, 0x17, 0x09, 0x30, 0xB0, 0x17, 0x09, 0x90, 0xB0, 0x17, 0x09

ov15_02200B0C: ; 0x02200B0C
	.byte 0xB1, 0x00, 0x0E, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xF9, 0xC0, 0x00, 0x00, 0xF9, 0xC0, 0x00, 0x00, 0xF9, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0xFD, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x98, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFE, 0xC0, 0x00, 0x00
	.byte 0xFD, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x98, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFF, 0xC0, 0x00, 0x00, 0xFE, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x16, 0x00, 0x8B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0xFD, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x98, 0x00, 0x8B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0xC1, 0x00, 0x00, 0x00, 0xC1, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0xFD, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x70, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0xC1, 0x00, 0x00
	.byte 0x02, 0xC1, 0x00, 0x00, 0xFE, 0xC0, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0x70, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x04, 0xC1, 0x00, 0x00, 0x02, 0xC1, 0x00, 0x00, 0xFE, 0xC0, 0x00, 0x00, 0xFF, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x10, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x10, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x10, 0x00, 0x00, 0x00, 0x05, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x10, 0x00, 0x00, 0x00, 0x06, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x10, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00
	.byte 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x30, 0x00, 0x00, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0x30, 0x00, 0x00, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x58, 0x00, 0x00, 0x00, 0x13, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0x58, 0x00
	.byte 0x00, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x80, 0x00, 0x00, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0x80, 0x00, 0x00, 0x00, 0x13, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x30, 0x00, 0x00, 0x00, 0x14, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x90, 0x00
	.byte 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x90, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x90, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x16, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0x68, 0x00
	.byte 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xA8, 0x00, 0x68, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x68, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0x98, 0x00, 0x00, 0x00, 0x1B, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x98, 0x00
	.byte 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC8, 0x00, 0x98, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00
	.byte 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x88, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFB, 0xC0, 0x00, 0x00, 0xFA, 0xC0, 0x00, 0x00
	.byte 0xFB, 0xC0, 0x00, 0x00, 0xFC, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_02201300:
	.byte 0x01, 0x00, 0x00, 0x00

ov15_02201304: ; 0x02201304
	.byte 0x4A, 0x29, 0x2F, 0x11, 0x94, 0x52, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov15_02201314: ; 0x02201314
	.word ov15_02200684
	.word ov15_02200550
	.word ov15_022005F0
	.word ov15_022005A8
	.word ov15_02200568

ov15_02201328: ; 0x02201328
	;        x     y     w     h
	.byte 0x00, 0x04, 0x10, 0x06
	.byte 0x10, 0x04, 0x10, 0x06
	.byte 0x00, 0x09, 0x10, 0x06
	.byte 0x10, 0x09, 0x10, 0x06
	.byte 0x00, 0x0E, 0x10, 0x06
	.byte 0x10, 0x0E, 0x10, 0x06

ov15_02201340: ; 0x02201340
	;        x     y     w     h
	.byte 0x00, 0x0B, 0x10, 0x09
	.byte 0x10, 0x06, 0x10, 0x10

	.byte 0x00, 0x0B, 0x20, 0x09
	.byte 0x00, 0x00, 0x00, 0x00

	.byte 0x00, 0x10, 0x10, 0x04
	.byte 0x10, 0x0B, 0x10, 0x09

	.byte 0x00, 0x10, 0x20, 0x04
	.byte 0x00, 0x00, 0x00, 0x00

	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x10, 0x10, 0x04

ov15_02201368: ; 0x02201368
	.word ov15_021FB680
	.word ov15_021FB680
	.word ov15_021FB680
	.word ov15_021FB680
	.word ov15_021FB680
	.word ov15_021FBCAC
	.word ov15_021FC224
	.word ov15_021FC37C
	.word ov15_021FC3EC
	.word ov15_021FBC6C
	.word ov15_021FBC8C
	.word 0x00000000
	.word ov15_021FC3E0
	.word 0x00000000
	.word ov15_021FD3C0
	.word ov15_021FB680

ov15_022013A8: ; 0x022013A8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x20, 0x10, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x04, 0x10, 0x10, 0x00

	.byte 0x01, 0x00, 0x13, 0x00, 0x09, 0x10, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0A, 0x10, 0x0A, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x10, 0x04, 0x10, 0x10, 0x00

	.byte 0x01, 0x00, 0x13, 0x00, 0x09, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x10, 0x13, 0x10, 0x09, 0x10, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0A, 0x20, 0x0A, 0x00

	.byte 0x01, 0x00, 0x13, 0x00, 0x0E, 0x10, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0F, 0x10, 0x05, 0x00
	.byte 0x01, 0x10, 0x13, 0x10, 0x09, 0x10, 0x01, 0x00, 0x02, 0x00, 0x00, 0x10, 0x0A, 0x10, 0x0A, 0x00

	.byte 0x01, 0x00, 0x13, 0x00, 0x0E, 0x10, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x10, 0x13, 0x10, 0x0E, 0x10, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x0F, 0x20, 0x05, 0x00

	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x10, 0x13, 0x10, 0x0E, 0x10, 0x01, 0x00, 0x02, 0x00, 0x00, 0x10, 0x0F, 0x10, 0x05, 0x00

ov15_02201468: ; 0x02201468
	.byte 0x11, 0x12, 0x13, 0x14, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

_02201480:
	.space 0x20
