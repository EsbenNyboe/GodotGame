extends Node2D

const SIZE = 10

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("mouse_button"):
		_try_move(get_global_mouse_position())

func _try_move(mouse_position: Vector2) -> void:
	var is_within_x_range = false
	if mouse_position.x < position.x + SIZE and mouse_position.x > position.x - SIZE:
		is_within_x_range = true
	var is_within_y_range = false
	if mouse_position.y < position.y + SIZE and mouse_position.y > position.y - SIZE:
		is_within_y_range = true
	
	if is_within_x_range and is_within_y_range:
		position = mouse_position
