extends MarginContainer

@onready var item_texture: TextureRect = $Control/MarginContainer/TextureRect
@onready var item_label: Label = $Control/Label

var inventory_slot : InventorySlot

func setup(slot: InventorySlot) -> void:
	item_texture.texture = slot.item.icon
	item_label.text = str(slot.quantity)
	inventory_slot = slot

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if get_global_rect().has_point(event.position):
			UIEventBus.item_pressed.emit(inventory_slot)
