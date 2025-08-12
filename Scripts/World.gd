extends Node2D
@export var h = 0
@export var rand : int 
func _process(delta: float) -> void:
	rand = randi_range(0,1)
	$CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer/Life.text = "Life : " + str($Area2D.life)
	$CanvasLayer/MarginContainer/VBoxContainer/HBoxContainer/Score.text = "Score : " + str(h)
