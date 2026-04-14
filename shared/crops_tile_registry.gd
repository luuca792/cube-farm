class_name CropsTileRegistry

const TILES: Dictionary = {
  "wheat": {
	  "source_id": 2,
	  "max_stage": 6,
	  "cultivation_time": 12,
	  "stages": {
		  1: Vector2i(0, 19),
		  2: Vector2i(1, 19),
		  3: Vector2i(2, 19),
		  4: Vector2i(3, 19),
		  5: Vector2i(4, 19),
		  6: Vector2i(5, 19),
	  }
  }
}

static func get_source_id(tileset_name: String) -> int:
	return TILES[tileset_name]["source_id"]

static func get_atlas_coord(tileset_name: String, stage: int) -> Vector2i:
	return TILES[tileset_name]["stages"][stage]
	
static func get_max_stage(tileset_name: String) -> int:
	return TILES[tileset_name]["max_stage"]

static func get_cultivation_time(tileset_name: String) -> int:
	return TILES[tileset_name]["cultivation_time"]
