extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# movement speed constant
const SPEED = 200

func _physics_process(delta: float) -> void:
	var input_direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var face_direction := Input.get_axis("ui_left", "ui_right")
	
	if face_direction < 0:
		animated_sprite.flip_h = true
	elif face_direction > 0:
		animated_sprite.flip_h = false
	
	velocity = input_direction * SPEED
	
	move_and_slide()
