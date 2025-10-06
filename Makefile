# === 项目信息 ===
PROJECT_NAME := CppTemplate
BUILD_DIR    := build
INSTALL_DIR  := install

# === 编译选项 ===
CMAKE_FLAGS := -DCMAKE_BUILD_TYPE=Release

# === 默认目标 ===
.PHONY: all
all: configure build

# === 配置阶段 ===
.PHONY: configure
configure:
	@echo "==> Configuring project $(PROJECT_NAME)..."
	@mkdir -p $(BUILD_DIR)
	@cd $(BUILD_DIR) && cmake $(CMAKE_FLAGS) -DPROJECT_NAME=$(PROJECT_NAME) ..

# === 编译阶段 ===
.PHONY: build
build:
	@echo "==> Building project..."
	@cd $(BUILD_DIR) && $(MAKE)

# === 安装阶段 ===
.PHONY: install
install:
	@echo "==> Installing to $(INSTALL_DIR)..."
	@cd $(BUILD_DIR) && $(MAKE) install DESTDIR=$(abspath $(INSTALL_DIR))

# === 清理构建文件 ===
.PHONY: clean
clean:
	@echo "==> Cleaning build directory..."
	@rm -rf $(BUILD_DIR) $(INSTALL_DIR)

# === 运行程序 ===
.PHONY: run
run: build
	@echo "==> Running $(PROJECT_NAME)..."
	@./$(BUILD_DIR)/$(PROJECT_NAME)
