#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "unk_0207F42C.inc"
	.include "global.inc"

	.public gOverlayTemplate_Battle
	.public gNatureStatMods

	.text

	thumb_func_start sub_02080198
sub_02080198: ; 0x02080198
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, _02080464 ; =0x0000094C
	mov r1, #0x30
	add r4, r5, r0
	mov r0, #0xc
	bl AllocFromHeap
	add r7, r0, #0
	mov r0, #3
	lsl r0, r0, #8
	ldrb r1, [r4, r0]
	mov r0, #0x30
	add r3, r7, #0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02080468 ; =0x00000828
	mov r2, #6
	add r6, r1, r0
_020801C0:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020801C0
	mov r1, #3
	lsl r1, r1, #8
	ldrb r0, [r4, r1]
	add r1, r1, #1
	ldrb r1, [r4, r1]
	mov r2, #0x30
	add r3, r0, #0
	mul r3, r2
	mul r2, r1
	ldr r1, _02080468 ; =0x00000828
	add r0, r5, r3
	add r2, r5, r2
	add r6, r2, r1
	add r3, r0, r1
	mov r2, #6
_020801E6:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020801E6
	ldr r0, _0208046C ; =0x00000301
	add r6, r7, #0
	ldrb r1, [r4, r0]
	mov r0, #0x30
	mov r2, #6
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02080468 ; =0x00000828
	add r3, r1, r0
