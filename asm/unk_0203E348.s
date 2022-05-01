	.include "asm/macros.inc"
	.include "global.inc"
	.public _020FA0B0

	.rodata

_020FA17C:
	.byte 0x40, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
_020FA190:
	.byte 0x3C, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xB7, 0x02, 0x00, 0x00, 0x8D, 0x01, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00
_020FA1A4:
	.byte 0x00, 0xFF, 0x00, 0x00
_020FA1A8:
	.byte 0x01, 0x04, 0x00, 0x00
_020FA1AC:
	.byte 0x04, 0xFF, 0x00, 0x00
_020FA1B0:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00
_020FA1B8:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
	.byte 0xFF, 0x00, 0x00, 0x00
_020FA1C4:
	.word sub_020192D0, sub_0201935C, sub_02019490, FS_OVERLAY_ID(OVY_39)
_020FA1D4:
	.word ov105_021E5900, ov105_021E59DC, ov105_021E5B14, FS_OVERLAY_ID(OVY_105)
_020FA1E4:
	.word ov68_021E5900, ov68_021E5968, ov68_021E5A3C, FS_OVERLAY_ID(OVY_68)
_020FA1F4:
	.word ov76_021E5900, ov76_021E5B60, ov76_021E5AA0, FS_OVERLAY_ID(OVY_76)
_020FA204:
	.word ov64_021E5900, ov64_021E5A18, ov64_021E59C8, FS_OVERLAY_ID(OVY_64)
_020FA214:
	.word ov63_0221BE20, ov63_0221BF88, ov63_0221BF28, FS_OVERLAY_ID(OVY_63)
_020FA224:
	.word ov69_021E5900, ov69_021E5A34, ov69_021E6080, FS_OVERLAY_ID(OVY_69)
_020FA234:
	.word ov122_021E82A8, ov122_021E8360, ov122_021E8308, FS_OVERLAY_ID(OVY_122)
_020FA244:
	.word PokeathlonCourseApplication_OvyInit, PokeathlonCourseApplication_OvyExec, PokeathlonCourseApplication_OvyExit, FS_OVERLAY_ID(OVY_96)
_020FA254:
	.word SignBackOfTrainerCardApp_OvyInit, SignBackOfTrainerCardApp_OvyExec, SignBackOfTrainerCardApp_OvyExit, FS_OVERLAY_ID(trainer_card_signature)
_020FA264:
	.word ov70_02238430, ov70_022385C0, ov70_022386F4, FS_OVERLAY_ID(OVY_70)
sAppTemplate_ChooseStarter:
	.word ChooseStarterApplication_OvyInit, ChooseStarterApplication_OvyExec, ChooseStarterApplication_OvyExit, FS_OVERLAY_ID(OVY_61)
_020FA284:
	.word ov18_021E5AA0, ov18_021E5B64, ov18_021E5B80, FS_OVERLAY_ID(OVY_18)
_020FA294:
	.word TrainerCardApp_OvyInit, TrainerCardApp_OvyExec, TrainerCardApp_OvyExit, FS_OVERLAY_ID(trainer_card)
_020FA2A4:
	.word ov43_02229EE0, ov43_02229FB4, ov43_0222A0AC, FS_OVERLAY_ID(OVY_43)
_020FA2B4:
	.word ov73_021E5900, ov73_021E5AB8, ov73_021E5BAC, FS_OVERLAY_ID(OVY_73)
_020FA2C4:
	.word ov37_021E5900, ov37_021E5A84, ov37_021E5B94, FS_OVERLAY_ID(OVY_37)
_020FA2D4:
	.word ov71_02246960, ov71_02246BB8, ov71_02246B58, FS_OVERLAY_ID(OVY_71)
_020FA2E4:
	.word ov67_021E5900, ov67_021E5984, ov67_021E5968, FS_OVERLAY_ID(OVY_67)
_020FA2F4:
	.word ov103_021EC940, ov103_021EC988, ov103_021EC9A4, FS_OVERLAY_ID(OVY_103)
_020FA304:
	.word ov78_021E5900, ov78_021E59EC, ov78_021E5B24, FS_OVERLAY_ID(OVY_78)
_020FA314:
	.word ov99_021E7818, ov99_021E794C, ov99_021E78F0, FS_OVERLAY_ID(OVY_99)
_020FA324:
	.word ov99_021E8304, ov99_021E83F4, ov99_021E83AC, FS_OVERLAY_ID(OVY_99)
_020FA334:
	.word ov72_02237E20, ov72_02237F9C, ov72_02238070, FS_OVERLAY_ID(OVY_72)
_020FA344:
	.word ov99_021E5900, ov99_021E5A38, ov99_021E5A04, FS_OVERLAY_ID(OVY_99)
_020FA354:
	.word ov54_021E5900, ov54_021E5B3C, ov54_021E5A10, FS_OVERLAY_ID(OVY_54)
_020FA364:
	.word ov111_021E5900, ov111_021E59B8, ov111_021E5960, FS_OVERLAY_ID(OVY_111)
_020FA374:
	.word ov58_022378E4, ov58_02237924, ov58_0223799C, FS_OVERLAY_ID(OVY_58)
_020FA384:
	.word ov16_0220196C, ov16_022019B8, ov16_02201A04, FS_OVERLAY_ID(OVY_16)
_020FA394:
	.word ov113_021E5900, ov113_021E5968, ov113_021E59C8, FS_OVERLAY_ID(OVY_113)
_020FA3A4:
	.word ov110_AlphPuzzle_OvyInit, ov110_AlphPuzzle_OvyExec, ov110_AlphPuzzle_OvyExit, FS_OVERLAY_ID(OVY_110)
_020FA3B4:
	.word ov109_021E5900, ov109_021E5968, ov109_021E59F0, FS_OVERLAY_ID(OVY_109)
_020FA3C4:
	.word ov108_021E8850, ov108_021E8904, ov108_021E88C4, FS_OVERLAY_ID(OVY_108)
_020FA3D4:
	.word ov108_021E5900, ov108_021E5978, ov108_021E5948, FS_OVERLAY_ID(OVY_108)
_020FA3E4:
	.word ov101_TownMap_OvyInit, ov101_TownMap_OvyExec, ov101_TownMap_OvyExit, FS_OVERLAY_ID(OVY_101)
_020FA3F4:
	.word ov100_Phone_OvyInit, ov100_Phone_OvyExec, ov100_Phone_OvyExit, FS_OVERLAY_ID(OVY_100)
_020FA404:
	.word ov102_021E7740, ov102_021E77B8, ov102_021E7868, FS_OVERLAY_ID(OVY_102)
_020FA414:
	.word ov14_021E5900, ov14_021E596C, ov14_021E5988, FS_OVERLAY_ID(OVY_14)
_020FA424:
	.word ov99_021E677C, ov99_021E6888, ov99_021E6840, FS_OVERLAY_ID(OVY_99)
_020FA434:
	.word ov55_021E5924, ov55_021E598C, ov55_021E5AE8, FS_OVERLAY_ID(OVY_55)
_020FA444:
	.word ov73_021E7E4C, ov73_021E7FB8, ov73_021E808C, FS_OVERLAY_ID(OVY_72)
_020FA454:
	.word ov104_021E5900, ov104_021E59E4, ov104_021E5B14, FS_OVERLAY_ID(OVY_104)
_020FA464:
	.word ov15_BagApp_init, ov15_BagApp_exec, ov15_BagApp_exit, FS_OVERLAY_ID(OVY_15)
_020FA474:
	.word sub_02097B78, sub_02097BAC, sub_02097BD0, FS_OVERLAY_ID(OVY_106)
	.public _020FA484
_020FA484:
	.word sub_0203E3A8, sub_0203E3AC, sub_0203E3C0, FS_OVERLAY_ID(OVY_12)
_020FA494:
	.word ov121_021E5900, ov121_021E590C, ov121_021E59BC, FS_OVERLAY_ID(OVY_121)

	.data

_0210F978:
	.word 0x00000000
_0210F97C:
	.word ov87_021E5900, ov87_021E59B4, ov87_021E5AC0, FS_OVERLAY_ID(OVY_87)
_0210F98C:
	.word ov65_0221BE20, ov65_0221C250, ov65_0221CD74, FS_OVERLAY_ID(OVY_65)
_0210F99C:
	.word ov41_0224BA10, ov41_0224BACC, ov41_0224BBA4, FS_OVERLAY_ID(OVY_41)
_0210F9AC:
	.word ov41_02246DE0, ov41_02246F08, ov41_02247150, FS_OVERLAY_ID(OVY_41)
_0210F9BC:
	.word ov86_021E5900, ov86_021E5A40, ov86_021E5AA4, FS_OVERLAY_ID(OVY_86)

	.text

	thumb_func_start LocationData_BackUp
LocationData_BackUp: ; 0x0203E368
	ldr r2, _0203E37C ; =_020FA17C
	add r3, r0, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	nop
_0203E37C: .word _020FA17C
	thumb_func_end LocationData_BackUp

	thumb_func_start LocationData_Restore
LocationData_Restore: ; 0x0203E380
	ldr r2, _0203E394 ; =_020FA190
	add r3, r0, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	nop
_0203E394: .word _020FA190
	thumb_func_end LocationData_Restore

	thumb_func_start Save_CurrentLocation_BackUp
