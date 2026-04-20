extends Panel

@onready var label: Label = $Label

func _process(delta: float) -> void:
	_refresh()

func _refresh() -> void:
	var item := InventoryManager.get_selected_item()
	var text = ""
	text += "Slot: %d\n" % InventoryManager.get_selected_index()
	text += "Item: %s\n" % item.item_name if item != null else ""
	label.text = text
