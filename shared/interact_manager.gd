extends Node2D
class_name InteractManager

var is_dragging_item : bool

func _ready() -> void:
	UIEventBus.item_pressed.connect(_on_item_pressed)
	
func _on_item_pressed(_slot: InventorySlot) -> void:
	is_dragging_item = true

func _input(event: InputEvent) -> void:
	if not is_dragging_item and event.is_action_pressed("interact"):
		var world_pos = get_global_mouse_position()
		UIEventBus.tile_pressed.emit(world_pos)
	if event.is_action_released("interact"):
		if is_dragging_item:
			is_dragging_item = false
			UIEventBus.item_released.emit()
	if event is InputEventMouseMotion and is_dragging_item:
		UIEventBus.tile_painted_with_item.emit(get_global_mouse_position())
