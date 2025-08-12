extends Area2D
@onready var b = preload("res://Bullet.tscn")
@export var life : int
@export var score : int
@export var level : int
@export var t : float
var timer : float
var vel : int

func _ready() -> void:
	t = 0
	level = 1 ; score = 0 ; life = 10 ; timer = 0.4 ; vel = 300
	$AnimationPlayer.play("Static")

func _process(delta: float) -> void:
	if t <= 0:
		t = 0
		level = 1
	else:
		t -= delta
		level = 2
	if life <= 0:
		life = 0
		position = Vector2(-60,-60)
	timer += delta
	if Input.is_key_pressed(KEY_D) and position.x <= 770:
		position.x += vel * delta
	if Input.is_key_pressed(KEY_A) and position.x >= 30:
		position.x -= vel * delta
	if Input.is_key_pressed(KEY_W):
		position.y -= (vel - 100) * delta
	if Input.is_key_pressed(KEY_S) and position.y <= 555:
		position.y += (vel - 100) * delta
	if Input.is_key_pressed(KEY_SPACE):
		if(timer >= 0.4):
			timer = 0 
			var bala = b.instantiate()
			get_tree().current_scene.add_child(bala)
			bala.level = level
			bala.global_position = $Marker2D.global_position

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if not area.is_in_group("Collisions"):
		if area.is_in_group("Enemies"):
			life -= 2
		elif area.is_in_group("Bullets"):
			life -= 1
		$AnimationPlayer.play("Hitting")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if(anim_name == "Hitting"):
		$AnimationPlayer.play("Static")
