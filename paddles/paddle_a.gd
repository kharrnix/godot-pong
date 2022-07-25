extends Area2D

onready var screen_size: = get_viewport_rect().size
onready var sprite = $ColorRect

func _physics_process(delta: float) -> void:
	position += move(delta)

func move(delta: float) -> Vector2:
	var velocity: = Vector2.ZERO
	var speed: = 500
	
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1
		if position.y >= screen_size.y - 80:
			velocity.y = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.y = -1
		if position.y <= 80:
			velocity.y = 0
	else:
		velocity.y = 0
	
	return velocity * speed * delta
