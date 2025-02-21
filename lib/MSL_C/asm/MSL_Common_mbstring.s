	.include "asm/macros.inc"
	.include "MSL_Common_mbstring.inc"
	.include "global.inc"

	.data

	.balign 4, 0
	.public _loc_tim_C$timezone
_loc_tim_C$timezone: ; 0x021110F8
	.asciz ""
	.size _loc_tim_C$timezone,.-_loc_tim_C$timezone

	.balign 4, 0
	.public _loc_tim_C$timefmt2
_loc_tim_C$timefmt2: ; 0x021110FC
	.asciz "%T"
	.size _loc_tim_C$timefmt2,.-_loc_tim_C$timefmt2

	.balign 4, 0
	.public _loc_tim_C$AMPM
_loc_tim_C$AMPM: ; 0x02111100
	.asciz "AM|PM"
	.size _loc_tim_C$AMPM,.-_loc_tim_C$AMPM

	.balign 4, 0
	.public _loc_ctyp_C
_loc_ctyp_C: ; 0x02111108
	.word __mbtowc_noconv
	.word __wctomb_noconv
	.size _loc_ctyp_C,.-_loc_ctyp_C

	.public _loc_coll_C
_loc_coll_C: ; 0x02111110
	.word 0x20
	.word 0x6E
	.word 0x00
	.word char_coll_tableC
	.size _loc_coll_C,.-_loc_coll_C

	.public _loc_tim_C
_loc_tim_C: ; 0x02111120
	.word _loc_tim_C$AMPM
	.word _loc_tim_C$datetimefmt
	.word _loc_tim_C$timefmt
	.word _loc_tim_C$datefmt
	.word _loc_tim_C$timefmt2
	.word _loc_tim_C$daynames
	.word _loc_tim_C$monthnames
	.word _loc_tim_C$timezone
	.size _loc_tim_C,.-_loc_tim_C

	.public char_coll_tableC
char_coll_tableC: ; 0x02111140
	.short 0x0001, 0x0002, 0x0003, 0x0004, 0x0005, 0x0006, 0x0007, 0x0008
	.short 0x0009, 0x000A, 0x000B, 0x000C, 0x000D, 0x000E, 0x000F, 0x0010
	.short 0x0021, 0x0022, 0x0023, 0x0024, 0x0025, 0x0026, 0x0027, 0x0028
	.short 0x0029, 0x002A, 0x0011, 0x0012, 0x0013, 0x0014, 0x0015, 0x0016
	.short 0x0017, 0x002B, 0x002D, 0x002F, 0x0031, 0x0033, 0x0035, 0x0037
	.short 0x0039, 0x003B, 0x003D, 0x003F, 0x0041, 0x0043, 0x0045, 0x0047
	.short 0x0049, 0x004B, 0x004D, 0x004F, 0x0051, 0x0053, 0x0055, 0x0057
	.short 0x0059, 0x005B, 0x005D, 0x0018, 0x0019, 0x001A, 0x001B, 0x001C
	.short 0x0000, 0x002C, 0x002E, 0x0030, 0x0032, 0x0034, 0x0036, 0x0038
	.short 0x003A, 0x003C, 0x003E, 0x0040, 0x0042, 0x0044, 0x0046, 0x0048
	.short 0x004A, 0x004C, 0x004E, 0x0050, 0x0052, 0x0054, 0x0056, 0x0058
	.short 0x005A, 0x005C, 0x005E, 0x001D, 0x001E, 0x001F, 0x0020, 0x0000
	.size char_coll_tableC,.-char_coll_tableC

	.balign 4, 0
	.public _loc_tim_C$datefmt
_loc_tim_C$datefmt: ; 0x02111200
	.asciz "%m/%d/%y"
	.size _loc_tim_C$datefmt,.-_loc_tim_C$datefmt

	.balign 4, 0
	.public _current_locale
_current_locale: ; 0x0211120C
	.word _loc_tim_C
	.word _loc_coll_C
	.word _loc_ctyp_C
	.size _current_locale,.-_current_locale

	.balign 4, 0
	.public _loc_tim_C$timefmt
_loc_tim_C$timefmt: ; 0x02111218
	.asciz "%I:%M:%S %p"
	.size _loc_tim_C$timefmt,.-_loc_tim_C$timefmt

	.balign 4, 0
	.public _loc_tim_C$datetimefmt
