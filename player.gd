extends CharacterBody2D

var hod = 0
var size_hod = 128
var currPos = Vector2()
var direction = Vector2()
var is_moving = false 
var remaining_hod = 0

func _input(event):
	if hod > 0 and not is_processing_movement():
		if event.is_action_pressed("ui_right"):
			direction = Vector2.RIGHT
			start_movement()
		elif event.is_action_pressed("ui_left"):
			direction = Vector2.LEFT
			start_movement()
		elif event.is_action_pressed("ui_up"):
			direction = Vector2.UP
			start_movement()
		elif event.is_action_pressed("ui_down"):
			direction = Vector2.DOWN
			start_movement()

func is_processing_movement() -> bool:
	return is_moving

func start_movement():
	is_moving = true
	remaining_hod = hod # Сохраняем количество ходов перед началом движения
	while hod > 0 and is_moving:
		move_character()
		await get_tree().create_timer(0.2).timeout
		hod -= 1
	is_moving = false
	update_progress_bar()

func move_character():
	currPos += direction * size_hod
	$AnimatedSprite2D.look_at(self.position + direction)
	self.position = currPos

func update_progress_bar():
	$ProgressBar.value = hod

func _ready():
	$ProgressBar.value = hod

func _on_get_hod_pressed():
	if hod <= 0:
		hod = randi() % 6 + 1
		update_progress_bar()
		
func redirect_down():
	hod = 1
	currPos.y += size_hod
	$AnimatedSprite2D.look_at(self.position + Vector2(0,1))
	move_and_slide() # Это обновит позицию персонажа в физическом мире
	
func redirect_on_zone_enter():
	# Проверяем направление движения при входе в зону
	match direction:
		Vector2.DOWN:
			# Если персонаж входит снизу, он поворачивает направо
			direction = Vector2.RIGHT
			currPos.x += size_hod * remaining_hod
		Vector2.RIGHT:
			# Если персонаж входит справа, он поворачивает вниз
			direction = Vector2.DOWN
			currPos.y += size_hod * remaining_hod
	
	# Обновляем позицию персонажа и смотрим в новом направлении
	$AnimatedSprite2D.look_at(self.position + direction)
	self.position = currPos
	# Обнуляем количество ходов после перемещения
	hod = 0
	update_progress_bar()
	
# Предполагаем, что у вас есть функция, которая вызывается при входе в зону
func on_zone_entered(zone):
	if zone.is_in_group("redirect_zone"):
		# Сохраняем текущее количество ходов
		var steps_remaining = hod
		# Определяем новое направление движения
		if direction == Vector2.DOWN:
			direction = Vector2.RIGHT
		elif direction == Vector2.RIGHT:
			direction = Vector2.DOWN
		# Вызываем функцию движения с сохраненным количеством шагов
		move_in_new_direction(steps_remaining)

# Функция для движения в новом направлении
func move_in_new_direction(steps):
	while steps > 0:
		# Двигаем персонажа в новом направлении
		currPos += direction * size_hod
		steps -= 1
		await(get_tree().create_timer(0.2))
	# После завершения движения обнуляем hod
	hod = 0

func redirect_downwards():
	hod = 1
	currPos.y += size_hod
	direction = Vector2.DOWN # Обновляем направление на вниз
	$AnimatedSprite2D.look_at(self.position + Vector2(0,1))
	move_and_slide() # Это обновит позицию персонажа

func redirect_right():
	hod = 1
	currPos.x += size_hod
	direction = Vector2.RIGHT # Обновляем направление на право
	$AnimatedSprite2D.look_at(self.position + Vector2(1,0))
	move_and_slide() # Это обновит позицию персонажа
	
func redirect_left():
	hod = 1
	currPos.x += size_hod
	direction = Vector2.RIGHT # Обновляем направление на право
	$AnimatedSprite2D.look_at(self.position + Vector2(1,0))
	move_and_slide() # Это обновит позицию персонажа в физическом мире

func redirect_ups():
	hod = 1
	currPos.y += size_hod
	direction = Vector2.DOWN # Обновляем направление на вниз
	$AnimatedSprite2D.look_at(self.position + Vector2(0,1))
	move_and_slide() # Это обновит позицию персонажа

	
	
