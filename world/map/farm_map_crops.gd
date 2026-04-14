extends TileMapLayer
@export var farm_map_fg: FarmMapFG

var tile_map_helper: TileMapHelper

func _ready():
	tile_map_helper = TileMapHelper.new(self)
	farm_map_fg.crop_planted.connect(_handle_crop_planted)
	
func _handle_crop_planted(map_pos: Vector2i, seed_type: String) -> void:
	tile_map_helper.set_tile(map_pos, CropsTileRegistry.get_atlas_coord("wheat", 2), TilesDictionary.SPRING_CROP_TILE_SOURCE_ID)
