extends Node2D

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().paused = not get_tree().paused
		$VBoxContainer.visible = not $VBoxContainer.visible
		$ColorRect.visible = not $ColorRect.visible

func _on_button_2_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/mundo.tscn")
