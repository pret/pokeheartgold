#ifndef NITRO_SPI_COMMON_PM_COMMON_H_
#define NITRO_SPI_COMMON_PM_COMMON_H_

#define PM_TRIGGER_KEY              (1 << 0)
#define PM_TRIGGER_RTC_ALARM        (1 << 1)
#define PM_TRIGGER_COVER_OPEN       (1 << 2)
#define PM_TRIGGER_CARD             (1 << 3)
#define PM_TRIGGER_CARTRIDGE        (1 << 4)
typedef u32 PMWakeUpTrigger;

#define PM_PAD_LOGIC_OR    (0 << REG_PAD_KEYCNT_LOGIC_SHIFT)
#define PM_PAD_LOGIC_AND   (1 << REG_PAD_KEYCNT_LOGIC_SHIFT)
typedef u32 PMLogic;

#endif //NITRO_SPI_COMMON_PM_COMMON_H_
