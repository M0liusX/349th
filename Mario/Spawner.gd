extends Node2D

const ORIGIN = 280
const MAX = 130


enum S {
	SINGLE = 1,
	VFORM,
	MEDUSA,
	MVFORM,
	SEEKER,
	SVFORM,
}
var states = [S.SINGLE, S.SINGLE, S.VFORM, S.SINGLE, S.SINGLE, S.VFORM,
			  S.MEDUSA, S.MEDUSA, S.MVFORM, S.MEDUSA, S.MEDUSA, S.SINGLE,
			  S.SEEKER, S.SEEKER, S.SVFORM, S.SEEKER, S.SEEKER, S.SVFORM]
var i = 0


onready var T = $Timer
onready var Score = $Score
const ENEMY_SCENE = preload("res://Enemy.tscn")
var score = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_Timer_timeout():
	score += 1
	Score.set_text("Score \n" + str(score))
	var action = states[i]
	i = (i + 1) % states.size()
	if not action: return
	match action:
		S.SINGLE: do_single()
		S.MEDUSA: do_medusa()
		S.VFORM: do_vform()
		S.MVFORM: do_mvform()
		S.SEEKER: do_seeker()
		S.SVFORM: do_svform()
		_: assert(false)
	pass # Replace with function body.


func do_single():
	var pos = Vector2(ORIGIN, randi() % MAX + 5)
	spawn(pos, 0)
func do_medusa():
	var pos = Vector2(ORIGIN, randi() % MAX + 5)
	spawn(pos, 1)
func do_vform():
	var offset = (randi() % int(MAX / 4)) + MAX / 2
	spawn(Vector2(ORIGIN + 30, offset - 30), 0)
	spawn(Vector2(ORIGIN + 15, offset - 15), 0)
	spawn(Vector2(ORIGIN, offset), 0)
	spawn(Vector2(ORIGIN + 15, offset + 15), 0)
	spawn(Vector2(ORIGIN + 30, offset + 30), 0)
func do_mvform():
	var offset = (randi() % int(MAX / 4)) + MAX / 2
	spawn(Vector2(ORIGIN + 30, offset - 30), 1)
	spawn(Vector2(ORIGIN + 15, offset - 15), 1)
	spawn(Vector2(ORIGIN, offset), 1)
	spawn(Vector2(ORIGIN + 15, offset + 15), 1)
	spawn(Vector2(ORIGIN + 30, offset + 30), 1)
func do_seeker():
	var pos = Vector2(ORIGIN, randi() % MAX + 5)
	spawn(pos, 2)
	pass
func do_svform():
	var offset = (randi() % int(MAX / 4)) + MAX / 2
	spawn(Vector2(ORIGIN + 30, offset - 30), 2)
	spawn(Vector2(ORIGIN + 15, offset - 15), 2)
	spawn(Vector2(ORIGIN, offset), 2)
	spawn(Vector2(ORIGIN + 15, offset + 15), 2)
	spawn(Vector2(ORIGIN + 30, offset + 30), 2)


func spawn(pos, ai):
	var e = ENEMY_SCENE.instance()
	e.set_position(pos)
	e.ai = ai
	add_child(e)
