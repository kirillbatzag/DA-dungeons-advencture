extends CharacterBody2D

var hod = 1000
var currPos = Vector2()

func _input(event):
	if hod > 0:
		if event.is_action_pressed("ui_right"):
			hod -= 1
			currPos.x += 32
			$AnimatedSprite2D.look_at(self.position + Vector2(1,0))
		elif event.is_action_pressed("ui_left"):
			hod -= 1
			currPos.x -= 32
			$AnimatedSprite2D.look_at(self.position + Vector2(-1,0))
		elif event.is_action_pressed("ui_up"):
			hod -= 1
			currPos.y -= 32
			$AnimatedSprite2D.look_at(self.position + Vector2(0,-1))
		elif event.is_action_pressed("ui_down"):
			hod -= 1
			currPos.y += 32
			$AnimatedSprite2D.look_at(self.position + Vector2(0,1))
		$ProgressBar.value = hod
	self.position = currPos

func _ready():
	$ProgressBar.value = hod


func _on_get_hod_pressed():
	if hod <= 0:
		hod = randi() % 6 + 1
	
