extends Node2D



func _on_start_bt_pressed():
	get_tree().change_scene_to_file("res://Main_Location/location.tscn")


func _on_quit_bt_pressed():
	get_tree().quit()
