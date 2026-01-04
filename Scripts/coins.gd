extends Area2D

@export var id_moneda: String = ""  # ← Asignas esto desde el editor

func _ready() -> void:
	if id_moneda in GameData.monedas_recogidas:
		queue_free()  # Ya fue recogida, no mostrar

func _on_body_entered(body: Node2D) -> void:
	if body.name == "jugador" and not (id_moneda in GameData.monedas_recogidas):
		GameData.monedas += 1
		GameData.monedas_recogidas.append(id_moneda)
		$PickupSound.play()
		$AnimatedSprite2D.play("default")
		await get_tree().create_timer(0.1).timeout
		queue_free()

		# ✅ Verificar si se recogieron todas las monedas
		if GameData.monedas == GameData.monedas_totales:
			get_parent().terminar_mision()
