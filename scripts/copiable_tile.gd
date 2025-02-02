extends Node2D

# TODO: Get global constant instead
const TILE_SIZE = 16

@onready var hoverable: Hoverable = $Hoverable
@onready var highlightable: Highlightable = $Offset/Highlightable
@onready var offset: Node2D = $Offset

func _physics_process(delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	var mouse_pressed = Input.is_action_pressed("mouse_button_left")
	highlightable.set_highlight(hoverable.is_hovered(mouse_position, position, offset.position) and !mouse_pressed)
