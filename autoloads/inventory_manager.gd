extends Node

var slots: Array[InventorySlot]
var selected_slot: InventorySlot

#func _ready() -> void:
	## Init inventory slots

func add_item(item: ItemData, quantity: int) -> void:
	if slots.has(item):
		slots[item].quantity += quantity
	else:
		var new_slot = InventorySlot.new()
		new_slot.item = item
		new_slot.quantity = quantity
		slots.append(new_slot)
	
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
	#emit_signal("slot_updated", selected_index)
