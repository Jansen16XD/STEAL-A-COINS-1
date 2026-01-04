extends CanvasLayer

func _process(_delta):
	$Label.text = str(GameData.monedas) + "/" + str(GameData.monedas_totales)
