# Config

SRC_DIR=./src
OBJ_DIR=./objs

CC=g++
CCFLAGS=
LDFLAGS=

SOURCES=$(notdir $(shell find $(SRC_DIR) -name '*.cpp'))
OBJECT_FILES=$(SOURCES:%.c=$(OBJ_DIR)/%.o)
TARGET_FILE=quick-union

vpath %.c $(SRC_DIR)

# Rules
all: $(SOURCES) $(TARGET_FILE)

$(TARGET_FILE): $(OBJ_DIR) $(OBJECT_FILES)
	$(CC) $(LDFLAGS) $(OBJECT_FILES) -o $@

$(OBJ_DIR)/%.o: %.c
	$(CC) $(CCFLAGS) $< -o $@

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

clean:
	-rm -rf $(OBJ_DIR) $(TARGET_FILE)



