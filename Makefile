ifneq ($(wildcard rgbds/.*),)
RGBDS_DIR = rgbds/
else
RGBDS_DIR =
endif

PYTHON := python2.7.exe
MD5 := md5sum -c --quiet

2bpp     := $(PYTHON) extras/pokemontools/gfx.py 2bpp
1bpp     := $(PYTHON) extras/pokemontools/gfx.py 1bpp
pic      := $(PYTHON) extras/pokemontools/pic.py compress
includes := $(PYTHON) extras/pokemontools/scan_includes.py

pokered_obj := audio_red.o main_red.o text_red.o wram_red.o
pokeblue_obj := audio_blue.o main_blue.o text_blue.o wram_blue.o

.SUFFIXES:
.SUFFIXES: .asm .o .gbc .png .2bpp .1bpp .pic
.SECONDEXPANSION:
# Suppress annoying intermediate file deletion messages.
.PRECIOUS: %.2bpp
.PHONY: all clean red blue compare

roms := pokered.gbc pokeblue.gbc

all: $(roms)
red: pokered.gbc
blue: pokeblue.gbc

# For contributors to make sure a change didn't affect the contents of the rom.
compare: red blue
	@$(MD5) roms.md5

clean:
	rm -f $(roms) $(pokered_obj) $(pokeblue_obj) $(roms:.gbc=.sym)
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' -o -iname '*.pic' \) -exec rm {} +

objclean:
	rm -f $(pokered_obj) $(pokeblue_obj)

%.asm: ;

%_red.o: dep = $(shell $(includes) $(@D)/$*.asm)
$(pokered_obj): %_red.o: %.asm $$(dep)
	$(RGBDS_DIR)rgbasm -Wall -D _RED -h -o $@ $*.asm

%_blue.o: dep = $(shell $(includes) $(@D)/$*.asm)
$(pokeblue_obj): %_blue.o: %.asm $$(dep)
	$(RGBDS_DIR)rgbasm -Wall -D _BLUE -h -o $@ $*.asm

rgbfix_opt  = -Cjv -k 01 -l 0x33 -n 69 -m 0x1e -p 0 -r 03
pokered_opt  = -t "YIN"
pokeblue_opt = -t "YANG"

%.gbc: $$(%_obj)
	$(RGBDS_DIR)rgblink -d -n $*.sym -d -o $@ $^
	$(RGBDS_DIR)rgbfix $(rgbfix_opt) $($*_opt) $@
	sort $*.sym -o $*.sym

%.png:  ;
%.2bpp: %.png  ; $(2bpp) $<
%.1bpp: %.png  ; $(1bpp) $<
%.pic:  %.2bpp ; $(pic)  $<
