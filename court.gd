extends Node2D

@onready var lblPlayer1Score = get_node("%lbl_Player1Score")
@onready var lblPlayer2Score = get_node("%lbl_Player2Score")
@onready var player1 = get_node("%Player1")
@onready var player2 = get_node("%Player2")
@onready var ballSpawner = get_node("%BallSpawner")

func _ready():
	updateGUI()

func updateGUI():
	lblPlayer1Score.text = str(Global.p1Score)
	lblPlayer2Score.text = str(Global.p2Score)

func _on_player_1_player_died():
	dealWithPlayerDeath("Player1")


func _on_player_2_player_died():
	dealWithPlayerDeath("Player2")

func dealWithPlayerDeath(player):
	# Updating the players' scores
	if (player == "Player1"):
		Global.p2Score += 1
	elif (player == "Player2"):
		Global.p1Score += 1
	else:
		print("ERROR - PLAYER NAMED INCORRECTLY")
	# Restarting the scene
	get_tree().reload_current_scene()
