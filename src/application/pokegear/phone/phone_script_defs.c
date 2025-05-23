#include "constants/items.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0641.h"
#include "msgdata/msg/msg_0642.h"
#include "msgdata/msg/msg_0643.h"
#include "msgdata/msg/msg_0644.h"
#include "msgdata/msg/msg_0645.h"
#include "msgdata/msg/msg_0646.h"
#include "msgdata/msg/msg_0647.h"
#include "msgdata/msg/msg_0648.h"
#include "msgdata/msg/msg_0649.h"
#include "msgdata/msg/msg_0650.h"
#include "msgdata/msg/msg_0651.h"
#include "msgdata/msg/msg_0652.h"
#include "msgdata/msg/msg_0653.h"
#include "msgdata/msg/msg_0654.h"
#include "msgdata/msg/msg_0655.h"
#include "msgdata/msg/msg_0656.h"
#include "msgdata/msg/msg_0657.h"
#include "msgdata/msg/msg_0658.h"
#include "msgdata/msg/msg_0659.h"
#include "msgdata/msg/msg_0660.h"
#include "msgdata/msg/msg_0661.h"
#include "msgdata/msg/msg_0662.h"
#include "msgdata/msg/msg_0663.h"
#include "msgdata/msg/msg_0664.h"
#include "msgdata/msg/msg_0665.h"
#include "msgdata/msg/msg_0666.h"
#include "msgdata/msg/msg_0667.h"
#include "msgdata/msg/msg_0669.h"
#include "msgdata/msg/msg_0670.h"
#include "msgdata/msg/msg_0671.h"
#include "msgdata/msg/msg_0672.h"
#include "msgdata/msg/msg_0673.h"
#include "msgdata/msg/msg_0674.h"
#include "msgdata/msg/msg_0675.h"
#include "msgdata/msg/msg_0676.h"
#include "msgdata/msg/msg_0677.h"
#include "msgdata/msg/msg_0678.h"
#include "msgdata/msg/msg_0679.h"
#include "msgdata/msg/msg_0680.h"
#include "msgdata/msg/msg_0681.h"
#include "msgdata/msg/msg_0682.h"
#include "msgdata/msg/msg_0683.h"
#include "msgdata/msg/msg_0684.h"
#include "msgdata/msg/msg_0685.h"
#include "msgdata/msg/msg_0686.h"
#include "msgdata/msg/msg_0687.h"
#include "msgdata/msg/msg_0688.h"
#include "msgdata/msg/msg_0689.h"
#include "msgdata/msg/msg_0690.h"
#include "msgdata/msg/msg_0691.h"
#include "msgdata/msg/msg_0692.h"
#include "msgdata/msg/msg_0693.h"
#include "msgdata/msg/msg_0694.h"
#include "msgdata/msg/msg_0695.h"
#include "msgdata/msg/msg_0696.h"
#include "msgdata/msg/msg_0697.h"
#include "msgdata/msg/msg_0698.h"
#include "msgdata/msg/msg_0699.h"
#include "msgdata/msg/msg_0700.h"
#include "msgdata/msg/msg_0701.h"
#include "msgdata/msg/msg_0702.h"
#include "msgdata/msg/msg_0703.h"
#include "msgdata/msg/msg_0704.h"
#include "msgdata/msg/msg_0705.h"
#include "msgdata/msg/msg_0706.h"
#include "msgdata/msg/msg_0707.h"
#include "msgdata/msg/msg_0708.h"
#include "msgdata/msg/msg_0709.h"
#include "msgdata/msg/msg_0710.h"
#include "msgdata/msg/msg_0711.h"
#include "msgdata/msg/msg_0712.h"
#include "msgdata/msg/msg_0713.h"
#include "msgdata/msg/msg_0714.h"
#include "msgdata/msg/msg_0715.h"
#include "msgdata/msg/msg_0716.h"

