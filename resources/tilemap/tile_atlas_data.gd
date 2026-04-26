extends Node
class_name TileAtlasData

var source_id: int
var atlas_x: int
var atlas_y: int

func to_dict() -> Dictionary:
	return {
		"source_id": source_id,
		"atlas_x": atlas_x,
		"atlas_y": atlas_y
	}
