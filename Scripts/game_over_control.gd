extends Control

func _process(delta: float) -> void:
	var player = get_parent().get_node("Area2D")
	var txt = get_parent().get_node("Pausegame")
	if player.life <= 0:
		txt.text = "Game over, press ESC to retry"
		if Input.is_action_just_pressed("ui_cancel"):
			var sc = load("res://Scenes/Vacio.tscn")
			get_tree().change_scene_to_packed(sc)
