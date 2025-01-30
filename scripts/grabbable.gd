class_name Grabbable

extends Node

var is_grabbed = false
var _grab_offset = Vector2(0,0)

func grab(mouse_position: Vector2, position: Vector2) -> void:
	is_grabbed = true
	_grab_offset = mouse_position - position

func release() -> void:
	is_grabbed = false

func get_offset_position(mouse_position : Vector2) -> Vector2:
	return mouse_position - _grab_offset
