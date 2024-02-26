	.include "asm/macros.inc"
	.include "unk_0202ED18.inc"
	.include "global.inc"

	.text

	thumb_func_start Save_FollowMon_sizeof
Save_FollowMon_sizeof: ; 0x0202ED18
	mov r0, #8
	bx lr
	thumb_func_end Save_FollowMon_sizeof

	thumb_func_start Save_FollowMon_Init
Save_FollowMon_Init: ; 0x0202ED1C
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end Save_FollowMon_Init

	thumb_func_start Save_FollowMon_Get
Save_FollowMon_Get: ; 0x0202ED34
	ldr r3, _0202ED3C ; =SaveArray_Get
	mov r1, #0x21
	bx r3
	nop
_0202ED3C: .word SaveArray_Get
	thumb_func_end Save_FollowMon_Get

	thumb_func_start Save_FollowMon_SetMapId
Save_FollowMon_SetMapId: ; 0x0202ED40
	str r0, [r1]
	bx lr
	thumb_func_end Save_FollowMon_SetMapId

	thumb_func_start Save_FollowMon_GetMapId
Save_FollowMon_GetMapId: ; 0x0202ED44
	ldr r0, [r0]
	bx lr
	thumb_func_end Save_FollowMon_GetMapId

	thumb_func_start Save_FollowMon_SetUnused2bitField
Save_FollowMon_SetUnused2bitField: ; 0x0202ED48
	ldr r3, [r1, #4]
	mov r2, #3
	bic r3, r2
	mov r2, #3
	and r0, r2
	orr r0, r3
	str r0, [r1, #4]
	bx lr
	thumb_func_end Save_FollowMon_SetUnused2bitField

	thumb_func_start Save_FollowMon_SetInhibitFlagState
Save_FollowMon_SetInhibitFlagState: ; 0x0202ED58
	ldr r3, [r0, #4]
	mov r2, #4
	lsl r1, r1, #0x1f
	bic r3, r2
	lsr r1, r1, #0x1d
	orr r1, r3
	str r1, [r0, #4]
	bx lr
	thumb_func_end Save_FollowMon_SetInhibitFlagState

	thumb_func_start Save_FollowMon_GetInhibitFlagState
Save_FollowMon_GetInhibitFlagState: ; 0x0202ED68
	ldr r0, [r0, #4]
	lsl r0, r0, #0x1d
	asr r0, r0, #0x1f
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end Save_FollowMon_GetInhibitFlagState
