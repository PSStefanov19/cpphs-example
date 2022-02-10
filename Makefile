HS_SRC=src/Haskell
CPP_SRC=src/CPP

COMP=ghc

_HS_FILES=a
HS_FILES=$(patsubst %, $(HS_SRC)/%.hs, $(_HS_FILES))

_CPP_FILES=main
CPP_FILES=$(patsubst %, $(CPP_SRC)/%.cpp, $(_CPP_FILES))

HS_OBJ=$(patsubst %, $(HS_SRC)/%.o, $(_HS_FILES))

CPP_OBJ=$(patsubst %, $(HS_SRC)/%.o, $(_CPP_FILES))


COMP_FLAGS=-lstdc++ -Iinclude

all: compileHS main

compileHS: $(HS_OBJ)

$(HS_OBJ): $(HS_FILES)
	$(COMP) -c -O $@ $<
	mv $(HS_SRC)/*.h include/

$(CPP_OBJ): $(CPP_FILES)
	$(COMP) -c -O $@ $< -Iinclude

main: $(CPP_OBJ) $(HS_OBJ)
	$(COMP) --make -no-hs-main -optc-O $(CPP_FILES) $(HS_SRC)/$(_HS_FILES) -o bin/main $(COMP_FLAGS)