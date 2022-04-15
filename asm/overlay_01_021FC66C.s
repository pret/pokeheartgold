#include "constants/sndseq.h"
#include "constants/moves.h"
#include "constants/std_script.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "constants/maps.h"
#include "constants/mmodel.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start CreateFishingRodTaskEnv
CreateFishingRodTaskEnv: ; 0x021FC66C
	push {r3, r4, r5, lr}
	add r0, r1, #0
	mov r1, #0x18
	add r5, r2, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x18
	mov r0, #0
_021FC680:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _021FC680
	add r0, r5, #0
	str r5, [r4, #0xc]
	bl ov01_021FCC00
	str r0, [r4, #4]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end CreateFishingRodTaskEnv

	thumb_func_start Task_OverworldFish
Task_OverworldFish: ; 0x021FC698
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _021FC6B6
	cmp r0, #1
	beq _021FC6E2
	b _021FC742
_021FC6B6:
	ldr r0, [r4, #0x3c]
	bl MapObjectMan_PauseAllMovement
	mov r0, #0
	str r0, [r5, #0x10]
	add r2, r5, #0
	ldr r1, [r5, #0xc]
	add r0, r4, #0
	add r2, #0x10
	bl ov02_02246F70
	str r0, [r5, #8]
	ldr r1, [r5, #0xc]
	ldr r2, [r5, #8]
	add r0, r4, #0
	bl ov01_021FC748
	str r0, [r5, #0x14]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _021FC742
_021FC6E2:
	ldr r0, [r5, #0x14]
	bl ov01_021FC76C
	cmp r0, #1
	bne _021FC742
	ldr r0, [r5, #0x14]
	bl ov01_021FC778
	add r7, r0, #0
	ldr r0, [r5, #0x14]
	bl ov01_021FC784
	cmp r7, #1
	bne _021FC728
	add r0, r4, #0
	bl Fsys_GetGearPhoneRingManager
	bl sub_02092FA8
	ldr r0, [r4, #0xc]
	bl Sav2_GameStats_get
	mov r1, #0xb
	bl GameStats_Inc
	ldr r2, [r5, #0x10]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02050B90
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021FC728:
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq _021FC732
	bl sub_02051BF8
_021FC732:
	ldr r0, [r4, #0x3c]
	bl MapObjectMan_UnpauseAllMovement
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021FC742:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end Task_OverworldFish

	thumb_func_start ov01_021FC748
ov01_021FC748: ; 0x021FC748
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x4c
	add r4, r1, #0
	add r6, r2, #0
	bl ov01_021FCAC4
	add r1, r0, #0
	str r5, [r1, #0x20]
	str r4, [r1, #0x1c]
	ldr r0, _021FC768 ; =ov01_021FC798
	mov r2, #0x80
	str r6, [r1]
	bl CreateSysTask
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021FC768: .word ov01_021FC798
	thumb_func_end ov01_021FC748

	thumb_func_start ov01_021FC76C
ov01_021FC76C: ; 0x021FC76C
	push {r3, lr}
	bl sub_0201F988
	ldr r0, [r0, #4]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC76C

	thumb_func_start ov01_021FC778
ov01_021FC778: ; 0x021FC778
	push {r3, lr}
	bl sub_0201F988
	ldr r0, [r0, #8]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC778

	thumb_func_start ov01_021FC784
ov01_021FC784: ; 0x021FC784
	push {r4, lr}
	add r4, r0, #0
	bl sub_0201F988
	bl FreeToHeap
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	thumb_func_end ov01_021FC784

	thumb_func_start ov01_021FC798
ov01_021FC798: ; 0x021FC798
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r0, [r5, #0x20]
	ldr r6, [r0, #0x40]
	add r0, r6, #0
	bl PlayerAvatar_GetMapObject
	ldr r7, _021FC7C0 ; =ov01_02208DC4
	add r4, r0, #0
_021FC7AA:
	ldr r3, [r5, #0xc]
	add r0, r5, #0
	lsl r3, r3, #2
	ldr r3, [r7, r3]
	add r1, r6, #0
	add r2, r4, #0
	blx r3
	cmp r0, #0
	bne _021FC7AA
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FC7C0: .word ov01_02208DC4
	thumb_func_end ov01_021FC798

	thumb_func_start ov01_021FC7C4
ov01_021FC7C4: ; 0x021FC7C4
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r0, #0
	bl ov01_021FCB14
	add r0, r4, #0
	bl MapObject_UnpauseMovement
	mov r0, #1
	str r0, [r5, #0xc]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC7C4

	thumb_func_start ov01_021FC7DC
ov01_021FC7DC: ; 0x021FC7DC
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r0, r6, #0
	add r4, r1, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _021FC80E
	add r0, r6, #0
	bl MapObject_ClearHeldMovementIfActive
	add r0, r4, #0
	mov r1, #0x20
	bl ov01_PlayerAvatar_OrrTransitionFlags
	add r0, r4, #0
	bl ov01_PlayerAvatar_ApplyTransitionFlags
	add r0, r6, #0
	mov r1, #1
	bl sub_0205F328
	mov r0, #2
	str r0, [r5, #0xc]
_021FC80E:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC7DC

	thumb_func_start ov01_021FC814
ov01_021FC814: ; 0x021FC814
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	cmp r0, #0xa
	bne _021FC828
	ldr r0, _021FC848 ; =SEQ_SE_DP_FW104
	bl PlaySE
_021FC828:
	ldr r0, [r4, #0x10]
	cmp r0, #0x22
	bge _021FC832
	mov r0, #0
	pop {r4, pc}
_021FC832:
	ldr r0, [r4]
	cmp r0, #1
	bne _021FC83C
	mov r0, #3
	b _021FC83E
_021FC83C:
	mov r0, #0xc
_021FC83E:
	str r0, [r4, #0xc]
	mov r0, #0
	str r0, [r4, #0x10]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_021FC848: .word SEQ_SE_DP_FW104
	thumb_func_end ov01_021FC814

	thumb_func_start ov01_021FC84C
ov01_021FC84C: ; 0x021FC84C
	push {r4, lr}
	add r4, r0, #0
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r0, r0, #0x1e
	sub r0, r0, r1
	mov r2, #0x1e
	ror r0, r2
	add r0, r1, r0
	add r0, r0, #1
	add r1, r0, #0
	mul r1, r2
	str r1, [r4, #0x14]
	ldr r0, [r4, #0x1c]
	lsl r1, r0, #2
	ldr r0, _021FC888 ; =ov01_02208D7C
	ldr r0, [r0, r1]
	str r0, [r4, #0x18]
	add r0, r4, #0
	bl ov01_021FCCB0
	ldr r1, [r4, #0x18]
	add r0, r1, r0
	str r0, [r4, #0x18]
	mov r0, #4
	str r0, [r4, #0xc]
	mov r0, #1
	pop {r4, pc}
	nop
_021FC888: .word ov01_02208D7C
	thumb_func_end ov01_021FC84C

	thumb_func_start ov01_021FC88C
ov01_021FC88C: ; 0x021FC88C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	add r4, r2, #0
	sub r0, r0, #1
	str r0, [r5, #0x14]
	bl ov01_021FCAE8
	cmp r0, #1
	bne _021FC8A8
	mov r0, #0xa
	str r0, [r5, #0xc]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021FC8A8:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	ble _021FC8B2
	mov r0, #0
	pop {r3, r4, r5, pc}
_021FC8B2:
	add r0, r4, #0
	mov r1, #2
	bl sub_0205F328
	add r0, r5, #0
	bl ov01_021FCC2C
	cmp r0, #0
	beq _021FC8D4
	ldr r0, [r5, #0x20]
	bl FollowingPokemon_GetMapObject
	mov r1, #0
	mov r2, #1
	bl ov01_02200540
	b _021FC8DE
_021FC8D4:
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov01_02200540
_021FC8DE:
	str r0, [r5, #0x24]
	mov r0, #5
	str r0, [r5, #0xc]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021FC88C

	thumb_func_start ov01_021FC8E8
ov01_021FC8E8: ; 0x021FC8E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	sub r0, r0, #1
	str r0, [r4, #0x18]
	bl ov01_021FCAE8
	cmp r0, #1
	bne _021FC902
	mov r0, #6
	str r0, [r4, #0xc]
	mov r0, #1
	pop {r4, pc}
_021FC902:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	ble _021FC90C
	mov r0, #0
	pop {r4, pc}
_021FC90C:
	mov r0, #0xb
	str r0, [r4, #0xc]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov01_021FC8E8

	thumb_func_start ov01_021FC914
ov01_021FC914: ; 0x021FC914
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	add r5, r2, #0
	bl ov01_02200400
	add r0, r5, #0
	mov r1, #3
	bl sub_0205F328
	mov r0, #0
	str r0, [r4, #0x10]
	mov r1, #7
	str r1, [r4, #0xc]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC914

	thumb_func_start ov01_021FC934
ov01_021FC934: ; 0x021FC934
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _021FC94C
	bl sub_02068B48
	mov r0, #0
	str r0, [r4, #0x24]
_021FC94C:
	ldr r0, [r4, #0x10]
	cmp r0, #0xf
	ble _021FC962
	mov r0, #0
	str r0, [r4, #0x10]
	mov r0, #8
	str r0, [r4, #0xc]
	add r0, r4, #0
	mov r1, #0x34
	bl ov01_021FCB90
_021FC962:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC934

	thumb_func_start ov01_021FC968
ov01_021FC968: ; 0x021FC968
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021FCBCC
	cmp r0, #0
	bne _021FC978
	mov r0, #0
	pop {r4, pc}
_021FC978:
	mov r0, #9
	str r0, [r4, #0xc]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov01_021FC968

	thumb_func_start ov01_021FC980
ov01_021FC980: ; 0x021FC980
	mov r2, #1
	str r2, [r0, #8]
	mov r1, #0xf
	str r1, [r0, #0xc]
	add r0, r2, #0
	bx lr
	thumb_func_end ov01_021FC980

	thumb_func_start ov01_021FC98C
ov01_021FC98C: ; 0x021FC98C
	push {r4, lr}
	add r4, r0, #0
	add r0, r2, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	mov r1, #0x33
	bl ov01_021FCB90
	mov r0, #0x10
	str r0, [r4, #0x10]
	mov r0, #0xe
	str r0, [r4, #0xc]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov01_021FC98C

	thumb_func_start ov01_021FC9AC
ov01_021FC9AC: ; 0x021FC9AC
	push {r4, lr}
	add r4, r0, #0
	add r0, r2, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	mov r1, #0x32
	bl ov01_021FCB90
	mov r0, #0x10
	str r0, [r4, #0x10]
	mov r0, #0xe
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	mov r1, #0x65
	bl GameStats_Inc
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC9AC

	thumb_func_start ov01_021FC9DC
ov01_021FC9DC: ; 0x021FC9DC
	mov r1, #0x78
	str r1, [r0, #0x10]
	mov r1, #0xd
	str r1, [r0, #0xc]
	mov r0, #1
	bx lr
	thumb_func_end ov01_021FC9DC

	thumb_func_start ov01_021FC9E8
ov01_021FC9E8: ; 0x021FC9E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	add r4, r2, #0
	sub r0, r0, #1
	str r0, [r5, #0x10]
	bl ov01_021FCAE8
	cmp r0, #1
	bne _021FCA04
	mov r0, #0xa
	str r0, [r5, #0xc]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021FCA04:
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq _021FCA0E
	mov r0, #0
	pop {r3, r4, r5, pc}
_021FCA0E:
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	mov r1, #0x31
	bl ov01_021FCB90
	mov r0, #0x10
	str r0, [r5, #0x10]
	mov r0, #0xe
	str r0, [r5, #0xc]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC9E8

	thumb_func_start ov01_021FCA2C
ov01_021FCA2C: ; 0x021FCA2C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	add r1, r1, #1
	str r1, [r4, #0x10]
	cmp r1, #0x10
	bge _021FCA3E
	mov r0, #0
	pop {r4, pc}
_021FCA3E:
	mov r1, #0x10
	str r1, [r4, #0x10]
	bl ov01_021FCBCC
	cmp r0, #0
	bne _021FCA4E
	mov r0, #0
	pop {r4, pc}
_021FCA4E:
	mov r0, #0xf
	str r0, [r4, #0xc]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FCA2C

	thumb_func_start ov01_021FCA58
ov01_021FCA58: ; 0x021FCA58
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	add r5, r1, #0
	cmp r0, #0
	beq _021FCA68
	bl ov01_02200400
_021FCA68:
	add r0, r4, #0
	bl ov01_021FCB4C
	add r0, r5, #0
	bl PlayerAvatar_GetState
	bl sub_0205C99C
	add r1, r0, #0
	add r0, r5, #0
	bl ov01_PlayerAvatar_OrrTransitionFlags
	add r0, r5, #0
	bl ov01_PlayerAvatar_ApplyTransitionFlags
	mov r0, #0
	str r0, [r4, #0x10]
	mov r0, #0x10
	str r0, [r4, #0xc]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FCA58

	thumb_func_start ov01_021FCA94
ov01_021FCA94: ; 0x021FCA94
	ldr r1, [r0, #0x10]
	add r1, r1, #1
	str r1, [r0, #0x10]
	cmp r1, #2
	ble _021FCAA2
	mov r1, #0x11
	str r1, [r0, #0xc]
_021FCAA2:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FCA94

	thumb_func_start ov01_021FCAA8
ov01_021FCAA8: ; 0x021FCAA8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _021FCABA
	bl sub_02068B48
	mov r0, #0
	str r0, [r4, #0x24]
_021FCABA:
	mov r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FCAA8

	thumb_func_start ov01_021FCAC4
ov01_021FCAC4: ; 0x021FCAC4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #4
	add r1, r5, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	bne _021FCAD8
	bl GF_AssertFail
_021FCAD8:
	add r0, r4, #0
	mov r1, #0
	add r2, r5, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FCAC4

	thumb_func_start ov01_021FCAE8
ov01_021FCAE8: ; 0x021FCAE8
	ldr r0, _021FCAF8 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r1, r0
	bne _021FCAF4
	mov r0, #0
_021FCAF4:
	bx lr
	nop
_021FCAF8: .word gSystem
	thumb_func_end ov01_021FCAE8

	thumb_func_start ov01_021FCAFC
ov01_021FCAFC: ; 0x021FCAFC
	ldr r0, _021FCB10 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _021FCB0A
	mov r0, #1
	bx lr
_021FCB0A:
	mov r0, #0
	bx lr
	nop
_021FCB10: .word gSystem
	thumb_func_end ov01_021FCAFC

	thumb_func_start ov01_021FCB14
ov01_021FCB14: ; 0x021FCB14
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x28
	mov r3, #4
	bl NewMsgDataFromNarc
	str r0, [r4, #0x48]
	mov r0, #1
	lsl r0, r0, #0xa
	mov r1, #4
	bl String_ctor
	str r0, [r4, #0x2c]
	mov r0, #1
	lsl r0, r0, #0xa
	mov r1, #4
	bl String_ctor
	str r0, [r4, #0x30]
	mov r0, #8
	mov r1, #0x40
	mov r2, #4
	bl ScrStrBufs_new_custom
	str r0, [r4, #0x34]
	pop {r4, pc}
	thumb_func_end ov01_021FCB14

	thumb_func_start ov01_021FCB4C
ov01_021FCB4C: ; 0x021FCB4C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x34]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x2c]
	bl String_dtor
	ldr r0, [r4, #0x30]
	bl String_dtor
	ldr r0, [r4, #0x48]
	bl DestroyMsgData
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FCB4C

	thumb_func_start ov01_021FCB6C
ov01_021FCB6C: ; 0x021FCB6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x20]
	add r1, r5, #0
	ldr r0, [r4, #8]
	add r1, #0x38
	mov r2, #3
	bl sub_0205B514
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r5, #0x38
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0205B564
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021FCB6C

	thumb_func_start ov01_021FCB90
ov01_021FCB90: ; 0x021FCB90
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl ov01_021FCB6C
	ldr r0, [r5, #0x48]
	ldr r2, [r5, #0x30]
	add r1, r6, #0
	ldr r4, [r5, #0x20]
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x2c]
	ldr r2, [r5, #0x30]
	bl StringExpandPlaceholders
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r2, r0, #0
	add r0, r5, #0
	ldr r1, [r5, #0x2c]
	add r0, #0x38
	mov r3, #1
	bl sub_0205B5B4
	add r5, #0x28
	strb r0, [r5]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FCB90

	thumb_func_start ov01_021FCBCC
ov01_021FCBCC: ; 0x021FCBCC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x28
	ldrb r0, [r0]
	bl sub_0205B624
	cmp r0, #1
	bne _021FCBFA
	bl ov01_021FCAFC
	cmp r0, #1
	bne _021FCBFA
	add r0, r4, #0
	add r0, #0x38
	mov r1, #0
	bl ClearFrameAndWindow2
	add r4, #0x38
	add r0, r4, #0
	bl RemoveWindow
	mov r0, #1
	pop {r4, pc}
_021FCBFA:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FCBCC

	thumb_func_start ov01_021FCC00
ov01_021FCC00: ; 0x021FCC00
	push {r3, lr}
	cmp r0, #0
	beq _021FCC12
	cmp r0, #1
	beq _021FCC16
	cmp r0, #2
	beq _021FCC1A
	bl GF_AssertFail
_021FCC12:
	ldr r0, _021FCC20 ; =0x000001BD
	pop {r3, pc}
_021FCC16:
	ldr r0, _021FCC24 ; =0x000001BE
	pop {r3, pc}
_021FCC1A:
	ldr r0, _021FCC28 ; =0x000001BF
	pop {r3, pc}
	nop
_021FCC20: .word 0x000001BD
_021FCC24: .word 0x000001BE
_021FCC28: .word 0x000001BF
	thumb_func_end ov01_021FCC00

	thumb_func_start ov01_021FCC2C
ov01_021FCC2C: ; 0x021FCC2C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #2
	bne _021FCC40
	mov r0, #0
	pop {r4, pc}
_021FCC40:
	ldr r0, [r4, #0x20]
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _021FCC6E
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	bl GetFirstAliveMonInParty_CrashIfNone
	mov r1, #9
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov01_021FCC74
	cmp r0, #0
	beq _021FCC6E
	mov r0, #1
	pop {r4, pc}
_021FCC6E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FCC2C

	thumb_func_start ov01_021FCC74
ov01_021FCC74: ; 0x021FCC74
	push {r4, lr}
	cmp r0, #0x63
	bhi _021FCC7E
	mov r0, #0
	pop {r4, pc}
_021FCC7E:
	cmp r0, #0x95
	bhi _021FCC86
	mov r4, #0x14
	b _021FCC98
_021FCC86:
	cmp r0, #0xc7
	bhi _021FCC8E
	mov r4, #0x1e
	b _021FCC98
_021FCC8E:
	cmp r0, #0xf9
	bhi _021FCC96
	mov r4, #0x28
	b _021FCC98
_021FCC96:
	mov r4, #0x32
_021FCC98:
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	cmp r1, r4
	bge _021FCCAA
	mov r0, #1
	pop {r4, pc}
_021FCCAA:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FCC74

	thumb_func_start ov01_021FCCB0
ov01_021FCCB0: ; 0x021FCCB0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _021FCD24
	mov r0, #0x42
	ldr r1, [r4, #0x20]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl FsysUnkSub108_GetMonMood
	mov r1, #9
	mvn r1, r1
	cmp r0, r1
	bgt _021FCCD6
	mov r3, #0
	b _021FCCFE
_021FCCD6:
	add r1, r1, #1
	cmp r0, r1
	blt _021FCCE4
	cmp r0, #9
	bgt _021FCCE4
	mov r3, #1
	b _021FCCFE
_021FCCE4:
	cmp r0, #0xa
	blt _021FCCF0
	cmp r0, #0x32
	bge _021FCCF0
	mov r3, #2
	b _021FCCFE
_021FCCF0:
	cmp r0, #0x32
	blt _021FCCFC
	cmp r0, #0x64
	bge _021FCCFC
	mov r3, #3
	b _021FCCFE
_021FCCFC:
	mov r3, #4
_021FCCFE:
	ldr r0, [r4, #0x1c]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #2
	bls _021FCD10
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_021FCD10:
	mov r0, #0xc
	add r2, r3, #0
	mul r2, r0
	ldr r0, _021FCD28 ; =ov01_02208D88
	lsl r1, r1, #2
	add r0, r0, r2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, pc}
_021FCD24:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_021FCD28: .word ov01_02208D88
	thumb_func_end ov01_021FCCB0

	.rodata

ov01_02208D7C: ; 0x02208D7C
	.byte 0x2D, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00

ov01_02208D88: ; 0x02208D88
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x0F, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.byte 0x12, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00

ov01_02208DC4: ; 0x02208DC4
	.word ov01_021FC7C4
	.word ov01_021FC7DC
	.word ov01_021FC814
	.word ov01_021FC84C
	.word ov01_021FC88C
	.word ov01_021FC8E8
	.word ov01_021FC914
	.word ov01_021FC934
	.word ov01_021FC968
	.word ov01_021FC980
	.word ov01_021FC98C
	.word ov01_021FC9AC
	.word ov01_021FC9DC
	.word ov01_021FC9E8
	.word ov01_021FCA2C
	.word ov01_021FCA58
	.word ov01_021FCA94
	.word ov01_021FCAA8
