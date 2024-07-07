extends CharacterBody2D

var hod = 0
var size_hod = 128
var currPos = Vector2()
var direction = Vector2()
var is_moving = false # Направление движения игрока

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
	match direction:
		Vector2.LEFT:
			redirect_down()
		Vector2.UP:
			redirect_right()
		# Добавьте другие направления по необходимости

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

	
	