// This table contains all 455 phone scripts in the game
// Not all of them are sensible at the same time as each caller has its own gmm bank
// It is unclear why GameFreak designed it this way
// x00: u8 Male player GMM
// x01: u8 Female player GMM
// x02: u16
//    bits 0-3: kind
//    bits 4-15: param0
// x04: u16 param1
//        0: nil
//        1: unused
//        2: flag action: param0=1:set, param0=0:clear; param1=flagId
//        3: rematch
//        4: gift item, param1=itemSetId
//        5: random word, param0=numChoices, param1=baseMsgId
const PhoneCallScriptDef gPhoneCallScriptDef[] = {
    {}, // empty

    // Prof. Elm
    // PHONE_SCRIPT_001
    {
     .msgIds = { msg_0716_00001, msg_0716_00002 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_002
    {
     .msgIds = { msg_0716_00033, msg_0716_00034 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_003
    {
     .msgIds = { msg_0716_00035, msg_0716_00036 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_004
    {
     .msgIds = { msg_0716_00037, msg_0716_00038 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_005
    {
     .msgIds = { msg_0716_00039, msg_0716_00040 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_006
    {
     .msgIds = { msg_0716_00041, msg_0716_00042 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_007
    {
     .msgIds = { msg_0716_00043, msg_0716_00044 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_008
    {
     .msgIds = { msg_0716_00003, msg_0716_00004 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_009
    {
     .msgIds = { msg_0716_00005, msg_0716_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_010
    {
     .msgIds = { msg_0716_00007, msg_0716_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_011
    {
     .msgIds = { msg_0716_00009, msg_0716_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_012
    {
     .msgIds = { msg_0716_00011, msg_0716_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_013
    {
     .msgIds = { msg_0716_00013, msg_0716_00014 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_014
    {
     .msgIds = { msg_0716_00015, msg_0716_00016 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_015
    {
     .msgIds = { msg_0716_00017, msg_0716_00018 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_016
    {
     .msgIds = { msg_0716_00019, msg_0716_00020 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_017
    {
     .msgIds = { msg_0716_00021, msg_0716_00022 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_018
    {
     .msgIds = { msg_0716_00023, msg_0716_00024 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_019
    {
     .msgIds = { msg_0716_00025, msg_0716_00026 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_020
    {
     .msgIds = { msg_0716_00027, msg_0716_00028 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_021
    {
     .msgIds = { msg_0716_00029, msg_0716_00030 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_022
    {
     .msgIds = { msg_0716_00031, msg_0716_00032 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Mother
    // PHONE_SCRIPT_023
    {
     .msgIds = { msg_0664_00001, msg_0664_00002 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_024
    {
     .msgIds = { msg_0664_00003, msg_0664_00003 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_025
    {
     .msgIds = { msg_0664_00005, msg_0664_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_026
    {
     .msgIds = { msg_0664_00006, msg_0664_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_027
    {
     .msgIds = { msg_0664_00029, msg_0664_00029 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_028
    {
     .msgIds = { msg_0664_00022, msg_0664_00022 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Youngster Joey
    // PHONE_SCRIPT_029
    {
     .msgIds = { msg_0675_00006, msg_0675_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_030
    {
     .msgIds = { msg_0675_00007, msg_0675_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_031
    {
     .msgIds = { msg_0675_00008, msg_0675_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_032
    {
     .msgIds = { msg_0675_00009, msg_0675_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_033
    {
     .msgIds = { msg_0675_00010, msg_0675_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_034
    {
     .msgIds = { msg_0675_00011, msg_0675_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_035
    {
     .msgIds = { msg_0675_00012, msg_0675_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bug Catcher Wade
    // PHONE_SCRIPT_036
    {
     .msgIds = { msg_0684_00006, msg_0684_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_037
    {
     .msgIds = { msg_0684_00007, msg_0684_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_038
    {
     .msgIds = { msg_0684_00008, msg_0684_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_039
    {
     .msgIds = { msg_0684_00009, msg_0684_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_040
    {
     .msgIds = { msg_0684_00010, msg_0684_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_041
    {
     .msgIds = { msg_0684_00011, msg_0684_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_042
    {
     .msgIds = { msg_0684_00012, msg_0684_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_043
    {
     .msgIds = { msg_0684_00013, msg_0684_00013 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_CHERI_BERRY,
     },
    // PHONE_SCRIPT_044
    {
     .msgIds = { msg_0684_00014, msg_0684_00014 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_045
    {
     .msgIds = { msg_0684_00015, msg_0684_00016 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Fisherman Ralph
    // PHONE_SCRIPT_046
    {
     .msgIds = { msg_0712_00005, msg_0712_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_047
    {
     .msgIds = { msg_0712_00006, msg_0712_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_048
    {
     .msgIds = { msg_0712_00007, msg_0712_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_049
    {
     .msgIds = { msg_0712_00008, msg_0712_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_050
    {
     .msgIds = { msg_0712_00009, msg_0712_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_051
    {
     .msgIds = { msg_0712_00010, msg_0712_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_052
    {
     .msgIds = { msg_0712_00011, msg_0712_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Picnicker Liz
    // PHONE_SCRIPT_053
    {
     .msgIds = { msg_0680_00005, msg_0680_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_054
    {
     .msgIds = { msg_0680_00006, msg_0680_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_055
    {
     .msgIds = { msg_0680_00007, msg_0680_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_056
    {
     .msgIds = { msg_0680_00021, msg_0680_00021 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_057
    {
     .msgIds = { msg_0680_00019, msg_0680_00019 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_058
    {
     .msgIds = { msg_0680_00020, msg_0680_00020 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_059
    {
     .msgIds = { msg_0680_00008, msg_0680_00008 },
     .scriptType = PHONESCRIPTTYPE_WORD,
     .param0 = 9,
     .param1 = msg_0680_00023,
     },
    // PHONE_SCRIPT_060
    {
     .msgIds = { msg_0680_00022, msg_0680_00022 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Hiker Anthony
    // PHONE_SCRIPT_061
    {
     .msgIds = { msg_0711_00005, msg_0711_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_062
    {
     .msgIds = { msg_0711_00006, msg_0711_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_063
    {
     .msgIds = { msg_0711_00007, msg_0711_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_064
    {
     .msgIds = { msg_0711_00008, msg_0711_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_065
    {
     .msgIds = { msg_0711_00009, msg_0711_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_066
    {
     .msgIds = { msg_0711_00010, msg_0711_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_067
    {
     .msgIds = { msg_0711_00011, msg_0711_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Prof. Oak
    // PHONE_SCRIPT_068
    {
     .msgIds = { msg_0666_00001, msg_0666_00002 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_069
    {
     .msgIds = { msg_0666_00003, msg_0666_00003 },
     .scriptType = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_989,
     },
    // PHONE_SCRIPT_070
    {
     .msgIds = { msg_0666_00004, msg_0666_00004 },
     .scriptType = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_98A,
     },
    // PHONE_SCRIPT_071
    {
     .msgIds = { msg_0666_00005, msg_0666_00005 },
     .scriptType = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_98B,
     },
    // PHONE_SCRIPT_072
    {
     .msgIds = { msg_0666_00006, msg_0666_00006 },
     .scriptType = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_98C,
     },
    // PHONE_SCRIPT_073
    {
     .msgIds = { msg_0666_00007, msg_0666_00007 },
     .scriptType = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_98D,
     },
    // PHONE_SCRIPT_074
    {
     .msgIds = { msg_0666_00008, msg_0666_00008 },
     .scriptType = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_98E,
     },
    // PHONE_SCRIPT_075
    {
     .msgIds = { msg_0666_00009, msg_0666_00009 },
     .scriptType = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_98F,
     },
    // PHONE_SCRIPT_076
    {
     .msgIds = { msg_0666_00010, msg_0666_00010 },
     .scriptType = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_990,
     },
    // PHONE_SCRIPT_077
    {
     .msgIds = { msg_0666_00011, msg_0666_00011 },
     .scriptType = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_991,
     },
    // PHONE_SCRIPT_078
    {
     .msgIds = { msg_0666_00022, msg_0666_00023 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_079
    {
     .msgIds = { msg_0666_00024, msg_0666_00025 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_080
    {
     .msgIds = { msg_0666_00026, msg_0666_00026 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_081
    {
     .msgIds = { msg_0666_00027, msg_0666_00027 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_082
    {
     .msgIds = { msg_0666_00012, msg_0666_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Kurt
    // PHONE_SCRIPT_083
    {
     .msgIds = { msg_0643_00001, msg_0643_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bike Shop
    // PHONE_SCRIPT_084
    {
     .msgIds = { msg_0642_00001, msg_0642_00002 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_085
    {
     .msgIds = { msg_0642_00003, msg_0642_00003 },
     .scriptType = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_984,
     },

    // Black Belt Kenji
    // PHONE_SCRIPT_086
    {
     .msgIds = { msg_0706_00007, msg_0706_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_087
    {
     .msgIds = { msg_0706_00008, msg_0706_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_088
    {
     .msgIds = { msg_0706_00009, msg_0706_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_089
    {
     .msgIds = { msg_0706_00010, msg_0706_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_090
    {
     .msgIds = { msg_0706_00011, msg_0706_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_091
    {
     .msgIds = { msg_0706_00012, msg_0706_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bill
    // PHONE_SCRIPT_092
    {
     .msgIds = { msg_0665_00001, msg_0665_00002 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_093
    {
     .msgIds = { msg_0665_00010, msg_0665_00011 },
     .scriptType = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_985,
     },

    // Day Care Man
    // PHONE_SCRIPT_094
    {
     .msgIds = { msg_0661_00001, msg_0661_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_095
    {
     .msgIds = { msg_0661_00012, msg_0661_00012 },
     .scriptType = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_992,
     },
    // PHONE_SCRIPT_096
    {
     .msgIds = { msg_0661_00013, msg_0661_00013 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Day Care Lady
    // PHONE_SCRIPT_097
    {
     .msgIds = { msg_0660_00001, msg_0660_00002 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Buena
    // PHONE_SCRIPT_098
    {
     .msgIds = { msg_0641_00001, msg_0641_00002 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_099
    {
     .msgIds = { msg_0641_00013, msg_0641_00014 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_100
    {
     .msgIds = { msg_0641_00009, msg_0641_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Ethan
    // PHONE_SCRIPT_101
    {
     .msgIds = { msg_0662_00003, msg_0662_00003 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Lyra
    // PHONE_SCRIPT_102
    {
     .msgIds = { msg_0663_00003, msg_0663_00003 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Falkner
    // PHONE_SCRIPT_103
    {
     .msgIds = { msg_0648_00001, msg_0648_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // School Kid Jack
    // PHONE_SCRIPT_104
    {
     .msgIds = { msg_0704_00006, msg_0704_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_105
    {
     .msgIds = { msg_0704_00007, msg_0704_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_106
    {
     .msgIds = { msg_0704_00008, msg_0704_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_107
    {
     .msgIds = { msg_0704_00009, msg_0704_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_108
    {
     .msgIds = { msg_0704_00010, msg_0704_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_109
    {
     .msgIds = { msg_0704_00021, msg_0704_00021 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_110
    {
     .msgIds = { msg_0704_00022, msg_0704_00023 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_111
    {
     .msgIds = { msg_0704_00024, msg_0704_00024 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // School Kid Chad
    // PHONE_SCRIPT_112
    {
     .msgIds = { msg_0685_00005, msg_0685_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_113
    {
     .msgIds = { msg_0685_00006, msg_0685_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_114
    {
     .msgIds = { msg_0685_00007, msg_0685_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_115
    {
     .msgIds = { msg_0685_00008, msg_0685_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_116
    {
     .msgIds = { msg_0685_00020, msg_0685_00020 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_117
    {
     .msgIds = { msg_0685_00009, msg_0685_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_118
    {
     .msgIds = { msg_0685_00021, msg_0685_00021 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_119
    {
     .msgIds = { msg_0685_00022, msg_0685_00022 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Poké Maniac Brent
    // PHONE_SCRIPT_120
    {
     .msgIds = { msg_0688_00006, msg_0688_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_121
    {
     .msgIds = { msg_0688_00007, msg_0688_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_122
    {
     .msgIds = { msg_0688_00008, msg_0688_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_123
    {
     .msgIds = { msg_0688_00009, msg_0688_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_124
    {
     .msgIds = { msg_0688_00010, msg_0688_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_125
    {
     .msgIds = { msg_0688_00021, msg_0688_00021 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_126
    {
     .msgIds = { msg_0688_00022, msg_0688_00022 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_127
    {
     .msgIds = { msg_0688_00023, msg_0688_00023 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Camper Todd
    // PHONE_SCRIPT_128
    {
     .msgIds = { msg_0713_00005, msg_0713_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_129
    {
     .msgIds = { msg_0713_00006, msg_0713_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_130
    {
     .msgIds = { msg_0713_00007, msg_0713_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_131
    {
     .msgIds = { msg_0713_00008, msg_0713_00008 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_132
    {
     .msgIds = { msg_0713_00009, msg_0713_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_133
    {
     .msgIds = { msg_0713_00010, msg_0713_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bug Catcher Arnie
    // PHONE_SCRIPT_134
    {
     .msgIds = { msg_0714_00005, msg_0714_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_135
    {
     .msgIds = { msg_0714_00006, msg_0714_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_136
    {
     .msgIds = { msg_0714_00007, msg_0714_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_137
    {
     .msgIds = { msg_0714_00008, msg_0714_00008 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_138
    {
     .msgIds = { msg_0714_00009, msg_0714_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_139
    {
     .msgIds = { msg_0714_00010, msg_0714_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Baoba
    // PHONE_SCRIPT_140
    {
     .msgIds = { msg_0667_00001, msg_0667_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_141
    {
     .msgIds = { msg_0667_00002, msg_0667_00003 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_142
    {
     .msgIds = { msg_0667_00004, msg_0667_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_143
    {
     .msgIds = { msg_0667_00006, msg_0667_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_144
    {
     .msgIds = { msg_0667_00008, msg_0667_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_145
    {
     .msgIds = { msg_0667_00010, msg_0667_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_146
    {
     .msgIds = { msg_0667_00012, msg_0667_00013 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_147
    {
     .msgIds = { msg_0667_00026, msg_0667_00027 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_148
    {
     .msgIds = { msg_0667_00028, msg_0667_00029 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_149
    {
     .msgIds = { msg_0667_00030, msg_0667_00031 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_150
    {
     .msgIds = { msg_0667_00032, msg_0667_00033 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_151
    {
     .msgIds = { msg_0667_00034, msg_0667_00035 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_152
    {
     .msgIds = { msg_0667_00036, msg_0667_00037 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_153
    {
     .msgIds = { msg_0667_00038, msg_0667_00039 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_154
    {
     .msgIds = { msg_0667_00040, msg_0667_00041 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Jugger Irwin
    // PHONE_SCRIPT_155
    {
     .msgIds = { msg_0691_00005, msg_0691_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_156
    {
     .msgIds = { msg_0691_00006, msg_0691_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_157
    {
     .msgIds = { msg_0691_00008, msg_0691_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_158
    {
     .msgIds = { msg_0691_00010, msg_0691_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_159
    {
     .msgIds = { msg_0691_00012, msg_0691_00013 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_160
    {
     .msgIds = { msg_0691_00014, msg_0691_00015 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_161
    {
     .msgIds = { msg_0691_00016, msg_0691_00017 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_162
    {
     .msgIds = { msg_0691_00018, msg_0691_00019 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_163
    {
     .msgIds = { msg_0691_00020, msg_0691_00021 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_164
    {
     .msgIds = { msg_0691_00022, msg_0691_00023 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_165
    {
     .msgIds = { msg_0691_00024, msg_0691_00025 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_166
    {
     .msgIds = { msg_0691_00026, msg_0691_00027 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_167
    {
     .msgIds = { msg_0691_00028, msg_0691_00029 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_168
    {
     .msgIds = { msg_0691_00030, msg_0691_00031 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_169
    {
     .msgIds = { msg_0691_00032, msg_0691_00033 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_170
    {
     .msgIds = { msg_0691_00034, msg_0691_00035 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_171
    {
     .msgIds = { msg_0691_00036, msg_0691_00037 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_172
    {
     .msgIds = { msg_0691_00038, msg_0691_00038 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_173
    {
     .msgIds = { msg_0691_00039, msg_0691_00039 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_174
    {
     .msgIds = { msg_0691_00040, msg_0691_00040 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Whitney
    // PHONE_SCRIPT_175
    {
     .msgIds = { msg_0644_00001, msg_0644_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Janine
    // PHONE_SCRIPT_176
    {
     .msgIds = { msg_0645_00001, msg_0645_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Clair
    // PHONE_SCRIPT_177
    {
     .msgIds = { msg_0649_00001, msg_0649_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Erika
    // PHONE_SCRIPT_178
    {
     .msgIds = { msg_0646_00001, msg_0646_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Misty
    // PHONE_SCRIPT_179
    {
     .msgIds = { msg_0650_00001, msg_0650_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Blaine
    // PHONE_SCRIPT_180
    {
     .msgIds = { msg_0651_00001, msg_0651_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Blue
    // PHONE_SCRIPT_181
    {
     .msgIds = { msg_0647_00001, msg_0647_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Chuck
    // PHONE_SCRIPT_182
    {
     .msgIds = { msg_0656_00001, msg_0656_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Brock
    // PHONE_SCRIPT_183
    {
     .msgIds = { msg_0657_00001, msg_0657_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bugsy
    // PHONE_SCRIPT_184
    {
     .msgIds = { msg_0658_00001, msg_0658_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Sabrina
    // PHONE_SCRIPT_185
    {
     .msgIds = { msg_0655_00001, msg_0655_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Lt. Surge
    // PHONE_SCRIPT_186
    {
     .msgIds = { msg_0652_00001, msg_0652_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Morty
    // PHONE_SCRIPT_187
    {
     .msgIds = { msg_0653_00001, msg_0653_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Jasmine
    // PHONE_SCRIPT_188
    {
     .msgIds = { msg_0654_00001, msg_0654_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Pryce
    // PHONE_SCRIPT_189
    {
     .msgIds = { msg_0659_00001, msg_0659_00001 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Sailor Huey
    // PHONE_SCRIPT_190
    {
     .msgIds = { msg_0674_00006, msg_0674_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_191
    {
     .msgIds = { msg_0674_00007, msg_0674_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_192
    {
     .msgIds = { msg_0674_00008, msg_0674_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_193
    {
     .msgIds = { msg_0674_00009, msg_0674_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_194
    {
     .msgIds = { msg_0674_00010, msg_0674_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_195
    {
     .msgIds = { msg_0674_00011, msg_0674_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Ace Trainer Gaven
    // PHONE_SCRIPT_196
    {
     .msgIds = { msg_0705_00006, msg_0705_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_197
    {
     .msgIds = { msg_0705_00007, msg_0705_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_198
    {
     .msgIds = { msg_0705_00008, msg_0705_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_199
    {
     .msgIds = { msg_0705_00009, msg_0705_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_200
    {
     .msgIds = { msg_0705_00010, msg_0705_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_201
    {
     .msgIds = { msg_0705_00011, msg_0705_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_202
    {
     .msgIds = { msg_0705_00013, msg_0705_00013 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Ace Trainer Jamie
    // PHONE_SCRIPT_203
    {
     .msgIds = { msg_0677_00006, msg_0677_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_204
    {
     .msgIds = { msg_0677_00007, msg_0677_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_205
    {
     .msgIds = { msg_0677_00008, msg_0677_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_206
    {
     .msgIds = { msg_0677_00009, msg_0677_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_207
    {
     .msgIds = { msg_0677_00010, msg_0677_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_208
    {
     .msgIds = { msg_0677_00011, msg_0677_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_209
    {
     .msgIds = { msg_0677_00013, msg_0677_00013 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Ace Trainer Reena
    // PHONE_SCRIPT_210
    {
     .msgIds = { msg_0698_00006, msg_0698_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_211
    {
     .msgIds = { msg_0698_00007, msg_0698_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_212
    {
     .msgIds = { msg_0698_00008, msg_0698_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_213
    {
     .msgIds = { msg_0698_00009, msg_0698_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_214
    {
     .msgIds = { msg_0698_00010, msg_0698_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_215
    {
     .msgIds = { msg_0698_00011, msg_0698_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_216
    {
     .msgIds = { msg_0698_00012, msg_0698_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bird Keeper Vance
    // PHONE_SCRIPT_217
    {
     .msgIds = { msg_0696_00006, msg_0696_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_218
    {
     .msgIds = { msg_0696_00007, msg_0696_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_219
    {
     .msgIds = { msg_0696_00008, msg_0696_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_220
    {
     .msgIds = { msg_0696_00009, msg_0696_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_221
    {
     .msgIds = { msg_0696_00010, msg_0696_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_222
    {
     .msgIds = { msg_0696_00012, msg_0696_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Hiker Parry
    // PHONE_SCRIPT_223
    {
     .msgIds = { msg_0708_00006, msg_0708_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_224
    {
     .msgIds = { msg_0708_00007, msg_0708_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_225
    {
     .msgIds = { msg_0708_00008, msg_0708_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_226
    {
     .msgIds = { msg_0708_00009, msg_0708_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_227
    {
     .msgIds = { msg_0708_00010, msg_0708_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_228
    {
     .msgIds = { msg_0708_00011, msg_0708_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Picnicker Erin
    // PHONE_SCRIPT_229
    {
     .msgIds = { msg_0672_00006, msg_0672_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_230
    {
     .msgIds = { msg_0672_00007, msg_0672_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_231
    {
     .msgIds = { msg_0672_00008, msg_0672_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_232
    {
     .msgIds = { msg_0672_00009, msg_0672_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_233
    {
     .msgIds = { msg_0672_00010, msg_0672_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_234
    {
     .msgIds = { msg_0672_00011, msg_0672_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_235
    {
     .msgIds = { msg_0672_00012, msg_0672_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Pokefan Beverly
    // PHONE_SCRIPT_236
    {
     .msgIds = { msg_0690_00006, msg_0690_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_237
    {
     .msgIds = { msg_0690_00007, msg_0690_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_238
    {
     .msgIds = { msg_0690_00008, msg_0690_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_239
    {
     .msgIds = { msg_0690_00011, msg_0690_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_240
    {
     .msgIds = { msg_0690_00009, msg_0690_00009 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_NUGGET,
     },
    // PHONE_SCRIPT_241
    {
     .msgIds = { msg_0690_00010, msg_0690_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bird Keeper Jose
    // PHONE_SCRIPT_242
    {
     .msgIds = { msg_0671_00006, msg_0671_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_243
    {
     .msgIds = { msg_0671_00007, msg_0671_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_244
    {
     .msgIds = { msg_0671_00008, msg_0671_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_245
    {
     .msgIds = { msg_0671_00009, msg_0671_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_246
    {
     .msgIds = { msg_0671_00010, msg_0671_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_247
    {
     .msgIds = { msg_0671_00011, msg_0671_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_248
    {
     .msgIds = { msg_0671_00013, msg_0671_00013 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_249
    {
     .msgIds = { msg_0671_00014, msg_0671_00014 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_STAR_PIECE,
     },
    // PHONE_SCRIPT_250
    {
     .msgIds = { msg_0671_00015, msg_0671_00015 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Picnicker Gina
    // PHONE_SCRIPT_251
    {
     .msgIds = { msg_0695_00006, msg_0695_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_252
    {
     .msgIds = { msg_0695_00007, msg_0695_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_253
    {
     .msgIds = { msg_0695_00008, msg_0695_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_254
    {
     .msgIds = { msg_0695_00009, msg_0695_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_255
    {
     .msgIds = { msg_0695_00010, msg_0695_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_256
    {
     .msgIds = { msg_0695_00012, msg_0695_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_257
    {
     .msgIds = { msg_0695_00013, msg_0695_00013 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_LEAF_STONE,
     },
    // PHONE_SCRIPT_258
    {
     .msgIds = { msg_0695_00014, msg_0695_00014 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_259
    {
     .msgIds = { msg_0695_00015, msg_0695_00015 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // School Kid Alan
    // PHONE_SCRIPT_260
    {
     .msgIds = { msg_0689_00006, msg_0689_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_261
    {
     .msgIds = { msg_0689_00007, msg_0689_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_262
    {
     .msgIds = { msg_0689_00008, msg_0689_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_263
    {
     .msgIds = { msg_0689_00009, msg_0689_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_264
    {
     .msgIds = { msg_0689_00010, msg_0689_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_265
    {
     .msgIds = { msg_0689_00011, msg_0689_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_266
    {
     .msgIds = { msg_0689_00012, msg_0689_00012 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_FIRE_STONE,
     },
    // PHONE_SCRIPT_267
    {
     .msgIds = { msg_0689_00013, msg_0689_00013 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Lass Dana
    // PHONE_SCRIPT_268
    {
     .msgIds = { msg_0700_00006, msg_0700_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_269
    {
     .msgIds = { msg_0700_00007, msg_0700_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_270
    {
     .msgIds = { msg_0700_00008, msg_0700_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_271
    {
     .msgIds = { msg_0700_00009, msg_0700_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_272
    {
     .msgIds = { msg_0700_00010, msg_0700_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_273
    {
     .msgIds = { msg_0700_00011, msg_0700_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_274
    {
     .msgIds = { msg_0700_00012, msg_0700_00012 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_THUNDERSTONE,
     },
    // PHONE_SCRIPT_275
    {
     .msgIds = { msg_0700_00013, msg_0700_00013 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Pokefan Derek
    // PHONE_SCRIPT_276
    {
     .msgIds = { msg_0693_00006, msg_0693_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_277
    {
     .msgIds = { msg_0693_00007, msg_0693_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_278
    {
     .msgIds = { msg_0693_00008, msg_0693_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_279
    {
     .msgIds = { msg_0693_00009, msg_0693_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_280
    {
     .msgIds = { msg_0693_00010, msg_0693_00010 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_NUGGET,
     },
    // PHONE_SCRIPT_281
    {
     .msgIds = { msg_0693_00011, msg_0693_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_282
    {
     .msgIds = { msg_0693_00012, msg_0693_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Fisherman Tully
    // PHONE_SCRIPT_283
    {
     .msgIds = { msg_0694_00006, msg_0694_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_284
    {
     .msgIds = { msg_0694_00007, msg_0694_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_285
    {
     .msgIds = { msg_0694_00008, msg_0694_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_286
    {
     .msgIds = { msg_0694_00009, msg_0694_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_287
    {
     .msgIds = { msg_0694_00010, msg_0694_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_288
    {
     .msgIds = { msg_0694_00011, msg_0694_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_289
    {
     .msgIds = { msg_0694_00012, msg_0694_00012 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_WATER_STONE,
     },
    // PHONE_SCRIPT_290
    {
     .msgIds = { msg_0694_00013, msg_0694_00013 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Picnicker Tiffany
    // PHONE_SCRIPT_291
    {
     .msgIds = { msg_0669_00006, msg_0669_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_292
    {
     .msgIds = { msg_0669_00009, msg_0669_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_293
    {
     .msgIds = { msg_0669_00010, msg_0669_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_294
    {
     .msgIds = { msg_0669_00011, msg_0669_00011 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_295
    {
     .msgIds = { msg_0669_00012, msg_0669_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_296
    {
     .msgIds = { msg_0669_00007, msg_0669_00008 },
     .scriptType = PHONESCRIPTTYPE_WORD,
     .param0 = 6,
     .param1 = msg_0669_00016,
     },
    // PHONE_SCRIPT_297
    {
     .msgIds = { msg_0669_00013, msg_0669_00013 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_298
    {
     .msgIds = { msg_0669_00014, msg_0669_00014 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_POKE_DOLL,
     },
    // PHONE_SCRIPT_299
    {
     .msgIds = { msg_0669_00015, msg_0669_00015 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Fisherman Wilton
    // PHONE_SCRIPT_300
    {
     .msgIds = { msg_0676_00006, msg_0676_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_301
    {
     .msgIds = { msg_0676_00007, msg_0676_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_302
    {
     .msgIds = { msg_0676_00008, msg_0676_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_303
    {
     .msgIds = { msg_0676_00009, msg_0676_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_304
    {
     .msgIds = { msg_0676_00010, msg_0676_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_305
    {
     .msgIds = { msg_0676_00011, msg_0676_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_306
    {
     .msgIds = { msg_0676_00012, msg_0676_00012 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_POKE_BALL,
     },
    // PHONE_SCRIPT_307
    {
     .msgIds = { msg_0676_00013, msg_0676_00013 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Lass Krise
    // PHONE_SCRIPT_308
    {
     .msgIds = { msg_0715_00005, msg_0715_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_309
    {
     .msgIds = { msg_0715_00006, msg_0715_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_310
    {
     .msgIds = { msg_0715_00007, msg_0715_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_311
    {
     .msgIds = { msg_0715_00008, msg_0715_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_312
    {
     .msgIds = { msg_0715_00009, msg_0715_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_313
    {
     .msgIds = { msg_0715_00010, msg_0715_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_314
    {
     .msgIds = { msg_0715_00011, msg_0715_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Youngster Ian
    // PHONE_SCRIPT_315
    {
     .msgIds = { msg_0703_00006, msg_0703_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_316
    {
     .msgIds = { msg_0703_00007, msg_0703_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_317
    {
     .msgIds = { msg_0703_00008, msg_0703_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_318
    {
     .msgIds = { msg_0703_00009, msg_0703_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_319
    {
     .msgIds = { msg_0703_00010, msg_0703_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_320
    {
     .msgIds = { msg_0703_00011, msg_0703_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_321
    {
     .msgIds = { msg_0703_00012, msg_0703_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Firebreather Walt
    // PHONE_SCRIPT_322
    {
     .msgIds = { msg_0710_00005, msg_0710_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_323
    {
     .msgIds = { msg_0710_00006, msg_0710_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_324
    {
     .msgIds = { msg_0710_00007, msg_0710_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_325
    {
     .msgIds = { msg_0710_00008, msg_0710_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_326
    {
     .msgIds = { msg_0710_00009, msg_0710_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_327
    {
     .msgIds = { msg_0710_00010, msg_0710_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_328
    {
     .msgIds = { msg_0710_00011, msg_0710_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_329
    {
     .msgIds = { msg_0710_00012, msg_0710_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Gentleman Alfred
    // PHONE_SCRIPT_330
    {
     .msgIds = { msg_0670_00005, msg_0670_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_331
    {
     .msgIds = { msg_0670_00006, msg_0670_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_332
    {
     .msgIds = { msg_0670_00007, msg_0670_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_333
    {
     .msgIds = { msg_0670_00008, msg_0670_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_334
    {
     .msgIds = { msg_0670_00009, msg_0670_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_335
    {
     .msgIds = { msg_0670_00010, msg_0670_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_336
    {
     .msgIds = { msg_0670_00011, msg_0670_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bug Catcher Doug
    // PHONE_SCRIPT_337
    {
     .msgIds = { msg_0692_00006, msg_0692_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_338
    {
     .msgIds = { msg_0692_00007, msg_0692_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_339
    {
     .msgIds = { msg_0692_00008, msg_0692_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_340
    {
     .msgIds = { msg_0692_00009, msg_0692_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_341
    {
     .msgIds = { msg_0692_00010, msg_0692_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_342
    {
     .msgIds = { msg_0692_00011, msg_0692_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_343
    {
     .msgIds = { msg_0692_00012, msg_0692_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_344
    {
     .msgIds = { msg_0692_00013, msg_0692_00013 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_CHERI_BERRY,
     },
    // PHONE_SCRIPT_345
    {
     .msgIds = { msg_0692_00014, msg_0692_00014 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bug Catcher Rob
    // PHONE_SCRIPT_346
    {
     .msgIds = { msg_0681_00006, msg_0681_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_347
    {
     .msgIds = { msg_0681_00007, msg_0681_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_348
    {
     .msgIds = { msg_0681_00008, msg_0681_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_349
    {
     .msgIds = { msg_0681_00009, msg_0681_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_350
    {
     .msgIds = { msg_0681_00010, msg_0681_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_351
    {
     .msgIds = { msg_0681_00011, msg_0681_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_352
    {
     .msgIds = { msg_0681_00012, msg_0681_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_353
    {
     .msgIds = { msg_0681_00013, msg_0681_00013 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_CHERI_BERRY,
     },
    // PHONE_SCRIPT_354
    {
     .msgIds = { msg_0681_00014, msg_0681_00014 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Fisherman Kyle
    // PHONE_SCRIPT_355
    {
     .msgIds = { msg_0697_00005, msg_0697_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_356
    {
     .msgIds = { msg_0697_00006, msg_0697_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_357
    {
     .msgIds = { msg_0697_00007, msg_0697_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_358
    {
     .msgIds = { msg_0697_00008, msg_0697_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_359
    {
     .msgIds = { msg_0697_00009, msg_0697_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_360
    {
     .msgIds = { msg_0697_00010, msg_0697_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_361
    {
     .msgIds = { msg_0697_00011, msg_0697_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Fisherman Kyler
    // PHONE_SCRIPT_362
    {
     .msgIds = { msg_0687_00005, msg_0687_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_363
    {
     .msgIds = { msg_0687_00006, msg_0687_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_364
    {
     .msgIds = { msg_0687_00007, msg_0687_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_365
    {
     .msgIds = { msg_0687_00008, msg_0687_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_366
    {
     .msgIds = { msg_0687_00009, msg_0687_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_367
    {
     .msgIds = { msg_0687_00010, msg_0687_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_368
    {
     .msgIds = { msg_0687_00011, msg_0687_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Young Couple Tim & Sue
    // PHONE_SCRIPT_369
    {
     .msgIds = { msg_0702_00005, msg_0702_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_370
    {
     .msgIds = { msg_0702_00006, msg_0702_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_371
    {
     .msgIds = { msg_0702_00007, msg_0702_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_372
    {
     .msgIds = { msg_0702_00008, msg_0702_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_373
    {
     .msgIds = { msg_0702_00009, msg_0702_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_374
    {
     .msgIds = { msg_0702_00010, msg_0702_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_375
    {
     .msgIds = { msg_0702_00011, msg_0702_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Hiker Kenny
    // PHONE_SCRIPT_376
    {
     .msgIds = { msg_0699_00005, msg_0699_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_377
    {
     .msgIds = { msg_0699_00006, msg_0699_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_378
    {
     .msgIds = { msg_0699_00007, msg_0699_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_379
    {
     .msgIds = { msg_0699_00008, msg_0699_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_380
    {
     .msgIds = { msg_0699_00009, msg_0699_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_381
    {
     .msgIds = { msg_0699_00010, msg_0699_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_382
    {
     .msgIds = { msg_0699_00011, msg_0699_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Camper Tanner
    // PHONE_SCRIPT_383
    {
     .msgIds = { msg_0707_00006, msg_0707_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_384
    {
     .msgIds = { msg_0707_00007, msg_0707_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_385
    {
     .msgIds = { msg_0707_00008, msg_0707_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_386
    {
     .msgIds = { msg_0707_00009, msg_0707_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_387
    {
     .msgIds = { msg_0707_00010, msg_0707_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_388
    {
     .msgIds = { msg_0707_00011, msg_0707_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_389
    {
     .msgIds = { msg_0707_00012, msg_0707_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_390
    {
     .msgIds = { msg_0707_00013, msg_0707_00013 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_SUN_STONE,
     },
    // PHONE_SCRIPT_391
    {
     .msgIds = { msg_0707_00014, msg_0707_00014 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bird Keeper Josh
    // PHONE_SCRIPT_392
    {
     .msgIds = { msg_0682_00006, msg_0682_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_393
    {
     .msgIds = { msg_0682_00007, msg_0682_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_394
    {
     .msgIds = { msg_0682_00008, msg_0682_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_395
    {
     .msgIds = { msg_0682_00009, msg_0682_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_396
    {
     .msgIds = { msg_0682_00010, msg_0682_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_397
    {
     .msgIds = { msg_0682_00011, msg_0682_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_398
    {
     .msgIds = { msg_0682_00012, msg_0682_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_399
    {
     .msgIds = { msg_0682_00013, msg_0682_00013 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_SHINY_STONE,
     },
    // PHONE_SCRIPT_400
    {
     .msgIds = { msg_0682_00014, msg_0682_00014 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // School Kid Torin
    // PHONE_SCRIPT_401
    {
     .msgIds = { msg_0673_00005, msg_0673_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_402
    {
     .msgIds = { msg_0673_00006, msg_0673_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_403
    {
     .msgIds = { msg_0673_00007, msg_0673_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_404
    {
     .msgIds = { msg_0673_00008, msg_0673_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_405
    {
     .msgIds = { msg_0673_00009, msg_0673_00009 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_406
    {
     .msgIds = { msg_0673_00010, msg_0673_00010 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_407
    {
     .msgIds = { msg_0673_00011, msg_0673_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Teacher Hillary
    // PHONE_SCRIPT_408
    {
     .msgIds = { msg_0686_00005, msg_0686_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_409
    {
     .msgIds = { msg_0686_00006, msg_0686_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_410
    {
     .msgIds = { msg_0686_00007, msg_0686_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_411
    {
     .msgIds = { msg_0686_00008, msg_0686_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_412
    {
     .msgIds = { msg_0686_00009, msg_0686_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_413
    {
     .msgIds = { msg_0686_00010, msg_0686_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_414
    {
     .msgIds = { msg_0686_00011, msg_0686_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_415
    {
     .msgIds = { msg_0686_00012, msg_0686_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // School Kid Billy
    // PHONE_SCRIPT_416
    {
     .msgIds = { msg_0683_00005, msg_0683_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_417
    {
     .msgIds = { msg_0683_00006, msg_0683_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_418
    {
     .msgIds = { msg_0683_00017, msg_0683_00017 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_419
    {
     .msgIds = { msg_0683_00018, msg_0683_00018 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_420
    {
     .msgIds = { msg_0683_00019, msg_0683_00019 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Twins Kay & Tia
    // PHONE_SCRIPT_421
    {
     .msgIds = { msg_0679_00006, msg_0679_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_422
    {
     .msgIds = { msg_0679_00007, msg_0679_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_423
    {
     .msgIds = { msg_0679_00008, msg_0679_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_424
    {
     .msgIds = { msg_0679_00009, msg_0679_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_425
    {
     .msgIds = { msg_0679_00010, msg_0679_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_426
    {
     .msgIds = { msg_0679_00011, msg_0679_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_427
    {
     .msgIds = { msg_0679_00012, msg_0679_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_428
    {
     .msgIds = { msg_0679_00013, msg_0679_00013 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_OVAL_STONE,
     },
    // PHONE_SCRIPT_429
    {
     .msgIds = { msg_0679_00014, msg_0679_00014 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Biker Reese
    // PHONE_SCRIPT_430
    {
     .msgIds = { msg_0701_00006, msg_0701_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_431
    {
     .msgIds = { msg_0701_00007, msg_0701_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_432
    {
     .msgIds = { msg_0701_00008, msg_0701_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_433
    {
     .msgIds = { msg_0701_00009, msg_0701_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_434
    {
     .msgIds = { msg_0701_00010, msg_0701_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_435
    {
     .msgIds = { msg_0701_00011, msg_0701_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_436
    {
     .msgIds = { msg_0701_00012, msg_0701_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_437
    {
     .msgIds = { msg_0701_00013, msg_0701_00013 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_DUSK_STONE,
     },
    // PHONE_SCRIPT_438
    {
     .msgIds = { msg_0701_00014, msg_0701_00014 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Biker Aiden
    // PHONE_SCRIPT_439
    {
     .msgIds = { msg_0709_00006, msg_0709_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_440
    {
     .msgIds = { msg_0709_00007, msg_0709_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_441
    {
     .msgIds = { msg_0709_00008, msg_0709_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_442
    {
     .msgIds = { msg_0709_00009, msg_0709_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_443
    {
     .msgIds = { msg_0709_00010, msg_0709_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_444
    {
     .msgIds = { msg_0709_00011, msg_0709_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_445
    {
     .msgIds = { msg_0709_00012, msg_0709_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_446
    {
     .msgIds = { msg_0709_00013, msg_0709_00013 },
     .scriptType = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_DAWN_STONE,
     },
    // PHONE_SCRIPT_447
    {
     .msgIds = { msg_0709_00014, msg_0709_00014 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Biker Ernest
    // PHONE_SCRIPT_448
    {
     .msgIds = { msg_0678_00005, msg_0678_00005 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_449
    {
     .msgIds = { msg_0678_00006, msg_0678_00006 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_450
    {
     .msgIds = { msg_0678_00007, msg_0678_00007 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_451
    {
     .msgIds = { msg_0678_00008, msg_0678_00008 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_452
    {
     .msgIds = { msg_0678_00009, msg_0678_00009 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_453
    {
     .msgIds = { msg_0678_00010, msg_0678_00010 },
     .scriptType = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    // PHONE_SCRIPT_454
    {
     .msgIds = { msg_0678_00011, msg_0678_00011 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    // PHONE_SCRIPT_455
    {
     .msgIds = { msg_0678_00012, msg_0678_00012 },
     .scriptType = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
};
