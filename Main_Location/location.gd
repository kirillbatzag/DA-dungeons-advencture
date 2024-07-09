extends Node2D

func _on_area_2d_body_entered(body):
	if body.name == "player":
		print("ZONE PLAYER")
		print(body.hod)
		if body.hod > 1 and body.povorot >= 1:
			body.direction = Vector2.DOWN # Устанавливаем направление движения вниз
			body.start_movement() # Запускаем движение
		
		


func _on_down_area_body_entered(body):
	if body.name == "player":
		body.povorotPlayer()
