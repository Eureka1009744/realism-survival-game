extends Area2D
var object = "stone"
var mouseInObject = false
@onready var player = $"../Player"
func _physics_process(delta):
	if mouseInObject == true:
		var disToPlayer = self.global_position.distance_to(player.global_position)
		if disToPlayer < 120:
			pass
		if Input.is_action_just_pressed("Right Mouse"):
			if disToPlayer < 120:
				player.get_child(3).recieveItem(object)
				self.queue_free()
	else:
		pass

func _on_mouse_entered():
	mouseInObject = true

func _on_mouse_exited():
	mouseInObject = false
