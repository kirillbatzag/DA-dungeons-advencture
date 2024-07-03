extends CharacterBody2D

# Параметры персонажа
var move_speed = 200 # Скорость персонажа
 # Вектор скорости

func _ready():
	# Инициализация параметров при запуске сцены
	pass

func _physics_process(delta):
	velocity = Vector2.ZERO # Сброс скорости

	# Проверка ввода пользователя и установка направления движения
	if Input.is_action_pressed('ui_right'):
		velocity.x += move_speed
	if Input.is_action_pressed('ui_left'):
		velocity.x -= move_speed
	if Input.is_action_pressed('ui_down'):
		velocity.y += move_speed
	if Input.is_action_pressed('ui_up'):
		velocity.y -= move_speed

	# Нормализация вектора скорости
	velocity = velocity.normalized() * move_speed

	# Перемещение персонажа
	move_and_slide()

# Функция для перемещения персонажа на определённое количество шагов
func move_steps(steps):
	var step_count = 0
	while step_count < steps:
		velocity = Vector2(1, 0) * move_speed # Пример направления
		move_and_slide()
		step_count += 1
		await get_tree().create_timer(1.0).timeout # Пауза между шагами
