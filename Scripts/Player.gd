extends Area2D
@onready var b = preload("res://Scenes/Bullet.tscn")
@export var life = 10
@export var score = 0
@export var level  = 1
@export var t = 0
var timer = 0.4
var vel = 300

func _ready() -> void:
	$AnimationPlayer.play("Static")

func _process(delta: float) -> void:
	if life > 10:
		life = 10
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
	if (Input.is_key_pressed(KEY_D) or Input.is_action_pressed("ui_right")) and position.x <= 770:
		position.x += vel * delta
	if (Input.is_key_pressed(KEY_A) or Input.is_action_pressed("ui_left")) and position.x >= 30:
		position.x -= vel * delta
	if (Input.is_key_pressed(KEY_W) or Input.is_action_pressed("ui_up")):
		position.y -= (vel - 100) * delta
	if (Input.is_key_pressed(KEY_S) or Input.is_action_pressed("ui_down")) and position.y <= 555:
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
