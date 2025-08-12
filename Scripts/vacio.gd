extends Node2D
var timer = 0
func _process(delta: float) -> void:
	timer += delta
	if timer >= 3:
		var sc = load("res://Scenes/World.tscn")
		get_tree().change_scene_to_packed(sc)
