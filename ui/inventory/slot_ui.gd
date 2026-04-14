# slot_ui.gd
extends Panel

@onready var icon: TextureRect = $MarginContainer/TextureRect
@onready var quantity_label: Label = $Label

@export var slot_index: int = 0

func _ready() -> void:
	InventoryManager.slot_updated.connect(_on_slot_updated)
	InventoryManager.selection_changed.connect(_on_selection_changed)
	refresh()

func _on_slot_updated(index: int) -> void:
	if index == slot_index:
		refresh()

func _on_selection_changed(index: int) -> void:
	if index == slot_index:
		# visual highlight logic here, eg. modulate
		pass

func refresh() -> void:
	var slot = InventoryManager.slots[slot_index]
	if slot.item == null:
		icon.texture = null
		quantity_label.visible = false
	else:
		icon.texture = slot.item.icon
		quantity_label.text = str(slot.quantity)
		quantity_label.visible = true
