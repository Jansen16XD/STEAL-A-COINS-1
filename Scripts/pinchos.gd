extends Node2D

var puede_sonar = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "jugador" and puede_sonar:
		$AudioStreamPlayer.play()
		puede_sonar = false
		if body.has_method("recibir_daño"):
			body.recibir_daño(5)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "jugador":
		puede_sonar = true
