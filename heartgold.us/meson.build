# Generate main.lcf
main_lcf = custom_target('main.lcf',
    output: 'main.lcf',
    input: main_lsf + main_lcf_template,
    command: [makelcf_exe, '@INPUT@','@OUTPUT@']
)

# Collect ROM inputs and SHA-sums
icon_png = files('icon.png')

rom_header_template = files('rom_header_template.sbin')

main_sha1 = files('main.sha1')
filesystem_sha1 = files('filesystem.sha1')
rom_sha1 = files('rom.sha1')

rom_ini = files('rom.ini')
filesys_csv = files('filesystem.csv')
