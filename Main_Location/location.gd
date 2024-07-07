extends Node2D


func _on_area_2d_area_entered(area):
	if area is CharacterBody2D: # Проверяем, что вошедшая область - это игрок
		print("enter zone") # Вызываем функцию перенаправления


