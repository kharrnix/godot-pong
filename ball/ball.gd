extends Area2D

signal paddle_a_point
signal paddle_b_point

var velocity: = Vector2.ZERO

onready var screen_size: = get_viewport_rect().size

func _ready() -> void:
	reset_position()

func _physics_process(delta: float) -> void:
	var speed: = 200
	
	if position.y >= screen_size.y:
		velocity.y = -1
	elif position.y <= 0:
		velocity.y = 1
	
	if position.x <= 0:
		emit_signal("paddle_b_point")
		reset_position()
	elif position.x >= screen_size.x:
		emit_signal("paddle_a_point")
		reset_position()
	
	position += velocity * speed * delta

func _on_PaddleA_area_entered(_area: Area2D) -> void:
	velocity = get_new_direction()
	

func _on_PaddleB_area_entered(_area: Area2D) -> void:
	velocity = get_new_direction()

func get_new_direction() -> Vector2:
	if velocity.x == -1:
		velocity.x = 1
	else:
		velocity.x = -1
	
	if velocity.y == 1:
		velocity.y = -1
	else:
		velocity.y = 1
		
	return velocity

func reset_position():
	position.x = 512
	position.y = 300
	
	var random_number: = randi()% 4
	
	match random_number:
		0:
			velocity.x = 1
			velocity.y = 1
		1:
			velocity.x = -1
			velocity.y = -1
		2:
			velocity.x = 1
			velocity.y = -1
		3:
			velocity.x = -1
			velocity.y = 1
