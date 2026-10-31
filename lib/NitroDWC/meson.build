subdir('asm')

libgds_srcs = files(
    'asm/overlay_39_arm.s'
)

libgds = static_library('gds',
    sources: libgds_srcs,
    nasm_args: asm_args,
    include_directories: [public_includes, dwc_includes],
    pic: false
)

libdwcppwlobby_srcs = files(
    'asm/overlay_45_arm.s'
)

libdwcppwlobby = static_library('dwcppwlobby',
    sources: libdwcppwlobby_srcs,
    nasm_args: asm_args,
    include_directories: [public_includes, dwc_includes],
    pic: false
)

libdwcppwlobby_dep = declare_dependency(
    link_with: libdwcppwlobby
)