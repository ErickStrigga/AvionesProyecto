extends Node2D
var timer = 0
func _process(delta: float) -> void:
	timer += delta
	if timer >= 5:
		var sc = load("res://World.tscn")
		get_tree().change_scene_to_packed(sc)
