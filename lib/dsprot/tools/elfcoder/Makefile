SRC_DIR    :=  ./src
INC_DIR    :=  ./include
BUILD_DIR  :=  ./build

$(shell mkdir -p $(BUILD_DIR))

CFLAGS := -O3 -Wno-unused-result -I $(INC_DIR)

C_FILES := $(wildcard $(SRC_DIR)/*.c)
H_FILES := $(wildcard $(INC_DIR)/*.h)

.PHONY: clean

$(BUILD_DIR)/elfcoder: $(C_FILES) $(H_FILES)
	$(CC) $(CFLAGS) $(C_FILES) -o $(BUILD_DIR)/elfcoder

clean:
	$(RM) $(BUILD_DIR)/elfcoder
