extends RigidBody2D

const MAX_FORCE_X = 100
const MAX_FORCE_Y = -100

func _ready() -> void:
	var x_impulse = randf() * MAX_FORCE_X - MAX_FORCE_X * 0.5
	var y_impulse = randf() * MAX_FORCE_Y
	apply_impulse(Vector2(x_impulse, y_impulse))
