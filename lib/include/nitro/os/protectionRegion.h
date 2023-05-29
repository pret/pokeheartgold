#ifndef NITRO_OS_PROTECTIONREGION_H_
#define NITRO_OS_PROTECTIONREGION_H_

typedef enum
{
    OSi_PR_BASE_MASK_4KB = 0xfffff000,
    OSi_PR_BASE_MASK_8KB = 0xffffe000,
    OSi_PR_BASE_MASK_16KB = 0xffffc000,
    OSi_PR_BASE_MASK_32KB = 0xffff8000,
    OSi_PR_BASE_MASK_64KB = 0xffff0000,
    OSi_PR_BASE_MASK_128KB = 0xfffe0000,
    OSi_PR_BASE_MASK_256KB = 0xfffc0000,
    OSi_PR_BASE_MASK_512KB = 0xfff80000,
    OSi_PR_BASE_MASK_1MB = 0xfff00000,
    OSi_PR_BASE_MASK_2MB = 0xffe00000,
    OSi_PR_BASE_MASK_4MB = 0xffc00000,
    OSi_PR_BASE_MASK_8MB = 0xff800000,
    OSi_PR_BASE_MASK_16MB = 0xff000000,
    OSi_PR_BASE_MASK_32MB = 0xfe000000,
    OSi_PR_BASE_MASK_64MB = 0xfc000000,
    OSi_PR_BASE_MASK_128MB = 0xf8000000,
    OSi_PR_BASE_MASK_256MB = 0xf0000000,
    OSi_PR_BASE_MASK_512MB = 0xe0000000,
    OSi_PR_BASE_MASK_1GB = 0xc0000000,
    OSi_PR_BASE_MASK_2GB = 0x80000000,
    OSi_PR_BASE_MASK_4GB = 0x00000000
}
OSiProtectionRegionBaseMask;

static inline u32 OSi_CalcPRParam(u32 address, u32 size, OSiProtectionRegionBaseMask mask)
{
    return ((address & mask) | size);
}

void OS_SetDPermissionsForProtectionRegion(register u32 setMask, register u32 flags);
void OS_SetProtectionRegion0(u32 param);
void OS_SetProtectionRegion1(u32 param);
void OS_SetProtectionRegion2(u32 param);
void OS_SetProtectionRegion3(u32 param);
void OS_SetProtectionRegion4(u32 param);
void OS_SetProtectionRegion5(u32 param);
void OS_SetProtectionRegion6(u32 param);
void OS_SetProtectionRegion7(u32 param);

#define OS_SetProtectionRegionParam( regionNo, param )   OSi_SetPR##regionNo##_param( param )

#define OSi_SetPR0_param( param )  OS_SetProtectionRegion0( param )
#define OSi_SetPR1_param( param )  OS_SetProtectionRegion1( param )
#define OSi_SetPR2_param( param )  OS_SetProtectionRegion2( param )
#define OSi_SetPR3_param( param )  OS_SetProtectionRegion3( param )
#define OSi_SetPR4_param( param )  OS_SetProtectionRegion4( param )
#define OSi_SetPR5_param( param )  OS_SetProtectionRegion5( param )
#define OSi_SetPR6_param( param )  OS_SetProtectionRegion6( param )
#define OSi_SetPR7_param( param )  OS_SetProtectionRegion7( param )


#define OS_SetProtectionRegion( regionNo, address, sizeStr )  \
  OSi_SetPR##regionNo##_param( OSi_CalcPRParam( address, HW_C6_PR_##sizeStr, OSi_PR_BASE_MASK_##sizeStr ) \
                              | HW_C6_PR_ENABLE )

#endif //NITRO_OS_PROTECTIONREGION_H_
