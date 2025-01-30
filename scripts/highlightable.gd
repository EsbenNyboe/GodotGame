class_name Highlightable
extends Node
@onready var sprite_2d: Sprite2D = $Sprite2D

func _set_highlight(enabled : bool) -> void:
	if enabled:
		sprite_2d.modulate.g = 1
	else:
		sprite_2d.modulate.g = 0
