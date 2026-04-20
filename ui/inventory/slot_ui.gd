extends Panel
class_name SlotUI

@onready var icon: TextureRect = $MarginContainer/TextureRect
@onready var quantity_label: Label = $Label

@export var slot_index: int = 0

func _process(delta: float) -> void:
	refresh()
	
func _gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		EventBus.inventory_slot_clicked.emit(slot_index)

func _on_slot_updated(index: int) -> void:
	if index == slot_index:
		refresh()

#func _on_selection_changed(index: int) -> void:
	#InventoryManager.select_slot(index)
	#if index == slot_index:
		## visual highlight logic here, eg. modulate
		#pass

func refresh() -> void:
	var slot = InventoryManager.slots[slot_index]
	if slot.item == null:
		icon.texture = null
		quantity_label.visible = false
	else:
		icon.texture = slot.item.icon
		quantity_label.text = str(slot.quantity)
		quantity_label.visible = true
