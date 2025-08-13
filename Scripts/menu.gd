extends Control

func _on_button_button_down() -> void:
	var scene = load("res://Scenes/Vacio.tscn")
	get_tree().change_scene_to_packed(scene)