Save_CurrentLocation_BackUp: ; 0x0203E398
	push {r3, lr}
	bl Save_FlyPoints_get
	bl FlyPoints_GetPosition
	bl LocationData_BackUp
	pop {r3, pc}
	thumb_func_end Save_CurrentLocation_BackUp

	thumb_func_start sub_0203E3A8
sub_0203E3A8: ; 0x0203E3A8
	mov r0, #1
	bx lr
	thumb_func_end sub_0203E3A8

	thumb_func_start sub_0203E3AC
sub_0203E3AC: ; 0x0203E3AC
	push {r3, lr}
	bl ov12_022378C0
	cmp r0, #0
	beq _0203E3BA
	mov r0, #1
	pop {r3, pc}
_0203E3BA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0203E3AC

	thumb_func_start sub_0203E3C0
sub_0203E3C0: ; 0x0203E3C0
	mov r0, #1
	bx lr
	thumb_func_end sub_0203E3C0

	thumb_func_start sub_0203E3C4
sub_0203E3C4: ; 0x0203E3C4
	ldr r3, _0203E3CC ; =Fsys_LaunchApplication
	add r2, r1, #0
	ldr r1, _0203E3D0 ; =_020FA484
	bx r3
	.balign 4, 0
_0203E3CC: .word Fsys_LaunchApplication
_0203E3D0: .word _020FA484
	thumb_func_end sub_0203E3C4

	thumb_func_start sub_0203E3D4
sub_0203E3D4: ; 0x0203E3D4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203E3F8 ; =_020FA464
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203E3F8: .word _020FA464
	thumb_func_end sub_0203E3D4

	thumb_func_start sub_0203E3FC
