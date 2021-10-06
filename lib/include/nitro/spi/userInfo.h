#ifndef NITRO_SPI_USERINFO_H_
#define NITRO_SPI_USERINFO_H_

typedef struct NVRAMConfigDate
{
    u8 month;            //0x00
    u8 day;              //0x01
} NVRAMConfigDate;       //0x02

typedef struct NVRAMConfigNickname
{
    u16 str[10];         //0x00
    u8 length;           //0x14
    u8 rsv;              //0x15
} NVRAMConfigNickname;   //0x16

typedef struct NVRAMConfigComment
{
    u16 str[26];         //0x00
    u8 length;           //0x34
    u8 rsv;              //0x35
} NVRAMConfigComment;    //0x36

typedef struct NVRAMConfigOwnerInfo
{
    u8 favouriteColour:4;         //0x00 (0-3)
    u8 rsv:4;                     //0x00 (4-7)
    NVRAMConfigDate birthday;     //0x01
    u8 pad;                       //0x03
    NVRAMConfigNickname nickname; //0x04
    NVRAMConfigComment comment;   //0x1a
} NVRAMConfigOwnerInfo;           //0x50

typedef struct NVRAMConfigAlarm
{
    u8 hour;             //0x00
    u8 minute;           //0x01
    u8 second;           //0x02
    u8 pad;              //0x03
    u16 enableWeek:7;    //0x04 (0-6)
    u16 alarmOn:1;       //0x04 (7)
    u16 rsv:8;           //0x04 (8-15)
} NVRAMConfigAlarm;      //0x06

typedef struct NVRAMConfigTpCalibData
{
    u16 raw_x1;           //0x00
    u16 raw_y1;           //0x02
    u8 dx1;               //0x04
    u8 dy1;               //0x05
    u16 raw_x2;           //0x06
    u16 raw_y2;           //0x08
    u8 dx2;               //0x0a
    u8 dy2;               //0x0b
} NVRAMConfigTpCalibData; //0x0c

typedef struct NVRAMConfigOption
{
    u16 language:3;               //0x00 (0-2)
    u16 agbLcd:1;                 //0x00 (3)
    u16 detectPullOutCardFlag:1;  //0x00 (4)
    u16 detectPullOutCtrdgFlag:1; //0x00 (5)
    u16 autoBootFlag:1;           //0x00 (6)
    u16 rsv:4;                    //0x00 (7-10)
    u16 input_favouriteColour:1;  //0x00 (11)
    u16 input_tp:1;               //0x00 (12)
    u16 input_language:1;         //0x00 (13)
    u16 input_rtc:1;              //0x00 (14)
    u16 input_nickname:1;         //0x00 (15)
    u8 timeZone;                  //0x02
    u8 rtcClockAdjust;            //0x03
    s64 rtcOffset;                //0x04
} NVRAMConfigOption;              //0x0c

typedef struct NVRAMConfigData
{
    u8 version;                   //0x00
    u8 pad;                       //0x01
    NVRAMConfigOwnerInfo owner;   //0x02
    NVRAMConfigAlarm alarm;       //0x52
    NVRAMConfigTpCalibData tp;    //0x58
    NVRAMConfigOption option;     //0x64
} NVRAMConfigData;                //0x70

typedef struct NVRAMConfig
{
    NVRAMConfigData ncd; //0x00
    u16 saveCount;       //0x70
    u16 crc16;           //0x72
} NVRAMConfig;           //0x74

#endif //NITRO_SPI_USERINFO_H_
