extends RigidBody2D

@onready var playerNodeName = self.get_name()
var movementSpeed = 4500.0

signal playerDied

func _ready():
	# Coloring the player correctly
	if playerNodeName == "Player1":
		modulate = Global.p1Color
		global_position = Global.p1StartingPosition
	elif playerNodeName == "Player2":
		modulate = Global.p2Color
		global_position = Global.p2StartingPosition
	else:
		print("ERROR - PLAYER NODE NOT NAMED CORRECTLY FOR COLORING")

func _integrate_forces(state):
	movement(state)

func movement(state):
	# P1 Movement
	if playerNodeName == "Player1":
		# Moving player 1
		var xMov = Input.get_action_strength("p1_right") - Input.get_action_strength("p1_left")
		var yMov = Input.get_action_strength("p1_down") - Input.get_action_strength("p1_up")
		var mov = Vector2(xMov, yMov).normalized() * movementSpeed
		state.apply_force(mov)
	# P2 Movement
	elif playerNodeName == "Player2":
		# Moving player 2
		var xMov = Input.get_action_strength("p2_right") - Input.get_action_strength("p2_left")
		var yMov = Input.get_action_strength("p2_down") - Input.get_action_strength("p2_up")
		var mov = Vector2(xMov, yMov).normalized() * movementSpeed
		state.apply_force(mov)
	else:
		print("ERROR - PLAYER NODE NOT NAMED CORRECTLY FOR DETECTING MOVEMENT")

func _on_area_2d_body_entered(body):
	# Detecting P1 Death
	if playerNodeName == "Player1":
		if body.modulate == Global.p2Color:
			emit_signal("playerDied")
	# Detecting P2 Death
	elif playerNodeName == "Player2":
		if body.modulate == Global.p1Color:
			emit_signal("playerDied")
	else:
		print("ERROR - PLAYER NODE NOT NAMED CORRECTLY FOR DETECTING DEATH")
