#ifndef NNSYS_G3D_BINRES_RES_STRUCT_ACCESSOR_INLINE_H_
#define NNSYS_G3D_BINRES_RES_STRUCT_ACCESSOR_INLINE_H_

static inline void* NNS_G3dGetResDataByIdx(const NNSG3dResDict* dict, u32 idx) {
    NNSG3dResDictEntryHeader* hdr;

    if (dict != NULL && idx < dict->numEntry) {
        hdr = (NNSG3dResDictEntryHeader*)((u8*)dict + dict->ofsEntry);
        return (void*)(&hdr->data[0] + hdr->sizeUnit * idx);
    } else {
        return NULL;
    }
}

static inline NNSG3dResMdl* NNS_G3dGetMdlByIdx(const NNSG3dResMdlSet* mdlSet, u32 idx) {
    NNSG3dResDictMdlSetData* data;

    if (mdlSet) {
        data = (NNSG3dResDictMdlSetData*)NNS_G3dGetResDataByIdx(&mdlSet->dict, idx);
        if (data) {
            return (NNSG3dResMdl*)((u8*)mdlSet + data->offset);
        }
    }
    return NULL;
}

#endif //NNSYS_G3D_BINRES_RES_STRUCT_ACCESSOR_INLINE_H_
