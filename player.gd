extends CharacterBody2D

var hod = 3

var currPos = [0, 0]

func _input(event):
	if event.is_action_pressed("ui_right"):
		currPos[0] += 32
		get_node("AnimatedSprite2D").look_at(self.position + Vector2(1,0))
	elif event.is_action_pressed("ui_left"):
		currPos[0] -= 32
		get_node("AnimatedSprite2D").look_at(self.position + Vector2(-1,0))
	elif event.is_action_pressed("ui_up"):
		currPos[1] -= 32
		get_node("AnimatedSprite2D").look_at(self.position + Vector2(0,-1))
	elif event.is_action_pressed("ui_up"):
		currPos[1] += 32
		get_node("AnimatedSprite2D").look_at(self.position + Vector2(0,1))
		
	self.position = Vector2(currPos[0], currPos[1])
	
