extends CharacterBody2D

var inventoryOpen = false
const speed = 300.0
@onready var playerSprite = $AnimatedSprite2D
@onready var inventory = $Inventory

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("A", "D", "W", "S")
	if direction:
		velocity = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	if direction[0] > 0:
		playerSprite.play("Right")
	elif direction[0] < 0:
		playerSprite.play("Left")
	elif direction[1] == 1:
		playerSprite.play("Down")
	elif direction[1] == -1:
		playerSprite.play("Up")
	else:
		playerSprite.play("Idle")
	if Input.is_action_just_pressed("E"):
		if inventoryOpen == true:
			inventory.visible = false
			inventoryOpen = false
		elif inventoryOpen == false:
			inventory.visible = true
			inventoryOpen = true
	move_and_slide()
