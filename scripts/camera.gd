extends Camera2D

@onready var player = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var k = 700.0 / clamp(abs(player.velocity.x), 700, 1200)
	zoom = lerp(zoom, Vector2.ONE * k, 0.05)
	pass
