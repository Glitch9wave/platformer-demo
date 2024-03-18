extends CharacterBody2D

var acceleration = 100
var max_speed = 500
var jump_speed = -1300
var gravity = 70

var max_jump_buffer = 0.1
var jump_buffer = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _input(event):
	if event.is_action_pressed("ui_accept") and jump_buffer >= 0:
		velocity.y = jump_speed

func _physics_process(delta):
	if is_on_floor():
		jump_buffer = max_jump_buffer
	else:
		jump_buffer -= delta
	
	var offset = 0
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	if not right and not left:
		if abs(velocity.x) < acceleration:
			velocity.x = 0
		else:
			velocity.x -= acceleration * sign(velocity.x);
	else:
		if right:
			offset += 1;
		if left: 
			offset += -1;
		velocity += offset * acceleration * Vector2.RIGHT
		
		if abs(velocity.x) > max_speed:
			velocity.x = max_speed * sign(velocity.x)
	
	
	velocity += gravity * Vector2.DOWN
	
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
