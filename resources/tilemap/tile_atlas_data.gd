extends Node
class_name TileAtlasData

var source_id: int
var atlas_coords: Vector2i

func _init(p_source_id: int, p_atlas_coords: Vector2i):
	source_id = p_source_id
	atlas_coords = p_atlas_coords

func to_dict() -> Dictionary:
	return {
		"source_id": source_id,
		"atlas_x": atlas_coords.x,
		"atlas_y": atlas_coords.y
	}
