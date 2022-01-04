#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D51R0201.h"
#include "msgdata/msg/msg_0146_D51R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D51R0201_000
	scrdef scr_seq_D51R0201_001
	scrdef scr_seq_D51R0201_002
	scrdef scr_seq_D51R0201_003
	scrdef scr_seq_D51R0201_004
	scrdef scr_seq_D51R0201_005
	scrdef scr_seq_D51R0201_006
	scrdef scr_seq_D51R0201_007
	scrdef_end

scr_seq_D51R0201_002:
	comparevartovalue VAR_SCENE_SINJOH_MYSTRI_ROOM, 7
	gotoif eq, _0065
	comparevartovalue VAR_SCENE_SINJOH_MYSTRI_ROOM, 8
	gotoif eq, _0065
	comparevartovalue VAR_SCENE_SINJOH_MYSTRI_ROOM, 9
	gotoif eq, _0065
	comparevartovalue VAR_SCENE_SINJOH_MYSTRI_ROOM, 12
	gotoif eq, _0065
	comparevartovalue VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	gotoif eq, _0065
	end

_0065:
	scrcmd_818
	end

scr_seq_D51R0201_007:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _00C4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	releaseall
	end

scr_seq_D51R0201_006:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _00C4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 4
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_00C4:
	step 13, 2
	step_end
scr_seq_D51R0201_000:
	end

scr_seq_D51R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_SCENE_SINJOH_MYSTRI_ROOM, 8
	gotoif eq, _0165
	get_lead_mon_index VAR_TEMP_x4005
	scrcmd_698 2, VAR_TEMP_x4005, VAR_TEMP_x4006
	comparevartovalue VAR_TEMP_x4006, 1
	gotoif eq, _011A
	scrcmd_698 1, VAR_TEMP_x4005, VAR_TEMP_x4007
	comparevartovalue VAR_TEMP_x4007, 1
	gotoif eq, _011A
	npc_msg msg_0146_D51R0201_00024
	waitbutton
	closemsg
	releaseall
	end

_011A:
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif eq, _0154
	npc_msg msg_0146_D51R0201_00000
	closemsg
	get_party_count VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ge, _0154
	apply_movement obj_D51R0201_champion, _02CC
	wait_movement
	npc_msg msg_0146_D51R0201_00006
	closemsg
	goto _0170
	.byte 0x02, 0x00
_0154:
	npc_msg msg_0146_D51R0201_00002
	waitbutton
	closemsg
	setvar VAR_TEMP_x4004, 1
	releaseall
	end

_0165:
	npc_msg msg_0146_D51R0201_00012
	waitbutton
	closemsg
	releaseall
	end

_0170:
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 8
	setvar VAR_UNK_4104, 1
	get_player_facing VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, _019B
	apply_movement obj_D51R0201_champion, _02B4
	goto _01BE

_019B:
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif ne, _01B6
	apply_movement obj_D51R0201_champion, _02BC
	goto _01BE

_01B6:
	apply_movement obj_D51R0201_champion, _02C4
_01BE:
	wait_movement
	npc_msg msg_0146_D51R0201_00004
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, _01EA
	apply_movement obj_D51R0201_champion, _02D4
	goto _01F2

_01EA:
	apply_movement obj_D51R0201_champion, _02E0
_01F2:
	wait_movement
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, _0217
	apply_movement obj_player, _0390
	apply_movement obj_D51R0201_champion, _0308
	goto _024A

_0217:
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif ne, _023A
	apply_movement obj_player, _03A0
	apply_movement obj_D51R0201_champion, _0308
	goto _024A

_023A:
	apply_movement obj_player, _03B4
	apply_movement obj_D51R0201_champion, _02EC
_024A:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0146_D51R0201_00005
	closemsg
	apply_movement obj_D51R0201_champion, _0324
	wait_movement
	npc_msg msg_0146_D51R0201_00007
	closemsg
	apply_movement obj_D51R0201_champion, _0334
	wait_movement
	npc_msg msg_0146_D51R0201_00008
	closemsg
	apply_movement obj_D51R0201_champion, _0348
	wait_movement
	npc_msg msg_0146_D51R0201_00009
	closemsg
	apply_movement obj_D51R0201_champion, _0364
	wait_movement
	npc_msg msg_0146_D51R0201_00010
	closemsg
	apply_movement obj_D51R0201_champion, _0370
	apply_movement obj_player, _03C8
	wait_movement
	npc_msg msg_0146_D51R0201_00011
	waitbutton
	closemsg
	releaseall
	end


