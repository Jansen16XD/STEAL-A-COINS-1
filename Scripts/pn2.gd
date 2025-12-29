extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "jugador":
		get_tree().change_scene_to_file("res://Scenes/nivel_2.tscn")
