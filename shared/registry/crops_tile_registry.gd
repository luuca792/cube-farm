class_name CropsTileRegistry

const SPRING_CROP_TILE_SOURCE_ID = 0

var tiles: Dictionary = {}
var _tile_loader := TileLoader.new()

func _init() -> void:
	_load_crop_tiles()
	
func _load_crop_tiles() -> void:
	tiles["carrot"] = _tile_loader.load_strip(TilesDictionary.SPRING_CROP_TILE_SOURCE_ID, 9, 6)
	tiles["wheat"] = _tile_loader.load_strip(TilesDictionary.SPRING_CROP_TILE_SOURCE_ID, 19, 6)
	tiles["broccoli"] = _tile_loader.load_strip(TilesDictionary.SPRING_CROP_TILE_SOURCE_ID, 21, 5)

func get_source_id(tileset_name: String) -> int:
	return tiles[tileset_name]["source_id"]

func get_atlas_coord(tileset_name: String, stage: int) -> Vector2i:
	return tiles[tileset_name]["tiles"][stage]
	
func get_max_stage(tileset_name: String) -> int:
	return tiles[tileset_name]["max_stage"]

func get_cultivation_time(tileset_name: String) -> int:
	return tiles[tileset_name]["cultivation_time"]
