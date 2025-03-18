extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func recieveItem(item):
	for loop in 12:
		if item != get_child(loop+1).currentItem:
			get_child(loop+1).addItem(item)
			break;
		
