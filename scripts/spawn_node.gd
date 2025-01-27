extends Node2D

var mynode = preload("res://scenes/spawnable.tscn")

const RANDOM_RANGE = 5

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("mouse_button"):
		inst(get_global_mouse_position())

func inst(pos):
	var instance = mynode.instantiate()
	#pos.x += randf() * RANDOM_RANGE - RANDOM_RANGE * 0.5
	instance.position = pos
	add_child(instance)
