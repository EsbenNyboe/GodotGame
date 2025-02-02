class_name Highlightable
extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D

func set_highlight(enabled : bool) -> void:
	if enabled:
		sprite_2d.modulate.g = 0
	else:
		sprite_2d.modulate.g = 1
