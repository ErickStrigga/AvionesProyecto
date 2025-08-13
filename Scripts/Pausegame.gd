extends Control
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	
func _process(delta: float) -> void:
	var player = get_parent().get_node("Area2D")
	if Input.is_action_just_pressed("ui_cancel") and player.life > 0:
		pausegame()
func pausegame():
	var txt = get_parent().get_node("Pausegame")
	var tree = get_tree()
	tree.paused = !tree.paused
	visible = tree.paused
	if tree.paused:
		txt.text = "Game paused, press ESC to retry"
	else:
		txt.text = ""
