#include <nitro/fx/fx.h>
#include <nitro/fx/fx_const.h>

#include "spl_internal.h"
#include "spl_random.h"

void SPLAnim_Scale(SPLParticle *ptcl, SPLResource *res, int lifeRate)
{
    SPLScaleAnim *scaleAnim = res->scaleAnim;
    int in = scaleAnim->curve.in;
    int out = scaleAnim->curve.out;

    if (lifeRate < in) {
        fx16 start = scaleAnim->start;
        fx16 mid = scaleAnim->mid;
        ptcl->animScale = start + ((lifeRate * (mid - start)) / in);
    } else if (lifeRate < out) {
        ptcl->animScale = scaleAnim->mid;
    } else {
        fx16 mid = scaleAnim->mid;
        fx16 end = scaleAnim->end;
        ptcl->animScale = end + (((lifeRate - 255) * (end - mid)) / (255 - out));
    }
}

void SPLAnim_Color(SPLParticle *ptcl, SPLResource *res, int lifeRate)
{
    SPLResourceHeader *header = res->header;
    SPLColorAnim *colorAnim = res->colorAnim;
    int peak = colorAnim->curve.peak;
    int out = colorAnim->curve.out;
    int in = colorAnim->curve.in;

    if (lifeRate < in) {
        ptcl->color = colorAnim->start;
    } else if (lifeRate < peak) {
        int peakR = GX_RGB_R(header->color);
        int startR = GX_RGB_R(colorAnim->start);

        int peakG = GX_RGB_G(header->color);
        int startG = GX_RGB_G(colorAnim->start);

        int peakB = GX_RGB_B(header->color);
        int startB = GX_RGB_B(colorAnim->start);

        if (colorAnim->flags.interpolate) {
            int a = lifeRate - in;
            int b = peak - in;

            ptcl->color = GX_RGB(
                startR + (a * (int)(peakR - startR)) / b,
                startG + (a * (int)(peakG - startG)) / b,
                startB + (a * (int)(peakB - startB)) / b);
        } else {
            ptcl->color = GX_RGB(peakR, peakG, peakB);
        }
    } else if (lifeRate < out) {
        int peakR = GX_RGB_R(header->color);
        int endR = GX_RGB_R(colorAnim->end);

        int peakG = GX_RGB_G(header->color);
        int endG = GX_RGB_G(colorAnim->end);

        int peakB = GX_RGB_B(header->color);
        int endB = GX_RGB_B(colorAnim->end);

        if (colorAnim->flags.interpolate) {
            int a = lifeRate - peak;
            int b = out - peak;

            ptcl->color = GX_RGB(
                peakR + (a * (int)(endR - peakR)) / b,
                peakG + (a * (int)(endG - peakG)) / b,
                peakB + (a * (int)(endB - peakB)) / b);
        } else {
            ptcl->color = GX_RGB(endR, endG, endB);
        }
    } else {
        ptcl->color = colorAnim->end;
    }
}

void SPLAnim_Alpha(SPLParticle *ptcl, SPLResource *res, int lifeRate)
{
    u32 value;
    SPLAlphaAnim *alphaAnim = res->alphaAnim;
    int in = alphaAnim->curve.in;
    int out = alphaAnim->curve.out;

    if (lifeRate < in) {
        value = (lifeRate * (alphaAnim->alpha.mid - alphaAnim->alpha.start)) / in;
        value += alphaAnim->alpha.start;
    } else if (lifeRate < out) {
        value = alphaAnim->alpha.mid;
    } else {
        value = ((lifeRate - 255) * (alphaAnim->alpha.end - alphaAnim->alpha.mid)) / (255 - out);
        value += alphaAnim->alpha.end;
    }

    ptcl->visibility.animAlpha = SPLRandom_ScaledRangeFX32(value, alphaAnim->flags.randomRange);
}

void SPLAnim_Texture(SPLParticle *ptcl, SPLResource *res, int lifeRate)
{
    SPLTexAnim *texAnim = res->texAnim;
    for (int i = 0; i < texAnim->param.frameCount; i++) {
        if (lifeRate < texAnim->param.step * (i + 1)) {
            ptcl->texture = texAnim->textures[i];
            return;
        }
    }
}

void SPLAnim_ChildScale(SPLParticle *ptcl, SPLResource *res, int lifeRate)
{
    ptcl->animScale = res->childResource->endScale + ((res->childResource->endScale - FX16_ONE) * (lifeRate - 255)) / 255;
}

void SPLAnim_ChildAlpha(SPLParticle *ptcl, SPLResource *res, int lifeRate)
{
    ptcl->visibility.animAlpha = ((255 - lifeRate) * 31) / 255;
}
