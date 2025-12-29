extends CanvasLayer

func _ready():
	$health_ProgressBar.value = GameData.health

func _process(delta):
	$health_ProgressBar.value = GameData.health
