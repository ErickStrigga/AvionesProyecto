extends Area2D
@export var life : int
var timer : float
var att : bool
@onready var i = preload("res://Items.tscn")
@onready var b = preload("res://Bullet.tscn")
var textures = [preload("res://kenney_pixel-shmup/Ships/ship_0008.png"),
	preload("res://kenney_pixel-shmup/Ships/ship_0011.png"),
	preload("res://kenney_pixel-shmup/Ships/ship_0010.png"),
	preload("res://kenney_pixel-shmup/Ships/ship_0009.png")]

func _ready() -> void:
	timer = 0.7
	att = false
	$Sprite2D.texture = textures[randi_range(0,len(textures) - 1)]
	$AnimationPlayer.play("Static")
	life = 5

func _process(delta: float) -> void:
	timer += delta
	position.y += 100 * delta
	if(position.y >= 600):
		queue_free()
	if att:
		if timer >= 0.7:
			timer = 0;
			attack()

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if(area.is_in_group("Bullets")):
		if(life <= 1):
			get_parent().h += 10
			if get_parent().rand == 0:
				var item = i.instantiate()
				get_parent().add_child(item)
				item.global_position = position
			queue_free()
		else:
			life-=(1 * area.level);
	if(area.is_in_group("Player")):
		get_parent().h += 10
		queue_free()
	if not area.is_in_group("Collisions") or not area.is_in_group("Items"):
		$AnimationPlayer.play("Hitting")

func attack():
	var bala = b.instantiate();
	get_tree().current_scene.add_child(bala)
	bala.vel = 400;
	bala.level = 1
	bala.global_position = $Marker2D.global_position

func _on_attack_box_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("Player"):
		att = true
		pass

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if(anim_name == "Hitting"):
		$AnimationPlayer.play("Static")

func _on_attack_box_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	att = false
