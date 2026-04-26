extends Node
class_name TileGroupCalculator

func build_tile_group(tile_map_data: TileMapData) -> TileMapData:
	var result := tile_map_data
	for tile in result.tiles:
		
		if tile.get_layers() == null or tile.get_layers().size() == 0:
			push_error("Tile has no layers, can not detect tile group")
			continue
		
		if tile.get_layer(MapLayerConstant.CROP) != null:
			var tile_data := tile.get_layer(MapLayerConstant.CROP).tile
			if CropsTileManager.is_grown_crop(tile_data.source_id, Vector2i(tile_data.atlas_x, tile_data.atlas_y)):
				tile.group = TileGroupConstant.GROWN_CROP
			if CropsTileManager.is_growing_crop(tile_data.source_id, Vector2i(tile_data.atlas_x, tile_data.atlas_y)):
				tile.group = TileGroupConstant.GROWING_CROP
		
		if tile.get_layer(MapLayerConstant.STATE) != null and StringUtils.isBlank(tile.group):
			tile.group = TileGroupConstant.WATERED_SOIL
		
		if tile.get_layer(MapLayerConstant.FOREGROUND) != null and StringUtils.isBlank(tile.group):
			if ForegroundTileManager.is_soil():
				tile.group = TileGroupConstant.SOIL
		
		if tile.get_layer(MapLayerConstant.BACKGROUND) != null and StringUtils.isBlank(tile.group):
			tile.group = TileGroupConstant.ENVIRONMENT
	return result
