extends Node2D
class_name InteractManager

@onready var farm_map_bg: TileMapLayer = $"../FarmMapBG"
@onready var farm_map_fg: TileMapLayer = $"../FarmMapFG"
@onready var farm_map_state: TileMapLayer = $"../FarmMapState"
@onready var farm_map_crops: TileMapLayer = $"../FarmMapCrops"

var tile_group_calculator := TileGroupCalculator.new()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		var world_pos = get_global_mouse_position()
		var map_pos := Vector2i(floor(world_pos.x / SettingConstant.TILE_SIZE), floor(world_pos.y / SettingConstant.TILE_SIZE))
		UIEventBus.tile_pressed.emit(map_pos)
		
		# Test look up group name
		print("map_pos: ", map_pos)
		print("group: ", TileMapManager.get_tile_group(map_pos))
