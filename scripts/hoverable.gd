class_name Hoverable
extends Node

# TODO: Find a way to check its size
const SIZE = 10

func is_hovered(mouse_position: Vector2, position: Vector2, offset_position: Vector2) -> bool:
	position += offset_position
	return _is_within_x_range(mouse_position, position) and _is_within_y_range(mouse_position, position)
		
func _is_within_x_range(mouse_position: Vector2, position: Vector2) -> bool:
	return mouse_position.x < position.x + SIZE and mouse_position.x > position.x - SIZE

func _is_within_y_range(mouse_position: Vector2, position: Vector2) -> bool:
	return mouse_position.y < position.y + SIZE and mouse_position.y > position.y - SIZE
