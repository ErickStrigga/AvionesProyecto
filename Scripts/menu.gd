extends Control

func _on_button_button_down() -> void:
	var scene = load("res://Scenes/Vacio.tscn")
	get_tree().change_scene_to_packed(scene)


func _on_button_2_button_down() -> void:
	var scene2 = load("res://Scenes/Tutorial.tscn")
	get_tree().change_scene_to_packed(scene2)


func _on_button_3_button_up() -> void:
	get_tree().quit()
