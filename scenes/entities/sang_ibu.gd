extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# movement speed constant
const SPEED = 200

func _physics_process(delta: float) -> void:
	var input_direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_direction.x < 0:
		animated_sprite.flip_h = true
	elif input_direction.x > 0:
		animated_sprite.flip_h = false
	
	velocity = input_direction * SPEED
	move_and_slide()
	
#	Menentukan animasi berdasarkan arah jalan
	if input_direction == Vector2.LEFT or input_direction == Vector2.RIGHT:
		animated_sprite.play("sang_ibu_walk_sideway")
	elif input_direction == Vector2.UP:
		animated_sprite.play("sang_ibu_walk_up")
	elif (input_direction.x != 1 and input_direction.x != -1) and (input_direction.y < 0 and input_direction.y != -1):
		animated_sprite.play("sang_ibu_walk_up")
	elif input_direction == Vector2.DOWN:
		animated_sprite.play("sang_ibu_walk_down")
	elif (input_direction.x != 1 and input_direction.x != -1) and (input_direction.y > 0 and input_direction.y != 1):
		animated_sprite.play("sang_ibu_walk_down")
	elif input_direction == Vector2.ZERO:
		animated_sprite.play("sang_ibu_idle")
	