_loc_tim_C$datetimefmt: ; 0x02111224
	.asciz "%a %b %e %T %Y"
	.size _loc_tim_C$datetimefmt,.-_loc_tim_C$datetimefmt

	.balign 4, 0
	.public _loc_tim_C$daynames
_loc_tim_C$daynames: ; 0x02111234
	.asciz "Sun|Sunday|Mon|Monday|Tue|Tuesday|Wed|Wednesday|Thu|Thursday|Fri|Friday|Sat|Saturday"
	.size _loc_tim_C$daynames,.-_loc_tim_C$daynames

	.balign 4, 0
	.public _loc_tim_C$monthnames
_loc_tim_C$monthnames: ; 0x0211128C
	.asciz "Jan|January|Feb|February|Mar|March|Apr|April|May|May|Jun|June|Jul|July|Aug|August|Sep|September|Oct|October|Nov|November|Dec|December"
	.size _loc_tim_C$monthnames,.-_loc_tim_C$monthnames

	.text

	arm_func_start mbtowc
mbtowc: ; 0x020E5954
	stmdb sp!, {r3, lr}
	ldr r3, _020E596C ; =_current_locale
	ldr r3, [r3, #8]
	ldr r3, [r3]
	blx r3
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E596C: .word _current_locale
	arm_func_end mbtowc

	arm_func_start __mbtowc_noconv
__mbtowc_noconv: ; 0x020E5970
	cmp r1, #0
	moveq r0, #0
	bxeq lr
	cmp r2, #0
	mvneq r0, #0
	bxeq lr
	cmp r0, #0
	ldrneb r2, [r1]
	strneh r2, [r0]
	ldrsb r0, [r1]
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	bx lr
	arm_func_end __mbtowc_noconv

	arm_func_start __wctomb_noconv
__wctomb_noconv: ; 0x020E59A8
	cmp r0, #0
	moveq r0, #0
	strneb r1, [r0]
	movne r0, #1
	bx lr
	arm_func_end __wctomb_noconv

	arm_func_start wctomb
wctomb: ; 0x020E59BC
	stmdb sp!, {r3, lr}
	ldr r2, _020E59D4 ; =_current_locale
	ldr r2, [r2, #8]
	ldr r2, [r2, #4]
	blx r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E59D4: .word _current_locale
	arm_func_end wctomb

	arm_func_start mbstowcs
mbstowcs: ; 0x020E59D8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r8, r0
	mov r0, r7
	mov r6, r2
	bl strlen
	mov r5, r0
	cmp r8, #0
	mov r4, #0
	beq _020E5A58
	cmp r6, #0
	bls _020E5A58
_020E5A08:
	ldrsb r0, [r7]
	cmp r0, #0
	beq _020E5A40
	mov r0, r8
	mov r1, r7
	mov r2, r5
	bl mbtowc
	cmp r0, #0
	add r8, r8, #2
	addgt r7, r7, r0
	subgt r5, r5, r0
	bgt _020E5A4C
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020E5A40:
	mov r0, #0
	strh r0, [r8]
	b _020E5A58
_020E5A4C:
	add r4, r4, #1
	cmp r4, r6
	blo _020E5A08
_020E5A58:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end mbstowcs

	arm_func_start wcstombs
wcstombs: ; 0x020E5A60
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r4, r0
	mov sb, r1
	cmpne sb, #0
	mov r8, r2
	mov r7, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r6, sp, #0
_020E5A84:
	ldrh r1, [sb]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r4, r7]
	beq _020E5AD0
	mov r0, r6
	add sb, sb, #2
	bl wctomb
	mov r5, r0
	add r0, r7, r5
	cmp r0, r8
	bhi _020E5AD0
	mov r1, r6
	mov r2, r5
	add r0, r4, r7
	bl strncpy
	add r7, r7, r5
	cmp r7, r8
	bls _020E5A84
_020E5AD0:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end wcstombs

	exception mbtowc, 0x001D, 0x00100000
	exception wctomb, 0x001D, 0x00100000
	exception mbstowcs, 0x0089, 0x00301F00
	exception wcstombs, 0x0079, 0x00403F00
