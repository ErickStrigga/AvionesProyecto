extends Node2D
@export var h = 0
@export var rand : int 
func _process(delta: float) -> void:
	rand = randi_range(0,1)
	$CanvasLayer/Life.text = "Life : " + str($Area2D.life)
	$CanvasLayer/Score.text = "Score : " + str(h)


func _on_button_button_up() -> void:
	var mm = load("res://Scenes/Menu.tscn")
	get_tree().change_scene_to_packed(mm)
