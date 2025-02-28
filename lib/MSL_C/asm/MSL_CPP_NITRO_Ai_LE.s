	.include "asm/macros.inc"
	.include "MSL_CPP_NITRO_Ai_LE.inc"
	.include "global.inc"

	.data

	; this entire file is a bit of a guess

	.balign 4, 0
	.public _02111504
_02111504:
	.word _021117F4
	.word _02111528
_0211150C:
	.word _021117F4
	.word _0211158C
_02111514:
	.word _021117F4
	.word _02111568
_0211151C:
	.word _021117E4
	.word _021115B8
	.word _0211150C
_02111528:
	.asciz "St9exception"
	.balign 4, 0
_02111538:
	.word 0
	.word _0211150C
_02111540:
	.word _ZNSt9exceptionD1Ev
	.word _ZNSt9exceptionD0Ev
	.word 0
	.word 0
	.word 0
	.word _0211151C
_02111558:
	.word _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED1Ev
	.word _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED0Ev
	.word _ZNKSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE11get_deleterERKSt9type_info
	.word _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE7disposeEv
_02111568:
	.asciz "NSt6detail14default_deleteIA0_cEE"
	.balign 4, 0
_0211158C:
	.asciz "NSt3tr16detail25shared_ptr_deleter_commonE"
	.balign 4, 0
_021115B8:
	.asciz "NSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEEE"
	.balign 4, 0
_02111600:
	.word _021117E4
	.word _02111618
	.word _02111504
_0211160C:
	.word _021117E4
	.word _02111628
	.word _02111600
_02111618:
	.asciz "St11logic_error"
	.balign 4, 0
_02111628:
	.asciz "St12length_error"
	.balign 4, 0
_0211163C:
	.word 0
	.word _0211160C
_02111644:
	.word _ZNSt12length_errorD1Ev
	.word _ZNSt12length_errorD0Ev
	.word _ZNSt3tr16detail25shared_ptr_deleter_commonD2Ev
	.word 0
	.word _02111600
_02111658:
	.word _ZNSt11logic_errorD1Ev
	.word _ZNSt11logic_errorD0Ev
	.word _ZNSt3tr16detail25shared_ptr_deleter_commonD2Ev
_02111664:
	.asciz "vector length error"
	.balign 4, 0
_02111678:
	.asciz "!std::exception!!std::logic_error!!std::length_error!!"

	.text

	arm_func_start _ZNSt9exceptionD2Ev
_ZNSt9exceptionD2Ev: ; 0x020F03DC
	bx lr
	arm_func_end _ZNSt9exceptionD2Ev

	arm_func_start _ZNSt3tr110shared_ptrIcEC1IcNSt6detail14default_deleteIA0_cEEEEPT_T0_
