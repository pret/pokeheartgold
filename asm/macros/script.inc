	.ifndef ASM_SCRIPT_INC
	.set ASM_SCRIPT_INC, 1
#pragma once
#include "constants/scrcmd.h"
#include "macros/movement.inc"

    .option alignment off

	.macro ScrDef offset
	.word \offset - . - 4
	.endm

	.macro ScrDefEnd
	.short SCRDEF_END
	.endm

	; Dummy command
	.macro Noop
	.short 0
	.endm

	; Dummy command
	.macro Dummy
	.short 1
	.endm

	; Exits script execution and returns control to the player
	.macro End
	.short 2
	.endm

	; Pauses for some frames, tracks the timer in a script variable
	.macro Wait frames, var
	.short 3
	.short \frames
	.short \var
	.endm

	; Loads 8-bit value into the specified script register
	.macro LoadByte reg, val
	.short 4
	.byte \reg
	.byte \val
	.endm

	; Loads 32-bit value into the specified script register
	.macro LoadWord reg, val
	.short 5
	.byte \reg
	.word \val
	.endm

	; Reads byte at a specific memory address into a script register
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro LoadByteFromAddr reg, addr
	.short 6
	.byte \reg
	.word \addr
	.endm

	; Writes byte to a specific memory address from a script register
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro WriteByteToAddr addr, reg
	.short 7
	.word \addr
	.byte \reg
	.endm

	; Writes byte literal to a specific memory address
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro SetPtrByte addr, val
	.short 8
	.word \addr
	.byte \val
	.endm

	; Copies a byte between script registers
	.macro CopyLocal to, from
	.short 9
	.byte \to
	.byte \from
	.endm

	; Copies a byte between two memory addresses
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro CopyByte to, from
	.short 10
	.word \to
	.word \from
	.endm

	; Compares values between script reg and script reg
	.macro CompareLocalToLocal a, b
	.short 11
	.byte \a
	.byte \b
	.endm

	; Compares script reg to byte literal
	.macro CompareLocalToValue reg, val
	.short 12
	.byte \reg
	.byte \val
	.endm

	; Compares script reg to memory address
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro CompareLocalToAddr reg, addr
	.short 13
	.byte \reg
	.word \addr
	.endm

	; Compares memory address to script reg
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro CompareAddrToLocal addr, reg
	.short 14
	.word \addr
	.byte \reg
	.endm

	; Compares memory address to byte literal
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro CompareAddrToValue addr, val
	.short 15
	.word \addr
	.byte \val
	.endm

	; Compares bytes at two memory addresses
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro CompareAddrToAddr a, b
	.short 16
	.word \a
	.word \b
	.endm

	; Compares variable to 16-bit literal
	.macro CompareVarToValue var, val
	.short 17
	.short \var
	.short \val
	.endm

	; Compares two variables
	.macro CompareVarToVar a, b
	.short 18
	.short \a
	.short \b
	.endm

	; Creates a new script context to run the indicated script asynchronously
	.macro RunScript id
	.short 19
	.short \id
	.endm

	; Creates a new script context to run the indicated script and wait
	.macro CallStd id
	.short 20
	.short \id
	.endm

	; Yield to parent context
	.macro RestartCurrentScript
	.short 21
	.endm

	; Absolute branch to offset in script
	.macro GoTo dest
	.short 22
	.word \dest-.-4
	.endm

	; Branch to offset in script if interacting with a specific object
	.macro ObjectGoTo object, dest
	.short 23
	.byte \object
	.word \dest-.-4
	.endm

	; Branch to offset in script if interacting with a specific bg event
	.macro BGGoTo bg, dest
	.short 24
	.byte \bg
	.word \dest-.-4
	.endm

	; Branch to offset in script if facing a specific direction
	.macro DirectionGoTo dir, dest
	.short 25
	.byte \dir
	.word \dest-.-4
	.endm

	; Call script as a subroutine
	.macro Call sub
	.short 26
	.word \sub-.-4
	.endm

	; Return from subroutine
	.macro Return
	.short 27
	.endm

	; Conditional branch to offset in script
	.macro GoToIf condition, dest
	.short 28
	.byte \condition
	.word \dest-.-4
	.endm

	; Conditional call subroutine
	.macro CallIf condition, sub
	.short 29
	.byte \condition
	.word \sub-.-4
	.endm

	; Set event flag
	.macro SetFlag flag
	.short 30
	.short \flag
	.endm

	; Clear event flag
	.macro ClearFlag flag
	.short 31
	.short \flag
	.endm

	; Check event flag, store result on context
	.macro CheckFlag flag
	.short 32
	.short \flag
	.endm

	; Set event flag referenced in var
	.macro SetFlagVar var
	.short 33
	.short \var
	.endm

	; Clear event flag referenced in var
	.macro ClearFlagVar var
	.short 34
	.short \var
	.endm

	; Check event flag referenced in var, store result in other var
	.macro CheckFlagVar var_flag, var_dest
	.short 35
	.short \var_flag
	.short \var_dest
	.endm

	; Set trainer defeated flag
	.macro SetTrainerFlag var_or_trno
	.short 36
	.short \var_or_trno
	.endm

	; Clear trainer defeated flag
	.macro ClearTrainerFlag var_or_trno
	.short 37
	.short \var_or_trno
	.endm

	; Check trainer defeated flag, store result on context
	.macro CheckTrainerFlag var_or_trno
	.short 38
	.short \var_or_trno
	.endm

	; Increment var value by value
	.macro AddVar var, var_or_addend
	.short 39
	.short \var
	.short \var_or_addend
	.endm

	; Decrement var value by value
	.macro SubVar var, var_or_addend
	.short 40
	.short \var
	.short \var_or_addend
	.endm

	; Set var to short literal
	.macro SetVar var, val
	.short 41
	.short \var
	.short \val
	.endm

	; Set var from other var
	.macro CopyVar dst, src
	.short 42
	.short \dst
	.short \src
	.endm

	; Set var from other var or short literal
	.macro SetOrCopyVar dst, src
	.short 43
	.short \dst
	.short \src
	.endm

	; Print non_npc_msg in field window from current map message bank
	.macro NonNPCMsg msg_id
	.short 44
	.byte \msg_id
	.endm

	; NPC dialogue window
	.macro NPCMsg msg_id
	.short 45
	.byte \msg_id
	.endm

	; Not sure what to call this but it
	; is also a message printer
	.macro NonNPCMsgVar msg_id
	.short 46
	.short \msg_id
	.endm

	.macro NPCMsgVar msg_id
	.short 47
	.short \msg_id
	.endm

	.macro ShowMessageSynchronized msg_id
	.short 48
	.byte \msg_id
	.endm

	; Waits for A or B button
	.macro WaitABPress
	.short 49
	.endm

	; Waits for A, B, or dpad. On pressing dpad, does a turn frame.
	.macro WaitButton
	.short 50
	.endm

	; Waits for A, B, or dpad. No turn frame.
	.macro WaitButtonOrDpad
	.short 51
	.endm

	.macro OpenMsg
	.short 52
	.endm

	.macro CloseMsg
	.short 53
	.endm

	; Like closemsg but does not clear the graphics.
	.macro HoldMsg
	.short 54
	.endm

	.macro DirectionSignpost message, type, map, out
	.short 55
	.byte \message
	.byte \type
	.short \map
	.short \out
	.endm

	.macro SetSignpostMap type, map
	.short 56
	.byte \type
	.short \map
	.endm

	.macro SetSignpostAction action
	.short 57
	.byte \action
	.endm

	.macro WaitSignpostAction
	.short 58
	.endm

	.macro TrainerTips message, out
	.short 59
	.byte \message
	.short \out
	.endm

	.macro TrainerTipsEx type, message
	SetSignpostMap \type, 0
	SetSignpostAction MAPSIGNCOMMAND_WIPE_IN
	WaitSignpostAction
	TrainerTips \message, VAR_SPECIAL_RESULT
	CallStd std_signpost
	.endm

	.macro WaitSignpost out
	.short 60
	.short \out
	.endm

	.macro DirectionSignpostEx type, map, message
	DirectionSignpost \message, \type, \map, VAR_SPECIAL_RESULT
	SetSignpostAction MAPSIGNCOMMAND_WIPE_IN
	WaitSignpostAction
	WaitSignpost VAR_SPECIAL_RESULT
	CallStd std_signpost
	.endm

	.macro ShowStartMenu
	.short 61
	.endm

	.macro ScrollBG3 distanceX, countX, directionX, distanceY, countY, directionY
	.short 62
	.byte \distanceX
	.byte \countX
	.byte \directionX
	.byte \distanceY
	.byte \countY
	.byte \directionY
	.endm

	; Creates a yes/no selection box and returns the result once the player has chosen either option.
	.macro YesNo retVar
	.short 63
	.short \retVar
	.endm

	.macro ScrCmd_064 arg0, arg1, arg2, arg3, arg4
	.short 64
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro ScrCmd_065 arg0, arg1, arg2, arg3, arg4
	.short 65
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro ScrCmd_066 arg0, arg1
	.short 66
	.byte \arg0
	.byte \arg1
	.endm

	.macro ScrCmd_067
	.short 67
	.endm

	.macro ScrCmd_068 arg0, arg1, arg2, arg3, arg4
	.short 68
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro ScrCmd_069 arg0, arg1, arg2, arg3, arg4
	.short 69
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro ScrCmd_070 arg0, arg1, arg2
	.short 70
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_071
	.short 71
	.endm

	.macro ScrCmd_072 arg0
	.short 72
	.byte \arg0
	.endm

	.macro PlaySE sndseq
	.short 73
	.short \sndseq
	.endm

	.macro StopSE sndseq
	.short 74
	.short \sndseq
	.endm

	.macro WaitSE sndseq
	.short 75
	.short \sndseq
	.endm

	.macro PlayCry species, form
	.short 76
	.short \species
	.short \form
	.endm

	.macro WaitCry
	.short 77
	.endm

	.macro PlayFanfare fanfare
	.short 78
	.short \fanfare
	.endm

	.macro WaitFanfare
	.short 79
	.endm

	.macro PlayBGM sndseq
	.short 80
	.short \sndseq
	.endm

	.macro StopBGM sndseq
	.short 81
	.short \sndseq
	.endm

	.macro ResetBGM
	.short 82
	.endm

	.macro ScrCmd_083 arg0
	.short 83
	.short \arg0
	.endm

	; Fade out the music to the target level
	; in the designated number of frames
	.macro FadeOutBGM target, frames
	.short 84
	.short \target
	.short \frames
	.endm

	; Fade in the music to full volume
	; in the designated number of frames
	.macro FadeInBGM frames
	.short 85
	.short \frames
	.endm

	.macro ScrCmd_086 arg0, arg1
	.short 86
	.byte \arg0
	.byte \arg1
	.endm

	.macro TempBGM sndseq
	.short 87
	.short \sndseq
	.endm

	.macro ScrCmd_088 arg0
	.short 88
	.byte \arg0
	.endm

	.macro ChatotHasCry retVar
	.short 89
	.short \retVar
	.endm

	.macro ChatotStartRecording retVar
	.short 90
	.short \retVar
	.endm

	.macro ChatotStopRecording
	.short 91
	.endm

	.macro ChatotSaveRecording
	.short 92
	.endm

	.macro ScrCmd_093
	.short 93
	.endm

	.macro ApplyMovement person, offset
	.short 94
	.short \person
	.word \offset-.-4
	.endm

	.macro WaitMovement
	.short 95
	.endm

	.macro LockAll
	.short 96
	.endm

	.macro ReleaseAll
	.short 97
	.endm

	.macro Lock objectID
	.short 98
	.short \objectID
	.endm

	.macro Release objectID
	.short 99
	.short \objectID
	.endm

	.macro ShowPerson objectID
	.short 100
	.short \objectID
	.endm

	.macro HidePerson objectID
	.short 101
	.short \objectID
	.endm

	.macro ScrCmd_102 arg0, arg1
	.short 102
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_103
	.short 103
	.endm

	.macro FacePlayer
	.short 104
	.endm

	.macro GetPlayerCoords retX, retZ
	.short 105
	.short \retX
	.short \retZ
	.endm

	.macro GetPersonCoords personID, retX, retZ
	.short 106
	.short \personID
	.short \retX
	.short \retZ
	.endm

	.macro ScrCmd_107 arg0, arg1, arg2
	.short 107
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_108 arg0, arg1
	.short 108
	.short \arg0
	.byte \arg1
	.endm

	.macro ScrCmd_109 arg0, arg1
	.short 109
	.short \arg0
	.short \arg1
	.endm

	.macro AddMoney amount
	.short 110
	.word \amount
	.endm

	.macro SubMoneyImmediate amount
	.short 111
	.word \amount
	.endm

	.macro HasEnoughMoneyImmediate retVar, amount
	.short 112
	.short \retVar
	.word \amount
	.endm

	.macro ShowMoneyWindow xPos, yPos
	.short 113
	.short \xPos
	.short \yPos
	.endm

	.macro HideMoneyWindow
	.short 114
	.endm

	.macro UpdateMoneyWindow
	.short 115
	.endm

	.macro ScrCmd_116 arg0, arg1, arg2
	.short 116
	.byte \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_117
	.short 117
	.endm

	.macro ScrCmd_118 arg0
	.short 118
	.byte \arg0
	.endm

	.macro GetCoinAmount retVar
	.short 119
	.short \retVar
	.endm

	.macro GiveCoins amount
	.short 120
	.short \amount
	.endm

	.macro TakeCoins amount
	.short 121
	.short \amount
	.endm

	.macro GiveAthletePoints amount
	.short 122
	.short \amount
	.endm

	.macro TakeAthletePoints amount
	.short 123
	.short \amount
	.endm

	.macro CheckAthletePoints retVar, amount
	.short 124
	.short \retVar
	.short \amount
	.endm

	; Returns true or false according to whether the item was successfully given
	.macro GiveItem itemID, quantity, retVar
	.short 125
	.short \itemID
	.short \quantity
	.short \retVar
	.endm

	; Returns true or false according to whether the item was successfully taken
	.macro TakeItem itemID, quantity, retVar
	.short 126
	.short \itemID
	.short \quantity
	.short \retVar
	.endm

	.macro HasSpaceForItem itemID, quantity, retVar
	.short 127
	.short \itemID
	.short \quantity
	.short \retVar
	.endm

	.macro HasItem itemID, quantity, retVar
	.short 128
	.short \itemID
	.short \quantity
	.short \retVar
	.endm

	.macro ItemIsTMOrHM itemID, retVar
	.short 129
	.short \itemID
	.short \retVar
	.endm

	.macro GetItemPocket itemID, retVar
	.short 130
	.short \itemID
	.short \retVar
	.endm

	.macro SetStarterChoice choice
	.short 131
	.short \choice
	.endm

	.macro GenderMsgBox messageID_Male, messageID_Female
	.short 132
	.byte \messageID_Male
	.byte \messageID_Female
	.endm

	.macro GetSealQuantity sealID, retVar
	.short 133
	.short \sealID
	.short \retVar
	.endm

	.macro GiveOrTakeSeal sealID, quantity
	.short 134
	.short \sealID
	.short \quantity
	.endm

	.macro GiveRandomSeal retVar_Seal1, retVar_Seal2, retVar_Seal3
	.short 135
	.short \retVar_Seal1
	.short \retVar_Seal2
	.short \retVar_Seal3
	.endm

	.macro ScrCmd_136 arg0, arg1
	.short 136
	.short \arg0
	.short \arg1
	.endm

	.macro GiveMon species, level, heldItem, form, ability, retVar
	.short 137
	.short \species
	.short \level
	.short \heldItem
	.short \form
	.short \ability
	.short \retVar
	.endm

	.macro GiveEgg species, offset
	.short 138
	.short \species
	.short \offset
	.endm

	.macro SetMonMove monSlot, moveSlot, moveID
	.short 139
	.short \monSlot
	.short \moveSlot
	.short \moveID
	.endm

	.macro MonHasMove retVar, moveID, moveSlot
	.short 140
	.short \retVar
	.short \moveID
	.short \moveSlot
	.endm

	.macro GetPartySlotWithMove retVar, moveID
	.short 141
	.short \retVar
	.short \moveID
	.endm

	.macro GetPhoneBookRematch contactID, retVar
	.short 142
	.short \contactID
	.short \retVar
	.endm

	.macro NameRival retVar
	.short 143
	.short \retVar
	.endm

	.macro GetFriendSprite retVar
	.short 144
	.short \retVar
	.endm

	.macro RegisterPokegearCard card
	.short 145
	.byte \card
	.endm

	.macro RegisterGearNumber number
	.short 146
	.short \number
	.endm

	.macro CheckRegisteredPhoneNumber number, retVar
	.short 147
	.short \number
	.short \retVar
	.endm

	.macro ScrCmd_148 arg0, arg1
	.short 148
	.byte \arg0
	.byte \arg1
	.endm

	.macro UnsetPhoneCallTrigger triggerID
	.short 149
	.byte \triggerID
	.endm

	.macro RestoreOverworld
	.short 150
	.endm

	.macro ScrCmd_151
	.short 151
	.endm

	.macro ScrCmd_152
	.short 152
	.endm

	.macro ScrCmd_153 arg0
	.short 153
	.short \arg0
	.endm

	.macro ScrCmd_154 arg0, arg1, arg2
	.short 154
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_155 arg0, arg1
	.short 155
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_156
	.short 156
	.endm

	.macro TownMap
	.short 157
	.endm

	.macro ScrCmd_158 arg0
	.short 158
	.byte \arg0
	.endm

	.macro ScrCmd_159
	.short 159
	.endm

	.macro ScrCmd_160
	.short 160
	.endm

	.macro ScrCmd_161
	.short 161
	.endm

	.macro ScrCmd_162
	.short 162
	.endm

	.macro HOFCredits vsTrainerRed
	.short 163
	.short \vsTrainerRed
	.endm

	.macro ScrCmd_164
	.short 164
	.endm

	.macro ScrCmd_165 arg0, arg1
	.short 165
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_166 arg0
	.short 166
	.short \arg0
	.endm

	.macro ChooseStarter
	.short 167
	.endm

	.macro GetTrainerPathToPlayer trainerNum
	.short 168
	.short \trainerNum
	.endm

	.macro TrainerStepTowardsPlayer trainerNum, retVar
	.short 169
	.short \trainerNum
	.short \retVar
	.endm

	.macro GetTrainerEyeType retVar
	.short 170
	.short \retVar
	.endm

	; For when one or more trainers see you
	.macro GetEyeTrainerNum trainerNum, retVar
	.short 171
	.short \trainerNum
	.short \retVar
	.endm

	.macro NamePlayer retVar
	.short 172
	.short \retVar
	.endm

	.macro NicknameInput partySlot, retVar
	.short 173
	.short \partySlot
	.short \retVar
	.endm

	.macro FadeScreen duration, speed, direction, color
	.short 174
	.short \duration
	.short \speed
	.short \direction
	.short \color
	.endm

	.macro WaitFade
	.short 175
	.endm

	.macro Warp arg0, arg1=0, arg2, arg3, arg4
	.short 176
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro RockClimb partySlot
	.short 177
	.short \partySlot
	.endm

	.macro Surf partySlot
	.short 178
	.short \partySlot
	.endm

	.macro Waterfall partySlot
	.short 179
	.short \partySlot
	.endm

	.macro ScrCmd_180 arg0, arg1, arg2
	.short 180
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro FlashEffect
	.short 181
	.endm

	.macro Whirlpool partySlot
	.short 182
	.short \partySlot
	.endm

	.macro ScrCmd_183 arg0
	.short 183
	.short \arg0
	.endm

	.macro PlayerOnBikeCheck retVar
	.short 184
	.short \retVar
	.endm

	.macro PlayerOnBikeSet flag
	.short 185
	.byte \flag
	.endm

	; If `lock` is 1, the player's bike state will
	; be locked, meaning they cannot mount or
	; dismount their bike; otherwise, if `lock` is
	; any other value, the bike state will be
	; unlocked. The main use for this command was
	; to block the player from dismounting their
	; bike while they were on Cycling Road.
	.macro SetBikeStateLock lock
	.short 186
	.byte \lock
	.endm

	; Get the player's overworld state.
	; Used in some places to determine whether
	; the player is masquerading as a member
	; of Team Rocket.
	.macro GetPlayerState var
	.short 187
	.short \var
	.endm

	.macro SetAvatarBits flags
	.short 188
	.short \flags
	.endm

	.macro UpdateAvatarState
	.short 189
	.endm

	; In the buffer_XXX commands, the maximum
	; acceptable value for the slot arg is 7.
	; This sets the message format placeholder
	; to whatever is buffered.
	.macro BufferPlayersName slot
	.short 190
	.byte \slot
	.endm

	; If you use this before naming your rival,
	; this will be an empty string.
	.macro BufferRivalsName slot
	.short 191
	.byte \slot
	.endm

	.macro BufferFriendsName slot
	.short 192
	.byte \slot
	.endm

	; For these commands, the additional argument
	; is a flex arg, meaning it can be a literal
	; or a variable.
	.macro BufferMonSpeciesName slot, party_pos
	.short 193
	.byte \slot
	.short \party_pos
	.endm

	.macro BufferItemName slot, item
	.short 194
	.byte \slot
	.short \item
	.endm

	.macro BufferPocketName slot, pocket
	.short 195
	.byte \slot
	.short \pocket
	.endm

	.macro BufferTMHMMoveName slot, tmhm
	.short 196
	.byte \slot
	.short \tmhm
	.endm

	.macro BufferMoveName slot, move
	.short 197
	.byte \slot
	.short \move
	.endm

	.macro BufferInt slot, value
	.short 198
	.byte \slot
	.short \value
	.endm

	.macro BufferPartyMonNick slot, party_pos
	.short 199
	.byte \slot
	.short \party_pos
	.endm

	.macro BufferTrainerClassName slot, trcls
	.short 200
	.byte \slot
	.short \trcls
	.endm

	.macro BufferPlayerUnionAvatarClassName slot
	.short 201
	.byte \slot
	.endm

	.macro BufferSpeciesName slot, species, arg2_unused, arg3_unused
	.short 202
	.byte \slot
	.short \species
	.short \arg2_unused
	.byte \arg3_unused
	.endm

	.macro BufferStarterSpeciesName slot
	.short 203
	.byte \slot
	.endm

	; These two commands are leftover from Platinum.
	; As such, they are configured to check for the
	; Sinnoh starters instead of the Johto starters.
	; Since the player will never start with any of
	; Turtwig, Chimchar, or Piplup, this command
	; will always return TURTWIG, and the following
	; CHIMCHAR.
	; These commands are unused in HGSS.
	.macro BufferDPPtRivalStarterSpeciesName slot
	.short 204
	.byte \slot
	.endm

	.macro BufferDPPtFriendStarterSpeciesName slot
	.short 205
	.byte \slot
	.endm

	; Gets your starter species into the indicated
	; variable. Used to calculate which rival
	; party to use.
	.macro GetStarterChoice retVar
	.short 206
	.short \retVar
	.endm

	.macro BufferDecorationName slot, deco
	.short 207
	.byte \slot
	.short \deco
	.endm

	; Dummy
	.macro ScrCmd_208 slot, unk
	.short 208
	.byte \slot
	.short \unk
	.endm

	; Dummy
	.macro ScrCmd_209 slot, unk
	.short 209
	.byte \slot
	.short \unk
	.endm

	.macro BufferMapSecName slot, location
	.short 210
	.byte \slot
	.short \location
	.endm

	.macro ScrCmd_211 arg0, arg1
	.short 211
	.short \arg0
	.short \arg1
	.endm

	; For when you talk to a trainer
	.macro GetTrainerNum retVar
	.short 212
	.short \retVar
	.endm

	.macro TrainerBattle trainer1, trainer2, canLose, arg3
	.short 213
	.short \trainer1
	.short \trainer2
	.byte \canLose
	.byte \arg3
	.endm

	.macro TrainerMessage trainer, param
	.short 214
	.short \trainer
	.short \param
	.endm

	.macro GetTrainerMsgParams intro, after, _1poke
	.short 215
	.short \intro
	.short \after
	.short \_1poke
	.endm

	.macro GetRematchMsgParams intro, after, _1poke
	.short 216
	.short \intro
	.short \after
	.short \_1poke
	.endm

	.macro TrainerIsDoubleBattle retVar
	.short 217
	.short \retVar
	.endm

	.macro EncounterMusic trainerID
	.short 218
	.short \trainerID
	.endm

	.macro WhiteOut
	.short 219
	.endm

	.macro CheckBattleWon retVar
	.short 220
	.short \retVar
	.endm

	.macro StaticWildWonOrCaughtCheck retVar, arg1
	.short 221
	.short \retVar
	.byte \arg1
	.endm

	.macro PartyCheckForDouble retVar
	.short 222
	.short \retVar
	.endm

	.macro ScrCmd_223
	.short 223
	.endm

	.macro ScrCmd_224
	.short 224
	.endm

	.macro GoToIfTrainerDefeated offset
	.short 225
	.word \offset-.-4
	.endm

	.macro ScrCmd_226 arg0, arg1, arg2, arg3
	.short 226
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro ScrCmd_227 arg0, arg1, arg2, arg3
	.short 227
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro ScrCmd_228 arg0
	.short 228
	.short \arg0
	.endm

	.macro ScrCmd_229 arg0
	.short 229
	.short \arg0
	.endm

	.macro ScrCmd_230
	.short 230
	.endm

	.macro ScrCmd_231
	.short 231
	.endm

	.macro ScrCmd_232 arg0
	.short 232
	.short \arg0
	.endm

	.macro ScrCmd_233 arg0
	.short 233
	.short \arg0
	.endm

	.macro ScrCmd_234 arg0, arg1, arg2, arg3
	.short 234
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro ScrCmd_235 arg0
	.short 235
	.short \arg0
	.endm

	.macro ScrCmd_236 arg0
	.short 236
	.short \arg0
	.endm

	.macro ScrCmd_237
	.short 237
	.endm

	.macro PartyHasPokerus retVar
	.short 238
	.short \retVar
	.endm

	.macro MonGetGender partySlot, retVar
	.short 239
	.short \partySlot
	.short \retVar
	.endm

	.macro SetDynamicWarp mapID, warpID, xPos, yPos, direction
	.short 240
	.short \mapID
	.short \warpID
	.short \xPos
	.short \yPos
	.short \direction
	.endm

	.macro GetDynamicWarpFloorNo retVar
	.short 241
	.short \retVar
	.endm

	.macro ElevatorCurFloorBox xPos, yPos, retVar, floor
	.short 242
	.byte \xPos
	.byte \yPos
	.short \retVar
	.short \floor
	.endm

	.macro CountJohtoDexSeen retVar
	.short 243
	.short \retVar
	.endm

	.macro CountJohtoDexOwned retVar
	.short 244
	.short \retVar
	.endm

	.macro CountNationalDexSeen retVar
	.short 245
	.short \retVar
	.endm

	.macro CountNationalDexOwned retVar
	.short 246
	.short \retVar
	.endm

	; Dummy
	.macro ScrCmd_247
	.short 247
	.endm

	; The actual Pokedex evaluation.
	; national: 0 = Johto dex, 1 = National dex
	; msg: Variable to return the message ID
	; fanfare: Variable to return the fanfare ID
	.macro GetDexEvalResult national, msg, fanfare
	.short 248
	.byte \national
	.short \msg
	.short \fanfare
	.endm

	.macro RocketTrapBattle species, level
	.short 249
	.short \species
	.short \level
	.endm

	.macro ScrCmd_250 arg0, arg1
	.short 250
	.short \arg0
	.short \arg1
	.endm

	.macro CatchingTutorial
	.short 251
	.endm

	.macro ScrCmd_252
	.short 252
	.endm

	.macro GetSaveFileState retVar
	.short 253
	.short \retVar
	.endm

	.macro SaveGameNormal retVar
	.short 254
	.short \retVar
	.endm

	.macro ScrCmd_255 arg0, arg1
	.short 255
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_256 arg0
	.short 256
	.short \arg0
	.endm

	.macro ScrCmd_257 arg0
	.short 257
	.short \arg0
	.endm

	.macro ScrCmd_258
	.short 258
	.endm

	.macro ScrCmd_259 arg0
	.short 259
	.short \arg0
	.endm

	.macro ScrCmd_260 arg0
	.short 260
	.short \arg0
	.endm

	.macro ScrCmd_261 arg0
	.short 261
	.short \arg0
	.endm

	.macro ScrCmd_262
	.short 262
	.endm

	.macro ScrCmd_263
	.short 263
	.endm

	.macro ScrCmd_264 arg0
	.short 264
	.short \arg0
	.endm

	.macro ScrCmd_265
	.short 265
	.endm

	.macro ScrCmd_266
	.short 266
	.endm

	.macro ScrCmd_267 arg0, arg1
	.short 267
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_268 arg0
	.short 268
	.short \arg0
	.endm

	.macro ScrCmd_269 arg0
	.short 269
	.short \arg0
	.endm

	.macro ScrCmd_270
	.short 270
	.endm

	.macro ScrCmd_271 arg0, arg1
	.short 271
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_272 arg0
	.short 272
	.short \arg0
	.endm

	.macro ScrCmd_273 arg0
	.short 273
	.short \arg0
	.endm

	.macro ScrCmd_274 arg0, arg1
	.short 274
	.short \arg0
	.short \arg1
	.endm

	.macro MartBuy arg0_unused
	.short 275
	.short \arg0_unused
	.endm

	.macro SpecialMartBuy specialMartID
	.short 276
	.short \specialMartID
	.endm

	; Unused in HGSS.
	.macro DecorationMart decorationMartID
	.short 277
	.short \decorationMartID
	.endm

	.macro SealMart sealMartID
	.short 278
	.short \sealMartID
	.endm

	; Used with poison faint, but due to overworld
	; poison mechanics in gen 4, this is
	; never reached.
	.macro OverworldWhiteOut
	.short 279
	.endm

	.macro SetSpawn spawnPoint
	.short 280
	.short \spawnPoint
	.endm

	; Are you a boy? Or are you a girl?
	.macro GetPlayerGender retVar
	.short 281
	.short \retVar
	.endm

	.macro HealParty
	.short 282
	.endm

	.macro ScrCmd_283
	.short 283
	.endm

	.macro ScrCmd_284
	.short 284
	.endm

	.macro ScrCmd_285 arg0
	.short 285
	.short \arg0
	.endm

	.macro ScrCmd_286
	.short 286
	.endm

	.macro BufferUnionRoomAvatarChoices
	.short 287
	.endm

	.macro UnionRoomAvatarIdxToTrainerClass avatarID, retVar
	.short 288
	.short \avatarID
	.short \retVar
	.endm

	.macro ScrCmd_289 arg0
	.short 289
	.short \arg0
	.endm

	.macro CheckPokedex retVar
	.short 290
	.short \retVar
	.endm

	.macro GivePokedex
	.short 291
	.endm

	.macro CheckRunningShoes retVar
	.short 292
	.short \retVar
	.endm

	.macro GiveRunningShoes
	.short 293
	.endm

	.macro CheckBadge badge, retVar
	.short 294
	.short \badge
	.short \retVar
	.endm

	.macro GiveBadge badge
	.short 295
	.short \badge
	.endm

	; This command is never used because it is
	; assumed that you cannot get the 8th badge
	; before the other 7, or the 16th before the
	; other 15. This assumption does not account
	; for tweaking.
	.macro CountBadges retVar
	.short 296
	.short \retVar
	.endm

	.macro ScrCmd_297 arg0
	.short 297
	.short \arg0
	.endm

	.macro ScrCmd_298
	.short 298
	.endm

	.macro CheckEscortMode retVar
	.short 299
	.short \retVar
	.endm

	.macro SetEscortMode
	.short 300
	.endm

	.macro ClearEscortMode
	.short 301
	.endm

	.macro CheckStepTakenFlag retVar
	.short 302
	.short \retVar
	.endm

	.macro SetStepTakenFlag
	.short 303
	.endm

	.macro GetStepTakenFlag
	.short 304
	.endm

	.macro CheckGameClearFlag retVar
	.short 305
	.short \retVar
	.endm

	.macro SetGameClearFlag
	.short 306
	.endm

	.macro ScrCmd_307 arg0, arg1, arg2, arg3, arg4
	.short 307
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.byte \arg4
	.endm

	.macro ScrCmd_308 arg0
	.short 308
	.byte \arg0
	.endm

	.macro ScrCmd_309 arg0
	.short 309
	.byte \arg0
	.endm

	.macro ScrCmd_310 arg0
	.short 310
	.byte \arg0
	.endm

	.macro ScrCmd_311 arg0
	.short 311
	.byte \arg0
	.endm

	.macro BufferDaycareMonNicks
	.short 312
	.endm

	.macro GetDaycareState retVar
	.short 313
	.short \retVar
	.endm

	.macro EcruteakGymInit
	.short 314
	.endm

	.macro ScrCmd_315
	.short 315
	.endm

	.macro ScrCmd_316
	.short 316
	.endm

	.macro ScrCmd_317 arg0
	.short 317
	.byte \arg0
	.endm

	.macro CianwoodGymInit
	.short 318
	.endm

	.macro CianwoodGymTurnWinch retVar
	.short 319
	.short \retVar
	.endm

	.macro VermilionGymInit
	.short 320
	.endm

	.macro VermilionGymLockAction lockID, relock
	.short 321
	.byte \lockID
	.byte \relock
	.endm

	.macro VermilionGymCanCheck canID, retVar
	.short 322
	.byte \canID
	.short \retVar
	.endm

	.macro ResampleVermilionGymCans
	.short 323
	.endm

	.macro VioletGymInit
	.short 324
	.endm

	.macro VioletGymElevator
	.short 325
	.endm

	.macro AzaleaGymInit
	.short 326
	.endm

	.macro AzaleaGymSpinarak spinarakID
	.short 327
	.byte \spinarakID
	.endm

	.macro AzaleaGymSwitch switchID
	.short 328
	.byte \switchID
	.endm

	.macro BlackthornGymInit
	.short 329
	.endm

	.macro FuchsiaGymInit
	.short 330
	.endm

	.macro ViridianGymInit
	.short 331
	.endm

	.macro GetPartyCount retVar
	.short 332
	.short \retVar
	.endm

	.macro ScrCmd_333 arg0
	.short 333
	.byte \arg0
	.endm

	.macro ScrCmd_334 arg0
	.short 334
	.short \arg0
	.endm

	.macro ScrCmd_335 arg0, arg1
	.short 335
	.short \arg0
	.short \arg1
	.endm

	.macro BufferBerryName slot, item, quantity
	.short 336
	.byte \slot
	.short \item
	.short \quantity
	.endm

	.macro BufferNatureName slot, nature
	.short 337
	.byte \slot
	.short \nature
	.endm

	.macro MovePerson objectID, xPos, yPos
	.short 338
	.short \objectID
	.short \xPos
	.short \yPos
	.endm

	.macro MovePersonFacing objectID, xPos, zPos, yPos, facing
	.short 339
	.short \objectID
	.short \xPos
	.short \zPos
	.short \yPos
	.short \facing
	.endm

	.macro SetObjectMovementType objectID, movementType
	.short 340
	.short \objectID
	.short \movementType
	.endm

	.macro SetObjectFacing objectID, facing
	.short 341
	.short \objectID
	.short \facing
	.endm

	.macro MoveWarp warpID, xPos, yPos
	.short 342
	.short \warpID
	.short \xPos
	.short \yPos
	.endm

	.macro MoveBGEvent bgID, xPos, yPos
	.short 343
	.short \bgID
	.short \xPos
	.short \yPos
	.endm

	.macro ScrCmd_344 arg0, arg1
	.short 344
	.short \arg0
	.short \arg1
	.endm

	.macro AddWaitingIcon
	.short 345
	.endm

	.macro RemoveWaitingIcon
	.short 346
	.endm

	.macro ScrCmd_347 arg0
	.short 347
	.short \arg0
	.endm

	.macro WaitButtonOrDelay frames
	.short 348
	.short \frames
	.endm

	.macro PartySelectUI
	.short 349
	.endm

	.macro ScrCmd_350
	.short 350
	.endm

	.macro GetPartySelection retVar
	.short 351
	.short \retVar
	.endm

	.macro PokemonSummaryScreen onlySkillsPanel, partySlot, moveToLearn
	.short 352
	.byte \onlySkillsPanel
	.short \partySlot
	.short \moveToLearn
	.endm

	.macro GetMoveSelection arg0, retVar
	.short 353
	.byte \arg0
	.short \retVar
	.endm

	.macro GetPartyMonSpecies slot, retVar
	.short 354
	.short \slot
	.short \retVar
	.endm

	.macro PartyMonIsMine slot, retVar
	.short 355
	.short \slot
	.short \retVar
	.endm

	.macro PartyCountNotEgg retVar
	.short 356
	.short \retVar
	.endm

	; Count Pokemon that are not fainted.
	; If except is set, exclude that slot
	; from the tally. Use 6 to disable.
	.macro CountAliveMons retVar, except=PARTY_SIZE
	.short 357
	.short \retVar
	.short \except
	.endm

	.macro CountAliveMonsAndPC retVar
	.short 358
	.short \retVar
	.endm

	.macro PartyCountEgg retVar
	.short 359
	.short \retVar
	.endm

	.macro SubMoneyVar amount
	.short 360
	.short \amount
	.endm

	.macro RetrieveDaycareMon retVar, daycareSlot
	.short 361
	.short \retVar
	.short \daycareSlot
	.endm

	.macro GiveLoanMon tradeID, level, mapID
	.short 362
	.byte \tradeID
	.byte \level
	.short \mapID
	.endm

	.macro CheckReturnLoanMon tradeID, partySlot, retVar
	.short 363
	.byte \tradeID
	.short \partySlot
	.short \retVar
	.endm

	.macro ReturnLoanMon partySlot
	.short 364
	.short \partySlot
	.endm

	.macro ResetDaycareEgg
	.short 365
	.endm

	.macro GiveDaycareEgg
	.short 366
	.endm

	.macro BufferDaycareWithdrawCost retVar, daycareSlot
	.short 367
	.short \retVar
	.short \daycareSlot
	.endm

	.macro HasEnoughMoneyVar retVar, amount
	.short 368
	.short \retVar
	.short \amount
	.endm

	.macro EggHatchAnim
	.short 369
	.endm

	.macro ScrCmd_370 arg0
	.short 370
	.byte \arg0
	.endm

	.macro BufferDaycareMonGrowth retVar, daycareSlot
	.short 371
	.short \retVar
	.short \daycareSlot
	.endm

	.macro GetTailDaycareMonSpeciesAndNick retVar
	.short 372
	.short \retVar
	.endm

	.macro PutMonInDaycare partySlot
	.short 373
	.short \partySlot
	.endm

	.macro ScrCmd_374 arg0
	.short 374
	.short \arg0
	.endm

	.macro MakeObjectVisible objectID
	.short 375
	.short \objectID
	.endm

	.macro ScrCmd_376
	.short 376
	.endm

	.macro ScrCmd_377 arg0
	.short 377
	.short \arg0
	.endm

	.macro ViewRankings scope, page, record
	.short 378
	.short \scope * 3 + \page
	.short \record
	.endm

	.macro ScrCmd_379 arg0
	.short 379
	.short \arg0
	.endm

	.macro Random retVar, modulo
	.short 380
	.short \retVar
	.short \modulo
	.endm

	.macro ScrCmd_381 arg0, arg1
	.short 381
	.short \arg0
	.short \arg1
	.endm

	.macro MonGetFriendship retVar, partySlot
	.short 382
	.short \retVar
	.short \partySlot
	.endm

	.macro MonAddFriendship friendship, partySlot
	.short 383
	.short \friendship
	.short \partySlot
	.endm

	.macro MonSubtractFriendship friendship, partySlot
	.short 384
	.short \friendship
	.short \partySlot
	.endm

	.macro BufferDaycareMonStats nickname, level, gender, partySlot
	.short 385
	.short \nickname
	.short \level
	.short \gender
	.short \partySlot
	.endm

	.macro GetPlayerFacing retVar
	.short 386
	.short \retVar
	.endm

	.macro GetDaycareCompatibility retVar
	.short 387
	.short \retVar
	.endm

	.macro CheckDaycareEgg retVar
	.short 388
	.short \retVar
	.endm

	.macro PlayerHasSpecies retVar, species
	.short 389
	.short \retVar
	.short \species
	.endm

	.macro SizeRecordCompare retVar, partySlot
	.short 390
	.short \retVar
	.short \partySlot
	.endm

	.macro SizeRecordUpdate partySlot
	.short 391
	.short \partySlot
	.endm

	.macro BufferMonSize idx0, idx1, partySlot
	.short 392
	.short \idx0
	.short \idx1
	.short \partySlot
	.endm

	.macro BufferRecordSize idx0, idx1, partySlot
	.short 393
	.short \idx0
	.short \idx1
	.short \partySlot
	.endm

	.macro ScrCmd_394 arg0
	.short 394
	.short \arg0
	.endm

	.macro ScrCmd_395 arg0
	.short 395
	.short \arg0
	.endm

	.macro CountMonMoves retVar, partySlot
	.short 396
	.short \retVar
	.short \partySlot
	.endm

	.macro MonForgetMove partySlot, moveSlot
	.short 397
	.short \partySlot
	.short \moveSlot
	.endm

	.macro MonGetMove retVar, partySlot, moveSlot
	.short 398
	.short \retVar
	.short \partySlot
	.short \moveSlot
	.endm

	.macro BufferPartyMonMoveName field, partySlot, moveSlot
	.short 399
	.byte \field
	.short \partySlot
	.short \moveSlot
	.endm

	; action = 0: Deactivate strength
	; action = 1: Activate strength
	; action = 2: Check whether strength is active
	.macro StrengthFlagAction action, var=0
	.short 400
	.byte \action
	.if \action == 2
	.short \var
	.endif
	.endm

	.macro FlashAction action, var=0
	.short 401
	.byte \action
	.if \action == 2
	.short \var
	.endif
	.endm

	.macro DefogAction action, var=0
	.short 402
	.byte \action
	.if \action == 2
	.short \var
	.endif
	.endm

	.macro ScrCmd_403 arg0, arg1
	.short 403
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_404 arg0, arg1, arg2
	.short 404
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_405 arg0, arg1, arg2
	.short 405
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_406 arg0
	.short 406
	.short \arg0
	.endm

	.macro ScrCmd_407 arg0, arg1
	.short 407
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_408 arg0, arg1
	.short 408
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_409
	.short 409
	.endm

	.macro ScrCmd_410 arg0, arg1
	.short 410
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_411
	.short 411
	.endm

	.macro ScrCmd_412 arg0, arg1, arg2
	.short 412
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_413 arg0, arg1, arg2, arg3
	.short 413
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro ScrCmd_414 arg0
	.short 414
	.short \arg0
	.endm

	.macro ScrCmd_415 arg0
	.short 415
	.short \arg0
	.endm

	.macro ScrCmd_416 arg0, arg1, arg2
	.short 416
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_417 arg0, arg1
	.short 417
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_418 arg0, arg1
	.short 418
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_419 arg0
	.short 419
	.short \arg0
	.endm

	.macro ScrCmd_420 arg0
	.short 420
	.short \arg0
	.endm

	.macro ScrCmd_421 arg0, arg1, arg2
	.short 421
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_422 arg0, arg1, arg2, arg3
	.short 422
	.short \arg0
	.short \arg1
	.short \arg2
	.byte \arg3
	.endm

	.macro CheckJohtoDexComplete retVar
	.short 423
	.short \retVar
	.endm

	.macro CheckNationalDexComplete retVar
	.short 424
	.short \retVar
	.endm

	.macro ShowCertificate certificateID
	.short 425
	.short \certificateID
	.endm

	.macro KenyaCheck retVar, partySlot, arg2
	.short 426
	.short \retVar
	.short \partySlot
	.byte \arg2
	.endm

	.macro ScrCmd_427 arg0
	.short 427
	.short \arg0
	.endm

	.macro MonGiveMail partySlot
	.short 428
	.short \partySlot
	.endm

	.macro CountFossils retVar
	.short 429
	.short \retVar
	.endm

	.macro SetPhoneCall callerID, isScriptedCall, callScriptID
	.short 430
	.short \callerID
	.short \isScriptedCall
	.short \callScriptID
	.endm

	.macro RunPhoneCall
	.short 431
	.endm

	.macro GetFossilPokemon retVar, fossilID
	.short 432
	.short \retVar
	.short \fossilID
	.endm

	.macro GetFossilMinimumAmount retVar_ItemID, retVar_FossilID, neededAmount
	.short 433
	.short \retVar_ItemID
	.short \retVar_FossilID
	.short \neededAmount
	.endm

	.macro PartyCountMonsAtOrBelowLevel retVar, level
	.short 434
	.short \retVar
	.short \level
	.endm

	.macro SurvivePoisoning retVar, partySlot
	.short 435
	.short \retVar
	.short \partySlot
	.endm

	.macro ScrCmd_436
	.short 436
	.endm

	.macro DebugWatch arg0_unused
	.short 437
	.short \arg0_unused
	.endm

	.macro GetStdMsgNaix arg0, retVar
	.short 438
	.short \arg0
	.short \retVar
	.endm

	.macro NonNPCMsgExtern fileID, messageID
	.short 439
	.short \fileID
	.short \messageID
	.endm

	.macro MsgBoxExtern fileID, messageID
	.short 440
	.short \fileID
	.short \messageID
	.endm

	.macro ScrCmd_441 arg0, arg1, arg2, arg3
	.short 441
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro ScrCmd_442 arg0, arg1, arg2, arg3
	.short 442
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro ScrCmd_443 arg0
	.short 443
	.byte \arg0
	.endm

	.macro ScrCmd_444 arg0, arg1, arg2, arg3
	.short 444
	.byte \arg0
	.short \arg1
	.short \arg2
	.byte \arg3
	.endm

	.macro ScrCmd_445 arg0
	.short 445
	.short \arg0
	.endm

	.macro ScrCmd_446 arg0
	.short 446
	.short \arg0
	.endm

	.macro SafariZoneAction action, areaSet
	.short 447
	.byte \action
	.byte \areaSet
	.endm

	.macro ScrCmd_448 arg0, arg1, arg2, arg3, arg4
	.short 448
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro ScrCmd_449
	.short 449
	.endm

	.macro ScrCmd_450
	.short 450
	.endm

	.macro ScrCmd_451 arg0
	.short 451
	.short \arg0
	.endm

	.macro ScrCmd_452 arg0, arg1
	.short 452
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_453
	.short 453
	.endm

	.macro ScrCmd_454
	.short 454
	.endm

	.macro ScrCmd_455
	.short 455
	.endm

	.macro ScrCmd_456 arg0
	.short 456
	.byte \arg0
	.endm

	.macro MonGetNature retVar, partySlot
	.short 457
	.short \retVar
	.short \partySlot
	.endm

	.macro GetPartySlotWithNature retVar, nature
	.short 458
	.short \retVar
	.short \nature
	.endm

	.macro ScrCmd_459
	.short 459
	.endm

	.macro LoadPhoneDat phoneBookEntryID, retVar
	.short 460
	.short \phoneBookEntryID
	.short \retVar
	.endm

	.macro GetPhoneContactMsgIds arg0, arg1, arg2
	.short 461
	.byte \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_462 arg0
	.short 462
	.short \arg0
	.endm

	.macro EnableMassOutbreaks
	.short 463
	.endm

	.macro CreateRoamer roamerID
	.short 464
	.byte \roamerID
	.endm

	.macro ScrCmd_465 arg0, arg1=0, arg2=0
	.short 465
	.short \arg0
	.if \arg0 <= 3
		.short \arg1
		.short \arg2
	.else
		.if \arg0 != 6
			.short \arg1
		.endif
	.endif
	.endm

	.macro ScrCmd_466 arg0, arg1
	.short 466
	.short \arg0
	.short \arg1
	.endm

	.macro MoveRelearnerInit partySlot
	.short 467
	.short \partySlot
	.endm

	.macro MoveTutorInit partySlot, moveID
	.short 468
	.short \partySlot
	.short \moveID
	.endm

	.macro MoveRelearnerGetResult retVar
	.short 469
	.short \retVar
	.endm

	.macro LoadNPCTrade tradeID
	.short 470
	.byte \tradeID
	.endm

	.macro GetOfferedSpecies retVar
	.short 471
	.short \retVar
	.endm

	.macro NPCTradeGetReqSpecies retVar
	.short 472
	.short \retVar
	.endm

	.macro NPCTradeExec retVar
	.short 473
	.short \retVar
	.endm

	.macro NPCTradeEnd
	.short 474
	.endm

	.macro ScrCmd_475
	.short 475
	.endm

	.macro EnablePokedexFormDetection
	.short 476
	.endm

	.macro NatDexFlagAction action, retVar
	.short 477
	.byte \action
	.short \retVar
	.endm

	.macro MonGetRibbonCount retVar, partySlot
	.short 478
	.short \retVar
	.short \partySlot
	.endm

	.macro GetPartyRibbonCount retVar
	.short 479
	.short \retVar
	.endm

	.macro MonHasRibbon retVar, partySlot, ribbonID
	.short 480
	.short \retVar
	.short \partySlot
	.short \ribbonID
	.endm

	.macro GiveRibbon partySlot, ribbonID
	.short 481
	.short \partySlot
	.short \ribbonID
	.endm

	.macro BufferRibbonName fieldNo, ribbonID
	.short 482
	.byte \fieldNo
	.short \ribbonID
	.endm

	.macro GetEVTotal retVar, partySlot
	.short 483
	.short \retVar
	.short \partySlot
	.endm

	.macro GetWeekday retVar
	.short 484
	.short \retVar
	.endm

	.macro StartBattleRegulationMenuTask retVar
	.short 485
	.short \retVar
	.endm

	.macro Dummy486
	.short 486
	.endm

	.macro PokeCenAnim kind
	.short 487
	.short \kind
	.endm

	.macro ElevatorAnim direction, distance
	.short 488
	.short \direction
	.short \distance
	.endm

	.macro MysteryGift arg0, arg1=0, arg2=0
	.short 489
	.short \arg0
	.if \arg0 >= 1 && \arg0 <= 3
	.short \arg1
	.else
	.if \arg0 == 5 || \arg0 == 6
	.short \arg1
	.short \arg2
	.endif
	.endif
	.endm

	.macro NopVar490 arg0
	.short 490
	.short \arg0
	.endm

	.macro ScrCmd_491 arg0_unused
	.short 491
	.short \arg0_unused
	.endm

	.macro ScrCmd_492 arg0, arg1, arg2
	.short 492
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro PromptEasyChat arg0, arg1, arg2
	.short 493
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_494 arg0, arg1
	.short 494
	.short \arg0
	.short \arg1
	.endm

	.macro GetGameVersion retVar
	.short 495
	.short \retVar
	.endm

	.macro GetPartyLead retVar
	.short 496
	.short \retVar
	.endm

	.macro GetMonTypes retVar_Type1, retVar_Type2, partySlot
	.short 497
	.short \retVar_Type1
	.short \retVar_Type2
	.short \partySlot
	.endm

	.macro PrimoPasswordCheck1 retVar, arg1, arg2, arg3, arg4
	.short 498
	.short \retVar
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro PrimoPasswordCheck2 retVar, arg1, arg2, arg3, arg4
	.short 499
	.short \retVar
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro ScrCmd_500 arg0
	.short 500
	.byte \arg0
	.endm

	.macro ScrCmd_501 arg0
	.short 501
	.byte \arg0
	.endm

	.macro ScrCmd_502 arg0
	.short 502
	.byte \arg0
	.endm

	.macro LotoIDGet arg0
	.short 503
	.short \arg0
	.endm

	.macro LotoIDSearch retVar_0, retVar_1, retVar_2, lotoID
	.short 504
	.short \retVar_0
	.short \retVar_1
	.short \retVar_2
	.short \lotoID
	.endm

	.macro LotoIDSet
	.short 505
	.endm

	.macro BufferBoxMonNick fieldNo, boxMonSlot
	.short 506
	.byte \fieldNo
	.short \boxMonSlot
	.endm

	.macro CountPCEmptySpace retVar
	.short 507
	.short \retVar
	.endm

	.macro PalParkAction action
	.short 508
	.short \action
	.endm

	.macro ScrCmd_509 arg0
	.short 509
	.short \arg0
	.endm

	.macro ScrCmd_510
	.short 510
	.endm

	.macro PalParkScoreGet scoreType, retVar
	.short 511
	.short \scoreType
	.short \retVar
	.endm

	.macro PlayerMovementSavingSet
	.short 512
	.endm

	.macro PlayerMovementSavingClear
	.short 513
	.endm

	; Animate placing the balls on the machine
	; for the Hall of Fame
	.macro HallOfFameAnim num
	.short 514
	.short \num
	.endm

	.macro AddSpecialGameStat scoreEventID
	.short 515
	.short \scoreEventID
	.endm

	.macro BufferFashionName fieldNo, fashionID
	.short 516
	.byte \fieldNo
	.short \fashionID
	.endm

	.macro ScrCmd_517 arg0, arg1
	.short 517
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_518 arg0
	.short 518
	.short \arg0
	.endm

	.macro ScrCmd_519 arg0
	.short 519
	.short \arg0
	.endm

	.macro ScrCmd_520
	.short 520
	.endm

	.macro ScrCmd_521
	.short 521
	.endm

	.macro ScrCmd_522 arg0
	.short 522
	.short \arg0
	.endm

	.macro ScrCmd_523 arg0, arg1, arg2, arg3, arg4
	.short 523
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro ScrCmd_524 arg0, arg1, arg2
	.short 524
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_525 arg0
	.short 525
	.short \arg0
	.endm

	.macro ScrCmd_526 arg0
	.short 526
	.short \arg0
	.endm

	.macro ScrCmd_527 arg0
	.short 527
	.short \arg0
	.endm

	.macro ScrCmd_528 arg0
	.short 528
	.short \arg0
	.endm

	.macro GetPartyLeadAlive retVar
	.short 529
	.short \retVar
	.endm

	.macro ScrCmd_530 arg0, arg1
	.short 530
	.short \arg0
	.byte \arg1
	.endm

	.macro BufferBackgroundName fieldNo, backgroundID
	.short 531
	.byte \fieldNo
	.short \backgroundID
	.endm

	.macro CheckCoinsImmediate retVar, amount
	.short 532
	.short \retVar
	.word \amount
	.endm

	.macro CheckGiveCoins retVar, amount
	.short 533
	.short \retVar
	.short \amount
	.endm

	.macro ScrCmd_534 arg0
	.short 534
	.short \arg0
	.endm

	.macro MonGetLevel retVar, partySlot
	.short 535
	.short \retVar
	.short \partySlot
	.endm

	.macro ScrCmd_536 arg0, arg1
	.short 536
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_537
	.short 537
	.endm

	.macro ScrCmd_538 arg0, arg1
	.short 538
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_539 arg0
	.short 539
	.short \arg0
	.endm

	.macro ScrCmd_540 arg0
	.short 540
	.short \arg0
	.endm

	.macro BufferIntEx fieldNo, number, printingMode, digits
	.short 541
	.byte \fieldNo
	.short \number
	.byte \printingMode
	.byte \digits
	.endm

	.macro MonGetContestValue partySlot, contestAttribute, retVar
	.short 542
	.short \partySlot
	.short \contestAttribute
	.short \retVar
	.endm

	.macro ScrCmd_543 arg0
	.short 543
	.short \arg0
	.endm

	.macro ScrCmd_544 arg0, arg1
	.short 544
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_545 arg0
	.short 545
	.short \arg0
	.endm

	.macro ScrCmd_546 arg0, arg1
	.short 546
	.byte \arg0
	.short \arg1
	.endm

	.macro ScrCmd_547 arg0
	.short 547
	.short \arg0
	.endm

	.macro ScrCmd_548
	.short 548
	.endm

	.macro ScrCmd_549 arg0
	.short 549
	.short \arg0
	.endm

	.macro ScrCmd_550 arg0
	.short 550
	.short \arg0
	.endm

	.macro ScrCmd_551 arg0
	.short 551
	.short \arg0
	.endm

	.macro ScrCmd_552 arg0, arg1
	.short 552
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_553 arg0, arg1
	.short 553
	.byte \arg0
	.short \arg1
	.endm

	.macro ScrCmd_554 arg0
	.short 554
	.short \arg0
	.endm

	.macro ScrCmd_555 arg0
	.short 555
	.short \arg0
	.endm

	.macro ScrCmd_556 arg0
	.short 556
	.short \arg0
	.endm

	.macro CheckBattlePoints amount, retVar
	.short 557
	.short \amount
	.short \retVar
	.endm

	.macro UnionRoomAvatarIdxToSprite avatarID, retVar
	.short 558
	.short \avatarID
	.short \retVar
	.endm

	.macro ScrCmd_559 arg0, arg1
	.short 559
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_560 arg0, arg1
	.short 560
	.short \arg0
	.short \arg1
	.endm

	.macro ScreenShake arg0, arg1, arg2, arg3
	.short 561
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro MultiBattle followerTrainerNum, trainer1, trainer2, arg3
	.short 562
	.short \followerTrainerNum
	.short \trainer1
	.short \trainer2
	.byte \arg3
	.endm

	.macro ScrCmd_563 arg0, arg1, arg2
	.short 563
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_564 arg0
	.short 564
	.short \arg0
	.endm

	.macro ScrCmd_565 arg0
	.short 565
	.short \arg0
	.endm

	.macro ScrCmd_566
	.short 566
	.endm

	.macro GetDPPlPrizeItemIDAndCost prizeID, retVar_ItemID, retVar_Cost
	.short 567
	.short \prizeID
	.short \retVar_ItemID
	.short \retVar_Cost
	.endm

	.macro ScrCmd_568 arg0, arg1
	.short 568
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_569 arg0
	.short 569
	.short \arg0
	.endm

	.macro CheckCoinsVar retVar_Result, retVar_Amount
	.short 570
	.short \retVar_Result
	.short \retVar_Amount
	.endm

	.macro ScrCmd_571 arg0, arg1, arg2, arg3, arg4
	.short 571
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro GetUniqueSealsQuantity retVar
	.short 572
	.short \retVar
	.endm

	.macro ScrCmd_573
	.short 573
	.endm

	.macro ScrCmd_574 arg0, arg1
	.short 574
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_575 arg0, arg1
	.short 575
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_576 arg0
	.short 576
	.short \arg0
	.endm

	.macro ScrCmd_577
	.short 577
	.endm

	.macro ScrCmd_578
	.short 578
	.endm

	.macro ScrCmd_579
	.short 579
	.endm

	.macro BufferSealName fieldNo, sealID
	.short 580
	.byte \fieldNo
	.short \sealID
	.endm

	.macro LockLastTalked
	.short 581
	.endm

	.macro ScrCmd_582 arg0, arg1, arg2
	.short 582
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_583 arg0, arg1
	.short 583
	.short \arg0
	.byte \arg1
	.endm

	.macro PartyLegalCheck retVar
	.short 584
	.short \retVar
	.endm

	.macro ScrCmd_585
	.short 585
	.endm

	.macro ScrCmd_586 arg0
	.short 586
	.short \arg0
	.endm

	.macro ScrCmd_587
	.short 587
	.endm

	.macro LatiCaughtCheck retVar
	.short 588
	.short \retVar
	.endm

	.macro WildBattle species, level, shiny=0
	.short 589
	.short \species
	.short \level
	.byte \shiny
	.endm

	.macro GetTrcardStars retVar
	.short 590
	.short \retVar
	.endm

	.macro ScrCmd_591
	.short 591
	.endm

	.macro ScrCmd_592 arg0
	.short 592
	.short \arg0
	.endm

	.macro ShowSaveStats
	.short 593
	.endm

	.macro HideSaveStats
	.short 594
	.endm

	.macro ScrCmd_595 arg0
	.short 595
	.byte \arg0
	.endm

	.macro ScrCmd_596 arg0
	.short 596
	.short \arg0
	.endm

	.macro ScrCmd_597
	.short 597
	.endm

	.macro ScrCmd_598 arg0
	.short 598
	.short \arg0
	.endm

	.macro ScrCmd_599
	.short 599
	.endm

	.macro ScrCmd_600
	.short 600
	.endm

	.macro FollowMonFacePlayer
	.short 601
	.endm

	.macro ToggleFollowingPokemonMovement flag
	.short 602
	.short \flag
	.endm

	.macro WaitFollowingPokemonMovement
	.short 603
	.endm

	.macro FollowingPokemonMovement movement
	.short 604
	.short \movement
	.endm

	.macro ScrCmd_605 arg0, arg1
	.short 605
	.byte \arg0
	.byte \arg1
	.endm

	.macro ScrCmd_606
	.short 606
	.endm

	.macro ScrCmd_607
	.short 607
	.endm

	.macro ScrCmd_608
	.short 608
	.endm

	.macro ScrCmd_609
	.short 609
	.endm

	.macro ScrCmd_610 arg0
	.short 610
	.short \arg0
	.endm

	.macro Pokeathlon arg0, arg1, arg2, arg3, arg4, arg5, arg6
	.short 611
	.byte \arg0
	.byte \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.short \arg5
	.short \arg6
	.endm

	.macro GetNPCTradeUnusedFlag retVar
	.short 612
	.short \retVar
	.endm

	.macro GetPhoneContactRandomGiftBerry retVar
	.short 613
	.short \retVar
	.endm

	.macro GetPhoneContactGiftItem retVar
	.short 614
	.short \retVar
	.endm

	.macro CameronPhoto photoNum
	.short 615
	.short \photoNum
	.endm

	.macro CountSavedPhotos retVar
	.short 616
	.short \retVar
	.endm

	.macro OpenPhotoAlbum
	.short 617
	.endm

	.macro PhotoAlbumIsFull retVar
	.short 618
	.short \retVar
	.endm

	.macro RocketCostumeFlagCheck retVar
	.short 619
	.short \retVar
	.endm

	.macro RocketCostumeFlagAction action
	.short 620
	.byte \action
	.endm

	.macro PlaceStarterBallsInElmsLab
	.short 621
	.endm

	.macro ScrCmd_622 arg0, arg1
	.short 622
	.short \arg0
	.short \arg1
	.endm

	.macro AnimApricornTree arg0
	.short 623
	.short \arg0
	.endm

	.macro ApricornTreeGetApricorn arg0
	.short 624
	.short \arg0
	.endm

	; Has an amount parameter due to the code being modified from Berry Trees.
	.macro GiveApricornFromTree apricornID, amount, retVar
	.short 625
	.short \apricornID
	.short \amount
	.short \retVar
	.endm

	.macro BufferApricornName fieldNo, apricornID
	.short 626
	.byte \fieldNo
	.short \apricornID
	.endm

	.macro ScrCmd_627 arg0
	.short 627
	.byte \arg0
	.endm

	.macro ScrCmd_628 arg0, arg1
	.short 628
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_629
	.short 629
	.endm

	.macro ScrCmd_630 arg0
	.short 630
	.short \arg0
	.endm

	.macro ScrCmd_631 arg0, arg1, arg2
	.short 631
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro CountPartyMonsOfSpecies retVar, species
	.short 632
	.short \retVar
	.short \species
	.endm

	.macro ScrCmd_633 arg0, arg1, arg2
	.short 633
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_634 arg0, arg1
	.short 634
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_635 arg0, arg1
	.short 635
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_636 arg0
	.short 636
	.short \arg0
	.endm

	.macro ScrCmd_637 arg0, arg1, arg2
	.short 637
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_638 arg0, arg1, arg2
	.short 638
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_639 arg0, arg1, arg2
	.short 639
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_640 arg0
	.short 640
	.short \arg0
	.endm

	.macro SaveWipeExtraChunks
	.short 641
	.endm

	.macro ScrCmd_642 arg0
	.short 642
	.short \arg0
	.endm

	.macro ScrCmd_643 arg0, arg1, arg2
	.short 643
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_644 arg0, arg1, arg2
	.short 644
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_645 arg0, arg1, arg2
	.short 645
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_646 arg0
	.short 646
	.short \arg0
	.endm

	.macro GetPartySlotWithSpecies retVar, species
	.short 647
	.short \retVar
	.short \species
	.endm

	.macro ScrCmd_648 arg0, arg1, arg2, arg3, arg4
	.short 648
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro ScratchOffCard
	.short 649
	.endm

	.macro ScratchOffCardEnd
	.short 650
	.endm

	.macro GetScratchOffPrize cardNo, retVar_1, retVar_2
	.short 651
	.short \cardNo
	.short \retVar_1
	.short \retVar_2
	.endm

	.macro ScrCmd_652 arg0, arg1, arg2
	.short 652
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro MoveTutorChooseMove partySlot, tutorID, pageNo, arg3
	.short 653
	.short \partySlot
	.short \tutorID
	.short \pageNo
	.short \arg3
	.endm

	.macro TutorMoveTeachInSlot partySlot, moveSlot, moveID
	.short 654
	.short \partySlot
	.short \moveSlot
	.short \moveID
	.endm

	.macro TutorMoveGetPrice moveID, retVar
	.short 655
	.short \moveID
	.short \retVar
	.endm

	.macro ScrCmd_656 arg0, arg1
	.short 656
	.short \arg0
	.short \arg1
	.endm

	.macro StatJudge partySlot, totalIVs, bestStat, bestIV
	.short 657
	.short \partySlot
	.short \totalIVs
	.short \bestStat
	.short \bestIV
	.endm

	.macro BufferStatName fieldNo, statID
	.short 658
	.byte \fieldNo
	.short \statID
	.endm

	.macro SetMonForm partySlot, formID
	.short 659
	.short \partySlot
	.short \formID
	.endm

	.macro BufferTrainerName fieldNo, trainerID
	.short 660
	.byte \fieldNo
	.short \trainerID
	.endm

	.macro ScrCmd_661 arg0, arg1, arg2, arg3
	.short 661
	.byte \arg0
	.word \arg1
	.byte \arg2
	.byte \arg3
	.endm

	.macro ScrCmd_662 arg0, arg1, arg2
	.short 662
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_663 arg0
	.short 663
	.short \arg0
	.endm

	.macro ScrCmd_664
	.short 664
	.endm

	.macro ScrCmd_665 arg0
	.short 665
	.short \arg0
	.endm

	.macro ScrCmd_666 arg0
	.short 666
	.short \arg0
	.endm

	.macro ScrCmd_667 arg0
	.short 667
	.short \arg0
	.endm

	.macro BufferTypeName fieldNo, typeID
	.short 668
	.byte \fieldNo
	.short \typeID
	.endm

	.macro GetItemQuantity itemID, retVar
	.short 669
	.short \itemID
	.short \retVar
	.endm

	.macro GetHiddenPowerType partySlot, retVar
	.short 670
	.short \partySlot
	.short \retVar
	.endm

	.macro SetFavoriteMon
	.short 671
	.endm

	.macro GetFavoriteMon retVar_Species, retVar_Form, retVar_IsEgg
	.short 672
	.short \retVar_Species
	.short \retVar_Form
	.short \retVar_IsEgg
	.endm

	.macro GetOwnedRotomForms retVar_hasHeat, retVar_hasWash, retVar_hasFrost, retVar_hasFan, retVar_hasMow
	.short 673
	.short \retVar_hasHeat
	.short \retVar_hasWash
	.short \retVar_hasFrost
	.short \retVar_hasFan
	.short \retVar_hasMow
	.endm

	.macro CountTranformedRotomsInParty retVar_Count, retVar_firstPartySlot
	.short 674
	.short \retVar_Count
	.short \retVar_firstPartySlot
	.endm

	.macro UpdateRotomForm rotomID, partySlot, arg2_unused, formID
	.short 675
	.short \rotomID
	.short \partySlot
	.short \arg2_unused
	.short \formID
	.endm

	.macro GetPartyMonForm partySlot, retVar
	.short 676
	.short \partySlot
	.short \retVar
	.endm

	.macro ScrCmd_677 arg0, arg1
	.short 677
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_678 arg0, arg1
	.short 678
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_679
	.short 679
	.endm

	.macro AddSpecialGameStat2 scoreEventID
	.short 680
	.short \scoreEventID
	.endm

	.macro ScrCmd_681 arg0
	.short 681
	.short \arg0
	.endm

	.macro ScrCmd_682 arg0
	.short 682
	.short \arg0
	.endm

	.macro GetStaticEncounterOutcome retVar
	.short 683
	.short \retVar
	.endm

	.macro ScrCmd_684 arg0
	.short 684
	.short \arg0
	.endm

	.macro GetPlayerXYZ retVar_X, retVar_Y, retVar_Z
	.short 685
	.short \retVar_X
	.short \retVar_Y
	.short \retVar_Z
	.endm

	.macro ScrCmd_686 arg0, arg1
	.short 686
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_687 arg0
	.short 687
	.short \arg0
	.endm

	.macro GetPartySlotWithFatefulEncounter retVar, species
	.short 688
	.short \retVar
	.short \species
	.endm

	; Attempt to remove all Griseous Orbs and reset Pokemon
	; to forms present in Diamond and Pearl, to avoid
	; problems communicating with those games.
	.macro CommSanitizeParty retVar_Success
	.short 689
	.short \retVar_Success
	.endm

	.macro DaycareSanitizeMon partySlot, retVar
	.short 690
	.short \partySlot
	.short \retVar
	.endm

	.macro ScrCmd_691 arg0
	.short 691
	.short \arg0
	.endm

	.macro BufferBattleHallStreak winStreak, winStreakTarget, nextWinStreakTarget, battlePoints, retVar_WinStreakLevel, retVar_Result
	.short 692
	.byte \winStreak
	.byte \winStreakTarget
	.byte \nextWinStreakTarget
	.byte \battlePoints
	.short \retVar_WinStreakLevel
	.short \retVar_Result
	.endm

	.macro BattleHallCountUsedSpecies retVar
	.short 693
	.short \retVar
	.endm

	.macro BattleHallGetTotalStreak retVar
	.short 694
	.short \retVar
	.endm

	.macro ScrCmd_695 arg0
	.short 695
	.short \arg0
	.endm

	.macro ScrCmd_696 arg0
	.short 696
	.short \arg0
	.endm

	.macro ScrCmd_697 arg0
	.short 697
	.short \arg0
	.endm

	.macro FollowerPokeIsEventTrigger eventID, partySlot, retVar
	.short 698
	.byte \eventID
	.short \partySlot
	.short \retVar
	.endm

	.macro ScrCmd_699
	.short 699
	.endm

	.macro ScrCmd_700
	.short 700
	.endm

	.macro MonHasItem itemID, retVar
	.short 701
	.short \itemID
	.short \retVar
	.endm

	.macro BattleTowerSetUpMultiBattle
	.short 702
	.endm

	.macro SetPlayerVolume volume
	.short 703
	.short \volume
	.endm

	.macro ScrCmd_704 arg0, arg1
	.short 704
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_705 arg0, arg1
	.short 705
	.short \arg0
	.word \arg1
	.endm

	.macro ScrCmd_706 arg0
	.short 706
	.short \arg0
	.endm

	.macro CheckMonSeen species, retVar
	.short 707
	.short \species
	.short \retVar
	.endm

	.macro ScrCmd_708 arg0
	.short 708
	.short \arg0
	.endm

	.macro ScrCmd_709
	.short 709
	.endm

	.macro ScrCmd_710
	.short 710
	.endm

	.macro FollowMonInteract
	.short 711
	.endm

	.macro ScrCmd_712 arg0
	.short 712
	.byte \arg0
	.endm

	.macro AlphPuzzle alphPuzzleID
	.short 713
	.byte \alphPuzzleID
	.endm

	.macro OpenAlphHiddenRoom arg0
	.short 714
	.byte \arg0
	.endm

	.macro UpdateDaycareMonObjects
	.short 715
	.endm

	.macro ScrCmd_716
	.short 716
	.endm

	.macro ScrCmd_717 arg0
	.short 717
	.short \arg0
	.endm

	.macro ScrCmd_718 arg0, arg1
	.short 718
	.byte \arg0
	.short \arg1
	.endm

	.macro ScrCmd_719 arg0, arg1
	.short 719
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_720 arg0
	.short 720
	.short \arg0
	.endm

	.macro ScrCmd_721 arg0
	.short 721
	.short \arg0
	.endm

	.macro ScrCmd_722 arg0, arg1, arg2, arg3, arg4
	.short 722
	.byte \arg0
	.byte \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro ScrCmd_723 arg0, arg1, arg2, arg3, arg4
	.short 723
	.byte \arg0
	.byte \arg1
	.short \arg2
	.short \arg3
	.short \arg4
	.endm

	.macro ScrCmd_724 arg0, arg1
	.short 724
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_725 arg0, arg1
	.short 725
	.byte \arg0
	.short \arg1
	.endm

	.macro ScrCmd_726
	.short 726
	.endm

	.macro GetFollowPokePartyIndex retVar
	.short 727
	.short \retVar
	.endm

	.macro ScrCmd_728 arg0, arg1
	.short 728
	.byte \arg0
	.byte \arg1
	.endm

	.macro ScrCmd_729 arg0
	.short 729
	.short \arg0
	.endm

	.macro ScrCmd_730 arg0
	.short 730
	.short \arg0
	.endm

	.macro ScrCmd_731
	.short 731
	.endm

	.macro ScrCmd_732 arg0
	.short 732
	.byte \arg0
	.endm

	.macro ScrCmd_733 arg0, arg1
	.short 733
	.byte \arg0
	.short \arg1
	.endm

	.macro ScrCmd_734 arg0
	.short 734
	.byte \arg0
	.endm

	.macro ScrCmd_735 arg0
	.short 735
	.short \arg0
	.endm

	.macro ClearKurtApricorn
	.short 736
	.endm

	.macro ScrCmd_737 arg0
	.short 737
	.short \arg0
	.endm

	.macro GetTotalApricornCount retVar
	.short 738
	.short \retVar
	.endm

	.macro ScrCmd_739
	.short 739
	.endm

	.macro ScrCmd_740 arg0, arg1
	.short 740
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_741 arg0, arg1, arg2, arg3
	.short 741
	.short \arg0
	.short \arg1
	.short \arg2
	.short \arg3
	.endm

	.macro ScrCmd_742 arg0, arg1, arg2
	.short 742
	.short \arg0
	.short \arg1
	.short \arg2
	.endm

	.macro ScrCmd_743 arg0
	.short 743
	.short \arg0
	.endm

	.macro CreatePokeathlonFriendshipRoomStatues
	.short 744
	.endm

	.macro BufferPokeathlonCourseName fieldNo, courseID
	.short 745
	.byte \fieldNo
	.short \courseID
	.endm

	.macro TouchscreenMenuHide
	.short 746
	.endm

	.macro TouchscreenMenuShow
	.short 747
	.endm

	.macro GetMenuChoice retVar
	.short 748
	.short \retVar
	.endm

	.macro MenuInitStdGmm arg0, arg1, arg2, arg3, arg4
	.short 749
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro MenuInit arg0, arg1, arg2, arg3, arg4
	.short 750
	.byte \arg0
	.byte \arg1
	.byte \arg2
	.byte \arg3
	.short \arg4
	.endm

	.macro MenuItemAdd msgID, where, value
	.short 751
	.short \msgID
	.short \where
	.short \value
	.endm

	.macro MenuExec
	.short 752
	.endm

	.macro RockSmashItemCheck followMonUsingHM, retVar_itemFound, retVar_itemID
	.short 753
	.short \followMonUsingHM
	.short \retVar_itemFound
	.short \retVar_itemID
	.endm

	.macro TryHeadbuttEncounter retVar
	.short 754
	.short \retVar
	.endm

	.macro LegendCutsceneClearBellAnimBegin
	.short 755
	.endm

	.macro LegendCutsceneClearBellAnimEnd
	.short 756
	.endm

	.macro LegendCutsceneClearBellRiseFromBag
	.short 757
	.endm

	.macro LegendCutsceneClearBellShimmer clearBellOnly
	.short 758
	.short \clearBellOnly
	.endm

	.macro LegendCutsceneLugiaEyeGlimmerEffect
	.short 759
	.endm

	.macro ScrCmd_760
	.short 760
	.endm

	.macro LegendCutsceneMoveCameraTo destIndex
	.short 761
	.short \destIndex
	.endm

	.macro LegendCutscenePanCameraTo destIndex
	.short 762
	.short \destIndex
	.endm

	.macro LegendCutsceneWaitCameraPan
	.short 763
	.endm

	.macro LegendCutsceneBirdFinalApproach
	.short 764
	.endm

	.macro LegendCutsceneWavesOrLeavesEffectBegin
	.short 765
	.endm

	.macro LegendCutsceneWavesOrLeavesEffectEnd
	.short 766
	.endm

	.macro LegendCutsceneLugiaArrivesEffectBegin
	.short 767
	.endm

	.macro LegendCutsceneLugiaArrivesEffectEnd
	.short 768
	.endm

	.macro LegendCutsceneLugiaArrivesEffectCameraPan
	.short 769
	.endm

	.macro CheckSeenAllLetterUnown retVar
	.short 770
	.short \retVar
	.endm

	.macro ScrCmd_771
	.short 771
	.endm

	.macro ScrCmd_772
	.short 772
	.endm

	.macro Cinematic scene
	.short 773
	.short \scene
	.endm

	.macro ShowLegendaryWing arg0
	.short 774
	.short \arg0
	.endm

	.macro ScrCmd_775 arg0, arg1
	.short 775
	.short \arg0
	.short \arg1
	.endm

	.macro GiveTogepiEgg
	.short 776
	.endm

	.macro ScrCmd_777 arg0, arg1
	.short 777
	.short \arg0
	.short \arg1
	.endm

	.macro GiveSpikyEarPichu
	.short 778
	.endm

	.macro RadioMusicIsPlaying sndseq, retVar
	.short 779
	.short \sndseq
	.short \retVar
	.endm

	.macro CasinoGame machineID, city
	.short 780
	.byte \machineID
	.byte \city
	.endm

	.macro KenyaCheckPartyOrMailbox retVar
	.short 781
	.short \retVar
	.endm

	.macro MartSell
	.short 782
	.endm

	.macro SetFollowMonInhibitState state
	.short 783
	.byte \state
	.endm

	.macro ScriptOverlayCmd overlay, action
	.short 784
	.byte \overlay
	.byte \action
	.endm

	.macro BugContestAction action, weekday
	.short 785
	.byte \action
	.short \weekday
	.endm

	.macro BufferBugContestWinner arg0
	.short 786
	.byte \arg0
	.endm

	.macro JudgeBugContest retVar_Placement, retVar_Prize, retVar_Species
	.short 787
	.short \retVar_Placement
	.short \retVar_Prize
	.short \retVar_Species
	.endm

	.macro BufferBugContestMonNick scriptID, retVar
	.short 788
	.byte \scriptID
	.short \retVar
	.endm

	.macro BugContestGetTimeLeft scriptID
	.short 789
	.byte \scriptID
	.endm

	.macro IsBugContestantRegistered contestantID, retVar
	.short 790
	.short \contestantID
	.short \retVar
	.endm

	.macro CheckSafariZoneChallengeCompleted challengeID, retVar
	.short 791
	.byte \challengeID
	.short \retVar
	.endm

	.macro UpdateSafariZoneIGT
	.short 792
	.endm

	.macro BankTransaction mode, retVar
	.short 793
	.short \mode
	.short \retVar
	.endm

	.macro CheckBankBalance retVar, amount
	.short 794
	.short \retVar
	.word \amount
	.endm

	.macro ScrCmd_795 arg0, arg1
	.short 795
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_796
	.short 796
	.endm

	.macro ScrCmd_797
	.short 797
	.endm

	.macro BufferRulesetName ruleset
	.short 798
	.short \ruleset
	.endm

	.macro ScrCmd_799 arg0
	.short 799
	.short \arg0
	.endm

	.macro ScrCmd_800 arg0
	.short 800
	.short \arg0
	.endm

	.macro ScrCmd_801 arg0
	.short 801
	.short \arg0
	.endm

	.macro ScrCmd_802
	.short 802
	.endm

	.macro ScrCmd_803 arg0, arg1
	.short 803
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_804 arg0
	.short 804
	.byte \arg0
	.endm

	.macro ScrCmd_805
	.short 805
	.endm

	.macro ScrCmd_806
	.short 806
	.endm

	.macro SetTrainerHouseSprite trainerID, retVar
	.short 807
	.short \trainerID
	.short \retVar
	.endm

	.macro ScrCmd_808 arg0
	.short 808
	.short \arg0
	.endm

	.macro ShowTrainerHouseIntroMessage trainerID
	.short 809
	.short \trainerID
	.endm

	.macro ScrCmd_810
	.short 810
	.endm

	.macro ScrCmd_811 arg0, arg1
	.short 811
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_812
	.short 812
	.endm

	.macro MomGiftCheck retVar
	.short 813
	.short \retVar
	.endm

	.macro ScrCmd_814
	.short 814
	.endm

	.macro ScrCmd_815 arg0
	.short 815
	.short \arg0
	.endm

	.macro UnownCircle
	.short 816
	.endm

	.macro ScrCmd_817 arg0
	.short 817
	.byte \arg0
	.endm

	.macro MystriStageGymmickInit
	.short 818
	.endm

	.macro ScrCmd_819
	.short 819
	.endm

	.macro ScrCmd_820 arg0
	.short 820
	.byte \arg0
	.endm

	.macro GetBuenasPassword arg0, arg1
	.short 821
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_822
	.short 822
	.endm

	.macro ScrCmd_823 arg0
	.short 823
	.short \arg0
	.endm

	.macro ScrCmd_824 arg0
	.short 824
	.short \arg0
	.endm

	.macro GetShinyLeafCount partySlot, retVar
	.short 825
	.short \partySlot
	.short \retVar
	.endm

	.macro TryGiveShinyLeafCrown partySlot
	.short 826
	.short \partySlot
	.endm

	.macro GetPartyMonForm2 partySlot, retVar
	.short 827
	.short \partySlot
	.short \retVar
	.endm

	.macro MonAddContestValue partySlot, contestAttribute, contestModifier
	.short 828
	.short \partySlot
	.byte \contestAttribute
	.short \contestModifier
	.endm

	.macro ScrCmd_829 arg0
	.short 829
	.short \arg0
	.endm

	.macro ScrCmd_830 arg0
	.short 830
	.short \arg0
	.endm

	.macro ScrCmd_831 arg0
	.short 831
	.short \arg0
	.endm

	.macro ScrCmd_832 arg0
	.short 832
	.short \arg0
	.endm

	.macro ScrCmd_833 arg0
	.short 833
	.short \arg0
	.endm

	.macro ScrCmd_834 arg0
	.short 834
	.short \arg0
	.endm

	.macro ScrCmd_835 arg0
	.short 835
	.short \arg0
	.endm

	.macro CheckKyogreGroudonInParty retVar
	.short 836
	.short \retVar
	.endm

	.macro ScrCmd_837 arg0
	.short 837
	.short \arg0
	.endm

	.macro BankOrWalletIsFull action, retVar
	.short 838
	.short \action
	.short \retVar
	.endm

	.macro SysSetSleepFlag flag
	.short 839
	.short \flag
	.endm

	.macro ScrCmd_840 arg0, arg1
	.short 840
	.short \arg0
	.short \arg1
	.endm

	.macro ScrCmd_841 arg0
	.short 841
	.byte \arg0
	.endm

	.macro ScrCmd_842 arg0
	.short 842
	.byte \arg0
	.endm

	.macro BufferItemNameIndef fieldNo, itemID
	.short 843
	.byte \fieldNo
	.short \itemID
	.endm

	.macro BufferItemNamePlural fieldNo, itemID
	.short 844
	.byte \fieldNo
	.short \itemID
	.endm

	.macro BufferPartyMonSpeciesNameIndef fieldNo, partySlot
	.short 845
	.byte \fieldNo
	.short \partySlot
	.endm

	.macro BufferSpeciesNameIndef fieldNo, itemID, arg2_unused, arg3_unused
	.short 846
	.byte \fieldNo
	.short \itemID
	.short \arg2_unused
	.byte \arg3_unused
	.endm

	.macro BufferDPPtFriendStarterSpeciesNameIndef fieldNo
	.short 847
	.byte \fieldNo
	.endm

	.macro BufferFashionNameIndef fieldNo, fashionID
	.short 848
	.byte \fieldNo
	.short \fashionID
	.endm

	.macro BufferTrainerClassNameIndef fieldNo, trainerClass
	.short 849
	.byte \fieldNo
	.short \trainerClass
	.endm

	.macro BufferSealNamePlural fieldNo, sealID
	.short 850
	.byte \fieldNo
	.short \sealID
	.endm

	.macro Capitalize arg0
	.short 851
	.byte \arg0
	.endm

	.macro BufferDeptStoreFloorNo fieldNo, floor
	.short 852
	.byte \fieldNo
	.byte \floor
	.endm

	; Script headers

	.macro MapScript kind, script
	.byte \kind
	.word \script
	.endm

	.macro MapScript2 var, val, script
	.short \var, \val, \script
	.endm

	; Convenience macros

	; Generic compare macro which attempts to deduce argument types based on their values
	; Any values between 0x4000 to 0x40FF and 0x8000 to 0x8015 are considered event variable identifiers
	.macro Compare var, arg
		.if ((\arg >= VARS_START && \arg <= VARS_END) || (\arg >= SPECIAL_VARS_START && \arg <= SPECIAL_VARS_END))
			CompareVarToVar \var, \arg
		.else
			CompareVarToValue \var, \arg
		.endif
	.endm

	.macro GoToIfUnset flag, dest
	CheckFlag \flag
	GoToIf FALSE, \dest
	.endm

	.macro GoToIfSet flag, dest
	CheckFlag \flag
	GoToIf TRUE, \dest
	.endm

	.macro GoToIfLt dest ; LESS THAN
	GoToIf 0, \dest
	.endm

	.macro GoToIfEq dest ; EQUAL
	GoToIf 1, \dest
	.endm

	.macro GoToIfGt dest ; GREATER THAN
	GoToIf 2, \dest
	.endm

	.macro GoToIfLe dest ; LESS THAN OR EQUAL
	GoToIf 3, \dest
	.endm

	.macro GoToIfGe dest ; GREATER THAN OR EQUAL
	GoToIf 4, \dest
	.endm

	.macro GoToIfNe dest ; NOT EQUAL
	GoToIf 5, \dest
	.endm

	.macro CallIfUnset flag, dest
	CheckFlag \flag
	CallIf FALSE, \dest
	.endm

	.macro CallIfSet flag, dest
	CheckFlag \flag
	CallIf TRUE, \dest
	.endm

	.macro CallIfLt dest ; LESS THAN
	CallIf 0, \dest
	.endm

	.macro CallIfEq dest ; EQUAL
	CallIf 1, \dest
	.endm

	.macro CallIfGt dest ; GREATER THAN
	CallIf 2, \dest
	.endm

	.macro CallIfLe dest ; LESS THAN OR EQUAL
	CallIf 3, \dest
	.endm

	.macro CallIfGe dest ; GREATER THAN OR EQUAL
	CallIf 4, \dest
	.endm

	.macro CallIfNe dest ; NOT EQUAL
	CallIf 5, \dest
	.endm

	.macro GoToIfDefeated trainer, dest
	CheckTrainerFlag \trainer
	GoToIf TRUE, \dest
	.endm

	.macro GoToIfNotDefeated trainer, dest
	CheckTrainerFlag \trainer
	GoToIf FALSE, \dest
	.endm

	.macro CallIfDefeated trainer, dest
	CheckTrainerFlag \trainer
	CallIf TRUE, \dest
	.endm

	.macro CallIfNotDefeated trainer, dest
	CheckTrainerFlag \trainer
	CallIf FALSE, \dest
	.endm

	.macro ItemVars item, quantity=1
	.if \item < 0x4000
	SetVar VAR_SPECIAL_x8004, \item
	.else
	CopyVar VAR_SPECIAL_x8004, \item
	.endif
	.if \quantity < 0x4000
	SetVar VAR_SPECIAL_x8005, \quantity
	.else
	CopyVar VAR_SPECIAL_x8005, \quantity
	.endif
	.endm

	.macro GoToIfNoItemSpace item, quantity, target
	ItemVars \item, \quantity
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIf eq, \target
	.endm

	.macro GoToIfNoItemSpace2 item, quantity, target
	ItemVars \item, \quantity
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIf ne, \target
	.endm

	.macro GiveItemNoCheck item, quantity
	ItemVars \item, \quantity
	CallStd std_give_item_verbose
	.endm

	.macro TakeItemNoCheck item, quantity
	ItemVars \item, \quantity
	TakeItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	.endm

	.macro Switch var
	CopyVar VAR_SPECIAL_x8008, \var
	.endm

	.macro Case value, target
	Compare VAR_SPECIAL_x8008, \value
	GoToIf eq, \target
	.endm

	.macro PhoneCall who, b, c
	SetVar VAR_SPECIAL_x8004, \who
	SetVar VAR_SPECIAL_x8005, \b
	SetVar VAR_SPECIAL_x8006, \c
	CallStd std_phone_call
	.endm

	.macro SimpleNPCMsg msgid
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg \msgid
	WaitButton
	CloseMsg
	ReleaseAll
	.endm

	 /*
     * This flag is used by ScriptEntry and ScriptEntryEnd to control where
     * a user can add ScriptEntry commands (i.e., only at the start of the
     * input file). It is NOT meant for direct usage.
     */
    .set F_ACCEPT_SCRIPT_ENTRIES, TRUE

    .macro ScriptEntry name
    .if F_ACCEPT_SCRIPT_ENTRIES == TRUE
        .long \name-.-4
    .else
        .error "cannot specify ScriptEntry after ScriptEntryEnd"
    .endif
    .endm

    .macro ScriptEntryEnd
    .set F_ACCEPT_SCRIPT_ENTRIES, FALSE
    .short 0xFD13
    .endm

    .set F_INIT_SCRIPT_FRAME_TABLE_OPENED, FALSE
    .set F_INIT_SCRIPT_FRAME_TABLE_CLOSED, FALSE

    .macro InitScriptEntry_Fixed type, scriptID
    .if F_ACCEPT_SCRIPT_ENTRIES == TRUE
        .byte \type
        .short \scriptID, 0
    .else
        .error "cannot specify InitScriptEntry after InitScriptEntryEnd"
    .endif
    .endm

    .macro InitScriptEntry_OnFrameTable checksLabel
    .if F_ACCEPT_SCRIPT_ENTRIES == TRUE
        .set F_INIT_SCRIPT_FRAME_TABLE_OPENED, TRUE
        .byte INIT_SCRIPT_ON_FRAME_TABLE
        ScriptEntry \checksLabel
    .else
        .error "cannot specify InitScriptEntry after InitScriptEntryEnd"
    .endif
    .endm

    .macro InitScriptEntry_OnTransition scriptID
    InitScriptEntry_Fixed INIT_SCRIPT_ON_TRANSITION, \scriptID
    .endm

    .macro InitScriptEntry_OnResume scriptID
    InitScriptEntry_Fixed INIT_SCRIPT_ON_RESUME, \scriptID
    .endm

    .macro InitScriptEntry_OnLoad scriptID
    InitScriptEntry_Fixed INIT_SCRIPT_ON_LOAD, \scriptID
    .endm

    .macro InitScriptEntryEnd
    .set F_ACCEPT_SCRIPT_ENTRIES, FALSE
    .byte 0
    .endm

    .macro InitScriptGoToIfEqual var1, var2, scriptID
    .if F_INIT_SCRIPT_FRAME_TABLE_OPENED == TRUE
        .if F_INIT_SCRIPT_FRAME_TABLE_CLOSED == FALSE
            .short \var1, \var2, \scriptID
        .else
            .error "cannot specify InitScriptGoToIfEqual after InitScriptFrameTableEnd"
        .endif
    .else
        .error "cannot specify InitScriptGoToIfEqual before InitScriptEntry_OnFrameTable"
    .endif
    .endm

    .macro InitScriptFrameTableEnd
    .set F_INIT_SCRIPT_FRAME_TABLE_CLOSED, TRUE
    .short 0
    .endm

    .macro InitScriptEnd
    .if F_ACCEPT_SCRIPT_ENTRIES == TRUE
        .error "cannot specify InitScriptEnd before InitScriptEntryEnd"
    .endif
    .if F_INIT_SCRIPT_FRAME_TABLE_OPENED == TRUE
        .if F_INIT_SCRIPT_FRAME_TABLE_CLOSED == FALSE
            .error "must close InitScriptEntry_OnFrameTable with InitScriptFrameTableEnd before InitScriptEnd"
        .endif
    .endif
    .balign 4, 0
    .endm

	.endif ; ASM_SCRIPT_INC
