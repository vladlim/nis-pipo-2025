# Имя бинарного файла
BINARY_NAME=main
# Директория для собранных бинарников
BIN_DIR=bin

# Версия сборки
APP_VERSION?=1.0.0
BUILD_NUMBER?=0

# Цель по умолчанию
.DEFAULT_GOAL := build

# Сборка проекта
build:
	@echo "Building version $(APP_VERSION), build $(BUILD_NUMBER)..."
	@go build -o $(BIN_DIR)/$(BINARY_NAME) cmd/main.go
	@echo "Build complete: $(BIN_DIR)/$(BINARY_NAME) v$(APP_VERSION)"

# Запуск программы
run:
	@go run cmd/main.go

# Сборка и запуск
start: build
	@echo "Starting..."
	@./$(BIN_DIR)/$(BINARY_NAME)

# Очистка собранных файлов
clean:
	@echo "Cleaning..."
	@rm -rf $(BIN_DIR)
	@echo "Clean complete"

# Просмотр помощи
help:
	@echo "Available targets:"
	@echo "  build  - Build the application (default)"
	@echo "  run    - Run the application directly"
	@echo "  start  - Build and run the application"
	@echo "  clean  - Remove built binaries"
	@echo "  help   - Show this help message"

# Помечаем цели как phony (не файлы)
.PHONY: build run start clean help