extends Node

var player
var item 
var speed = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	player = $CharacterBody2D 
	item = $rb_rpb14_BLUE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
