#include "constants/pokemon.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "overlay_12_battle_system.inc"
	.include "global.inc"

	.text

	thumb_func_start ov12_0223C754
ov12_0223C754: ; 0x0223C754
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r2, [r4, #1]
	mov r1, #0x3f
	add r5, r0, #0
	and r1, r2
	cmp r1, #0x3c
	bls _0223C766
	b _0223CDCA
_0223C766:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223C772: ; jump table
	.short _0223CDCE - _0223C772 - 2 ; case 0
	.short _0223CDCE - _0223C772 - 2 ; case 1
	.short _0223C7EC - _0223C772 - 2 ; case 2
	.short _0223C7F6 - _0223C772 - 2 ; case 3
	.short _0223C800 - _0223C772 - 2 ; case 4
	.short _0223C80A - _0223C772 - 2 ; case 5
	.short _0223C814 - _0223C772 - 2 ; case 6
	.short _0223C81E - _0223C772 - 2 ; case 7
	.short _0223C82A - _0223C772 - 2 ; case 8
	.short _0223C834 - _0223C772 - 2 ; case 9
	.short _0223C848 - _0223C772 - 2 ; case 10
	.short _0223C85C - _0223C772 - 2 ; case 11
	.short _0223C870 - _0223C772 - 2 ; case 12
	.short _0223C884 - _0223C772 - 2 ; case 13
	.short _0223C898 - _0223C772 - 2 ; case 14
	.short _0223C8AC - _0223C772 - 2 ; case 15
	.short _0223C8C0 - _0223C772 - 2 ; case 16
	.short _0223C8D4 - _0223C772 - 2 ; case 17
	.short _0223C8E8 - _0223C772 - 2 ; case 18
	.short _0223C8FC - _0223C772 - 2 ; case 19
	.short _0223C7F6 - _0223C772 - 2 ; case 20
	.short _0223C910 - _0223C772 - 2 ; case 21
	.short _0223C924 - _0223C772 - 2 ; case 22
	.short _0223C938 - _0223C772 - 2 ; case 23
	.short _0223C94C - _0223C772 - 2 ; case 24
	.short _0223C960 - _0223C772 - 2 ; case 25
	.short _0223C974 - _0223C772 - 2 ; case 26
	.short _0223C988 - _0223C772 - 2 ; case 27
	.short _0223C99C - _0223C772 - 2 ; case 28
	.short _0223C9B0 - _0223C772 - 2 ; case 29
	.short _0223C9C4 - _0223C772 - 2 ; case 30
	.short _0223C9D8 - _0223C772 - 2 ; case 31
	.short _0223C9F6 - _0223C772 - 2 ; case 32
	.short _0223CA14 - _0223C772 - 2 ; case 33
	.short _0223CA32 - _0223C772 - 2 ; case 34
	.short _0223CA50 - _0223C772 - 2 ; case 35
	.short _0223CA6E - _0223C772 - 2 ; case 36
	.short _0223CA8C - _0223C772 - 2 ; case 37
	.short _0223CAAA - _0223C772 - 2 ; case 38
	.short _0223CAC8 - _0223C772 - 2 ; case 39
	.short _0223CAE6 - _0223C772 - 2 ; case 40
	.short _0223CB04 - _0223C772 - 2 ; case 41
	.short _0223CB22 - _0223C772 - 2 ; case 42
	.short _0223CB40 - _0223C772 - 2 ; case 43
	.short _0223CB5E - _0223C772 - 2 ; case 44
	.short _0223CB7C - _0223C772 - 2 ; case 45
	.short _0223CB9A - _0223C772 - 2 ; case 46
	.short _0223CBB8 - _0223C772 - 2 ; case 47
	.short _0223CBD6 - _0223C772 - 2 ; case 48
	.short _0223CBF4 - _0223C772 - 2 ; case 49
	.short _0223CC12 - _0223C772 - 2 ; case 50
	.short _0223CC30 - _0223C772 - 2 ; case 51
	.short _0223CC4E - _0223C772 - 2 ; case 52
	.short _0223CC76 - _0223C772 - 2 ; case 53
	.short _0223CC9E - _0223C772 - 2 ; case 54
	.short _0223CCC6 - _0223C772 - 2 ; case 55
	.short _0223CCEE - _0223C772 - 2 ; case 56
	.short _0223CD16 - _0223C772 - 2 ; case 57
	.short _0223CD3E - _0223C772 - 2 ; case 58
	.short _0223CD66 - _0223C772 - 2 ; case 59
	.short _0223CD8E - _0223C772 - 2 ; case 60
_0223C7EC:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	pop {r3, r4, r5, pc}
_0223C7F6:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferMove
	pop {r3, r4, r5, pc}
_0223C800:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferStat
	pop {r3, r4, r5, pc}
_0223C80A:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferItem
	pop {r3, r4, r5, pc}
_0223C814:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNumber
	pop {r3, r4, r5, pc}
_0223C81E:
	ldr r2, [r4, #4]
	ldr r3, [r4, #0x1c]
	mov r1, #0
	bl BattleMessage_BufferNumbers
	pop {r3, r4, r5, pc}
_0223C82A:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferTrainerName
	pop {r3, r4, r5, pc}
_0223C834:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferNickname
	pop {r3, r4, r5, pc}
_0223C848:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferMove
	pop {r3, r4, r5, pc}
_0223C85C:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferAbility
	pop {r3, r4, r5, pc}
_0223C870:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferStat
	pop {r3, r4, r5, pc}
_0223C884:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferType
	pop {r3, r4, r5, pc}
_0223C898:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferPokemon
	pop {r3, r4, r5, pc}
_0223C8AC:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferItem
	pop {r3, r4, r5, pc}
_0223C8C0:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferPoffin
	pop {r3, r4, r5, pc}
_0223C8D4:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferNumber
	pop {r3, r4, r5, pc}
_0223C8E8:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferTrainerName
	pop {r3, r4, r5, pc}
_0223C8FC:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferBoxName
	pop {r3, r4, r5, pc}
_0223C910:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferMove
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferNickname
	pop {r3, r4, r5, pc}
_0223C924:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferMove
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferMove
	pop {r3, r4, r5, pc}
_0223C938:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferAbility
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferNickname
	pop {r3, r4, r5, pc}
_0223C94C:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferItem
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferMove
	pop {r3, r4, r5, pc}
_0223C960:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNumber
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferNumber
	pop {r3, r4, r5, pc}
_0223C974:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferTrainerName
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferTrainerName
	pop {r3, r4, r5, pc}
_0223C988:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferTrainerName
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferNickname
	pop {r3, r4, r5, pc}
_0223C99C:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferTrainerName
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferItem
	pop {r3, r4, r5, pc}
_0223C9B0:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferTrainerName
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferNumber
	pop {r3, r4, r5, pc}
_0223C9C4:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferTrainerName
	pop {r3, r4, r5, pc}
_0223C9D8:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferMove
	pop {r3, r4, r5, pc}
_0223C9F6:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferAbility
	pop {r3, r4, r5, pc}
_0223CA14:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferItem
	pop {r3, r4, r5, pc}
_0223CA32:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferMove
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferMove
	pop {r3, r4, r5, pc}
_0223CA50:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferMove
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferNumber
	pop {r3, r4, r5, pc}
_0223CA6E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferAbility
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferNickname
	pop {r3, r4, r5, pc}
_0223CA8C:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferAbility
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferMove
	pop {r3, r4, r5, pc}
_0223CAAA:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferAbility
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferItem
	pop {r3, r4, r5, pc}
_0223CAC8:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferAbility
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferStat
	pop {r3, r4, r5, pc}
_0223CAE6:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferAbility
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferType
	pop {r3, r4, r5, pc}
_0223CB04:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferAbility
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferStatus
	pop {r3, r4, r5, pc}
_0223CB22:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferAbility
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferNumber
	pop {r3, r4, r5, pc}
_0223CB40:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferItem
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferNickname
	pop {r3, r4, r5, pc}
_0223CB5E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferItem
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferMove
	pop {r3, r4, r5, pc}
_0223CB7C:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferItem
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferStat
	pop {r3, r4, r5, pc}
_0223CB9A:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferItem
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferStatus
	pop {r3, r4, r5, pc}
_0223CBB8:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferBoxName
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferBoxName
	pop {r3, r4, r5, pc}
_0223CBD6:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferItem
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferFlavorPreference
	pop {r3, r4, r5, pc}
_0223CBF4:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferTrainerName
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferNickname
	pop {r3, r4, r5, pc}
_0223CC12:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferTrainerName
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferNickname
	pop {r3, r4, r5, pc}
_0223CC30:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferTrainerName
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferItem
	pop {r3, r4, r5, pc}
_0223CC4E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferAbility
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl BattleMessage_BufferMove
	pop {r3, r4, r5, pc}
_0223CC76:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferAbility
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl BattleMessage_BufferAbility
	pop {r3, r4, r5, pc}
_0223CC9E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferAbility
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl BattleMessage_BufferStat
	pop {r3, r4, r5, pc}
_0223CCC6:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferItem
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl BattleMessage_BufferItem
	pop {r3, r4, r5, pc}
_0223CCEE:
	ldr r2, [r4, #4]
	mov r1, #0
	bl BattleMessage_BufferTrainerName
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferTrainerName
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl BattleMessage_BufferNickname
	pop {r3, r4, r5, pc}
_0223CD16:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferTrainerName
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl BattleMessage_BufferNickname
	pop {r3, r4, r5, pc}
_0223CD3E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferTrainerName
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl BattleMessage_BufferTrainerName
	pop {r3, r4, r5, pc}
_0223CD66:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferTrainerName
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov12_0223CEB4
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl BattleMessage_BufferTrainerName
	pop {r3, r4, r5, pc}
_0223CD8E:
	ldr r2, [r4, #4]
	mov r1, #0
	bl ov12_0223CEB4
	ldr r2, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl BattleMessage_BufferTrainerName
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl BattleMessage_BufferNickname
	ldr r2, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl ov12_0223CEB4
	ldr r2, [r4, #0x14]
	add r0, r5, #0
	mov r1, #4
	bl BattleMessage_BufferTrainerName
	ldr r2, [r4, #0x18]
	add r0, r5, #0
	mov r1, #5
	bl BattleMessage_BufferNickname
	pop {r3, r4, r5, pc}
_0223CDCA:
	bl GF_AssertFail
_0223CDCE:
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223C754

	thumb_func_start BattleMessage_BufferNickname
BattleMessage_BufferNickname: ; 0x0223CDD0
	push {r3, r4, r5, lr}
	mov r3, #0xff
	lsl r3, r3, #8
	add r4, r1, #0
	lsl r1, r2, #0x18
	and r2, r3
	add r5, r0, #0
	lsr r1, r1, #0x18
	asr r2, r2, #8
	bl BattleSystem_GetPartyMon
	add r2, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl BufferBoxMonNickname
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BattleMessage_BufferNickname

	thumb_func_start BattleMessage_BufferMove
BattleMessage_BufferMove: ; 0x0223CDF4
	ldr r3, _0223CDFC ; =BufferMoveName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CDFC: .word BufferMoveName
	thumb_func_end BattleMessage_BufferMove

	thumb_func_start BattleMessage_BufferItem
BattleMessage_BufferItem: ; 0x0223CE00
	ldr r3, _0223CE08 ; =BufferItemName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CE08: .word BufferItemName
	thumb_func_end BattleMessage_BufferItem

	thumb_func_start BattleMessage_BufferNumber
BattleMessage_BufferNumber: ; 0x0223CE0C
	push {r3, lr}
	sub sp, #8
	mov r3, #0
	str r3, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldr r0, [r0, #0x14]
	mov r3, #5
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, pc}
	thumb_func_end BattleMessage_BufferNumber

	thumb_func_start BattleMessage_BufferNumbers
BattleMessage_BufferNumbers: ; 0x0223CE24
	push {r4, lr}
	sub sp, #8
	cmp r3, #0
	beq _0223CE3C
	mov r4, #1
	str r4, [sp]
	str r4, [sp, #4]
	ldr r0, [r0, #0x14]
	bl BufferIntegerAsString
	add sp, #8
	pop {r4, pc}
_0223CE3C:
	mov r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, [r0, #0x14]
	mov r3, #5
	bl BufferIntegerAsString
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BattleMessage_BufferNumbers

	thumb_func_start BattleMessage_BufferType
BattleMessage_BufferType: ; 0x0223CE50
	ldr r3, _0223CE58 ; =BufferTypeName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CE58: .word BufferTypeName
	thumb_func_end BattleMessage_BufferType

	thumb_func_start BattleMessage_BufferAbility
BattleMessage_BufferAbility: ; 0x0223CE5C
	ldr r3, _0223CE64 ; =BufferAbilityName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CE64: .word BufferAbilityName
	thumb_func_end BattleMessage_BufferAbility

	thumb_func_start BattleMessage_BufferStat
BattleMessage_BufferStat: ; 0x0223CE68
	ldr r3, _0223CE70 ; =BufferStatName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CE70: .word BufferStatName
	thumb_func_end BattleMessage_BufferStat

	thumb_func_start BattleMessage_BufferStatus
BattleMessage_BufferStatus: ; 0x0223CE74
	ldr r3, _0223CE7C ; =BufferStatusName
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CE7C: .word BufferStatusName
	thumb_func_end BattleMessage_BufferStatus

	thumb_func_start BattleMessage_BufferPokemon
BattleMessage_BufferPokemon: ; 0x0223CE80
	push {r3, r4, r5, lr}
	mov r3, #0xff
	lsl r3, r3, #8
	add r4, r1, #0
	lsl r1, r2, #0x18
	and r2, r3
	add r5, r0, #0
	lsr r1, r1, #0x18
	asr r2, r2, #8
	bl BattleSystem_GetPartyMon
	add r2, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl BufferBoxMonSpeciesName
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BattleMessage_BufferPokemon

	thumb_func_start BattleMessage_BufferPoffin
BattleMessage_BufferPoffin: ; 0x0223CEA4
	bx lr
	.balign 4, 0
	thumb_func_end BattleMessage_BufferPoffin

	thumb_func_start BattleMessage_BufferFlavorPreference
BattleMessage_BufferFlavorPreference: ; 0x0223CEA8
	ldr r3, _0223CEB0 ; =BufferFlavorDislikeText
	ldr r0, [r0, #0x14]
	bx r3
	nop
_0223CEB0: .word BufferFlavorDislikeText
	thumb_func_end BattleMessage_BufferFlavorPreference

	thumb_func_start ov12_0223CEB4
ov12_0223CEB4: ; 0x0223CEB4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r1, r2, #0
	bl BattleSystem_GetTrainer
	add r2, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl BufferTrainerClassNameFromDataStruct
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223CEB4

	thumb_func_start BattleMessage_BufferTrainerName
BattleMessage_BufferTrainerName: ; 0x0223CECC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r1, r2, #0
	bl BattleSystem_GetTrainer
	add r2, r0, #0
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl BufferTrainerNameFromDataStruct
	pop {r3, r4, r5, pc}
	thumb_func_end BattleMessage_BufferTrainerName

	thumb_func_start BattleMessage_BufferBoxName
BattleMessage_BufferBoxName: ; 0x0223CEE4
	push {r4, lr}
	add r4, r0, #0
	add r3, r2, #0
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x64]
	bl BufferPCBoxName
	pop {r4, pc}
	thumb_func_end BattleMessage_BufferBoxName

	thumb_func_start ov12_0223CEF4
ov12_0223CEF4: ; 0x0223CEF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	ldrh r1, [r2, #2]
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_Delete
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0223CEF4

	thumb_func_start ov12_0223CF14
ov12_0223CF14: ; 0x0223CF14
	push {r4, lr}
	mov r4, #0
	cmp r1, #5
	bhi _0223CF5C
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223CF28: ; jump table
	.short _0223CF5C - _0223CF28 - 2 ; case 0
	.short _0223CF34 - _0223CF28 - 2 ; case 1
	.short _0223CF3C - _0223CF28 - 2 ; case 2
	.short _0223CF44 - _0223CF28 - 2 ; case 3
	.short _0223CF4C - _0223CF28 - 2 ; case 4
	.short _0223CF54 - _0223CF28 - 2 ; case 5
_0223CF34:
	bl GF_IsAnySEPlaying
	add r4, r0, #0
	b _0223CF5C
_0223CF3C:
	bl IsFanfarePlaying
	add r4, r0, #0
	b _0223CF5C
_0223CF44:
	ldr r0, _0223CF60 ; =0x000004A3
	bl PlayFanfare
	b _0223CF5C
_0223CF4C:
	ldr r0, _0223CF64 ; =0x000005E6
	bl PlaySE
	b _0223CF5C
_0223CF54:
	mov r0, #0x4a
	lsl r0, r0, #4
	bl PlayFanfare
_0223CF5C:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_0223CF60: .word 0x000004A3
_0223CF64: .word 0x000005E6
	thumb_func_end ov12_0223CF14
