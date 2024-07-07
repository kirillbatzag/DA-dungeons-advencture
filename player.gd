extends CharacterBody2D

var hod = 0
var size_hod = 128
var currPos = Vector2()

func _input(event):
	if hod > 0:
		if event.is_action_pressed("ui_right"):
			for i in hod:
				print(currPos)
				hod -= 1
				currPos.x += 128
				$AnimatedSprite2D.look_at(self.position + Vector2(1,0))
		elif event.is_action_pressed("ui_left"):
			for i in hod:
				print(currPos)
				hod -= 1
				currPos.x -= 128
				$AnimatedSprite2D.look_at(self.position + Vector2(-1,0))
		elif event.is_action_pressed("ui_up"):
			for i in hod:
				print(currPos)
				hod -= 1
				currPos.y -= 128
				$AnimatedSprite2D.look_at(self.position + Vector2(0,-1))
		elif event.is_action_pressed("ui_down"):
			for i in hod:
				print(currPos)
				hod -= 1
				currPos.y += 128
				$AnimatedSprite2D.look_at(self.position + Vector2(0,1))
		$ProgressBar.value = hod
	self.position = currPos

func _ready():
	$ProgressBar.value = hod


func _on_get_hod_pressed():
	if hod <= 0:
		hod = randi() % 6 + 1
	
	
