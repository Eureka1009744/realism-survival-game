extends Control

var heldItems = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func countItems():
	for loop in 12:
		var item = get_child(loop+1).checkItem()[0]
		var count = get_child(loop+1).checkItem()[1]
		heldItems[item] = count
	print_debug(heldItems)
func recieveItem(item):
	for loop in 12:
		if get_child(loop+1).addItem(item):
			break;
		
