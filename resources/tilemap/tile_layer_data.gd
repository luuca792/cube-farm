extends Resource
class_name TileLayerData

var layer_name: String
var tile: TileAtlasData

func to_dict() -> Dictionary:
	return {
		"layer_name": layer_name,
		"tile": tile.to_dict(),
	}
