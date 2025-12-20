extends Area2D




func _on_body_entered(body: Node2D) -> void:
	if body.name == "jugador":
		get_parent().monedas += 1
		$PickupSound.playing = true
		$AnimatedSprite2D.play("default")
		await get_tree().create_timer(0.1).timeout
		queue_free()
