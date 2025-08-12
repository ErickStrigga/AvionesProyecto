extends Area2D
@export var vel : int
var exp : bool
@export var acum : int
@export var level : int
func _ready() -> void:
	acum = 0
	vel = -400
	exp = false

func _process(delta: float) -> void:
	if(level == 2):
		$CollisionShape2D.scale = Vector2(2,1)
	else:
		$CollisionShape2D.scale = Vector2(1,1)
	if not exp:
		$AnimationPlayer.play("Static" + str(level))
		position.y += vel * delta
	if(position.y < 0 or position.y > 800):
		queue_free()

func esplot():
	if exp:
		return
	exp = true
	vel = 0
	$CollisionShape2D.disabled = true
	$AnimationPlayer.play("Splotion")

func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area.is_in_group("Enemies") or area.is_in_group("Player"):
		esplot()

func _on_animation_player_animation_finished(anim_name) -> void:
	if(anim_name == "Splotion"):
		queue_free()
