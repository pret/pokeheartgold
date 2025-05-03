#include "constants/species.h"
#include "constants/sndseq.h"
#include "constants/maps.h"
#include "constants/items.h"
#include "constants/phone_contacts.h"
#include "constants/phone_scripts.h"
#include "constants/flags.h"
#include "msgdata/msg/msg_0271.h"
#include "msgdata/msg/msg_0416.h"
#include "msgdata/msg/msg_0411.h"
#include "msgdata/msg/msg_0640.h"
#include "msgdata/msg/msg_0664.h"
	.include "asm/macros.inc"
	.include "overlay_101.inc"
	.include "global.inc"

	.text

	.extern PhoneCall_InitMsgDataAndBufferNames
	.extern PhoneCallMessagePrint_Gendered
	.extern PhoneCallMessagePrint_Ungendered
	.extern PhoneCall_IsMessageDonePrinting
	.extern PhoneCall_TouchscreenListMenu_Create
	.extern PhoneCall_TouchscreenListMenu_HandleInput
	.extern PhoneCall_TouchscreenListMenu_Destroy
	.extern ov101_021F3D34

    .rodata

	.balign 4, 0
	.global ov101_021F86C8
ov101_021F86C8: ; 0x021F86C8
	.short PHONE_SCRIPT_102
	.short PHONE_SCRIPT_101

	.global ov101_021F86CC
ov101_021F86CC: ; 0x021F86CC
	.short MAP_ROUTE_1
	.short MAP_ROUTE_2
	.short MAP_ROUTE_3
	.short MAP_ROUTE_4
	.short MAP_ROUTE_5
	.short MAP_ROUTE_6
	.short MAP_ROUTE_7
	.short MAP_ROUTE_8
	.short MAP_ROUTE_9
	.short MAP_ROUTE_10
	.short MAP_ROUTE_11
	.short MAP_ROUTE_12
	.short MAP_ROUTE_13
	.short MAP_ROUTE_14
	.short MAP_ROUTE_15
	.short MAP_ROUTE_16
	.short MAP_ROUTE_17
	.short MAP_ROUTE_18
	.short MAP_ROUTE_19
	.short MAP_ROUTE_20
	.short MAP_ROUTE_21
	.short MAP_ROUTE_22
	.short MAP_ROUTE_24
	.short MAP_ROUTE_25
	.short MAP_ROUTE_26
	.short MAP_ROUTE_27
	.short MAP_ROUTE_28
	.short MAP_ROUTE_29
	.short MAP_ROUTE_30
	.short MAP_ROUTE_31
	.short MAP_ROUTE_32
	.short MAP_ROUTE_33
	.short MAP_ROUTE_34
	.short MAP_ROUTE_35
	.short MAP_ROUTE_36
	.short MAP_ROUTE_37
	.short MAP_ROUTE_38
	.short MAP_ROUTE_39
	.short MAP_ROUTE_40
	.short MAP_ROUTE_41
	.short MAP_ROUTE_42
	.short MAP_ROUTE_43
	.short MAP_ROUTE_44
	.short MAP_ROUTE_45
	.short MAP_ROUTE_46
	.short MAP_ROUTE_47
	.short MAP_ROUTE_48
	.short MAP_PALLET
	.short MAP_VIRIDIAN
	.short MAP_PEWTER
	.short MAP_CERULEAN
	.short MAP_LAVENDER
	.short MAP_VERMILION
	.short MAP_CELADON
	.short MAP_FUCHSIA
	.short MAP_CINNABAR_ISLAND
	.short MAP_INDIGO_PLATEAU
	.short MAP_SAFFRON
	.short MAP_NEW_BARK
	.short MAP_CHERRYGROVE
	.short MAP_VIOLET
	.short MAP_AZALEA
	.short MAP_CIANWOOD
	.short MAP_GOLDENROD
	.short MAP_OLIVINE
	.short MAP_ECRUTEAK
	.short MAP_MAHOGANY
	.short MAP_LAKE_OF_RAGE
	.short MAP_BLACKTHORN
	.short MAP_MOUNT_SILVER
	.short MAP_NATIONAL_PARK
	.short MAP_RUINS_OF_ALPH
	.short MAP_SAFARI_ZONE_GATE

	.global ov101_021F8760
	.balign 4, 0
ov101_021F8760: ; 0x021F8760
	.byte 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3
	.byte 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 3, 0, 0, 0, 0, 0
	.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 3
	.byte 3, 3, 3, 3, 3, 3, 3, 3, 2, 3, 0, 0, 0, 0, 0, 0
	.byte 0, 0, 0, 0, 0, 0, 0, 0, 1
