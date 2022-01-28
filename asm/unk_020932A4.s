#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start PhoneBookTrainerGetRematchInfo
PhoneBookTrainerGetRematchInfo: ; 0x020932A4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	add r7, r3, #0
	bl SaveData_GetPhoneRematches
	add r1, r5, #0
	bl PhoneRematches_IsSeeking
	cmp r0, #0
	bne _020932C2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020932C2:
	cmp r5, #0x10
	bne _020932CE
	cmp r7, #1
	beq _020932CE
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020932CE:
	mov r1, #0x14
	ldr r2, [r6, #4]
	mul r1, r5
	add r1, r2, r1
	ldrh r1, [r1, #4]
	add r0, r4, #0
	bl TryGetRematchTrainerIdByBaseTrainerId
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end PhoneBookTrainerGetRematchInfo
