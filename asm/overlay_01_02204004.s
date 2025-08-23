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
	.include "overlay_01_02204004.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_02204004
ov01_02204004: ; 0x02204004
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #0x1c
	add r7, r0, #0
	add r5, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	str r0, [r4, #0x10]
	str r6, [r4, #0x14]
	ldr r0, [sp]
	str r5, [r4, #0x18]
	str r0, [r4, #4]
	add r0, r7, #0
	add r1, r6, #0
	bl AllocFromHeap
	mov r2, #0
	str r0, [r4]
	cmp r6, #0
	ble _0220403E
	mov r1, #0xff
_02204034:
	ldr r0, [r4]
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, r6
	blt _02204034
_0220403E:
	mov r0, #0x5c
	add r6, r5, #0
	mul r6, r0
	add r0, r7, #0
	add r1, r6, #0
	bl AllocFromHeap
	str r0, [r4, #8]
	ldr r1, [r4, #8]
	mov r0, #0
	add r2, r6, #0
	bl MIi_CpuClearFast
	add r0, r7, #0
	lsl r1, r5, #2
	bl AllocFromHeap
	mov r6, #0
	str r0, [r4, #0xc]
	cmp r5, #0
	ble _0220407E
	add r2, r6, #0
	add r3, r6, #0
_0220406C:
	ldr r0, [r4, #8]
	add r6, r6, #1
	add r1, r0, r2
	ldr r0, [r4, #0xc]
	add r2, #0x5c
	str r1, [r0, r3]
	add r3, r3, #4
	cmp r6, r5
	blt _0220406C
_0220407E:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_02204004

	thumb_func_start ov01_02204084
ov01_02204084: ; 0x02204084
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl Heap_Free
	ldr r0, [r4, #8]
	bl Heap_Free
	ldr r0, [r4, #0xc]
	bl Heap_Free
	add r0, r4, #0
	bl Heap_Free
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_02204084

	thumb_func_start ov01_022040A4
ov01_022040A4: ; 0x022040A4
	push {r3, lr}
	add r2, r1, #0
	ldr r3, [r0, #0x10]
	ldr r1, [r0]
	strb r3, [r1, r2]
	ldr r3, [r0, #4]
	lsl r1, r2, #2
	ldr r1, [r3, r1]
	str r1, [sp]
	add r1, sp, #0
	bl ov01_02204168
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_022040A4

	thumb_func_start ov01_022040C0
ov01_022040C0: ; 0x022040C0
	ldr r2, [r0, #0x10]
	sub r3, r2, #1
	str r3, [r0, #0x10]
	ldr r2, [r0, #0xc]
	lsl r0, r3, #2
	str r1, [r2, r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_022040C0

	thumb_func_start Field3dObjectList_GetRenderObjectByID
Field3dObjectList_GetRenderObjectByID: ; 0x022040D0
	ldr r2, [r0]
	ldrb r2, [r2, r1]
	cmp r2, #0xff
	beq _022040E0
	ldr r1, [r0, #0xc]
	lsl r0, r2, #2
	ldr r0, [r1, r0]
	bx lr
_022040E0:
	mov r0, #0
	bx lr
	thumb_func_end Field3dObjectList_GetRenderObjectByID

	thumb_func_start ov01_022040E4
ov01_022040E4: ; 0x022040E4
	push {r3, lr}
	add r2, r1, #0
	ldr r3, [r0, #4]
	lsl r1, r2, #2
	ldr r1, [r3, r1]
	str r1, [sp]
	add r1, sp, #0
	bl ov01_02204168
	pop {r3, pc}
	thumb_func_end ov01_022040E4

	thumb_func_start ov01_022040F8
ov01_022040F8: ; 0x022040F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_02204144
	cmp r0, #0
	beq _02204110
	add r0, r5, #0
	add r1, r4, #0
	bl Field3dObjectList_GetRenderObjectByID
	pop {r3, r4, r5, pc}
_02204110:
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_022040E4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_022040F8

	thumb_func_start ov01_0220411C
ov01_0220411C: ; 0x0220411C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bne _02204128
	mov r0, #0
	pop {r3, r4, r5, pc}
_02204128:
	ldr r1, [r4, #0x58]
	bl ov01_02204144
	cmp r0, #0
	bne _0220413E
	add r0, r5, #0
	add r1, r4, #0
	bl ov01_022040C0
	mov r0, #1
	pop {r3, r4, r5, pc}
_0220413E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_0220411C

	thumb_func_start ov01_02204144
ov01_02204144: ; 0x02204144
	ldr r0, [r0]
	ldrb r0, [r0, r1]
	cmp r0, #0xff
	beq _02204150
	mov r0, #1
	bx lr
_02204150:
	mov r0, #0
	bx lr
	thumb_func_end ov01_02204144

	thumb_func_start ov01_02204154
ov01_02204154: ; 0x02204154
	ldr r2, [r0, #4]
	lsl r0, r1, #2
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _02204162
	mov r0, #1
	bx lr
_02204162:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov01_02204154

	thumb_func_start ov01_02204168
ov01_02204168: ; 0x02204168
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r1]
	add r4, r2, #0
	bl NNS_G3dGetMdlSet
	cmp r0, #0
	beq _02204198
	add r2, r0, #0
	add r2, #8
	beq _0220418C
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _0220418C
	ldrh r1, [r0, #0xe]
	add r1, r2, r1
	add r1, r1, #4
	b _0220418E
_0220418C:
	mov r1, #0
_0220418E:
	cmp r1, #0
	beq _02204198
	ldr r1, [r1]
	add r2, r0, r1
	b _0220419A
_02204198:
	mov r2, #0
_0220419A:
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	str r2, [r0, #0x54]
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0xc]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	ldr r1, [r0, #0x54]
	bl NNS_G3dRenderObjInit
	ldr r1, [r5, #0x10]
	ldr r2, [r5, #0xc]
	lsl r0, r1, #2
	ldr r0, [r2, r0]
	add r1, r1, #1
	str r1, [r5, #0x10]
	str r4, [r0, #0x58]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_02204168

	thumb_func_start ov01_022041C4
ov01_022041C4: ; 0x022041C4
	push {r3, lr}
	mov r1, #0x10
	bl AllocFromHeap
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	pop {r3, pc}
	thumb_func_end ov01_022041C4

	thumb_func_start ov01_022041D8
ov01_022041D8: ; 0x022041D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0x24
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	strh r1, [r4, #0x22]
	strh r7, [r4, #0x20]
	str r1, [r4, #0x1c]
	add r1, r5, #0
	mov r2, #4
	bl GF_ExpHeap_FndInitAllocator
	lsl r6, r7, #5
	add r0, r5, #0
	add r1, r6, #0
	bl AllocFromHeap
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x10]
	mov r0, #0
	add r2, r6, #0
	bl MIi_CpuClearFast
	add r0, r5, #0
	lsl r1, r7, #2
	bl AllocFromHeap
	mov r3, #0
	str r0, [r4, #0x14]
	cmp r7, #0
	ble _02204248
	add r5, r3, #0
	add r6, r3, #0
	add r2, r3, #0
_02204226:
	ldr r0, [r4, #0x10]
	add r3, r3, #1
	add r0, r0, r5
	str r2, [r0, #0x14]
	ldr r0, [r4, #0x10]
	add r0, r0, r5
	str r2, [r0, #4]
	ldr r0, [r4, #0x10]
	str r2, [r0, r5]
	ldr r0, [r4, #0x10]
	add r1, r0, r5
	ldr r0, [r4, #0x14]
	add r5, #0x20
	str r1, [r0, r6]
	add r6, r6, #4
	cmp r3, r7
	blt _02204226
_02204248:
	mov r0, #0
	str r0, [r4, #0x18]
	ldr r0, [sp]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0220425E
	ldr r0, [sp]
	str r4, [r0, #4]
	str r4, [r0, #8]
	str r4, [r0]
	b _02204268
_0220425E:
	ldr r0, [sp]
	ldr r0, [r0, #8]
	str r4, [r0, #0x18]
	ldr r0, [sp]
	str r4, [r0, #8]
_02204268:
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #0xc]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_022041D8

	thumb_func_start ov01_02204278
ov01_02204278: ; 0x02204278
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	cmp r0, #0
	beq _022042F6
	add r1, r0, #0
	ldr r4, [r1, #4]
	cmp r4, #0
	bne _02204292
	bl Heap_Free
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02204292:
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ble _022042F0
_0220429E:
	ldrh r0, [r4, #0x20]
	mov r7, #0
	cmp r0, #0
	ble _022042CC
	add r5, r7, #0
_022042A8:
	ldr r0, [r4, #0x10]
	add r6, r0, r5
	ldr r0, [r6, #0x14]
	cmp r0, #1
	bne _022042C2
	add r0, r4, #0
	add r1, r6, #0
	bl ov01_02204500
	add r0, r4, #0
	add r1, r6, #0
	bl ov01_0220431C
_022042C2:
	ldrh r0, [r4, #0x20]
	add r7, r7, #1
	add r5, #0x20
	cmp r7, r0
	blt _022042A8
_022042CC:
	ldr r0, [r4, #0x10]
	bl Heap_Free
	ldr r0, [r4, #0x14]
	bl Heap_Free
	add r0, r4, #0
	ldr r4, [r4, #0x18]
	bl Heap_Free
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r1, [r0, #0xc]
	ldr r0, [sp, #4]
	cmp r0, r1
	blt _0220429E
_022042F0:
	ldr r0, [sp]
	bl Heap_Free
_022042F6:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_02204278

	thumb_func_start ov01_022042FC
ov01_022042FC: ; 0x022042FC
	push {r3, lr}
	ldrh r2, [r0, #0x22]
	ldrh r1, [r0, #0x20]
	cmp r2, r1
	blo _0220430E
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_0220430E:
	add r1, r2, #1
	strh r1, [r0, #0x22]
	ldr r1, [r0, #0x14]
	lsl r0, r2, #2
	ldr r0, [r1, r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_022042FC

	thumb_func_start ov01_0220431C
ov01_0220431C: ; 0x0220431C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0x22]
	add r4, r1, #0
	cmp r0, #0
	bne _0220432E
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_0220432E:
	sub r0, r0, #1
	strh r0, [r5, #0x22]
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0220433C
	bl Heap_Free
_0220433C:
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #0x14]
	ldrh r0, [r5, #0x22]
	ldr r1, [r5, #0x14]
	lsl r0, r0, #2
	str r4, [r1, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_0220431C

	thumb_func_start ov01_0220434C
ov01_0220434C: ; 0x0220434C
	ldrh r0, [r0, #0x22]
	bx lr
	thumb_func_end ov01_0220434C

	thumb_func_start ov01_02204350
ov01_02204350: ; 0x02204350
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	cmp r0, #0
	beq _022043D4
	ldr r6, [r0, #4]
	cmp r6, #0
	beq _022043D4
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	ble _022043D4
_0220436C:
	ldrh r0, [r6, #0x20]
	mov r7, #0
	cmp r0, #0
	ble _022043C2
	add r5, r7, #0
_02204376:
	ldr r0, [r6, #0x10]
	add r4, r0, r5
	ldr r0, [r4, #0x14]
	cmp r0, #1
	bne _022043B8
	ldr r0, [r4, #0xc]
	cmp r0, #1
	beq _022043B8
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _022043B8
	add r0, r4, #0
	bl ov01_02204594
	mov r0, #0
	ldr r1, [r4, #8]
	mvn r0, r0
	cmp r1, r0
	beq _022043B8
	add r0, r4, #0
	bl ov01_022045DC
	cmp r0, #0
	beq _022043B8
	ldr r0, [r4, #0x18]
	add r1, r0, #1
	ldr r0, [r4, #8]
	cmp r1, r0
	blt _022043B6
	mov r0, #0
	str r0, [r4, #0x1c]
	b _022043B8
_022043B6:
	str r1, [r4, #0x18]
_022043B8:
	ldrh r0, [r6, #0x20]
	add r7, r7, #1
	add r5, #0x20
	cmp r7, r0
	blt _02204376
_022043C2:
	ldr r0, [sp, #4]
	ldr r6, [r6, #0x18]
	add r0, r0, #1
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r1, [r0, #0xc]
	ldr r0, [sp, #4]
	cmp r0, r1
	blt _0220436C
_022043D4:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_02204350

	thumb_func_start ov01_022043D8
ov01_022043D8: ; 0x022043D8
	push {r4, r5, r6, r7}
	cmp r0, #0
	beq _0220441E
	ldr r5, [r0, #4]
	cmp r5, #0
	beq _0220441E
	ldr r1, [r0, #0xc]
	mov r3, #0
	cmp r1, #0
	ble _0220441E
	mov r1, #1
_022043EE:
	ldrh r2, [r5, #0x20]
	mov r4, #0
	cmp r2, #0
	ble _02204414
	add r6, r4, #0
_022043F8:
	ldr r2, [r5, #0x10]
	add r2, r2, r6
	ldr r7, [r2, #0x14]
	cmp r7, #1
	bne _0220440A
	ldr r7, [r2, #0x1c]
	cmp r7, #0
	beq _0220440A
	str r1, [r2, #0xc]
_0220440A:
	ldrh r2, [r5, #0x20]
	add r4, r4, #1
	add r6, #0x20
	cmp r4, r2
	blt _022043F8
_02204414:
	ldr r2, [r0, #0xc]
	add r3, r3, #1
	ldr r5, [r5, #0x18]
	cmp r3, r2
	blt _022043EE
_0220441E:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_022043D8

	thumb_func_start ov01_02204424
ov01_02204424: ; 0x02204424
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	cmp r0, #0
	beq _0220446E
	ldr r4, [r0, #4]
	cmp r4, #0
	beq _0220446E
	ldr r0, [r0, #0xc]
	mov r7, #0
	cmp r0, #0
	ble _0220446E
_0220443A:
	ldrh r0, [r4, #0x20]
	mov r6, #0
	cmp r0, #0
	ble _02204462
	add r5, r6, #0
_02204444:
	ldr r0, [r4, #0x10]
	add r0, r0, r5
	ldr r1, [r0, #0x14]
	cmp r1, #1
	bne _02204458
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	beq _02204458
	bl ov01_022044E0
_02204458:
	ldrh r0, [r4, #0x20]
	add r6, r6, #1
	add r5, #0x20
	cmp r6, r0
	blt _02204444
_02204462:
	ldr r0, [sp]
	add r7, r7, #1
	ldr r0, [r0, #0xc]
	ldr r4, [r4, #0x18]
	cmp r7, r0
	blt _0220443A
_0220446E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_02204424

	thumb_func_start ov01_02204470
ov01_02204470: ; 0x02204470
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	str r0, [sp]
	add r5, r1, #0
	add r0, r4, #0
	mov r1, #0
	add r6, r3, #0
	bl NNS_G3dGetAnmByIdx
	add r7, r0, #0
	bne _0220448A
	bl GF_AssertFail
_0220448A:
	ldr r0, [sp]
	add r1, r7, #0
	add r2, r6, #0
	bl NNS_G3dAllocAnmObj
	str r0, [r5]
	cmp r0, #0
	bne _0220449E
	bl GF_AssertFail
_0220449E:
	ldr r0, [r5]
	ldr r3, [sp, #0x18]
	add r1, r7, #0
	add r2, r6, #0
	bl NNS_G3dAnmObjInit
	str r4, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_02204470

	thumb_func_start ov01_022044B0
ov01_022044B0: ; 0x022044B0
	push {r4, r5, r6, lr}
	ldr r6, [r0, #0x1c]
	add r5, r1, #0
	add r4, r2, #0
	cmp r6, #0
	beq _022044C0
	blx r6
	str r4, [r5, #4]
_022044C0:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_022044B0

	thumb_func_start ov01_022044C4
ov01_022044C4: ; 0x022044C4
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end ov01_022044C4

	thumb_func_start ov01_022044C8
ov01_022044C8: ; 0x022044C8
	push {r3, r4}
	mov r4, #0
	str r4, [r0, #0x18]
	mov r4, #1
	str r4, [r0, #0x1c]
	str r4, [r0, #0x14]
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	str r3, [r0, #0x10]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_022044C8

	thumb_func_start ov01_022044E0
ov01_022044E0: ; 0x022044E0
	ldr r1, [r0, #0x10]
	cmp r1, #0
	bne _022044EE
	ldr r0, [r0]
	mov r1, #0
	str r1, [r0]
	bx lr
_022044EE:
	ldr r2, [r0]
	ldr r0, [r2, #8]
	ldrh r0, [r0, #4]
	lsl r1, r0, #0xc
	mov r0, #1
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [r2]
	bx lr
	thumb_func_end ov01_022044E0

	thumb_func_start ov01_02204500
ov01_02204500: ; 0x02204500
	ldr r3, _02204508 ; =NNS_G3dFreeAnmObj
	ldr r1, [r1]
	bx r3
	nop
_02204508: .word NNS_G3dFreeAnmObj
	thumb_func_end ov01_02204500

	thumb_func_start ov01_0220450C
ov01_0220450C: ; 0x0220450C
	ldr r3, _02204514 ; =NNS_G3dRenderObjAddAnmObj
	ldr r1, [r1]
	bx r3
	nop
_02204514: .word NNS_G3dRenderObjAddAnmObj
	thumb_func_end ov01_0220450C

	thumb_func_start ov01_02204518
ov01_02204518: ; 0x02204518
	push {r3, lr}
	cmp r1, #0
	bne _02204522
	mov r0, #0
	pop {r3, pc}
_02204522:
	ldr r1, [r1]
	cmp r1, #0
	bne _0220452C
	mov r0, #0
	pop {r3, pc}
_0220452C:
	cmp r0, #0
	bne _02204534
	mov r0, #0
	pop {r3, pc}
_02204534:
	ldr r2, [r0, #8]
	cmp r2, #0
	bne _0220454A
	ldr r2, [r0, #0x10]
	cmp r2, #0
	bne _0220454A
	ldr r2, [r0, #0x18]
	cmp r2, #0
	bne _0220454A
	mov r0, #0
	pop {r3, pc}
_0220454A:
	bl NNS_G3dRenderObjRemoveAnmObj
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_02204518

	thumb_func_start ov01_02204554
ov01_02204554: ; 0x02204554
	ldr r0, [r0, #8]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end ov01_02204554

	thumb_func_start ov01_0220455C
ov01_0220455C: ; 0x0220455C
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov01_0220455C

	thumb_func_start ov01_02204560
ov01_02204560: ; 0x02204560
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	bne _0220456A
	mov r0, #1
	bx lr
_0220456A:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov01_02204560

	thumb_func_start ov01_02204570
ov01_02204570: ; 0x02204570
	ldr r1, [r0, #0x10]
	cmp r1, #0
	bne _02204588
	ldr r2, [r0]
	ldr r0, [r2, #8]
	ldrh r0, [r0, #4]
	lsl r1, r0, #0xc
	mov r0, #1
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [r2]
	bx lr
_02204588:
	ldr r0, [r0]
	mov r1, #0
	str r1, [r0]
	bx lr
	thumb_func_end ov01_02204570

	thumb_func_start ov01_02204590
ov01_02204590: ; 0x02204590
	str r1, [r0, #8]
	bx lr
	thumb_func_end ov01_02204590

	thumb_func_start ov01_02204594
ov01_02204594: ; 0x02204594
	ldr r1, [r0, #0x10]
	cmp r1, #0
	bne _022045BA
	ldr r3, [r0]
	mov r1, #1
	ldr r2, [r3]
	lsl r1, r1, #0xc
	add r1, r2, r1
	str r1, [r3]
	ldr r2, [r0]
	ldr r0, [r2, #8]
	ldr r1, [r2]
	ldrh r0, [r0, #4]
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _022045DA
	mov r0, #0
	str r0, [r2]
	bx lr
_022045BA:
	ldr r0, [r0]
	ldr r2, [r0]
	cmp r2, #0
	bgt _022045D2
	ldr r1, [r0, #8]
	ldrh r1, [r1, #4]
	lsl r2, r1, #0xc
	mov r1, #1
	lsl r1, r1, #0xc
	sub r1, r2, r1
	str r1, [r0]
	bx lr
_022045D2:
	mov r1, #1
	lsl r1, r1, #0xc
	sub r1, r2, r1
	str r1, [r0]
_022045DA:
	bx lr
	thumb_func_end ov01_02204594

	thumb_func_start ov01_022045DC
ov01_022045DC: ; 0x022045DC
	ldr r1, [r0, #0x10]
	ldr r0, [r0]
	cmp r1, #0
	bne _022045FE
	ldr r2, [r0]
	ldr r0, [r0, #8]
	ldrh r0, [r0, #4]
	lsl r1, r0, #0xc
	mov r0, #1
	lsl r0, r0, #0xc
	sub r0, r1, r0
	cmp r2, r0
	blt _022045FA
	mov r0, #1
	bx lr
_022045FA:
	mov r0, #0
	bx lr
_022045FE:
	ldr r0, [r0]
	cmp r0, #0
	bne _02204608
	mov r0, #1
	bx lr
_02204608:
	mov r0, #0
	bx lr
	thumb_func_end ov01_022045DC

	thumb_func_start ov01_0220460C
ov01_0220460C: ; 0x0220460C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #4
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #4
	mov r2, #1
	bl ov01_022041D8
	ldr r1, _02204630 ; =ov01_022046A4
	str r0, [r4]
	bl ov01_022044C4
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02204630: .word ov01_022046A4
	thumb_func_end ov01_0220460C

	thumb_func_start ov01_02204634
ov01_02204634: ; 0x02204634
	ldr r3, _02204638 ; =Heap_Free
	bx r3
	.balign 4, 0
_02204638: .word Heap_Free
	thumb_func_end ov01_02204634

	thumb_func_start ov01_0220463C
ov01_0220463C: ; 0x0220463C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl ov01_022042FC
	add r4, r0, #0
	bne _02204650
	bl GF_AssertFail
_02204650:
	mov r1, #0
	mov r2, #0
	add r0, r4, #0
	mvn r1, r1
	add r3, r2, #0
	bl ov01_022044C8
	mov r0, #0x8c
	add r1, r6, #0
	mov r2, #4
	bl AllocAndReadWholeNarcMemberByIdPair
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	mov r3, #0
	bl ov01_022044B0
	str r4, [r5, #4]
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_0220463C

	thumb_func_start ov01_02204678
ov01_02204678: ; 0x02204678
	ldr r3, _02204684 ; =ov01_0220450C
	add r2, r0, #0
	add r0, r1, #0
	ldr r1, [r2, #4]
	bx r3
	nop
_02204684: .word ov01_0220450C
	thumb_func_end ov01_02204678

	thumb_func_start ov01_02204688
ov01_02204688: ; 0x02204688
	ldr r3, _02204694 ; =ov01_02204518
	add r2, r0, #0
	add r0, r1, #0
	ldr r1, [r2, #4]
	bx r3
	nop
_02204694: .word ov01_02204518
	thumb_func_end ov01_02204688

	thumb_func_start ov01_02204698
ov01_02204698: ; 0x02204698
	ldr r3, _022046A0 ; =ov01_0220434C
	ldr r0, [r0]
	bx r3
	nop
_022046A0: .word ov01_0220434C
	thumb_func_end ov01_02204698

	thumb_func_start ov01_022046A4
ov01_022046A4: ; 0x022046A4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r0, r2, #0
	mov r1, #0
	bl NNS_G3dGetAnmByIdx
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl ov01_022046D4
	add r1, r4, #0
	str r0, [r5]
	bl ov01_02204728
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_022046A4

	thumb_func_start ov01_022046C8
ov01_022046C8: ; 0x022046C8
	ldrb r0, [r0, #9]
	mov r1, #3
	lsl r0, r0, #1
	add r0, #0x1c
	bic r0, r1
	bx lr
	thumb_func_end ov01_022046C8

	thumb_func_start ov01_022046D4
ov01_022046D4: ; 0x022046D4
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl ov01_022046C8
	add r1, r0, #0
	add r0, r4, #0
	bl NNS_FndAllocFromAllocator
	pop {r4, pc}
	thumb_func_end ov01_022046D4

	thumb_func_start ov01_022046E8
ov01_022046E8: ; 0x022046E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02204724 ; =_02110A0C
	add r4, r1, #0
	ldr r0, [r0]
	add r1, r5, #0
	str r0, [r5, #0xc]
	ldrb r2, [r4, #9]
	mov r0, #0
	add r1, #0x1a
	strb r2, [r5, #0x19]
	lsl r2, r2, #1
	bl MIi_CpuClear16
	ldrb r0, [r4, #9]
	mov r2, #0
	cmp r0, #0
	bls _02204720
	mov r0, #1
	lsl r0, r0, #8
_02204710:
	add r1, r2, #0
	orr r1, r0
	strh r1, [r5, #0x1a]
	ldrb r1, [r4, #9]
	add r2, r2, #1
	add r5, r5, #2
	cmp r2, r1
	blo _02204710
_02204720:
	pop {r3, r4, r5, pc}
	nop
_02204724: .word _02110A0C
	thumb_func_end ov01_022046E8

	thumb_func_start ov01_02204728
ov01_02204728: ; 0x02204728
	mov r3, #0
	str r3, [r0]
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	mov r2, #0x7f
	strb r2, [r0, #0x18]
	mov r2, #1
	lsl r2, r2, #0xc
	str r2, [r0, #4]
	str r3, [r0, #0x14]
	ldr r3, _02204740 ; =ov01_022046E8
	bx r3
	.balign 4, 0
_02204740: .word ov01_022046E8
	thumb_func_end ov01_02204728

	thumb_func_start ov01_02204744
ov01_02204744: ; 0x02204744
	push {r4, lr}
	mov r1, #0x78
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x78
	bl MIi_CpuClearFast
	bl GF_RTC_GetTimeOfDay
	str r0, [r4]
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_02204744

	thumb_func_start ov01_02204764
ov01_02204764: ; 0x02204764
	ldr r3, _02204768 ; =Heap_Free
	bx r3
	.balign 4, 0
_02204768: .word Heap_Free
	thumb_func_end ov01_02204764

	thumb_func_start ov01_0220476C
ov01_0220476C: ; 0x0220476C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	ldr r1, [r5, #4]
	add r4, r2, #0
	add r6, r3, #0
	cmp r1, #4
	bge _022047D4
	mov r0, #0x1c
	mul r0, r1
	add r0, r5, r0
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0220478C
	bl GF_AssertFail
_0220478C:
	cmp r6, #4
	ble _02204794
	bl GF_AssertFail
_02204794:
	ldr r2, [r5, #4]
	add r1, r5, #0
	mov r0, #0x1c
	add r1, #8
	mul r0, r2
	mov r3, #1
	add r2, r1, r0
	str r3, [r1, r0]
	str r6, [r2, #4]
	cmp r6, #4
	ble _022047AE
	mov r0, #4
	str r0, [r2, #4]
_022047AE:
	ldr r1, [r2, #4]
	mov r0, #0
	cmp r1, #0
	ble _022047CA
_022047B6:
	lsl r1, r0, #2
	ldr r3, [r4, r1]
	add r1, r2, r1
	add r0, r0, #1
	str r3, [r1, #8]
	lsl r0, r0, #0x18
	ldr r1, [r2, #4]
	lsr r0, r0, #0x18
	cmp r0, r1
	blt _022047B6
_022047CA:
	str r7, [r2, #0x18]
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_022047D4:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_0220476C

	thumb_func_start ov01_022047DC
ov01_022047DC: ; 0x022047DC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl GF_RTC_GetTimeOfDay
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [r5]
	cmp r0, r7
	beq _0220482E
	lsl r0, r0, #0x18
	add r4, r5, #0
	lsr r0, r0, #0x18
	str r7, [r5]
	mov r6, #0
	add r4, #8
	str r0, [sp]
_022047FC:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02204824
	ldr r2, _02204830 ; =ov01_022095EC
	ldr r1, [sp]
	ldr r0, [r4, #0x18]
	ldrb r1, [r2, r1]
	lsl r1, r1, #2
	add r1, r1, r4
	ldr r1, [r1, #8]
	bl ov01_02204518
	ldr r1, _02204830 ; =ov01_022095EC
	ldr r0, [r4, #0x18]
	ldrb r1, [r1, r7]
	lsl r1, r1, #2
	add r1, r1, r4
	ldr r1, [r1, #8]
	bl ov01_0220450C
_02204824:
	add r6, r6, #1
	add r5, #0x1c
	add r4, #0x1c
	cmp r6, #4
	blt _022047FC
_0220482E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02204830: .word ov01_022095EC
	thumb_func_end ov01_022047DC

	thumb_func_start ov01_02204834
ov01_02204834: ; 0x02204834
	ldr r1, [r0]
	ldr r0, _0220483C ; =ov01_022095EC
	ldrb r0, [r0, r1]
	bx lr
	.balign 4, 0
_0220483C: .word ov01_022095EC
	thumb_func_end ov01_02204834

	.rodata

ov01_022095EC: ; 0x022095EC
	.byte 0, 1, 2, 3, 3

