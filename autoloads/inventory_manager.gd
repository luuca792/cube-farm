extends Node

var slots: Array[InventorySlot]
var selected_index: int = 0

func _ready() -> void:
	EventBus.inventory_slot_clicked.connect(_set_select_slot)
	# Init inventory slots
	for i in Setting.INVENTORY_SIZE:
		slots.append(InventorySlot.new())

func _set_select_slot(index: int) -> void:
	if index < 0 or index >= Setting.INVENTORY_SIZE:
		return
	selected_index = index

func get_selected_slot() -> InventorySlot:
	return slots[selected_index]
	
func get_selected_index() -> int:
	return selected_index

func get_selected_item() -> ItemData:
	return slots[selected_index].item
	
func get_selected_item_quantity() -> int:
	return slots[selected_index].quantity

func add_item(item: ItemData, quantity: int) -> void:
	for i in Setting.INVENTORY_SIZE:
		if slots[i].item == item:
			slots[i].quantity += quantity
			#emit_signal("slot_updated", i)
			return
	for i in Setting.INVENTORY_SIZE:
		if slots[i].item == null:
			slots[i].item = item
			slots[i].quantity = quantity
			#emit_signal("slot_updated", i)
			return
	push_error("InventoryManager: inventory is full")
	
## Not used yet
	
func use_selected_item(quantity: int) -> void:
	var slot := get_selected_slot()
	if slot.item == null:
		push_error("InventoryManager: selected slot is empty")
		return
	if quantity > slot.quantity:
		push_error("InventoryManager: not enough items in slot")
		return
	slot.quantity -= quantity
	if slot.quantity == 0:
		slot.item = null
	#emit_signal("slot_updated", selected_index)