_02B4:
	step 33, 1
	step_end

_02BC:
	step 34, 1
	step_end

_02C4:
	step 35, 1
	step_end

_02CC:
	step 32, 1
	step_end

_02D4:
	step 14, 1
	step 35, 1
	step_end

_02E0:
	step 15, 1
	step 34, 1
	step_end

_02EC:
	step 65, 1
	step 15, 1
	step 12, 3
	step 15, 1
	step 12, 2
	step 34, 1
	step_end

_0308:
	step 65, 1
	step 14, 1
	step 12, 3
	step 15, 1
	step 12, 2
	step 34, 1
	step_end

_0324:
	step 15, 3
	step 13, 1
	step 34, 1
	step_end

_0334:
	step 13, 1
	step 14, 8
	step 12, 1
	step 35, 1
	step_end

_0348:
	step 12, 3
	step 15, 2
	step 12, 3
	step 15, 2
	step 12, 1
	step 33, 1
	step_end

_0364:
	step 13, 3
	step 33, 1
	step_end

_0370:
	step 15, 1
	step 13, 6
	step 14, 1
	step 32, 1
	step_end
	.byte 0x21, 0x00, 0x01, 0x00, 0x0d, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00

_0390:
	step 12, 6
	step 65, 1
	step 35, 1
	step_end

_03A0:
	step 15, 1
	step 12, 5
	step 65, 1
	step 35, 1
	step_end

_03B4:
	step 14, 1
	step 12, 5
	step 65, 1
	step 35, 1
	step_end

_03C8:
	step 63, 2
	step 35, 1
	step 63, 3
	step 35, 1
	step_end
scr_seq_D51R0201_004:
	scrcmd_609
	lockall
	comparevartovalue VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	gotoif lt, _0430
	comparevartovalue VAR_UNK_4103, 1
	gotoif eq, _0545
	call _0550
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif eq, _0633
	comparevartovalue VAR_TEMP_x400A, 2
	gotoif eq, _061D
	comparevartovalue VAR_TEMP_x400A, 3
	gotoif eq, _0628
	npc_msg msg_0146_D51R0201_00027
	goto _0433

_0430:
	npc_msg msg_0146_D51R0201_00013
_0433:
	scrcmd_820 1
	setvar VAR_TEMP_x4009, 483
	goto _0514
	.byte 0x02, 0x00
scr_seq_D51R0201_003:
	scrcmd_609
	lockall
	comparevartovalue VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	gotoif lt, _0498
	comparevartovalue VAR_UNK_4103, 2
	gotoif eq, _0545
	call _0550
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif eq, _0633
	comparevartovalue VAR_TEMP_x400A, 2
	gotoif eq, _061D
	comparevartovalue VAR_TEMP_x400A, 3
	gotoif eq, _0628
	npc_msg msg_0146_D51R0201_00028
	goto _049B

_0498:
	npc_msg msg_0146_D51R0201_00014
_049B:
	scrcmd_820 2
	setvar VAR_TEMP_x4009, 484
	goto _0514
	.byte 0x02, 0x00
scr_seq_D51R0201_005:
	scrcmd_609
	lockall
	comparevartovalue VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	gotoif lt, _0500
	comparevartovalue VAR_UNK_4103, 3
	gotoif eq, _0545
	call _0550
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif eq, _0633
	comparevartovalue VAR_TEMP_x400A, 2
	gotoif eq, _061D
	comparevartovalue VAR_TEMP_x400A, 3
	gotoif eq, _0628
	npc_msg msg_0146_D51R0201_00029
	goto _0503

_0500:
	npc_msg msg_0146_D51R0201_00015
_0503:
	scrcmd_820 3
	setvar VAR_TEMP_x4009, 487
	goto _0514
	.byte 0x02, 0x00
_0514:
	nop_var_490 VAR_TEMP_x4009
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _063E
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _053C
	end

