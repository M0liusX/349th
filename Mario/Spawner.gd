extends Node2D

const ORIGIN = 280
const MAX = 135


enum State {
	
}
var states = []


onready var T = $Timer
const ENEMY_SCENE = preload("res://Enemy.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_Timer_timeout():
	var e = ENEMY_SCENE.instance()
	e.set_position(Vector2(600, 100))
	add_child(e)
	pass # Replace with function body.
