extends Area2D

var velocity: = Vector2.ZERO
onready var screen_size: = get_viewport_rect().size

func _ready() -> void:
	velocity.y = 1

func _physics_process(delta: float) -> void:
	position += move(delta)

func move(delta: float) -> Vector2:
	var speed: = 250
	
	if position.y <= 80:
		velocity.y = 1
	elif position.y >= screen_size.y - 80:
		velocity.y = -1
	
	return velocity * speed * delta
