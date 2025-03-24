extends Area2D

@onready var itemSprite = $CurrentItem
@onready var itemName = $Name
@onready var itemAmount = $Amount
@onready var player = get_parent().get_parent()
var mouseIn
var currentItem
var currentItemCount
var rightClickRecipes = {
	"sharp flint":["stone","flint"]
}
@onready var itemOnMouse = get_parent().get_parent().get_child(4)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("Left Mouse") and mouseIn == true and itemOnMouse.getItemOnMouse() != null:
		var itemToAdd = itemOnMouse.getItemOnMouse()
		if currentItemCount == null:
			currentItemCount = 1
			currentItem = itemToAdd
			update()
			itemOnMouse.clearItem()
		else:
			if currentItem == itemToAdd:
				currentItemCount += 1
				update()
				itemOnMouse.clearItem()
			else:
				pass
	elif Input.is_action_just_pressed("Left Mouse") and mouseIn == true and itemOnMouse.getItemOnMouse() == null and currentItem != null:
		itemOnMouse.itemOnMouse(currentItem)
		currentItemCount -= 1
		update()
	if Input.is_action_just_pressed("Right Mouse") and mouseIn == true:
		for recipe in rightClickRecipes.keys():
			if itemOnMouse.getItemOnMouse() == rightClickRecipes[recipe][0] and currentItem == rightClickRecipes[recipe][1]:
				currentItemCount -= 1
				update()
				get_parent().recieveItem(recipe)

func update():
	if currentItemCount == 0:
		currentItemCount = null
		currentItem = null
		$Amount.text = ""
		$Name.text = ""
		itemSprite.texture = null
	else:
		$Amount.text = str(currentItemCount)
		$Name.text = currentItem
		itemSprite.texture = load(str("res://Sprites/Items/",currentItem,".png"))
func _on_mouse_entered():
	mouseIn = true


func _on_mouse_exited():
	mouseIn = false
	
func addItem(itemToAdd):
	if currentItem == itemToAdd:
		currentItemCount += 1
		$Amount.text = str(currentItemCount)
	elif currentItem == null:
		itemSprite.texture = load(str("res://Sprites/Items/",itemToAdd,".png"))
		currentItemCount = 1
		currentItem = itemToAdd
		$Amount.text = str(currentItemCount)
		$Name.text = currentItem
	else:
		return false
	return true
func checkItem():
	return [currentItem,currentItemCount]
