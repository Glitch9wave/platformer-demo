extends CharacterBody2D

func acceleration():
	var effective_velocity = 700
	var k = abs(velocity.x)/effective_velocity
	
	var max_acceleration:float = 500
	var min_acceleration:float = 5
	var r = min_acceleration / max_acceleration
	
	var result
	
	if k >= 1:
		result = min_acceleration
	else:
		result = max_acceleration * ((0.5 - r) * cos(k * PI) + 0.5 + r)
	
	return result

var jump_speed = -1300
var gravity = 70

var max_jump_buffer = 0.1
var jump_buffer = 0.1

func _ready():
	pass
	

func _input(event):
	if event.is_action_pressed("ui_accept") and jump_buffer >= 0:
		velocity.y = jump_speed

func _physics_process(delta):
	if is_on_floor():
		jump_buffer = max_jump_buffer
	else:
		jump_buffer -= delta
	
	var offset = 0
	var right = Input.is_action_pressed("ui_right") or Input.is_action_pressed("keycode_D")
	var left = Input.is_action_pressed("ui_left") or Input.is_action_pressed("keycode_A")
	
	if right != left:
		if abs(velocity.x) < 100:
			velocity.x = 0
		else:
			velocity.x -= 100 * sign(velocity.x);
	else:
		if right:
			offset += 1;
		if left: 
			offset += -1;
		velocity += offset * acceleration() * Vector2.RIGHT
	
	if velocity.y < 0:
		velocity += gravity * Vector2.DOWN
	elif not is_on_floor():
		velocity += gravity * Vector2.DOWN * 2
	
	if velocity.y > 2000:
		velocity.y = 2000
	
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
