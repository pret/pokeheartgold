#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "constants/party_menu.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020689C8
sub_020689C8: ; 0x020689C8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl sub_02068C08
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02068C38
	str r0, [r4, #0xc]
	str r6, [r4]
	str r5, [r4, #8]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020689C8

	thumb_func_start sub_020689E8
sub_020689E8: ; 0x020689E8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068C5C
	add r0, r4, #0
	bl sub_02068C2C
	pop {r4, pc}
	thumb_func_end sub_020689E8

	thumb_func_start sub_020689F8
sub_020689F8: ; 0x020689F8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068B80
	add r0, r4, #0
	bl sub_020689E8
	pop {r4, pc}
	thumb_func_end sub_020689F8

	thumb_func_start sub_02068A08
sub_02068A08: ; 0x02068A08
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	add r7, r1, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	mov r4, #0
	bl sub_02068CC4
	add r6, r0, #0
	ldr r0, [sp]
	bl sub_02068CC8
	add r5, r0, #0
_02068A24:
	add r0, r5, #0
	bl sub_02068CCC
	cmp r0, #0
	beq _02068A36
	add r4, r4, #1
	add r5, #0xc8
	cmp r4, r6
	blt _02068A24
_02068A36:
	cmp r4, r6
	blt _02068A40
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02068A40:
	add r0, r5, #0
	bl sub_02068CD8
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl sub_02068D8C
	ldr r1, [sp, #0x30]
	add r0, r5, #0
	bl sub_02068D94
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_02068DA4
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02068A6E
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl sub_02068DA8
	b _02068A7E
_02068A6E:
	add r1, sp, #0xc
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r5, #0
	bl sub_02068DA8
_02068A7E:
	ldr r1, [r7]
	add r0, r5, #0
	bl sub_02068D78
	ldr r1, [r7, #4]
	add r0, r5, #0
	bl sub_02068CF4
	ldr r1, [r7, #8]
	add r0, r5, #0
	bl sub_02068D48
	ldr r1, [r7, #0xc]
	add r0, r5, #0
	bl sub_02068D10
	ldr r1, [r7, #0x10]
	add r0, r5, #0
	bl sub_02068D2C
	ldr r1, [r7, #0x14]
	add r0, r5, #0
	bl sub_02068D64
	ldr r1, [r7, #0x18]
	add r0, r5, #0
	bl sub_02068D6C
	ldr r1, [sp, #0x34]
	add r0, r5, #0
	bl sub_02068BDC
	add r4, r0, #0
	bne _02068ACE
	add r0, r5, #0
	bl sub_02068C6C
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02068ACE:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02068D9C
	add r0, r5, #0
	bl sub_02068CFC
	cmp r0, #0
	bne _02068AF2
	add r0, r4, #0
	bl DestroySysTask
	add r0, r5, #0
	bl sub_02068C6C
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02068AF2:
	add r0, r5, #0
	mov r1, #2
	bl sub_02068CE4
	ldr r0, [sp]
	ldr r0, [r0, #4]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
	add r0, r5, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02068A08

	thumb_func_start sub_02068B0C
sub_02068B0C: ; 0x02068B0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r1, #0
	add r6, r0, #0
	add r4, sp, #8
	ldmia r5!, {r0, r1}
	add r7, r4, #0
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	add r1, r7, #0
	str r0, [r4]
	ldr r0, _02068B40 ; =sub_02068DD8
	str r0, [sp, #0x1c]
	ldr r0, _02068B44 ; =sub_02068DDC
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x38]
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #4]
	add r0, r6, #0
	bl sub_02068A08
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02068B40: .word sub_02068DD8
_02068B44: .word sub_02068DDC
	thumb_func_end sub_02068B0C

	thumb_func_start sub_02068B48
sub_02068B48: ; 0x02068B48
	push {r4, lr}
	add r4, r0, #0
	bne _02068B52
	bl GF_AssertFail
_02068B52:
	add r0, r4, #0
	bl sub_02068CCC
	cmp r0, #0
	beq _02068B7E
	add r0, r4, #0
	bl sub_02068D50
	ldr r1, [r4, #0x14]
	ldr r0, [r1, #4]
	sub r0, r0, #1
	str r0, [r1, #4]
	add r0, r4, #0
	bl sub_02068DA0
	cmp r0, #0
	beq _02068B78
	bl DestroySysTask
_02068B78:
	add r0, r4, #0
	bl sub_02068C6C
_02068B7E:
	pop {r4, pc}
	thumb_func_end sub_02068B48

	thumb_func_start sub_02068B80
sub_02068B80: ; 0x02068B80
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02068CC4
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02068CC8
	add r5, r0, #0
_02068B92:
	add r0, r5, #0
	bl sub_02068CCC
	cmp r0, #1
	bne _02068BA2
	add r0, r5, #0
	bl sub_02068B48
_02068BA2:
	add r5, #0xc8
	sub r4, r4, #1
	bne _02068B92
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02068B80

	thumb_func_start sub_02068BAC
sub_02068BAC: ; 0x02068BAC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_02068CC4
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02068CC8
	add r5, r0, #0
	mov r6, #3
_02068BC0:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02068CEC
	cmp r0, #3
	bne _02068BD2
	add r0, r5, #0
	bl sub_02068D34
_02068BD2:
	add r5, #0xc8
	sub r4, r4, #1
	bne _02068BC0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02068BAC

	thumb_func_start sub_02068BDC
sub_02068BDC: ; 0x02068BDC
	push {r4, lr}
	add r3, r0, #0
	add r2, r1, #0
	ldr r0, _02068BF8 ; =sub_02068BFC
	add r1, r3, #0
	bl CreateSysTask
	add r4, r0, #0
	bne _02068BF2
	bl GF_AssertFail
_02068BF2:
	add r0, r4, #0
	pop {r4, pc}
	nop
_02068BF8: .word sub_02068BFC
	thumb_func_end sub_02068BDC

	thumb_func_start sub_02068BFC
sub_02068BFC: ; 0x02068BFC
	ldr r3, _02068C04 ; =sub_02068D18
	add r0, r1, #0
	bx r3
	nop
_02068C04: .word sub_02068D18
	thumb_func_end sub_02068BFC

	thumb_func_start sub_02068C08
sub_02068C08: ; 0x02068C08
	push {r4, lr}
	mov r1, #0x10
	bl AllocFromHeap
	add r4, r0, #0
	bne _02068C18
	bl GF_AssertFail
_02068C18:
	add r2, r4, #0
	mov r1, #0x10
	mov r0, #0
_02068C1E:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02068C1E
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02068C08

	thumb_func_start sub_02068C2C
sub_02068C2C: ; 0x02068C2C
	ldr r3, _02068C34 ; =FreeToHeapExplicit
	add r1, r0, #0
	ldr r0, [r1, #8]
	bx r3
	.balign 4, 0
_02068C34: .word FreeToHeapExplicit
	thumb_func_end sub_02068C2C

	thumb_func_start sub_02068C38
sub_02068C38: ; 0x02068C38
	push {r3, r4, r5, lr}
	mov r2, #0xc8
	add r5, r1, #0
	mul r5, r2
	add r1, r5, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _02068C4E
	bl GF_AssertFail
_02068C4E:
	add r0, r4, #0
	mov r1, #0
	add r2, r5, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02068C38

	thumb_func_start sub_02068C5C
sub_02068C5C: ; 0x02068C5C
	ldr r3, _02068C68 ; =FreeToHeapExplicit
	add r1, r0, #0
	ldr r0, [r1, #8]
	ldr r1, [r1, #0xc]
	bx r3
	nop
_02068C68: .word FreeToHeapExplicit
	thumb_func_end sub_02068C5C

	thumb_func_start sub_02068C6C
sub_02068C6C: ; 0x02068C6C
	push {r4, lr}
	mov r1, #0
	mov r2, #0xc8
	add r4, r0, #0
	bl memset
	ldr r1, _02068CAC ; =sub_02068DC8
	add r0, r4, #0
	bl sub_02068CF4
	ldr r1, _02068CB0 ; =sub_02068DD4
	add r0, r4, #0
	bl sub_02068D48
	ldr r1, _02068CB4 ; =sub_02068DCC
	add r0, r4, #0
	bl sub_02068D10
	ldr r1, _02068CB8 ; =sub_02068DD0
	add r0, r4, #0
	bl sub_02068D2C
	ldr r1, _02068CBC ; =sub_02068DD8
	add r0, r4, #0
	bl sub_02068D64
	ldr r1, _02068CC0 ; =sub_02068DDC
	add r0, r4, #0
	bl sub_02068D6C
	pop {r4, pc}
	nop
_02068CAC: .word sub_02068DC8
_02068CB0: .word sub_02068DD4
_02068CB4: .word sub_02068DCC
_02068CB8: .word sub_02068DD0
_02068CBC: .word sub_02068DD8
_02068CC0: .word sub_02068DDC
	thumb_func_end sub_02068C6C

	thumb_func_start sub_02068CC4
sub_02068CC4: ; 0x02068CC4
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_02068CC4

	thumb_func_start sub_02068CC8
sub_02068CC8: ; 0x02068CC8
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_02068CC8

	thumb_func_start sub_02068CCC
sub_02068CCC: ; 0x02068CCC
	ldr r1, [r0]
	mov r0, #1
	tst r1, r0
	bne _02068CD6
	mov r0, #0
_02068CD6:
	bx lr
	thumb_func_end sub_02068CCC

	thumb_func_start sub_02068CD8
sub_02068CD8: ; 0x02068CD8
	ldr r2, [r0]
	mov r1, #1
	orr r1, r2
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068CD8

	thumb_func_start sub_02068CE4
sub_02068CE4: ; 0x02068CE4
	ldr r2, [r0]
	orr r1, r2
	str r1, [r0]
	bx lr
	thumb_func_end sub_02068CE4

	thumb_func_start sub_02068CEC
sub_02068CEC: ; 0x02068CEC
	ldr r0, [r0]
	and r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068CEC

	thumb_func_start sub_02068CF4
sub_02068CF4: ; 0x02068CF4
	add r0, #0xb0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068CF4

	thumb_func_start sub_02068CFC
sub_02068CFC: ; 0x02068CFC
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068D74
	add r1, r0, #0
	add r0, r4, #0
	add r4, #0xb0
	ldr r2, [r4]
	blx r2
	pop {r4, pc}
	thumb_func_end sub_02068CFC

	thumb_func_start sub_02068D10
sub_02068D10: ; 0x02068D10
	add r0, #0xb4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068D10

	thumb_func_start sub_02068D18
sub_02068D18: ; 0x02068D18
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068D74
	add r1, r0, #0
	add r0, r4, #0
	add r4, #0xb4
	ldr r2, [r4]
	blx r2
	pop {r4, pc}
	thumb_func_end sub_02068D18

	thumb_func_start sub_02068D2C
sub_02068D2C: ; 0x02068D2C
	add r0, #0xb8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068D2C

	thumb_func_start sub_02068D34
sub_02068D34: ; 0x02068D34
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068D74
	add r1, r0, #0
	add r0, r4, #0
	add r4, #0xb8
	ldr r2, [r4]
	blx r2
	pop {r4, pc}
	thumb_func_end sub_02068D34

	thumb_func_start sub_02068D48
sub_02068D48: ; 0x02068D48
	add r0, #0xbc
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068D48

	thumb_func_start sub_02068D50
sub_02068D50: ; 0x02068D50
	push {r4, lr}
	add r4, r0, #0
	bl sub_02068D74
	add r1, r0, #0
	add r0, r4, #0
	add r4, #0xbc
	ldr r2, [r4]
	blx r2
	pop {r4, pc}
	thumb_func_end sub_02068D50

	thumb_func_start sub_02068D64
sub_02068D64: ; 0x02068D64
	add r0, #0xc0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068D64

	thumb_func_start sub_02068D6C
sub_02068D6C: ; 0x02068D6C
	add r0, #0xc4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068D6C

	thumb_func_start sub_02068D74
sub_02068D74: ; 0x02068D74
	add r0, #0x30
	bx lr
	thumb_func_end sub_02068D74

	thumb_func_start sub_02068D78
sub_02068D78: ; 0x02068D78
	push {r4, lr}
	add r4, r1, #0
	bl sub_02068D74
	mov r1, #0
	add r2, r4, #0
	bl memset
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02068D78

	thumb_func_start sub_02068D8C
sub_02068D8C: ; 0x02068D8C
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_02068D8C

	thumb_func_start sub_02068D90
sub_02068D90: ; 0x02068D90
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_02068D90

	thumb_func_start sub_02068D94
sub_02068D94: ; 0x02068D94
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end sub_02068D94

	thumb_func_start sub_02068D98
sub_02068D98: ; 0x02068D98
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_02068D98

	thumb_func_start sub_02068D9C
sub_02068D9C: ; 0x02068D9C
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end sub_02068D9C

	thumb_func_start sub_02068DA0
sub_02068DA0: ; 0x02068DA0
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_02068DA0

	thumb_func_start sub_02068DA4
sub_02068DA4: ; 0x02068DA4
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end sub_02068DA4

	thumb_func_start sub_02068DA8
sub_02068DA8: ; 0x02068DA8
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x24
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_02068DA8

	thumb_func_start sub_02068DB8
sub_02068DB8: ; 0x02068DB8
	add r2, r0, #0
	add r2, #0x24
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end sub_02068DB8

	thumb_func_start sub_02068DC8
sub_02068DC8: ; 0x02068DC8
	mov r0, #1
	bx lr
	thumb_func_end sub_02068DC8

	thumb_func_start sub_02068DCC
sub_02068DCC: ; 0x02068DCC
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068DCC

	thumb_func_start sub_02068DD0
sub_02068DD0: ; 0x02068DD0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068DD0

	thumb_func_start sub_02068DD4
sub_02068DD4: ; 0x02068DD4
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068DD4

	thumb_func_start sub_02068DD8
sub_02068DD8: ; 0x02068DD8
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068DD8

	thumb_func_start sub_02068DDC
sub_02068DDC: ; 0x02068DDC
	bx lr
	.balign 4, 0
	thumb_func_end sub_02068DDC
