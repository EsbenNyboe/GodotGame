extends Node2D

const TILE_SIZE = 16

@onready var hoverable: Hoverable = $Hoverable
@onready var grabbable: Grabbable = $Grabbable
@onready var highlightable: Highlightable = $Offset/Highlightable
@onready var offset: Node2D = $Offset

func _physics_process(delta: float) -> void:
	_try_release()
	var is_hovered = hoverable.is_hovered(get_global_mouse_position(), position, offset.position)
	if _try_delete(is_hovered):
		return
	
	var is_mouse_pressing = Input.is_action_pressed("mouse_button_left")

	highlightable.set_highlight(is_hovered and !is_mouse_pressing)
	if !is_hovered and !grabbable.is_grabbed:
		return
	
	var mouse_position = get_global_mouse_position()
	_try_grab(mouse_position)
	
	if grabbable.is_grabbed:
		_try_move(mouse_position)

func _try_grab(mouse_position: Vector2) -> void:
	if Input.is_action_just_pressed("mouse_button_left"):
		grabbable.grab(mouse_position, position)

func _try_release() -> void:
	if Input.is_action_just_released("mouse_button_left"):
		grabbable.release()

func _try_move(mouse_position: Vector2) -> void:
	if Input.is_action_pressed("mouse_button_left"):
		var raw_position = grabbable.get_offset_position(mouse_position)
		position = raw_position.snapped(Vector2.ONE * TILE_SIZE)

func _try_delete(is_hovered: bool) -> bool:
	if is_hovered and Input.is_action_just_pressed("delete"):
		queue_free()
		return true
	return false
