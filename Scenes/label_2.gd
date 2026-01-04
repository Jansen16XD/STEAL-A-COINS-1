extends Label

@export var speed := 0.02  # tiempo entre letras

func _ready():
	visible_characters = 0
	var total := text.length()

	for i in total:
		await get_tree().create_timer(speed).timeout
		visible_characters += 1
