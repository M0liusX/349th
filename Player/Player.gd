extends Node2D

onready var PlayerBody: KinematicBody2D = $Player_Body
onready var PlayerSprite: Sprite = $Player_Body/Player_Sprite
onready var PlayerAnimatior: AnimationPlayer = $Player_Body/Player_Sprite/Player_Animator
onready var FallTimer: Timer = $Fall_Timer
onready var UP: Vector2 = Vector2(0, -1)
onready var DOWN: Vector2 = Vector2(0, 1)
onready var FLY: Vector2 = UP * 100.0
onready var GRAVITY: Vector2 = DOWN * 10.0
onready var DEATH_FALL: Vector2 = GRAVITY * 10.0
onready var fall: bool = false
onready var dead: bool = false
var vel = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Globals.pPos = PlayerBody.get_position().y
	vel += GRAVITY * 20 * delta
	if Input.is_action_just_pressed("ui_select") and not dead:
		vel = FLY
	PlayerBody.move_and_collide(vel * delta)

func _on_Fall_Timer_timeout():
	fall = true

func _on_Area2D_area_entered(area):
	dead = true
