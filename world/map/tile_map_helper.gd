extends Node
class_name TileMapHelper

static var tile_map : TileMapLayer

func _init(p_tile_map: TileMapLayer) -> void:
	tile_map = p_tile_map

static func set_tile(map_pos: Vector2i, new_atlas_coords: Vector2i, source_id: int = 0) -> void:
	tile_map.set_cell(map_pos, source_id, new_atlas_coords)
