extends Node2D

const SIZE = 10

var is_grabbed = false

func _physics_process(delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	_try_grab(mouse_position)
	_try_release()
	
	if is_grabbed:
		_try_move(mouse_position)

func _try_grab(mouse_position: Vector2) -> void:
	if Input.is_action_just_pressed("mouse_button_left"):
		is_grabbed = _is_within_x_range(mouse_position) and _is_within_y_range(mouse_position)

func _try_release() -> void:
	if Input.is_action_just_released("mouse_button_left"):
		is_grabbed = false

func _try_move(mouse_position: Vector2) -> void:
	if Input.is_action_pressed("mouse_button_left"):
		position = mouse_position

func _is_within_x_range(mouse_position: Vector2) -> bool:
	return mouse_position.x < position.x + SIZE and mouse_position.x > position.x - SIZE

func _is_within_y_range(mouse_position: Vector2) -> bool:
	return mouse_position.y < position.y + SIZE and mouse_position.y > position.y - SIZE
