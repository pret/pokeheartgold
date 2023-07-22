#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_02091880.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02091880
sub_02091880: ; 0x02091880
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, _020918B8 ; =0x0000195C
	add r6, r0, #0
	bl AllocFromHeap
	add r4, r0, #0
	add r0, r6, #0
	str r5, [r4]
	bl EasyChatManager_New
	str r0, [r4, #4]
	mov r3, #0
	ldr r0, _020918BC ; =0x0000189E
	add r2, r3, #0
_0209189E:
	add r1, r4, r3
	add r3, r3, #1
	strb r2, [r1, r0]
	cmp r3, #0xbb
	blt _0209189E
	add r0, r4, #0
	bl sub_020918D4
	add r0, r4, #0
	bl sub_02091B44
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020918B8: .word 0x0000195C
_020918BC: .word 0x0000189E
	thumb_func_end sub_02091880

	thumb_func_start sub_020918C0
sub_020918C0: ; 0x020918C0
	push {r4, lr}
	add r4, r0, #0
	beq _020918D2
	ldr r0, [r4, #4]
	bl EasyChatManager_Delete
	add r0, r4, #0
	bl FreeToHeap
_020918D2:
	pop {r4, pc}
	thumb_func_end sub_020918C0

	thumb_func_start sub_020918D4
sub_020918D4: ; 0x020918D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r4, #0
	str r0, [sp]
	add r7, r0, #0
	str r0, [sp, #8]
	add r0, #0x68
	ldr r5, _02091910 ; =sECMenuSpecs
	str r4, [sp, #4]
	str r0, [sp, #8]
_020918E8:
	ldr r3, [sp, #8]
	str r4, [r7, #0x38]
	lsl r6, r4, #1
	add r3, r3, r6
	ldr r0, [sp]
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	ldr r6, [r5]
	blx r6
	str r0, [r7, #8]
	add r4, r4, r0
	ldr r0, [sp, #4]
	add r7, r7, #4
	add r0, r0, #1
	add r5, #0xc
	str r0, [sp, #4]
	cmp r0, #0xc
	blt _020918E8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02091910: .word sECMenuSpecs
	thumb_func_end sub_020918D4

	thumb_func_start ECMenuBuild_Pokemon
ECMenuBuild_Pokemon: ; 0x02091914
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	ldr r0, [r0]
	str r2, [sp, #4]
	add r5, r1, #0
	add r4, r3, #0
	mov r6, #0
	bl sub_02090D7C
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r7, r6, #0
	cmp r0, #0
	bls _0209196A
_02091932:
	ldrh r1, [r5]
	ldr r0, [sp, #8]
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	beq _02091960
	ldrh r3, [r5]
	ldr r0, [sp]
	mov r2, #7
	lsr r1, r3, #3
	add r1, r0, r1
	ldr r0, _02091970 ; =0x0000189E
	and r3, r2
	mov r2, #1
	ldrb r0, [r1, r0]
	lsl r2, r3
	orr r2, r0
	ldr r0, _02091970 ; =0x0000189E
	add r6, r6, #1
	strb r2, [r1, r0]
	ldrh r0, [r5]
	strh r0, [r4]
	add r4, r4, #2
_02091960:
	ldr r0, [sp, #4]
	add r7, r7, #1
	add r5, r5, #2
	cmp r7, r0
	blo _02091932
_0209196A:
	add r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02091970: .word 0x0000189E
	thumb_func_end ECMenuBuild_Pokemon

	thumb_func_start ECMenuBuild_Move
ECMenuBuild_Move: ; 0x02091974
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r0, [r0]
	add r5, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	bl sub_02090D84
	cmp r0, #0
	beq _020919BA
	mov r2, #0
	cmp r7, #0
	bls _020919B6
_0209198E:
	ldrh r6, [r5]
	ldr r0, [sp]
	mov r3, #7
	lsr r1, r6, #3
	add r1, r0, r1
	ldr r0, _020919C0 ; =0x0000189E
	and r6, r3
	mov r3, #1
	ldrb r0, [r1, r0]
	lsl r3, r6
	orr r3, r0
	ldr r0, _020919C0 ; =0x0000189E
	add r2, r2, #1
	strb r3, [r1, r0]
	ldrh r0, [r5]
	add r5, r5, #2
	strh r0, [r4]
	add r4, r4, #2
	cmp r2, r7
	blo _0209198E
_020919B6:
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_020919BA:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020919C0: .word 0x0000189E
	thumb_func_end ECMenuBuild_Move

	thumb_func_start ECMenuBuild_TrendySayings
ECMenuBuild_TrendySayings: ; 0x020919C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, [r0]
	add r5, r1, #0
	str r2, [sp, #4]
	add r4, r3, #0
	bl sub_02090D80
	str r0, [sp, #0xc]
	ldr r0, _02091A30 ; =0x00000122 ; NARC_msg_msg_0290_bin
	mov r1, #0
	bl GetECWordIndexByPair ; EARTH TONES
	str r0, [sp, #8]
	mov r7, #0
	ldr r0, [sp, #4]
	add r6, r7, #0
	cmp r0, #0
	bls _02091A28
_020919EC:
	ldrh r2, [r5]
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	sub r1, r2, r1
	bl Save_EasyChat_GetTrendySayingFlag
	cmp r0, #0
	beq _02091A1E
	ldrh r3, [r5]
	ldr r0, [sp]
	mov r2, #7
	lsr r1, r3, #3
	add r1, r0, r1
	ldr r0, _02091A34 ; =0x0000189E
	and r3, r2
	mov r2, #1
	ldrb r0, [r1, r0]
	lsl r2, r3
	orr r2, r0
	ldr r0, _02091A34 ; =0x0000189E
	add r6, r6, #1
	strb r2, [r1, r0]
	ldrh r0, [r5]
	strh r0, [r4]
	add r4, r4, #2
_02091A1E:
	ldr r0, [sp, #4]
	add r7, r7, #1
	add r5, r5, #2
	cmp r7, r0
	blo _020919EC
_02091A28:
	add r0, r6, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02091A30: .word 0x00000122 ; NARC_msg_msg_0290_bin
_02091A34: .word 0x0000189E
	thumb_func_end ECMenuBuild_TrendySayings

	thumb_func_start ECMenuBuild_Greetings
ECMenuBuild_Greetings: ; 0x02091A38
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	ldr r0, [r0]
	add r5, r1, #0
	str r2, [sp, #4]
	add r4, r3, #0
	bl sub_02090D80
	str r0, [sp, #0x10]
	ldr r0, _02091AB8 ; =0x0000011F ; NARC_msg_msg_0289_bin
	mov r1, #0
	bl GetECWordIndexByPair ; BEAUTY
	add r6, r0, #0
	add r0, r6, #5
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r7, #0
	ldr r0, [sp, #4]
	str r7, [sp, #8]
	cmp r0, #0
	bls _02091AB0
_02091A68:
	ldrh r1, [r5]
	cmp r1, r6
	blo _02091A80
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bhi _02091A80
	ldr r0, [sp, #0x10]
	sub r1, r1, r6
	bl Save_EasyChat_GetGreetingsFlag
	cmp r0, #0
	beq _02091AA2
_02091A80:
	ldrh r3, [r5]
	ldr r0, [sp]
	mov r2, #7
	lsr r1, r3, #3
	add r1, r0, r1
	ldr r0, _02091ABC ; =0x0000189E
	and r3, r2
	mov r2, #1
	ldrb r0, [r1, r0]
	lsl r2, r3
	orr r2, r0
	ldr r0, _02091ABC ; =0x0000189E
	add r7, r7, #1
	strb r2, [r1, r0]
	ldrh r0, [r5]
	strh r0, [r4]
	add r4, r4, #2
_02091AA2:
	ldr r0, [sp, #8]
	add r5, r5, #2
	add r1, r0, #1
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	cmp r1, r0
	blo _02091A68
_02091AB0:
	add r0, r7, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02091AB8: .word 0x0000011F ; NARC_msg_msg_0289_bin
_02091ABC: .word 0x0000189E
	thumb_func_end ECMenuBuild_Greetings

	thumb_func_start ECMenuBuild_Generic
ECMenuBuild_Generic: ; 0x02091AC0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0
	mov lr, r2
	mov ip, r0
	mov r0, lr
	add r4, r1, #0
	add r7, r3, #0
	cmp r0, #0
	bls _02091B36
_02091AD4:
	ldrh r2, [r4]
	ldr r0, _02091B3C ; =0x0000FFFE
	cmp r2, r0
	bne _02091B0A
	add r0, r4, #2
	add r4, r4, #4
	ldrh r2, [r0]
	ldrh r0, [r4]
	cmp r2, #0
	strh r0, [r7]
	beq _02091B2A
_02091AEA:
	ldrh r5, [r4]
	mov r3, #7
	add r4, r4, #2
	lsr r0, r5, #3
	add r1, r6, r0
	ldr r0, _02091B40 ; =0x0000189E
	and r5, r3
	mov r3, #1
	ldrb r0, [r1, r0]
	lsl r3, r5
	orr r3, r0
	ldr r0, _02091B40 ; =0x0000189E
	sub r2, r2, #1
	strb r3, [r1, r0]
	bne _02091AEA
	b _02091B2A
_02091B0A:
	lsr r0, r2, #3
	ldr r1, _02091B40 ; =0x0000189E
	add r0, r6, r0
	ldrb r3, [r0, r1]
	mov r1, #7
	mov r5, #1
	and r1, r2
	add r2, r5, #0
	lsl r2, r1
	ldr r1, _02091B40 ; =0x0000189E
	orr r2, r3
	strb r2, [r0, r1]
	ldrh r0, [r4]
	add r4, r4, #2
	strh r0, [r7]
	add r7, r7, #2
_02091B2A:
	mov r0, ip
	add r1, r0, #1
	mov r0, lr
	mov ip, r1
	cmp r1, r0
	blo _02091AD4
_02091B36:
	mov r0, lr
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02091B3C: .word 0x0000FFFE
_02091B40: .word 0x0000189E
	thumb_func_end ECMenuBuild_Generic

	thumb_func_start sub_02091B44
sub_02091B44: ; 0x02091B44
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r4, #0
	ldr r6, _02091B80 ; =_02106C9C
	str r4, [sp]
	add r5, r7, #0
_02091B50:
	ldr r0, _02091B84 ; =0x00000C84
	mov r2, #0xcf
	str r4, [r5, r0]
	lsl r2, r2, #4
	ldr r1, [r6]
	add r0, r7, #0
	add r2, r7, r2
	add r3, r4, #0
	bl sub_02091B8C
	ldr r1, _02091B88 ; =0x00000C18
	add r6, r6, #4
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	add r5, r5, #4
	add r4, r4, r0
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #0x1b
	blo _02091B50
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02091B80: .word _02106C9C
_02091B84: .word 0x00000C84
_02091B88: .word 0x00000C18
	thumb_func_end sub_02091B44

	thumb_func_start sub_02091B8C
sub_02091B8C: ; 0x02091B8C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r6, r0, #0
	str r2, [sp]
	mov r0, #0
	mov ip, r0
	ldrh r2, [r7]
	ldr r0, _02091C2C ; =0x0000FFFF
	mov lr, r3
	cmp r2, r0
	beq _02091C28
_02091BA2:
	ldr r0, _02091C30 ; =0x0000FFFE
	cmp r2, r0
	bne _02091BF4
	add r0, r7, #2
	ldrh r5, [r0]
	add r7, r7, #4
	mov r3, #0
	cmp r5, #0
	bls _02091BEE
	add r4, r7, #0
_02091BB6:
	ldrh r2, [r4]
	mov r0, #7
	mov r1, #1
	and r0, r2
	lsl r1, r0
	lsr r0, r2, #3
	add r2, r6, r0
	ldr r0, _02091C34 ; =0x0000189E
	ldrb r0, [r2, r0]
	tst r0, r1
	beq _02091BE6
	lsl r0, r3, #1
	ldrh r1, [r7, r0]
	mov r0, lr
	lsl r2, r0, #1
	mov r0, lr
	add r0, r0, #1
	mov lr, r0
	ldr r0, [sp]
	strh r1, [r0, r2]
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
	b _02091BEE
_02091BE6:
	add r3, r3, #1
	add r4, r4, #2
	cmp r3, r5
	blo _02091BB6
_02091BEE:
	lsl r0, r5, #1
	add r7, r7, r0
	b _02091C20
_02091BF4:
	mov r1, #1
	mov r0, #7
	and r0, r2
	add r3, r1, #0
	lsl r3, r0
	lsr r0, r2, #3
	add r1, r6, r0
	ldr r0, _02091C34 ; =0x0000189E
	ldrb r0, [r1, r0]
	tst r0, r3
	beq _02091C1E
	mov r1, lr
	add r1, r1, #1
	mov r0, lr
	mov lr, r1
	ldr r1, [sp]
	lsl r0, r0, #1
	strh r2, [r1, r0]
	mov r0, ip
	add r0, r0, #1
	mov ip, r0
_02091C1E:
	add r7, r7, #2
_02091C20:
	ldrh r2, [r7]
	ldr r0, _02091C2C ; =0x0000FFFF
	cmp r2, r0
	bne _02091BA2
_02091C28:
	mov r0, ip
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02091C2C: .word 0x0000FFFF
_02091C30: .word 0x0000FFFE
_02091C34: .word 0x0000189E
	thumb_func_end sub_02091B8C

	thumb_func_start sub_02091C38
sub_02091C38: ; 0x02091C38
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end sub_02091C38

	thumb_func_start sub_02091C40
sub_02091C40: ; 0x02091C40
	push {r4, lr}
	add r4, r0, #0
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #0x38]
	ldr r0, [r4, #4]
	add r1, r1, r2
	lsl r1, r1, #1
	add r1, r4, r1
	add r1, #0x68
	ldrh r1, [r1]
	add r2, r3, #0
	bl EasyChatManager_ReadWordIntoString
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02091C40

	thumb_func_start sub_02091C60
sub_02091C60: ; 0x02091C60
	lsl r1, r1, #2
	add r1, r0, r1
	ldr r1, [r1, #0x38]
	add r1, r1, r2
	lsl r1, r1, #1
	add r0, r0, r1
	add r0, #0x68
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02091C60

	thumb_func_start sub_02091C74
sub_02091C74: ; 0x02091C74
	lsl r1, r1, #2
	add r1, r0, r1
	ldr r0, _02091C80 ; =0x00000C18
	ldr r0, [r1, r0]
	bx lr
	nop
_02091C80: .word 0x00000C18
	thumb_func_end sub_02091C74

	thumb_func_start sub_02091C84
sub_02091C84: ; 0x02091C84
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r5, r0, #0
	lsl r3, r1, #2
	add r6, r5, r3
	ldr r3, _02091CA8 ; =0x00000C18
	ldr r3, [r6, r3]
	cmp r3, #0
	beq _02091CA4
	bl sub_02091CAC
	add r1, r0, #0
	ldr r0, [r5, #4]
	add r2, r4, #0
	bl EasyChatManager_ReadWordIntoString
_02091CA4:
	pop {r4, r5, r6, pc}
	nop
_02091CA8: .word 0x00000C18
	thumb_func_end sub_02091C84

	thumb_func_start sub_02091CAC
sub_02091CAC: ; 0x02091CAC
	push {r3, r4}
	lsl r1, r1, #2
	ldr r3, _02091CD4 ; =0x00000C18
	add r4, r0, r1
	ldr r1, [r4, r3]
	cmp r1, #0
	beq _02091CCE
	add r1, r3, #0
	add r1, #0x6c
	ldr r1, [r4, r1]
	add r3, #0xd8
	add r1, r2, r1
	lsl r1, r1, #1
	add r0, r0, r1
	ldrh r0, [r0, r3]
	pop {r3, r4}
	bx lr
_02091CCE:
	ldr r0, _02091CD8 ; =0x0000FFFF
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02091CD4: .word 0x00000C18
_02091CD8: .word 0x0000FFFF
	thumb_func_end sub_02091CAC

	.rodata

_02106944:
	.short 0x0508
	.short 0xFFFF

_02106948:
	.short 0x0384
	.short 0x00B2
	.short 0xFFFF

_0210694E:
	.short 0x00C3
	.short 0x0252
	.short 0x0435
	.short 0x009C
	.short 0x00D3
	.short 0xFFFF

_0210695A:
	.short 0x014F
	.short 0x02B0
	.short 0x0091
	.short 0x039C
	.short 0x0107
	.short 0x0029
	.short 0xFFFF

_02106968:
	.short 0x0027
	.short 0x0181
	.short 0x050D
	.short 0x0087
	.short 0x020A
	.short 0x00BD
	.short 0x007C
	.short 0xFFFF

_02106978:
	.short 0x04C9
	.short 0x04FD
	.short 0x00C1
	.short 0x01D5
	.short 0x0309
	.short 0x0503
	.short 0x04AF
	.short 0x04E6
	.short 0x04E5
	.short 0x04AB
	.short 0x0522
	.short 0x04FE
	.short 0x047A
	.short 0xFFFF

_02106994:
	.short 0x0361
	.short 0x05BE
	.short 0x04CD
	.short 0x00C5
	.short 0x0443
	.short 0x04B9
	.short 0x042A
	.short 0x047D
	.short 0x05D0
	.short 0x05D1
	.short 0x00C9
	.short 0x02ED
	.short 0x04B1
	.short 0x00D9
	.short 0x0587
	.short 0x01E0
	.short 0xFFFF

_021069B6:
	.short 0x008C
	.short 0x008D
	.short 0x0040
	.short 0x000E
	.short 0x0073
	.short 0x01F2
	.short 0x0160
	.short 0x0409
	.short 0x048F
	.short 0x0568
	.short 0x0276
	.short 0x00E6
	.short 0x0063
	.short 0x0119
	.short 0x043D
	.short 0x030A
	.short 0x006D
	.short 0x049E
	.short 0x0062
	.short 0x0191
	.short 0x0192
	.short 0x017E
	.short 0xFFFF

sECMenu_Misc:
	.short EC_WORD_UNION_BATTLE_TOWER
	.short EC_WORD_UNION_CHAT
	.short EC_WORD_UNION_COLOSSEUM
	.short EC_WORD_UNION_CONNECTION
	.short EC_WORD_UNION_CONTEST
	.short EC_WORD_UNION_DOUBLE
	.short EC_WORD_UNION_DRAWING
	.short EC_WORD_UNION_FRIEND_CODE
	.short EC_WORD_UNION_GOTCHA
	.short EC_WORD_UNION_GTS
	.short EC_WORD_UNION_LEVEL_100
	.short EC_WORD_UNION_LEVEL_50
	.short EC_WORD_UNION_MIX_BATTLE
	.short EC_WORD_UNION_MULTI_BATTLE
	.short EC_WORD_UNION_POFFIN
	.short EC_WORD_UNION_POKEMON
	.short EC_WORD_UNION_RECORD
	.short EC_WORD_UNION_SECRET_BASE
	.short EC_WORD_UNION_SINGLE
	.short EC_WORD_UNION_UNDERGROUND
	.short EC_WORD_UNION_UNION
	.short EC_WORD_UNION_VOICE_CHAT
	.short EC_WORD_UNION_WI_FI
	.short 0xFFFF

_02106A14:
	.short 0x03E2
	.short 0x02AE
	.short 0x00E0
	.short 0x002B
	.short 0x032C
	.short 0x04C7
	.short 0x04A4
	.short 0x04C2
	.short 0x04F5
	.short 0x04C1
	.short 0x04BB
	.short 0x04DA
	.short 0x0486
	.short 0x008A
	.short 0x008B
	.short 0x03C2
	.short 0x05A3
	.short 0x005F
	.short 0x04C5
	.short 0x0478
	.short 0x02B8
	.short 0x0417
	.short 0x032B
	.short 0x03EA
	.short 0xFFFF

_02106A46:
	.short 0x056D
	.short 0x038A
	.short 0x0086
	.short 0x05BC
	.short 0x0031
	.short 0x0030
	.short 0x0003
	.short 0x0462
	.short 0x01A0
	.short 0x0149
	.short 0x01FB
	.short 0x0460
	.short 0x0047
	.short 0x051F
	.short 0x0120
	.short 0x002D
	.short 0x0206
	.short 0x041E
	.short 0x02D9
	.short 0x05CE
	.short 0x0139
	.short 0x03E0
	.short 0x0348
	.short 0x0064
	.short 0x0025
	.short 0xFFFF

sECMenu_TrendySayings:
	.short EC_WORD_TOUGH_WORDS_ARTERY
	.short EC_WORD_TOUGH_WORDS_BONE_DENSITY
	.short EC_WORD_TOUGH_WORDS_CADENZA
	.short EC_WORD_TOUGH_WORDS_CONDUCTIVITY
	.short EC_WORD_TOUGH_WORDS_CONTOUR
	.short EC_WORD_TOUGH_WORDS_COPYRIGHT
	.short EC_WORD_TOUGH_WORDS_CROSS_STITCH
	.short EC_WORD_TOUGH_WORDS_CUBISM
	.short EC_WORD_TOUGH_WORDS_EARTH_TONES
	.short EC_WORD_TOUGH_WORDS_EDUCATION
	.short EC_WORD_TOUGH_WORDS_FLAMBE
	.short EC_WORD_TOUGH_WORDS_FRACTALS
	.short EC_WORD_TOUGH_WORDS_GMT
	.short EC_WORD_TOUGH_WORDS_GOLDEN_RATIO
	.short EC_WORD_TOUGH_WORDS_GOMMAGE
	.short EC_WORD_TOUGH_WORDS_HOWLING
	.short EC_WORD_TOUGH_WORDS_IMPLANT
	.short EC_WORD_TOUGH_WORDS_IRRITABILITY
	.short EC_WORD_TOUGH_WORDS_MONEY_RATE
	.short EC_WORD_TOUGH_WORDS_NEUTRINO
	.short EC_WORD_TOUGH_WORDS_OMNIBUS
	.short EC_WORD_TOUGH_WORDS_PH_BALANCE
	.short EC_WORD_TOUGH_WORDS_POLYPHENOL
	.short EC_WORD_TOUGH_WORDS_REM_SLEEP
	.short EC_WORD_TOUGH_WORDS_RESOLUTION
	.short EC_WORD_TOUGH_WORDS_SPREADSHEET
	.short EC_WORD_TOUGH_WORDS_STARBOARD
	.short EC_WORD_TOUGH_WORDS_STOCK_PRICES
	.short EC_WORD_TOUGH_WORDS_STREAMING
	.short EC_WORD_TOUGH_WORDS_TWO_STEP
	.short EC_WORD_TOUGH_WORDS_UBIQUITOUS
	.short EC_WORD_TOUGH_WORDS_VECTOR
	.short 0xFFFF

sECMenu_Greetings:
	.short EC_WORD_PEOPLE_ADULT
	.short EC_WORD_PEOPLE_ALLY
	.short EC_WORD_PEOPLE_AUNT
	.short EC_WORD_PEOPLE_BABY
	.short EC_WORD_PEOPLE_BOY
	.short EC_WORD_PEOPLE_BROTHER
	.short EC_WORD_PEOPLE_EVERYONE
	.short EC_WORD_PEOPLE_FAMILY
	.short EC_WORD_PEOPLE_FATHER
	.short EC_WORD_PEOPLE_FRIEND
	.short EC_WORD_PEOPLE_GAL
	.short EC_WORD_PEOPLE_GIRL
	.short EC_WORD_PEOPLE_GRANDFATHER
	.short EC_WORD_PEOPLE_GRANDMOTHER
	.short EC_WORD_PEOPLE_HER
	.short EC_WORD_PEOPLE_HIM
	.short EC_WORD_PEOPLE_I_4
	.short EC_WORD_PEOPLE_KIDS
	.short EC_WORD_PEOPLE_ME
	.short EC_WORD_PEOPLE_MOTHER
	.short EC_WORD_PEOPLE_MR_
	.short EC_WORD_PEOPLE_MS_
	.short EC_WORD_PEOPLE_MYSELF
	.short EC_WORD_PEOPLE_OLD_MAN
	.short EC_WORD_PEOPLE_OPPONENT
	.short EC_WORD_PEOPLE_PARENT
	.short EC_WORD_PEOPLE_PERSON
	.short EC_WORD_PEOPLE_RIVAL
	.short EC_WORD_PEOPLE_SIBLINGS
	.short EC_WORD_PEOPLE_SISTER
	.short EC_WORD_PEOPLE_UNCLE
	.short EC_WORD_PEOPLE_WHO
	.short EC_WORD_PEOPLE_YOU
	.short 0xFFFF

_02106B00:
	.short 0x049C
	.short 0x04D0
	.short 0x04D4
	.short 0x03D3
	.short 0x031D
	.short 0x022A
	.short 0x0449
	.short 0x0397
	.short 0x01F8
	.short 0x0394
	.short 0x033D
	.short 0x02B4
	.short 0x0509
	.short 0x00AE
	.short 0x03F9
	.short 0x013A
	.short 0x03E7
	.short 0x05A1
	.short 0x0582
	.short 0x030E
	.short 0x057E
	.short 0x0188
	.short 0x0536
	.short 0x0303
	.short 0x03FD
	.short 0x03E5
	.short 0x03EC
	.short 0x0472
	.short 0x033E
	.short 0x042F
	.short 0x03AA
	.short 0x02D7
	.short 0x05B7
	.short 0x054E
	.short 0x0002
	.short 0xFFFF

sECMenu_People:
	.short EC_WORD_TRAINER_ACE_CARD
	.short EC_WORD_TRAINER_ATTACK
	.short EC_WORD_TRAINER_BATTLE
	.short EC_WORD_TRAINER_CHALLENGE
	.short EC_WORD_TRAINER_COME_ON
	.short EC_WORD_TRAINER_COURAGE
	.short EC_WORD_TRAINER_EASY
	.short EC_WORD_TRAINER_EASY_WIN
	.short EC_WORD_TRAINER_FIGHT
	.short EC_WORD_TRAINER_FIGHTS
	.short EC_WORD_TRAINER_FOE
	.short EC_WORD_TRAINER_GENIUS
	.short EC_WORD_TRAINER_INVINCIBLE
	.short EC_WORD_TRAINER_LEGEND
	.short EC_WORD_TRAINER_LOSS
	.short EC_WORD_TRAINER_MATCH
	.short EC_WORD_TRAINER_MATCH_UP
	.short EC_WORD_TRAINER_MOVE
	.short EC_WORD_TRAINER_NO_MATCH
	.short EC_WORD_TRAINER_NO_1
	.short EC_WORD_TRAINER_PARTNER
	.short EC_WORD_TRAINER_POINTS
	.short EC_WORD_TRAINER_POWER
	.short EC_WORD_TRAINER_PREPARATION
	.short EC_WORD_TRAINER_REVIVE
	.short EC_WORD_TRAINER_SENSE
	.short EC_WORD_TRAINER_SERIOUS
	.short EC_WORD_TRAINER_SPIRIT
	.short EC_WORD_TRAINER_STRATEGY
	.short EC_WORD_TRAINER_STRONG
	.short EC_WORD_TRAINER_SURRENDER
	.short EC_WORD_TRAINER_TAKE_IT_EASY
	.short EC_WORD_TRAINER_TALENT
	.short EC_WORD_TRAINER_TRAINER
	.short EC_WORD_TRAINER_VERSUS
	.short EC_WORD_TRAINER_VICTORY
	.short EC_WORD_TRAINER_WEAK
	.short EC_WORD_TRAINER_WINS
	.short 0xFFFF

_02106B96:
	.short 0x054F
	.short 0x0557
	.short 0x0391
	.short 0x00B1
	.short 0x03F4
	.short 0x035B
	.short 0x02FB
	.short 0x031E
	.short 0x0591
	.short 0x05B3
	.short 0x0550
	.short 0x059E
	.short 0x0022
	.short 0x001F
	.short 0x001D
	.short 0x0020
	.short 0x001E
	.short 0x0021
	.short 0x0255
	.short 0x0380
	.short 0x029B
	.short 0x0122
	.short 0x0026
	.short 0x0123
	.short 0x04E2
	.short 0x0439
	.short 0x0456
	.short 0x04A9
	.short 0xFFFE
	.short 0x0002
	.short 0x04FC
	.short 0x0596
	.short 0x0453
	.short 0x00A4
	.short 0x04AA
	.short 0x03C4
	.short 0x0436
	.short 0x012B
	.short 0x0142
	.short 0x0112
	.short 0xFFFF

_02106BE8:
	.short 0x0406
	.short 0x038E
	.short 0x05A0
	.short 0x0249
	.short 0x0473
	.short 0x0475
	.short 0x05A8
	.short 0x04C8
	.short 0x0085
	.short 0x03F1
	.short 0x0269
	.short 0x04BD
	.short 0x0017
	.short 0x007D
	.short 0x01D2
	.short 0x03D1
	.short 0x0135
	.short 0x0065
	.short 0x00EF
	.short 0x0365
	.short 0x0224
	.short 0x018B
	.short 0x02D3
	.short 0x030B
	.short 0x02BB
	.short 0x058F
	.short 0x038C
	.short 0x0586
	.short 0x00F4
	.short 0x030C
	.short 0x00C4
	.short 0x0546
	.short 0x0499
	.short 0x0589
	.short 0x04D9
	.short 0x0066
	.short 0x0067
	.short 0x0289
	.short 0x0127
	.short 0x0336
	.short 0x02E5
	.short 0xFFFF

sECMenu_ToughWords:
	.short EC_WORD_FEELINGS_ADORE
	.short EC_WORD_FEELINGS_ALL_RIGHT
	.short EC_WORD_FEELINGS_ANGER
	.short EC_WORD_FEELINGS_ANTICIPATION
	.short EC_WORD_FEELINGS_BEAUTY
	.short EC_WORD_FEELINGS_BORED
	.short EC_WORD_FEELINGS_CLEVERNESS
	.short EC_WORD_FEELINGS_COOLNESS
	.short EC_WORD_FEELINGS_CUTENESS
	.short EC_WORD_FEELINGS_DANGER
	.short EC_WORD_FEELINGS_DELIGHT
	.short EC_WORD_FEELINGS_DEPRESSED
	.short EC_WORD_FEELINGS_DIFFICULT
	.short EC_WORD_FEELINGS_DISAPPOINTED
	.short EC_WORD_FEELINGS_DISLIKE
	.short EC_WORD_FEELINGS_DROOLING
	.short EC_WORD_FEELINGS_ENERGETIC
	.short EC_WORD_FEELINGS_ENJOYMENT
	.short EC_WORD_FEELINGS_EXCITED
	.short EC_WORD_FEELINGS_HAPPINESS
	.short EC_WORD_FEELINGS_HAPPY
	.short EC_WORD_FEELINGS_HATE
	.short EC_WORD_FEELINGS_HEALTHY
	.short EC_WORD_FEELINGS_IMPORTANT
	.short EC_WORD_FEELINGS_INCREDIBLE
	.short EC_WORD_FEELINGS_LIKES
	.short EC_WORD_FEELINGS_LOVEY_DOVEY
	.short EC_WORD_FEELINGS_MESSED_UP
	.short EC_WORD_FEELINGS_NERVOUS
	.short EC_WORD_FEELINGS_NICE
	.short EC_WORD_FEELINGS_NO_WAY
	.short EC_WORD_FEELINGS_RARE
	.short EC_WORD_FEELINGS_RECOMMEND
	.short EC_WORD_FEELINGS_REGRET
	.short EC_WORD_FEELINGS_ROFL
	.short EC_WORD_FEELINGS_SADNESS
	.short EC_WORD_FEELINGS_SATISFIED
	.short EC_WORD_FEELINGS_SIMPLE
	.short EC_WORD_FEELINGS_SKILLFUL
	.short EC_WORD_FEELINGS_SMILE
	.short EC_WORD_FEELINGS_STRANGENESS
	.short EC_WORD_FEELINGS_SUBTLE
	.short EC_WORD_FEELINGS_SURPRISE
	.short EC_WORD_FEELINGS_TEARS
	.short EC_WORD_FEELINGS_TOUGHNESS
	.short EC_WORD_FEELINGS_USELESS
	.short EC_WORD_FEELINGS_WANT
	.short 0xFFFF

_02106C9C:
	.word _02106F08
	.word _021070B8
	.word _02107590
	.word _02107152
	.word _02106BE8
	.word _02106E7C
	.word _02106F98
	.word _0210728C
	.word _02106B00
	.word _02106968
	.word _021069B6
	.word _02106D7C
	.word _02107664
	.word _02106B96
	.word _02106A14
	.word _02107334
	.word _0210694E
	.word _02106DF4
	.word _02107864
	.word _021071EC
	.word _02106994
	.word _02106A46
	.word _02106D08
	.word _02106948
	.word _02106978
	.word _0210695A
	.word _02106944

_02106D08:
	.short 0x0507
	.short 0x0504
	.short 0x0140
	.short 0x0141
	.short 0x0356
	.short 0x052E
	.short 0x016D
	.short 0x0592
	.short 0x0008
	.short 0x03CF
	.short 0x03E1
	.short 0x0227
	.short 0x0350
	.short 0x034A
	.short 0x0333
	.short 0x03FF
	.short 0x026F
	.short 0x0474
	.short 0x0327
	.short 0x01CD
	.short 0x000D
	.short 0x04D5
	.short 0x0046
	.short 0x006E
	.short 0x04FF
	.short 0x04C6
	.short 0x04E0
	.short 0x02EA
	.short 0x0202
	.short 0x0154
	.short 0x0125
	.short 0x041F
	.short 0x0493
	.short 0x04B4
	.short 0x05CF
	.short 0x0028
	.short 0x02F5
	.short 0x0201
	.short 0x0116
	.short 0x0455
	.short 0x0301
	.short 0x025E
	.short 0x00CA
	.short 0x03EF
	.short 0x03B4
	.short 0x00C2
	.short 0x0528
	.short 0x052F
	.short 0x0570
	.short 0x019D
	.short 0x0374
	.short 0x04B6
	.short 0x0213
	.short 0x036A
	.short 0x04B5
	.short 0x0109
	.short 0x0168
	.short 0xFFFF

_02106D7C:
	.short 0x0131
	.short 0x0502
	.short 0x00AB
	.short 0x0083
	.short 0x00F6
	.short 0x0373
	.short 0x017C
	.short 0x017D
	.short 0x03A4
	.short 0x034C
	.short 0x043C
	.short 0x03A5
	.short 0x01D6
	.short 0x00A6
	.short 0x00A5
	.short 0x027D
	.short 0x0239
	.short 0x021B
	.short 0x046A
	.short 0x0534
	.short 0x04B2
	.short 0x04AD
	.short 0x0545
	.short 0x05C5
	.short 0x05C4
	.short 0x03F0
	.short 0x026A
	.short 0x01CF
	.short 0x006C
	.short 0x056A
	.short 0x0261
	.short 0x03F5
	.short 0x057F
	.short 0x0159
	.short 0x03DD
	.short 0x0108
	.short 0x0416
	.short 0x02B7
	.short 0x04ED
	.short 0x010F
	.short 0x056E
	.short 0x01AC
	.short 0x0470
	.short 0x010E
	.short 0x0126
	.short 0x027E
	.short 0x0598
	.short 0x0233
	.short 0x01C0
	.short 0x036D
	.short 0x0110
	.short 0x00F9
	.short 0x01C9
	.short 0x03BD
	.short 0x0151
	.short 0x0317
	.short 0x0172
	.short 0x0194
	.short 0x0195
	.short 0xFFFF

_02106DF4:
	.short 0x056B
	.short 0x0253
	.short 0x001A
	.short 0x00F3
	.short 0x02E0
	.short 0x0402
	.short 0x0118
	.short 0x0199
	.short 0x02D5
	.short 0x004E
	.short 0x0594
	.short 0x0014
	.short 0x0013
	.short 0x0180
	.short 0x023B
	.short 0x01FD
	.short 0x044E
	.short 0x059C
	.short 0x05C9
	.short 0x0259
	.short 0x0306
	.short 0x0263
	.short 0x030F
	.short 0x0501
	.short 0x017A
	.short 0x01E6
	.short 0x0179
	.short 0x017B
	.short 0x057B
	.short 0x0171
	.short 0x05BF
	.short 0x00DF
	.short 0x056F
	.short 0x05A6
	.short 0x028C
	.short 0x02C8
	.short 0x0307
	.short 0x02A3
	.short 0x046D
	.short 0x0070
	.short 0x006F
	.short 0x01D0
	.short 0x01BF
	.short 0x049A
	.short 0x0425
	.short 0x021E
	.short 0x03BB
	.short 0x03C9
	.short 0x034E
	.short 0x039F
	.short 0x041B
	.short 0x037D
	.short 0x028D
	.short 0x02E9
	.short 0x0248
	.short 0x032D
	.short 0x03A7
	.short 0x058D
	.short 0x0300
	.short 0x020B
	.short 0x02BD
	.short 0x0353
	.short 0x013B
	.short 0x0197
	.short 0x01DF
	.short 0x03EE
	.short 0x0408
	.short 0xFFFF

_02106E7C:
	.short 0x02F7
	.short 0x02A9
	.short 0x02EC
	.short 0x0329
	.short 0x02BE
	.short 0x048A
	.short 0x0053
	.short 0x0559
	.short 0x047E
	.short 0x0016
	.short 0x0319
	.short 0x015D
	.short 0x035C
	.short 0x00A0
	.short 0x0560
	.short 0x046C
	.short 0x03C5
	.short 0x0463
	.short 0x0445
	.short 0x01C8
	.short 0x03CE
	.short 0x026E
	.short 0x0398
	.short 0x01F7
	.short 0x0243
	.short 0x0543
	.short 0x024A
	.short 0x00B4
	.short 0x029F
	.short 0x05B9
	.short 0x0407
	.short 0x029C
	.short 0x0225
	.short 0x037A
	.short 0x0088
	.short 0x0284
	.short 0x039E
	.short 0x03E8
	.short 0x02F4
	.short 0x0366
	.short 0x01A3
	.short 0x0450
	.short 0x0555
	.short 0x0203
	.short 0x014A
	.short 0x03C6
	.short 0x038B
	.short 0x0264
	.short 0x02F8
	.short 0x0468
	.short 0x02FA
	.short 0x037B
	.short 0x0411
	.short 0x02B1
	.short 0x0442
	.short 0x04CF
	.short 0x00CD
	.short 0x05B8
	.short 0x0342
	.short 0x0494
	.short 0x05CC
	.short 0x044D
	.short 0x01DE
	.short 0x02CA
	.short 0x00A2
	.short 0x020F
	.short 0x02C2
	.short 0x028A
	.short 0x02E8
	.short 0xFFFF

_02106F08:
	.short 0x04A5
	.short 0x01CC
	.short 0x003F
	.short 0x0167
	.short 0x0237
	.short 0x0458
	.short 0x0223
	.short 0x0287
	.short 0x035F
	.short 0x0431
	.short 0x0584
	.short 0x0480
	.short 0x055B
	.short 0x033C
	.short 0x02A1
	.short 0x008E
	.short 0x0440
	.short 0x0132
	.short 0x0251
	.short 0x04BC
	.short 0x04A6
	.short 0x00BE
	.short 0x032A
	.short 0x0422
	.short 0x0383
	.short 0x04EA
	.short 0x0041
	.short 0x0583
	.short 0x0495
	.short 0x014E
	.short 0x01A8
	.short 0x0275
	.short 0x00B5
	.short 0x02E6
	.short 0x0579
	.short 0x0429
	.short 0x04F7
	.short 0x050C
	.short 0x0521
	.short 0x015B
	.short 0xFFFE
	.short 0x0002
	.short 0x0441
	.short 0x0599
	.short 0x03B5
	.short 0x0378
	.short 0x0381
	.short 0x0018
	.short 0x003B
	.short 0x01ED
	.short 0x041D
	.short 0x00A8
	.short 0x0314
	.short 0x015C
	.short 0x0328
	.short 0x0130
	.short 0x05AB
	.short 0x0090
	.short 0x0302
	.short 0x0364
	.short 0x0326
	.short 0x045A
	.short 0x03B6
	.short 0x02C5
	.short 0x0484
	.short 0x037C
	.short 0x022E
	.short 0x0393
	.short 0x01E2
	.short 0x00B8
	.short 0x012A
	.short 0xFFFF

_02106F98:
	.short 0x01BC
	.short 0x0489
	.short 0x01DB
	.short 0x0527
	.short 0x01BD
	.short 0x011A
	.short 0x005C
	.short 0x036C
	.short 0x01A7
	.short 0x005E
	.short 0x0469
	.short 0x004A
	.short 0x03CB
	.short 0x01BB
	.short 0x02BA
	.short 0x0390
	.short 0x04CA
	.short 0x00CB
	.short 0x01E7
	.short 0x0488
	.short 0x04CB
	.short 0x01D7
	.short 0x016A
	.short 0x01AF
	.short 0x0279
	.short 0x00CF
	.short 0x01D8
	.short 0x002C
	.short 0x0428
	.short 0x05B6
	.short 0x04DD
	.short 0x002A
	.short 0x0076
	.short 0x05A2
	.short 0x0037
	.short 0x004C
	.short 0x05AD
	.short 0x04D2
	.short 0x0170
	.short 0x05CA
	.short 0x0526
	.short 0x00D2
	.short 0x047C
	.short 0x0483
	.short 0x03D0
	.short 0x03AF
	.short 0x0330
	.short 0x004B
	.short 0x0354
	.short 0x04C4
	.short 0x0058
	.short 0x0184
	.short 0x017F
	.short 0x03C8
	.short 0x0525
	.short 0x00FD
	.short 0x021D
	.short 0x003A
	.short 0x023A
	.short 0x0310
	.short 0x0146
	.short 0x05D5
	.short 0x0371
	.short 0x01FC
	.short 0x013C
	.short 0x03A9
	.short 0x0200
	.short 0x0414
	.short 0x04CC
	.short 0x0082
	.short 0x0358
	.short 0xFFFF

sECMenuSpecs:
	.word ECMenuBuild_Pokemon, sECMenu_Pokemon_AtoL, 0x000000EB
	.word ECMenuBuild_Pokemon, sECMenu_Pokemon_MtoZ, 0x00000102
	.word ECMenuBuild_Move, sECMenu_Move_AtoL, 0x000000DF
	.word ECMenuBuild_Move, sECMenu_Move_MtoZ, 0x000000F1
	.word ECMenuBuild_Generic, sECMenu_TypesAndAbilities, 0x0000008A
	.word ECMenuBuild_Generic, sECMenu_People, 0x00000026
	.word ECMenuBuild_Generic, sECMenu_Greetings, 0x00000021
	.word ECMenuBuild_Greetings, sECMenu_Lifestyle, 0x00000066
	.word ECMenuBuild_Generic, sECMenu_Feelings, 0x00000068
	.word ECMenuBuild_Generic, sECMenu_ToughWords, 0x0000002F
	.word ECMenuBuild_TrendySayings, sECMenu_TrendySayings, 0x00000020
	.word ECMenuBuild_Generic, sECMenu_Misc, 0x00000017

_021070B8:
	.short 0x049D
	.short 0x0173
	.short 0x055D
	.short 0x0157
	.short 0x0162
	.short 0x0153
	.short 0x027C
	.short 0x0260
	.short 0x019B
	.short 0x0516
	.short 0x02D2
	.short 0x046B
	.short 0x03DA
	.short 0x05D4
	.short 0x0099
	.short 0x02EB
	.short 0x010B
	.short 0x0571
	.short 0x000F
	.short 0x0176
	.short 0x00B6
	.short 0x0045
	.short 0x02AB
	.short 0x0190
	.short 0x0531
	.short 0x0265
	.short 0x018F
	.short 0x0204
	.short 0x0540
	.short 0x021C
	.short 0x0323
	.short 0x0009
	.short 0x0418
	.short 0x031B
	.short 0x0101
	.short 0x00F2
	.short 0x022B
	.short 0x033F
	.short 0x04DC
	.short 0x055C
	.short 0x0212
	.short 0x026D
	.short 0x05AC
	.short 0x02B6
	.short 0x028B
	.short 0x04A0
	.short 0x01B6
	.short 0x0506
	.short 0x04BE
	.short 0x055E
	.short 0x0581
	.short 0x0344
	.short 0x047F
	.short 0x038D
	.short 0x011E
	.short 0x0308
	.short 0x035A
	.short 0x01B5
	.short 0x01B4
	.short 0x0481
	.short 0x0281
	.short 0x022D
	.short 0x0196
	.short 0x03CA
	.short 0x03B2
	.short 0x0385
	.short 0x01A2
	.short 0x0001
	.short 0x0343
	.short 0x0392
	.short 0x033B
	.short 0x01AB
	.short 0x019C
	.short 0x000C
	.short 0x04F6
	.short 0x04E7
	.short 0xFFFF

_02107152:
	.short 0x0538
	.short 0x03DC
	.short 0x0541
	.short 0x0597
	.short 0x03D5
	.short 0x037F
	.short 0x01EB
	.short 0x0544
	.short 0x03B7
	.short 0x025F
	.short 0x03A0
	.short 0x012D
	.short 0x00E1
	.short 0x0572
	.short 0x0182
	.short 0x057D
	.short 0x054A
	.short 0x0547
	.short 0x02B2
	.short 0x02B5
	.short 0x0057
	.short 0x01E3
	.short 0x053C
	.short 0x059F
	.short 0x024B
	.short 0x0548
	.short 0x0032
	.short 0x0222
	.short 0x0575
	.short 0x03A3
	.short 0x0580
	.short 0x0084
	.short 0x0313
	.short 0x0282
	.short 0x0055
	.short 0x0054
	.short 0x00E8
	.short 0x0351
	.short 0x05C1
	.short 0x03BA
	.short 0x0208
	.short 0x0258
	.short 0x0216
	.short 0x01F3
	.short 0x042E
	.short 0x03A2
	.short 0x03D4
	.short 0x0341
	.short 0x034D
	.short 0x0386
	.short 0x0242
	.short 0x0387
	.short 0x0094
	.short 0x02D1
	.short 0x0095
	.short 0x0389
	.short 0x01C4
	.short 0x0093
	.short 0x05C8
	.short 0x0567
	.short 0x027A
	.short 0x01AA
	.short 0x01A9
	.short 0x0231
	.short 0x03D8
	.short 0x0588
	.short 0x041C
	.short 0x0060
	.short 0x042D
	.short 0x0033
	.short 0x00CE
	.short 0x0164
	.short 0x01DD
	.short 0x0163
	.short 0x010D
	.short 0x02CF
	.short 0xFFFF

_021071EC:
	.short 0x0211
	.short 0x0316
	.short 0x0217
	.short 0x0114
	.short 0x035E
	.short 0x0214
	.short 0x0467
	.short 0x045D
	.short 0x0515
	.short 0x0072
	.short 0x0423
	.short 0x01D1
	.short 0x02FD
	.short 0x0080
	.short 0x0539
	.short 0x058B
	.short 0x043B
	.short 0x00D8
	.short 0x031A
	.short 0x0254
	.short 0x054B
	.short 0x0048
	.short 0x0049
	.short 0x0549
	.short 0x04D3
	.short 0x04A8
	.short 0x04F4
	.short 0x0405
	.short 0x0298
	.short 0x0215
	.short 0x0247
	.short 0x0396
	.short 0x0246
	.short 0x0245
	.short 0x01F9
	.short 0x0244
	.short 0x0331
	.short 0x0444
	.short 0x0523
	.short 0x01D4
	.short 0x00AF
	.short 0x00B0
	.short 0x050A
	.short 0x00FF
	.short 0x0144
	.short 0x02F3
	.short 0x0419
	.short 0x0185
	.short 0x009E
	.short 0x0585
	.short 0x053D
	.short 0x024C
	.short 0x0376
	.short 0x01C6
	.short 0x0518
	.short 0x03FA
	.short 0x054C
	.short 0x0477
	.short 0x0532
	.short 0x0280
	.short 0x0148
	.short 0x053F
	.short 0x053E
	.short 0x00FC
	.short 0x0291
	.short 0x02FF
	.short 0x03A1
	.short 0x0297
	.short 0x0165
	.short 0x040C
	.short 0x0368
	.short 0x0183
	.short 0x04DB
	.short 0x0219
	.short 0x02DF
	.short 0x05B1
	.short 0x009D
	.short 0x00F8
	.short 0x00EC
	.short 0xFFFF

_0210728C:
	.short 0x0524
	.short 0x04E9
	.short 0x02F2
	.short 0x04A2
	.short 0x0357
	.short 0x057C
	.short 0x01B8
	.short 0x058E
	.short 0x025A
	.short 0x0129
	.short 0x058C
	.short 0x005D
	.short 0x0262
	.short 0x04F1
	.short 0x03B9
	.short 0x020D
	.short 0x02C7
	.short 0x0369
	.short 0x03B8
	.short 0x0359
	.short 0x057A
	.short 0x0377
	.short 0x02F1
	.short 0x042B
	.short 0x01E5
	.short 0x04C3
	.short 0x04F2
	.short 0x04BF
	.short 0x049F
	.short 0x04FA
	.short 0x02FE
	.short 0x048B
	.short 0x00D6
	.short 0x04AC
	.short 0x04AE
	.short 0x0556
	.short 0x0558
	.short 0x04C0
	.short 0x04D1
	.short 0x04DF
	.short 0x04E4
	.short 0x0278
	.short 0x04FB
	.short 0x02DD
	.short 0x048C
	.short 0x01C1
	.short 0x01C2
	.short 0x006B
	.short 0x006A
	.short 0x00ED
	.short 0x04EB
	.short 0x04B3
	.short 0x00FA
	.short 0x0535
	.short 0x04F3
	.short 0x04A3
	.short 0x0566
	.short 0x050F
	.short 0x01AE
	.short 0x044C
	.short 0x00A3
	.short 0x00BB
	.short 0x020E
	.short 0x0210
	.short 0x0074
	.short 0x00E5
	.short 0x00E4
	.short 0x0340
	.short 0x05B4
	.short 0x03FB
	.short 0x04E1
	.short 0x04EF
	.short 0x016F
	.short 0x040D
	.short 0x0433
	.short 0x0324
	.short 0x0228
	.short 0x022F
	.short 0x040A
	.short 0x028E
	.short 0x0320
	.short 0x0061
	.short 0x024F
	.short 0xFFFF

_02107334:
	.short 0x01A1
	.short 0x02CC
	.short 0x01E4
	.short 0x002E
	.short 0x002F
	.short 0x04D6
	.short 0x0485
	.short 0x0471
	.short 0x0553
	.short 0x01F6
	.short 0x0363
	.short 0x0230
	.short 0x0117
	.short 0x02B3
	.short 0x0035
	.short 0x0496
	.short 0x0240
	.short 0x05BB
	.short 0x00E7
	.short 0x01E9
	.short 0x054D
	.short 0x00AC
	.short 0x040B
	.short 0x0012
	.short 0x0011
	.short 0x0010
	.short 0x0019
	.short 0x00DD
	.short 0x021A
	.short 0x00CC
	.short 0x007F
	.short 0x0189
	.short 0x0569
	.short 0x0517
	.short 0x050B
	.short 0x035D
	.short 0x040F
	.short 0x0137
	.short 0x0513
	.short 0x05D2
	.short 0x046E
	.short 0x03C7
	.short 0x0321
	.short 0x027B
	.short 0x0430
	.short 0x037E
	.short 0x03FC
	.short 0x0218
	.short 0x0346
	.short 0x023D
	.short 0x05C7
	.short 0x00BA
	.short 0x003C
	.short 0x003D
	.short 0x003E
	.short 0x05BD
	.short 0x004D
	.short 0x0105
	.short 0x0551
	.short 0x0089
	.short 0x01DA
	.short 0x00E9
	.short 0x01F1
	.short 0x02A5
	.short 0x0464
	.short 0x0388
	.short 0x0370
	.short 0x036B
	.short 0x03A6
	.short 0x0454
	.short 0x02C9
	.short 0x0404
	.short 0x0039
	.short 0x018A
	.short 0x01DC
	.short 0x0565
	.short 0x02A6
	.short 0x022C
	.short 0x02E4
	.short 0xFFFE
	.short 0x0002
	.short 0x024E
	.short 0x03D2
	.short 0x0352
	.short 0x039B
	.short 0x0367
	.short 0x0036
	.short 0x0285
	.short 0x0372
	.short 0x00F7
	.short 0x0420
	.short 0x02D4
	.short 0x01B0
	.short 0xFFFF

sECMenu_Lifestyle:
	.short EC_WORD_GREETINGS__
	.short EC_WORD_GREETINGS_AAH
	.short EC_WORD_GREETINGS_AGREE
	.short EC_WORD_GREETINGS_AHAHA
	.short EC_WORD_GREETINGS_AIYEEH
	.short EC_WORD_GREETINGS_ANGRY
	.short EC_WORD_GREETINGS_BLUSH
	.short EC_WORD_GREETINGS_BONJOUR
	.short EC_WORD_GREETINGS_BOO_
	.short EC_WORD_GREETINGS_BOO_HOO
	.short EC_WORD_GREETINGS_BYE_FOR_NOW
	.short EC_WORD_GREETINGS_BYE_BYE
	.short EC_WORD_GREETINGS_CHEERS
	.short EC_WORD_GREETINGS_CIAO
	.short EC_WORD_GREETINGS_CRIES
	.short EC_WORD_GREETINGS_CUTE_LAUGH
	.short EC_WORD_GREETINGS_EEK
	.short EC_WORD_GREETINGS_EH_
	.short EC_WORD_GREETINGS_EXCUSE_ME
	.short EC_WORD_GREETINGS_FORGIVE_ME
	.short EC_WORD_GREETINGS_GIGGLE
	.short EC_WORD_GREETINGS_GIVE_ME
	.short EC_WORD_GREETINGS_GO_AHEAD
	.short EC_WORD_GREETINGS_GOOD_BYE
	.short EC_WORD_GREETINGS_GREETINGS
	.short EC_WORD_GREETINGS_GWAHAHAHA
	.short EC_WORD_GREETINGS_HAHAHA
	.short EC_WORD_GREETINGS_HALLO
	.short EC_WORD_GREETINGS_HE_HE_HE
	.short EC_WORD_GREETINGS_HEEEY
	.short EC_WORD_GREETINGS_HEH
	.short EC_WORD_GREETINGS_HEHEHE
	.short EC_WORD_GREETINGS_HELLO
	.short EC_WORD_GREETINGS_HELLO_
	.short EC_WORD_GREETINGS_HERE_GOES
	.short EC_WORD_GREETINGS_HERE_I_COME
	.short EC_WORD_GREETINGS_HEY
	.short EC_WORD_GREETINGS_HEY_
	.short EC_WORD_GREETINGS_HEY__2
	.short EC_WORD_GREETINGS_HI
	.short EC_WORD_GREETINGS_HI_THERE
	.short EC_WORD_GREETINGS_HIYAH
	.short EC_WORD_GREETINGS_HMM
	.short EC_WORD_GREETINGS_HOHOHO
	.short EC_WORD_GREETINGS_HOLA
	.short EC_WORD_GREETINGS_HUH__2
	.short EC_WORD_GREETINGS_HUMPH
	.short EC_WORD_GREETINGS_I_M_SORRY
	.short EC_WORD_GREETINGS_I_VE_ARRIVED
	.short EC_WORD_GREETINGS_KONNICHIWA
	.short EC_WORD_GREETINGS_LALALA
	.short EC_WORD_GREETINGS_LET_ME_THINK
	.short EC_WORD_GREETINGS_LET_S_GO
	.short EC_WORD_GREETINGS_LOL
	.short EC_WORD_GREETINGS_MEET_YOU
	.short EC_WORD_GREETINGS_MMM
	.short EC_WORD_GREETINGS_MUFUFU
	.short EC_WORD_GREETINGS_MUHAHAHA
	.short EC_WORD_GREETINGS_NO
	.short EC_WORD_GREETINGS_NO_PROBLEM
	.short EC_WORD_GREETINGS_NO_WAY
	.short EC_WORD_GREETINGS_NOPE
	.short EC_WORD_GREETINGS_OH_MY
	.short EC_WORD_GREETINGS_OH_WELL
	.short EC_WORD_GREETINGS_OH_WOW_
	.short EC_WORD_GREETINGS_OH_DEAR
	.short EC_WORD_GREETINGS_OH_YEAH
	.short EC_WORD_GREETINGS_OK
	.short EC_WORD_GREETINGS_OKAY_THEN
	.short EC_WORD_GREETINGS_OOPS
	.short EC_WORD_GREETINGS_PARDON_ME
	.short EC_WORD_GREETINGS_REGARDS
	.short EC_WORD_GREETINGS_SEE_YA
	.short EC_WORD_GREETINGS_SIGH
	.short EC_WORD_GREETINGS_SNICKER
	.short EC_WORD_GREETINGS_SNORT
	.short EC_WORD_GREETINGS_SO_SORRY
	.short EC_WORD_GREETINGS_SORRY
	.short EC_WORD_GREETINGS_THANK_YOU
	.short EC_WORD_GREETINGS_THANKS
	.short EC_WORD_GREETINGS_THERE_YOU_GO
	.short EC_WORD_GREETINGS_TUT
	.short EC_WORD_GREETINGS_UGH
	.short EC_WORD_GREETINGS_UNBELIEVABLE
	.short EC_WORD_GREETINGS_URGH
	.short EC_WORD_GREETINGS_WAHAHA
	.short EC_WORD_GREETINGS_WAIL
	.short EC_WORD_GREETINGS_WEEP
	.short EC_WORD_GREETINGS_WELCOME_2
	.short EC_WORD_GREETINGS_WELL_DONE
	.short EC_WORD_GREETINGS_WHAT_S_UP_
	.short EC_WORD_GREETINGS_WHOA
	.short EC_WORD_GREETINGS_WOW
	.short EC_WORD_GREETINGS_WROOOAAR_
	.short EC_WORD_GREETINGS_YAAAH
	.short EC_WORD_GREETINGS_YAHOO
	.short EC_WORD_GREETINGS_YAY
	.short EC_WORD_GREETINGS_YEAH
	.short EC_WORD_GREETINGS_YEAH_YEAH
	.short EC_WORD_GREETINGS_YEP
	.short EC_WORD_GREETINGS_YES
	.short EC_WORD_GREETINGS_YO
	.short 0xFFFF

sECMenu_Feelings:
	.short EC_WORD_LIFESTYLE_ADVENTURE
	.short EC_WORD_LIFESTYLE_ANIME
	.short EC_WORD_LIFESTYLE_ANNIVERSARY
	.short EC_WORD_LIFESTYLE_BALL
	.short EC_WORD_LIFESTYLE_BATH
	.short EC_WORD_LIFESTYLE_BICYCLE
	.short EC_WORD_LIFESTYLE_BIRTHDAY
	.short EC_WORD_LIFESTYLE_BOARD
	.short EC_WORD_LIFESTYLE_BOOK
	.short EC_WORD_LIFESTYLE_CAMERA
	.short EC_WORD_LIFESTYLE_CARDS
	.short EC_WORD_LIFESTYLE_CHANNEL
	.short EC_WORD_LIFESTYLE_CHIT_CHAT
	.short EC_WORD_LIFESTYLE_CLASS
	.short EC_WORD_LIFESTYLE_COLLECTION
	.short EC_WORD_LIFESTYLE_COMICS
	.short EC_WORD_LIFESTYLE_COMPLETE
	.short EC_WORD_LIFESTYLE_COMPUTER
	.short EC_WORD_LIFESTYLE_CONVERSATION
	.short EC_WORD_LIFESTYLE_CRAZE
	.short EC_WORD_LIFESTYLE_DAILY_LIFE
	.short EC_WORD_LIFESTYLE_DANCE
	.short EC_WORD_LIFESTYLE_DATE
	.short EC_WORD_LIFESTYLE_DEPT_STORE
	.short EC_WORD_LIFESTYLE_DESIGN
	.short EC_WORD_LIFESTYLE_DIET
	.short EC_WORD_LIFESTYLE_DIGITAL
	.short EC_WORD_LIFESTYLE_DREAM
	.short EC_WORD_LIFESTYLE_EVENT
	.short EC_WORD_LIFESTYLE_FASHION
	.short EC_WORD_LIFESTYLE_FESTIVAL
	.short EC_WORD_LIFESTYLE_FISHING
	.short EC_WORD_LIFESTYLE_FLOWERS
	.short EC_WORD_LIFESTYLE_GAME
	.short EC_WORD_LIFESTYLE_GOURMET
	.short EC_WORD_LIFESTYLE_GROUP
	.short EC_WORD_LIFESTYLE_HABIT
	.short EC_WORD_LIFESTYLE_HERO
	.short EC_WORD_LIFESTYLE_HEROINE
	.short EC_WORD_LIFESTYLE_HOBBY
	.short EC_WORD_LIFESTYLE_HOLIDAY
	.short EC_WORD_LIFESTYLE_HOME
	.short EC_WORD_LIFESTYLE_IDOL
	.short EC_WORD_LIFESTYLE_INFORMATION
	.short EC_WORD_LIFESTYLE_ITEM
	.short EC_WORD_LIFESTYLE_JOB
	.short EC_WORD_LIFESTYLE_KINDERGARTEN
	.short EC_WORD_LIFESTYLE_LESSONS
	.short EC_WORD_LIFESTYLE_LETTER
	.short EC_WORD_LIFESTYLE_LIFE
	.short EC_WORD_LIFESTYLE_LOOKS
	.short EC_WORD_LIFESTYLE_MACHINE
	.short EC_WORD_LIFESTYLE_MAGAZINE
	.short EC_WORD_LIFESTYLE_MAIL
	.short EC_WORD_LIFESTYLE_MESSAGE
	.short EC_WORD_LIFESTYLE_MONEY
	.short EC_WORD_LIFESTYLE_MOVIE
	.short EC_WORD_LIFESTYLE_MUSIC
	.short EC_WORD_LIFESTYLE_NAME
	.short EC_WORD_LIFESTYLE_NAP
	.short EC_WORD_LIFESTYLE_NEWS
	.short EC_WORD_LIFESTYLE_PARTY
	.short EC_WORD_LIFESTYLE_PHONE
	.short EC_WORD_LIFESTYLE_PLANS
	.short EC_WORD_LIFESTYLE_PLAY_HOUSE
	.short EC_WORD_LIFESTYLE_PLAYING
	.short EC_WORD_LIFESTYLE_POCKET_MONEY
	.short EC_WORD_LIFESTYLE_POPULARITY
	.short EC_WORD_LIFESTYLE_PROMISE
	.short EC_WORD_LIFESTYLE_RADIO
	.short EC_WORD_LIFESTYLE_RENTAL
	.short EC_WORD_LIFESTYLE_SCHOOL
	.short EC_WORD_LIFESTYLE_SERVICE
	.short EC_WORD_LIFESTYLE_SHOPPING
	.short EC_WORD_LIFESTYLE_SOFTWARE
	.short EC_WORD_LIFESTYLE_SONG
	.short EC_WORD_LIFESTYLE_SONGS
	.short EC_WORD_LIFESTYLE_SPECTATE
	.short EC_WORD_LIFESTYLE_SPORTS
	.short EC_WORD_LIFESTYLE_STORE
	.short EC_WORD_LIFESTYLE_STORY
	.short EC_WORD_LIFESTYLE_STUDY
	.short EC_WORD_LIFESTYLE_STUFFED_TOY
	.short EC_WORD_LIFESTYLE_SWEETS
	.short EC_WORD_LIFESTYLE_SYSTEM
	.short EC_WORD_LIFESTYLE_TALK
	.short EC_WORD_LIFESTYLE_TEACHER
	.short EC_WORD_LIFESTYLE_TELEVISION
	.short EC_WORD_LIFESTYLE_TEST
	.short EC_WORD_LIFESTYLE_TODAY
	.short EC_WORD_LIFESTYLE_TOMORROW
	.short EC_WORD_LIFESTYLE_TOURNAMENT
	.short EC_WORD_LIFESTYLE_TOYS
	.short EC_WORD_LIFESTYLE_TRAIN
	.short EC_WORD_LIFESTYLE_TRAINING
	.short EC_WORD_LIFESTYLE_TRAVEL
	.short EC_WORD_LIFESTYLE_TREASURE
	.short EC_WORD_LIFESTYLE_VACATION
	.short EC_WORD_LIFESTYLE_VIEWING
	.short EC_WORD_LIFESTYLE_WALK
	.short EC_WORD_LIFESTYLE_WORD
	.short EC_WORD_LIFESTYLE_WORK
	.short EC_WORD_LIFESTYLE_WORLD
	.short EC_WORD_LIFESTYLE_YESTERDAY
	.short 0xFFFF

_02107590:
	.short 0x014B
	.short 0x014C
	.short 0x05A7
	.short 0x034B
	.short 0x051E
	.short 0x0143
	.short 0x0315
	.short 0x03AD
	.short 0x051A
	.short 0x01C7
	.short 0x013E
	.short 0x010C
	.short 0x015F
	.short 0x000A
	.short 0x00FB
	.short 0x0465
	.short 0x0542
	.short 0x0071
	.short 0x02FC
	.short 0x03B3
	.short 0x0006
	.short 0x02BC
	.short 0x0004
	.short 0x0005
	.short 0x05CB
	.short 0x01B9
	.short 0x03B0
	.short 0x04DE
	.short 0x01A5
	.short 0x01A4
	.short 0x0098
	.short 0x0186
	.short 0x0166
	.short 0x00AA
	.short 0x01B1
	.short 0x0514
	.short 0x03F8
	.short 0x04A1
	.short 0x0270
	.short 0x016E
	.short 0x0533
	.short 0x0158
	.short 0x03F3
	.short 0x0024
	.short 0x0023
	.short 0x00AD
	.short 0x0574
	.short 0x0362
	.short 0x03E3
	.short 0x005B
	.short 0x0529
	.short 0x03E6
	.short 0x05C6
	.short 0x019F
	.short 0x0100
	.short 0x0459
	.short 0x01F4
	.short 0x0561
	.short 0x052B
	.short 0x03E4
	.short 0x0554
	.short 0x05AF
	.short 0x025D
	.short 0x024D
	.short 0x05CD
	.short 0x0274
	.short 0x05D3
	.short 0x05B2
	.short 0x051C
	.short 0x0290
	.short 0x02A0
	.short 0x0576
	.short 0x036F
	.short 0x05B0
	.short 0x0155
	.short 0x00DE
	.short 0x0332
	.short 0x02A2
	.short 0x0234
	.short 0x045C
	.short 0x0347
	.short 0x0288
	.short 0x015A
	.short 0x0198
	.short 0x0156
	.short 0x056C
	.short 0x01E8
	.short 0x04BA
	.short 0x01C5
	.short 0x00A9
	.short 0x009F
	.short 0x02DE
	.short 0x03A8
	.short 0x05AA
	.short 0x02E2
	.short 0x0322
	.short 0x03BE
	.short 0x05A9
	.short 0x0068
	.short 0x029E
	.short 0x01FF
	.short 0x040E
	.short 0x04B8
	.short 0x0578
	.short 0x009B
	.short 0xFFFF

_02107664:
	.short 0x02A7
	.short 0x0044
	.short 0x055F
	.short 0x0043
	.short 0x0042
	.short 0x052D
	.short 0x00F0
	.short 0x00DB
	.short 0x0305
	.short 0x0438
	.short 0x0349
	.short 0x0081
	.short 0x03FE
	.short 0x03BF
	.short 0x007E
	.short 0x01D3
	.short 0x0051
	.short 0x03AB
	.short 0x0400
	.short 0x0379
	.short 0x0052
	.short 0x01CE
	.short 0x02CE
	.short 0x0562
	.short 0x0128
	.short 0x01D9
	.short 0x01EA
	.short 0x0136
	.short 0x0038
	.short 0x00E2
	.short 0x01CA
	.short 0x00B3
	.short 0x00B7
	.short 0x0069
	.short 0x0103
	.short 0x0415
	.short 0x011C
	.short 0x045F
	.short 0x0452
	.short 0x012F
	.short 0x0487
	.short 0x036E
	.short 0x02C4
	.short 0x0134
	.short 0x0250
	.short 0x0133
	.short 0x04E8
	.short 0x0238
	.short 0x0209
	.short 0x01F5
	.short 0x02D0
	.short 0x009A
	.short 0x02F6
	.short 0x0034
	.short 0x01E1
	.short 0x0563
	.short 0x0595
	.short 0x0178
	.short 0x0360
	.short 0x02D8
	.short 0x032F
	.short 0x0177
	.short 0x000B
	.short 0x0325
	.short 0x0266
	.short 0x0097
	.short 0x0096
	.short 0x0106
	.short 0x02C0
	.short 0x015E
	.short 0x00F1
	.short 0x01B7
	.short 0x0256
	.short 0x029A
	.short 0x025B
	.short 0x0138
	.short 0x0410
	.short 0x0355
	.short 0x02E3
	.short 0x0267
	.short 0x039D
	.short 0x00C8
	.short 0x01AD
	.short 0x0226
	.short 0x0318
	.short 0x05C2
	.short 0x04F9
	.short 0x043E
	.short 0x0092
	.short 0x0512
	.short 0x05A5
	.short 0x0187
	.short 0x02DC
	.short 0x02DA
	.short 0x047B
	.short 0x019E
	.short 0x0424
	.short 0x0476
	.short 0x0510
	.short 0x0490
	.short 0x007A
	.short 0x0491
	.short 0x039A
	.short 0x0345
	.short 0x031C
	.short 0x02AD
	.short 0x033A
	.short 0x0102
	.short 0x04F8
	.short 0x04EC
	.short 0x0059
	.short 0x05C3
	.short 0x01BE
	.short 0x00C6
	.short 0x0519
	.short 0x0492
	.short 0xFFFF

sECMenu_TypesAndAbilities:
	.short EC_WORD_ABILITY(ABILITY_ADAPTABILITY)
	.short EC_WORD_ABILITY(ABILITY_AFTERMATH)
	.short EC_WORD_ABILITY(ABILITY_AIR_LOCK)
	.short EC_WORD_ABILITY(ABILITY_ANGER_POINT)
	.short EC_WORD_ABILITY(ABILITY_ANTICIPATION)
	.short EC_WORD_ABILITY(ABILITY_ARENA_TRAP)
	.short EC_WORD_ABILITY(ABILITY_BATTLE_ARMOR)
	.short EC_WORD_ABILITY(ABILITY_BLAZE)
	.short EC_WORD_TYPE(TYPE_BUG)
	.short EC_WORD_ABILITY(ABILITY_CHLOROPHYLL)
	.short EC_WORD_ABILITY(ABILITY_CLEAR_BODY)
	.short EC_WORD_ABILITY(ABILITY_CLOUD_NINE)
	.short EC_WORD_ABILITY(ABILITY_COLOR_CHANGE)
	.short EC_WORD_ABILITY(ABILITY_COMPOUNDEYES)
	.short EC_WORD_ABILITY(ABILITY_CUTE_CHARM)
	.short EC_WORD_ABILITY(ABILITY_DAMP)
	.short EC_WORD_TYPE(TYPE_DARK)
	.short EC_WORD_ABILITY(ABILITY_DOWNLOAD)
	.short EC_WORD_TYPE(TYPE_DRAGON)
	.short EC_WORD_ABILITY(ABILITY_DRIZZLE)
	.short EC_WORD_ABILITY(ABILITY_DROUGHT)
	.short EC_WORD_ABILITY(ABILITY_DRY_SKIN)
	.short EC_WORD_ABILITY(ABILITY_EARLY_BIRD)
	.short EC_WORD_ABILITY(ABILITY_EFFECT_SPORE)
	.short EC_WORD_TYPE(TYPE_ELECTRIC)
	.short EC_WORD_TYPE(TYPE_FIGHTING)
	.short EC_WORD_ABILITY(ABILITY_FILTER)
	.short EC_WORD_TYPE(TYPE_FIRE)
	.short EC_WORD_ABILITY(ABILITY_FLAME_BODY)
	.short EC_WORD_ABILITY(ABILITY_FLASH_FIRE)
	.short EC_WORD_ABILITY(ABILITY_FLOWER_GIFT)
	.short EC_WORD_TYPE(TYPE_FLYING)
	.short EC_WORD_ABILITY(ABILITY_FORECAST)
	.short EC_WORD_ABILITY(ABILITY_FOREWARN)
	.short EC_WORD_ABILITY(ABILITY_FRISK)
	.short EC_WORD_TYPE(TYPE_GHOST)
	.short EC_WORD_ABILITY(ABILITY_GLUTTONY)
	.short EC_WORD_TYPE(TYPE_GRASS)
	.short EC_WORD_TYPE(TYPE_GROUND)
	.short EC_WORD_ABILITY(ABILITY_GUTS)
	.short EC_WORD_ABILITY(ABILITY_HEATPROOF)
	.short EC_WORD_ABILITY(ABILITY_HONEY_GATHER)
	.short EC_WORD_ABILITY(ABILITY_HUGE_POWER)
	.short EC_WORD_ABILITY(ABILITY_HUSTLE)
	.short EC_WORD_ABILITY(ABILITY_HYDRATION)
	.short EC_WORD_ABILITY(ABILITY_HYPER_CUTTER)
	.short EC_WORD_TYPE(TYPE_ICE)
	.short EC_WORD_ABILITY(ABILITY_ICE_BODY)
	.short EC_WORD_ABILITY(ABILITY_ILLUMINATE)
	.short EC_WORD_ABILITY(ABILITY_IMMUNITY)
	.short EC_WORD_ABILITY(ABILITY_INNER_FOCUS)
	.short EC_WORD_ABILITY(ABILITY_INSOMNIA)
	.short EC_WORD_ABILITY(ABILITY_INTIMIDATE)
	.short EC_WORD_ABILITY(ABILITY_IRON_FIST)
	.short EC_WORD_ABILITY(ABILITY_KEEN_EYE)
	.short EC_WORD_ABILITY(ABILITY_KLUTZ)
	.short EC_WORD_ABILITY(ABILITY_LEAF_GUARD)
	.short EC_WORD_ABILITY(ABILITY_LEVITATE)
	.short EC_WORD_ABILITY(ABILITY_LIGHTNINGROD)
	.short EC_WORD_ABILITY(ABILITY_LIMBER)
	.short EC_WORD_ABILITY(ABILITY_LIQUID_OOZE)
	.short EC_WORD_ABILITY(ABILITY_MAGIC_GUARD)
	.short EC_WORD_ABILITY(ABILITY_MAGMA_ARMOR)
	.short EC_WORD_ABILITY(ABILITY_MAGNET_PULL)
	.short EC_WORD_ABILITY(ABILITY_MARVEL_SCALE)
	.short EC_WORD_ABILITY(ABILITY_MINUS)
	.short EC_WORD_ABILITY(ABILITY_MOLD_BREAKER)
	.short EC_WORD_ABILITY(ABILITY_MOTOR_DRIVE)
	.short EC_WORD_ABILITY(ABILITY_NATURAL_CURE)
	.short EC_WORD_ABILITY(ABILITY_NO_GUARD)
	.short EC_WORD_TYPE(TYPE_NORMAL)
	.short EC_WORD_ABILITY(ABILITY_NORMALIZE)
	.short EC_WORD_ABILITY(ABILITY_OBLIVIOUS)
	.short EC_WORD_ABILITY(ABILITY_OVERGROW)
	.short EC_WORD_ABILITY(ABILITY_OWN_TEMPO)
	.short EC_WORD_ABILITY(ABILITY_PICKUP)
	.short EC_WORD_ABILITY(ABILITY_PLUS)
	.short EC_WORD_TYPE(TYPE_POISON)
	.short EC_WORD_ABILITY(ABILITY_POISON_HEAL)
	.short EC_WORD_ABILITY(ABILITY_POISON_POINT)
	.short EC_WORD_ABILITY(ABILITY_PRESSURE)
	.short EC_WORD_TYPE(TYPE_PSYCHIC)
	.short EC_WORD_ABILITY(ABILITY_PURE_POWER)
	.short EC_WORD_ABILITY(ABILITY_QUICK_FEET)
	.short EC_WORD_ABILITY(ABILITY_RAIN_DISH)
	.short EC_WORD_ABILITY(ABILITY_RECKLESS)
	.short EC_WORD_ABILITY(ABILITY_RIVALRY)
	.short EC_WORD_TYPE(TYPE_ROCK)
	.short EC_WORD_ABILITY(ABILITY_ROCK_HEAD)
	.short EC_WORD_ABILITY(ABILITY_ROUGH_SKIN)
	.short EC_WORD_ABILITY(ABILITY_RUN_AWAY)
	.short EC_WORD_ABILITY(ABILITY_SAND_STREAM)
	.short EC_WORD_ABILITY(ABILITY_SAND_VEIL)
	.short EC_WORD_ABILITY(ABILITY_SCRAPPY)
	.short EC_WORD_ABILITY(ABILITY_SERENE_GRACE)
	.short EC_WORD_ABILITY(ABILITY_SHADOW_TAG)
	.short EC_WORD_ABILITY(ABILITY_SHED_SKIN)
	.short EC_WORD_ABILITY(ABILITY_SHELL_ARMOR)
	.short EC_WORD_ABILITY(ABILITY_SHIELD_DUST)
	.short EC_WORD_ABILITY(ABILITY_SIMPLE)
	.short EC_WORD_ABILITY(ABILITY_SKILL_LINK)
	.short EC_WORD_ABILITY(ABILITY_SLOW_START)
	.short EC_WORD_ABILITY(ABILITY_SNIPER)
	.short EC_WORD_ABILITY(ABILITY_SNOW_CLOAK)
	.short EC_WORD_ABILITY(ABILITY_SNOW_WARNING)
	.short EC_WORD_ABILITY(ABILITY_SOLAR_POWER)
	.short EC_WORD_ABILITY(ABILITY_SOLID_ROCK)
	.short EC_WORD_ABILITY(ABILITY_SOUNDPROOF)
	.short EC_WORD_ABILITY(ABILITY_SPEED_BOOST)
	.short EC_WORD_ABILITY(ABILITY_STALL)
	.short EC_WORD_ABILITY(ABILITY_STATIC)
	.short EC_WORD_ABILITY(ABILITY_STEADFAST)
	.short EC_WORD_TYPE(TYPE_STEEL)
	.short EC_WORD_ABILITY(ABILITY_STENCH)
	.short EC_WORD_ABILITY(ABILITY_STICKY_HOLD)
	.short EC_WORD_ABILITY(ABILITY_STORM_DRAIN)
	.short EC_WORD_ABILITY(ABILITY_STURDY)
	.short EC_WORD_ABILITY(ABILITY_SUCTION_CUPS)
	.short EC_WORD_ABILITY(ABILITY_SUPER_LUCK)
	.short EC_WORD_ABILITY(ABILITY_SWARM)
	.short EC_WORD_ABILITY(ABILITY_SWIFT_SWIM)
	.short EC_WORD_ABILITY(ABILITY_SYNCHRONIZE)
	.short EC_WORD_ABILITY(ABILITY_TANGLED_FEET)
	.short EC_WORD_ABILITY(ABILITY_TECHNICIAN)
	.short EC_WORD_ABILITY(ABILITY_THICK_FAT)
	.short EC_WORD_ABILITY(ABILITY_TINTED_LENS)
	.short EC_WORD_ABILITY(ABILITY_TORRENT)
	.short EC_WORD_ABILITY(ABILITY_TRACE)
	.short EC_WORD_ABILITY(ABILITY_TRUANT)
	.short EC_WORD_ABILITY(ABILITY_UNAWARE)
	.short EC_WORD_ABILITY(ABILITY_UNBURDEN)
	.short EC_WORD_ABILITY(ABILITY_VITAL_SPIRIT)
	.short EC_WORD_ABILITY(ABILITY_VOLT_ABSORB)
	.short EC_WORD_TYPE(TYPE_WATER)
	.short EC_WORD_ABILITY(ABILITY_WATER_ABSORB)
	.short EC_WORD_ABILITY(ABILITY_WATER_VEIL)
	.short EC_WORD_ABILITY(ABILITY_WHITE_SMOKE)
	.short EC_WORD_ABILITY(ABILITY_WONDER_GUARD)
	.short 0xFFFF

_02107864:
	.short 0x012E
	.short 0x02CD
	.short 0x0577
	.short 0x02CB
	.short 0x0175
	.short 0x0403
	.short 0x0338
	.short 0x03DE
	.short 0x020C
	.short 0x001B
	.short 0x001C
	.short 0x02B9
	.short 0x0593
	.short 0x02A8
	.short 0x00FE
	.short 0x051D
	.short 0x00D4
	.short 0x0447
	.short 0x01FA
	.short 0x0257
	.short 0x007B
	.short 0x0075
	.short 0x0077
	.short 0x016C
	.short 0x05D6
	.short 0x0312
	.short 0x04D8
	.short 0x0382
	.short 0x0111
	.short 0x0056
	.short 0x0235
	.short 0x0268
	.short 0x0461
	.short 0x00A1
	.short 0x03F6
	.short 0x046F
	.short 0x052C
	.short 0x0150
	.short 0x02E7
	.short 0x0395
	.short 0x03C3
	.short 0x0335
	.short 0x0399
	.short 0x03ED
	.short 0x013F
	.short 0x028F
	.short 0x01EC
	.short 0x0413
	.short 0x0124
	.short 0x0339
	.short 0x0174
	.short 0x0421
	.short 0x005A
	.short 0x01A6
	.short 0x03E9
	.short 0x019A
	.short 0x0113
	.short 0x0193
	.short 0x034F
	.short 0x051B
	.short 0x011D
	.short 0x00D5
	.short 0x0161
	.short 0x048E
	.short 0x04E3
	.short 0x0334
	.short 0x010A
	.short 0x032E
	.short 0xFFFE
	.short 0x0002
	.short 0x042C
	.short 0x059D
	.short 0x021F
	.short 0x05C0
	.short 0x0482
	.short 0x00E3
	.short 0x0296
	.short 0x0432
	.short 0x030D
	.short 0x058A
	.short 0x00BC
	.short 0x012C
	.short 0x01C3
	.short 0x0272
	.short 0x01B3
	.short 0x027F
	.short 0x0337
	.short 0x031F
	.short 0x0121
	.short 0x011F
	.short 0x0205
	.short 0x0293
	.short 0x023F
	.short 0x02C6
	.short 0x0446
	.short 0x0050
	.short 0x00C7
	.short 0x004F
	.short 0x026C
	.short 0x02AC
	.short 0x00DA
	.short 0x00EB
	.short 0x02F9
	.short 0x059A
	.short 0x026B
	.short 0x025C
	.short 0x00EE
	.short 0x0311
	.short 0x00D7
	.short 0x04B7
	.short 0x0437
	.short 0x029D
	.short 0x008F
	.short 0x04EE
	.short 0x0169
	.short 0x01CB
	.short 0x0427
	.short 0x044B
	.short 0x00D1
	.short 0x04D7
	.short 0x0277
	.short 0x053A
	.short 0x0434
	.short 0x023C
	.short 0x044A
	.short 0x0152
	.short 0x050E
	.short 0x053B
	.short 0x0221
	.short 0x04CE
	.short 0x0401
	.short 0x03BC
	.short 0x02C1
	.short 0x0015
	.short 0x0520
	.short 0x03D9
	.short 0x016B
	.short 0x0299
	.short 0x0273
	.short 0x02AF
	.short 0x00A7
	.short 0x0147
	.short 0x0457
	.short 0x01BA
	.short 0x02EF
	.short 0x02A4
	.short 0x0286
	.short 0x0145
	.short 0x0283
	.short 0x0537
	.short 0x05B5
	.short 0x0007
	.short 0x043A
	.short 0x00EA
	.short 0x018E
	.short 0x018D
	.short 0x05A4
	.short 0x018C
	.short 0x0079
	.short 0x0078
	.short 0x03DF
	.short 0x0426
	.short 0x03AE
	.short 0x03CC
	.short 0x02C3
	.short 0x00D0
	.short 0x03D7
	.short 0x0412
	.short 0x05BA
	.short 0x02EE
	.short 0x0207
	.short 0x03AC
	.short 0x052A
	.short 0x0448
	.short 0x0564
	.short 0x0573
	.short 0x045E
	.short 0x05AE
	.short 0x0236
	.short 0x0241
	.short 0x0466
	.short 0x0295
	.short 0x055A
	.short 0x0552
	.short 0x023E
	.short 0x01B2
	.short 0x03DB
	.short 0x0232
	.short 0x0294
	.short 0x059B
	.short 0x0375
	.short 0x03EB
	.short 0x00B9
	.short 0x00F5
	.short 0x00C0
	.short 0x00BF
	.short 0x02E1
	.short 0x0292
	.short 0x043F
	.short 0x0304
	.short 0x0220
	.short 0x0229
	.short 0x0590
	.short 0x045B
	.short 0x011B
	.short 0x014D
	.short 0x02BF
	.short 0x02F0
	.short 0x013D
	.short 0x0104
	.short 0x041A
	.short 0x02AA
	.short 0x02D6
	.short 0x0511
	.short 0x0115
	.short 0x0271
	.short 0x03F7
	.short 0x00DC
	.short 0x038F
	.short 0x01FE
	.short 0x03F2
	.short 0x02DB
	.short 0x0530
	.short 0xFFFF

sECMenu_Move_AtoL:
	.short EC_WORD_MOVE(MOVE_ABSORB)
	.short EC_WORD_MOVE(MOVE_ACID)
	.short EC_WORD_MOVE(MOVE_ACID_ARMOR)
	.short EC_WORD_MOVE(MOVE_ACUPRESSURE)
	.short EC_WORD_MOVE(MOVE_AERIAL_ACE)
	.short EC_WORD_MOVE(MOVE_AEROBLAST)
	.short EC_WORD_MOVE(MOVE_AGILITY)
	.short EC_WORD_MOVE(MOVE_AIR_CUTTER)
	.short EC_WORD_MOVE(MOVE_AIR_SLASH)
	.short EC_WORD_MOVE(MOVE_AMNESIA)
	.short EC_WORD_MOVE(MOVE_ANCIENT_POWER)
	.short EC_WORD_MOVE(MOVE_AQUA_JET)
	.short EC_WORD_MOVE(MOVE_AQUA_RING)
	.short EC_WORD_MOVE(MOVE_AQUA_TAIL)
	.short EC_WORD_MOVE(MOVE_ARM_THRUST)
	.short EC_WORD_MOVE(MOVE_AROMATHERAPY)
	.short EC_WORD_MOVE(MOVE_ASSIST)
	.short EC_WORD_MOVE(MOVE_ASSURANCE)
	.short EC_WORD_MOVE(MOVE_ASTONISH)
	.short EC_WORD_MOVE(MOVE_ATTACK_ORDER)
	.short EC_WORD_MOVE(MOVE_ATTRACT)
	.short EC_WORD_MOVE(MOVE_AURA_SPHERE)
	.short EC_WORD_MOVE(MOVE_AURORA_BEAM)
	.short EC_WORD_MOVE(MOVE_AVALANCHE)
	.short EC_WORD_MOVE(MOVE_BARRAGE)
	.short EC_WORD_MOVE(MOVE_BARRIER)
	.short EC_WORD_MOVE(MOVE_BATON_PASS)
	.short EC_WORD_MOVE(MOVE_BEAT_UP)
	.short EC_WORD_MOVE(MOVE_BELLY_DRUM)
	.short EC_WORD_MOVE(MOVE_BIDE)
	.short EC_WORD_MOVE(MOVE_BIND)
	.short EC_WORD_MOVE(MOVE_BITE)
	.short EC_WORD_MOVE(MOVE_BLAST_BURN)
	.short EC_WORD_MOVE(MOVE_BLAZE_KICK)
	.short EC_WORD_MOVE(MOVE_BLIZZARD)
	.short EC_WORD_MOVE(MOVE_BLOCK)
	.short EC_WORD_MOVE(MOVE_BODY_SLAM)
	.short EC_WORD_MOVE(MOVE_BONE_CLUB)
	.short EC_WORD_MOVE(MOVE_BONE_RUSH)
	.short EC_WORD_MOVE(MOVE_BONEMERANG)
	.short EC_WORD_MOVE(MOVE_BOUNCE)
	.short EC_WORD_MOVE(MOVE_BRAVE_BIRD)
	.short EC_WORD_MOVE(MOVE_BRICK_BREAK)
	.short EC_WORD_MOVE(MOVE_BRINE)
	.short EC_WORD_MOVE(MOVE_BUBBLE)
	.short EC_WORD_MOVE(MOVE_BUBBLE_BEAM)
	.short EC_WORD_MOVE(MOVE_BUG_BITE)
	.short EC_WORD_MOVE(MOVE_BUG_BUZZ)
	.short EC_WORD_MOVE(MOVE_BULK_UP)
	.short EC_WORD_MOVE(MOVE_BULLET_PUNCH)
	.short EC_WORD_MOVE(MOVE_BULLET_SEED)
	.short EC_WORD_MOVE(MOVE_CALM_MIND)
	.short EC_WORD_MOVE(MOVE_CAMOUFLAGE)
	.short EC_WORD_MOVE(MOVE_CAPTIVATE)
	.short EC_WORD_MOVE(MOVE_CHARGE)
	.short EC_WORD_MOVE(MOVE_CHARGE_BEAM)
	.short EC_WORD_MOVE(MOVE_CHARM)
	.short EC_WORD_MOVE(MOVE_CHATTER)
	.short EC_WORD_MOVE(MOVE_CLAMP)
	.short EC_WORD_MOVE(MOVE_CLOSE_COMBAT)
	.short EC_WORD_MOVE(MOVE_COMET_PUNCH)
	.short EC_WORD_MOVE(MOVE_CONFUSE_RAY)
	.short EC_WORD_MOVE(MOVE_CONFUSION)
	.short EC_WORD_MOVE(MOVE_CONSTRICT)
	.short EC_WORD_MOVE(MOVE_CONVERSION)
	.short EC_WORD_MOVE(MOVE_CONVERSION_2)
	.short EC_WORD_MOVE(MOVE_COPYCAT)
	.short EC_WORD_MOVE(MOVE_COSMIC_POWER)
	.short EC_WORD_MOVE(MOVE_COTTON_SPORE)
	.short EC_WORD_MOVE(MOVE_COUNTER)
	.short EC_WORD_MOVE(MOVE_COVET)
	.short EC_WORD_MOVE(MOVE_CRABHAMMER)
	.short EC_WORD_MOVE(MOVE_CROSS_CHOP)
	.short EC_WORD_MOVE(MOVE_CROSS_POISON)
	.short EC_WORD_MOVE(MOVE_CRUNCH)
	.short EC_WORD_MOVE(MOVE_CRUSH_CLAW)
	.short EC_WORD_MOVE(MOVE_CRUSH_GRIP)
	.short EC_WORD_MOVE(MOVE_CURSE)
	.short EC_WORD_MOVE(MOVE_CUT)
	.short EC_WORD_MOVE(MOVE_DARK_PULSE)
	.short EC_WORD_MOVE(MOVE_DEFEND_ORDER)
	.short EC_WORD_MOVE(MOVE_DEFENSE_CURL)
	.short EC_WORD_MOVE(MOVE_DEFOG)
	.short EC_WORD_MOVE(MOVE_DESTINY_BOND)
	.short EC_WORD_MOVE(MOVE_DETECT)
	.short EC_WORD_MOVE(MOVE_DIG)
	.short EC_WORD_MOVE(MOVE_DISABLE)
	.short EC_WORD_MOVE(MOVE_DISCHARGE)
	.short EC_WORD_MOVE(MOVE_DIVE)
	.short EC_WORD_MOVE(MOVE_DIZZY_PUNCH)
	.short EC_WORD_MOVE(MOVE_DOOM_DESIRE)
	.short EC_WORD_MOVE(MOVE_DOUBLE_HIT)
	.short EC_WORD_MOVE(MOVE_DOUBLE_KICK)
	.short EC_WORD_MOVE(MOVE_DOUBLE_TEAM)
	.short EC_WORD_MOVE(MOVE_DOUBLE_EDGE)
	.short EC_WORD_MOVE(MOVE_DOUBLE_SLAP)
	.short EC_WORD_MOVE(MOVE_DRACO_METEOR)
	.short EC_WORD_MOVE(MOVE_DRAGON_CLAW)
	.short EC_WORD_MOVE(MOVE_DRAGON_DANCE)
	.short EC_WORD_MOVE(MOVE_DRAGON_PULSE)
	.short EC_WORD_MOVE(MOVE_DRAGON_RAGE)
	.short EC_WORD_MOVE(MOVE_DRAGON_RUSH)
	.short EC_WORD_MOVE(MOVE_DRAGON_BREATH)
	.short EC_WORD_MOVE(MOVE_DRAIN_PUNCH)
	.short EC_WORD_MOVE(MOVE_DREAM_EATER)
	.short EC_WORD_MOVE(MOVE_DRILL_PECK)
	.short EC_WORD_MOVE(MOVE_DYNAMIC_PUNCH)
	.short EC_WORD_MOVE(MOVE_EARTH_POWER)
	.short EC_WORD_MOVE(MOVE_EARTHQUAKE)
	.short EC_WORD_MOVE(MOVE_EGG_BOMB)
	.short EC_WORD_MOVE(MOVE_EMBARGO)
	.short EC_WORD_MOVE(MOVE_EMBER)
	.short EC_WORD_MOVE(MOVE_ENCORE)
	.short EC_WORD_MOVE(MOVE_ENDEAVOR)
	.short EC_WORD_MOVE(MOVE_ENDURE)
	.short EC_WORD_MOVE(MOVE_ENERGY_BALL)
	.short EC_WORD_MOVE(MOVE_ERUPTION)
	.short EC_WORD_MOVE(MOVE_EXPLOSION)
	.short EC_WORD_MOVE(MOVE_EXTRASENSORY)
	.short EC_WORD_MOVE(MOVE_EXTREME_SPEED)
	.short EC_WORD_MOVE(MOVE_FACADE)
	.short EC_WORD_MOVE(MOVE_FEINT_ATTACK)
	.short EC_WORD_MOVE(MOVE_FAKE_OUT)
	.short EC_WORD_MOVE(MOVE_FAKE_TEARS)
	.short EC_WORD_MOVE(MOVE_FALSE_SWIPE)
	.short EC_WORD_MOVE(MOVE_FEATHER_DANCE)
	.short EC_WORD_MOVE(MOVE_FEINT)
	.short EC_WORD_MOVE(MOVE_FIRE_BLAST)
	.short EC_WORD_MOVE(MOVE_FIRE_FANG)
	.short EC_WORD_MOVE(MOVE_FIRE_PUNCH)
	.short EC_WORD_MOVE(MOVE_FIRE_SPIN)
	.short EC_WORD_MOVE(MOVE_FISSURE)
	.short EC_WORD_MOVE(MOVE_FLAIL)
	.short EC_WORD_MOVE(MOVE_FLAME_WHEEL)
	.short EC_WORD_MOVE(MOVE_FLAMETHROWER)
	.short EC_WORD_MOVE(MOVE_FLARE_BLITZ)
	.short EC_WORD_MOVE(MOVE_FLASH)
	.short EC_WORD_MOVE(MOVE_FLASH_CANNON)
	.short EC_WORD_MOVE(MOVE_FLATTER)
	.short EC_WORD_MOVE(MOVE_FLING)
	.short EC_WORD_MOVE(MOVE_FLY)
	.short EC_WORD_MOVE(MOVE_FOCUS_BLAST)
	.short EC_WORD_MOVE(MOVE_FOCUS_ENERGY)
	.short EC_WORD_MOVE(MOVE_FOCUS_PUNCH)
	.short EC_WORD_MOVE(MOVE_FOLLOW_ME)
	.short EC_WORD_MOVE(MOVE_FORCE_PALM)
	.short EC_WORD_MOVE(MOVE_FORESIGHT)
	.short EC_WORD_MOVE(MOVE_FRENZY_PLANT)
	.short EC_WORD_MOVE(MOVE_FRUSTRATION)
	.short EC_WORD_MOVE(MOVE_FURY_ATTACK)
	.short EC_WORD_MOVE(MOVE_FURY_CUTTER)
	.short EC_WORD_MOVE(MOVE_FURY_SWIPES)
	.short EC_WORD_MOVE(MOVE_FUTURE_SIGHT)
	.short EC_WORD_MOVE(MOVE_GASTRO_ACID)
	.short EC_WORD_MOVE(MOVE_GIGA_DRAIN)
	.short EC_WORD_MOVE(MOVE_GIGA_IMPACT)
	.short EC_WORD_MOVE(MOVE_GLARE)
	.short EC_WORD_MOVE(MOVE_GRASS_KNOT)
	.short EC_WORD_MOVE(MOVE_GRASS_WHISTLE)
	.short EC_WORD_MOVE(MOVE_GRAVITY)
	.short EC_WORD_MOVE(MOVE_GROWL)
	.short EC_WORD_MOVE(MOVE_GROWTH)
	.short EC_WORD_MOVE(MOVE_GRUDGE)
	.short EC_WORD_MOVE(MOVE_GUARD_SWAP)
	.short EC_WORD_MOVE(MOVE_GUILLOTINE)
	.short EC_WORD_MOVE(MOVE_GUNK_SHOT)
	.short EC_WORD_MOVE(MOVE_GUST)
	.short EC_WORD_MOVE(MOVE_GYRO_BALL)
	.short EC_WORD_MOVE(MOVE_HAIL)
	.short EC_WORD_MOVE(MOVE_HAMMER_ARM)
	.short EC_WORD_MOVE(MOVE_HARDEN)
	.short EC_WORD_MOVE(MOVE_HAZE)
	.short EC_WORD_MOVE(MOVE_HEAD_SMASH)
	.short EC_WORD_MOVE(MOVE_HEADBUTT)
	.short EC_WORD_MOVE(MOVE_HEAL_BELL)
	.short EC_WORD_MOVE(MOVE_HEAL_BLOCK)
	.short EC_WORD_MOVE(MOVE_HEAL_ORDER)
	.short EC_WORD_MOVE(MOVE_HEALING_WISH)
	.short EC_WORD_MOVE(MOVE_HEART_SWAP)
	.short EC_WORD_MOVE(MOVE_HEAT_WAVE)
	.short EC_WORD_MOVE(MOVE_HELPING_HAND)
	.short EC_WORD_MOVE(MOVE_HIGH_JUMP_KICK)
	.short EC_WORD_MOVE(MOVE_HIDDEN_POWER)
	.short EC_WORD_MOVE(MOVE_HORN_ATTACK)
	.short EC_WORD_MOVE(MOVE_HORN_DRILL)
	.short EC_WORD_MOVE(MOVE_HOWL)
	.short EC_WORD_MOVE(MOVE_HYDRO_CANNON)
	.short EC_WORD_MOVE(MOVE_HYDRO_PUMP)
	.short EC_WORD_MOVE(MOVE_HYPER_BEAM)
	.short EC_WORD_MOVE(MOVE_HYPER_FANG)
	.short EC_WORD_MOVE(MOVE_HYPER_VOICE)
	.short EC_WORD_MOVE(MOVE_HYPNOSIS)
	.short EC_WORD_MOVE(MOVE_ICE_BALL)
	.short EC_WORD_MOVE(MOVE_ICE_BEAM)
	.short EC_WORD_MOVE(MOVE_ICE_FANG)
	.short EC_WORD_MOVE(MOVE_ICE_PUNCH)
	.short EC_WORD_MOVE(MOVE_ICE_SHARD)
	.short EC_WORD_MOVE(MOVE_ICICLE_SPEAR)
	.short EC_WORD_MOVE(MOVE_ICY_WIND)
	.short EC_WORD_MOVE(MOVE_IMPRISON)
	.short EC_WORD_MOVE(MOVE_INGRAIN)
	.short EC_WORD_MOVE(MOVE_IRON_DEFENSE)
	.short EC_WORD_MOVE(MOVE_IRON_HEAD)
	.short EC_WORD_MOVE(MOVE_IRON_TAIL)
	.short EC_WORD_MOVE(MOVE_JUMP_KICK)
	.short EC_WORD_MOVE(MOVE_KARATE_CHOP)
	.short EC_WORD_MOVE(MOVE_KINESIS)
	.short EC_WORD_MOVE(MOVE_KNOCK_OFF)
	.short EC_WORD_MOVE(MOVE_LAST_RESORT)
	.short EC_WORD_MOVE(MOVE_LAVA_PLUME)
	.short EC_WORD_MOVE(MOVE_LEAF_BLADE)
	.short EC_WORD_MOVE(MOVE_LEAF_STORM)
	.short EC_WORD_MOVE(MOVE_LEECH_LIFE)
	.short EC_WORD_MOVE(MOVE_LEECH_SEED)
	.short EC_WORD_MOVE(MOVE_LEER)
	.short EC_WORD_MOVE(MOVE_LICK)
	.short EC_WORD_MOVE(MOVE_LIGHT_SCREEN)
	.short EC_WORD_MOVE(MOVE_LOCK_ON)
	.short EC_WORD_MOVE(MOVE_LOVELY_KISS)
	.short EC_WORD_MOVE(MOVE_LOW_KICK)
	.short EC_WORD_MOVE(MOVE_LUCKY_CHANT)
	.short EC_WORD_MOVE(MOVE_LUNAR_DANCE)
	.short EC_WORD_MOVE(MOVE_LUSTER_PURGE)
	.short 0xFFFF

sECMenu_Pokemon_AtoL:
	.short EC_WORD_POKEMON(SPECIES_ABOMASNOW)
	.short EC_WORD_POKEMON(SPECIES_ABRA)
	.short EC_WORD_POKEMON(SPECIES_ABSOL)
	.short EC_WORD_POKEMON(SPECIES_AERODACTYL)
	.short EC_WORD_POKEMON(SPECIES_AGGRON)
	.short EC_WORD_POKEMON(SPECIES_AIPOM)
	.short EC_WORD_POKEMON(SPECIES_ALAKAZAM)
	.short EC_WORD_POKEMON(SPECIES_ALTARIA)
	.short EC_WORD_POKEMON(SPECIES_AMBIPOM)
	.short EC_WORD_POKEMON(SPECIES_AMPHAROS)
	.short EC_WORD_POKEMON(SPECIES_ANORITH)
	.short EC_WORD_POKEMON(SPECIES_ARBOK)
	.short EC_WORD_POKEMON(SPECIES_ARCANINE)
	.short EC_WORD_POKEMON(SPECIES_ARCEUS)
	.short EC_WORD_POKEMON(SPECIES_ARIADOS)
	.short EC_WORD_POKEMON(SPECIES_ARMALDO)
	.short EC_WORD_POKEMON(SPECIES_ARON)
	.short EC_WORD_POKEMON(SPECIES_ARTICUNO)
	.short EC_WORD_POKEMON(SPECIES_AZELF)
	.short EC_WORD_POKEMON(SPECIES_AZUMARILL)
	.short EC_WORD_POKEMON(SPECIES_AZURILL)
	.short EC_WORD_POKEMON(SPECIES_BAGON)
	.short EC_WORD_POKEMON(SPECIES_BALTOY)
	.short EC_WORD_POKEMON(SPECIES_BANETTE)
	.short EC_WORD_POKEMON(SPECIES_BARBOACH)
	.short EC_WORD_POKEMON(SPECIES_BASTIODON)
	.short EC_WORD_POKEMON(SPECIES_BAYLEEF)
	.short EC_WORD_POKEMON(SPECIES_BEAUTIFLY)
	.short EC_WORD_POKEMON(SPECIES_BEEDRILL)
	.short EC_WORD_POKEMON(SPECIES_BELDUM)
	.short EC_WORD_POKEMON(SPECIES_BELLOSSOM)
	.short EC_WORD_POKEMON(SPECIES_BELLSPROUT)
	.short EC_WORD_POKEMON(SPECIES_BIBAREL)
	.short EC_WORD_POKEMON(SPECIES_BIDOOF)
	.short EC_WORD_POKEMON(SPECIES_BLASTOISE)
	.short EC_WORD_POKEMON(SPECIES_BLAZIKEN)
	.short EC_WORD_POKEMON(SPECIES_BLISSEY)
	.short EC_WORD_POKEMON(SPECIES_BONSLY)
	.short EC_WORD_POKEMON(SPECIES_BRELOOM)
	.short EC_WORD_POKEMON(SPECIES_BRONZONG)
	.short EC_WORD_POKEMON(SPECIES_BRONZOR)
	.short EC_WORD_POKEMON(SPECIES_BUDEW)
	.short EC_WORD_POKEMON(SPECIES_BUIZEL)
	.short EC_WORD_POKEMON(SPECIES_BULBASAUR)
	.short EC_WORD_POKEMON(SPECIES_BUNEARY)
	.short EC_WORD_POKEMON(SPECIES_BURMY)
	.short EC_WORD_POKEMON(SPECIES_BUTTERFREE)
	.short EC_WORD_POKEMON(SPECIES_CACNEA)
	.short EC_WORD_POKEMON(SPECIES_CACTURNE)
	.short EC_WORD_POKEMON(SPECIES_CAMERUPT)
	.short EC_WORD_POKEMON(SPECIES_CARNIVINE)
	.short EC_WORD_POKEMON(SPECIES_CARVANHA)
	.short EC_WORD_POKEMON(SPECIES_CASCOON)
	.short EC_WORD_POKEMON(SPECIES_CASTFORM)
	.short EC_WORD_POKEMON(SPECIES_CATERPIE)
	.short EC_WORD_POKEMON(SPECIES_CELEBI)
	.short EC_WORD_POKEMON(SPECIES_CHANSEY)
	.short EC_WORD_POKEMON(SPECIES_CHARIZARD)
	.short EC_WORD_POKEMON(SPECIES_CHARMANDER)
	.short EC_WORD_POKEMON(SPECIES_CHARMELEON)
	.short EC_WORD_POKEMON(SPECIES_CHATOT)
	.short EC_WORD_POKEMON(SPECIES_CHERRIM)
	.short EC_WORD_POKEMON(SPECIES_CHERUBI)
	.short EC_WORD_POKEMON(SPECIES_CHIKORITA)
	.short EC_WORD_POKEMON(SPECIES_CHIMCHAR)
	.short EC_WORD_POKEMON(SPECIES_CHIMECHO)
	.short EC_WORD_POKEMON(SPECIES_CHINCHOU)
	.short EC_WORD_POKEMON(SPECIES_CHINGLING)
	.short EC_WORD_POKEMON(SPECIES_CLAMPERL)
	.short EC_WORD_POKEMON(SPECIES_CLAYDOL)
	.short EC_WORD_POKEMON(SPECIES_CLEFABLE)
	.short EC_WORD_POKEMON(SPECIES_CLEFAIRY)
	.short EC_WORD_POKEMON(SPECIES_CLEFFA)
	.short EC_WORD_POKEMON(SPECIES_CLOYSTER)
	.short EC_WORD_POKEMON(SPECIES_COMBEE)
	.short EC_WORD_POKEMON(SPECIES_COMBUSKEN)
	.short EC_WORD_POKEMON(SPECIES_CORPHISH)
	.short EC_WORD_POKEMON(SPECIES_CORSOLA)
	.short EC_WORD_POKEMON(SPECIES_CRADILY)
	.short EC_WORD_POKEMON(SPECIES_CRANIDOS)
	.short EC_WORD_POKEMON(SPECIES_CRAWDAUNT)
	.short EC_WORD_POKEMON(SPECIES_CRESSELIA)
	.short EC_WORD_POKEMON(SPECIES_CROAGUNK)
	.short EC_WORD_POKEMON(SPECIES_CROBAT)
	.short EC_WORD_POKEMON(SPECIES_CROCONAW)
	.short EC_WORD_POKEMON(SPECIES_CUBONE)
	.short EC_WORD_POKEMON(SPECIES_CYNDAQUIL)
	.short EC_WORD_POKEMON(SPECIES_DARKRAI)
	.short EC_WORD_POKEMON(SPECIES_DELCATTY)
	.short EC_WORD_POKEMON(SPECIES_DELIBIRD)
	.short EC_WORD_POKEMON(SPECIES_DEOXYS)
	.short EC_WORD_POKEMON(SPECIES_DEWGONG)
	.short EC_WORD_POKEMON(SPECIES_DIALGA)
	.short EC_WORD_POKEMON(SPECIES_DIGLETT)
	.short EC_WORD_POKEMON(SPECIES_DITTO)
	.short EC_WORD_POKEMON(SPECIES_DODRIO)
	.short EC_WORD_POKEMON(SPECIES_DODUO)
	.short EC_WORD_POKEMON(SPECIES_DONPHAN)
	.short EC_WORD_POKEMON(SPECIES_DRAGONAIR)
	.short EC_WORD_POKEMON(SPECIES_DRAGONITE)
	.short EC_WORD_POKEMON(SPECIES_DRAPION)
	.short EC_WORD_POKEMON(SPECIES_DRATINI)
	.short EC_WORD_POKEMON(SPECIES_DRIFBLIM)
	.short EC_WORD_POKEMON(SPECIES_DRIFLOON)
	.short EC_WORD_POKEMON(SPECIES_DROWZEE)
	.short EC_WORD_POKEMON(SPECIES_DUGTRIO)
	.short EC_WORD_POKEMON(SPECIES_DUNSPARCE)
	.short EC_WORD_POKEMON(SPECIES_DUSCLOPS)
	.short EC_WORD_POKEMON(SPECIES_DUSKNOIR)
	.short EC_WORD_POKEMON(SPECIES_DUSKULL)
	.short EC_WORD_POKEMON(SPECIES_DUSTOX)
	.short EC_WORD_POKEMON(SPECIES_EEVEE)
	.short EC_WORD_POKEMON(SPECIES_EKANS)
	.short EC_WORD_POKEMON(SPECIES_ELECTABUZZ)
	.short EC_WORD_POKEMON(SPECIES_ELECTIVIRE)
	.short EC_WORD_POKEMON(SPECIES_ELECTRIKE)
	.short EC_WORD_POKEMON(SPECIES_ELECTRODE)
	.short EC_WORD_POKEMON(SPECIES_ELEKID)
	.short EC_WORD_POKEMON(SPECIES_EMPOLEON)
	.short EC_WORD_POKEMON(SPECIES_ENTEI)
	.short EC_WORD_POKEMON(SPECIES_ESPEON)
	.short EC_WORD_POKEMON(SPECIES_EXEGGCUTE)
	.short EC_WORD_POKEMON(SPECIES_EXEGGUTOR)
	.short EC_WORD_POKEMON(SPECIES_EXPLOUD)
	.short EC_WORD_POKEMON(SPECIES_FARFETCHD)
	.short EC_WORD_POKEMON(SPECIES_FEAROW)
	.short EC_WORD_POKEMON(SPECIES_FEEBAS)
	.short EC_WORD_POKEMON(SPECIES_FERALIGATR)
	.short EC_WORD_POKEMON(SPECIES_FINNEON)
	.short EC_WORD_POKEMON(SPECIES_FLAAFFY)
	.short EC_WORD_POKEMON(SPECIES_FLAREON)
	.short EC_WORD_POKEMON(SPECIES_FLOATZEL)
	.short EC_WORD_POKEMON(SPECIES_FLYGON)
	.short EC_WORD_POKEMON(SPECIES_FORRETRESS)
	.short EC_WORD_POKEMON(SPECIES_FROSLASS)
	.short EC_WORD_POKEMON(SPECIES_FURRET)
	.short EC_WORD_POKEMON(SPECIES_GABITE)
	.short EC_WORD_POKEMON(SPECIES_GALLADE)
	.short EC_WORD_POKEMON(SPECIES_GARCHOMP)
	.short EC_WORD_POKEMON(SPECIES_GARDEVOIR)
	.short EC_WORD_POKEMON(SPECIES_GASTLY)
	.short EC_WORD_POKEMON(SPECIES_GASTRODON)
	.short EC_WORD_POKEMON(SPECIES_GENGAR)
	.short EC_WORD_POKEMON(SPECIES_GEODUDE)
	.short EC_WORD_POKEMON(SPECIES_GIBLE)
	.short EC_WORD_POKEMON(SPECIES_GIRAFARIG)
	.short EC_WORD_POKEMON(SPECIES_GIRATINA)
	.short EC_WORD_POKEMON(SPECIES_GLACEON)
	.short EC_WORD_POKEMON(SPECIES_GLALIE)
	.short EC_WORD_POKEMON(SPECIES_GLAMEOW)
	.short EC_WORD_POKEMON(SPECIES_GLIGAR)
	.short EC_WORD_POKEMON(SPECIES_GLISCOR)
	.short EC_WORD_POKEMON(SPECIES_GLOOM)
	.short EC_WORD_POKEMON(SPECIES_GOLBAT)
	.short EC_WORD_POKEMON(SPECIES_GOLDEEN)
	.short EC_WORD_POKEMON(SPECIES_GOLDUCK)
	.short EC_WORD_POKEMON(SPECIES_GOLEM)
	.short EC_WORD_POKEMON(SPECIES_GOREBYSS)
	.short EC_WORD_POKEMON(SPECIES_GRANBULL)
	.short EC_WORD_POKEMON(SPECIES_GRAVELER)
	.short EC_WORD_POKEMON(SPECIES_GRIMER)
	.short EC_WORD_POKEMON(SPECIES_GROTLE)
	.short EC_WORD_POKEMON(SPECIES_GROUDON)
	.short EC_WORD_POKEMON(SPECIES_GROVYLE)
	.short EC_WORD_POKEMON(SPECIES_GROWLITHE)
	.short EC_WORD_POKEMON(SPECIES_GRUMPIG)
	.short EC_WORD_POKEMON(SPECIES_GULPIN)
	.short EC_WORD_POKEMON(SPECIES_GYARADOS)
	.short EC_WORD_POKEMON(SPECIES_HAPPINY)
	.short EC_WORD_POKEMON(SPECIES_HARIYAMA)
	.short EC_WORD_POKEMON(SPECIES_HAUNTER)
	.short EC_WORD_POKEMON(SPECIES_HEATRAN)
	.short EC_WORD_POKEMON(SPECIES_HERACROSS)
	.short EC_WORD_POKEMON(SPECIES_HIPPOPOTAS)
	.short EC_WORD_POKEMON(SPECIES_HIPPOWDON)
	.short EC_WORD_POKEMON(SPECIES_HITMONCHAN)
	.short EC_WORD_POKEMON(SPECIES_HITMONLEE)
	.short EC_WORD_POKEMON(SPECIES_HITMONTOP)
	.short EC_WORD_POKEMON(SPECIES_HO_OH)
	.short EC_WORD_POKEMON(SPECIES_HONCHKROW)
	.short EC_WORD_POKEMON(SPECIES_HOOTHOOT)
	.short EC_WORD_POKEMON(SPECIES_HOPPIP)
	.short EC_WORD_POKEMON(SPECIES_HORSEA)
	.short EC_WORD_POKEMON(SPECIES_HOUNDOOM)
	.short EC_WORD_POKEMON(SPECIES_HOUNDOUR)
	.short EC_WORD_POKEMON(SPECIES_HUNTAIL)
	.short EC_WORD_POKEMON(SPECIES_HYPNO)
	.short EC_WORD_POKEMON(SPECIES_IGGLYBUFF)
	.short EC_WORD_POKEMON(SPECIES_ILLUMISE)
	.short EC_WORD_POKEMON(SPECIES_INFERNAPE)
	.short EC_WORD_POKEMON(SPECIES_IVYSAUR)
	.short EC_WORD_POKEMON(SPECIES_JIGGLYPUFF)
	.short EC_WORD_POKEMON(SPECIES_JIRACHI)
	.short EC_WORD_POKEMON(SPECIES_JOLTEON)
	.short EC_WORD_POKEMON(SPECIES_JUMPLUFF)
	.short EC_WORD_POKEMON(SPECIES_JYNX)
	.short EC_WORD_POKEMON(SPECIES_KABUTO)
	.short EC_WORD_POKEMON(SPECIES_KABUTOPS)
	.short EC_WORD_POKEMON(SPECIES_KADABRA)
	.short EC_WORD_POKEMON(SPECIES_KAKUNA)
	.short EC_WORD_POKEMON(SPECIES_KANGASKHAN)
	.short EC_WORD_POKEMON(SPECIES_KECLEON)
	.short EC_WORD_POKEMON(SPECIES_KINGDRA)
	.short EC_WORD_POKEMON(SPECIES_KINGLER)
	.short EC_WORD_POKEMON(SPECIES_KIRLIA)
	.short EC_WORD_POKEMON(SPECIES_KOFFING)
	.short EC_WORD_POKEMON(SPECIES_KRABBY)
	.short EC_WORD_POKEMON(SPECIES_KRICKETOT)
	.short EC_WORD_POKEMON(SPECIES_KRICKETUNE)
	.short EC_WORD_POKEMON(SPECIES_KYOGRE)
	.short EC_WORD_POKEMON(SPECIES_LAIRON)
	.short EC_WORD_POKEMON(SPECIES_LANTURN)
	.short EC_WORD_POKEMON(SPECIES_LAPRAS)
	.short EC_WORD_POKEMON(SPECIES_LARVITAR)
	.short EC_WORD_POKEMON(SPECIES_LATIAS)
	.short EC_WORD_POKEMON(SPECIES_LATIOS)
	.short EC_WORD_POKEMON(SPECIES_LEAFEON)
	.short EC_WORD_POKEMON(SPECIES_LEDIAN)
	.short EC_WORD_POKEMON(SPECIES_LEDYBA)
	.short EC_WORD_POKEMON(SPECIES_LICKILICKY)
	.short EC_WORD_POKEMON(SPECIES_LICKITUNG)
	.short EC_WORD_POKEMON(SPECIES_LILEEP)
	.short EC_WORD_POKEMON(SPECIES_LINOONE)
	.short EC_WORD_POKEMON(SPECIES_LOMBRE)
	.short EC_WORD_POKEMON(SPECIES_LOPUNNY)
	.short EC_WORD_POKEMON(SPECIES_LOTAD)
	.short EC_WORD_POKEMON(SPECIES_LOUDRED)
	.short EC_WORD_POKEMON(SPECIES_LUCARIO)
	.short EC_WORD_POKEMON(SPECIES_LUDICOLO)
	.short EC_WORD_POKEMON(SPECIES_LUGIA)
	.short EC_WORD_POKEMON(SPECIES_LUMINEON)
	.short EC_WORD_POKEMON(SPECIES_LUNATONE)
	.short EC_WORD_POKEMON(SPECIES_LUVDISC)
	.short EC_WORD_POKEMON(SPECIES_LUXIO)
	.short EC_WORD_POKEMON(SPECIES_LUXRAY)
	.short 0xFFFF

sECMenu_Move_MtoZ:
	.short EC_WORD_MOVE(MOVE_MACH_PUNCH)
	.short EC_WORD_MOVE(MOVE_MAGIC_COAT)
	.short EC_WORD_MOVE(MOVE_MAGICAL_LEAF)
	.short EC_WORD_MOVE(MOVE_MAGMA_STORM)
	.short EC_WORD_MOVE(MOVE_MAGNET_BOMB)
	.short EC_WORD_MOVE(MOVE_MAGNET_RISE)
	.short EC_WORD_MOVE(MOVE_MAGNITUDE)
	.short EC_WORD_MOVE(MOVE_ME_FIRST)
	.short EC_WORD_MOVE(MOVE_MEAN_LOOK)
	.short EC_WORD_MOVE(MOVE_MEDITATE)
	.short EC_WORD_MOVE(MOVE_MEGA_DRAIN)
	.short EC_WORD_MOVE(MOVE_MEGA_KICK)
	.short EC_WORD_MOVE(MOVE_MEGA_PUNCH)
	.short EC_WORD_MOVE(MOVE_MEGAHORN)
	.short EC_WORD_MOVE(MOVE_MEMENTO)
	.short EC_WORD_MOVE(MOVE_METAL_BURST)
	.short EC_WORD_MOVE(MOVE_METAL_CLAW)
	.short EC_WORD_MOVE(MOVE_METAL_SOUND)
	.short EC_WORD_MOVE(MOVE_METEOR_MASH)
	.short EC_WORD_MOVE(MOVE_METRONOME)
	.short EC_WORD_MOVE(MOVE_MILK_DRINK)
	.short EC_WORD_MOVE(MOVE_MIMIC)
	.short EC_WORD_MOVE(MOVE_MIND_READER)
	.short EC_WORD_MOVE(MOVE_MINIMIZE)
	.short EC_WORD_MOVE(MOVE_MIRACLE_EYE)
	.short EC_WORD_MOVE(MOVE_MIRROR_COAT)
	.short EC_WORD_MOVE(MOVE_MIRROR_MOVE)
	.short EC_WORD_MOVE(MOVE_MIRROR_SHOT)
	.short EC_WORD_MOVE(MOVE_MIST)
	.short EC_WORD_MOVE(MOVE_MIST_BALL)
	.short EC_WORD_MOVE(MOVE_MOONLIGHT)
	.short EC_WORD_MOVE(MOVE_MORNING_SUN)
	.short EC_WORD_MOVE(MOVE_MUD_BOMB)
	.short EC_WORD_MOVE(MOVE_MUD_SHOT)
	.short EC_WORD_MOVE(MOVE_MUD_SPORT)
	.short EC_WORD_MOVE(MOVE_MUD_SLAP)
	.short EC_WORD_MOVE(MOVE_MUDDY_WATER)
	.short EC_WORD_MOVE(MOVE_NASTY_PLOT)
	.short EC_WORD_MOVE(MOVE_NATURAL_GIFT)
	.short EC_WORD_MOVE(MOVE_NATURE_POWER)
	.short EC_WORD_MOVE(MOVE_NEEDLE_ARM)
	.short EC_WORD_MOVE(MOVE_NIGHT_SHADE)
	.short EC_WORD_MOVE(MOVE_NIGHT_SLASH)
	.short EC_WORD_MOVE(MOVE_NIGHTMARE)
	.short EC_WORD_MOVE(MOVE_OCTAZOOKA)
	.short EC_WORD_MOVE(MOVE_ODOR_SLEUTH)
	.short EC_WORD_MOVE(MOVE_OMINOUS_WIND)
	.short EC_WORD_MOVE(MOVE_OUTRAGE)
	.short EC_WORD_MOVE(MOVE_OVERHEAT)
	.short EC_WORD_MOVE(MOVE_PAIN_SPLIT)
	.short EC_WORD_MOVE(MOVE_PAY_DAY)
	.short EC_WORD_MOVE(MOVE_PAYBACK)
	.short EC_WORD_MOVE(MOVE_PECK)
	.short EC_WORD_MOVE(MOVE_PERISH_SONG)
	.short EC_WORD_MOVE(MOVE_PETAL_DANCE)
	.short EC_WORD_MOVE(MOVE_PIN_MISSILE)
	.short EC_WORD_MOVE(MOVE_PLUCK)
	.short EC_WORD_MOVE(MOVE_POISON_FANG)
	.short EC_WORD_MOVE(MOVE_POISON_GAS)
	.short EC_WORD_MOVE(MOVE_POISON_JAB)
	.short EC_WORD_MOVE(MOVE_POISON_STING)
	.short EC_WORD_MOVE(MOVE_POISON_TAIL)
	.short EC_WORD_MOVE(MOVE_POISON_POWDER)
	.short EC_WORD_MOVE(MOVE_POUND)
	.short EC_WORD_MOVE(MOVE_POWDER_SNOW)
	.short EC_WORD_MOVE(MOVE_POWER_GEM)
	.short EC_WORD_MOVE(MOVE_POWER_SWAP)
	.short EC_WORD_MOVE(MOVE_POWER_TRICK)
	.short EC_WORD_MOVE(MOVE_POWER_WHIP)
	.short EC_WORD_MOVE(MOVE_PRESENT)
	.short EC_WORD_MOVE(MOVE_PROTECT)
	.short EC_WORD_MOVE(MOVE_PSYBEAM)
	.short EC_WORD_MOVE(MOVE_PSYCH_UP)
	.short EC_WORD_MOVE(MOVE_PSYCHIC)
	.short EC_WORD_MOVE(MOVE_PSYCHO_BOOST)
	.short EC_WORD_MOVE(MOVE_PSYCHO_CUT)
	.short EC_WORD_MOVE(MOVE_PSYCHO_SHIFT)
	.short EC_WORD_MOVE(MOVE_PSYWAVE)
	.short EC_WORD_MOVE(MOVE_PUNISHMENT)
	.short EC_WORD_MOVE(MOVE_PURSUIT)
	.short EC_WORD_MOVE(MOVE_QUICK_ATTACK)
	.short EC_WORD_MOVE(MOVE_RAGE)
	.short EC_WORD_MOVE(MOVE_RAIN_DANCE)
	.short EC_WORD_MOVE(MOVE_RAPID_SPIN)
	.short EC_WORD_MOVE(MOVE_RAZOR_LEAF)
	.short EC_WORD_MOVE(MOVE_RAZOR_WIND)
	.short EC_WORD_MOVE(MOVE_RECOVER)
	.short EC_WORD_MOVE(MOVE_RECYCLE)
	.short EC_WORD_MOVE(MOVE_REFLECT)
	.short EC_WORD_MOVE(MOVE_REFRESH)
	.short EC_WORD_MOVE(MOVE_REST)
	.short EC_WORD_MOVE(MOVE_RETURN)
	.short EC_WORD_MOVE(MOVE_REVENGE)
	.short EC_WORD_MOVE(MOVE_REVERSAL)
	.short EC_WORD_MOVE(MOVE_ROAR)
	.short EC_WORD_MOVE(MOVE_ROAR_OF_TIME)
	.short EC_WORD_MOVE(MOVE_ROCK_BLAST)
	.short EC_WORD_MOVE(MOVE_ROCK_CLIMB)
	.short EC_WORD_MOVE(MOVE_ROCK_POLISH)
	.short EC_WORD_MOVE(MOVE_ROCK_SLIDE)
	.short EC_WORD_MOVE(MOVE_ROCK_SMASH)
	.short EC_WORD_MOVE(MOVE_ROCK_THROW)
	.short EC_WORD_MOVE(MOVE_ROCK_TOMB)
	.short EC_WORD_MOVE(MOVE_ROCK_WRECKER)
	.short EC_WORD_MOVE(MOVE_ROLE_PLAY)
	.short EC_WORD_MOVE(MOVE_ROLLING_KICK)
	.short EC_WORD_MOVE(MOVE_ROLLOUT)
	.short EC_WORD_MOVE(MOVE_ROOST)
	.short EC_WORD_MOVE(MOVE_SACRED_FIRE)
	.short EC_WORD_MOVE(MOVE_SAFEGUARD)
	.short EC_WORD_MOVE(MOVE_SAND_TOMB)
	.short EC_WORD_MOVE(MOVE_SAND_ATTACK)
	.short EC_WORD_MOVE(MOVE_SANDSTORM)
	.short EC_WORD_MOVE(MOVE_SCARY_FACE)
	.short EC_WORD_MOVE(MOVE_SCRATCH)
	.short EC_WORD_MOVE(MOVE_SCREECH)
	.short EC_WORD_MOVE(MOVE_SECRET_POWER)
	.short EC_WORD_MOVE(MOVE_SEED_BOMB)
	.short EC_WORD_MOVE(MOVE_SEISMIC_TOSS)
	.short EC_WORD_MOVE(MOVE_SELF_DESTRUCT)
	.short EC_WORD_MOVE(MOVE_SHADOW_BALL)
	.short EC_WORD_MOVE(MOVE_SHADOW_CLAW)
	.short EC_WORD_MOVE(MOVE_SHADOW_FORCE)
	.short EC_WORD_MOVE(MOVE_SHADOW_PUNCH)
	.short EC_WORD_MOVE(MOVE_SHADOW_SNEAK)
	.short EC_WORD_MOVE(MOVE_SHARPEN)
	.short EC_WORD_MOVE(MOVE_SHEER_COLD)
	.short EC_WORD_MOVE(MOVE_SHOCK_WAVE)
	.short EC_WORD_MOVE(MOVE_SIGNAL_BEAM)
	.short EC_WORD_MOVE(MOVE_SILVER_WIND)
	.short EC_WORD_MOVE(MOVE_SING)
	.short EC_WORD_MOVE(MOVE_SKETCH)
	.short EC_WORD_MOVE(MOVE_SKILL_SWAP)
	.short EC_WORD_MOVE(MOVE_SKULL_BASH)
	.short EC_WORD_MOVE(MOVE_SKY_ATTACK)
	.short EC_WORD_MOVE(MOVE_SKY_UPPERCUT)
	.short EC_WORD_MOVE(MOVE_SLACK_OFF)
	.short EC_WORD_MOVE(MOVE_SLAM)
	.short EC_WORD_MOVE(MOVE_SLASH)
	.short EC_WORD_MOVE(MOVE_SLEEP_POWDER)
	.short EC_WORD_MOVE(MOVE_SLEEP_TALK)
	.short EC_WORD_MOVE(MOVE_SLUDGE)
	.short EC_WORD_MOVE(MOVE_SLUDGE_BOMB)
	.short EC_WORD_MOVE(MOVE_SMELLING_SALTS)
	.short EC_WORD_MOVE(MOVE_SMOG)
	.short EC_WORD_MOVE(MOVE_SMOKESCREEN)
	.short EC_WORD_MOVE(MOVE_SNATCH)
	.short EC_WORD_MOVE(MOVE_SNORE)
	.short EC_WORD_MOVE(MOVE_SOFT_BOILED)
	.short EC_WORD_MOVE(MOVE_SOLAR_BEAM)
	.short EC_WORD_MOVE(MOVE_SONIC_BOOM)
	.short EC_WORD_MOVE(MOVE_SPACIAL_REND)
	.short EC_WORD_MOVE(MOVE_SPARK)
	.short EC_WORD_MOVE(MOVE_SPIDER_WEB)
	.short EC_WORD_MOVE(MOVE_SPIKE_CANNON)
	.short EC_WORD_MOVE(MOVE_SPIKES)
	.short EC_WORD_MOVE(MOVE_SPIT_UP)
	.short EC_WORD_MOVE(MOVE_SPITE)
	.short EC_WORD_MOVE(MOVE_SPLASH)
	.short EC_WORD_MOVE(MOVE_SPORE)
	.short EC_WORD_MOVE(MOVE_STEALTH_ROCK)
	.short EC_WORD_MOVE(MOVE_STEEL_WING)
	.short EC_WORD_MOVE(MOVE_STOCKPILE)
	.short EC_WORD_MOVE(MOVE_STOMP)
	.short EC_WORD_MOVE(MOVE_STONE_EDGE)
	.short EC_WORD_MOVE(MOVE_STRENGTH)
	.short EC_WORD_MOVE(MOVE_STRING_SHOT)
	.short EC_WORD_MOVE(MOVE_STRUGGLE)
	.short EC_WORD_MOVE(MOVE_STUN_SPORE)
	.short EC_WORD_MOVE(MOVE_SUBMISSION)
	.short EC_WORD_MOVE(MOVE_SUBSTITUTE)
	.short EC_WORD_MOVE(MOVE_SUCKER_PUNCH)
	.short EC_WORD_MOVE(MOVE_SUNNY_DAY)
	.short EC_WORD_MOVE(MOVE_SUPER_FANG)
	.short EC_WORD_MOVE(MOVE_SUPERPOWER)
	.short EC_WORD_MOVE(MOVE_SUPERSONIC)
	.short EC_WORD_MOVE(MOVE_SURF)
	.short EC_WORD_MOVE(MOVE_SWAGGER)
	.short EC_WORD_MOVE(MOVE_SWALLOW)
	.short EC_WORD_MOVE(MOVE_SWEET_KISS)
	.short EC_WORD_MOVE(MOVE_SWEET_SCENT)
	.short EC_WORD_MOVE(MOVE_SWIFT)
	.short EC_WORD_MOVE(MOVE_SWITCHEROO)
	.short EC_WORD_MOVE(MOVE_SWORDS_DANCE)
	.short EC_WORD_MOVE(MOVE_SYNTHESIS)
	.short EC_WORD_MOVE(MOVE_TACKLE)
	.short EC_WORD_MOVE(MOVE_TAIL_GLOW)
	.short EC_WORD_MOVE(MOVE_TAIL_WHIP)
	.short EC_WORD_MOVE(MOVE_TAILWIND)
	.short EC_WORD_MOVE(MOVE_TAKE_DOWN)
	.short EC_WORD_MOVE(MOVE_TAUNT)
	.short EC_WORD_MOVE(MOVE_TEETER_DANCE)
	.short EC_WORD_MOVE(MOVE_TELEPORT)
	.short EC_WORD_MOVE(MOVE_THIEF)
	.short EC_WORD_MOVE(MOVE_THRASH)
	.short EC_WORD_MOVE(MOVE_THUNDER)
	.short EC_WORD_MOVE(MOVE_THUNDER_FANG)
	.short EC_WORD_MOVE(MOVE_THUNDER_WAVE)
	.short EC_WORD_MOVE(MOVE_THUNDERBOLT)
	.short EC_WORD_MOVE(MOVE_THUNDER_PUNCH)
	.short EC_WORD_MOVE(MOVE_THUNDER_SHOCK)
	.short EC_WORD_MOVE(MOVE_TICKLE)
	.short EC_WORD_MOVE(MOVE_TORMENT)
	.short EC_WORD_MOVE(MOVE_TOXIC)
	.short EC_WORD_MOVE(MOVE_TOXIC_SPIKES)
	.short EC_WORD_MOVE(MOVE_TRANSFORM)
	.short EC_WORD_MOVE(MOVE_TRI_ATTACK)
	.short EC_WORD_MOVE(MOVE_TRICK)
	.short EC_WORD_MOVE(MOVE_TRICK_ROOM)
	.short EC_WORD_MOVE(MOVE_TRIPLE_KICK)
	.short EC_WORD_MOVE(MOVE_TRUMP_CARD)
	.short EC_WORD_MOVE(MOVE_TWINEEDLE)
	.short EC_WORD_MOVE(MOVE_TWISTER)
	.short EC_WORD_MOVE(MOVE_U_TURN)
	.short EC_WORD_MOVE(MOVE_UPROAR)
	.short EC_WORD_MOVE(MOVE_VACUUM_WAVE)
	.short EC_WORD_MOVE(MOVE_VISE_GRIP)
	.short EC_WORD_MOVE(MOVE_VINE_WHIP)
	.short EC_WORD_MOVE(MOVE_VITAL_THROW)
	.short EC_WORD_MOVE(MOVE_VOLT_TACKLE)
	.short EC_WORD_MOVE(MOVE_WAKE_UP_SLAP)
	.short EC_WORD_MOVE(MOVE_WATER_GUN)
	.short EC_WORD_MOVE(MOVE_WATER_PULSE)
	.short EC_WORD_MOVE(MOVE_WATER_SPORT)
	.short EC_WORD_MOVE(MOVE_WATER_SPOUT)
	.short EC_WORD_MOVE(MOVE_WATERFALL)
	.short EC_WORD_MOVE(MOVE_WEATHER_BALL)
	.short EC_WORD_MOVE(MOVE_WHIRLPOOL)
	.short EC_WORD_MOVE(MOVE_WHIRLWIND)
	.short EC_WORD_MOVE(MOVE_WILL_O_WISP)
	.short EC_WORD_MOVE(MOVE_WING_ATTACK)
	.short EC_WORD_MOVE(MOVE_WISH)
	.short EC_WORD_MOVE(MOVE_WITHDRAW)
	.short EC_WORD_MOVE(MOVE_WOOD_HAMMER)
	.short EC_WORD_MOVE(MOVE_WORRY_SEED)
	.short EC_WORD_MOVE(MOVE_WRAP)
	.short EC_WORD_MOVE(MOVE_WRING_OUT)
	.short EC_WORD_MOVE(MOVE_X_SCISSOR)
	.short EC_WORD_MOVE(MOVE_YAWN)
	.short EC_WORD_MOVE(MOVE_ZAP_CANNON)
	.short EC_WORD_MOVE(MOVE_ZEN_HEADBUTT)
	.short 0xFFFF

sECMenu_Pokemon_MtoZ:
	.short EC_WORD_POKEMON(SPECIES_MACHAMP)
	.short EC_WORD_POKEMON(SPECIES_MACHOKE)
	.short EC_WORD_POKEMON(SPECIES_MACHOP)
	.short EC_WORD_POKEMON(SPECIES_MAGBY)
	.short EC_WORD_POKEMON(SPECIES_MAGCARGO)
	.short EC_WORD_POKEMON(SPECIES_MAGIKARP)
	.short EC_WORD_POKEMON(SPECIES_MAGMAR)
	.short EC_WORD_POKEMON(SPECIES_MAGMORTAR)
	.short EC_WORD_POKEMON(SPECIES_MAGNEMITE)
	.short EC_WORD_POKEMON(SPECIES_MAGNETON)
	.short EC_WORD_POKEMON(SPECIES_MAGNEZONE)
	.short EC_WORD_POKEMON(SPECIES_MAKUHITA)
	.short EC_WORD_POKEMON(SPECIES_MAMOSWINE)
	.short EC_WORD_POKEMON(SPECIES_MANAPHY)
	.short EC_WORD_POKEMON(SPECIES_MANECTRIC)
	.short EC_WORD_POKEMON(SPECIES_MANKEY)
	.short EC_WORD_POKEMON(SPECIES_MANTINE)
	.short EC_WORD_POKEMON(SPECIES_MANTYKE)
	.short EC_WORD_POKEMON(SPECIES_MAREEP)
	.short EC_WORD_POKEMON(SPECIES_MARILL)
	.short EC_WORD_POKEMON(SPECIES_MAROWAK)
	.short EC_WORD_POKEMON(SPECIES_MARSHTOMP)
	.short EC_WORD_POKEMON(SPECIES_MASQUERAIN)
	.short EC_WORD_POKEMON(SPECIES_MAWILE)
	.short EC_WORD_POKEMON(SPECIES_MEDICHAM)
	.short EC_WORD_POKEMON(SPECIES_MEDITITE)
	.short EC_WORD_POKEMON(SPECIES_MEGANIUM)
	.short EC_WORD_POKEMON(SPECIES_MEOWTH)
	.short EC_WORD_POKEMON(SPECIES_MESPRIT)
	.short EC_WORD_POKEMON(SPECIES_METAGROSS)
	.short EC_WORD_POKEMON(SPECIES_METANG)
	.short EC_WORD_POKEMON(SPECIES_METAPOD)
	.short EC_WORD_POKEMON(SPECIES_MEW)
	.short EC_WORD_POKEMON(SPECIES_MEWTWO)
	.short EC_WORD_POKEMON(SPECIES_MIGHTYENA)
	.short EC_WORD_POKEMON(SPECIES_MILOTIC)
	.short EC_WORD_POKEMON(SPECIES_MILTANK)
	.short EC_WORD_POKEMON(SPECIES_MIME_JR)
	.short EC_WORD_POKEMON(SPECIES_MINUN)
	.short EC_WORD_POKEMON(SPECIES_MISDREAVUS)
	.short EC_WORD_POKEMON(SPECIES_MISMAGIUS)
	.short EC_WORD_POKEMON(SPECIES_MOLTRES)
	.short EC_WORD_POKEMON(SPECIES_MONFERNO)
	.short EC_WORD_POKEMON(SPECIES_MOTHIM)
	.short EC_WORD_POKEMON(SPECIES_MR_MIME)
	.short EC_WORD_POKEMON(SPECIES_MUDKIP)
	.short EC_WORD_POKEMON(SPECIES_MUK)
	.short EC_WORD_POKEMON(SPECIES_MUNCHLAX)
	.short EC_WORD_POKEMON(SPECIES_MURKROW)
	.short EC_WORD_POKEMON(SPECIES_NATU)
	.short EC_WORD_POKEMON(SPECIES_NIDOKING)
	.short EC_WORD_POKEMON(SPECIES_NIDOQUEEN)
	.short EC_WORD_POKEMON(SPECIES_NIDORAN_F)
	.short EC_WORD_POKEMON(SPECIES_NIDORAN_M)
	.short EC_WORD_POKEMON(SPECIES_NIDORINA)
	.short EC_WORD_POKEMON(SPECIES_NIDORINO)
	.short EC_WORD_POKEMON(SPECIES_NINCADA)
	.short EC_WORD_POKEMON(SPECIES_NINETALES)
	.short EC_WORD_POKEMON(SPECIES_NINJASK)
	.short EC_WORD_POKEMON(SPECIES_NOCTOWL)
	.short EC_WORD_POKEMON(SPECIES_NOSEPASS)
	.short EC_WORD_POKEMON(SPECIES_NUMEL)
	.short EC_WORD_POKEMON(SPECIES_NUZLEAF)
	.short EC_WORD_POKEMON(SPECIES_OCTILLERY)
	.short EC_WORD_POKEMON(SPECIES_ODDISH)
	.short EC_WORD_POKEMON(SPECIES_OMANYTE)
	.short EC_WORD_POKEMON(SPECIES_OMASTAR)
	.short EC_WORD_POKEMON(SPECIES_ONIX)
	.short EC_WORD_POKEMON(SPECIES_PACHIRISU)
	.short EC_WORD_POKEMON(SPECIES_PALKIA)
	.short EC_WORD_POKEMON(SPECIES_PARAS)
	.short EC_WORD_POKEMON(SPECIES_PARASECT)
	.short EC_WORD_POKEMON(SPECIES_PELIPPER)
	.short EC_WORD_POKEMON(SPECIES_PERSIAN)
	.short EC_WORD_POKEMON(SPECIES_PHANPY)
	.short EC_WORD_POKEMON(SPECIES_PHIONE)
	.short EC_WORD_POKEMON(SPECIES_PICHU)
	.short EC_WORD_POKEMON(SPECIES_PIDGEOT)
	.short EC_WORD_POKEMON(SPECIES_PIDGEOTTO)
	.short EC_WORD_POKEMON(SPECIES_PIDGEY)
	.short EC_WORD_POKEMON(SPECIES_PIKACHU)
	.short EC_WORD_POKEMON(SPECIES_PILOSWINE)
	.short EC_WORD_POKEMON(SPECIES_PINECO)
	.short EC_WORD_POKEMON(SPECIES_PINSIR)
	.short EC_WORD_POKEMON(SPECIES_PIPLUP)
	.short EC_WORD_POKEMON(SPECIES_PLUSLE)
	.short EC_WORD_POKEMON(SPECIES_POLITOED)
	.short EC_WORD_POKEMON(SPECIES_POLIWAG)
	.short EC_WORD_POKEMON(SPECIES_POLIWHIRL)
	.short EC_WORD_POKEMON(SPECIES_POLIWRATH)
	.short EC_WORD_POKEMON(SPECIES_PONYTA)
	.short EC_WORD_POKEMON(SPECIES_POOCHYENA)
	.short EC_WORD_POKEMON(SPECIES_PORYGON)
	.short EC_WORD_POKEMON(SPECIES_PORYGON_Z)
	.short EC_WORD_POKEMON(SPECIES_PORYGON2)
	.short EC_WORD_POKEMON(SPECIES_PRIMEAPE)
	.short EC_WORD_POKEMON(SPECIES_PRINPLUP)
	.short EC_WORD_POKEMON(SPECIES_PROBOPASS)
	.short EC_WORD_POKEMON(SPECIES_PSYDUCK)
	.short EC_WORD_POKEMON(SPECIES_PUPITAR)
	.short EC_WORD_POKEMON(SPECIES_PURUGLY)
	.short EC_WORD_POKEMON(SPECIES_QUAGSIRE)
	.short EC_WORD_POKEMON(SPECIES_QUILAVA)
	.short EC_WORD_POKEMON(SPECIES_QWILFISH)
	.short EC_WORD_POKEMON(SPECIES_RAICHU)
	.short EC_WORD_POKEMON(SPECIES_RAIKOU)
	.short EC_WORD_POKEMON(SPECIES_RALTS)
	.short EC_WORD_POKEMON(SPECIES_RAMPARDOS)
	.short EC_WORD_POKEMON(SPECIES_RAPIDASH)
	.short EC_WORD_POKEMON(SPECIES_RATICATE)
	.short EC_WORD_POKEMON(SPECIES_RATTATA)
	.short EC_WORD_POKEMON(SPECIES_RAYQUAZA)
	.short EC_WORD_POKEMON(SPECIES_REGICE)
	.short EC_WORD_POKEMON(SPECIES_REGIGIGAS)
	.short EC_WORD_POKEMON(SPECIES_REGIROCK)
	.short EC_WORD_POKEMON(SPECIES_REGISTEEL)
	.short EC_WORD_POKEMON(SPECIES_RELICANTH)
	.short EC_WORD_POKEMON(SPECIES_REMORAID)
	.short EC_WORD_POKEMON(SPECIES_RHYDON)
	.short EC_WORD_POKEMON(SPECIES_RHYHORN)
	.short EC_WORD_POKEMON(SPECIES_RHYPERIOR)
	.short EC_WORD_POKEMON(SPECIES_RIOLU)
	.short EC_WORD_POKEMON(SPECIES_ROSELIA)
	.short EC_WORD_POKEMON(SPECIES_ROSERADE)
	.short EC_WORD_POKEMON(SPECIES_ROTOM)
	.short EC_WORD_POKEMON(SPECIES_SABLEYE)
	.short EC_WORD_POKEMON(SPECIES_SALAMENCE)
	.short EC_WORD_POKEMON(SPECIES_SANDSHREW)
	.short EC_WORD_POKEMON(SPECIES_SANDSLASH)
	.short EC_WORD_POKEMON(SPECIES_SCEPTILE)
	.short EC_WORD_POKEMON(SPECIES_SCIZOR)
	.short EC_WORD_POKEMON(SPECIES_SCYTHER)
	.short EC_WORD_POKEMON(SPECIES_SEADRA)
	.short EC_WORD_POKEMON(SPECIES_SEAKING)
	.short EC_WORD_POKEMON(SPECIES_SEALEO)
	.short EC_WORD_POKEMON(SPECIES_SEEDOT)
	.short EC_WORD_POKEMON(SPECIES_SEEL)
	.short EC_WORD_POKEMON(SPECIES_SENTRET)
	.short EC_WORD_POKEMON(SPECIES_SEVIPER)
	.short EC_WORD_POKEMON(SPECIES_SHARPEDO)
	.short EC_WORD_POKEMON(SPECIES_SHAYMIN)
	.short EC_WORD_POKEMON(SPECIES_SHEDINJA)
	.short EC_WORD_POKEMON(SPECIES_SHELGON)
	.short EC_WORD_POKEMON(SPECIES_SHELLDER)
	.short EC_WORD_POKEMON(SPECIES_SHELLOS)
	.short EC_WORD_POKEMON(SPECIES_SHIELDON)
	.short EC_WORD_POKEMON(SPECIES_SHIFTRY)
	.short EC_WORD_POKEMON(SPECIES_SHINX)
	.short EC_WORD_POKEMON(SPECIES_SHROOMISH)
	.short EC_WORD_POKEMON(SPECIES_SHUCKLE)
	.short EC_WORD_POKEMON(SPECIES_SHUPPET)
	.short EC_WORD_POKEMON(SPECIES_SILCOON)
	.short EC_WORD_POKEMON(SPECIES_SKARMORY)
	.short EC_WORD_POKEMON(SPECIES_SKIPLOOM)
	.short EC_WORD_POKEMON(SPECIES_SKITTY)
	.short EC_WORD_POKEMON(SPECIES_SKORUPI)
	.short EC_WORD_POKEMON(SPECIES_SKUNTANK)
	.short EC_WORD_POKEMON(SPECIES_SLAKING)
	.short EC_WORD_POKEMON(SPECIES_SLAKOTH)
	.short EC_WORD_POKEMON(SPECIES_SLOWBRO)
	.short EC_WORD_POKEMON(SPECIES_SLOWKING)
	.short EC_WORD_POKEMON(SPECIES_SLOWPOKE)
	.short EC_WORD_POKEMON(SPECIES_SLUGMA)
	.short EC_WORD_POKEMON(SPECIES_SMEARGLE)
	.short EC_WORD_POKEMON(SPECIES_SMOOCHUM)
	.short EC_WORD_POKEMON(SPECIES_SNEASEL)
	.short EC_WORD_POKEMON(SPECIES_SNORLAX)
	.short EC_WORD_POKEMON(SPECIES_SNORUNT)
	.short EC_WORD_POKEMON(SPECIES_SNOVER)
	.short EC_WORD_POKEMON(SPECIES_SNUBBULL)
	.short EC_WORD_POKEMON(SPECIES_SOLROCK)
	.short EC_WORD_POKEMON(SPECIES_SPEAROW)
	.short EC_WORD_POKEMON(SPECIES_SPHEAL)
	.short EC_WORD_POKEMON(SPECIES_SPINARAK)
	.short EC_WORD_POKEMON(SPECIES_SPINDA)
	.short EC_WORD_POKEMON(SPECIES_SPIRITOMB)
	.short EC_WORD_POKEMON(SPECIES_SPOINK)
	.short EC_WORD_POKEMON(SPECIES_SQUIRTLE)
	.short EC_WORD_POKEMON(SPECIES_STANTLER)
	.short EC_WORD_POKEMON(SPECIES_STARAPTOR)
	.short EC_WORD_POKEMON(SPECIES_STARAVIA)
	.short EC_WORD_POKEMON(SPECIES_STARLY)
	.short EC_WORD_POKEMON(SPECIES_STARMIE)
	.short EC_WORD_POKEMON(SPECIES_STARYU)
	.short EC_WORD_POKEMON(SPECIES_STEELIX)
	.short EC_WORD_POKEMON(SPECIES_STUNKY)
	.short EC_WORD_POKEMON(SPECIES_SUDOWOODO)
	.short EC_WORD_POKEMON(SPECIES_SUICUNE)
	.short EC_WORD_POKEMON(SPECIES_SUNFLORA)
	.short EC_WORD_POKEMON(SPECIES_SUNKERN)
	.short EC_WORD_POKEMON(SPECIES_SURSKIT)
	.short EC_WORD_POKEMON(SPECIES_SWABLU)
	.short EC_WORD_POKEMON(SPECIES_SWALOT)
	.short EC_WORD_POKEMON(SPECIES_SWAMPERT)
	.short EC_WORD_POKEMON(SPECIES_SWELLOW)
	.short EC_WORD_POKEMON(SPECIES_SWINUB)
	.short EC_WORD_POKEMON(SPECIES_TAILLOW)
	.short EC_WORD_POKEMON(SPECIES_TANGELA)
	.short EC_WORD_POKEMON(SPECIES_TANGROWTH)
	.short EC_WORD_POKEMON(SPECIES_TAUROS)
	.short EC_WORD_POKEMON(SPECIES_TEDDIURSA)
	.short EC_WORD_POKEMON(SPECIES_TENTACOOL)
	.short EC_WORD_POKEMON(SPECIES_TENTACRUEL)
	.short EC_WORD_POKEMON(SPECIES_TOGEKISS)
	.short EC_WORD_POKEMON(SPECIES_TOGEPI)
	.short EC_WORD_POKEMON(SPECIES_TOGETIC)
	.short EC_WORD_POKEMON(SPECIES_TORCHIC)
	.short EC_WORD_POKEMON(SPECIES_TORKOAL)
	.short EC_WORD_POKEMON(SPECIES_TORTERRA)
	.short EC_WORD_POKEMON(SPECIES_TOTODILE)
	.short EC_WORD_POKEMON(SPECIES_TOXICROAK)
	.short EC_WORD_POKEMON(SPECIES_TRAPINCH)
	.short EC_WORD_POKEMON(SPECIES_TREECKO)
	.short EC_WORD_POKEMON(SPECIES_TROPIUS)
	.short EC_WORD_POKEMON(SPECIES_TURTWIG)
	.short EC_WORD_POKEMON(SPECIES_TYPHLOSION)
	.short EC_WORD_POKEMON(SPECIES_TYRANITAR)
	.short EC_WORD_POKEMON(SPECIES_TYROGUE)
	.short EC_WORD_POKEMON(SPECIES_UMBREON)
	.short EC_WORD_POKEMON(SPECIES_UNOWN)
	.short EC_WORD_POKEMON(SPECIES_URSARING)
	.short EC_WORD_POKEMON(SPECIES_UXIE)
	.short EC_WORD_POKEMON(SPECIES_VAPOREON)
	.short EC_WORD_POKEMON(SPECIES_VENOMOTH)
	.short EC_WORD_POKEMON(SPECIES_VENONAT)
	.short EC_WORD_POKEMON(SPECIES_VENUSAUR)
	.short EC_WORD_POKEMON(SPECIES_VESPIQUEN)
	.short EC_WORD_POKEMON(SPECIES_VIBRAVA)
	.short EC_WORD_POKEMON(SPECIES_VICTREEBEL)
	.short EC_WORD_POKEMON(SPECIES_VIGOROTH)
	.short EC_WORD_POKEMON(SPECIES_VILEPLUME)
	.short EC_WORD_POKEMON(SPECIES_VOLBEAT)
	.short EC_WORD_POKEMON(SPECIES_VOLTORB)
	.short EC_WORD_POKEMON(SPECIES_VULPIX)
	.short EC_WORD_POKEMON(SPECIES_WAILMER)
	.short EC_WORD_POKEMON(SPECIES_WAILORD)
	.short EC_WORD_POKEMON(SPECIES_WALREIN)
	.short EC_WORD_POKEMON(SPECIES_WARTORTLE)
	.short EC_WORD_POKEMON(SPECIES_WEAVILE)
	.short EC_WORD_POKEMON(SPECIES_WEEDLE)
	.short EC_WORD_POKEMON(SPECIES_WEEPINBELL)
	.short EC_WORD_POKEMON(SPECIES_WEEZING)
	.short EC_WORD_POKEMON(SPECIES_WHISCASH)
	.short EC_WORD_POKEMON(SPECIES_WHISMUR)
	.short EC_WORD_POKEMON(SPECIES_WIGGLYTUFF)
	.short EC_WORD_POKEMON(SPECIES_WINGULL)
	.short EC_WORD_POKEMON(SPECIES_WOBBUFFET)
	.short EC_WORD_POKEMON(SPECIES_WOOPER)
	.short EC_WORD_POKEMON(SPECIES_WORMADAM)
	.short EC_WORD_POKEMON(SPECIES_WURMPLE)
	.short EC_WORD_POKEMON(SPECIES_WYNAUT)
	.short EC_WORD_POKEMON(SPECIES_XATU)
	.short EC_WORD_POKEMON(SPECIES_YANMA)
	.short EC_WORD_POKEMON(SPECIES_YANMEGA)
	.short EC_WORD_POKEMON(SPECIES_ZANGOOSE)
	.short EC_WORD_POKEMON(SPECIES_ZAPDOS)
	.short EC_WORD_POKEMON(SPECIES_ZIGZAGOON)
	.short EC_WORD_POKEMON(SPECIES_ZUBAT)
	.short 0xFFFF

	; File boundary
