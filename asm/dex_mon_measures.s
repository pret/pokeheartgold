#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public _02102610

	.text

	thumb_func_start ZknData_Create
ZknData_Create: ; 0x02091308
	push {r3, lr}
	mov r1, #0x18
	bl AllocFromHeap
	add r3, r0, #0
	mov r2, #0x18
	mov r1, #0
_02091316:
	strb r1, [r3]
	add r3, r3, #1
	sub r2, r2, #1
	bne _02091316
	pop {r3, pc}
	thumb_func_end ZknData_Create

	thumb_func_start ZknData_Delete
ZknData_Delete: ; 0x02091320
	push {r4, lr}
	add r4, r0, #0
	bne _0209132A
	bl GF_AssertFail
_0209132A:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ZknData_Delete

	thumb_func_start ZknData_LoadAll
ZknData_LoadAll: ; 0x02091334
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r4, r2, #0
	cmp r5, #0
	bne _02091344
	bl GF_AssertFail
_02091344:
	ldr r0, [r5]
	cmp r0, #0
	beq _0209134E
	bl GF_AssertFail
_0209134E:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _02091358
	bl GF_AssertFail
_02091358:
	bl GetDexZknDataNarcID
	add r1, r4, #0
	bl NARC_ctor
	add r6, r0, #0
	add r1, r4, #0
	bl sub_02091450
	str r0, [r5]
	add r0, r6, #0
	add r1, r4, #0
	bl sub_02091460
	str r0, [r5, #4]
	cmp r7, #0
	bne _0209139C
	add r1, r5, #0
	add r2, r5, #0
	add r0, r6, #0
	add r1, #8
	add r2, #0xc
	add r3, r4, #0
	bl sub_02091470
	add r1, r5, #0
	add r5, #0x14
	add r0, r6, #0
	add r1, #0x10
	add r2, r5, #0
	add r3, r4, #0
	bl sub_020914C0
	b _020913BC
_0209139C:
	add r1, r5, #0
	add r2, r5, #0
	add r0, r6, #0
	add r1, #8
	add r2, #0xc
	add r3, r4, #0
	bl sub_02091498
	add r1, r5, #0
	add r5, #0x14
	add r0, r6, #0
	add r1, #0x10
	add r2, r5, #0
	add r3, r4, #0
	bl sub_020914E8
_020913BC:
	add r0, r6, #0
	bl NARC_dtor
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ZknData_LoadAll

	thumb_func_start ZknData_UnloadAll
ZknData_UnloadAll: ; 0x020913C4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _020913D2
	bl GF_AssertFail
_020913D2:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _020913DC
	bl GF_AssertFail
_020913DC:
	ldr r0, [r4]
	bl FreeToHeap
	ldr r0, [r4, #4]
	bl FreeToHeap
	ldr r0, [r4, #8]
	bl FreeToHeap
	ldr r0, [r4, #0xc]
	bl FreeToHeap
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	ldr r0, [r4, #0x14]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	pop {r4, pc}
	thumb_func_end ZknData_UnloadAll

	thumb_func_start ZknData_GetHeight
ZknData_GetHeight: ; 0x02091410
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0209141E
	bl GF_AssertFail
_0209141E:
	ldr r0, [r5]
	cmp r0, #0
	bne _02091428
	bl GF_AssertFail
_02091428:
	ldr r1, [r5]
	lsl r0, r4, #2
	ldr r0, [r1, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ZknData_GetHeight

	thumb_func_start sub_02091430
sub_02091430: ; 0x02091430
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0209143E
	bl GF_AssertFail
_0209143E:
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _02091448
	bl GF_AssertFail
_02091448:
	ldr r1, [r5, #4]
	lsl r0, r4, #2
	ldr r0, [r1, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02091430

	thumb_func_start sub_02091450
sub_02091450: ; 0x02091450
	push {r3, lr}
	add r3, r1, #0
	mov r1, #0
	add r2, r1, #0
	str r1, [sp]
	bl GfGfxLoader_LoadFromOpenNarc
	pop {r3, pc}
	thumb_func_end sub_02091450

	thumb_func_start sub_02091460
sub_02091460: ; 0x02091460
	push {r3, lr}
	add r3, r1, #0
	mov r2, #0
	mov r1, #1
	str r2, [sp]
	bl GfGfxLoader_LoadFromOpenNarc
	pop {r3, pc}
	thumb_func_end sub_02091460

	thumb_func_start sub_02091470
sub_02091470: ; 0x02091470
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	mov r2, #0
	add r5, r1, #0
	add r6, r0, #0
	add r7, r3, #0
	str r2, [sp]
	mov r1, #9
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r5]
	mov r2, #0
	add r0, r6, #0
	mov r1, #0xa
	add r3, r7, #0
	str r2, [sp]
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02091470

	thumb_func_start sub_02091498
sub_02091498: ; 0x02091498
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	mov r2, #0
	add r5, r1, #0
	add r6, r0, #0
	add r7, r3, #0
	str r2, [sp]
	mov r1, #7
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r5]
	mov r2, #0
	add r0, r6, #0
	mov r1, #8
	add r3, r7, #0
	str r2, [sp]
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02091498

	thumb_func_start sub_020914C0
sub_020914C0: ; 0x020914C0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	mov r2, #0
	add r5, r1, #0
	add r6, r0, #0
	add r7, r3, #0
	str r2, [sp]
	mov r1, #5
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r5]
	mov r2, #0
	add r0, r6, #0
	mov r1, #6
	add r3, r7, #0
	str r2, [sp]
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020914C0

	thumb_func_start sub_020914E8
sub_020914E8: ; 0x020914E8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	mov r2, #0
	add r5, r1, #0
	add r6, r0, #0
	add r7, r3, #0
	str r2, [sp]
	mov r1, #3
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r5]
	mov r2, #0
	add r0, r6, #0
	mov r1, #4
	add r3, r7, #0
	str r2, [sp]
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020914E8

	thumb_func_start SetDexBanksByGiratinaForme
SetDexBanksByGiratinaForme: ; 0x02091510
	cmp r0, #0
	bne _02091524
	ldr r0, _02091538 ; =_021105BC
	mov r1, #0xd8 ; a/2/1/4
	str r1, [r0, #4]
	ldr r1, _0209153C ; =0x0000032D
	str r1, [r0]
	add r1, r1, #2
	str r1, [r0, #8]
	bx lr
_02091524:
	ldr r0, _02091538 ; =_021105BC
	mov r1, #0x4a ; a/0/7/4
	str r1, [r0, #4]
	mov r1, #0xcb
	lsl r1, r1, #2
	str r1, [r0]
	add r1, r1, #2
	str r1, [r0, #8]
	bx lr
	nop
_02091538: .word _021105BC
_0209153C: .word 0x0000032D
	thumb_func_end SetDexBanksByGiratinaForme

	thumb_func_start GetDexZknDataNarcID
GetDexZknDataNarcID: ; 0x02091540
	ldr r0, _02091548 ; =_021105BC
	ldr r0, [r0, #4]
	bx lr
	nop
_02091548: .word _021105BC
	thumb_func_end GetDexZknDataNarcID

	thumb_func_start GetDexWeightMsgBank
GetDexWeightMsgBank: ; 0x0209154C
	ldr r0, _02091554 ; =_021105BC
	ldr r0, [r0]
	bx lr
	nop
_02091554: .word _021105BC
	thumb_func_end GetDexWeightMsgBank

	thumb_func_start GetDexHeightMsgBank
GetDexHeightMsgBank: ; 0x02091558
	ldr r0, _02091560 ; =_021105BC
	ldr r0, [r0, #8]
	bx lr
	nop
_02091560: .word _021105BC
	thumb_func_end GetDexHeightMsgBank

	.data

_021105BC:
	.word 0x032C ; msg_0812.gmm
	.word 0x004A ; msg_0074.gmm
	.word 0x032E ; msg_0814.gmm
