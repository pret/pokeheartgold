libpng_dep = dependency('libpng', native: true)

clip_dep = declare_dependency(sources: files('source/libs/clip.c'))
strings_dep = declare_dependency(sources: files('source/libs/strings.c'))
config_dep = declare_dependency(sources: files('source/libs/config.c'), dependencies: [strings_dep])
sheets_dep = declare_dependency(sources: files('source/libs/sheets.c'), dependencies: [strings_dep])
fileio_dep = declare_dependency(sources: files('source/libs/fileio.c'), dependencies: [strings_dep])

config_data = configuration_data()
config_data.set_quoted('VERSION', meson.project_version())
config_h = configure_file(output: 'config.h', configuration: config_data)

nitrorom_exe = executable(
  'nitrorom',
  sources: [
    files(
      'source/nitrorom.c',
      'source/nitrorom_list.c',
      'source/nitrorom_pack.c',
      'source/packer.c',
      'source/parse/cfg_arm.c',
      'source/parse/cfg_banner.c',
      'source/parse/cfg_header.c',
      'source/parse/cfg_rom.c',
      'source/parse/csv_addfile.c',
    ),
    config_h
  ],
  native: true,
  include_directories: include_directories('include'),
  dependencies: [
    libpng_dep,
    clip_dep,
    config_dep,
    fileio_dep,
    sheets_dep,
    strings_dep,
  ],
)

