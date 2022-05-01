#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020932E0
sub_020932E0: ; 0x020932E0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r1, _02093348 ; =0x000046E8
	add r6, r0, #0
	add r7, r2, #0
	bl AllocFromHeap
	ldr r2, _02093348 ; =0x000046E8
	mov r1, #0
	add r4, r0, #0
	bl memset
	cmp r5, #0
	bne _02093300
	bl GF_AssertFail
_02093300:
	str r6, [r4, #4]
	strb r5, [r4, #0xd]
	strb r7, [r4, #0x10]
	ldrb r0, [r4, #0xd]
	cmp r0, #3
	bls _02093314
	bl GF_AssertFail
	mov r0, #3
	strb r0, [r4, #0xd]
_02093314:
	ldrb r2, [r4, #0xd]
	mov r1, #0xc
	ldr r0, [r4, #4]
	mul r1, r2
	bl AllocFromHeap
	mov r1, #0x8d
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldrb r1, [r4, #0xd]
	ldr r0, [r4, #4]
	add r1, #0x22
	lsl r1, r1, #2
	bl AllocFromHeap
	ldr r1, _0209334C ; =0x000007E4
	str r0, [r4, r1]
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #0xf
	bl sub_02095CE0
	ldr r1, _02093350 ; =0x000046B8
	str r0, [r4, r1]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02093348: .word 0x000046E8
_0209334C: .word 0x000007E4
_02093350: .word 0x000046B8
	thumb_func_end sub_020932E0

	thumb_func_start sub_02093354
sub_02093354: ; 0x02093354
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0209341C ; =0x000046B8
	ldr r0, [r5, r0]
	bl sub_02095D2C
	add r0, r5, #0
	bl sub_0209515C
	ldr r0, _02093420 ; =0x00004650
	mov r1, #1
	add r0, r5, r0
	bl sub_020950F8
	ldr r0, _02093424 ; =0x00004670
	add r0, r5, r0
	bl RemoveWindow
	add r0, r5, #0
	bl sub_020950D4
	ldr r0, _02093428 ; =0x000046C8
	ldr r0, [r5, r0]
	bl FreeToHeap
	ldr r0, _0209342C ; =0x000046CC
	ldr r0, [r5, r0]
	bl FreeToHeap
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AEB0
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200B0A8
	mov r7, #0x51
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #2
_020933AA:
	ldr r0, [r4, r7]
	bl Destroy2DGfxResObjMan
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #6
	blt _020933AA
	ldr r0, [r5, #0x18]
	bl sub_02024504
	ldr r0, _02093430 ; =0x000046A4
	ldr r0, [r5, r0]
	bl FreeToHeap
	ldr r0, [r5, #8]
	bl sub_02016624
	ldr r0, _02093434 ; =0x000007E4
	ldr r0, [r5, r0]
	bl FreeToHeap
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl FreeToHeap
	mov r0, #4
	bl FontID_Release
	ldr r0, _02093438 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	ldr r0, _0209343C ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r5]
	bl FreeBgTilemapBuffer
	ldr r0, [r5]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r5]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r5]
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r5, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0209341C: .word 0x000046B8
_02093420: .word 0x00004650
_02093424: .word 0x00004670
_02093428: .word 0x000046C8
_0209342C: .word 0x000046CC
_02093430: .word 0x000046A4
_02093434: .word 0x000007E4
_02093438: .word gSystem + 0x60
_0209343C: .word 0x04000050
	thumb_func_end sub_02093354

	thumb_func_start sub_02093440
sub_02093440: ; 0x02093440
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0201660C
	str r0, [r5, #8]
	ldr r0, _02093580 ; =0x0000463C
	ldr r2, [sp, #0x48]
	str r6, [r5, r0]
	add r1, r0, #4
	str r7, [r5, r1]
	add r1, r0, #0
	str r4, [r5]
	add r1, #0xa0
	str r2, [r5, r1]
	add r1, r0, #0
	ldr r2, [sp, #0x44]
	add r1, #0x9c
	str r2, [r5, r1]
	ldr r1, [sp, #0x34]
	mov r2, #0
	strb r1, [r5, #0xf]
	add r1, r0, #0
	mvn r2, r2
	add r1, #0xa8
	str r2, [r5, r1]
	add r0, #0xa4
	str r2, [r5, r0]
	ldr r0, [sp, #0x30]
	strb r0, [r5, #0x13]
	ldr r0, [r5]
	ldr r1, [r5, #4]
	bl sub_02094D9C
	add r0, r5, #0
	bl sub_02093A50
	add r0, r5, #0
	bl sub_02093B40
	add r0, r5, #0
	bl sub_02094004
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r1, [r5, #4]
	mov r0, #4
	bl FontID_Alloc
	mov r1, #0x1a
	ldr r2, [r5, #4]
	mov r0, #0
	lsl r1, r1, #4
	bl LoadFontPal0
	mov r1, #6
	ldr r2, [r5, #4]
	mov r0, #0
	lsl r1, r1, #6
	bl LoadFontPal0
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #0x30]
	strb r0, [r5, #0x11]
	ldr r0, [sp, #0x2c]
	lsl r1, r1, #0x18
	strb r0, [r5, #0x12]
	ldr r0, _02093584 ; =0x000046B8
	lsr r1, r1, #0x18
	ldr r0, [r5, r0]
	bl sub_02095D1C
	ldr r0, _02093584 ; =0x000046B8
	mov r1, #2
	ldr r0, [r5, r0]
	mov r2, #0
	bl sub_02095D40
	add r0, r5, #0
	bl sub_02093B84
	ldr r0, [sp, #0x38]
	ldr r1, _02093588 ; =0x00004648
	ldr r2, [sp, #0x3c]
	str r0, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	mov r2, #1
	add r1, #8
	str r2, [sp]
	mov r3, #0xd
	str r3, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0xa0
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r1, r5, r1
	mov r3, #4
	bl AddWindowParameterized
	mov r0, #0x15
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	mov r0, #0xba
	ldr r1, _0209358C ; =0x00004670
	str r0, [sp, #0x10]
	ldr r0, [r5]
	add r1, r5, r1
	mov r2, #1
	mov r3, #0x19
	bl AddWindowParameterized
	add r0, r5, #0
	bl sub_02094D1C
	ldr r1, [r5]
	ldr r2, [r5, #4]
	add r0, r5, #0
	bl sub_020941CC
	add r0, r5, #0
	bl sub_020942B0
	add r0, r5, #0
	bl sub_020943EC
	add r0, r5, #0
	bl sub_020950C0
	bl sub_02095794
	ldr r0, [sp, #0x40]
	ldr r1, _02093590 ; =0x000046B4
	mov r2, #0
	str r0, [r5, r1]
	add r0, r1, #0
	str r2, [r5, #0x14]
	add r0, #8
	str r2, [r5, r0]
	add r0, r1, #0
	add r0, #0xc
	str r2, [r5, r0]
	add r1, #0x10
	str r2, [r5, r1]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02093580: .word 0x0000463C
_02093584: .word 0x000046B8
_02093588: .word 0x00004648
_0209358C: .word 0x00004670
_02093590: .word 0x000046B4
	thumb_func_end sub_02093440

	thumb_func_start sub_02093594
sub_02093594: ; 0x02093594
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020935D0 ; =0x00004644
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _020935B2
	ldr r0, _020935D4 ; =0x000008D4
	add r0, r4, r0
	blx r1
	ldr r0, _020935D0 ; =0x00004644
	mov r1, #0
	str r1, [r4, r0]
	add r0, r4, #0
	bl sub_020956B8
_020935B2:
	bl GF_RunVramTransferTasks
	bl OamManager_ApplyAndResetBuffers
	ldr r0, [r4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _020935D8 ; =OS_IRQTable
	ldr r1, _020935DC ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_020935D0: .word 0x00004644
_020935D4: .word 0x000008D4
_020935D8: .word OS_IRQTable
_020935DC: .word 0x00003FF8
	thumb_func_end sub_02093594

	thumb_func_start sub_020935E0
sub_020935E0: ; 0x020935E0
	push {r3, lr}
	ldr r1, [r0, #0x14]
	cmp r1, #6
	bhi _0209362E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020935F4: ; jump table
	.short _02093602 - _020935F4 - 2 ; case 0
	.short _02093608 - _020935F4 - 2 ; case 1
	.short _02093610 - _020935F4 - 2 ; case 2
	.short _0209362E - _020935F4 - 2 ; case 3
	.short _02093618 - _020935F4 - 2 ; case 4
	.short _02093620 - _020935F4 - 2 ; case 5
	.short _02093628 - _020935F4 - 2 ; case 6
_02093602:
	bl sub_02093630
	pop {r3, pc}
_02093608:
	bl sub_0209389C
	mov r0, #0
	pop {r3, pc}
_02093610:
	bl sub_02093908
	mov r0, #0
	pop {r3, pc}
_02093618:
	bl sub_0209396C
	mov r0, #0
	pop {r3, pc}
_02093620:
	bl sub_020939B8
	mov r0, #0
	pop {r3, pc}
_02093628:
	bl sub_0209511C
	mov r0, #2
_0209362E:
	pop {r3, pc}
	thumb_func_end sub_020935E0

	thumb_func_start sub_02093630
sub_02093630: ; 0x02093630
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r4, #0
	add r5, r0, #0
	str r4, [sp]
	bl System_GetTouchHeld
	cmp r0, #0
	bne _02093714
	ldr r0, _02093874 ; =0x000046C0
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _02093714
	ldr r1, _02093878 ; =gSystem
	ldr r4, [r1, #0x48]
	cmp r4, #0
	beq _02093714
	sub r0, #8
	ldr r0, [r5, r0]
	mov r7, #0
	add r6, r7, #0
	bl sub_02095DD8
	cmp r4, #0x20
	bgt _0209367A
	bge _02093688
	cmp r4, #2
	bgt _02093674
	cmp r4, #1
	blt _020936EE
	beq _020936C0
	cmp r4, #2
	beq _020936D8
	b _020936EE
_02093674:
	cmp r4, #0x10
	beq _0209369C
	b _020936EE
_0209367A:
	cmp r4, #0x40
	bgt _02093682
	beq _020936B0
	b _020936EE
_02093682:
	cmp r4, #0x80
	beq _020936B8
	b _020936EE
_02093688:
	cmp r0, #5
	bne _02093694
	add r0, r5, #0
	bl sub_02095540
	b _020936EE
_02093694:
	sub r0, r7, #1
	lsl r0, r0, #0x18
	asr r7, r0, #0x18
	b _020936EE
_0209369C:
	cmp r0, #5
	bne _020936A8
	add r0, r5, #0
	bl sub_020955EC
	b _020936EE
_020936A8:
	add r0, r7, #1
	lsl r0, r0, #0x18
	asr r7, r0, #0x18
	b _020936EE
_020936B0:
	sub r0, r6, #1
	lsl r0, r0, #0x18
	asr r6, r0, #0x18
	b _020936EE
_020936B8:
	add r0, r6, #1
	lsl r0, r0, #0x18
	asr r6, r0, #0x18
	b _020936EE
_020936C0:
	add r0, r5, #0
	bl sub_02095354
	str r0, [sp]
	cmp r0, #0
	beq _020936EE
	cmp r0, #3
	beq _020936EE
	ldr r0, _0209387C ; =0x000005DD
	bl PlaySE
	b _020936EE
_020936D8:
	add r0, r5, #0
	bl sub_020954CC
	str r0, [sp]
	cmp r0, #0
	beq _020936EE
	cmp r0, #3
	beq _020936EE
	ldr r0, _0209387C ; =0x000005DD
	bl PlaySE
_020936EE:
	cmp r7, #0
	bne _020936F6
	cmp r6, #0
	beq _02093714
_020936F6:
	ldr r0, _02093880 ; =0x000046B8
	add r1, r7, #0
	ldr r0, [r5, r0]
	add r2, r6, #0
	bl sub_02095D88
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02095238
	cmp r6, #0
	beq _02093714
	ldr r0, _02093884 ; =0x000005DC
	bl PlaySE
_02093714:
	cmp r4, #0
	bne _02093720
	ldr r0, _02093888 ; =0x000046BC
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02093722
_02093720:
	b _02093860
_02093722:
	bl System_GetTouchNew
	cmp r0, #0
	bne _0209372C
	b _02093832
_0209372C:
	ldr r0, _0209388C ; =0x00004680
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _02093832
	mov r1, #1
	add r0, #0x44
	str r1, [r5, r0]
	ldr r0, _02093890 ; =0x000007E4
	ldr r0, [r5, r0]
	bl sub_02025224
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _0209382A
	cmp r4, #0x1e
	bge _0209378A
	ldrb r0, [r5, #0xf]
	cmp r0, #0x12
	bne _0209375A
	cmp r4, #6
	bge _02093824
_0209375A:
	ldr r0, _02093880 ; =0x000046B8
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #2
	lsr r2, r2, #0x18
	bl sub_02095D40
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02094794
	cmp r0, #1
	bne _02093824
	ldr r0, _02093894 ; =0x000005EB
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	bl sub_020948C4
	mov r0, #1
	str r0, [sp]
	b _02093824
_0209378A:
	cmp r4, #0x21
	blt _020937CE
	ldrb r0, [r5, #0xd]
	add r0, #0x21
	cmp r4, r0
	bge _020937CE
	ldr r0, _02093880 ; =0x000046B8
	add r2, r4, #0
	sub r2, #0x21
	lsl r2, r2, #0x18
	ldr r0, [r5, r0]
	mov r1, #3
	lsr r2, r2, #0x18
	bl sub_02095D40
	add r1, r4, #0
	add r0, r5, #0
	sub r1, #0x21
	bl sub_02094860
	cmp r0, #1
	bne _02093824
	ldr r0, _02093894 ; =0x000005EB
	bl PlaySE
	sub r4, #0x21
	add r0, r5, #0
	mov r1, #2
	add r2, r4, #0
	bl sub_020948C4
	mov r0, #1
	str r0, [sp]
	b _02093824
_020937CE:
	cmp r4, #0x1e
	beq _020937EC
	cmp r4, #0x1f
	beq _020937DC
	cmp r4, #0x20
	beq _020937E4
	b _02093824
_020937DC:
	add r0, r5, #0
	bl sub_02095540
	b _02093824
_020937E4:
	add r0, r5, #0
	bl sub_020955EC
	b _02093824
_020937EC:
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _02093824
	mov r0, #0xe
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	mov r0, #0xb
	lsl r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, sp, #4
	bl sub_020247D4
	ldr r0, _02093880 ; =0x000046B8
	mov r1, #1
	ldr r0, [r5, r0]
	mov r2, #0
	bl sub_02095D40
	add r0, r5, #0
	bl sub_0209569C
	mov r0, #3
	str r0, [sp]
_02093824:
	add r0, r5, #0
	bl sub_020956B8
_0209382A:
	ldr r0, _02093874 ; =0x000046C0
	mov r1, #1
	str r1, [r5, r0]
	b _02093860
_02093832:
	bl System_GetTouchHeld
	cmp r0, #0
	beq _02093850
	ldr r0, _02093898 ; =0x000046C4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02093850
	add r0, r5, #0
	bl sub_020949F4
	ldr r0, _02093874 ; =0x000046C0
	mov r1, #1
	str r1, [r5, r0]
	b _02093860
_02093850:
	add r0, r5, #0
	bl sub_02094A70
	ldr r0, _02093874 ; =0x000046C0
	mov r1, #0
	str r1, [r5, r0]
	add r0, r0, #4
	str r1, [r5, r0]
_02093860:
	ldrb r1, [r5, #0xe]
	ldrb r0, [r5, #0xd]
	cmp r1, r0
	bne _0209386C
	mov r0, #1
	str r0, [r5, #0x14]
_0209386C:
	ldr r0, [sp]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02093874: .word 0x000046C0
_02093878: .word gSystem
_0209387C: .word 0x000005DD
_02093880: .word 0x000046B8
_02093884: .word 0x000005DC
_02093888: .word 0x000046BC
_0209388C: .word 0x00004680
_02093890: .word 0x000007E4
_02093894: .word 0x000005EB
_02093898: .word 0x000046C4
	thumb_func_end sub_02093630

	thumb_func_start sub_0209389C
sub_0209389C: ; 0x0209389C
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4]
	mov r1, #0x19
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r1, [r0, #0x10]
	mov r1, #0xf
	strb r1, [r0, #0x11]
	ldr r0, [r4, #8]
	add r1, sp, #0
	bl sub_020166FC
	ldrb r0, [r4, #0xd]
	cmp r0, #1
	bne _020938EC
	ldr r0, _02093904 ; =0x00004660
	mov r1, #0
	add r0, r4, r0
	bl sub_020950F8
	add r0, r4, #0
	mov r1, #3
	mov r2, #1
	bl sub_0209501C
	b _020938F6
_020938EC:
	add r0, r4, #0
	mov r1, #2
	mov r2, #1
	bl sub_0209501C
_020938F6:
	bl sub_02095780
	mov r0, #2
	str r0, [r4, #0x14]
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_02093904: .word 0x00004660
	thumb_func_end sub_0209389C

	thumb_func_start sub_02093908
sub_02093908: ; 0x02093908
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl sub_020168F4
	cmp r0, #1
	beq _0209391C
	cmp r0, #2
	beq _02093932
	pop {r4, pc}
_0209391C:
	ldr r0, _02093964 ; =0x00004660
	mov r1, #1
	add r0, r4, r0
	bl sub_020950F8
	ldr r0, [r4, #8]
	bl sub_020169CC
	mov r0, #6
	str r0, [r4, #0x14]
	pop {r4, pc}
_02093932:
	ldr r0, _02093964 ; =0x00004660
	mov r1, #1
	add r0, r4, r0
	bl sub_020950F8
	ldr r0, [r4, #8]
	bl sub_020169CC
	ldr r1, _02093968 ; =0x000046B0
	add r0, r4, #0
	ldr r1, [r4, r1]
	bl sub_02094F5C
	add r0, r4, #0
	bl sub_020950C0
	bl sub_02095794
	add r0, r4, #0
	bl sub_020956B8
	mov r0, #0
	str r0, [r4, #0x14]
	pop {r4, pc}
	nop
_02093964: .word 0x00004660
_02093968: .word 0x000046B0
	thumb_func_end sub_02093908

	thumb_func_start sub_0209396C
sub_0209396C: ; 0x0209396C
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4]
	mov r1, #0x19
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	lsl r0, r0, #8
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r1, [r0, #0x10]
	mov r1, #0xf
	strb r1, [r0, #0x11]
	ldr r0, [r4, #8]
	add r1, sp, #0
	bl sub_020166FC
	add r0, r4, #0
	mov r1, #4
	mov r2, #0
	bl sub_0209501C
	bl sub_02095780
	mov r0, #5
	str r0, [r4, #0x14]
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0209396C

	thumb_func_start sub_020939B8
sub_020939B8: ; 0x020939B8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl sub_020168F4
	cmp r0, #1
	beq _020939CC
	cmp r0, #2
	beq _02093A10
	pop {r4, pc}
_020939CC:
	ldr r0, _02093A34 ; =0x00004660
	mov r1, #1
	add r0, r4, r0
	bl sub_020950F8
	ldr r0, [r4, #8]
	bl sub_020169CC
	ldr r1, _02093A38 ; =0x00004684
	add r0, r4, #0
	ldr r1, [r4, r1]
	bl sub_02094F5C
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x2d
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #2
	bl sub_02094A90
	ldr r0, _02093A3C ; =0x000046BC
	mov r1, #0
	str r1, [r4, r0]
	bl sub_02095794
	add r0, r4, #0
	bl sub_020956B8
	mov r0, #0
	str r0, [r4, #0x14]
	pop {r4, pc}
_02093A10:
	ldr r0, _02093A34 ; =0x00004660
	mov r1, #1
	add r0, r4, r0
	bl sub_020950F8
	ldr r0, [r4, #8]
	bl sub_020169CC
	add r0, r4, #0
	mov r1, #0
	bl sub_02094A90
	bl sub_02095794
	mov r0, #0
	str r0, [r4, #0x14]
	pop {r4, pc}
	nop
_02093A34: .word 0x00004660
_02093A38: .word 0x00004684
_02093A3C: .word 0x000046BC
	thumb_func_end sub_020939B8

	thumb_func_start sub_02093A40
sub_02093A40: ; 0x02093A40
	push {r3, lr}
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _02093A4C
	bl sub_0202457C
_02093A4C:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02093A40

	thumb_func_start sub_02093A50
sub_02093A50: ; 0x02093A50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r1, r5, #0
	ldr r2, [r5, #4]
	mov r0, #0x2b
	add r1, #0x1c
	bl G2dRenderer_Init
	str r0, [r5, #0x18]
	add r0, r5, #0
	mov r2, #1
	add r0, #0x1c
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r7, #0x51
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #2
_02093A7A:
	ldr r2, [r5, #4]
	mov r0, #3
	add r1, r6, #0
	bl Create2DGfxResObjMan
	str r0, [r4, r7]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #6
	blt _02093A7A
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldr r0, [r5, #4]
	mov r1, #0x97
	str r0, [sp, #8]
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r2, #8
	bl AddCharResObjFromNarc
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	sub r1, #0x14
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	mov r1, #0x97
	mov r2, #5
	bl AddPlttResObjFromNarc
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	sub r1, #0x14
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0x97
	mov r2, #7
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	sub r1, #0x14
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0x97
	mov r2, #6
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5a
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0xc
	ldr r0, [r5, r1]
	bl sub_0200ADA4
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200AF94
	bl sub_02074490
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5, #4]
	mov r2, #1
	add r3, r2, #0
	str r0, [sp, #4]
	mov r0, #0x14
	add r3, #0xff
	bl GfGfxLoader_GXLoadPal
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02093A50

	thumb_func_start sub_02093B40
sub_02093B40: ; 0x02093B40
	push {lr}
	sub sp, #0x2c
	mov r1, #0
	str r1, [sp]
	sub r2, r1, #1
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	mov r3, #0x51
	str r1, [sp, #0x10]
	lsl r3, r3, #2
	ldr r2, [r0, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r0, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r0, r2]
	str r2, [sp, #0x1c]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r0, r2]
	add r3, #0x30
	str r2, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, r0, r3
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp, #0x28]
	bl CreateSpriteResourcesHeader
	add sp, #0x2c
	pop {pc}
	thumb_func_end sub_02093B40

	thumb_func_start sub_02093B84
sub_02093B84: ; 0x02093B84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r5, r0, #0
	add r0, sp, #0x10
	add r1, r5, #0
	mov r2, #1
	bl sub_02094150
	ldrb r1, [r5, #0xd]
	ldr r0, [r5, #4]
	lsl r1, r1, #3
	bl AllocFromHeap
	ldr r1, _02093CD0 ; =0x000046A4
	mov r7, #0
	str r0, [r5, r1]
	ldrb r0, [r5, #0xd]
	cmp r0, #0
	ble _02093C78
	mov r0, #0x20
	str r0, [sp, #0xc]
	mov r0, #0x2c
	add r6, r7, #0
	str r7, [sp, #8]
	add r4, r5, #0
	str r0, [sp, #4]
_02093BB8:
	ldr r0, _02093CD0 ; =0x000046A4
	ldr r1, [r5, r0]
	ldr r0, [sp, #0xc]
	strb r0, [r1, r6]
	ldr r0, _02093CD0 ; =0x000046A4
	ldr r0, [r5, r0]
	add r1, r0, r6
	ldrb r0, [r0, r6]
	add r0, #0x18
	strb r0, [r1, #2]
	ldr r0, _02093CD0 ; =0x000046A4
	ldr r0, [r5, r0]
	add r1, r0, r6
	mov r0, #0xc0
	strb r0, [r1, #1]
	ldr r0, _02093CD0 ; =0x000046A4
	ldr r0, [r5, r0]
	add r1, r0, r6
	ldrb r0, [r1, #1]
	add r0, #0x20
	strb r0, [r1, #3]
	ldr r0, _02093CD0 ; =0x000046A4
	ldr r0, [r5, r0]
	add r1, r0, r6
	mov r0, #0
	str r0, [r1, #4]
	mov r0, #0x35
	lsl r0, r0, #0xe
	str r0, [sp, #0x18]
	ldr r0, [sp, #8]
	add r0, #0x28
	lsl r0, r0, #0xc
	str r0, [sp, #0x1c]
	ldr r0, _02093CD4 ; =0x000007E8
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02093C0C
	add r0, sp, #0x10
	bl CreateSprite
	ldr r1, _02093CD4 ; =0x000007E8
	str r0, [r4, r1]
_02093C0C:
	ldr r0, _02093CD4 ; =0x000007E8
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimActiveFlag
	ldr r0, _02093CD4 ; =0x000007E8
	add r1, r7, #0
	ldr r0, [r4, r0]
	add r1, #0x27
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02093CD4 ; =0x000007E8
	mov r1, #1
	ldr r0, [r4, r0]
	bl sub_02024A04
	ldr r0, _02093CD4 ; =0x000007E8
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _02093CD4 ; =0x000007E8
	mov r1, #6
	ldr r0, [r4, r0]
	bl sub_02024ADC
	mov r0, #0x18
	str r0, [sp]
	ldr r0, _02093CD8 ; =0x000007E4
	ldr r2, [sp, #4]
	ldr r1, [r5, r0]
	add r0, r7, #0
	add r0, #0x21
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #0xd4
	mov r3, #0x18
	bl sub_0209428C
	ldr r0, [sp, #0xc]
	add r7, r7, #1
	add r0, #0x28
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r6, #8
	add r0, #0x28
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r4, #0x34
	add r0, #0x28
	str r0, [sp, #4]
	ldrb r0, [r5, #0xd]
	cmp r7, r0
	blt _02093BB8
_02093C78:
	mov r6, #0
	cmp r7, #3
	bge _02093CAE
	mov r0, #0x28
	add r4, r7, #0
	mul r4, r0
	add r4, #0x2c
_02093C86:
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0xd4
	add r2, r4, #0
	mov r3, #0x2f
	bl sub_0209417C
	add r1, r6, #0
	add r2, r6, #1
	lsl r2, r2, #0x18
	lsl r1, r1, #2
	lsr r6, r2, #0x18
	add r2, r5, r1
	ldr r1, _02093CDC ; =0x000008C8
	add r7, r7, #1
	add r4, #0x28
	str r0, [r2, r1]
	cmp r7, #3
	blt _02093C86
_02093CAE:
	ldr r0, _02093CE0 ; =0x000046A8
	mov r1, #0x20
	strb r1, [r5, r0]
	mov r3, #0x97
	add r1, r0, #2
	strb r3, [r5, r1]
	mov r2, #8
	add r1, r0, #1
	strb r2, [r5, r1]
	add r1, r0, #3
	strb r3, [r5, r1]
	mov r1, #0
	add r0, r0, #4
	str r1, [r5, r0]
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02093CD0: .word 0x000046A4
_02093CD4: .word 0x000007E8
_02093CD8: .word 0x000007E4
_02093CDC: .word 0x000008C8
_02093CE0: .word 0x000046A8
	thumb_func_end sub_02093B84

	thumb_func_start sub_02093CE4
sub_02093CE4: ; 0x02093CE4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r3, _02093E68 ; =0x0000469C
	add r1, r0, #0
	ldr r1, [r1, r3]
	str r0, [sp]
	cmp r1, #1
	bne _02093DA2
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp]
	ldrb r0, [r0, #0xd]
	mov ip, r0
	cmp r0, #0
	ble _02093DA0
	ldr r0, [sp]
	add r3, #8
	ldr r4, [r0, r3]
	ldr r5, [sp, #0x18]
	str r4, [sp, #8]
_02093D0C:
	ldr r0, [r4, #4]
	cmp r0, #0
	ldr r0, _02093E6C ; =0x00004698
	bne _02093D4E
	ldr r1, [sp]
	ldr r7, [r1, r0]
	ldr r0, [sp, #8]
	add r3, r0, r5
	ldrb r6, [r0, r5]
	ldrb r0, [r3, #2]
	ldrb r2, [r3, #1]
	str r0, [sp, #0x1c]
	ldr r0, _02093E70 ; =0x00004694
	ldr r0, [r1, r0]
	ldrb r1, [r3, #3]
	sub r0, r0, r2
	sub r1, r1, r2
	cmp r0, r1
	bhs _02093D90
	ldr r0, [sp, #0x1c]
	sub r1, r7, r6
	sub r0, r0, r6
	cmp r1, r0
	bhs _02093D90
	ldr r1, [sp, #0x18]
	ldr r0, [sp]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02093E7C
	add sp, #0x24
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02093D4E:
	ldr r1, [sp]
	ldr r7, [r1, r0]
	ldr r0, [sp, #8]
	add r3, r0, r5
	ldrb r6, [r0, r5]
	ldrb r0, [r3, #2]
	ldrb r2, [r3, #1]
	str r0, [sp, #0x20]
	ldr r0, _02093E70 ; =0x00004694
	ldr r0, [r1, r0]
	ldrb r1, [r3, #3]
	sub r0, r0, r2
	sub r1, r1, r2
	cmp r0, r1
	bhs _02093D90
	ldr r0, [sp, #0x20]
	sub r1, r7, r6
	sub r0, r0, r6
	cmp r1, r0
	bhs _02093D90
	ldr r0, [sp]
	ldr r1, [sp, #0x18]
	bl sub_02094F5C
	ldr r1, [sp, #0x18]
	ldr r0, [sp]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02093E7C
	add sp, #0x24
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02093D90:
	ldr r0, [sp, #0x18]
	add r4, #8
	add r1, r0, #1
	mov r0, ip
	add r5, #8
	str r1, [sp, #0x18]
	cmp r1, r0
	blt _02093D0C
_02093DA0:
	b _02093E62
_02093DA2:
	cmp r1, #2
	bne _02093E5E
	sub r2, r3, #4
	add r1, r0, #0
	ldr r1, [r1, r2]
	add r2, r3, #0
	str r1, [sp, #0x14]
	add r2, #0xd
	add r1, r0, #0
	ldrb r6, [r1, r2]
	add r2, r3, #0
	add r2, #0xc
	ldrb r5, [r1, r2]
	add r2, r3, #0
	add r2, #0xe
	ldrb r4, [r1, r2]
	add r2, r3, #0
	sub r2, #8
	ldr r1, [r1, r2]
	add r2, r3, #0
	str r1, [sp, #0x10]
	sub r7, r1, r6
	add r2, #0xf
	add r1, r0, #0
	ldrb r1, [r1, r2]
	sub r1, r1, r6
	cmp r7, r1
	bhs _02093DFA
	ldr r1, [sp, #0x14]
	sub r2, r1, r5
	sub r1, r4, r5
	cmp r2, r1
	bhs _02093DFA
	sub r3, #0x18
	add r1, r0, #0
	ldr r1, [r1, r3]
	bl sub_02094F5C
	ldr r0, [sp]
	bl sub_020956B8
	add sp, #0x24
	mov r0, #2
	pop {r4, r5, r6, r7, pc}
_02093DFA:
	ldr r0, [sp]
	mov r7, #0
	ldrb r0, [r0, #0xd]
	str r0, [sp, #0xc]
	cmp r0, #0
	ble _02093E62
	ldr r1, _02093E74 ; =0x000046A4
	ldr r0, [sp]
	add r6, r7, #0
	ldr r5, [r0, r1]
	str r5, [sp, #4]
_02093E10:
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _02093E50
	ldr r0, [sp, #4]
	add r4, r0, r6
	ldrb r3, [r4, #1]
	ldrb r1, [r4, #2]
	ldrb r2, [r0, r6]
	ldr r0, [sp, #0x10]
	ldrb r4, [r4, #3]
	sub r0, r0, r3
	sub r3, r4, r3
	cmp r0, r3
	bhs _02093E50
	ldr r0, [sp, #0x14]
	sub r3, r0, r2
	sub r0, r1, r2
	cmp r3, r0
	bhs _02093E50
	ldr r0, [sp]
	ldr r2, _02093E78 ; =0x00004684
	add r1, r0, #0
	ldr r1, [r1, r2]
	lsl r2, r7, #0x18
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	bl sub_02093F84
	add sp, #0x24
	mov r0, #3
	pop {r4, r5, r6, r7, pc}
_02093E50:
	ldr r0, [sp, #0xc]
	add r7, r7, #1
	add r5, #8
	add r6, #8
	cmp r7, r0
	blt _02093E10
	b _02093E62
_02093E5E:
	bl GF_AssertFail
_02093E62:
	mov r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02093E68: .word 0x0000469C
_02093E6C: .word 0x00004698
_02093E70: .word 0x00004694
_02093E74: .word 0x000046A4
_02093E78: .word 0x00004684
	thumb_func_end sub_02093CE4

	thumb_func_start sub_02093E7C
sub_02093E7C: ; 0x02093E7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _02093F70 ; =0x000005EA
	str r1, [sp]
	bl PlaySE
	ldr r2, _02093F74 ; =0x000046A4
	ldr r0, [sp]
	ldr r1, [r5, r2]
	lsl r0, r0, #3
	mov r3, #1
	add r0, r1, r0
	str r3, [r0, #4]
	sub r2, #0x20
	ldr r2, [r5, r2]
	ldr r1, [sp]
	lsl r2, r2, #0x18
	add r0, r5, #0
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02094668
	ldrb r1, [r5, #0xd]
	mov r4, #0
	cmp r1, #0
	bls _02093F6A
	mov r0, #0x8d
	lsl r0, r0, #4
	mov r7, #0xc
	add r2, r7, #0
	ldr r0, [r5, r0]
	sub r2, #0xd
_02093EBE:
	add r6, r4, #0
	mul r6, r7
	add r3, r0, r6
	ldr r3, [r3, #4]
	cmp r3, r2
	bne _02093F60
	ldr r0, _02093F78 ; =0x00004688
	add r2, sp, #4
	add r3, r5, r0
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #2
	ldr r1, [sp, #4]
	lsl r0, r0, #0xe
	sub r1, r1, r0
	str r1, [sp, #4]
	ldr r1, [sp, #8]
	lsr r0, r0, #1
	sub r0, r1, r0
	str r0, [sp, #8]
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r7, #0
	ldr r0, [r0, r6]
	bl sub_020247D4
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	ldr r0, [r0, r6]
	bl Set2dSpriteVisibleFlag
	ldr r0, _02093F7C ; =0x00004684
	lsr r2, r0, #3
	ldr r2, [r5, r2]
	ldr r1, [r5, r0]
	add r2, r2, r6
	str r1, [r2, #4]
	lsr r2, r0, #3
	ldr r2, [r5, r2]
	ldrb r1, [r5, #0xf]
	add r2, r2, r6
	str r1, [r2, #8]
	ldrb r1, [r5, #0xe]
	add r1, r1, #1
	strb r1, [r5, #0xe]
	ldr r1, [r5, r0]
	mov r0, #0x34
	mul r0, r1
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_02024B78
	ldr r0, [sp]
	ldr r3, _02093F80 ; =0x00000888
	lsl r1, r0, #4
	ldr r0, _02093F7C ; =0x00004684
	add r1, r5, r1
	ldr r2, [r5, r0]
	add r0, #0x2c
	str r2, [r1, r3]
	ldrb r6, [r5, #0xf]
	sub r2, r3, #4
	str r6, [r1, r2]
	add r2, r3, #4
	str r4, [r1, r2]
	mov r2, #1
	add r3, #8
	str r2, [r1, r3]
	ldr r1, [sp]
	add sp, #0x10
	str r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02093F60:
	add r3, r4, #1
	lsl r3, r3, #0x18
	lsr r4, r3, #0x18
	cmp r4, r1
	blo _02093EBE
_02093F6A:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02093F70: .word 0x000005EA
_02093F74: .word 0x000046A4
_02093F78: .word 0x00004688
_02093F7C: .word 0x00004684
_02093F80: .word 0x00000888
	thumb_func_end sub_02093E7C

	thumb_func_start sub_02093F84
sub_02093F84: ; 0x02093F84
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02093FF4 ; =0x000005EA
	add r4, r1, #0
	add r6, r2, #0
	bl PlaySE
	lsl r7, r4, #4
	mov r2, #0x89
	mov r1, #0
	add r0, r5, r7
	lsl r2, r2, #4
	str r1, [r0, r2]
	mov r0, #0x34
	mul r0, r4
	add r0, r5, r0
	sub r2, #0xa8
	ldr r0, [r0, r2]
	bl Set2dSpriteVisibleFlag
	ldr r1, _02093FF8 ; =0x000046A4
	mov r0, #0
	ldr r2, [r5, r1]
	lsl r1, r4, #3
	add r1, r2, r1
	str r0, [r1, #4]
	ldr r0, _02093FF8 ; =0x000046A4
	mov r3, #1
	ldr r1, [r5, r0]
	lsl r0, r6, #3
	add r0, r1, r0
	str r3, [r0, #4]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl sub_02094668
	lsl r1, r6, #4
	ldr r0, _02093FFC ; =0x00000888
	add r2, r5, r7
	ldr r3, [r2, r0]
	add r1, r5, r1
	str r3, [r1, r0]
	sub r3, r0, #4
	ldr r4, [r2, r3]
	str r4, [r1, r3]
	add r3, r0, #4
	ldr r3, [r2, r3]
	add r2, r0, #4
	str r3, [r1, r2]
	mov r2, #1
	add r0, #8
	str r2, [r1, r0]
	ldr r0, _02094000 ; =0x000046B0
	str r6, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02093FF4: .word 0x000005EA
_02093FF8: .word 0x000046A4
_02093FFC: .word 0x00000888
_02094000: .word 0x000046B0
	thumb_func_end sub_02093F84

	thumb_func_start sub_02094004
sub_02094004: ; 0x02094004
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x20
	str r0, [sp]
	ldr r0, _0209413C ; =0x000007E4
	mov r1, #0xe0
	ldr r0, [r5, r0]
	mov r2, #0xb0
	add r0, #0x78
	mov r3, #0x32
	bl sub_0209428C
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0xe0
	mov r2, #0xb0
	mov r3, #4
	bl sub_0209417C
	ldr r1, _02094140 ; =0x000008B4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #3
	bl sub_02024A04
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	bne _02094048
	ldr r0, _02094140 ; =0x000008B4
	mov r1, #0
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
_02094048:
	mov r3, #0x20
	ldr r0, _0209413C ; =0x000007E4
	str r3, [sp]
	ldr r0, [r5, r0]
	mov r1, #0x90
	add r0, #0x80
	mov r2, #0x10
	bl sub_0209428C
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x90
	mov r2, #0x10
	mov r3, #2
	bl sub_0209417C
	ldr r1, _02094144 ; =0x000008B8
	mov r3, #0x20
	str r0, [r5, r1]
	str r3, [sp]
	sub r1, #0xd4
	ldr r0, [r5, r1]
	mov r1, #0x10
	add r0, #0x7c
	add r2, r1, #0
	bl sub_0209428C
	mov r0, #1
	mov r1, #0x10
	str r0, [sp]
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #0
	bl sub_0209417C
	ldr r1, _02094148 ; =0x000008BC
	mov r3, #0x32
	str r0, [r5, r1]
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	str r1, [sp]
	bl sub_0209417C
	ldr r1, _0209414C ; =0x000008C4
	mov r2, #0xff
	str r0, [r5, r1]
	ldrb r0, [r5, #0xd]
	sub r1, #0xe0
	ldr r1, [r5, r1]
	add r0, #0x21
	lsl r0, r0, #2
	strb r2, [r1, r0]
	ldrb r0, [r5, #0xd]
	mov r7, #0
	cmp r0, #0
	ble _0209410C
	add r6, r7, #0
	add r4, r7, #0
_020940C0:
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0x40
	mov r3, #6
	bl sub_0209417C
	mov r1, #0x8d
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	str r0, [r1, r4]
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r0, r4
	mov r0, #0
	mvn r0, r0
	str r0, [r1, #4]
	mov r1, #0x8d
	lsl r1, r1, #4
	ldr r1, [r5, r1]
	ldrb r0, [r5, #0x10]
	add r1, r1, r4
	str r0, [r1, #8]
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #4
	ldr r0, [r0, r4]
	bl sub_02024ADC
	ldrb r0, [r5, #0xd]
	add r7, r7, #1
	add r6, #0x24
	add r4, #0xc
	cmp r7, r0
	blt _020940C0
_0209410C:
	mov r0, #0
	strb r0, [r5, #0xe]
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x14
	mov r2, #0x28
	mov r3, #0x2d
	bl sub_0209417C
	mov r1, #0x23
	lsl r1, r1, #6
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #1
	bl sub_02024A04
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024ADC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0209413C: .word 0x000007E4
_02094140: .word 0x000008B4
_02094144: .word 0x000008B8
_02094148: .word 0x000008BC
_0209414C: .word 0x000008C4
	thumb_func_end sub_02094004

	thumb_func_start sub_02094150
sub_02094150: ; 0x02094150
	push {r3, r4}
	ldr r3, [r1, #0x18]
	mov r4, #0
	str r3, [r0]
	mov r3, #0x5d
	lsl r3, r3, #2
	add r3, r1, r3
	str r3, [r0, #4]
	mov r3, #1
	str r4, [r0, #0x10]
	lsl r3, r3, #0xc
	str r3, [r0, #0x14]
	str r3, [r0, #0x18]
	str r3, [r0, #0x1c]
	strh r4, [r0, #0x20]
	mov r3, #0x14
	str r3, [r0, #0x24]
	str r2, [r0, #0x28]
	ldr r1, [r1, #4]
	str r1, [r0, #0x2c]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02094150

	thumb_func_start sub_0209417C
sub_0209417C: ; 0x0209417C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r0, sp, #0
	add r1, r6, #0
	mov r2, #1
	add r7, r3, #0
	bl sub_02094150
	lsl r0, r5, #0xc
	str r0, [sp, #8]
	lsl r0, r4, #0xc
	str r0, [sp, #0xc]
	mov r0, #0xa
	str r0, [sp, #0x24]
	add r0, sp, #0
	bl CreateSprite
	add r4, r0, #0
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #0
	add r1, r7, #0
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #1
	bl sub_02024A04
	ldr r1, [sp, #0x48]
	add r0, r4, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0209417C

	thumb_func_start sub_020941CC
sub_020941CC: ; 0x020941CC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	add r6, r1, #0
	str r0, [sp, #4]
	mov r1, #1
	add r4, r2, #0
	str r1, [sp, #8]
	mov r0, #0x97
	add r2, r6, #0
	mov r3, #2
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #1
	mov r2, #0
	str r0, [sp, #8]
	add r0, r6, #0
	mov r1, #2
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	add r0, r6, #0
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x97
	mov r1, #4
	add r2, r6, #0
	mov r3, #3
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	mov r0, #1
	mov r2, #0
	str r0, [sp, #8]
	add r0, r6, #0
	mov r1, #3
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	add r0, r6, #0
	mov r1, #3
	bl BgCommitTilemapBufferToVram
	ldr r3, _02094280 ; =0x000046D0
	mov r0, #0x97
	mov r1, #3
	mov r2, #1
	add r3, r5, r3
	str r4, [sp]
	bl GfGfxLoader_GetScrnData
	ldr r3, _02094284 ; =0x000046C8
	mov r1, #1
	str r0, [r5, r3]
	add r3, #0xc
	mov r0, #0x97
	add r2, r1, #0
	add r3, r5, r3
	str r4, [sp]
	bl GfGfxLoader_GetScrnData
	ldr r1, _02094288 ; =0x000046CC
	str r0, [r5, r1]
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02094280: .word 0x000046D0
_02094284: .word 0x000046C8
_02094288: .word 0x000046CC
	thumb_func_end sub_020941CC

	thumb_func_start sub_0209428C
sub_0209428C: ; 0x0209428C
	push {r4, r5}
	ldr r5, [sp, #8]
	lsr r4, r5, #0x1f
	add r4, r5, r4
	asr r4, r4, #1
	sub r5, r2, r4
	strb r5, [r0]
	lsr r5, r3, #0x1f
	add r5, r3, r5
	asr r5, r5, #1
	sub r3, r1, r5
	strb r3, [r0, #2]
	add r2, r2, r4
	strb r2, [r0, #1]
	add r1, r1, r5
	strb r1, [r0, #3]
	pop {r4, r5}
	bx lr
	thumb_func_end sub_0209428C

	thumb_func_start sub_020942B0
sub_020942B0: ; 0x020942B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	add r0, sp, #0x18
	mov r2, #1
	bl sub_02094150
	mov r6, #0
	mov r0, #0x28
	ldr r4, [sp, #4]
	str r6, [sp, #0x10]
	str r0, [sp, #0xc]
	add r7, r6, #0
_020942CC:
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xc]
	mov r5, #0x14
	lsl r0, r0, #0xc
	str r0, [sp, #8]
_020942D8:
	mov r0, #0x18
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, _020943E8 ; =0x000007E4
	ldr r2, [sp, #0xc]
	ldr r0, [r1, r0]
	add r1, r5, #0
	add r0, r0, r7
	mov r3, #0x18
	bl sub_0209428C
	lsl r0, r5, #0xc
	str r0, [sp, #0x20]
	ldr r0, [sp, #8]
	str r0, [sp, #0x24]
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0209430C
	add r0, sp, #0x18
	bl CreateSprite
	mov r1, #0x66
	lsl r1, r1, #2
	str r0, [r4, r1]
_0209430C:
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r6, #7
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024A04
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #6
	bl sub_02024ADC
	ldr r0, [sp, #0x14]
	add r7, r7, #4
	add r0, r0, #1
	add r4, #0x34
	add r6, r6, #1
	add r5, #0x18
	str r0, [sp, #0x14]
	cmp r0, #6
	blt _020942D8
	ldr r0, [sp, #0xc]
	add r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #5
	blt _020942CC
	mov r0, #5
	lsl r0, r0, #0xe
	str r0, [sp, #0x20]
	lsl r0, r0, #1
	str r0, [sp, #0x24]
	mov r1, #0x7b
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _0209438E
	add r0, sp, #0x18
	bl CreateSprite
	mov r2, #0x7b
	ldr r1, [sp, #4]
	lsl r2, r2, #4
	str r0, [r1, r2]
_0209438E:
	mov r1, #0x7b
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r1, #0x7b
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #0x30
	bl Set2dSpriteAnimSeqNo
	mov r1, #0x7b
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #1
	bl sub_02024A04
	mov r1, #0x7b
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r1, #0x7b
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #8
	bl sub_02024ADC
	mov r1, #0x7b
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	mov r1, #1
	bl sub_02024B78
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020943E8: .word 0x000007E4
	thumb_func_end sub_020942B0

	thumb_func_start sub_020943EC
sub_020943EC: ; 0x020943EC
	push {r3, lr}
	ldrb r1, [r0, #0xf]
	cmp r1, #0x12
	bne _020943FA
	bl sub_02094528
	pop {r3, pc}
_020943FA:
	bl sub_02094400
	pop {r3, pc}
	thumb_func_end sub_020943EC

	thumb_func_start sub_02094400
sub_02094400: ; 0x02094400
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	add r5, r0, #0
	ldr r1, [r5, #4]
	mov r0, #0x14
	bl NARC_ctor
	str r0, [sp, #0x1c]
	mov r1, #1
	ldr r0, [r5, #4]
	lsl r1, r1, #0xc
	bl AllocFromHeapAtEnd
	str r0, [sp, #0x20]
	mov r7, #0
	add r4, r5, #0
_02094420:
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024B78
	ldr r6, _02094514 ; =0x0000463C
	ldrb r1, [r5, #0xf]
	ldr r0, [r5, r6]
	add r6, #0xc
	ldr r6, [r5, r6]
	add r2, r7, #0
	add r3, sp, #0x24
	blx r6
	cmp r0, #0
	beq _02094494
	mov r0, #0x67
	lsl r0, r0, #2
	add r3, sp, #0x24
	add r2, r4, r0
	mov r6, #6
_0209444A:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _0209444A
	ldr r0, [sp, #0x20]
	mov r3, #0x66
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	ldr r1, _02094518 ; =0x000008D4
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	add r0, sp, #0x24
	add r1, r5, r1
	add r2, r7, #0
	bl sub_02094C08
	add r0, sp, #0x24
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _02094486
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024B78
	b _020944BA
_02094486:
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02024B78
	b _020944BA
_02094494:
	ldr r0, [sp, #0x20]
	ldr r1, _02094518 ; =0x000008D4
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	add r1, r5, r1
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	add r0, sp, #0x24
	add r2, r7, #0
	mov r3, #0
	bl sub_02094C08
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_020944BA:
	add r7, r7, #1
	add r4, #0x34
	cmp r7, #0x1e
	blt _02094420
	ldr r0, [sp, #0x20]
	bl FreeToHeap
	ldr r0, [sp, #0x1c]
	bl NARC_dtor
	ldr r1, _0209451C ; =sub_02094758
	ldr r0, _02094520 ; =0x00004644
	str r1, [r5, r0]
	ldrb r1, [r5, #0xf]
	add r0, r5, #0
	bl sub_02094C88
	add r0, r5, #0
	bl sub_02094EB4
	mov r0, #0x14
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _02094524 ; =0x000046D4
	mov r2, #0
	ldr r0, [r5, r0]
	mov r1, #2
	add r0, #0xc
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	mov r0, #0x20
	str r0, [sp, #0x14]
	mov r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5]
	add r3, r2, #0
	bl CopyRectToBgTilemapRect
	ldr r0, [r5]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02094514: .word 0x0000463C
_02094518: .word 0x000008D4
_0209451C: .word sub_02094758
_02094520: .word 0x00004644
_02094524: .word 0x000046D4
	thumb_func_end sub_02094400

	thumb_func_start sub_02094528
sub_02094528: ; 0x02094528
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	add r6, r0, #0
	ldr r1, [r6, #4]
	mov r0, #0x14
	bl NARC_ctor
	str r0, [sp, #0x20]
	mov r1, #1
	ldr r0, [r6, #4]
	lsl r1, r1, #0xc
	bl AllocFromHeapAtEnd
	str r0, [sp, #0x24]
	ldr r0, _02094654 ; =0x00004640
	ldr r0, [r6, r0]
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r4, #0
	str r0, [sp, #0x1c]
	cmp r0, #0
	ble _020945C0
	add r5, r6, #0
_0209455A:
	add r0, r6, #0
	add r1, r4, #0
	add r2, sp, #0x28
	bl sub_02094F14
	mov r0, #0x67
	lsl r0, r0, #2
	add r3, sp, #0x28
	add r2, r5, r0
	mov r7, #6
_0209456E:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r7, r7, #1
	bne _0209456E
	ldr r0, [sp, #0x24]
	mov r3, #0x66
	str r0, [sp]
	ldr r0, [sp, #0x20]
	ldr r1, _02094658 ; =0x000008D4
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	lsl r3, r3, #2
	ldr r3, [r5, r3]
	add r0, sp, #0x28
	add r1, r6, r1
	add r2, r4, #0
	bl sub_02094C08
	add r0, sp, #0x28
	ldrh r0, [r0, #8]
	cmp r0, #0
	beq _020945AA
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024B78
	b _020945B6
_020945AA:
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024B78
_020945B6:
	ldr r0, [sp, #0x1c]
	add r4, r4, #1
	add r5, #0x34
	cmp r4, r0
	blt _0209455A
_020945C0:
	mov r1, #0
	str r1, [sp, #0x28]
	add r0, sp, #0x28
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	cmp r4, #0x1e
	bge _02094606
	mov r0, #0x34
	mul r0, r4
	add r5, r6, r0
	mov r7, #0x40
_020945DA:
	ldr r0, [sp, #0x24]
	ldr r1, _02094658 ; =0x000008D4
	str r0, [sp]
	ldr r0, [sp, #0x20]
	add r1, r6, r1
	str r0, [sp, #4]
	add r0, sp, #0x28
	add r2, r4, #0
	mov r3, #0
	str r7, [sp, #8]
	bl sub_02094C08
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r4, r4, #1
	add r5, #0x34
	cmp r4, #0x1e
	blt _020945DA
_02094606:
	ldr r0, [sp, #0x24]
	bl FreeToHeap
	ldr r0, [sp, #0x20]
	bl NARC_dtor
	ldr r1, _0209465C ; =sub_02094758
	ldr r0, _02094660 ; =0x00004644
	str r1, [r6, r0]
	ldrb r1, [r6, #0xf]
	add r0, r6, #0
	bl sub_02094C88
	add r0, r6, #0
	bl sub_02094EB4
	mov r1, #0x14
	str r1, [sp]
	mov r2, #0
	ldr r0, _02094664 ; =0x000046D0
	str r1, [sp, #4]
	ldr r0, [r6, r0]
	add r3, r2, #0
	add r0, #0xc
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r6]
	mov r1, #2
	bl CopyRectToBgTilemapRect
	ldr r0, [r6]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02094654: .word 0x00004640
_02094658: .word 0x000008D4
_0209465C: .word sub_02094758
_02094660: .word 0x00004644
_02094664: .word 0x000046D0
	thumb_func_end sub_02094528

	thumb_func_start sub_02094668
sub_02094668: ; 0x02094668
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r0, #0
	str r1, [sp, #0xc]
	ldr r1, [r4, #4]
	mov r0, #0x14
	add r7, r2, #0
	add r6, r3, #0
	bl NARC_ctor
	str r0, [sp, #0x14]
	mov r1, #1
	ldr r0, [r4, #4]
	lsl r1, r1, #0xc
	bl AllocFromHeapAtEnd
	str r0, [sp, #0x18]
	mov r3, #0
	mov r1, #0x83
	ldr r0, _02094740 ; =0x000008DC
	add r5, r4, #0
	add r2, r3, #0
	lsl r1, r1, #2
_02094696:
	add r3, r3, #1
	str r2, [r5, r0]
	add r5, r5, r1
	cmp r3, #0x1e
	blt _02094696
	cmp r6, #0
	beq _020946E6
	ldr r1, [sp, #0xc]
	ldr r0, _02094744 ; =0x000007EC
	add r3, r7, #0
	mov r2, #0x34
	mul r3, r2
	mul r2, r1
	add r1, r4, r2
	add r5, r4, r0
	mov ip, r2
	add r2, r5, r3
	add r6, r1, r0
	mov r7, #6
_020946BC:
	ldmia r2!, {r0, r1}
	stmia r6!, {r0, r1}
	sub r7, r7, #1
	bne _020946BC
	ldr r0, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, _02094748 ; =0x00000222
	str r0, [sp, #8]
	add r0, r5, r3
	ldr r5, _0209474C ; =0x000008D4
	mov r3, ip
	add r1, r4, r5
	add r3, r4, r3
	sub r5, #0xec
	ldr r2, [sp, #0xc]
	ldr r3, [r3, r5]
	bl sub_02094C08
	b _0209472A
_020946E6:
	mov r0, #0x67
	lsl r0, r0, #2
	add r6, r4, r0
	add r5, r7, #0
	mov r1, #0x34
	mul r5, r1
	ldr r0, [sp, #0xc]
	add r3, r6, r5
	mul r1, r0
	str r1, [sp, #0x10]
	ldr r0, _02094744 ; =0x000007EC
	add r1, r4, r1
	add r2, r1, r0
	mov r7, #6
_02094702:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r7, r7, #1
	bne _02094702
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r3, r4, r3
	str r0, [sp, #4]
	ldr r0, _02094748 ; =0x00000222
	str r0, [sp, #8]
	add r0, r6, r5
	ldr r5, _0209474C ; =0x000008D4
	ldr r2, [sp, #0xc]
	add r1, r4, r5
	sub r5, #0xec
	ldr r3, [r3, r5]
	bl sub_02094C08
_0209472A:
	ldr r0, [sp, #0x18]
	bl FreeToHeap
	ldr r0, [sp, #0x14]
	bl NARC_dtor
	ldr r1, _02094750 ; =sub_02094758
	ldr r0, _02094754 ; =0x00004644
	str r1, [r4, r0]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02094740: .word 0x000008DC
_02094744: .word 0x000007EC
_02094748: .word 0x00000222
_0209474C: .word 0x000008D4
_02094750: .word sub_02094758
_02094754: .word 0x00004644
	thumb_func_end sub_02094668

	thumb_func_start sub_02094758
sub_02094758: ; 0x02094758
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #2
	lsl r6, r6, #8
	add r7, r6, #0
	add r5, r0, #0
	mov r4, #0
	add r7, #0xc
_02094766:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0209478A
	add r0, r5, #0
	add r0, #0xc
	add r1, r6, #0
	bl DC_FlushRange
	add r0, r5, #0
	ldr r1, [r5]
	add r0, #0xc
	add r2, r6, #0
	bl GX_LoadOBJ
	ldr r0, [r5, #8]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
_0209478A:
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, #0x1e
	blt _02094766
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02094758

	thumb_func_start sub_02094794
sub_02094794: ; 0x02094794
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x34
	mul r0, r4
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_020248AC
	add r1, r0, #0
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_020247D4
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020947C0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02094794

	thumb_func_start sub_020947C0
sub_020947C0: ; 0x020947C0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r0, #0x34
	add r6, r4, #0
	mul r6, r0
	mov r0, #0x66
	add r1, r5, r6
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _020947E4
	bl sub_020248B8
	cmp r0, #0
	bne _020947E4
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_020947E4:
	mov r0, #0x69
	add r1, r5, r6
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _020947F4
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_020947F4:
	mov r1, #0
	mov r0, #0
	mvn r1, r1
	add r2, r0, #0
	b _0209481A
_020947FE:
	mov r3, #0x8d
	lsl r3, r3, #4
	ldr r3, [r5, r3]
	ldrb r6, [r5, #0xf]
	add r7, r3, r2
	ldr r3, [r7, #8]
	cmp r6, r3
	bne _02094816
	ldr r3, [r7, #4]
	cmp r4, r3
	bne _02094816
	add r1, r0, #0
_02094816:
	add r2, #0xc
	add r0, r0, #1
_0209481A:
	mov r3, #0
	mvn r3, r3
	cmp r1, r3
	bne _02094828
	ldrb r3, [r5, #0xd]
	cmp r0, r3
	blt _020947FE
_02094828:
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _0209485C
	ldrb r3, [r5, #0xd]
	ldrb r0, [r5, #0xe]
	cmp r0, r3
	bne _0209483C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0209483C:
	mov r4, #0
	cmp r3, #0
	ble _0209485C
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r2, [r5, r0]
	sub r0, r4, #1
_0209484A:
	ldr r1, [r2, #4]
	cmp r1, r0
	bne _02094854
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02094854:
	add r4, r4, #1
	add r2, #0xc
	cmp r4, r3
	blt _0209484A
_0209485C:
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020947C0

	thumb_func_start sub_02094860
sub_02094860: ; 0x02094860
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02094894
	ldrb r1, [r5, #0xd]
	add r6, r0, #0
	cmp r4, r1
	bge _0209488E
	mov r0, #0x34
	mul r0, r4
	add r1, r5, r0
	ldr r0, _02094890 ; =0x000007E8
	ldr r0, [r1, r0]
	bl sub_020248AC
	add r1, r0, #0
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_020247D4
	add r0, r6, #0
_0209488E:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02094890: .word 0x000007E8
	thumb_func_end sub_02094860

	thumb_func_start sub_02094894
sub_02094894: ; 0x02094894
	push {r3, lr}
	ldrb r2, [r0, #0xd]
	cmp r1, r2
	blt _020948A0
	mov r0, #3
	pop {r3, pc}
_020948A0:
	mov r2, #0x34
	mul r2, r1
	add r1, r0, r2
	ldr r0, _020948C0 ; =0x000007E8
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _020948BA
	bl sub_020248B8
	cmp r0, #0
	bne _020948BA
	mov r0, #3
	pop {r3, pc}
_020948BA:
	mov r0, #1
	pop {r3, pc}
	nop
_020948C0: .word 0x000007E8
	thumb_func_end sub_02094894

	thumb_func_start sub_020948C4
sub_020948C4: ; 0x020948C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, _020949D4 ; =0x00004680
	mov r0, #1
	str r0, [r5, r1]
	add r6, r2, #0
	add r0, r1, #4
	str r6, [r5, r0]
	add r0, r1, #0
	add r0, #0x1c
	str r4, [r5, r0]
	cmp r4, #1
	bne _020948EE
	mov r0, #0x66
	lsl r0, r0, #2
	add r7, r5, r0
	add r1, #0x20
	str r7, [r5, r1]
	b _02094900
_020948EE:
	cmp r4, #2
	bne _020948FC
	ldr r0, _020949D8 ; =0x000007E8
	add r1, #0x20
	add r7, r5, r0
	str r7, [r5, r1]
	b _02094900
_020948FC:
	bl GF_AssertFail
_02094900:
	mov r0, #0x34
	mul r0, r6
	ldr r0, [r7, r0]
	bl sub_020248AC
	add r3, r0, #0
	ldr r0, _020949DC ; =0x00004688
	add r2, r5, r0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #0x2e
	str r0, [r2]
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _020949E0 ; =0x000046A0
	ldr r2, [r5, r0]
	sub r0, #0x1c
	ldr r1, [r5, r0]
	mov r0, #0x34
	mul r0, r1
	ldr r0, [r2, r0]
	mov r1, #3
	bl sub_02024ADC
	cmp r4, #1
	bne _020949D0
	ldr r0, _020949E0 ; =0x000046A0
	ldr r2, [r5, r0]
	sub r0, #0x1c
	ldr r1, [r5, r0]
	mov r0, #0x34
	mul r0, r1
	ldr r0, [r2, r0]
	bl sub_020248AC
	add r6, r0, #0
	mov r3, #0
	mov r1, #0x83
	ldr r0, _020949E4 ; =0x000008DC
	add r4, r5, #0
	add r2, r3, #0
	lsl r1, r1, #2
_0209495C:
	add r3, r3, #1
	str r2, [r4, r0]
	add r4, r4, r1
	cmp r3, #0x1e
	blt _0209495C
	ldr r1, [r5, #4]
	mov r0, #0x14
	bl NARC_ctor
	add r4, r0, #0
	mov r1, #1
	ldr r0, [r5, #4]
	lsl r1, r1, #0xc
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	ldr r3, _020949E0 ; =0x000046A0
	str r7, [sp]
	add r1, r3, #0
	ldr r0, _020949E8 ; =0x000002B1
	str r4, [sp, #4]
	str r0, [sp, #8]
	sub r1, #0x1c
	ldr r2, [r5, r1]
	mov r1, #0x34
	mul r1, r2
	ldr r0, [r5, r3]
	mov r2, #0
	add r0, r0, r1
	lsr r1, r3, #3
	mov r3, #0x7b
	lsl r3, r3, #4
	ldr r3, [r5, r3]
	add r0, r0, #4
	add r1, r5, r1
	bl sub_02094C08
	mov r0, #0x7b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl sub_020247D4
	mov r0, #0x7b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r7, #0
	bl FreeToHeap
	add r0, r4, #0
	bl NARC_dtor
	ldr r1, _020949EC ; =sub_02094758
	ldr r0, _020949F0 ; =0x00004644
	str r1, [r5, r0]
_020949D0:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020949D4: .word 0x00004680
_020949D8: .word 0x000007E8
_020949DC: .word 0x00004688
_020949E0: .word 0x000046A0
_020949E4: .word 0x000008DC
_020949E8: .word 0x000002B1
_020949EC: .word sub_02094758
_020949F0: .word 0x00004644
	thumb_func_end sub_020948C4

	thumb_func_start sub_020949F4
sub_020949F4: ; 0x020949F4
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r4, r0, #0
	ldr r0, _02094A64 ; =0x00004680
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02094A5E
	add r0, sp, #4
	add r1, sp, #0
	bl sub_02025364
	ldr r0, [sp, #4]
	add r5, sp, #0x14
	lsl r0, r0, #0xc
	str r0, [sp, #0x14]
	ldr r0, [sp]
	add r3, sp, #8
	lsl r0, r0, #0xc
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	mov r0, #1
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [sp, #0xc]
	ldr r0, _02094A68 ; =0x000046A0
	ldr r3, [r4, r0]
	sub r0, #0x1c
	ldr r1, [r4, r0]
	mov r0, #0x34
	mul r0, r1
	ldr r0, [r3, r0]
	add r1, r2, #0
	bl sub_020247D4
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, sp, #0x14
	bl sub_020247D4
	ldr r1, [sp, #4]
	ldr r0, _02094A6C ; =0x00004694
	str r1, [r4, r0]
	ldr r1, [sp]
	add r0, r0, #4
	str r1, [r4, r0]
_02094A5E:
	add sp, #0x20
	pop {r3, r4, r5, pc}
	nop
_02094A64: .word 0x00004680
_02094A68: .word 0x000046A0
_02094A6C: .word 0x00004694
	thumb_func_end sub_020949F4

	thumb_func_start sub_02094A70
sub_02094A70: ; 0x02094A70
	push {r4, lr}
	ldr r1, _02094A8C ; =0x00004680
	add r4, r0, #0
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _02094A88
	bl sub_02093CE4
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02094A90
_02094A88:
	pop {r4, pc}
	nop
_02094A8C: .word 0x00004680
	thumb_func_end sub_02094A70

	thumb_func_start sub_02094A90
sub_02094A90: ; 0x02094A90
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	cmp r1, #0
	beq _02094B1A
	ldr r2, _02094BF0 ; =0x0000469C
	ldr r0, [r4, r2]
	cmp r0, #2
	bne _02094AE8
	cmp r1, #2
	bne _02094AC0
	add r0, r2, #0
	sub r0, #0x14
	add r5, r4, r0
	ldmia r5!, {r0, r1}
	add r3, sp, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	sub r2, #0x18
	str r0, [r3]
	ldr r0, [r4, r2]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	b _02094B0E
_02094AC0:
	add r0, r2, #0
	add r0, #0x14
	ldr r0, [r4, r0]
	add r2, #0x14
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x35
	lsl r0, r0, #0xe
	str r0, [sp]
	add r1, r1, #1
	mov r0, #0x28
	mul r0, r1
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, r2]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	b _02094B0E
_02094AE8:
	add r0, r2, #0
	add r0, #0x14
	ldr r0, [r4, r0]
	add r2, #0x14
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x35
	lsl r0, r0, #0xe
	str r0, [sp]
	add r1, r1, #1
	mov r0, #0x28
	mul r0, r1
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, r2]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
_02094B0E:
	ldr r0, _02094BF4 ; =0x000046B8
	mov r1, #3
	ldr r0, [r4, r0]
	bl sub_02095D40
	b _02094B5C
_02094B1A:
	ldr r2, _02094BF8 ; =0x00004688
	add r3, sp, #0
	add r5, r4, r2
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	add r0, r2, #0
	add r0, #0x14
	ldr r0, [r4, r0]
	cmp r0, #2
	bne _02094B48
	add r0, r2, #0
	sub r2, r2, #4
	ldr r2, [r4, r2]
	add r0, #0x30
	lsl r2, r2, #0x18
	ldr r0, [r4, r0]
	mov r1, #3
	lsr r2, r2, #0x18
	bl sub_02095D40
	b _02094B5C
_02094B48:
	add r0, r2, #0
	sub r2, r2, #4
	ldr r2, [r4, r2]
	add r0, #0x30
	lsl r2, r2, #0x18
	ldr r0, [r4, r0]
	mov r1, #2
	lsr r2, r2, #0x18
	bl sub_02095D40
_02094B5C:
	ldr r1, _02094BFC ; =0x000046A0
	add r0, r1, #0
	sub r0, #0x1c
	ldr r2, [r4, r0]
	ldr r3, [r4, r1]
	mov r0, #0x34
	mul r0, r2
	sub r1, #0x18
	ldr r0, [r3, r0]
	add r1, r4, r1
	bl sub_020247D4
	ldr r0, _02094BFC ; =0x000046A0
	ldr r2, [r4, r0]
	sub r0, #0x1c
	ldr r1, [r4, r0]
	mov r0, #0x34
	mul r0, r1
	ldr r0, [r2, r0]
	mov r1, #6
	bl sub_02024ADC
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl sub_020247D4
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x2d
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02094C00 ; =0x000046BC
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _02094BAC
	mov r1, #0
	str r1, [r4, r0]
_02094BAC:
	ldr r0, _02094C04 ; =0x00004680
	mov r1, #0
	str r1, [r4, r0]
	sub r3, r1, #1
	add r2, r0, #4
	str r3, [r4, r2]
	add r2, r0, #0
	add r2, #8
	str r1, [r4, r2]
	add r2, r0, #0
	add r2, #0xc
	str r1, [r4, r2]
	add r2, r0, #0
	add r2, #0x10
	str r1, [r4, r2]
	add r2, r0, #0
	add r2, #0x14
	str r1, [r4, r2]
	add r2, r0, #0
	add r2, #0x18
	str r1, [r4, r2]
	add r2, r0, #0
	add r2, #0x20
	str r1, [r4, r2]
	add r0, #0x1c
	str r1, [r4, r0]
	mov r0, #0x7b
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02094BF0: .word 0x0000469C
_02094BF4: .word 0x000046B8
_02094BF8: .word 0x00004688
_02094BFC: .word 0x000046A0
_02094C00: .word 0x000046BC
_02094C04: .word 0x00004680
	thumb_func_end sub_02094A90

	thumb_func_start sub_02094C08
sub_02094C08: ; 0x02094C08
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x83
	add r7, r2, #0
	lsl r0, r0, #2
	mul r0, r7
	add r5, r3, #0
	add r4, r1, r0
	cmp r5, #0
	beq _02094C64
	ldrh r1, [r6, #8]
	ldrh r2, [r6, #0xa]
	ldr r0, [r6]
	bl GetMonIconNaixEx
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r1, sp, #0
	bl sub_02094C6C
	ldr r0, [sp]
	add r1, r4, #0
	mov r2, #2
	ldr r0, [r0, #0x14]
	add r1, #0xc
	lsl r2, r2, #8
	bl MIi_CpuCopyFast
	ldr r1, [sp, #0x20]
	lsl r0, r7, #4
	add r0, r1, r0
	lsl r0, r0, #5
	str r0, [r4]
	str r5, [r4, #8]
	ldrh r1, [r6, #0xa]
	ldrh r2, [r6, #8]
	ldr r0, [r6]
	bl GetMonIconPaletteEx
	add r0, #8
	str r0, [r4, #4]
	ldr r1, [r4, #4]
	add r0, r5, #0
	bl sub_02024A14
	pop {r3, r4, r5, r6, r7, pc}
_02094C64:
	mov r0, #0
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02094C08

	thumb_func_start sub_02094C6C
sub_02094C6C: ; 0x02094C6C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r0, r3, #0
	add r1, r6, #0
	bl NARC_ReadWholeMember
	add r0, r4, #0
	add r1, r5, #0
	bl NNS_G2dGetUnpackedBGCharacterData
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02094C6C

	thumb_func_start sub_02094C88
sub_02094C88: ; 0x02094C88
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r1, #0
	add r5, r0, #0
	cmp r6, #0x12
	bne _02094CB2
	ldr r2, _02094D0C ; =0x0000012A
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r6, r0, #0
	mov r1, #1
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r6, #0
	bl DestroyMsgData
	b _02094CC8
_02094CB2:
	ldr r1, [r5, #4]
	mov r0, #0x40
	bl String_ctor
	ldr r3, _02094D10 ; =0x0000463C
	add r2, r6, #0
	ldr r1, [r5, r3]
	add r3, #0x10
	ldr r3, [r5, r3]
	add r4, r0, #0
	blx r3
_02094CC8:
	ldr r0, _02094D14 ; =0x00004650
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	mov r3, #0x60
	bl FontID_String_GetCenterAlignmentX
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02094D18 ; =0x00010200
	add r2, r4, #0
	str r0, [sp, #8]
	ldr r0, _02094D14 ; =0x00004650
	str r1, [sp, #0xc]
	add r0, r5, r0
	bl AddTextPrinterParameterized2
	ldr r0, _02094D14 ; =0x00004650
	add r0, r5, r0
	bl CopyWindowToVram
	add r0, r4, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02094D0C: .word 0x0000012A
_02094D10: .word 0x0000463C
_02094D14: .word 0x00004650
_02094D18: .word 0x00010200
	thumb_func_end sub_02094C88

	thumb_func_start sub_02094D1C
sub_02094D1C: ; 0x02094D1C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r2, _02094D90 ; =0x0000012A
	ldr r3, [r5, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	mov r1, #0
	add r6, r0, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, _02094D94 ; =0x00004670
	mov r1, #0
	add r0, r5, r0
	bl FillWindowPixelBuffer
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _02094D78
	ldr r0, _02094D94 ; =0x00004670
	add r0, r5, r0
	bl GetWindowWidth
	lsl r3, r0, #3
	mov r0, #4
	add r1, r4, #0
	mov r2, #0
	bl FontID_String_GetCenterAlignmentX
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02094D98 ; =0x000F0100
	add r2, r4, #0
	str r0, [sp, #8]
	ldr r0, _02094D94 ; =0x00004670
	str r1, [sp, #0xc]
	add r0, r5, r0
	mov r1, #4
	bl AddTextPrinterParameterized2
_02094D78:
	ldr r0, _02094D94 ; =0x00004670
	add r0, r5, r0
	bl CopyWindowToVram
	add r0, r4, #0
	bl String_dtor
	add r0, r6, #0
	bl DestroyMsgData
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02094D90: .word 0x0000012A
_02094D94: .word 0x00004670
_02094D98: .word 0x000F0100
	thumb_func_end sub_02094D1C

	thumb_func_start sub_02094D9C
sub_02094D9C: ; 0x02094D9C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02094DF8
	ldr r0, _02094DF4 ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	mov r1, #0
	mov r0, #0xc0
	str r0, [sp]
	mov r0, #0x97
	add r2, r1, #0
	add r3, r1, #0
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	mov r0, #5
	lsl r0, r0, #0xa
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r1, #2
	mov r0, #0x97
	add r2, r5, #0
	add r3, r1, #0
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadCharData
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #1
	str r1, [sp]
	bl BG_FillCharDataRange
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02094DF4: .word gSystem + 0x60
	thumb_func_end sub_02094D9C

	thumb_func_start sub_02094DF8
sub_02094DF8: ; 0x02094DF8
	push {r3, r4, r5, lr}
	sub sp, #0x70
	ldr r5, _02094EA4 ; =_021083E4
	add r4, r0, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0x54
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	add r0, r4, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02094EA8 ; =_021083C8
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02094EAC ; =_021083AC
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02094EB0 ; =_02108400
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	add sp, #0x70
	pop {r3, r4, r5, pc}
	nop
_02094EA4: .word _021083E4
_02094EA8: .word _021083C8
_02094EAC: .word _021083AC
_02094EB0: .word _02108400
	thumb_func_end sub_02094DF8

	thumb_func_start sub_02094EB4
sub_02094EB4: ; 0x02094EB4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0xd]
	mov r6, #0
	cmp r0, #0
	ble _02094F12
	add r4, r6, #0
	sub r7, r6, #1
_02094EC4:
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r0, r0, r4
	ldr r1, [r0, #4]
	cmp r1, r7
	beq _02094F00
	ldrb r2, [r5, #0xf]
	ldr r1, [r0, #8]
	cmp r2, r1
	bne _02094F00
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r0, r0, r4
	ldr r1, [r0, #4]
	mov r0, #0x34
	mul r0, r1
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_02024B78
	b _02094F08
_02094F00:
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_02094F08:
	ldrb r0, [r5, #0xd]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _02094EC4
_02094F12:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02094EB4

	thumb_func_start sub_02094F14
sub_02094F14: ; 0x02094F14
	push {r3, r4, r5, lr}
	add r4, r2, #0
	ldr r2, _02094F58 ; =0x00004640
	ldr r0, [r0, r2]
	bl GetPartyMonByIndex
	add r5, r0, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	str r0, [r4]
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #8]
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0xa]
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r4, #0xc]
	mov r0, #0
	strh r0, [r4, #0xe]
	pop {r3, r4, r5, pc}
	nop
_02094F58: .word 0x00004640
	thumb_func_end sub_02094F14

	thumb_func_start sub_02094F5C
sub_02094F5C: ; 0x02094F5C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	add r5, r0, #0
	lsl r7, r6, #4
	ldr r1, _02095010 ; =0x0000088C
	add r0, r5, r7
	ldr r2, [r0, r1]
	mov r0, #0xc
	add r4, r2, #0
	add r1, #0x44
	mul r4, r0
	ldr r0, [r5, r1]
	add r2, r0, r4
	ldr r1, [r2, #8]
	ldr r0, [r0, r4]
	str r1, [sp, #4]
	ldr r1, [r2, #4]
	str r1, [sp]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r2, [r5, r0]
	mov r1, #0
	mvn r1, r1
	add r2, r2, r4
	str r1, [r2, #4]
	ldrb r1, [r5, #0xe]
	sub r1, r1, #1
	strb r1, [r5, #0xe]
	ldrb r2, [r5, #0xf]
	ldr r1, [sp, #4]
	cmp r1, r2
	bne _02094FBA
	ldr r0, [sp]
	mov r1, #0x34
	mul r1, r0
	mov r0, #0x66
	add r1, r5, r1
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_02024B78
	b _02094FE6
_02094FBA:
	mov r1, #0x34
	mul r1, r6
	add r1, r5, r1
	sub r0, #0xe8
	ldr r0, [r1, r0]
	bl sub_020248AC
	add r1, r0, #0
	ldr r0, _02095014 ; =0x000008C4
	ldr r0, [r5, r0]
	bl sub_020247D4
	ldr r0, _02095014 ; =0x000008C4
	mov r1, #1
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _02095014 ; =0x000008C4
	mov r1, #0x32
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
_02094FE6:
	mov r2, #0x89
	mov r1, #0
	add r0, r5, r7
	lsl r2, r2, #4
	str r1, [r0, r2]
	mov r0, #0x34
	mul r0, r6
	add r0, r5, r0
	sub r2, #0xa8
	ldr r0, [r0, r2]
	bl Set2dSpriteVisibleFlag
	ldr r0, _02095018 ; =0x000046A4
	mov r2, #0
	ldr r1, [r5, r0]
	lsl r0, r6, #3
	add r0, r1, r0
	str r2, [r0, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02095010: .word 0x0000088C
_02095014: .word 0x000008C4
_02095018: .word 0x000046A4
	thumb_func_end sub_02094F5C

	thumb_func_start sub_0209501C
sub_0209501C: ; 0x0209501C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	ldr r0, [r4, #4]
	add r6, r2, #0
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _020950B0 ; =0x000003D2
	mov r3, #0xb
	bl LoadUserFrameGfx2
	mov r0, #0x15
	str r0, [sp]
	str r0, [sp, #4]
	mov r3, #2
	ldr r1, _020950B4 ; =0x00004660
	str r3, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0xc6
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, r4, r1
	mov r2, #3
	bl AddWindowParameterized
	ldr r2, _020950B8 ; =0x0000012A
	ldr r3, [r4, #4]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	add r1, r5, #0
	add r7, r0, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _020950B4 ; =0x00004660
	mov r1, #0xf
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _020950BC ; =0x0001020F
	add r1, r6, #0
	str r0, [sp, #8]
	ldr r0, _020950B4 ; =0x00004660
	add r2, r5, #0
	add r0, r4, r0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r7, #0
	bl DestroyMsgData
	ldr r0, _020950B4 ; =0x00004660
	add r0, r4, r0
	bl CopyWindowToVram
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020950B0: .word 0x000003D2
_020950B4: .word 0x00004660
_020950B8: .word 0x0000012A
_020950BC: .word 0x0001020F
	thumb_func_end sub_0209501C

	thumb_func_start sub_020950C0
sub_020950C0: ; 0x020950C0
	push {r3, lr}
	ldrb r1, [r0, #0xd]
	cmp r1, #1
	bne _020950D0
	mov r1, #5
	mov r2, #1
	bl sub_0209501C
_020950D0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020950C0

	thumb_func_start sub_020950D4
sub_020950D4: ; 0x020950D4
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xd]
	cmp r0, #1
	bne _020950F2
	ldr r0, _020950F4 ; =0x00004660
	add r0, r4, r0
	bl GetWindowBgConfig
	cmp r0, #0
	beq _020950F2
	ldr r0, _020950F4 ; =0x00004660
	add r0, r4, r0
	bl RemoveWindow
_020950F2:
	pop {r4, pc}
	.balign 4, 0
_020950F4: .word 0x00004660
	thumb_func_end sub_020950D4

	thumb_func_start sub_020950F8
sub_020950F8: ; 0x020950F8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0209511A
	cmp r1, #0
	beq _0209510E
	mov r0, #8
	mov r1, #0
	bl GX_EngineAToggleLayers
_0209510E:
	add r0, r4, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r4, #0
	bl RemoveWindow
_0209511A:
	pop {r4, pc}
	thumb_func_end sub_020950F8

	thumb_func_start sub_0209511C
sub_0209511C: ; 0x0209511C
	push {r4, r5, r6, r7}
	ldrb r1, [r0, #0xd]
	mov r4, #0
	cmp r1, #0
	ble _0209514C
	ldr r1, _02095150 ; =0x00000888
	ldr r2, _02095154 ; =0x000046B4
	add r5, r0, #0
	add r6, r4, #0
_0209512E:
	ldr r3, _02095158 ; =0x00000884
	ldr r7, _02095154 ; =0x000046B4
	ldr r3, [r5, r3]
	ldr r7, [r0, r7]
	add r4, r4, #1
	str r3, [r7, r6]
	ldr r7, [r0, r2]
	ldr r3, [r5, r1]
	add r7, r7, r6
	str r3, [r7, #4]
	ldrb r3, [r0, #0xd]
	add r5, #0x10
	add r6, #8
	cmp r4, r3
	blt _0209512E
_0209514C:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_02095150: .word 0x00000888
_02095154: .word 0x000046B4
_02095158: .word 0x00000884
	thumb_func_end sub_0209511C

	thumb_func_start sub_0209515C
sub_0209515C: ; 0x0209515C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r7, #0x66
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #2
_02095168:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _02095172
	bl sub_02024758
_02095172:
	add r6, r6, #1
	add r4, #0x34
	cmp r6, #0x1e
	blt _02095168
	ldrb r0, [r5, #0xd]
	mov r6, #0
	cmp r0, #0
	ble _0209519A
	ldr r7, _02095220 ; =0x000007E8
	add r4, r5, #0
_02095186:
	ldr r0, [r4, r7]
	cmp r0, #0
	beq _02095190
	bl sub_02024758
_02095190:
	ldrb r0, [r5, #0xd]
	add r6, r6, #1
	add r4, #0x34
	cmp r6, r0
	blt _02095186
_0209519A:
	mov r6, #0
	cmp r0, #0
	ble _020951BC
	mov r7, #0x8d
	add r4, r6, #0
	lsl r7, r7, #4
_020951A6:
	ldr r0, [r5, r7]
	ldr r0, [r0, r4]
	cmp r0, #0
	beq _020951B2
	bl sub_02024758
_020951B2:
	ldrb r0, [r5, #0xd]
	add r6, r6, #1
	add r4, #0xc
	cmp r6, r0
	blt _020951A6
_020951BC:
	ldr r0, _02095224 ; =0x000008B4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _020951C8
	bl sub_02024758
_020951C8:
	ldr r0, _02095228 ; =0x000008BC
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _020951D4
	bl sub_02024758
_020951D4:
	ldr r0, _0209522C ; =0x000008B8
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _020951E0
	bl sub_02024758
_020951E0:
	ldr r0, _02095230 ; =0x000008C4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _020951EC
	bl sub_02024758
_020951EC:
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _020951FA
	bl sub_02024758
_020951FA:
	ldrb r1, [r5, #0xd]
	mov r0, #3
	mov r4, #0
	sub r0, r0, r1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #0
	ble _0209521E
	ldr r7, _02095234 ; =0x000008C8
_0209520C:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _02095216
	bl sub_02024758
_02095216:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _0209520C
_0209521E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02095220: .word 0x000007E8
_02095224: .word 0x000008B4
_02095228: .word 0x000008BC
_0209522C: .word 0x000008B8
_02095230: .word 0x000008C4
_02095234: .word 0x000008C8
	thumb_func_end sub_0209515C

	thumb_func_start sub_02095238
sub_02095238: ; 0x02095238
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldr r0, _02095348 ; =0x000046B8
	mov r5, #0
	ldr r0, [r4, r0]
	bl sub_02095DD8
	add r7, r0, #0
	ldr r0, _02095348 ; =0x000046B8
	ldr r0, [r4, r0]
	bl sub_02095DE8
	add r1, r5, #0
	add r6, r0, #0
	str r1, [sp, #0x14]
	cmp r7, #6
	bhi _0209532C
	add r1, r7, r7
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02095268: ; jump table
	.short _0209532C - _02095268 - 2 ; case 0
	.short _0209531E - _02095268 - 2 ; case 1
	.short _02095286 - _02095268 - 2 ; case 2
	.short _020952B4 - _02095268 - 2 ; case 3
	.short _020952C8 - _02095268 - 2 ; case 4
	.short _02095276 - _02095268 - 2 ; case 5
	.short _02095286 - _02095268 - 2 ; case 6
_02095276:
	mov r0, #5
	lsl r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #1
	lsl r0, r0, #0x10
	str r0, [sp, #0x10]
	mov r5, #1
	b _0209532C
_02095286:
	mov r1, #6
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x18
	mul r0, r1
	add r0, #0x14
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #6
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x18
	mul r0, r1
	add r0, #0x28
	lsl r0, r0, #0xc
	str r0, [sp, #0x10]
	mov r5, #1
	b _0209532C
_020952B4:
	mov r0, #0x35
	lsl r0, r0, #0xe
	str r0, [sp, #0xc]
	add r1, r6, #1
	mov r0, #0x28
	mul r0, r1
	lsl r0, r0, #0xc
	str r0, [sp, #0x10]
	mov r5, #1
	b _0209532C
_020952C8:
	mov r0, #0x35
	lsl r0, r0, #0xe
	add r1, r6, #1
	str r0, [sp, #0xc]
	mov r0, #0x28
	add r5, r1, #0
	mul r5, r0
	lsl r0, r5, #0xc
	ldr r2, _0209534C ; =0x000046BC
	str r0, [sp, #0x10]
	ldr r0, [r4, r2]
	cmp r0, #0
	beq _0209531A
	add r6, sp, #0xc
	ldmia r6!, {r0, r1}
	add r3, sp, #0
	add r7, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	str r0, [r3]
	mov r0, #1
	ldr r1, [sp, #4]
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [sp, #4]
	add r0, r2, #0
	sub r2, #0x38
	sub r0, #0x1c
	ldr r2, [r4, r2]
	mov r1, #0x34
	ldr r0, [r4, r0]
	mul r1, r2
	ldr r0, [r0, r1]
	add r1, r7, #0
	bl sub_020247D4
	ldr r0, _02095350 ; =0x00004694
	mov r1, #0xd4
	str r1, [r4, r0]
	add r0, r0, #4
	str r5, [r4, r0]
_0209531A:
	mov r5, #1
	b _0209532C
_0209531E:
	mov r0, #0xe
	lsl r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #0xb
	lsl r0, r0, #0x10
	str r0, [sp, #0x10]
	mov r5, #1
_0209532C:
	cmp r5, #0
	beq _02095342
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, sp, #0xc
	bl sub_020247D4
	add r0, r4, #0
	bl sub_020956B8
_02095342:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02095348: .word 0x000046B8
_0209534C: .word 0x000046BC
_02095350: .word 0x00004694
	thumb_func_end sub_02095238

	thumb_func_start sub_02095354
sub_02095354: ; 0x02095354
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r0, #0
	ldr r0, _020954B8 ; =0x000046B8
	mov r5, #0
	ldr r0, [r4, r0]
	bl sub_02095DD8
	add r6, r0, #0
	ldr r0, _020954B8 ; =0x000046B8
	ldr r0, [r4, r0]
	bl sub_02095DE8
	add r7, r0, #0
	cmp r6, #6
	bhi _0209539A
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02095380: ; jump table
	.short _020954B2 - _02095380 - 2 ; case 0
	.short _020954A2 - _02095380 - 2 ; case 1
	.short _0209538E - _02095380 - 2 ; case 2
	.short _02095442 - _02095380 - 2 ; case 3
	.short _020954AC - _02095380 - 2 ; case 4
	.short _020954B2 - _02095380 - 2 ; case 5
	.short _0209538E - _02095380 - 2 ; case 6
_0209538E:
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02094794
	cmp r0, #1
	beq _0209539C
_0209539A:
	b _020954B2
_0209539C:
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_020948C4
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	ble _0209543A
	ldr r2, _020954BC ; =0x000046A4
	add r1, r5, #0
	add r6, sp, #0x18
	add r0, r5, #0
_020953B4:
	str r0, [r6]
	str r0, [r6, #4]
	str r0, [r6, #8]
	ldr r3, [r4, r2]
	add r3, r3, r1
	ldr r3, [r3, #4]
	cmp r3, #0
	bne _02095430
	ldr r2, _020954C0 ; =0x00004694
	mov r0, #0xd4
	str r0, [r4, r2]
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	add r1, r0, #1
	mov r0, #0x28
	add r3, r1, #0
	mul r3, r0
	add r0, r2, #4
	str r3, [r4, r0]
	ldr r0, [r4, r2]
	add r3, sp, #0xc
	lsl r0, r0, #0xc
	str r0, [sp, #0x18]
	add r0, r2, #4
	ldr r0, [r4, r0]
	add r7, r3, #0
	lsl r0, r0, #0xc
	str r0, [sp, #0x1c]
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	str r0, [r3]
	mov r0, #1
	ldr r1, [sp, #0x10]
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [sp, #0x10]
	add r0, r2, #0
	sub r2, #0x10
	add r0, #0xc
	ldr r2, [r4, r2]
	mov r1, #0x34
	ldr r0, [r4, r0]
	mul r1, r2
	ldr r0, [r0, r1]
	add r1, r7, #0
	bl sub_020247D4
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, sp, #0x18
	bl sub_020247D4
	ldr r0, _020954B8 ; =0x000046B8
	lsl r2, r5, #0x18
	ldr r0, [r4, r0]
	mov r1, #4
	lsr r2, r2, #0x18
	bl sub_02095D40
	b _0209543A
_02095430:
	ldrb r3, [r4, #0xd]
	add r5, r5, #1
	add r1, #8
	cmp r5, r3
	blt _020953B4
_0209543A:
	ldr r0, _020954C4 ; =0x000046BC
	mov r5, #1
	str r5, [r4, r0]
	b _020954B2
_02095442:
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02094860
	cmp r0, #1
	bne _020954B2
	add r0, r4, #0
	mov r1, #2
	add r2, r7, #0
	bl sub_020948C4
	ldr r0, _020954C8 ; =0x000046A0
	ldr r2, [r4, r0]
	sub r0, #0x1c
	ldr r1, [r4, r0]
	mov r0, #0x34
	mul r0, r1
	ldr r0, [r2, r0]
	bl sub_020248AC
	add r5, r0, #0
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	mov r0, #1
	ldr r1, [sp, #4]
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [sp, #4]
	ldr r0, _020954C8 ; =0x000046A0
	ldr r3, [r4, r0]
	sub r0, #0x1c
	ldr r1, [r4, r0]
	mov r0, #0x34
	mul r0, r1
	ldr r0, [r3, r0]
	add r1, r2, #0
	bl sub_020247D4
	ldr r0, _020954C4 ; =0x000046BC
	mov r5, #1
	str r5, [r4, r0]
	mov r0, #4
	str r0, [r4, #0x14]
	b _020954B2
_020954A2:
	add r0, r4, #0
	bl sub_0209569C
	mov r5, #3
	b _020954B2
_020954AC:
	add r0, r4, #0
	bl sub_02094A70
_020954B2:
	add r0, r5, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020954B8: .word 0x000046B8
_020954BC: .word 0x000046A4
_020954C0: .word 0x00004694
_020954C4: .word 0x000046BC
_020954C8: .word 0x000046A0
	thumb_func_end sub_02095354

	thumb_func_start sub_020954CC
sub_020954CC: ; 0x020954CC
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _02095538 ; =0x000046B8
	mov r4, #0
	ldr r0, [r5, r0]
	bl sub_02095DD8
	cmp r0, #1
	beq _020954F4
	cmp r0, #4
	bne _020954FE
	ldr r0, _0209553C ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02094A90
	b _02095532
_020954F4:
	add r0, r5, #0
	bl sub_0209569C
	mov r4, #3
	b _02095532
_020954FE:
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _02095532
	ldr r0, _02095538 ; =0x000046B8
	mov r1, #1
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl sub_02095D40
	mov r0, #0xe
	lsl r0, r0, #0x10
	str r0, [sp]
	mov r0, #0xb
	lsl r0, r0, #0x10
	str r0, [sp, #4]
	add r0, r4, #0
	str r0, [sp, #8]
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, sp, #0
	bl sub_020247D4
	ldr r0, _0209553C ; =0x000005DC
	bl PlaySE
_02095532:
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_02095538: .word 0x000046B8
_0209553C: .word 0x000005DC
	thumb_func_end sub_020954CC

	thumb_func_start sub_02095540
sub_02095540: ; 0x02095540
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrb r0, [r5, #0xf]
	cmp r0, #0
	bne _02095550
	ldrb r0, [r5, #0x10]
	b _02095550
_02095550:
	sub r0, r0, #1
	strb r0, [r5, #0xf]
	ldr r0, _020955E0 ; =0x000008BC
	mov r1, #1
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	add r0, r5, #0
	bl sub_020943EC
	ldr r0, _020955E4 ; =0x000005DC
	bl PlaySE
	ldrb r0, [r5, #0xf]
	cmp r0, #0x12
	ldr r0, _020955E8 ; =0x000046B8
	bne _020955BE
	ldr r0, [r5, r0]
	bl sub_02095DD8
	cmp r0, #2
	bne _020955DC
	ldr r0, _020955E8 ; =0x000046B8
	ldr r0, [r5, r0]
	bl sub_02095DE8
	mov r1, #6
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	ldr r0, _020955E8 ; =0x000046B8
	mov r1, #6
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl sub_02095D40
	mov r0, #0x18
	mul r0, r4
	add r0, #0x14
	lsl r0, r0, #0xc
	str r0, [sp]
	mov r0, #0xa
	lsl r0, r0, #0xe
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
_020955BE:
	ldr r0, [r5, r0]
	bl sub_02095DD8
	cmp r0, #6
	bne _020955DC
	ldr r0, _020955E8 ; =0x000046B8
	ldr r0, [r5, r0]
	bl sub_02095DE8
	add r2, r0, #0
	ldr r0, _020955E8 ; =0x000046B8
	mov r1, #2
	ldr r0, [r5, r0]
	bl sub_02095D40
_020955DC:
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_020955E0: .word 0x000008BC
_020955E4: .word 0x000005DC
_020955E8: .word 0x000046B8
	thumb_func_end sub_02095540

	thumb_func_start sub_020955EC
sub_020955EC: ; 0x020955EC
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrb r0, [r5, #0xf]
	add r0, r0, #1
	strb r0, [r5, #0xf]
	ldrb r1, [r5, #0xf]
	ldrb r0, [r5, #0x10]
	cmp r1, r0
	bne _02095604
	mov r0, #0
	strb r0, [r5, #0xf]
_02095604:
	ldr r0, _02095690 ; =0x000008B8
	mov r1, #3
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	add r0, r5, #0
	bl sub_020943EC
	ldr r0, _02095694 ; =0x000005DC
	bl PlaySE
	ldrb r0, [r5, #0xf]
	cmp r0, #0x12
	ldr r0, _02095698 ; =0x000046B8
	bne _0209566E
	ldr r0, [r5, r0]
	bl sub_02095DD8
	cmp r0, #2
	bne _0209568C
	ldr r0, _02095698 ; =0x000046B8
	ldr r0, [r5, r0]
	bl sub_02095DE8
	mov r1, #6
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	ldr r0, _02095698 ; =0x000046B8
	mov r1, #6
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl sub_02095D40
	mov r0, #0x18
	mul r0, r4
	add r0, #0x14
	lsl r0, r0, #0xc
	str r0, [sp]
	mov r0, #0xa
	lsl r0, r0, #0xe
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x23
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
_0209566E:
	ldr r0, [r5, r0]
	bl sub_02095DD8
	cmp r0, #6
	bne _0209568C
	ldr r0, _02095698 ; =0x000046B8
	ldr r0, [r5, r0]
	bl sub_02095DE8
	add r2, r0, #0
	ldr r0, _02095698 ; =0x000046B8
	mov r1, #2
	ldr r0, [r5, r0]
	bl sub_02095D40
_0209568C:
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_02095690: .word 0x000008B8
_02095694: .word 0x000005DC
_02095698: .word 0x000046B8
	thumb_func_end sub_020955EC

	thumb_func_start sub_0209569C
sub_0209569C: ; 0x0209569C
	push {r3, lr}
	ldr r1, _020956B0 ; =0x000008B4
	ldr r0, [r0, r1]
	mov r1, #5
	bl Set2dSpriteAnimSeqNo
	ldr r0, _020956B4 ; =0x000005DC
	bl PlaySE
	pop {r3, pc}
	.balign 4, 0
_020956B0: .word 0x000008B4
_020956B4: .word 0x000005DC
	thumb_func_end sub_0209569C

	thumb_func_start sub_020956B8
sub_020956B8: ; 0x020956B8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, _02095768 ; =0x000046D8
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _02095764
	sub r0, #0x20
	mov r6, #0
	mvn r6, r6
	ldr r0, [r4, r0]
	add r5, r6, #0
	bl sub_02095DD8
	cmp r0, #6
	bhi _0209573E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020956E2: ; jump table
	.short _0209573E - _020956E2 - 2 ; case 0
	.short _0209573E - _020956E2 - 2 ; case 1
	.short _020956F0 - _020956E2 - 2 ; case 2
	.short _0209570C - _020956E2 - 2 ; case 3
	.short _02095730 - _020956E2 - 2 ; case 4
	.short _0209573E - _020956E2 - 2 ; case 5
	.short _020956F0 - _020956E2 - 2 ; case 6
_020956F0:
	ldr r0, _0209576C ; =0x000046B8
	ldrb r5, [r4, #0xf]
	ldr r0, [r4, r0]
	bl sub_02095DE8
	add r7, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl sub_020947C0
	cmp r0, #1
	bne _0209573E
	add r6, r7, #0
	b _0209573E
_0209570C:
	ldr r0, _0209576C ; =0x000046B8
	ldr r0, [r4, r0]
	bl sub_02095DE8
	add r7, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02094894
	cmp r0, #1
	bne _0209573E
	lsl r0, r7, #4
	add r1, r4, r0
	ldr r0, _02095770 ; =0x00000884
	ldr r5, [r1, r0]
	add r0, r0, #4
	ldr r6, [r1, r0]
	b _0209573E
_02095730:
	ldr r0, _02095774 ; =0x00004680
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0209573E
	add r0, r0, #4
	ldrb r5, [r4, #0xf]
	ldr r6, [r4, r0]
_0209573E:
	ldr r0, _02095778 ; =0x000046E4
	ldr r1, [r4, r0]
	cmp r1, r5
	bne _0209574E
	sub r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, r6
	beq _0209575C
_0209574E:
	ldr r3, _0209577C ; =0x000046DC
	add r0, r5, #0
	ldr r2, [r4, r3]
	sub r3, r3, #4
	ldr r3, [r4, r3]
	add r1, r6, #0
	blx r3
_0209575C:
	ldr r0, _02095778 ; =0x000046E4
	str r5, [r4, r0]
	sub r0, r0, #4
	str r6, [r4, r0]
_02095764:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02095768: .word 0x000046D8
_0209576C: .word 0x000046B8
_02095770: .word 0x00000884
_02095774: .word 0x00004680
_02095778: .word 0x000046E4
_0209577C: .word 0x000046DC
	thumb_func_end sub_020956B8

	thumb_func_start sub_02095780
sub_02095780: ; 0x02095780
	mov r1, #0x16
	add r2, r1, #0
	ldr r3, _0209578C ; =G2x_SetBlendBrightness_
	ldr r0, _02095790 ; =0x04000050
	sub r2, #0x1d
	bx r3
	.balign 4, 0
_0209578C: .word G2x_SetBlendBrightness_
_02095790: .word 0x04000050
	thumb_func_end sub_02095780

	thumb_func_start sub_02095794
sub_02095794: ; 0x02095794
	push {r3, lr}
	ldr r0, _020957AC ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	mov r2, #0xa
	str r2, [sp]
	mov r2, #4
	mov r3, #6
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	nop
_020957AC: .word 0x04000050
	thumb_func_end sub_02095794

	.rodata

_021083AC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02
	.byte 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021083C8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021083E4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02108400:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x02, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
