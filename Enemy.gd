extends Sprite

enum Policy {
	NORMAL,
	MEDUSA,
}

export(Policy) var ai = Policy.NORMAL


func _process(delta):
	match ai:
		Policy.NORMAL: do_normal(delta)
		Policy.MEDUSA: do_medusa(delta)
		_: assert(false)
	if get_position().x < -10: free()


func do_normal(delta):
	self.translate(Vector2(-200 * delta, 0))


var a = 0
var y = 0
func do_medusa(delta):
	a += delta * 5
	var dy = sin(a) * 20 - y
	y += dy
	self.translate(Vector2(-200 * delta, dy))
