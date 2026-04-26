extends Panel

@onready var label: Label = $Label

func _process(delta: float) -> void:
	_refresh()

func _refresh() -> void:
	var selected_slot := InventoryManager.selected_slot
	var slots := InventoryManager.slots
	
	var text = ""
	text += "Selected item: "
	text += "%s" % selected_slot.item.item_name if selected_slot != null else ""
	
	text += "\nInventory:"
	for slot in InventoryManager.slots:
		text += "\n- %s" % slot.item.item_name
		text += " : %d" % slot.quantity
	
	label.text = text
