extends Area2D
var mouseInObject = false
@onready var player = $"../Player"
func _physics_process(delta):
	if mouseInObject == true:
		var disToPlayer = self.global_position.distance_to(player.global_position)
		if disToPlayer < 120:
			$PlayerSprite.material.set_shader_parameter("line_thickness",1)
		if Input.is_action_just_pressed("Right Mouse"):
			if disToPlayer < 120:
				print_debug("Stone Collected!")
				self.queue_free()
	else:
		$PlayerSprite.material.set_shader_parameter("line_thickness",0)

func _on_mouse_entered():
	mouseInObject = true

func _on_mouse_exited():
	mouseInObject = false
