extends Node

var slots: Array[InventorySlot]
var selected_slot: InventorySlot

func _ready() -> void:
	UIEventBus.item_pressed.connect(_select_item)
	UIEventBus.item_released.connect(_deselect_item)

func _select_item(slot: InventorySlot) -> void:
	selected_slot = slot
	
func _deselect_item() -> void:
	selected_slot = null
	
func get_selected_item() -> InventorySlot:
	return selected_slot

func add_item(item: ItemData, quantity: int) -> void:
	if slots.has(item):
		slots[item].quantity += quantity
	else:
		var new_slot = InventorySlot.new()
		new_slot.item = item
		new_slot.quantity = quantity
		slots.append(new_slot)
		
func get_slot_by_item(item: ItemData) -> InventorySlot:
	for slot in slots:
		slot = slot as InventorySlot
		if slot.item == item:
			return slot
	return null
	
func use_selected_item(quantity: int) -> void:
	if selected_slot.item == null:
		push_error("InventoryManager: selected slot is empty")
		return
	if quantity > selected_slot.quantity:
		push_error("InventoryManager: not enough items in slot")
		return
	selected_slot.quantity -= quantity
	if selected_slot.quantity == 0:
		selected_slot.item = null
