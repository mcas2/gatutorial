extends CharacterBody2D
@onready var cat_anim = $gato_anim
@export var speed = 400

func _ready():
	pass

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	check_jump(Input.is_key_pressed(KEY_SPACE))
	velocity = input_direction * check_speed(Input.is_key_pressed(KEY_SHIFT))

func _physics_process(delta):
	get_input()
	move_and_slide()

func check_jump(input):
	if input:
		cat_anim.play("jumping")
	else:
		input = Input.get_vector("left", "right", "up", "down")
		check_walk(input)

func check_walk(input):
	if input:
		if (Input.is_key_pressed(KEY_SHIFT)):
			cat_anim.play("running")
		else: 
			cat_anim.play("walking")
		if input == Vector2(-1, 0):
			cat_anim.flip_h = 1
		elif  input == Vector2(1, 0):
			cat_anim.flip_h = 0
	else:
		cat_anim.play("standing")
		# if (randi_range(0,6) == 0):
		# 	cat_anim.play("licking")



			
func check_speed(input):
	if input:
		return 600
	else:
		return 300