_053C:
	closemsg
	scrcmd_820 0
	releaseall
	end

_0545:
	npc_msg msg_0146_D51R0201_00030
	waitbutton
	closemsg
	releaseall
	end

_0550:
	get_party_count VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif eq, _056D
	nop_var_490 VAR_TEMP_x4008
	setvar VAR_TEMP_x400A, 2
	return

_056D:
	get_lead_mon_index VAR_TEMP_x4000
	comparevartovalue VAR_UNK_4102, 1
	gotoif ne, _05B2
	scrcmd_698 1, VAR_TEMP_x4000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0605
	scrcmd_698 2, VAR_TEMP_x4000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _060D
	goto _0615
	.byte 0x16, 0x00, 0x47, 0x00
	.byte 0x00, 0x00
_05B2:
	comparevartovalue VAR_UNK_4102, 2
	gotoif ne, _05F3
	scrcmd_698 2, VAR_TEMP_x4000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0605
	scrcmd_698 1, VAR_TEMP_x4000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _060D
	goto _0615
	.byte 0x16, 0x00, 0x06
	.byte 0x00, 0x00, 0x00
_05F3:
	goto _0615
	.byte 0xea, 0x01, 0x07, 0x40, 0x29, 0x00, 0x0a
	.byte 0x40, 0x02, 0x00, 0x1b, 0x00
_0605:
	setvar VAR_TEMP_x400A, 1
	return

_060D:
	setvar VAR_TEMP_x400A, 3
	return

_0615:
	setvar VAR_TEMP_x400A, 0
	return

_061D:
	npc_msg msg_0146_D51R0201_00031
	waitbutton
	closemsg
	releaseall
	end

_0628:
	npc_msg msg_0146_D51R0201_00033
	waitbutton
	closemsg
	releaseall
	end

_0633:
	npc_msg msg_0146_D51R0201_00030
	waitbutton
	closemsg
	releaseall
	end

_063E:
	closemsg
	comparevartovalue VAR_SCENE_SINJOH_MYSTRI_ROOM, 13
	gotoif ne, _0659
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 14
	goto _065F

_0659:
	setvar VAR_SCENE_SINJOH_MYSTRI_ROOM, 9
_065F:
	scrcmd_820 0
	setvar VAR_UNK_4104, 0
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	get_player_facing VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4009, 483
	gotoif ne, _0691
	goto _06B0
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00
	.byte 0x00
_0691:
	comparevartovalue VAR_TEMP_x4009, 484
	gotoif ne, _06AA
	goto _0731
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_06AA:
	goto _07B2

_06B0:
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, _06D3
	apply_movement obj_partner_poke, _0BE4
	apply_movement 241, _0C28
	goto _0729

_06D3:
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif ne, _06F6
	apply_movement obj_partner_poke, _0BF4
	apply_movement 241, _0C28
	goto _0729

_06F6:
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, _0719
	apply_movement obj_partner_poke, _0C08
	apply_movement 241, _0C28
	goto _0729

_0719:
	apply_movement obj_partner_poke, _0C18
	apply_movement 241, _0C28
_0729:
	wait_movement
	goto _0833

_0731:
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, _0754
	apply_movement obj_partner_poke, _0C34
	apply_movement 241, _0C78
	goto _07AA

_0754:
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif ne, _0777
	apply_movement obj_partner_poke, _0C44
	apply_movement 241, _0C78
	goto _07AA

_0777:
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, _079A
	apply_movement obj_partner_poke, _0C54
	apply_movement 241, _0C78
	goto _07AA

_079A:
	apply_movement obj_partner_poke, _0C68
	apply_movement 241, _0C78
_07AA:
	wait_movement
	goto _0833

_07B2:
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, _07D5
	apply_movement obj_partner_poke, _0C84
	apply_movement 241, _0CC4
	goto _082B

_07D5:
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif ne, _07F8
	apply_movement obj_partner_poke, _0C90
	apply_movement 241, _0CC4
	goto _082B

_07F8:
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, _081B
	apply_movement obj_partner_poke, _0CA0
	apply_movement 241, _0CC4
	goto _082B

_081B:
	apply_movement obj_partner_poke, _0CB0
	apply_movement 241, _0CC4