_ZNSt3tr110shared_ptrIcEC1IcNSt6detail14default_deleteIA0_cEEEEPT_T0_: ; 0x020F03E0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	str r4, [r5]
	add r1, sp, #0x20
	mov r0, #0x10
	str r4, [sp]
	str r1, [sp, #4]
	bl _Znwm
	cmp r0, #0
	beq _020F0430
	ldr r1, _020F0458 ; =_02111540
	mov r2, #1
	stmia r0, {r1, r2}
	ldr r1, _020F045C ; =_02111558
	str r2, [r0, #8]
	str r1, [r0]
	str r4, [r0, #0xc]
_020F0430:
	str r0, [r5, #4]
	mov r1, #0
	add r0, sp, #0
	str r1, [sp]
	bl _ZN10Metrowerks8move_ptrIcRNSt6detail14default_deleteIA0_cEEED1Ev
	mov r0, r5
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020F0458: .word _02111540
_020F045C: .word _02111558
	arm_func_end _ZNSt3tr110shared_ptrIcEC1IcNSt6detail14default_deleteIA0_cEEEEPT_T0_

	arm_func_start _ZNSt9exceptionD0Ev
_ZNSt9exceptionD0Ev: ; 0x020F0460
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt9exceptionD0Ev

	arm_func_start _ZNSt9exceptionD1Ev
_ZNSt9exceptionD1Ev: ; 0x020F0474
	bx lr
	arm_func_end _ZNSt9exceptionD1Ev

	arm_func_start _ZNKSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE11get_deleterERKSt9type_info
_ZNKSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE11get_deleterERKSt9type_info: ; 0x020F0478
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	ldr r1, _020F049C ; =_02111514
	bl _ZNKSt9type_infoeqERKS_
	cmp r0, #0
	addne r0, r4, #0xc
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020F049C: .word _02111514
	arm_func_end _ZNKSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE11get_deleterERKSt9type_info

	arm_func_start _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE7disposeEv
_ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE7disposeEv: ; 0x020F04A0
	ldr ip, _020F04AC ; =_ZdaPv
	ldr r0, [r0, #0xc]
	bx ip
	.align 2, 0
_020F04AC: .word _ZdaPv
	arm_func_end _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE7disposeEv

	arm_func_start _ZNSt3tr110shared_ptrIcED1Ev
_ZNSt3tr110shared_ptrIcED1Ev: ; 0x020F04B0
	stmdb sp!, {r3, r4, fp, lr}
	sub sp, sp, #0x18
	mov fp, sp
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _020F04D0
	bl _ZNSt3tr16detail25shared_ptr_deleter_common7releaseEv
_020F04D0:
	add sp, fp, #0x18
	mov r0, r4
	ldmia sp!, {r3, r4, fp, pc}
_020F04DC: ; 0x020F04DC
	add r0, fp, #0
	bl __unexpected
_020F04E4:
	b _020F04E4
_020F04E8: ; 0x020F04E8
	add sp, fp, #0x18
	ldmia sp!, {r3, r4, fp, pc}
	arm_func_end _ZNSt3tr110shared_ptrIcED1Ev

	arm_func_start _ZN10Metrowerks8move_ptrIcRNSt6detail14default_deleteIA0_cEEED1Ev
_ZN10Metrowerks8move_ptrIcRNSt6detail14default_deleteIA0_cEEED1Ev: ; 0x020F04F0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _020F0508
	bl _ZdaPv
_020F0508:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZN10Metrowerks8move_ptrIcRNSt6detail14default_deleteIA0_cEEED1Ev

	arm_func_start _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED0Ev
_ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED0Ev: ; 0x020F0510
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED0Ev

	arm_func_start _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED1Ev
_ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED1Ev: ; 0x020F0524
	bx lr
	arm_func_end _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED1Ev

	arm_func_start _ZNSt3tr16detail25shared_ptr_deleter_commonD2Ev
_ZNSt3tr16detail25shared_ptr_deleter_commonD2Ev: ; 0x020F0528
	ldr r0, [r0, #4]
	bx lr
	arm_func_end _ZNSt3tr16detail25shared_ptr_deleter_commonD2Ev

	arm_func_start _ZNSt11logic_errorD1Ev
_ZNSt11logic_errorD1Ev: ; 0x020F0530
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #4
	bl _ZNSt3tr110shared_ptrIcED1Ev
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt11logic_errorD1Ev

	arm_func_start _ZNSt11logic_errorD0Ev
_ZNSt11logic_errorD0Ev: ; 0x020F0548
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #4
	bl _ZNSt3tr110shared_ptrIcED1Ev
	mov r0, r4
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt11logic_errorD0Ev

	arm_func_start _ZNSt12length_errorD1Ev
_ZNSt12length_errorD1Ev: ; 0x020F0568
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #4
	bl _ZNSt3tr110shared_ptrIcED1Ev
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt12length_errorD1Ev

	arm_func_start _ZNSt12length_errorD0Ev
_ZNSt12length_errorD0Ev: ; 0x020F0580
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #4
	bl _ZNSt3tr110shared_ptrIcED1Ev
	mov r0, r4
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt12length_errorD0Ev

	arm_func_start _ZNSt3tr16detail25shared_ptr_deleter_common7releaseEv
_ZNSt3tr16detail25shared_ptr_deleter_common7releaseEv: ; 0x020F05A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #4]
	subs r1, r1, #1
	str r1, [r4, #4]
	ldmneia sp!, {r4, pc}
	ldr r1, [r0]
	ldr r1, [r1, #0xc]
	blx r1
	mov r0, r4
	bl _ZNSt3tr16detail25shared_ptr_deleter_common12release_weakEv
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt3tr16detail25shared_ptr_deleter_common7releaseEv

	arm_func_start _ZNSt3tr16detail25shared_ptr_deleter_common12release_weakEv
_ZNSt3tr16detail25shared_ptr_deleter_common12release_weakEv: ; 0x020F05D0
	stmdb sp!, {r3, lr}
	ldr r1, [r0, #8]
	subs r1, r1, #1
	str r1, [r0, #8]
	ldmneia sp!, {r3, pc}
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, [r0]
	ldr r1, [r1, #4]
	blx r1
	ldmia sp!, {r3, pc}
	arm_func_end _ZNSt3tr16detail25shared_ptr_deleter_common12release_weakEv

	arm_func_start _ZNSt15__vector_commonILb1EE18throw_length_errorEv
_ZNSt15__vector_commonILb1EE18throw_length_errorEv: ; 0x020F05FC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	ldr r4, _020F0678 ; =_02111664
	ldr r1, _020F067C ; =_02111658
	add r6, sp, #4
	mov r0, r4
	str r1, [sp, #4]
	add r5, sp, #8
	bl strlen
	add r0, r0, #1
	rsb r0, r0, r0, lsl #1
	bl _Znam
	mov r1, #0
	strb r1, [sp]
	sub r2, sp, #4
	strb r1, [r2]
	mov r1, r0
	ldr r2, [r2]
	mov r0, r5
	bl _ZNSt3tr110shared_ptrIcEC1IcNSt6detail14default_deleteIA0_cEEEEPT_T0_
	ldr r0, [r5]
	mov r1, r4
	bl strcpy
	ldr r3, _020F0680 ; =_02111644
	ldr r0, _020F0684 ; =_02111678
	ldr r2, _020F0688 ; =_ZNSt12length_errorD1Ev
	mov r1, r6
	str r3, [sp, #4]
	bl __throw
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020F0678: .word _02111664
_020F067C: .word _02111658
_020F0680: .word _02111644
_020F0684: .word _02111678
_020F0688: .word _ZNSt12length_errorD1Ev
	arm_func_end _ZNSt15__vector_commonILb1EE18throw_length_errorEv

	exception _ZNSt3tr110shared_ptrIcEC1IcNSt6detail14default_deleteIA0_cEEEEPT_T0_, 0x0080, _ZNSt3tr110shared_ptrIcEC1IcNSt6detail14default_deleteIA0_cEEEEPT_T0__exception
	exception _ZNSt9exceptionD0Ev, 0x0015, 0x00100100
	exception _ZNKSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE11get_deleterERKSt9type_info, 0x0029, 0x00100100
	exception _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE7disposeEv, 0x0011, 0x00000000
	exception _ZNSt3tr110shared_ptrIcED1Ev, 0x0040, _ZNSt3tr110shared_ptrIcED1Ev_exception
	exception _ZN10Metrowerks8move_ptrIcRNSt6detail14default_deleteIA0_cEEED1Ev, 0x0021, 0x00100100
	exception _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED0Ev, 0x0015, 0x00100100
	exception _ZNSt11logic_errorD1Ev, 0x0019, 0x00100100
	exception _ZNSt11logic_errorD0Ev, 0x0021, 0x00100100
	exception _ZNSt12length_errorD1Ev, 0x0019, 0x00100100
	exception _ZNSt12length_errorD0Ev, 0x0021, 0x00100100
	exception _ZNSt3tr16detail25shared_ptr_deleter_common7releaseEv, 0x0031, 0x00100100
	exception _ZNSt3tr16detail25shared_ptr_deleter_common12release_weakEv, 0x002D, 0x00100000
	exception _ZNSt15__vector_commonILb1EE18throw_length_errorEv, 0x0090, _ZNSt15__vector_commonILb1EE18throw_length_errorEv_exception

	.section .exception,4,1,2

_ZNSt3tr110shared_ptrIcEC1IcNSt6detail14default_deleteIA0_cEEEEPT_T0__exception:
	.byte 0x20, 0x03, 0x50, 0x58, 0x00, 0x0E, 0x00, 0x82, 0x00, 0xF0, 0x04, 0x0F, 0x02, 0x00, 0x00, 0x00
_ZNSt3tr110shared_ptrIcED1Ev_exception:
	.byte 0x40, 0x81, 0x50, 0x00
	.byte 0x40, 0x00, 0x16, 0x28, 0x00, 0x1E, 0x00, 0x8F, 0x00, 0x58, 0x00, 0x8D, 0x00, 0x00, 0x00, 0x00
_ZNSt15__vector_commonILb1EE18throw_length_errorEv_exception:
	.byte 0x00, 0x07, 0x40, 0x48, 0x58, 0x22, 0x18, 0x00, 0x14, 0x00, 0x27, 0x0A, 0x00, 0xB0, 0x04, 0x0F
	.byte 0x02, 0xA6, 0x0C, 0x00
	.word _ZNSt9exceptionD2Ev
