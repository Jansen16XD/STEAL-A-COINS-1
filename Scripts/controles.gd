extends  Control

@onready var tecla_audio: AudioStreamPlayer = $Audio

# Called when the node enters the scene tree for the first time.



func _on_button_pressed() -> void:
	tecla_audio.play()
	get_tree().change_scene_to_file("res://Scenes/Detalles.tscn")
