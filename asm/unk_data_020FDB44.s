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
	.include "unk_data_020FDB44.inc"
	.include "global.inc"

	.rodata

	.public gMovementCmdSteps_098
gMovementCmdSteps_098:
	.word MapObjectMovementCmd098_Step0
	.word MapObjectMovementCmd098_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_099
gMovementCmdSteps_099:
	.word MapObjectMovementCmd099_Step0
	.word MapObjectMovementCmd098_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_097
gMovementCmdSteps_097:
	.word MapObjectMovementCmd097_Step0
	.word MapObjectMovementCmd098_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_096
gMovementCmdSteps_096:
	.word MapObjectMovementCmd096_Step0
	.word MapObjectMovementCmd098_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_064
gMovementCmdSteps_064:
	.word MapObjectMovementCmd064_Step0
	.word MapObjectMovementCmd064_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_090
gMovementCmdSteps_090:
	.word MapObjectMovementCmd090_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_060
gMovementCmdSteps_060:
	.word MapObjectMovementCmd060_Step0
	.word MapObjectMovementCmd064_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_088
gMovementCmdSteps_088:
	.word MapObjectMovementCmd088_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_092
gMovementCmdSteps_092:
	.word MapObjectMovementCmd092_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_082
gMovementCmdSteps_082:
	.word MapObjectMovementCmd082_Step0
	.word MapObjectMovementCmd082_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_056
gMovementCmdSteps_056:
	.word MapObjectMovementCmd056_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_080
gMovementCmdSteps_080:
	.word MapObjectMovementCmd080_Step0
	.word MapObjectMovementCmd082_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_055
gMovementCmdSteps_055:
	.word MapObjectMovementCmd055_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_007
gMovementCmdSteps_007:
	.word MapObjectMovementCmd007_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_100
gMovementCmdSteps_100:
	.word MapObjectMovementCmd100_Step0
	.word MapObjectMovementCmd100_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_075
gMovementCmdSteps_075:
	.word MapObjectMovementCmd075_Step0
	.word MapObjectMovementCmd075_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_103
gMovementCmdSteps_103:
	.word MapObjectMovementCmd103_Step0
	.word MapObjectMovementCmd075_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_101
gMovementCmdSteps_101:
	.word MapObjectMovementCmd101_Step0
	.word MapObjectMovementCmd101_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_040
gMovementCmdSteps_040:
	.word MapObjectMovementCmd040_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_038
gMovementCmdSteps_038:
	.word MapObjectMovementCmd038_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_036
gMovementCmdSteps_036:
	.word MapObjectMovementCmd036_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_034
gMovementCmdSteps_034:
	.word MapObjectMovementCmd034_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_032
gMovementCmdSteps_032:
	.word MapObjectMovementCmd032_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_030
gMovementCmdSteps_030:
	.word MapObjectMovementCmd030_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_068
gMovementCmdSteps_068:
	.word MapObjectMovementCmd068_Step0
	.word MapObjectMovementCmd068_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_067
gMovementCmdSteps_067:
	.word MapObjectMovementCmd067_Step0
	.word MapObjectMovementCmd067_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_066
gMovementCmdSteps_066:
	.word MapObjectMovementCmd066_Step0
	.word MapObjectMovementCmd064_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_065
gMovementCmdSteps_065:
	.word MapObjectMovementCmd065_Step0
	.word MapObjectMovementCmd064_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_084
gMovementCmdSteps_084:
	.word MapObjectMovementCmd084_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_063
gMovementCmdSteps_063:
	.word MapObjectMovementCmd063_Step0
	.word MapObjectMovementCmd064_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_062
gMovementCmdSteps_062:
	.word MapObjectMovementCmd062_Step0
	.word MapObjectMovementCmd064_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_061
gMovementCmdSteps_061:
	.word MapObjectMovementCmd061_Step0
	.word MapObjectMovementCmd064_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_016
gMovementCmdSteps_016:
	.word MapObjectMovementCmd016_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_095
gMovementCmdSteps_095:
	.word MapObjectMovementCmd095_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_094
gMovementCmdSteps_094:
	.word MapObjectMovementCmd094_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_093
gMovementCmdSteps_093:
	.word MapObjectMovementCmd093_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_008
gMovementCmdSteps_008:
	.word MapObjectMovementCmd008_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_059
gMovementCmdSteps_059:
	.word MapObjectMovementCmd059_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_058
gMovementCmdSteps_058:
	.word MapObjectMovementCmd058_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_057
gMovementCmdSteps_057:
	.word MapObjectMovementCmd057_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_081
gMovementCmdSteps_081:
	.word MapObjectMovementCmd081_Step0
	.word MapObjectMovementCmd082_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_054
gMovementCmdSteps_054:
	.word MapObjectMovementCmd054_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_053
gMovementCmdSteps_053:
	.word MapObjectMovementCmd053_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_076
gMovementCmdSteps_076:
	.word MapObjectMovementCmd076_Step0
	.word MapObjectMovementCmd076_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_047
gMovementCmdSteps_047:
	.word MapObjectMovementCmd047_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_048
gMovementCmdSteps_048:
	.word MapObjectMovementCmd048_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_077
gMovementCmdSteps_077:
	.word MapObjectMovementCmd077_Step0
	.word MapObjectMovementCmd076_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_102
