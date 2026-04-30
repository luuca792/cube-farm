extends Node

var growing_crops: Array
var grown_crops: Array

func _ready() -> void:
	growing_crops = TileLoader.load_grid(0, Vector2i(0,0), Vector2i(6,11))["tiles"]
	grown_crops = TileLoader.load_grid(0, Vector2i(7,0), Vector2i(7,11))["tiles"]
	
func is_growing_crop(source_id: int, atlas_coords: Vector2i) -> bool:
	if (source_id != 0):
		return false
	if not (growing_crops.has(atlas_coords)):
		return false
	return true

func is_grown_crop(source_id: int, atlas_coords: Vector2i) -> bool:
	if (source_id != 0):
		return false
	if not (grown_crops.has(atlas_coords)):
		return false
	return true
