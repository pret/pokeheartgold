
WSLENV ?= no
ifeq ($(WSLENV),)
NOWINE = 1
else
NOWINE = 0
endif

ifeq ($(OS),Windows_NT)
EXE := .exe
WINE :=
GREP := grep -P
SED := sed -r
SHA1SUM := sha1sum
MKTEMP := mktemp
else
EXE :=
WINE := wine
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
GREP := grep -E
SED := gsed -r
SHA1SUM := shasum
MKTEMP := gmktemp
else
GREP := grep -P
SED := sed -r
SHA1SUM := sha1sum
MKTEMP := mktemp
endif
endif

ifeq ($(NOWINE),1)
WINE :=
WINPATH := wslpath
else
WINPATH := winepath
endif
