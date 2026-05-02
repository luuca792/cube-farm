extends Node
class_name ItemOnTileDefinition

const ITEM_ON_TILE : Dictionary = {
	ItemNameConst.WATER_CAN : [
		{
			"layer_name" : MapLayerConst.STATE,
			"tile_name" : TileNameConst.WATER,
			"new_group_name" : TileGroupConst.WATERED_SOIL
		}
	],
	ItemNameConst.CARROT_SEED : [
		{
			"layer_name" : MapLayerConst.CROP,
			"tile_name" : TileNameConst.CARROT_SEED,
			"new_group_name" : TileGroupConst.GROWING_CROP
		}
	],
	ItemNameConst.WHEAT_SEED : [
		{
			"layer_name" : MapLayerConst.CROP,
			"tile_name" : TileNameConst.WHEAT_SEED,
			"new_group_name" : TileGroupConst.GROWING_CROP
		}
	]
}
