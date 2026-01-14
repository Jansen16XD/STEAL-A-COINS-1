extends Node2D
@export var tiempo_inicial: int = 30
@export var escena_final: String = "res://Scenes/misionfallida.tscn"

var tiempo_restante: float

func _ready():
	tiempo_restante = tiempo_inicial
	GameData.monedas = 0
	GameData.monedas_recogidas.clear()
	GameData.monedas_totales = get_tree().get_nodes_in_group("moneda").size()

func _process(delta):
	if tiempo_restante > 0:
		tiempo_restante -= delta
		if tiempo_restante <= 0:
			tiempo_restante = 0
			_cuando_termina_el_tiempo()

	_actualizar_label()
func _actualizar_label():
	var minutos = int(tiempo_restante) / 60
	var segundos = int(tiempo_restante) % 60
	$CanvasLayer/Label.text = "%02d:%02d" % [minutos, segundos]

func terminar_mision():
	await get_tree().create_timer(0.25).timeout  # ⏳ medio segundo de retraso
	get_tree().change_scene_to_file("res://Scenes/mision.tscn")
func _cuando_termina_el_tiempo():
	get_tree().change_scene_to_file(escena_final)
