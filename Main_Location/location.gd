extends Node2D

func _on_area_2d_body_entered(body):
	if body.name == "player":
		print("ZONE PLAYER")
		print(body.povorot)
		print(body.hod)
		if body.hod > 1 and body.povorot >= 1:
			body.direction = Vector2.DOWN # Устанавливаем направление движения вниз
			body.start_movement()
		elif body.hod > 1 and body.povorot <= -1:
			body.direction = Vector2.RIGHT # Устанавливаем направление движения вниз
			body.start_movement()  # Запускаем движение
		
		





func _on_area_2d_2_body_entered(body):
	if body.name == "player":
		body.povorotPlayer()


func _on_area_2d_3_body_entered(body):
	if body.name == "player":
		body.povorotPlayer2()
