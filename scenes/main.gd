extends Node

@onready var farm_map_fg: TileMapLayer = $FarmMapFG

func _ready() -> void:
	# Give player some items from the start to test, not real logic in game
	InventoryManager.add_item(ItemRegistry.get_item(ItemNameConst.WHEAT_SEED), 10)
	InventoryManager.add_item(ItemRegistry.get_item(ItemNameConst.CARROT_SEED), 10)
	InventoryManager.add_item(ItemRegistry.get_item(ItemNameConst.WATER_CAN), 1)