sub_0203E3FC: ; 0x0203E3FC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r6, r1, #0
	bl Sav2_Bag_get
	ldr r1, _0203E45C ; =_020FA1B8
	mov r2, #0xb
	bl CreateBagView
	mov r1, #0x43
	lsl r1, r1, #2
	add r1, r5, r1
	add r3, r5, #0
	str r1, [sp]
	add r3, #0x94
	ldr r1, [r5, #0xc]
	ldr r3, [r3]
	mov r2, #0
	add r4, r0, #0
	bl sub_0207789C
	ldr r1, [r5, #0x70]
	add r0, r4, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_020778E8
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #1
	bne _0203E446
	add r0, r4, #0
	bl sub_020778C8
_0203E446:
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020778DC
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203E3D4
	add r0, r4, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0203E45C: .word _020FA1B8
	thumb_func_end sub_0203E3FC

	thumb_func_start sub_0203E460
sub_0203E460: ; 0x0203E460
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	bl Sav2_Bag_get
	add r6, r0, #0
	cmp r4, #0
	beq _0203E47A
	cmp r4, #1
	beq _0203E482
	b _0203E48A
_0203E47A:
	ldr r1, _0203E4C0 ; =_020FA1A4
	ldr r0, _0203E4C4 ; =_0210F978
	str r1, [r0]
	b _0203E48E
_0203E482:
	ldr r1, _0203E4C8 ; =_020FA1AC
	ldr r0, _0203E4C4 ; =_0210F978
	str r1, [r0]
	b _0203E48E
_0203E48A:
	bl GF_AssertFail
_0203E48E:
	ldr r1, _0203E4C4 ; =_0210F978
	add r0, r6, #0
	ldr r1, [r1]
	mov r2, #0x20
	bl CreateBagView
	mov r1, #0x43
	lsl r1, r1, #2
	add r1, r5, r1
	add r3, r5, #0
	str r1, [sp]
	add r3, #0x94
	ldr r1, [r5, #0xc]
	ldr r3, [r3]
	add r4, r0, #0
	mov r2, #3
	bl sub_0207789C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203E3D4
	add r0, r4, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0203E4C0: .word _020FA1A4
_0203E4C4: .word _0210F978
_0203E4C8: .word _020FA1AC
	thumb_func_end sub_0203E460

	thumb_func_start sub_0203E4CC
sub_0203E4CC: ; 0x0203E4CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02077904
	add r4, r0, #0
	beq _0203E4E6
	add r0, r5, #0
	bl sub_0207790C
	cmp r0, #5
	bne _0203E4E6
	bl GF_AssertFail
_0203E4E6:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203E4CC

	thumb_func_start sub_0203E4EC
sub_0203E4EC: ; 0x0203E4EC
	ldr r3, _0203E4F4 ; =Fsys_LaunchApplication
	add r2, r1, #0
	ldr r1, _0203E4F8 ; =_02103A1C
	bx r3
	.balign 4, 0
_0203E4F4: .word Fsys_LaunchApplication
_0203E4F8: .word _02103A1C
	thumb_func_end sub_0203E4EC

	thumb_func_start sub_0203E4FC
sub_0203E4FC: ; 0x0203E4FC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0x44
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x44
	bl MIi_CpuClearFast
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	add r0, r4, #0
	add r0, #0x25
	strb r6, [r0]
	add r0, r4, #0
	add r0, #0x24
	strb r7, [r0]
	mov r0, #0x43
	lsl r0, r0, #2
	str r5, [r4, #0x1c]
	add r0, r5, r0
	str r0, [r4, #0x20]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0203E4FC

	thumb_func_start sub_0203E550
sub_0203E550: ; 0x0203E550
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r2, #0
	mov r2, #0
	add r6, r1, #0
	mov r0, #0xb
	add r1, r5, #0
	add r3, r2, #0
	bl sub_0203E4FC
	add r4, r0, #0
	str r6, [r4, #0x18]
	add r0, #0x26
	strb r7, [r0]
	ldr r1, _0203E57C ; =_0210159C
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203E57C: .word _0210159C
	thumb_func_end sub_0203E550

	thumb_func_start sub_0203E580
sub_0203E580: ; 0x0203E580
	push {r3, r4, r5, lr}
	mov r0, #0xb
	mov r2, #0
	mov r3, #3
	add r5, r1, #0
	bl sub_0203E4FC
	add r4, r0, #0
	ldr r1, _0203E5A0 ; =_0210159C
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0203E5A0: .word _0210159C
	thumb_func_end sub_0203E580

	thumb_func_start sub_0203E5A4
sub_0203E5A4: ; 0x0203E5A4
	push {r3, r4, r5, lr}
	mov r0, #0xb
	mov r2, #0
	mov r3, #0x13
	add r5, r1, #0
	bl sub_0203E4FC
	add r4, r0, #0
	ldr r1, _0203E5C4 ; =_0210159C
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0203E5C4: .word _0210159C
	thumb_func_end sub_0203E5A4

	thumb_func_start sub_0203E5C8
sub_0203E5C8: ; 0x0203E5C8
	add r0, #0x26
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203E5C8

	thumb_func_start sub_0203E5D0
sub_0203E5D0: ; 0x0203E5D0
	push {r4, r5, r6, lr}
	add r4, r2, #0
	mov r0, #0xb
	mov r2, #0
	mov r3, #0x12
	add r5, r1, #0
	bl sub_0203E4FC
	add r6, r0, #0
	add r0, #0x26
	strb r4, [r0]
	ldr r1, _0203E5F4 ; =_0210159C
	add r0, r5, #0
	add r2, r6, #0
	bl Fsys_LaunchApplication
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203E5F4: .word _0210159C
	thumb_func_end sub_0203E5D0

	thumb_func_start sub_0203E5F8
sub_0203E5F8: ; 0x0203E5F8
	add r0, #0x27
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0203E5F8

	thumb_func_start sub_0203E600
sub_0203E600: ; 0x0203E600
	ldrb r0, [r0, #0x14]
	bx lr
	thumb_func_end sub_0203E600

	thumb_func_start sub_0203E604
sub_0203E604: ; 0x0203E604
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #4
	bhi _0203E6CC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203E630: ; jump table
	.short _0203E63A - _0203E630 - 2 ; case 0
	.short _0203E64A - _0203E630 - 2 ; case 1
	.short _0203E680 - _0203E630 - 2 ; case 2
	.short _0203E6A2 - _0203E630 - 2 ; case 3
	.short _0203E6C2 - _0203E630 - 2 ; case 4
_0203E63A:
	ldr r1, _0203E6D0 ; =_0210159C
	ldr r2, [r4, #4]
	add r0, r6, #0
	bl Fsys_LaunchApplication
	mov r0, #1
	str r0, [r5]
	b _0203E6CC
_0203E64A:
	add r0, r6, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _0203E6CC
	ldr r0, [r4, #4]
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #6
	beq _0203E66E
	cmp r0, #7
	bne _0203E67A
	mov r0, #2
	bl sub_0205A508
	mov r0, #4
	str r0, [r5]
	b _0203E6CC
_0203E66E:
	mov r0, #1
	bl sub_0205A508
	mov r0, #4
	str r0, [r5]
	b _0203E6CC
_0203E67A:
	mov r0, #2
	str r0, [r5]
	b _0203E6CC
_0203E680:
	ldr r1, [r4]
	add r0, r6, #0
	mov r2, #0
	bl sub_0203E76C
	str r0, [r4, #8]
	ldr r1, [r4, #4]
	add r1, #0x26
	ldrb r1, [r1]
	strb r1, [r0, #0x14]
	ldr r1, [r4, #8]
	add r0, r6, #0
	bl sub_0203E4EC
	mov r0, #3
	str r0, [r5]
	b _0203E6CC
_0203E6A2:
	add r0, r6, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _0203E6CC
	ldr r0, [r4, #8]
	ldrb r1, [r0, #0x14]
	ldr r0, [r4, #4]
	add r0, #0x26
	strb r1, [r0]
	ldr r0, [r4, #8]
	bl FreeToHeap
	mov r0, #0
	str r0, [r5]
	b _0203E6CC
_0203E6C2:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_0203E6CC:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203E6D0: .word _0210159C
	thumb_func_end sub_0203E604

	thumb_func_start sub_0203E6D4
sub_0203E6D4: ; 0x0203E6D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0xc
	bl AllocFromHeap
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	mov r3, #2
	str r5, [r4]
	bl sub_0203E4FC
	add r5, r0, #0
	add r0, #0x36
	ldrb r1, [r0]
	mov r0, #0xf
	add r2, r4, #0
	bic r1, r0
	mov r0, #2
	orr r1, r0
	add r0, r5, #0
	add r0, #0x36
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x36
	ldrb r1, [r0]
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x20
	orr r1, r0
	add r0, r5, #0
	add r0, #0x36
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #0x1e
	add r0, #0x37
	strb r1, [r0]
	mov r0, #0
	str r0, [r5, #0x14]
	ldr r1, _0203E73C ; =sub_0203E604
	add r0, r7, #0
	str r5, [r4, #4]
	bl TaskManager_Call
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203E73C: .word sub_0203E604
	thumb_func_end sub_0203E6D4

	thumb_func_start sub_0203E740
sub_0203E740: ; 0x0203E740
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	add r1, r5, #0
	mov r2, #0
	mov r3, #0x15
	bl sub_0203E4FC
	add r6, r0, #0
	add r0, #0x26
	strb r4, [r0]
	ldr r1, _0203E768 ; =_0210159C
	add r0, r5, #0
	add r2, r6, #0
	bl Fsys_LaunchApplication
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_0203E768: .word _0210159C
	thumb_func_end sub_0203E740

	thumb_func_start sub_0203E76C
sub_0203E76C: ; 0x0203E76C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, r1, #0
	ldr r5, [r6, #0xc]
	mov r1, #0x3c
	add r7, r2, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	add r0, r5, #0
	bl SavArray_PlayerParty_get
	str r0, [r4]
	mov r0, #1
	strb r0, [r4, #0x11]
	mov r0, #0
	strb r0, [r4, #0x14]
	ldr r0, [r4]
	bl GetPartyCount
	strb r0, [r4, #0x13]
	mov r0, #0
	strh r0, [r4, #0x18]
	strb r7, [r4, #0x12]
	add r0, r5, #0
	bl SavArray_IsNatDexEnabled
	str r0, [r4, #0x1c]
	add r0, r5, #0
	bl sub_02088288
	str r0, [r4, #0x2c]
	add r0, r5, #0
	bl Save_SpecialRibbons_get
	str r0, [r4, #0x20]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r6, r0
	str r0, [r4, #0x30]
	ldr r0, [r6, #0xc]
	bl sub_0208828C
	str r0, [r4, #0x34]
	ldr r1, _0203E7F0 ; =_020FA1B0
	add r0, r4, #0
	bl sub_02089D40
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0208AD34
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203E7F0: .word _020FA1B0
	thumb_func_end sub_0203E76C

	thumb_func_start sub_0203E7F4
sub_0203E7F4: ; 0x0203E7F4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0x3c
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #0x11]
	strb r6, [r4, #0x14]
	strb r0, [r4, #0x13]
	strh r7, [r4, #0x18]
	mov r0, #2
	strb r0, [r4, #0x12]
	ldr r0, [r5, #0xc]
	bl SavArray_IsNatDexEnabled
	str r0, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x2c]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #0x30]
	ldr r1, _0203E860 ; =_020FA1A8
	add r0, r4, #0
	bl sub_02089D40
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0208AD34
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203E4EC
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203E860: .word _020FA1A8
	thumb_func_end sub_0203E7F4

	thumb_func_start sub_0203E864
sub_0203E864: ; 0x0203E864
	ldrb r0, [r0, #0x16]
	bx lr
	thumb_func_end sub_0203E864

	thumb_func_start sub_0203E868
sub_0203E868: ; 0x0203E868
	ldr r3, _0203E870 ; =Fsys_LaunchApplication
	add r2, r1, #0
	ldr r1, _0203E874 ; =_020FA414
	bx r3
	.balign 4, 0
_0203E870: .word Fsys_LaunchApplication
_0203E874: .word _020FA414
	thumb_func_end sub_0203E868

	thumb_func_start sub_0203E878
sub_0203E878: ; 0x0203E878
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r0, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r6, #0
	bl TaskManager_GetSys
	ldr r1, [r5]
	add r6, r0, #0
	cmp r1, #0
	beq _0203E8A4
	cmp r1, #1
	beq _0203E8B2
	cmp r1, #2
	beq _0203E8C2
	b _0203E958
_0203E8A4:
	ldr r1, [r4, #0xc]
	bl sub_0203EA24
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0203E958
_0203E8B2:
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _0203E958
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0203E958
_0203E8C2:
	ldr r0, [r4, #0xc]
	bl sub_02090D48
	cmp r0, #0
	bne _0203E8D6
	ldr r0, [r4, #0xc]
	bl sub_02090D4C
	cmp r0, #0
	bne _0203E8DE
_0203E8D6:
	ldr r0, [r4]
	mov r1, #0
	strh r1, [r0]
	b _0203E946
_0203E8DE:
	ldr r0, [r4]
	mov r1, #1
	strh r1, [r0]
	ldr r0, [r4, #0x10]
	cmp r0, #5
	bhi _0203E902
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203E8F6: ; jump table
	.short _0203E902 - _0203E8F6 - 2 ; case 0
	.short _0203E90E - _0203E8F6 - 2 ; case 1
	.short _0203E926 - _0203E8F6 - 2 ; case 2
	.short _0203E926 - _0203E8F6 - 2 ; case 3
	.short _0203E926 - _0203E8F6 - 2 ; case 4
	.short _0203E926 - _0203E8F6 - 2 ; case 5
_0203E902:
	ldr r0, [r4, #0xc]
	bl sub_02090D50
	ldr r1, [r4, #4]
	strh r0, [r1]
	b _0203E946
_0203E90E:
	ldr r0, [r4, #0xc]
	add r1, sp, #8
	bl sub_02090D54
	add r0, sp, #0
	ldrh r2, [r0, #8]
	ldr r1, [r4, #4]
	strh r2, [r1]
	ldrh r1, [r0, #0xa]
	ldr r0, [r4, #8]
	strh r1, [r0]
	b _0203E946
_0203E926:
	ldr r0, [r4, #0xc]
	add r1, sp, #0
	bl sub_02090D60
	ldr r1, [r4, #0x10]
	ldr r0, [r6, #0xc]
	sub r1, r1, #2
	add r2, sp, #0
	bl sub_0202D640
	add r0, sp, #0
	mov r1, #0
	bl MailMsg_GetFieldI
	ldr r1, [r4, #4]
	strh r0, [r1]
_0203E946:
	ldr r0, [r4, #0xc]
	bl sub_02090D0C
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0203E958:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203E878

	thumb_func_start sub_0203E960
sub_0203E960: ; 0x0203E960
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #4]
	add r6, r1, #0
	str r2, [sp, #8]
	add r7, r3, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	mov r0, #0x20
	mov r1, #0x14
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [sp, #8]
	cmp r6, #5
	str r0, [r4]
	ldr r0, [sp, #0x20]
	str r7, [r4, #4]
	str r0, [r4, #8]
	str r6, [r4, #0x10]
	bhi _0203E9A4
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203E998: ; jump table
	.short _0203E9A4 - _0203E998 - 2 ; case 0
	.short _0203E9C0 - _0203E998 - 2 ; case 1
	.short _0203E9E0 - _0203E998 - 2 ; case 2
	.short _0203E9E0 - _0203E998 - 2 ; case 3
	.short _0203E9E0 - _0203E998 - 2 ; case 4
	.short _0203E9E0 - _0203E998 - 2 ; case 5
_0203E9A4:
	mov r3, #0x20
	str r3, [sp]
	mov r0, #0
	add r3, #0xec
	ldr r2, [r5, #0xc]
	add r1, r0, #0
	add r3, r5, r3
	bl sub_02090C94
	str r0, [r4, #0xc]
	ldrh r1, [r7]
	bl sub_02090D14
	b _0203EA12
_0203E9C0:
	mov r3, #0x20
	str r3, [sp]
	add r3, #0xec
	ldr r2, [r5, #0xc]
	mov r0, #1
	mov r1, #0
	add r3, r5, r3
	bl sub_02090C94
	str r0, [r4, #0xc]
	ldr r2, [sp, #0x20]
	ldrh r1, [r7]
	ldrh r2, [r2]
	bl sub_02090D18
	b _0203EA12
_0203E9E0:
	mov r3, #0x20
	str r3, [sp]
	add r3, #0xec
	ldr r2, [r5, #0xc]
	mov r0, #2
	mov r1, #0
	add r3, r5, r3
	bl sub_02090C94
	str r0, [r4, #0xc]
	bl sub_02090D40
	sub r1, r6, #2
	lsl r1, r1, #0x18
	ldr r0, [r5, #0xc]
	lsr r1, r1, #0x18
	bl sub_0202D660
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02090D20
	ldr r0, [r4, #0xc]
	bl sub_02090D34
_0203EA12:
	ldr r0, [sp, #4]
	ldr r1, _0203EA20 ; =sub_0203E878
	add r2, r4, #0
	bl TaskManager_Call
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0203EA20: .word sub_0203E878
	thumb_func_end sub_0203E960

	thumb_func_start sub_0203EA24
sub_0203EA24: ; 0x0203EA24
	ldr r3, _0203EA2C ; =Fsys_LaunchApplication
	add r2, r1, #0
	ldr r1, _0203EA30 ; =_020FA404
	bx r3
	.balign 4, 0
_0203EA2C: .word Fsys_LaunchApplication
_0203EA30: .word _020FA404
	thumb_func_end sub_0203EA24

	thumb_func_start SwitchToPokegearApp_Phone
SwitchToPokegearApp_Phone: ; 0x0203EA34
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203EA58 ; =_020FA3F4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203EA58: .word _020FA3F4
	thumb_func_end SwitchToPokegearApp_Phone

	thumb_func_start SwitchToPokegearApp_TownMap
SwitchToPokegearApp_TownMap: ; 0x0203EA5C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203EA80 ; =_020FA3E4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203EA80: .word _020FA3E4
	thumb_func_end SwitchToPokegearApp_TownMap

	thumb_func_start PhoneUI_new
PhoneUI_new: ; 0x0203EA84
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x2c
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x2c
	bl MI_CpuFill8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02092D80
	add r0, r5, #0
	add r1, r4, #0
	bl SwitchToPokegearApp_Phone
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end PhoneUI_new

	thumb_func_start TownMap_new
TownMap_new: ; 0x0203EAB0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x2c
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x2c
	bl MI_CpuFill8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02092D8C
	add r0, r5, #0
	add r1, r4, #0
	strb r6, [r4]
	bl SwitchToPokegearApp_TownMap
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end TownMap_new

	thumb_func_start sub_0203EAE0
sub_0203EAE0: ; 0x0203EAE0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203EB04 ; =_020FA3D4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203EB04: .word _020FA3D4
	thumb_func_end sub_0203EAE0

	thumb_func_start sub_0203EB08
sub_0203EB08: ; 0x0203EB08
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x24
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x24
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	str r0, [r4]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EAE0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203EB08

	thumb_func_start sub_0203EB3C
sub_0203EB3C: ; 0x0203EB3C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203EB60 ; =_020FA3C4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203EB60: .word _020FA3C4
	thumb_func_end sub_0203EB3C

	thumb_func_start sub_0203EB64
sub_0203EB64: ; 0x0203EB64
	push {r3, r4, r5, lr}
	mov r1, #0xb
	add r5, r0, #0
	bl ov02_0224E4EC
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EB3C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203EB64

	thumb_func_start sub_0203EB7C
sub_0203EB7C: ; 0x0203EB7C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203EBA0 ; =_020FA3B4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203EBA0: .word _020FA3B4
	thumb_func_end sub_0203EB7C

	thumb_func_start sub_0203EBA4
sub_0203EBA4: ; 0x0203EBA4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x10
	add r6, r2, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x10
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	str r0, [r4, #0xc]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #8]
	add r0, r5, #0
	add r1, r4, #0
	strb r6, [r4, #2]
	bl sub_0203EB7C
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203EBA4

	thumb_func_start Fsys_LaunchApplication_AlphPuzzle
Fsys_LaunchApplication_AlphPuzzle: ; 0x0203EBDC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203EC00 ; =_020FA3A4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203EC00: .word _020FA3A4
	thumb_func_end Fsys_LaunchApplication_AlphPuzzle

	thumb_func_start Fsys_CreateApplication_AlphPuzzle
Fsys_CreateApplication_AlphPuzzle: ; 0x0203EC04
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x10
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	str r0, [r4, #0xc]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #8]
	add r0, r5, #0
	add r1, r4, #0
	strb r6, [r4, #5]
	bl Fsys_LaunchApplication_AlphPuzzle
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end Fsys_CreateApplication_AlphPuzzle

	thumb_func_start sub_0203EC3C
sub_0203EC3C: ; 0x0203EC3C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203EC60 ; =_020FA394
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203EC60: .word _020FA394
	thumb_func_end sub_0203EC3C

	thumb_func_start CreateUnownReportWork
CreateUnownReportWork: ; 0x0203EC64
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	str r0, [r4, #4]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EC3C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end CreateUnownReportWork

	thumb_func_start sub_0203EC98
sub_0203EC98: ; 0x0203EC98
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203ECBC ; =_020FA384
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203ECBC: .word _020FA384
	thumb_func_end sub_0203EC98

	thumb_func_start CreateBerryPotsWork
CreateBerryPotsWork: ; 0x0203ECC0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x10
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	str r0, [r4, #0xc]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #4]
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	add r1, r4, #0
	str r0, [r4, #8]
	add r0, r5, #0
	bl sub_0203EC98
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end CreateBerryPotsWork

	thumb_func_start sub_0203ECFC
sub_0203ECFC: ; 0x0203ECFC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203ED20 ; =_020FA374
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203ED20: .word _020FA374
	thumb_func_end sub_0203ECFC

	thumb_func_start CreateApricornBoxWork
CreateApricornBoxWork: ; 0x0203ED24
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x1c
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x1c
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	str r0, [r4, #0x18]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x18]
	bl Sav2_GameStats_get
	mov r1, #0
	bl GameStats_GetCapped
	str r0, [r4, #0x10]
	cmp r6, #1
	bne _0203ED72
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl CheckFlag997
	cmp r0, #0
	bne _0203ED72
	mov r0, #0
	strb r0, [r4]
	b _0203ED74
_0203ED72:
	strb r6, [r4]
_0203ED74:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203ECFC
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end CreateApricornBoxWork

	thumb_func_start sub_0203ED80
sub_0203ED80: ; 0x0203ED80
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x1c
	add r7, r2, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x1c
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	str r0, [r4, #0x18]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x18]
	bl Sav2_GameStats_get
	mov r1, #0
	bl GameStats_GetCapped
	str r0, [r4, #0x10]
	mov r0, #3
	strb r0, [r4]
	str r6, [r4, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	str r7, [r4, #8]
	bl sub_0203ECFC
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0203ED80

	thumb_func_start sub_0203EDCC
sub_0203EDCC: ; 0x0203EDCC
	ldr r3, _0203EDD4 ; =Fsys_LaunchApplication
	add r2, r1, #0
	ldr r1, _0203EDD8 ; =_020FA364
	bx r3
	.balign 4, 0
_0203EDD4: .word Fsys_LaunchApplication
_0203EDD8: .word _020FA364
	thumb_func_end sub_0203EDCC

	thumb_func_start sub_0203EDDC
sub_0203EDDC: ; 0x0203EDDC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x14
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	str r6, [r4]
	ldr r0, [sp]
	str r7, [r4, #4]
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EDCC
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0203EDDC

	thumb_func_start sub_0203EE14
sub_0203EE14: ; 0x0203EE14
	ldr r3, _0203EE1C ; =Fsys_LaunchApplication
	add r2, r1, #0
	ldr r1, _0203EE20 ; =_020FA354
	bx r3
	.balign 4, 0
_0203EE1C: .word Fsys_LaunchApplication
_0203EE20: .word _020FA354
	thumb_func_end sub_0203EE14

	thumb_func_start sub_0203EE24
sub_0203EE24: ; 0x0203EE24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #8]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EE14
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203EE24

	thumb_func_start sub_0203EE54
sub_0203EE54: ; 0x0203EE54
	push {r4, lr}
	add r4, r0, #0
	bl SavArray_Flags_get
	mov r1, #0xef
	bl CheckFlagInArray
	cmp r0, #0
	beq _0203EE8A
	add r0, r4, #0
	bl SavArray_Flags_get
	mov r1, #0xf0
	bl CheckFlagInArray
	cmp r0, #0
	beq _0203EE8A
	add r0, r4, #0
	bl SavArray_Flags_get
	mov r1, #0xf1
	bl CheckFlagInArray
	cmp r0, #0
	beq _0203EE8A
	mov r0, #1
	pop {r4, pc}
_0203EE8A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0203EE54

	thumb_func_start sub_0203EE90
sub_0203EE90: ; 0x0203EE90
	ldr r3, _0203EE98 ; =Fsys_LaunchApplication
	add r2, r1, #0
	ldr r1, _0203EE9C ; =_020FA344
	bx r3
	.balign 4, 0
_0203EE98: .word Fsys_LaunchApplication
_0203EE9C: .word _020FA344
	thumb_func_end sub_0203EE90

	thumb_func_start sub_0203EEA0
sub_0203EEA0: ; 0x0203EEA0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	add r6, r0, #0
	bl Save_Pokeathlon_get
	bl sub_02031974
	str r0, [r4]
	add r0, r6, #0
	bl sub_0203EE54
	str r0, [r4, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EE90
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203EEA0

	thumb_func_start sub_0203EED4
sub_0203EED4: ; 0x0203EED4
	ldr r3, _0203EEDC ; =Fsys_LaunchApplication
	add r2, r1, #0
	ldr r1, _0203EEE0 ; =_020FA314
	bx r3
	.balign 4, 0
_0203EEDC: .word Fsys_LaunchApplication
_0203EEE0: .word _020FA314
	thumb_func_end sub_0203EED4

	thumb_func_start sub_0203EEE4
sub_0203EEE4: ; 0x0203EEE4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	add r6, r0, #0
	bl Save_Pokeathlon_get
	add r7, r0, #0
	add r0, r6, #0
	bl Sav2_Pokedex_get
	str r0, [sp]
	str r0, [r4]
	add r0, r7, #0
	bl sub_02031978
	str r0, [r4, #4]
	ldr r0, [sp]
	bl Pokedex_GetNatDexFlag
	str r0, [r4, #8]
	add r0, r6, #0
	bl sub_0203EE54
	str r0, [r4, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EED4
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203EEE4

	thumb_func_start sub_0203EF30
sub_0203EF30: ; 0x0203EF30
	ldr r3, _0203EF38 ; =Fsys_LaunchApplication
	add r2, r1, #0
	ldr r1, _0203EF3C ; =_020FA324
	bx r3
	.balign 4, 0
_0203EF38: .word Fsys_LaunchApplication
_0203EF3C: .word _020FA324
	thumb_func_end sub_0203EF30

	thumb_func_start sub_0203EF40
sub_0203EF40: ; 0x0203EF40
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x14
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	add r6, r0, #0
	bl Save_Pokeathlon_get
	add r7, r0, #0
	bl sub_0203197C
	str r0, [r4]
	add r0, r7, #0
	bl sub_02031984
	str r0, [r4, #4]
	add r0, r6, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r4, #0xc]
	add r0, r6, #0
	bl sub_0203EE54
	str r0, [r4, #0x10]
	add r0, r7, #0
	bl sub_02031990
	str r0, [r4, #8]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EF30
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203EF40

	thumb_func_start sub_0203EF90
sub_0203EF90: ; 0x0203EF90
	ldr r3, _0203EF98 ; =Fsys_LaunchApplication
	add r2, r1, #0
	ldr r1, _0203EF9C ; =_020FA424
	bx r3
	.balign 4, 0
_0203EF98: .word Fsys_LaunchApplication
_0203EF9C: .word _020FA424
	thumb_func_end sub_0203EF90

	thumb_func_start sub_0203EFA0
sub_0203EFA0: ; 0x0203EFA0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #3
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	add r7, r0, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r6, r0, #0
	add r0, r7, #0
	bl Save_Pokeathlon_get
	str r0, [r4]
	add r0, r5, #0
	add r1, r4, #0
	str r6, [r4, #4]
	bl sub_0203EF90
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203EFA0

	thumb_func_start sub_0203EFD4
sub_0203EFD4: ; 0x0203EFD4
	add r2, r1, #0
	mov r1, #0x43
	lsl r1, r1, #2
	add r1, r0, r1
	str r1, [r2, #0x1c]
	ldr r3, _0203EFE4 ; =Fsys_LaunchApplication
	ldr r1, _0203EFE8 ; =_020FA434
	bx r3
	.balign 4, 0
_0203EFE4: .word Fsys_LaunchApplication
_0203EFE8: .word _020FA434
	thumb_func_end sub_0203EFD4

	thumb_func_start sub_0203EFEC
sub_0203EFEC: ; 0x0203EFEC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl Fsys_GetSaveDataPtr
	mov r1, #0xb
	str r1, [sp]
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_02090E68
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EFD4
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203EFEC

	thumb_func_start CreateUseMailWork
CreateUseMailWork: ; 0x0203F018
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	cmp r5, #3
	bne _0203F034
	bl Fsys_GetSaveDataPtr
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02090F38
	b _0203F042
_0203F034:
	bl Fsys_GetSaveDataPtr
	add r1, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_02090EC0
_0203F042:
	add r4, r0, #0
	add r0, r7, #0
	add r1, r4, #0
	bl sub_0203EFD4
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end CreateUseMailWork

	thumb_func_start sub_0203F050
sub_0203F050: ; 0x0203F050
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r2, #0
	add r5, r0, #0
	bl Fsys_GetSaveDataPtr
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02090F00
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0203EFD4
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0203F050

	thumb_func_start sub_0203F074
sub_0203F074: ; 0x0203F074
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0xc
	bl AllocFromHeap
	add r4, r0, #0
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	str r0, [r4]
	mov r0, #0x43
	lsl r0, r0, #2
	str r5, [r4, #4]
	add r0, r5, r0
	str r0, [r4, #8]
	ldr r1, _0203F0A4 ; =_020FA2F4
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0203F0A4: .word _020FA2F4
	thumb_func_end sub_0203F074

	thumb_func_start sub_0203F0A8
sub_0203F0A8: ; 0x0203F0A8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203F0CC ; =_020FA2E4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203F0CC: .word _020FA2E4
	thumb_func_end sub_0203F0A8

	thumb_func_start sub_0203F0D0
sub_0203F0D0: ; 0x0203F0D0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #0x24
	add r4, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x24
	add r5, r0, #0
	bl memset
	add r0, r6, #0
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	str r0, [r5]
	add r0, r6, #0
	bl Save_DressupData_get
	str r0, [sp]
	mov r1, #0
	bl sub_0202B9B8
	add r4, r0, #0
	ldr r0, [sp]
	bl SaveDressupData_GetFashionCase
	str r4, [r5, #4]
	str r0, [r5, #8]
	add r0, r6, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r5, #0xc]
	add r0, r6, #0
	bl Sav2_GameStats_get
	str r0, [r5, #0x10]
	add r0, r6, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r5, #0x14]
	ldr r0, [sp, #0x18]
	str r7, [r5, #0x18]
	str r0, [r5, #0x1c]
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0203F0D0

	thumb_func_start sub_0203F134
sub_0203F134: ; 0x0203F134
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _0203F152
	cmp r0, #1
	beq _0203F162
	b _0203F192
_0203F152:
	ldr r1, [r5, #0xc]
	add r0, r4, #0
	bl sub_0203F1E8
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0203F192
_0203F162:
	add r0, r4, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _0203F192
	ldr r1, [r5, #4]
	cmp r1, #0
	beq _0203F182
	ldr r0, [r5, #8]
	cmp r0, #1
	bne _0203F17E
	mov r0, #1
	strh r0, [r1]
	b _0203F182
_0203F17E:
	mov r0, #0
	strh r0, [r1]
_0203F182:
	ldr r0, [r5, #0xc]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_0203F192:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203F134

	thumb_func_start sub_0203F198
sub_0203F198: ; 0x0203F198
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #0x20
	mov r1, #0x10
	add r7, r2, #0
	str r3, [sp, #4]
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x10
	mov r0, #0
_0203F1B4:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0203F1B4
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	add r3, r4, #0
	add r1, r7, #0
	str r0, [sp]
	ldr r2, [sp, #4]
	mov r0, #0x20
	add r3, #8
	bl sub_0203F0D0
	str r0, [r4, #0xc]
	ldr r1, _0203F1E4 ; =sub_0203F134
	add r0, r6, #0
	add r2, r4, #0
	str r5, [r4, #4]
	bl TaskManager_Call
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203F1E4: .word sub_0203F134
	thumb_func_end sub_0203F198

	thumb_func_start sub_0203F1E8
sub_0203F1E8: ; 0x0203F1E8
	push {r3, lr}
	add r2, r1, #0
	mov r1, #0x43
	lsl r1, r1, #2
	add r1, r0, r1
	str r1, [r2, #0x20]
	ldr r1, _0203F200 ; =_0210F9AC
	bl Fsys_LaunchApplication
	mov r0, #1
	pop {r3, pc}
	nop
_0203F200: .word _0210F9AC
	thumb_func_end sub_0203F1E8

	thumb_func_start sub_0203F204
sub_0203F204: ; 0x0203F204
	push {r3, lr}
	add r2, r1, #0
	ldr r1, _0203F214 ; =_0210F99C
	bl Fsys_LaunchApplication
	mov r0, #1
	pop {r3, pc}
	nop
_0203F214: .word _0210F99C
	thumb_func_end sub_0203F204

	thumb_func_start sub_0203F218
sub_0203F218: ; 0x0203F218
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r5, #4]
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r5, #8]
	ldr r0, [r4, #0xc]
	mov r1, #8
	bl SavArray_get
	str r0, [r5, #0xc]
	ldr r0, [r4, #0xc]
	bl sub_0202CA44
	str r0, [r5, #0x14]
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r5, #0x18]
	ldr r0, [r4, #0xc]
	bl Sav2_Pokedex_get
	str r0, [r5, #0x20]
	ldr r0, [r4, #0xc]
	bl SavArray_IsNatDexEnabled
	str r0, [r5, #0x2c]
	ldr r0, [r4, #0xc]
	str r0, [r5, #0x10]
	ldr r0, [r4, #0xc]
	bl Sav2_GameStats_get
	str r0, [r5, #0x1c]
	bl PlayerProfile_sizeof
	add r1, r0, #0
	mov r0, #0x20
	bl AllocFromHeap
	str r0, [r5, #0x34]
	bl sub_02070D90
	add r1, r0, #0
	mov r0, #0x20
	bl AllocFromHeap
	str r0, [r5, #0x38]
	bl sub_02070D90
	add r1, r0, #0
	mov r0, #0x20
	bl AllocFromHeap
	str r0, [r5, #0x3c]
	str r4, [r5]
	mov r0, #0
	str r0, [r5, #0x30]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0203F218

	thumb_func_start sub_0203F298
sub_0203F298: ; 0x0203F298
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _0203F2AA
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x34]
_0203F2AA:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _0203F2B8
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x38]
_0203F2B8:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _0203F2C6
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x3c]
_0203F2C6:
	pop {r4, pc}
	thumb_func_end sub_0203F298

	thumb_func_start sub_0203F2C8
sub_0203F2C8: ; 0x0203F2C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r6, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #7
	bls _0203F2E4
	b _0203F49A
_0203F2E4:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0203F2F0: ; jump table
	.short _0203F300 - _0203F2F0 - 2 ; case 0
	.short _0203F316 - _0203F2F0 - 2 ; case 1
	.short _0203F324 - _0203F2F0 - 2 ; case 2
	.short _0203F336 - _0203F2F0 - 2 ; case 3
	.short _0203F354 - _0203F2F0 - 2 ; case 4
	.short _0203F3C2 - _0203F2F0 - 2 ; case 5
	.short _0203F446 - _0203F2F0 - 2 ; case 6
	.short _0203F472 - _0203F2F0 - 2 ; case 7
_0203F300:
	bl sub_02039998
	cmp r0, #0
	bne _0203F30E
	add r0, r6, #0
	bl sub_0205525C
_0203F30E:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0203F49A
_0203F316:
	add r0, r4, #4
	add r1, r5, #0
	bl sub_0203F218
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0203F324:
	ldr r1, _0203F4A0 ; =_0210F98C
	add r0, r6, #0
	add r2, r4, #4
	bl CallApplicationAsTask
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0203F49A
_0203F336:
	ldr r1, [r4, #0x28]
	cmp r1, #0
	bne _0203F34E
	add r0, r4, #4
	bl sub_0203F298
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x2c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0203F34E:
	add r0, r0, #1
	str r0, [r4]
	b _0203F49A
_0203F354:
	ldr r0, [r4, #0x38]
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x3c]
	bl Mon_GetBoxMon
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x40]
	bl Mon_GetBoxMon
	str r0, [r4, #0x48]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0x58]
	mov r0, #1
	str r0, [r4, #0x54]
	add r0, r5, #0
	bl Field_GetTimeOfDay
	cmp r0, #4
	bhi _0203F394
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203F38A: ; jump table
	.short _0203F394 - _0203F38A - 2 ; case 0
	.short _0203F394 - _0203F38A - 2 ; case 1
	.short _0203F39A - _0203F38A - 2 ; case 2
	.short _0203F3A0 - _0203F38A - 2 ; case 3
	.short _0203F3A0 - _0203F38A - 2 ; case 4
_0203F394:
	mov r0, #0
	str r0, [r4, #0x50]
	b _0203F3A4
_0203F39A:
	mov r0, #1
	str r0, [r4, #0x50]
	b _0203F3A4
_0203F3A0:
	mov r0, #2
	str r0, [r4, #0x50]
_0203F3A4:
	bl sub_02039998
	cmp r0, #0
	beq _0203F3B0
	mov r0, #3
	str r0, [r4, #0x50]
_0203F3B0:
	add r2, r4, #0
	ldr r1, _0203F4A4 ; =_020FA2D4
	add r0, r6, #0
	add r2, #0x44
	bl CallApplicationAsTask
	mov r0, #5
	str r0, [r4]
	b _0203F49A
_0203F3C2:
	ldr r0, [r4, #0x40]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r3, r0, #0
	add r0, sp, #0x28
	str r0, [sp]
	lsl r3, r3, #0x10
	ldr r1, [r4, #0x40]
	mov r0, #0
	mov r2, #1
	lsr r3, r3, #0x10
	bl GetMonEvolution
	str r0, [sp, #0x1c]
	cmp r0, #0
	beq _0203F440
	mov r0, #3
	mov r1, #0x1a
	lsl r2, r0, #0x10
	bl CreateHeap
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [sp, #0x20]
	ldr r0, [r5, #0xc]
	bl sub_02088288
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_Pokedex_get
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	str r0, [sp, #0x24]
	ldr r0, [r5, #0xc]
	bl Sav2_GameStats_get
	str r6, [sp]
	ldr r1, [sp, #0x24]
	str r7, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x1c]
	str r0, [sp, #0x10]
	mov r0, #4
	str r0, [sp, #0x14]
	mov r0, #0x1a
	str r0, [sp, #0x18]
	ldr r1, [r4, #0x40]
	ldr r3, [sp, #0x20]
	mov r0, #0
	bl sub_02075A7C
	str r0, [r4, #0x5c]
	mov r0, #6
	str r0, [r4]
	b _0203F49A
_0203F440:
	mov r0, #7
	str r0, [r4]
	b _0203F49A
_0203F446:
	ldr r0, [r4, #0x5c]
	bl sub_02075D3C
	cmp r0, #0
	beq _0203F49A
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x2c]
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, [r4, #0x40]
	bl CopyPokemonToPokemon
	ldr r0, [r4, #0x5c]
	bl sub_02075D4C
	mov r0, #0x1a
	bl DestroyHeap
	mov r0, #7
	str r0, [r4]
	b _0203F49A
_0203F472:
	ldr r0, [r4, #0x34]
	add r0, r0, #1
	str r0, [r4, #0x34]
	mov r0, #2
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_GameStats_get
	mov r1, #0x10
	add r4, r0, #0
	bl GameStats_AddSpecial
	bl sub_02039998
	cmp r0, #0
	beq _0203F49A
	add r0, r4, #0
	mov r1, #0x72
	bl GameStats_Inc
_0203F49A:
	mov r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0203F4A0: .word _0210F98C
_0203F4A4: .word _020FA2D4
	thumb_func_end sub_0203F2C8

	thumb_func_start sub_0203F4A8
sub_0203F4A8: ; 0x0203F4A8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x20
	mov r1, #0x64
	bl AllocFromHeap
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	ldr r1, _0203F4C4 ; =sub_0203F2C8
	add r0, r4, #0
	bl TaskManager_Call
	pop {r4, pc}
	.balign 4, 0
_0203F4C4: .word sub_0203F2C8
	thumb_func_end sub_0203F4A8

	thumb_func_start sub_0203F4C8
sub_0203F4C8: ; 0x0203F4C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x20
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	ldr r1, _0203F4F4 ; =_020FA2C4
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	pop {r3, r4, r5, pc}
	nop
_0203F4F4: .word _020FA2C4
	thumb_func_end sub_0203F4C8

	thumb_func_start sub_0203F4F8
sub_0203F4F8: ; 0x0203F4F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x14
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	str r0, [r4]
	add r0, r5, #0
	add r0, #0x84
	ldr r0, [r0]
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_GameStats_get
	str r0, [r4, #0xc]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #0x10]
	ldr r1, _0203F538 ; =_020FA2B4
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203F538: .word _020FA2B4
	thumb_func_end sub_0203F4F8

	thumb_func_start CreatePalPadWork
CreatePalPadWork: ; 0x0203F53C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r0, r2, #0
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0x43
	lsl r0, r0, #2
	str r6, [r4]
	add r0, r5, r0
	str r0, [r4, #4]
	ldr r1, _0203F56C ; =_020FA2A4
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203F56C: .word _020FA2A4
	thumb_func_end CreatePalPadWork

	thumb_func_start sub_0203F570
sub_0203F570: ; 0x0203F570
	ldr r3, _0203F578 ; =Fsys_LaunchApplication
	ldr r1, _0203F57C ; =_02102830
	add r2, r0, #0
	bx r3
	.balign 4, 0
_0203F578: .word Fsys_LaunchApplication
_0203F57C: .word _02102830
	thumb_func_end sub_0203F570

	thumb_func_start sub_0203F580
sub_0203F580: ; 0x0203F580
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #3
	bhi _0203F648
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203F5A4: ; jump table
	.short _0203F5AC - _0203F5A4 - 2 ; case 0
	.short _0203F5BA - _0203F5A4 - 2 ; case 1
	.short _0203F5CC - _0203F5A4 - 2 ; case 2
	.short _0203F5DA - _0203F5A4 - 2 ; case 3
_0203F5AC:
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0203F648
_0203F5BA:
	ldr r1, _0203F64C ; =_02102610
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	bl CallApplicationAsTask
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0203F648
_0203F5CC:
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0203F648
_0203F5DA:
	ldr r1, [r4, #0xc]
	ldr r0, [r1]
	cmp r0, #1
	bne _0203F5F6
	ldr r0, [r1, #0x18]
	ldr r1, [r4, #0x10]
	bl StringCompare
	cmp r0, #0
	bne _0203F618
	ldr r0, [r4, #0xc]
	mov r1, #1
	str r1, [r0, #0x14]
	b _0203F618
_0203F5F6:
	cmp r0, #5
	bne _0203F618
	ldr r0, [r1, #0x18]
	bl String_c_str
	add r7, r0, #0
	ldr r0, [r6, #0xc]
	bl Save_FriendGroup_get
	add r1, r7, #0
	bl sub_0202C88C
	cmp r0, #0
	beq _0203F618
	ldr r0, [r4, #0xc]
	mov r1, #2
	str r1, [r0, #0x14]
_0203F618:
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0203F626
	add r0, r5, #0
	bl NamingScreen_SetName
_0203F626:
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0203F632
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x14]
	strh r0, [r1]
_0203F632:
	ldr r0, [r4, #0xc]
	bl sub_0208311C
	ldr r0, [r4, #0x10]
	bl String_dtor
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0203F648:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203F64C: .word _02102610
	thumb_func_end sub_0203F580

	thumb_func_start NamingScreen_SetName
NamingScreen_SetName: ; 0x0203F650
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r0, [r0]
	cmp r0, #5
	bhi _0203F6DC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203F676: ; jump table
	.short _0203F682 - _0203F676 - 2 ; case 0
	.short _0203F6A2 - _0203F676 - 2 ; case 1
	.short _0203F6DC - _0203F676 - 2 ; case 2
	.short _0203F692 - _0203F676 - 2 ; case 3
	.short _0203F6DC - _0203F676 - 2 ; case 4
	.short _0203F6CA - _0203F676 - 2 ; case 5
_0203F682:
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	ldr r1, [r4, #0xc]
	add r1, #0x1c
	bl Sav2_Profile_PlayerName_set
	pop {r4, r5, r6, pc}
_0203F692:
	ldr r0, [r5, #0xc]
	bl Sav2_Misc_get
	ldr r1, [r4, #0xc]
	ldr r1, [r1, #0x18]
	bl Sav2_Misc_RivalName_set
	pop {r4, r5, r6, pc}
_0203F6A2:
	ldr r6, [r4, #4]
	cmp r6, #0xff
	bne _0203F6B2
	add r0, r5, #0
	bl FieldSys_BugContest_get
	ldr r0, [r0, #0x10]
	b _0203F6BE
_0203F6B2:
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
_0203F6BE:
	ldr r2, [r4, #0xc]
	mov r1, #0x76
	add r2, #0x1c
	bl SetMonData
	pop {r4, r5, r6, pc}
_0203F6CA:
	ldr r0, [r5, #0xc]
	bl Save_FriendGroup_get
	ldr r3, [r4, #0xc]
	mov r1, #0
	ldr r3, [r3, #0x18]
	add r2, r1, #0
	bl sub_0202C7F8
_0203F6DC:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end NamingScreen_SetName

	thumb_func_start CreateNamingScreen
CreateNamingScreen: ; 0x0203F6E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #8]
	add r7, r1, #0
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r5, [sp, #0x2c]
	bl TaskManager_GetSys
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #0x14
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r0, #0
	str r0, [r4]
	ldr r0, [sp, #0x28]
	str r0, [r4, #4]
	ldr r0, [sp, #0x30]
	str r0, [r4, #8]
	ldr r0, [r6, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [sp]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r6, r0
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	mov r0, #0xb
	add r1, r7, #0
	bl sub_020830D8
	str r0, [r4, #0xc]
	mov r0, #0xc
	mov r1, #0xb
	bl String_ctor
	str r0, [r4, #0x10]
	cmp r7, #1
	beq _0203F73C
	cmp r7, #5
	beq _0203F784
	b _0203F78E
_0203F73C:
	ldr r0, [sp, #0x28]
	cmp r0, #0xff
	bne _0203F74C
	add r0, r6, #0
	bl FieldSys_BugContest_get
	ldr r6, [r0, #0x10]
	b _0203F75A
_0203F74C:
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	ldr r1, [r4, #4]
	bl GetPartyMonByIndex
	add r6, r0, #0
_0203F75A:
	add r0, r6, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	ldr r1, [r4, #0xc]
	mov r2, #0
	str r0, [r1, #0x10]
	add r0, r6, #0
	mov r1, #0x70
	bl GetMonData
	ldr r1, [r4, #0xc]
	cmp r5, #0
	str r0, [r1, #8]
	beq _0203F79C
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl CopyU16ArrayToString
	b _0203F79C
_0203F784:
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl CopyU16ArrayToString
	b _0203F79C
_0203F78E:
	cmp r5, #0
	beq _0203F79C
	ldr r0, [r4, #0xc]
	add r1, r5, #0
	ldr r0, [r0, #0x18]
	bl CopyU16ArrayToString
_0203F79C:
	ldr r0, [sp, #8]
	ldr r1, _0203F7AC ; =sub_0203F580
	add r2, r4, #0
	bl TaskManager_Call
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0203F7AC: .word sub_0203F580
	thumb_func_end CreateNamingScreen

	thumb_func_start sub_0203F7B0
sub_0203F7B0: ; 0x0203F7B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x43
	lsl r0, r0, #2
	add r4, r1, #0
	add r1, r5, r0
	ldr r0, _0203F7E8 ; =0x0000066C
	str r1, [r4, r0]
	ldr r1, [r5, #0xc]
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl CheckGameClearFlag
	ldr r1, _0203F7EC ; =0x00000678
	mov r2, #0
	str r0, [r4, r1]
	sub r0, r1, #4
	str r2, [r4, r0]
	ldr r1, _0203F7F0 ; =_020FA294
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	pop {r3, r4, r5, pc}
	nop
_0203F7E8: .word 0x0000066C
_0203F7EC: .word 0x00000678
_0203F7F0: .word _020FA294
	thumb_func_end sub_0203F7B0

	thumb_func_start sub_0203F7F4
sub_0203F7F4: ; 0x0203F7F4
	push {r3, lr}
	add r2, r1, #0
	ldr r1, _0203F804 ; =_020FA284
	bl Fsys_LaunchApplication
	mov r0, #1
	pop {r3, pc}
	nop
_0203F804: .word _020FA284
	thumb_func_end sub_0203F7F4

	thumb_func_start FieldSys_LaunchChooseStarterApplication
FieldSys_LaunchChooseStarterApplication: ; 0x0203F808
	ldr r3, _0203F810 ; =Fsys_LaunchApplication
	add r2, r1, #0
	ldr r1, _0203F814 ; =sAppTemplate_ChooseStarter
	bx r3
	.balign 4, 0
_0203F810: .word Fsys_LaunchApplication
_0203F814: .word sAppTemplate_ChooseStarter
	thumb_func_end FieldSys_LaunchChooseStarterApplication

	thumb_func_start sub_0203F818
sub_0203F818: ; 0x0203F818
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl Save_TrainerCard_get
	ldr r5, _0203F840 ; =_020FA254
	add r3, sp, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r1, r2, #0
	ldr r2, [r4, #0xc]
	add r0, r4, #0
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203F840: .word _020FA254
	thumb_func_end sub_0203F818

	thumb_func_start sub_0203F844
sub_0203F844: ; 0x0203F844
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r3, _0203F8E8 ; =_020FA264
	add r2, sp, #0
	add r5, r0, #0
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0xb
	mov r1, #0x40
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0202DB34
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_SysInfo_get
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	bl SavArray_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl GetStoragePCPointer
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	bl Sav2_Pokedex_get
	str r0, [r4, #0x10]
	ldr r0, [r5, #0xc]
	bl sub_0202C6F4
	str r0, [r4, #0x14]
	ldr r0, [r5, #0xc]
	bl sub_0202CA44
	str r0, [r4, #0x18]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0x24]
	ldr r0, [r5, #0xc]
	bl Sav2_GameStats_get
	str r0, [r4, #0x28]
	ldr r0, [r5, #0xc]
	bl sub_02088288
	str r0, [r4, #0x38]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0x20]
	ldr r0, [r5, #0xc]
	bl SavArray_IsNatDexEnabled
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x14]
	bl sub_0203A040
	str r0, [r4, #0x34]
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #0x2c]
	add r0, r5, #0
	add r1, sp, #0
	add r2, r4, #0
	str r6, [r4, #0x3c]
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203F8E8: .word _020FA264
	thumb_func_end sub_0203F844

	thumb_func_start sub_0203F8EC
sub_0203F8EC: ; 0x0203F8EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r3, _0203F960 ; =_020FA334
	add r7, r2, #0
	add r2, sp, #0
	add r5, r0, #0
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0xb
	mov r1, #0x28
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_FrontierData_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl sub_0202D928
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_SysInfo_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0x10]
	ldr r0, [r5, #0xc]
	bl sub_0202C6F4
	bl sub_0202C08C
	str r0, [r4, #0x14]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	bl sub_0202C6F4
	bl sub_0203A040
	str r0, [r4, #0x1c]
	str r6, [r4, #0x18]
	str r7, [r4, #0x24]
	mov r0, #1
	str r0, [r4, #0x20]
	add r0, r5, #0
	add r1, sp, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203F960: .word _020FA334
	thumb_func_end sub_0203F8EC

	thumb_func_start sub_0203F964
sub_0203F964: ; 0x0203F964
	ldr r3, _0203F96C ; =Fsys_LaunchApplication
	ldr r1, _0203F970 ; =_020FA224
	ldr r2, [r0, #0xc]
	bx r3
	.balign 4, 0
_0203F96C: .word Fsys_LaunchApplication
_0203F970: .word _020FA224
	thumb_func_end sub_0203F964

	thumb_func_start sub_0203F974
sub_0203F974: ; 0x0203F974
	ldr r3, _0203F97C ; =Fsys_LaunchApplication
	add r2, r1, #0
	ldr r1, _0203F980 ; =_020FA214
	bx r3
	.balign 4, 0
_0203F97C: .word Fsys_LaunchApplication
_0203F980: .word _020FA214
	thumb_func_end sub_0203F974

	thumb_func_start sub_0203F984
sub_0203F984: ; 0x0203F984
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r1, #0xb
	add r2, sp, #0
	bl LoadHallOfFame
	ldr r1, [sp]
	add r4, r0, #0
	cmp r1, #2
	bne _0203F9A2
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203F9A2:
	ldr r1, _0203F9B0 ; =_020FA204
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203F9B0: .word _020FA204
	thumb_func_end sub_0203F984

	thumb_func_start sub_0203F9B4
sub_0203F9B4: ; 0x0203F9B4
	ldr r3, _0203F9BC ; =Fsys_LaunchApplication
	add r2, r1, #0
	ldr r1, _0203F9C0 ; =_020FA1F4
	bx r3
	.balign 4, 0
_0203F9BC: .word Fsys_LaunchApplication
_0203F9C0: .word _020FA1F4
	thumb_func_end sub_0203F9B4

	thumb_func_start sub_0203F9C4
sub_0203F9C4: ; 0x0203F9C4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r6, _0203F9F0 ; =_020FA1E4
	add r5, sp, #0
	add r3, r0, #0
	add r2, r1, #0
	add r4, r5, #0
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r5!, {r0, r1}
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r3, r0
	str r0, [r2, #0xc]
	add r0, r3, #0
	add r1, r4, #0
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203F9F0: .word _020FA1E4
	thumb_func_end sub_0203F9C4

	thumb_func_start sub_0203F9F4
sub_0203F9F4: ; 0x0203F9F4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	bl sub_0206CE44
	add r5, r0, #0
	bne _0203FA0C
	bl GF_AssertFail
_0203FA0C:
	str r5, [sp]
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #8]
	ldr r1, [r4, #0x20]
	add r0, r4, #0
	ldr r1, [r1]
	bl Fsys_GetSurfOverriddenMusicId
	add r1, sp, #0
	strh r0, [r1, #0xc]
	ldr r0, [r4, #0x10]
	add r1, sp, #0
	bl sub_02091240
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203F9F4

	thumb_func_start sub_0203FA38
sub_0203FA38: ; 0x0203FA38
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x14
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x14
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl Fsys_GetSaveDataPtr
	add r6, r0, #0
	bl Sav2_PlayerData_GetCoinsAddr
	str r0, [r4, #4]
	add r0, r6, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #8]
	add r0, r6, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	ldr r1, _0203FA88 ; =_020FA234
	str r0, [r4, #0x10]
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_0203FA88: .word _020FA234
	thumb_func_end sub_0203FA38

	thumb_func_start sub_0203FA8C
sub_0203FA8C: ; 0x0203FA8C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #8
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	str r6, [r4, #4]
	ldr r0, [r5, #0xc]
	ldr r1, _0203FAB0 ; =_020FA304
	str r0, [r4]
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203FAB0: .word _020FA304
	thumb_func_end sub_0203FA8C

	thumb_func_start sub_0203FAB4
sub_0203FAB4: ; 0x0203FAB4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	ldr r0, [sp, #0x18]
	mov r1, #8
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	add r4, r0, #0
	strb r6, [r4, #4]
	strb r7, [r4, #5]
	ldr r0, [sp]
	ldr r1, _0203FAE4 ; =_0210F9BC
	strh r0, [r4, #6]
	ldr r0, [r5, #0xc]
	add r2, r4, #0
	str r0, [r4]
	add r0, r5, #0
	bl Fsys_LaunchApplication
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203FAE4: .word _0210F9BC
	thumb_func_end sub_0203FAB4

	thumb_func_start sub_0203FAE8
sub_0203FAE8: ; 0x0203FAE8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x44
	add r6, r2, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl memset
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	bl sub_020270C4
	str r0, [r4, #0x10]
	mov r0, #0
	add r1, r4, #0
	str r0, [r4, #0x18]
	add r1, #0x25
	strb r0, [r1]
	add r1, r4, #0
	mov r2, #5
	add r1, #0x24
	strb r2, [r1]
	add r1, r4, #0
	strh r6, [r4, #0x28]
	add r1, #0x26
	strb r0, [r1]
	mov r0, #0x43
	lsl r0, r0, #2
	str r5, [r4, #0x1c]
	add r0, r5, r0
	str r0, [r4, #0x20]
	ldr r1, _0203FB5C ; =_0210159C
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_0203FB5C: .word _0210159C
	thumb_func_end sub_0203FAE8

	thumb_func_start ScratchOffCards_Create
ScratchOffCards_Create: ; 0x0203FB60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x18
	mov r0, #0
_0203FB74:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0203FB74
	ldr r0, [r5, #0xc]
	ldr r1, _0203FB90 ; =_0210F97C
	str r0, [r4]
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0203FB90: .word _0210F97C
	thumb_func_end ScratchOffCards_Create

	thumb_func_start sub_0203FB94
sub_0203FB94: ; 0x0203FB94
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r0, #0xb
	mov r1, #0x3c
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	mov r0, #1
	strb r0, [r4, #0x11]
	strb r6, [r4, #0x14]
	ldr r0, [r4]
	bl GetPartyCount
	strb r0, [r4, #0x13]
	mov r0, #0
	strh r0, [r4, #0x18]
	strb r0, [r4, #0x12]
	ldr r0, [r5, #0xc]
	bl Save_SpecialRibbons_get
	str r0, [r4, #0x20]
	ldr r0, [r5, #0xc]
	bl SavArray_IsNatDexEnabled
	str r0, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x2c]
	str r0, [r4, #0x28]
	ldr r0, [r5, #0xc]
	bl sub_0208828C
	str r0, [r4, #0x34]
	ldr r1, _0203FC0C ; =_020FA0B0
	add r0, r4, #0
	bl sub_02089D40
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0208AD34
	ldr r1, _0203FC10 ; =_02103A1C
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_0203FC0C: .word _020FA0B0
_0203FC10: .word _02103A1C
	thumb_func_end sub_0203FB94

	thumb_func_start sub_0203FC14
sub_0203FC14: ; 0x0203FC14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r3, _0203FC54 ; =_020FA1C4
	add r7, r2, #0
	add r2, sp, #0
	add r5, r0, #0
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	str r5, [r4]
	ldr r0, [r5, #0xc]
	add r1, sp, #0
	str r0, [r4, #4]
	str r6, [r4, #8]
	add r0, r5, #0
	add r2, r4, #0
	strb r7, [r4, #0xc]
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203FC54: .word _020FA1C4
	thumb_func_end sub_0203FC14

	thumb_func_start Fsys_LaunchPokeathlonCourseApplication
Fsys_LaunchPokeathlonCourseApplication: ; 0x0203FC58
	ldr r3, _0203FC60 ; =Fsys_LaunchApplication
	add r2, r1, #0
	ldr r1, _0203FC64 ; =_020FA244
	bx r3
	.balign 4, 0
_0203FC60: .word Fsys_LaunchApplication
_0203FC64: .word _020FA244
	thumb_func_end Fsys_LaunchPokeathlonCourseApplication

	thumb_func_start sub_0203FC68
sub_0203FC68: ; 0x0203FC68
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203FC8C ; =_020FA454
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203FC8C: .word _020FA454
	thumb_func_end sub_0203FC68

	thumb_func_start sub_0203FC90
sub_0203FC90: ; 0x0203FC90
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r5, _0203FCB4 ; =_020FA1D4
	add r4, sp, #0
	add r6, r0, #0
	add r2, r1, #0
	add r3, r4, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	add r0, r6, #0
	add r1, r3, #0
	bl Fsys_LaunchApplication
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0203FCB4: .word _020FA1D4
	thumb_func_end sub_0203FC90

	thumb_func_start sub_0203FCB8
sub_0203FCB8: ; 0x0203FCB8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	ldr r0, [sp, #0x18]
	mov r1, #0x50
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x50
	add r4, r0, #0
	bl memset
	add r0, r6, #0
	bl Fsys_GetSaveDataPtr
	str r0, [r4]
	add r3, r4, #4
	mov r2, #9
_0203FCE0:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0203FCE0
	add r0, r4, #0
	add r0, #0x4c
	strh r7, [r0]
	add r1, r4, #0
	ldr r0, [sp]
	add r1, #0x4e
	strh r0, [r1]
	ldr r1, _0203FD04 ; =_020FA474
	add r0, r6, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203FD04: .word _020FA474
	thumb_func_end sub_0203FCB8

	thumb_func_start sub_0203FD08
sub_0203FD08: ; 0x0203FD08
	ldr r3, _0203FD10 ; =Fsys_LaunchApplication
	add r2, r1, #0
	ldr r1, _0203FD14 ; =_020FA494
	bx r3
	.balign 4, 0
_0203FD10: .word Fsys_LaunchApplication
_0203FD14: .word _020FA494
	thumb_func_end sub_0203FD08
