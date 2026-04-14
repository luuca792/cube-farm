extends Node

@onready var farm_map_fg: TileMapLayer = $FarmMapFG

func _ready() -> void:
	FarmManager.initialize(farm_map_fg)  # inject it here
	var wheat_seed = ItemRegistry.get_item(0)
	InventoryManager.add_item(wheat_seed, 3)
