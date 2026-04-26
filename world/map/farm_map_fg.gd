extends TileMapLayer
class_name FarmMapFG

@onready var farm_map_crops: TileMapLayer = $"../FarmMapCrops"
var tile_map_helper: TileMapHelper
#var region_tile_registry := RegionTileRegistry.new()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		_handle_tile_click(get_global_mouse_position())
		
func _handle_tile_click(global_pos: Vector2) -> void:
	var map_pos: Vector2i = local_to_map(to_local(global_pos))
	var source_id: int = get_cell_source_id(map_pos)
	var atlas_coords: Vector2i = get_cell_atlas_coords(map_pos)
	#TileLogicManager.apply_tile_logic(map_pos, atlas_coords, source_id)
