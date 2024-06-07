#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "unk_02078E30.inc"
	.include "global.inc"

	.public gOverlayTemplate_Battle
	.public gNatureStatMods

	.extern PartyMenuApp_Init
	.extern PartyMenuApp_Main
	.extern PartyMenuApp_Exit
	.extern sub_02079720
	.extern sub_02079E28
	.extern sub_0207A174
	.extern sub_0207A8FC
	.extern sub_0207A910
	.extern sub_0207A988
	.extern sub_0207AC70
	.extern sub_0207AD6C
	.extern sub_0207B51C

	.text

	thumb_func_start sub_0207B7E0
sub_0207B7E0: ; 0x0207B7E0
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r1, _0207BA64 ; =0x00000654
	add r4, r0, #0
	ldr r3, [r4, r1]
	mov r0, #0
	add r1, r3, #0
	add r1, #0x36
	ldrb r1, [r1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	beq _0207B88A
_0207B7F8:
	add r2, r3, r0
	add r2, #0x30
	ldrb r2, [r2]
	cmp r2, #0
	bne _0207B880
	add r3, #0x36
	ldrb r0, [r3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	cmp r0, #6
	bhi _0207B864
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207B81A: ; jump table
	.short _0207B864 - _0207B81A - 2 ; case 0
	.short _0207B864 - _0207B81A - 2 ; case 1
	.short _0207B828 - _0207B81A - 2 ; case 2
	.short _0207B834 - _0207B81A - 2 ; case 3
	.short _0207B840 - _0207B81A - 2 ; case 4
	.short _0207B84C - _0207B81A - 2 ; case 5
	.short _0207B858 - _0207B81A - 2 ; case 6
_0207B828:
	add r0, r4, #0
	mov r1, #0x67
	mov r2, #1
	bl sub_0207DAEC
	b _0207B86E
_0207B834:
	add r0, r4, #0
	mov r1, #0x6c
	mov r2, #1
	bl sub_0207DAEC
	b _0207B86E
_0207B840:
	add r0, r4, #0
	mov r1, #0x6d
	mov r2, #1
	bl sub_0207DAEC
	b _0207B86E
_0207B84C:
	add r0, r4, #0
	mov r1, #0x6e
	mov r2, #1
	bl sub_0207DAEC
	b _0207B86E
_0207B858:
	add r0, r4, #0
	mov r1, #0x6f
	mov r2, #1
	bl sub_0207DAEC
	b _0207B86E
_0207B864:
	add r0, r4, #0
	mov r1, #0x1e
	mov r2, #1
	bl sub_0207DAEC
_0207B86E:
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B880:
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, r1
	blo _0207B7F8
_0207B88A:
	ldr r0, [r3, #0x14]
	cmp r0, #0
	beq _0207B98E
	ldr r2, _0207BA70 ; =0x00000C74
	ldr r1, [r3]
	ldr r2, [r4, r2]
	add r3, #0x30
	bl sub_02074A6C
	cmp r0, #8
	bhi _0207B98E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207B8AC: ; jump table
	.short _0207B98E - _0207B8AC - 2 ; case 0
	.short _0207B8BE - _0207B8AC - 2 ; case 1
	.short _0207B91E - _0207B8AC - 2 ; case 2
	.short _0207B93A - _0207B8AC - 2 ; case 3
	.short _0207B98E - _0207B8AC - 2 ; case 4
	.short _0207B98E - _0207B8AC - 2 ; case 5
	.short _0207B956 - _0207B8AC - 2 ; case 6
	.short _0207B98E - _0207B8AC - 2 ; case 7
	.short _0207B972 - _0207B8AC - 2 ; case 8
_0207B8BE:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0xa7
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _0207BA64 ; =0x00000654
	mov r1, #3
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x14]
	bl sub_020290FC
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0207BA74 ; =0x000007C4
	mov r3, #3
	ldr r0, [r4, r0]
	bl BufferIntegerAsString
	ldr r1, _0207BA74 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_Delete
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B91E:
	add r0, r4, #0
	mov r1, #0xa5
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B93A:
	add r0, r4, #0
	mov r1, #0xa6
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B956:
	add r0, r4, #0
	mov r1, #0xa8
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B972:
	add r0, r4, #0
	mov r1, #0xbf
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B98E:
	ldr r0, _0207BA64 ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x11
	bne _0207B9E6
	add r0, r4, #0
	bl sub_0207BA78
	cmp r0, #0
	beq _0207B9E6
	cmp r0, #1
	beq _0207B9AE
	cmp r0, #2
	beq _0207B9CA
	b _0207B9E6
_0207B9AE:
	add r0, r4, #0
	mov r1, #0xa5
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B9CA:
	add r0, r4, #0
	mov r1, #0xa6
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207B9E6:
	ldr r0, _0207BA64 ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x16
	bne _0207BA1C
	add r0, r4, #0
	bl sub_0207BB14
	cmp r0, #0
	beq _0207BA1C
	cmp r0, #1
	bne _0207BA1C
	add r0, r4, #0
	mov r1, #0xbb
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207BA1C:
	ldr r0, _0207BA64 ; =0x00000654
	ldr r0, [r4, r0]
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0x17
	bne _0207BA52
	add r0, r4, #0
	bl sub_0207BB88
	cmp r0, #0
	beq _0207BA52
	cmp r0, #1
	bne _0207BA52
	add r0, r4, #0
	mov r1, #0xa5
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BA68 ; =0x00000C62
	mov r1, #0x17
	strb r1, [r4, r0]
	ldr r0, _0207BA6C ; =0x000005F2
	bl PlaySE
	add sp, #8
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_0207BA52:
	ldr r0, _0207BA64 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0207BA64: .word 0x00000654
_0207BA68: .word 0x00000C62
_0207BA6C: .word 0x000005F2
_0207BA70: .word 0x00000C74
_0207BA74: .word 0x000007C4
	thumb_func_end sub_0207B7E0

	thumb_func_start sub_0207BA78
sub_0207BA78: ; 0x0207BA78
	push {r4, r5, r6, r7}
	add r5, r0, #0
	mov r0, #0
	mov ip, r0
	ldr r0, _0207BB08 ; =0x00000654
	ldr r4, [r5, r0]
_0207BA84:
	mov r0, ip
	add r0, r4, r0
	add r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _0207BB02
	mov r0, ip
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	cmp r3, #6
	bhs _0207BAF4
	mov r0, ip
	add r7, r4, r0
_0207BAA0:
	add r0, r4, r3
	add r0, #0x30
	ldrb r0, [r0]
	cmp r0, #0
	beq _0207BAF4
	add r0, r4, r3
	add r0, #0x30
	ldrb r1, [r0]
	mov r0, #0x30
	ldr r6, _0207BB0C ; =0x000007FC
	mul r0, r1
	add r2, r5, r0
	add r0, r7, #0
	add r0, #0x30
	ldrb r1, [r0]
	mov r0, #0x30
	ldrh r6, [r2, r6]
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0207BB0C ; =0x000007FC
	ldrh r0, [r1, r0]
	cmp r0, r6
	bne _0207BAD4
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_0207BAD4:
	ldr r0, _0207BB10 ; =0x00000804
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _0207BAEA
	ldr r1, _0207BB10 ; =0x00000804
	ldrh r1, [r2, r1]
	cmp r0, r1
	bne _0207BAEA
	mov r0, #2
	pop {r4, r5, r6, r7}
	bx lr
_0207BAEA:
	add r0, r3, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	cmp r3, #6
	blo _0207BAA0
_0207BAF4:
	mov r0, ip
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov ip, r0
	cmp r0, #5
	blo _0207BA84
_0207BB02:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0207BB08: .word 0x00000654
_0207BB0C: .word 0x000007FC
_0207BB10: .word 0x00000804
	thumb_func_end sub_0207BA78

	thumb_func_start sub_0207BB14
sub_0207BB14: ; 0x0207BB14
	push {r4, r5, r6, r7}
	ldr r1, _0207BB80 ; =0x00000654
	mov r3, #0
	ldr r5, [r0, r1]
_0207BB1C:
	add r1, r5, r3
	add r1, #0x30
	ldrb r1, [r1]
	cmp r1, #0
	beq _0207BB7A
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #6
	bhs _0207BB70
	add r2, r5, r3
_0207BB32:
	add r1, r5, r4
	add r1, #0x30
	ldrb r1, [r1]
	cmp r1, #0
	beq _0207BB70
	add r1, r2, #0
	add r1, #0x30
	ldrb r6, [r1]
	mov r1, #0x30
	mul r1, r6
	add r6, r0, r1
	ldr r1, _0207BB84 ; =0x000007FC
	ldrh r1, [r6, r1]
	add r6, r5, r4
	add r6, #0x30
	ldrb r7, [r6]
	mov r6, #0x30
	mul r6, r7
	add r7, r0, r6
	ldr r6, _0207BB84 ; =0x000007FC
	ldrh r6, [r7, r6]
	cmp r1, r6
	beq _0207BB66
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_0207BB66:
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #6
	blo _0207BB32
_0207BB70:
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #5
	blo _0207BB1C
_0207BB7A:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0207BB80: .word 0x00000654
_0207BB84: .word 0x000007FC
	thumb_func_end sub_0207BB14

	thumb_func_start sub_0207BB88
sub_0207BB88: ; 0x0207BB88
	push {r4, r5, r6, r7}
	ldr r1, _0207BBF4 ; =0x00000654
	mov r3, #0
	ldr r5, [r0, r1]
_0207BB90:
	add r1, r5, r3
	add r1, #0x30
	ldrb r1, [r1]
	cmp r1, #0
	beq _0207BBEE
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #6
	bhs _0207BBE4
	add r2, r5, r3
_0207BBA6:
	add r1, r5, r4
	add r1, #0x30
	ldrb r1, [r1]
	cmp r1, #0
	beq _0207BBE4
	add r1, r2, #0
	add r1, #0x30
	ldrb r6, [r1]
	mov r1, #0x30
	mul r1, r6
	add r6, r0, r1
	ldr r1, _0207BBF8 ; =0x000007FC
	ldrh r1, [r6, r1]
	add r6, r5, r4
	add r6, #0x30
	ldrb r7, [r6]
	mov r6, #0x30
	mul r6, r7
	add r7, r0, r6
	ldr r6, _0207BBF8 ; =0x000007FC
	ldrh r6, [r7, r6]
	cmp r1, r6
	bne _0207BBDA
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_0207BBDA:
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #6
	blo _0207BBA6
_0207BBE4:
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #5
	blo _0207BB90
_0207BBEE:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0207BBF4: .word 0x00000654
_0207BBF8: .word 0x000007FC
	thumb_func_end sub_0207BB88

	thumb_func_start sub_0207BBFC
sub_0207BBFC: ; 0x0207BBFC
	lsl r3, r0, #1
	ldr r0, _0207BC14 ; =_021012B0
	ldrb r0, [r0, r3]
	lsl r0, r0, #3
	add r0, #0x14
	strh r0, [r1]
	ldr r0, _0207BC18 ; =_021012B0 + 1
	ldrb r0, [r0, r3]
	lsl r0, r0, #3
	add r0, #0x14
	strh r0, [r2]
	bx lr
	.balign 4, 0
_0207BC14: .word _021012B0
_0207BC18: .word _021012B0 + 1
	thumb_func_end sub_0207BBFC

	thumb_func_start sub_0207BC1C
sub_0207BC1C: ; 0x0207BC1C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _0207BCB4 ; =0x00000824
	add r5, r0, #0
	ldr r1, [r5, r1]
	bl sub_0207E778
	add r2, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r2, r0
	beq _0207BC3C
	add r0, r0, #1
	cmp r2, r0
	beq _0207BCB0
	b _0207BCAA
_0207BC3C:
	add r0, r5, #0
	mov r1, #0
	bl sub_02079224
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	ldr r0, _0207BCB8 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x24
	ldrb r1, [r0]
	cmp r1, #2
	beq _0207BC76
	cmp r1, #0x11
	beq _0207BC76
	add r0, r1, #0
	add r0, #0xea
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _0207BC82
_0207BC76:
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	b _0207BC9C
_0207BC82:
	cmp r1, #0x15
	bne _0207BC92
	add r0, r5, #0
	mov r1, #0xb8
	mov r2, #1
	bl sub_0207DAC4
	b _0207BC9C
_0207BC92:
	add r0, r5, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
_0207BC9C:
	ldr r0, _0207BCBC ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl thunk_Sprite_SetPalIndex
	mov r0, #1
	pop {r3, r4, r5, pc}
_0207BCAA:
	add r0, r5, #0
	add r1, r4, #0
	blx r2
_0207BCB0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0207BCB4: .word 0x00000824
_0207BCB8: .word 0x00000654
_0207BCBC: .word 0x00000678
	thumb_func_end sub_0207BC1C

	thumb_func_start sub_0207BCC0
sub_0207BCC0: ; 0x0207BCC0
	ldr r2, _0207BCE4 ; =_021013C4
	mov r3, #0
_0207BCC4:
	lsl r1, r3, #1
	ldrh r1, [r2, r1]
	cmp r0, r1
	bne _0207BCD4
	add r3, #0x10
	lsl r0, r3, #0x18
	lsr r0, r0, #0x18
	bx lr
_0207BCD4:
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #0x10
	blo _0207BCC4
	mov r0, #0xff
	bx lr
	nop
_0207BCE4: .word _021013C4
	thumb_func_end sub_0207BCC0

	thumb_func_start sub_0207BCE8
sub_0207BCE8: ; 0x0207BCE8
	push {r4, lr}
	add r4, r0, #0
	bl sub_0207BFD8
	cmp r0, #0
	beq _0207BCFE
	cmp r0, #1
	beq _0207BD40
	cmp r0, #2
	beq _0207BD50
	b _0207BD5A
_0207BCFE:
	ldr r0, _0207BD60 ; =0x000005EC
	bl PlaySE
	ldr r0, _0207BD64 ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl thunk_Sprite_SetPalIndex
	ldr r0, _0207BD68 ; =0x00000C65
	mov r1, #0x30
	ldrb r2, [r4, r0]
	mul r1, r2
	add r3, r4, r1
	mov r1, #0x83
	lsl r1, r1, #4
	ldrh r2, [r3, r1]
	sub r1, r1, #2
	ldrh r1, [r3, r1]
	sub r2, r2, r1
	add r1, r0, #3
	ldrh r1, [r4, r1]
	cmp r2, r1
	bge _0207BD30
	add r0, r0, #3
	strh r2, [r4, r0]
_0207BD30:
	ldr r0, _0207BD6C ; =0x00000C6A
	mov r1, #2
	strh r1, [r4, r0]
	mov r1, #0
	add r0, r0, #2
	strh r1, [r4, r0]
	mov r0, #0x1e
	pop {r4, pc}
_0207BD40:
	ldr r0, _0207BD70 ; =0x000005DC
	bl PlaySE
	ldr r0, _0207BD6C ; =0x00000C6A
	mov r1, #1
	strh r1, [r4, r0]
	mov r0, #0x18
	pop {r4, pc}
_0207BD50:
	ldr r0, _0207BD74 ; =0x000005F2
	bl PlaySE
	mov r0, #0x1e
	pop {r4, pc}
_0207BD5A:
	mov r0, #0x1e
	pop {r4, pc}
	nop
_0207BD60: .word 0x000005EC
_0207BD64: .word 0x00000678
_0207BD68: .word 0x00000C65
_0207BD6C: .word 0x00000C6A
_0207BD70: .word 0x000005DC
_0207BD74: .word 0x000005F2
	thumb_func_end sub_0207BCE8

	thumb_func_start sub_0207BD78
sub_0207BD78: ; 0x0207BD78
	push {r4, r5, r6, lr}
	sub sp, #8
	mov r1, #0xc9
	add r4, r0, #0
	lsl r1, r1, #4
	add r5, r4, r1
	ldr r2, [r5, #0xc]
	cmp r2, #1
	bne _0207BDBA
	bl sub_0207CC24
	cmp r0, #0
	bne _0207BDB4
	ldr r0, _0207BFB0 ; =0x00000C65
	ldrb r0, [r4, r0]
	cmp r0, #7
	beq _0207BDAE
	ldr r0, _0207BFB4 ; =0x00000684
	mov r1, #0
	ldr r0, [r4, r0]
	bl Sprite_SetAnimCtrlCurrentFrame
	ldr r0, _0207BFB4 ; =0x00000684
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
_0207BDAE:
	add sp, #8
	ldr r0, [r5, #8]
	pop {r4, r5, r6, pc}
_0207BDB4:
	add sp, #8
	mov r0, #0x1e
	pop {r4, r5, r6, pc}
_0207BDBA:
	add r2, r1, #0
	sub r2, #0x26
	ldrh r2, [r4, r2]
	cmp r2, #4
	bhi _0207BE14
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0207BDD0: ; jump table
	.short _0207BDDA - _0207BDD0 - 2 ; case 0
	.short _0207BEB2 - _0207BDD0 - 2 ; case 1
	.short _0207BEDA - _0207BDD0 - 2 ; case 2
	.short _0207BF02 - _0207BDD0 - 2 ; case 3
	.short _0207BF88 - _0207BDD0 - 2 ; case 4
_0207BDDA:
	bl sub_0207AD6C
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	beq _0207BE54
	cmp r5, #6
	bhi _0207BE14
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207BDF8: ; jump table
	.short _0207BE06 - _0207BDF8 - 2 ; case 0
	.short _0207BE06 - _0207BDF8 - 2 ; case 1
	.short _0207BE06 - _0207BDF8 - 2 ; case 2
	.short _0207BE06 - _0207BDF8 - 2 ; case 3
	.short _0207BE06 - _0207BDF8 - 2 ; case 4
	.short _0207BE06 - _0207BDF8 - 2 ; case 5
	.short _0207BE34 - _0207BDF8 - 2 ; case 6
_0207BE06:
	ldr r0, _0207BFB8 ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl Party_GetCount
	cmp r5, r0
	blo _0207BE16
_0207BE14:
	b _0207BFAA
_0207BE16:
	ldr r0, _0207BFBC ; =0x00000948
	lsl r3, r5, #3
	ldr r6, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r6, r3]
	add r3, r6, r3
	ldrb r3, [r3, #1]
	add r1, r5, #0
	bl sub_0207A910
	add r0, r4, #0
	bl sub_0207BCE8
	add sp, #8
	pop {r4, r5, r6, pc}
_0207BE34:
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	add r0, r4, #0
	mov r1, #9
	mov r2, #1
	mov r3, #0
	bl sub_0207CBD0
	add sp, #8
	mov r0, #0x1e
	pop {r4, r5, r6, pc}
_0207BE54:
	ldr r0, _0207BFC0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207BE90
	ldr r0, _0207BFB0 ; =0x00000C65
	ldrb r0, [r4, r0]
	cmp r0, #6
	blo _0207BE86
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	add r0, r4, #0
	mov r1, #9
	mov r2, #1
	mov r3, #0
	bl sub_0207CBD0
	add sp, #8
	mov r0, #0x1e
	pop {r4, r5, r6, pc}
_0207BE86:
	add r0, r4, #0
	bl sub_0207BCE8
	add sp, #8
	pop {r4, r5, r6, pc}
_0207BE90:
	mov r0, #2
	tst r0, r1
	beq _0207BEAA
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	bl sub_0207FBC8
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0207BEAA:
	add r0, r4, #0
	bl sub_0207A8FC
	b _0207BFAA
_0207BEB2:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	ldr r0, _0207BFC4 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl thunk_Sprite_SetPalIndex
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _0207BFC8 ; =0x00000C6A
	mov r1, #0
	strh r1, [r4, r0]
	b _0207BFAA
_0207BEDA:
	sub r1, #0x2d
	ldrb r1, [r4, r1]
	mov r2, #0
	mvn r2, r2
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207C048
	cmp r0, #1
	bne _0207BFAA
	ldr r0, _0207BFCC ; =0x000005EC
	bl PlaySE
	ldr r0, _0207BFC8 ; =0x00000C6A
	mov r1, #3
	strh r1, [r4, r0]
	mov r1, #0
	add r0, r0, #2
	strh r1, [r4, r0]
	b _0207BFAA
_0207BF02:
	sub r1, #0x2b
	ldrb r1, [r4, r1]
	mov r2, #1
	bl sub_0207C048
	cmp r0, #1
	bne _0207BFAA
	ldr r0, _0207BFB8 ; =0x00000654
	ldr r1, _0207BFB0 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl Party_GetMonByIndex
	add r6, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x41
	bl NewString_ReadMsgData
	add r5, r0, #0
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207BFD0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r2, _0207BFD4 ; =0x00000C6C
	str r1, [sp, #4]
	ldr r0, _0207BFD0 ; =0x000007C4
	ldrh r2, [r4, r2]
	ldr r0, [r4, r0]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r1, _0207BFD0 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_Delete
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207BFC8 ; =0x00000C6A
	mov r1, #4
	strh r1, [r4, r0]
	mov r1, #0x1e
	sub r0, #8
	strb r1, [r4, r0]
	add sp, #8
	mov r0, #0x18
	pop {r4, r5, r6, pc}
_0207BF88:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	ldr r0, _0207BFC4 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl thunk_Sprite_SetPalIndex
	add r0, r4, #0
	bl sub_0207FBC8
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0207BFAA:
	mov r0, #0x1e
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207BFB0: .word 0x00000C65
_0207BFB4: .word 0x00000684
_0207BFB8: .word 0x00000654
_0207BFBC: .word 0x00000948
_0207BFC0: .word gSystem
_0207BFC4: .word 0x00000678
_0207BFC8: .word 0x00000C6A
_0207BFCC: .word 0x000005EC
_0207BFD0: .word 0x000007C4
_0207BFD4: .word 0x00000C6C
	thumb_func_end sub_0207BD78

	thumb_func_start sub_0207BFD8
sub_0207BFD8: ; 0x0207BFD8
	push {r3, r4, r5, lr}
	ldr r2, _0207C038 ; =0x00000C65
	add r4, r0, #0
	ldrb r1, [r4, r2]
	mov r0, #0x30
	ldr r3, _0207C03C ; =0x00000838
	mul r0, r1
	add r0, r4, r0
	ldrb r5, [r0, r3]
	cmp r5, #0
	beq _0207BFF2
	mov r0, #2
	pop {r3, r4, r5, pc}
_0207BFF2:
	sub r2, r2, #2
	ldrb r2, [r4, r2]
	lsl r2, r2, #0x1a
	lsr r2, r2, #0x1a
	cmp r1, r2
	beq _0207C010
	add r1, r3, #0
	sub r1, #0xa
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _0207C010
	sub r3, #8
	ldrh r0, [r0, r3]
	cmp r1, r0
	bne _0207C032
_0207C010:
	ldr r0, _0207C040 ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl thunk_Sprite_SetPalIndex
	add r0, r4, #0
	mov r1, #0x78
	mov r2, #1
	bl sub_0207DAEC
	ldr r1, _0207C044 ; =0x00000C6A
	mov r0, #1
	strh r0, [r4, r1]
	mov r2, #0x1e
	sub r1, #8
	strb r2, [r4, r1]
	pop {r3, r4, r5, pc}
_0207C032:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0207C038: .word 0x00000C65
_0207C03C: .word 0x00000838
_0207C040: .word 0x00000678
_0207C044: .word 0x00000C6A
	thumb_func_end sub_0207BFD8

	thumb_func_start sub_0207C048
sub_0207C048: ; 0x0207C048
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r3, #0x30
	add r4, r6, #0
	mul r4, r3
	ldr r3, _0207C0CC ; =0x0000082E
	add r5, r0, #0
	add r7, r5, r3
	lsl r2, r2, #0x10
	ldrh r3, [r7, r4]
	lsr r2, r2, #0x10
	add r2, r3, r2
	ldr r3, _0207C0D0 ; =0x00000C6C
	strh r2, [r7, r4]
	ldrh r2, [r5, r3]
	add r2, r2, #1
	strh r2, [r5, r3]
	bl sub_0207D480
	lsl r1, r6, #2
	add r1, r6, r1
	add r1, r1, #3
	add r0, r5, #4
	lsl r1, r1, #4
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D440
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0207D4EC
	ldr r1, _0207C0D4 ; =0x00000C68
	ldrh r0, [r5, r1]
	add r1, r1, #4
	ldrh r1, [r5, r1]
	cmp r0, r1
	beq _0207C0AA
	mov r1, #0x83
	add r2, r5, r4
	lsl r1, r1, #4
	ldrh r0, [r7, r4]
	ldrh r1, [r2, r1]
	cmp r0, r1
	bne _0207C0C6
_0207C0AA:
	ldr r0, _0207C0D8 ; =0x00000654
	add r1, r6, #0
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl Party_GetMonByIndex
	ldrh r1, [r7, r4]
	add r2, sp, #0
	str r1, [sp]
	mov r1, #MON_DATA_HP
	bl SetMonData
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0207C0C6:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207C0CC: .word 0x0000082E
_0207C0D0: .word 0x00000C6C
_0207C0D4: .word 0x00000C68
_0207C0D8: .word 0x00000654
	thumb_func_end sub_0207C048

	thumb_func_start sub_0207C0DC
sub_0207C0DC: ; 0x0207C0DC
	push {r4, r5, r6, lr}
	mov r1, #0xc9
	add r4, r0, #0
	lsl r1, r1, #4
	add r5, r4, r1
	ldr r1, [r5, #0xc]
	cmp r1, #1
	bne _0207C100
	bl sub_0207CC24
	cmp r0, #0
	bne _0207C0FC
	ldr r0, [r5, #8]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
_0207C0FC:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C100:
	bl sub_0207AD6C
	add r5, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r5, r0
	beq _0207C1AE
	cmp r5, #6
	bhi _0207C204
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0207C11E: ; jump table
	.short _0207C12C - _0207C11E - 2 ; case 0
	.short _0207C12C - _0207C11E - 2 ; case 1
	.short _0207C12C - _0207C11E - 2 ; case 2
	.short _0207C12C - _0207C11E - 2 ; case 3
	.short _0207C12C - _0207C11E - 2 ; case 4
	.short _0207C12C - _0207C11E - 2 ; case 5
	.short _0207C176 - _0207C11E - 2 ; case 6
_0207C12C:
	ldr r0, _0207C268 ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0]
	bl Party_GetCount
	cmp r5, r0
	bhs _0207C204
	ldr r0, _0207C26C ; =0x00000948
	lsl r3, r5, #3
	ldr r6, [r4, r0]
	add r0, r4, #0
	ldrb r2, [r6, r3]
	add r3, r6, r3
	ldrb r3, [r3, #1]
	add r1, r5, #0
	bl sub_0207A910
	ldr r0, _0207C270 ; =0x00000C65
	strb r5, [r4, r0]
	ldrb r1, [r4, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0207C274 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0207C16C
	ldr r0, _0207C278 ; =0x000005DC
	bl PlaySE
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207C16C:
	ldr r0, _0207C27C ; =0x000005F2
	bl PlaySE
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C176:
	ldr r0, _0207C280 ; =0x00000C63
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0207C204
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _0207C26C ; =0x00000948
	mov r1, #7
	ldr r3, [r4, r0]
	add r0, r4, #0
	add r2, r3, #0
	add r2, #0x38
	add r3, #0x39
	ldrb r2, [r2]
	ldrb r3, [r3]
	bl sub_0207A910
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #1
	bl sub_0207CBD0
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C1AE:
	ldr r0, _0207C284 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0207C204
	ldr r0, _0207C270 ; =0x00000C65
	ldrb r1, [r4, r0]
	cmp r1, #7
	bne _0207C1E2
	sub r0, r0, #2
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0207C200
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #0
	bl sub_0207CBD0
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C1E2:
	mov r0, #0x30
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0207C274 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0207C1FA
	ldr r0, _0207C278 ; =0x000005DC
	bl PlaySE
	mov r0, #0
	pop {r4, r5, r6, pc}
_0207C1FA:
	ldr r0, _0207C27C ; =0x000005F2
	bl PlaySE
_0207C200:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C204:
	ldr r0, _0207C284 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _0207C260
	ldr r0, _0207C280 ; =0x00000C63
	ldrb r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _0207C25C
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, _0207C270 ; =0x00000C65
	ldrb r0, [r4, r0]
	cmp r0, #7
	bne _0207C236
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #0
	bl sub_0207CBD0
	b _0207C258
_0207C236:
	ldr r0, _0207C26C ; =0x00000948
	mov r1, #7
	ldr r3, [r4, r0]
	add r0, r4, #0
	add r2, r3, #0
	add r2, #0x38
	add r3, #0x39
	ldrb r2, [r2]
	ldrb r3, [r3]
	bl sub_0207A910
	add r0, r4, #0
	mov r1, #9
	mov r2, #3
	mov r3, #1
	bl sub_0207CBD0
_0207C258:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C25C:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0207C260:
	add r0, r4, #0
	bl sub_0207A8FC
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207C268: .word 0x00000654
_0207C26C: .word 0x00000948
_0207C270: .word 0x00000C65
_0207C274: .word 0x00000838
_0207C278: .word 0x000005DC
_0207C27C: .word 0x000005F2
_0207C280: .word 0x00000C63
_0207C284: .word gSystem
	thumb_func_end sub_0207C0DC

	thumb_func_start sub_0207C288
sub_0207C288: ; 0x0207C288
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0207C3C0 ; =0x00000654
	mov r1, #0
	ldr r0, [r5, r0]
	mov r2, #0xc
	ldrh r0, [r0, #0x28]
	bl LoadItemDataOrGfx
	add r4, r0, #0
	ldr r0, _0207C3C0 ; =0x00000654
	ldr r2, [r5, r0]
	ldr r0, _0207C3C4 ; =0x000001D2
	ldrh r1, [r2, #0x28]
	cmp r1, r0
	bne _0207C2D2
	ldr r1, _0207C3C8 ; =0x00000C65
	ldr r0, [r2]
	ldrb r1, [r5, r1]
	bl Party_GetMonByIndex
	bl Mon_CanUseGracidea
	cmp r0, #1
	bne _0207C2D2
	ldr r0, _0207C3C0 ; =0x00000654
	mov r1, #1
	ldr r0, [r5, r0]
	strh r1, [r0, #0x3c]
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl sub_0207CB54
	mov r0, #0x1f
	pop {r3, r4, r5, pc}
_0207C2D2:
	add r0, r4, #0
	mov r1, #0x22
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _0207C2EA
	add r0, r4, #0
	mov r1, #0x23
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0207C2FC
_0207C2EA:
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	mov r1, #0
	bl sub_02082654
	mov r0, #6
	pop {r3, r4, r5, pc}
_0207C2FC:
	add r0, r4, #0
	mov r1, #0x24
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0207C326
	add r0, r4, #0
	mov r1, #0x25
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _0207C326
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	mov r1, #1
	bl sub_02082654
	mov r0, #6
	pop {r3, r4, r5, pc}
_0207C326:
	ldr r0, _0207C3C0 ; =0x00000654
	ldr r2, _0207C3C8 ; =0x00000C65
	ldr r1, [r5, r0]
	mov r0, #0xc
	str r0, [sp]
	ldr r0, [r1]
	ldrh r1, [r1, #0x28]
	ldrb r2, [r5, r2]
	mov r3, #0
	bl CanUseItemOnMonInParty
	cmp r0, #1
	bne _0207C3A0
	ldr r0, _0207C3C0 ; =0x00000654
	mov r2, #1
	ldr r1, [r5, r0]
	mov r3, #0xc
	ldr r0, [r1, #4]
	ldrh r1, [r1, #0x28]
	bl Bag_TakeItem
	add r0, r4, #0
	mov r1, #0x1a
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0207C398
	ldr r0, _0207C3C0 ; =0x00000654
	ldr r1, _0207C3C8 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl Party_GetMonByIndex
	add r1, r0, #0
	ldr r0, _0207C3C0 ; =0x00000654
	mov r2, #3
	ldr r3, [r5, r0]
	add r0, r3, #0
	add r0, #0x40
	str r0, [sp]
	ldrh r3, [r3, #0x28]
	mov r0, #0
	bl GetMonEvolution
	ldr r1, _0207C3C0 ; =0x00000654
	ldr r2, [r5, r1]
	strh r0, [r2, #0x3c]
	ldr r0, [r5, r1]
	mov r2, #8
	add r0, #0x27
	strb r2, [r0]
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x20
	pop {r3, r4, r5, pc}
_0207C398:
	add r0, r5, #0
	bl sub_020812E8
	b _0207C3B6
_0207C3A0:
	add r0, r5, #0
	mov r1, #0x66
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207C3C8 ; =0x00000C65
	mov r1, #7
	strb r1, [r5, r0]
	ldr r1, _0207C3CC ; =sub_02081378
	sub r0, #0x11
	str r1, [r5, r0]
_0207C3B6:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #5
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0207C3C0: .word 0x00000654
_0207C3C4: .word 0x000001D2
_0207C3C8: .word 0x00000C65
_0207C3CC: .word sub_02081378
	thumb_func_end sub_0207C288

	thumb_func_start sub_0207C3D0
sub_0207C3D0: ; 0x0207C3D0
	push {r3, lr}
	ldr r1, _0207C3F8 ; =0x00000C65
	ldrb r2, [r0, r1]
	mov r1, #0x30
	mul r1, r2
	add r1, r0, r1
	ldr r0, _0207C3FC ; =0x00000834
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _0207C3E8
	mov r0, #0
	pop {r3, pc}
_0207C3E8:
	bl ItemIdIsMail
	cmp r0, #1
	bne _0207C3F4
	mov r0, #2
	pop {r3, pc}
_0207C3F4:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0207C3F8: .word 0x00000C65
_0207C3FC: .word 0x00000834
	thumb_func_end sub_0207C3D0

	thumb_func_start sub_0207C400
sub_0207C400: ; 0x0207C400
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0207C5C4 ; =0x00000654
	ldr r1, _0207C5C8 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	mov r4, #0
	ldr r0, [r0]
	mvn r4, r4
	bl Party_GetMonByIndex
	ldr r1, _0207C5C4 ; =0x00000654
	add r7, r0, #0
	ldr r1, [r5, r1]
	ldr r6, [r1, #0x1c]
	ldrh r1, [r1, #0x28]
	cmp r1, #0x70
	bne _0207C4B6
	mov r1, #5
	mov r2, #0
	bl GetMonData
	ldr r1, _0207C5CC ; =0x000001E7
	cmp r0, r1
	beq _0207C478
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0xbd
	bl ReadMsgDataIntoString
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207C5D0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207C5C4 ; =0x00000654
	ldr r0, _0207C5D0 ; =0x000007C4
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	ldrh r2, [r2, #0x28]
	mov r1, #1
	bl BufferItemNameWithIndefArticle
	ldr r2, _0207C5D0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r4, #0xb
	b _0207C4B6
_0207C478:
	cmp r6, #0
	beq _0207C4B6
	ldr r0, [r6, #0x20]
	ldr r0, [r0]
	cmp r0, #2
	bne _0207C4B6
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0xbe
	bl ReadMsgDataIntoString
	ldr r2, _0207C5C4 ; =0x00000654
	ldr r0, _0207C5D0 ; =0x000007C4
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	ldrh r2, [r2, #0x28]
	mov r1, #0
	bl BufferItemName
	ldr r2, _0207C5D0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r4, #0xb
_0207C4B6:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0207C59E
	add r0, r5, #0
	bl sub_0207C3D0
	cmp r0, #0
	beq _0207C4D2
	cmp r0, #1
	beq _0207C53E
	cmp r0, #2
	beq _0207C58C
	b _0207C59E
_0207C4D2:
	ldr r0, _0207C5C4 ; =0x00000654
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x28]
	bl ItemIdIsMail
	cmp r0, #1
	bne _0207C4EE
	ldr r0, _0207C5C4 ; =0x00000654
	mov r1, #6
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0207C4EE:
	add r0, r5, #0
	add r1, r7, #0
	add r2, sp, #0
	bl sub_0207C5D4
	mov r2, #0x1f
	lsl r2, r2, #6
	add r4, r0, #0
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x6b
	bl ReadMsgDataIntoString
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207C5D0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207C5C4 ; =0x00000654
	ldr r0, _0207C5D0 ; =0x000007C4
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	ldrh r2, [r2, #0x28]
	mov r1, #1
	bl BufferItemName
	ldr r2, _0207C5D0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	b _0207C59E
_0207C53E:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x4f
	bl ReadMsgDataIntoString
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207C5D0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207C5C8 ; =0x00000C65
	ldr r3, _0207C5D0 ; =0x000007C4
	ldrb r4, [r5, r2]
	mov r2, #0x30
	ldr r0, [r5, r3]
	mul r2, r4
	add r2, r5, r2
	add r3, #0x70
	ldrh r2, [r2, r3]
	mov r1, #1
	bl BufferItemNameWithIndefArticle
	ldr r2, _0207C5D0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	mov r4, #9
	b _0207C59E
_0207C58C:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x4e
	bl ReadMsgDataIntoString
	mov r4, #0xb
_0207C59E:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	mov r2, #0x2a
	mov r3, #0xf
	bl DrawFrameAndWindow2
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl sub_0207DB30
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207C5C4: .word 0x00000654
_0207C5C8: .word 0x00000C65
_0207C5CC: .word 0x000001E7
_0207C5D0: .word 0x000007C4
	thumb_func_end sub_0207C400

	thumb_func_start sub_0207C5D4
sub_0207C5D4: ; 0x0207C5D4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, _0207C64C ; =0x00000654
	add r6, r1, #0
	ldr r1, [r5, r0]
	add r4, r2, #0
	ldrh r1, [r1, #0x28]
	mov r2, #1
	mov r3, #0xc
	str r1, [sp]
	ldr r1, [r5, r0]
	ldr r0, [r1, #4]
	ldrh r1, [r1, #0x28]
	bl Bag_TakeItem
	add r0, r6, #0
	mov r1, #MON_DATA_HELD_ITEM
	add r2, sp, #0
	bl SetMonData
	add r0, r6, #0
	bl Pokemon_UpdateArceusForm
	add r0, r6, #0
	bl Mon_UpdateGiratinaForm
	str r0, [r4]
	ldr r1, _0207C650 ; =0x00000C65
	ldr r0, _0207C64C ; =0x00000654
	ldrb r3, [r5, r1]
	ldr r0, [r5, r0]
	mov r2, #0x30
	add r6, r3, #0
	mul r6, r2
	ldrh r0, [r0, #0x28]
	ldr r3, _0207C654 ; =0x00000834
	add r6, r5, r6
	strh r0, [r6, r3]
	ldrb r1, [r5, r1]
	add r0, r5, #0
	mul r2, r1
	add r2, r5, r2
	ldrh r2, [r2, r3]
	bl sub_0207F004
	ldr r0, [sp]
	cmp r0, #0x70
	bne _0207C646
	mov r0, #0
	ldr r1, [r4]
	mvn r0, r0
	cmp r1, r0
	beq _0207C646
	add sp, #4
	mov r0, #0xc
	pop {r3, r4, r5, r6, pc}
_0207C646:
	mov r0, #0xb
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0207C64C: .word 0x00000654
_0207C650: .word 0x00000C65
_0207C654: .word 0x00000834
	thumb_func_end sub_0207C5D4

	thumb_func_start sub_0207C658
sub_0207C658: ; 0x0207C658
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0207C6B0 ; =0x00000654
	add r5, r1, #0
	ldr r0, [r4, r0]
	lsl r1, r2, #0x10
	ldr r0, [r0, #4]
	lsr r1, r1, #0x10
	mov r2, #1
	mov r3, #0xc
	bl Bag_AddItem
	add r0, r5, #0
	mov r1, #MON_DATA_HELD_ITEM
	add r2, sp, #0x1c
	bl SetMonData
	add r0, r5, #0
	bl Pokemon_UpdateArceusForm
	add r0, r5, #0
	bl Mon_UpdateGiratinaForm
	ldr r1, _0207C6B4 ; =0x00000C65
	mov r2, #0x30
	ldrb r3, [r4, r1]
	ldr r0, [sp, #0x1c]
	add r5, r3, #0
	mul r5, r2
	ldr r3, _0207C6B8 ; =0x00000834
	add r5, r4, r5
	strh r0, [r5, r3]
	ldrb r1, [r4, r1]
	add r0, r4, #0
	mul r2, r1
	add r2, r4, r2
	ldrh r2, [r2, r3]
	bl sub_0207F004
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_0207C6B0: .word 0x00000654
_0207C6B4: .word 0x00000C65
_0207C6B8: .word 0x00000834
	thumb_func_end sub_0207C658

	thumb_func_start sub_0207C6BC
sub_0207C6BC: ; 0x0207C6BC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207C6D8 ; =0x00000C64
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0207C6D4
	add r0, r4, #0
	bl sub_0207C8B4
	pop {r4, pc}
_0207C6D4:
	mov r0, #0xb
	pop {r4, pc}
	.balign 4, 0
_0207C6D8: .word 0x00000C64
	thumb_func_end sub_0207C6BC

	thumb_func_start sub_0207C6DC
sub_0207C6DC: ; 0x0207C6DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207C708 ; =0x00000C64
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0207C702
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl sub_0207CB54
	mov r0, #0xd
	pop {r4, pc}
_0207C702:
	mov r0, #0xc
	pop {r4, pc}
	nop
_0207C708: .word 0x00000C64
	thumb_func_end sub_0207C6DC

	thumb_func_start sub_0207C70C
sub_0207C70C: ; 0x0207C70C
	push {r4, lr}
	add r4, r0, #0
	bl PartyMenu_AnimateIconFormChange
	cmp r0, #1
	bne _0207C722
	add r0, r4, #0
	bl sub_0207CB6C
	mov r0, #0xb
	pop {r4, pc}
_0207C722:
	mov r0, #0xd
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0207C70C

	thumb_func_start sub_0207C728
sub_0207C728: ; 0x0207C728
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207C748 ; =0x00000C64
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0207C742
	add r0, r4, #0
	bl sub_0207DBCC
	mov r0, #0xa
	pop {r4, pc}
_0207C742:
	mov r0, #9
	pop {r4, pc}
	nop
_0207C748: .word 0x00000C64
	thumb_func_end sub_0207C728

	thumb_func_start sub_0207C74C
sub_0207C74C: ; 0x0207C74C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0207C8A0 ; =0x00000C88
	ldr r0, [r5, r0]
	bl YesNoPrompt_HandleInput
	cmp r0, #1
	beq _0207C766
	cmp r0, #2
	bne _0207C764
	b _0207C882
_0207C764:
	b _0207C898
_0207C766:
	ldr r0, _0207C8A0 ; =0x00000C88
	ldr r0, [r5, r0]
	bl YesNoPrompt_Destroy
	bl sub_0207CB90
	ldr r0, _0207C8A4 ; =0x00000654
	ldr r1, _0207C8A8 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl Party_GetMonByIndex
	str r0, [sp]
	ldr r0, _0207C8A4 ; =0x00000654
	add r2, sp, #4
	ldr r0, [r5, r0]
	ldrh r6, [r0, #0x28]
	ldr r0, _0207C8A8 ; =0x00000C65
	ldrb r1, [r5, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0207C8AC ; =0x00000834
	ldrh r4, [r1, r0]
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_0207C5D4
	add r7, r0, #0
	ldr r0, _0207C8A4 ; =0x00000654
	add r1, r4, #0
	ldr r0, [r5, r0]
	mov r2, #1
	ldr r0, [r0, #4]
	mov r3, #0xc
	bl Bag_AddItem
	cmp r0, #0
	bne _0207C7D6
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0207C658
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x54
	bl ReadMsgDataIntoString
	mov r7, #0xb
	b _0207C86A
_0207C7D6:
	ldr r0, _0207C8A4 ; =0x00000654
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x28]
	bl ItemIdIsMail
	cmp r0, #1
	bne _0207C812
	ldr r0, _0207C8A4 ; =0x00000654
	lsl r1, r4, #0x10
	ldr r0, [r5, r0]
	lsr r1, r1, #0x10
	ldr r0, [r0, #4]
	mov r2, #1
	mov r3, #0xc
	bl Bag_TakeItem
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0207C658
	ldr r0, _0207C8A4 ; =0x00000654
	mov r1, #6
	ldr r0, [r5, r0]
	add sp, #8
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0207C812:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x55
	bl ReadMsgDataIntoString
	ldr r0, _0207C8B0 ; =0x000007C4
	mov r1, #1
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl BufferItemName
	ldr r0, _0207C8B0 ; =0x000007C4
	mov r1, #2
	ldr r0, [r5, r0]
	add r2, r6, #0
	bl BufferItemName
	ldr r2, _0207C8B0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	cmp r6, #0x70
	beq _0207C860
	cmp r4, #0x70
	bne _0207C860
	mov r0, #0
	ldr r1, [sp, #4]
	mvn r0, r0
	cmp r1, r0
	beq _0207C860
	mov r7, #0xc
	b _0207C86A
_0207C860:
	cmp r6, #0x70
	bne _0207C86A
	cmp r4, #0x70
	bne _0207C86A
	mov r7, #0xb
_0207C86A:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl sub_0207DB30
	add sp, #8
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0207C882:
	ldr r0, _0207C8A0 ; =0x00000C88
	ldr r0, [r5, r0]
	bl YesNoPrompt_Destroy
	bl sub_0207CB90
	add r0, r5, #0
	bl sub_0207C8B4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0207C898:
	mov r0, #0xa
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207C8A0: .word 0x00000C88
_0207C8A4: .word 0x00000654
_0207C8A8: .word 0x00000C65
_0207C8AC: .word 0x00000834
_0207C8B0: .word 0x000007C4
	thumb_func_end sub_0207C74C

	thumb_func_start sub_0207C8B4
sub_0207C8B4: ; 0x0207C8B4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207C900 ; =0x00000654
	ldr r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0207C8F4
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _0207C904 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl thunk_Sprite_SetPalIndex
	ldr r0, _0207C900 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x24
	strb r1, [r0]
	mov r0, #1
	pop {r4, pc}
_0207C8F4:
	mov r0, #0xa
	add r1, #0x27
	strb r0, [r1]
	mov r0, #0x20
	pop {r4, pc}
	nop
_0207C900: .word 0x00000654
_0207C904: .word 0x00000678
	thumb_func_end sub_0207C8B4

	thumb_func_start sub_0207C908
sub_0207C908: ; 0x0207C908
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0207CA20 ; =0x00000654
	ldr r1, _0207CA24 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl Party_GetMonByIndex
	add r7, r0, #0
	ldr r0, _0207CA20 ; =0x00000654
	add r2, sp, #4
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x28]
	str r0, [sp]
	ldr r0, _0207CA24 ; =0x00000C65
	ldrb r1, [r5, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0207CA28 ; =0x00000834
	ldrh r4, [r1, r0]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0207C5D4
	add r6, r0, #0
	cmp r4, #0x70
	bne _0207C950
	cmp r6, #0xb
	bne _0207C950
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0207C950
	mov r6, #0xc
_0207C950:
	cmp r4, #0
	bne _0207C998
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x6b
	bl ReadMsgDataIntoString
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207CA2C ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207CA20 ; =0x00000654
	ldr r0, _0207CA2C ; =0x000007C4
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	ldrh r2, [r2, #0x28]
	mov r1, #1
	bl BufferItemName
	ldr r2, _0207CA2C ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	b _0207C9E2
_0207C998:
	ldr r0, _0207CA20 ; =0x00000654
	lsl r1, r4, #0x10
	ldr r0, [r5, r0]
	lsr r1, r1, #0x10
	ldr r0, [r0, #4]
	mov r2, #1
	mov r3, #0xc
	bl Bag_AddItem
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x55
	bl ReadMsgDataIntoString
	ldr r0, _0207CA2C ; =0x000007C4
	mov r1, #1
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl BufferItemName
	ldr r0, _0207CA2C ; =0x000007C4
	ldr r2, [sp]
	ldr r0, [r5, r0]
	mov r1, #2
	bl BufferItemName
	ldr r2, _0207CA2C ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
_0207C9E2:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	mov r2, #0x2a
	mov r3, #0xf
	bl DrawFrameAndWindow2
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl sub_0207DB30
	ldr r0, _0207CA20 ; =0x00000654
	ldr r1, [r5, r0]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _0207CA18
	mov r0, #0xa
	add r1, #0x24
	strb r0, [r1]
_0207CA18:
	add r0, r6, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207CA20: .word 0x00000654
_0207CA24: .word 0x00000C65
_0207CA28: .word 0x00000834
_0207CA2C: .word 0x000007C4
	thumb_func_end sub_0207C908

	thumb_func_start sub_0207CA30
sub_0207CA30: ; 0x0207CA30
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207CA80 ; =0x00000C65
	ldrb r1, [r4, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0207CA84 ; =0x0000083A
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _0207CA54
	ldr r0, _0207CA88 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
_0207CA54:
	ldr r0, _0207CA8C ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl thunk_Sprite_SetPalIndex
	add r0, r4, #0
	mov r1, #0xb3
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207CA90 ; =sub_0207FAA8
	ldr r1, _0207CA94 ; =0x00000C58
	ldr r2, _0207CA98 ; =sub_0207FAD4
	str r0, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r4, r1]
	mov r0, #0x18
	pop {r4, pc}
	nop
_0207CA80: .word 0x00000C65
_0207CA84: .word 0x0000083A
_0207CA88: .word 0x00000654
_0207CA8C: .word 0x00000678
_0207CA90: .word sub_0207FAA8
_0207CA94: .word 0x00000C58
_0207CA98: .word sub_0207FAD4
	thumb_func_end sub_0207CA30

	thumb_func_start sub_0207CA9C
sub_0207CA9C: ; 0x0207CA9C
	mov r0, #0x14
	bx lr
	thumb_func_end sub_0207CA9C

	thumb_func_start sub_0207CAA0
sub_0207CAA0: ; 0x0207CAA0
	mov r0, #0x15
	bx lr
	thumb_func_end sub_0207CAA0

	thumb_func_start sub_0207CAA4
sub_0207CAA4: ; 0x0207CAA4
	mov r0, #0x13
	bx lr
	thumb_func_end sub_0207CAA4

	thumb_func_start sub_0207CAA8
sub_0207CAA8: ; 0x0207CAA8
	mov r0, #0x12
	bx lr
	thumb_func_end sub_0207CAA8

	thumb_func_start sub_0207CAAC
sub_0207CAAC: ; 0x0207CAAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	mov r0, #0x15
	mov r1, #0x16
	add r2, r4, #0
	add r7, r3, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	add r1, sp, #0xc
	str r0, [sp, #8]
	bl NNS_G2dGetUnpackedScreenData
	ldr r0, [sp, #0xc]
	mov r4, #0
	str r0, [sp, #4]
	add r0, #0xc
	str r0, [sp, #4]
	str r0, [sp]
_0207CAD6:
	ldr r1, [sp]
	add r0, r5, #0
	mov r2, #0x20
	bl memcpy
	add r1, r4, #6
	lsl r2, r1, #6
	ldr r1, [sp, #4]
	add r0, r6, #0
	add r1, r1, r2
	mov r2, #0x20
	bl memcpy
	add r1, r4, #0
	add r1, #0xc
	lsl r2, r1, #6
	ldr r1, [sp, #4]
	add r0, r7, #0
	add r1, r1, r2
	mov r2, #0x20
	bl memcpy
	ldr r0, [sp]
	add r4, r4, #1
	add r0, #0x40
	str r0, [sp]
	add r5, #0x20
	add r6, #0x20
	add r7, #0x20
	cmp r4, #6
	blo _0207CAD6
	ldr r0, [sp, #8]
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0207CAAC

	thumb_func_start sub_0207CB20
sub_0207CB20: ; 0x0207CB20
	push {r4, lr}
	ldr r1, _0207CB38 ; =0x00000824
	add r4, r0, #0
	ldr r1, [r4, r1]
	bl sub_0207E618
	mov r0, #0x82
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ListMenuItems_Delete
	pop {r4, pc}
	.balign 4, 0
_0207CB38: .word 0x00000824
	thumb_func_end sub_0207CB20

	thumb_func_start sub_0207CB3C
sub_0207CB3C: ; 0x0207CB3C
	push {r3, lr}
	ldr r2, _0207CB50 ; =0x00000654
	ldr r0, [r0, r2]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _0207CB4C
	bl sub_02018410
_0207CB4C:
	pop {r3, pc}
	nop
_0207CB50: .word 0x00000654
	thumb_func_end sub_0207CB3C

	thumb_func_start sub_0207CB54
sub_0207CB54: ; 0x0207CB54
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207CB68 ; =FS_OVERLAY_ID(OVY_94)
	mov r1, #2
	bl HandleLoadOverlay
	add r0, r4, #0
	bl PartyMenu_InitIconFormChangeData
	pop {r4, pc}
	.balign 4, 0
_0207CB68: .word FS_OVERLAY_ID(OVY_94)
	thumb_func_end sub_0207CB54

	thumb_func_start sub_0207CB6C
sub_0207CB6C: ; 0x0207CB6C
	ldr r3, _0207CB74 ; =UnloadOverlayByID
	ldr r0, _0207CB78 ; =FS_OVERLAY_ID(OVY_94)
	bx r3
	nop
_0207CB74: .word UnloadOverlayByID
_0207CB78: .word FS_OVERLAY_ID(OVY_94)
	thumb_func_end sub_0207CB6C

	.rodata

_021012B0:
	.byte 0x01, 0x03
	.byte 0x1A, 0x03
	.byte 0x01, 0x0A
	.byte 0x1A, 0x0A
	.byte 0x01, 0x11
	.byte 0x1A, 0x11

	.global _021012BC
_021012BC:
	.word 1, 0, 0, 0

	.global _021012CC
_021012CC:
	.byte 0x00, 0x02, 0x04, 0x01, 0x03, 0x05
	.byte 0x01, 0x03, 0x05, 0x00, 0x02, 0x04
	.byte 0x04, 0x02, 0x00, 0x05, 0x03, 0x01
	.byte 0x05, 0x03, 0x01, 0x04, 0x02, 0x00

	.global _021012E4
_021012E4:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1C, 0x04, 0x00, 0x03, 0x00, 0x00
	.word 0x00000000

	.global _02101300
_02101300:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x02, 0x00, 0x00
	.word 0x00000000

	.global _0210131C
_0210131C:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1D, 0x04, 0x00, 0x02, 0x00, 0x00
	.word 0x00000000

	.global _02101338
_02101338:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1B, 0x04, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000

	.global _02101354
_02101354:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000

	.global _02101370
_02101370:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000

	.global _0210138C
_0210138C:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1F, 0x02, 0x00, 0x01, 0x00, 0x00
	.word 0x00000000

	.global _021013A8
_021013A8:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00
	.word 0x00000000

_021013C4:
	.short MOVE_CUT
	.short MOVE_FLY
	.short MOVE_SURF
	.short MOVE_STRENGTH
	.short MOVE_ROCK_SMASH
	.short MOVE_WATERFALL
	.short MOVE_ROCK_CLIMB
	.short MOVE_WHIRLPOOL
	.short MOVE_FLASH
	.short MOVE_TELEPORT
	.short MOVE_DIG
	.short MOVE_SWEET_SCENT
	.short MOVE_CHATTER
	.short MOVE_HEADBUTT
	.short MOVE_MILK_DRINK
	.short MOVE_SOFTBOILED

	.global _021013E4
_021013E4:
	.word 0x00000001
	.word 0x00000000
	.word 0x00000004
	.word 0x00000000
	.word 0x00000010
	.word 0x00000000
	.word 0x00000100
	.word 0x00000000
	.word 0x00000002
	.word 0x00000060

	.global _0210140C
_0210140C:
	.byte 0x40, 0x19, 0x00, 0x00, 0x07, 0x02, 0x07, 0x01
	.byte 0xC0, 0x21, 0x00, 0x00, 0x07, 0x03, 0x00, 0x02
	.byte 0x40, 0x49, 0x00, 0x00, 0x00, 0x04, 0x01, 0x03
	.byte 0xC0, 0x51, 0x00, 0x00, 0x01, 0x05, 0x02, 0x04
	.byte 0x40, 0x79, 0x00, 0x00, 0x02, 0x07, 0x03, 0x05
	.byte 0xC0, 0x81, 0x00, 0x00, 0x03, 0x07, 0x04, 0x07
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xE0, 0xA8, 0x00, 0x00, 0x05, 0x01, 0x05, 0x00

	.global _0210144C
_0210144C:
	.byte 0x40, 0x19, 0x00, 0x00, 0x04, 0x02, 0x01, 0x01
	.byte 0xC0, 0x19, 0x00, 0x00, 0x07, 0x03, 0x00, 0x00
	.byte 0x40, 0x49, 0x00, 0x00, 0x00, 0x04, 0x03, 0x03
	.byte 0xC0, 0x49, 0x00, 0x00, 0x01, 0x05, 0x02, 0x02
	.byte 0x40, 0x79, 0x00, 0x00, 0x02, 0x00, 0x05, 0x05
	.byte 0xC0, 0x79, 0x00, 0x00, 0x03, 0x07, 0x04, 0x04
	.byte 0xE0, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xE0, 0xA8, 0x00, 0x00, 0x05, 0x01, 0xFF, 0xFF

	.global _0210148C
_0210148C:
	.byte 0x40, 0x19, 0x00, 0x00, 0x07, 0x02, 0x07, 0x01
	.byte 0xC0, 0x21, 0x00, 0x00, 0x07, 0x03, 0x00, 0x02
	.byte 0x40, 0x49, 0x00, 0x00, 0x00, 0x04, 0x01, 0x03
	.byte 0xC0, 0x51, 0x00, 0x00, 0x01, 0x05, 0x02, 0x04
	.byte 0x40, 0x79, 0x00, 0x00, 0x02, 0x06, 0x03, 0x05
	.byte 0xC0, 0x81, 0x00, 0x00, 0x03, 0x06, 0x04, 0x06
	.byte 0xE0, 0xA8, 0x00, 0x00, 0x05, 0x07, 0x05, 0x07
	.byte 0xE0, 0xB8, 0x00, 0x00, 0x06, 0x01, 0x06, 0x00

	.global _021014CC
_021014CC:
	.byte 0x40, 0x19, 0x00, 0x00, 0x05, 0x02, 0x05, 0x01
	.byte 0xC0, 0x21, 0x00, 0x00, 0x05, 0x03, 0x00, 0x02
	.byte 0x40, 0x49, 0x00, 0x00, 0x00, 0x04, 0x01, 0x03
	.byte 0xC0, 0x51, 0x00, 0x00, 0x01, 0x05, 0x02, 0x04
	.byte 0x40, 0x79, 0x00, 0x00, 0x02, 0x00, 0x03, 0x05
	.byte 0xC0, 0x81, 0x00, 0x00, 0x03, 0x00, 0x04, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global _0210150C
_0210150C:
	.short 0x0000, 0x0000, 0x001E, 0x0010, 0x0010, 0x000E
	.short 0x0010, 0x0001, 0x009E, 0x0018, 0x0090, 0x0016
	.short 0x0000, 0x0006, 0x001E, 0x0040, 0x0010, 0x003E
	.short 0x0010, 0x0007, 0x009E, 0x0048, 0x0090, 0x0046
	.short 0x0000, 0x000C, 0x001E, 0x0070, 0x0010, 0x006E
	.short 0x0010, 0x000D, 0x009E, 0x0078, 0x0090, 0x0076

	.global _02101554
_02101554:
	.short 0x0000, 0x0000, 0x001E, 0x0010, 0x0010, 0x000E
	.short 0x0010, 0x0000, 0x009E, 0x0010, 0x0090, 0x000E
	.short 0x0000, 0x0006, 0x001E, 0x0040, 0x0010, 0x003E
	.short 0x0010, 0x0006, 0x009E, 0x0040, 0x0090, 0x003E
	.short 0x0000, 0x000C, 0x001E, 0x0070, 0x0010, 0x006E
	.short 0x0010, 0x000C, 0x009E, 0x0070, 0x0090, 0x006E

	.public gOverlayTemplate_PartyMenu
gOverlayTemplate_PartyMenu:
	.word PartyMenuApp_Init, PartyMenuApp_Main, PartyMenuApp_Exit, 0xFFFFFFFF

	.data

	.global _02110104
_02110104:
	.byte 0x00, 0x30, 0x00, 0x80
	.byte 0x08, 0x38, 0x80, 0x00
	.byte 0x30, 0x60, 0x00, 0x80
	.byte 0x38, 0x68, 0x80, 0x00
	.byte 0x60, 0x90, 0x00, 0x80
	.byte 0x68, 0x98, 0x80, 0x00
	.byte 0xB0, 0xC0, 0xC8, 0x00
	.byte 0xA0, 0xB0, 0xC8, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00

	.global _02110128
_02110128:
	.byte 0x00, 0x30, 0x00, 0x80
	.byte 0x08, 0x38, 0x80, 0x00
	.byte 0x30, 0x60, 0x00, 0x80
	.byte 0x38, 0x68, 0x80, 0x00
	.byte 0x60, 0x90, 0x00, 0x80
	.byte 0x68, 0x98, 0x80, 0x00
	.byte 0x98, 0xC0, 0xC8, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00

	.byte 0x00, 0x30, 0x00, 0x80
	.byte 0x00, 0x30, 0x80, 0x00
	.byte 0x30, 0x60, 0x00, 0x80
	.byte 0x30, 0x60, 0x80, 0x00
	.byte 0x60, 0x90, 0x00, 0x80
	.byte 0x60, 0x90, 0x80, 0x00
	.byte 0x98, 0xC0, 0xC8, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00
