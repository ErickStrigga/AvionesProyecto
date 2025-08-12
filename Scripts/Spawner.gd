extends Node2D
var num = 1
@onready var e = preload("res://Scenes/Enemy_1.tscn")
func _process(delta: float) -> void:
	var Enemy = e.instantiate()
	num += delta
	if(num >= 3):
		num = 0;
		owner.add_child(Enemy)
		Enemy.position = Vector2(randi_range(20,580),20)
