extends Area2D

var timer : float =  0
@onready var textures = [preload("res://Life_item.png"),
						preload("res://Power_item.png")]

func _ready() -> void:
	$Sprite2D.texture = textures[randi_range(0,len(textures) - 1)]

func _process(delta: float) -> void:
	timer += delta
	if timer >= 10:
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player"):
		if $Sprite2D.texture == textures[0]:
			area.life += 5
		elif $Sprite2D.texture == textures[1]:
			area.t += 5
		queue_free()
