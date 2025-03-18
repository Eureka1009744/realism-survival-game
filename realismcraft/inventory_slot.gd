extends Area2D

@onready var itemSprite = $CurrentItem
@onready var itemName = $Name
@onready var itemAmount = $Amount
var mouseIn
var currentItem
var currentItemCount

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	mouseIn = true


func _on_mouse_exited():
	mouseIn = false
	
func addItem(itemToAdd):
	if itemToAdd == currentItem:
		currentItemCount += 1
		$Amount.text = str(currentItemCount)
	elif currentItem == null:
		itemSprite.texture = load(str("res://Sprites/Items/",itemToAdd,".png"))
		currentItemCount = 1
		currentItem = itemToAdd
		$Amount.text = str(currentItemCount)
		$Name.text = currentItem