_082B:
	wait_movement
	goto _0833

_0833:
	fade_out_bgm 0, 30
	play_se SEQ_SE_GS_TAMASYUTUGEN
	scrcmd_816
	scrcmd_074 2366
	scrcmd_773 2
	comparevartovalue VAR_SCENE_SINJOH_MYSTRI_ROOM, 14
	gotoif eq, _086E
	release obj_D51R0201_champion
	move_person obj_D51R0201_champion, 16, 1, 28, 0
	wait 5, VAR_SPECIAL_x800C
	lock obj_D51R0201_champion
_086E:
	comparevartovalue VAR_TEMP_x4009, 483
	gotoif ne, _0889
	apply_movement obj_player, _0CCC
	goto _08AC

_0889:
	comparevartovalue VAR_TEMP_x4009, 484
	gotoif ne, _08A4
	apply_movement obj_player, _0CD8
	goto _08AC

_08A4:
	apply_movement obj_player, _0CE4
_08AC:
	wait 150, VAR_SPECIAL_x800C
	fade_screen 6, 30, 1, 0x00
	wait_fade
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	nop_var_490 VAR_SPECIAL_x8004
	nop_var_490 VAR_SPECIAL_x8005
	apply_movement 241, _0CF0
	wait_movement
	play_se SEQ_SE_GS_TAMASYUTUGEN
	comparevartovalue VAR_TEMP_x4009, 483
	gotoif ne, _08F6
	scrcmd_817 0
	goto _090F

_08F6:
	comparevartovalue VAR_TEMP_x4009, 484
	gotoif ne, _090C
	scrcmd_817 1
	goto _090F

_090C:
	scrcmd_817 2
_090F:
	scrcmd_074 2322
	apply_movement obj_player, _0D0C
	wait_movement
	scrcmd_819
	wait 2, VAR_SPECIAL_x800C
	npc_msg msg_0146_D51R0201_00025
	nop_var_490 VAR_TEMP_x4009
	buffer_players_name 0
	buffer_species_name 1, VAR_TEMP_x4009, 0, 0
	play_fanfare SEQ_ME_SHINKAOME
	npc_msg msg_0146_D51R0201_00026
	wait_fanfare
	closemsg
	apply_movement 241, _0CF8
	wait_movement
	scrcmd_103
	reset_bgm
	nop_var_490 VAR_TEMP_x4009
	comparevartovalue VAR_TEMP_x4009, 483
	gotoif ne, _097B
	give_mon SPECIES_DIALGA, 1, 135, 0, 0, VAR_SPECIAL_x800C
	setvar VAR_UNK_4103, 1
	goto _09B6

_097B:
	comparevartovalue VAR_TEMP_x4009, 484
	gotoif ne, _09A2
	give_mon SPECIES_PALKIA, 1, 136, 0, 0, VAR_SPECIAL_x800C
	setvar VAR_UNK_4103, 2
	goto _09B6

_09A2:
	give_mon SPECIES_GIRATINA, 1, 112, 1, 26, VAR_SPECIAL_x800C
	setvar VAR_UNK_4103, 3
_09B6:
	touchscreen_menu_hide
	npc_msg msg_0146_D51R0201_00032
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	scrcmd_815 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif eq, _0BB2
	comparevartovalue VAR_SCENE_SINJOH_MYSTRI_ROOM, 14
	gotoif eq, _0A4D
	apply_movement obj_D51R0201_champion, _0D28
	apply_movement obj_player, _0D00
	apply_movement obj_partner_poke, _0D1C
	wait_movement
	npc_msg msg_0146_D51R0201_00016
	closemsg
	apply_movement obj_D51R0201_champion, _0D4C
	wait_movement
	npc_msg msg_0146_D51R0201_00017
	closemsg
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, 0x00
	wait_fade
	wait 1, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 0x00
	wait_fade
	apply_movement obj_D51R0201_champion, _0D30
	wait_movement
	npc_msg msg_0146_D51R0201_00018
	closemsg
	apply_movement obj_D51R0201_champion, _0D44
	wait_movement
	npc_msg msg_0146_D51R0201_00019
	closemsg
