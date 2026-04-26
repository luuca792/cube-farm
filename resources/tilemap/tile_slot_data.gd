extends Resource
class_name TileSlotData

var group: String
var layers: Array[TileLayerData]
var coords: Vector2i

func to_dict() -> Dictionary:
	return {
		"group": group,
		"coords": {
			"x": coords.x,
			"y": coords.y
		},
		"layers": get_layers()
	}
	
func get_layers() -> Array:
	var result := []
	for layer in layers:
		result.append(layer.to_dict())
	return result
	
func get_layer(layer_name: String) -> TileLayerData:
	for layer in layers:
		if (layer.layer_name == layer_name):
			return layer
	return null
