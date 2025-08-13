extends Control

func _on_button_button_up() -> void:
	var scene = load("res://Scenes/Menu.tscn")
	get_tree().change_scene_to_packed(scene)
