extends Node2D

# Предполагаем, что у вас есть узел, который представляет игрока
@onready var player = $Node2D/player
# Максимальное количество шагов
var max_steps = 100
# Текущее количество шагов
var current_steps = 0

# Список центральных точек комнат
var room_points = [Vector2(15, 15), Vector2(15, 150), Vector2(100, 265), Vector2(50, 370)]

func _ready():
	# Инициализация игры
	current_steps = max_steps
	# Поместите игрока в начальную точку
	player.position = room_points[0]

func _process(delta):
	# Обработка ввода пользователя и передвижения игрока
	if current_steps > 0 and Input.is_action_just_pressed("ui_accept"):
		# Перемещение игрока
		move_player()

func move_player():
	# Выбор следующей точки для перемещения
	var next_point = room_points[randi() % room_points.size()]
	player.position = next_point
	current_steps -= 1
