extends Node2D


func _on_StartButton_pressed() -> void:
	get_tree().change_scene("res://game/Game.tscn")


func _on_ExitButton_pressed() -> void:
	get_tree().quit()
