nitrodwc_asm = files(
    'overlay_13_arm_2.s',
    'overlay_38_arm.s',
    'overlay_39_arm.s',
)

libcrypto_static_srcs = files(
    'crypto_static.s'
)

dwc_includes = include_directories('include')

libcrypto_static = static_library('crypto_static',
    sources: libcrypto_static_srcs,
    include_directories: [public_includes, dwc_includes],
    pic: false
)

crypto_static_dep = declare_dependency(
    link_with: libcrypto_static
)