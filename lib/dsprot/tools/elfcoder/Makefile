ifeq ($(OS),Windows_NT)
	EXE := .exe
else
	EXE := 
endif

SRC_DIR    :=  ./src
INC_DIR    :=  ./include
BUILD_DIR  :=  ./build

$(shell mkdir -p $(BUILD_DIR))

C_FILES := $(wildcard $(SRC_DIR)/*.c)
H_FILES := $(wildcard $(INC_DIR)/*.h)

.PHONY: clean

$(BUILD_DIR)/elfcoder$(EXE): $(C_FILES) $(H_FILES)
	$(CC) -O3 -I $(INC_DIR) $(C_FILES) -o $(BUILD_DIR)/elfcoder$(EXE)

clean:
	$(RM) $(BUILD_DIR)/elfcoder$(EXE)
