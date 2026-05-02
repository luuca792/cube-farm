extends Node
class_name TileMapExport

const SCENE_PATH = "res://scenes/main.tscn"
const TILE_MAP_NAME_GROUP: Dictionary = {
	"FarmMapBG": MapLayerConst.BACKGROUND,
	"FarmMapFG": MapLayerConst.FOREGROUND,
	"FarmMapState": MapLayerConst.STATE,
	"FarmMapCrops": MapLayerConst.CROP
}

@onready var farm_map_bg: TileMapLayer = $"../FarmMapBG"
@onready var farm_map_fg: TileMapLayer = $"../FarmMapFG"
@onready var farm_map_state: TileMapLayer = $"../FarmMapState"
@onready var farm_map_crops: TileMapLayer = $"../FarmMapCrops"

var tile_map_data := TileMapData.new()
var tile_group_calculator := TileGroupCalculator.new()
var tile_map_layers : Array[TileMapLayer]

## Enable this function to export tile map next time start up
#func _ready() -> void:
	#_build_map_data_from_scene()
	#tile_map_data = tile_group_calculator.build_tile_group(tile_map_data)
	#_export_to_file()
	
func _build_map_data_from_scene() -> void:
	tile_map_layers.append(farm_map_bg)
	tile_map_layers.append(farm_map_fg)
	tile_map_layers.append(farm_map_state)
	tile_map_layers.append(farm_map_crops)
	
	for layer in tile_map_layers:
		for cell in layer.get_used_cells():
			var slot := tile_map_data.get_slot(cell.x, cell.y)
			if slot == null:
				slot = TileSlotData.new()
				slot.coords.x = cell.x
				slot.coords.y = cell.y
				tile_map_data.tiles.append(slot)
			
			var layer_data := TileLayerData.new()
			layer_data.layer_name = TILE_MAP_NAME_GROUP[layer.name]
			
			var tile_atlas_data := TileAtlasData.new(layer.get_cell_source_id(cell), layer.get_cell_atlas_coords(cell))
			layer_data.tile = tile_atlas_data
			
			slot.layers.append(layer_data)

func _export_to_file() -> void:
	var result := []
	for slot in tile_map_data.tiles:
		result.append(slot.to_dict())
	
	var file := FileAccess.open("res://resources/tilemap/default-tile-map.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(result, "\t"))
	file.close()
