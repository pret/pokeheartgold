#include "constants/species.h"
#include "constants/maps.h"
#include "constants/sprites.h"
#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public NNS_G3dGlb

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
	ldr r2, _020699C8 ; =_020FE8A4
	ldr r3, _020699CC ; =_020FE8B0
	bl sub_020699AC
	pop {r3, pc}
	.balign 4, 0
_020699C8: .word _020FE8A4
_020699CC: .word _020FE8B0
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
	bl FollowingPokemon_GetSpriteID
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
	bl FollowingPokemon_GetSpriteID
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

	thumb_func_start FollowingPokemon_GetSpriteID
FollowingPokemon_GetSpriteID: ; 0x02069D70
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	cmp r5, #0
	ble _02069D82
	ldr r1, _02069DC0 ; =NATIONAL_DEX_COUNT
	cmp r5, r1
	ble _02069D88
_02069D82:
	mov r4, #SPRITE_TSURE_POKE_BULBASAUR>>2
	lsl r4, r4, #2
	b _02069DBC
_02069D88:
	bl SpeciesToOverworldModelIndexOffset
	mov r1, #0x6b
	lsl r1, r1, #2
	add r4, r0, r1
	add r0, r5, #0
	bl OverworldModelLookupHasFemaleForme
	cmp r0, #0
	beq _02069DA4
	cmp r7, #1
	bne _02069DB2
	add r4, r4, #1
	b _02069DB2
_02069DA4:
	add r0, r5, #0
	bl OverworldModelLookupFormeCount
	cmp r6, r0
	ble _02069DB0
	mov r6, #0
_02069DB0:
	add r4, r4, r6
_02069DB2:
	ldr r0, _02069DC4 ; =SPRITE_TSURE_POKE_ARCEUS_DARK
	cmp r4, r0
	ble _02069DBC
	mov r4, #SPRITE_TSURE_POKE_BULBASAUR>>2
	lsl r4, r4, #2
_02069DBC:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02069DC0: .word NATIONAL_DEX_COUNT
_02069DC4: .word SPRITE_TSURE_POKE_ARCEUS_DARK
	thumb_func_end FollowingPokemon_GetSpriteID

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
	bl SpeciesToOverworldModelIndexOffset
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
	bl SpeciesToOverworldModelIndexOffset
	add r4, r0, #0
	add r0, r6, #0
	bl OverworldModelLookupFormeCount
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
	bl FollowingPokemon_GetSpriteID
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

	thumb_func_start SpeciesToOverworldModelIndexOffset
SpeciesToOverworldModelIndexOffset: ; 0x0206A304
	lsl r1, r0, #1
	ldr r0, _0206A30C ; =_020FF088
	ldrh r0, [r0, r1]
	bx lr
	.balign 4, 0
_0206A30C: .word _020FF088
	thumb_func_end SpeciesToOverworldModelIndexOffset

	thumb_func_start OverworldModelLookupFormeCount
OverworldModelLookupFormeCount: ; 0x0206A310
	push {r3, lr}
	cmp r0, #0
	ble _0206A31C
	ldr r1, _0206A330 ; =NATIONAL_DEX_COUNT
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
	ldr r0, _0206A334 ; =_020FE8D4
	ldrh r0, [r0, r1]
	pop {r3, pc}
	nop
_0206A330: .word NATIONAL_DEX_COUNT
_0206A334: .word _020FE8D4
	thumb_func_end OverworldModelLookupFormeCount

	thumb_func_start OverworldModelLookupHasFemaleForme
OverworldModelLookupHasFemaleForme: ; 0x0206A338
	push {r3, lr}
	cmp r0, #0
	ble _0206A344
	ldr r1, _0206A358 ; =NATIONAL_DEX_COUNT
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
	ldr r0, _0206A35C ; =_020FECAE
	ldrh r0, [r0, r1]
	pop {r3, pc}
	nop
_0206A358: .word NATIONAL_DEX_COUNT
_0206A35C: .word _020FECAE
	thumb_func_end OverworldModelLookupHasFemaleForme

	thumb_func_start sub_0206A360
