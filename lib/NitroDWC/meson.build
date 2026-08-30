subdir('asm')

libdwcppwlobby_srcs = files(
    'asm/overlay_45_arm.s'
)

libdwcppwlobby = static_library('dwcppwlobby',
    sources: libdwcppwlobby_srcs,
    nasm_args: asm_args,
    include_directories: [public_includes, ppwlobby_includes],
    pic: false
)

libdwcppwlobby_dep = declare_dependency(
    link_with: libdwcppwlobby
)