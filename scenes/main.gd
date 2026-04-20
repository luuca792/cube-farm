extends Node

@onready var farm_map_fg: TileMapLayer = $FarmMapFG

func _ready() -> void:
	InventoryManager.add_item(ItemRegistry.get_item(0), 10)
	InventoryManager.add_item(ItemRegistry.get_item(1), 10)
