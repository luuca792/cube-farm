extends Node

var interact_item_from_group : Dictionary

func get_interactable_item(group: String) -> Array[InventorySlot]:
	var item_slot : Array[InventorySlot]
	var items : Array[ItemData] = get_item_can_apply_on_tile_group(group)
	
	for item in items:
		item_slot.append(InventoryManager.get_slot_by_item(item))
	return item_slot
	
func get_item_can_apply_on_tile_group(group: String) -> Array[ItemData]:
	match group:
		TileGroupConst.ENVIRONMENT:
			return []
		TileGroupConst.SOIL:
			return TileLogicDefinition.item_on_soil
		TileGroupConst.WATERED_SOIL:
			return TileLogicDefinition.item_on_watered_soil
		TileGroupConst.GROWING_CROP:
			return TileLogicDefinition.item_on_growing_crop
		TileGroupConst.GROWN_CROP:
			return TileLogicDefinition.item_on_grown_crop
	return []
