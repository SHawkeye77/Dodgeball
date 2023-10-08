extends Node2D

@onready var spawnBallsTimer = get_node("%SpawnBallsTimer")
@onready var ballScene = preload("res://ball.tscn")
const ballsSpawnFrequency = 5.0
const p1BallSpawnLocation = Vector2(364,324)
const p2BallSpawnLocation = Vector2(788,324)


# Called when the node enters the scene tree for the first time.
func _ready():
	spawnBallsTimer.wait_time = ballsSpawnFrequency
	spawnBallsTimer.start()

func _on_spawn_balls_timer_timeout():
	# Spawning Player 1's new ball
	var p1NewBall = ballScene.instantiate()
	p1NewBall.position = p1BallSpawnLocation
	p1NewBall.modulate = Global.p1Color
	add_child(p1NewBall)
	# Spawning Player 2's new ball
	var p2NewBall = ballScene.instantiate()
	p2NewBall.position = p2BallSpawnLocation
	p2NewBall.modulate = Global.p2Color
	add_child(p2NewBall)

func resetTimer():
	spawnBallsTimer.start()
