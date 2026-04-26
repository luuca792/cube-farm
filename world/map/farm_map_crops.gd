extends TileMapLayer
@export var farm_map_fg: FarmMapFG

var tile_map_helper: TileMapHelper

#func _ready():
	#tile_map_helper = TileMapHelper.new(self)
	#TileLogicManager.crop_planted.connect(_handle_crop_planted)
	
#func _handle_crop_planted(map_pos: Vector2i, seed_type: String) -> void:
	#TileMapHelper.set_tile(map_pos, crop_tile_registry.get_atlas_coord(seed_type, 3), TilesDictionary.SPRING_CROP_TILE_SOURCE_ID)