sub_0206A360: ; 0x0206A360
	push {r3, r4}
	ldr r4, _0206A384 ; =_0210FAE8
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
_0206A384: .word _0210FAE8
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
	bl GetBgColorMode
	strh r0, [r4, #0x14]
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl GetBgPriority
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl GetBgPriority
	str r0, [r4, #0x20]
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl GetBgPriority
	str r0, [r4, #0x24]
	ldr r0, [r4, #0xc]
	mov r1, #3
	bl GetBgPriority
	str r0, [r4, #0x28]
	ldr r0, [r4, #0xc]
	mov r1, #2
	mov r2, #0
	mov r3, #1
	bl SetBgControlParam
	mov r0, #3
	mov r1, #0
	bl SetBgPriority
	mov r0, #2
	mov r1, #1
	bl SetBgPriority
	mov r0, #0
	mov r1, #2
	bl SetBgPriority
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
	bl ToggleBgLayer
	ldrh r3, [r4, #0x14]
	ldr r0, [r4, #0xc]
	mov r1, #2
	lsl r3, r3, #0x18
	mov r2, #0
	lsr r3, r3, #0x18
	bl SetBgControlParam
	ldr r1, [r4, #0x1c]
	mov r0, #2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl SetBgPriority
	ldr r1, [r4, #0x20]
	mov r0, #0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl SetBgPriority
	ldr r1, [r4, #0x24]
	mov r0, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl SetBgPriority
	ldr r1, [r4, #0x28]
	mov r0, #3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl SetBgPriority
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
	bl WindowArray_dtor
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
	ldr r5, _0206A654 ; =_0210FAE8 + 8
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
	ldr r5, _0206A658 ; =_0210FAE8 + 12
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
	ldr r5, _0206A65C ; =_0210FAE8 + 16
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
_0206A654: .word _0210FAE8 + 8
_0206A658: .word _0210FAE8 + 12
_0206A65C: .word _0210FAE8 + 16
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

	thumb_func_start FieldSys_TakePhoto
FieldSys_TakePhoto: ; 0x0206A798
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
	bl GetPlayerXCoord
	strh r0, [r4, #0x30]
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	strh r0, [r4, #0x32]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
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
	bl Save_PhotoAlbum_get
	bl PhotoAlbum_GetIndexOfFirstEmptySlot
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
	thumb_func_end FieldSys_TakePhoto

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
	bl GetPlayerXCoord
	add r1, r4, #0
	add r1, #0x94
	strh r0, [r1]
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r1, r4, #0
	add r1, #0x96
	strh r0, [r1]
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, r4, #0
	add r1, #0x98
	strh r0, [r1]
	ldr r0, [r5, #0x20]
	ldr r1, [r0]
	add r0, r4, #0
	add r0, #0x9a
	strh r1, [r0]
	ldr r0, [r5, #0xc]
	bl Save_PhotoAlbum_get
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
	bl PhotoAlbum_GetNumSaved
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
	bl FieldSys_ApplicationIsRunning
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
	bl PhotoAlbum_SetPhotoByIndex
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
	ldr r0, _0206AEAC ; =NNS_G3dGlb + 0x80
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
	ldr r2, _0206AEB0 ; =_020FF464 + 4
	mov r0, #1
	str r0, [sp]
	ldrh r0, [r5, #0x34]
	ldrh r2, [r2, r1]
	add r0, r0, r2
	ldr r2, _0206AEB4 ; =_020FF464 + 6
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
	ldr r1, _0206AEB8 ; =ov01_021F7918
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
	ldr r1, _0206AEB8 ; =ov01_021F7918
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
_0206AEAC: .word NNS_G3dGlb + 0x80
_0206AEB0: .word _020FF464 + 4
_0206AEB4: .word _020FF464 + 6
_0206AEB8: .word ov01_021F7918
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
	bl FollowingPokemon_GetSpriteID
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
	ldr r0, _0206B008 ; =_021100C4
	add r1, r4, #0
	ldr r0, [r0]
	bl sub_020235D4
	ldr r0, _0206B00C ; =_021100C4 + 4
	add r1, r4, #0
	bl sub_02023558
	ldr r0, _0206B008 ; =_021100C4
	add r1, r4, #0
	ldrh r0, [r0, #0xe]
	bl sub_02023494
	ldr r0, _0206B008 ; =_021100C4
	add r1, r4, #0
	ldrh r0, [r0, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020233D8
	ldr r0, _0206B010 ; =_021100C4 + 24
	add r1, r4, #0
	bl sub_02023514
	pop {r4, pc}
	.balign 4, 0
_0206B008: .word _021100C4
_0206B00C: .word _021100C4 + 4
_0206B010: .word _021100C4 + 24
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
	bl Photo_init
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
	ldr r0, _0206B26C ; =_021100C4
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
_0206B26C: .word _021100C4
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
	ldr r6, _0206B6FC ; =_020FF464 + 4
	mov r0, #1
	str r0, [sp]
	ldrh r0, [r1, #0x34]
	ldrh r6, [r6, r2]
	add r0, r0, r6
	str r0, [sp, #4]
	ldrh r0, [r1, #0x36]
	ldr r1, _0206B700 ; =_020FF464 + 6
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
	ldr r1, _0206B704 ; =ov01_021F7918
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
	ldr r1, _0206B704 ; =ov01_021F7918
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
	bl Save_PhotoAlbum_get
	add r5, r0, #0
	bl PhotoAlbum_GetIndexOfFirstEmptySlot
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
	bl PhotoAlbum_GetPhotoByIndex
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
_0206B6FC: .word _020FF464 + 4
_0206B700: .word _020FF464 + 6
_0206B704: .word ov01_021F7918
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
	bl SetBgPriority
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
	ldr r1, _0206BB24 ; =_020FF480
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
	ldr r1, _0206BB28 ; =_0210159C
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
_0206BB24: .word _020FF480
_0206BB28: .word _0210159C
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
	bl Save_FlyPoints_get
	bl FlyPoints_GetPosition
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
	bl Save_FlyPoints_get
	bl FlyPoints_GetPosition
	ldr r2, [r0]
	ldr r1, _0206BD78 ; =MAP_D24R0204
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
_0206BD78: .word MAP_D24R0204
	thumb_func_end sub_0206BD44

	thumb_func_start sub_0206BD7C
sub_0206BD7C: ; 0x0206BD7C
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetPosition
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

	.rodata

_020FE8A4:
	.word 0x00001000
	.word 0x00001000
	.word 0x00001000
_020FE8B0:
	.word 0x00001000, 0x00000000, 0x00000000
	.word 0x00000000, 0x00001000, 0x00000000
	.word 0x00000000, 0x00000000, 0x00001000
_020FE8D4:
	.short 0          ; SPECIES_BULBASAUR
	.short 0          ; SPECIES_IVYSAUR
	.short 0          ; SPECIES_VENUSAUR
	.short 0          ; SPECIES_CHARMANDER
	.short 0          ; SPECIES_CHARMELEON
	.short 0          ; SPECIES_CHARIZARD
	.short 0          ; SPECIES_SQUIRTLE
	.short 0          ; SPECIES_WARTORTLE
	.short 0          ; SPECIES_BLASTOISE
	.short 0          ; SPECIES_CATERPIE
	.short 0          ; SPECIES_METAPOD
	.short 0          ; SPECIES_BUTTERFREE
	.short 0          ; SPECIES_WEEDLE
	.short 0          ; SPECIES_KAKUNA
	.short 0          ; SPECIES_BEEDRILL
	.short 0          ; SPECIES_PIDGEY
	.short 0          ; SPECIES_PIDGEOTTO
	.short 0          ; SPECIES_PIDGEOT
	.short 0          ; SPECIES_RATTATA
	.short 0          ; SPECIES_RATICATE
	.short 0          ; SPECIES_SPEAROW
	.short 0          ; SPECIES_FEAROW
	.short 0          ; SPECIES_EKANS
	.short 0          ; SPECIES_ARBOK
	.short 0          ; SPECIES_PIKACHU
	.short 0          ; SPECIES_RAICHU
	.short 0          ; SPECIES_SANDSHREW
	.short 0          ; SPECIES_SANDSLASH
	.short 0          ; SPECIES_NIDORAN_F
	.short 0          ; SPECIES_NIDORINA
	.short 0          ; SPECIES_NIDOQUEEN
	.short 0          ; SPECIES_NIDORAN_M
	.short 0          ; SPECIES_NIDORINO
	.short 0          ; SPECIES_NIDOKING
	.short 0          ; SPECIES_CLEFAIRY
	.short 0          ; SPECIES_CLEFABLE
	.short 0          ; SPECIES_VULPIX
	.short 0          ; SPECIES_NINETALES
	.short 0          ; SPECIES_JIGGLYPUFF
	.short 0          ; SPECIES_WIGGLYTUFF
	.short 0          ; SPECIES_ZUBAT
	.short 0          ; SPECIES_GOLBAT
	.short 0          ; SPECIES_ODDISH
	.short 0          ; SPECIES_GLOOM
	.short 0          ; SPECIES_VILEPLUME
	.short 0          ; SPECIES_PARAS
	.short 0          ; SPECIES_PARASECT
	.short 0          ; SPECIES_VENONAT
	.short 0          ; SPECIES_VENOMOTH
	.short 0          ; SPECIES_DIGLETT
	.short 0          ; SPECIES_DUGTRIO
	.short 0          ; SPECIES_MEOWTH
	.short 0          ; SPECIES_PERSIAN
	.short 0          ; SPECIES_PSYDUCK
	.short 0          ; SPECIES_GOLDUCK
	.short 0          ; SPECIES_MANKEY
	.short 0          ; SPECIES_PRIMEAPE
	.short 0          ; SPECIES_GROWLITHE
	.short 0          ; SPECIES_ARCANINE
	.short 0          ; SPECIES_POLIWAG
	.short 0          ; SPECIES_POLIWHIRL
	.short 0          ; SPECIES_POLIWRATH
	.short 0          ; SPECIES_ABRA
	.short 0          ; SPECIES_KADABRA
	.short 0          ; SPECIES_ALAKAZAM
	.short 0          ; SPECIES_MACHOP
	.short 0          ; SPECIES_MACHOKE
	.short 0          ; SPECIES_MACHAMP
	.short 0          ; SPECIES_BELLSPROUT
	.short 0          ; SPECIES_WEEPINBELL
	.short 0          ; SPECIES_VICTREEBEL
	.short 0          ; SPECIES_TENTACOOL
	.short 0          ; SPECIES_TENTACRUEL
	.short 0          ; SPECIES_GEODUDE
	.short 0          ; SPECIES_GRAVELER
	.short 0          ; SPECIES_GOLEM
	.short 0          ; SPECIES_PONYTA
	.short 0          ; SPECIES_RAPIDASH
	.short 0          ; SPECIES_SLOWPOKE
	.short 0          ; SPECIES_SLOWBRO
	.short 0          ; SPECIES_MAGNEMITE
	.short 0          ; SPECIES_MAGNETON
	.short 0          ; SPECIES_FARFETCHD
	.short 0          ; SPECIES_DODUO
	.short 0          ; SPECIES_DODRIO
	.short 0          ; SPECIES_SEEL
	.short 0          ; SPECIES_DEWGONG
	.short 0          ; SPECIES_GRIMER
	.short 0          ; SPECIES_MUK
	.short 0          ; SPECIES_SHELLDER
	.short 0          ; SPECIES_CLOYSTER
	.short 0          ; SPECIES_GASTLY
	.short 0          ; SPECIES_HAUNTER
	.short 0          ; SPECIES_GENGAR
	.short 0          ; SPECIES_ONIX
	.short 0          ; SPECIES_DROWZEE
	.short 0          ; SPECIES_HYPNO
	.short 0          ; SPECIES_KRABBY
	.short 0          ; SPECIES_KINGLER
	.short 0          ; SPECIES_VOLTORB
	.short 0          ; SPECIES_ELECTRODE
	.short 0          ; SPECIES_EXEGGCUTE
	.short 0          ; SPECIES_EXEGGUTOR
	.short 0          ; SPECIES_CUBONE
	.short 0          ; SPECIES_MAROWAK
	.short 0          ; SPECIES_HITMONLEE
	.short 0          ; SPECIES_HITMONCHAN
	.short 0          ; SPECIES_LICKITUNG
	.short 0          ; SPECIES_KOFFING
	.short 0          ; SPECIES_WEEZING
	.short 0          ; SPECIES_RHYHORN
	.short 0          ; SPECIES_RHYDON
	.short 0          ; SPECIES_CHANSEY
	.short 0          ; SPECIES_TANGELA
	.short 0          ; SPECIES_KANGASKHAN
	.short 0          ; SPECIES_HORSEA
	.short 0          ; SPECIES_SEADRA
	.short 0          ; SPECIES_GOLDEEN
	.short 0          ; SPECIES_SEAKING
	.short 0          ; SPECIES_STARYU
	.short 0          ; SPECIES_STARMIE
	.short 0          ; SPECIES_MR_MIME
	.short 0          ; SPECIES_SCYTHER
	.short 0          ; SPECIES_JYNX
	.short 0          ; SPECIES_ELECTABUZZ
	.short 0          ; SPECIES_MAGMAR
	.short 0          ; SPECIES_PINSIR
	.short 0          ; SPECIES_TAUROS
	.short 0          ; SPECIES_MAGIKARP
	.short 0          ; SPECIES_GYARADOS
	.short 0          ; SPECIES_LAPRAS
	.short 0          ; SPECIES_DITTO
	.short 0          ; SPECIES_EEVEE
	.short 0          ; SPECIES_VAPOREON
	.short 0          ; SPECIES_JOLTEON
	.short 0          ; SPECIES_FLAREON
	.short 0          ; SPECIES_PORYGON
	.short 0          ; SPECIES_OMANYTE
	.short 0          ; SPECIES_OMASTAR
	.short 0          ; SPECIES_KABUTO
	.short 0          ; SPECIES_KABUTOPS
	.short 0          ; SPECIES_AERODACTYL
	.short 0          ; SPECIES_SNORLAX
	.short 0          ; SPECIES_ARTICUNO
	.short 0          ; SPECIES_ZAPDOS
	.short 0          ; SPECIES_MOLTRES
	.short 0          ; SPECIES_DRATINI
	.short 0          ; SPECIES_DRAGONAIR
	.short 0          ; SPECIES_DRAGONITE
	.short 0          ; SPECIES_MEWTWO
	.short 0          ; SPECIES_MEW
	.short 0          ; SPECIES_CHIKORITA
	.short 0          ; SPECIES_BAYLEEF
	.short 0          ; SPECIES_MEGANIUM
	.short 0          ; SPECIES_CYNDAQUIL
	.short 0          ; SPECIES_QUILAVA
	.short 0          ; SPECIES_TYPHLOSION
	.short 0          ; SPECIES_TOTODILE
	.short 0          ; SPECIES_CROCONAW
	.short 0          ; SPECIES_FERALIGATR
	.short 0          ; SPECIES_SENTRET
	.short 0          ; SPECIES_FURRET
	.short 0          ; SPECIES_HOOTHOOT
	.short 0          ; SPECIES_NOCTOWL
	.short 0          ; SPECIES_LEDYBA
	.short 0          ; SPECIES_LEDIAN
	.short 0          ; SPECIES_SPINARAK
	.short 0          ; SPECIES_ARIADOS
	.short 0          ; SPECIES_CROBAT
	.short 0          ; SPECIES_CHINCHOU
	.short 0          ; SPECIES_LANTURN
	.short 1          ; SPECIES_PICHU
	.short 0          ; SPECIES_CLEFFA
	.short 0          ; SPECIES_IGGLYBUFF
	.short 0          ; SPECIES_TOGEPI
	.short 0          ; SPECIES_TOGETIC
	.short 0          ; SPECIES_NATU
	.short 0          ; SPECIES_XATU
	.short 0          ; SPECIES_MAREEP
	.short 0          ; SPECIES_FLAAFFY
	.short 0          ; SPECIES_AMPHAROS
	.short 0          ; SPECIES_BELLOSSOM
	.short 0          ; SPECIES_MARILL
	.short 0          ; SPECIES_AZUMARILL
	.short 0          ; SPECIES_SUDOWOODO
	.short 0          ; SPECIES_POLITOED
	.short 0          ; SPECIES_HOPPIP
	.short 0          ; SPECIES_SKIPLOOM
	.short 0          ; SPECIES_JUMPLUFF
	.short 0          ; SPECIES_AIPOM
	.short 0          ; SPECIES_SUNKERN
	.short 0          ; SPECIES_SUNFLORA
	.short 0          ; SPECIES_YANMA
	.short 0          ; SPECIES_WOOPER
	.short 0          ; SPECIES_QUAGSIRE
	.short 0          ; SPECIES_ESPEON
	.short 0          ; SPECIES_UMBREON
	.short 0          ; SPECIES_MURKROW
	.short 0          ; SPECIES_SLOWKING
	.short 0          ; SPECIES_MISDREAVUS
	.short 27         ; SPECIES_UNOWN
	.short 0          ; SPECIES_WOBBUFFET
	.short 0          ; SPECIES_GIRAFARIG
	.short 0          ; SPECIES_PINECO
	.short 0          ; SPECIES_FORRETRESS
	.short 0          ; SPECIES_DUNSPARCE
	.short 0          ; SPECIES_GLIGAR
	.short 0          ; SPECIES_STEELIX
	.short 0          ; SPECIES_SNUBBULL
	.short 0          ; SPECIES_GRANBULL
	.short 0          ; SPECIES_QWILFISH
	.short 0          ; SPECIES_SCIZOR
	.short 0          ; SPECIES_SHUCKLE
	.short 0          ; SPECIES_HERACROSS
	.short 0          ; SPECIES_SNEASEL
	.short 0          ; SPECIES_TEDDIURSA
	.short 0          ; SPECIES_URSARING
	.short 0          ; SPECIES_SLUGMA
	.short 0          ; SPECIES_MAGCARGO
	.short 0          ; SPECIES_SWINUB
	.short 0          ; SPECIES_PILOSWINE
	.short 0          ; SPECIES_CORSOLA
	.short 0          ; SPECIES_REMORAID
	.short 0          ; SPECIES_OCTILLERY
	.short 0          ; SPECIES_DELIBIRD
	.short 0          ; SPECIES_MANTINE
	.short 0          ; SPECIES_SKARMORY
	.short 0          ; SPECIES_HOUNDOUR
	.short 0          ; SPECIES_HOUNDOOM
	.short 0          ; SPECIES_KINGDRA
	.short 0          ; SPECIES_PHANPY
	.short 0          ; SPECIES_DONPHAN
	.short 0          ; SPECIES_PORYGON2
	.short 0          ; SPECIES_STANTLER
	.short 0          ; SPECIES_SMEARGLE
	.short 0          ; SPECIES_TYROGUE
	.short 0          ; SPECIES_HITMONTOP
	.short 0          ; SPECIES_SMOOCHUM
	.short 0          ; SPECIES_ELEKID
	.short 0          ; SPECIES_MAGBY
	.short 0          ; SPECIES_MILTANK
	.short 0          ; SPECIES_BLISSEY
	.short 0          ; SPECIES_RAIKOU
	.short 0          ; SPECIES_ENTEI
	.short 0          ; SPECIES_SUICUNE
	.short 0          ; SPECIES_LARVITAR
	.short 0          ; SPECIES_PUPITAR
	.short 0          ; SPECIES_TYRANITAR
	.short 0          ; SPECIES_LUGIA
	.short 0          ; SPECIES_HO_OH
	.short 0          ; SPECIES_CELEBI
	.short 0          ; SPECIES_TREECKO
	.short 0          ; SPECIES_GROVYLE
	.short 0          ; SPECIES_SCEPTILE
	.short 0          ; SPECIES_TORCHIC
	.short 0          ; SPECIES_COMBUSKEN
	.short 0          ; SPECIES_BLAZIKEN
	.short 0          ; SPECIES_MUDKIP
	.short 0          ; SPECIES_MARSHTOMP
	.short 0          ; SPECIES_SWAMPERT
	.short 0          ; SPECIES_POOCHYENA
	.short 0          ; SPECIES_MIGHTYENA
	.short 0          ; SPECIES_ZIGZAGOON
	.short 0          ; SPECIES_LINOONE
	.short 0          ; SPECIES_WURMPLE
	.short 0          ; SPECIES_SILCOON
	.short 0          ; SPECIES_BEAUTIFLY
	.short 0          ; SPECIES_CASCOON
	.short 0          ; SPECIES_DUSTOX
	.short 0          ; SPECIES_LOTAD
	.short 0          ; SPECIES_LOMBRE
	.short 0          ; SPECIES_LUDICOLO
	.short 0          ; SPECIES_SEEDOT
	.short 0          ; SPECIES_NUZLEAF
	.short 0          ; SPECIES_SHIFTRY
	.short 0          ; SPECIES_TAILLOW
	.short 0          ; SPECIES_SWELLOW
	.short 0          ; SPECIES_WINGULL
	.short 0          ; SPECIES_PELIPPER
	.short 0          ; SPECIES_RALTS
	.short 0          ; SPECIES_KIRLIA
	.short 0          ; SPECIES_GARDEVOIR
	.short 0          ; SPECIES_SURSKIT
	.short 0          ; SPECIES_MASQUERAIN
	.short 0          ; SPECIES_SHROOMISH
	.short 0          ; SPECIES_BRELOOM
	.short 0          ; SPECIES_SLAKOTH
	.short 0          ; SPECIES_VIGOROTH
	.short 0          ; SPECIES_SLAKING
	.short 0          ; SPECIES_NINCADA
	.short 0          ; SPECIES_NINJASK
	.short 0          ; SPECIES_SHEDINJA
	.short 0          ; SPECIES_WHISMUR
	.short 0          ; SPECIES_LOUDRED
	.short 0          ; SPECIES_EXPLOUD
	.short 0          ; SPECIES_MAKUHITA
	.short 0          ; SPECIES_HARIYAMA
	.short 0          ; SPECIES_AZURILL
	.short 0          ; SPECIES_NOSEPASS
	.short 0          ; SPECIES_SKITTY
	.short 0          ; SPECIES_DELCATTY
	.short 0          ; SPECIES_SABLEYE
	.short 0          ; SPECIES_MAWILE
	.short 0          ; SPECIES_ARON
	.short 0          ; SPECIES_LAIRON
	.short 0          ; SPECIES_AGGRON
	.short 0          ; SPECIES_MEDITITE
	.short 0          ; SPECIES_MEDICHAM
	.short 0          ; SPECIES_ELECTRIKE
	.short 0          ; SPECIES_MANECTRIC
	.short 0          ; SPECIES_PLUSLE
	.short 0          ; SPECIES_MINUN
	.short 0          ; SPECIES_VOLBEAT
	.short 0          ; SPECIES_ILLUMISE
	.short 0          ; SPECIES_ROSELIA
	.short 0          ; SPECIES_GULPIN
	.short 0          ; SPECIES_SWALOT
	.short 0          ; SPECIES_CARVANHA
	.short 0          ; SPECIES_SHARPEDO
	.short 0          ; SPECIES_WAILMER
	.short 0          ; SPECIES_WAILORD
	.short 0          ; SPECIES_NUMEL
	.short 0          ; SPECIES_CAMERUPT
	.short 0          ; SPECIES_TORKOAL
	.short 0          ; SPECIES_SPOINK
	.short 0          ; SPECIES_GRUMPIG
	.short 0          ; SPECIES_SPINDA
	.short 0          ; SPECIES_TRAPINCH
	.short 0          ; SPECIES_VIBRAVA
	.short 0          ; SPECIES_FLYGON
	.short 0          ; SPECIES_CACNEA
	.short 0          ; SPECIES_CACTURNE
	.short 0          ; SPECIES_SWABLU
	.short 0          ; SPECIES_ALTARIA
	.short 0          ; SPECIES_ZANGOOSE
	.short 0          ; SPECIES_SEVIPER
	.short 0          ; SPECIES_LUNATONE
	.short 0          ; SPECIES_SOLROCK
	.short 0          ; SPECIES_BARBOACH
	.short 0          ; SPECIES_WHISCASH
	.short 0          ; SPECIES_CORPHISH
	.short 0          ; SPECIES_CRAWDAUNT
	.short 0          ; SPECIES_BALTOY
	.short 0          ; SPECIES_CLAYDOL
	.short 0          ; SPECIES_LILEEP
	.short 0          ; SPECIES_CRADILY
	.short 0          ; SPECIES_ANORITH
	.short 0          ; SPECIES_ARMALDO
	.short 0          ; SPECIES_FEEBAS
	.short 0          ; SPECIES_MILOTIC
	.short 0          ; SPECIES_CASTFORM
	.short 0          ; SPECIES_KECLEON
	.short 0          ; SPECIES_SHUPPET
	.short 0          ; SPECIES_BANETTE
	.short 0          ; SPECIES_DUSKULL
	.short 0          ; SPECIES_DUSCLOPS
	.short 0          ; SPECIES_TROPIUS
	.short 0          ; SPECIES_CHIMECHO
	.short 0          ; SPECIES_ABSOL
	.short 0          ; SPECIES_WYNAUT
	.short 0          ; SPECIES_SNORUNT
	.short 0          ; SPECIES_GLALIE
	.short 0          ; SPECIES_SPHEAL
	.short 0          ; SPECIES_SEALEO
	.short 0          ; SPECIES_WALREIN
	.short 0          ; SPECIES_CLAMPERL
	.short 0          ; SPECIES_HUNTAIL
	.short 0          ; SPECIES_GOREBYSS
	.short 0          ; SPECIES_RELICANTH
	.short 0          ; SPECIES_LUVDISC
	.short 0          ; SPECIES_BAGON
	.short 0          ; SPECIES_SHELGON
	.short 0          ; SPECIES_SALAMENCE
	.short 0          ; SPECIES_BELDUM
	.short 0          ; SPECIES_METANG
	.short 0          ; SPECIES_METAGROSS
	.short 0          ; SPECIES_REGIROCK
	.short 0          ; SPECIES_REGICE
	.short 0          ; SPECIES_REGISTEEL
	.short 0          ; SPECIES_LATIAS
	.short 0          ; SPECIES_LATIOS
	.short 0          ; SPECIES_KYOGRE
	.short 0          ; SPECIES_GROUDON
	.short 0          ; SPECIES_RAYQUAZA
	.short 0          ; SPECIES_JIRACHI
	.short 3          ; SPECIES_DEOXYS
	.short 0          ; SPECIES_TURTWIG
	.short 0          ; SPECIES_GROTLE
	.short 0          ; SPECIES_TORTERRA
	.short 0          ; SPECIES_CHIMCHAR
	.short 0          ; SPECIES_MONFERNO
	.short 0          ; SPECIES_INFERNAPE
	.short 0          ; SPECIES_PIPLUP
	.short 0          ; SPECIES_PRINPLUP
	.short 0          ; SPECIES_EMPOLEON
	.short 0          ; SPECIES_STARLY
	.short 0          ; SPECIES_STARAVIA
	.short 0          ; SPECIES_STARAPTOR
	.short 0          ; SPECIES_BIDOOF
	.short 0          ; SPECIES_BIBAREL
	.short 0          ; SPECIES_KRICKETOT
	.short 0          ; SPECIES_KRICKETUNE
	.short 0          ; SPECIES_SHINX
	.short 0          ; SPECIES_LUXIO
	.short 0          ; SPECIES_LUXRAY
	.short 0          ; SPECIES_BUDEW
	.short 0          ; SPECIES_ROSERADE
	.short 0          ; SPECIES_CRANIDOS
	.short 0          ; SPECIES_RAMPARDOS
	.short 0          ; SPECIES_SHIELDON
	.short 0          ; SPECIES_BASTIODON
	.short 2          ; SPECIES_BURMY
	.short 2          ; SPECIES_WORMADAM
	.short 0          ; SPECIES_MOTHIM
	.short 0          ; SPECIES_COMBEE
	.short 0          ; SPECIES_VESPIQUEN
	.short 0          ; SPECIES_PACHIRISU
	.short 0          ; SPECIES_BUIZEL
	.short 0          ; SPECIES_FLOATZEL
	.short 0          ; SPECIES_CHERUBI
	.short 0          ; SPECIES_CHERRIM
	.short 1          ; SPECIES_SHELLOS
	.short 1          ; SPECIES_GASTRODON
	.short 0          ; SPECIES_AMBIPOM
	.short 0          ; SPECIES_DRIFLOON
	.short 0          ; SPECIES_DRIFBLIM
	.short 0          ; SPECIES_BUNEARY
	.short 0          ; SPECIES_LOPUNNY
	.short 0          ; SPECIES_MISMAGIUS
	.short 0          ; SPECIES_HONCHKROW
	.short 0          ; SPECIES_GLAMEOW
	.short 0          ; SPECIES_PURUGLY
	.short 0          ; SPECIES_CHINGLING
	.short 0          ; SPECIES_STUNKY
	.short 0          ; SPECIES_SKUNTANK
	.short 0          ; SPECIES_BRONZOR
	.short 0          ; SPECIES_BRONZONG
	.short 0          ; SPECIES_BONSLY
	.short 0          ; SPECIES_MIME_JR
	.short 0          ; SPECIES_HAPPINY
	.short 0          ; SPECIES_CHATOT
	.short 0          ; SPECIES_SPIRITOMB
	.short 0          ; SPECIES_GIBLE
	.short 0          ; SPECIES_GABITE
	.short 0          ; SPECIES_GARCHOMP
	.short 0          ; SPECIES_MUNCHLAX
	.short 0          ; SPECIES_RIOLU
	.short 0          ; SPECIES_LUCARIO
	.short 0          ; SPECIES_HIPPOPOTAS
	.short 0          ; SPECIES_HIPPOWDON
	.short 0          ; SPECIES_SKORUPI
	.short 0          ; SPECIES_DRAPION
	.short 0          ; SPECIES_CROAGUNK
	.short 0          ; SPECIES_TOXICROAK
	.short 0          ; SPECIES_CARNIVINE
	.short 0          ; SPECIES_FINNEON
	.short 0          ; SPECIES_LUMINEON
	.short 0          ; SPECIES_MANTYKE
	.short 0          ; SPECIES_SNOVER
	.short 0          ; SPECIES_ABOMASNOW
	.short 0          ; SPECIES_WEAVILE
	.short 0          ; SPECIES_MAGNEZONE
	.short 0          ; SPECIES_LICKILICKY
	.short 0          ; SPECIES_RHYPERIOR
	.short 0          ; SPECIES_TANGROWTH
	.short 0          ; SPECIES_ELECTIVIRE
	.short 0          ; SPECIES_MAGMORTAR
	.short 0          ; SPECIES_TOGEKISS
	.short 0          ; SPECIES_YANMEGA
	.short 0          ; SPECIES_LEAFEON
	.short 0          ; SPECIES_GLACEON
	.short 0          ; SPECIES_GLISCOR
	.short 0          ; SPECIES_MAMOSWINE
	.short 0          ; SPECIES_PORYGON_Z
	.short 0          ; SPECIES_GALLADE
	.short 0          ; SPECIES_PROBOPASS
	.short 0          ; SPECIES_DUSKNOIR
	.short 0          ; SPECIES_FROSLASS
	.short 5          ; SPECIES_ROTOM
	.short 0          ; SPECIES_UXIE
	.short 0          ; SPECIES_MESPRIT
	.short 0          ; SPECIES_AZELF
	.short 0          ; SPECIES_DIALGA
	.short 0          ; SPECIES_PALKIA
	.short 0          ; SPECIES_HEATRAN
	.short 0          ; SPECIES_REGIGIGAS
	.short 1          ; SPECIES_GIRATINA
	.short 0          ; SPECIES_CRESSELIA
	.short 0          ; SPECIES_PHIONE
	.short 0          ; SPECIES_MANAPHY
	.short 0          ; SPECIES_DARKRAI
	.short 1          ; SPECIES_SHAYMIN
	.short 17         ; SPECIES_ARCEUS

_020FECAE:
	.short 0          ; SPECIES_BULBASAUR
	.short 0          ; SPECIES_IVYSAUR
	.short 1          ; SPECIES_VENUSAUR
	.short 0          ; SPECIES_CHARMANDER
	.short 0          ; SPECIES_CHARMELEON
	.short 0          ; SPECIES_CHARIZARD
	.short 0          ; SPECIES_SQUIRTLE
	.short 0          ; SPECIES_WARTORTLE
	.short 0          ; SPECIES_BLASTOISE
	.short 0          ; SPECIES_CATERPIE
	.short 0          ; SPECIES_METAPOD
	.short 0          ; SPECIES_BUTTERFREE
	.short 0          ; SPECIES_WEEDLE
	.short 0          ; SPECIES_KAKUNA
	.short 0          ; SPECIES_BEEDRILL
	.short 0          ; SPECIES_PIDGEY
	.short 0          ; SPECIES_PIDGEOTTO
	.short 0          ; SPECIES_PIDGEOT
	.short 0          ; SPECIES_RATTATA
	.short 0          ; SPECIES_RATICATE
	.short 0          ; SPECIES_SPEAROW
	.short 0          ; SPECIES_FEAROW
	.short 0          ; SPECIES_EKANS
	.short 0          ; SPECIES_ARBOK
	.short 1          ; SPECIES_PIKACHU
	.short 0          ; SPECIES_RAICHU
	.short 0          ; SPECIES_SANDSHREW
	.short 0          ; SPECIES_SANDSLASH
	.short 0          ; SPECIES_NIDORAN_F
	.short 0          ; SPECIES_NIDORINA
	.short 0          ; SPECIES_NIDOQUEEN
	.short 0          ; SPECIES_NIDORAN_M
	.short 0          ; SPECIES_NIDORINO
	.short 0          ; SPECIES_NIDOKING
	.short 0          ; SPECIES_CLEFAIRY
	.short 0          ; SPECIES_CLEFABLE
	.short 0          ; SPECIES_VULPIX
	.short 0          ; SPECIES_NINETALES
	.short 0          ; SPECIES_JIGGLYPUFF
	.short 0          ; SPECIES_WIGGLYTUFF
	.short 0          ; SPECIES_ZUBAT
	.short 0          ; SPECIES_GOLBAT
	.short 0          ; SPECIES_ODDISH
	.short 0          ; SPECIES_GLOOM
	.short 0          ; SPECIES_VILEPLUME
	.short 0          ; SPECIES_PARAS
	.short 0          ; SPECIES_PARASECT
	.short 0          ; SPECIES_VENONAT
	.short 0          ; SPECIES_VENOMOTH
	.short 0          ; SPECIES_DIGLETT
	.short 0          ; SPECIES_DUGTRIO
	.short 0          ; SPECIES_MEOWTH
	.short 0          ; SPECIES_PERSIAN
	.short 0          ; SPECIES_PSYDUCK
	.short 0          ; SPECIES_GOLDUCK
	.short 0          ; SPECIES_MANKEY
	.short 0          ; SPECIES_PRIMEAPE
	.short 0          ; SPECIES_GROWLITHE
	.short 0          ; SPECIES_ARCANINE
	.short 0          ; SPECIES_POLIWAG
	.short 0          ; SPECIES_POLIWHIRL
	.short 0          ; SPECIES_POLIWRATH
	.short 0          ; SPECIES_ABRA
	.short 0          ; SPECIES_KADABRA
	.short 0          ; SPECIES_ALAKAZAM
	.short 0          ; SPECIES_MACHOP
	.short 0          ; SPECIES_MACHOKE
	.short 0          ; SPECIES_MACHAMP
	.short 0          ; SPECIES_BELLSPROUT
	.short 0          ; SPECIES_WEEPINBELL
	.short 0          ; SPECIES_VICTREEBEL
	.short 0          ; SPECIES_TENTACOOL
	.short 0          ; SPECIES_TENTACRUEL
	.short 0          ; SPECIES_GEODUDE
	.short 0          ; SPECIES_GRAVELER
	.short 0          ; SPECIES_GOLEM
	.short 0          ; SPECIES_PONYTA
	.short 0          ; SPECIES_RAPIDASH
	.short 0          ; SPECIES_SLOWPOKE
	.short 0          ; SPECIES_SLOWBRO
	.short 0          ; SPECIES_MAGNEMITE
	.short 0          ; SPECIES_MAGNETON
	.short 0          ; SPECIES_FARFETCHD
	.short 0          ; SPECIES_DODUO
	.short 0          ; SPECIES_DODRIO
	.short 0          ; SPECIES_SEEL
	.short 0          ; SPECIES_DEWGONG
	.short 0          ; SPECIES_GRIMER
	.short 0          ; SPECIES_MUK
	.short 0          ; SPECIES_SHELLDER
	.short 0          ; SPECIES_CLOYSTER
	.short 0          ; SPECIES_GASTLY
	.short 0          ; SPECIES_HAUNTER
	.short 0          ; SPECIES_GENGAR
	.short 0          ; SPECIES_ONIX
	.short 0          ; SPECIES_DROWZEE
	.short 0          ; SPECIES_HYPNO
	.short 0          ; SPECIES_KRABBY
	.short 0          ; SPECIES_KINGLER
	.short 0          ; SPECIES_VOLTORB
	.short 0          ; SPECIES_ELECTRODE
	.short 0          ; SPECIES_EXEGGCUTE
	.short 0          ; SPECIES_EXEGGUTOR
	.short 0          ; SPECIES_CUBONE
	.short 0          ; SPECIES_MAROWAK
	.short 0          ; SPECIES_HITMONLEE
	.short 0          ; SPECIES_HITMONCHAN
	.short 0          ; SPECIES_LICKITUNG
	.short 0          ; SPECIES_KOFFING
	.short 0          ; SPECIES_WEEZING
	.short 0          ; SPECIES_RHYHORN
	.short 0          ; SPECIES_RHYDON
	.short 0          ; SPECIES_CHANSEY
	.short 0          ; SPECIES_TANGELA
	.short 0          ; SPECIES_KANGASKHAN
	.short 0          ; SPECIES_HORSEA
	.short 0          ; SPECIES_SEADRA
	.short 0          ; SPECIES_GOLDEEN
	.short 0          ; SPECIES_SEAKING
	.short 0          ; SPECIES_STARYU
	.short 0          ; SPECIES_STARMIE
	.short 0          ; SPECIES_MR_MIME
	.short 0          ; SPECIES_SCYTHER
	.short 0          ; SPECIES_JYNX
	.short 0          ; SPECIES_ELECTABUZZ
	.short 0          ; SPECIES_MAGMAR
	.short 0          ; SPECIES_PINSIR
	.short 0          ; SPECIES_TAUROS
	.short 0          ; SPECIES_MAGIKARP
	.short 0          ; SPECIES_GYARADOS
	.short 0          ; SPECIES_LAPRAS
	.short 0          ; SPECIES_DITTO
	.short 0          ; SPECIES_EEVEE
	.short 0          ; SPECIES_VAPOREON
	.short 0          ; SPECIES_JOLTEON
	.short 0          ; SPECIES_FLAREON
	.short 0          ; SPECIES_PORYGON
	.short 0          ; SPECIES_OMANYTE
	.short 0          ; SPECIES_OMASTAR
	.short 0          ; SPECIES_KABUTO
	.short 0          ; SPECIES_KABUTOPS
	.short 0          ; SPECIES_AERODACTYL
	.short 0          ; SPECIES_SNORLAX
	.short 0          ; SPECIES_ARTICUNO
	.short 0          ; SPECIES_ZAPDOS
	.short 0          ; SPECIES_MOLTRES
	.short 0          ; SPECIES_DRATINI
	.short 0          ; SPECIES_DRAGONAIR
	.short 0          ; SPECIES_DRAGONITE
	.short 0          ; SPECIES_MEWTWO
	.short 0          ; SPECIES_MEW
	.short 0          ; SPECIES_CHIKORITA
	.short 0          ; SPECIES_BAYLEEF
	.short 1          ; SPECIES_MEGANIUM
	.short 0          ; SPECIES_CYNDAQUIL
	.short 0          ; SPECIES_QUILAVA
	.short 0          ; SPECIES_TYPHLOSION
	.short 0          ; SPECIES_TOTODILE
	.short 0          ; SPECIES_CROCONAW
	.short 0          ; SPECIES_FERALIGATR
	.short 0          ; SPECIES_SENTRET
	.short 0          ; SPECIES_FURRET
	.short 0          ; SPECIES_HOOTHOOT
	.short 0          ; SPECIES_NOCTOWL
	.short 0          ; SPECIES_LEDYBA
	.short 0          ; SPECIES_LEDIAN
	.short 0          ; SPECIES_SPINARAK
	.short 0          ; SPECIES_ARIADOS
	.short 0          ; SPECIES_CROBAT
	.short 0          ; SPECIES_CHINCHOU
	.short 0          ; SPECIES_LANTURN
	.short 0          ; SPECIES_PICHU
	.short 0          ; SPECIES_CLEFFA
	.short 0          ; SPECIES_IGGLYBUFF
	.short 0          ; SPECIES_TOGEPI
	.short 0          ; SPECIES_TOGETIC
	.short 0          ; SPECIES_NATU
	.short 0          ; SPECIES_XATU
	.short 0          ; SPECIES_MAREEP
	.short 0          ; SPECIES_FLAAFFY
	.short 0          ; SPECIES_AMPHAROS
	.short 0          ; SPECIES_BELLOSSOM
	.short 0          ; SPECIES_MARILL
	.short 0          ; SPECIES_AZUMARILL
	.short 0          ; SPECIES_SUDOWOODO
	.short 0          ; SPECIES_POLITOED
	.short 0          ; SPECIES_HOPPIP
	.short 0          ; SPECIES_SKIPLOOM
	.short 0          ; SPECIES_JUMPLUFF
	.short 0          ; SPECIES_AIPOM
	.short 0          ; SPECIES_SUNKERN
	.short 0          ; SPECIES_SUNFLORA
	.short 0          ; SPECIES_YANMA
	.short 0          ; SPECIES_WOOPER
	.short 0          ; SPECIES_QUAGSIRE
	.short 0          ; SPECIES_ESPEON
	.short 0          ; SPECIES_UMBREON
	.short 0          ; SPECIES_MURKROW
	.short 0          ; SPECIES_SLOWKING
	.short 0          ; SPECIES_MISDREAVUS
	.short 0          ; SPECIES_UNOWN
	.short 1          ; SPECIES_WOBBUFFET
	.short 0          ; SPECIES_GIRAFARIG
	.short 0          ; SPECIES_PINECO
	.short 0          ; SPECIES_FORRETRESS
	.short 0          ; SPECIES_DUNSPARCE
	.short 0          ; SPECIES_GLIGAR
	.short 1          ; SPECIES_STEELIX
	.short 0          ; SPECIES_SNUBBULL
	.short 0          ; SPECIES_GRANBULL
	.short 0          ; SPECIES_QWILFISH
	.short 0          ; SPECIES_SCIZOR
	.short 0          ; SPECIES_SHUCKLE
	.short 1          ; SPECIES_HERACROSS
	.short 0          ; SPECIES_SNEASEL
	.short 0          ; SPECIES_TEDDIURSA
	.short 0          ; SPECIES_URSARING
	.short 0          ; SPECIES_SLUGMA
	.short 0          ; SPECIES_MAGCARGO
	.short 0          ; SPECIES_SWINUB
	.short 0          ; SPECIES_PILOSWINE
	.short 0          ; SPECIES_CORSOLA
	.short 0          ; SPECIES_REMORAID
	.short 0          ; SPECIES_OCTILLERY
	.short 0          ; SPECIES_DELIBIRD
	.short 0          ; SPECIES_MANTINE
	.short 0          ; SPECIES_SKARMORY
	.short 0          ; SPECIES_HOUNDOUR
	.short 0          ; SPECIES_HOUNDOOM
	.short 0          ; SPECIES_KINGDRA
	.short 0          ; SPECIES_PHANPY
	.short 0          ; SPECIES_DONPHAN
	.short 0          ; SPECIES_PORYGON2
	.short 0          ; SPECIES_STANTLER
	.short 0          ; SPECIES_SMEARGLE
	.short 0          ; SPECIES_TYROGUE
	.short 0          ; SPECIES_HITMONTOP
	.short 0          ; SPECIES_SMOOCHUM
	.short 0          ; SPECIES_ELEKID
	.short 0          ; SPECIES_MAGBY
	.short 0          ; SPECIES_MILTANK
	.short 0          ; SPECIES_BLISSEY
	.short 0          ; SPECIES_RAIKOU
	.short 0          ; SPECIES_ENTEI
	.short 0          ; SPECIES_SUICUNE
	.short 0          ; SPECIES_LARVITAR
	.short 0          ; SPECIES_PUPITAR
	.short 0          ; SPECIES_TYRANITAR
	.short 0          ; SPECIES_LUGIA
	.short 0          ; SPECIES_HO_OH
	.short 0          ; SPECIES_CELEBI
	.short 0          ; SPECIES_TREECKO
	.short 0          ; SPECIES_GROVYLE
	.short 0          ; SPECIES_SCEPTILE
	.short 0          ; SPECIES_TORCHIC
	.short 0          ; SPECIES_COMBUSKEN
	.short 0          ; SPECIES_BLAZIKEN
	.short 0          ; SPECIES_MUDKIP
	.short 0          ; SPECIES_MARSHTOMP
	.short 0          ; SPECIES_SWAMPERT
	.short 0          ; SPECIES_POOCHYENA
	.short 0          ; SPECIES_MIGHTYENA
	.short 0          ; SPECIES_ZIGZAGOON
	.short 0          ; SPECIES_LINOONE
	.short 0          ; SPECIES_WURMPLE
	.short 0          ; SPECIES_SILCOON
	.short 0          ; SPECIES_BEAUTIFLY
	.short 0          ; SPECIES_CASCOON
	.short 0          ; SPECIES_DUSTOX
	.short 0          ; SPECIES_LOTAD
	.short 0          ; SPECIES_LOMBRE
	.short 0          ; SPECIES_LUDICOLO
	.short 0          ; SPECIES_SEEDOT
	.short 0          ; SPECIES_NUZLEAF
	.short 0          ; SPECIES_SHIFTRY
	.short 0          ; SPECIES_TAILLOW
	.short 0          ; SPECIES_SWELLOW
	.short 0          ; SPECIES_WINGULL
	.short 0          ; SPECIES_PELIPPER
	.short 0          ; SPECIES_RALTS
	.short 0          ; SPECIES_KIRLIA
	.short 0          ; SPECIES_GARDEVOIR
	.short 0          ; SPECIES_SURSKIT
	.short 0          ; SPECIES_MASQUERAIN
	.short 0          ; SPECIES_SHROOMISH
	.short 0          ; SPECIES_BRELOOM
	.short 0          ; SPECIES_SLAKOTH
	.short 0          ; SPECIES_VIGOROTH
	.short 0          ; SPECIES_SLAKING
	.short 0          ; SPECIES_NINCADA
	.short 0          ; SPECIES_NINJASK
	.short 0          ; SPECIES_SHEDINJA
	.short 0          ; SPECIES_WHISMUR
	.short 0          ; SPECIES_LOUDRED
	.short 0          ; SPECIES_EXPLOUD
	.short 0          ; SPECIES_MAKUHITA
	.short 0          ; SPECIES_HARIYAMA
	.short 0          ; SPECIES_AZURILL
	.short 0          ; SPECIES_NOSEPASS
	.short 0          ; SPECIES_SKITTY
	.short 0          ; SPECIES_DELCATTY
	.short 0          ; SPECIES_SABLEYE
	.short 0          ; SPECIES_MAWILE
	.short 0          ; SPECIES_ARON
	.short 0          ; SPECIES_LAIRON
	.short 0          ; SPECIES_AGGRON
	.short 0          ; SPECIES_MEDITITE
	.short 0          ; SPECIES_MEDICHAM
	.short 0          ; SPECIES_ELECTRIKE
	.short 0          ; SPECIES_MANECTRIC
	.short 0          ; SPECIES_PLUSLE
	.short 0          ; SPECIES_MINUN
	.short 0          ; SPECIES_VOLBEAT
	.short 0          ; SPECIES_ILLUMISE
	.short 0          ; SPECIES_ROSELIA
	.short 0          ; SPECIES_GULPIN
	.short 0          ; SPECIES_SWALOT
	.short 0          ; SPECIES_CARVANHA
	.short 0          ; SPECIES_SHARPEDO
	.short 0          ; SPECIES_WAILMER
	.short 0          ; SPECIES_WAILORD
	.short 0          ; SPECIES_NUMEL
	.short 0          ; SPECIES_CAMERUPT
	.short 0          ; SPECIES_TORKOAL
	.short 0          ; SPECIES_SPOINK
	.short 0          ; SPECIES_GRUMPIG
	.short 0          ; SPECIES_SPINDA
	.short 0          ; SPECIES_TRAPINCH
	.short 0          ; SPECIES_VIBRAVA
	.short 0          ; SPECIES_FLYGON
	.short 0          ; SPECIES_CACNEA
	.short 0          ; SPECIES_CACTURNE
	.short 0          ; SPECIES_SWABLU
	.short 0          ; SPECIES_ALTARIA
	.short 0          ; SPECIES_ZANGOOSE
	.short 0          ; SPECIES_SEVIPER
	.short 0          ; SPECIES_LUNATONE
	.short 0          ; SPECIES_SOLROCK
	.short 0          ; SPECIES_BARBOACH
	.short 0          ; SPECIES_WHISCASH
	.short 0          ; SPECIES_CORPHISH
	.short 0          ; SPECIES_CRAWDAUNT
	.short 0          ; SPECIES_BALTOY
	.short 0          ; SPECIES_CLAYDOL
	.short 0          ; SPECIES_LILEEP
	.short 0          ; SPECIES_CRADILY
	.short 0          ; SPECIES_ANORITH
	.short 0          ; SPECIES_ARMALDO
	.short 0          ; SPECIES_FEEBAS
	.short 0          ; SPECIES_MILOTIC
	.short 0          ; SPECIES_CASTFORM
	.short 0          ; SPECIES_KECLEON
	.short 0          ; SPECIES_SHUPPET
	.short 0          ; SPECIES_BANETTE
	.short 0          ; SPECIES_DUSKULL
	.short 0          ; SPECIES_DUSCLOPS
	.short 0          ; SPECIES_TROPIUS
	.short 0          ; SPECIES_CHIMECHO
	.short 0          ; SPECIES_ABSOL
	.short 0          ; SPECIES_WYNAUT
	.short 0          ; SPECIES_SNORUNT
	.short 0          ; SPECIES_GLALIE
	.short 0          ; SPECIES_SPHEAL
	.short 0          ; SPECIES_SEALEO
	.short 0          ; SPECIES_WALREIN
	.short 0          ; SPECIES_CLAMPERL
	.short 0          ; SPECIES_HUNTAIL
	.short 0          ; SPECIES_GOREBYSS
	.short 0          ; SPECIES_RELICANTH
	.short 0          ; SPECIES_LUVDISC
	.short 0          ; SPECIES_BAGON
	.short 0          ; SPECIES_SHELGON
	.short 0          ; SPECIES_SALAMENCE
	.short 0          ; SPECIES_BELDUM
	.short 0          ; SPECIES_METANG
	.short 0          ; SPECIES_METAGROSS
	.short 0          ; SPECIES_REGIROCK
	.short 0          ; SPECIES_REGICE
	.short 0          ; SPECIES_REGISTEEL
	.short 0          ; SPECIES_LATIAS
	.short 0          ; SPECIES_LATIOS
	.short 0          ; SPECIES_KYOGRE
	.short 0          ; SPECIES_GROUDON
	.short 0          ; SPECIES_RAYQUAZA
	.short 0          ; SPECIES_JIRACHI
	.short 0          ; SPECIES_DEOXYS
	.short 0          ; SPECIES_TURTWIG
	.short 0          ; SPECIES_GROTLE
	.short 0          ; SPECIES_TORTERRA
	.short 0          ; SPECIES_CHIMCHAR
	.short 0          ; SPECIES_MONFERNO
	.short 0          ; SPECIES_INFERNAPE
	.short 0          ; SPECIES_PIPLUP
	.short 0          ; SPECIES_PRINPLUP
	.short 0          ; SPECIES_EMPOLEON
	.short 0          ; SPECIES_STARLY
	.short 0          ; SPECIES_STARAVIA
	.short 0          ; SPECIES_STARAPTOR
	.short 0          ; SPECIES_BIDOOF
	.short 0          ; SPECIES_BIBAREL
	.short 0          ; SPECIES_KRICKETOT
	.short 0          ; SPECIES_KRICKETUNE
	.short 0          ; SPECIES_SHINX
	.short 0          ; SPECIES_LUXIO
	.short 0          ; SPECIES_LUXRAY
	.short 0          ; SPECIES_BUDEW
	.short 0          ; SPECIES_ROSERADE
	.short 0          ; SPECIES_CRANIDOS
	.short 0          ; SPECIES_RAMPARDOS
	.short 0          ; SPECIES_SHIELDON
	.short 0          ; SPECIES_BASTIODON
	.short 0          ; SPECIES_BURMY
	.short 0          ; SPECIES_WORMADAM
	.short 0          ; SPECIES_MOTHIM
	.short 1          ; SPECIES_COMBEE
	.short 0          ; SPECIES_VESPIQUEN
	.short 0          ; SPECIES_PACHIRISU
	.short 0          ; SPECIES_BUIZEL
	.short 0          ; SPECIES_FLOATZEL
	.short 0          ; SPECIES_CHERUBI
	.short 0          ; SPECIES_CHERRIM
	.short 0          ; SPECIES_SHELLOS
	.short 0          ; SPECIES_GASTRODON
	.short 0          ; SPECIES_AMBIPOM
	.short 0          ; SPECIES_DRIFLOON
	.short 0          ; SPECIES_DRIFBLIM
	.short 0          ; SPECIES_BUNEARY
	.short 0          ; SPECIES_LOPUNNY
	.short 0          ; SPECIES_MISMAGIUS
	.short 0          ; SPECIES_HONCHKROW
	.short 0          ; SPECIES_GLAMEOW
	.short 0          ; SPECIES_PURUGLY
	.short 0          ; SPECIES_CHINGLING
	.short 0          ; SPECIES_STUNKY
	.short 0          ; SPECIES_SKUNTANK
	.short 0          ; SPECIES_BRONZOR
	.short 0          ; SPECIES_BRONZONG
	.short 0          ; SPECIES_BONSLY
	.short 0          ; SPECIES_MIME_JR
	.short 0          ; SPECIES_HAPPINY
	.short 0          ; SPECIES_CHATOT
	.short 0          ; SPECIES_SPIRITOMB
	.short 1          ; SPECIES_GIBLE
	.short 1          ; SPECIES_GABITE
	.short 1          ; SPECIES_GARCHOMP
	.short 0          ; SPECIES_MUNCHLAX
	.short 0          ; SPECIES_RIOLU
	.short 0          ; SPECIES_LUCARIO
	.short 1          ; SPECIES_HIPPOPOTAS
	.short 1          ; SPECIES_HIPPOWDON
	.short 0          ; SPECIES_SKORUPI
	.short 0          ; SPECIES_DRAPION
	.short 0          ; SPECIES_CROAGUNK
	.short 0          ; SPECIES_TOXICROAK
	.short 0          ; SPECIES_CARNIVINE
	.short 0          ; SPECIES_FINNEON
	.short 0          ; SPECIES_LUMINEON
	.short 0          ; SPECIES_MANTYKE
	.short 0          ; SPECIES_SNOVER
	.short 0          ; SPECIES_ABOMASNOW
	.short 0          ; SPECIES_WEAVILE
	.short 0          ; SPECIES_MAGNEZONE
	.short 0          ; SPECIES_LICKILICKY
	.short 0          ; SPECIES_RHYPERIOR
	.short 0          ; SPECIES_TANGROWTH
	.short 0          ; SPECIES_ELECTIVIRE
	.short 0          ; SPECIES_MAGMORTAR
	.short 0          ; SPECIES_TOGEKISS
	.short 0          ; SPECIES_YANMEGA
	.short 0          ; SPECIES_LEAFEON
	.short 0          ; SPECIES_GLACEON
	.short 0          ; SPECIES_GLISCOR
	.short 0          ; SPECIES_MAMOSWINE
	.short 0          ; SPECIES_PORYGON_Z
	.short 0          ; SPECIES_GALLADE
	.short 0          ; SPECIES_PROBOPASS
	.short 0          ; SPECIES_DUSKNOIR
	.short 0          ; SPECIES_FROSLASS
	.short 0          ; SPECIES_ROTOM
	.short 0          ; SPECIES_UXIE
	.short 0          ; SPECIES_MESPRIT
	.short 0          ; SPECIES_AZELF
	.short 0          ; SPECIES_DIALGA
	.short 0          ; SPECIES_PALKIA
	.short 0          ; SPECIES_HEATRAN
	.short 0          ; SPECIES_REGIGIGAS
	.short 0          ; SPECIES_GIRATINA
	.short 0          ; SPECIES_CRESSELIA
	.short 0          ; SPECIES_PHIONE
	.short 0          ; SPECIES_MANAPHY
	.short 0          ; SPECIES_DARKRAI
	.short 0          ; SPECIES_SHAYMIN
	.short 0          ; SPECIES_ARCEUS

_020FF088:
	.short 0x0000
	.short 0x0000
	.short 0x0001
	.short 0x0002
	.short 0x0004
	.short 0x0005
	.short 0x0006
	.short 0x0007
	.short 0x0008
	.short 0x0009
	.short 0x000A
	.short 0x000B
	.short 0x000C
	.short 0x000D
	.short 0x000E
	.short 0x000F
	.short 0x0010
	.short 0x0011
	.short 0x0012
	.short 0x0013
	.short 0x0014
	.short 0x0015
	.short 0x0016
	.short 0x0017
	.short 0x0018
	.short 0x0019
	.short 0x001B
	.short 0x001C
	.short 0x001D
	.short 0x001E
	.short 0x001F
	.short 0x0020
	.short 0x0021
	.short 0x0022
	.short 0x0023
	.short 0x0024
	.short 0x0025
	.short 0x0026
	.short 0x0027
	.short 0x0028
	.short 0x0029
	.short 0x002A
	.short 0x002B
	.short 0x002C
	.short 0x002D
	.short 0x002E
	.short 0x002F
	.short 0x0030
	.short 0x0031
	.short 0x0032
	.short 0x0033
	.short 0x0034
	.short 0x0035
	.short 0x0036
	.short 0x0037
	.short 0x0038
	.short 0x0039
	.short 0x003A
	.short 0x003B
	.short 0x003C
	.short 0x003D
	.short 0x003E
	.short 0x003F
	.short 0x0040
	.short 0x0041
	.short 0x0042
	.short 0x0043
	.short 0x0044
	.short 0x0045
	.short 0x0046
	.short 0x0047
	.short 0x0048
	.short 0x0049
	.short 0x004A
	.short 0x004B
	.short 0x004C
	.short 0x004D
	.short 0x004E
	.short 0x004F
	.short 0x0050
	.short 0x0051
	.short 0x0052
	.short 0x0053
	.short 0x0054
	.short 0x0055
	.short 0x0056
	.short 0x0057
	.short 0x0058
	.short 0x0059
	.short 0x005A
	.short 0x005B
	.short 0x005C
	.short 0x005D
	.short 0x005E
	.short 0x005F
	.short 0x0060
	.short 0x0061
	.short 0x0062
	.short 0x0063
	.short 0x0064
	.short 0x0065
	.short 0x0066
	.short 0x0067
	.short 0x0068
	.short 0x0069
	.short 0x006A
	.short 0x006B
	.short 0x006C
	.short 0x006D
	.short 0x006E
	.short 0x006F
	.short 0x0070
	.short 0x0071
	.short 0x0072
	.short 0x0073
	.short 0x0074
	.short 0x0075
	.short 0x0076
	.short 0x0077
	.short 0x0078
	.short 0x0079
	.short 0x007A
	.short 0x007B
	.short 0x007C
	.short 0x007D
	.short 0x007E
	.short 0x007F
	.short 0x0080
	.short 0x0081
	.short 0x0082
	.short 0x0083
	.short 0x0084
	.short 0x0085
	.short 0x0086
	.short 0x0087
	.short 0x0088
	.short 0x0089
	.short 0x008A
	.short 0x008B
	.short 0x008C
	.short 0x008D
	.short 0x008E
	.short 0x008F
	.short 0x0090
	.short 0x0091
	.short 0x0092
	.short 0x0093
	.short 0x0094
	.short 0x0095
	.short 0x0096
	.short 0x0097
	.short 0x0098
	.short 0x0099
	.short 0x009A
	.short 0x009B
	.short 0x009D
	.short 0x009E
	.short 0x009F
	.short 0x00A0
	.short 0x00A1
	.short 0x00A2
	.short 0x00A3
	.short 0x00A4
	.short 0x00A5
	.short 0x00A6
	.short 0x00A7
	.short 0x00A8
	.short 0x00A9
	.short 0x00AA
	.short 0x00AB
	.short 0x00AC
	.short 0x00AD
	.short 0x00AE
	.short 0x00B0
	.short 0x00B1
	.short 0x00B2
	.short 0x00B3
	.short 0x00B4
	.short 0x00B5
	.short 0x00B6
	.short 0x00B7
	.short 0x00B8
	.short 0x00B9
	.short 0x00BA
	.short 0x00BB
	.short 0x00BC
	.short 0x00BD
	.short 0x00BE
	.short 0x00BF
	.short 0x00C0
	.short 0x00C1
	.short 0x00C2
	.short 0x00C3
	.short 0x00C4
	.short 0x00C5
	.short 0x00C6
	.short 0x00C7
	.short 0x00C8
	.short 0x00C9
	.short 0x00CA
	.short 0x00CB
	.short 0x00CC
	.short 0x00E8
	.short 0x00EA
	.short 0x00EB
	.short 0x00EC
	.short 0x00ED
	.short 0x00EE
	.short 0x00EF
	.short 0x00F1
	.short 0x00F2
	.short 0x00F3
	.short 0x00F4
	.short 0x00F5
	.short 0x00F6
	.short 0x00F8
	.short 0x00F9
	.short 0x00FA
	.short 0x00FB
	.short 0x00FC
	.short 0x00FD
	.short 0x00FE
	.short 0x00FF
	.short 0x0100
	.short 0x0101
	.short 0x0102
	.short 0x0103
	.short 0x0104
	.short 0x0105
	.short 0x0106
	.short 0x0107
	.short 0x0108
	.short 0x0109
	.short 0x010A
	.short 0x010B
	.short 0x010C
	.short 0x010D
	.short 0x010E
	.short 0x010F
	.short 0x0110
	.short 0x0111
	.short 0x0112
	.short 0x0113
	.short 0x0114
	.short 0x0115
	.short 0x0116
	.short 0x0117
	.short 0x0118
	.short 0x0119
	.short 0x011A
	.short 0x011B
	.short 0x011C
	.short 0x011D
	.short 0x011E
	.short 0x011F
	.short 0x0120
	.short 0x0121
	.short 0x0122
	.short 0x0123
	.short 0x0124
	.short 0x0125
	.short 0x0126
	.short 0x0127
	.short 0x0128
	.short 0x0129
	.short 0x012A
	.short 0x012B
	.short 0x012C
	.short 0x012D
	.short 0x012E
	.short 0x012F
	.short 0x0130
	.short 0x0131
	.short 0x0132
	.short 0x0133
	.short 0x0134
	.short 0x0135
	.short 0x0136
	.short 0x0137
	.short 0x0138
	.short 0x0139
	.short 0x013A
	.short 0x013B
	.short 0x013C
	.short 0x013D
	.short 0x013E
	.short 0x013F
	.short 0x0140
	.short 0x0141
	.short 0x0142
	.short 0x0143
	.short 0x0144
	.short 0x0145
	.short 0x0146
	.short 0x0147
	.short 0x0148
	.short 0x0149
	.short 0x014A
	.short 0x014B
	.short 0x014C
	.short 0x014D
	.short 0x014E
	.short 0x014F
	.short 0x0150
	.short 0x0151
	.short 0x0152
	.short 0x0153
	.short 0x0154
	.short 0x0155
	.short 0x0156
	.short 0x0157
	.short 0x0158
	.short 0x0159
	.short 0x015A
	.short 0x015B
	.short 0x015C
	.short 0x015D
	.short 0x015E
	.short 0x015F
	.short 0x0160
	.short 0x0161
	.short 0x0162
	.short 0x0163
	.short 0x0164
	.short 0x0165
	.short 0x0166
	.short 0x0167
	.short 0x0168
	.short 0x0169
	.short 0x016A
	.short 0x016B
	.short 0x016C
	.short 0x016D
	.short 0x016E
	.short 0x016F
	.short 0x0170
	.short 0x0171
	.short 0x0172
	.short 0x0173
	.short 0x0174
	.short 0x0175
	.short 0x0176
	.short 0x0177
	.short 0x0178
	.short 0x0179
	.short 0x017A
	.short 0x017B
	.short 0x017C
	.short 0x017D
	.short 0x017E
	.short 0x017F
	.short 0x0180
	.short 0x0181
	.short 0x0182
	.short 0x0183
	.short 0x0184
	.short 0x0185
	.short 0x0186
	.short 0x0187
	.short 0x0188
	.short 0x0189
	.short 0x018A
	.short 0x018B
	.short 0x018C
	.short 0x018D
	.short 0x018E
	.short 0x018F
	.short 0x0190
	.short 0x0191
	.short 0x0192
	.short 0x0193
	.short 0x0194
	.short 0x0195
	.short 0x0196
	.short 0x0197
	.short 0x0198
	.short 0x0199
	.short 0x019A
	.short 0x019B
	.short 0x019C
	.short 0x019D
	.short 0x019E
	.short 0x019F
	.short 0x01A0
	.short 0x01A1
	.short 0x01A2
	.short 0x01A3
	.short 0x01A7
	.short 0x01A8
	.short 0x01A9
	.short 0x01AA
	.short 0x01AB
	.short 0x01AC
	.short 0x01AD
	.short 0x01AE
	.short 0x01AF
	.short 0x01B0
	.short 0x01B1
	.short 0x01B2
	.short 0x01B3
	.short 0x01B4
	.short 0x01B5
	.short 0x01B6
	.short 0x01B7
	.short 0x01B8
	.short 0x01B9
	.short 0x01BA
	.short 0x01BB
	.short 0x01BC
	.short 0x01BD
	.short 0x01BE
	.short 0x01BF
	.short 0x01C0
	.short 0x01C3
	.short 0x01C6
	.short 0x01C7
	.short 0x01C9
	.short 0x01CA
	.short 0x01CB
	.short 0x01CC
	.short 0x01CD
	.short 0x01CE
	.short 0x01CF
	.short 0x01D1
	.short 0x01D3
	.short 0x01D4
	.short 0x01D5
	.short 0x01D6
	.short 0x01D7
	.short 0x01D8
	.short 0x01D9
	.short 0x01DA
	.short 0x01DB
	.short 0x01DC
	.short 0x01DD
	.short 0x01DE
	.short 0x01DF
	.short 0x01E0
	.short 0x01E1
	.short 0x01E2
	.short 0x01E3
	.short 0x01E4
	.short 0x01E5
	.short 0x01E6
	.short 0x01E8
	.short 0x01EA
	.short 0x01EC
	.short 0x01ED
	.short 0x01EE
	.short 0x01EF
	.short 0x01F1
	.short 0x01F3
	.short 0x01F4
	.short 0x01F5
	.short 0x01F6
	.short 0x01F7
	.short 0x01F8
	.short 0x01F9
	.short 0x01FA
	.short 0x01FB
	.short 0x01FC
	.short 0x01FD
	.short 0x01FE
	.short 0x01FF
	.short 0x0200
	.short 0x0201
	.short 0x0202
	.short 0x0203
	.short 0x0204
	.short 0x0205
	.short 0x0206
	.short 0x0207
	.short 0x0208
	.short 0x0209
	.short 0x020A
	.short 0x020B
	.short 0x020C
	.short 0x020D
	.short 0x020E
	.short 0x020F
	.short 0x0215
	.short 0x0216
	.short 0x0217
	.short 0x0218
	.short 0x0219
	.short 0x021A
	.short 0x021B
	.short 0x021C
	.short 0x021E
	.short 0x021F
	.short 0x0220
	.short 0x0221
	.short 0x0222
	.short 0x0224

	; File boundary
_020FF464:
	.short 0x0001, 0xFFFF
	.short 0x0002, 0x0000
	.short 0x0001, 0xFFFF
	.short 0xFFFF, 0xFFFF
	.short 0x0003, 0xFFFF
	.short 0x0000, 0xFFFE
	.short 0x0002, 0xFFFE
_020FF480:
	.word ov57_022378DC, ov57_02237AF8, ov57_02237B20, SDK_OVERLAY_OVY_57_ID

	.data

_0210FAE8:
	.byte 0x7B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.byte 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.byte 0x6E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.byte 0x15, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x19, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

	.byte 0x43, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x1D, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00
	.byte 0x22, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

	.byte 0xEB, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00
	.byte 0x1D, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00
	.byte 0x22, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

	.byte 0x63, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00
	.byte 0x26, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00
	.byte 0x27, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00
	.byte 0x2B, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

	.byte 0x72, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00
	.byte 0x2F, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00
	.byte 0x34, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

	.byte 0x75, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x36, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00
	.byte 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00
	.byte 0x3C, 0x00, 0x00, 0x00, 0x3D, 0x00, 0x00, 0x00, 0x3E, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00

	.byte 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x43, 0x00, 0x00, 0x00
	.byte 0x44, 0x00, 0x00, 0x00, 0x45, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x47, 0x00, 0x00, 0x00
	.byte 0x48, 0x00, 0x00, 0x00, 0x49, 0x00, 0x00, 0x00, 0x4A, 0x00, 0x00, 0x00, 0x4B, 0x00, 0x00, 0x00
	.byte 0x4C, 0x00, 0x00, 0x00, 0x4D, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00

	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4E, 0x00, 0x00, 0x00, 0x4F, 0x00, 0x00, 0x00
	.byte 0x50, 0x00, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00, 0x53, 0x00, 0x00, 0x00
	.byte 0x54, 0x00, 0x00, 0x00, 0x55, 0x00, 0x00, 0x00, 0x56, 0x00, 0x00, 0x00, 0x57, 0x00, 0x00, 0x00
	.byte 0x58, 0x00, 0x00, 0x00, 0x59, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00

	.byte 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x00, 0x00
	.byte 0x5C, 0x00, 0x00, 0x00, 0x5D, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x00, 0x62, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x65, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00

	.byte 0x79, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00, 0x67, 0x00, 0x00, 0x00
	.byte 0x68, 0x00, 0x00, 0x00, 0x69, 0x00, 0x00, 0x00, 0x6A, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00
	.byte 0x69, 0x00, 0x00, 0x00, 0x6A, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00, 0x6C, 0x00, 0x00, 0x00
	.byte 0x6D, 0x00, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00

	.byte 0x77, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6F, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00
	.byte 0x71, 0x00, 0x00, 0x00, 0x72, 0x00, 0x00, 0x00, 0x73, 0x00, 0x00, 0x00, 0x74, 0x00, 0x00, 0x00
	.byte 0x75, 0x00, 0x00, 0x00, 0x76, 0x00, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00
	.byte 0x79, 0x00, 0x00, 0x00, 0x7A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00

	.byte 0x78, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7B, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00
	.byte 0x7D, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x7E, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00
	.byte 0x82, 0x00, 0x00, 0x00, 0x83, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00

	.byte 0x7D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x84, 0x00, 0x00, 0x00, 0x85, 0x00, 0x00, 0x00
	.byte 0x86, 0x00, 0x00, 0x00, 0x87, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x89, 0x00, 0x00, 0x00
	.byte 0x87, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x89, 0x00, 0x00, 0x00, 0x8A, 0x00, 0x00, 0x00
	.byte 0x8B, 0x00, 0x00, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00

	.byte 0x7E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x8D, 0x00, 0x00, 0x00, 0x8E, 0x00, 0x00, 0x00
	.byte 0x8F, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x91, 0x00, 0x00, 0x00, 0x92, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x91, 0x00, 0x00, 0x00, 0x92, 0x00, 0x00, 0x00, 0x93, 0x00, 0x00, 0x00
	.byte 0x94, 0x00, 0x00, 0x00, 0x95, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00

	.byte 0x7C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00, 0x97, 0x00, 0x00, 0x00
	.byte 0x98, 0x00, 0x00, 0x00, 0x99, 0x00, 0x00, 0x00, 0x9A, 0x00, 0x00, 0x00, 0x9B, 0x00, 0x00, 0x00
	.byte 0x99, 0x00, 0x00, 0x00, 0x9A, 0x00, 0x00, 0x00, 0x9B, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x00, 0x00
	.byte 0x9D, 0x00, 0x00, 0x00, 0x9E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00

	.byte 0xB3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00, 0x97, 0x00, 0x00, 0x00
	.byte 0x98, 0x00, 0x00, 0x00, 0x99, 0x00, 0x00, 0x00, 0x9A, 0x00, 0x00, 0x00, 0x9B, 0x00, 0x00, 0x00
	.byte 0x99, 0x00, 0x00, 0x00, 0x9A, 0x00, 0x00, 0x00, 0x9B, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x00, 0x00
	.byte 0x9D, 0x00, 0x00, 0x00, 0x9E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00

	.byte 0x93, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x9F, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00
	.byte 0xA1, 0x00, 0x00, 0x00, 0xA2, 0x00, 0x00, 0x00, 0xA3, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0xA5, 0x00, 0x00, 0x00, 0xA6, 0x00, 0x00, 0x00, 0xA7, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x00, 0x00
	.byte 0xA9, 0x00, 0x00, 0x00, 0xAA, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

	.byte 0x6A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xAB, 0x00, 0x00, 0x00, 0xAC, 0x00, 0x00, 0x00
	.byte 0xAD, 0x00, 0x00, 0x00, 0xAE, 0x00, 0x00, 0x00, 0xAF, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00
	.byte 0xAE, 0x00, 0x00, 0x00, 0xAF, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0xB1, 0x00, 0x00, 0x00
	.byte 0xB2, 0x00, 0x00, 0x00, 0xB3, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00

	.byte 0x6C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB4, 0x00, 0x00, 0x00, 0xB5, 0x00, 0x00, 0x00
	.byte 0xB6, 0x00, 0x00, 0x00, 0xB7, 0x00, 0x00, 0x00, 0xB8, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00
	.byte 0xB7, 0x00, 0x00, 0x00, 0xB8, 0x00, 0x00, 0x00, 0xB9, 0x00, 0x00, 0x00, 0xBA, 0x00, 0x00, 0x00
	.byte 0xBB, 0x00, 0x00, 0x00, 0xBC, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00

	.byte 0x6B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xBD, 0x00, 0x00, 0x00, 0xBE, 0x00, 0x00, 0x00
	.byte 0xBF, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xC1, 0x00, 0x00, 0x00, 0xC2, 0x00, 0x00, 0x00
	.byte 0xC3, 0x00, 0x00, 0x00, 0xC4, 0x00, 0x00, 0x00, 0xC5, 0x00, 0x00, 0x00, 0xC6, 0x00, 0x00, 0x00
	.byte 0xC7, 0x00, 0x00, 0x00, 0xC8, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00

	.byte 0x92, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC9, 0x00, 0x00, 0x00, 0xCA, 0x00, 0x00, 0x00
	.byte 0xCB, 0x00, 0x00, 0x00, 0xCC, 0x00, 0x00, 0x00, 0xCD, 0x00, 0x00, 0x00, 0xCE, 0x00, 0x00, 0x00
	.byte 0xCC, 0x00, 0x00, 0x00, 0xCD, 0x00, 0x00, 0x00, 0xCE, 0x00, 0x00, 0x00, 0xCF, 0x00, 0x00, 0x00
	.byte 0xD0, 0x00, 0x00, 0x00, 0xD1, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00

	.byte 0x7A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD2, 0x00, 0x00, 0x00, 0xD3, 0x00, 0x00, 0x00
	.byte 0xD4, 0x00, 0x00, 0x00, 0xD5, 0x00, 0x00, 0x00, 0xD6, 0x00, 0x00, 0x00, 0xD7, 0x00, 0x00, 0x00
	.byte 0xD5, 0x00, 0x00, 0x00, 0xD6, 0x00, 0x00, 0x00, 0xD7, 0x00, 0x00, 0x00, 0xD8, 0x00, 0x00, 0x00
	.byte 0xD9, 0x00, 0x00, 0x00, 0xDA, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00

	.byte 0x91, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xDB, 0x00, 0x00, 0x00, 0xDC, 0x00, 0x00, 0x00
	.byte 0xDD, 0x00, 0x00, 0x00, 0xDE, 0x00, 0x00, 0x00, 0xDF, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00
	.byte 0xDE, 0x00, 0x00, 0x00, 0xDF, 0x00, 0x00, 0x00, 0xE0, 0x00, 0x00, 0x00, 0xE1, 0x00, 0x00, 0x00
	.byte 0xE2, 0x00, 0x00, 0x00, 0xE3, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00

_021100C4:
	.byte 0xC1, 0xAE, 0x29, 0x00, 0x00, 0xEE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x02
	.byte 0x96, 0x00, 0x00, 0x00, 0x84, 0x03, 0x00, 0x00, 0x00, 0x05, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0xFD, 0xFF
