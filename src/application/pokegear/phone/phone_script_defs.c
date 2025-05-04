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
//        1: flag action: param0=1 set param0=1 clear, param1=flagId
//        2: same as 1
//        3: rematch
//        4: gift item, param1=itemSetId
//        5: random word, param0=numChoices, param1=baseMsgId
const PhoneCallScriptDef gPhoneCallScriptDef[] = {
    {}, // empty

    // Prof. Elm
    {
     .msgIds = { msg_0716_00001, msg_0716_00002 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00033, msg_0716_00034 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00035, msg_0716_00036 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00037, msg_0716_00038 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00039, msg_0716_00040 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00041, msg_0716_00042 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00043, msg_0716_00044 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00003, msg_0716_00004 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00005, msg_0716_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00007, msg_0716_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00009, msg_0716_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00011, msg_0716_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00013, msg_0716_00014 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00015, msg_0716_00016 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00017, msg_0716_00018 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00019, msg_0716_00020 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00021, msg_0716_00022 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00023, msg_0716_00024 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00025, msg_0716_00026 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00027, msg_0716_00028 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00029, msg_0716_00030 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0716_00031, msg_0716_00032 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Mother
    {
     .msgIds = { msg_0664_00001, msg_0664_00002 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0664_00003, msg_0664_00003 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0664_00005, msg_0664_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0664_00006, msg_0664_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0664_00029, msg_0664_00029 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0664_00022, msg_0664_00022 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Youngster Joey
    {
     .msgIds = { msg_0675_00006, msg_0675_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0675_00007, msg_0675_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0675_00008, msg_0675_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0675_00009, msg_0675_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0675_00010, msg_0675_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0675_00011, msg_0675_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0675_00012, msg_0675_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bug Catcher Wade
    {
     .msgIds = { msg_0684_00006, msg_0684_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0684_00007, msg_0684_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0684_00008, msg_0684_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0684_00009, msg_0684_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0684_00010, msg_0684_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0684_00011, msg_0684_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0684_00012, msg_0684_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0684_00013, msg_0684_00013 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_CHERI_BERRY,
     },
    {
     .msgIds = { msg_0684_00014, msg_0684_00014 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0684_00015, msg_0684_00016 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Fisherman Ralph
    {
     .msgIds = { msg_0712_00005, msg_0712_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0712_00006, msg_0712_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0712_00007, msg_0712_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0712_00008, msg_0712_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0712_00009, msg_0712_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0712_00010, msg_0712_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0712_00011, msg_0712_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Picnicker Liz
    {
     .msgIds = { msg_0680_00005, msg_0680_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0680_00006, msg_0680_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0680_00007, msg_0680_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0680_00021, msg_0680_00021 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0680_00019, msg_0680_00019 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0680_00020, msg_0680_00020 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0680_00008, msg_0680_00008 },
     .kind = PHONESCRIPTTYPE_WORD,
     .param0 = 9,
     .param1 = msg_0680_00023,
     },
    {
     .msgIds = { msg_0680_00022, msg_0680_00022 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Hiker Anthony
    {
     .msgIds = { msg_0711_00005, msg_0711_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0711_00006, msg_0711_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0711_00007, msg_0711_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0711_00008, msg_0711_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0711_00009, msg_0711_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0711_00010, msg_0711_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0711_00011, msg_0711_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Prof. Oak
    {
     .msgIds = { msg_0666_00001, msg_0666_00002 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0666_00003, msg_0666_00003 },
     .kind = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_989,
     },
    {
     .msgIds = { msg_0666_00004, msg_0666_00004 },
     .kind = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_98A,
     },
    {
     .msgIds = { msg_0666_00005, msg_0666_00005 },
     .kind = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_98B,
     },
    {
     .msgIds = { msg_0666_00006, msg_0666_00006 },
     .kind = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_98C,
     },
    {
     .msgIds = { msg_0666_00007, msg_0666_00007 },
     .kind = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_98D,
     },
    {
     .msgIds = { msg_0666_00008, msg_0666_00008 },
     .kind = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_98E,
     },
    {
     .msgIds = { msg_0666_00009, msg_0666_00009 },
     .kind = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_98F,
     },
    {
     .msgIds = { msg_0666_00010, msg_0666_00010 },
     .kind = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_990,
     },
    {
     .msgIds = { msg_0666_00011, msg_0666_00011 },
     .kind = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_991,
     },
    {
     .msgIds = { msg_0666_00022, msg_0666_00023 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0666_00024, msg_0666_00025 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0666_00026, msg_0666_00026 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0666_00027, msg_0666_00027 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0666_00012, msg_0666_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Kurt
    {
     .msgIds = { msg_0643_00001, msg_0643_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bike Shop
    {
     .msgIds = { msg_0642_00001, msg_0642_00002 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0642_00003, msg_0642_00003 },
     .kind = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_984,
     },

    // Black Belt Kenji
    {
     .msgIds = { msg_0706_00007, msg_0706_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0706_00008, msg_0706_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0706_00009, msg_0706_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0706_00010, msg_0706_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0706_00011, msg_0706_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0706_00012, msg_0706_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bill
    {
     .msgIds = { msg_0665_00001, msg_0665_00002 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0665_00010, msg_0665_00011 },
     .kind = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_985,
     },

    // Day Care Man
    {
     .msgIds = { msg_0661_00001, msg_0661_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0661_00012, msg_0661_00012 },
     .kind = PHONESCRIPTTYPE_FLAG,
     .param0 = 1,
     .param1 = FLAG_UNK_992,
     },
    {
     .msgIds = { msg_0661_00013, msg_0661_00013 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Day Care Lady
    {
     .msgIds = { msg_0660_00001, msg_0660_00002 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Buena
    {
     .msgIds = { msg_0641_00001, msg_0641_00002 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0641_00013, msg_0641_00014 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0641_00009, msg_0641_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Ethan
    {
     .msgIds = { msg_0662_00003, msg_0662_00003 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Lyra
    {
     .msgIds = { msg_0663_00003, msg_0663_00003 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Falkner
    {
     .msgIds = { msg_0648_00001, msg_0648_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // School Kid Jack
    {
     .msgIds = { msg_0704_00006, msg_0704_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0704_00007, msg_0704_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0704_00008, msg_0704_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0704_00009, msg_0704_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0704_00010, msg_0704_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0704_00021, msg_0704_00021 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0704_00022, msg_0704_00023 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0704_00024, msg_0704_00024 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // School Kid Chad
    {
     .msgIds = { msg_0685_00005, msg_0685_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0685_00006, msg_0685_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0685_00007, msg_0685_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0685_00008, msg_0685_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0685_00020, msg_0685_00020 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0685_00009, msg_0685_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0685_00021, msg_0685_00021 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0685_00022, msg_0685_00022 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Poké Maniac Brent
    {
     .msgIds = { msg_0688_00006, msg_0688_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0688_00007, msg_0688_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0688_00008, msg_0688_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0688_00009, msg_0688_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0688_00010, msg_0688_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0688_00021, msg_0688_00021 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0688_00022, msg_0688_00022 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0688_00023, msg_0688_00023 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Camper Todd
    {
     .msgIds = { msg_0713_00005, msg_0713_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0713_00006, msg_0713_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0713_00007, msg_0713_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0713_00008, msg_0713_00008 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0713_00009, msg_0713_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0713_00010, msg_0713_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bug Catcher Arnie
    {
     .msgIds = { msg_0714_00005, msg_0714_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0714_00006, msg_0714_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0714_00007, msg_0714_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0714_00008, msg_0714_00008 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0714_00009, msg_0714_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0714_00010, msg_0714_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Baoba
    {
     .msgIds = { msg_0667_00001, msg_0667_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0667_00002, msg_0667_00003 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0667_00004, msg_0667_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0667_00006, msg_0667_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0667_00008, msg_0667_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0667_00010, msg_0667_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0667_00012, msg_0667_00013 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0667_00026, msg_0667_00027 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0667_00028, msg_0667_00029 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0667_00030, msg_0667_00031 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0667_00032, msg_0667_00033 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0667_00034, msg_0667_00035 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0667_00036, msg_0667_00037 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0667_00038, msg_0667_00039 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0667_00040, msg_0667_00041 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Jugger Irwin
    {
     .msgIds = { msg_0691_00005, msg_0691_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00006, msg_0691_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00008, msg_0691_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00010, msg_0691_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00012, msg_0691_00013 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00014, msg_0691_00015 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00016, msg_0691_00017 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00018, msg_0691_00019 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00020, msg_0691_00021 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00022, msg_0691_00023 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00024, msg_0691_00025 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00026, msg_0691_00027 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00028, msg_0691_00029 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00030, msg_0691_00031 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00032, msg_0691_00033 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00034, msg_0691_00035 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00036, msg_0691_00037 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00038, msg_0691_00038 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00039, msg_0691_00039 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0691_00040, msg_0691_00040 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Whitney
    {
     .msgIds = { msg_0644_00001, msg_0644_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Janine
    {
     .msgIds = { msg_0645_00001, msg_0645_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Clair
    {
     .msgIds = { msg_0649_00001, msg_0649_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Erika
    {
     .msgIds = { msg_0646_00001, msg_0646_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Misty
    {
     .msgIds = { msg_0650_00001, msg_0650_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Blaine
    {
     .msgIds = { msg_0651_00001, msg_0651_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Blue
    {
     .msgIds = { msg_0647_00001, msg_0647_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Chuck
    {
     .msgIds = { msg_0656_00001, msg_0656_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Brock
    {
     .msgIds = { msg_0657_00001, msg_0657_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bugsy
    {
     .msgIds = { msg_0658_00001, msg_0658_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Sabrina
    {
     .msgIds = { msg_0655_00001, msg_0655_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Lt. Surge
    {
     .msgIds = { msg_0652_00001, msg_0652_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Morty
    {
     .msgIds = { msg_0653_00001, msg_0653_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Jasmine
    {
     .msgIds = { msg_0654_00001, msg_0654_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Pryce
    {
     .msgIds = { msg_0659_00001, msg_0659_00001 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Sailor Huey
    {
     .msgIds = { msg_0674_00006, msg_0674_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0674_00007, msg_0674_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0674_00008, msg_0674_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0674_00009, msg_0674_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0674_00010, msg_0674_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0674_00011, msg_0674_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Ace Trainer Gaven
    {
     .msgIds = { msg_0705_00006, msg_0705_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0705_00007, msg_0705_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0705_00008, msg_0705_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0705_00009, msg_0705_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0705_00010, msg_0705_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0705_00011, msg_0705_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0705_00013, msg_0705_00013 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Ace Trainer Jamie
    {
     .msgIds = { msg_0677_00006, msg_0677_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0677_00007, msg_0677_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0677_00008, msg_0677_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0677_00009, msg_0677_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0677_00010, msg_0677_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0677_00011, msg_0677_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0677_00013, msg_0677_00013 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Ace Trainer Reena
    {
     .msgIds = { msg_0698_00006, msg_0698_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0698_00007, msg_0698_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0698_00008, msg_0698_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0698_00009, msg_0698_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0698_00010, msg_0698_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0698_00011, msg_0698_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0698_00012, msg_0698_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bird Keeper Vance
    {
     .msgIds = { msg_0696_00006, msg_0696_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0696_00007, msg_0696_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0696_00008, msg_0696_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0696_00009, msg_0696_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0696_00010, msg_0696_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0696_00012, msg_0696_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Hiker Parry
    {
     .msgIds = { msg_0708_00006, msg_0708_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0708_00007, msg_0708_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0708_00008, msg_0708_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0708_00009, msg_0708_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0708_00010, msg_0708_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0708_00011, msg_0708_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Picnicker Erin
    {
     .msgIds = { msg_0672_00006, msg_0672_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0672_00007, msg_0672_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0672_00008, msg_0672_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0672_00009, msg_0672_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0672_00010, msg_0672_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0672_00011, msg_0672_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0672_00012, msg_0672_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Pokefan Beverly
    {
     .msgIds = { msg_0690_00006, msg_0690_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0690_00007, msg_0690_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0690_00008, msg_0690_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0690_00011, msg_0690_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0690_00009, msg_0690_00009 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_NUGGET,
     },
    {
     .msgIds = { msg_0690_00010, msg_0690_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bird Keeper Jose
    {
     .msgIds = { msg_0671_00006, msg_0671_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0671_00007, msg_0671_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0671_00008, msg_0671_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0671_00009, msg_0671_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0671_00010, msg_0671_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0671_00011, msg_0671_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0671_00013, msg_0671_00013 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0671_00014, msg_0671_00014 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_STAR_PIECE,
     },
    {
     .msgIds = { msg_0671_00015, msg_0671_00015 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Picnicker Gina
    {
     .msgIds = { msg_0695_00006, msg_0695_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0695_00007, msg_0695_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0695_00008, msg_0695_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0695_00009, msg_0695_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0695_00010, msg_0695_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0695_00012, msg_0695_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0695_00013, msg_0695_00013 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_LEAF_STONE,
     },
    {
     .msgIds = { msg_0695_00014, msg_0695_00014 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0695_00015, msg_0695_00015 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // School Kid Alan
    {
     .msgIds = { msg_0689_00006, msg_0689_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0689_00007, msg_0689_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0689_00008, msg_0689_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0689_00009, msg_0689_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0689_00010, msg_0689_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0689_00011, msg_0689_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0689_00012, msg_0689_00012 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_FIRE_STONE,
     },
    {
     .msgIds = { msg_0689_00013, msg_0689_00013 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Lass Dana
    {
     .msgIds = { msg_0700_00006, msg_0700_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0700_00007, msg_0700_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0700_00008, msg_0700_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0700_00009, msg_0700_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0700_00010, msg_0700_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0700_00011, msg_0700_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0700_00012, msg_0700_00012 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_THUNDERSTONE,
     },
    {
     .msgIds = { msg_0700_00013, msg_0700_00013 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Pokefan Derek
    {
     .msgIds = { msg_0693_00006, msg_0693_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0693_00007, msg_0693_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0693_00008, msg_0693_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0693_00009, msg_0693_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0693_00010, msg_0693_00010 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_NUGGET,
     },
    {
     .msgIds = { msg_0693_00011, msg_0693_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0693_00012, msg_0693_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Fisherman Tully
    {
     .msgIds = { msg_0694_00006, msg_0694_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0694_00007, msg_0694_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0694_00008, msg_0694_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0694_00009, msg_0694_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0694_00010, msg_0694_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0694_00011, msg_0694_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0694_00012, msg_0694_00012 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_WATER_STONE,
     },
    {
     .msgIds = { msg_0694_00013, msg_0694_00013 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Picnicker Tiffany
    {
     .msgIds = { msg_0669_00006, msg_0669_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0669_00009, msg_0669_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0669_00010, msg_0669_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0669_00011, msg_0669_00011 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0669_00012, msg_0669_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0669_00007, msg_0669_00008 },
     .kind = PHONESCRIPTTYPE_WORD,
     .param0 = 6,
     .param1 = msg_0669_00016,
     },
    {
     .msgIds = { msg_0669_00013, msg_0669_00013 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0669_00014, msg_0669_00014 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_POKE_DOLL,
     },
    {
     .msgIds = { msg_0669_00015, msg_0669_00015 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Fisherman Wilton
    {
     .msgIds = { msg_0676_00006, msg_0676_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0676_00007, msg_0676_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0676_00008, msg_0676_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0676_00009, msg_0676_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0676_00010, msg_0676_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0676_00011, msg_0676_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0676_00012, msg_0676_00012 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_POKE_BALL,
     },
    {
     .msgIds = { msg_0676_00013, msg_0676_00013 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Lass Krise
    {
     .msgIds = { msg_0715_00005, msg_0715_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0715_00006, msg_0715_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0715_00007, msg_0715_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0715_00008, msg_0715_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0715_00009, msg_0715_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0715_00010, msg_0715_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0715_00011, msg_0715_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Youngster Ian
    {
     .msgIds = { msg_0703_00006, msg_0703_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0703_00007, msg_0703_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0703_00008, msg_0703_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0703_00009, msg_0703_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0703_00010, msg_0703_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0703_00011, msg_0703_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0703_00012, msg_0703_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Firebreather Walt
    {
     .msgIds = { msg_0710_00005, msg_0710_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0710_00006, msg_0710_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0710_00007, msg_0710_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0710_00008, msg_0710_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0710_00009, msg_0710_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0710_00010, msg_0710_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0710_00011, msg_0710_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0710_00012, msg_0710_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Gentleman Alfred
    {
     .msgIds = { msg_0670_00005, msg_0670_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0670_00006, msg_0670_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0670_00007, msg_0670_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0670_00008, msg_0670_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0670_00009, msg_0670_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0670_00010, msg_0670_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0670_00011, msg_0670_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bug Catcher Doug
    {
     .msgIds = { msg_0692_00006, msg_0692_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0692_00007, msg_0692_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0692_00008, msg_0692_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0692_00009, msg_0692_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0692_00010, msg_0692_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0692_00011, msg_0692_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0692_00012, msg_0692_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0692_00013, msg_0692_00013 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_CHERI_BERRY,
     },
    {
     .msgIds = { msg_0692_00014, msg_0692_00014 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bug Catcher Rob
    {
     .msgIds = { msg_0681_00006, msg_0681_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0681_00007, msg_0681_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0681_00008, msg_0681_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0681_00009, msg_0681_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0681_00010, msg_0681_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0681_00011, msg_0681_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0681_00012, msg_0681_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0681_00013, msg_0681_00013 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_CHERI_BERRY,
     },
    {
     .msgIds = { msg_0681_00014, msg_0681_00014 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Fisherman Kyle
    {
     .msgIds = { msg_0697_00005, msg_0697_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0697_00006, msg_0697_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0697_00007, msg_0697_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0697_00008, msg_0697_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0697_00009, msg_0697_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0697_00010, msg_0697_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0697_00011, msg_0697_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Fisherman Kyler
    {
     .msgIds = { msg_0687_00005, msg_0687_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0687_00006, msg_0687_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0687_00007, msg_0687_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0687_00008, msg_0687_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0687_00009, msg_0687_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0687_00010, msg_0687_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0687_00011, msg_0687_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Young Couple Tim & Sue
    {
     .msgIds = { msg_0702_00005, msg_0702_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0702_00006, msg_0702_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0702_00007, msg_0702_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0702_00008, msg_0702_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0702_00009, msg_0702_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0702_00010, msg_0702_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0702_00011, msg_0702_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Hiker Kenny
    {
     .msgIds = { msg_0699_00005, msg_0699_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0699_00006, msg_0699_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0699_00007, msg_0699_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0699_00008, msg_0699_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0699_00009, msg_0699_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0699_00010, msg_0699_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0699_00011, msg_0699_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Camper Tanner
    {
     .msgIds = { msg_0707_00006, msg_0707_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0707_00007, msg_0707_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0707_00008, msg_0707_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0707_00009, msg_0707_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0707_00010, msg_0707_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0707_00011, msg_0707_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0707_00012, msg_0707_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0707_00013, msg_0707_00013 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_SUN_STONE,
     },
    {
     .msgIds = { msg_0707_00014, msg_0707_00014 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Bird Keeper Josh
    {
     .msgIds = { msg_0682_00006, msg_0682_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0682_00007, msg_0682_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0682_00008, msg_0682_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0682_00009, msg_0682_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0682_00010, msg_0682_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0682_00011, msg_0682_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0682_00012, msg_0682_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0682_00013, msg_0682_00013 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_SHINY_STONE,
     },
    {
     .msgIds = { msg_0682_00014, msg_0682_00014 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // School Kid Torin
    {
     .msgIds = { msg_0673_00005, msg_0673_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0673_00006, msg_0673_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0673_00007, msg_0673_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0673_00008, msg_0673_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0673_00009, msg_0673_00009 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0673_00010, msg_0673_00010 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0673_00011, msg_0673_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Teacher Hillary
    {
     .msgIds = { msg_0686_00005, msg_0686_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0686_00006, msg_0686_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0686_00007, msg_0686_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0686_00008, msg_0686_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0686_00009, msg_0686_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0686_00010, msg_0686_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0686_00011, msg_0686_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0686_00012, msg_0686_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // School Kid Billy
    {
     .msgIds = { msg_0683_00005, msg_0683_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0683_00006, msg_0683_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0683_00017, msg_0683_00017 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0683_00018, msg_0683_00018 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0683_00019, msg_0683_00019 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Twins Kay & Tia
    {
     .msgIds = { msg_0679_00006, msg_0679_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0679_00007, msg_0679_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0679_00008, msg_0679_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0679_00009, msg_0679_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0679_00010, msg_0679_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0679_00011, msg_0679_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0679_00012, msg_0679_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0679_00013, msg_0679_00013 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_OVAL_STONE,
     },
    {
     .msgIds = { msg_0679_00014, msg_0679_00014 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Biker Reese
    {
     .msgIds = { msg_0701_00006, msg_0701_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0701_00007, msg_0701_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0701_00008, msg_0701_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0701_00009, msg_0701_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0701_00010, msg_0701_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0701_00011, msg_0701_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0701_00012, msg_0701_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0701_00013, msg_0701_00013 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_DUSK_STONE,
     },
    {
     .msgIds = { msg_0701_00014, msg_0701_00014 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Biker Aiden
    {
     .msgIds = { msg_0709_00006, msg_0709_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0709_00007, msg_0709_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0709_00008, msg_0709_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0709_00009, msg_0709_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0709_00010, msg_0709_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0709_00011, msg_0709_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0709_00012, msg_0709_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0709_00013, msg_0709_00013 },
     .kind = PHONESCRIPTTYPE_ITEM,
     .param0 = 1,
     .param1 = ITEM_DAWN_STONE,
     },
    {
     .msgIds = { msg_0709_00014, msg_0709_00014 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },

    // Biker Ernest
    {
     .msgIds = { msg_0678_00005, msg_0678_00005 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0678_00006, msg_0678_00006 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0678_00007, msg_0678_00007 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0678_00008, msg_0678_00008 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0678_00009, msg_0678_00009 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0678_00010, msg_0678_00010 },
     .kind = PHONESCRIPTTYPE_REMATCH,
     .param0 = 1,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0678_00011, msg_0678_00011 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
    {
     .msgIds = { msg_0678_00012, msg_0678_00012 },
     .kind = PHONESCRIPTTYPE_NONE,
     .param0 = 0,
     .param1 = 0,
     },
};
