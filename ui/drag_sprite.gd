extends Sprite2D

func _ready():
	UIEventBus.item_pressed.connect(_on_item_pressed)
	UIEventBus.item_released.connect(_on_item_released)
	visible = false
	z_index = 100

func _on_item_pressed(slot: InventorySlot):
	texture = slot.item.icon
	visible = true

func _on_item_released():
	visible = false

func _process(_delta):
	if visible:
		global_position = get_global_mouse_position()
