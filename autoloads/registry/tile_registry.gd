extends Node
class_name TileRegistry

#Map <String tile_name, TileAtlasData data>
const NAMED_TILES: Dictionary = {
	TileNameConst.WATER: {"source_id": 1, "atlas_coord": Vector2i(12, 8)},
	TileNameConst.WHEAT_SEED: {"source_id": 0, "atlas_coord": Vector2i(0, 9)},
	TileNameConst.CARROT_SEED: {"source_id": 0, "atlas_coord": Vector2i(0, 4)},
}

static func get_tile(tile_name: String) -> TileAtlasData:
	var raw = NAMED_TILES[tile_name]
	return TileAtlasData.new(raw.source_id, raw.atlas_coord)