_02080200:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02080200
	mov r0, #0xc
	add r1, r7, #0
	bl FreeToHeapExplicit
	mov r1, #3
	lsl r1, r1, #8
	ldrb r3, [r4, r1]
	ldr r0, _02080470 ; =0x0000083E
	add r2, r5, r0
	mov r0, #0x30
	add r7, r3, #0
	mul r7, r0
	ldrsh r3, [r2, r7]
	str r3, [sp]
	add r3, r1, #1
	ldrb r3, [r4, r3]
	add r6, r3, #0
	mul r6, r0
	ldr r3, _02080470 ; =0x0000083E
	add r6, r5, r6
	ldrsh r3, [r6, r3]
	strh r3, [r2, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r6, r5, r3
	ldr r3, [sp]
	ldr r2, _02080470 ; =0x0000083E
	strh r3, [r6, r2]
	add r2, r2, #2
	add r3, r5, r2
	ldrb r2, [r4, r1]
	add r7, r2, #0
	mul r7, r0
	ldrsh r2, [r3, r7]
	str r2, [sp, #4]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r6, r2, #0
	mul r6, r0
	add r2, r5, r6
	ldr r6, _02080470 ; =0x0000083E
	add r6, r6, #2
	ldrsh r2, [r2, r6]
	strh r2, [r3, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r2, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	add r6, r3, #2
	ldr r3, [sp, #4]
	strh r3, [r2, r6]
	ldr r2, _02080470 ; =0x0000083E
	add r2, r2, #4
	add r3, r5, r2
	ldrb r2, [r4, r1]
	add r7, r2, #0
	mul r7, r0
	ldrsh r2, [r3, r7]
	str r2, [sp, #8]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r6, r2, #0
	mul r6, r0
	add r2, r5, r6
	ldr r6, _02080470 ; =0x0000083E
	add r6, r6, #4
	ldrsh r2, [r2, r6]
	strh r2, [r3, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r2, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	add r6, r3, #4
	ldr r3, [sp, #8]
	strh r3, [r2, r6]
	ldr r2, _02080470 ; =0x0000083E
	add r2, r2, #6
	add r3, r5, r2
	ldrb r2, [r4, r1]
	add r7, r2, #0
	mul r7, r0
	ldrsh r2, [r3, r7]
	str r2, [sp, #0xc]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r6, r2, #0
	mul r6, r0
	add r2, r5, r6
	ldr r6, _02080470 ; =0x0000083E
	add r6, r6, #6
	ldrsh r2, [r2, r6]
	strh r2, [r3, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r2, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	add r6, r3, #6
	ldr r3, [sp, #0xc]
	strh r3, [r2, r6]
	ldrb r3, [r4, r1]
	ldr r2, _02080470 ; =0x0000083E
	add r2, #8
	add r7, r3, #0
	add r2, r5, r2
	mul r7, r0
	ldrsh r3, [r2, r7]
	str r3, [sp, #0x10]
	add r3, r1, #1
	ldrb r3, [r4, r3]
	add r6, r3, #0
	ldr r3, _02080470 ; =0x0000083E
	mul r6, r0
	add r6, r5, r6
	add r3, #8
	ldrsh r3, [r6, r3]
	strh r3, [r2, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r6, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	ldr r2, [sp, #0x10]
	add r3, #8
	strh r2, [r6, r3]
	ldrb r3, [r4, r1]
	ldr r2, _02080470 ; =0x0000083E
	add r2, #0xa
	add r7, r3, #0
	add r2, r5, r2
	mul r7, r0
	ldrsh r3, [r2, r7]
	str r3, [sp, #0x14]
	add r3, r1, #1
	ldrb r3, [r4, r3]
	add r6, r3, #0
	ldr r3, _02080470 ; =0x0000083E
	mul r6, r0
	add r6, r5, r6
	add r3, #0xa
	ldrsh r3, [r6, r3]
	strh r3, [r2, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r6, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	ldr r2, [sp, #0x14]
	add r3, #0xa
	strh r2, [r6, r3]
	ldr r2, _02080470 ; =0x0000083E
	sub r2, r2, #2
	add r6, r5, r2
	ldrb r2, [r4, r1]
	add r3, r2, #0
	mul r3, r0
	add r3, r6, r3
	mov r2, #0
	ldrsb r7, [r3, r2]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r6, r2, #0
	mul r6, r0
	add r2, r5, r6
	ldr r6, _02080470 ; =0x0000083E
	sub r6, r6, #2
	ldrsb r2, [r2, r6]
	strb r2, [r3]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r2, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	sub r3, r3, #2
	strb r7, [r2, r3]
	ldr r2, _02080470 ; =0x0000083E
	sub r2, r2, #1
	add r6, r5, r2
	ldrb r2, [r4, r1]
	add r7, r2, #0
	mul r7, r0
	ldrsb r2, [r6, r7]
	mov ip, r2
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	ldr r2, _02080470 ; =0x0000083E
	mul r3, r0
	add r3, r5, r3
	sub r2, r2, #1
	ldrsb r2, [r3, r2]
	strb r2, [r6, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	mul r0, r2
	ldr r2, _02080470 ; =0x0000083E
	add r0, r5, r0
	sub r3, r2, #1
	mov r2, ip
	strb r2, [r0, r3]
	ldrb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0207D5DC
	ldr r1, _0208046C ; =0x00000301
	add r0, r5, #0
	ldrb r1, [r4, r1]
	bl sub_0207D5DC
	mov r1, #3
	lsl r1, r1, #8
	ldrb r1, [r4, r1]
	add r0, r5, #0
	bl PartyMenu_CommitPartyMonPanelWindowsToVram_NotInVBlank
	ldr r1, _0208046C ; =0x00000301
	add r0, r5, #0
	ldrb r1, [r4, r1]
	bl PartyMenu_CommitPartyMonPanelWindowsToVram_NotInVBlank
	add r0, r5, #0
	mov r1, #0
	bl sub_0208047C
	add r0, r5, #0
	mov r1, #1
	bl sub_0208047C
	mov r0, #3
	lsl r0, r0, #8
	ldrb r1, [r4, r0]
	mov r2, #0x30
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _02080474 ; =0x00000836
	ldrh r2, [r3, r2]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	ldr r0, _0208046C ; =0x00000301
	mov r2, #0x30
	ldrb r1, [r4, r0]
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _02080474 ; =0x00000836
	ldrh r2, [r3, r2]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	mov r0, #3
	lsl r0, r0, #8
	ldrb r1, [r4, r0]
	mov r2, #0x30
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _02080478 ; =0x00000834
	ldrh r2, [r3, r2]
	bl sub_0207F004
	ldr r0, _0208046C ; =0x00000301
	mov r2, #0x30
	ldrb r1, [r4, r0]
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _02080478 ; =0x00000834
	ldrh r2, [r3, r2]
	bl sub_0207F004
	mov r1, #3
	lsl r1, r1, #8
	ldrb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0207F0C8
	ldr r1, _0208046C ; =0x00000301
	add r0, r5, #0
	ldrb r1, [r4, r1]
	bl sub_0207F0C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02080464: .word 0x0000094C
_02080468: .word 0x00000828
_0208046C: .word 0x00000301
_02080470: .word 0x0000083E
_02080474: .word 0x00000836
_02080478: .word 0x00000834
	thumb_func_end sub_02080198

	thumb_func_start sub_0208047C
sub_0208047C: ; 0x0208047C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	ldr r1, _02080500 ; =0x0000094C
	add r6, r0, #0
	add r4, r6, r1
	mov r1, #0xc0
	mul r1, r7
	add r5, r4, r1
	bl sub_0207A16C
	add r3, r0, #0
	mov r0, #3
	add r1, r4, r7
	lsl r0, r0, #8
	ldrb r1, [r1, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r6, r0
	ldr r0, _02080504 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _020804D2
	mov r3, #0xf
	mov r1, #0
	lsl r3, r3, #0xc
	mov r4, #0x4b
_020804B0:
	lsl r0, r1, #1
	add r2, r5, r0
	add r2, #0x6c
	ldrh r2, [r2]
	add r0, r5, r0
	add r0, #0x6c
	and r2, r3
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	orr r2, r4
	strh r2, [r0]
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r1, #9
	blo _020804B0
	pop {r3, r4, r5, r6, r7, pc}
_020804D2:
	mov r6, #0xf
	ldr r0, _02080508 ; =0x00000FFF
	mov r4, #0
	lsl r6, r6, #0xc
_020804DA:
	lsl r2, r4, #1
	add r1, r5, r2
	add r1, #0x6c
	ldrh r1, [r1]
	ldrh r7, [r3, r2]
	and r1, r6
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	and r7, r0
	orr r7, r1
	add r1, r5, r2
	add r1, #0x6c
	strh r7, [r1]
	add r1, r4, #1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r4, #9
	blo _020804DA
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02080500: .word 0x0000094C
_02080504: .word 0x00000838
_02080508: .word 0x00000FFF
	thumb_func_end sub_0208047C

	thumb_func_start PartyMonContextMenuAction_Enter
PartyMonContextMenuAction_Enter: ; 0x0208050C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x85
	lsl r0, r0, #2
	add r6, r1, #0
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl sub_0207CB20
	bl PartyMenu_DisableMainScreenBlend_AfterYesNo
	add r0, r5, #0
	mov r1, #0
	bl sub_02079224
	ldr r0, _02080600 ; =0x00000654
	mov r4, #0
	ldr r0, [r5, r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	beq _0208059E
_02080542:
	add r2, r0, r4
	add r2, #0x30
	ldrb r2, [r2]
	cmp r2, #0
	bne _02080594
	ldr r1, _02080604 ; =0x00000C65
	add r0, r0, r4
	ldrb r2, [r5, r1]
	add r0, #0x30
	add r2, r2, #1
	strb r2, [r0]
	ldrb r1, [r5, r1]
	add r0, r5, #0
	bl sub_0207D8EC
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _02080608 ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl thunk_Sprite_SetPalIndex
	ldr r0, _02080600 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x36
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	sub r0, r0, #1
	cmp r4, r0
	bne _0208058E
	add r0, r5, #0
	mov r1, #6
	bl sub_0207AB84
_0208058E:
	mov r0, #1
	str r0, [r6]
	pop {r4, r5, r6, pc}
_02080594:
	add r2, r4, #1
	lsl r2, r2, #0x18
	lsr r4, r2, #0x18
	cmp r4, r1
	blo _02080542
_0208059E:
	cmp r1, #5
	bhi _020805F4
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020805AE: ; jump table
	.short _020805F4 - _020805AE - 2 ; case 0
	.short _020805BA - _020805AE - 2 ; case 1
	.short _020805C6 - _020805AE - 2 ; case 2
	.short _020805D2 - _020805AE - 2 ; case 3
	.short _020805DE - _020805AE - 2 ; case 4
	.short _020805EA - _020805AE - 2 ; case 5
_020805BA:
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #1
	bl sub_0207DAEC
	b _020805F4
_020805C6:
	add r0, r5, #0
	mov r1, #0x63
	mov r2, #1
	bl sub_0207DAEC
	b _020805F4
_020805D2:
	add r0, r5, #0
	mov r1, #0x71
	mov r2, #1
	bl sub_0207DAEC
	b _020805F4
_020805DE:
	add r0, r5, #0
	mov r1, #0x72
	mov r2, #1
	bl sub_0207DAEC
	b _020805F4
_020805EA:
	add r0, r5, #0
	mov r1, #0x73
	mov r2, #1
	bl sub_0207DAEC
_020805F4:
	ldr r0, _0208060C ; =0x00000C62
	mov r1, #0x17
	strb r1, [r5, r0]
	mov r0, #0x18
	str r0, [r6]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02080600: .word 0x00000654
_02080604: .word 0x00000C65
_02080608: .word 0x00000678
_0208060C: .word 0x00000C62
	thumb_func_end PartyMonContextMenuAction_Enter

	thumb_func_start sub_02080610
sub_02080610: ; 0x02080610
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _02080638 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl thunk_Sprite_SetPalIndex
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02080638: .word 0x00000678
	thumb_func_end sub_02080610

	thumb_func_start PartyMonContextMenuAction_NoEntry
PartyMonContextMenuAction_NoEntry: ; 0x0208063C
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	mov r1, #0
	add r5, r0, #0
	bl sub_02079224
	ldr r0, _02080718 ; =0x00000654
	mov r4, #0
	ldr r1, [r5, r0]
	add r0, r1, #0
	add r0, #0x36
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x1c
	beq _020806C2
	ldr r0, _0208071C ; =0x00000C65
	ldrb r0, [r5, r0]
	add r0, r0, #1
_02080660:
	add r3, r1, r4
	add r3, #0x30
	ldrb r3, [r3]
	cmp r0, r3
	bne _020806B8
	add r0, r1, r4
	mov r2, #0
	add r0, #0x30
	strb r2, [r0]
	ldr r0, _02080718 ; =0x00000654
	ldr r6, [r5, r0]
	add r0, r6, #0
	add r0, #0x36
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	sub r0, r0, #1
	cmp r4, r0
	bge _020806C2
	ldr r0, _02080718 ; =0x00000654
	add r1, r0, #0
_0208068A:
	add r3, r6, r4
	add r3, #0x31
	ldrb r3, [r3]
	add r6, r6, r4
	add r6, #0x30
	strb r3, [r6]
	ldr r3, [r5, r0]
	add r3, r3, r4
	add r3, #0x31
	strb r2, [r3]
	add r3, r4, #1
	lsl r3, r3, #0x18
	ldr r6, [r5, r1]
	lsr r4, r3, #0x18
	add r3, r6, #0
	add r3, #0x36
	ldrb r3, [r3]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x1c
	sub r3, r3, #1
	cmp r4, r3
	blt _0208068A
	b _020806C2
_020806B8:
	add r3, r4, #1
	lsl r3, r3, #0x18
	lsr r4, r3, #0x18
	cmp r4, r2
	blo _02080660
_020806C2:
	ldr r6, _02080720 ; =0x00000855
	mov r4, #0
	mov r7, #0x30
_020806C8:
	add r0, r4, #0
	mul r0, r7
	add r0, r5, r0
	ldrb r0, [r0, r6]
	cmp r0, #0
	beq _020806DC
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D8EC
_020806DC:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _020806C8
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl sub_0207CB20
	bl PartyMenu_DisableMainScreenBlend_AfterYesNo
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _02080724 ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl thunk_Sprite_SetPalIndex
	ldr r0, [sp]
	mov r1, #1
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02080718: .word 0x00000654
_0208071C: .word 0x00000C65
_02080720: .word 0x00000855
_02080724: .word 0x00000678
	thumb_func_end PartyMonContextMenuAction_NoEntry

	thumb_func_start PartyMonContextMenuAction_ContestEnter
PartyMonContextMenuAction_ContestEnter: ; 0x02080728
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _02080744 ; =0x00000654
	mov r2, #0
	ldr r1, [r0, r1]
	add r1, #0x27
	strb r2, [r1]
	bl sub_0207CB20
	bl PartyMenu_DisableMainScreenBlend_AfterYesNo
	mov r0, #0x20
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_02080744: .word 0x00000654
	thumb_func_end PartyMonContextMenuAction_ContestEnter

	thumb_func_start PartyMonContextMenuAction_Confirm
PartyMonContextMenuAction_Confirm: ; 0x02080748
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _02080764 ; =0x00000654
	mov r2, #0
	ldr r1, [r0, r1]
	add r1, #0x27
	strb r2, [r1]
	bl sub_0207CB20
	bl PartyMenu_DisableMainScreenBlend_AfterYesNo
	mov r0, #0x20
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_02080764: .word 0x00000654
	thumb_func_end PartyMonContextMenuAction_Confirm

	thumb_func_start PartyMonContextMenuAction_Summary
PartyMonContextMenuAction_Summary: ; 0x02080768
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _02080784 ; =0x00000654
	mov r2, #1
	ldr r1, [r0, r1]
	add r1, #0x27
	strb r2, [r1]
	bl sub_0207CB20
	bl PartyMenu_DisableMainScreenBlend_AfterYesNo
	mov r0, #0x20
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_02080784: .word 0x00000654
	thumb_func_end PartyMonContextMenuAction_Summary

	thumb_func_start PartyMonContextMenuAction_Set
PartyMonContextMenuAction_Set: ; 0x02080788
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0207CB20
	bl PartyMenu_DisableMainScreenBlend_AfterYesNo
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl sub_020807AC
	str r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end PartyMonContextMenuAction_Set

	thumb_func_start sub_020807AC
sub_020807AC: ; 0x020807AC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02080828 ; =0x00000654
	ldr r1, _0208082C ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl Party_GetMonByIndex
	mov r1, #0xa2
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _020807F2
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x76
	bl ReadMsgDataIntoString
	ldr r0, _0208082C ; =0x00000C65
	ldrb r0, [r4, r0]
	add r0, #0x16
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _02080808
_020807F2:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x77
	bl ReadMsgDataIntoString
	ldr r0, _0208082C ; =0x00000C65
	mov r1, #7
	strb r1, [r4, r0]
_02080808:
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02080828 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _02080830 ; =0x00000C62
	mov r1, #0x19
	strb r1, [r4, r0]
	mov r0, #0x18
	pop {r4, pc}
	.balign 4, 0
_02080828: .word 0x00000654
_0208082C: .word 0x00000C65
_02080830: .word 0x00000C62
	thumb_func_end sub_020807AC

	thumb_func_start sub_02080834
sub_02080834: ; 0x02080834
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r4, r0, #0
	ldr r1, _020808C8 ; =0x00000654
	mov r0, #1
	ldr r1, [r4, r1]
	add r1, #0x27
	ldrb r1, [r1]
	sub r1, #0xb
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl PartyMenu_GetFieldMoveFunc
	add r1, r0, #0
	beq _0208085C
	ldr r0, _020808C8 ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x18]
	blx r1
	b _0208085E
_0208085C:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
_0208085E:
	cmp r0, #5
	bhi _0208089C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208086E: ; jump table
	.short _0208087A - _0208086E - 2 ; case 0
	.short _0208088A - _0208086E - 2 ; case 1
	.short _0208088E - _0208086E - 2 ; case 2
	.short _02080892 - _0208086E - 2 ; case 3
	.short _02080896 - _0208086E - 2 ; case 4
	.short _0208089A - _0208086E - 2 ; case 5
_0208087A:
	add r0, r4, #0
	bl sub_0207CB20
	bl PartyMenu_DisableMainScreenBlend_AfterYesNo
	mov r0, #0x20
	str r0, [r6]
	pop {r4, r5, r6, pc}
_0208088A:
	mov r5, #msg_0300_00101
	b _0208089C
_0208088E:
	mov r5, #msg_0300_00077
	b _0208089C
_02080892:
	mov r5, #msg_0300_00180
	b _0208089C
_02080896:
	mov r5, #msg_0300_00100
	b _0208089C
_0208089A:
	mov r5, #msg_0300_00181
_0208089C:
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl sub_0207CB20
	bl PartyMenu_DisableMainScreenBlend_AfterYesNo
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _020808CC ; =0x00000C62
	mov r1, #3
	strb r1, [r4, r0]
	mov r0, #0x18
	str r0, [r6]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020808C8: .word 0x00000654
_020808CC: .word 0x00000C62
	thumb_func_end sub_02080834

	thumb_func_start PartyMonContextMenuAction_Cut
PartyMonContextMenuAction_Cut: ; 0x020808D0
	ldr r2, _020808E0 ; =0x00000654
	mov r3, #0xb
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020808E4 ; =sub_02080834
	bx r3
	nop
_020808E0: .word 0x00000654
_020808E4: .word sub_02080834
	thumb_func_end PartyMonContextMenuAction_Cut

	thumb_func_start PartyMonContextMenuAction_RockSmash
PartyMonContextMenuAction_RockSmash: ; 0x020808E8
	ldr r2, _020808F8 ; =0x00000654
	mov r3, #0xf
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020808FC ; =sub_02080834
	bx r3
	nop
_020808F8: .word 0x00000654
_020808FC: .word sub_02080834
	thumb_func_end PartyMonContextMenuAction_RockSmash

	thumb_func_start PartyMonContextMenuAction_Strength
PartyMonContextMenuAction_Strength: ; 0x02080900
	ldr r2, _02080910 ; =0x00000654
	mov r3, #0xe
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _02080914 ; =sub_02080834
	bx r3
	nop
_02080910: .word 0x00000654
_02080914: .word sub_02080834
	thumb_func_end PartyMonContextMenuAction_Strength

	thumb_func_start PartyMonContextMenuAction_Surf
PartyMonContextMenuAction_Surf: ; 0x02080918
	ldr r2, _02080928 ; =0x00000654
	mov r3, #0xd
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _0208092C ; =sub_02080834
	bx r3
	nop
_02080928: .word 0x00000654
_0208092C: .word sub_02080834
	thumb_func_end PartyMonContextMenuAction_Surf

	thumb_func_start PartyMonContextMenuAction_RockClimb
PartyMonContextMenuAction_RockClimb: ; 0x02080930
	ldr r2, _02080940 ; =0x00000654
	mov r3, #0x11
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _02080944 ; =sub_02080834
	bx r3
	nop
_02080940: .word 0x00000654
_02080944: .word sub_02080834
	thumb_func_end PartyMonContextMenuAction_RockClimb

	thumb_func_start PartyMonContextMenuAction_Fly
PartyMonContextMenuAction_Fly: ; 0x02080948
	ldr r2, _02080958 ; =0x00000654
	mov r3, #0xc
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _0208095C ; =sub_02080834
	bx r3
	nop
_02080958: .word 0x00000654
_0208095C: .word sub_02080834
	thumb_func_end PartyMonContextMenuAction_Fly

	thumb_func_start PartyMonContextMenuAction_Waterfall
PartyMonContextMenuAction_Waterfall: ; 0x02080960
	ldr r2, _02080970 ; =0x00000654
	mov r3, #0x10
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _02080974 ; =sub_02080834
	bx r3
	nop
_02080970: .word 0x00000654
_02080974: .word sub_02080834
	thumb_func_end PartyMonContextMenuAction_Waterfall

	thumb_func_start PartyMonContextMenuAction_Whirlpool
PartyMonContextMenuAction_Whirlpool: ; 0x02080978
	ldr r2, _02080988 ; =0x00000654
	mov r3, #0x17
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _0208098C ; =sub_02080834
	bx r3
	nop
_02080988: .word 0x00000654
_0208098C: .word sub_02080834
	thumb_func_end PartyMonContextMenuAction_Whirlpool

	thumb_func_start PartyMonContextMenuAction_Flash
PartyMonContextMenuAction_Flash: ; 0x02080990
	ldr r2, _020809A0 ; =0x00000654
	mov r3, #0x12
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020809A4 ; =sub_02080834
	bx r3
	nop
_020809A0: .word 0x00000654
_020809A4: .word sub_02080834
	thumb_func_end PartyMonContextMenuAction_Flash

	thumb_func_start PartyMonContextMenuAction_Teleport
PartyMonContextMenuAction_Teleport: ; 0x020809A8
	ldr r2, _020809B8 ; =0x00000654
	mov r3, #0x13
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020809BC ; =sub_02080834
	bx r3
	nop
_020809B8: .word 0x00000654
_020809BC: .word sub_02080834
	thumb_func_end PartyMonContextMenuAction_Teleport

	thumb_func_start PartyMonContextMenuAction_Dig
PartyMonContextMenuAction_Dig: ; 0x020809C0
	ldr r2, _020809D0 ; =0x00000654
	mov r3, #0x14
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020809D4 ; =sub_02080834
	bx r3
	nop
_020809D0: .word 0x00000654
_020809D4: .word sub_02080834
	thumb_func_end PartyMonContextMenuAction_Dig

	thumb_func_start PartyMonContextMenuAction_SweetScent
PartyMonContextMenuAction_SweetScent: ; 0x020809D8
	ldr r2, _020809E8 ; =0x00000654
	mov r3, #0x15
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020809EC ; =sub_02080834
	bx r3
	nop
_020809E8: .word 0x00000654
_020809EC: .word sub_02080834
	thumb_func_end PartyMonContextMenuAction_SweetScent

	thumb_func_start PartyMonContextMenuAction_Chatter
PartyMonContextMenuAction_Chatter: ; 0x020809F0
	ldr r2, _02080A00 ; =0x00000654
	mov r3, #0x16
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _02080A04 ; =sub_02080834
	bx r3
	nop
_02080A00: .word 0x00000654
_02080A04: .word sub_02080834
	thumb_func_end PartyMonContextMenuAction_Chatter

	thumb_func_start PartyMonContextMenuAction_MilkDrink
PartyMonContextMenuAction_MilkDrink: ; 0x02080A08
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl sub_02080A58
	str r0, [r5]
	cmp r0, #0x1e
	bne _02080A1E
	ldr r0, _02080A20 ; =0x00000C6E
	mov r1, #0xe
	strh r1, [r4, r0]
_02080A1E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02080A20: .word 0x00000C6E
	thumb_func_end PartyMonContextMenuAction_MilkDrink

	thumb_func_start PartyMonContextMenuAction_Softboiled
PartyMonContextMenuAction_Softboiled: ; 0x02080A24
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl sub_02080A58
	str r0, [r5]
	cmp r0, #0x1e
	bne _02080A3A
	ldr r0, _02080A3C ; =0x00000C6E
	mov r1, #0xf
	strh r1, [r4, r0]
_02080A3A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02080A3C: .word 0x00000C6E
	thumb_func_end PartyMonContextMenuAction_Softboiled

	thumb_func_start PartyMonContextMenuAction_Headbutt
PartyMonContextMenuAction_Headbutt: ; 0x02080A40
	ldr r2, _02080A50 ; =0x00000654
	mov r3, #0x18
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _02080A54 ; =sub_02080834
	bx r3
	nop
_02080A50: .word 0x00000654
_02080A54: .word sub_02080834
	thumb_func_end PartyMonContextMenuAction_Headbutt

	thumb_func_start sub_02080A58
sub_02080A58: ; 0x02080A58
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl sub_0207CB20
	bl PartyMenu_DisableMainScreenBlend_AfterYesNo
	ldr r0, _02080B50 ; =0x00000C65
	ldrb r1, [r4, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r4, r0
	mov r0, #0x83
	lsl r0, r0, #4
	ldrh r0, [r1, r0]
	mov r1, #5
	bl _s32_div_f
	ldr r1, _02080B54 ; =0x00000C68
	strh r0, [r4, r1]
	sub r0, r1, #3
	ldrb r2, [r4, r0]
	mov r0, #0x30
	mul r0, r2
	add r2, r4, r0
	ldr r0, _02080B58 ; =0x0000082E
	ldrh r2, [r2, r0]
	ldrh r0, [r4, r1]
	cmp r2, r0
	bhi _02080AB8
	add r0, r4, #0
	mov r1, #0x7f
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02080B5C ; =0x00000C62
	mov r1, #3
	strb r1, [r4, r0]
	add sp, #4
	mov r0, #0x18
	pop {r3, r4, pc}
_02080AB8:
	sub r0, r1, #5
	ldrb r2, [r4, r0]
	mov r0, #0x40
	orr r2, r0
	sub r0, r1, #5
	strb r2, [r4, r0]
	ldrb r0, [r4, r0]
	mov r2, #0x3f
	bic r0, r2
	sub r2, r1, #3
	ldrb r3, [r4, r2]
	mov r2, #0x3f
	and r2, r3
	orr r2, r0
	sub r0, r1, #5
	strb r2, [r4, r0]
	ldr r0, _02080B60 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl thunk_Sprite_SetPalIndex
	ldr r0, _02080B60 ; =0x00000678
	add r1, sp, #0
	ldr r0, [r4, r0]
	add r1, #2
	add r2, sp, #0
	bl Sprite_GetPositionXY
	ldr r0, _02080B64 ; =0x0000067C
	add r3, sp, #0
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, r0]
	bl Sprite_SetPositionXY
	ldr r0, _02080B68 ; =0x00000654
	ldr r1, _02080B6C ; =0x00000C63
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	add r0, #0x25
	ldrb r0, [r0]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207B5EC
	add r1, r0, #0
	ldr r0, _02080B64 ; =0x0000067C
	add r1, r1, #2
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02080B64 ; =0x0000067C
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	ldr r1, _02080B6C ; =0x00000C63
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207A7F4
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _02080B70 ; =0x00000C6A
	mov r1, #0
	strh r1, [r4, r0]
	mov r0, #0x1e
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02080B50: .word 0x00000C65
_02080B54: .word 0x00000C68
_02080B58: .word 0x0000082E
_02080B5C: .word 0x00000C62
_02080B60: .word 0x00000678
_02080B64: .word 0x0000067C
_02080B68: .word 0x00000654
_02080B6C: .word 0x00000C63
_02080B70: .word 0x00000C6A
	thumb_func_end sub_02080A58

	thumb_func_start sub_02080B74
sub_02080B74: ; 0x02080B74
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	ldr r0, _02080BAC ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl thunk_Sprite_SetPalIndex
	ldr r0, _02080BB0 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	mov r0, #1
	pop {r4, pc}
	nop
_02080BAC: .word 0x00000678
_02080BB0: .word 0x04000050
	thumb_func_end sub_02080B74