gMovementCmdSteps_102:
	.word MapObjectMovementCmd102_Step0
	.word MapObjectMovementCmd102_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_049
gMovementCmdSteps_049:
	.word MapObjectMovementCmd049_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_046
gMovementCmdSteps_046:
	.word MapObjectMovementCmd046_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_045
gMovementCmdSteps_045:
	.word MapObjectMovementCmd045_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_044
gMovementCmdSteps_044:
	.word MapObjectMovementCmd044_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_043
gMovementCmdSteps_043:
	.word MapObjectMovementCmd043_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_042
gMovementCmdSteps_042:
	.word MapObjectMovementCmd042_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_041
gMovementCmdSteps_041:
	.word MapObjectMovementCmd041_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_050
gMovementCmdSteps_050:
	.word MapObjectMovementCmd050_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_039
gMovementCmdSteps_039:
	.word MapObjectMovementCmd039_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_078
gMovementCmdSteps_078:
	.word MapObjectMovementCmd078_Step0
	.word MapObjectMovementCmd076_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_037
gMovementCmdSteps_037:
	.word MapObjectMovementCmd037_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_051
gMovementCmdSteps_051:
	.word MapObjectMovementCmd051_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_035
gMovementCmdSteps_035:
	.word MapObjectMovementCmd035_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_052
gMovementCmdSteps_052:
	.word MapObjectMovementCmd052_Step0
	.word MapObjectMovementCmd092_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_033
gMovementCmdSteps_033:
	.word MapObjectMovementCmd033_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_079
gMovementCmdSteps_079:
	.word MapObjectMovementCmd079_Step0
	.word MapObjectMovementCmd076_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_031
gMovementCmdSteps_031:
	.word MapObjectMovementCmd031_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_104
gMovementCmdSteps_104:
	.word MapObjectMovementCmd104_Step0
	.word MapObjectMovementCmd102_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_029
gMovementCmdSteps_029:
	.word MapObjectMovementCmd029_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_028
gMovementCmdSteps_028:
	.word MapObjectMovementCmd028_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_027
gMovementCmdSteps_027:
	.word MapObjectMovementCmd027_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_026
gMovementCmdSteps_026:
	.word MapObjectMovementCmd026_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_025
gMovementCmdSteps_025:
	.word MapObjectMovementCmd025_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_024
gMovementCmdSteps_024:
	.word MapObjectMovementCmd024_Step0
	.word MapObjectMovementCmd040_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_087
gMovementCmdSteps_087:
	.word MapObjectMovementCmd087_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_086
gMovementCmdSteps_086:
	.word MapObjectMovementCmd086_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_085
gMovementCmdSteps_085:
	.word MapObjectMovementCmd085_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_005
gMovementCmdSteps_005:
	.word MapObjectMovementCmd005_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_023
gMovementCmdSteps_023:
	.word MapObjectMovementCmd023_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_022
gMovementCmdSteps_022:
	.word MapObjectMovementCmd022_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_021
gMovementCmdSteps_021:
	.word MapObjectMovementCmd021_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_020
gMovementCmdSteps_020:
	.word MapObjectMovementCmd020_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_019
gMovementCmdSteps_019:
	.word MapObjectMovementCmd019_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_018
gMovementCmdSteps_018:
	.word MapObjectMovementCmd018_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_017
gMovementCmdSteps_017:
	.word MapObjectMovementCmd017_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_009
gMovementCmdSteps_009:
	.word MapObjectMovementCmd009_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_015
gMovementCmdSteps_015:
	.word MapObjectMovementCmd015_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_014
gMovementCmdSteps_014:
	.word MapObjectMovementCmd014_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_013
gMovementCmdSteps_013:
	.word MapObjectMovementCmd013_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_012
gMovementCmdSteps_012:
	.word MapObjectMovementCmd012_Step0
	.word MapObjectMovementCmd090_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_108
gMovementCmdSteps_108:
	.word MapObjectMovementCmd108_Step0
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd108_Step2
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_110
gMovementCmdSteps_110:
	.word MapObjectMovementCmd110_Step0
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd108_Step2
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_112
gMovementCmdSteps_112:
	.word MapObjectMovementCmd112_Step0
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd112_Step0
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd112_Step0
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_106
gMovementCmdSteps_106:
	.word MapObjectMovementCmd106_Step0
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd106_Step2
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd106_Step4
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd106_Step6
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_105
gMovementCmdSteps_105:
	.word MapObjectMovementCmd105_Step0
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd105_Step2
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd105_Step4
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd105_Step6
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd105_Step8
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_107
gMovementCmdSteps_107:
	.word MapObjectMovementCmd107_Step0
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd107_Step2
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd107_Step4
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd107_Step6
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd107_Step8
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd107_Step10
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd107_Step12
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_109
gMovementCmdSteps_109:
	.word MapObjectMovementCmd107_Step0
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd107_Step2
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd107_Step4
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd107_Step6
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd107_Step8
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd107_Step10
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd109_Step12
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd098_Step2

	.public gMovementCmdSteps_111
gMovementCmdSteps_111:
	.word MapObjectMovementCmd111_Step0
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd111_Step2
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd111_Step4
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd111_Step6
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd111_Step6
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd111_Step10
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd111_Step10
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd111_Step14
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd111_Step16
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd111_Step18
	.word MapObjectMovementCmd108_Step1
	.word MapObjectMovementCmd098_Step2
