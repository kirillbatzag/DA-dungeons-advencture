extends CharacterBody2D

const SPEED = 200
var hod = 2 # скорость персонажа
 # вектор скорости персонажа

func _physics_process(delta):
	velocity = Vector2()
	# проверяем, нажата ли клавиша "ui_right" и добавляем скорость вправо
	if Input.is_action_pressed("ui_right"):
		if hod >= 0:
			hod = hod - 1
			velocity.x += 1
		# персонаж поворачивается вправо
	# проверяем, нажата ли клавиша "ui_left" и добавляем скорость влево
	if Input.is_action_pressed("ui_left"):
		if hod >= 0:
			hod = hod - 1
			velocity.x -= 1
		 # персонаж поворачивается влево
	# проверяем, нажата ли клавиша "ui_down" и добавляем скорость вниз
	if Input.is_action_pressed("ui_down"):
		if hod >= 0:
			hod = hod - 1
			velocity.y += 1
	# проверяем, нажата ли клавиша "ui_up" и добавляем скорость вверх
	if Input.is_action_pressed("ui_up"):
		if hod >= 0:
			hod = hod - 1
			velocity.y -= 1
	# нормализуем вектор скорости и умножаем на скорость
	velocity = velocity.normalized() * SPEED
	# перемещаем персонажа по направлению вектора скорости
	move_and_slide()
