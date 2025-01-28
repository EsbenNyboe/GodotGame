extends Node

@onready var juicy_sound_player: JuicySoundPlayer = $JuicySoundPlayer

func _on_ready() -> void:
	juicy_sound_player._play()
