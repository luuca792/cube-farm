class_name RegionTileRegistry

var tiles: Dictionary = {}
var _tile_loader := TileLoader.new()

func _init() -> void:
	_load_region_tiles()
	
func _load_region_tiles():
	tiles["soil"] = _tile_loader.load_grid(TilesDictionary.SOIL_TILE_SOURCE_ID, Vector2i(8,0), Vector2i(11,3))
	
func get_source_id(tileset_name: String) -> int:
	return tiles[tileset_name]["source_id"]

func get_variants(tileset_name: String) -> Array:
	return tiles[tileset_name]["variants"]
