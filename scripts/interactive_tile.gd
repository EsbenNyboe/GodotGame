extends Node2D

@onready var hoverable: Hoverable = $Hoverable
@onready var grabbable: Grabbable = $Grabbable
@onready var highlightable: Highlightable = $Highlightable

func _physics_process(delta: float) -> void:
	_try_release()
	var is_hovered = hoverable.is_hovered(get_global_mouse_position(), position)
	highlightable.set_highlight(is_hovered)
	if !is_hovered and !grabbable.is_grabbed:
		return
	
	var mouse_position = get_global_mouse_position()
	_try_grab(mouse_position)
	
	if grabbable.is_grabbed:
		highlightable.set_highlight(false)
		_try_move(mouse_position)

func _try_grab(mouse_position: Vector2) -> void:
	if Input.is_action_just_pressed("mouse_button_left"):
		grabbable.grab(mouse_position, position)

func _try_release() -> void:
	if Input.is_action_just_released("mouse_button_left"):
		grabbable.release()

func _try_move(mouse_position: Vector2) -> void:
	if Input.is_action_pressed("mouse_button_left"):
		position = grabbable.get_offset_position(mouse_position)
