extends Node

signal slot_updated(index: int)
signal selection_changed(index: int)

const INVENTORY_SIZE = 6

var slots: Array[InventorySlot]
var selected_index: int = 0

func _ready() -> void:
	for i in INVENTORY_SIZE:
		slots.append(InventorySlot.new())

func select_slot(index: int) -> void:
	if index < 0 or index >= INVENTORY_SIZE:
		return
	selected_index = index
	emit_signal("selection_changed", selected_index)

func get_selected_slot() -> InventorySlot:
	return slots[selected_index]

func add_item(item: ItemData, quantity: int) -> void:
	for i in INVENTORY_SIZE:
		if slots[i].item == item:
			slots[i].quantity += quantity
			emit_signal("slot_updated", i)
			return
	for i in INVENTORY_SIZE:
		if slots[i].item == null:
			slots[i].item = item
			slots[i].quantity = quantity
			emit_signal("slot_updated", i)
			return
	push_error("InventoryManager: inventory is full")
	
func delete_item(quantity: int) -> void:
	var slot = get_selected_slot()
	if slot.item == null:
		push_error("InventoryManager: selected slot is empty")
		return
	if quantity > slot.quantity:
		push_error("InventoryManager: not enough items in slot")
		return
	slot.quantity -= quantity
	if slot.quantity == 0:
		slot.item = null
	emit_signal("slot_updated", selected_index)
