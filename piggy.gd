extends Area2D

@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sprite2D

@export var speed = 70

func _ready():
	collision_layer = 0b0001
	collision_mask = 0b0010
	
	z_index = 1

func _process(delta):
	var input_vector = Input.get_vector("move_left", "move_right", "move_up","move_down")
	position += input_vector * speed * delta
	
	if input_vector: # set sprite direction and play animation
		animation_player.play("run")
		if input_vector.x != 0:
			sprite.scale.x = sign(input_vector.x)
	else:
		animation_player.play("idle")
	



func _on_area_entered(area):
	area.queue_free()
	scale *= 1.1
	speed += 10
