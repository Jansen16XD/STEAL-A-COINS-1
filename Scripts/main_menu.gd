extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_comenzar_pressed():
	get_tree().change_scene_to_file("res://Scenes/mundo.tscn")


func _on_opciones_pressed():
	print("opciones pressed")


func _on_salir_pressed():
	get_tree().quit()
