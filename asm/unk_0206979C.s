#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public _021DA51C

	.text

	thumb_func_start sub_0206979C
sub_0206979C: ; 0x0206979C
	ldr r3, _020697A4 ; =memset
	mov r1, #0
	mov r2, #0x24
	bx r3
	.balign 4, 0
_020697A4: .word memset
	thumb_func_end sub_0206979C

	thumb_func_start sub_020697A8
sub_020697A8: ; 0x020697A8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02069800
	ldr r1, [r4]
	mov r0, #1
	orr r0, r1
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020697A8

	thumb_func_start sub_020697BC
sub_020697BC: ; 0x020697BC
	push {r4, lr}
	add r4, r0, #0
	bl sub_02069800
	ldr r1, [r4]
	mov r0, #1
	bic r1, r0
	str r1, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020697BC

	thumb_func_start sub_020697D0
sub_020697D0: ; 0x020697D0
	ldr r3, _020697D8 ; =sub_020697BC
	ldr r1, [r1, #8]
	bx r3
	nop
_020697D8: .word sub_020697BC
	thumb_func_end sub_020697D0

	thumb_func_start sub_020697DC
sub_020697DC: ; 0x020697DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [sp, #0x14]
	add r4, r1, #0
	add r1, r3, #0
	str r0, [sp]
	add r0, r2, #0
	ldr r3, [sp, #0x10]
	mov r2, #0
	bl sub_02007C98
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl sub_020697A8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020697DC

	thumb_func_start sub_02069800
sub_02069800: ; 0x02069800
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	bl sub_0206979C
	add r0, r4, #0
	mov r1, #0
	str r4, [r5, #8]
	bl NNS_G3dGetAnmByIdx
	str r0, [r5, #0xc]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069800

	thumb_func_start sub_02069818
sub_02069818: ; 0x02069818
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #1
	tst r0, r1
	beq _02069832
	ldr r0, [r4, #8]
	bl FreeToHeap
	ldr r1, [r4]
	mov r0, #1
	bic r1, r0
	str r1, [r4]
_02069832:
	mov r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02069818

	thumb_func_start sub_0206983C
sub_0206983C: ; 0x0206983C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r2, #0
	add r0, #0x14
	mov r2, #4
	bl GF_ExpHeap_FndInitAllocator
	add r0, r5, #0
	ldr r1, [r5, #0xc]
	add r0, #0x14
	add r2, r4, #0
	bl NNS_G3dAllocAnmObj
	str r0, [r5, #0x10]
	cmp r0, #0
	bne _02069862
	bl GF_AssertFail
_02069862:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0206983C

	thumb_func_start sub_02069864
sub_02069864: ; 0x02069864
	ldr r3, _0206986C ; =sub_0206983C
	ldr r1, [r1, #0xc]
	bx r3
	nop
_0206986C: .word sub_0206983C
	thumb_func_end sub_02069864

	thumb_func_start sub_02069870
sub_02069870: ; 0x02069870
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r3, r2, #0
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0xc]
	add r2, r4, #0
	bl NNS_G3dAnmObjInit
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069870

	thumb_func_start sub_02069884
sub_02069884: ; 0x02069884
	ldr r3, _02069890 ; =sub_02069870
	add r2, r1, #0
	ldr r1, [r2, #0xc]
	ldr r2, [r2, #0x10]
	bx r3
	nop
_02069890: .word sub_02069870
	thumb_func_end sub_02069884

	thumb_func_start sub_02069894
sub_02069894: ; 0x02069894
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	add r5, r0, #0
	bl sub_020697D0
	ldr r2, [sp, #0x10]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02069864
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02069884
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02069894

	thumb_func_start sub_020698B8
sub_020698B8: ; 0x020698B8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq _020698CC
	add r0, #0x14
	bl NNS_G3dFreeAnmObj
	mov r0, #0
	str r0, [r4, #0x10]
_020698CC:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020698B8

	thumb_func_start sub_020698D0
sub_020698D0: ; 0x020698D0
	push {r4, lr}
	add r4, r0, #0
	bl sub_020698B8
	add r0, r4, #0
	bl sub_02069818
	add r0, r4, #0
	bl sub_0206979C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020698D0

	thumb_func_start sub_020698E8
sub_020698E8: ; 0x020698E8
	push {r3, r4, r5, r6}
	ldr r3, [r0, #0x10]
	ldr r6, [r0, #4]
	ldr r3, [r3, #8]
	mov r4, #0
	ldrh r3, [r3, #4]
	add r6, r6, r1
	add r5, r4, #0
	str r6, [r0, #4]
	lsl r3, r3, #0xc
	cmp r1, #0
	ldr r1, [r0, #4]
	ble _02069916
	cmp r1, r3
	blt _02069928
	mov r5, #1
	cmp r2, #1
	bne _02069912
	sub r1, r1, r3
	str r1, [r0, #4]
	b _02069928
_02069912:
	str r3, [r0, #4]
	b _02069928
_02069916:
	cmp r1, #0
	bgt _02069928
	mov r5, #1
	cmp r2, #1
	bne _02069926
	add r1, r1, r3
	str r1, [r0, #4]
	b _02069928
_02069926:
	str r4, [r0, #4]
_02069928:
	ldr r2, [r0, #4]
	ldr r1, [r0, #0x10]
	cmp r5, #1
	str r2, [r1]
	ldr r2, [r0]
	bne _0206993C
	mov r1, #2
	orr r1, r2
	str r1, [r0]
	b _02069942
_0206993C:
	mov r1, #2
	bic r2, r1
	str r2, [r0]
_02069942:
	add r0, r5, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end sub_020698E8

	thumb_func_start sub_02069948
sub_02069948: ; 0x02069948
	ldr r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _02069954
	mov r0, #1
	bx lr
_02069954:
	mov r0, #0
	bx lr
	thumb_func_end sub_02069948

	thumb_func_start sub_02069958
sub_02069958: ; 0x02069958
	ldr r3, _02069960 ; =memset
	mov r1, #0
	mov r2, #0x54
	bx r3
	.balign 4, 0
_02069960: .word memset
	thumb_func_end sub_02069958

	thumb_func_start sub_02069964
sub_02069964: ; 0x02069964
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02069958
	add r0, r5, #0
	add r1, r4, #0
	bl NNS_G3dRenderObjInit
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069964

	thumb_func_start sub_02069978
sub_02069978: ; 0x02069978
	ldr r3, _02069980 ; =sub_02069964
	ldr r1, [r1, #0xc]
	bx r3
	nop
_02069980: .word sub_02069964
	thumb_func_end sub_02069978

	thumb_func_start sub_02069984
sub_02069984: ; 0x02069984
	ldr r3, _02069988 ; =NNS_G3dRenderObjAddAnmObj
	bx r3
	.balign 4, 0
_02069988: .word NNS_G3dRenderObjAddAnmObj
	thumb_func_end sub_02069984

	thumb_func_start sub_0206998C
sub_0206998C: ; 0x0206998C
	ldr r3, _02069994 ; =sub_02069984
	ldr r1, [r1, #0x10]
	bx r3
	nop
_02069994: .word sub_02069984
	thumb_func_end sub_0206998C

	thumb_func_start sub_02069998
sub_02069998: ; 0x02069998
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl sub_02069978
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0206998C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069998

	thumb_func_start sub_020699AC
sub_020699AC: ; 0x020699AC
	push {r4, lr}
	add r4, r2, #0
	add r2, r3, #0
	add r3, r4, #0
	bl sub_0201F554
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020699AC

	thumb_func_start sub_020699BC
sub_020699BC: ; 0x020699BC
	push {r3, lr}
	ldr r2, _020699C8 ; =0x020FE8A4
	ldr r3, _020699CC ; =0x020FE8B0
	bl sub_020699AC
	pop {r3, pc}
	.balign 4, 0
_020699C8: .word 0x020FE8A4
_020699CC: .word 0x020FE8B0
	thumb_func_end sub_020699BC

	thumb_func_start sub_020699D0
sub_020699D0: ; 0x020699D0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r4, r1, #0
	add r6, r2, #0
	add r5, r0, #0
	ldrh r1, [r3]
	ldrh r2, [r3, #2]
	ldrh r3, [r3, #4]
	add r0, sp, #0
	bl sub_02020DA4
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, sp, #0
	bl sub_020699AC
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020699D0

	thumb_func_start sub_020699F8
sub_020699F8: ; 0x020699F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	bl sub_0205F1E4
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	add r5, r0, #0
	bl GetPartyCount
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0xe4
	bl sub_0206A06C
	ldr r0, [r4, #0xc]
	bl sub_0202ED34
	add r1, r0, #0
	mov r0, #0
	bl sub_0202ED48
	cmp r6, #0
	bne _02069A34
	b _02069B6C
_02069A34:
	add r0, r5, #0
	bl CountAlivePokemon
	cmp r0, #0
	bne _02069A46
	add r0, r5, #0
	bl GetFirstNonEggInParty
	b _02069A4C
_02069A46:
	add r0, r5, #0
	bl GetFirstAliveMonInParty_CrashIfNone
_02069A4C:
	add r5, r0, #0
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	mov r2, #0
	add r1, #0xe4
	str r2, [r1]
	ldr r1, [sp, #0x40]
	add r6, r0, #0
	bl sub_02069FF4
	cmp r0, #0
	beq _02069B6C
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x20]
	add r0, r5, #0
	bl MonIsShiny
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	lsl r2, r7, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r3, [sp, #0x20]
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	add r1, r6, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	lsr r2, r2, #0x10
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	bl sub_0206A128
	add r1, r4, #0
	add r1, #0xe4
	str r0, [r1]
	add r0, r4, #0
	lsl r2, r7, #0x18
	mov r1, #1
	add r0, #0xfa
	strb r1, [r0]
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #0x24]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl sub_02069F3C
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl GetMonData
	add r3, r0, #0
	mov r0, #0x42
	lsl r0, r0, #2
	lsl r2, r6, #0x10
	ldr r0, [r4, r0]
	add r1, r5, #0
	lsr r2, r2, #0x10
	bl sub_0206A288
	ldr r0, [r4, #0x40]
	bl sub_0205C700
	cmp r0, #0
	beq _02069AF8
	cmp r0, #3
	bne _02069B08
_02069AF8:
	ldr r0, [r4, #0xc]
	bl sub_0202ED34
	add r1, r0, #0
	mov r0, #1
	bl sub_0202ED48
	b _02069B58
_02069B08:
	cmp r0, #1
	bne _02069B2E
	ldr r0, [r4, #0xc]
	bl sub_0202ED34
	add r1, r0, #0
	mov r0, #2
	bl sub_0202ED48
	add r0, r4, #0
	bl sub_0206A054
	add r0, r4, #0
	bl sub_02069D68
	mov r1, #0x38
	bl sub_0205FC94
	b _02069B58
_02069B2E:
	cmp r0, #2
	bne _02069B54
	ldr r0, [r4, #0xc]
	bl sub_0202ED34
	add r1, r0, #0
	mov r0, #2
	bl sub_0202ED48
	add r0, r4, #0
	bl sub_0206A054
	add r0, r4, #0
	bl sub_02069D68
	mov r1, #0x38
	bl sub_0205FC94
	b _02069B58
_02069B54:
	bl GF_AssertFail
_02069B58:
	ldr r0, [r4, #0xc]
	bl sub_0202ED34
	bl sub_0202ED68
	cmp r0, #0
	beq _02069B6C
	add r0, r4, #0
	bl sub_0206A054
_02069B6C:
	add r4, #0xe4
	ldr r0, [r4]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020699F8

	thumb_func_start sub_02069B74
sub_02069B74: ; 0x02069B74
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r1, #0
	bl sub_0205F1E4
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r6, r0, #0
	bl GetPartyCount
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0xe4
	bl sub_0206A06C
	cmp r4, #0
	bne _02069B9C
	b _02069D62
_02069B9C:
	add r0, r6, #0
	bl GetFirstAliveMonInParty_CrashIfNone
	mov r1, #5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	mov r1, #0
	add r4, r0, #0
	add r0, r6, #0
	add r2, r1, #0
	bl GetMonData
	add r3, r0, #0
	mov r0, #0x42
	lsl r0, r0, #2
	lsl r2, r4, #0x10
	ldr r0, [r5, r0]
	add r1, r6, #0
	lsr r2, r2, #0x10
	bl sub_0206A288
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02069FF4
	cmp r0, #0
	ldr r0, [r5, #0x3c]
	bne _02069BDA
	b _02069CF2
_02069BDA:
	mov r1, #0xfd
	bl sub_0205EE60
	str r0, [sp, #4]
	cmp r0, #0
	bne _02069BF0
	mov r0, #1
	add r5, #0xf9
	add sp, #0x14
	strb r0, [r5]
	pop {r4, r5, r6, r7, pc}
_02069BF0:
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r6, #0
	bl GetMonGender
	str r0, [sp, #8]
	add r0, r6, #0
	bl MonIsShiny
	add r6, r0, #0
	add r1, r5, #0
	lsl r2, r7, #0x18
	ldr r0, [sp, #4]
	add r1, #0xe4
	str r0, [r1]
	add r0, r5, #0
	mov r1, #1
	add r0, #0xfa
	strb r1, [r0]
	ldr r0, [sp, #8]
	add r1, r4, #0
	str r0, [sp]
	add r0, r5, #0
	lsr r2, r2, #0x18
	add r3, r6, #0
	bl sub_02069F3C
	lsl r2, r7, #0x18
	ldr r0, [sp, #4]
	add r1, r4, #0
	lsr r2, r2, #0x18
	add r3, r6, #0
	bl sub_02069EE8
	lsl r1, r7, #0x10
	ldr r2, [sp, #8]
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl sub_02069D70
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl sub_0205F258
	ldr r0, [r5, #0x40]
	bl sub_0205C700
	cmp r0, #0
	beq _02069C62
	cmp r0, #3
	bne _02069C72
_02069C62:
	ldr r0, [r5, #0xc]
	bl sub_0202ED34
	add r1, r0, #0
	mov r0, #1
	bl sub_0202ED48
	b _02069CB6
_02069C72:
	cmp r0, #1
	bne _02069C92
	ldr r0, [r5, #0xc]
	bl sub_0202ED34
	add r1, r0, #0
	mov r0, #2
	bl sub_0202ED48
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #1
	bl sub_0206A040
	b _02069CB6
_02069C92:
	cmp r0, #2
	bne _02069CB2
	ldr r0, [r5, #0xc]
	bl sub_0202ED34
	add r1, r0, #0
	mov r0, #2
	bl sub_0202ED48
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #1
	bl sub_0206A040
	b _02069CB6
_02069CB2:
	bl GF_AssertFail
_02069CB6:
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	bl sub_02069E14
	cmp r0, #0
	beq _02069CD0
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #1
	bl sub_0206A040
_02069CD0:
	ldr r0, [r5, #0xc]
	bl sub_0202ED34
	bl sub_0202ED68
	cmp r0, #0
	beq _02069CE4
	add r0, r5, #0
	bl sub_0206A054
_02069CE4:
	add r5, #0xe4
	ldr r0, [r5]
	mov r1, #0
	bl sub_0205F6AC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_02069CF2:
	mov r1, #0xfd
	bl sub_0205EE60
	str r0, [sp, #0xc]
	cmp r0, #0
	beq _02069D62
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r6, #0
	bl GetMonGender
	str r0, [sp, #0x10]
	add r0, r6, #0
	bl MonIsShiny
	add r6, r0, #0
	ldr r0, [sp, #0x10]
	lsl r2, r7, #0x18
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x18
	add r3, r6, #0
	bl sub_02069F3C
	lsl r2, r7, #0x18
	ldr r0, [sp, #0xc]
	add r1, r4, #0
	lsr r2, r2, #0x18
	add r3, r6, #0
	bl sub_02069EE8
	lsl r1, r7, #0x10
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl sub_02069D70
	add r1, r0, #0
	ldr r0, [sp, #0xc]
	bl sub_0205F258
	add r1, r5, #0
	ldr r0, [sp, #0xc]
	add r1, #0xe4
	str r0, [r1]
	add r0, r5, #0
	mov r1, #1
	add r0, #0xfa
	strb r1, [r0]
	add r5, #0xf9
	strb r1, [r5]
_02069D62:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02069B74

	thumb_func_start sub_02069D68
sub_02069D68: ; 0x02069D68
	add r0, #0xe4
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02069D68

	thumb_func_start sub_02069D70
sub_02069D70: ; 0x02069D70
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	cmp r5, #0
	ble _02069D82
	ldr r1, _02069DC0 ; =0x000001ED
	cmp r5, r1
	ble _02069D88
_02069D82:
	mov r4, #0x6b
	lsl r4, r4, #2
	b _02069DBC
_02069D88:
	bl sub_0206A304
	mov r1, #0x6b
	lsl r1, r1, #2
	add r4, r0, r1
	add r0, r5, #0
	bl sub_0206A338
	cmp r0, #0
	beq _02069DA4
	cmp r7, #1
	bne _02069DB2
	add r4, r4, #1
	b _02069DB2
_02069DA4:
	add r0, r5, #0
	bl sub_0206A310
	cmp r6, r0
	ble _02069DB0
	mov r6, #0
_02069DB0:
	add r4, r4, r6
_02069DB2:
	ldr r0, _02069DC4 ; =0x000003E1
	cmp r4, r0
	ble _02069DBC
	mov r4, #0x6b
	lsl r4, r4, #2
_02069DBC:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02069DC0: .word 0x000001ED
_02069DC4: .word 0x000003E1
	thumb_func_end sub_02069D70

	thumb_func_start sub_02069DC8
sub_02069DC8: ; 0x02069DC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0206A040
	cmp r4, #0
	beq _02069DE0
	add r0, r5, #0
	mov r1, #1
	bl sub_02069DEC
	pop {r3, r4, r5, pc}
_02069DE0:
	add r0, r5, #0
	mov r1, #0
	bl sub_02069DEC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02069DC8

	thumb_func_start sub_02069DEC
sub_02069DEC: ; 0x02069DEC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #2
	add r5, r0, #0
	bl sub_0205F2F4
	mov r1, #1
	and r1, r0
	asr r0, r0, #2
	lsl r1, r1, #0x18
	lsl r2, r0, #2
	lsl r0, r4, #1
	orr r0, r2
	lsr r1, r1, #0x18
	orr r1, r0
	add r0, r5, #0
	mov r2, #2
	bl sub_0205F2D0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069DEC

	thumb_func_start sub_02069E14
sub_02069E14: ; 0x02069E14
	push {r3, lr}
	mov r1, #2
	bl sub_0205F2F4
	asr r1, r0, #1
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end sub_02069E14

	thumb_func_start sub_02069E28
sub_02069E28: ; 0x02069E28
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #2
	add r5, r0, #0
	bl sub_0205F2F4
	lsl r1, r0, #6
	lsr r1, r1, #0x10
	lsl r1, r1, #0x1a
	lsl r0, r0, #0x18
	lsr r2, r1, #0x10
	lsr r1, r0, #0x18
	lsl r0, r4, #8
	orr r0, r2
	orr r1, r0
	add r0, r5, #0
	mov r2, #2
	bl sub_0205F2D0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069E28

	thumb_func_start sub_02069E50
sub_02069E50: ; 0x02069E50
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x17
	bls _02069E5E
	bl GF_AssertFail
_02069E5E:
	add r0, r4, #0
	mov r1, #2
	bl sub_0205F2F4
	ldr r1, _02069E80 ; =0x000003FF
	lsl r2, r5, #0xa
	and r0, r1
	lsl r0, r0, #0x18
	add r1, r2, #0
	lsr r0, r0, #0x18
	orr r1, r0
	add r0, r4, #0
	mov r2, #2
	bl sub_0205F2D0
	pop {r3, r4, r5, pc}
	nop
_02069E80: .word 0x000003FF
	thumb_func_end sub_02069E50

	thumb_func_start sub_02069E84
sub_02069E84: ; 0x02069E84
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #2
	add r5, r0, #0
	bl sub_0205F2F4
	mov r1, #3
	and r1, r0
	asr r0, r0, #3
	lsl r1, r1, #0x18
	lsl r2, r0, #3
	lsl r0, r4, #2
	orr r0, r2
	lsr r1, r1, #0x18
	orr r1, r0
	add r0, r5, #0
	mov r2, #2
	bl sub_0205F2D0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069E84

	thumb_func_start sub_02069EAC
sub_02069EAC: ; 0x02069EAC
	push {r3, lr}
	mov r1, #2
	bl sub_0205F2F4
	asr r1, r0, #2
	mov r0, #1
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end sub_02069EAC

	thumb_func_start sub_02069EC0
sub_02069EC0: ; 0x02069EC0
	push {r3, lr}
	mov r1, #2
	bl sub_0205F2F4
	asr r1, r0, #8
	mov r0, #3
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end sub_02069EC0

	thumb_func_start sub_02069ED4
sub_02069ED4: ; 0x02069ED4
	push {r3, lr}
	mov r1, #2
	bl sub_0205F2F4
	asr r1, r0, #0xa
	mov r0, #0x3f
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end sub_02069ED4

	thumb_func_start sub_02069EE8
sub_02069EE8: ; 0x02069EE8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r1, r3, #0
	bl sub_0206A080
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0206A0E0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl sub_0205F2D0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02069EE8

	thumb_func_start sub_02069F0C
sub_02069F0C: ; 0x02069F0C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r6, r2, #0
	ldr r1, [sp, #0x18]
	add r5, r0, #0
	add r7, r3, #0
	mov r2, #2
	bl sub_0205F2D0
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0206A080
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0206A0E0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl sub_0205F2D0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02069F0C

	thumb_func_start sub_02069F3C
sub_02069F3C: ; 0x02069F3C
	push {r3, r4}
	add r4, r0, #0
	add r4, #0xf4
	str r1, [r4]
	add r1, r0, #0
	add r1, #0xfb
	strb r3, [r1]
	add r1, r0, #0
	add r1, #0xfc
	strh r2, [r1]
	ldr r1, _02069F60 ; =0xFFFFFFF8
	add r0, #0xf8
	add r1, sp
	ldrb r1, [r1, #0x10]
	strb r1, [r0]
	pop {r3, r4}
	bx lr
	nop
_02069F60: .word 0xFFFFFFF8
	thumb_func_end sub_02069F3C

	thumb_func_start sub_02069F64
sub_02069F64: ; 0x02069F64
	push {r3, lr}
	bl sub_0206A304
	add r2, r0, #0
	add r0, sp, #0
	mov r1, #0x8d
	bl ReadWholeNarcMemberByIdPair
	add r0, sp, #0
	ldrb r0, [r0, #1]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02069F64

	thumb_func_start sub_02069F7C
sub_02069F7C: ; 0x02069F7C
	ldr r3, _02069F84 ; =sub_0205F2F4
	mov r1, #0
	bx r3
	nop
_02069F84: .word sub_0205F2F4
	thumb_func_end sub_02069F7C

	thumb_func_start sub_02069F88
sub_02069F88: ; 0x02069F88
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xfa
	ldrb r1, [r1]
	cmp r1, #0
	bne _02069F98
	mov r0, #0
	pop {r3, pc}
_02069F98:
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	bl CountAlivePokemon
	cmp r0, #0
	beq _02069FAA
	mov r0, #1
	pop {r3, pc}
_02069FAA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02069F88

	thumb_func_start sub_02069FB0
sub_02069FB0: ; 0x02069FB0
	push {r4, lr}
	add r4, r0, #0
	bl sub_02069F88
	cmp r0, #0
	beq _02069FD0
	add r4, #0xe4
	ldr r0, [r4]
	bl sub_0205F684
	cmp r0, #0
	bne _02069FCC
	mov r0, #1
	pop {r4, pc}
_02069FCC:
	mov r0, #0
	pop {r4, pc}
_02069FD0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02069FB0

	thumb_func_start sub_02069FD4
sub_02069FD4: ; 0x02069FD4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0202ED34
	bl sub_0202ED44
	add r5, #0xe4
	add r4, r0, #0
	ldr r0, [r5]
	bl sub_02069F7C
	add r1, r4, #0
	bl sub_02069FF4
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069FD4

	thumb_func_start sub_02069FF4
sub_02069FF4: ; 0x02069FF4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	sub r0, #0x32
	add r6, r1, #0
	cmp r0, #1
	bhi _0206A00E
	add r0, r6, #0
	bl sub_0206A0A4
	cmp r0, #0
	bne _0206A00E
	mov r0, #0
	pop {r4, r5, r6, pc}
_0206A00E:
	add r0, r6, #0
	bl MapHeader_GetFollowMode
	cmp r0, #0
	beq _0206A022
	cmp r0, #1
	beq _0206A026
	cmp r0, #2
	beq _0206A038
	b _0206A03A
_0206A022:
	mov r4, #0
	b _0206A03A
_0206A026:
	add r0, r5, #0
	bl sub_02069F64
	cmp r0, #0
	beq _0206A034
	mov r4, #0
	b _0206A03A
_0206A034:
	mov r4, #1
	b _0206A03A
_0206A038:
	mov r4, #1
_0206A03A:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02069FF4

	thumb_func_start sub_0206A040
sub_0206A040: ; 0x0206A040
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F690
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F6E0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0206A040

	thumb_func_start sub_0206A054
sub_0206A054: ; 0x0206A054
	push {r4, lr}
	add r0, #0xe4
	ldr r4, [r0]
	mov r1, #1
	add r0, r4, #0
	bl sub_02069DC8
	add r0, r4, #0
	mov r1, #0
	bl sub_02069DEC
	pop {r4, pc}
	thumb_func_end sub_0206A054

	thumb_func_start sub_0206A06C
sub_0206A06C: ; 0x0206A06C
	mov r1, #0
	strb r1, [r0, #0x16]
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #0x1c]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	strb r1, [r0, #0x15]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0206A06C

	thumb_func_start sub_0206A080
sub_0206A080: ; 0x0206A080
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #2
	add r5, r0, #0
	bl sub_0205F2F4
	asr r0, r0, #1
	lsl r1, r0, #1
	cmp r4, #0
	beq _0206A098
	mov r0, #1
	orr r1, r0
_0206A098:
	add r0, r5, #0
	mov r2, #2
	bl sub_0205F2D0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0206A080

	thumb_func_start sub_0206A0A4
sub_0206A0A4: ; 0x0206A0A4
	cmp r0, #0x6f
	bgt _0206A0AC
	beq _0206A0D6
	b _0206A0DA
_0206A0AC:
	mov r1, #0x53
	lsl r1, r1, #2
	sub r0, r0, r1
	cmp r0, #9
	bhi _0206A0DA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206A0C2: ; jump table
	.short _0206A0D6 - _0206A0C2 - 2 ; case 0
	.short _0206A0D6 - _0206A0C2 - 2 ; case 1
	.short _0206A0D6 - _0206A0C2 - 2 ; case 2
	.short _0206A0D6 - _0206A0C2 - 2 ; case 3
	.short _0206A0D6 - _0206A0C2 - 2 ; case 4
	.short _0206A0D6 - _0206A0C2 - 2 ; case 5
	.short _0206A0D6 - _0206A0C2 - 2 ; case 6
	.short _0206A0D6 - _0206A0C2 - 2 ; case 7
	.short _0206A0D6 - _0206A0C2 - 2 ; case 8
	.short _0206A0D6 - _0206A0C2 - 2 ; case 9
_0206A0D6:
	mov r0, #0
	bx lr
_0206A0DA:
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end sub_0206A0A4

	thumb_func_start sub_0206A0E0
sub_0206A0E0: ; 0x0206A0E0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r0, #0
	add r0, r6, #0
	add r5, r2, #0
	bl sub_0206A304
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0206A310
	cmp r0, #0
	ble _0206A106
	cmp r5, r0
	bgt _0206A102
	add r4, r4, r5
	b _0206A106
_0206A102:
	bl GF_AssertFail
_0206A106:
	add r0, sp, #0
	mov r1, #0x8d
	add r2, r4, #0
	bl ReadWholeNarcMemberByIdPair
	add r1, sp, #0
	ldrb r2, [r1, #1]
	ldrb r1, [r1, #2]
	add r0, r7, #0
	lsl r2, r2, #8
	orr r1, r2
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	mov r2, #1
	bl sub_0205F2D0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206A0E0

	thumb_func_start sub_0206A128
sub_0206A128: ; 0x0206A128
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r2, #0
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r3, #0
	bl sub_02069D70
	str r0, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x20]
	add r0, r4, #0
	bl sub_0205E294
	add r4, r0, #0
	bne _0206A15A
	bl GF_AssertFail
_0206A15A:
	add r0, r4, #0
	mov r1, #0xfd
	bl sub_0205F248
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F268
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F270
	ldr r1, _0206A1D0 ; =0x000025E4
	add r0, r4, #0
	bl sub_0205F278
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl sub_0205F2D0
	lsl r2, r6, #0x18
	ldr r3, [sp, #0x2c]
	add r0, r4, #0
	add r1, r5, #0
	lsr r2, r2, #0x18
	bl sub_02069EE8
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl sub_0205F318
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl sub_0205F320
	mov r1, #9
	add r0, r4, #0
	lsl r1, r1, #0xa
	bl sub_0205F20C
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #6
	bl sub_0205F214
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F89C
	add r0, r4, #0
	mov r1, #1
	bl sub_02069DC8
	add r0, r4, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0206A1D0: .word 0x000025E4
	thumb_func_end sub_0206A128

	thumb_func_start sub_0206A1D4
sub_0206A1D4: ; 0x0206A1D4
	push {r4, lr}
	mov r1, #0xc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	strh r0, [r4, #4]
	str r0, [r4]
	strh r0, [r4, #6]
	str r0, [r4, #8]
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_0206A1D4

	thumb_func_start sub_0206A1F4
sub_0206A1F4: ; 0x0206A1F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	add r4, r1, #0
	cmp r0, #0
	bne _0206A206
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_0206A206:
	mov r1, #0xbb
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	mov r2, #0
	strb r0, [r1]
	ldrsb r0, [r1, r2]
	add r3, r0, r4
	cmp r3, #0x7f
	ble _0206A222
	mov r0, #0x7f
	strb r0, [r1]
	b _0206A232
_0206A222:
	add r0, r2, #0
	sub r0, #0x7f
	cmp r3, r0
	bge _0206A230
	sub r2, #0x7f
	strb r2, [r1]
	b _0206A232
_0206A230:
	strb r3, [r1]
_0206A232:
	ldr r0, [r5, #8]
	mov r1, #0xbb
	add r2, sp, #0
	bl SetMonData
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0206A1F4

	thumb_func_start sub_0206A240
sub_0206A240: ; 0x0206A240
	push {r0, r1, r2, r3}
	push {r3, lr}
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _0206A256
	bl GF_AssertFail
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
_0206A256:
	mov r1, #0xbb
	add r2, sp, #0xc
	bl SetMonData
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end sub_0206A240

	thumb_func_start sub_0206A268
sub_0206A268: ; 0x0206A268
	push {r3, lr}
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _0206A278
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_0206A278:
	mov r1, #0xbb
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206A268

	thumb_func_start sub_0206A288
sub_0206A288: ; 0x0206A288
	push {r3, r4, lr}
	sub sp, #4
	cmp r2, #0
	beq _0206A2BC
	ldrh r4, [r0, #6]
	cmp r4, #0
	beq _0206A2A2
	ldrh r4, [r0, #4]
	cmp r4, r2
	bne _0206A2A2
	ldr r4, [r0]
	cmp r4, r3
	beq _0206A2BC
_0206A2A2:
	strh r2, [r0, #4]
	str r3, [r0]
	mov r3, #0
	add r2, sp, #0
	strb r3, [r2]
	mov r2, #1
	strh r2, [r0, #6]
	str r1, [r0, #8]
	add r0, r1, #0
	mov r1, #0xbb
	add r2, sp, #0
	bl SetMonData
_0206A2BC:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_0206A288

	thumb_func_start sub_0206A2C0
sub_0206A2C0: ; 0x0206A2C0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0206A2D4
	bl GF_AssertFail
	add sp, #4
	pop {r3, r4, pc}
_0206A2D4:
	mov r1, #0xbb
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	strb r0, [r1]
	mov r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0206A2EE
	add r0, r0, #1
	strb r0, [r1]
	b _0206A2F4
_0206A2EE:
	ble _0206A2F4
	sub r0, r0, #1
	strb r0, [r1]
_0206A2F4:
	ldr r0, [r4, #8]
	mov r1, #0xbb
	add r2, sp, #0
	bl SetMonData
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206A2C0

	thumb_func_start sub_0206A304
sub_0206A304: ; 0x0206A304
	lsl r1, r0, #1
	ldr r0, _0206A30C ; =0x020FF088
	ldrh r0, [r0, r1]
	bx lr
	.balign 4, 0
_0206A30C: .word 0x020FF088
	thumb_func_end sub_0206A304

	thumb_func_start sub_0206A310
sub_0206A310: ; 0x0206A310
	push {r3, lr}
	cmp r0, #0
	ble _0206A31C
	ldr r1, _0206A330 ; =0x000001ED
	cmp r0, r1
	ble _0206A324
_0206A31C:
	bl GF_AssertFail
	mov r0, #0
	b _0206A326
_0206A324:
	sub r0, r0, #1
_0206A326:
	lsl r1, r0, #1
	ldr r0, _0206A334 ; =0x020FE8D4
	ldrh r0, [r0, r1]
	pop {r3, pc}
	nop
_0206A330: .word 0x000001ED
_0206A334: .word 0x020FE8D4
	thumb_func_end sub_0206A310

	thumb_func_start sub_0206A338
sub_0206A338: ; 0x0206A338
	push {r3, lr}
	cmp r0, #0
	ble _0206A344
	ldr r1, _0206A358 ; =0x000001ED
	cmp r0, r1
	ble _0206A34C
_0206A344:
	bl GF_AssertFail
	mov r0, #0
	b _0206A34E
_0206A34C:
	sub r0, r0, #1
_0206A34E:
	lsl r1, r0, #1
	ldr r0, _0206A35C ; =0x020FECAE
	ldrh r0, [r0, r1]
	pop {r3, pc}
	nop
_0206A358: .word 0x000001ED
_0206A35C: .word 0x020FECAE
	thumb_func_end sub_0206A338

	thumb_func_start sub_0206A360
sub_0206A360: ; 0x0206A360
	push {r3, r4}
	ldr r4, _0206A384 ; =0x0210FAE8
	mov r2, #0xff
	mov r3, #0
_0206A368:
	ldr r1, [r4]
	cmp r0, r1
	bne _0206A374
	lsl r0, r3, #0x18
	lsr r2, r0, #0x18
	b _0206A37C
_0206A374:
	add r3, r3, #1
	add r4, #0x3c
	cmp r3, #0x19
	blt _0206A368
_0206A37C:
	add r0, r2, #0
	pop {r3, r4}
	bx lr
	nop
_0206A384: .word 0x0210FAE8
	thumb_func_end sub_0206A360

	thumb_func_start sub_0206A388
sub_0206A388: ; 0x0206A388
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r6, r1, #0
	add r5, r2, #0
	add r7, r3, #0
	bl sub_0205064C
	str r0, [sp, #4]
	mov r0, #4
	mov r1, #0x38
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	ldr r0, [sp, #4]
	bl sub_0203E340
	str r0, [r4, #0xc]
	mov r0, #0
	strh r0, [r4, #0x18]
	strh r0, [r4, #0x1a]
	strh r6, [r4, #0x16]
	cmp r5, #4
	bhi _0206A3EA
	add r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0206A3CA: ; jump table
	.short _0206A3D4 - _0206A3CA - 2 ; case 0
	.short _0206A3D8 - _0206A3CA - 2 ; case 1
	.short _0206A3DE - _0206A3CA - 2 ; case 2
	.short _0206A3E4 - _0206A3CA - 2 ; case 3
	.short _0206A3E4 - _0206A3CA - 2 ; case 4
_0206A3D4:
	str r0, [r4, #0x2c]
	b _0206A3F2
_0206A3D8:
	mov r0, #1
	str r0, [r4, #0x2c]
	b _0206A3F2
_0206A3DE:
	mov r0, #2
	str r0, [r4, #0x2c]
	b _0206A3F2
_0206A3E4:
	mov r0, #3
	str r0, [r4, #0x2c]
	b _0206A3F2
_0206A3EA:
	bl GF_AssertFail
	mov r0, #0
	str r0, [r4, #0x2c]
_0206A3F2:
	mov r0, #4
	str r0, [r4, #8]
	str r7, [r4, #0x30]
	mov r0, #0
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	ldr r0, [sp]
	ldr r1, _0206A40C ; =sub_0206A410
	add r2, r4, #0
	bl sub_02050530
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206A40C: .word sub_0206A410
	thumb_func_end sub_0206A388

	thumb_func_start sub_0206A410
sub_0206A410: ; 0x0206A410
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #3
	bls _0206A42C
	b _0206A5BC
_0206A42C:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206A438: ; jump table
	.short _0206A440 - _0206A438 - 2 ; case 0
	.short _0206A4D0 - _0206A438 - 2 ; case 1
	.short _0206A4E0 - _0206A438 - 2 ; case 2
	.short _0206A50C - _0206A438 - 2 ; case 3
_0206A440:
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl sub_0201CC20
	strh r0, [r4, #0x14]
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl sub_0201CC2C
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl sub_0201CC2C
	str r0, [r4, #0x20]
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_0201CC2C
	str r0, [r4, #0x24]
	ldr r0, [r4, #0xc]
	mov r1, #3
	bl sub_0201CC2C
	str r0, [r4, #0x28]
	ldr r0, [r4, #0xc]
	mov r1, #2
	mov r2, #0
	mov r3, #1
	bl sub_0201B1F4
	mov r0, #3
	mov r1, #0
	bl sub_0201BB68
	mov r0, #2
	mov r1, #1
	bl sub_0201BB68
	mov r0, #0
	mov r1, #2
	bl sub_0201BB68
	add r0, r4, #0
	bl sub_0206A5D0
	add r0, r4, #0
	bl sub_0206A660
	mov r0, #0
	str r0, [sp]
	ldr r0, _0206A5C4 ; =0x04000050
	mov r1, #4
	mov r2, #0x21
	mov r3, #0x10
	bl G2x_SetBlendAlpha_
	mov r0, #0x10
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #8]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	add r3, r0, #0
	bl sub_0200FA24
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206A5BC
_0206A4D0:
	bl sub_0200FB5C
	cmp r0, #0
	beq _0206A5BC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206A5BC
_0206A4E0:
	ldr r0, _0206A5C8 ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _0206A4F6
	mov r0, #0
	strh r0, [r4, #0x18]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206A5BC
_0206A4F6:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #0x3c
	ble _0206A5BC
	mov r0, #0
	strh r0, [r4, #0x18]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206A5BC
_0206A50C:
	ldrh r0, [r4, #0x18]
	cmp r0, #0x10
	bhs _0206A536
	ldrh r0, [r4, #0x1a]
	add r0, r0, #1
	strh r0, [r4, #0x1a]
	ldrh r0, [r4, #0x1a]
	cmp r0, #2
	blo _0206A528
	mov r0, #0
	strh r0, [r4, #0x1a]
	ldrh r0, [r4, #0x18]
	add r0, r0, #1
	strh r0, [r4, #0x18]
_0206A528:
	ldrh r2, [r4, #0x18]
	mov r0, #0x10
	sub r1, r0, r2
	lsl r0, r2, #8
	orr r1, r0
	ldr r0, _0206A5CC ; =0x04000052
	strh r1, [r0]
_0206A536:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0206A694
	cmp r0, #0
	beq _0206A5BC
	ldrh r0, [r4, #0x18]
	cmp r0, #0x10
	blo _0206A5BC
	mov r0, #2
	mov r1, #0
	bl sub_0201BC28
	ldrh r3, [r4, #0x14]
	ldr r0, [r4, #0xc]
	mov r1, #2
	lsl r3, r3, #0x18
	mov r2, #0
	lsr r3, r3, #0x18
	bl sub_0201B1F4
	ldr r1, [r4, #0x1c]
	mov r0, #2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_0201BB68
	ldr r1, [r4, #0x20]
	mov r0, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_0201BB68
	ldr r1, [r4, #0x24]
	mov r0, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_0201BB68
	ldr r1, [r4, #0x28]
	mov r0, #3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_0201BB68
	ldr r0, _0206A5C4 ; =0x04000050
	mov r2, #0
	strh r2, [r0]
	ldr r3, [r4, #8]
	mov r0, #2
	mov r1, #0x20
	bl BG_ClearCharDataRange
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_0201D54C
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0206A5BC:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0206A5C4: .word 0x04000050
_0206A5C8: .word gMain
_0206A5CC: .word 0x04000052
	thumb_func_end sub_0206A410

	thumb_func_start sub_0206A5D0
sub_0206A5D0: ; 0x0206A5D0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x16
	lsl r0, r0, #4
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0x3c
	str r0, [sp, #4]
	ldrh r2, [r4, #0x16]
	ldr r5, _0206A654 ; =0x0210FAF0
	ldr r3, [r4, #0x2c]
	mul r1, r2
	mov r2, #0xc
	mul r2, r3
	add r1, r5, r1
	ldr r1, [r2, r1]
	mov r2, #0
	mov r0, #0x96
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	mov r1, #0x3c
	str r0, [sp, #0xc]
	ldrh r2, [r4, #0x16]
	ldr r5, _0206A658 ; =0x0210FAF4
	ldr r3, [r4, #0x2c]
	mul r1, r2
	mov r2, #0xc
	mul r2, r3
	add r1, r5, r1
	ldr r1, [r2, r1]
	ldr r2, [r4, #0xc]
	mov r0, #0x96
	mov r3, #2
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	mov r1, #0x3c
	str r0, [sp, #0xc]
	ldrh r2, [r4, #0x16]
	ldr r5, _0206A65C ; =0x0210FAF8
	ldr r3, [r4, #0x2c]
	mul r1, r2
	mov r2, #0xc
	mul r2, r3
	add r1, r5, r1
	ldr r1, [r2, r1]
	ldr r2, [r4, #0xc]
	mov r0, #0x96
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0206A654: .word 0x0210FAF0
_0206A658: .word 0x0210FAF4
_0206A65C: .word 0x0210FAF8
	thumb_func_end sub_0206A5D0

	thumb_func_start sub_0206A660
sub_0206A660: ; 0x0206A660
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #1
	bl AllocWindows
	str r0, [r4, #0x10]
	mov r3, #0
	str r3, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0xb
	lsl r0, r0, #6
	str r0, [sp, #0x10]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	bl AddWindowParameterized
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206A660

	thumb_func_start sub_0206A694
sub_0206A694: ; 0x0206A694
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r1, [r0, #0x30]
	cmp r1, #0
	bne _0206A6A6
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0206A6A6:
	add r4, r0, #0
	ldrh r0, [r0, #0x34]
	add r4, #0x34
	cmp r0, #5
	bhi _0206A790
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206A6BC: ; jump table
	.short _0206A6C8 - _0206A6BC - 2 ; case 0
	.short _0206A6D8 - _0206A6BC - 2 ; case 1
	.short _0206A714 - _0206A6BC - 2 ; case 2
	.short _0206A72A - _0206A6BC - 2 ; case 3
	.short _0206A74A - _0206A6BC - 2 ; case 4
	.short _0206A78A - _0206A6BC - 2 ; case 5
_0206A6C8:
	ldr r0, [r5, #0x40]
	mov r1, #0
	bl sub_0205C874
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _0206A790
_0206A6D8:
	ldr r0, [r5, #0x40]
	bl sub_0205C6DC
	ldrh r1, [r4, #2]
	add r6, r0, #0
	add r1, r1, #1
	strh r1, [r4, #2]
	add r1, sp, #0
	bl sub_0205F944
	mov r0, #2
	ldr r1, [sp, #4]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, sp, #0
	bl sub_0205F954
	ldrh r0, [r4, #2]
	cmp r0, #0x10
	blo _0206A790
	ldr r0, [r5, #0x40]
	mov r1, #1
	bl sub_0205C874
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _0206A790
_0206A714:
	ldr r0, [r5, #0x40]
	mov r1, #1
	bl ov01_021F1AFC
	ldr r0, [r5, #0x40]
	bl ov01_021F1B04
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _0206A790
_0206A72A:
	ldr r0, [r5, #0x40]
	bl sub_0205C6DC
	add r5, r0, #0
	bl sub_02062108
	cmp r0, #0
	beq _0206A790
	add r0, r5, #0
	mov r1, #1
	bl sub_0206214C
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _0206A790
_0206A74A:
	ldr r0, [r5, #0x40]
	bl sub_0205C6DC
	bl sub_02062108
	cmp r0, #0
	beq _0206A790
	add r0, r5, #0
	bl sub_02069F88
	cmp r0, #0
	beq _0206A782
	add r0, r5, #0
	mov r1, #1
	bl ov01_02205790
	add r0, r5, #0
	bl sub_02069D68
	mov r1, #0x30
	bl sub_0205FC94
	add r0, r5, #0
	bl sub_02069D68
	mov r1, #1
	bl sub_02069DC8
_0206A782:
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _0206A790
_0206A78A:
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0206A790:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0206A694

	thumb_func_start sub_0206A798
sub_0206A798: ; 0x0206A798
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0xdc
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0xdc
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	strb r0, [r4, #0x14]
	strb r0, [r4, #0x15]
	strb r0, [r4, #0x17]
	ldr r0, [r5, #0x40]
	bl sub_0205C67C
	strh r0, [r4, #0x30]
	ldr r0, [r5, #0x40]
	bl sub_0205C688
	strh r0, [r4, #0x32]
	ldr r0, [r5, #0x40]
	bl sub_0205C654
	strh r0, [r4, #0x34]
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	strh r0, [r4, #0x36]
	add r0, r5, #0
	bl sub_02069F88
	cmp r0, #0
	beq _0206A7FE
	add r0, r5, #0
	bl sub_02069D68
	add r1, r4, #0
	add r7, r0, #0
	add r1, #0xcc
	bl sub_0205F944
	add r0, r7, #0
	bl sub_0205F2A8
	add r1, r4, #0
	add r1, #0xd8
	strb r0, [r1]
_0206A7FE:
	add r0, r5, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202FA64
	bl sub_0202FA88
	cmp r0, #0xff
	beq _0206A858
	mov r1, #1
	add r0, sp, #0x18
	lsl r1, r1, #8
	add r2, r6, #0
	bl ReadWholeNarcMemberByIdPair
	add r3, sp, #0x18
	ldrh r0, [r3, #4]
	add r1, r5, #0
	str r0, [sp]
	ldrh r0, [r3, #6]
	str r0, [sp, #4]
	ldrh r0, [r3, #0xc]
	str r0, [sp, #8]
	ldrh r0, [r3, #0xe]
	str r0, [sp, #0xc]
	ldrb r0, [r3, #9]
	str r0, [sp, #0x10]
	ldrh r0, [r3, #0xa]
	str r0, [sp, #0x14]
	ldrh r2, [r3, #2]
	add r0, r4, #0
	ldrh r3, [r3]
	lsl r2, r2, #0x18
	add r0, #0x44
	lsr r2, r2, #0x18
	bl sub_0206B014
	add r0, r4, #0
	add r0, #0x44
	str r0, [r4, #0x40]
	ldr r0, [r5, #0x10]
	ldr r1, _0206A85C ; =sub_0206B270
	add r2, r4, #0
	bl sub_02050530
_0206A858:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206A85C: .word sub_0206B270
	thumb_func_end sub_0206A798

	thumb_func_start sub_0206A860
sub_0206A860: ; 0x0206A860
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0xbc
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0xbc
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r5, #0x40]
	bl sub_0205C67C
	add r1, r4, #0
	add r1, #0x94
	strh r0, [r1]
	ldr r0, [r5, #0x40]
	bl sub_0205C688
	add r1, r4, #0
	add r1, #0x96
	strh r0, [r1]
	ldr r0, [r5, #0x40]
	bl sub_0205C654
	add r1, r4, #0
	add r1, #0x98
	strh r0, [r1]
	ldr r0, [r5, #0x20]
	ldr r1, [r0]
	add r0, r4, #0
	add r0, #0x9a
	strh r1, [r0]
	ldr r0, [r5, #0xc]
	bl sub_0202FA64
	add r1, r4, #0
	add r1, #0xb8
	str r0, [r1]
	ldr r0, [r5, #0x10]
	ldr r1, _0206A8BC ; =sub_0206A8E4
	add r2, r4, #0
	bl sub_02050530
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0206A8BC: .word sub_0206A8E4
	thumb_func_end sub_0206A860

	thumb_func_start sub_0206A8C0
sub_0206A8C0: ; 0x0206A8C0
	push {r4, lr}
	add r4, r1, #0
	add r1, r0, #0
	add r1, #0xc
	str r1, [r4]
	ldrb r1, [r0, #0xa]
	add r0, #0xb8
	strb r1, [r4, #4]
	ldr r0, [r0]
	bl sub_0202FAB0
	strb r0, [r4, #5]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206A8C0

	thumb_func_start sub_0206A8DC
sub_0206A8DC: ; 0x0206A8DC
	add r0, #0x90
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0206A8DC

	thumb_func_start sub_0206A8E4
sub_0206A8E4: ; 0x0206A8E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #8
	bhi _0206A99C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206A908: ; jump table
	.short _0206A91A - _0206A908 - 2 ; case 0
	.short _0206A928 - _0206A908 - 2 ; case 1
	.short _0206A936 - _0206A908 - 2 ; case 2
	.short _0206A944 - _0206A908 - 2 ; case 3
	.short _0206A952 - _0206A908 - 2 ; case 4
	.short _0206A960 - _0206A908 - 2 ; case 5
	.short _0206A96E - _0206A908 - 2 ; case 6
	.short _0206A97C - _0206A908 - 2 ; case 7
	.short _0206A98A - _0206A908 - 2 ; case 8
_0206A91A:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206A9A0
	str r0, [r4]
	b _0206A99C
_0206A928:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206A9B4
	str r0, [r4]
	b _0206A99C
_0206A936:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206A9E8
	str r0, [r4]
	b _0206A99C
_0206A944:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206AAE4
	str r0, [r4]
	b _0206A99C
_0206A952:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206AAD4
	str r0, [r4]
	b _0206A99C
_0206A960:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206AB2C
	str r0, [r4]
	b _0206A99C
_0206A96E:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206AA4C
	str r0, [r4]
	b _0206A99C
_0206A97C:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0206AB78
	str r0, [r4]
	b _0206A99C
_0206A98A:
	add r0, r6, #0
	mov r1, #0
	bl sub_02067A80
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_0206A99C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0206A8E4

	thumb_func_start sub_0206A9A0
sub_0206A9A0: ; 0x0206A9A0
	push {r4, lr}
	add r4, r2, #0
	ldrb r2, [r4, #0xa]
	mov r1, #0
	bl sub_0203EBA4
	add r4, #0xb4
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_0206A9A0

	thumb_func_start sub_0206A9B4
sub_0206A9B4: ; 0x0206A9B4
	push {r3, r4, r5, lr}
	add r5, r2, #0
	bl sub_020505A0
	cmp r0, #0
	beq _0206A9C4
	mov r0, #1
	pop {r3, r4, r5, pc}
_0206A9C4:
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	ldrb r4, [r0, #1]
	strb r4, [r5, #8]
	ldrb r0, [r0, #2]
	strb r0, [r5, #0xa]
	add r5, #0xb4
	ldr r0, [r5]
	bl FreeToHeap
	cmp r4, #1
	bne _0206A9E2
	mov r0, #2
	pop {r3, r4, r5, pc}
_0206A9E2:
	mov r0, #7
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0206A9B4

	thumb_func_start sub_0206A9E8
sub_0206A9E8: ; 0x0206A9E8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x10
	add r4, r2, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x10
	add r6, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0xb8
	add r1, r4, #0
	ldrb r2, [r4, #0xa]
	ldr r0, [r0]
	add r1, #0xc
	bl sub_0202FB14
	add r0, r4, #0
	add r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0
	beq _0206AA1E
	mov r0, #2
	b _0206AA20
_0206AA1E:
	ldrb r0, [r4, #0x13]
_0206AA20:
	strb r0, [r4, #0xb]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x90
	str r1, [r0]
	str r4, [r6, #8]
	ldr r0, [r5, #0x70]
	ldr r1, _0206AA48 ; =sub_0206ABB0
	strb r0, [r4, #9]
	mov r0, #5
	str r0, [r5, #0x70]
	add r0, r5, #0
	add r0, #0xdc
	str r4, [r0]
	ldr r0, [r5, #0x10]
	add r2, r6, #0
	bl sub_02050530
	mov r0, #3
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0206AA48: .word sub_0206ABB0
	thumb_func_end sub_0206A9E8

	thumb_func_start sub_0206AA4C
sub_0206AA4C: ; 0x0206AA4C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	str r1, [sp]
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _0206AA5E
	cmp r1, #1
	beq _0206AA9A
	b _0206AACE
_0206AA5E:
	bl sub_020148F4
	ldrb r0, [r5, #0xb]
	mov r6, #0
	cmp r0, #0
	ble _0206AA8C
	add r4, r5, #0
	add r7, r6, #0
_0206AA6E:
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	beq _0206AA82
	bl sub_0205E3CC
	add r0, r4, #0
	add r0, #0x9c
	str r7, [r0]
_0206AA82:
	ldrb r0, [r5, #0xb]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0206AA6E
_0206AA8C:
	ldr r0, [sp]
	bl sub_0205525C
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _0206AACE
_0206AA9A:
	ldrb r1, [r5, #9]
	str r1, [r0, #0x70]
	mov r1, #0
	add r0, #0xdc
	str r1, [r0]
	add r0, r5, #0
	str r1, [r5, #4]
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #2
	beq _0206AAB6
	cmp r0, #3
	beq _0206AAC0
	b _0206AACA
_0206AAB6:
	ldrb r0, [r5, #0xa]
	sub r0, r0, #1
	strb r0, [r5, #0xa]
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0206AAC0:
	ldrb r0, [r5, #0xa]
	add r0, r0, #1
	strb r0, [r5, #0xa]
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0206AACA:
	add r0, r1, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206AACE:
	mov r0, #6
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206AA4C

	thumb_func_start sub_0206AAD4
sub_0206AAD4: ; 0x0206AAD4
	add r2, #0x90
	ldr r0, [r2]
	cmp r0, #0
	bne _0206AAE0
	mov r0, #4
	bx lr
_0206AAE0:
	mov r0, #5
	bx lr
	thumb_func_end sub_0206AAD4

	thumb_func_start sub_0206AAE4
sub_0206AAE4: ; 0x0206AAE4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r2, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0206AAF6
	cmp r0, #1
	beq _0206AB14
	b _0206AB26
_0206AAF6:
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl sub_0200FA24
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0206AB26
_0206AB14:
	bl sub_0200FB5C
	cmp r0, #0
	beq _0206AB26
	mov r0, #0
	str r0, [r4, #4]
	add sp, #0xc
	mov r0, #4
	pop {r3, r4, pc}
_0206AB26:
	mov r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end sub_0206AAE4

	thumb_func_start sub_0206AB2C
sub_0206AB2C: ; 0x0206AB2C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r2, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0206AB3E
	cmp r0, #1
	beq _0206AB5E
	b _0206AB70
_0206AB3E:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl sub_0200FA24
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0206AB70
_0206AB5E:
	bl sub_0200FB5C
	cmp r0, #0
	beq _0206AB70
	mov r0, #0
	str r0, [r4, #4]
	add sp, #0xc
	mov r0, #6
	pop {r3, r4, pc}
_0206AB70:
	mov r0, #5
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206AB2C

	thumb_func_start sub_0206AB78
sub_0206AB78: ; 0x0206AB78
	push {r3, r4, lr}
	sub sp, #0x14
	add r0, r2, #0
	add r0, #0x98
	ldrh r3, [r0]
	add r0, r2, #0
	add r4, r2, #0
	add r0, #0x96
	add r4, #0x94
	add r2, #0x9a
	ldrh r0, [r0]
	ldrh r4, [r4]
	ldrh r2, [r2]
	str r2, [sp]
	mov r2, #0
	mvn r2, r2
	str r0, [sp, #0xc]
	add r0, r1, #0
	add r1, sp, #0
	str r2, [sp, #4]
	str r4, [sp, #8]
	str r3, [sp, #0x10]
	bl sub_020537A8
	mov r0, #8
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206AB78

	thumb_func_start sub_0206ABB0
sub_0206ABB0: ; 0x0206ABB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	add r7, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r7, #0
	bl sub_02050650
	add r4, r0, #0
	ldr r0, [r4, #8]
	ldr r1, [r4]
	add r5, r0, #0
	add r5, #0xc
	cmp r1, #9
	bls _0206ABD2
	b _0206AEA2
_0206ABD2:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0206ABDE: ; jump table
	.short _0206ABF2 - _0206ABDE - 2 ; case 0
	.short _0206AC28 - _0206ABDE - 2 ; case 1
	.short _0206AC36 - _0206ABDE - 2 ; case 2
	.short _0206AC98 - _0206ABDE - 2 ; case 3
	.short _0206ACD6 - _0206ABDE - 2 ; case 4
	.short _0206AD44 - _0206ABDE - 2 ; case 5
	.short _0206ADA4 - _0206ABDE - 2 ; case 6
	.short _0206ADCA - _0206ABDE - 2 ; case 7
	.short _0206ADFA - _0206ABDE - 2 ; case 8
	.short _0206AE50 - _0206ABDE - 2 ; case 9
_0206ABF2:
	add r0, r6, #0
	mov r1, #1
	bl sub_02067A80
	ldrh r0, [r5, #0x3c]
	ldrh r1, [r5, #0x3e]
	bl sub_02014904
	ldrh r2, [r5, #0x36]
	ldrh r1, [r5, #0x34]
	ldrh r0, [r5, #0x32]
	str r0, [sp, #0x40]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x44]
	mov r0, #1
	str r1, [sp, #0x48]
	str r0, [sp, #0x50]
	str r2, [sp, #0x4c]
	add r0, r7, #0
	add r1, sp, #0x40
	bl sub_020537A8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206AEA2
_0206AC28:
	add r0, r7, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206AEA2
_0206AC36:
	ldr r0, [r6, #0x24]
	bl sub_0206AFD0
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0206AF78
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0206B880
	ldr r1, _0206AEA8 ; =0xBCFC0304
	ldr r0, _0206AEAC ; =_021DA51C
	str r1, [r0, #0x20]
	add r0, r6, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	add r5, #0x30
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldrb r1, [r5]
	ldr r0, [r6, #0x40]
	bl sub_0206B82C
	ldr r0, [r6, #0x40]
	bl sub_0205C6DC
	add r1, sp, #0x34
	bl sub_0205F96C
	mov r0, #2
	ldr r1, [sp, #0x38]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x38]
	ldr r0, [r6, #0x40]
	bl sub_0205C6DC
	add r1, sp, #0x34
	bl sub_0205F97C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206AEA2
_0206AC98:
	ldr r0, [r6, #0x3c]
	bl sub_0205F1A0
	add r1, r0, #0
	ldr r0, [r6, #0x3c]
	bl ov01_021F9FB0
	add r0, r6, #0
	add r0, #0xc8
	ldr r0, [r0]
	bl ov01_022043D8
	add r0, r6, #0
	add r0, #0xc8
	ldr r0, [r0]
	bl ov01_02204424
	ldr r0, [r6, #4]
	ldr r0, [r0, #0x10]
	bl ov01_021EB1E8
	add r5, #0x44
	ldrh r0, [r5]
	cmp r0, #0
	beq _0206ACD0
	mov r0, #6
	str r0, [r4]
	b _0206AEA2
_0206ACD0:
	mov r0, #4
	str r0, [r4]
	b _0206AEA2
_0206ACD6:
	ldrb r1, [r4, #0xc]
	add r2, r5, #0
	add r2, #0x6c
	lsl r1, r1, #2
	ldrh r7, [r2, r1]
	add r3, r2, r1
	cmp r7, #0
	beq _0206AD36
	ldr r2, _0206AEB0 ; =0x020FF468
	mov r0, #1
	str r0, [sp]
	ldrh r0, [r5, #0x34]
	ldrh r2, [r2, r1]
	add r0, r0, r2
	ldr r2, _0206AEB4 ; =0x020FF46A
	str r0, [sp, #4]
	ldrh r0, [r5, #0x36]
	ldrh r1, [r2, r1]
	add r0, r0, r1
	str r0, [sp, #8]
	ldrb r0, [r3, #3]
	add r1, r7, #0
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #3]
	ldr r0, [r6, #0x3c]
	lsl r3, r3, #0x1e
	lsr r3, r3, #0x1f
	bl sub_0206AEC0
	ldrb r1, [r4, #0xc]
	ldr r2, [r4, #8]
	lsl r1, r1, #2
	add r1, r2, r1
	add r1, #0x9c
	str r0, [r1]
	ldrb r0, [r4, #0xc]
	ldr r1, [r4, #8]
	lsl r0, r0, #2
	add r0, r1, r0
	add r0, #0x9c
	ldr r0, [r0]
	ldr r1, _0206AEB8 ; =0x021F7919
	bl sub_0205F47C
	b _0206AD3E
_0206AD36:
	add r0, r0, r1
	mov r2, #0
	add r0, #0x9c
	str r2, [r0]
_0206AD3E:
	mov r0, #5
	str r0, [r4]
	b _0206AEA2
_0206AD44:
	ldrb r1, [r4, #0xc]
	lsl r1, r1, #2
	add r0, r0, r1
	add r0, #0x9c
	ldr r6, [r0]
	cmp r6, #0
	beq _0206AD84
	add r0, r6, #0
	bl ov01_0220553C
	cmp r0, #0
	beq _0206AD64
	mov r0, #1
	add r1, r6, #0
	bl ov01_021F902C
_0206AD64:
	add r0, r6, #0
	add r1, sp, #0x28
	bl sub_0205F96C
	mov r0, #2
	ldr r1, [sp, #0x2c]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x2c]
	add r0, r6, #0
	add r1, sp, #0x28
	bl sub_0205F97C
	add r0, r6, #0
	bl sub_0205F484
_0206AD84:
	ldrb r0, [r4, #0xc]
	add r0, r0, #1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0xc]
	ldrb r0, [r5, #7]
	cmp r1, r0
	blo _0206AD9E
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x54
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0206AD9E:
	mov r0, #4
	str r0, [r4]
	b _0206AEA2
_0206ADA4:
	ldrh r0, [r5, #0x36]
	add r1, r5, #0
	add r1, #0x44
	str r0, [sp]
	mov r0, #0xf9
	str r0, [sp, #4]
	ldrh r3, [r5, #0x34]
	ldrh r1, [r1]
	ldr r0, [r6, #0x3c]
	mov r2, #1
	add r3, r3, #2
	bl sub_0206AF08
	ldr r1, [r4, #8]
	add r1, #0x9c
	str r0, [r1]
	mov r0, #7
	str r0, [r4]
	b _0206AEA2
_0206ADCA:
	add r0, #0x9c
	ldr r0, [r0]
	add r1, sp, #0x1c
	bl sub_0205F96C
	mov r0, #2
	ldr r1, [sp, #0x20]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x20]
	ldr r0, [r4, #8]
	add r1, sp, #0x1c
	add r0, #0x9c
	ldr r0, [r0]
	bl sub_0205F97C
	ldr r0, [r4, #8]
	add r0, #0x9c
	ldr r0, [r0]
	bl sub_0205F484
	mov r0, #8
	str r0, [r4]
	b _0206AEA2
_0206ADFA:
	add r1, r5, #0
	add r1, #0x6c
	ldrh r1, [r1]
	add r3, r5, #0
	add r3, #0x6c
	cmp r1, #0
	beq _0206AE44
	mov r0, #1
	str r0, [sp]
	ldrh r0, [r5, #0x34]
	add r0, r0, #1
	str r0, [sp, #4]
	ldrh r2, [r5, #0x36]
	ldr r0, _0206AEBC ; =0x0000FFFF
	add r0, r2, r0
	str r0, [sp, #8]
	ldrb r0, [r3, #3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #3]
	ldr r0, [r6, #0x3c]
	lsl r3, r3, #0x1e
	lsr r3, r3, #0x1f
	bl sub_0206AEC0
	ldr r1, [r4, #8]
	add r1, #0xa0
	str r0, [r1]
	ldr r0, [r4, #8]
	ldr r1, _0206AEB8 ; =0x021F7919
	add r0, #0xa0
	ldr r0, [r0]
	bl sub_0205F47C
	b _0206AE4A
_0206AE44:
	mov r1, #0
	add r0, #0xa0
	str r1, [r0]
_0206AE4A:
	mov r0, #9
	str r0, [r4]
	b _0206AEA2
_0206AE50:
	add r0, #0xa0
	ldr r0, [r0]
	cmp r0, #0
	beq _0206AE96
	add r1, sp, #0x10
	bl sub_0205F96C
	mov r0, #2
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x14]
	ldr r0, [r4, #8]
	add r1, sp, #0x10
	add r0, #0xa0
	ldr r0, [r0]
	bl sub_0205F97C
	ldr r0, [r4, #8]
	add r0, #0xa0
	ldr r0, [r0]
	bl sub_0205F484
	ldr r0, [r4, #8]
	add r0, #0xa0
	ldr r5, [r0]
	add r0, r5, #0
	bl ov01_0220553C
	cmp r0, #0
	beq _0206AE96
	mov r0, #1
	add r1, r5, #0
	bl ov01_021F902C
_0206AE96:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x54
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0206AEA2:
	mov r0, #0
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0206AEA8: .word 0xBCFC0304
_0206AEAC: .word _021DA51C
_0206AEB0: .word 0x020FF468
_0206AEB4: .word 0x020FF46A
_0206AEB8: .word 0x021F7919
_0206AEBC: .word 0x0000FFFF
	thumb_func_end sub_0206ABB0

	thumb_func_start sub_0206AEC0
sub_0206AEC0: ; 0x0206AEC0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r2, #0
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r3, #0
	bl sub_02069D70
	add r1, r0, #0
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x18]
	str r0, [sp]
	mov r0, #0xfd
	str r0, [sp, #4]
	ldr r3, [sp, #0x1c]
	add r0, r4, #0
	bl sub_0206AF08
	mov r1, #0
	mov r2, #2
	add r4, r0, #0
	bl sub_0205F2D0
	lsl r2, r6, #0x18
	ldr r3, [sp, #0x24]
	add r0, r4, #0
	add r1, r5, #0
	lsr r2, r2, #0x18
	bl sub_02069EE8
	add r0, r4, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0206AEC0

	thumb_func_start sub_0206AF08
sub_0206AF08: ; 0x0206AF08
	push {r3, r4, lr}
	sub sp, #0xc
	str r1, [sp]
	mov r1, #0
	add r4, r2, #0
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	add r1, r3, #0
	ldr r2, [sp, #0x18]
	add r3, r4, #0
	bl sub_0205E294
	add r4, r0, #0
	bne _0206AF2A
	bl GF_AssertFail
_0206AF2A:
	ldr r1, [sp, #0x1c]
	add r0, r4, #0
	bl sub_0205F248
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F268
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F270
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl sub_0205F318
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl sub_0205F320
	mov r1, #9
	add r0, r4, #0
	lsl r1, r1, #0xa
	bl sub_0205F20C
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #6
	bl sub_0205F214
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F89C
	add r0, r4, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end sub_0206AF08

	thumb_func_start sub_0206AF78
sub_0206AF78: ; 0x0206AF78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x40]
	bl sub_0205C6DC
	add r4, sp, #0
	add r6, sp, #4
	mov r7, #1
_0206AF8E:
	ldr r0, [r5, #0x3c]
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0205EEF4
	cmp r0, #0
	bne _0206AF8E
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206AF78

	thumb_func_start sub_0206AFA4
sub_0206AFA4: ; 0x0206AFA4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r0, #0xcb
	ldrb r0, [r0]
	mov r4, #0
	cmp r0, #0
	ble _0206AFCC
	add r5, r6, #0
_0206AFB4:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	beq _0206AFBE
	bl sub_0205E3CC
_0206AFBE:
	add r0, r6, #0
	add r0, #0xcb
	ldrb r0, [r0]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0206AFB4
_0206AFCC:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0206AFA4

	thumb_func_start sub_0206AFD0
sub_0206AFD0: ; 0x0206AFD0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0206B008 ; =0x021100C4
	add r1, r4, #0
	ldr r0, [r0]
	bl sub_020235D4
	ldr r0, _0206B00C ; =0x021100C8
	add r1, r4, #0
	bl sub_02023558
	ldr r0, _0206B008 ; =0x021100C4
	add r1, r4, #0
	ldrh r0, [r0, #0xe]
	bl sub_02023494
	ldr r0, _0206B008 ; =0x021100C4
	add r1, r4, #0
	ldrh r0, [r0, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020233D8
	ldr r0, _0206B010 ; =0x021100DC
	add r1, r4, #0
	bl sub_02023514
	pop {r4, pc}
	.balign 4, 0
_0206B008: .word 0x021100C4
_0206B00C: .word 0x021100C8
_0206B010: .word 0x021100DC
	thumb_func_end sub_0206AFD0

	thumb_func_start sub_0206B014
sub_0206B014: ; 0x0206B014
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl ScriptEnvironment_GetSav2Ptr
	add r7, r0, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r6, r0, #0
	add r0, r7, #0
	bl SavArray_PlayerParty_get
	str r0, [sp, #8]
	add r0, r5, #0
	bl sub_0202FB98
	add r0, sp, #0x2c
	bl GF_RTC_CopyDate
	ldr r0, [sp, #0x34]
	ldr r3, [sp, #0x30]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x10
	ldr r0, [sp, #0x2c]
	lsl r3, r3, #0x18
	lsl r0, r0, #0x18
	lsr r3, r3, #8
	orr r0, r3
	ldr r2, [sp, #0x38]
	orr r0, r1
	orr r0, r2
	str r0, [r5, #0x38]
	ldr r0, [sp, #8]
	bl GetPartyCount
	str r0, [sp, #0xc]
	add r0, r6, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r5, #0
	add r0, #8
	bl CopyU16StringArray
	add r0, r6, #0
	bl PlayerProfile_GetTrainerGender
	ldrb r1, [r5, #4]
	mov r2, #1
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #1
	and r0, r2
	orr r0, r1
	strb r0, [r5, #4]
	ldr r0, [r4, #0x40]
	bl sub_0205C700
	add r1, r5, #0
	add r1, #0x30
	strb r0, [r1]
	ldr r0, [sp, #0x50]
	strh r0, [r5, #0x34]
	ldr r0, [sp, #0x54]
	strh r0, [r5, #0x36]
	ldr r0, [sp, #4]
	strh r0, [r5, #0x32]
	ldrb r1, [r5, #4]
	mov r0, #0xfe
	bic r1, r0
	ldr r0, [sp]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x18
	orr r0, r1
	strb r0, [r5, #4]
	add r0, sp, #0x20
	bl GF_RTC_CopyTime
	ldr r0, [sp, #0x20]
	add r1, r5, #0
	strh r0, [r5, #0x3c]
	ldr r0, [sp, #0x24]
	add r1, #0x48
	strh r0, [r5, #0x3e]
	ldr r0, _0206B26C ; =0x021100C4
	mov r2, #0x24
	bl MI_CpuCopy8
	add r0, r5, #0
	ldr r1, [sp, #0x58]
	add r0, #0x40
	strh r1, [r0]
	add r0, r5, #0
	ldr r1, [sp, #0x5c]
	add r0, #0x42
	strh r1, [r0]
	add r1, sp, #0x40
	add r0, r5, #0
	ldrh r2, [r1, #0x20]
	add r0, #0x46
	strh r2, [r0]
	add r0, r5, #0
	ldrh r1, [r1, #0x24]
	add r0, #0x44
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0206B0FE
	mov r0, #1
	b _0206B100
_0206B0FE:
	ldr r0, [sp, #0xc]
_0206B100:
	strb r0, [r5, #7]
	ldr r0, [sp, #8]
	bl GetFirstAliveMonInParty_CrashIfNone
	add r2, r5, #0
	mov r1, #0x75
	add r2, #0x18
	add r4, r0, #0
	bl GetMonData
	add r0, r5, #0
	add r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	bne _0206B1D2
	ldr r0, [sp, #0xc]
	mov r7, #0
	cmp r0, #0
	bgt _0206B128
	b _0206B266
_0206B128:
	mov r0, #1
	str r0, [sp, #0x1c]
	mov r0, #2
	str r0, [sp, #0x18]
	mov r0, #1
	add r4, r5, #0
	str r0, [sp, #0x14]
	mov r0, #2
	add r4, #0x6f
	str r0, [sp, #0x10]
_0206B13C:
	ldr r0, [sp, #8]
	add r1, r7, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0206B172
	add r1, r5, #0
	add r1, #0x6c
	mov r0, #0
	strh r0, [r1]
	add r1, r5, #0
	add r1, #0x6e
	strb r0, [r1]
	ldrb r1, [r4]
	ldr r0, [sp, #0x14]
	bic r1, r0
	strb r1, [r4]
	ldrb r1, [r4]
	ldr r0, [sp, #0x10]
	bic r1, r0
	strb r1, [r4]
	b _0206B1C2
_0206B172:
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x6c
	strh r0, [r1]
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x6e
	strb r0, [r1]
	add r0, r6, #0
	bl MonIsShiny
	ldrb r1, [r4]
	ldr r2, [sp, #0x1c]
	bic r1, r2
	mov r2, #1
	and r0, r2
	orr r0, r1
	strb r0, [r4]
	add r0, r6, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r4]
	ldr r2, [sp, #0x18]
	lsr r0, r0, #0x1e
	bic r1, r2
	orr r0, r1
	strb r0, [r4]
_0206B1C2:
	ldr r0, [sp, #0xc]
	add r7, r7, #1
	add r5, r5, #4
	add r4, r4, #4
	cmp r7, r0
	blt _0206B13C
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
_0206B1D2:
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x6c
	strh r0, [r1]
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x6e
	strb r0, [r1]
	add r0, r4, #0
	bl MonIsShiny
	add r1, r5, #0
	add r1, #0x6f
	ldrb r2, [r1]
	mov r1, #1
	bic r2, r1
	mov r1, #1
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	add r0, r5, #0
	add r0, #0x6f
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x6f
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	add r2, r5, #0
	add r2, #0x6f
	ldrb r1, [r1]
	mov r3, #2
	lsr r0, r0, #0x1e
	bic r1, r3
	orr r1, r0
	add r0, r5, #0
	add r0, #0x6f
	strb r1, [r0]
	add r1, r5, #4
	mov r3, #1
	add r2, r2, #4
	mov r0, #0
	mov r5, #1
	mov r6, #2
_0206B244:
	add r4, r1, #0
	add r4, #0x6c
	strh r0, [r4]
	add r4, r1, #0
	add r4, #0x6e
	strb r0, [r4]
	ldrb r4, [r2]
	add r3, r3, #1
	add r1, r1, #4
	bic r4, r5
	strb r4, [r2]
	ldrb r4, [r2]
	bic r4, r6
	strb r4, [r2]
	add r2, r2, #4
	cmp r3, #6
	blt _0206B244
_0206B266:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_0206B26C: .word 0x021100C4
	thumb_func_end sub_0206B014

	thumb_func_start sub_0206B270
sub_0206B270: ; 0x0206B270
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	add r6, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r4, r0, #0
	ldrb r1, [r4, #0x14]
	cmp r1, #0x14
	bls _0206B28C
	b _0206B824
_0206B28C:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0206B298: ; jump table
	.short _0206B2C2 - _0206B298 - 2 ; case 0
	.short _0206B2C8 - _0206B298 - 2 ; case 1
	.short _0206B2DC - _0206B298 - 2 ; case 2
	.short _0206B30A - _0206B298 - 2 ; case 3
	.short _0206B316 - _0206B298 - 2 ; case 4
	.short _0206B332 - _0206B298 - 2 ; case 5
	.short _0206B346 - _0206B298 - 2 ; case 6
	.short _0206B3AA - _0206B298 - 2 ; case 7
	.short _0206B416 - _0206B298 - 2 ; case 8
	.short _0206B480 - _0206B298 - 2 ; case 9
	.short _0206B4A4 - _0206B298 - 2 ; case 10
	.short _0206B4DA - _0206B298 - 2 ; case 11
	.short _0206B52C - _0206B298 - 2 ; case 12
	.short _0206B57E - _0206B298 - 2 ; case 13
	.short _0206B5A0 - _0206B298 - 2 ; case 14
	.short _0206B5BC - _0206B298 - 2 ; case 15
	.short _0206B74A - _0206B298 - 2 ; case 16
	.short _0206B768 - _0206B298 - 2 ; case 17
	.short _0206B794 - _0206B298 - 2 ; case 18
	.short _0206B7A0 - _0206B298 - 2 ; case 19
	.short _0206B81A - _0206B298 - 2 ; case 20
_0206B2C2:
	mov r0, #1
	strb r0, [r4, #0x14]
	b _0206B824
_0206B2C8:
	add r0, r5, #0
	mov r1, #3
	bl sub_0203E33C
	add r0, r6, #0
	bl sub_0205525C
	mov r0, #2
	strb r0, [r4, #0x14]
	b _0206B824
_0206B2DC:
	add r0, r5, #0
	mov r1, #1
	bl sub_02067A80
	ldr r0, [r4, #0x40]
	ldrh r2, [r0, #0x34]
	ldrh r1, [r0, #0x36]
	ldrh r0, [r0, #0x32]
	str r0, [r4]
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #4]
	str r2, [r4, #8]
	str r1, [r4, #0xc]
	mov r0, #1
	str r0, [r4, #0x10]
	add r0, r6, #0
	add r1, r4, #0
	bl sub_020537A8
	mov r0, #3
	strb r0, [r4, #0x14]
	b _0206B824
_0206B30A:
	add r0, r6, #0
	bl sub_020552A4
	mov r0, #4
	strb r0, [r4, #0x14]
	b _0206B824
_0206B316:
	ldr r0, [r5, #0x24]
	bl sub_0206AFD0
	ldr r1, [r4, #0x40]
	add r0, r5, #0
	bl sub_0206AF78
	ldr r1, [r4, #0x40]
	add r0, r5, #0
	bl sub_0206B880
	mov r0, #5
	strb r0, [r4, #0x14]
	b _0206B824
_0206B332:
	ldr r0, [r5, #0x3c]
	bl sub_0205F1A0
	add r1, r0, #0
	ldr r0, [r5, #0x3c]
	bl ov01_021F9FB0
	mov r0, #6
	strb r0, [r4, #0x14]
	b _0206B824
_0206B346:
	add r0, r5, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	ldr r1, [r4, #0x40]
	lsl r0, r0, #0x18
	add r1, #0x30
	lsr r2, r0, #0x18
	ldrb r1, [r1]
	ldr r0, [r5, #0x40]
	bl sub_0206B82C
	ldr r0, [r5, #0x40]
	bl sub_0205C6DC
	add r1, sp, #0x54
	bl sub_0205F96C
	mov r0, #2
	ldr r1, [sp, #0x58]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x58]
	ldr r0, [r5, #0x40]
	bl sub_0205C6DC
	add r1, sp, #0x54
	bl sub_0205F97C
	ldr r0, [r4, #0x40]
	add r0, #0x44
	ldrh r0, [r0]
	cmp r0, #0
	beq _0206B39C
	mov r0, #9
	strb r0, [r4, #0x14]
	mov r0, #2
	add r4, #0xcb
	strb r0, [r4]
	b _0206B824
_0206B39C:
	mov r0, #7
	strb r0, [r4, #0x14]
	ldr r0, [r4, #0x40]
	add r4, #0xcb
	ldrb r0, [r0, #7]
	strb r0, [r4]
	b _0206B824
_0206B3AA:
	ldrb r0, [r4, #0x17]
	ldr r1, [r4, #0x40]
	lsl r2, r0, #2
	add r0, r1, #0
	add r0, #0x6c
	ldrh r7, [r0, r2]
	add r3, r0, r2
	cmp r7, #0
	beq _0206B404
	ldr r6, _0206B6FC ; =0x020FF468
	mov r0, #1
	str r0, [sp]
	ldrh r0, [r1, #0x34]
	ldrh r6, [r6, r2]
	add r0, r0, r6
	str r0, [sp, #4]
	ldrh r0, [r1, #0x36]
	ldr r1, _0206B700 ; =0x020FF46A
	ldrh r1, [r1, r2]
	add r0, r0, r1
	str r0, [sp, #8]
	ldrb r0, [r3, #3]
	add r1, r7, #0
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #3]
	ldr r0, [r5, #0x3c]
	lsl r3, r3, #0x1e
	lsr r3, r3, #0x1f
	bl sub_0206AEC0
	ldrb r1, [r4, #0x17]
	lsl r1, r1, #2
	add r1, r4, r1
	str r0, [r1, #0x18]
	ldrb r0, [r4, #0x17]
	ldr r1, _0206B704 ; =0x021F7919
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x18]
	bl sub_0205F47C
	b _0206B40A
_0206B404:
	mov r1, #0
	add r0, r4, r2
	str r1, [r0, #0x18]
_0206B40A:
	ldrb r0, [r4, #0x17]
	add r0, r0, #1
	strb r0, [r4, #0x17]
	mov r0, #8
	strb r0, [r4, #0x14]
	b _0206B824
_0206B416:
	ldrb r1, [r4, #0x15]
	add r0, r1, #1
	strb r0, [r4, #0x15]
	cmp r1, #4
	bls _0206B4AE
	ldrb r0, [r4, #0x17]
	sub r0, r0, #1
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r5, [r0, #0x18]
	cmp r5, #0
	beq _0206B460
	add r0, r5, #0
	bl ov01_0220553C
	cmp r0, #0
	beq _0206B440
	mov r0, #1
	add r1, r5, #0
	bl ov01_021F902C
_0206B440:
	add r0, r5, #0
	add r1, sp, #0x48
	bl sub_0205F96C
	mov r0, #2
	ldr r1, [sp, #0x4c]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x4c]
	add r0, r5, #0
	add r1, sp, #0x48
	bl sub_0205F97C
	add r0, r5, #0
	bl sub_0205F484
_0206B460:
	mov r2, #0
	strb r2, [r4, #0x15]
	ldr r0, [r4, #0x40]
	ldrb r1, [r4, #0x17]
	ldrb r0, [r0, #7]
	cmp r1, r0
	blo _0206B47A
	add r0, r4, #0
	add r0, #0xc8
	strh r2, [r0]
	mov r0, #0xd
	strb r0, [r4, #0x14]
	b _0206B824
_0206B47A:
	mov r0, #7
	strb r0, [r4, #0x14]
	b _0206B824
_0206B480:
	ldr r3, [r4, #0x40]
	mov r2, #1
	ldrh r0, [r3, #0x36]
	add r1, r3, #0
	add r1, #0x44
	str r0, [sp]
	mov r0, #0xf9
	str r0, [sp, #4]
	ldrh r3, [r3, #0x34]
	ldrh r1, [r1]
	ldr r0, [r5, #0x3c]
	add r3, r3, #2
	bl sub_0206AF08
	str r0, [r4, #0x18]
	mov r0, #0xa
	strb r0, [r4, #0x14]
	b _0206B824
_0206B4A4:
	ldrb r1, [r4, #0x15]
	add r0, r1, #1
	strb r0, [r4, #0x15]
	cmp r1, #4
	bhi _0206B4B0
_0206B4AE:
	b _0206B824
_0206B4B0:
	ldr r0, [r4, #0x18]
	add r1, sp, #0x3c
	bl sub_0205F96C
	mov r0, #2
	ldr r1, [sp, #0x40]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x40]
	ldr r0, [r4, #0x18]
	add r1, sp, #0x3c
	bl sub_0205F97C
	ldr r0, [r4, #0x18]
	bl sub_0205F484
	mov r0, #0
	strb r0, [r4, #0x15]
	mov r0, #0xb
	strb r0, [r4, #0x14]
	b _0206B824
_0206B4DA:
	ldr r0, [r4, #0x40]
	ldrb r1, [r4, #0x17]
	add r2, r0, #0
	add r2, #0x6c
	lsl r1, r1, #2
	add r3, r2, r1
	ldrh r1, [r2, r1]
	cmp r1, #0
	beq _0206B51E
	mov r2, #1
	str r2, [sp]
	ldrh r2, [r0, #0x34]
	add r2, r2, #1
	str r2, [sp, #4]
	ldrh r2, [r0, #0x36]
	ldr r0, _0206B708 ; =0x0000FFFF
	add r0, r2, r0
	str r0, [sp, #8]
	ldrb r0, [r3, #3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	str r0, [sp, #0xc]
	ldrb r2, [r3, #2]
	ldrb r3, [r3, #3]
	ldr r0, [r5, #0x3c]
	lsl r3, r3, #0x1e
	lsr r3, r3, #0x1f
	bl sub_0206AEC0
	ldr r1, _0206B704 ; =0x021F7919
	str r0, [r4, #0x1c]
	bl sub_0205F47C
	b _0206B526
_0206B51E:
	bl GF_AssertFail
	mov r0, #0
	str r0, [r4, #0x1c]
_0206B526:
	mov r0, #0xc
	strb r0, [r4, #0x14]
	b _0206B824
_0206B52C:
	ldrb r1, [r4, #0x15]
	add r0, r1, #1
	strb r0, [r4, #0x15]
	cmp r1, #4
	bls _0206B5C4
	ldr r5, [r4, #0x1c]
	cmp r5, #0
	beq _0206B56E
	add r0, r5, #0
	bl ov01_0220553C
	cmp r0, #0
	beq _0206B54E
	mov r0, #1
	add r1, r5, #0
	bl ov01_021F902C
_0206B54E:
	add r0, r5, #0
	add r1, sp, #0x30
	bl sub_0205F96C
	mov r0, #2
	ldr r1, [sp, #0x34]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x34]
	add r0, r5, #0
	add r1, sp, #0x30
	bl sub_0205F97C
	add r0, r5, #0
	bl sub_0205F484
_0206B56E:
	mov r1, #0
	add r0, r4, #0
	strb r1, [r4, #0x15]
	add r0, #0xc8
	strh r1, [r0]
	mov r0, #0xd
	strb r0, [r4, #0x14]
	b _0206B824
_0206B57E:
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	bl ov01_022043D8
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	bl ov01_02204424
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x10]
	bl ov01_021EB1E8
	mov r0, #0xe
	strb r0, [r4, #0x14]
	b _0206B824
_0206B5A0:
	ldr r0, [r5, #8]
	mov r1, #4
	bl sub_0206B8AC
	add r0, r6, #0
	bl sub_0205532C
	add r0, r4, #0
	mov r1, #0
	add r0, #0xca
	strb r1, [r0]
	mov r0, #0xf
	strb r0, [r4, #0x14]
	b _0206B824
_0206B5BC:
	add r0, #0xca
	ldrb r0, [r0]
	cmp r0, #7
	bls _0206B5C6
_0206B5C4:
	b _0206B824
_0206B5C6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206B5D2: ; jump table
	.short _0206B5E2 - _0206B5D2 - 2 ; case 0
	.short _0206B5F8 - _0206B5D2 - 2 ; case 1
	.short _0206B626 - _0206B5D2 - 2 ; case 2
	.short _0206B652 - _0206B5D2 - 2 ; case 3
	.short _0206B6BC - _0206B5D2 - 2 ; case 4
	.short _0206B6E2 - _0206B5D2 - 2 ; case 5
	.short _0206B710 - _0206B5D2 - 2 ; case 6
	.short _0206B726 - _0206B5D2 - 2 ; case 7
_0206B5E2:
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x1c]
	bl ov01_021FB514
	add r0, r4, #0
	add r0, #0xca
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xca
	strb r1, [r0]
_0206B5F8:
	add r0, r4, #0
	add r0, #0xc8
	ldrh r2, [r0]
	add r0, r4, #0
	add r0, #0xc8
	ldrh r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc8
	strh r1, [r0]
	cmp r2, #0x1e
	blo _0206B6EA
	add r0, r4, #0
	add r0, #0xca
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xca
	strb r1, [r0]
	mov r0, #0
	add r4, #0xc8
	strh r0, [r4]
	b _0206B824
_0206B626:
	ldr r0, _0206B70C ; =0x0000091F
	bl PlaySE
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r2, #0
	str r0, [sp, #8]
	mov r0, #3
	mov r1, #8
	add r3, r2, #0
	bl sub_0200FA24
	add r0, r4, #0
	add r0, #0xca
	ldrb r0, [r0]
	add r4, #0xca
	add r0, r0, #1
	strb r0, [r4]
	b _0206B824
_0206B652:
	bl sub_0200FB5C
	cmp r0, #0
	beq _0206B6EA
	add r0, r5, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202FA64
	add r5, r0, #0
	bl sub_0202FA88
	add r6, r0, #0
	add r0, sp, #0x20
	bl GF_RTC_CopyDate
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x24]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x10
	ldr r0, [sp, #0x20]
	lsl r3, r3, #0x18
	ldr r2, [sp, #0x2c]
	lsl r0, r0, #0x18
	lsr r3, r3, #8
	orr r0, r3
	orr r0, r1
	add r1, r2, #0
	orr r1, r0
	ldr r0, [r4, #0x40]
	str r1, [r0, #0x38]
	add r0, sp, #0x14
	bl GF_RTC_CopyTime
	ldr r1, [sp, #0x14]
	ldr r0, [r4, #0x40]
	add r2, r6, #0
	strh r1, [r0, #0x3c]
	ldr r1, [sp, #0x18]
	ldr r0, [r4, #0x40]
	strh r1, [r0, #0x3e]
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x44
	bl sub_0202FAF0
	add r0, r4, #0
	add r0, #0xca
	ldrb r0, [r0]
	add r4, #0xca
	add r0, r0, #1
	strb r0, [r4]
	b _0206B824
_0206B6BC:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r2, #0
	str r0, [sp, #8]
	mov r0, #3
	mov r1, #9
	add r3, r2, #0
	bl sub_0200FA24
	add r0, r4, #0
	add r0, #0xca
	ldrb r0, [r0]
	add r4, #0xca
	add r0, r0, #1
	strb r0, [r4]
	b _0206B824
_0206B6E2:
	bl sub_0200FB5C
	cmp r0, #0
	bne _0206B6EC
_0206B6EA:
	b _0206B824
_0206B6EC:
	add r0, r4, #0
	add r0, #0xca
	ldrb r0, [r0]
	add r4, #0xca
	add r0, r0, #1
	strb r0, [r4]
	b _0206B824
	nop
_0206B6FC: .word 0x020FF468
_0206B700: .word 0x020FF46A
_0206B704: .word 0x021F7919
_0206B708: .word 0x0000FFFF
_0206B70C: .word 0x0000091F
_0206B710:
	ldr r0, [r5, #4]
	ldr r0, [r0, #0x1c]
	bl ov01_021FB4F4
	add r0, r4, #0
	add r0, #0xca
	ldrb r0, [r0]
	add r4, #0xca
	add r0, r0, #1
	strb r0, [r4]
	b _0206B824
_0206B726:
	add r0, r4, #0
	add r0, #0xc8
	ldrh r2, [r0]
	add r0, r4, #0
	add r0, #0xc8
	ldrh r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc8
	strh r1, [r0]
	cmp r2, #0x1e
	blo _0206B824
	add r0, r6, #0
	bl sub_020552E8
	mov r0, #0x10
	strb r0, [r4, #0x14]
	b _0206B824
_0206B74A:
	bl sub_020148F4
	add r0, r4, #0
	bl sub_0206AFA4
	add r0, r5, #0
	mov r1, #0
	bl sub_0203E33C
	add r0, r6, #0
	bl sub_0205525C
	mov r0, #0x11
	strb r0, [r4, #0x14]
	b _0206B824
_0206B768:
	add r0, r5, #0
	mov r1, #0
	bl sub_02067A80
	ldrh r3, [r4, #0x30]
	ldrh r2, [r4, #0x32]
	ldrh r1, [r4, #0x34]
	ldrh r0, [r4, #0x36]
	str r0, [r4]
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #4]
	str r3, [r4, #8]
	str r2, [r4, #0xc]
	str r1, [r4, #0x10]
	add r0, r6, #0
	add r1, r4, #0
	bl sub_020537A8
	mov r0, #0x12
	strb r0, [r4, #0x14]
	b _0206B824
_0206B794:
	add r0, r6, #0
	bl sub_020552A4
	mov r0, #0x13
	strb r0, [r4, #0x14]
	b _0206B824
_0206B7A0:
	add r0, r5, #0
	bl sub_02069F88
	cmp r0, #0
	beq _0206B814
	ldr r0, [r5, #0x40]
	bl sub_0205C700
	cmp r0, #1
	beq _0206B814
	add r0, r5, #0
	bl sub_02069D68
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl sub_0205C6DC
	add r2, r4, #0
	add r2, #0xd8
	add r1, r4, #0
	add r5, r0, #0
	ldrb r2, [r2]
	add r0, r6, #0
	add r1, #0xcc
	bl sub_0205FBC0
	add r0, r5, #0
	bl sub_0205F914
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl sub_0205F934
	add r7, r0, #0
	add r0, r6, #0
	bl sub_0205F914
	add r5, r0, #0
	add r0, r6, #0
	bl sub_0205F934
	ldr r1, [sp, #0x10]
	cmp r1, r5
	bne _0206B806
	cmp r7, r0
	bne _0206B806
	add r0, r6, #0
	mov r1, #1
	bl sub_02069DC8
	b _0206B80E
_0206B806:
	add r0, r6, #0
	mov r1, #0
	bl sub_02069DC8
_0206B80E:
	add r0, r6, #0
	bl sub_0205F484
_0206B814:
	mov r0, #0x14
	strb r0, [r4, #0x14]
	b _0206B824
_0206B81A:
	bl FreeToHeap
	add sp, #0x60
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206B824:
	mov r0, #0
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206B270

	thumb_func_start sub_0206B82C
sub_0206B82C: ; 0x0206B82C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	bl sub_0205C898
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205C6DC
	add r4, r0, #0
	bl sub_0205F35C
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0205F25C
	str r0, [sp]
	add r0, r4, #0
	bl sub_0205E420
	ldr r1, [sp]
	add r0, r7, #0
	add r2, r4, #0
	bl ov01_021FA108
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0205E38C
	add r0, r5, #0
	bl sub_0205C790
	cmp r0, #0
	beq _0206B876
	bl ov01_021F1640
_0206B876:
	add r0, r5, #0
	mov r1, #0
	bl sub_0205C78C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206B82C

	thumb_func_start sub_0206B880
sub_0206B880: ; 0x0206B880
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r4, #0
	mov r7, #1
_0206B88A:
	lsl r0, r4, #1
	add r0, r5, r0
	add r0, #0x40
	ldrh r1, [r0]
	cmp r1, #0
	beq _0206B89E
	add r0, r6, #0
	add r2, r7, #0
	bl sub_02054EB0
_0206B89E:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _0206B88A
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206B880

	thumb_func_start sub_0206B8AC
sub_0206B8AC: ; 0x0206B8AC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0
	str r1, [sp]
	ldr r0, _0206B90C ; =0x00000107
	add r2, r1, #0
	add r3, r1, #0
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	ldr r0, _0206B90C ; =0x00000107
	add r2, r5, #0
	mov r3, #2
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #8
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r1, #2
	ldr r0, _0206B90C ; =0x00000107
	add r2, r5, #0
	add r3, r1, #0
	str r4, [sp, #0xc]
	bl GfGfxLoader_LoadScrnData
	add r0, r5, #0
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	mov r0, #2
	mov r1, #0
	bl sub_0201BB68
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0206B90C: .word 0x00000107
	thumb_func_end sub_0206B8AC

	thumb_func_start sub_0206B910
sub_0206B910: ; 0x0206B910
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	bl sub_0205064C
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #0x14
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x14
	mov r0, #0
_0206B92C:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0206B92C
	mov r0, #0xb
	mov r1, #0x34
	str r5, [r4, #0xc]
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x34
	str r0, [r4, #4]
	bl memset
	add r0, r5, #0
	bl Sav2_PlayerData_GetOptionsAddr
	ldr r1, [r4, #4]
	str r0, [r1, #0x24]
	ldr r0, [r4, #4]
	str r5, [r0, #0x28]
	mov r0, #0x43
	lsl r0, r0, #2
	add r1, r6, r0
	ldr r0, [r4, #4]
	str r1, [r0, #0x2c]
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	str r0, [r4, #8]
	bl memset
	ldr r1, _0206B980 ; =sub_0206B984
	add r0, r7, #0
	add r2, r4, #0
	bl sub_02050530
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0206B980: .word sub_0206B984
	thumb_func_end sub_0206B910

	thumb_func_start sub_0206B984
sub_0206B984: ; 0x0206B984
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	bl sub_02050650
	add r7, r0, #0
	ldr r0, [sp]
	ldr r6, [r7, #4]
	bl sub_0205064C
	add r5, r0, #0
	ldr r0, [r7, #0x10]
	cmp r0, #6
	bls _0206B9A2
	b _0206BB1C
_0206B9A2:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206B9AE: ; jump table
	.short _0206B9BC - _0206B9AE - 2 ; case 0
	.short _0206BA20 - _0206B9AE - 2 ; case 1
	.short _0206BA30 - _0206B9AE - 2 ; case 2
	.short _0206BA4E - _0206B9AE - 2 ; case 3
	.short _0206BA96 - _0206B9AE - 2 ; case 4
	.short _0206BAF8 - _0206B9AE - 2 ; case 5
	.short _0206BB04 - _0206B9AE - 2 ; case 6
_0206B9BC:
	ldr r0, [sp]
	bl sub_0205525C
	ldr r0, [r7, #0xc]
	bl Sav2_SealCase_get
	str r0, [r6, #0x20]
	add r0, r6, #0
	mov r1, #0
	add r0, #0x31
	strb r1, [r0]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r6, #0x2c]
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r6, #0x1c]
	bl GetPartyCount
	mov r4, #0
	str r0, [sp, #4]
	str r0, [r6]
	cmp r0, #0
	ble _0206BA06
	add r5, r6, #0
_0206B9F2:
	ldr r0, [r6, #0x1c]
	add r1, r4, #0
	bl GetPartyMonByIndex
	str r0, [r5, #4]
	ldr r0, [sp, #4]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0206B9F2
_0206BA06:
	cmp r4, #6
	bge _0206BA1A
	lsl r0, r4, #2
	add r1, r6, r0
	mov r0, #0
_0206BA10:
	add r4, r4, #1
	str r0, [r1, #4]
	add r1, r1, #4
	cmp r4, #6
	blt _0206BA10
_0206BA1A:
	mov r0, #1
	str r0, [r7, #0x10]
	b _0206BB1C
_0206BA20:
	ldr r0, [sp]
	ldr r1, _0206BB24 ; =0x020FF480
	add r2, r6, #0
	bl sub_02050624
	mov r0, #2
	str r0, [r7, #0x10]
	b _0206BB1C
_0206BA30:
	ldr r0, [r7, #4]
	add r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	beq _0206BA42
	cmp r0, #1
	beq _0206BA48
	bl GF_AssertFail
_0206BA42:
	mov r0, #5
	str r0, [r7, #0x10]
	b _0206BB1C
_0206BA48:
	mov r0, #3
	str r0, [r7, #0x10]
	b _0206BB1C
_0206BA4E:
	ldr r4, [r7, #8]
	ldr r0, [r6, #0x1c]
	str r0, [r4]
	ldr r0, [r7, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r7, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x26
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x25
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0xf
	add r0, #0x24
	strb r1, [r0]
	ldr r0, [r6, #0x24]
	add r1, #0xfd
	str r0, [r4, #0xc]
	add r0, r5, r1
	str r5, [r4, #0x1c]
	str r0, [r4, #0x20]
	ldr r0, [sp]
	ldr r1, _0206BB28 ; =0x0210159C
	add r2, r4, #0
	bl sub_02050624
	mov r0, #4
	str r0, [r7, #0x10]
	b _0206BB1C
_0206BA96:
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	add r0, #0x30
	ldrb r0, [r0]
	add r1, #0x26
	add r0, r0, #1
	str r0, [sp, #8]
	ldrb r0, [r1]
	cmp r0, #7
	beq _0206BAF2
	ldr r1, [r7, #4]
	lsl r0, r0, #2
	add r0, r1, r0
	ldr r4, [r0, #4]
	mov r1, #0xa2
	add r0, r4, #0
	add r2, sp, #8
	bl SetMonData
	ldr r1, [sp, #8]
	ldr r0, [r6, #0x20]
	sub r1, r1, #1
	bl SealCase_GetCapsuleI
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0xab
	bl SetMonData
	ldr r1, [sp, #8]
	ldr r0, [r6, #0x20]
	sub r1, r1, #1
	bl SealCase_GetCapsuleI
	mov r1, #0
	bl CapsuleGetSealI
	bl SealOnCapsuleGetID
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0209106C
	ldr r0, [r5, #0xc]
	bl sub_020270C4
_0206BAF2:
	mov r0, #1
	str r0, [r7, #0x10]
	b _0206BB1C
_0206BAF8:
	ldr r0, [sp]
	bl sub_020552A4
	mov r0, #6
	str r0, [r7, #0x10]
	b _0206BB1C
_0206BB04:
	ldr r0, [r7, #8]
	bl FreeToHeap
	ldr r0, [r7, #4]
	bl FreeToHeap
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0206BB1C:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0206BB24: .word 0x020FF480
_0206BB28: .word 0x0210159C
	thumb_func_end sub_0206B984

	thumb_func_start ScrCmd_232
ScrCmd_232: ; 0x0206BB2C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r1, r0, #0
	lsl r1, r1, #0x18
	ldr r0, [r4]
	lsr r1, r1, #0x18
	bl sub_0206BCA4
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_232

	thumb_func_start ScrCmd_233
ScrCmd_233: ; 0x0206BB5C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [r4, #0x64]
	ldr r1, _0206BB8C ; =sub_0206BB90
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_0206BB8C: .word sub_0206BB90
	thumb_func_end ScrCmd_233

	thumb_func_start sub_0206BB90
sub_0206BB90: ; 0x0206BB90
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	ldr r1, [r4, #0x64]
	ldr r0, [r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_0206BCB4
	pop {r4, pc}
	thumb_func_end sub_0206BB90

	thumb_func_start ScrCmd_234
ScrCmd_234: ; 0x0206BBAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, sp, #4
	strb r7, [r1]
	ldr r0, [sp]
	strb r6, [r1, #1]
	add r5, #0x80
	strb r0, [r1, #2]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	str r0, [sp, #0x1c]
	add r0, sp, #4
	bl sub_0206BCEC
	str r0, [r4]
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_234

	thumb_func_start ScrCmd_235
ScrCmd_235: ; 0x0206BC2C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	ldr r0, [r4]
	bl sub_0206BD00
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_235

	thumb_func_start ScrCmd_236
ScrCmd_236: ; 0x0206BC64
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	mov r1, #0
	strh r1, [r0]
	add r0, r1, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_236

	thumb_func_start ScrCmd_237
ScrCmd_237: ; 0x0206BC8C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	mov r0, #1
	bl sub_02002C60
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_237

	thumb_func_start sub_0206BCA4
sub_0206BCA4: ; 0x0206BCA4
	push {r3, lr}
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0206BCB2
	add r0, r1, #0
	bl sub_02037AC0
_0206BCB2:
	pop {r3, pc}
	thumb_func_end sub_0206BCA4

	thumb_func_start sub_0206BCB4
sub_0206BCB4: ; 0x0206BCB4
	push {r3, lr}
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _0206BCC0
	mov r0, #1
	pop {r3, pc}
_0206BCC0:
	add r0, r1, #0
	bl sub_02037B38
	cmp r0, #1
	bne _0206BCCE
	mov r0, #1
	pop {r3, pc}
_0206BCCE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206BCB4

	thumb_func_start sub_0206BCD4
sub_0206BCD4: ; 0x0206BCD4
	push {r4, lr}
	mov r0, #0x14
	add r1, r0, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x14
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_0206BCD4

	thumb_func_start sub_0206BCEC
sub_0206BCEC: ; 0x0206BCEC
	push {r3, lr}
	mov r2, #1
	mov r0, #0xb
	mov r1, #0x14
	lsl r2, r2, #0xe
	bl CreateHeap
	bl sub_0206BCD4
	pop {r3, pc}
	thumb_func_end sub_0206BCEC

	thumb_func_start sub_0206BD00
sub_0206BD00: ; 0x0206BD00
	push {r3, lr}
	bl FreeToHeap
	mov r0, #0x14
	bl DestroyHeap
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206BD00

	thumb_func_start sub_0206BD10
sub_0206BD10: ; 0x0206BD10
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	bl sub_0203B958
	mov r1, #0x4e
	ldr r2, [r0]
	lsl r1, r1, #2
	cmp r2, r1
	beq _0206BD2A
	mov r0, #0
	pop {r3, pc}
_0206BD2A:
	ldr r1, [r0, #8]
	cmp r1, #6
	bne _0206BD3C
	ldr r1, [r0, #0xc]
	cmp r1, #3
	bne _0206BD3C
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _0206BD40
_0206BD3C:
	mov r0, #0
	pop {r3, pc}
_0206BD40:
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206BD10

	thumb_func_start sub_0206BD44
sub_0206BD44: ; 0x0206BD44
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	bl sub_0203B958
	ldr r2, [r0]
	ldr r1, _0206BD78 ; =0x0000013A
	cmp r2, r1
	beq _0206BD5C
	mov r0, #0
	pop {r3, pc}
_0206BD5C:
	ldr r1, [r0, #8]
	cmp r1, #6
	bne _0206BD6E
	ldr r1, [r0, #0xc]
	cmp r1, #3
	bne _0206BD6E
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _0206BD72
_0206BD6E:
	mov r0, #0
	pop {r3, pc}
_0206BD72:
	mov r0, #1
	pop {r3, pc}
	nop
_0206BD78: .word 0x0000013A
	thumb_func_end sub_0206BD44

	thumb_func_start sub_0206BD7C
sub_0206BD7C: ; 0x0206BD7C
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl sub_0203B9C4
	bl sub_0203B958
	mov r1, #0x4f
	ldr r2, [r0]
	lsl r1, r1, #2
	cmp r2, r1
	beq _0206BD96
	mov r0, #0
	pop {r3, pc}
_0206BD96:
	ldr r1, [r0, #8]
	cmp r1, #6
	bne _0206BDA8
	ldr r1, [r0, #0xc]
	cmp r1, #3
	bne _0206BDA8
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _0206BDAC
_0206BDA8:
	mov r0, #0
	pop {r3, pc}
_0206BDAC:
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206BD7C

	thumb_func_start sub_0206BDB0
sub_0206BDB0: ; 0x0206BDB0
	push {r3, lr}
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetBoxMon
	pop {r3, pc}
	thumb_func_end sub_0206BDB0

	thumb_func_start sub_0206BDBC
sub_0206BDBC: ; 0x0206BDBC
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	add r6, r0, #0
	add r5, r4, #0
	mov r7, #5
_0206BDC6:
	add r0, r6, #0
	add r1, r5, #0
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetBoxMon
	add r1, r7, #0
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0206BDE4
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0206BDE4:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _0206BDC6
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206BDBC

	thumb_func_start sub_0206BDF4
sub_0206BDF4: ; 0x0206BDF4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0206BE30 ; =_021D4218
	mov r4, #0
	str r5, [r0]
	mov r6, #5
	add r7, r4, #0
_0206BE02:
	add r0, r5, #0
	add r1, r4, #0
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetBoxMon
	add r1, r6, #0
	add r2, r7, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0206BE1E
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206BE1E:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _0206BE02
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0206BE30: .word _021D4218
	thumb_func_end sub_0206BDF4

	thumb_func_start sub_0206BE34
sub_0206BE34: ; 0x0206BE34
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r2, #0
	add r6, r0, #0
	str r1, [sp]
	add r7, r3, #0
	bl GetPartyMonByIndex
	add r4, r0, #0
	add r0, r5, #0
	bl DayCareMon_GetExtras
	str r0, [sp, #8]
	add r0, r5, #0
	bl DayCareMon_GetBoxMon
	str r0, [sp, #4]
	add r0, r7, #0
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetNamePtr
	add r2, sp, #0xc
	add r0, r4, #0
	mov r1, #0x75
	add r2, #2
	bl GetMonData
	add r0, r4, #0
	bl Mon_GetBoxMon
	bl sub_02070028
	cmp r0, #0
	beq _0206BE8A
	ldr r0, [sp, #8]
	bl DayCareMail_GetCapsule
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0xaa
	bl GetMonData
_0206BE8A:
	mov r1, #0
	add r0, sp, #0xc
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0xbb
	add r2, sp, #0xc
	bl SetMonData
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl CopyBoxPokemonToBoxPokemon
	ldr r0, [sp, #4]
	mov r1, #0
	bl BoxMon_UpdateShayminForme
	add r0, r5, #0
	mov r1, #0
	bl DayCareMon_SetSteps
	ldr r1, [sp]
	add r0, r6, #0
	bl RemoveMonFromParty
	ldr r1, _0206BED4 ; =0x000001B9
	add r0, r6, #0
	bl sub_020748CC
	cmp r0, #0
	bne _0206BED0
	add r0, r7, #0
	bl Sav2_Chatot_get
	bl Chatot_invalidate
_0206BED0:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0206BED4: .word 0x000001B9
	thumb_func_end sub_0206BE34

	thumb_func_start sub_0206BED8
sub_0206BED8: ; 0x0206BED8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r3, #0
	add r5, r0, #0
	add r0, r7, #0
	add r6, r1, #0
	add r4, r2, #0
	bl Sav2_GameStats_get
	mov r1, #0x29
	bl GameStats_Inc
	add r0, r4, #0
	bl sub_0206BDF4
	add r1, r0, #0
	add r0, r4, #0
	bl Sav2_DayCare_GetMonX
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl sub_0206BE34
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206BED8

	thumb_func_start sub_0206BF0C
sub_0206BF0C: ; 0x0206BF0C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	mov r1, #0
	bl Sav2_DayCare_GetMonX
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl Sav2_DayCare_GetMonX
	add r4, r0, #0
	add r0, r5, #0
	bl DayCareMon_GetBoxMon
	add r6, r0, #0
	add r0, r4, #0
	bl DayCareMon_GetBoxMon
	add r7, r0, #0
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0206BF5C
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0206BF5C
	add r0, r5, #0
	add r1, r4, #0
	bl DayCareMon_Copy
	add r0, r4, #0
	bl DayCareMon_init
_0206BF5C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206BF0C

	thumb_func_start sub_0206BF60
sub_0206BF60: ; 0x0206BF60
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #8]
	add r4, sp, #8
	add r6, sp, #4
	add r7, sp, #4
_0206BF72:
	add r0, r5, #0
	bl sub_02070DB4
	cmp r0, #0
	beq _0206BFB4
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl MonTryLearnMoveOnLevelUp
	cmp r0, #0
	beq _0206BFAA
_0206BF8E:
	ldr r1, _0206BFC0 ; =0x0000FFFF
	cmp r0, r1
	bne _0206BF9C
	ldrh r1, [r7]
	add r0, r5, #0
	bl DeleteMonFirstMoveAndAppend
_0206BF9C:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl MonTryLearnMoveOnLevelUp
	cmp r0, #0
	bne _0206BF8E
_0206BFAA:
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #0x64
	blt _0206BF72
_0206BFB4:
	add r0, r5, #0
	bl CalcMonLevelAndStats
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0206BFC0: .word 0x0000FFFF
	thumb_func_end sub_0206BF60

	thumb_func_start sub_0206BFC4
sub_0206BFC4: ; 0x0206BFC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r6, r1, #0
	mov r0, #4
	add r7, r2, #0
	bl AllocMonZeroed
	add r4, r0, #0
	add r0, r6, #0
	bl DayCareMon_GetBoxMon
	add r5, r0, #0
	add r0, r6, #0
	bl DayCareMon_GetExtras
	str r0, [sp, #4]
	add r0, r7, #0
	mov r1, #0
	add r2, r5, #0
	bl BufferBoxMonNickname
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	add r0, r5, #0
	add r1, r4, #0
	bl CopyBoxPokemonToPokemon
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	cmp r0, #0x64
	beq _0206C03C
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	add r0, r6, #0
	bl DayCareMon_GetSteps
	ldr r1, [sp, #8]
	add r2, sp, #8
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #8
	bl SetMonData
	add r0, r4, #0
	bl sub_0206BF60
_0206C03C:
	add r0, r5, #0
	bl sub_02070028
	cmp r0, #0
	beq _0206C056
	ldr r0, [sp, #4]
	bl DayCareMail_GetCapsule
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0xaa
	bl SetMonData
_0206C056:
	ldr r0, [sp]
	add r1, r4, #0
	bl AddMonToParty
	add r0, r5, #0
	bl ZeroBoxMonData
	add r0, r6, #0
	mov r1, #0
	bl DayCareMon_SetSteps
	add r0, r4, #0
	bl FreeToHeap
	add r0, r7, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0206BFC4

	thumb_func_start sub_0206C078
sub_0206C078: ; 0x0206C078
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	add r0, r6, #0
	add r1, r3, #0
	bl Sav2_DayCare_GetMonX
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0206BFC4
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r6, #0
	bl sub_0206BF0C
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0206C078

	thumb_func_start sub_0206C0A0
sub_0206C0A0: ; 0x0206C0A0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0xb
	add r5, r1, #0
	bl AllocMonZeroed
	add r7, r0, #0
	bl Mon_GetBoxMon
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl CopyPokemonToBoxPokemon
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp]
	add r0, r0, r5
	str r0, [sp]
	add r0, r4, #0
	mov r1, #8
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	bl CalcBoxMonLevel
	add r4, r0, #0
	add r0, r7, #0
	bl FreeToHeap
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206C0A0

	thumb_func_start sub_0206C0E8
sub_0206C0E8: ; 0x0206C0E8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl DayCareMon_GetBoxMon
	add r6, r0, #0
	bl CalcBoxMonLevel
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl DayCareMon_GetSteps
	add r1, r0, #0
	add r0, r6, #0
	bl sub_0206C0A0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	sub r0, r0, r4
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0206C0E8

	thumb_func_start sub_0206C110
sub_0206C110: ; 0x0206C110
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	add r5, r1, #0
	bl DayCareMon_GetBoxMon
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0206C0E8
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #3
	str r1, [sp, #4]
	bl BufferIntegerAsString
	add r0, r5, #0
	mov r1, #0
	add r2, r6, #0
	bl BufferBoxMonNickname
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0206C110

	thumb_func_start sub_0206C14C
sub_0206C14C: ; 0x0206C14C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	add r5, r1, #0
	bl DayCareMon_GetBoxMon
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0206C0E8
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r5, #0
	mov r1, #0
	add r2, r6, #0
	bl BufferBoxMonNickname
	add r1, r4, #1
	mov r0, #0x64
	mul r0, r1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #5
	str r1, [sp, #4]
	bl BufferIntegerAsString
	add r0, r4, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0206C14C

	thumb_func_start sub_0206C190
sub_0206C190: ; 0x0206C190
	push {r4, lr}
	add r4, r2, #0
	bl Sav2_DayCare_GetMonX
	add r1, r4, #0
	bl sub_0206C14C
	pop {r4, pc}
	thumb_func_end sub_0206C190

	thumb_func_start sub_0206C1A0
sub_0206C1A0: ; 0x0206C1A0
	push {r3, r4, r5, lr}
	add r5, r2, #0
	bl Sav2_DayCare_GetMonX
	add r4, r0, #0
	bl DayCareMon_GetBoxMon
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0206C1C4
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0206C110
	pop {r3, r4, r5, pc}
_0206C1C4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0206C1A0

	thumb_func_start sub_0206C1C8
sub_0206C1C8: ; 0x0206C1C8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0
	bl sub_0206BDB0
	str r0, [r4]
	add r0, r5, #0
	mov r1, #1
	bl sub_0206BDB0
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0206C1C8

	thumb_func_start sub_0206C1E4
sub_0206C1E4: ; 0x0206C1E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r1, sp, #0
	bl sub_0206C1C8
	mov r6, #0
	add r7, r6, #0
	add r4, r6, #0
	add r5, sp, #0
_0206C1F6:
	ldr r0, [r5]
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0xe5
	bne _0206C20E
	lsl r0, r4, #0x18
	lsr r7, r0, #0x18
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
_0206C20E:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0206C1F6
	cmp r6, #2
	bne _0206C24E
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	bne _0206C230
	mov r0, #1
	b _0206C232
_0206C230:
	mov r0, #0
_0206C232:
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	bl LCRandom
	ldr r1, _0206C270 ; =0x00007FFF
	cmp r0, r1
	blo _0206C248
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0206C248:
	add sp, #8
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206C24E:
	cmp r6, #1
	bne _0206C266
	bl LCRandom
	ldr r1, _0206C270 ; =0x00007FFF
	cmp r0, r1
	blo _0206C260
	mov r7, #0
	mvn r7, r7
_0206C260:
	add sp, #8
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206C266:
	mov r0, #0
	mvn r0, r0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0206C270: .word 0x00007FFF
	thumb_func_end sub_0206C1E4

	thumb_func_start sub_0206C274
sub_0206C274: ; 0x0206C274
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	mov r5, #0
	bl sub_0206C1E4
	add r1, r0, #0
	bpl _0206C290
	bl MTRandom
	add r1, r0, #0
	ldr r0, [sp]
	bl Sav2_DayCare_SetEggPID
	pop {r3, r4, r5, r6, r7, pc}
_0206C290:
	ldr r0, [sp]
	bl sub_0206BDB0
	add r1, r5, #0
	add r2, r1, #0
	bl GetBoxMonData
	bl GetNatureFromPersonality
	mov r7, #0x96
	add r6, r0, #0
	lsl r7, r7, #4
_0206C2A8:
	bl MTRandom
	add r4, r0, #0
	bl GetNatureFromPersonality
	cmp r6, r0
	bne _0206C2BA
	cmp r4, #0
	bne _0206C2C0
_0206C2BA:
	add r5, r5, #1
	cmp r5, r7
	ble _0206C2A8
_0206C2C0:
	ldr r0, [sp]
	add r1, r4, #0
	bl Sav2_DayCare_SetEggPID
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206C274

	thumb_func_start sub_0206C2CC
sub_0206C2CC: ; 0x0206C2CC
	push {r3, r4}
	sub sp, #8
	mov r2, #0xff
	strb r2, [r0, r1]
	mov r2, #0
	add r3, sp, #0
_0206C2D8:
	ldrb r1, [r0, r2]
	add r2, r2, #1
	strb r1, [r3]
	add r3, r3, #1
	cmp r2, #6
	blt _0206C2D8
	mov r2, #0
	add r4, r2, #0
	add r3, sp, #0
_0206C2EA:
	ldrb r1, [r3]
	cmp r1, #0xff
	beq _0206C2F4
	strb r1, [r0, r2]
	add r2, r2, #1
_0206C2F4:
	add r4, r4, #1
	add r3, r3, #1
	cmp r4, #6
	blt _0206C2EA
	add sp, #8
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0206C2CC

	thumb_func_start sub_0206C304
sub_0206C304: ; 0x0206C304
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp]
	add r1, sp, #8
	add r4, r0, #0
	mov r0, #0
	add r1, #2
_0206C312:
	strb r0, [r1, r0]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #6
	blo _0206C312
	add r1, sp, #4
	ldr r0, [sp]
	add r1, #1
	add r2, sp, #4
	bl sub_0206D39C
	cmp r0, #0
	beq _0206C346
	add r0, sp, #4
	ldrb r1, [r0, #1]
	mov r6, #1
	strb r1, [r0, #0xc]
	add r0, sp, #8
	add r0, #2
	bl sub_0206C2CC
	add r0, sp, #4
	ldrb r1, [r0]
	strb r1, [r0, #3]
	b _0206C348
_0206C346:
	mov r6, #0
_0206C348:
	add r5, r6, #0
	cmp r6, #3
	bhs _0206C378
	add r7, sp, #8
	add r7, #2
_0206C352:
	bl LCRandom
	mov r1, #6
	sub r1, r1, r5
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r1, r0, #0x18
	ldrb r2, [r7, r1]
	add r0, sp, #0x10
	strb r2, [r0, r5]
	add r0, r7, #0
	bl sub_0206C2CC
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _0206C352
_0206C378:
	add r0, sp, #4
	ldrb r5, [r0, #0xd]
	ldrb r0, [r0, #0xc]
	cmp r0, r5
	bne _0206C386
	bl GF_AssertFail
_0206C386:
	add r0, sp, #4
	ldrb r7, [r0, #0xe]
	cmp r5, r7
	bne _0206C392
	bl GF_AssertFail
_0206C392:
	add r0, sp, #4
	ldrb r0, [r0, #0xc]
	cmp r7, r0
	bne _0206C39E
	bl GF_AssertFail
_0206C39E:
	cmp r6, #3
	bhs _0206C3C2
	add r5, sp, #4
	add r5, #3
	mov r7, #0x1f
_0206C3A8:
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r0, r0, #0x1f
	sub r0, r0, r1
	ror r0, r7
	add r0, r1, r0
	strb r0, [r5, r6]
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #3
	blo _0206C3A8
_0206C3C2:
	add r7, sp, #4
	mov r5, #0
	add r7, #2
	add r6, sp, #4
_0206C3CA:
	add r1, sp, #4
	add r1, #3
	ldrb r1, [r1, r5]
	ldr r0, [sp]
	bl sub_0206BDB0
	add r1, sp, #0x10
	ldrb r1, [r1, r5]
	cmp r1, #5
	bhi _0206C478
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0206C3EA: ; jump table
	.short _0206C3F6 - _0206C3EA - 2 ; case 0
	.short _0206C40C - _0206C3EA - 2 ; case 1
	.short _0206C422 - _0206C3EA - 2 ; case 2
	.short _0206C438 - _0206C3EA - 2 ; case 3
	.short _0206C44E - _0206C3EA - 2 ; case 4
	.short _0206C464 - _0206C3EA - 2 ; case 5
_0206C3F6:
	mov r1, #0x46
	mov r2, #0
	bl GetBoxMonData
	strb r0, [r6, #2]
	add r0, r4, #0
	mov r1, #0x46
	add r2, r7, #0
	bl SetMonData
	b _0206C478
_0206C40C:
	mov r1, #0x47
	mov r2, #0
	bl GetBoxMonData
	strb r0, [r6, #2]
	add r0, r4, #0
	mov r1, #0x47
	add r2, r7, #0
	bl SetMonData
	b _0206C478
_0206C422:
	mov r1, #0x48
	mov r2, #0
	bl GetBoxMonData
	strb r0, [r6, #2]
	add r0, r4, #0
	mov r1, #0x48
	add r2, r7, #0
	bl SetMonData
	b _0206C478
_0206C438:
	mov r1, #0x49
	mov r2, #0
	bl GetBoxMonData
	strb r0, [r6, #2]
	add r0, r4, #0
	mov r1, #0x49
	add r2, r7, #0
	bl SetMonData
	b _0206C478
_0206C44E:
	mov r1, #0x4a
	mov r2, #0
	bl GetBoxMonData
	strb r0, [r6, #2]
	add r0, r4, #0
	mov r1, #0x4a
	add r2, r7, #0
	bl SetMonData
	b _0206C478
_0206C464:
	mov r1, #0x4b
	mov r2, #0
	bl GetBoxMonData
	strb r0, [r6, #2]
	add r0, r4, #0
	mov r1, #0x4b
	add r2, r7, #0
	bl SetMonData
_0206C478:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _0206C3CA
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206C304

	thumb_func_start sub_0206C488
sub_0206C488: ; 0x0206C488
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp, #4]
	add r6, r1, #0
	mov r0, #1
	mov r1, #0
	str r0, [sp]
	mov r0, #0xe7
	add r2, r1, #0
	mov r3, #4
	bl GfGfxLoader_LoadFromNarc
	mov r4, #0
	add r5, r0, #0
	ldr r0, [sp, #4]
	mov r1, #5
	add r2, r4, #0
	add r7, r4, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	ldr r1, _0206C508 ; =0x00004E20
	add r0, r4, #0
	add r1, r2, r1
	ldr r2, _0206C50C ; =0x000007FD
_0206C4BC:
	lsl r3, r0, #1
	ldrh r3, [r5, r3]
	cmp r1, r3
	bne _0206C4CC
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	b _0206C4D6
_0206C4CC:
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, r2
	blo _0206C4BC
_0206C4D6:
	lsl r0, r7, #1
	ldr r7, _0206C508 ; =0x00004E20
	mov r3, #0
	add r2, r5, r0
_0206C4DE:
	lsl r1, r3, #1
	ldrh r0, [r2, r1]
	cmp r0, r7
	bhi _0206C4F8
	strh r0, [r6, r1]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r3, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	cmp r3, #0x10
	blo _0206C4DE
_0206C4F8:
	add r0, r5, #0
	bl FreeToHeap
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0206C508: .word 0x00004E20
_0206C50C: .word 0x000007FD
	thumb_func_end sub_0206C488

	thumb_func_start sub_0206C510
sub_0206C510: ; 0x0206C510
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r7, r0, #0
	str r1, [sp]
	mov r0, #4
	mov r1, #0xb4
	str r2, [sp, #4]
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0xb4
	str r0, [sp, #0x1c]
	bl MIi_CpuClearFast
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x18]
	add r0, r7, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0xc]
	add r2, r4, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0xc]
	add r2, #0x30
	bl Species_LoadLearnsetTable
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x14]
	mov r6, #0
_0206C564:
	lsl r0, r6, #2
	add r5, r6, #0
	str r0, [sp, #0x20]
	add r0, r4, r0
	add r5, #0x36
	str r0, [sp, #0x10]
	ldr r0, [sp]
	add r1, r5, #0
	mov r2, #0
	bl GetBoxMonData
	ldr r1, [sp, #0x20]
	mov r2, #0
	str r0, [r4, r1]
	ldr r0, [sp, #4]
	add r1, r5, #0
	bl GetBoxMonData
	ldr r1, [sp, #0x10]
	str r0, [r1, #0x20]
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #4
	blo _0206C564
	add r1, r4, #0
	add r0, r7, #0
	add r1, #0x94
	bl sub_0206C488
	add r5, r0, #0
	mov r6, #0
_0206C5A4:
	lsl r0, r6, #2
	ldr r1, [r4, r0]
	str r0, [sp, #0x24]
	cmp r1, #0
	beq _0206C5F4
	mov r0, #0
	cmp r5, #0
	bls _0206C5EA
_0206C5B4:
	lsl r2, r0, #1
	add r2, r4, r2
	add r2, #0x94
	ldrh r2, [r2]
	cmp r1, r2
	bne _0206C5E0
	lsl r1, r1, #0x10
	add r0, r7, #0
	lsr r1, r1, #0x10
	bl TryAppendMonMove
	ldr r1, _0206C704 ; =0x0000FFFF
	cmp r0, r1
	bne _0206C5EA
	ldr r1, [sp, #0x24]
	add r0, r7, #0
	ldr r1, [r4, r1]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl DeleteMonFirstMoveAndAppend
	b _0206C5EA
_0206C5E0:
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, r5
	blo _0206C5B4
_0206C5EA:
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #4
	blo _0206C5A4
_0206C5F4:
	mov r0, #0
	str r0, [sp, #8]
_0206C5F8:
	ldr r0, [sp, #8]
	lsl r6, r0, #2
	ldr r0, [r4, r6]
	cmp r0, #0
	beq _0206C650
	mov r5, #0
_0206C604:
	mov r0, #0x52
	lsl r0, r0, #2
	add r0, r5, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl TMHMGetMove
	ldr r1, [r4, r6]
	cmp r1, r0
	bne _0206C646
	lsl r2, r5, #0x18
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0xc]
	lsr r2, r2, #0x18
	bl sub_0207227C
	cmp r0, #0
	beq _0206C646
	ldr r1, [r4, r6]
	add r0, r7, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl TryAppendMonMove
	ldr r1, _0206C704 ; =0x0000FFFF
	cmp r0, r1
	bne _0206C646
	ldr r1, [r4, r6]
	add r0, r7, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl DeleteMonFirstMoveAndAppend
_0206C646:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #0x64
	blo _0206C604
_0206C650:
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	cmp r0, #4
	blo _0206C5F8
	mov r6, #0
_0206C660:
	lsl r1, r6, #2
	ldr r0, [r4, r1]
	cmp r0, #0
	beq _0206C6A0
	mov r3, #0
_0206C66A:
	lsl r2, r3, #2
	add r2, r4, r2
	ldr r0, [r4, r1]
	ldr r2, [r2, #0x20]
	cmp r0, r2
	bne _0206C68C
	cmp r0, #0
	beq _0206C68C
	ldr r2, [sp, #0x1c]
	add r5, r2, #0
	add r5, r5, #1
	lsl r5, r5, #0x10
	lsr r5, r5, #0x10
	lsl r2, r2, #2
	str r5, [sp, #0x1c]
	add r2, r4, r2
	str r0, [r2, #0x10]
_0206C68C:
	add r0, r3, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	cmp r3, #4
	blo _0206C66A
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #4
	blo _0206C660
_0206C6A0:
	mov r6, #0
_0206C6A2:
	lsl r0, r6, #2
	add r5, r4, r0
	ldr r3, [r5, #0x10]
	cmp r3, #0
	beq _0206C6F8
	ldr r0, [sp, #0x14]
	mov r2, #0
	cmp r0, #0
	bls _0206C6EE
_0206C6B4:
	lsl r0, r2, #1
	add r0, r4, r0
	ldrh r1, [r0, #0x30]
	cmp r1, #0
	beq _0206C6E2
	ldr r0, [r5, #0x10]
	cmp r0, r1
	bne _0206C6E2
	lsl r1, r3, #0x10
	add r0, r7, #0
	lsr r1, r1, #0x10
	bl TryAppendMonMove
	ldr r1, _0206C704 ; =0x0000FFFF
	cmp r0, r1
	bne _0206C6EE
	ldr r1, [r5, #0x10]
	add r0, r7, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl DeleteMonFirstMoveAndAppend
	b _0206C6EE
_0206C6E2:
	add r0, r2, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	ldr r0, [sp, #0x14]
	cmp r2, r0
	blo _0206C6B4
_0206C6EE:
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #4
	blo _0206C6A2
_0206C6F8:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0206C704: .word 0x0000FFFF
	thumb_func_end sub_0206C510

	thumb_func_start sub_0206C708
sub_0206C708: ; 0x0206C708
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl Sav2_DayCare_SetEggPID
	add r0, r4, #0
	mov r1, #0
	bl Sav2_DayCare_SetEggCycleCounter
	pop {r4, pc}
	thumb_func_end sub_0206C708

	thumb_func_start sub_0206C71C
sub_0206C71C: ; 0x0206C71C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, r1, #0
	add r1, sp, #0
	bl sub_0206C1C8
	ldr r2, _0206C78C ; =0x020FF4AE
	mov r3, #0
	mov r1, #6
_0206C730:
	add r0, r3, #0
	mul r0, r1
	ldrh r0, [r2, r0]
	cmp r5, r0
	bne _0206C73E
	add r6, r3, #0
	b _0206C748
_0206C73E:
	add r0, r3, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	cmp r3, #9
	blo _0206C730
_0206C748:
	cmp r3, #9
	bne _0206C752
	add sp, #8
	add r0, r5, #0
	pop {r4, r5, r6, pc}
_0206C752:
	ldr r0, [sp]
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [sp, #4]
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	mov r0, #6
	add r1, r6, #0
	mul r1, r0
	ldr r0, _0206C790 ; =0x020FF4B0
	ldrh r0, [r0, r1]
	cmp r4, r0
	beq _0206C784
	cmp r2, r0
	beq _0206C784
	ldr r0, _0206C794 ; =0x020FF4B2
	ldrh r5, [r0, r1]
_0206C784:
	add r0, r5, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0206C78C: .word 0x020FF4AE
_0206C790: .word 0x020FF4B0
_0206C794: .word 0x020FF4B2
	thumb_func_end sub_0206C71C

	thumb_func_start sub_0206C798
sub_0206C798: ; 0x0206C798
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, r1, #0
	add r1, sp, #0
	bl sub_0206C1C8
	ldr r0, [sp]
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	add r5, r0, #0
	ldr r0, [sp, #4]
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	cmp r5, #0xec
	beq _0206C7C4
	cmp r0, #0xec
	bne _0206C7DE
_0206C7C4:
	mov r1, #0x56
	add r0, r4, #0
	lsl r1, r1, #2
	bl TryAppendMonMove
	ldr r1, _0206C7E4 ; =0x0000FFFF
	cmp r0, r1
	bne _0206C7DE
	mov r1, #0x56
	add r0, r4, #0
	lsl r1, r1, #2
	bl DeleteMonFirstMoveAndAppend
_0206C7DE:
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0206C7E4: .word 0x0000FFFF
	thumb_func_end sub_0206C798

	thumb_func_start sub_0206C7E8
sub_0206C7E8: ; 0x0206C7E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r1, sp, #4
	str r0, [sp]
	bl sub_0206C1C8
	mov r4, #0
	add r7, sp, #4
_0206C7FA:
	lsl r6, r4, #2
	ldr r0, [r7, r6]
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	lsl r1, r4, #1
	add r2, sp, #0xc
	strh r0, [r2, r1]
	add r0, r2, #0
	ldrh r0, [r0, r1]
	cmp r0, #0x84
	bne _0206C81E
	mov r0, #1
	eor r0, r4
	strb r0, [r5]
	strb r4, [r5, #1]
	b _0206C830
_0206C81E:
	ldr r0, [r7, r6]
	bl GetBoxMonGender
	cmp r0, #1
	bne _0206C830
	mov r0, #1
	strb r4, [r5]
	eor r0, r4
	strb r0, [r5, #1]
_0206C830:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #2
	blo _0206C7FA
	ldrb r0, [r5]
	lsl r1, r0, #1
	add r0, sp, #0xc
	ldrh r0, [r0, r1]
	bl ReadFromPersonalPmsNarc
	add r4, r0, #0
	cmp r4, #0x1d
	bne _0206C860
	ldr r0, [sp]
	bl Sav2_DayCare_GetEggPID
	mov r1, #2
	lsl r1, r1, #0xe
	tst r0, r1
	beq _0206C85E
	mov r4, #0x20
	b _0206C860
_0206C85E:
	mov r4, #0x1d
_0206C860:
	ldr r0, _0206C8AC ; =0x0000013A
	cmp r4, r0
	bne _0206C87A
	ldr r0, [sp]
	bl Sav2_DayCare_GetEggPID
	mov r1, #2
	lsl r1, r1, #0xe
	tst r0, r1
	beq _0206C878
	ldr r4, _0206C8B0 ; =0x00000139
	b _0206C87A
_0206C878:
	ldr r4, _0206C8AC ; =0x0000013A
_0206C87A:
	ldr r0, _0206C8B4 ; =0x000001EA
	cmp r4, r0
	bne _0206C882
	sub r4, r0, #1
_0206C882:
	ldrb r0, [r5, #1]
	lsl r1, r0, #1
	add r0, sp, #0xc
	ldrh r0, [r0, r1]
	cmp r0, #0x84
	bne _0206C8A6
	ldrb r0, [r5]
	lsl r1, r0, #2
	add r0, sp, #4
	ldr r0, [r0, r1]
	bl GetBoxMonGender
	cmp r0, #1
	beq _0206C8A6
	ldrb r1, [r5, #1]
	ldrb r0, [r5]
	strb r0, [r5, #1]
	strb r1, [r5]
_0206C8A6:
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206C8AC: .word 0x0000013A
_0206C8B0: .word 0x00000139
_0206C8B4: .word 0x000001EA
	thumb_func_end sub_0206C7E8

	thumb_func_start SetEggStats
SetEggStats: ; 0x0206C8B8
	push {r0, r1, r2, r3}
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0x13
	add r4, r3, #0
	bl GetMonBaseStat
	add r1, sp, #0x10
	strb r0, [r1]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	mov r3, #0x20
	bl CreateMon
	mov r1, #0
	add r0, sp, #0x10
	strb r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #4]
	add r0, r5, #0
	mov r1, #0x9b
	add r2, sp, #0x14
	bl SetMonData
	add r0, r5, #0
	mov r1, #9
	add r2, sp, #0x10
	bl SetMonData
	add r2, sp, #0x10
	add r0, r5, #0
	mov r1, #0x9c
	add r2, #2
	bl SetMonData
	add r0, sp, #0x30
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0206C922
	add r0, r5, #0
	mov r1, #0x98
	add r2, sp, #0x38
	bl SetMonData
_0206C922:
	add r2, sp, #0x10
	mov r1, #1
	add r0, sp, #0x10
	strb r1, [r0, #1]
	add r0, r5, #0
	mov r1, #0x4c
	add r2, #1
	bl SetMonData
	ldr r0, _0206C9AC ; =0x000001EE
	mov r1, #4
	bl GetSpeciesName
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x77
	add r2, r6, #0
	bl SetMonData
	add r0, r6, #0
	bl String_dtor
	ldr r0, [sp, #0x40]
	cmp r0, #4
	bne _0206C992
	add r0, r4, #0
	bl PlayerProfile_GetTrainerID
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	str r0, [sp, #0x18]
	add r0, r4, #0
	mov r1, #0x20
	bl PlayerProfile_GetPlayerName_NewString
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x91
	add r2, r6, #0
	bl SetMonData
	add r0, r5, #0
	mov r1, #7
	add r2, sp, #0x1c
	bl SetMonData
	add r0, r5, #0
	mov r1, #0x9d
	add r2, sp, #0x18
	bl SetMonData
	add r0, r6, #0
	bl String_dtor
_0206C992:
	mov r0, #0
	str r0, [sp]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0208F260
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_0206C9AC: .word 0x000001EE
	thumb_func_end SetEggStats

	thumb_func_start sub_0206C9B0
sub_0206C9B0: ; 0x0206C9B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	add r7, r0, #0
	ldr r0, [sp, #0x10]
	mov r1, #0x13
	add r5, r2, #0
	add r6, r3, #0
	bl GetMonBaseStat
	add r1, sp, #0x14
	strb r0, [r1]
	add r0, r5, #0
	bl Sav2_DayCare_GetEggPID
	add r4, r0, #0
	add r0, r5, #0
	bl Sav2_DayCare_MasudaCheck
	cmp r0, #0
	beq _0206CA02
	add r0, r6, #0
	add r1, r4, #0
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #0
	bne _0206CA02
	mov r5, #0
_0206C9E8:
	add r0, r4, #0
	bl PRandom
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #0
	bne _0206CA02
	add r5, r5, #1
	cmp r5, #4
	blt _0206C9E8
_0206CA02:
	mov r2, #1
	str r2, [sp]
	str r4, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	mov r3, #0x20
	bl CreateMon
	add r2, sp, #0x14
	mov r1, #0
	add r0, sp, #0x14
	strb r1, [r0, #1]
	mov r1, #4
	strh r1, [r0, #2]
	add r0, r7, #0
	mov r1, #0x9b
	add r2, #2
	bl SetMonData
	add r0, r7, #0
	mov r1, #9
	add r2, sp, #0x14
	bl SetMonData
	add r2, sp, #0x14
	add r0, r7, #0
	mov r1, #0x9c
	add r2, #1
	bl SetMonData
	add r0, r7, #0
	mov r1, #0x70
	add r2, sp, #0x30
	bl SetMonData
	ldr r0, _0206CA6C ; =0x000001EE
	mov r1, #4
	bl GetSpeciesName
	add r4, r0, #0
	add r0, r7, #0
	mov r1, #0x77
	add r2, r4, #0
	bl SetMonData
	add r0, r4, #0
	bl String_dtor
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206CA6C: .word 0x000001EE
	thumb_func_end sub_0206C9B0

	thumb_func_start GiveEggToPlayer
GiveEggToPlayer: ; 0x0206CA70
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #4
	str r1, [sp, #4]
	add r7, r2, #0
	bl AllocMonZeroed
	add r1, sp, #0x10
	add r4, r0, #0
	add r0, r5, #0
	add r1, #1
	bl sub_0206C7E8
	add r1, r5, #0
	bl sub_0206C71C
	add r6, r0, #0
	add r0, r7, #0
	bl PlayerProfile_GetTrainerID
	add r1, sp, #0x10
	str r0, [sp, #8]
	ldrb r1, [r1, #1]
	add r0, r5, #0
	bl sub_0206BDB0
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r3, [sp, #8]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl sub_0206C9B0
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0206C304
	add r1, sp, #0x10
	ldrb r1, [r1, #2]
	add r0, r5, #0
	bl sub_0206BDB0
	add r1, sp, #0x10
	str r0, [sp, #0xc]
	ldrb r1, [r1, #1]
	add r0, r5, #0
	bl sub_0206BDB0
	add r2, r0, #0
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	bl sub_0206C510
	mov r0, #1
	mov r1, #0
	bl sub_02017FE4
	add r3, r0, #0
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	add r1, r7, #0
	mov r2, #3
	bl sub_0208F260
	cmp r6, #0xac
	bne _0206CB0C
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0206C798
_0206CB0C:
	mov r1, #1
	add r0, sp, #0x10
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0x4c
	add r2, sp, #0x10
	bl SetMonData
	ldr r0, [sp, #4]
	add r1, r4, #0
	bl AddMonToParty
	add r0, r5, #0
	bl sub_0206C708
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end GiveEggToPlayer

	thumb_func_start sub_0206CB34
sub_0206CB34: ; 0x0206CB34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl GetPartyCount
	add r6, r0, #0
	mov r4, #0
	cmp r6, #0
	ble _0206CB84
	mov r7, #0xad
_0206CB46:
	add r0, r5, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r1, r7, #0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0206CB7A
	add r0, r5, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0x28
	beq _0206CB76
	cmp r0, #0x31
	bne _0206CB7A
_0206CB76:
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0206CB7A:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blt _0206CB46
_0206CB84:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206CB34

	thumb_func_start sub_0206CB88
sub_0206CB88: ; 0x0206CB88
	push {r4, r5, r6, r7}
	mov r4, #0
	add r3, r4, #0
_0206CB8E:
	ldrh r7, [r0]
	add r5, r3, #0
	add r6, r1, #0
_0206CB94:
	ldrh r2, [r6]
	cmp r7, r2
	bne _0206CBA0
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_0206CBA0:
	add r5, r5, #1
	add r6, r6, #2
	cmp r5, #2
	blt _0206CB94
	add r4, r4, #1
	add r0, r0, #2
	cmp r4, #2
	blt _0206CB8E
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0206CB88

	thumb_func_start sub_0206CBB8
sub_0206CBB8: ; 0x0206CBB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	add r0, sp, #0x10
	add r4, sp, #0x18
	str r0, [sp]
	add r7, sp, #8
	add r6, sp, #0x1c
_0206CBCC:
	ldr r0, [r5]
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	strh r0, [r4]
	ldr r0, [r5]
	mov r1, #7
	mov r2, #0
	bl GetBoxMonData
	ldr r1, [sp]
	str r0, [r1]
	mov r1, #0
	ldr r0, [r5]
	add r2, r1, #0
	bl GetBoxMonData
	add r1, r0, #0
	ldrh r0, [r4]
	bl GetGenderBySpeciesAndPersonality
	stmia r7!, {r0}
	ldrh r0, [r4]
	mov r1, #0x16
	bl GetMonBaseStat
	strh r0, [r6]
	ldrh r0, [r4]
	mov r1, #0x17
	bl GetMonBaseStat
	strh r0, [r6, #2]
	ldr r0, [sp]
	add r5, r5, #4
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #4]
	add r4, r4, #2
	add r0, r0, #1
	add r6, r6, #4
	str r0, [sp, #4]
	cmp r0, #2
	blo _0206CBCC
	add r0, sp, #8
	ldrh r1, [r0, #0x14]
	cmp r1, #0xf
	beq _0206CC32
	ldrh r0, [r0, #0x18]
	cmp r0, #0xf
	bne _0206CC38
_0206CC32:
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0206CC38:
	cmp r1, #0xd
	bne _0206CC46
	cmp r0, #0xd
	bne _0206CC46
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0206CC46:
	cmp r1, #0xd
	beq _0206CC4E
	cmp r0, #0xd
	bne _0206CC62
_0206CC4E:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	bne _0206CC5C
	add sp, #0x24
	mov r0, #0x14
	pop {r4, r5, r6, r7, pc}
_0206CC5C:
	add sp, #0x24
	mov r0, #0x32
	pop {r4, r5, r6, r7, pc}
_0206CC62:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r0, r1
	bne _0206CC70
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0206CC70:
	cmp r0, #2
	beq _0206CC78
	cmp r1, #2
	bne _0206CC7E
_0206CC78:
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0206CC7E:
	add r0, sp, #0x1c
	add r1, sp, #0x20
	bl sub_0206CB88
	cmp r0, #0
	bne _0206CC90
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0206CC90:
	add r0, sp, #8
	ldrh r1, [r0, #0x10]
	ldrh r0, [r0, #0x12]
	cmp r1, r0
	bne _0206CCAE
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	beq _0206CCA8
	add sp, #0x24
	mov r0, #0x46
	pop {r4, r5, r6, r7, pc}
_0206CCA8:
	add sp, #0x24
	mov r0, #0x32
	pop {r4, r5, r6, r7, pc}
_0206CCAE:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	beq _0206CCBC
	add sp, #0x24
	mov r0, #0x32
	pop {r4, r5, r6, r7, pc}
_0206CCBC:
	mov r0, #0x14
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206CBB8

	thumb_func_start sub_0206CCC4
sub_0206CCC4: ; 0x0206CCC4
	push {r3, lr}
	sub sp, #8
	add r1, sp, #0
	bl sub_0206C1C8
	add r0, sp, #0
	bl sub_0206CBB8
	add sp, #8
	pop {r3, pc}
	thumb_func_end sub_0206CCC4

	thumb_func_start sub_0206CCD8
sub_0206CCD8: ; 0x0206CCD8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205560C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02055600
	mov r1, #0x64
	mul r1, r0
	add r0, r4, #0
	add r5, r5, r1
	bl sub_02055670
	cmp r0, #0
	beq _0206CCFC
	mov r0, #0xff
	pop {r3, r4, r5, pc}
_0206CCFC:
	ldr r2, _0206CD18 ; =0x020FF490
	mov r1, #0
_0206CD00:
	ldrh r0, [r2]
	cmp r5, r0
	bne _0206CD0A
	mov r0, #0xe6
	pop {r3, r4, r5, pc}
_0206CD0A:
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, #0xf
	blo _0206CD00
	mov r0, #0xff
	pop {r3, r4, r5, pc}
	nop
_0206CD18: .word 0x020FF490
	thumb_func_end sub_0206CCD8

	thumb_func_start sub_0206CD1C
sub_0206CD1C: ; 0x0206CD1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r1, #0
	add r1, sp, #8
	str r0, [sp]
	str r2, [sp, #4]
	bl sub_0206C1C8
	mov r6, #0
	add r4, r6, #0
	add r5, sp, #8
_0206CD32:
	ldr r0, [r5]
	mov r1, #0xac
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0206CD50
	ldr r0, [sp]
	add r1, r4, #0
	bl Sav2_DayCare_GetMonX
	mov r1, #1
	bl DayCareMon_AddSteps
	add r6, r6, #1
_0206CD50:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blo _0206CD32
	ldr r0, [sp]
	bl Sav2_DayCare_HasEgg
	cmp r0, #0
	bne _0206CDA2
	cmp r6, #2
	bne _0206CDA2
	ldr r0, [sp]
	mov r1, #1
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetSteps
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0xff
	bne _0206CDA2
	ldr r0, [sp]
	bl sub_0206CCC4
	add r4, r0, #0
	bl LCRandom
	mov r1, #0x64
	mul r1, r0
	add r0, r1, #0
	ldr r1, _0206CE40 ; =0x0000FFFF
	bl _u32_div_f
	cmp r4, r0
	bls _0206CDA2
	ldr r0, [sp]
	bl sub_0206C274
	ldr r0, [sp, #4]
	bl sub_0209316C
_0206CDA2:
	ldr r0, [sp]
	bl Sav2_DayCare_GetEggCycleCounter
	add r4, r0, #0
	ldr r0, [sp]
	add r1, r4, #1
	bl Sav2_DayCare_SetEggCycleCounter
	ldr r0, [sp, #4]
	bl sub_0206CCD8
	add r1, r4, #1
	cmp r1, r0
	bne _0206CE3A
	ldr r0, [sp]
	mov r1, #0
	bl Sav2_DayCare_SetEggCycleCounter
	add r0, r7, #0
	bl sub_0206CB34
	add r6, r0, #0
	add r0, r7, #0
	mov r5, #0
	bl GetPartyCount
	cmp r0, #0
	bls _0206CE3A
_0206CDDA:
	add r0, r7, #0
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0206CE2E
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0206CE2E
	add r0, r4, #0
	mov r1, #9
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x10]
	cmp r0, #0
	beq _0206CE28
	cmp r0, r6
	blo _0206CE18
	sub r0, r0, r6
	str r0, [sp, #0x10]
	b _0206CE1C
_0206CE18:
	sub r0, r0, #1
	str r0, [sp, #0x10]
_0206CE1C:
	add r0, r4, #0
	mov r1, #9
	add r2, sp, #0x10
	bl SetMonData
	b _0206CE2E
_0206CE28:
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0206CE2E:
	add r0, r7, #0
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blo _0206CDDA
_0206CE3A:
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0206CE40: .word 0x0000FFFF
	thumb_func_end sub_0206CD1C

	thumb_func_start sub_0206CE44
sub_0206CE44: ; 0x0206CE44
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl GetPartyCount
	add r6, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _0206CE90
_0206CE54:
	add r0, r7, #0
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #3
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0206CE8A
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0206CE8A
	add r0, r4, #0
	mov r1, #9
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0206CE8A
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206CE8A:
	add r5, r5, #1
	cmp r5, r6
	blt _0206CE54
_0206CE90:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206CE44

	thumb_func_start sub_0206CE94
sub_0206CE94: ; 0x0206CE94
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	add r1, sp, #0
	bl sub_0206C1C8
	ldr r0, [sp]
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0206CEC2
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #0
	bl BufferBoxMonNickname
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #2
	bl BufferBoxMonOTName
_0206CEC2:
	ldr r0, [sp, #4]
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0206CEDA
	ldr r2, [sp, #4]
	add r0, r4, #0
	mov r1, #1
	bl BufferBoxMonNickname
_0206CEDA:
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206CE94

	thumb_func_start sub_0206CEE0
sub_0206CEE0: ; 0x0206CEE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r1, sp, #0x18
	ldrb r6, [r1, #0x10]
	add r5, r0, #0
	add r7, r2, #0
	add r1, r6, #0
	str r3, [sp, #8]
	bl Sav2_DayCare_GetMonX
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0206BDB0
	add r5, r0, #0
	ldr r0, [sp, #0x2c]
	add r1, r4, #0
	add r2, r5, #0
	bl BufferBoxMonNickname
	ldr r0, [sp, #0xc]
	bl DayCareMon_GetSteps
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0206C0A0
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r1, r7, #0
	mov r3, #3
	bl BufferIntegerAsString
	add r0, r5, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	beq _0206CF68
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #0x1d
	beq _0206CF58
	cmp r0, #0x20
	bne _0206CF68
_0206CF58:
	add r0, r5, #0
	mov r1, #0x4d
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0206CF68
	mov r4, #2
_0206CF68:
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #8]
	add r2, r4, #0
	bl sub_0200C440
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206CEE0

	thumb_func_start sub_0206CF78
sub_0206CF78: ; 0x0206CF78
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	mov r1, #0
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetBoxMon
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetBoxMon
	str r0, [sp]
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r0, [sp]
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	bne _0206CFC4
	add r0, r5, #0
	mov r1, #0
	add r2, r7, #0
	bl BufferBoxMonNickname
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206CFC4:
	ldr r2, [sp]
	add r0, r5, #0
	mov r1, #0
	bl BufferBoxMonNickname
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206CF78

	thumb_func_start sub_0206CFD4
sub_0206CFD4: ; 0x0206CFD4
	push {r4, lr}
	add r4, r0, #0
	bl Sav2_DayCare_HasEgg
	cmp r0, #0
	beq _0206CFE4
	mov r0, #1
	pop {r4, pc}
_0206CFE4:
	add r0, r4, #0
	bl sub_0206BDBC
	cmp r0, #0
	beq _0206CFF6
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, pc}
_0206CFF6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206CFD4

	thumb_func_start sub_0206CFFC
sub_0206CFFC: ; 0x0206CFFC
	cmp r0, #0x14
	bhi _0206D008
	bhs _0206D01A
	cmp r0, #0
	beq _0206D016
	b _0206D026
_0206D008:
	cmp r0, #0x32
	bhi _0206D010
	beq _0206D01E
	b _0206D026
_0206D010:
	cmp r0, #0x46
	beq _0206D022
	b _0206D026
_0206D016:
	mov r0, #3
	bx lr
_0206D01A:
	mov r0, #2
	bx lr
_0206D01E:
	mov r0, #1
	bx lr
_0206D022:
	mov r0, #0
	bx lr
_0206D026:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0206CFFC

	thumb_func_start sub_0206D02C
sub_0206D02C: ; 0x0206D02C
	push {r3, lr}
	bl sub_0206CCC4
	bl sub_0206CFFC
	pop {r3, pc}
	thumb_func_end sub_0206D02C

	thumb_func_start sub_0206D038
sub_0206D038: ; 0x0206D038
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r4, r0, #0
	add r5, r1, #0
	mov r0, #8
	bl String_ctor
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl AllocMonZeroed
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x14]
	mov r5, #0
	add r7, sp, #0x34
_0206D064:
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	lsl r1, r5, #1
	strh r0, [r7, r1]
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x3a
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x30
	strb r0, [r1, r5]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _0206D064
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl GetMonData
	add r7, r0, #0
	mov r5, #0
_0206D09C:
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x46
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x24
	add r1, #2
	strb r0, [r1, r5]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #6
	blo _0206D09C
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #9]
	add r0, r4, #0
	mov r1, #0x7a
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #8]
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #7]
	add r0, r4, #0
	mov r1, #0x9a
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #0xa]
	add r0, r4, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #5]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0x91
	bl GetMonData
	add r0, r4, #0
	mov r1, #0x9d
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #3]
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x2c]
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #4]
	ldr r1, _0206D324 ; =0x000001EA
	ldr r0, [sp, #0x14]
	cmp r0, r1
	bne _0206D170
	add r0, r4, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	mov r0, #2
	mov r1, #1
	bl sub_02017FE4
	cmp r5, r0
	bne _0206D170
	ldr r0, [sp, #0x2c]
	add r1, r7, #0
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #0
	beq _0206D170
_0206D15C:
	add r0, r7, #0
	bl PRandom
	add r7, r0, #0
	ldr r0, [sp, #0x2c]
	add r1, r7, #0
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #0
	bne _0206D15C
_0206D170:
	mov r2, #1
	str r2, [sp]
	str r7, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	add r0, r6, #0
	mov r3, #0x20
	bl CreateMon
	mov r5, #0
	add r7, sp, #0x34
_0206D18A:
	add r1, r5, #0
	lsl r2, r5, #1
	add r0, r6, #0
	add r1, #0x36
	add r2, r7, r2
	bl SetMonData
	add r1, r5, #0
	add r2, sp, #0x30
	add r0, r6, #0
	add r1, #0x3a
	add r2, r2, r5
	bl SetMonData
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _0206D18A
	add r7, sp, #0x24
	mov r5, #0
	add r7, #2
_0206D1B6:
	add r1, r5, #0
	add r0, r6, #0
	add r1, #0x46
	add r2, r7, r5
	bl SetMonData
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #6
	blo _0206D1B6
	add r2, sp, #0x20
	add r0, r6, #0
	mov r1, #0xc
	add r2, #1
	bl SetMonData
	add r0, r6, #0
	mov r1, #0x7a
	add r2, sp, #0x20
	bl SetMonData
	add r2, sp, #0x1c
	add r0, r6, #0
	mov r1, #0xb
	add r2, #3
	bl SetMonData
	add r2, sp, #0x1c
	mov r1, #0x78
	add r0, sp, #0x18
	strb r1, [r0, #6]
	add r0, r6, #0
	mov r1, #9
	add r2, #2
	bl SetMonData
	add r2, sp, #0x20
	add r0, r6, #0
	mov r1, #0x9a
	add r2, #2
	bl SetMonData
	add r2, sp, #0x1c
	add r0, r6, #0
	mov r1, #0x6e
	add r2, #1
	bl SetMonData
	ldr r2, [sp, #0x10]
	add r0, r6, #0
	mov r1, #0x91
	bl SetMonData
	add r2, sp, #0x18
	add r0, r6, #0
	mov r1, #0x9d
	add r2, #3
	bl SetMonData
	add r0, r6, #0
	mov r1, #7
	add r2, sp, #0x2c
	bl SetMonData
	add r0, r6, #0
	mov r1, #0x70
	add r2, sp, #0x1c
	bl SetMonData
	add r0, r4, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strh r0, [r1, #0xc]
	add r0, r4, #0
	mov r1, #0x92
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #2]
	add r0, r4, #0
	mov r1, #0x93
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #1]
	add r0, r4, #0
	mov r1, #0x94
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1]
	add r0, r6, #0
	mov r1, #0x98
	add r2, sp, #0x24
	bl SetMonData
	add r2, sp, #0x18
	add r0, r6, #0
	mov r1, #0x92
	add r2, #2
	bl SetMonData
	add r2, sp, #0x18
	add r0, r6, #0
	mov r1, #0x93
	add r2, #1
	bl SetMonData
	add r0, r6, #0
	mov r1, #0x94
	add r2, sp, #0x18
	bl SetMonData
	add r0, r4, #0
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strh r0, [r1, #0xc]
	add r0, r4, #0
	mov r1, #0x95
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #2]
	add r0, r4, #0
	mov r1, #0x96
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #1]
	add r0, r4, #0
	mov r1, #0x97
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1]
	add r0, r6, #0
	mov r1, #0x99
	add r2, sp, #0x24
	bl SetMonData
	add r2, sp, #0x18
	add r0, r6, #0
	mov r1, #0x95
	add r2, #2
	bl SetMonData
	add r2, sp, #0x18
	add r0, r6, #0
	mov r1, #0x96
	add r2, #1
	bl SetMonData
	add r0, r6, #0
	mov r1, #0x97
	add r2, sp, #0x18
	bl SetMonData
	add r0, r6, #0
	add r1, r4, #0
	bl CopyPokemonToPokemon
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_0206D324: .word 0x000001EA
	thumb_func_end sub_0206D038

	thumb_func_start sub_0206D328
sub_0206D328: ; 0x0206D328
	push {r4, r5, lr}
	sub sp, #0x1c
	mov r3, #0x46
	add r2, sp, #0
	strb r3, [r2, #3]
	mov r5, #0
	strb r5, [r2, #2]
	mov r3, #4
	strb r3, [r2, #1]
	add r4, r0, #0
	strb r5, [r2]
	bl sub_0206D038
	add r2, sp, #0
	add r0, r4, #0
	mov r1, #0x4c
	add r2, #3
	bl SetMonData
	add r0, r4, #0
	mov r1, #5
	add r2, r5, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	add r1, r5, #0
	add r2, sp, #4
	bl GetSpeciesNameIntoArray
	add r0, r4, #0
	mov r1, #0x75
	add r2, sp, #4
	bl SetMonData
	add r2, sp, #0
	add r0, r4, #0
	mov r1, #0x4d
	add r2, #2
	bl SetMonData
	add r2, sp, #0
	add r0, r4, #0
	mov r1, #0x9b
	add r2, #1
	bl SetMonData
	add r0, r4, #0
	mov r1, #0x9c
	add r2, sp, #0
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0206D328

	thumb_func_start sub_0206D39C
sub_0206D39C: ; 0x0206D39C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r5, #0
	add r6, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	add r7, r5, #0
	add r4, r5, #0
_0206D3AC:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0206BDB0
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	add r1, sp, #8
	lsr r0, r0, #0x10
	add r1, r1, r4
	bl sub_0206D43C
	cmp r0, #0
	beq _0206D3D4
	add r0, r5, #1
	lsl r0, r0, #0x18
	add r7, r4, #0
	lsr r5, r0, #0x18
_0206D3D4:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _0206D3AC
	cmp r5, #2
	bne _0206D418
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	add r0, sp, #8
	beq _0206D408
	ldrb r1, [r0]
	ldr r0, [sp]
	strb r1, [r0]
	ldr r0, [sp, #4]
	mov r1, #0
	strb r1, [r0]
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0206D408:
	ldrb r1, [r0, #1]
	ldr r0, [sp]
	strb r1, [r0]
	ldr r1, [sp, #4]
	mov r0, #1
	strb r0, [r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0206D418:
	cmp r5, #1
	bne _0206D42E
	add r0, sp, #8
	ldrb r1, [r0, r7]
	ldr r0, [sp]
	strb r1, [r0]
	ldr r0, [sp, #4]
	add sp, #0xc
	strb r7, [r0]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0206D42E:
	ldr r1, [sp]
	mov r0, #0
	strb r0, [r1]
	ldr r1, [sp, #4]
	strb r0, [r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0206D39C

	thumb_func_start sub_0206D43C
sub_0206D43C: ; 0x0206D43C
	ldr r2, _0206D490 ; =0x00000121
	sub r0, r0, r2
	cmp r0, #5
	bhi _0206D48A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206D450: ; jump table
	.short _0206D464 - _0206D450 - 2 ; case 0
	.short _0206D46A - _0206D450 - 2 ; case 1
	.short _0206D47A - _0206D450 - 2 ; case 2
	.short _0206D482 - _0206D450 - 2 ; case 3
	.short _0206D472 - _0206D450 - 2 ; case 4
	.short _0206D45C - _0206D450 - 2 ; case 5
_0206D45C:
	mov r0, #0
	strb r0, [r1]
	mov r0, #1
	bx lr
_0206D464:
	mov r0, #1
	strb r0, [r1]
	bx lr
_0206D46A:
	mov r0, #2
	strb r0, [r1]
	mov r0, #1
	bx lr
_0206D472:
	mov r0, #3
	strb r0, [r1]
	mov r0, #1
	bx lr
_0206D47A:
	mov r0, #4
	strb r0, [r1]
	mov r0, #1
	bx lr
_0206D482:
	mov r0, #5
	strb r0, [r1]
	mov r0, #1
	bx lr
_0206D48A:
	mov r0, #0
	bx lr
	nop
_0206D490: .word 0x00000121
	thumb_func_end sub_0206D43C

	thumb_func_start sub_0206D494
sub_0206D494: ; 0x0206D494
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x3c]
	bl sub_0205C600
	add r7, r0, #0
	bl sub_0206D590
	add r5, r0, #0
	beq _0206D4D8
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	str r5, [r4]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r7, #0
	bl sub_0205F2A8
	strb r0, [r4, #8]
	mov r0, #0
	strb r0, [r4, #9]
	ldr r1, _0206D4DC ; =sub_0206D4E4
	add r0, r6, #0
	add r2, r4, #0
	bl sub_020504F0
	ldr r0, _0206D4E0 ; =0x00000905
	bl PlaySE
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206D4D8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206D4DC: .word sub_0206D4E4
_0206D4E0: .word 0x00000905
	thumb_func_end sub_0206D494

	thumb_func_start sub_0206D4E4
sub_0206D4E4: ; 0x0206D4E4
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #3
	bhi _0206D586
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206D510: ; jump table
	.short _0206D518 - _0206D510 - 2 ; case 0
	.short _0206D534 - _0206D510 - 2 ; case 1
	.short _0206D54E - _0206D510 - 2 ; case 2
	.short _0206D576 - _0206D510 - 2 ; case 3
_0206D518:
	ldr r0, [r6, #0x3c]
	bl sub_0205C600
	bl sub_02062198
	cmp r0, #0
	beq _0206D586
	ldr r0, _0206D58C ; =0x00000906
	bl PlaySE
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206D586
_0206D534:
	add r0, r5, #0
	bl sub_0206D688
	cmp r0, #0
	beq _0206D586
	ldr r0, _0206D58C ; =0x00000906
	mov r1, #0
	bl sub_02006154
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206D586
_0206D54E:
	ldr r0, [r5]
	bl sub_02062198
	cmp r0, #0
	beq _0206D586
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _0206D566
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206D586
_0206D566:
	bl sub_02062198
	cmp r0, #0
	beq _0206D586
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206D586
_0206D576:
	ldr r0, [r6, #0x40]
	bl sub_0206D850
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_0206D586:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_0206D58C: .word 0x00000906
	thumb_func_end sub_0206D4E4

	thumb_func_start sub_0206D590
sub_0206D590: ; 0x0206D590
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_0205F35C
	str r0, [sp]
	add r0, r4, #0
	bl sub_0205F2A8
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205F914
	add r6, r0, #0
	add r0, r5, #0
	bl sub_02060F0C
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0205F924
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_0205F934
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02060F18
	add r3, r0, #0
	ldr r0, [sp]
	ldr r2, [sp, #4]
	add r1, r6, r7
	add r3, r4, r3
	bl sub_0206D614
	add r4, r0, #0
	beq _0206D60A
	bl sub_0205F25C
	ldr r1, _0206D610 ; =0x00000196
	cmp r0, r1
	beq _0206D5EC
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206D5EC:
	add r0, r4, #0
	bl sub_0205F2A8
	cmp r0, #1
	beq _0206D604
	cmp r0, #0
	beq _0206D5FE
	bl GF_AssertFail
_0206D5FE:
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206D604:
	add sp, #8
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206D60A:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206D610: .word 0x00000196
	thumb_func_end sub_0206D590

	thumb_func_start sub_0206D614
sub_0206D614: ; 0x0206D614
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	bl sub_0205F1BC
	str r0, [sp, #4]
	add r0, r4, #0
	bl sub_0205F168
	add r5, r0, #0
_0206D62E:
	ldr r0, [sp, #4]
	mov r1, #1
	bl sub_0205F220
	cmp r0, #0
	beq _0206D676
	mov r1, #1
	ldr r0, [sp, #4]
	lsl r1, r1, #0x12
	bl sub_0205F220
	cmp r0, #0
	bne _0206D676
	ldr r0, [sp, #4]
	bl sub_0205F914
	add r4, r0, #0
	ldr r0, [sp, #4]
	bl sub_0205F934
	cmp r4, r6
	bne _0206D676
	ldr r1, [sp]
	cmp r0, r1
	bne _0206D676
	ldr r0, [sp, #4]
	bl sub_0205F924
	sub r0, r0, r7
	bpl _0206D66C
	neg r0, r0
_0206D66C:
	cmp r0, #2
	bge _0206D676
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0206D676:
	add r0, sp, #4
	bl sub_0205F1D0
	sub r5, r5, #1
	bne _0206D62E
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206D614

	thumb_func_start sub_0206D688
sub_0206D688: ; 0x0206D688
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldrb r0, [r5, #9]
	cmp r0, #0
	beq _0206D69E
	cmp r0, #1
	beq _0206D750
	cmp r0, #2
	beq _0206D77E
	b _0206D7A8
_0206D69E:
	ldr r0, [r5]
	bl sub_02062198
	cmp r0, #0
	beq _0206D7A8
	ldr r0, [r5]
	bl sub_0205F914
	add r4, r0, #0
	ldrb r0, [r5, #8]
	bl sub_02060F0C
	add r6, r0, #0
	ldr r0, [r5]
	bl sub_0205F924
	str r0, [sp]
	ldr r0, [r5]
	bl sub_0205F934
	add r7, r0, #0
	ldrb r0, [r5, #8]
	bl sub_02060F18
	str r0, [sp, #4]
	ldr r3, [sp, #4]
	ldr r0, [r5]
	ldr r2, [sp]
	add r1, r4, r6
	add r3, r7, r3
	bl sub_0206D7B8
	mov r1, #2
	tst r1, r0
	beq _0206D730
	ldr r0, [r5]
	bl sub_0205F35C
	ldr r3, [sp, #4]
	ldr r2, [sp]
	add r1, r4, r6
	add r3, r7, r3
	bl sub_0206D614
	add r4, r0, #0
	bne _0206D704
	bl GF_AssertFail
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206D704:
	bl sub_0205F25C
	ldr r1, _0206D7B0 ; =0x00000196
	cmp r0, r1
	bne _0206D71E
	str r4, [r5, #4]
	ldr r0, [r5]
	mov r1, #0x48
	bl sub_0206214C
	mov r0, #2
	strb r0, [r5, #9]
	b _0206D7A8
_0206D71E:
	mov r0, #0
	str r0, [r5, #4]
	ldr r0, [r5]
	mov r1, #0x48
	bl sub_0206214C
	mov r0, #2
	strb r0, [r5, #9]
	b _0206D7A8
_0206D730:
	mov r1, #1
	tst r1, r0
	bne _0206D73C
	mov r1, #4
	tst r0, r1
	beq _0206D742
_0206D73C:
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206D742:
	ldr r0, [r5]
	mov r1, #0x47
	bl sub_0206214C
	mov r0, #1
	strb r0, [r5, #9]
	b _0206D7A8
_0206D750:
	ldr r0, [r5]
	bl sub_02062198
	cmp r0, #0
	beq _0206D7A8
	ldrb r0, [r5, #8]
	bl sub_0206D81C
	add r1, r0, #0
	cmp r1, #0xff
	beq _0206D76E
	ldr r0, [r5]
	bl sub_0206214C
	b _0206D778
_0206D76E:
	bl GF_AssertFail
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206D778:
	mov r0, #0
	strb r0, [r5, #9]
	b _0206D7A8
_0206D77E:
	ldr r0, [r5]
	bl sub_02062198
	cmp r0, #0
	beq _0206D7A8
	ldr r0, _0206D7B4 ; =0x00000907
	bl PlaySE
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0206D79A
	mov r1, #0
	bl sub_0206214C
_0206D79A:
	ldr r0, [r5]
	mov r1, #0
	bl sub_0206214C
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206D7A8:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0206D7B0: .word 0x00000196
_0206D7B4: .word 0x00000907
	thumb_func_end sub_0206D688

	thumb_func_start sub_0206D7B8
sub_0206D7B8: ; 0x0206D7B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r1, #0
	add r5, r0, #0
	add r1, sp, #0xc
	str r2, [sp, #4]
	add r7, r3, #0
	bl sub_0205F944
	add r0, r5, #0
	mov r4, #0
	bl sub_0205F52C
	add r1, sp, #8
	str r1, [sp]
	add r1, sp, #0xc
	add r2, r6, #0
	add r3, r7, #0
	bl sub_020549F4
	cmp r0, #1
	bne _0206D7E8
	mov r0, #1
	orr r4, r0
_0206D7E8:
	add r0, r5, #0
	bl sub_0205F52C
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02054918
	bl sub_0205B828
	cmp r0, #0
	bne _0206D802
	mov r0, #4
	orr r4, r0
_0206D802:
	ldr r2, [sp, #4]
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl sub_02060BFC
	cmp r0, #1
	bne _0206D816
	mov r0, #2
	orr r4, r0
_0206D816:
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206D7B8

	thumb_func_start sub_0206D81C
sub_0206D81C: ; 0x0206D81C
	push {r4, lr}
	mov r4, #0xff
	cmp r0, #3
	bhi _0206D848
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206D830: ; jump table
	.short _0206D838 - _0206D830 - 2 ; case 0
	.short _0206D83C - _0206D830 - 2 ; case 1
	.short _0206D840 - _0206D830 - 2 ; case 2
	.short _0206D844 - _0206D830 - 2 ; case 3
_0206D838:
	mov r4, #0xc
	b _0206D84C
_0206D83C:
	mov r4, #0xd
	b _0206D84C
_0206D840:
	mov r4, #0xe
	b _0206D84C
_0206D844:
	mov r4, #0xf
	b _0206D84C
_0206D848:
	bl GF_AssertFail
_0206D84C:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_0206D81C

	thumb_func_start sub_0206D850
sub_0206D850: ; 0x0206D850
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205CA38
	cmp r0, #1
	bne _0206D892
	add r0, r4, #0
	bl sub_0205C6DC
	mov r1, #6
	lsl r1, r1, #6
	bl sub_0205F214
	add r0, r4, #0
	bl sub_0205CB2C
	cmp r0, #0
	bne _0206D87A
	add r0, r4, #0
	bl sub_0205C74C
_0206D87A:
	add r0, r4, #0
	mov r1, #0
	bl sub_0205CA20
	add r0, r4, #0
	mov r1, #0
	bl sub_0205CB14
	add r0, r4, #0
	mov r1, #0
	bl sub_0205CAD0
_0206D892:
	pop {r4, pc}
	thumb_func_end sub_0206D850

	thumb_func_start MonIsInGameTradePoke
MonIsInGameTradePoke: ; 0x0206D894
	; BOOL MonIsInGameTradePoke(struct Pokemon *poke, int tradeno);
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x70
	mov r2, #0
	mov r3, #0xb
	add r6, r1, #0
	bl GfGfxLoader_LoadFromNarc
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl MonIsInGameTradePokeEx
	add r5, r0, #0
	add r0, r4, #0
	bl FreeToHeap
	cmp r5, #0
	beq _0206D8C8
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0206D8C8:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end MonIsInGameTradePoke

	thumb_func_start sub_0206D8D0
sub_0206D8D0: ; 0x0206D8D0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r4, r0, #0
	add r0, r6, #0
	bl Sav2_Misc_get
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r1, #0xaf
	beq _0206D90C
	cmp r1, #0xb0
	beq _0206D90C
	mov r0, #0x75
	lsl r0, r0, #2
	cmp r1, r0
	beq _0206D90C
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0206D90C:
	add r0, r5, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	str r0, [sp, #4]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerID
	ldr r1, [sp, #4]
	cmp r1, r0
	beq _0206D92A
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0206D92A:
	add r0, r5, #0
	mov r1, #0x9d
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	strb r0, [r1]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	add r1, sp, #0
	ldrb r1, [r1]
	cmp r1, r0
	beq _0206D94C
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0206D94C:
	add r0, r5, #0
	mov r1, #0xc
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	strb r0, [r1]
	ldr r0, _0206D9C8 ; =gGameLanguage
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _0206D96A
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0206D96A:
	add r0, r5, #0
	mov r1, #0x7a
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	strb r0, [r1]
	ldr r0, _0206D9CC ; =gGameVersion
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _0206D988
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0206D988:
	add r0, r6, #0
	add r1, sp, #4
	add r2, sp, #0
	bl sub_0202ABBC
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl GetMonData
	ldr r1, [sp, #4]
	cmp r1, r0
	beq _0206D9A8
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0206D9A8:
	add r0, r5, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	ldrb r1, [r1]
	cmp r1, r0
	bne _0206D9C0
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0206D9C0:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0206D9C8: .word gGameLanguage
_0206D9CC: .word gGameVersion
	thumb_func_end sub_0206D8D0

	thumb_func_start MonIsInGameTradePokeEx
MonIsInGameTradePokeEx: ; 0x0206D9D0
	; BOOL MonIsInGameTradePokeEx(struct Pokemon *poke, struct InGameTrade *trade, int tradeno);
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r2, #0
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r6, #7
	bne _0206D9F8
	cmp r1, #SPECIES_SPEAROW
	beq _0206DA04
	cmp r1, #SPECIES_FEAROW
	beq _0206DA04
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206D9F8:
	ldr r0, [r5]
	cmp r1, r0
	beq _0206DA04
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DA04:
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	ldr r1, [r5, #0x20]
	cmp r0, r1
	beq _0206DA1A
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DA1A:
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl GetMonData
	ldr r1, [r5, #0x38]
	cmp r0, r1
	beq _0206DA30
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DA30:
	add r0, r4, #0
	mov r1, #0x9d
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, [r5, #0x40]
	cmp r1, r0
	beq _0206DA4A
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DA4A:
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, [r5, #0x48]
	cmp r1, r0
	beq _0206DA64
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DA64:
	add r0, r4, #0
	mov r1, #0x7a
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, _0206DB24 ; =gGameVersion
	ldrb r0, [r0]
	cmp r1, r0
	beq _0206DA80
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DA80:
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xc8
	mov r3, #0xb
	bl NewMsgDataFromNarc
	add r5, r0, #0
	mov r0, #0xc
	mov r1, #0xb
	bl String_ctor
	str r0, [sp]
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #0x77
	bl GetMonData
	add r0, r5, #0
	add r1, r6, #0
	bl NewString_ReadMsgData
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl StringCompare
	add r7, r0, #0
	ldr r0, [sp, #4]
	bl String_dtor
	ldr r0, [sp]
	bl String_dtor
	cmp r7, #0
	beq _0206DAD2
	add r0, r5, #0
	bl DestroyMsgData
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DAD2:
	mov r0, #8
	mov r1, #0xb
	bl String_ctor
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x91
	add r2, r7, #0
	bl GetMonData
	add r6, #0xd
	add r0, r5, #0
	add r1, r6, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	bl StringCompare
	add r4, r0, #0
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	cmp r4, #0
	beq _0206DB18
	add r0, r5, #0
	bl DestroyMsgData
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DB18:
	add r0, r5, #0
	bl DestroyMsgData
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206DB24: .word gGameVersion
	thumb_func_end MonIsInGameTradePokeEx

	thumb_func_start sub_0206DB28
sub_0206DB28: ; 0x0206DB28
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end sub_0206DB28

	thumb_func_start sub_0206DB30
sub_0206DB30: ; 0x0206DB30
	add r0, #0x18
	bx lr
	thumb_func_end sub_0206DB30

	thumb_func_start sub_0206DB34
sub_0206DB34: ; 0x0206DB34
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl sub_0206DB28
	add r4, r0, #0
	beq _0206DB56
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl sub_02066870
	cmp r0, #0
	beq _0206DB56
	ldr r0, [r4, #0x1c]
	add r0, r0, r6
	str r0, [r4, #0x1c]
_0206DB56:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0206DB34

	thumb_func_start sub_0206DB58
sub_0206DB58: ; 0x0206DB58
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r1, #0xc]
	bl sub_0203B9C4
	mov r1, #0x60
	str r1, [sp]
	sub r1, #0x61
	str r1, [sp, #4]
	mov r1, #0x2e
	str r1, [sp, #8]
	mov r1, #0x32
	str r1, [sp, #0xc]
	mov r1, #0
	str r1, [sp, #0x10]
	add r4, r0, #0
	add r1, sp, #0
	bl sub_0203B96C
	add r0, r4, #0
	bl sub_0203B968
	add r1, r0, #0
	add r0, r5, #0
	bl sub_020537A8
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0206DB58

	thumb_func_start sub_0206DB94
sub_0206DB94: ; 0x0206DB94
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #3
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r1, _0206DBBC ; =sub_0206DBC0
	add r0, r6, #0
	add r2, r4, #0
	str r5, [r4, #4]
	bl sub_02050530
	pop {r4, r5, r6, pc}
	nop
_0206DBBC: .word sub_0206DBC0
	thumb_func_end sub_0206DB94

	thumb_func_start sub_0206DBC0
sub_0206DBC0: ; 0x0206DBC0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_0205064C
	add r7, r0, #0
	add r0, r6, #0
	bl sub_02050650
	add r4, r0, #0
	add r0, r7, #0
	bl sub_0206DB28
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050654
	add r6, r0, #0
	ldr r0, [r6]
	cmp r0, #0
	beq _0206DBEE
	cmp r0, #1
	beq _0206DC10
	b _0206DC4C
_0206DBEE:
	ldrb r0, [r5, #0x17]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _0206DBFA
	mov r3, #1
	b _0206DBFC
_0206DBFA:
	mov r3, #0
_0206DBFC:
	ldr r1, [r4, #4]
	ldr r2, [r5, #0x10]
	add r0, r7, #0
	bl sub_0203EDDC
	str r0, [r4, #8]
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0206DC4C
_0206DC10:
	add r0, r7, #0
	bl sub_020505A0
	cmp r0, #0
	bne _0206DC4C
	ldr r0, [r4, #8]
	ldr r1, [r5, #0x10]
	ldr r0, [r0, #0x10]
	cmp r0, r1
	beq _0206DC2A
	ldr r0, [r4, #4]
	bl CopyPokemonToPokemon
_0206DC2A:
	ldrb r1, [r5, #0x17]
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	bne _0206DC3C
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r5, #0x17]
_0206DC3C:
	ldr r0, [r4, #8]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206DC4C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206DBC0

	thumb_func_start ScrCmd_807
ScrCmd_807: ; 0x0206DC50
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	ldr r1, _0206DCC0 ; =0x00004021
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x80
	add r1, r5, r1
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r4, #0x80
	add r7, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_0203277C
	add r4, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	mul r0, r5
	str r0, [sp]
	add r0, r4, r0
	bl sub_020327F8
	strh r0, [r6]
	ldrh r0, [r6]
	cmp r0, #0
	beq _0206DCB8
	ldr r0, [sp]
	add r0, r4, r0
	ldrb r0, [r0, #4]
	b _0206DCBA
_0206DCB8:
	mov r0, #0
_0206DCBA:
	strh r0, [r7]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206DCC0: .word 0x00004021
	thumb_func_end ScrCmd_807

	thumb_func_start sub_0206DCC4
sub_0206DCC4: ; 0x0206DCC4
	push {r4, lr}
	bl ScriptEnvironment_GetSav2Ptr
	bl sub_0202A998
	add r4, r0, #0
	mov r1, #9
	bl sub_0202AE98
	add r0, r4, #0
	mov r1, #9
	bl sub_0202AEA8
	mov r1, #0
	str r1, [r0]
	pop {r4, pc}
	thumb_func_end sub_0206DCC4

	.rodata

_020FE8A4:
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
_020FE8B0:
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00
_020FE8D4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x11, 0x00
_020FECAE:
	.byte 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020FF088:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00
	.byte 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x07, 0x00, 0x08, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0C, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x11, 0x00, 0x12, 0x00, 0x13, 0x00
	.byte 0x14, 0x00, 0x15, 0x00, 0x16, 0x00, 0x17, 0x00, 0x18, 0x00, 0x19, 0x00, 0x1B, 0x00, 0x1C, 0x00
	.byte 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x20, 0x00, 0x21, 0x00, 0x22, 0x00, 0x23, 0x00, 0x24, 0x00
	.byte 0x25, 0x00, 0x26, 0x00, 0x27, 0x00, 0x28, 0x00, 0x29, 0x00, 0x2A, 0x00, 0x2B, 0x00, 0x2C, 0x00
	.byte 0x2D, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x31, 0x00, 0x32, 0x00, 0x33, 0x00, 0x34, 0x00
	.byte 0x35, 0x00, 0x36, 0x00, 0x37, 0x00, 0x38, 0x00, 0x39, 0x00, 0x3A, 0x00, 0x3B, 0x00, 0x3C, 0x00
	.byte 0x3D, 0x00, 0x3E, 0x00, 0x3F, 0x00, 0x40, 0x00, 0x41, 0x00, 0x42, 0x00, 0x43, 0x00, 0x44, 0x00
	.byte 0x45, 0x00, 0x46, 0x00, 0x47, 0x00, 0x48, 0x00, 0x49, 0x00, 0x4A, 0x00, 0x4B, 0x00, 0x4C, 0x00
	.byte 0x4D, 0x00, 0x4E, 0x00, 0x4F, 0x00, 0x50, 0x00, 0x51, 0x00, 0x52, 0x00, 0x53, 0x00, 0x54, 0x00
	.byte 0x55, 0x00, 0x56, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5A, 0x00, 0x5B, 0x00, 0x5C, 0x00
	.byte 0x5D, 0x00, 0x5E, 0x00, 0x5F, 0x00, 0x60, 0x00, 0x61, 0x00, 0x62, 0x00, 0x63, 0x00, 0x64, 0x00
	.byte 0x65, 0x00, 0x66, 0x00, 0x67, 0x00, 0x68, 0x00, 0x69, 0x00, 0x6A, 0x00, 0x6B, 0x00, 0x6C, 0x00
	.byte 0x6D, 0x00, 0x6E, 0x00, 0x6F, 0x00, 0x70, 0x00, 0x71, 0x00, 0x72, 0x00, 0x73, 0x00, 0x74, 0x00
	.byte 0x75, 0x00, 0x76, 0x00, 0x77, 0x00, 0x78, 0x00, 0x79, 0x00, 0x7A, 0x00, 0x7B, 0x00, 0x7C, 0x00
	.byte 0x7D, 0x00, 0x7E, 0x00, 0x7F, 0x00, 0x80, 0x00, 0x81, 0x00, 0x82, 0x00, 0x83, 0x00, 0x84, 0x00
	.byte 0x85, 0x00, 0x86, 0x00, 0x87, 0x00, 0x88, 0x00, 0x89, 0x00, 0x8A, 0x00, 0x8B, 0x00, 0x8C, 0x00
	.byte 0x8D, 0x00, 0x8E, 0x00, 0x8F, 0x00, 0x90, 0x00, 0x91, 0x00, 0x92, 0x00, 0x93, 0x00, 0x94, 0x00
	.byte 0x95, 0x00, 0x96, 0x00, 0x97, 0x00, 0x98, 0x00, 0x99, 0x00, 0x9A, 0x00, 0x9B, 0x00, 0x9D, 0x00
	.byte 0x9E, 0x00, 0x9F, 0x00, 0xA0, 0x00, 0xA1, 0x00, 0xA2, 0x00, 0xA3, 0x00, 0xA4, 0x00, 0xA5, 0x00
	.byte 0xA6, 0x00, 0xA7, 0x00, 0xA8, 0x00, 0xA9, 0x00, 0xAA, 0x00, 0xAB, 0x00, 0xAC, 0x00, 0xAD, 0x00
	.byte 0xAE, 0x00, 0xB0, 0x00, 0xB1, 0x00, 0xB2, 0x00, 0xB3, 0x00, 0xB4, 0x00, 0xB5, 0x00, 0xB6, 0x00
	.byte 0xB7, 0x00, 0xB8, 0x00, 0xB9, 0x00, 0xBA, 0x00, 0xBB, 0x00, 0xBC, 0x00, 0xBD, 0x00, 0xBE, 0x00
	.byte 0xBF, 0x00, 0xC0, 0x00, 0xC1, 0x00, 0xC2, 0x00, 0xC3, 0x00, 0xC4, 0x00, 0xC5, 0x00, 0xC6, 0x00
	.byte 0xC7, 0x00, 0xC8, 0x00, 0xC9, 0x00, 0xCA, 0x00, 0xCB, 0x00, 0xCC, 0x00, 0xE8, 0x00, 0xEA, 0x00
	.byte 0xEB, 0x00, 0xEC, 0x00, 0xED, 0x00, 0xEE, 0x00, 0xEF, 0x00, 0xF1, 0x00, 0xF2, 0x00, 0xF3, 0x00
	.byte 0xF4, 0x00, 0xF5, 0x00, 0xF6, 0x00, 0xF8, 0x00, 0xF9, 0x00, 0xFA, 0x00, 0xFB, 0x00, 0xFC, 0x00
	.byte 0xFD, 0x00, 0xFE, 0x00, 0xFF, 0x00, 0x00, 0x01, 0x01, 0x01, 0x02, 0x01, 0x03, 0x01, 0x04, 0x01
	.byte 0x05, 0x01, 0x06, 0x01, 0x07, 0x01, 0x08, 0x01, 0x09, 0x01, 0x0A, 0x01, 0x0B, 0x01, 0x0C, 0x01
	.byte 0x0D, 0x01, 0x0E, 0x01, 0x0F, 0x01, 0x10, 0x01, 0x11, 0x01, 0x12, 0x01, 0x13, 0x01, 0x14, 0x01
	.byte 0x15, 0x01, 0x16, 0x01, 0x17, 0x01, 0x18, 0x01, 0x19, 0x01, 0x1A, 0x01, 0x1B, 0x01, 0x1C, 0x01
	.byte 0x1D, 0x01, 0x1E, 0x01, 0x1F, 0x01, 0x20, 0x01, 0x21, 0x01, 0x22, 0x01, 0x23, 0x01, 0x24, 0x01
	.byte 0x25, 0x01, 0x26, 0x01, 0x27, 0x01, 0x28, 0x01, 0x29, 0x01, 0x2A, 0x01, 0x2B, 0x01, 0x2C, 0x01
	.byte 0x2D, 0x01, 0x2E, 0x01, 0x2F, 0x01, 0x30, 0x01, 0x31, 0x01, 0x32, 0x01, 0x33, 0x01, 0x34, 0x01
	.byte 0x35, 0x01, 0x36, 0x01, 0x37, 0x01, 0x38, 0x01, 0x39, 0x01, 0x3A, 0x01, 0x3B, 0x01, 0x3C, 0x01
	.byte 0x3D, 0x01, 0x3E, 0x01, 0x3F, 0x01, 0x40, 0x01, 0x41, 0x01, 0x42, 0x01, 0x43, 0x01, 0x44, 0x01
	.byte 0x45, 0x01, 0x46, 0x01, 0x47, 0x01, 0x48, 0x01, 0x49, 0x01, 0x4A, 0x01, 0x4B, 0x01, 0x4C, 0x01
	.byte 0x4D, 0x01, 0x4E, 0x01, 0x4F, 0x01, 0x50, 0x01, 0x51, 0x01, 0x52, 0x01, 0x53, 0x01, 0x54, 0x01
	.byte 0x55, 0x01, 0x56, 0x01, 0x57, 0x01, 0x58, 0x01, 0x59, 0x01, 0x5A, 0x01, 0x5B, 0x01, 0x5C, 0x01
	.byte 0x5D, 0x01, 0x5E, 0x01, 0x5F, 0x01, 0x60, 0x01, 0x61, 0x01, 0x62, 0x01, 0x63, 0x01, 0x64, 0x01
	.byte 0x65, 0x01, 0x66, 0x01, 0x67, 0x01, 0x68, 0x01, 0x69, 0x01, 0x6A, 0x01, 0x6B, 0x01, 0x6C, 0x01
	.byte 0x6D, 0x01, 0x6E, 0x01, 0x6F, 0x01, 0x70, 0x01, 0x71, 0x01, 0x72, 0x01, 0x73, 0x01, 0x74, 0x01
	.byte 0x75, 0x01, 0x76, 0x01, 0x77, 0x01, 0x78, 0x01, 0x79, 0x01, 0x7A, 0x01, 0x7B, 0x01, 0x7C, 0x01
	.byte 0x7D, 0x01, 0x7E, 0x01, 0x7F, 0x01, 0x80, 0x01, 0x81, 0x01, 0x82, 0x01, 0x83, 0x01, 0x84, 0x01
	.byte 0x85, 0x01, 0x86, 0x01, 0x87, 0x01, 0x88, 0x01, 0x89, 0x01, 0x8A, 0x01, 0x8B, 0x01, 0x8C, 0x01
	.byte 0x8D, 0x01, 0x8E, 0x01, 0x8F, 0x01, 0x90, 0x01, 0x91, 0x01, 0x92, 0x01, 0x93, 0x01, 0x94, 0x01
	.byte 0x95, 0x01, 0x96, 0x01, 0x97, 0x01, 0x98, 0x01, 0x99, 0x01, 0x9A, 0x01, 0x9B, 0x01, 0x9C, 0x01
	.byte 0x9D, 0x01, 0x9E, 0x01, 0x9F, 0x01, 0xA0, 0x01, 0xA1, 0x01, 0xA2, 0x01, 0xA3, 0x01, 0xA7, 0x01
	.byte 0xA8, 0x01, 0xA9, 0x01, 0xAA, 0x01, 0xAB, 0x01, 0xAC, 0x01, 0xAD, 0x01, 0xAE, 0x01, 0xAF, 0x01
	.byte 0xB0, 0x01, 0xB1, 0x01, 0xB2, 0x01, 0xB3, 0x01, 0xB4, 0x01, 0xB5, 0x01, 0xB6, 0x01, 0xB7, 0x01
	.byte 0xB8, 0x01, 0xB9, 0x01, 0xBA, 0x01, 0xBB, 0x01, 0xBC, 0x01, 0xBD, 0x01, 0xBE, 0x01, 0xBF, 0x01
	.byte 0xC0, 0x01, 0xC3, 0x01, 0xC6, 0x01, 0xC7, 0x01, 0xC9, 0x01, 0xCA, 0x01, 0xCB, 0x01, 0xCC, 0x01
	.byte 0xCD, 0x01, 0xCE, 0x01, 0xCF, 0x01, 0xD1, 0x01, 0xD3, 0x01, 0xD4, 0x01, 0xD5, 0x01, 0xD6, 0x01
	.byte 0xD7, 0x01, 0xD8, 0x01, 0xD9, 0x01, 0xDA, 0x01, 0xDB, 0x01, 0xDC, 0x01, 0xDD, 0x01, 0xDE, 0x01
	.byte 0xDF, 0x01, 0xE0, 0x01, 0xE1, 0x01, 0xE2, 0x01, 0xE3, 0x01, 0xE4, 0x01, 0xE5, 0x01, 0xE6, 0x01
	.byte 0xE8, 0x01, 0xEA, 0x01, 0xEC, 0x01, 0xED, 0x01, 0xEE, 0x01, 0xEF, 0x01, 0xF1, 0x01, 0xF3, 0x01
	.byte 0xF4, 0x01, 0xF5, 0x01, 0xF6, 0x01, 0xF7, 0x01, 0xF8, 0x01, 0xF9, 0x01, 0xFA, 0x01, 0xFB, 0x01
	.byte 0xFC, 0x01, 0xFD, 0x01, 0xFE, 0x01, 0xFF, 0x01, 0x00, 0x02, 0x01, 0x02, 0x02, 0x02, 0x03, 0x02
	.byte 0x04, 0x02, 0x05, 0x02, 0x06, 0x02, 0x07, 0x02, 0x08, 0x02, 0x09, 0x02, 0x0A, 0x02, 0x0B, 0x02
	.byte 0x0C, 0x02, 0x0D, 0x02, 0x0E, 0x02, 0x0F, 0x02, 0x15, 0x02, 0x16, 0x02, 0x17, 0x02, 0x18, 0x02
	.byte 0x19, 0x02, 0x1A, 0x02, 0x1B, 0x02, 0x1C, 0x02, 0x1E, 0x02, 0x1F, 0x02, 0x20, 0x02, 0x21, 0x02
	.byte 0x22, 0x02, 0x24, 0x02, 0x01, 0x00, 0xFF, 0xFF
_020FF468:
	.byte 0x02, 0x00
_020FF46A:
	.byte 0x00, 0x00
_020FF46C:
	.byte 0x01, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x03, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0xFE, 0xFF, 0x02, 0x00, 0xFE, 0xFF
_020FF480:
	.byte 0xDD, 0x78, 0x23, 0x02, 0xF9, 0x7A, 0x23, 0x02, 0x21, 0x7B, 0x23, 0x02, 0x39, 0x00, 0x00, 0x00
_020FF490:
	.byte 0x70, 0x00, 0xD6, 0x00, 0x2F, 0x01, 0x91, 0x01, 0xF5, 0x01, 0x63, 0x02, 0xC3, 0x02, 0x35, 0x03
	.byte 0x8B, 0x03, 0xA0, 0x03, 0x07, 0x04, 0x61, 0x04, 0xBE, 0x04, 0xC8, 0x04, 0xC9, 0x04
_020FF4AE:
	.byte 0x68, 0x01
_020FF4B0:
	.byte 0xFF, 0x00
_020FF4B2:
	.byte 0xCA, 0x00, 0x2A, 0x01, 0xFE, 0x00, 0xB7, 0x00, 0xB7, 0x01, 0x3A, 0x01, 0x7A, 0x00
	.byte 0xB6, 0x01, 0x3B, 0x01, 0xB9, 0x00, 0xBE, 0x01, 0x3C, 0x01, 0x8F, 0x00, 0xCA, 0x01, 0x3D, 0x01
	.byte 0xE2, 0x00, 0x96, 0x01, 0x3E, 0x01, 0x3B, 0x01, 0xB8, 0x01, 0x3F, 0x01, 0x71, 0x00, 0xB1, 0x01
	.byte 0x40, 0x01, 0x66, 0x01

	.data

_0210FAE8:
	.byte 0x7B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x6E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.byte 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x19, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x43, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0xEB, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00
	.byte 0x25, 0x00, 0x00, 0x00, 0x26, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00
	.byte 0x29, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00
	.byte 0x2A, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x72, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x2F, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00
	.byte 0x34, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x75, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x36, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00
	.byte 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00
	.byte 0x3D, 0x00, 0x00, 0x00, 0x3E, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x41, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x42, 0x00, 0x00, 0x00, 0x43, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x00, 0x45, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x47, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0x49, 0x00, 0x00, 0x00
	.byte 0x4A, 0x00, 0x00, 0x00, 0x4B, 0x00, 0x00, 0x00, 0x4C, 0x00, 0x00, 0x00, 0x4D, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4E, 0x00, 0x00, 0x00
	.byte 0x4F, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00
	.byte 0x53, 0x00, 0x00, 0x00, 0x54, 0x00, 0x00, 0x00, 0x55, 0x00, 0x00, 0x00, 0x56, 0x00, 0x00, 0x00
	.byte 0x57, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x59, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x00, 0x00
	.byte 0x5C, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x00, 0x62, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x65, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x79, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00, 0x67, 0x00, 0x00, 0x00, 0x68, 0x00, 0x00, 0x00
	.byte 0x69, 0x00, 0x00, 0x00, 0x6A, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00, 0x69, 0x00, 0x00, 0x00
	.byte 0x6A, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00, 0x6C, 0x00, 0x00, 0x00, 0x6D, 0x00, 0x00, 0x00
	.byte 0x6E, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x6F, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x71, 0x00, 0x00, 0x00, 0x72, 0x00, 0x00, 0x00
	.byte 0x73, 0x00, 0x00, 0x00, 0x74, 0x00, 0x00, 0x00, 0x75, 0x00, 0x00, 0x00, 0x76, 0x00, 0x00, 0x00
	.byte 0x77, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x79, 0x00, 0x00, 0x00, 0x7A, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7B, 0x00, 0x00, 0x00
	.byte 0x7C, 0x00, 0x00, 0x00, 0x7D, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x81, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00, 0x83, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x7D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x84, 0x00, 0x00, 0x00, 0x85, 0x00, 0x00, 0x00
	.byte 0x86, 0x00, 0x00, 0x00, 0x87, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x89, 0x00, 0x00, 0x00
	.byte 0x87, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x89, 0x00, 0x00, 0x00, 0x8A, 0x00, 0x00, 0x00
	.byte 0x8B, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x8D, 0x00, 0x00, 0x00, 0x8E, 0x00, 0x00, 0x00, 0x8F, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x91, 0x00, 0x00, 0x00, 0x92, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00
	.byte 0x91, 0x00, 0x00, 0x00, 0x92, 0x00, 0x00, 0x00, 0x93, 0x00, 0x00, 0x00, 0x94, 0x00, 0x00, 0x00
	.byte 0x95, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x96, 0x00, 0x00, 0x00, 0x97, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x99, 0x00, 0x00, 0x00
	.byte 0x9A, 0x00, 0x00, 0x00, 0x9B, 0x00, 0x00, 0x00, 0x99, 0x00, 0x00, 0x00, 0x9A, 0x00, 0x00, 0x00
	.byte 0x9B, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x00, 0x00, 0x9D, 0x00, 0x00, 0x00, 0x9E, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0xB3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00
	.byte 0x97, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x99, 0x00, 0x00, 0x00, 0x9A, 0x00, 0x00, 0x00
	.byte 0x9B, 0x00, 0x00, 0x00, 0x99, 0x00, 0x00, 0x00, 0x9A, 0x00, 0x00, 0x00, 0x9B, 0x00, 0x00, 0x00
	.byte 0x9C, 0x00, 0x00, 0x00, 0x9D, 0x00, 0x00, 0x00, 0x9E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x93, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x9F, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00
	.byte 0xA1, 0x00, 0x00, 0x00, 0xA2, 0x00, 0x00, 0x00, 0xA3, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0xA5, 0x00, 0x00, 0x00, 0xA6, 0x00, 0x00, 0x00, 0xA7, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x00, 0x00
	.byte 0xA9, 0x00, 0x00, 0x00, 0xAA, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x6A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xAB, 0x00, 0x00, 0x00, 0xAC, 0x00, 0x00, 0x00, 0xAD, 0x00, 0x00, 0x00
	.byte 0xAE, 0x00, 0x00, 0x00, 0xAF, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0xAE, 0x00, 0x00, 0x00
	.byte 0xAF, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0xB1, 0x00, 0x00, 0x00, 0xB2, 0x00, 0x00, 0x00
	.byte 0xB3, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x6C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB4, 0x00, 0x00, 0x00, 0xB5, 0x00, 0x00, 0x00, 0xB6, 0x00, 0x00, 0x00, 0xB7, 0x00, 0x00, 0x00
	.byte 0xB8, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0xB7, 0x00, 0x00, 0x00, 0xB8, 0x00, 0x00, 0x00
	.byte 0xB9, 0x00, 0x00, 0x00, 0xBA, 0x00, 0x00, 0x00, 0xBB, 0x00, 0x00, 0x00, 0xBC, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xBD, 0x00, 0x00, 0x00
	.byte 0xBE, 0x00, 0x00, 0x00, 0xBF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xC1, 0x00, 0x00, 0x00
	.byte 0xC2, 0x00, 0x00, 0x00, 0xC3, 0x00, 0x00, 0x00, 0xC4, 0x00, 0x00, 0x00, 0xC5, 0x00, 0x00, 0x00
	.byte 0xC6, 0x00, 0x00, 0x00, 0xC7, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x92, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC9, 0x00, 0x00, 0x00, 0xCA, 0x00, 0x00, 0x00
	.byte 0xCB, 0x00, 0x00, 0x00, 0xCC, 0x00, 0x00, 0x00, 0xCD, 0x00, 0x00, 0x00, 0xCE, 0x00, 0x00, 0x00
	.byte 0xCC, 0x00, 0x00, 0x00, 0xCD, 0x00, 0x00, 0x00, 0xCE, 0x00, 0x00, 0x00, 0xCF, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0x00, 0x00, 0xD1, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x7A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xD2, 0x00, 0x00, 0x00, 0xD3, 0x00, 0x00, 0x00, 0xD4, 0x00, 0x00, 0x00
	.byte 0xD5, 0x00, 0x00, 0x00, 0xD6, 0x00, 0x00, 0x00, 0xD7, 0x00, 0x00, 0x00, 0xD5, 0x00, 0x00, 0x00
	.byte 0xD6, 0x00, 0x00, 0x00, 0xD7, 0x00, 0x00, 0x00, 0xD8, 0x00, 0x00, 0x00, 0xD9, 0x00, 0x00, 0x00
	.byte 0xDA, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x91, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xDB, 0x00, 0x00, 0x00, 0xDC, 0x00, 0x00, 0x00, 0xDD, 0x00, 0x00, 0x00, 0xDE, 0x00, 0x00, 0x00
	.byte 0xDF, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 0xDE, 0x00, 0x00, 0x00, 0xDF, 0x00, 0x00, 0x00
	.byte 0xE0, 0x00, 0x00, 0x00, 0xE1, 0x00, 0x00, 0x00, 0xE2, 0x00, 0x00, 0x00, 0xE3, 0x00, 0x00, 0x00
	.byte 0x17, 0x00, 0x00, 0x00
_021100C4:
	.byte 0xC1, 0xAE, 0x29, 0x00
_021100C8:
	.byte 0x00, 0xEE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x30, 0x02, 0x96, 0x00, 0x00, 0x00, 0x84, 0x03, 0x00, 0x00
_021100DC:
	.byte 0x00, 0x05, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0xFD, 0xFF

	.bss

_021D4218:
	.space 4
