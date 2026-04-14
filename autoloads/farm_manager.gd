extends Node

var tile_map: TileMapLayer 

func initialize(p_tile_map: TileMapLayer) -> void:
	tile_map = p_tile_map

var growing_crops: Dictionary = {}

func plant_crop(tileset_name: String, map_position: Vector2i) -> void:
	_update_tile(tileset_name, map_position, 1)

func _update_tile(tileset_name: String, map_position: Vector2i, stage: int) -> void:
	tile_map.set_cell(map_position, CropsTileRegistry.get_source_id(tileset_name), CropsTileRegistry.get_atlas_coord(tileset_name, stage))
