	.section .version,4

	.balign 4, 0
	.public _version_NINTENDO_WiFi
_version_NINTENDO_WiFi: ; 0x02000BFC
	.asciz "[SDK+NINTENDO:WiFi2.1.30003.0709200229]"

	.balign 4, 0
	.public _version_UBIQUITOUS_CPS
_version_UBIQUITOUS_CPS: ; 0x02000C24
	.asciz "[SDK+UBIQUITOUS:CPS]"

	.balign 4, 0
	.public _version_UBIQUITOUS_SSL
_version_UBIQUITOUS_SSL: ; 0x02000C3C
	.asciz "[SDK+UBIQUITOUS:SSL]"

	.balign 4, 0
	.public _version_Abiosso_libVCT
_version_Abiosso_libVCT: ; 0x02000C54
	.asciz "[SDK+Abiosso:libVCT 1.3.1]"
