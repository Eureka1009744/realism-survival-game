extends Sprite2D

var ItemOnMouse
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.global_position = get_global_mouse_position()

func itemOnMouse(pickupItem):
	ItemOnMouse = pickupItem
	self.texture = load(str("res://Sprites/Items/",ItemOnMouse,".png"))

func getItemOnMouse():
	return ItemOnMouse

func clearItem():
	ItemOnMouse = null
	self.texture = null
