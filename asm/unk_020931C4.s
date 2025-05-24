#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "unk_020931C4.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020931C4
sub_020931C4: ; 0x020931C4
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0
	ldr r4, _02093228 ; =sGiftNormalTable
	add r5, r0, #0
	str r1, [sp]
	add r6, r7, #0
_020931D0:
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0202F1B4
	cmp r0, #0
	bne _02093212
	ldrh r1, [r4, #2]
	ldr r0, [sp]
	cmp r0, r1
	blo _0209321A
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0202F198
	ldrh r1, [r4]
	add r0, r5, #0
	mov r2, #1
	bl PhoneCallPersistentState_MomGiftQueue_Put
	ldrh r2, [r4, #4]
	add r0, r5, #0
	mov r1, #3
	bl PhoneCallPersistentState_MomSavings_BalanceAction
	str r0, [sp]
	add r0, r5, #0
	add r7, r7, #1
	bl PhoneCallPersistentState_MomGiftQueue_IsFull
	cmp r0, #0
	bne _0209321A
_02093212:
	add r6, r6, #1
	add r4, r4, #6
	cmp r6, #9
	blt _020931D0
_0209321A:
	cmp r7, #0
	beq _02093222
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02093222:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02093228: .word sGiftNormalTable
	thumb_func_end sub_020931C4

	thumb_func_start sub_0209322C
sub_0209322C: ; 0x0209322C
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl PhoneCallPersistentState_MomGiftQueue_IsFull
	cmp r0, #0
	beq _02093240
	mov r0, #0
	pop {r4, r5, r6, pc}
_02093240:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020931C4
	cmp r0, #0
	beq _02093250
	mov r0, #1
	pop {r4, r5, r6, pc}
_02093250:
	ldr r1, _0209329C ; =0x00000BB8
	add r0, r5, #0
	bl _u32_div_f
	add r5, r0, #0
	ldr r1, _0209329C ; =0x00000BB8
	add r0, r6, #0
	bl _u32_div_f
	cmp r5, r0
	bhi _0209326A
	mov r0, #0
	pop {r4, r5, r6, pc}
_0209326A:
	bl LCRandom
	mov r1, #0x11
	bl _s32_div_f
	lsl r0, r1, #1
	add r1, r1, r0
	ldr r2, _020932A0 ; =sGiftBerryTable
	add r0, r4, #0
	add r5, r2, r1
	ldrb r1, [r2, r1]
	ldrb r2, [r5, #1]
	add r1, #0x95
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl PhoneCallPersistentState_MomGiftQueue_Put
	ldrb r2, [r5, #2]
	add r0, r4, #0
	mov r1, #3
	bl PhoneCallPersistentState_MomSavings_BalanceAction
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0209329C: .word 0x00000BB8
_020932A0: .word sGiftBerryTable
	thumb_func_end sub_0209322C

	.rodata

sGiftBerryTable:
	//    berry                                 quantity  cost
	.byte ITEM_OCCA_BERRY   - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_PASSHO_BERRY - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_WACAN_BERRY  - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_RINDO_BERRY  - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_YACHE_BERRY  - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_CHOPLE_BERRY - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_KEBIA_BERRY  - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_SHUCA_BERRY  - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_COBA_BERRY   - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_PAYAPA_BERRY - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_TANGA_BERRY  - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_CHARTI_BERRY - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_KASIB_BERRY  - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_HABAN_BERRY  - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_COLBUR_BERRY - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_BABIRI_BERRY - ITEM_CHERI_BERRY,        5,  100
	.byte ITEM_CHILAN_BERRY - ITEM_CHERI_BERRY,        5,  100

	.balign 2, 0
sGiftNormalTable:
	//     item               threshold  cost
	.short ITEM_SUPER_POTION,       900,  600
	.short ITEM_REPEL,             4000,  270
	.short ITEM_SUPER_POTION,      7000,  600
	.short ITEM_SILK_SCARF,       10000,  100
	.short ITEM_MOON_STONE,       15000, 3000
	.short ITEM_HYPER_POTION,     19000,  900
	.short ITEM_CHOICE_SCARF,     30000,  200
	.short ITEM_MUSCLE_BAND,      40000,  200
	.short ITEM_FOCUS_SASH,       50000,  200