_0A4D:
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	fade_screen 6, 6, 0, 0x00
	wait_fade
	wait 1, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 0x00
	wait_fade
	comparevartovalue VAR_SCENE_SINJOH_MYSTRI_ROOM, 14
	gotoif eq, _0AAA
	get_lead_mon_index VAR_TEMP_x4005
	scrcmd_698 2, VAR_TEMP_x4005, VAR_TEMP_x4006
	comparevartovalue VAR_TEMP_x4006, 1
	gotoif ne, _0AA0
	setvar VAR_UNK_4102, 1
	goto _0AA6

_0AA0:
	setvar VAR_UNK_4102, 2
_0AA6:
	clearflag FLAG_HIDE_ALPH_MAIN_CHAMBER_ARCEUS_EVENT_PEOPLE
_0AAA:
	play_se SEQ_SE_DP_KAIDAN2
	comparevartovalue VAR_UNK_403E, 6
	gotoif ne, _0AE5
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 490, 0, 9, 24, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	goto _0BAE

_0AE5:
	comparevartovalue VAR_UNK_403E, 7
	gotoif ne, _0B1C
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 492, 0, 9, 24, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	goto _0BAE

_0B1C:
	comparevartovalue VAR_UNK_403E, 8
	gotoif ne, _0B53
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 492, 0, 9, 24, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	goto _0BAE

_0B53:
	comparevartovalue VAR_UNK_403E, 9
	gotoif ne, _0B8A
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 492, 0, 9, 24, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
	goto _0BAE

_0B8A:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 315, 0, 9, 24, 1
	fade_screen 6, 1, 1, 0x00
	wait_fade
_0BAE:
	releaseall
	end

_0BB2:
	get_party_count VAR_SPECIAL_x800C
	subvar VAR_SPECIAL_x800C, 1
	setvar VAR_TEMP_x4008, 0
	fade_screen 6, 1, 0, 0x00
	wait_fade
	nickname_input VAR_SPECIAL_x800C, VAR_TEMP_x4008
	scrcmd_819
	fade_screen 6, 1, 1, 0x00
	wait_fade
	return


_0BE4:
	step 11, 4
	step 8, 4
	step 33, 1
	step_end

_0BF4:
	step 8, 2
	step 11, 5
	step 8, 1
	step 33, 1
	step_end

_0C08:
	step 11, 3
	step 8, 3
	step 33, 1
	step_end

_0C18:
	step 11, 4
	step 8, 2
	step 33, 1
	step_end

_0C28:
	step 11, 4
	step 8, 3
	step_end

_0C34:
	step 10, 4
	step 8, 4
	step 33, 1
	step_end

_0C44:
	step 10, 3
	step 8, 3
	step 33, 1
	step_end

_0C54:
	step 8, 2
	step 10, 5
	step 8, 1
	step 33, 1
	step_end

_0C68:
	step 10, 4
	step 8, 2
	step 33, 1
	step_end

_0C78:
	step 10, 4
	step 8, 3
	step_end

_0C84:
	step 9, 3
	step 33, 1
	step_end

_0C90:
	step 9, 4
	step 11, 1
	step 33, 1
	step_end

_0CA0:
	step 9, 4
	step 10, 1
	step 33, 1
	step_end

_0CB0:
	step 11, 1
	step 9, 5
	step 10, 1
	step 33, 1
	step_end

_0CC4:
	step 9, 4
	step_end

_0CCC:
	step 23, 4
	step 0, 1
	step_end

_0CD8:
	step 22, 4
	step 0, 1
	step_end

_0CE4:
	step 13, 7
	step 0, 1
	step_end

_0CF0:
	step 12, 3
	step_end

_0CF8:
	step 13, 3
	step_end

_0D00:
	step 65, 2
	step 13, 2
	step_end

_0D0C:
	step 63, 1
	step 75, 1
	step 63, 1
	step_end

_0D1C:
	step 65, 2
	step 13, 4
	step_end

_0D28:
	step 12, 9
	step_end

_0D30:
	step 3, 1
	step 63, 3
	step 2, 1
	step 63, 3
	step_end

_0D44:
	step 32, 1
	step_end

_0D4C:
	step 63, 1
	step 33, 1
	step_end
	.balign 4, 0
