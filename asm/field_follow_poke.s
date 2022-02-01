#include "constants/pokemon.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/sprites.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/std_script.h"
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
	bl GfGfxLoader_LoadFromOpenNarc
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

	; File boundary?

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

	; File boundary?

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
	bl CreateFollowingSpriteFieldObject
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
	bl FollowingPokemon_GetMapObject
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
	bl FollowingPokemon_GetMapObject
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
	bl GetMapObjectByID
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
	bl MapObject_SetGfxID
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
	bl GetMapObjectByID
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
	bl MapObject_SetGfxID
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

	thumb_func_start FollowingPokemon_GetMapObject
FollowingPokemon_GetMapObject: ; 0x02069D68
	add r0, #0xe4
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end FollowingPokemon_GetMapObject

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
	bl MapObject_GetParam
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
	bl MapObject_SetParam
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069DEC

	thumb_func_start sub_02069E14
sub_02069E14: ; 0x02069E14
	push {r3, lr}
	mov r1, #2
	bl MapObject_GetParam
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
	bl MapObject_GetParam
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
	bl MapObject_SetParam
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
	bl MapObject_GetParam
	ldr r1, _02069E80 ; =0x000003FF
	lsl r2, r5, #0xa
	and r0, r1
	lsl r0, r0, #0x18
	add r1, r2, #0
	lsr r0, r0, #0x18
	orr r1, r0
	add r0, r4, #0
	mov r2, #2
	bl MapObject_SetParam
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
	bl MapObject_GetParam
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
	bl MapObject_SetParam
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02069E84

	thumb_func_start sub_02069EAC
sub_02069EAC: ; 0x02069EAC
	push {r3, lr}
	mov r1, #2
	bl MapObject_GetParam
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
	bl MapObject_GetParam
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
	bl MapObject_GetParam
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
	bl FollowingPoke_SetObjectShinyFlag
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0206A0E0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl MapObject_SetParam
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
	bl MapObject_SetParam
	add r0, r5, #0
	add r1, r7, #0
	bl FollowingPoke_SetObjectShinyFlag
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0206A0E0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl MapObject_SetParam
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
	ldr r3, _02069F84 ; =MapObject_GetParam
	mov r1, #0
	bx r3
	nop
_02069F84: .word MapObject_GetParam
	thumb_func_end sub_02069F7C

	thumb_func_start FollowingPokemon_IsActive
FollowingPokemon_IsActive: ; 0x02069F88
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
	thumb_func_end FollowingPokemon_IsActive

	thumb_func_start sub_02069FB0
sub_02069FB0: ; 0x02069FB0
	push {r4, lr}
	add r4, r0, #0
	bl FollowingPokemon_IsActive
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

	thumb_func_start FollowingPoke_SetObjectShinyFlag
FollowingPoke_SetObjectShinyFlag: ; 0x0206A080
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #2
	add r5, r0, #0
	bl MapObject_GetParam
	asr r0, r0, #1
	lsl r1, r0, #1
	cmp r4, #0
	beq _0206A098
	mov r0, #1
	orr r1, r0
_0206A098:
	add r0, r5, #0
	mov r2, #2
	bl MapObject_SetParam
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end FollowingPoke_SetObjectShinyFlag

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
	bl MapObject_SetParam
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206A0E0

	thumb_func_start CreateFollowingSpriteFieldObject
CreateFollowingSpriteFieldObject: ; 0x0206A128
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
	bl CreateSpecialFieldObject
	add r4, r0, #0
	bne _0206A15A
	bl GF_AssertFail
_0206A15A:
	add r0, r4, #0
	mov r1, #0xfd
	bl MapObject_SetID
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetType
	add r0, r4, #0
	mov r1, #0
	bl MapObject_SetFlagID
	ldr r1, _0206A1D0 ; =std_following_mon
	add r0, r4, #0
	bl MapObject_SetScript
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl MapObject_SetParam
	lsl r2, r6, #0x18
	ldr r3, [sp, #0x2c]
	add r0, r4, #0
	add r1, r5, #0
	lsr r2, r2, #0x18
	bl sub_02069EE8
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl MapObject_SetXRange
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl MapObject_SetYRange
	mov r1, #9
	add r0, r4, #0
	lsl r1, r1, #0xa
	bl MapObject_SetBits
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #6
	bl MapObject_ClearBits
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
_0206A1D0: .word std_following_mon
	thumb_func_end CreateFollowingSpriteFieldObject

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
	mov r1, #MON_DATA_MOOD
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
	mov r1, #MON_DATA_MOOD
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
	mov r1, #MON_DATA_MOOD
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
	mov r1, #MON_DATA_MOOD
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
	mov r1, #MON_DATA_MOOD
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
	mov r1, #MON_DATA_MOOD
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
	mov r1, #MON_DATA_MOOD
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

	; File boundary after here

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
	bl TaskManager_GetSys
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
	bl QueueTask
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
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
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
	ldr r0, _0206A5C8 ; =gSystem
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
_0206A5C8: .word gSystem
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
	bl PlayerAvatar_GetMapObject
	ldrh r1, [r4, #2]
	add r6, r0, #0
	add r1, r1, #1
	strh r1, [r4, #2]
	add r1, sp, #0
	bl MapObject_GetPositionVec
	mov r0, #2
	ldr r1, [sp, #4]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, sp, #0
	bl MapObject_SetPositionVec
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
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _0206A790
	add r0, r5, #0
	mov r1, #1
	bl MapObject_SetHeldMovement
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _0206A790
_0206A74A:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _0206A790
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _0206A782
	add r0, r5, #0
	mov r1, #1
	bl ov01_02205790
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	mov r1, #0x30
	bl sub_0205FC94
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
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
