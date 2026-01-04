extends Label

@export var speed := 0.05
@export var pitch_variation := 0.05

@onready var click := $AudioStreamPlayer

func type_text() -> void:
	visible_characters = 0
	var total := text.length()

	for i in total:
		await get_tree().create_timer(speed).timeout
		visible_characters += 1

		if click and text[i] != " ":
			click.pitch_scale = randf_range(1.0 - pitch_variation, 1.0 + pitch_variation)
			click.play()
