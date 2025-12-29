extends CharacterBody2D

@export var speed = 200
@export var run_speed = 300
@export var jump = -430
@export var max_health = 100

var health
var gravity = 980
var muerto = false

@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	health = GameData.health  
	

func _physics_process(delta):
	if muerto:
		return

	# --- Movimiento (igual que antes) ---
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump

	var direction = Input.get_axis("move_left", "move_right")

	var current_speed = speed
	if Input.is_action_pressed("run") and direction != 0:
		current_speed = run_speed

	if direction < 0:
		animated_sprite_2d.flip_h = true
	elif direction > 0:
		animated_sprite_2d.flip_h = false

	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("Idle")
		else:
			if current_speed == run_speed:
				animated_sprite_2d.play("run")
			else:
				animated_sprite_2d.play("walk")
	else:
		if velocity.y < 0:
			animated_sprite_2d.play("jump")
		else:
			animated_sprite_2d.play("fall")

	if direction:
		velocity.x = direction * current_speed
	else:
		velocity.x = 0   # ← Freno instantáneo, sin deslizamiento

	move_and_slide()


# ===============================
# DAÑO Y MUERTE
# ===============================

func recibir_daño(cantidad: int):
	if muerto:
		return

	health -= cantidad
	GameData.health = health   # ← GUARDA LA VIDA GLOBAL
	print("Vida:", health)

	if health <= 0:
		morir()


func morir():
	muerto = true
	velocity = Vector2.ZERO
	animated_sprite_2d.play("death")

	await get_tree().create_timer(1.0).timeout
	GameData.health = max_health
	get_tree().reload_current_scene()
