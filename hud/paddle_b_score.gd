extends Label

var score: = 0
func _ready() -> void:
	set_text(str(score))

func _on_Ball_paddle_b_point() -> void:
	score += 1
	set_text(str(score))
