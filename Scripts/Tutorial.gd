extends Label
var timer = 0
var onetime = 0
func _process(delta: float) -> void:
	timer += delta
	if timer >= 6 and onetime == 0:
		onetime = 1		queue_free()
