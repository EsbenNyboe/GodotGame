extends Node2D

# TODO: Get global constant instead
const TILE_SIZE = 16
const INTERACTIVE_TILE = preload("res://scenes/tiles/interactive_tile.tscn")

@onready var hoverable: Hoverable = $Hoverable
@onready var highlightable: Highlightable = $Offset/Highlightable
@onready var offset: Node2D = $Offset

func _physics_process(delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	var mouse_pressed = Input.is_action_pressed("mouse_button_left")
	var is_hovering = hoverable.is_hovered(mouse_position, position, offset.position)
	highlightable.set_highlight(is_hovering and !mouse_pressed)
	
	if Input.is_action_just_pressed("mouse_button_left") and is_hovering:
		var new_instance = INTERACTIVE_TILE.instantiate()
		get_parent().add_child(new_instance)
		new_instance.position = position
		new_instance._try_grab(mouse_position)
