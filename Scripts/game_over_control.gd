extends Node

const PATH = "user://MaxScore.txt"

func _process(delta: float) -> void:
	var player = get_parent().get_node("Area2D")
	var pause_over = get_parent().get_node("Pausegame")
	if player.life <= 0:
		pause_over.text = "Game over, press ENTER to retry"
		if Input.is_action_just_pressed("ui_accept"):
			save_game(player.score);
			var sc = load("res://Scenes/Vacio.tscn")
			get_tree().change_scene_to_packed(sc)

func save_game(score : int):
	var act = load_game()
	if score > int(act):
		var file = FileAccess.open(PATH,FileAccess.WRITE)
		file.store_string(str(score))
		file.close()
func load_game():
	var file = FileAccess.open(PATH,FileAccess.READ)
	var cont = file.get_as_text()
	file.close()
	return cont
