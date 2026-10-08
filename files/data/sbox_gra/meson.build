sbox_gra_png = files('sbox_gra.png')

sbox_gra_nclr = nclr_gen.process(sbox_gra_png,
    extra_args : BPP4_NOPAD_PCMP_NCLR_FLAGS
)

sbox_gra_ncgr = ncgr_gen.process(sbox_gra_png,
    extra_args : VERSION101_SOPC_NCGR_FLAGS
)

sbox_gra_order = files('sbox_gra.order')