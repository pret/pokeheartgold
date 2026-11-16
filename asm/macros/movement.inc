	.ifndef ASM_MOVEMENT_INC
	.set ASM_MOVEMENT_INC, 1
#pragma once
#include "constants/movements.h"

	.macro FaceNorth length=1
	.short MOVEMENT_FACE_UP
	.short \length
	.endm

	.macro FaceSouth length=1
	.short MOVEMENT_FACE_DOWN
	.short \length
	.endm

	.macro FaceWest length=1
	.short MOVEMENT_FACE_LEFT
	.short \length
	.endm

	.macro FaceEast length=1
	.short MOVEMENT_FACE_RIGHT
	.short \length
	.endm

	.macro WalkSlowerNorth length=1
	.short MOVEMENT_WALK_SLOWER_UP
	.short \length
	.endm

	.macro WalkSlowerSouth length=1
	.short MOVEMENT_WALK_SLOWER_DOWN
	.short \length
	.endm

	.macro WalkSlowerWest length=1
	.short MOVEMENT_WALK_SLOWER_LEFT
	.short \length
	.endm

	.macro WalkSlowerEast length=1
	.short MOVEMENT_WALK_SLOWER_RIGHT
	.short \length
	.endm

	.macro WalkSlowNorth length=1
	.short MOVEMENT_WALK_SLOW_UP
	.short \length
	.endm

	.macro WalkSlowSouth length=1
	.short MOVEMENT_WALK_SLOW_DOWN
	.short \length
	.endm

	.macro WalkSlowWest length=1
	.short MOVEMENT_WALK_SLOW_LEFT
	.short \length
	.endm

	.macro WalkSlowEast length=1
	.short MOVEMENT_WALK_SLOW_RIGHT
	.short \length
	.endm

	.macro WalkNormalNorth length=1
	.short MOVEMENT_STEP_UP
	.short \length
	.endm

	.macro WalkNormalSouth length=1
	.short MOVEMENT_STEP_DOWN
	.short \length
	.endm

	.macro WalkNormalWest length=1
	.short MOVEMENT_STEP_LEFT
	.short \length
	.endm

	.macro WalkNormalEast length=1
	.short MOVEMENT_STEP_RIGHT
	.short \length
	.endm

	.macro WalkFastNorth length=1
	.short MOVEMENT_WALK_FAST_UP
	.short \length
	.endm

	.macro WalkFastSouth length=1
	.short MOVEMENT_WALK_FAST_DOWN
	.short \length
	.endm

	.macro WalkFastWest length=1
	.short MOVEMENT_WALK_FAST_LEFT
	.short \length
	.endm

	.macro WalkFastEast length=1
	.short MOVEMENT_WALK_FAST_RIGHT
	.short \length
	.endm

	.macro WalkFasterNorth length=1
	.short MOVEMENT_WALK_FASTER_UP
	.short \length
	.endm

	.macro WalkFasterSouth length=1
	.short MOVEMENT_WALK_FASTER_DOWN
	.short \length
	.endm

	.macro WalkFasterWest length=1
	.short MOVEMENT_WALK_FASTER_LEFT
	.short \length
	.endm

	.macro WalkFasterEast length=1
	.short MOVEMENT_WALK_FASTER_RIGHT
	.short \length
	.endm

	.macro WalkOnSpotSlowerNorth length=1
	.short MOVEMENT_WALK_IN_PLACE_SLOWER_FACE_UP
	.short \length
	.endm

	.macro WalkOnSpotSlowerSouth length=1
	.short MOVEMENT_WALK_IN_PLACE_SLOWER_FACE_DOWN
	.short \length
	.endm

	.macro WalkOnSpotSlowerWest length=1
	.short MOVEMENT_WALK_IN_PLACE_SLOWER_FACE_LEFT
	.short \length
	.endm

	.macro WalkOnSpotSlowerEast length=1
	.short MOVEMENT_WALK_IN_PLACE_SLOWER_FACE_RIGHT
	.short \length
	.endm

	.macro WalkOnSpotSlowNorth length=1
	.short MOVEMENT_WALK_IN_PLACE_SLOW_FACE_UP
	.short \length
	.endm

	.macro WalkOnSpotSlowSouth length=1
	.short MOVEMENT_WALK_IN_PLACE_SLOW_FACE_DOWN
	.short \length
	.endm

	.macro WalkOnSpotSlowWest length=1
	.short MOVEMENT_WALK_IN_PLACE_SLOW_FACE_LEFT
	.short \length
	.endm

	.macro WalkOnSpotSlowEast length=1
	.short MOVEMENT_WALK_IN_PLACE_SLOW_FACE_RIGHT
	.short \length
	.endm

	.macro WalkOnSpotNormalNorth length=1
	.short MOVEMENT_WALK_IN_PLACE_FACE_UP
	.short \length
	.endm

	.macro WalkOnSpotNormalSouth length=1
	.short MOVEMENT_WALK_IN_PLACE_FACE_DOWN
	.short \length
	.endm

	.macro WalkOnSpotNormalWest length=1
	.short MOVEMENT_WALK_IN_PLACE_FACE_LEFT
	.short \length
	.endm

	.macro WalkOnSpotNormalEast length=1
	.short MOVEMENT_WALK_IN_PLACE_FACE_RIGHT
	.short \length
	.endm

	.macro WalkOnSpotFastNorth length=1
	.short MOVEMENT_WALK_IN_PLACE_FAST_FACE_UP
	.short \length
	.endm

	.macro WalkOnSpotFastSouth length=1
	.short MOVEMENT_WALK_IN_PLACE_FAST_FACE_DOWN
	.short \length
	.endm

	.macro WalkOnSpotFastWest length=1
	.short MOVEMENT_WALK_IN_PLACE_FAST_FACE_LEFT
	.short \length
	.endm

	.macro WalkOnSpotFastEast length=1
	.short MOVEMENT_WALK_IN_PLACE_FAST_FACE_RIGHT
	.short \length
	.endm

	.macro WalkOnSpotFasterNorth length=1
	.short MOVEMENT_WALK_IN_PLACE_FASTER_FACE_UP
	.short \length
	.endm

	.macro WalkOnSpotFasterSouth length=1
	.short MOVEMENT_WALK_IN_PLACE_FASTER_FACE_DOWN
	.short \length
	.endm

	.macro WalkOnSpotFasterWest length=1
	.short MOVEMENT_WALK_IN_PLACE_FASTER_FACE_LEFT
	.short \length
	.endm

	.macro WalkOnSpotFasterEast length=1
	.short MOVEMENT_WALK_IN_PLACE_FASTER_FACE_RIGHT
	.short \length
	.endm

	.macro JumpOnSpotSlowNorth length=1
	.short MOVEMENT_JUMP_IN_PLACE_SLOW_FACE_UP
	.short \length
	.endm

	.macro JumpOnSpotSlowSouth length=1
	.short MOVEMENT_JUMP_IN_PLACE_SLOW_FACE_DOWN
	.short \length
	.endm

	.macro JumpOnSpotSlowWest length=1
	.short MOVEMENT_JUMP_IN_PLACE_SLOW_FACE_LEFT
	.short \length
	.endm

	.macro JumpOnSpotSlowEast length=1
	.short MOVEMENT_JUMP_IN_PLACE_SLOW_FACE_RIGHT
	.short \length
	.endm

	.macro JumpOnSpotFastNorth length=1
	.short MOVEMENT_JUMP_IN_PLACE_FAST_FACE_UP
	.short \length
	.endm

	.macro JumpOnSpotFastSouth length=1
	.short MOVEMENT_JUMP_IN_PLACE_FAST_FACE_DOWN
	.short \length
	.endm

	.macro JumpOnSpotFastWest length=1
	.short MOVEMENT_JUMP_IN_PLACE_FAST_FACE_LEFT
	.short \length
	.endm

	.macro JumpOnSpotFastEast length=1
	.short MOVEMENT_JUMP_IN_PLACE_FAST_FACE_RIGHT
	.short \length
	.endm

	.macro JumpNearFastNorth length=1
	.short MOVEMENT_JUMP_NEAR_FAST_UP
	.short \length
	.endm

	.macro JumpNearFastSouth length=1
	.short MOVEMENT_JUMP_NEAR_FAST_DOWN
	.short \length
	.endm

	.macro JumpNearFastWest length=1
	.short MOVEMENT_JUMP_NEAR_FAST_LEFT
	.short \length
	.endm

	.macro JumpNearFastEast length=1
	.short MOVEMENT_JUMP_NEAR_FAST_RIGHT
	.short \length
	.endm

	.macro JumpFarNorth length=1
	.short MOVEMENT_JUMP_FAR_UP
	.short \length
	.endm

	.macro JumpFarSouth length=1
	.short MOVEMENT_JUMP_FAR_DOWN
	.short \length
	.endm

	.macro JumpFarWest length=1
	.short MOVEMENT_JUMP_FAR_LEFT
	.short \length
	.endm

	.macro JumpFarEast length=1
	.short MOVEMENT_JUMP_FAR_RIGHT
	.short \length
	.endm

	.macro Delay1 length=1
	.short MOVEMENT_DELAY_1
	.short \length
	.endm

	.macro Delay2 length=1
	.short MOVEMENT_DELAY_2
	.short \length
	.endm

	.macro Delay4 length=1
	.short MOVEMENT_DELAY_4
	.short \length
	.endm

	.macro Delay8 length=1
	.short MOVEMENT_DELAY_8
	.short \length
	.endm

	.macro Delay15 length=1
	.short MOVEMENT_DELAY_15
	.short \length
	.endm

	.macro Delay16 length=1
	.short MOVEMENT_DELAY_16
	.short \length
	.endm

	.macro Delay32 length=1
	.short MOVEMENT_DELAY_32
	.short \length
	.endm

	.macro WarpOut length=1
	.short MOVEMENT_WARP_OUT
	.short \length
	.endm

	.macro WarpIn length=1
	.short MOVEMENT_WARP_IN
	.short \length
	.endm

	.macro SetInvisible length=1
	.short 69
	.short \length
	.endm

	.macro SetVisible length=1
	.short 70
	.short \length
	.endm

	.macro LockDir length=1
	.short MOVEMENT_UNK_71
	.short \length
	.endm

	.macro UnlockDir length=1
	.short MOVEMENT_UNK_72
	.short \length
	.endm

	.macro PauseAnimation length=1
	.short 73
	.short \length
	.endm

	.macro ResumeAnimation length=1
	.short 74
	.short \length
	.endm

	.macro EmoteExclamationMark length=1
	.short MOVEMENT_EMOTE_EXCLAMATION
	.short \length
	.endm

	.macro WalkSlightlyFastNorth length=1
	.short MOVEMENT_WALK_SLIGHTLY_FAST_UP
	.short \length
	.endm

	.macro WalkSlightlyFastSouth length=1
	.short MOVEMENT_WALK_SLIGHTLY_FAST_DOWN
	.short \length
	.endm

	.macro WalkSlightlyFastWest length=1
	.short MOVEMENT_WALK_SLIGHTLY_FAST_LEFT
	.short \length
	.endm

	.macro WalkSlightlyFastEast length=1
	.short MOVEMENT_WALK_SLIGHTLY_FAST_RIGHT
	.short \length
	.endm

	.macro WalkSlightlyFasterNorth length=1
	.short MOVEMENT_WALK_SLIGHTLY_FASTER_UP
	.short \length
	.endm

	.macro WalkSlightlyFasterSouth length=1
	.short MOVEMENT_WALK_SLIGHTLY_FASTER_DOWN
	.short \length
	.endm

	.macro WalkSlightlyFasterWest length=1
	.short MOVEMENT_WALK_SLIGHTLY_FASTER_LEFT
	.short \length
	.endm

	.macro WalkSlightlyFasterEast length=1
	.short MOVEMENT_WALK_SLIGHTLY_FASTER_RIGHT
	.short \length
	.endm

	.macro WalkFastestNorth length=1
	.short MOVEMENT_WALK_FASTEST_UP
	.short \length
	.endm

	.macro WalkFastestSouth length=1
	.short MOVEMENT_WALK_FASTEST_DOWNs
	.short \length
	.endm

	.macro WalkFastestWest length=1
	.short MOVEMENT_WALK_FASTEST_LEFT
	.short \length
	.endm

	.macro WalkFastestEast length=1
	.short MOVEMENT_WALK_FASTEST_RIGHT
	.short \length
	.endm

	.macro RunNorth length=1
	.short MOVEMENT_RUN_UP
	.short \length
	.endm

	.macro RunSouth length=1
	.short MOVEMENT_RUN_DOWN
	.short \length
	.endm

	.macro RunWest length=1
	.short MOVEMENT_RUN_LEFT
	.short \length
	.endm

	.macro RunEast length=1
	.short MOVEMENT_RUN_RIGHT
	.short \length
	.endm

	.macro JumpNearSlowWest length=1
	.short MOVEMENT_JUMP_NEAR_SLOW_LEFT
	.short \length
	.endm

	.macro JumpNearSlowEast length=1
	.short MOVEMENT_JUMP_NEAR_SLOW_RIGHT
	.short \length
	.endm

	.macro JumpFartherWest length=1
	.short MOVEMENT_JUMP_FATHER_LEFT
	.short \length
	.endm

	.macro JumpFartherEast length=1
	.short MOVEMENT_JUMP_FATHER_RIGHT
	.short \length
	.endm

	.macro WalkEverSoSlightlyFastNorth length=1
	.short MOVEMENT_WALK_EVER_SO_SLIGHTLY_FAST_UP
	.short \length
	.endm

	.macro WalkEverSoSlightlyFastSouth length=1
	.short MOVEMENT_WALK_EVER_SO_SLIGHTLY_FAST_DOWN
	.short \length
	.endm

	.macro WalkEverSoSlightlyFastWest length=1
	.short MOVEMENT_WALK_EVER_SO_SLIGHTLY_FAST_LEFT
	.short \length
	.endm

	.macro WalkEverSoSlightlyFastEast length=1
	.short MOVEMENT_WALK_EVER_SO_SLIGHTLY_FAST_RIGHT
	.short \length
	.endm

	.macro NurseJoyBow length=1
	.short MOVEMENT_NURSE_JOY_BOW
	.short \length
	.endm

	.macro RevealTrainer length=1
	.short MOVEMENT_REVEAL_TRAINER
	.short \length
	.endm

	.macro PlayerGive length=1
	.short MOVEMENT_PLAYER_GIVE
	.short \length
	.endm

	.macro EmoteQuestionMark length=1
	.short MOVEMENT_EMOTE_QUESTION
	.short \length
	.endm

	.macro PlayerReceive length=1
	.short MOVEMENT_PLAYER_RECEIVE
	.short \length
	.endm

	.macro MoveAction_105 length=1
	.short 105
	.short \length
	.endm

	.macro MoveAction_106 length=1
	.short 106
	.short \length
	.endm

	.macro MoveAction_107 length=1
	.short 107
	.short \length
	.endm

	.macro MoveAction_108 length=1
	.short 108
	.short \length
	.endm

	.macro MoveAction_109 length=1
	.short 109
	.short \length
	.endm

	.macro MoveAction_110 length=1
	.short 110
	.short \length
	.endm

	.macro MoveAction_111 length=1
	.short 111
	.short \length
	.endm

	.macro MoveAction_112 length=1
	.short 112
	.short \length
	.endm

	.macro EmoteExclamation2 length=1
	.short MOVEMENT_EMOTE_DOUBLE_EXCLAMATION
	.short \length
	.endm

	.macro EndMovement
	.short MOVEMENT_STEP_END
	.short 0
	.endm

	.endif
