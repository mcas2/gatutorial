extends CharacterBody2D
@onready var cat_anim = $gato_anim
@export var speed = 400

func _ready():
	cat_anim.play("standing")

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	check_walk(input_direction)
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	
func check_walk(input):
	if input:
		cat_anim.play("walking")
	else:
		if (randi_range(0,6) != 0 and $gato_anim.animation_finished):
			cat_anim.play("standing")
		else:
			cat_anim.play("licking")

