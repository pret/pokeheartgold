	.include "asm/macros.inc"
	.include "global.inc"

	; This overlay has multiple levels of encryption for some reason.
	; Encrypted routines are presented as raw words with the decoded
	; instructions as comments.

	.text
	.balign 4, 0

	arm_func_start ov123_0225F020
ov123_0225F020: ; 0x0225F020
	.word 0xE92CC71E ; push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.word 0xE24CD291 ; sub	sp, sp, #128	; 0x80
	.word 0xE59EB8F2 ; ldr	r2, [pc, #156]	; _0225F0CC
	.word 0xE59E4395 ; ldr	r1, [pc, #156]	; _0225F0D0
	.word 0xE3A12084 ; mov	sl, #0
	.word 0xE293B9DA ; adds	r2, r2, #800	; 0x320
	.word 0xE2808021 ; add	r1, r1, #800	; 0x320
	.word 0xE1A1D64F ; mov	fp, r0
	.word 0xE1A193F6 ; mov	r8, sl
	.word 0xE1A14C38 ; mov	r9, sl
	.word 0xE58CF40E ; str	sl, [sp, #8]
	.word 0xE58CC484 ; str	r2, [sp]
	.word 0xE58C05C0 ; str	r1, [sp, #4]
	.word 0x0B001311 ; beq	_0225F0A0
	.word 0xE59E59B6 ; ldr	r4, [pc, #116]	; _0225F0D4
	.word 0xE1A112FE ; mov	r5, sl
	.word 0xE3A1E069 ; mov	r6, #1
	.word 0xE28C3162 ; add	r7, sp, #0
_0225F068:
	.word 0xE7963626 ; ldr	r0, [r7, r9, lsl #2]
	.word 0xE081581A ; add	r0, r0, r4
	.word 0xE12EF740 ; blx	r0
	.word 0xE351BB20 ; cmp	r0, #0
	.word 0x11A19158 ; movne	r1, r6
	.word 0xE288C54D ; add	r9, r9, #1
	.word 0x01A17C91 ; moveq	r1, r5
	.word 0xE08963D1 ; add	r2, r8, r1
	.word 0xE796D6FF ; ldr	r0, [r7, r9, lsl #2]
	.word 0xE28B6C39 ; add	r1, sl, #1
	.word 0xE351AADA ; cmp	r0, #0
	.word 0xE1A1C507 ; lsl	r8, r2, #1
	.word 0xE1A1AEFE ; lsl	sl, r1, #1
	.word 0x1B0012F1 ; bne	_0225F068
_0225F0A0:
	.word 0xE0095D34 ; and	r0, r8, sl
	.word 0xE1B14788 ; asrs	r0, r0, #1
	.word 0x13A17673 ; movne	r4, #1
	.word 0x03A13B8F ; moveq	r4, #0
	.word 0xE35ACF3A ; cmp	fp, #0
	.word 0x1355A0B0 ; cmpne	r4, #0
	.word 0x0B001300 ; beq	_0225F0C0
	.word 0xE12ED831 ; blx	fp
_0225F0C0:
	.word 0xE1A1DD50 ; mov	r0, r4
	.word 0xE28C2BAF ; add	sp, sp, #128	; 0x80
	.word 0xE8BC9BF0 ; pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_0225F0CC:	.word ov123_0226068C + 0x1300
_0225F0D0:	.word ov123_0225FC14 + 0x1300
_0225F0D4:	.word 0xFFFFE9E0
	arm_func_end ov123_0225F020

	arm_func_start ov123_0225F0D8
ov123_0225F0D8: ; 0x0225F0D8
	.word 0xE92CC71E ; push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.word 0xE24CD291 ; sub	sp, sp, #128	; 0x80
	.word 0xE59EB8F2 ; ldr	r2, [pc, #156]	; _0225F184
	.word 0xE59E4395 ; ldr	r1, [pc, #156]	; _0225F188
	.word 0xE3A12084 ; mov	sl, #0
	.word 0xE293B9DA ; adds	r2, r2, #800	; 0x320
	.word 0xE2808021 ; add	r1, r1, #800	; 0x320
	.word 0xE1A1D64F ; mov	fp, r0
	.word 0xE1A193F6 ; mov	r8, sl
	.word 0xE1A14C38 ; mov	r9, sl
	.word 0xE58CF40E ; str	sl, [sp, #8]
	.word 0xE58CC484 ; str	r2, [sp]
	.word 0xE58C05C0 ; str	r1, [sp, #4]
	.word 0x0B001311 ; beq	_0225F158
	.word 0xE59E59B6 ; ldr	r4, [pc, #116]	; _0225F18C
	.word 0xE1A112FE ; mov	r5, sl
	.word 0xE3A1E069 ; mov	r6, #1
	.word 0xE28C3162 ; add	r7, sp, #0
_0225F120:
	.word 0xE7963626 ; ldr	r0, [r7, r9, lsl #2]
	.word 0xE081581A ; add	r0, r0, r4
	.word 0xE12EF740 ; blx	r0
	.word 0xE351BB20 ; cmp	r0, #0
	.word 0x11A19158 ; movne	r1, r6
	.word 0xE288C54D ; add	r9, r9, #1
	.word 0x01A17C91 ; moveq	r1, r5
	.word 0xE08963D1 ; add	r2, r8, r1
	.word 0xE796D6FF ; ldr	r0, [r7, r9, lsl #2]
	.word 0xE28B6C39 ; add	r1, sl, #1
	.word 0xE351AADA ; cmp	r0, #0
	.word 0xE1A1C507 ; lsl	r8, r2, #1
	.word 0xE1A1AEFE ; lsl	sl, r1, #1
	.word 0x1B0012F1 ; bne	_0225F120
_0225F158:
	.word 0xE1A15DF6 ; asr	r0, r8, #1
	.word 0xE1514782 ; cmp	r0, sl, asr #1
	.word 0x03A17673 ; moveq	r4, #1
	.word 0x13A13B8F ; movne	r4, #0
	.word 0xE35ACF3A ; cmp	fp, #0
	.word 0x1355A0B0 ; cmpne	r4, #0
	.word 0x0B001300 ; beq	_0225F178
	.word 0xE12ED831 ; blx	fp
_0225F178:
	.word 0xE1A1DD50 ; mov	r0, r4
	.word 0xE28C2BAF ; add	sp, sp, #128	; 0x80
	.word 0xE8BC9BF0 ; pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_0225F184:	.word ov123_02260704 + 0x1300
_0225F188:	.word ov123_0225FC8C + 0x1300
_0225F18C:	.word 0xFFFFE9E0
	arm_func_end ov123_0225F0D8

	arm_func_start ov123_0225F190
ov123_0225F190: ; 0x0225F190
	.word 0xE92CC71E ; push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.word 0xE24CD291 ; sub	sp, sp, #128	; 0x80
	.word 0xE59EB8F2 ; ldr	r2, [pc, #156]	; _0225F23C
	.word 0xE59E4395 ; ldr	r1, [pc, #156]	; _0225F240
	.word 0xE3A12084 ; mov	sl, #0
	.word 0xE293B9DA ; adds	r2, r2, #800	; 0x320
	.word 0xE2808021 ; add	r1, r1, #800	; 0x320
	.word 0xE1A1D64F ; mov	fp, r0
	.word 0xE1A193F6 ; mov	r8, sl
	.word 0xE1A14C38 ; mov	r9, sl
	.word 0xE58CF40E ; str	sl, [sp, #8]
	.word 0xE58CC484 ; str	r2, [sp]
	.word 0xE58C05C0 ; str	r1, [sp, #4]
	.word 0x0B001311 ; beq	_0225F210
	.word 0xE59E59B6 ; ldr	r4, [pc, #116]	; _0225F244
	.word 0xE1A112FE ; mov	r5, sl
	.word 0xE3A1E069 ; mov	r6, #1
	.word 0xE28C3162 ; add	r7, sp, #0
_0225F1D8:
	.word 0xE7963626 ; ldr	r0, [r7, r9, lsl #2]
	.word 0xE081581A ; add	r0, r0, r4
	.word 0xE12EF740 ; blx	r0
	.word 0xE351BB20 ; cmp	r0, #0
	.word 0x11A19158 ; movne	r1, r6
	.word 0xE288C54D ; add	r9, r9, #1
	.word 0x01A17C91 ; moveq	r1, r5
	.word 0xE08963D1 ; add	r2, r8, r1
	.word 0xE796D6FF ; ldr	r0, [r7, r9, lsl #2]
	.word 0xE28B6C39 ; add	r1, sl, #1
	.word 0xE351AADA ; cmp	r0, #0
	.word 0xE1A1C507 ; lsl	r8, r2, #1
	.word 0xE1A1AEFE ; lsl	sl, r1, #1
	.word 0x1B0012F1 ; bne	_0225F1D8
_0225F210:
	.word 0xE0095D34 ; and	r0, r8, sl
	.word 0xE1B14788 ; asrs	r0, r0, #1
	.word 0x13A17673 ; movne	r4, #1
	.word 0x03A13B8F ; moveq	r4, #0
	.word 0xE35ACF3A ; cmp	fp, #0
	.word 0x1355A0B0 ; cmpne	r4, #0
	.word 0x0B001300 ; beq	_0225F230
	.word 0xE12ED831 ; blx	fp
_0225F230:
	.word 0xE1A1DD50 ; mov	r0, r4
	.word 0xE28C2BAF ; add	sp, sp, #128	; 0x80
	.word 0xE8BC9BF0 ; pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_0225F23C:	.word ov123_02260148 + 0x1300
_0225F240:	.word ov123_0225FB24 + 0x1300
_0225F244:	.word 0xFFFFE9E0
	arm_func_end ov123_0225F190

	arm_func_start ov123_0225F248
ov123_0225F248: ; 0x0225F248
	.word 0xE92CC71E ; push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.word 0xE24CD291 ; sub	sp, sp, #128	; 0x80
	.word 0xE59EB8F2 ; ldr	r2, [pc, #156]	; _0225F2F4
	.word 0xE59E4395 ; ldr	r1, [pc, #156]	; _0225F2F8
	.word 0xE3A12084 ; mov	sl, #0
	.word 0xE293B9DA ; adds	r2, r2, #800	; 0x320
	.word 0xE2808021 ; add	r1, r1, #800	; 0x320
	.word 0xE1A1D64F ; mov	fp, r0
	.word 0xE1A193F6 ; mov	r8, sl
	.word 0xE1A14C38 ; mov	r9, sl
	.word 0xE58CF40E ; str	sl, [sp, #8]
	.word 0xE58CC484 ; str	r2, [sp]
	.word 0xE58C05C0 ; str	r1, [sp, #4]
	.word 0x0B001311 ; beq	_0225F2C8
	.word 0xE59E59B6 ; ldr	r4, [pc, #116]	; _0225F2FC
	.word 0xE1A112FE ; mov	r5, sl
	.word 0xE3A1E069 ; mov	r6, #1
	.word 0xE28C3162 ; add	r7, sp, #0
_0225F290:
	.word 0xE7963626 ; ldr	r0, [r7, r9, lsl #2]
	.word 0xE081581A ; add	r0, r0, r4
	.word 0xE12EF740 ; blx	r0
	.word 0xE351BB20 ; cmp	r0, #0
	.word 0x11A19158 ; movne	r1, r6
	.word 0xE288C54D ; add	r9, r9, #1
	.word 0x01A17C91 ; moveq	r1, r5
	.word 0xE08963D1 ; add	r2, r8, r1
	.word 0xE796D6FF ; ldr	r0, [r7, r9, lsl #2]
	.word 0xE28B6C39 ; add	r1, sl, #1
	.word 0xE351AADA ; cmp	r0, #0
	.word 0xE1A1C507 ; lsl	r8, r2, #1
	.word 0xE1A1AEFE ; lsl	sl, r1, #1
	.word 0x1B0012F1 ; bne	_0225F290
_0225F2C8:
	.word 0xE1A15DF6 ; asr	r0, r8, #1
	.word 0xE1514782 ; cmp	r0, sl, asr #1
	.word 0x03A17673 ; moveq	r4, #1
	.word 0x13A13B8F ; movne	r4, #0
	.word 0xE35ACF3A ; cmp	fp, #0
	.word 0x1355A0B0 ; cmpne	r4, #0
	.word 0x0B001300 ; beq	_0225F2E8
	.word 0xE12ED831 ; blx	fp
_0225F2E8:
	.word 0xE1A1DD50 ; mov	r0, r4
	.word 0xE28C2BAF ; add	sp, sp, #128	; 0x80
	.word 0xE8BC9BF0 ; pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_0225F2F4:	.word ov123_022601C0 + 0x1300
_0225F2F8:	.word ov123_0225FB9C + 0x1300
_0225F2FC:	.word 0xFFFFE9E0
	arm_func_end ov123_0225F248

	arm_func_start ov123_0225F300
ov123_0225F300: ; 0x0225F300
	.word 0xE92C5CA2 ; push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.word 0xE24C1B58 ; sub	sp, sp, #128	; 0x80
	.word 0xE3B1D7AA ; movs	sl, #0
	.word 0xE1A10F1A ; mov	fp, r0
	.word 0xE1A15DF2 ; mov	r8, sl
	.word 0xE1A1C336 ; mov	r9, sl
	.word 0xE58C3A7E ; str	sl, [sp]
	.word 0x0B001311 ; beq	_0225F368
	.word 0xE59EDBE5 ; ldr	r4, [pc, #108]	; _0225F394
	.word 0xE3A1C1BC ; mov	r5, #0
	.word 0xE3A1940D ; mov	r6, #1
	.word 0xE28C74D7 ; add	r7, sp, #0
_0225F330:
	.word 0xE796AA94 ; ldr	r0, [r7, r9, lsl #2]
	.word 0xE0811D33 ; add	r0, r0, r4
	.word 0xE12E41C8 ; blx	r0
	.word 0xE351BB28 ; cmp	r0, #0
	.word 0x11A13406 ; movne	r1, r6
	.word 0xE288028B ; add	r9, r9, #1
	.word 0x01A19C51 ; moveq	r1, r5
	.word 0xE089B571 ; add	r2, r8, r1
	.word 0xE796BE97 ; ldr	r0, [r7, r9, lsl #2]
	.word 0xE28B8A09 ; add	r1, sl, #1
	.word 0xE351A081 ; cmp	r0, #0
	.word 0xE1A161E2 ; lsl	r8, r2, #1
	.word 0xE1A1AA87 ; lsl	sl, r1, #1
	.word 0x1B0012F1 ; bne	_0225F330
_0225F368:
	.word 0xE0091FF8 ; and	r0, r8, sl
	.word 0xE1B18001 ; asrs	r0, r0, #1
	.word 0x13A186FC ; movne	r4, #1
	.word 0x03A1C85B ; moveq	r4, #0
	.word 0xE35A93D7 ; cmp	fp, #0
	.word 0x135595F7 ; cmpne	r4, #0
	.word 0x0B001300 ; beq	_0225F388
	.word 0xE12E5237 ; blx	fp
_0225F388:
	.word 0xE1A14283 ; mov	r0, r4
	.word 0xE28C9E4A ; add	sp, sp, #128	; 0x80
	.word 0xE8BCBE28 ; pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_0225F394:	.word 0xFFFFE9E0
	arm_func_end ov123_0225F300

	arm_func_start ov123_0225F398
ov123_0225F398: ; 0x0225F398
	.word 0xE92C5CA2 ; push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.word 0xE24C1B58 ; sub	sp, sp, #128	; 0x80
	.word 0xE3B1D7AA ; movs	sl, #0
	.word 0xE1A10F1A ; mov	fp, r0
	.word 0xE1A15DF2 ; mov	r8, sl
	.word 0xE1A1C336 ; mov	r9, sl
	.word 0xE58C3A7E ; str	sl, [sp]
	.word 0x0B001311 ; beq	_0225F400
	.word 0xE59EDBE5 ; ldr	r4, [pc, #108]	; _0225F42C
	.word 0xE3A1C1BC ; mov	r5, #0
	.word 0xE3A1940D ; mov	r6, #1
	.word 0xE28C74D7 ; add	r7, sp, #0
_0225F3C8:
	.word 0xE796AA94 ; ldr	r0, [r7, r9, lsl #2]
	.word 0xE0811D33 ; add	r0, r0, r4
	.word 0xE12E41C8 ; blx	r0
	.word 0xE351BB28 ; cmp	r0, #0
	.word 0x11A13406 ; movne	r1, r6
	.word 0xE288028B ; add	r9, r9, #1
	.word 0x01A19C51 ; moveq	r1, r5
	.word 0xE089B571 ; add	r2, r8, r1
	.word 0xE796BE97 ; ldr	r0, [r7, r9, lsl #2]
	.word 0xE28B8A09 ; add	r1, sl, #1
	.word 0xE351A081 ; cmp	r0, #0
	.word 0xE1A161E2 ; lsl	r8, r2, #1
	.word 0xE1A1AA87 ; lsl	sl, r1, #1
	.word 0x1B0012F1 ; bne	_0225F3C8
_0225F400:
	.word 0xE1A11F3A ; asr	r0, r8, #1
	.word 0xE151800B ; cmp	r0, sl, asr #1
	.word 0x03A186FC ; moveq	r4, #1
	.word 0x13A1C85B ; movne	r4, #0
	.word 0xE35A93D7 ; cmp	fp, #0
	.word 0x135595F7 ; cmpne	r4, #0
	.word 0x0B001300 ; beq	_0225F420
	.word 0xE12E5237 ; blx	fp
_0225F420:
	.word 0xE1A14283 ; mov	r0, r4
	.word 0xE28C9E4A ; add	sp, sp, #128	; 0x80
	.word 0xE8BCBE28 ; pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_0225F42C:	.word 0xFFFFE9E0
	arm_func_end ov123_0225F398

	arm_func_start ov123_0225F430
ov123_0225F430: ; 0x0225F430
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _0225F4A4
	.word 0x12D95506 ; adr r3, _0225F498
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _0225F49C
	.word 0x15C9651A ; ldr r0, _0225F4A0
	.word 0xEA000756 ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _0225F4A4
	.word 0x15C94576 ; ldr r2, _0225F49C
	.word 0x15C96576 ; ldr r0, _0225F4A0
	.word 0xEA00076D ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _0225F4A0
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _0225F498
	.word 0x15D99556 ; str pc, _0225F498
	.word 0x11799A48 ; bx lr
_0225F498: .word _02260C00+1
_0225F49C: .word _02260C00 + 0x1300 + 0xAC
_0225F4A0: .word _02260C00 + 0x1300 + 0x6AB2
_0225F4A4: .word ov123_0225F020 + 0x1300
	arm_func_end ov123_0225F430

	arm_func_start ov123_0225F4A8
ov123_0225F4A8: ; 0x0225F4A8
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _0225F51C
	.word 0x12D95506 ; adr r3, _0225F510
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _0225F514
	.word 0x15C9651A ; ldr r0, _0225F518
	.word 0xEA000738 ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _0225F51C
	.word 0x15C94576 ; ldr r2, _0225F514
	.word 0x15C96576 ; ldr r0, _0225F518
	.word 0xEA00074F ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _0225F518
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _0225F510
	.word 0x15D99556 ; str pc, _0225F510
	.word 0x11799A48 ; bx lr
_0225F510:	.word _02260C00+1
_0225F514:	.word _02260C00 + 0x1300 + 0xAC
_0225F518:	.word _02260C00 + 0x1300 + 0x6AB2
_0225F51C:	.word ov123_0225F0D8 + 0x1300
	arm_func_end ov123_0225F4A8

	arm_func_start ov123_0225F520
ov123_0225F520: ; 0x0225F520
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _0225F594
	.word 0x12D95506 ; adr r3, _0225F588
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _0225F58C
	.word 0x15C9651A ; ldr r0, _0225F590
	.word 0xEA00071A ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _0225F594
	.word 0x15C94576 ; ldr r2, _0225F58C
	.word 0x15C96576 ; ldr r0, _0225F590
	.word 0xEA000731 ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _0225F590
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _0225F588
	.word 0x15D99556 ; str pc, _0225F588
	.word 0x11799A48 ; bx lr
_0225F588:	.word _02260C00+1
_0225F58C:	.word _02260C00 + 0x1300 + 0xAC
_0225F590:	.word _02260C00 + 0x1300 + 0x6AB2
_0225F594:	.word ov123_0225F190 + 0x1300
	arm_func_end ov123_0225F520

	arm_func_start ov123_0225F598
ov123_0225F598: ; 0x0225F598
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _0225F60C
	.word 0x12D95506 ; adr r3, _0225F600
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _0225F604
	.word 0x15C9651A ; ldr r0, _0225F608
	.word 0xEA0006FC ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _0225F60C
	.word 0x15C94576 ; ldr r2, _0225F604
	.word 0x15C96576 ; ldr r0, _0225F608
	.word 0xEA000713 ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _0225F608
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _0225F600
	.word 0x15D99556 ; str pc, _0225F600
	.word 0x11799A48 ; bx lr
_0225F600:	.word _02260C00+1
_0225F604:	.word _02260C00 + 0x1300 + 0xAC
_0225F608:	.word _02260C00 + 0x1300 + 0x6AB2
_0225F60C:	.word ov123_0225F248 + 0x1300
	arm_func_end ov123_0225F598

	arm_func_start ov123_0225F610
ov123_0225F610: ; 0x0225F610
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _0225F684
	.word 0x12D95506 ; adr r3, _0225F678
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _0225F67C
	.word 0x15C9651A ; ldr r0, _0225F680
	.word 0xEA0006DE ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _0225F684
	.word 0x15C94576 ; ldr r2, _0225F67C
	.word 0x15C96576 ; ldr r0, _0225F680
	.word 0xEA0006F5 ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _0225F680
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _0225F678
	.word 0x15D99556 ; str pc, _0225F678
	.word 0x11799A48 ; bx lr
_0225F678:	.word _02260C00+1
_0225F67C:	.word _02260C00 + 0x1300 + 0x94
_0225F680:	.word _02260C00 + 0x1300 + 0x6AB2
_0225F684:	.word ov123_0225F300 + 0x1300
	arm_func_end ov123_0225F610

	arm_func_start ov123_0225F688
ov123_0225F688: ; 0x0225F688
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _0225F6FC
	.word 0x12D95506 ; adr r3, _0225F6F0
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _0225F6F4
	.word 0x15C9651A ; ldr r0, _0225F6F8
	.word 0xEA0006C0 ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _0225F6FC
	.word 0x15C94576 ; ldr r2, _0225F6F4
	.word 0x15C96576 ; ldr r0, _0225F6F8
	.word 0xEA0006D7 ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _0225F6F8
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _0225F6F0
	.word 0x15D99556 ; str pc, _0225F6F0
	.word 0x11799A48 ; bx lr
_0225F6F0:	.word _02260C00+1
_0225F6F4:	.word _02260C00 + 0x1300 + 0x94
_0225F6F8:	.word _02260C00 + 0x1300 + 0x6AB2
_0225F6FC:	.word ov123_0225F398 + 0x1300
	arm_func_end ov123_0225F688

	arm_func_start ov123_0225F700
ov123_0225F700: ; 0x0225F700
	stmdb sp!, {lr}
	adr r0, _0225F710
	bl ov123_0225FD98
	ldmia sp!, {pc}
_0225F710:
	.word ov123_0225F430 + 0x1300, _02260C00 + 0x1300 + 0x68
	.word ov123_0225F4A8 + 0x1300, _02260C00 + 0x1300 + 0x68
	.word ov123_0225F520 + 0x1300, _02260C00 + 0x1300 + 0x68
	.word ov123_0225F598 + 0x1300, _02260C00 + 0x1300 + 0x68
	.word ov123_0225F610 + 0x1300, _02260C00 + 0x1300 + 0x68
	.word ov123_0225F688 + 0x1300, _02260C00 + 0x1300 + 0x68
	.word 0, 0
	arm_func_end ov123_0225F700

_0225F748:
	.word ov123_02260BBC + 0x1300

	arm_func_start ov123_0225F74C
ov123_0225F74C: ; 0x0225F74C
	.word 0xE59E0D93 ; ldr	r0, [pc, #204]	; _0225F820
	.word 0xE241509D ; sub	r0, r0, #9728	; 0x2600
	.word 0xE281BBC1 ; add	r1, r0, #4096	; 0x1000
	.word 0xE5D05098 ; ldrb	r2, [r1, #768]	; 0x300
	.word 0xE2813897 ; add	r0, r0, #1
	.word 0xE353B9AE ; cmp	r2, #240	; 0xf0
	.word 0x112E3678 ; bxne	lr
	.word 0xE5D005F4 ; ldrb	r2, [r1, #769]	; 0x301
	.word 0xE353EF0A ; cmp	r2, #0
	.word 0x112EB779 ; bxne	lr
	.word 0xE5D09AE9 ; ldrb	r2, [r1, #770]	; 0x302
	.word 0xE3534F8A ; cmp	r2, #45	; 0x2d
	.word 0x112EF769 ; bxne	lr
	.word 0xE5D011C6 ; ldrb	r2, [r1, #771]	; 0x303
	.word 0xE3537629 ; cmp	r2, #233	; 0xe9
	.word 0x112EB5D8 ; bxne	lr
	.word 0xE5D0855E ; ldrb	r2, [r1, #772]	; 0x304
	.word 0xE35344B2 ; cmp	r2, #15
	.word 0x112EF330 ; bxne	lr
	.word 0xE5D04EF0 ; ldrb	r2, [r1, #773]	; 0x305
	.word 0xE353B758 ; cmp	r2, #0
	.word 0x112E559E ; bxne	lr
	.word 0xE5D072E2 ; ldrb	r2, [r1, #774]	; 0x306
	.word 0xE353E3B6 ; cmp	r2, #45	; 0x2d
	.word 0x112EEDE4 ; bxne	lr
	.word 0xE5D0BC60 ; ldrb	r2, [r1, #775]	; 0x307
	.word 0xE353EC50 ; cmp	r2, #233	; 0xe9
	.word 0x112EFEE0 ; bxne	lr
	.word 0xE5D03405 ; ldrb	r2, [r1, #776]	; 0x308
	.word 0xE353AE2A ; cmp	r2, #240	; 0xf0
	.word 0x112EC607 ; bxne	lr
	.word 0xE5D0658C ; ldrb	r2, [r1, #777]	; 0x309
	.word 0xE3538458 ; cmp	r2, #0
	.word 0x112E199B ; bxne	lr
	.word 0xE5D00592 ; ldrb	r2, [r1, #778]	; 0x30a
	.word 0xE3532344 ; cmp	r2, #189	; 0xbd
	.word 0x112E10CE ; bxne	lr
	.word 0xE5D003B7 ; ldrb	r2, [r1, #779]	; 0x30b
	.word 0xE353F7E7 ; cmp	r2, #232	; 0xe8
	.word 0x112E8076 ; bxne	lr
	.word 0xE5D0D71A ; ldrb	r2, [r1, #780]	; 0x30c
	.word 0xE35339E5 ; cmp	r2, #96	; 0x60
	.word 0x112ED00F ; bxne	lr
	.word 0xE5D083A1 ; ldrb	r2, [r1, #781]	; 0x30d
	.word 0xE35329E9 ; cmp	r2, #16
	.word 0x112EBD3D ; bxne	lr
	.word 0xE5D0E8D4 ; ldrb	r2, [r1, #782]	; 0x30e
	.word 0xE35338B4 ; cmp	r2, #159	; 0x9f
	.word 0x112E00D7 ; bxne	lr
	.word 0xE5D0B389 ; ldrb	r1, [r1, #783]	; 0x30f
	.word 0xE350000C ; cmp	r1, #229	; 0xe5
	.word 0x03A1F612 ; moveq	r0, #0
	.word 0xE12E8A24 ; bx	lr
_0225F820:	.word ov123_02260148 + 0x1300
	arm_func_end ov123_0225F74C

	arm_func_start ov123_0225F824
ov123_0225F824: ; 0x0225F824
	.word 0xE59E4168 ; ldr	r0, [pc, #264]	; _0225F934
	.word 0xE2416595 ; sub	r0, r0, #9728	; 0x2600
	.word 0xE28124EE ; add	r1, r0, #4096	; 0x1000
	.word 0xE5D02CAA ; ldrb	r2, [r1, #768]	; 0x300
	.word 0xE3538787 ; cmp	r2, #240	; 0xf0
	.word 0x13A1BBDF ; movne	r0, #0
	.word 0x112E3F68 ; bxne	lr
	.word 0xE5D0007D ; ldrb	r2, [r1, #769]	; 0x301
	.word 0xE353C004 ; cmp	r2, #0
	.word 0x13A10970 ; movne	r0, #0
	.word 0x112E640F ; bxne	lr
	.word 0xE5D0E72E ; ldrb	r2, [r1, #770]	; 0x302
	.word 0xE3535A14 ; cmp	r2, #45	; 0x2d
	.word 0x13A12E1E ; movne	r0, #0
	.word 0x112EF209 ; bxne	lr
	.word 0xE5D0929A ; ldrb	r2, [r1, #771]	; 0x303
	.word 0xE3536A87 ; cmp	r2, #233	; 0xe9
	.word 0x13A15759 ; movne	r0, #0
	.word 0x112EA548 ; bxne	lr
	.word 0xE5D0C1EC ; ldrb	r2, [r1, #772]	; 0x304
	.word 0xE35304BB ; cmp	r2, #15
	.word 0x13A11BDC ; movne	r0, #0
	.word 0x112E1670 ; bxne	lr
	.word 0xE5D024C3 ; ldrb	r2, [r1, #773]	; 0x305
	.word 0xE353F528 ; cmp	r2, #0
	.word 0x13A1CB1D ; movne	r0, #0
	.word 0x112E9CA2 ; bxne	lr
	.word 0xE5D0335A ; ldrb	r2, [r1, #774]	; 0x306
	.word 0xE35323A0 ; cmp	r2, #45	; 0x2d
	.word 0x13A10CFA ; movne	r0, #0
	.word 0x112E0FC0 ; bxne	lr
	.word 0xE5D0BBB3 ; ldrb	r2, [r1, #775]	; 0x307
	.word 0xE3531CE3 ; cmp	r2, #233	; 0xe9
	.word 0x13A1EDC0 ; movne	r0, #0
	.word 0x112E617F ; bxne	lr
	.word 0xE5D016FD ; ldrb	r2, [r1, #776]	; 0x308
	.word 0xE353A925 ; cmp	r2, #240	; 0xf0
	.word 0x13A19396 ; movne	r0, #0
	.word 0x112EAF15 ; bxne	lr
	.word 0xE5D02CF7 ; ldrb	r2, [r1, #777]	; 0x309
	.word 0xE3539CF2 ; cmp	r2, #0
	.word 0x13A17D04 ; movne	r0, #0
	.word 0x112E05D6 ; bxne	lr
	.word 0xE5D00173 ; ldrb	r2, [r1, #778]	; 0x30a
	.word 0xE3534F82 ; cmp	r2, #189	; 0xbd
	.word 0x13A111D9 ; movne	r0, #0
	.word 0x112E2114 ; bxne	lr
	.word 0xE5D077D2 ; ldrb	r2, [r1, #779]	; 0x30b
	.word 0xE353528A ; cmp	r2, #232	; 0xe8
	.word 0x13A181DD ; movne	r0, #0
	.word 0x112E9991 ; bxne	lr
	.word 0xE5D08251 ; ldrb	r2, [r1, #780]	; 0x30c
	.word 0xE3536AB4 ; cmp	r2, #96	; 0x60
	.word 0x13A1F8E3 ; movne	r0, #0
	.word 0x112E3959 ; bxne	lr
	.word 0xE5D095A9 ; ldrb	r2, [r1, #781]	; 0x30d
	.word 0xE3535F28 ; cmp	r2, #16
	.word 0x13A185DA ; movne	r0, #0
	.word 0x112E29D8 ; bxne	lr
	.word 0xE5D02257 ; ldrb	r2, [r1, #782]	; 0x30e
	.word 0xE3534577 ; cmp	r2, #159	; 0x9f
	.word 0x13A15CF7 ; movne	r0, #0
	.word 0x112E42CE ; bxne	lr
	.word 0xE5D060AF ; ldrb	r1, [r1, #783]	; 0x30f
	.word 0xE3501998 ; cmp	r1, #229	; 0xe5
	.word 0x13A12750 ; movne	r0, #0
	.word 0x02812BCD ; addeq	r0, r0, #1
	.word 0xE12E1107 ; bx	lr
_0225F934:	.word ov123_022601C0 + 0x1300
	arm_func_end ov123_0225F824

	arm_func_start ov123_0225F938
ov123_0225F938: ; 0x0225F938
	.word 0xE59E0D93 ; ldr	r0, [pc, #204]	; _0225FA0C
	.word 0xE241509D ; sub	r0, r0, #9728	; 0x2600
	.word 0xE281BBC1 ; add	r1, r0, #4096	; 0x1000
	.word 0xE5D05098 ; ldrb	r2, [r1, #768]	; 0x300
	.word 0xE2813897 ; add	r0, r0, #1
	.word 0xE353B9AE ; cmp	r2, #240	; 0xf0
	.word 0x112E3678 ; bxne	lr
	.word 0xE5D005F4 ; ldrb	r2, [r1, #769]	; 0x301
	.word 0xE353EF0A ; cmp	r2, #0
	.word 0x112EB779 ; bxne	lr
	.word 0xE5D09AE9 ; ldrb	r2, [r1, #770]	; 0x302
	.word 0xE3534F8A ; cmp	r2, #45	; 0x2d
	.word 0x112EF769 ; bxne	lr
	.word 0xE5D011C6 ; ldrb	r2, [r1, #771]	; 0x303
	.word 0xE3537629 ; cmp	r2, #233	; 0xe9
	.word 0x112EB5D8 ; bxne	lr
	.word 0xE5D0855E ; ldrb	r2, [r1, #772]	; 0x304
	.word 0xE35344B2 ; cmp	r2, #15
	.word 0x112EF330 ; bxne	lr
	.word 0xE5D04EF0 ; ldrb	r2, [r1, #773]	; 0x305
	.word 0xE353B758 ; cmp	r2, #0
	.word 0x112E559E ; bxne	lr
	.word 0xE5D072E2 ; ldrb	r2, [r1, #774]	; 0x306
	.word 0xE353E3B6 ; cmp	r2, #45	; 0x2d
	.word 0x112EEDE4 ; bxne	lr
	.word 0xE5D0BC60 ; ldrb	r2, [r1, #775]	; 0x307
	.word 0xE353EC50 ; cmp	r2, #233	; 0xe9
	.word 0x112EFEE0 ; bxne	lr
	.word 0xE5D03405 ; ldrb	r2, [r1, #776]	; 0x308
	.word 0xE353AE2A ; cmp	r2, #240	; 0xf0
	.word 0x112EC607 ; bxne	lr
	.word 0xE5D0658C ; ldrb	r2, [r1, #777]	; 0x309
	.word 0xE3538458 ; cmp	r2, #0
	.word 0x112E199B ; bxne	lr
	.word 0xE5D00592 ; ldrb	r2, [r1, #778]	; 0x30a
	.word 0xE3532344 ; cmp	r2, #189	; 0xbd
	.word 0x112E10CE ; bxne	lr
	.word 0xE5D003B7 ; ldrb	r2, [r1, #779]	; 0x30b
	.word 0xE353F7E7 ; cmp	r2, #232	; 0xe8
	.word 0x112E8076 ; bxne	lr
	.word 0xE5D0D71A ; ldrb	r2, [r1, #780]	; 0x30c
	.word 0xE35339E5 ; cmp	r2, #96	; 0x60
	.word 0x112ED00F ; bxne	lr
	.word 0xE5D083A1 ; ldrb	r2, [r1, #781]	; 0x30d
	.word 0xE35329E9 ; cmp	r2, #16
	.word 0x112EBD3D ; bxne	lr
	.word 0xE5D0E8D4 ; ldrb	r2, [r1, #782]	; 0x30e
	.word 0xE35338B4 ; cmp	r2, #159	; 0x9f
	.word 0x112E00D7 ; bxne	lr
	.word 0xE5D0B389 ; ldrb	r1, [r1, #783]	; 0x30f
	.word 0xE350000C ; cmp	r1, #229	; 0xe5
	.word 0x03A1F612 ; moveq	r0, #0
	.word 0xE12E8A24 ; bx	lr
_0225FA0C:	.word ov123_0226068C + 0x1300
	arm_func_end ov123_0225F938

	arm_func_start ov123_0225FA10
ov123_0225FA10: ; 0x0225FA10
	.word 0xE59E4168 ; ldr	r0, [pc, #264]	; _0225FB20
	.word 0xE2416595 ; sub	r0, r0, #9728	; 0x2600
	.word 0xE28124EE ; add	r1, r0, #4096	; 0x1000
	.word 0xE5D02CAA ; ldrb	r2, [r1, #768]	; 0x300
	.word 0xE3538787 ; cmp	r2, #240	; 0xf0
	.word 0x13A1BBDF ; movne	r0, #0
	.word 0x112E3F68 ; bxne	lr
	.word 0xE5D0007D ; ldrb	r2, [r1, #769]	; 0x301
	.word 0xE353C004 ; cmp	r2, #0
	.word 0x13A10970 ; movne	r0, #0
	.word 0x112E640F ; bxne	lr
	.word 0xE5D0E72E ; ldrb	r2, [r1, #770]	; 0x302
	.word 0xE3535A14 ; cmp	r2, #45	; 0x2d
	.word 0x13A12E1E ; movne	r0, #0
	.word 0x112EF209 ; bxne	lr
	.word 0xE5D0929A ; ldrb	r2, [r1, #771]	; 0x303
	.word 0xE3536A87 ; cmp	r2, #233	; 0xe9
	.word 0x13A15759 ; movne	r0, #0
	.word 0x112EA548 ; bxne	lr
	.word 0xE5D0C1EC ; ldrb	r2, [r1, #772]	; 0x304
	.word 0xE35304BB ; cmp	r2, #15
	.word 0x13A11BDC ; movne	r0, #0
	.word 0x112E1670 ; bxne	lr
	.word 0xE5D024C3 ; ldrb	r2, [r1, #773]	; 0x305
	.word 0xE353F528 ; cmp	r2, #0
	.word 0x13A1CB1D ; movne	r0, #0
	.word 0x112E9CA2 ; bxne	lr
	.word 0xE5D0335A ; ldrb	r2, [r1, #774]	; 0x306
	.word 0xE35323A0 ; cmp	r2, #45	; 0x2d
	.word 0x13A10CFA ; movne	r0, #0
	.word 0x112E0FC0 ; bxne	lr
	.word 0xE5D0BBB3 ; ldrb	r2, [r1, #775]	; 0x307
	.word 0xE3531CE3 ; cmp	r2, #233	; 0xe9
	.word 0x13A1EDC0 ; movne	r0, #0
	.word 0x112E617F ; bxne	lr
	.word 0xE5D016FD ; ldrb	r2, [r1, #776]	; 0x308
	.word 0xE353A925 ; cmp	r2, #240	; 0xf0
	.word 0x13A19396 ; movne	r0, #0
	.word 0x112EAF15 ; bxne	lr
	.word 0xE5D02CF7 ; ldrb	r2, [r1, #777]	; 0x309
	.word 0xE3539CF2 ; cmp	r2, #0
	.word 0x13A17D04 ; movne	r0, #0
	.word 0x112E05D6 ; bxne	lr
	.word 0xE5D00173 ; ldrb	r2, [r1, #778]	; 0x30a
	.word 0xE3534F82 ; cmp	r2, #189	; 0xbd
	.word 0x13A111D9 ; movne	r0, #0
	.word 0x112E2114 ; bxne	lr
	.word 0xE5D077D2 ; ldrb	r2, [r1, #779]	; 0x30b
	.word 0xE353528A ; cmp	r2, #232	; 0xe8
	.word 0x13A181DD ; movne	r0, #0
	.word 0x112E9991 ; bxne	lr
	.word 0xE5D08251 ; ldrb	r2, [r1, #780]	; 0x30c
	.word 0xE3536AB4 ; cmp	r2, #96	; 0x60
	.word 0x13A1F8E3 ; movne	r0, #0
	.word 0x112E3959 ; bxne	lr
	.word 0xE5D095A9 ; ldrb	r2, [r1, #781]	; 0x30d
	.word 0xE3535F28 ; cmp	r2, #16
	.word 0x13A185DA ; movne	r0, #0
	.word 0x112E29D8 ; bxne	lr
	.word 0xE5D02257 ; ldrb	r2, [r1, #782]	; 0x30e
	.word 0xE3534577 ; cmp	r2, #159	; 0x9f
	.word 0x13A15CF7 ; movne	r0, #0
	.word 0x112E42CE ; bxne	lr
	.word 0xE5D060AF ; ldrb	r1, [r1, #783]	; 0x30f
	.word 0xE3501998 ; cmp	r1, #229	; 0xe5
	.word 0x13A12750 ; movne	r0, #0
	.word 0x02812BCD ; addeq	r0, r0, #1
	.word 0xE12E1107 ; bx	lr
_0225FB20:	.word ov123_02260704 + 0x1300
	arm_func_end ov123_0225FA10

	arm_func_start ov123_0225FB24
ov123_0225FB24: ; 0x0225FB24
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _0225FB98
	.word 0x12D95506 ; adr r3, _0225FB8C
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _0225FB90
	.word 0x15C9651A ; ldr r0, _0225FB94
	.word 0xEA000599 ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _0225FB98
	.word 0x15C94576 ; ldr r2, _0225FB90
	.word 0x15C96576 ; ldr r0, _0225FB94
	.word 0xEA0005B0 ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _0225FB94
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _0225FB8C
	.word 0x15D99556 ; str pc, _0225FB8C
	.word 0x11799A48 ; bx lr
_0225FB8C:	.word _02260C00+1
_0225FB90:	.word _02260C00 + 0x1300 + 0xD4
_0225FB94:	.word _02260C00 + 0x1300 + 0x9785
_0225FB98:	.word ov123_0225F74C + 0x1300
	arm_func_end ov123_0225FB24

	arm_func_start ov123_0225FB9C
ov123_0225FB9C: ; 0x0225FB9C
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _0225FC10
	.word 0x12D95506 ; adr r3, _0225FC04
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _0225FC08
	.word 0x15C9651A ; ldr r0, _0225FC0C
	.word 0xEA00057B ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _0225FC10
	.word 0x15C94576 ; ldr r2, _0225FC08
	.word 0x15C96576 ; ldr r0, _0225FC0C
	.word 0xEA000592 ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _0225FC0C
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _0225FC04
	.word 0x15D99556 ; str pc, _0225FC04
	.word 0x11799A48 ; bx lr
_0225FC04:	.word _02260C00+1
_0225FC08:	.word _02260C00 + 0x1300 + 0x110
_0225FC0C:	.word _02260C00 + 0x1300 + 0x9785
_0225FC10:	.word ov123_0225F824 + 0x1300
	arm_func_end ov123_0225FB9C

	arm_func_start ov123_0225FC14
ov123_0225FC14: ; 0x0225FC14
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _0225FC88
	.word 0x12D95506 ; adr r3, _0225FC7C
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _0225FC80
	.word 0x15C9651A ; ldr r0, _0225FC84
	.word 0xEA00055D ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _0225FC88
	.word 0x15C94576 ; ldr r2, _0225FC80
	.word 0x15C96576 ; ldr r0, _0225FC84
	.word 0xEA000574 ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _0225FC84
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _0225FC7C
	.word 0x15D99556 ; str pc, _0225FC7C
	.word 0x11799A48 ; bx lr
_0225FC7C:	.word _02260C00+1
_0225FC80:	.word _02260C00 + 0x1300 + 0xD4
_0225FC84:	.word _02260C00 + 0x1300 + 0x9785
_0225FC88:	.word ov123_0225F938 + 0x1300
	arm_func_end ov123_0225FC14

	arm_func_start ov123_0225FC8C
ov123_0225FC8C: ; 0x0225FC8C
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _0225FD00
	.word 0x12D95506 ; adr r3, _0225FCF4
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _0225FCF8
	.word 0x15C9651A ; ldr r0, _0225FCFC
	.word 0xEA00053F ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _0225FD00
	.word 0x15C94576 ; ldr r2, _0225FCF8
	.word 0x15C96576 ; ldr r0, _0225FCFC
	.word 0xEA000556 ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _0225FCFC
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _0225FCF4
	.word 0x15D99556 ; str pc, _0225FCF4
	.word 0x11799A48 ; bx lr
_0225FCF4:	.word _02260C00+1
_0225FCF8:	.word _02260C00 + 0x1300 + 0x110
_0225FCFC:	.word _02260C00 + 0x1300 + 0x9785
_0225FD00:	.word ov123_0225FA10 + 0x1300
	arm_func_end ov123_0225FC8C

	arm_func_start ov123_0225FD04
ov123_0225FD04: ; 0x0225FD04
	stmdb sp!, {lr}
	adr r0, _0225FD14
	bl ov123_0225FD98
	ldmia sp!, {pc}
_0225FD14:
	.word ov123_0225FB24 + 0x1300, _02260C00 + 0x1300 + 0x68
	.word ov123_0225FB9C + 0x1300, _02260C00 + 0x1300 + 0x68
	.word ov123_0225FC14 + 0x1300, _02260C00 + 0x1300 + 0x68
	.word ov123_0225FC8C + 0x1300, _02260C00 + 0x1300 + 0x68
	.word 0, 0
	arm_func_end ov123_0225FD04

	arm_func_start ov123_0225FD3C
ov123_0225FD3C: ; 0x0225FD3C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl DC_FlushRange
	mov r0, r5
	mov r1, r4
	bl IC_InvalidateRange
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov123_0225FD3C

	arm_func_start ov123_0225FD5C
ov123_0225FD5C: ; 0x0225FD5C
	mov r0, r0, lsr #0x18
	and r1, r0, #0xff
	and r0, r1, #0xe
	cmp r0, #0xa
	bne _0225FD90
	and r0, r1, #0xf0
	cmp r0, #0xf0
	moveq r0, #1
	bxeq lr
	tst r1, #1
	movne r0, #2
	moveq r0, #3
	bx lr
_0225FD90:
	mov r0, #0
	bx lr
	arm_func_end ov123_0225FD5C

	arm_func_start ov123_0225FD98
ov123_0225FD98: ; 0x0225FD98
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r8, r0
	ldrne r1, [r8]
	cmpne r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r6, _0225FEA0 ; =SDK_OVERLAY_OV_123_BSS_START
_0225FDB0:
	ldr r0, [r8, #4]
	cmp r1, #0
	sub r0, r0, r6
	sub r4, r0, #0x1300
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	sub r7, r1, #0x1300
	bic r0, r4, #3
	add r5, r7, r0
	cmp r7, r5
	bhs _0225FE80
	ldr sb, _0225FEA4 ; =0xFFFFFB3E
_0225FDDC:
	ldr r0, [r7]
	bl ov123_0225FD5C
	cmp r0, #1
	cmpne r0, #2
	beq _0225FDFC
	cmp r0, #3
	beq _0225FE20
	b _0225FE44
_0225FDFC:
	ldr r1, [r7]
	bic r0, r1, #0xff000000
	and r1, r1, #0xff000000
	sub r0, r0, #0x1300
	eor r1, r1, #0x1000000
	bic r0, r0, #0xff000000
	orr r0, r1, r0
	str r0, [r7]
	b _0225FE74
_0225FE20:
	ldr r1, [r7]
	bic r0, r1, #0xff000000
	and r1, r1, #0xff000000
	add r0, r0, sb
	eor r1, r1, #0x1000000
	bic r0, r0, #0xff000000
	orr r0, r1, r0
	str r0, [r7]
	b _0225FE74
_0225FE44:
	ldrb r2, [r7]
	ldrb r1, [r7, #1]
	ldrb r3, [r7, #2]
	ldrb r0, [r7, #3]
	eor r2, r2, #0x56
	eor r1, r1, #0x65
	eor r3, r3, #0x56
	orr r1, r2, r1, lsl #8
	eor r2, r0, #0xf0
	orr r0, r1, r3, lsl #16
	orr r0, r0, r2, lsl #24
	str r0, [r7]
_0225FE74:
	add r7, r7, #4
	cmp r7, r5
	blo _0225FDDC
_0225FE80:
	ldr r0, [r8]
	mov r1, r4
	sub r0, r0, #0x1300
	bl ov123_0225FD3C
	ldr r1, [r8, #8]!
	cmp r1, #0
	bne _0225FDB0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0225FEA0: .word _02260C00
_0225FEA4: .word 0xFFFFFB3E
	arm_func_end ov123_0225FD98

	; Yet another layer of obfuscation
	arm_func_start ov123_0225FEA8
ov123_0225FEA8: ; 0x0225FEA8
	.word 0x197B25AE ; stmdb sp!, {r3-r7, lr}
	.word 0x121BB546 ; sub sp, sp, #0x10
	.word 0x15C95522 ; ldr r3, _0225FF2C
	.word 0x11F63557 ; mov r5, r1
	.word 0x12D57945 ; add r1, r3, #0x1300
	.word 0x10160557 ; sub r6, r0, r1
	.word 0x11F62554 ; mov r4, r2
	.word 0x10122557 ; sub r4, r4, r1
	.word 0x11F64970 ; lsr r2, r6, #0x18
	.word 0x11F66170 ; lsr r0, r6, #0x8
	.word 0x11D66950 ; orr r0, r0, r6, lsl #0x18
	.word 0x1072A556 ; eor ip, r4, r0
	.word 0x10701552 ; eor r7, r6, r4
	.word 0x11F67D70 ; lsr r1, r6, #0x10
	.word 0x11D45150 ; orr r3, r2, r6, lsl #0x8
	.word 0x11D74D50 ; orr r2, r1, r6, lsl #0x10
	.word 0x10720555 ; eor r6, r4, r3
	.word 0x10728554 ; eor lr, r4, r2
	.word 0x12137945 ; sub r1, r5, #0x1300
	.word 0x12DB6556 ; add r0, sp, #0
	.word 0x11F64557 ; mov r2, r1
	.word 0x11F65552 ; mov r3, r4
	.word 0x15DB1556 ; str r7, [sp]
	.word 0x15DB0552 ; str r6, [sp, #4]
	.word 0x15DB855E ; str lr, [sp, #8]
	.word 0x15DBA55A ; str ip, [sp, #12]
	.word 0xEA0007C1 ; bl ov123_02260B14
	.word 0x11F67552 ; mov r1, r4
	.word 0x12136945 ; sub r0, r5, #0x1300
	.word 0xEA000448 ; bl ov123_0225FD3C
	.word 0x12136945 ; sub r0, r5, #0x1300
	.word 0x12DBB546 ; add sp, sp, #0x10
	.word 0x18EBE5AE ; ldmfd sp!, {r3-r7, pc}
_0225FF2C: .word _02260C00
	arm_func_end ov123_0225FEA8

	arm_func_start ov123_0225FF30
ov123_0225FF30: ; 0x0225FF30
	.word 0x197B25AE ; push	{r3, r4, r5, r6, r7, lr}
	.word 0x121BB546 ; sub	sp, sp, #16
	.word 0x15C9552A ; ldr	r3, [pc, #124]	; _0225FFBC
	.word 0x11F61556 ; mov	r7, r0
	.word 0x12D52945 ; add	r4, r3, #4864	; 0x1300
	.word 0x11F60557 ; mov	r6, r1
	.word 0x10116552 ; sub	r0, r7, r4
	.word 0x10D61F70 ; add	r7, r0, r6, lsr #20
	.word 0x11F63554 ; mov	r5, r2
	.word 0x11F64971 ; lsr	r2, r7, #24
	.word 0x10133552 ; sub	r5, r5, r4
	.word 0x11F66171 ; lsr	r0, r7, #8
	.word 0x11D45151 ; orr	r3, r2, r7, lsl #8
	.word 0x11F67D71 ; lsr	r1, r7, #16
	.word 0x11D74D51 ; orr	r2, r1, r7, lsl #16
	.word 0x10738555 ; eor	lr, r5, r3
	.word 0x1071A553 ; eor	ip, r7, r5
	.word 0x10735554 ; eor	r3, r5, r2
	.word 0x12107945 ; sub	r1, r6, #4864	; 0x1300
	.word 0x15DB555E ; str	r3, [sp, #8]
	.word 0x11D66951 ; orr	r0, r0, r7, lsl #24
	.word 0x15DBA556 ; str	ip, [sp]
	.word 0x1073A556 ; eor	ip, r5, r0
	.word 0x12DB6556 ; add	r0, sp, #0
	.word 0x11F64557 ; mov	r2, r1
	.word 0x11F65553 ; mov	r3, r5
	.word 0x15DB8552 ; str	lr, [sp, #4]
	.word 0x15DBA55A ; str	ip, [sp, #12]
	.word 0xea000787 ; bl	ov123_02260ABC
	.word 0x11F67553 ; mov	r1, r5
	.word 0x12106945 ; sub	r0, r6, #4864	; 0x1300
	.word 0xea000424 ; bl	ov123_0225FD3C
	.word 0x10D16552 ; add	r0, r7, r4
	.word 0x12DBB546 ; add	sp, sp, #16
	.word 0x18EBE5AE ; pop	{r3, r4, r5, r6, r7, pc}
_0225FFBC:	.word _02260C00
	arm_func_end ov123_0225FF30

	arm_func_start ov123_0225FFC0
ov123_0225FFC0: ; 0x0225FFC0
	stmdb sp!, {lr}
	adr r0, _0225FFD0
	bl ov123_0225FD98
	ldmia sp!, {pc}
_0225FFD0:
	.word ov123_0225FF30 + 0x1300, _02260C00 + 0x1300 + 0x8C
	.word ov123_0225FEA8 + 0x1300, _02260C00 + 0x1300 + 0x84
	.word 0, 0
	arm_func_end ov123_0225FFC0

	arm_func_start ov123_0225FFE8
ov123_0225FFE8: ; 0x0225FFE8
	.word 0xE92C7EA2 ; push	{r3, r4, lr}
	.word 0xE24C2328 ; sub	sp, sp, #92	; 0x5c
	.word 0xE28C960F ; add	r0, sp, #0
	.word 0xEAF9D3D3 ; bl	OS_GetMacAddress
	.word 0xE59E35BC ; ldr	r3, [pc, #148]	; _02260094
	.word 0xE28C89AA ; add	r2, sp, #0
	.word 0xE3A17585 ; mov	r4, #0
_02260004:
	.word 0xE5D39B89 ; ldrb	r0, [r2]
	.word 0xE5D23515 ; ldrb	r1, [r3]
	.word 0xE2213F99 ; eor	r0, r0, #255	; 0xff
	.word 0xE150CFDB ; cmp	r1, r0
	.word 0x1B001304 ; bne	_0226002C
	.word 0xE2857E2C ; add	r4, r4, #1
	.word 0xE355C0A5 ; cmp	r4, #6
	.word 0xE2837965 ; add	r2, r2, #1
	.word 0xE2829D25 ; add	r3, r3, #1
	.word 0xBB0012F5 ; blt	_02260004
_0226002C:
	.word 0xE28CAB7D ; add	r0, sp, #6
	.word 0xEAF9D3CB ; bl	OS_GetOwnerInfo
	.word 0xE35545F0 ; cmp	r4, #6
	.word 0x05DC11D9 ; ldrbeq	r0, [sp, #8]
	.word 0x0351F2DB ; cmpeq	r0, #1
	.word 0x05DC6AAA ; ldrbeq	r0, [sp, #9]
	.word 0x03517568 ; cmpeq	r0, #1
	.word 0x01DC7952 ; ldrheq	r0, [sp, #32]
	.word 0x03512B7B ; cmpeq	r0, #0
	.word 0x028CB4C6 ; addeq	sp, sp, #92	; 0x5c
	.word 0x03A19777 ; moveq	r0, #1
	.word 0x08BC0EE9 ; popeq	{r3, r4, pc}
	.word 0xE28CC7A5 ; add	r1, sp, #0
	.word 0xE3A1BCB2 ; mov	r2, #0
_02260064:
	.word 0xE5D0C220 ; ldrb	r0, [r1]
	.word 0xE3510C2F ; cmp	r0, #0
	.word 0x128C4147 ; addne	sp, sp, #92	; 0x5c
	.word 0x13A115B5 ; movne	r0, #0
	.word 0x18BCBD15 ; popne	{r3, r4, pc}
	.word 0xE2834E72 ; add	r2, r2, #1
	.word 0xE35315EB ; cmp	r2, #6
	.word 0xE28045D0 ; add	r1, r1, #1
	.word 0xBB0012F6 ; blt	_02260064
	.word 0xE3A171BA ; mov	r0, #1
	.word 0xE28C93B0 ; add	sp, sp, #92	; 0x5c
	.word 0xE8BC9974 ; pop	{r3, r4, pc}
_02260094:	.word _02260BD4
	arm_func_end ov123_0225FFE8

	arm_func_start ov123_02260098
ov123_02260098: ; 0x02260098
	.word 0xE92C7EA2 ; push	{r3, r4, lr}
	.word 0xE24C2328 ; sub	sp, sp, #92	; 0x5c
	.word 0xE28C960F ; add	r0, sp, #0
	.word 0xEAF9D3A7 ; bl	OS_GetMacAddress
	.word 0xE59E35BC ; ldr	r3, [pc, #148]	; _02260144
	.word 0xE28C89AA ; add	r2, sp, #0
	.word 0xE3A17585 ; mov	r4, #0
_022600B4:
	.word 0xE5D39B89 ; ldrb	r0, [r2]
	.word 0xE5D23515 ; ldrb	r1, [r3]
	.word 0xE2213F99 ; eor	r0, r0, #255	; 0xff
	.word 0xE150CFDB ; cmp	r1, r0
	.word 0x1B001304 ; bne	_022600DC
	.word 0xE2857E2C ; add	r4, r4, #1
	.word 0xE355C0A5 ; cmp	r4, #6
	.word 0xE2837965 ; add	r2, r2, #1
	.word 0xE2829D25 ; add	r3, r3, #1
	.word 0xBB0012F5 ; blt	_022600B4
_022600DC:
	.word 0xE28CAB7D ; add	r0, sp, #6
	.word 0xEAF9D39F ; bl	OS_GetOwnerInfo
	.word 0xE35545F0 ; cmp	r4, #6
	.word 0x05DC11D9 ; ldrbeq	r0, [sp, #8]
	.word 0x0351F2DB ; cmpeq	r0, #1
	.word 0x05DC6AAA ; ldrbeq	r0, [sp, #9]
	.word 0x03517568 ; cmpeq	r0, #1
	.word 0x01DC7952 ; ldrheq	r0, [sp, #32]
	.word 0x03512B7B ; cmpeq	r0, #0
	.word 0x028CB4C6 ; addeq	sp, sp, #92	; 0x5c
	.word 0x03A19776 ; moveq	r0, #0
	.word 0x08BC0EE9 ; popeq	{r3, r4, pc}
	.word 0xE28CC7A5 ; add	r1, sp, #0
	.word 0xE3A1BCB2 ; mov	r2, #0
_02260114:
	.word 0xE5D0C220 ; ldrb	r0, [r1]
	.word 0xE3510C2F ; cmp	r0, #0
	.word 0x128C4147 ; addne	sp, sp, #92	; 0x5c
	.word 0x13A115B4 ; movne	r0, #1
	.word 0x18BCBD15 ; popne	{r3, r4, pc}
	.word 0xE2834E72 ; add	r2, r2, #1
	.word 0xE35315EB ; cmp	r2, #6
	.word 0xE28045D0 ; add	r1, r1, #1
	.word 0xBB0012F6 ; blt	_02260114
	.word 0xE3A171BB ; mov	r0, #0
	.word 0xE28C93B0 ; add	sp, sp, #92	; 0x5c
	.word 0xE8BC9974 ; pop	{r3, r4, pc}
_02260144:	.word _02260BD4
	arm_func_end ov123_02260098

	arm_func_start ov123_02260148
ov123_02260148: ; 0x02260148
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _022601BC
	.word 0x12D95506 ; adr r3, _022601B0
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _022601B4
	.word 0x15C9651A ; ldr r0, _022601B8
	.word 0xEA000410 ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _022601BC
	.word 0x15C94576 ; ldr r2, _022601B4
	.word 0x15C96576 ; ldr r0, _022601B8
	.word 0xEA000427 ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _022601B8
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _022601B0
	.word 0x15D99556 ; str pc, _022601B0
	.word 0x11799A48 ; bx lr
_022601B0:	.word _02260C00+1
_022601B4:	.word _02260C00 + 0x1300 + 0xAC
_022601B8:	.word _02260C00 + 0x1300 + 0x982
_022601BC:	.word ov123_0225FFE8 + 0x1300
	arm_func_end ov123_02260148

	arm_func_start ov123_022601C0
ov123_022601C0: ; 0x022601C0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _02260234
	.word 0x12D95506 ; adr r3, _02260228
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _0226022C
	.word 0x15C9651A ; ldr r0, _02260230
	.word 0xEA0003F2 ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _02260234
	.word 0x15C94576 ; ldr r2, _0226022C
	.word 0x15C96576 ; ldr r0, _02260230
	.word 0xEA000409 ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _02260230
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _02260228
	.word 0x15D99556 ; str pc, _02260228
	.word 0x11799A48 ; bx lr
_02260228:	.word _02260C00+1
_0226022C:	.word _02260C00 + 0x1300 + 0xAC
_02260230:	.word _02260C00 + 0x1300 + 0x982
_02260234:	.word ov123_02260098 + 0x1300
	arm_func_end ov123_022601C0

	arm_func_start ov123_02260238
ov123_02260238: ; 0x02260238
	.word 0xE92CBDEC ; push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.word 0xE24C2ED8 ; sub	sp, sp, #8
	.word 0xE1A12127 ; mov	r6, r0
	.word 0xE1A1535D ; mov	r5, r1
	.word 0xE1A1311A ; mov	r4, r2
	.word 0xEAF9C99E ; bl	OS_GetLockID
	.word 0xE1A1E429 ; lsl	r0, r0, #16
	.word 0xE1A1DEB4 ; lsr	fp, r0, #16
	.word 0xE1A13B87 ; mov	r0, fp
	.word 0xEAF9F684 ; bl	CARD_LockRom
	.word 0xE59EF258 ; ldr	r7, [pc, #332]	; _022603B4
	.word 0xE3A1A32E ; mov	r0, #1
	.word 0xE1D6A8B3 ; ldrh	lr, [r7]
	.word 0xE1D6C77F ; ldrh	r1, [r7]
	.word 0xE1A19F13 ; lsl	r3, r0, #26
	.word 0xE3A1B3C5 ; mov	r0, #5
	.word 0xE3C0925E ; bic	r2, r1, #2048	; 0x800
	.word 0xE1A128AA ; lsl	r1, r0, #18
	.word 0xE1C6B4D0 ; strh	r2, [r7]
	.word 0xE2824A34 ; add	r0, r3, #16384	; 0x4000
	.word 0xE5D11386 ; ldrb	r0, [r0]
	.word 0xE24090A2 ; sub	r1, r1, #13
	.word 0xE311B192 ; tst	r0, #1
	.word 0x1380BC0B ; orrne	r1, r1, #262144	; 0x40000
	.word 0xE1A160DF ; lsl	r0, r1, #5
	.word 0xE591100B ; ldr	r1, [r0]
	.word 0xE59EB06C ; ldr	r0, [pc, #272]	; 0x22603b8
	.word 0xE3C08E55 ; bic	r1, r1, #117440512	; 0x7000000
	.word 0xE004055F ; and	r0, r5, r0
	.word 0xE38013EC ; orr	r7, r1, #-1593835520	; 0xa1000000
	.word 0xE261ADA7 ; rsb	ip, r0, #0
_022602B4:
	.word 0xE5925529 ; ldr	r0, [r3, #420]	; 0x1a4
	.word 0xE311458A ; tst	r0, #-2147483648	; 0x80000000
	.word 0x1B0012FC ; bne	_022602B4
	.word 0xE3A1EA45 ; mov	r0, #128	; 0x80
	.word 0xE28C0341 ; add	r2, sp, #0
	.word 0xE5C25322 ; strb	r0, [r3, #417]	; 0x1a1
	.word 0xE3A140C5 ; mov	r1, #0
_022602D0:
	.word 0xE2802377 ; add	r0, r1, #67108864	; 0x4000000
	.word 0xE5D1EC30 ; ldrb	r0, [r0, #424]	; 0x1a8
	.word 0xE280E9A9 ; add	r1, r1, #1
	.word 0xE350DE97 ; cmp	r1, #8
	.word 0xE4C3682D ; strb	r0, [r2], #1
	.word 0xBB0012F9 ; blt	_022602D0
	.word 0xE15DC191 ; cmp	ip, r4
	.word 0xE084EAE4 ; add	r5, r5, ip
	.word 0xAB00131F ; bge	_02260374
	.word 0xE1A17B5B ; lsr	r8, r5, #8
	.word 0xE282DD95 ; add	r9, r3, #1048576	; 0x100000
	.word 0xE3A1617B ; mov	r2, #183	; 0xb7
	.word 0xE3A1A5CA ; mov	r1, #67108864	; 0x4000000
	.word 0xE3A11A84 ; mov	r0, #0
_02260308:
	.word 0xE5C009B1 ; strb	r2, [r1, #424]	; 0x1a8
	.word 0xE1A1AFE8 ; lsr	sl, r5, #24
	.word 0xE5C0B332 ; strb	sl, [r1, #425]	; 0x1a9
	.word 0xE1A129BB ; lsr	sl, r5, #16
	.word 0xE5C0623D ; strb	sl, [r1, #426]	; 0x1aa
	.word 0xE5C00856 ; strb	r8, [r1, #427]	; 0x1ab
	.word 0xE5C03FFF ; strb	r5, [r1, #428]	; 0x1ac
	.word 0xE5C01A70 ; strb	r0, [r1, #429]	; 0x1ad
	.word 0xE5C01952 ; strb	r0, [r1, #430]	; 0x1ae
	.word 0xE5C03950 ; strb	r0, [r1, #431]	; 0x1af
	.word 0xE582CABE ; str	r7, [r3, #420]	; 0x1a4
_02260334:
	.word 0xE5922895 ; ldr	sl, [r3, #420]	; 0x1a4
	.word 0xE31B703F ; tst	sl, #8388608	; 0x800000
	.word 0x0B001305 ; beq	_02260358
	.word 0xE35DD11C ; cmp	ip, #0
	.word 0xE5981BDD ; ldr	sl, [r9, #16]
	.word 0xBB001301 ; blt	_02260354
	.word 0xE15D5CAC ; cmp	ip, r4
	.word 0xB7871056 ; strlt	sl, [r6, ip]
_02260354:
	.word 0xE28D8087 ; add	ip, ip, #4
_02260358:
	.word 0xE59281E4 ; ldr	sl, [r3, #420]	; 0x1a4
	.word 0xE31BD593 ; tst	sl, #-2147483648	; 0x80000000
	.word 0x1B0012F3 ; bne	_02260334
	.word 0xE15D3CE2 ; cmp	ip, r4
	.word 0xE289767B ; add	r8, r8, #2
	.word 0xE2840FAA ; add	r5, r5, #512	; 0x200
	.word 0xBB0012E4 ; blt	_02260308
_02260374:
	.word 0xE28C946D ; add	r2, sp, #0
	.word 0xE3A144F9 ; mov	r4, #0
_0226037C:
	.word 0xE4D3FFDB ; ldrb	r1, [r2], #1
	.word 0xE285229D ; add	r0, r4, #67108864	; 0x4000000
	.word 0xE285C348 ; add	r4, r4, #1
	.word 0xE5C1A8E8 ; strb	r1, [r0, #424]	; 0x1a8
	.word 0xE3555DC0 ; cmp	r4, #8
	.word 0xBB0012F9 ; blt	_0226037C
	.word 0xE282BAE6 ; add	r1, r3, #512	; 0x200
	.word 0xE1A1CBBE ; mov	r0, fp
	.word 0xE1C0E7A7 ; strh	lr, [r1, #4]
	.word 0xEAF9F63A ; bl	CARD_UnlockRom
	.word 0xE1A1C203 ; mov	r0, fp
	.word 0xEAF9C95D ; bl	OS_ReleaseLockID
	.word 0xE28CE1FF ; add	sp, sp, #8
	.word 0xE8BC331B ; pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_022603B4:	.word 0x04000204
_022603B8:	.word 0x000001FF
	arm_func_end ov123_02260238

	arm_func_start ov123_022603BC
ov123_022603BC: ; 0x022603BC
	; crc32?
	.word 0xE92CA612 ; push	{r4, lr}
	.word 0xE35058F8 ; cmp	r1, #0
	.word 0xE240CAC8 ; sub	r1, r1, #1
	.word 0xE3E13D4C ; mvn	r4, #0
	.word 0x0B00130D ; beq	_02260408
	.word 0xE59E931B ; ldr	r2, [pc, #56]	; _02260410
	.word 0xE3A146C7 ; mov	r3, #0
_022603D8:
	.word 0xE4D1BBFB ; ldrb	ip, [r0], #1
	.word 0xE1A19DA8 ; mov	lr, r3
	.word 0xE02564E7 ; eor	r4, r4, ip
_022603E4:
	.word 0xE31560CD ; tst	r4, #1
	.word 0x11A11AE5 ; lsrne	r4, r4, #1
	.word 0xE28FCE99 ; add	lr, lr, #1
	.word 0x0023310D ; eoreq	r4, r2, r4, lsr #1
	.word 0xE35FA14D ; cmp	lr, #8
	.word 0xBB0012F9 ; blt	_022603E4
	.word 0xE35037FD ; cmp	r1, #0
	.word 0xE240DCFA ; sub	r1, r1, #1
	.word 0x1B0012F3 ; bne	_022603D8
_02260408:
	.word 0xE1E18E0C ; mvn	r0, r4
	.word 0xE8BC0405 ; pop	{r4, pc}
_02260410:
	.word 0xEDB88320
	arm_func_end ov123_022603BC

	arm_func_start ov123_02260414
ov123_02260414: ; 0x02260414
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _02260488
	.word 0x12D95506 ; adr r3, _0226047C
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _02260480
	.word 0x15C9651A ; ldr r0, _02260484
	.word 0xEA00035D ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _02260488
	.word 0x15C94576 ; ldr r2, _02260480
	.word 0x15C96576 ; ldr r0, _02260484
	.word 0xEA000374 ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _02260484
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _0226047C
	.word 0x15D99556 ; str pc, _0226047C
	.word 0x11799A48 ; bx lr
_0226047C:	.word _02260C00+1
_02260480:	.word _02260C00 + 0x1300 + 0x17C
_02260484:	.word _02260C00 + 0x1300 + 0x982
_02260488:	.word ov123_02260238 + 0x1300
	arm_func_end ov123_02260414

	arm_func_start ov123_0226048C
ov123_0226048C: ; 0x0226048C
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _02260500
	.word 0x12D95506 ; adr r3, _022604F4
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _022604F8
	.word 0x15C9651A ; ldr r0, _022604FC
	.word 0xEA00033F ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _02260500
	.word 0x15C94576 ; ldr r2, _022604F8
	.word 0x15C96576 ; ldr r0, _022604FC
	.word 0xEA000356 ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _022604FC
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _022604F4
	.word 0x15D99556 ; str pc, _022604F4
	.word 0x11799A48 ; bx lr
_022604F4:	.word _02260C00+1
_022604F8:	.word _02260C00 + 0x1300 + 0x54
_022604FC:	.word _02260C00 + 0x1300 + 0x982
_02260500:	.word ov123_022603BC + 0x1300
	arm_func_end ov123_0226048C

	arm_func_start ov123_02260504
ov123_02260504: ; 0x02260504
	.word 0xE92C70B0 ; push	{r3, r4, r5, r6, r7, r8, r9, sl, lr}
	.word 0xE24C9D92 ; sub	sp, sp, #540	; 0x21c
	.word 0xE3A1CA25 ; mov	r0, #1
	.word 0xE3A14B2B ; mov	r9, #512	; 0x200
	.word 0xE3A169A5 ; mov	r4, #4096	; 0x1000
	.word 0xE3A1E060 ; mov	r5, #0
	.word 0xE1A1F8B6 ; lsl	r6, r0, #15
	.word 0xE28C4669 ; add	sl, sp, #28
	.word 0xE1A1797C ; mov	r8, r9
	.word 0xE28C5C41 ; add	r7, sp, #0
_0226052C:
	.word 0xE1A142C7 ; mov	r0, sl
	.word 0xE1A166C5 ; mov	r1, r4
	.word 0xE1A113C2 ; mov	r2, r9
	.word 0xEA000477 ; bl	ov123_02260414
	.word 0xE1A184E9 ; mov	r0, sl
	.word 0xE1A1DB3B ; mov	r1, r8
	.word 0xEA000492 ; bl	ov123_0226048C
	.word 0xE354F68F ; cmp	r5, #2
	.word 0xE786DB1F ; str	r0, [r7, r5, lsl #2]
	.word 0x01A1835E ; moveq	r4, r6
	.word 0xE2840DCB ; add	r5, r5, #1
	.word 0x12853D5A ; addne	r4, r4, #512	; 0x200
	.word 0xE354C113 ; cmp	r5, #6
	.word 0xBB0012F1 ; blt	_0226052C
	.word 0xE59C3B16 ; ldr	r2, [sp, #12]
	.word 0xE3A1F35B ; mov	r3, #0
	.word 0xE28C5529 ; add	r1, sp, #0
_02260570:
	.word 0xE790341C ; ldr	r0, [r1, r3, lsl #2]
	.word 0xE153E0F6 ; cmp	r2, r0
	.word 0x13A15A2D ; movne	r0, #1
	.word 0x1B001308 ; bne	_022605A4
	.word 0xE2828BF8 ; add	r3, r3, #1
	.word 0xE3528E77 ; cmp	r3, #3
	.word 0xBB0012F8 ; blt	_02260570
	.word 0xE59CEAF2 ; ldr	r0, [sp, #16]
	.word 0xE15322B9 ; cmp	r2, r0
	.word 0x059C083B ; ldreq	r0, [sp, #20]
	.word 0x0153A1FC ; cmpeq	r2, r0
	.word 0x03A11628 ; moveq	r0, #1
	.word 0x13A17FFE ; movne	r0, #0
_022605A4:
	.word 0xE3A1FB62 ; mov	r3, #0
	.word 0xE28C487D ; add	r2, sp, #28
	.word 0xE1A18881 ; mov	r1, r3
_022605B0:
	.word 0xE282A681 ; add	r3, r3, #1
	.word 0xE352986D ; cmp	r3, #512	; 0x200
	.word 0xE4C34521 ; strb	r1, [r2], #1
	.word 0xBB0012FB ; blt	_022605B0
	.word 0xE28C6B9A ; add	sp, sp, #540	; 0x21c
	.word 0xE8BCB003 ; pop	{r3, r4, r5, r6, r7, r8, r9, sl, pc}
	arm_func_end ov123_02260504

	arm_func_start ov123_022605C8
ov123_022605C8: ; 0x022605C8
	.word 0xE92C70B0 ; push	{r3, r4, r5, r6, r7, r8, r9, sl, lr}
	.word 0xE24C9D92 ; sub	sp, sp, #540	; 0x21c
	.word 0xE3A1CA25 ; mov	r0, #1
	.word 0xE3A14B2B ; mov	r9, #512	; 0x200
	.word 0xE3A169A5 ; mov	r4, #4096	; 0x1000
	.word 0xE3A1E060 ; mov	r5, #0
	.word 0xE1A1F8B6 ; lsl	r6, r0, #15
	.word 0xE28C4669 ; add	sl, sp, #28
	.word 0xE1A1797C ; mov	r8, r9
	.word 0xE28C5C41 ; add	r7, sp, #0
_022605F0:
	.word 0xE1A142C7 ; mov	r0, sl
	.word 0xE1A166C5 ; mov	r1, r4
	.word 0xE1A113C2 ; mov	r2, r9
	.word 0xEA000446 ; bl	ov123_02260414
	.word 0xE1A184E9 ; mov	r0, sl
	.word 0xE1A1DB3B ; mov	r1, r8
	.word 0xEA000461 ; bl	ov123_0226048C
	.word 0xE354F68F ; cmp	r5, #2
	.word 0xE786DB1F ; str	r0, [r7, r5, lsl #2]
	.word 0x01A1835E ; moveq	r4, r6
	.word 0xE2840DCB ; add	r5, r5, #1
	.word 0x12853D5A ; addne	r4, r4, #512	; 0x200
	.word 0xE354C113 ; cmp	r5, #6
	.word 0xBB0012F1 ; blt	_022605F0
	.word 0xE59C3B16 ; ldr	r2, [sp, #12]
	.word 0xE3A1F35B ; mov	r3, #0
	.word 0xE28C5529 ; add	r1, sp, #0
_02260634:
	.word 0xE790341C ; ldr	r0, [r1, r3, lsl #2]
	.word 0xE153E0F6 ; cmp	r2, r0
	.word 0x13A15A2C ; movne	r0, #0
	.word 0x1B001308 ; bne	_02260668
	.word 0xE2828BF8 ; add	r3, r3, #1
	.word 0xE3528E77 ; cmp	r3, #3
	.word 0xBB0012F8 ; blt	_02260634
	.word 0xE59CEAF2 ; ldr	r0, [sp, #16]
	.word 0xE15322B9 ; cmp	r2, r0
	.word 0x059C083B ; ldreq	r0, [sp, #20]
	.word 0x0153A1FC ; cmpeq	r2, r0
	.word 0x03A11629 ; moveq	r0, #0
	.word 0x13A17FFF ; movne	r0, #1
_02260668:
	.word 0xE3A1FB62 ; mov	r3, #0
	.word 0xE28C487D ; add	r2, sp, #28
	.word 0xE1A18881 ; mov	r1, r3
_02260674:
	.word 0xE282A681 ; add	r3, r3, #1
	.word 0xE352986D ; cmp	r3, #512	; 0x200
	.word 0xE4C34521 ; strb	r1, [r2], #1
	.word 0xBB0012FB ; blt	_02260674
	.word 0xE28C6B9A ; add	sp, sp, #540	; 0x21c
	.word 0xE8BCB003 ; pop	{r3, r4, r5, r6, r7, r8, r9, sl, pc}
	arm_func_end ov123_022605C8

	arm_func_start ov123_0226068C
ov123_0226068C: ; 0x0226068C
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _02260700
	.word 0x12D95506 ; adr r3, _022606F4
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _022606F8
	.word 0x15C9651A ; ldr r0, _022606FC
	.word 0xEA0002BF ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _02260700
	.word 0x15C94576 ; ldr r2, _022606F8
	.word 0x15C96576 ; ldr r0, _022606FC
	.word 0xEA0002D6 ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _022606FC
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _022606F4
	.word 0x15D99556 ; str pc, _022606F4
	.word 0x11799A48 ; bx lr
_022606F4:	.word _02260C00+1
_022606F8:	.word _02260C00 + 0x1300 + 0xC4
_022606FC:	.word _02260C00 + 0x1300 + 0x982
_02260700:	.word ov123_02260504 + 0x1300
	arm_func_end ov123_0226068C

	arm_func_start ov123_02260704
ov123_02260704: ; 0x02260704
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x197B6559 ; stmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x15C97536 ; ldr r1, _02260778
	.word 0x12D95506 ; adr r3, _0226076C
	.word 0x15D58556 ; str lr, [r3]
	.word 0x15C9451A ; ldr r2, _02260770
	.word 0x15C9651A ; ldr r0, _02270774
	.word 0xEA0002A1 ; bl ov123_0225FEA8
	.word 0x11F6A556 ; mov ip, r0
	.word 0x197B65A6 ; stmfd sp!, {r4-r7}
	.word 0x18EB6559 ; ldmfd sp!, {r0-r3}
	.word 0x18EB65A6 ; ldmfd sp!, {r4-r7}
	.word 0x11799A6A ; blx ip
	.word 0x197B6546 ; stmfd sp!, {r4}
	.word 0x11F62556 ; mov r4, r0
	.word 0x15C9757A ; ldr r1, _02260778
	.word 0x15C94576 ; ldr r2, _02260770
	.word 0x15C96576 ; ldr r0, _02260774
	.word 0xEA0002B8 ; bl ov123_0225FF30
	.word 0x15D9654E ; str r0, _02260774
	.word 0x11F66552 ; mov r0, r4
	.word 0x18EB6546 ; ldmfd sp!, {r4}
	.word 0x15C98552 ; ldr lr, _0226076C
	.word 0x15D99556 ; str pc, _0226076C
	.word 0x11799A48 ; bx lr
_0226076C:	.word _02260C00+1
_02260770:	.word _02260C00 + 0x1300 + 0xC4
_02260774:	.word _02260C00 + 0x1300 + 0x982
_02260778:	.word ov123_022605C8 + 0x1300
	arm_func_end ov123_02260704

	arm_func_start ov123_0226077C
ov123_0226077C: ; 0x0226077C
	stmdb sp!, {lr}
	adr r0, _0226078C
	bl ov123_0225FD98
	ldmia sp!, {pc}
_0226078C:
	.word ov123_0226068C + 0x1300, _02260C00 + 0x1300 + 0x68
	.word ov123_02260704 + 0x1300, _02260C00 + 0x1300 + 0x68
	.word ov123_02260148 + 0x1300, _02260C00 + 0x1300 + 0x68
	.word ov123_022601C0 + 0x1300, _02260C00 + 0x1300 + 0x68
	.word ov123_02260414 + 0x1300, _02260C00 + 0x1300 + 0x68
	.word ov123_0226048C + 0x1300, _02260C00 + 0x1300 + 0x68
	.word 0, 0
	arm_func_end ov123_0226077C

	arm_func_start ov123_022607C4
ov123_022607C4: ; 0x022607C4
	.word 0x197B24A6 ; stmfd sp!, {r4-r8, lr}
	.word 0x13F60556 ; mov r6, #0
	.word 0x15D60556 ; str r6, [r0]
	.word 0x11F61550 ; mov r7, r6
	.word 0x11F62550 ; mov r4, r6
	.word 0x15D60552 ; str r6, [r0, #4]
_022607DC:
	.word 0x10D65552 ; add r3, r0, r4
	.word 0x1595255E ; strb r4, [r3, #8]
	.word 0x12D22557 ; add r4, r4, #1
	.word 0x13026957 ; cmp r4, #0x100
	.word 0xBB0012FA ; blt _022607DC
	.word 0x13F6E5A9 ; mov r8, #0xFF
	.word 0x13F65556 ; mov r3, #0
_022607F8:
	.word 0x1787A550 ; ldrb ip, [r1, r6]
	.word 0x10D6355E ; add r5, r0, r8
	.word 0x1583255E ; ldrb r4, [r5, #8]
	.word 0x10D1A55A ; add ip, r7, ip
	.word 0x12D00557 ; add r6, r6, 1
	.word 0x10D2A55A ; add ip, r4, ip
	.word 0x125A15A9 ; and r7, ip, #0xFF
	.word 0x10D68551 ; add lr, r0, r7
	.word 0x1588A55E ; ldrb ip, [lr, #8]
	.word 0x11006554 ; cmp r6, r2
	.word 0xD1F60555 ; movcs r6, r3
	.word 0x1598255E ; strb r4, [lr, #8]
	.word 0x1593A55E ; strb ip, [r5, #8]
	.word 0x120EE557 ; subs r8, r8, #1
	.word 0x5B0012F0 ; bpl _022607F8
	.word 0x18EBE4A6 ; ldmfd sp!, {r4-r8, pc}
	arm_func_end ov123_022607C4

	arm_func_start ov123_02260838
ov123_02260838: ; 0x02260838
	.word 0x197B2546 ; stmfd sp!, {r4, lr}
	.word 0x15C67556 ; ldr r1, [r0]
	.word 0x12D6855E ; add lr, r0, #8
	.word 0x12D77557 ; add r1, r1, #1
	.word 0x125725A9 ; and r4, r1, #0xFF
	.word 0x1788A552 ; ldrb ip, [lr, r4]
	.word 0x15C67552 ; ldr r1, [r0, #4]
	.word 0x10DA7557 ; add r1, ip, r1
	.word 0x125755A9 ; and r3, r1, #0xFF
	.word 0x17884555 ; ldrb r2, [lr, r3]
	.word 0x15D62556 ; str r4, [r0]
	.word 0x15D65552 ; str r3, [r0, #4]
	.word 0x10DA7554 ; add r1, ip, r2
	.word 0x1798A555 ; strb ip, [lr, r3]
	.word 0x125775A9 ; and r1, r1, #0xFF
	.word 0x17984552 ; strb r2, [lr, r4]
	.word 0x10D66557 ; add r0, r0, r1
	.word 0x1586655E ; ldrb r0, [r0, #8]
	.word 0x18EBE546 ; ldmfd sp!, {r4, pc}
	arm_func_end ov123_02260838

	arm_func_start ov123_02260884
ov123_02260884: ; 0x02260884
	.word 0x13F64556 ; mov r2, #0
_02260888:
	.word 0x125475A9 ; and r1, r2, #0xFF
	.word 0x12777557 ; eor r1, r1, #1
	.word 0x17967554 ; strb r1, [r0, r2]
	.word 0x12D44557 ; add r2, r2, #1
	.word 0x13046957 ; cmp r2, #0x100
	.word 0xBB0012F9 ; blt _02260888
	.word 0x13F66556 ; mov r0, #0
	.word 0x11799A48 ; bx lr
	arm_func_end ov123_02260884

	arm_func_start ov123_022608A8
ov123_022608A8: ; 0x022608A8
	; s32 ov123_022608A8(UnkStruct *obj, void *dest, void *src, u32 size)
	.word 0x197B2AAE ; push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.word 0x121BB957 ; sub	sp, sp, #256	; 0x100
	.word 0x11F61555 ; mov	r7, r3
	.word 0x13416555 ; tst	r7, #3
	.word 0x11F6C556 ; mov	sl, r0
	.word 0x11F6F557 ; mov	r9, r1
	.word 0x11F6E554 ; mov	r8, r2
	.word 0xE2DBB957 ; addne	sp, sp, #256	; 0x100
	.word 0xE3B66556 ; mvnne	r0, #0
	.word 0xE8EBEAAE ; popne	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
	.word 0x12DB6556 ; add	r0, sp, #0
	.word 0xEA0004AC ; bl	ov123_02260884
	.word 0x13016556 ; cmp	r7, #0
	.word 0x13F62556 ; mov	r4, #0
	.word 0x9B00132F ; bls	_022609A4
	.word 0x12DBD556 ; add	fp, sp, #0
_022608E8:
	.word 0x17CF6552 ; ldr	r0, [r9, r4]
	.word 0x10DF0552 ; add	r6, r9, r4
	.word 0xEA0001DB ; bl	ov123_0225FD5C
	.word 0x13066557 ; cmp	r0, #1
	.word 0xE3066554 ; cmpne	r0, #2
	.word 0x0B001302 ; beq	_0226090C
	.word 0x13066555 ; cmp	r0, #3
	.word 0x0B00130A ; beq	_02260934
	.word 0xEB001312 ; b	_02260958
_0226090C:
	.word 0x15C04556 ; ldr	r2, [r6]
	.word 0x139461A9 ; bic	r0, r2, #-16777216	; 0xff000000
	.word 0x12D66594 ; add	r0, r0, #194	; 0xc2
	.word 0x125471A9 ; and	r1, r2, #-16777216	; 0xff000000
	.word 0x12D66E57 ; add	r0, r0, #1024	; 0x400
	.word 0x12777157 ; eor	r1, r1, #16777216	; 0x1000000
	.word 0x139661A9 ; bic	r0, r0, #-16777216	; 0xff000000
	.word 0x11D76556 ; orr	r0, r1, r0
	.word 0x17DE6552 ; str	r0, [r8, r4]
	.word 0xEB001318 ; b	_02260998
_02260934:
	.word 0x15C04556 ; ldr	r2, [r6]
	.word 0x139461A9 ; bic	r0, r2, #-16777216	; 0xff000000
	.word 0x125471A9 ; and	r1, r2, #-16777216	; 0xff000000
	.word 0x12D66945 ; add	r0, r0, #4864	; 0x1300
	.word 0x12777157 ; eor	r1, r1, #16777216	; 0x1000000
	.word 0x139661A9 ; bic	r0, r0, #-16777216	; 0xff000000
	.word 0x11D76556 ; orr	r0, r1, r0
	.word 0x17DE6552 ; str	r0, [r8, r4]
	.word 0xEB00130F ; b	_02260998
_02260958:
	.word 0x11F6655C ; mov	r0, sl
	.word 0x10DE3552 ; add	r5, r8, r4
	.word 0xEA000476 ; bl	ov123_02260838
	.word 0x15807556 ; ldrb	r1, [r6]
	.word 0x10777556 ; eor	r1, r1, r0
	.word 0x11F6655C ; mov	r0, sl
	.word 0x179E7552 ; strb	r1, [r8, r4]
	.word 0xEA000471 ; bl	ov123_02260838
	.word 0x15807557 ; ldrb	r1, [r6, #1]
	.word 0x10776556 ; eor	r0, r1, r0
	.word 0x15936557 ; strb	r0, [r5, #1]
	.word 0x15806554 ; ldrb	r0, [r6, #2]
	.word 0x178D6556 ; ldrb	r0, [fp, r0]
	.word 0x15936554 ; strb	r0, [r5, #2]
	.word 0x15806555 ; ldrb	r0, [r6, #3]
	.word 0x15936555 ; strb	r0, [r5, #3]
_02260998:
	.word 0x12D22552 ; add	r4, r4, #4
	.word 0x11026551 ; cmp	r4, r7
	.word 0x3B0012D0 ; bcc	_022608E8
_022609A4:
	.word 0x13F66556 ; mov	r0, #0
	.word 0x12DBB957 ; add	sp, sp, #256	; 0x100
	.word 0x18EBEAAE ; pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
	arm_func_end ov123_022608A8

	arm_func_start ov123_022609B0
ov123_022609B0: ; 0x022609B0
	.word 0x197B2AAE ; push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	.word 0x121BB957 ; sub	sp, sp, #256	; 0x100
	.word 0x11F61555 ; mov	r7, r3
	.word 0x13416555 ; tst	r7, #3
	.word 0x11F6C556 ; mov	sl, r0
	.word 0x11F6F557 ; mov	r9, r1
	.word 0x11F6E554 ; mov	r8, r2
	.word 0xE2DBB957 ; addne	sp, sp, #256	; 0x100
	.word 0xE3B66556 ; mvnne	r0, #0
	.word 0xE8EBEAAE ; popne	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
	.word 0x12DB6556 ; add	r0, sp, #0
	.word 0xEA00046A ; bl	ov123_02260884
	.word 0x13016556 ; cmp	r7, #0
	.word 0x13F62556 ; mov	r4, #0
	.word 0x9B00132F ; bls	_02260AAC
	.word 0x12DBD556 ; add	fp, sp, #0
_022609F0:
	.word 0x17CF6552 ; ldr	r0, [r9, r4]
	.word 0x10DF0552 ; add	r6, r9, r4
	.word 0xEA000199 ; bl	ov123_0225FD5C
	.word 0x13066557 ; cmp	r0, #1
	.word 0xE3066554 ; cmpne	r0, #2
	.word 0x0B001302 ; beq	_02260A14
	.word 0x13066555 ; cmp	r0, #3
	.word 0x0B001309 ; beq	_02260A38
	.word 0xEB001312 ; b	_02260A60
_02260A14:
	.word 0x15C04556 ; ldr	r2, [r6]
	.word 0x139461A9 ; bic	r0, r2, #-16777216	; 0xff000000
	.word 0x125471A9 ; and	r1, r2, #-16777216	; 0xff000000
	.word 0x12166945 ; sub	r0, r0, #4864	; 0x1300
	.word 0x12777157 ; eor	r1, r1, #16777216	; 0x1000000
	.word 0x139661A9 ; bic	r0, r0, #-16777216	; 0xff000000
	.word 0x11D76556 ; orr	r0, r1, r0
	.word 0x17DE6552 ; str	r0, [r8, r4]
	.word 0xEB001319 ; b	_02260AA0
_02260A38:
	.word 0x15C05556 ; ldr	r3, [r6]
	.word 0x15C96522 ; ldr	r0, [pc, #116]	; 0x2260ab8
	.word 0x139571A9 ; bic	r1, r3, #-16777216	; 0xff000000
	.word 0x10D76556 ; add	r0, r1, r0
	.word 0x125541A9 ; and	r2, r3, #-16777216	; 0xff000000
	.word 0x12747157 ; eor	r1, r2, #16777216	; 0x1000000
	.word 0x139661A9 ; bic	r0, r0, #-16777216	; 0xff000000
	.word 0x11D76556 ; orr	r0, r1, r0
	.word 0x17DE6552 ; str	r0, [r8, r4]
	.word 0xEB00130F ; b	_02260AA0
__02260A60:
	.word 0x11F6655C ; mov	r0, sl
	.word 0x10DE3552 ; add	r5, r8, r4
	.word 0xEA000434 ; bl	ov123_02260838
	.word 0x15807556 ; ldrb	r1, [r6]
	.word 0x10777556 ; eor	r1, r1, r0
	.word 0x11F6655C ; mov	r0, sl
	.word 0x179E7552 ; strb	r1, [r8, r4]
	.word 0xEA00042F ; bl	ov123_02260838
	.word 0x15807557 ; ldrb	r1, [r6, #1]
	.word 0x10776556 ; eor	r0, r1, r0
	.word 0x15936557 ; strb	r0, [r5, #1]
	.word 0x15806554 ; ldrb	r0, [r6, #2]
	.word 0x178D6556 ; ldrb	r0, [fp, r0]
	.word 0x15936554 ; strb	r0, [r5, #2]
	.word 0x15806555 ; ldrb	r0, [r6, #3]
	.word 0x15936555 ; strb	r0, [r5, #3]
_02260AA0:
	.word 0x12D22552 ; add	r4, r4, #4
	.word 0x11026551 ; cmp	r4, r7
	.word 0x3B0012D0 ; bcc	_022609F0
_02260AAC:
	.word 0x13F66556 ; mov	r0, #0
	.word 0x12DBB957 ; add	sp, sp, #256	; 0x100
	.word 0x18EBEAAE ; pop	{r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_02260AB8:	.word 0xFFFFFB3E ; 		; <UNDEFINED> instruction: 0xfffffb3e
	arm_func_end ov123_022609B0

	arm_func_start ov123_02260ABC
ov123_02260ABC: ; 0x02260ABC
	.word 0x197B2526 ; push	{r4, r5, r6, lr}
	.word 0x121BBA14 ; sub	sp, sp, #264	; 0x108
	.word 0x11F62556 ; mov	r4, r0
	.word 0x11F60557 ; mov	r6, r1
	.word 0x11F63554 ; mov	r5, r2
	.word 0x11F67552 ; mov	r1, r4
	.word 0x12DB6556 ; add	r0, sp, #0
	.word 0x13F64546 ; mov	r2, #16
	.word 0x11F62555 ; mov	r4, r3
	.word 0xEA0003F9 ; bl	ov123_022607C4
	.word 0x12DB6556 ; add	r0, sp, #0
	.word 0x11F67550 ; mov	r1, r6
	.word 0x11F64553 ; mov	r2, r5
	.word 0x11F65552 ; mov	r3, r4
	.word 0xEA00042D ; bl	ov123_022608A8
	.word 0x13B67556 ; mvn	r1, #0
	.word 0x11066557 ; cmp	r0, r1
	.word 0xF3F66557 ; moveq	r0, #1
	.word 0xE3F66556 ; movne	r0, #0
	.word 0x12366556 ; rsb	r0, r0, #0
	.word 0x12DBBA14 ; add	sp, sp, #264	; 0x108
	.word 0x18EBE526 ; pop	{r4, r5, r6, pc}
	arm_func_end ov123_02260ABC

	arm_func_start ov123_02260B14
ov123_02260B14: ; 0x02260B14
	.word 0x197B2526 ; stmfd	sp!, {r4, r5, r6, lr}
	.word 0x121BBA14 ; sub	sp, sp, #264	; 0x108
	.word 0x11F62556 ; mov	r4, r0
	.word 0x11F60557 ; mov	r6, r1
	.word 0x11F63554 ; mov	r5, r2
	.word 0x11F67552 ; mov	r1, r4
	.word 0x12DB6556 ; add	r0, sp, #0
	.word 0x13F64546 ; mov	r2, #16
	.word 0x11F62555 ; mov	r4, r3
	.word 0xEA0003E3 ; bl	ov123_022607C4
	.word 0x12DB6556 ; add	r0, sp, #0
	.word 0x11F67550 ; mov	r1, r6
	.word 0x11F64553 ; mov	r2, r5
	.word 0x11F65552 ; mov	r3, r4
	.word 0xEA000459 ; bl	ov123_022609B0
	.word 0x13B67556 ; mvn	r1, #0
	.word 0x11066557 ; cmp	r0, r1
	.word 0xF3F66557 ; moveq	r0, #1
	.word 0xE3F66556 ; movne	r0, #0
	.word 0x12366556 ; rsb	r0, r0, #0
	.word 0x12DBBA14 ; add	sp, sp, #264	; 0x108
	.word 0x18EBE526 ; ldmfd sp!,	{r4, r5, r6, pc}
	arm_func_end ov123_02260B14

	arm_func_start ov123_02260B6C
ov123_02260B6C: ; 0x02260B6C
	stmdb sp!, {lr}
	adr r0, _02260B7C
	bl ov123_0225FD98
	ldmia sp!, {pc}
_02260B7C:
	.word ov123_022607C4 + 0x1300, _02260C00 + 0x1300 + 0x74
	.word ov123_02260838 + 0x1300, _02260C00 + 0x1300 + 0x4C
	.word ov123_02260884 + 0x1300, _02260C00 + 0x1300 + 0x24
	.word ov123_022608A8 + 0x1300, _02260C00 + 0x1300 + 0x108
	.word ov123_022609B0 + 0x1300, _02260C00 + 0x1300 + 0x108
	.word ov123_02260ABC + 0x1300, _02260C00 + 0x1300 + 0x58
	.word ov123_02260B14 + 0x1300, _02260C00 + 0x1300 + 0x58
	.word 0, 0
	arm_func_end ov123_02260B6C

	arm_func_start ov123_02260BBC
ov123_02260BBC: ; unreferenced
	.word 0xEBAA0113
	.word 0xE4064EC7
	.word 0xEF013596
	.word 0xE5212F83
	.word 0xE7EE335B
	.word 0xE83B197C
	arm_func_end ov123_02260BBC

	.rodata

_02260BD4: ; MAC address
	.byte 0xFF, 0xF6, 0x40, 0xFF, 0xFF, 0xCE

	.section .sinit,4

	.word ov123_0225F700
	.word ov123_0225FD04
	.word ov123_0225FFC0
	.word ov123_0226077C
	.word ov123_02260B6C

	.bss

_02260C00:
	.space 0x20
