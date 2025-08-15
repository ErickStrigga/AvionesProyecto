extends Control

var PATH = "user://MaxScore.txt"

func _ready() -> void:
	if not FileAccess.file_exists(PATH):
		save_game(0)
	var score = load_game()
	$Label.text = "Your max score is : " + str(score)
	
func load_game():
	var max_score
	var file = FileAccess.open(PATH,FileAccess.READ)
	if file:
		max_score = file.get_as_text()
	else:
		push_error("Error to charge the save-game-file")
	return max_score

func save_game(score : int):
	var file = FileAccess.open(PATH,FileAccess.WRITE)
	file.store_string(str(score))
	file.close()

func _on_button_button_down() -> void:
	var scene = load("res://Scenes/Vacio.tscn")
	get_tree().change_scene_to_packed(scene)


func _on_button_2_button_down() -> void:
	var scene2 = load("res://Scenes/Tutorial.tscn")
	get_tree().change_scene_to_packed(scene2)


func _on_button_3_button_up() -> void:
	get_tree().quit()
