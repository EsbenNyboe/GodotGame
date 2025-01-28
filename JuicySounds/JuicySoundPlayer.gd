class_name JuicySoundPlayer
extends Node

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@export var audio_config : JuicySoundResource

func _play() -> void:
	audio_stream_player.stream = audio_config.audio_stream
	audio_stream_player.play()
