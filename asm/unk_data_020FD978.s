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
	.include "unk_data_020FD978.inc"
	.include "global.inc"

	.rodata

gMovementCmdSteps_001:
	.word MapObjectMovementCmd001_Step0
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_003:
	.word MapObjectMovementCmd003_Step0
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_073:
	.word MapObjectMovementCmd073_Step0
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_074:
	.word MapObjectMovementCmd074_Step0
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_072:
	.word MapObjectMovementCmd072_Step0
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_070:
	.word MapObjectMovementCmd070_Step0
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_069:
	.word MapObjectMovementCmd069_Step0
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_000:
	.word MapObjectMovementCmd000_Step0
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_002:
	.word MapObjectMovementCmd002_Step0
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_071:
	.word MapObjectMovementCmd071_Step0
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_010:
	.word MapObjectMovementCmd010_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_089:
	.word MapObjectMovementCmd089_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_083:
	.word MapObjectMovementCmd083_Step0
	.word MapObjectMovementCmd082_Step1
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_006:
	.word MapObjectMovementCmd006_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_091:
	.word MapObjectMovementCmd091_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_004:
	.word MapObjectMovementCmd004_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

gMovementCmdSteps_011:
	.word MapObjectMovementCmd011_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2
