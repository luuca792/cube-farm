extends Node

signal crop_planted(map_pos: Vector2i, seed_type: String)

const ITEM_TO_CROP_MAP = {
	"wheat_seed": "wheat",
	"carrot_seed": "carrot"
}

var region_tile_registry := RegionTileRegistry.new()

## Check clicked tile and emit corresponding signal
func apply_tile_logic(map_pos: Vector2i, atlas_coords: Vector2i, source_id: int) -> void:
	if (source_id == TilesDictionary.SOIL_TILE_SOURCE_ID):
		_handle_soil_logic(map_pos, atlas_coords)
	pass

func _handle_soil_logic(map_pos: Vector2i, atlas_coords: Vector2i) -> void:
	if (region_tile_registry.get_variants("soil").has(atlas_coords)):
		# check selected item to plant correct crop
		var selected_item := InventoryManager.get_selected_item()
		if (selected_item == null):
			return
		if ItemRegistry.CROPS.has(selected_item.id):
			crop_planted.emit(map_pos, ITEM_TO_CROP_MAP.get(selected_item.item_name))
			InventoryManager.use_selected_item(1)
