extends TileMapLayer
class_name FarmMapFG

@onready var farm_map_crops: TileMapLayer = $"../FarmMapCrops"
var tile_map_helper: TileMapHelper

signal crop_planted(map_pos: Vector2i, seed_type: String)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		_handle_tile_click(get_global_mouse_position())
		
func _handle_tile_click(global_pos: Vector2) -> void:
	var map_pos: Vector2i = local_to_map(to_local(global_pos))
	var source_id: int = get_cell_source_id(map_pos)
	var atlas_coords: Vector2i = get_cell_atlas_coords(map_pos)
	_apply_tile_logic(map_pos, atlas_coords, source_id)

func _apply_tile_logic(map_pos: Vector2i, atlas_coords: Vector2i, source_id: int) -> void:
	if (source_id == TilesDictionary.SOIL_TILE_SOURCE_ID):
		if (TilesDictionary.DIRT_TILES.has(atlas_coords)):
			_on_click_dirt(map_pos)

func _on_click_dirt(map_pos: Vector2i) -> void:
	crop_planted.emit(map_pos, "wheat")
	#_plant_seed(map_pos, "wheat")

func _plant_seed(map_pos: Vector2i, seed_type: String) -> void:
	if (seed_type == "wheat"):
		FarmManager.plant_crop("wheat", map_pos)
