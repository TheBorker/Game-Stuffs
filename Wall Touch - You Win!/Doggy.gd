extends Area2D

@export var speed = 64 
##-R player speed 64 pixels cuz each tile is 64x64 this value is able to be changed in inspector
var screen_size ## size of the game window

func _ready():
	screen_size = get_viewport_rect().size
## finds the window size


func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
## straight out of the tut, going to eventually fix it up for grid movement



