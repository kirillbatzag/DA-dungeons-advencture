extends Node2D

# Размеры сетки
const GRID_WIDTH = 4
const GRID_HEIGHT = 4
# Размер одной клетки
const CELL_SIZE = Vector2(64, 64)

# Текущая позиция игрока в клетках сетки
var grid_position = Vector2()

@onready var player = $Node2D/player

func _ready():
	# Установка начальной позиции игрока в клетках сетки
	grid_position = Vector2(0, 0)
	update_player_position()

# Обновление позиции игрока на сцене
func update_player_position():
	player.position = grid_position * CELL_SIZE

# Функция для перемещения игрока по сетке
func move_player(direction):
	match direction:
		"up":
			grid_position.y = max(grid_position.y - 1, 0)
		"down":
			grid_position.y = min(grid_position.y + 1, GRID_HEIGHT - 1)
		"left":
			grid_position.x = max(grid_position.x - 1, 0)
		"right":
			grid_position.x = min(grid_position.x + 1, GRID_WIDTH - 1)
	update_player_position()

# Обработка ввода пользователя для перемещения игрока
func _input(event):
	if event is InputEventKey and event.pressed:
		match event.scancode:
			KEY_UP:
				move_player("ui_up")
			KEY_DOWN:
				move_player("down")
			KEY_LEFT:
				move_player("left")
			KEY_RIGHT:
				move_player("right")
